package com.pop.utils;

import com.itextpdf.awt.geom.Rectangle2D;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.parser.ImageRenderInfo;
import com.itextpdf.text.pdf.parser.PdfReaderContentParser;
import com.itextpdf.text.pdf.parser.RenderListener;
import com.itextpdf.text.pdf.parser.TextRenderInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.*;
import java.util.*;

/**
 * 电子合同.
 *
 * @author sky
 * @date 2019/02/28 下午17:25
 */
@Slf4j
@Component
public class PDFUtil {

    public static final String KEY_WORD_PARTYA = "甲方：";
    public static final String KEY_WORD_PARTYB = "乙方：";
    private static final String PAGE_SIGN = "<!--sign_area_start-->";
    private static final String PAGE_SIGN_HTML = "<div class='pageNext'></div>";
    private static final float LOCATION_Y = 140f;
    private static int i = 0;
    private static final float LOCAION_X_OFFSET = 80;
    private static Map<String, SignLocation> signLocationMap = new HashMap(2);

    private static String filePathTemplate;

    @Value("${app.oss.upload-path}")
    private void setFilePathTemplate(String pathTemplate) {
        filePathTemplate = pathTemplate;
    }

    private static String templateFilePath;

    @Value("${app.oss.template-file-path}")
    private void setImgMarkPath(String templatePath) {
        templateFilePath = templatePath;
    }

    private static final String FILE_CONTRACT_TEMPLEATE_PATH = "template/contract.html";

    private static final String BOOK_CONTRACT_TEMPLEATE_PATH = "template/book_contract.html";

    private static final String FILE_TARGET_NAME = "contract.pdf";
    private static final String FILE_TARGET_PATH = "购销合同.pdf";

    private static final String FONT_SIMSUN_PATH = "template/fonts/simsun.ttc";

    private static final String FILE_TYPE = "PDF";

    private static final int SET_MARKIMG_XCOORD = 0;
    private static final int SET_MARKIMG_YCOORD = 0;
    private static final float FILLOPACITY = 0.2f;

    private static final String EXCEPTION_MSG = "[商家前台][生成电子合同]，发生异常：{}";

    private PDFUtil() {
    }

    /**
     * 新的pdf生成
     */
    public static Map<String, Map<String, SignLocation>> generateContractPdf(Map<String, Object> contractParamMap, String contractNo, String companyName) {

        Map<String, Map<String, SignLocation>> pdfMap = new HashMap<>(1);
        String filePath = null;
        try {
            // 生成合同模板.
            String contractHtmlByTemplate = generateContractHtml(contractParamMap);
            // 生成合同pdf文档.
            filePath = generateContractPdf(contractHtmlByTemplate, contractNo, companyName);
            // 获取签章块Y坐标.
            signLocationMap = getLocationByKeyWords(filePath);
            float y = signLocationMap.get(KEY_WORD_PARTYA).getY();
            log.info("y=" + y + "，page=" + signLocationMap.get(KEY_WORD_PARTYA).getPageIndex());
            if (y < LOCATION_Y) {
                StringBuffer htmlTemplateBufStr = new StringBuffer(contractHtmlByTemplate);
                htmlTemplateBufStr.insert(contractHtmlByTemplate.indexOf(PAGE_SIGN) - 1, PAGE_SIGN_HTML);
                filePath = generateContractPdf(htmlTemplateBufStr.toString(), contractNo, companyName);

                // 重新获取签章坐标，用于电子签章.
                signLocationMap = getLocationByKeyWords(filePath);
            }
        } catch (IOException e) {
            log.info(e.getMessage());
        } catch (DocumentException e) {
            log.info(e.getMessage());
        }

        pdfMap.put(filePath, signLocationMap);

        return pdfMap;

    }

    /**
     * 返回合同富文本.
     */
    public static String generateContractHtml(Map<String, Object> contractParamMap) throws IOException {

        log.info("[商家前台][商家确认合同]，生成合同富文本开始：");

        String contractHtmlByTemplate;
        try (StringWriter stringWriter = new StringWriter()) {
            Properties properties = new Properties();
            properties.setProperty("resource.loader", "class");
            properties.setProperty("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
            VelocityEngine velocityEngine = new VelocityEngine(properties);
            VelocityContext context = PDFUtil.getContractParam(contractParamMap);
            Vendor vendor = (Vendor) contractParamMap.get("vendorInfo");
            log.info("[商家前台][商家确认合同]-商家类型={}", vendor.getVendorType());
            if (vendor.getVendorType().equals(VendorTypeEnum.BOOK_VENDOR)) {
                velocityEngine.mergeTemplate(BOOK_CONTRACT_TEMPLEATE_PATH, "UTF-8", context, stringWriter);
            } else {
                velocityEngine.mergeTemplate(FILE_CONTRACT_TEMPLEATE_PATH, "UTF-8", context, stringWriter);
            }
            contractHtmlByTemplate = stringWriter.toString();
        }
        log.info("[商家前台][商家确认合同]，生成合同富文本结束，富文本生成成功");

        return contractHtmlByTemplate;
    }

    /**
     * 返回合同PDF
     */
    public static String generateContractPdf(String contractHtmlContent, String contractNo, String companyName) throws IOException, DocumentException {
        log.debug("[商家前台][商家确认合同]，生成PDF文档开始");
        File targetPathFile = new File(filePathTemplate);
        if (!targetPathFile.exists()) {
            targetPathFile.mkdirs();
        }

        String targetFilePath = targetPathFile + File.separator + FILE_TARGET_NAME;

        StringBuffer sb = new StringBuffer(targetPathFile + File.separator + FILE_TARGET_PATH);
        sb.insert(sb.indexOf(".pdf"), "_" + companyName + "_" + contractNo);
        String fileTargetPath = sb.toString();

        try (OutputStream fileStream = new FileOutputStream(targetFilePath)) {

            FileUtils.forceMkdir(new File(targetFilePath).getParentFile());

            ITextRenderer textRenderer = new ITextRenderer();
            ITextFontResolver fontResolver = textRenderer.getFontResolver();
            fontResolver.addFont(FONT_SIMSUN_PATH, com.itextpdf.kernel.pdf.PdfName.IdentityH.getValue(), false);

            textRenderer.setDocumentFromString(replaceHtmlContent(contractHtmlContent), null);
            textRenderer.layout();
            // 创建pdf.
            textRenderer.createPDF(fileStream, true);
            // 加水印.
            log.debug("[商家前台][商家确认合同]，生成PDF文档开始,水印图片地址:{}", templateFilePath);
            addPdfMark(targetFilePath, fileTargetPath, templateFilePath);

        }
        log.debug("[商家前台][商家确认合同]，生成PDF文档结束，文件路径：{}", fileTargetPath);
        return fileTargetPath;
    }

    private static void addPdfMark(String inPdfFile, String outPdfFile, String markImagePath) {

        PdfStamper stamp = null;
        try {
            PdfReader reader = new PdfReader(inPdfFile, FILE_TYPE.getBytes());
            int pageSize = reader.getNumberOfPages();
            stamp = new PdfStamper(reader, new FileOutputStream(outPdfFile));
            Image markImg = setMarkImg(markImagePath);
            PdfGState gs = new PdfGState();
            gs.setFillOpacity(FILLOPACITY);
            for (int i = 1; i <= pageSize; i++) {
                PdfContentByte under = stamp.getUnderContent(i);
                // 设置透明度
                under.setGState(gs);
                // 添加水印图片
                under.addImage(markImg);

            }
        } catch (IOException e) {
            log.debug(EXCEPTION_MSG, e.getMessage());
        } catch (DocumentException e) {
            log.debug(EXCEPTION_MSG, e.getMessage());
        } finally {
            try {
                if (stamp != null) {
                    stamp.close();
                }
                File tempfile = new File(inPdfFile);
                tempfile.deleteOnExit();
            } catch (DocumentException e) {
                log.debug(EXCEPTION_MSG, e.getMessage());
            } catch (IOException e) {
                log.debug(EXCEPTION_MSG, e.getMessage());
            }
        }

    }

    private static Image setMarkImg(String markImagePath) {
        Image markImg = null;
        try {
            markImg = Image.getInstance(markImagePath);
            markImg.setAbsolutePosition(SET_MARKIMG_XCOORD, SET_MARKIMG_YCOORD);
        } catch (BadElementException e) {
            log.debug(EXCEPTION_MSG, e.getMessage());
        } catch (IOException e) {
            log.debug(EXCEPTION_MSG, e.getMessage());
        }

        return markImg;
    }

    private static String replaceHtmlContent(String contractHtmlContent) {
        String agreementBody = contractHtmlContent;
        agreementBody = agreementBody.replace("&nbsp;", " ");
        agreementBody = agreementBody.replace("&ndash;", "–");
        agreementBody = agreementBody.replace("&mdash;", "—");
        agreementBody = agreementBody.replace("&lsquo;", "‘");
        agreementBody = agreementBody.replace("&rsquo;", "’");
        agreementBody = agreementBody.replace("&sbquo;", "‚");
        agreementBody = agreementBody.replace("&ldquo;", "“");
        agreementBody = agreementBody.replace("&rdquo;", "”");
        agreementBody = agreementBody.replace("&bdquo;", "„");
        agreementBody = agreementBody.replace("&prime;", "′");
        agreementBody = agreementBody.replace("&Prime;", "″");
        agreementBody = agreementBody.replace("&lsaquo;", "‹");
        agreementBody = agreementBody.replace("&rsaquo;", "›");
        agreementBody = agreementBody.replace("&oline;", "‾");

        return agreementBody;
    }

    /**
     * 合同动态参数.
     */
    private static VelocityContext getContractParam(Map<String, Object> contractParamMap) {

        VelocityContext context = new VelocityContext();
        if (!contractParamMap.isEmpty()) {
            Vendor vendor = (Vendor) contractParamMap.get("vendorInfo");
            VendorContract vendorContract = (VendorContract) contractParamMap.get("vendorContract");
            VendorReturnInfoVo vendorReturnInfo = (VendorReturnInfoVo) contractParamMap.get("vendorReturnInfo");
            // 合同信息参数
            getContractParam(context, vendorContract);
            // 商家退货信息参数
            getVendorReturnInfoParam(context, vendorReturnInfo);
            // 商家信息参数
            getVendorParam(context, vendor);
        }
        return context;
    }

    private static void getContractParam(VelocityContext context, VendorContract vendorContract) {
        if (vendorContract != null) {
            if (1 == vendorContract.getSignator()) {
                context.put("signator", ContractSignatorEnum.KS_NINGBO.getName());
            }

            context.put("contractNo", vendorContract.getContractNo());
            // 签约日期
            if (vendorContract.getSignDate() != null) {
                context.put("signYear", vendorContract.getSignDate().getYear());
                context.put("signMonth", vendorContract.getSignDate().getMonthValue());
                context.put("signDay", vendorContract.getSignDate().getDayOfMonth());
            }
            // 有效期
            if (vendorContract.getStartDate() != null) {
                context.put("startYear", vendorContract.getStartDate().getYear());
                context.put("startMonth", vendorContract.getStartDate().getMonthValue());
                context.put("startDay", vendorContract.getStartDate().getDayOfMonth());
            }
            if (vendorContract.getEndDate() != null) {
                context.put("endYear", vendorContract.getEndDate().getYear());
                context.put("endMonth", vendorContract.getEndDate().getMonthValue());
                context.put("endDay", vendorContract.getEndDate().getDayOfMonth());
            }
        }
    }

    private static void getVendorReturnInfoParam(VelocityContext context, VendorReturnInfoVo vendorReturnInfo) {
        if (vendorReturnInfo != null) {
            // 退货信息
            if (StringUtils.isNotEmpty(vendorReturnInfo.getReturnsAddr())) {
                context.put("returnsAddr", vendorReturnInfo.getReturnsAddr().replaceAll("\\$", ""));
            }
            context.put("returnsContact", vendorReturnInfo.getReturnsContact());
            context.put("contactPhone", vendorReturnInfo.getContactPhone());
        }
    }

    private static void getVendorParam(VelocityContext context, Vendor vendor) {
        if (vendor != null) {
            context.put("companyName", vendor.getCompanyName());
            // 账户信息
            context.put("bankName", vendor.getBankName());
            context.put("bankAccount", vendor.getBankAccount());
            context.put("bank", vendor.getBank());
            // 双方对账联系人
            context.put("ksOverallContactName", vendor.getKsOverallContactName());
            context.put("ksOverallContactEmail", vendor.getKsOverallContactEmail());
            context.put("ksOverallContactPhone", vendor.getKsOverallContactPhone());
            context.put("vendorOverallContactName", vendor.getVendorOverallContactName());
            context.put("vendorOverallContactEmail", vendor.getVendorOverallContactEmail());
            context.put("vendorOverallContactPhone", vendor.getVendorOverallContactPhone());
            // 双方指定的代理人
            context.put("ksOverallContactName", vendor.getKsOverallContactName());
            if (StringUtils.isNotEmpty(vendor.getKsOverallContactAddr())) {
                context.put("ksOverallContactAddr", vendor.getKsOverallContactAddr().replaceAll("\\$", ""));
            }
            context.put("ksOverallContactEmail", vendor.getKsOverallContactEmail());
            context.put("ksOverallContactPhone", vendor.getKsOverallContactPhone());
            context.put("vendorOverallContactName", vendor.getVendorOverallContactName());
            if (StringUtils.isNotEmpty(vendor.getVendorOverallContactAddr())) {
                context.put("vendorOverallContactAddr", vendor.getVendorOverallContactAddr().replaceAll("\\$", ""));
            }
            context.put("vendorOverallContactEmail", vendor.getVendorOverallContactEmail());
            context.put("vendorOverallContactPhone", vendor.getVendorOverallContactPhone());
            // 物流不配送地区.
            context.put("logisticNoDispatchArea", vendor.getLogisticNoDispatchArea());
        }
    }

    /**
     * 获取PDF文档"签章块"坐标.
     *
     * @param filePath
     * @return
     */
    private static Map<String, SignLocation> getLocationByKeyWords(String filePath) {
        try {
            PdfReader pdfReader = new PdfReader(filePath);
            int pageNum = pdfReader.getNumberOfPages();
            PdfReaderContentParser pdfReaderContentParser = new PdfReaderContentParser(
                    pdfReader);
            for (i = 1; i <= pageNum; i++) {
                pdfReaderContentParser.processContent(i, new RenderListener() {
                    @Override
                    public void renderText(TextRenderInfo textRenderInfo) {
                        String text = textRenderInfo.getText();
                        //获取"签章块"开始坐标(决定是否下一页显示).
                        if (null != text && text.contains(KEY_WORD_PARTYA)) {
                            Rectangle2D.Float boundingRectange = textRenderInfo
                                    .getBaseline().getBoundingRectange();
                            signLocationMap.put(KEY_WORD_PARTYA, getSingLocation(boundingRectange));
                        }

                        if (null != text && text.contains(KEY_WORD_PARTYB)) {
                            Rectangle2D.Float boundingRectange = textRenderInfo
                                    .getBaseline().getBoundingRectange();
                            signLocationMap.put(KEY_WORD_PARTYB, getSingLocation(boundingRectange));
                        }
                    }

                    @Override
                    public void renderImage(ImageRenderInfo arg0) {
                        // TODO Auto-generated method stub
                    }

                    @Override
                    public void endTextBlock() {
                        // TODO Auto-generated method stub
                    }

                    @Override
                    public void beginTextBlock() {
                        // TODO Auto-generated method stub
                    }
                });
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            log.info(e.getMessage());
        }
        return signLocationMap;
    }

    public static SignLocation getSingLocation(Rectangle2D.Float boundingRectange) {
        SignLocation signLocation = new SignLocation();
        signLocation.setX(boundingRectange.x + LOCAION_X_OFFSET);
        signLocation.setY(boundingRectange.y);
        signLocation.setPageIndex(i);
        return signLocation;
    }

}