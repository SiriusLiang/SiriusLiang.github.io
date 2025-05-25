ubuntu修改笔记本合盖动作

```bash
sudo vi /etc/systemd/logind.conf
```

把`#HandleLidSwitchExternalPower=suspend`改为`HandleLidSwitchExternalPower=ignore`

重启服务
```bash
sudo service systemd-logind restart
```