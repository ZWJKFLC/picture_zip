#!/bin/bash

counter=1
# 采集一个函数
readDir() {
  # 获取传入的目录路径
  local dir=$1
  # 循环指定目录下的所有文件
  local files
  local new = "new"
  files=$(ls "$dir")
  for file in $files; do
    if [$file == $new]; then
      continue
    fi
    local path="$dir/$file" #指的是当前遍历文件的完整路径
    # 判断是否是目录，如果是目录则递归遍历，如果是文件则打印该文件的完整路径
    if [ -d "$path" ]; then
      readDir "$path"
    else
      date +%s
      convert $path -fuzz 5% -layers Optimize "$dir/new/$file"
      date +%s
      echo "finish"
    fi
  done
}
# 调用函数，传入顶级目录为/root
readDir /root/learn/github/picture_zip/work/GIF_back/new