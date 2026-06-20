# XRP

Xray + sing-box 双核心节点管理面板，支持节点管理、核心分流/中转和 Realm 端口转发。

## 一键安装

```sh
curl -fsSL https://raw.githubusercontent.com/youshuangle-blip/xrp/main/install.sh | bash
```

如果系统没有 `curl`，可以用：

```sh
wget -qO- https://raw.githubusercontent.com/youshuangle-blip/xrp/main/install.sh | bash
```

## 使用

安装完成后会自动进入面板。之后需要再次打开时运行：

```sh
xrp
```

## 功能

- 安装/更新 Xray 与 sing-box 核心；Alpine 自动使用 musl 版本
- 添加 VLESS Reality、Shadowsocks、SOCKS5、Hysteria2、TUIC 入站节点
- 添加节点前会先检测对应核心；Xray 节点自动安装 Xray，Hysteria2/TUIC 节点自动安装 sing-box
- 查看五类节点的客户端导入链接
- 自动生成并用核心校验 `/usr/local/etc/xray/config.json` 和 `/usr/local/etc/sing-box/config.json`
- 核心分流/中转支持粘贴 VLESS、Shadowsocks、SOCKS5、Hysteria2、TUIC 链接自动导入出口参数
- Realm 端口转发管理，支持添加、删除、查看、应用和开机自启服务

配置成功后，Xray、sing-box 和 Realm 服务默认加入开机自启。删除最后一个对应核心节点时，面板会停止并取消该核心的开机自启。

## Hysteria2 / TUIC

菜单添加 Hysteria2 或 TUIC 节点时会自动生成自签名 TLS 证书，客户端导入链接默认启用跳过证书验证。NAT VPS 需要同时映射所选 UDP 端口。

单独管理 sing-box 核心：

```text
[11] 安装/更新 sing-box 核心
```

## 核心分流/中转

菜单选择：

```text
[15] 核心分流/中转
```

添加任务时先选择入站协议、填写入站参数，再粘贴出口代理链接。信息全部识别成功后才会安装对应核心并应用配置：

- VLESS、Shadowsocks、SOCKS5 入站使用 Xray
- Hysteria2、TUIC 入站使用 sing-box
- Xray 入站支持 VLESS、Shadowsocks、SOCKS5 出口
- sing-box 入站支持 VLESS、Shadowsocks、SOCKS5、Hysteria2、TUIC 出口

配置校验或服务重启失败时，新任务会回滚，不覆盖上一个可用配置。

## Realm 转发

菜单选择：

```text
[14] Realm 转发
```

可安装/更新 Realm，并添加普通端口转发规则，例如：

```text
0.0.0.0:公网端口 -> 目标IP:目标端口
```

Realm 配置默认保存在：

```text
/usr/local/etc/xray/xrp/realm/config.toml
```

## 卸载

运行：

```sh
xrp
```

然后在菜单中选择卸载选项。
