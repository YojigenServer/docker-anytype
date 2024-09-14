# Docker-Anytype

带VNC的AnyType客户端镜像，用于局域网P2P同步节点和备份服务。

## 使用说明

### 安装条件

 - 一台x86架构的设备
 - 已安装Docker环境
 - 支持设置macvlan

### docker-compose.yaml

```docker
services:
  homepage:
    image: ghcr.io/yojigenserver/anytype:latest
    container_name: AnyType
    privileged: true
    volumes:
      - ./config:/config/.config/anytype
    environment:
      - TZ=Asia/Shanghai
      - PUID=1000
      - PGID=1001
    networks:
      macvlan:
        ipv4_address: 192.168.9.240
    restart: always

networks:
  macvlan:
    external: true
```

需要添加一个macvlan网卡，并且设置和其他客户端使用设备相同网段。
PUID和PGID用于控制产生的文件的用户权限。
