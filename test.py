# coding: utf-8


def is_all_chinese_chars(text):
    if not text:
        return True
    for c in text:
        if not "\u4e00" <= c <= "\u9fa5":
            return False
    return True


def read_data_v2(file_path):
    result = []
    word_buff, label_buff = [], []
    with open(file_path, "r") as fin:
        for line in fin:
            line = line.rstrip()
            # 如果为空字符串，有两种情况：1. token 为空格；2. 样本分隔符（`\n`）
            if not line:
                # 如果为空字符串，判断一下缓存是否为空
                if not word_buff:
                    # 如果缓存为空
                    continue
                else:
                    # 如果缓存不为空，判断一下缓存的最后一个字是否为中文，如果是的话，跳过；如果不是的话，保存缓存
                    if is_all_chinese_chars(word_buff[-1]):
                        continue
                    else:
                        words_string = " ".join(word_buff)
                        labels_string = " ".join(label_buff)
                        result.append([words_string, labels_string])
                        word_buff, label_buff = [], []
            # 如果不是空字符串
            else:
                # 如果不为空
                cols = line.split(" ")
                if len(cols) != 2:
                    continue
                word_buff.append(cols[0])
                label_buff.append(cols[1])
    return result


def read_data(file_path):
    result = []
    words = []
    labels = []
    with open(file_path) as f:
        for line in f:
            contends = line.strip()
            word = line.strip().split(' ')[0]
            label = line.strip().split(' ')[-1]
            if contends.startswith("-DOCSTART-"):
                words.append('')
                continue
            if len(contends) == 0 and words[-1] == '.':
                l = ' '.join([label for label in labels if len(label) > 0])
                w = ' '.join([word for word in words if len(word) > 0])
                result.append([l, w])
                words = []
                labels = []
                continue
            if len(contends) == 0:
                continue
            words.append(word)
            labels.append(label)
    return result


if __name__ == "__main__":
    file_path = "datasets/msra_ner_processed/train.txt"
    lines = read_data(file_path)
    print(lines[:5])
