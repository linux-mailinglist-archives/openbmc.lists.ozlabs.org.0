Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 356168D1088
	for <lists+openbmc@lfdr.de>; Tue, 28 May 2024 01:21:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=jKKL1Mix;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpBNX1cySz79WC
	for <lists+openbmc@lfdr.de>; Tue, 28 May 2024 09:16:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=jKKL1Mix;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=89.163.150.210; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
Received: from truschnigg.info (truschnigg.info [89.163.150.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vp3Zg0tCWz3ft7
	for <openbmc@lists.ozlabs.org>; Tue, 28 May 2024 04:09:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1716833381;
	bh=J8/N0mKmDlaxzCX7I7KGPD1ab7vPbtUfYguVb7Ndd10=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=jKKL1Mix3XIUKymx72jV9LVKB0CR6xDll0IuY7cIVDVcU9d3jByKiTG22RudqYn/J
	 RVaLvAOKruWCEq2hwtoJ73zFn1M8hjjLvD8fJYipkEsMGFH5tjiTFT/bkV1r7/o/ot
	 GAbI0pwmRGBlSK/9xlEtXGAf0/HEI7wKyQ0jSyIk9wKnkT0tUOtScVbv4uGsiB1aid
	 tvhaRBV6BY5EWiG7fMvBjEnyDPh03XomwEr2KAwUIHkZ0yLHQeop8htoKBt2dXc7s+
	 l0tALuILKuZetC93fSyzYwaETJg79/cErX0SFJ2y+HyuAtLk8oI5pBM3AEgI0/KLAH
	 Ih1EgFwu5bTCg==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:1eb7:2cff:fe02:8261])
	by truschnigg.info (Postfix) with ESMTPSA id 6265020149
	for <openbmc@lists.ozlabs.org>; Mon, 27 May 2024 18:09:41 +0000 (UTC)
Date: Mon, 27 May 2024 20:09:38 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 -
 questions
Message-ID: <ZlTMYkCZhXmRb1av@vault.lan>
References: <ZkuJNJ9kFrRS3mQF@vault.lan>
 <5e89654a02e2f870b71700c8cd75c2ef371fb579.camel@codeconstruct.com.au>
 <ZkzUX9JPPGAtNa2d@vault.lan>
 <640ed3fcae859ef35f3c57fad6c2f39400d6ef0a.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e/dwl04QfXl3oERu"
Content-Disposition: inline
In-Reply-To: <640ed3fcae859ef35f3c57fad6c2f39400d6ef0a.camel@codeconstruct.com.au>
X-Mailman-Approved-At: Tue, 28 May 2024 09:15:58 +1000
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


--e/dwl04QfXl3oERu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again, dear list members!

I've spent some time with my/Gigabyte's/AMI's AST2500 today, and I might ha=
ve
messed it up for good in the process, unwillingly. However, the result might
also present a fresh opportunity - I reall do not know! :) But first things
first!

Because I could not find any documentation about potantial OpenBMC nfsroot
support, I decided to "just try it", with unforseen consequences (anyone
remember Half-Life? :)) Since `picocom` was kind enough to preserve a sessi=
on
log of the whole ordeal, the excerpt below should contain the gist of how I
messed up:


```

U-Boot 2013.07 (Mar 12 2024 - 14:08:49)

I2C:   ready
DRAM:  424 MiB
eSPI Handshake complete
OEM_BOARD_INIT - Start (BMC)
LPC mode
OEM_BOARD_INIT - End
Flash: Found SPI Chip Micron/Numonyx N25Q512A(0x20ba) 2x I/O READ, NORMAL W=
RITE
64 MiB
MMC:  =20
Net:   RTL8211E, EEECR =3D 0x06
RTL8211E, EEEAR =3D 0x00
RTL8211E, EEELPAR =3D 0x06
RTL8211E, LACR =3D 0xc1
RTL8211E, LCR =3D 0x9742
ast_eth0, ast_eth1
DRAM ECC enabled
Hit any key to stop autoboot:  0=20
AST2500EVB>set autoload no
AST2500EVB>dhcp
BOOTP broadcast 1
[...]
BOOTP broadcast 25

Retry count exceeded; starting again
BOOTP broadcast 1
BOOTP broadcast 2
DHCP client bound to address 172.18.3.62
AST2500EVB>tftp 0x83000000 172.18.3.199:uboot
Using ast_eth1 device
TFTP from server 172.18.3.199; our IP address is 172.18.3.62
Filename 'uboot'.
Load address: 0x83000000
Loading: #################################################################
         #########
         366.7 KiB
done
Bytes transferred =3D 375501 (5bacd hex)
AST2500EVB>go 0x83000000
## Starting application at 0x83000000 ...


U-Boot 2019.04 (Mar 25 2024 - 04:43:19 +0000)

SOC : AST2500-A2=20
RST : WDT1=20
RST : WDT3 - Boot
LPC Mode : SIO:Disable=20
Eth : MAC0: RMII/NCSI, , MAC1: RGMII,=20
Model: AST2500 EVB
DRAM:  424 MiB (capacity:512 MiB, VGA:32 MiB, ECC:on, ECC size:424 MiB)
MMC:   sdhci_slot0@100: 0, sdhci_slot1@200: 1
Loading Environment from SPI Flash... SF: Detected n25q512ax3 with page siz=
e 256 Bytes, erase size 4 KiB, total 64 MiB
*** Warning - bad CRC, using default environment

In:    serial@1e784000
Out:   serial@1e784000
Err:   serial@1e784000
Net:  =20
Warning: ethernet@1e660000 (eth0) using random MAC address - 56:4b:8e:16:48=
:eb
eth0: ethernet@1e660000
Warning: ethernet@1e680000 (eth1) using random MAC address - 32:f3:07:0a:d2=
:ad
, eth1: ethernet@1e680000
Hit any key to stop autoboot:  0=20
ast# setenv ethact ethernet@1e680000
ast# setenv autoload no
ast# dhcp
ethernet@1e680000: link up, 1000 Mbps full-duplex mac:32:f3:07:0a:d2:ad
BOOTP broadcast 1
BOOTP broadcast 2
BOOTP broadcast 3
BOOTP broadcast 4
DHCP client bound to address 172.18.3.83 (3007 ms)
ast# tftpboot 0x84000000 172.18.3.199:fit.bin
ethernet@1e680000: link up, 1000 Mbps full-duplex mac:32:f3:07:0a:d2:ad
Using ethernet@1e680000 device
TFTP from server 172.18.3.199; our IP address is 172.18.3.83
Filename 'fit.bin'.
Load address: 0x84000000
Loading: #################################################################
         #######################################
         5.6 MiB/s
done
Bytes transferred =3D 4375688 (42c488 hex)
ast# setenv bootargs console=3DttyS4,115200n8 root=3D/dev/nfs rootfstype=3D=
nfs ip=3D172.18.3.173:172.18.3.138:172.18.3.254:255.255.255.0:bmctest:eth1:=
off:172.18.3.254::172.18.3.254 nfsroot=3D172.18.3.138:/,mountport=3D13337
ast# bootm 0x84000000
## Loading kernel from FIT Image at 84000000 ...
   Using 'conf-aspeed-ast2500-evb.dtb' configuration
   Trying 'kernel-1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x84000118
     Data Size:    3257440 Bytes =3D 3.1 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: 0x80001000
     Entry Point:  0x80001000
     Hash algo:    sha256
     Hash value:   0c874e335b61b661a7f1d638258ee1652728f021921b74bdcbad2bbb=
4ceef3f9
   Verifying Hash Integrity ... sha256+ OK
## Loading ramdisk from FIT Image at 84000000 ...
   Using 'conf-aspeed-ast2500-evb.dtb' configuration
   Trying 'ramdisk-1' ramdisk subimage
     Description:  obmc-phosphor-initramfs
     Type:         RAMDisk Image
     Compression:  uncompressed
     Data Start:   0x84322138
     Data Size:    1088964 Bytes =3D 1 MiB
     Architecture: ARM
     OS:           Linux
     Load Address: unavailable
     Entry Point:  unavailable
     Hash algo:    sha256
     Hash value:   94cc4badfdacec0b053b68954c69c55af5e50b3d8bc15b2852005fd6=
c84c238f
   Verifying Hash Integrity ... sha256+ OK
## Loading fdt from FIT Image at 84000000 ...
   Using 'conf-aspeed-ast2500-evb.dtb' configuration
   Trying 'fdt-aspeed-ast2500-evb.dtb' fdt subimage
     Description:  Flattened Device Tree blob
     Type:         Flat Device Tree
     Compression:  uncompressed
     Data Start:   0x8431b68c
     Data Size:    27103 Bytes =3D 26.5 KiB
     Architecture: ARM
     Hash algo:    sha256
     Hash value:   ca0066dfb087e1b1e022dec0c9aef3ac1c1ac350a49f5959e056acf6=
4383b637
   Verifying Hash Integrity ... sha256+ OK
   Booting using the fdt blob at 0x8431b68c
   Loading Kernel Image ... OK
   Loading Ramdisk to 8fef6000, end 8ffffdc4 ... OK
   Loading Device Tree to 8feec000, end 8fef59de ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.6.30-f013890-00167-gf013890407d8 (oe-user@oe=
-host) (arm-openbmc-linux-gnueabi-gcc (GCC) 13.2.0, GNU ld (GNU Binutils) 2=
=2E42.0.20240216) #1 Mon May 13 00:55:18 UTC 2024
[    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7=
), cr=3D00c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing in=
struction cache
[    0.000000] OF: fdt: Machine model: AST2500 EVB
[    0.000000] Memory policy: Data cache writeback
[    0.000000] Reserved memory: created CMA memory pool at 0x99000000, size=
 16 MiB
[    0.000000] OF: reserved mem: initialized node framebuffer, compatible i=
d shared-dma-pool
[    0.000000] OF: reserved mem: 0x99000000..0x99ffffff (16384 KiB) map reu=
sable framebuffer
[    0.000000] cma: Reserved 16 MiB at 0x98000000 on node -1
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x000000009a7fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x000000009a7fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000009a7ff=
fff]
[    0.000000] Kernel command line: console=3DttyS4,115200n8 root=3D/dev/nf=
s rootfstype=3Dnfs ip=3D172.18.3.173:172.18.3.138:172.18.3.254:255.255.255.=
0:bmctest:eth1:off:172.18.3.254::172.18.3.254 nfsroot=3D172.18.3.138:/,moun=
tport=3D13337
[    0.000000] Unknown kernel command line parameters "ip=3D172.18.3.173:17=
2.18.3.138:172.18.3.254:255.255.255.0:bmctest:eth1:off:172.18.3.254::172.18=
=2E3.254 nfsroot=3D172.18.3.138:/,mountport=3D13337", will be passed to use=
r space.
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 byt=
es, linear)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 byte=
s, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 107696
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] Memory: 385236K/434176K available (7168K kernel code, 686K r=
wdata, 1664K rodata, 1024K init, 141K bss, 16172K reserved, 32768K cma-rese=
rved)
[    0.000000] SLUB: HWalign=3D32, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
[    0.000000] ftrace: allocating 24994 entries in 49 pages
[    0.000000] ftrace: allocated 49 pages with 3 groups
[    0.000000] trace event string verifier disabled
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] i2c controller registered, irq 17
[    0.000000] clocksource: FTTMR010-TIMER2: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 77222644334 ns
[    0.000004] sched_clock: 32 bits at 25MHz, resolution 40ns, wraps every =
86767015915ns
[    0.000079] Switching to timer-based delay loop, resolution 40ns
[    0.001275] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 49.50 BogoMIPS (lpj=3D247500)
[    0.001340] CPU: Testing write buffer coherency: ok
[    0.001456] pid_max: default: 32768 minimum: 301
[    0.011962] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, =
linear)
[    0.012029] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 by=
tes, linear)
[    0.027599] RCU Tasks Rude: Setting shift to 0 and lim to 1 rcu_task_cb_=
adjust=3D1.
[    0.028143] RCU Tasks Trace: Setting shift to 0 and lim to 1 rcu_task_cb=
_adjust=3D1.
[    0.028703] Setting up static identity map for 0x80100000 - 0x80100038
[    0.030465] ASPEED AST2500 rev A2 (04030303)
[    0.032008] devtmpfs: initialized
[    0.053913] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 19112604462750000 ns
[    0.053996] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.060628] pinctrl core: initialized pinctrl subsystem
[    0.065337] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.067525] DMA: preallocated 256 KiB pool for atomic coherent allocatio=
ns
[    0.070964] hw-breakpoint: found 6 breakpoint and 1 watchpoint registers.
[    0.071009] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.132580] mc: Linux media interface: v0.10
[    0.132897] videodev: Linux video capture interface: v2.00
[    0.133060] pps_core: LinuxPPS API ver. 1 registered
[    0.133085] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.133161] PTP clock support registered
[    0.142848] clocksource: Switched to clocksource FTTMR010-TIMER2
[    0.174185] NET: Registered PF_INET protocol family
[    0.174819] IP idents hash table entries: 8192 (order: 4, 65536 bytes, l=
inear)
[    0.177558] tcp_listen_portaddr_hash hash table entries: 1024 (order: 0,=
 4096 bytes, linear)
[    0.177651] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.177714] TCP established hash table entries: 4096 (order: 2, 16384 by=
tes, linear)
[    0.177806] TCP bind hash table entries: 4096 (order: 3, 32768 bytes, li=
near)
[    0.178014] TCP: Hash tables configured (established 4096 bind 4096)
[    0.178317] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.178411] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, line=
ar)
[    0.179584] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.186070] Unpacking initramfs...
[    0.213300] workingset: timestamp_bits=3D30 max_order=3D17 bucket_order=
=3D0
[    0.214001] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.214060] jffs2: version 2.2. (SUMMARY)  =C2=A9 2001-2006 Red Hat, Inc.
[    0.263220] Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled
[    0.273969] printk: console [ttyS4] disabled
[    0.275132] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq =3D 20, base_=
baud =3D 1500000) is a 16550A
[    0.275268] printk: console [ttyS4] enabled
[    0.935649] timeriomem_rng 1e6e2078.hwrng: 32bits from 0x(ptrval) @ 1us
[    0.943808] aspeed_gfx 1e6e6000.display: assigned reserved memory node f=
ramebuffer
[    0.967762] random: crng init done
[    0.984563] [drm] Initialized aspeed-gfx-drm 1.0.0 20180319 for 1e6e6000=
=2Edisplay on minor 0
[    1.007161] aspeed_gfx 1e6e6000.display: [drm] fb0: aspeed-gfx-drmd fram=
e buffer device
[    1.055838] loop: module loaded
[    1.141860] spi-nor spi0.0: mt25ql512a (65536 Kbytes)
[    1.274576] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
[    1.346136] 5 fixed-partitions partitions found on MTD device bmc
[    1.352312] Creating 5 MTD partitions on "bmc":
[    1.356984] 0x000000000000-0x000000060000 : "u-boot"
[    1.385686] 0x000000060000-0x000000080000 : "u-boot-env"
[    1.406591] 0x000000080000-0x0000004c0000 : "kernel"
[    1.414849] 0x0000004c0000-0x000001c00000 : "rofs"
[    1.436205] 0x000001c00000-0x000002000000 : "rwfs"
[    1.448668] spi-nor spi1.0: unrecognized JEDEC id bytes: 00 03 00 00 00 =
00
[    1.463133] ftgmac100 1e660000.ethernet: Error applying setting, reverse=
 things back
[    1.471391] ftgmac100 1e660000.ethernet: Read MAC address 56:4b:8e:16:48=
:eb from chip
[    1.510983] Generic PHY 1e660000.ethernet--1:00: attached PHY driver (mi=
i_bus:phy_addr=3D1e660000.ethernet--1:00, irq=3DPOLL)
[    1.523568] ftgmac100 1e660000.ethernet eth0: irq 22, mapped at 96ea64c4
[    1.531266] ftgmac100 1e680000.ethernet: Read MAC address 32:f3:07:0a:d2=
:ad from chip
[    1.570263] RTL8211E Gigabit Ethernet 1e680000.ethernet--1:00: attached =
PHY driver (mii_bus:phy_addr=3D1e680000.ethernet--1:00, irq=3DPOLL)
[    1.583921] ftgmac100 1e680000.ethernet eth1: irq 23, mapped at ec62a3ab
[    1.746308] aspeed_vhub 1e6a0000.usb-vhub: Initialized virtual hub in US=
B2 mode
[    1.754377] Mass Storage Function, version: 2009/09/11
[    1.759586] LUN: removable file: (no medium)
[    1.764058] no file given for LUN0
[    1.767569] udc 1e6a0000.usb-vhub:p1: failed to start g_mass_storage: -22
[    1.774490] g_mass_storage: probe of gadget.0 failed with error -22
[    1.780961] Mass Storage Function, version: 2009/09/11
[    1.786234] LUN: removable file: (no medium)
[    1.790615] no file given for LUN0
[    1.794196] udc 1e6a0000.usb-vhub:p2: failed to start g_mass_storage: -22
[    1.801044] g_mass_storage: probe of gadget.1 failed with error -22
[    1.807565] Mass Storage Function, version: 2009/09/11
[    1.812765] LUN: removable file: (no medium)
[    1.817213] no file given for LUN0
[    1.820709] udc 1e6a0000.usb-vhub:p3: failed to start g_mass_storage: -22
[    1.827628] g_mass_storage: probe of gadget.2 failed with error -22
[    1.834157] Mass Storage Function, version: 2009/09/11
[    1.839354] LUN: removable file: (no medium)
[    1.843823] no file given for LUN0
[    1.847327] udc 1e6a0000.usb-vhub:p4: failed to start g_mass_storage: -22
[    1.854243] g_mass_storage: probe of gadget.3 failed with error -22
[    1.860710] Mass Storage Function, version: 2009/09/11
[    1.865982] LUN: removable file: (no medium)
[    1.870363] no file given for LUN0
[    1.873934] udc 1e6a0000.usb-vhub:p5: failed to start g_mass_storage: -22
[    1.880778] g_mass_storage: probe of gadget.4 failed with error -22
[    1.887290] UDC core: g_mass_storage: couldn't find an available UDC
[    1.894510] i2c_dev: i2c /dev entries driver
[    2.009530] aspeed-i2c-bus 1e78a100.i2c-bus: i2c bus 3 registered, irq 25
[    2.033760] aspeed-i2c-bus 1e78a300.i2c-bus: i2c bus 7 registered, irq 26
[    2.041576] Driver for 1-wire Dallas network protocol.
[    2.080643] NET: Registered PF_INET6 protocol family
[    2.114646] Segment Routing with IPv6
[    2.118479] In-situ OAM (IOAM) with IPv6
[    2.122989] NET: Registered PF_PACKET protocol family
[    2.128116] 8021q: 802.1Q VLAN Support v1.8
[    2.173478] printk: console [netcon0] enabled
[    2.177927] netconsole: network logging started
[    2.183614] clk: Disabling unused clocks
[    2.368191] Freeing initrd memory: 1064K
[    2.378419] Freeing unused kernel image (initmem) memory: 1024K
[    2.386528] Checked W+X mappings: passed, no W+X pages found
[    2.392272] Run /init as init process
rofs =3D mtd4 squashfs   rwfs =3D mtd5 jffs2
mount: mounting /dev/mtdblock4 on run/initramfs/ro failed: Invalid argument
[    3.427189] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00000000: 0x49f3 instead
[    3.436958] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x00000004: 0xe73d instead

[... XXX *many* more of those XXX at various offsets...]

[   10.907145] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not fou=
nd at 0x003f0024: 0x68b6 instead
[   10.916740] jffs2: Further such events for this erase block will not be =
printed
[   10.934585] jffs2: Cowardly refusing to erase blocks on filesystem with =
no valid JFFS2 nodes
[   10.943154] jffs2: empty_blocks 0, bad_blocks 0, c->nr_blocks 64
mount: mounting /dev/mtdblock5 on run/initramfs/rw failed: Input/output err=
or

Mounting read-write /dev/mtdblock5 filesystem failed.  Please fix and run
        mount /dev/mtdblock5 run/initramfs/rw -t jffs2 -o rw
or perform a factory reset with the clean-rwfs-filesystem option.
Fatal error, tri[   10.990385] Kernel panic - not syncing: Attempted to kil=
l init! exitcode=3D0x00000100
[   10.999145] CPU: 0 PID: 1 Comm: init Not tainted 6.6.30-f013890-00167-gf=
013890407d8 #1
[   11.007102] Hardware name: Generic DT based system
[   11.011934]  unwind_backtrace from show_stack+0x18/0x1c
[   11.017265]  show_stack from dump_stack_lvl+0x24/0x2c
[   11.022404]  dump_stack_lvl from panic+0xf4/0x30c
[   11.027180]  panic from do_exit+0x8a8/0x8d0
[   11.031441]  do_exit from do_group_exit+0x40/0x84
[   11.036209]  do_group_exit from __wake_up_parent+0x0/0x1c


U-Boot 2013.07 (Mar 12 2024 - 14:08:49)

I2C:   ready
DRAM:  424 MiB
eSPI Handshake complete
OEM_BOARD_INIT - Start (BMC)
LPC mode
OEM_BOARD_INIT - End
Flash: Found SPI Chip Micron/Numonyx N25Q512A(0x20ba) 2x I/O READ, NORMAL W=
RITE
64 MiB
MMC:  =20
*** Warning - bad CRC, using default environment

Un-Protected 1 sectors
Erasing Flash...
Erasing sector  4 ... ok.
Erased 1 sectors
Writing to Flash... done
Protected 1 sectors
Net:   RTL8211E, EEECR =3D 0x06
RTL8211E, EEEAR =3D 0x00
RTL8211E, EEELPAR =3D 0x06
RTL8211E, LACR =3D 0xc1
RTL8211E, LCR =3D 0x9742
ast_eth0, ast_eth1
DRAM ECC enabled
Hit any key to stop autoboot:  0=20
AST2500EVB>
```

So afaiui my attempt misfired, the kernel panic'd, reset the system, and
then... u-boot kinda decided to erase flash sector 4 (why?), which seems to=
 have contained something important for (the original u-boot from Gigabyte =
on SPI flash) to boot. I did not realize that and cut power, waiting for a =
few secs before powering up again... only to notice that my UART serial con=
sole was staying dark this time. Meanwhile, the BMC NIC LEDs blink in a str=
ange loop that hints at some restart procedure that is repeated ad nauseam.

To my luck, however, the host itself still willingly boots into the live sy=
stem that I had set up before, but with a subtle difference once it's loade=
d: The AST2500 seems to be in a state much more amenable to Andrew's `culve=
rt` utility now, which reports its neighborhood BMC like this now:

```
root@grml ~ # /tmp/culvert probe
[*] failed to initialise devmem bridge: -1
[*] Accessing the BMC's AHB via the p2a bridge
debug:  Permissive
        Debug UART port: UART5
xdma:   Restricted
        BMC: Disabled
        VGA: Enabled
        XDMA on VGA: Enabled
        XDMA is constrained: Yes
p2a:    Permissive
        BMC: Disabled
        VGA: Enabled
        MMIO on VGA: Enabled
        [0x00000000 - 0x0fffffff]   Firmware: Writable
        [0x10000000 - 0x1fffffff]     SoC IO: Writable
        [0x20000000 - 0x2fffffff]  BMC Flash: Writable
        [0x30000000 - 0x3fffffff] Host Flash: Writable
        [0x40000000 - 0x5fffffff]   Reserved: Writable
        [0x60000000 - 0x7fffffff]   LPC Host: Writable
        [0x80000000 - 0xffffffff]       DRAM: Writable
ilpc:   Permissive
        SuperIO address: 0x2e
```

(Before my mishap, whenever I tried to run that command, all but `ilpc` yie=
lded
nothing, and even `ilpc` reported "Restricted" - none of which I know how to
interpret at all, by the way! :D)


So I guess I have at least six questions now:

1.) What happened when the kernel called it quits, u-boot reloaded and deci=
ded
to format some of its flash?

2.) Can I influence this behavior on my (spare) board before I try again?

3.) Can I restore the original firmware/SPI content on my board by any means
=66rom the now running host OS? If so, what way would you suggest I try fir=
st?

4.) Does having `culvert` have this new level of access have any new advant=
ages
or open possibilities that I should be aware of?

5.) Suppose I can restore the BMC's original SPI content and behavior - wha=
t's
a recommended way to have the TFPT'd kernel boot into an OpenBMC rootfs
*without* having it store on the BMC's main storage/overwriting SPI?

6.) Assuming this cannot be recovered in software - what are my chances of
identifying the SPI flash on my board as such, and re-writing its contents
using an affordable SPI programmer solution, given that I've never done
anything like this with hardware before? :^)

If any of you could answer me any of these, I would be very grateful indeed.
Thanks a lot for your time reading this far! :)

--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--e/dwl04QfXl3oERu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmZUzFwACgkQ95W3jMsY
fLUX4w/9HVRZdA7v7A6C2iMofoUSHVGJ/aqk/uhqetBB35sYRs2UaQYsJn6aJuc/
S8tjtTmY7JI4pipNOC2SjunPC4eCJfSSlwL7SaVgj7HeJigp1YofpAxduaGoxwCA
qGEzbVB24hZGQOKk47vuM0Zx8546t+PEpD/1EUczg6mspW/uY8nlo/3R0QcrhmvK
/gycFB04AF4E2i0JPWktTddtbyv0MlQAluRiYbT9uK12l0Gj+YEuP1F6N8MP6oOC
iIr6humOqWSrCTMypQuzBnoErQS3bxOQgjeBAsDxSkC0/Ct4ww9x3JMRUwumv4fa
ouXITEKC7pKVzukE8RVY1mHBRQmCBEu6KU38E1tr1gIZAtwQLuWwhklczNu15m31
VihTu06MTa2LgTNjlTIiHp3L0ZVltOuetJa5SXGWyRbyqsJ9G+wj0AfzNYpzLHfC
g1RrPQ+jpITK1BABat46zlvfv7atfdlJXzW+ximcpSgdgXlnZenbvLwWaeosidcx
bpNIvhJvyN6l9nF28wNdhwl3mpKKhfmjO0Rys3Y3gBG66jXPhzuyLzmIDUDrCu33
h2WaShSWcNhAX/yJc3h0dg4MKND4vNR9mOEaAXg+j9kSSAppoKz/Y5p/IjDKM3aB
OLwdxqJQNcdG40t36JkzkqnHJlv/o7snVKOrLzKS+l5HwaI7mUI=
=Wr/v
-----END PGP SIGNATURE-----

--e/dwl04QfXl3oERu--
