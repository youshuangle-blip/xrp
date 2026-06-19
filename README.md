# XRP

Xray + sing-box 双核心节点管理面板，支持节点管理、核心分流/中转、Clash 配置和 Realm 端口转发。

## 一键安装

```sh
curl -fsSL https://raw.githubusercontent.com/youshuangle-blip/xrp/main/install.sh | bash
```

如果系统没有 `curl`，可以用：

```sh
wget -qO- https://raw.githubusercontent.com/youshuangle-blip/xrp/main/install.sh | bash
```

## 使用

安装后直接运行：

```sh
xrp
```

## 功能

- 安装/更新 Xray 与 sing-box 核心；Alpine 自动使用 musl 版本
- 添加 VLESS Reality、Shadowsocks、SOCKS5、Hysteria2 入站节点
- Hysteria2 自动检查 sing-box 最新版本，不存在或版本落后时自动安装/升级
- 查看四类节点的客户端导入链接
- 添加 Shadowsocks、SOCKS5 普通节点时不强制安装 Xray
- 自动生成并用核心校验 `/usr/local/etc/xray/config.json` 和 `/usr/local/etc/sing-box/config.json`
- 生成 Clash Meta / mihomo YAML 配置文件，不需要额外开放订阅端口
- 核心分流/中转支持粘贴 VLESS、Shadowsocks、SOCKS5、Hysteria2 链接自动导入出口参数
- Realm 端口转发管理，支持添加、删除、查看、应用和开机自启服务

配置成功后，Xray、sing-box 和 Realm 服务默认加入开机自启。删除最后一个对应核心节点时，面板会停止并取消该核心的开机自启。

## Hysteria2

菜单添加 Hysteria2 节点时会自动生成自签名 TLS 证书，导入链接和 Clash 配置默认启用跳过证书验证。NAT VPS 需要同时映射所选 UDP 端口。

单独管理 sing-box 核心：

```text
[20] 安装/更新 sing-box 核心
```

## 核心分流/中转

菜单选择：

```text
[21] 核心分流/中转
```

添加任务时先选择入站协议、填写入站参数，再粘贴出口代理链接。信息全部识别成功后才会安装对应核心并应用配置：

- VLESS、Shadowsocks、SOCKS5 入站使用 Xray
- Hysteria2 入站使用 sing-box
- Xray 入站支持 VLESS、Shadowsocks、SOCKS5 出口
- sing-box 入站支持 VLESS、Shadowsocks、SOCKS5、Hysteria2 出口

配置校验或服务重启失败时，新任务会回滚，不覆盖上一个可用配置。

## Clash 配置

菜单选择：

```text
[18] 生成 Clash 配置文件
```

可生成单节点配置或全部节点配置，文件默认保存在：

```text
/usr/local/etc/xray/xrp/clash/
```

下载到本地示例：

```sh
scp root@你的VPS:/usr/local/etc/xray/xrp/clash/all.yaml .
```

## Realm 转发

菜单选择：

```text
[19] Realm 转发
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
