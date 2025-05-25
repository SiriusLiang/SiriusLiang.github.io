# 新装`Ubuntu Server`要做的事

```shell
vi ~/.ssh/authorized_keys
```

-----

```shell
cd /etc/apt/apt.conf.d
sudo vi 10proxy
```

```
Acquire::http::Proxy "http://172.16.7.13:7890";
Acquire::https::Proxy "http://172.16.7.13:7890";

```

```
sudo systemctl daemon-reload
```

-----

```shell
# 安装 Zsh
sudo apt install zsh -y

# 将 Zsh 设置为默认 Shell
chsh -s /bin/zsh

# 安装 Oh My Zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

```
ZSH_THEME="amuse"

...

plugins=(
        git
        zsh-autosuggestions
        zsh-syntax-highlighting
)

...

export https_proxy=http://172.16.7.13:7890 http_proxy=http://172.16.7.13:7890 all_proxy=socks5://172.16.7.13:7890
```

-----

```shell
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo touch /etc/systemd/system/docker.service.d/http-proxy.conf
```

```
[Service]
Environment="HTTP_PROXY=http://172.16.7.13:7890"
Environment="HTTPS_PROXY=http://172.16.7.13:7890"

```

```
sudo systemctl daemon-reload
sudo systemctl restart docker
```

-----

1. 列出磁盘分区情况，看`Free  PE / Size`部分未分区大小
```bash
sudo vgdisplay
```

2. 扩展分区
```bash
sudo lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
```

3. resize
```bash
sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
```

