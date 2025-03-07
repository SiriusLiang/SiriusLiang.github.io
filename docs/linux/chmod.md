# chmod

文件权限可以用数字表示，也可以用符号表示。

## 数字表示

文件权限用三个数字表示，分别表示文件所有者、文件所在组、其他用户的权限。

每个数字是一个三位二进制数，分别表示读、写、执行权限。

- 读权限：4
- 写权限：2
- 执行权限：1

例如，读写权限是 6，读写执行权限是 7。

例如，`chmod 755 file` 表示给文件所有者设置读写执行权限，给文件所在组和其他用户设置读执行权限。

## 符号表示

- `u`：文件所有者
- `g`：文件所在组
- `o`：其他用户
- `a`：所有用户

- `+`：增加权限
- `-`：减少权限
- `=`：设置权限

- `r`：读权限
- `w`：写权限
- `x`：执行权限
    
例如，`chmod u+x file` 表示给文件所有者增加执行权限。
