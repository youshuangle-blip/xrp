# XRP

sing-box 节点管理面板，支持添加入站节点、中转出站、路由策略和一键生成 sing-box 配置。

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

- 安装/更新 sing-box 核心
- 添加 VLESS Reality、Shadowsocks、SOCKS5 入站节点
- 添加 Shadowsocks、SOCKS5、VLESS 中转出站
- 添加中转时支持粘贴 `ss://`、`socks://`、`socks5://`、`vless://` 链接自动识别
- 添加中转后可直接新增或绑定入站节点
- 支持全部走中转、仅 AI 走中转、AI + 流媒体走中转
- 自动生成并校验 `/usr/local/etc/sing-box/config.json`
- 生成 Clash Meta / mihomo YAML 配置文件，不需要额外开放订阅端口

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

## 卸载

运行：

```sh
xrp
```

然后在菜单中选择卸载选项。
