#!/bin/bash

counter=1
# 采集一个函数
readDir() {
  # 获取传入的目录路径
  local dir=$1
  # 循环指定目录下的所有文件
  local filesy
  files=$(ls "$dir")
  for file in $files; do
    if [[ $file =~ "new" ]]; then
        echo "new"
    else
        local path="$dir/$file" #指的是当前遍历文件的完整路径
        # 判断是否是目录，如果是目录则递归遍历，如果是文件则打印该文件的完整路径
        if [ -d "$path" ]; then
            echo "no"
        #   readDir "$path"
        else
            # echo "mp4 tp gif";
            echo "$path"
            # date +%s
            # convert -delay 1 $path -loop 0 "$dir""new/$(basename $file .mp4).gif"
            echo "gif to zip"
            date +%s
            convert "$dir""new/$(basename $file .mp4).gif" -fuzz 6% -layers Optimize "$dir""new/zip/$(basename $file .mp4).gif"
        fi
    fi
  done
}
# 调用函数，传入顶级目录为/root
readDir /root/learn/github/picture_zip/work/mp4/


# convert ./new/
# .gif -fuzz 5% -layers Optimize ./new/zip/
# .gif