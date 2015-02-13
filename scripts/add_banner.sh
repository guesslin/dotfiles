#!/bin/bash

banner_file="banner.txt"
comment_char="#"
c_style_comment_char="//"
filename=$1
tmp_file=".tmp"

sed -e '/^<%$/,/^%>$/!d' -e '/^<%$/d' -e '/^%>$/s///' -e 's/^/'$comment_char' /' $banner_file -e 'w '$tmp_file
cat $filename >> $tmp_file
cat $tmp_file > $filename
rm $tmp_file
