# visudo

`visudo` is a command-line utility that allows you to edit the sudoers file in a safe manner. It opens the sudoers file in a text editor, and checks the syntax of the file before saving it. If there are any syntax errors, it will not save the file, and will prompt you to correct the errors.

虽然sudoers文件对于vim等普通编辑器是只读的，但visudo依然能编辑它。

## 挽救sudoers

一旦sudoers不小心被改成可写文件，再使用sudo时会提示：

```shell
sudo: /etc/sudoers is world writable
sudo: no valid sudoers sources found, quitting
sudo: error initializing audit plugin sudoers_audit
```

使用`pkexec`恢复sudoers的只读权限也会报错：

```shell
$ pkexec chmod 0440 /etc/sudoers
==== AUTHENTICATING FOR org.freedesktop.policykit.exec ===
Authentication is needed to run `/usr/bin/chmod' as the super user
Authenticating as: cx (cxadmin)
Password:
polkit-agent-helper-1: error response to PolicyKit daemon: GDBus.Error:org.freedesktop.PolicyKit1.Error.Failed: No session for cookie
==== AUTHENTICATION FAILED ===
Error executing command as another user: Not authorized

This incident has been reported.
```

这时需要进入GRUB模式才能恢复。

但是如果不在物理机旁，有一个骚操作可以通过命令行恢复，在Ubuntu Server 20.04上测试通过：

1. 打开一个shell，输入`echo $$`，获取当前shell的PID。
2. 打开另一个shell，输入`pkttyagent --process PID`，PID是第一步获取的PID，shell阻塞。
3. 回到第一个shell，输入`pkexec visudo`，阻塞等待第二个shell输入密码
4. 在第二个shell输入密码，第一个shell会打开visudo，修改sudoers文件。修改完以后，sudoers会恢复成440权限。
