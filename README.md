# XRP

Xray 节点管理面板，支持添加入站节点、生成节点链接、生成 Clash 配置和 Realm 端口转发。

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

- 安装/更新 Xray 核心
- 添加 VLESS Reality、Shadowsocks、SOCKS5 入站节点
- 查看 VLESS、Shadowsocks、SOCKS5 节点导入链接
- 添加 Shadowsocks、SOCKS5 节点时不强制安装 Xray；需要实际启动 VPS 入站服务时再安装核心并应用配置
- 自动生成并校验 `/usr/local/etc/xray/config.json`
- 生成 Clash Meta / mihomo YAML 配置文件，不需要额外开放订阅端口
- Realm 端口转发管理，支持添加、删除、查看、应用和开机自启服务

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
