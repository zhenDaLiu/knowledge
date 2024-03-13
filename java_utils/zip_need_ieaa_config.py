import git
import os
import json
import shutil

IEAA_CONFIG_GIT_URL = "http://git.yuntongxun.com/IntelligentEyes/ieaa_config.git"
IEAA_CONFIG_LOCAL_DIR = "ieaa_config"
GLOBAL_CONFIG_FILE_NAME = "global_config.json"
WORK_DIR = "./"


def download_ieaa_config():
    repo = None
    ieaa_dir = os.path.join(WORK_DIR, IEAA_CONFIG_LOCAL_DIR)
    if os.path.exists(ieaa_dir):
        repo = git.Repo(ieaa_dir)
        os.chdir(ieaa_dir)
        repo.git.pull()

    else:
        repo = git.Repo.clone_from(url=IEAA_CONFIG_GIT_URL, to_path=ieaa_dir)
        os.chdir(ieaa_dir)


def model_names_2_key(model_names: list):
    return ",".join(sorted(model_names))


class AlgorithmConfig(object):
    def __init__(self, json_file_path: str):
        self.json_file_path = json_file_path
        self.ini_file_path = json_file_path.replace(".json", ".ini")
        self.algorithm_name = ""
        self.need_model_keys = []
        self.need_model_names = set()
        self.read_algorithm_info()

    def read_algorithm_info(self):
        with open(self.json_file_path, "r", encoding="utf-8") as f:
            tmp_json = json.loads(f.read())
        self.algorithm_name = tmp_json["name"]

        self.ini_file_path = [x for x in tmp_json["algorithm_interface_params"]["config_names"] if
                              not x.endswith(".key")]

        model_configs = tmp_json["algorithm_interface_params"]["model_config"]["configs"]
        self.need_model_keys.clear()
        self.need_model_names.clear()
        for one_model_config in model_configs:
            one_model_names = one_model_config["model_names"]
            self.need_model_keys.append(model_names_2_key(one_model_names))
            for one_model_name in one_model_names:
                if not one_model_name.endswith(".engine"):
                    self.need_model_names.add(one_model_name)


def handle_invalid_input():
    print("非法输入，程序退出")
    exit()


def read_global_config(global_config_path: str):
    global_model_config_dict = {}
    with open(global_config_path, "r", encoding="utf-8") as f:
        global_model_config_json = json.loads(f.read())["model_config"]
        for one_model_config in global_model_config_json:
            global_model_config_dict[model_names_2_key(one_model_config["model_names"])] = one_model_config
    return global_model_config_dict


def zip_need_ieaa_config():
    current_file_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)))
    download_ieaa_config()
    current_dir = os.getcwd()
    # 默认已经cd到ieaa_config目录
    algorithm_dict = {}
    all_files = [x for x in os.listdir(current_dir)]
    all_algorithm_json = []
    for one_file in all_files:
        if one_file.endswith(".json") and one_file != GLOBAL_CONFIG_FILE_NAME:
            all_algorithm_json.append(one_file)

    all_algorithm_json = sorted(all_algorithm_json)
    algorithm_num = len(all_algorithm_json)

    tmp_json = None
    for i in range(algorithm_num):
        one_json_path = os.path.join(current_dir, all_algorithm_json[i])
        algorithm_dict[i] = AlgorithmConfig(one_json_path)
        print("{}. {}".format(i, algorithm_dict[i].algorithm_name))

    print("\n请输入需要的算法编号，以英文逗号 \",\" 分隔")
    print("---选择所有请输入 \"all\" （不用输入双引号）---".format(algorithm_num))
    algorithm_pick_str = input()
    pick_list = []
    if algorithm_pick_str == "all":
        pick_list = list(range(algorithm_num))
    else:
        algorithm_pick_str_split = algorithm_pick_str.split(",")
        if not algorithm_pick_str or len(algorithm_pick_str_split) <= 0:
            handle_invalid_input()
        pick_list = [int(x) for x in algorithm_pick_str_split]
        for one_pick_index in pick_list:
            if one_pick_index < 0 or one_pick_index >= algorithm_num:
                handle_invalid_input()

    print("\n---所选算法如下：")
    for i in pick_list:
        print("【{}.{}】".format(i, algorithm_dict[i].algorithm_name), end="   ")
    print()

    # 取所有模型配置文件名
    global_config_path = os.path.join(os.getcwd(), GLOBAL_CONFIG_FILE_NAME)
    global_model_config_dict = read_global_config(global_config_path)
    all_model_ini_files_set = set()
    for i in pick_list:
        for one_model_key in algorithm_dict[i].need_model_keys:
            all_model_ini_files_set.add(global_model_config_dict[one_model_key]["config_name"])
    all_model_ini_files = list(all_model_ini_files_set)
    print("\n---所选算法需要的模型配置文件如下：")
    print(all_model_ini_files)

    # 取所有模型文件名
    print("\n---需要的模型如下：")
    all_model_file_names_set = set()
    for i in pick_list:
        all_model_file_names_set.update(algorithm_dict[i].need_model_names)
    print(all_model_file_names_set)

    # 打包所有配置文件
    zip_name = input("请输入打包文件名（请做好 机器/版本/时间 命名，以便区分，不用加扩展名）：")

    all_need_config_files_path = [os.path.join(current_dir, GLOBAL_CONFIG_FILE_NAME)]
    for one_model_config_file in all_model_ini_files:
        all_need_config_files_path.append(os.path.join(current_dir, one_model_config_file))

    for i in pick_list:
        all_need_config_files_path.append(algorithm_dict[i].json_file_path)
        all_need_config_files_path += algorithm_dict[i].ini_file_path

    zip_dir = os.path.join(current_file_dir, zip_name)
    if os.path.exists(zip_dir):
        shutil.rmtree(zip_dir)
    os.mkdir(zip_dir)

    for one_config_file_path in all_need_config_files_path:
        shutil.copyfile(one_config_file_path, os.path.join(zip_dir, os.path.basename(one_config_file_path)))
    shutil.make_archive(os.path.join(current_file_dir, zip_name), "zip", root_dir=zip_dir)
    shutil.rmtree(zip_dir)


if __name__ == '__main__':
    zip_need_ieaa_config()
