部署步骤：

1. 解压邮件附件
2. 搜索并打开aws的ECR，按照右上角的“查看推送命令”，解压邮件：
    - 在终端登录`aws cli`
    - 构建image
    - 打tag
    - 推送到ECR
3. 去aws的lambda创建函数
    - 使用第三个选项“容器镜像”，选择刚推送的ECR镜像
    - x86_64架构
    - 更改默认执行角色 -> 使用现有角色 -> 选择一个能操作S3中的角色
4. 配置lambda函数：
    - 内存1024MB
    - 短暂存储1024MB
    - 超时时间5分钟0秒
5. 几个功能的使用：
    - 添加水印（图片）
      ```json
        {
            "bucket_original": "image-server-orig",
            "key_original": "47/stone/xxxx/image-1.jpg",
            "bucket_47": "47net-image-server"
        }
      ```
    - 提取水印（图片）
        ```json
        {
            "bucket_marked": "47net-image-server",
            "key_marked": "stone/xxxx/image-1.png",
            "bucket_extract": "image-server-orig",
            "key_extract": "extract/stone/xxxx/image-1.png",
            "bucket_original": "image-server-orig",
            "key_original": "47/stone/xxxx/image-1.jpg",
            "action": "extract"
        }
        ```
    - 添加水印（视频）
        ```json
        {
            "bucket_47": "47net-image-server",
            "bucket_original": "image-server-orig",
            "key_original": "47/stone/xxxx/video-1.mp4",
            "action": "add2"
        }
        ```
    - 提取水印（视频）
        ```json
        {
            "bucket_marked": "47net-image-server",
            "key_marked": "stone/xxxx/video-1.mp4",
            "bucket_extract": "image-server-orig",
            "key_extract": "extract/stone/xxxx/video-1",
            "bucket_original": "image-server-orig",
            "key_original": "47/stone/xxxx/video-1.mp4",
            "action": "extract2"
        }
        ```