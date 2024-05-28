Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id ACEEE8D10ED
	for <lists+openbmc@lfdr.de>; Tue, 28 May 2024 02:36:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b9XczPPH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpCy85Gc9z79LP
	for <lists+openbmc@lfdr.de>; Tue, 28 May 2024 10:27:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b9XczPPH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpCxb2kJMz3cVY
	for <openbmc@lists.ozlabs.org>; Tue, 28 May 2024 10:26:43 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A17C720174;
	Tue, 28 May 2024 08:26:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716856000;
	bh=PMudoHy4saoN7Z5KdTnfAcZ1PmXNhqUeQqWk4TS0FLM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=b9XczPPH3OD1M7+SiY2ukZVpOZJeHh6Y+tvmb3J5QW16m8TToMBcZH1W0gJulYO0U
	 2vyypaRv6TWouuukWKYFln10cy2ED8Qct8OK7qEYyFiMpBi10aIks+KQ82otqDtd0n
	 FoNAgDSjpY1hZFowoNus+2Ov+sCHLWGod7fazFf8RX0jz1GKaenZDmMC442dSVIFYX
	 iIZ2QrFjgRoDH8esaG98Yz8f2k7zsPEDOl9JRfwfD6BBj1g9a12OX5NUM3WetdLp+b
	 skBYOaliw8uHuVanSbapeaYX8Y2AFcbs5JABHjS10/lD/1UJ97rYE9eOJLNtau7T7v
	 K9OxeIUsbmXMA==
Message-ID: <4b5f7c656fba2bbee92f41922f82903168441aad.camel@codeconstruct.com.au>
Subject: Re: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 -
 questions
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Johannes Truschnigg <johannes@truschnigg.info>, openbmc@lists.ozlabs.org
Date: Tue, 28 May 2024 09:56:38 +0930
In-Reply-To: <ZlTMYkCZhXmRb1av@vault.lan>
References: <ZkuJNJ9kFrRS3mQF@vault.lan>
	 <5e89654a02e2f870b71700c8cd75c2ef371fb579.camel@codeconstruct.com.au>
	 <ZkzUX9JPPGAtNa2d@vault.lan>
	 <640ed3fcae859ef35f3c57fad6c2f39400d6ef0a.camel@codeconstruct.com.au>
	 <ZlTMYkCZhXmRb1av@vault.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-05-27 at 20:09 +0200, Johannes Truschnigg wrote:
> Hello again, dear list members!
>=20
> I've spent some time with my/Gigabyte's/AMI's AST2500 today, and I might =
have
> messed it up for good in the process, unwillingly. However, the result mi=
ght
> also present a fresh opportunity - I reall do not know! :) But first thin=
gs
> first!
>=20
> Because I could not find any documentation about potantial OpenBMC nfsroo=
t
> support, I decided to "just try it", with unforseen consequences (anyone
> remember Half-Life? :)) Since `picocom` was kind enough to preserve a ses=
sion
> log of the whole ordeal, the excerpt below should contain the gist of how=
 I
> messed up:
>=20
>=20
> ```
>=20
> U-Boot 2013.07 (Mar 12 2024 - 14:08:49)
>=20
> I2C:   ready
> DRAM:  424 MiB
> eSPI Handshake complete
> OEM_BOARD_INIT - Start (BMC)
> LPC mode
> OEM_BOARD_INIT - End
> Flash: Found SPI Chip Micron/Numonyx N25Q512A(0x20ba) 2x I/O READ, NORMAL=
 WRITE
> 64 MiB
> MMC:  =20
> Net:   RTL8211E, EEECR =3D 0x06
> RTL8211E, EEEAR =3D 0x00
> RTL8211E, EEELPAR =3D 0x06
> RTL8211E, LACR =3D 0xc1
> RTL8211E, LCR =3D 0x9742
> ast_eth0, ast_eth1
> DRAM ECC enabled
> Hit any key to stop autoboot:  0=20
> AST2500EVB>set autoload no
> AST2500EVB>dhcp
> BOOTP broadcast 1
> [...]
> BOOTP broadcast 25
>=20
> Retry count exceeded; starting again
> BOOTP broadcast 1
> BOOTP broadcast 2
> DHCP client bound to address 172.18.3.62
> AST2500EVB>tftp 0x83000000 172.18.3.199:uboot
> Using ast_eth1 device
> TFTP from server 172.18.3.199; our IP address is 172.18.3.62
> Filename 'uboot'.
> Load address: 0x83000000
> Loading: ################################################################=
#
>          #########
>          366.7 KiB
> done
> Bytes transferred =3D 375501 (5bacd hex)
> AST2500EVB>go 0x83000000
> ## Starting application at 0x83000000 ...
>=20
>=20
> U-Boot 2019.04 (Mar 25 2024 - 04:43:19 +0000)
>=20
> SOC : AST2500-A2=20
> RST : WDT1=20
> RST : WDT3 - Boot
> LPC Mode : SIO:Disable=20
> Eth : MAC0: RMII/NCSI, , MAC1: RGMII,=20
> Model: AST2500 EVB
> DRAM:  424 MiB (capacity:512 MiB, VGA:32 MiB, ECC:on, ECC size:424 MiB)
> MMC:   sdhci_slot0@100: 0, sdhci_slot1@200: 1
> Loading Environment from SPI Flash... SF: Detected n25q512ax3 with page s=
ize 256 Bytes, erase size 4 KiB, total 64 MiB
> *** Warning - bad CRC, using default environment
>=20
> In:    serial@1e784000
> Out:   serial@1e784000
> Err:   serial@1e784000
> Net:  =20
> Warning: ethernet@1e660000 (eth0) using random MAC address - 56:4b:8e:16:=
48:eb
> eth0: ethernet@1e660000
> Warning: ethernet@1e680000 (eth1) using random MAC address - 32:f3:07:0a:=
d2:ad
> , eth1: ethernet@1e680000
> Hit any key to stop autoboot:  0=20
> ast# setenv ethact ethernet@1e680000
> ast# setenv autoload no
> ast# dhcp
> ethernet@1e680000: link up, 1000 Mbps full-duplex mac:32:f3:07:0a:d2:ad
> BOOTP broadcast 1
> BOOTP broadcast 2
> BOOTP broadcast 3
> BOOTP broadcast 4
> DHCP client bound to address 172.18.3.83 (3007 ms)
> ast# tftpboot 0x84000000 172.18.3.199:fit.bin
> ethernet@1e680000: link up, 1000 Mbps full-duplex mac:32:f3:07:0a:d2:ad
> Using ethernet@1e680000 device
> TFTP from server 172.18.3.199; our IP address is 172.18.3.83
> Filename 'fit.bin'.
> Load address: 0x84000000
> Loading: ################################################################=
#
>          #######################################
>          5.6 MiB/s
> done
> Bytes transferred =3D 4375688 (42c488 hex)
> ast# setenv bootargs console=3DttyS4,115200n8 root=3D/dev/nfs rootfstype=
=3Dnfs ip=3D172.18.3.173:172.18.3.138:172.18.3.254:255.255.255.0:bmctest:et=
h1:off:172.18.3.254::172.18.3.254 nfsroot=3D172.18.3.138:/,mountport=3D1333=
7
> ast# bootm 0x84000000
> ## Loading kernel from FIT Image at 84000000 ...
>    Using 'conf-aspeed-ast2500-evb.dtb' configuration
>    Trying 'kernel-1' kernel subimage
>      Description:  Linux kernel
>      Type:         Kernel Image
>      Compression:  uncompressed
>      Data Start:   0x84000118
>      Data Size:    3257440 Bytes =3D 3.1 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: 0x80001000
>      Entry Point:  0x80001000
>      Hash algo:    sha256
>      Hash value:   0c874e335b61b661a7f1d638258ee1652728f021921b74bdcbad2b=
bb4ceef3f9
>    Verifying Hash Integrity ... sha256+ OK
> ## Loading ramdisk from FIT Image at 84000000 ...
>    Using 'conf-aspeed-ast2500-evb.dtb' configuration
>    Trying 'ramdisk-1' ramdisk subimage
>      Description:  obmc-phosphor-initramfs
>      Type:         RAMDisk Image
>      Compression:  uncompressed
>      Data Start:   0x84322138
>      Data Size:    1088964 Bytes =3D 1 MiB
>      Architecture: ARM
>      OS:           Linux
>      Load Address: unavailable
>      Entry Point:  unavailable
>      Hash algo:    sha256
>      Hash value:   94cc4badfdacec0b053b68954c69c55af5e50b3d8bc15b2852005f=
d6c84c238f
>    Verifying Hash Integrity ... sha256+ OK
> ## Loading fdt from FIT Image at 84000000 ...
>    Using 'conf-aspeed-ast2500-evb.dtb' configuration
>    Trying 'fdt-aspeed-ast2500-evb.dtb' fdt subimage
>      Description:  Flattened Device Tree blob
>      Type:         Flat Device Tree
>      Compression:  uncompressed
>      Data Start:   0x8431b68c
>      Data Size:    27103 Bytes =3D 26.5 KiB
>      Architecture: ARM
>      Hash algo:    sha256
>      Hash value:   ca0066dfb087e1b1e022dec0c9aef3ac1c1ac350a49f5959e056ac=
f64383b637
>    Verifying Hash Integrity ... sha256+ OK
>    Booting using the fdt blob at 0x8431b68c
>    Loading Kernel Image ... OK
>    Loading Ramdisk to 8fef6000, end 8ffffdc4 ... OK
>    Loading Device Tree to 8feec000, end 8fef59de ... OK
>=20
> Starting kernel ...
>=20
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 6.6.30-f013890-00167-gf013890407d8 (oe-user@=
oe-host) (arm-openbmc-linux-gnueabi-gcc (GCC) 13.2.0, GNU ld (GNU Binutils)=
 2.42.0.20240216) #1 Mon May 13 00:55:18 UTC 2024
> [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARM=
v7), cr=3D00c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing =
instruction cache
> [    0.000000] OF: fdt: Machine model: AST2500 EVB
> [    0.000000] Memory policy: Data cache writeback
> [    0.000000] Reserved memory: created CMA memory pool at 0x99000000, si=
ze 16 MiB
> [    0.000000] OF: reserved mem: initialized node framebuffer, compatible=
 id shared-dma-pool
> [    0.000000] OF: reserved mem: 0x99000000..0x99ffffff (16384 KiB) map r=
eusable framebuffer
> [    0.000000] cma: Reserved 16 MiB at 0x98000000 on node -1
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000080000000-0x000000009a7fffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000080000000-0x000000009a7fffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000009a7=
fffff]
> [    0.000000] Kernel command line: console=3DttyS4,115200n8 root=3D/dev/=
nfs rootfstype=3Dnfs ip=3D172.18.3.173:172.18.3.138:172.18.3.254:255.255.25=
5.0:bmctest:eth1:off:172.18.3.254::172.18.3.254 nfsroot=3D172.18.3.138:/,mo=
untport=3D13337
> [    0.000000] Unknown kernel command line parameters "ip=3D172.18.3.173:=
172.18.3.138:172.18.3.254:255.255.255.0:bmctest:eth1:off:172.18.3.254::172.=
18.3.254 nfsroot=3D172.18.3.138:/,mountport=3D13337", will be passed to use=
r space.
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 b=
ytes, linear)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes, linear)
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 107=
696
> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:=
off
> [    0.000000] Memory: 385236K/434176K available (7168K kernel code, 686K=
 rwdata, 1664K rodata, 1024K init, 141K bss, 16172K reserved, 32768K cma-re=
served)
> [    0.000000] SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1,=
 Nodes=3D1
> [    0.000000] ftrace: allocating 24994 entries in 49 pages
> [    0.000000] ftrace: allocated 49 pages with 3 groups
> [    0.000000] trace event string verifier disabled
> [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
> [    0.000000] i2c controller registered, irq 17
> [    0.000000] clocksource: FTTMR010-TIMER2: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 77222644334 ns
> [    0.000004] sched_clock: 32 bits at 25MHz, resolution 40ns, wraps ever=
y 86767015915ns
> [    0.000079] Switching to timer-based delay loop, resolution 40ns
> [    0.001275] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 49.50 BogoMIPS (lpj=3D247500)
> [    0.001340] CPU: Testing write buffer coherency: ok
> [    0.001456] pid_max: default: 32768 minimum: 301
> [    0.011962] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes=
, linear)
> [    0.012029] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes, linear)
> [    0.027599] RCU Tasks Rude: Setting shift to 0 and lim to 1 rcu_task_c=
b_adjust=3D1.
> [    0.028143] RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_=
cb_adjust=3D1.
> [    0.028703] Setting up static identity map for 0x80100000 - 0x80100038
> [    0.030465] ASPEED AST2500 rev A2 (04030303)
> [    0.032008] devtmpfs: initialized
> [    0.053913] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 19112604462750000 ns
> [    0.053996] futex hash table entries: 256 (order: -1, 3072 bytes, line=
ar)
> [    0.060628] pinctrl core: initialized pinctrl subsystem
> [    0.065337] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.067525] DMA: preallocated 256 KiB pool for atomic coherent allocat=
ions
> [    0.070964] hw-breakpoint: found 6 breakpoint and 1 watchpoint registe=
rs.
> [    0.071009] hw-breakpoint: maximum watchpoint size is 4 bytes.
> [    0.132580] mc: Linux media interface: v0.10
> [    0.132897] videodev: Linux video capture interface: v2.00
> [    0.133060] pps_core: LinuxPPS API ver. 1 registered
> [    0.133085] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    0.133161] PTP clock support registered
> [    0.142848] clocksource: Switched to clocksource FTTMR010-TIMER2
> [    0.174185] NET: Registered PF_INET protocol family
> [    0.174819] IP idents hash table entries: 8192 (order: 4, 65536 bytes,=
 linear)
> [    0.177558] tcp_listen_portaddr_hash hash table entries: 1024 (order: =
0, 4096 bytes, linear)
> [    0.177651] Table-perturb hash table entries: 65536 (order: 6, 262144 =
bytes, linear)
> [    0.177714] TCP established hash table entries: 4096 (order: 2, 16384 =
bytes, linear)
> [    0.177806] TCP bind hash table entries: 4096 (order: 3, 32768 bytes, =
linear)
> [    0.178014] TCP: Hash tables configured (established 4096 bind 4096)
> [    0.178317] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
> [    0.178411] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, li=
near)
> [    0.179584] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.186070] Unpacking initramfs...
> [    0.213300] workingset: timestamp_bits=3D30 max_order=3D17 bucket_orde=
r=3D0
> [    0.214001] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    0.214060] jffs2: version 2.2. (SUMMARY)  =C2=A9 2001-2006 Red Hat, I=
nc.
> [    0.263220] Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
> [    0.273969] printk: console [ttyS4] disabled
> [    0.275132] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq =3D 20, bas=
e_baud =3D 1500000) is a 16550A
> [    0.275268] printk: console [ttyS4] enabled
> [    0.935649] timeriomem_rng 1e6e2078.hwrng: 32bits from 0x(ptrval) @ 1u=
s
> [    0.943808] aspeed_gfx 1e6e6000.display: assigned reserved memory node=
 framebuffer
> [    0.967762] random: crng init done
> [    0.984563] [drm] Initialized aspeed-gfx-drm 1.0.0 20180319 for 1e6e60=
00.display on minor 0
> [    1.007161] aspeed_gfx 1e6e6000.display: [drm] fb0: aspeed-gfx-drmd fr=
ame buffer device
> [    1.055838] loop: module loaded
> [    1.141860] spi-nor spi0.0: mt25ql512a (65536 Kbytes)
> [    1.274576] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c06=
41]
> [    1.346136] 5 fixed-partitions partitions found on MTD device bmc
> [    1.352312] Creating 5 MTD partitions on "bmc":
> [    1.356984] 0x000000000000-0x000000060000 : "u-boot"
> [    1.385686] 0x000000060000-0x000000080000 : "u-boot-env"
> [    1.406591] 0x000000080000-0x0000004c0000 : "kernel"
> [    1.414849] 0x0000004c0000-0x000001c00000 : "rofs"
> [    1.436205] 0x000001c00000-0x000002000000 : "rwfs"
> [    1.448668] spi-nor spi1.0: unrecognized JEDEC id bytes: 00 03 00 00 0=
0 00
> [    1.463133] ftgmac100 1e660000.ethernet: Error applying setting, rever=
se things back
> [    1.471391] ftgmac100 1e660000.ethernet: Read MAC address 56:4b:8e:16:=
48:eb from chip
> [    1.510983] Generic PHY 1e660000.ethernet--1:00: attached PHY driver (=
mii_bus:phy_addr=3D1e660000.ethernet--1:00, irq=3DPOLL)
> [    1.523568] ftgmac100 1e660000.ethernet eth0: irq 22, mapped at 96ea64=
c4
> [    1.531266] ftgmac100 1e680000.ethernet: Read MAC address 32:f3:07:0a:=
d2:ad from chip
> [    1.570263] RTL8211E Gigabit Ethernet 1e680000.ethernet--1:00: attache=
d PHY driver (mii_bus:phy_addr=3D1e680000.ethernet--1:00, irq=3DPOLL)
> [    1.583921] ftgmac100 1e680000.ethernet eth1: irq 23, mapped at ec62a3=
ab
> [    1.746308] aspeed_vhub 1e6a0000.usb-vhub: Initialized virtual hub in =
USB2 mode
> [    1.754377] Mass Storage Function, version: 2009/09/11
> [    1.759586] LUN: removable file: (no medium)
> [    1.764058] no file given for LUN0
> [    1.767569] udc 1e6a0000.usb-vhub:p1: failed to start g_mass_storage: =
-22
> [    1.774490] g_mass_storage: probe of gadget.0 failed with error -22
> [    1.780961] Mass Storage Function, version: 2009/09/11
> [    1.786234] LUN: removable file: (no medium)
> [    1.790615] no file given for LUN0
> [    1.794196] udc 1e6a0000.usb-vhub:p2: failed to start g_mass_storage: =
-22
> [    1.801044] g_mass_storage: probe of gadget.1 failed with error -22
> [    1.807565] Mass Storage Function, version: 2009/09/11
> [    1.812765] LUN: removable file: (no medium)
> [    1.817213] no file given for LUN0
> [    1.820709] udc 1e6a0000.usb-vhub:p3: failed to start g_mass_storage: =
-22
> [    1.827628] g_mass_storage: probe of gadget.2 failed with error -22
> [    1.834157] Mass Storage Function, version: 2009/09/11
> [    1.839354] LUN: removable file: (no medium)
> [    1.843823] no file given for LUN0
> [    1.847327] udc 1e6a0000.usb-vhub:p4: failed to start g_mass_storage: =
-22
> [    1.854243] g_mass_storage: probe of gadget.3 failed with error -22
> [    1.860710] Mass Storage Function, version: 2009/09/11
> [    1.865982] LUN: removable file: (no medium)
> [    1.870363] no file given for LUN0
> [    1.873934] udc 1e6a0000.usb-vhub:p5: failed to start g_mass_storage: =
-22
> [    1.880778] g_mass_storage: probe of gadget.4 failed with error -22
> [    1.887290] UDC core: g_mass_storage: couldn't find an available UDC
> [    1.894510] i2c_dev: i2c /dev entries driver
> [    2.009530] aspeed-i2c-bus 1e78a100.i2c-bus: i2c bus 3 registered, irq=
 25
> [    2.033760] aspeed-i2c-bus 1e78a300.i2c-bus: i2c bus 7 registered, irq=
 26
> [    2.041576] Driver for 1-wire Dallas network protocol.
> [    2.080643] NET: Registered PF_INET6 protocol family
> [    2.114646] Segment Routing with IPv6
> [    2.118479] In-situ OAM (IOAM) with IPv6
> [    2.122989] NET: Registered PF_PACKET protocol family
> [    2.128116] 8021q: 802.1Q VLAN Support v1.8
> [    2.173478] printk: console [netcon0] enabled
> [    2.177927] netconsole: network logging started
> [    2.183614] clk: Disabling unused clocks
> [    2.368191] Freeing initrd memory: 1064K
> [    2.378419] Freeing unused kernel image (initmem) memory: 1024K
> [    2.386528] Checked W+X mappings: passed, no W+X pages found
> [    2.392272] Run /init as init process
> rofs =3D mtd4 squashfs   rwfs =3D mtd5 jffs2
> mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argume=
nt
> [    3.427189] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not f=
ound at 0x00000000: 0x49f3 instead
> [    3.436958] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not f=
ound at 0x00000004: 0xe73d instead
>=20
> [... XXX *many* more of those XXX at various offsets...]
>=20
> [   10.907145] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not f=
ound at 0x003f0024: 0x68b6 instead
> [   10.916740] jffs2: Further such events for this erase block will not b=
e printed
> [   10.934585] jffs2: Cowardly refusing to erase blocks on filesystem wit=
h no valid JFFS2 nodes
> [   10.943154] jffs2: empty_blocks 0, bad_blocks 0, c->nr_blocks 64
> mount: mounting /dev/mtdblock5 on run/initramfs/rw failed: Input/output e=
rror
>=20
> Mounting read-write /dev/mtdblock5 filesystem failed.  Please fix and run
>         mount /dev/mtdblock5 run/initramfs/rw -t jffs2 -o rw
> or perform a factory reset with the clean-rwfs-filesystem option.
> Fatal error, tri[   10.990385] Kernel panic - not syncing: Attempted to k=
ill init! exitcode=3D0x00000100
> [   10.999145] CPU: 0 PID: 1 Comm: init Not tainted 6.6.30-f013890-00167-=
gf013890407d8 #1
> [   11.007102] Hardware name: Generic DT based system
> [   11.011934]  unwind_backtrace from show_stack+0x18/0x1c
> [   11.017265]  show_stack from dump_stack_lvl+0x24/0x2c
> [   11.022404]  dump_stack_lvl from panic+0xf4/0x30c
> [   11.027180]  panic from do_exit+0x8a8/0x8d0
> [   11.031441]  do_exit from do_group_exit+0x40/0x84
> [   11.036209]  do_group_exit from __wake_up_parent+0x0/0x1c
>=20
>=20
> U-Boot 2013.07 (Mar 12 2024 - 14:08:49)
>=20
> I2C:   ready
> DRAM:  424 MiB
> eSPI Handshake complete
> OEM_BOARD_INIT - Start (BMC)
> LPC mode
> OEM_BOARD_INIT - End
> Flash: Found SPI Chip Micron/Numonyx N25Q512A(0x20ba) 2x I/O READ, NORMAL=
 WRITE
> 64 MiB
> MMC:  =20
> *** Warning - bad CRC, using default environment
>=20
> Un-Protected 1 sectors
> Erasing Flash...
> Erasing sector  4 ... ok.
> Erased 1 sectors
> Writing to Flash... done
> Protected 1 sectors
> Net:   RTL8211E, EEECR =3D 0x06
> RTL8211E, EEEAR =3D 0x00
> RTL8211E, EEELPAR =3D 0x06
> RTL8211E, LACR =3D 0xc1
> RTL8211E, LCR =3D 0x9742
> ast_eth0, ast_eth1
> DRAM ECC enabled
> Hit any key to stop autoboot:  0=20
> AST2500EVB>
> ```
>=20
> So afaiui my attempt misfired, the kernel panic'd, reset the system, and
> then... u-boot kinda decided to erase flash sector 4 (why?),
>=20

Not sure, especially because it's the vendor u-boot :)

>  which seems to have contained something important for (the original u-bo=
ot from Gigabyte on SPI flash) to boot. I did not realize that and cut powe=
r, waiting for a few secs before powering up again... only to notice that m=
y UART serial console was staying dark this time. Meanwhile, the BMC NIC LE=
Ds blink in a strange loop that hints at some restart procedure that is rep=
eated ad nauseam.
>=20
> To my luck, however, the host itself still willingly boots into the live =
system that I had set up before, but with a subtle difference once it's loa=
ded: The AST2500 seems to be in a state much more amenable to Andrew's `cul=
vert` utility now, which reports its neighborhood BMC like this now:
>=20
> ```
> root@grml ~ # /tmp/culvert probe
> [*] failed to initialise devmem bridge: -1
> [*] Accessing the BMC's AHB via the p2a bridge
> debug:  Permissive
>         Debug UART port: UART5
> xdma:   Restricted
>         BMC: Disabled
>         VGA: Enabled
>         XDMA on VGA: Enabled
>         XDMA is constrained: Yes
> p2a:    Permissive
>         BMC: Disabled
>         VGA: Enabled
>         MMIO on VGA: Enabled
>         [0x00000000 - 0x0fffffff]   Firmware: Writable
>         [0x10000000 - 0x1fffffff]     SoC IO: Writable
>         [0x20000000 - 0x2fffffff]  BMC Flash: Writable
>         [0x30000000 - 0x3fffffff] Host Flash: Writable
>         [0x40000000 - 0x5fffffff]   Reserved: Writable
>         [0x60000000 - 0x7fffffff]   LPC Host: Writable
>         [0x80000000 - 0xffffffff]       DRAM: Writable
> ilpc:   Permissive
>         SuperIO address: 0x2e
> ```
>=20
> (Before my mishap, whenever I tried to run that command, all but `ilpc` y=
ielded
> nothing, and even `ilpc` reported "Restricted" - none of which I know how=
 to
> interpret at all, by the way! :D)

So I have a bit of an educated guess here:

1. For AST SoCs prior to the AST2600, disabling the hardware backdoors
must be done in firmware
2. Your process above has corrupted u-boot
3. The corruption is such that u-boot fails prior to applying the
backdoor mitigations (if that's where the mitigation was done to begin
with - however it's where we do the mitigation in OpenBMC)

As for the culvert 'probe' output and the
Permissive/Restricted/Disabled states:

- Permissive means there are no constraints on the bridge - culvert can
read and write any AHB address
- Restricted means some constraints apply to the bridge - either the
address space is restricted (e.g. XDMA is constrained to the VGA
reserved memory), or write access is disabled for some portion or all
of the AHB address space (e.g. the P2A write filters for the listed
regions)
- Disabled means what it says on the tin, the BMC's AHB address space
cannot be accessed via the bridge at hand, we cannot read or write.

>=20
>=20
> So I guess I have at least six questions now:
>=20
> 1.) What happened when the kernel called it quits, u-boot reloaded and de=
cided
> to format some of its flash?

Not sure, but you'd do well to boot a kernel that doesn't try to mount
partitions from the flash.

>=20
> 2.) Can I influence this behavior on my (spare) board before I try again?

With the above suggestion it largely comes back to how you assemble the
initrd used by the kernel

>=20
> 3.) Can I restore the original firmware/SPI content on my board by any me=
ans
> from the now running host OS? If so, what way would you suggest I try fir=
st?

> 4.) Does having `culvert` have this new level of access have any new adva=
ntages
> or open possibilities that I should be aware of?

So one of the motivations for culvert is to reflash the BMC over the
AHB bridges reported in the probe output. This works regardless of the
state of the BMC firmware, so long as it hasn't disabled the hardware
backdoors. You can try it with e.g.

```
# culvert -vv write firmware < $firmware_image
```

(you may want to experiment with `culvert -vv read firmware` first).

That said, experience in [1] suggests Gigabyte have introduced some
gremlins that aren't accounted for by culvert, and that you might have
more success with gigaflash.

[1]:
https://github.com/amboar/culvert/issues/51#issuecomment-2129043859

>=20
> 5.) Suppose I can restore the BMC's original SPI content and behavior - w=
hat's
> a recommended way to have the TFPT'd kernel boot into an OpenBMC rootfs
> *without* having it store on the BMC's main storage/overwriting SPI?

If you're looking to deal with OpenBMC directly then this collection of
patches from Patrick will probably help:

https://gerrit.openbmc.org/q/topic:%22no-rootfs%22

Otherwise, using buildroot to create a self-contained kernel and
initramfs is a quick way to make progress.

>=20
> 6.) Assuming this cannot be recovered in software - what are my chances o=
f
> identifying the SPI flash on my board as such, and re-writing its content=
s
> using an affordable SPI programmer solution, given that I've never done
> anything like this with hardware before? :^)

From the manual[2] I expect it's in the unmarked socket between the
PCIe x4 (27), M.2 (28) and PCIe x16 (29) slots.

[2]:
https://download.gigabyte.com/FileList/Manual/server_manual_MC12-LE0_e_v1.0=
.pdf?v=3D24c023a8081dd64c15be33bf2abf5220

Andrew
