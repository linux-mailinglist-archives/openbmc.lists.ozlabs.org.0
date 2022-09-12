Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 871515B623B
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:33:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRJFZ1MMMz3bN6
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 06:33:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=l7RaDZ/L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=l7RaDZ/L;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRJF26QGNz2yZc
	for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 06:32:37 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id b21so9684973plz.7
        for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=2uVsG8qCA1QDt6vL2i8qsxjUjeGIQLH9TKMekrw0alw=;
        b=l7RaDZ/LOMYjsqUqQDyuew/P6Ofy6aaT2RJVyrau8/10Kfvm8KAyYIlipxJMyPFaG3
         B4bfimb5aA4CuBivdUdzKn9Tlu8yTsRjNbDF3lQ0p6doSaFtoa3idDBOPCj5/cmBq4rn
         utHLdRsUbJ8Mz4+IiqDzw+jho57qp6JqYEpBf+l7Y+QPcsTJMFsMF10I2EKR4MLCk/bQ
         nhPWDvYlmyENwDyu+AZaeabUkA0L0o5KN/4gPt62lEenjDXgbrD4weAi6p2ZQ/CLALgI
         Bj1FpzMOMj5QuF+OG4NzYGuzYdg571ZtyMmEEEGbUObc74OXTBZimOM56ks03BQzo+xB
         WJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=2uVsG8qCA1QDt6vL2i8qsxjUjeGIQLH9TKMekrw0alw=;
        b=CUHebjgjXLoL3i/S3hf2D0nFwR0iqB9FctUHxIkF13giax5QZdmQD58/KFy7iZX21T
         QUZMnP3LX6AjiBsbzvrlyJtakx6Mwj+22btemzD5sURrG6Enhj5Kj632F0KZTWgd9WYX
         MM+sOwPJeLR6wXc+oWZ73TMf+ThUgSJfgxvrefX/+ov/3qbP9i+a17HiBqHGiBY5xI0t
         e5IXM0AQw8Blqvc5AQrARK2ZJTWNPKejjY8mrTyQh0jqWeAciBnuVPwGTHSwwxgOqL5O
         ThHE3CJLCHTTt/KRZjOg39XaGPUC0gcyD/K/lQO35FTNp9BGO+bVGu44YOOmcJfF84ft
         IEUQ==
X-Gm-Message-State: ACgBeo01OwGxBKdHFZ/FnG7ku8VAB9Vxc86WoCVYfn4/rxr80HNkeKwB
	peoSKF1ERCzdQH/sZQs4/xYLehrI4cuQIBoHnTyXDicVJM62xQ==
X-Google-Smtp-Source: AA6agR4ql3Xs3meb/WeN5MERsvypMGW7x49W7IFNjkYvaacztOnsRqU1mLyRSwDxPnAnmu0xs1OY5ILY06AlXrcD/bw=
X-Received: by 2002:a17:90b:4b88:b0:202:e381:e643 with SMTP id
 lr8-20020a17090b4b8800b00202e381e643mr175813pjb.148.1663014752719; Mon, 12
 Sep 2022 13:32:32 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <edtanous@google.com>
Date: Mon, 12 Sep 2022 13:32:19 -0700
Message-ID: <CAH2-KxCPOjWm8KeLFJTa7ZdTD-yZ5Bit_Ua3Hb=0X+O+89t3+w@mail.gmail.com>
Subject: OpenBMC Boot time improvements
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000988a3405e880cbe1"
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

--000000000000988a3405e880cbe1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is anyone interested in boot time improvements?  I recently looked at my
system just to get a baseline, and it seems like there's some low hanging
fruit to be gained that could give us some significant speedups on the boot
process.  Is anyone looking at this kind of thing already?

My quick analysis from timing the serial log is below.  Total time to a
login is 95 seconds, which it seems like we could improve quite a bit.

First serial line printed to u-boot "hit any key" startup init is 3 seconds
3 seconds of countdown for "hit any key to stop autoboot".  I'm sure u-boot
has a way to disable that, so there's 3 seconds right there.
Decompressing the dtb, initramfs, and kernel images is seconds 5-14.  If
there's a way to optimize that better that u-bmc has implemented ahead of
us, that seems like an area for improvement that we could pull in.
Kernel starts at ~20 seconds, then 3.5 seconds of dead air... not sure
what's going on there.
A big 17 second pause between these two lines.  Not sure what that's about.
[25.443908 0.001845] [    2.294952] Driver for 1-wire Dallas network
protocol.
[42.321590 16.877682] [   19.191143] SPI driver bmp280 has no spi_device_id
for bosch,bmp085
6. Init script runs at 46 seconds, so we're getting into the realm of
"systemd problems" at ~50% of our boot time.
7. 71 seconds in, all the user-facing sockets are up, and the NIC comes up;
 So far as a user is concerned, the bmc is "up" (kinda), given that the
user facing services are socket activated.
8. 71-95, launching all the various backend system services.
9. 95 seconds in, services have finished launching, and a login prompt is
presented.

```
~/grabserial master =E2=9D=AF sudo python3 grabserial -v -d /dev/ttyUSB3 -b=
 115200
-f -w 8 -p N -s 1 -e 150 -t -m "DRAM Init-V12-DDR4"
Opening serial port /dev/ttyUSB3
115200:8N1:xonxoff=3D0:rtscts=3D0:rts=3D1:dtr=3D1
Program set to end in 150 seconds
Printing timing information for each line
Using pattern 'DRAM Init-V12-DDR4' to set base time
Use Control-C to stop...
[0.000001 0.000001]
[0.000531 0.000530] DRAM Init-V12-DDR4
[0.016045 0.016045] 0abc1-4Gb-Done
[0.271901 0.255857] Read margin-DL:0.3647/DH:0.3745 CK (min:0.30)
[1.971260 1.699359]
[1.971447 0.000186]
[1.971544 0.000097] U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)
[1.973912 0.002369]
[1.973960 0.000047]        Watchdog enabled
[1.974791 0.000832] DRAM:  496 MiB
[2.850693 0.875902] Flash: 128 MiB
[2.962520 0.111827] In:    serial
[3.000751 0.038230] Out:   serial
[3.001596 0.000845] Err:   serial
[3.002095 0.000499] Net:   MAC0 : RMII/NCSI
[3.002880 0.000785] MAC1 : RGMII
[3.003157 0.000277] FTGMAC100#0
[3.003447 0.000290] Error: FTGMAC100#0 address not set.
[3.004289 0.000842] , FTGMAC100#1
[3.004628 0.000339] Error: FTGMAC100#1 address not set.
[3.005417 0.000789]
[3.005442 0.000025] Hit any key to stop autoboot:  0
[5.037966 2.032524] ## Loading kernel from FIT Image at 20080000 ...
[5.039975 0.002010]    Using 'conf-aspeed-bmc-tyan-s7106.dtb' configuration
[5.041790 0.001814]    Trying 'kernel-1' kernel subimage
[5.042722 0.000932]      Description:  Linux kernel
[5.043504 0.000782]      Type:         Kernel Image
[5.044270 0.000766]      Compression:  uncompressed
[5.045040 0.000770]      Data Start:   0x20080128
[5.045763 0.000723]      Data Size:    3168888 Bytes =3D 3 MiB
[5.046716 0.000954]      Architecture: ARM
[5.047274 0.000558]      OS:           Linux
[5.047869 0.000595]      Load Address: 0x80001000
[5.048530 0.000660]      Entry Point:  0x80001000
[5.049099 0.000569]      Hash algo:    sha256
[5.049564 0.000465]      Hash value:
fed4aab9de8bc0c04cb8a180da7a817b4c0e7db8c9608e1f59a0c7385eccd7a6
[5.059791 0.010227]    Verifying Hash Integrity ... sha256+ OK
[11.582735 6.522943] ## Loading ramdisk from FIT Image at 20080000 ...
[11.633128 0.050394]    Using 'conf-aspeed-bmc-tyan-s7106.dtb' configuratio=
n
[11.634600 0.001472]    Trying 'ramdisk-1' ramdisk subimage
[11.635495 0.000895]      Description:  obmc-phosphor-initramfs
[11.636475 0.000980]      Type:         RAMDisk Image
[11.637248 0.000773]      Compression:  uncompressed
[11.637960 0.000712]      Data Start:   0x2038d038
[11.638650 0.000690]      Data Size:    1096840 Bytes =3D 1 MiB
[11.639495 0.000845]      Architecture: ARM
[11.639993 0.000498]      OS:           Linux
[11.640573 0.000579]      Load Address: unavailable
[11.641293 0.000721]      Entry Point:  unavailable
[11.642033 0.000740]      Hash algo:    sha256
[11.642632 0.000599]      Hash value:
98744c2598168b3a123ef8760636a8c5e005948e67191646c017e877e7f86e51
[11.654930 0.012298]    Verifying Hash Integrity ... sha256+ OK
[13.909357 2.254427] ## Loading fdt from FIT Image at 20080000 ...
[13.967636 0.058279]    Using 'conf-aspeed-bmc-tyan-s7106.dtb' configuratio=
n
[13.969544 0.001907]    Trying 'fdt-aspeed-bmc-tyan-s7106.dtb' fdt subimage
[13.970586 0.001042]      Description:  Flattened Device Tree blob
[13.971422 0.000836]      Type:         Flat Device Tree
[13.972072 0.000650]      Compression:  uncompressed
[13.972657 0.000585]      Data Start:   0x20385cb8
[13.973207 0.000550]      Data Size:    29362 Bytes =3D 28.7 KiB
[13.973970 0.000763]      Architecture: ARM
[13.974391 0.000420]      Hash algo:    sha256
[13.974972 0.000582]      Hash value:
66368a4557754ea3287198f0d2b75f98bf6a6e17a32c2a9bcc8a574b2dbe5a06
[13.976801 0.001829]    Verifying Hash Integrity ... sha256+ OK
[14.045789 0.068988]    Booting using the fdt blob at 0x20385cb8
[14.047312 0.001523]    Loading Kernel Image ... OK
[18.347361 4.300049]    Loading Ramdisk to 9ea90000, end 9eb9bc88 ... OK
[19.834330 1.486969]    Loading Device Tree to 9ea85000, end 9ea8f2b1 ... O=
K
[19.914132 0.079802]
[19.914196 0.000063] Starting kernel ...
[19.930654 0.016458]
[23.488077 3.557423] [    0.000000] Booting Linux on physical CPU 0x0
[23.490190 0.002112] [    0.000000] Linux version 5.15.59-51fd11b
(oe-user@oe-host) (arm-openbmc-linux-gnueabi-gcc (GCC) 12.1.0, GNU ld (GNU
Binutils) 2.38.20220623) #1 Thu Aug 4 03:28:18 UTC 2022
[23.515911 0.025721] [    0.000000] CPU: ARMv6-compatible processor
[410fb767] revision 7 (ARMv7), cr=3D00c5387d
[23.522071 0.006160] [    0.000000] CPU: PIPT / VIPT nonaliasing data
cache, VIPT nonaliasing instruction cache
[23.550850 0.028779] [    0.000000] OF: fdt: Machine model: Tyan S7106 BMC
[23.552944 0.002095] [    0.000000] Memory policy: Data cache writeback
[23.554374 0.001430] [    0.000000] Reserved memory: created CMA memory
pool at 0x9d000000, size 16 MiB
[23.604916 0.050542] [    0.000000] OF: reserved mem: initialized node
framebuffer, compatible id shared-dma-pool
[23.608081 0.003165] [    0.000000] cma: Reserved 16 MiB at 0x9c000000
[23.609227 0.001147] [    0.000000] Zone ranges:
[23.609886 0.000659] [    0.000000]   Normal   [mem
0x0000000080000000-0x000000009effffff]
[23.611526 0.001640] [    0.000000] Movable zone start for each node
[23.675950 0.064424] [    0.000000] Early memory node ranges
[23.677739 0.001789] [    0.000000]   node   0: [mem
0x0000000080000000-0x00000000987effff]
[23.680125 0.002386] [    0.000000]   node   0: [mem
0x00000000987f0000-0x00000000987fffff]
[23.681552 0.001427] [    0.000000]   node   0: [mem
0x0000000098800000-0x000000009effffff]
[23.682810 0.001258] [    0.000000] Initmem setup node 0 [mem
0x0000000080000000-0x000000009effffff]
[23.684468 0.001658] [    0.000000] Built 1 zonelists, mobility grouping
on.  Total pages: 125984
[23.706800 0.022331] [    0.000000] Kernel command line:
console=3DttyS4,115200n8 root=3D/dev/ram rw
[23.709396 0.002597] [    0.000000] Dentry cache hash table entries: 65536
(order: 6, 262144 bytes, linear)
[23.735743 0.026347] [    0.000000] Inode-cache hash table entries: 32768
(order: 5, 131072 bytes, linear)
[23.738499 0.002756] [    0.000000] mem auto-init: stack:all(zero), heap
alloc:off, heap free:off
[23.765738 0.027239] [    0.000000] Memory: 457284K/507904K available
(8192K kernel code, 666K rwdata, 1560K rodata, 1024K init, 156K bss, 17852K
reserved, 32768K cma-reserved)
[23.819745 0.054007] [    0.000000] SLUB: HWalign=3D32, Order=3D0-3,
MinObjects=3D0, CPUs=3D1, Nodes=3D1
[23.822114 0.002369] [    0.000000] ftrace: allocating 23856 entries in 47
pages
[23.823525 0.001412] [    0.000000] ftrace: allocated 47 pages with 5 group=
s
[23.824556 0.001031] [    0.000000] trace event string verifier disabled
[23.825776 0.001220] [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated
irqs: 16
[23.845754 0.019979] [    0.000000] i2c controller registered, irq 17
[23.847347 0.001592] [    0.000000] clocksource: FTTMR010-TIMER2: mask:
0xffffffff max_cycles: 0xffffffff, max_idle_ns: 77222644334 ns
[23.875768 0.028421] [    0.000004] sched_clock: 32 bits at 24MHz,
resolution 40ns, wraps every 86767015915ns
[23.878921 0.003153] [    0.000097] Switching to timer-based delay loop,
resolution 40ns
[23.944690 0.065770] [    0.000886] Calibrating delay loop (skipped), value
calculated using timer frequency.. 49.50 BogoMIPS (lpj=3D247500)
[23.948623 0.003933] [    0.000967] pid_max: default: 32768 minimum: 301
[23.949579 0.000956] [    0.003104] Mount-cache hash table entries: 1024
(order: 0, 4096 bytes, linear)
[23.950998 0.001419] [    0.003192] Mountpoint-cache hash table entries:
1024 (order: 0, 4096 bytes, linear)
[23.952525 0.001527] [    0.006434] CPU: Testing write buffer coherency: ok
[23.995660 0.043134] [    0.009700] Setting up static identity map for
0x80100000 - 0x80100038
[23.998464 0.002805] [    0.011248] ASPEED AST2500 rev A2 (04030303)
[23.999575 0.001111] [    0.012611] devtmpfs: initialized
[24.000401 0.000826] [    0.035630] clocksource: jiffies: mask: 0xffffffff
max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[24.044628 0.044227] [    0.035733] futex hash table entries: 256 (order:
-1, 3072 bytes, linear)
[24.047093 0.002465] [    0.041939] pinctrl core: initialized pinctrl
subsystem
[24.048455 0.001362] [    0.045095] NET: Registered PF_NETLINK/PF_ROUTE
protocol family
[24.049654 0.001199] [    0.047578] DMA: preallocated 256 KiB pool for
atomic coherent allocations
[24.115643 0.065989] [    0.050560] hw-breakpoint: found 6 breakpoint and 1
watchpoint registers.
[24.118448 0.002805] [    0.050632] hw-breakpoint: maximum watchpoint size
is 4 bytes.
[24.119609 0.001161] [    0.127577] mc: Linux media interface: v0.10
[24.120438 0.000829] [    0.127769] videodev: Linux video capture
interface: v2.00
[24.121494 0.001056] [    0.128051] pps_core: LinuxPPS API ver. 1 registere=
d
[24.122430 0.000937] [    0.128105] pps_core: Software ver. 5.3.6 -
Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[24.140529 0.018099] [    0.128212] PTP clock support registered
[24.142585 0.002055] [    0.132611] clocksource: Switched to clocksource
FTTMR010-TIMER2
[24.146256 0.003671] [    0.224804] NET: Registered PF_INET protocol family
[24.167846 0.021590] [    0.225299] IP idents hash table entries: 8192
(order: 4, 65536 bytes, linear)
[24.196360 0.028513] [    0.226947] tcp_listen_portaddr_hash hash table
entries: 512 (order: 0, 4096 bytes, linear)
[24.199464 0.003104] [    0.227069] Table-perturb hash table entries: 65536
(order: 6, 262144 bytes, linear)
[24.226350 0.026886] [    0.227152] TCP established hash table entries:
4096 (order: 2, 16384 bytes, linear)
[24.228337 0.001987] [    0.227259] TCP bind hash table entries: 4096
(order: 2, 16384 bytes, linear)
[24.274405 0.046068] [    0.227349] TCP: Hash tables configured
(established 4096 bind 4096)
[24.277254 0.002849] [    0.227642] UDP hash table entries: 256 (order: 0,
4096 bytes, linear)
[24.279681 0.002427] [    0.227756] UDP-Lite hash table entries: 256
(order: 0, 4096 bytes, linear)
[24.281286 0.001605] [    0.228521] NET: Registered PF_UNIX/PF_LOCAL
protocol family
[24.300313 0.019027] [    0.232052] Unpacking initramfs...
[24.301608 0.001295] [    0.242800] workingset: timestamp_bits=3D30
max_order=3D17 bucket_order=3D0
[24.303753 0.002145] [    0.257235] squashfs: version 4.0 (2009/01/31)
Phillip Lougher
[24.368598 0.064845] [    0.257303] jffs2: version 2.2. (SUMMARY)
2001-2006 Red Hat, Inc.
[24.370530 0.001932] [    0.275423] NET: Registered PF_ALG protocol family
[24.371767 0.001237] [    0.279878] ipmi-bt-host 1e789140.ibt: Found bt bmc
device
[24.373178 0.001411] [    0.280829] ipmi-bt-host 1e789140.ibt: Using IRQ 34
[24.374452 0.001274] [    0.282479] ast-kcs-bmc 1e789024.kcs: Initialised
raw client for channel 1
[24.419349 0.044897] [    0.283020] ast-kcs-bmc 1e789024.kcs: Initialised
IPMI client for channel 1
[24.422025 0.002676] [    0.283089] ast-kcs-bmc 1e789024.kcs: Initialised
channel 1 at 0xca8
[24.423269 0.001244] [    0.294041] ast-kcs-bmc 1e78902c.kcs: Initialised
raw client for channel 3
[24.424783 0.001514] [    0.294499] ast-kcs-bmc 1e78902c.kcs: Initialised
IPMI client for channel 3
[24.446348 0.021565] [    0.294569] ast-kcs-bmc 1e78902c.kcs: Initialised
channel 3 at 0xca2
[24.449583 0.003235] [    0.300129] aspeed-uart-routing
1e78909c.uart-routing: module loaded
[24.476207 0.026623] [    0.303416] Serial: 8250/16550 driver, 6 ports, IRQ
sharing enabled
[24.478619 0.002412] [    0.317481] 1e787000.serial: ttyS5 at MMIO
0x1e787000 (irq =3D 34, base_baud =3D 1546875) is a ASPEED VUART
[24.511201 0.032583] [    0.319809] 1e783000.serial: ttyS0 at MMIO
0x1e783000 (irq =3D 32, base_baud =3D 1500000) is a 16550A
[24.514808 0.003607] [    0.321423] 1e784000.serial: ttyS4 at MMIO
0x1e784000 (irq =3D 33, base_baud =3D 1500000) is a 16550A
[24.527183 0.012376] [    1.393553] printk: console [ttyS4] enabled
[24.528688 0.001505] [    1.399759] 1e78d000.serial: ttyS1 at MMIO
0x1e78d000 (irq =3D 35, base_baud =3D 1500000) is a 16550A
[24.571180 0.042492] [    1.424074] 1e78e000.serial: ttyS2 at MMIO
0x1e78e000 (irq =3D 36, base_baud =3D 1500000) is a 16550A
[24.592127 0.020947] [    1.444561] 1e78f000.serial: ttyS3 at MMIO
0x1e78f000 (irq =3D 37, base_baud =3D 1500000) is a 16550A
[24.620174 0.028047] [    1.465512] timeriomem_rng 1e6e2078.hwrng: 32bits
from 0x(ptrval) @ 1us
[24.622947 0.002773] [    1.473446] aspeed_gfx 1e6e6000.display: assigned
reserved memory node framebuffer
[24.636189 0.013241] [    1.503570] random: crng init done
[24.652126 0.015937] [    1.524490] [drm] Initialized aspeed-gfx-drm 1.0.0
20180319 for 1e6e6000.display on minor 0
[24.701060 0.048934] [    1.553274] aspeed_gfx 1e6e6000.display: [drm] fb0:
aspeed-gfx-drmd frame buffer device
[24.733143 0.032083] [    1.595158] loop: module loaded
[24.797137 0.063995] [    1.659126] spi-nor spi0.0: mx66l1g45g (131072
Kbytes)
[24.939029 0.141891] [    1.791345] spi-aspeed-smc 1e620000.spi: CE0 read
buswidth:2 [0x203c0641]
[25.098046 0.159017] [    1.945137] 5 fixed-partitions partitions found on
MTD device bmc
[25.101257 0.003211] [    1.951289] Creating 5 MTD partitions on "bmc":
[25.102476 0.001219] [    1.955967] 0x000000000000-0x000000060000 : "u-boot=
"
[25.113789 0.011313] [    1.984254] 0x000000060000-0x000000080000 :
"u-boot-env"
[25.138113 0.024324] [    1.992205] 0x000000080000-0x0000004c0000 : "kernel=
"
[25.164872 0.026759] [    2.015047] 0x0000004c0000-0x000001c00000 : "rofs"
[25.168555 0.003682] [    2.022386] 0x000001c00000-0x000002000000 : "rwfs"
[25.234758 0.066204] [    2.047580] spi-nor spi1.0: unrecognized JEDEC id
bytes: ff ff ff ff ff ff
[25.237092 0.002333] [    2.054602] spi-nor: probe of spi1.0 failed with
error -2
[25.237974 0.000883] [    2.065146] ftgmac100 1e660000.ethernet: Generated
random MAC address ee:f3:83:36:82:59
[25.238928 0.000954] [    2.073315] ftgmac100 1e660000.ethernet: Using NCSI
interface
[25.239958 0.001030] [    2.080277] ftgmac100 1e660000.ethernet eth0: irq
20, mapped at fbb6b239
[25.241289 0.001331] [    2.087826] ftgmac100 1e680000.ethernet: Generated
random MAC address 2e:e3:14:ec:62:ff
[25.243061 0.001772] [    2.105583] RTL8211E Gigabit Ethernet
1e680000.ethernet--1:00: attached PHY driver
(mii_bus:phy_addr=3D1e680000.ethernet--1:00, irq=3DPOLL)
[25.271468 0.028407] [    2.119043] ftgmac100 1e680000.ethernet eth1: irq
21, mapped at dd746f2b
[25.283708 0.012240] [    2.154169] Freeing initrd memory: 1072K
[25.334315 0.050606] [    2.159954] aspeed_vhub 1e6a0000.usb-vhub:
Initialized virtual hub in USB2 mode
[25.337081 0.002767] [    2.167969] Mass Storage Function, version:
2009/09/11
[25.338294 0.001213] [    2.173247] LUN: removable file: (no medium)
[25.339165 0.000871] [    2.177613] no file given for LUN0
[25.339808 0.000643] [    2.181098] udc 1e6a0000.usb-vhub:p1: failed to
start g_mass_storage: -22
[25.341107 0.001299] [    2.188670] i2c_dev: i2c /dev entries driver
[25.341952 0.000845] [    2.194845] aspeed-i2c-bus 1e78a040.i2c-bus: i2c
bus 0 registered, irq 38
[25.343256 0.001304] [    2.203024] aspeed-i2c-bus 1e78a080.i2c-bus: i2c
bus 1 registered, irq 39
[25.390362 0.047106] [    2.212682] at24 2-0050: 32768 byte 24c256 EEPROM,
writable, 1 bytes/write
[25.392269 0.001907] [    2.219811] aspeed-i2c-bus 1e78a0c0.i2c-bus: i2c
bus 2 registered, irq 40
[25.394077 0.001808] [    2.229401] at24 3-0050: 256 byte 24c02 EEPROM,
writable, 1 bytes/write
[25.395848 0.001771] [    2.237783] at24 3-0051: 256 byte 24c02 EEPROM,
writable, 1 bytes/write
[25.397618 0.001771] [    2.245540] aspeed-i2c-bus 1e78a100.i2c-bus: i2c
bus 3 registered, irq 41
[25.399389 0.001770] [    2.253818] aspeed-i2c-bus 1e78a140.i2c-bus: i2c
bus 4 registered, irq 42
[25.401156 0.001767] [    2.261963] aspeed-i2c-bus 1e78a180.i2c-bus: i2c
bus 5 registered, irq 43
[25.438266 0.037110] [    2.270210] aspeed-i2c-bus 1e78a1c0.i2c-bus: i2c
bus 6 registered, irq 44
[25.440232 0.001966] [    2.278519] aspeed-i2c-bus 1e78a300.i2c-bus: i2c
bus 7 registered, irq 45
[25.442063 0.001831] [    2.286725] aspeed-i2c-bus 1e78a340.i2c-bus: i2c
bus 8 registered, irq 46
[25.443908 0.001845] [    2.294952] Driver for 1-wire Dallas network
protocol.
[42.321590 16.877682] [   19.191143] SPI driver bmp280 has no spi_device_id
for bosch,bmp085
[42.369245 0.047655] [   19.202063] NET: Registered PF_INET6 protocol famil=
y
[42.370710 0.001465] [   19.210275] Segment Routing with IPv6
[42.371670 0.000960] [   19.214194] In-situ OAM (IOAM) with IPv6
[42.372684 0.001014] [   19.218587] NET: Registered PF_PACKET protocol
family
[42.373994 0.001310] [   19.223826] 8021q: 802.1Q VLAN Support v1.8
[42.375069 0.001075] [   19.240013] printk: console [netcon0] enabled
[42.417406 0.042337] [   19.244511] netconsole: network logging started
[42.418871 0.001465] [   19.255290] Freeing unused kernel image (initmem)
memory: 1024K
[42.420469 0.001598] [   19.265290] Checked W+X mappings: passed, no W+X
pages found
[42.421951 0.001482] [   19.271013] Run /init as init process
[43.119224 0.697273] rofs =3D mtd4 squashfs rwfs =3D mtd5 jffs2
[43.346902 0.227678] [   20.193806] jffs2: notice: (101)
jffs2_build_xattr_subsystem: complete building xattr subsystem, 26 of
xdatum (15 unchecked, 7 orphan) and 34 of xref (8 dead, 0 orphan) found.
[43.522817 0.175915] Tue Apr  5 23:02:44 UTC 2011
[43.551731 0.028914] [   20.397227] overlayfs: upper fs does not support
tmpfile.
[43.554043 0.002311] [   20.403610] overlayfs: upper fs does not support
RENAME_WHITEOUT.
[46.530198 2.976155] [   23.376894] systemd[1]: Current system time is
further ahead 15y after build time, but cannot correct: Invalid argument
[46.545993 0.015796] [   23.411753] systemd[1]: Failed to find module
'autofs4'
[46.773107 0.227114] [   23.598149] systemd[1]: systemd 251.2+ running in
system mode (+PAM -AUDIT -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT
-GNUTLS -OPENSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD
-LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -TPM2 -BZIP2
-LZ4 -XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON -UTMP +SYSVINIT
default-hierarchy=3Dhybrid)
[46.783382 0.010274] [   23.630127] systemd[1]: Detected architecture arm.
[46.832963 0.049582]
[46.833018 0.000055] Welcome to Phosphor OpenBMC (Phosphor OpenBMC Project
Reference Distro) 2.11.0-dev!
[46.836568 0.003550]
[46.880928 0.044360] [   23.746391] systemd[1]: Hostname set to <s7106>.
[50.045951 3.165023] [   26.892896] systemd[1]:
/lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name,
ignoring: sys-subsystem-net-devices-%i.device
[50.214922 0.168972] [   27.067199] systemd[1]: Queued start job for
default target Multi-User System.
[50.251829 0.036907] [   27.097063] systemd[1]: Created slice Slice
/system/getty.
[50.254950 0.003120] [  OK  ] Created slice Slice /system/getty.
[50.295814 0.040864] [   27.141348] systemd[1]: Created slice Slice
/system/hostlogger.
[50.298493 0.002680] [  OK  ] Created slice Slice /system/hostlogger.
[50.344807 0.046314] [   27.191243] systemd[1]: Created slice Slice
/system/mapper-wait.
[50.346868 0.002061] [  OK  ] Created slice Slice /system/mapper-wait.
[50.394869 0.048001] [   27.241200] systemd[1]: Created slice Slice
/system/modprobe.
[50.397565 0.002697] [  OK  ] Created slice Slice /system/modprobe.
[50.445728 0.048163] [   27.291502] systemd[1]: Created slice Slice
/system/obmc-console.
[50.448524 0.002795] [  OK  ] Created slice Slice /system/obmc-console.
[50.495677 0.047153] [   27.341588] systemd[1]: Created slice Slice
/system/obmc-led-group-start.
[50.498699 0.003022] [  OK  ] Created slice Slice
/system/obmc-led-group-start.
[50.545669 0.046970] [   27.391644] systemd[1]: Created slice Slice
/system/phosphor-certificate-manager.
[50.548889 0.003220] [  OK  ] Created slice Slice
/system/phosphor-certificate-manager.
[50.595607 0.046717] [   27.441589] systemd[1]: Created slice Slice
/system/phosphor-ipmi-kcs.
[50.597484 0.001877] [  OK  ] Created slice Slice /system/phosphor-ipmi-kcs=
.
[50.645620 0.048136] [   27.491616] systemd[1]: Created slice Slice
/system/phosphor-ipmi-net.
[50.649161 0.003541] [  OK  ] Created slice Slice /system/phosphor-ipmi-net=
.
[50.695552 0.046391] [   27.541962] systemd[1]: Created slice Slice
/system/serial-getty.
[50.698557 0.003005] [  OK  ] Created slice Slice /system/serial-getty.
[50.751634 0.053077] [   27.591873] systemd[1]: Created slice Slice
/system/xyz.openbmc_project.Chassis.Control.Power.
[50.755019 0.003385] [  OK  ] Created slice Slice
/systeproject.Chassis.Control.Power.
[50.767445 0.012426] [   27.635053] systemd[1]: Started Dispatch Password
Requests to Console Directory Watch.
[50.795528 0.028083] [  OK  ] Started Dispatch Password ts to Console
Directory Watch.
[50.829517 0.033989] [   27.675029] systemd[1]: Started Forward Password
Requests to Wall Directory Watch.
[50.832890 0.003373] [  OK  ] Started Forward Password Ruests to Wall
Directory Watch.
[50.867495 0.034605] [   27.718553] systemd[1]: Reached target Path Units.
[50.869946 0.002451] [  OK  ] Reached target Path Units.
[50.883339 0.013393] [   27.754327] systemd[1]: Reached target Remote File
Systems.
[50.906378 0.023038] [  OK  ] Reached target Remote File Systems.
[50.942467 0.036089] [   27.793908] systemd[1]: Reached target Slice Units.
[50.945024 0.002557] [  OK  ] Reached target Slice Units.
[50.983415 0.038391] [   27.834719] systemd[1]: Reached target Swaps.
[50.985597 0.002182] [  OK  ] Reached target Swaps.
[51.015376 0.029778] [   27.887004] systemd[1]: Listening on Syslog Socket.
[51.037815 0.022439] [  OK  ] Listening on Syslog Socket.
[51.100454 0.062639] [   27.969505] systemd[1]: Listening on Process Core
Dump Socket.
[51.123107 0.022654] [  OK  ] Listening on Process Core Dump Socket.
[51.159312 0.036204] [   28.005293] systemd[1]: Listening on initctl
Compatibility Named Pipe.
[51.163193 0.003882] [  OK  ] Listening on initctl Compatibility Named Pipe=
.
[51.175196 0.012003] [   28.045875] systemd[1]: Journal Audit Socket was
skipped because of a failed condition check (ConditionSecurity=3Daudit).
[51.214864 0.039668] [   28.060598] systemd[1]: Listening on Journal Socket
(/dev/log).
[51.216492 0.001628] [  OK  ] Listening on Journal Socket (/dev/log).
[51.256257 0.039765] [   28.107496] systemd[1]: Listening on Journal Socket=
.
[51.258725 0.002467] [  OK  ] Listening on Journal Socket.
[51.302207 0.043482] [   28.147892] systemd[1]: Listening on Network
Service Netlink Socket.
[51.305223 0.003016] [  OK  ] Listening on Network Service Netlink Socket.
[51.347120 0.041897] [   28.193666] systemd[1]: Listening on udev Control
Socket.
[51.349171 0.002052] [  OK  ] Listening on udev Control Socket.
[51.391152 0.041980] [   28.236804] systemd[1]: Listening on udev Kernel
Socket.
[51.393638 0.002487] [  OK  ] Listening on udev Kernel Socket.
[51.407052 0.013414] [   28.277443] systemd[1]: Huge Pages File System was
skipped because of a failed condition check
(ConditionPathExists=3D/sys/kernel/mm/hugepages).
[51.449995 0.042943] [   28.293533] systemd[1]: POSIX Message Queue File
System was skipped because of a failed condition check
(ConditionPathExists=3D/proc/sys/fs/mqueue).
[51.478059 0.028064] [   28.323738] systemd[1]: Mounting Kernel Debug File
System...
[51.480142 0.002083]          Mounting Kernel Debug File System...
[51.509969 0.029828] [   28.380532] systemd[1]: Mounting Kernel Trace File
System...
[51.539350 0.029380]          Mounting Kernel Trace File System...
[51.597110 0.057761] [   28.443241] systemd[1]: Mounting Temporary
Directory /tmp...
[51.599710 0.002600]          Mounting Temporary Directory /tmp...
[51.629030 0.029320] [   28.496720] systemd[1]: Create List of Static
Device Nodes was skipped because of a failed condition check
(ConditionFileNotEmpty=3D/lib/modules/5.15.59-51fd11b/modules.devname).
[51.694985 0.065954] [   28.546605] systemd[1]: Starting Load Kernel Module
configfs...
[51.698977 0.003992]          Starting Load Kernel Module configfs...
[51.772951 0.073974] [   28.625054] systemd[1]: Starting Load Kernel Module
fuse...
[51.774767 0.001815]          Starting Load Kernel Module fuse...
[51.818924 0.044157] [   28.665147] systemd[1]: File System Check on Root
Device was skipped because of a failed condition check
(ConditionPathIsReadWrite=3D!/).
[51.891872 0.072948] [   28.743206] systemd[1]: Starting Journal Service...
[51.893559 0.001687]          Starting Journal Service...
[51.965837 0.072278] [   28.817654] systemd[1]: Load Kernel Modules was
skipped because all trigger condition checks failed.
[51.997672 0.031836] [   28.869543] systemd[1]: Starting Generate network
units from Kernel command line...
[52.034659 0.036987]          Starting Generate network ts from Kernel
command line...
[52.114632 0.079973] [   28.985213] systemd[1]: Starting Remount Root and
Kernel File Systems...
[52.136827 0.022195]          Starting Remount Root and Kernel File
Systems...
[52.199675 0.062847] [   29.069243] systemd[1]: Starting Apply Kernel
Variables...
[52.247646 0.047972]          Starting Apply Kernel Variables...
[52.343694 0.096048] [   29.215162] systemd[1]: Starting Coldplug All udev
Devices...
[52.366999 0.023305]          Starting Coldplug All udev Devices...
[52.868361 0.501362] [   29.720007] systemd[1]: Mounted Kernel Debug File
System.
[52.932199 0.063838] [  OK  ] Mounted Kernel Debug File System.
[52.989149 0.056950] [   29.835439] systemd[1]: Mounted Kernel Trace File
System.
[52.991677 0.002527] [  OK  ] Mounted Kernel Trace File System.
[53.049128 0.057451] [   29.895548] systemd[1]: Mounted Temporary Directory
/tmp.
[53.051853 0.002725] [  OK  ] Mounted Temporary Directory /tmp.
[53.077029 0.025176] [   29.929350] systemd[1]: modprobe@configfs.service:
Deactivated successfully.
[53.107001 0.029972] [   29.953102] systemd[1]: Finished Load Kernel Module
configfs.
[53.109846 0.002845] [  OK  ] Finished Load Kernel Module configfs.
[53.168076 0.058229] [   30.020412] systemd[1]: modprobe@fuse.service:
Deactivated successfully.
[53.200062 0.031986] [   30.046159] systemd[1]: Finished Load Kernel Module
fuse.
[53.202464 0.002403] [  OK  ] Finished Load Kernel Module fuse.
[53.204073 0.001608] [   30.068653] systemd[1]: Finished Generate network
units from Kernel command line.
[53.254024 0.049951] [  OK  ] Finished Generate network units from Kernel
command line.
[53.285877 0.031853] [   30.158111] systemd[1]: Finished Remount Root and
Kernel File Systems.
[53.338859 0.052982] [  OK  ] Finished Remount Root and Kernel File Systems=
.
[53.370881 0.032022] [   30.241587] systemd[1]: Finished Apply Kernel
Variables.
[53.393164 0.022284] [  OK  ] Finished Apply Kernel Variables.
[53.481021 0.087857] [   30.318812] systemd[1]: Reached target Preparation
for Network.
[53.484837 0.003816] [  OK  ] Reached target Preparation for Network.
[53.496938 0.012101] [   30.367036] systemd[1]: FUSE Control File System
was skipped because of a failed condition check
(ConditionPathExists=3D/sys/fs/fuse/connections).
[53.581825 0.084887] [   30.453374] systemd[1]: Mounting Kernel
Configuration File System...
[53.611489 0.029664]          Mounting Kernel Configuration File System...
[53.687846 0.076357] [   30.534063] systemd[1]: Rebuild Hardware Database
was skipped because of a failed condition check (ConditionNeedsUpdate=3D/et=
c).
[53.703639 0.015793] [   30.574867] systemd[1]: Platform Persistent Storage
Archival was skipped because of a failed condition check
(ConditionDirectoryNotEmpty=3D/sys/fs/pstore).
[53.778705 0.075066] [   30.625049] systemd[1]: Create System Users was
skipped because of a failed condition check (ConditionNeedsUpdate=3D/etc).
[53.847799 0.069094] [   30.699639] systemd[1]: Starting Create Static
Device Nodes in /dev...
[53.893642 0.045844]          Starting Create Static Device Nodes in /dev..=
.
[54.014563 0.120921] [   30.866554] systemd[1]: Mounted Kernel
Configuration File System.
[54.041466 0.026903] [  OK  ] Mounted Kernel Configuration File System.
[54.567170 0.525704] [   31.413009] systemd[1]: Finished Create Static
Device Nodes in /dev.
[54.569438 0.002267] [  OK  ] Finished Create Static Device Nodes in /dev.
[54.599150 0.029712] [   31.445086] systemd[1]: Reached target Preparation
for Local File Systems.
[54.601663 0.002513] [  OK  ] Reached target Preparation for Local File
Systems.
[54.647228 0.045565] [   31.508256] systemd[1]: Mounting /var/volatile...
[54.679114 0.031887]          Mounting /var/volatile...
[54.775250 0.096135] [   31.647359] systemd[1]: Starting Rule-based Manager
for Device Events and Files...
[54.841080 0.065830]          Starting Rule-based Managefor Device Events
and Files...
[54.933032 0.091952] [   31.784875] systemd[1]: Started Journal Service.
[54.935395 0.002362] [  OK  ] Started Journal Service.
[55.012993 0.077598] [  OK  ] Mounted /var/volatile.
[55.124927 0.111934]          Starting Flush Journal to Persistent
Storage...
[55.284726 0.159799]          Starting Load/Save Random Seed...
[55.344767 0.060041] [  OK  ] Reached target Local File Systems.
[55.615663 0.270896] [   32.467582] systemd-journald[134]: Received client
request to flush runtime journal.
[55.677563 0.061900] [  OK  ] Finished Flush Journal to Persistent Storage.
[55.764487 0.086923]          Starting Create Volatile Files and
Directories...
[55.796511 0.032024] [  OK  ] Finished Load/Save Random Seed.
[56.578026 0.781515] [  OK  ] Finished Create Volatile Files and
Directories.
[56.705990 0.127965]          Starting Network Name Resolution...
[56.833921 0.127931]          Starting Network Time Synchronization...
[57.247735 0.413814] [  OK  ] Started Rule-based Manager for Device Events
and Files.
[57.375574 0.127839]          Starting Network Configuration...
[59.322477 1.946902] [  OK  ] Finished Coldplug All udev Devices.
[61.836220 0.003311] [  OK  ] Started Network Time Synchronization.
[66.404501 0.003257] [   44.006597] 8021q: adding VLAN 0 to HW filter on
device eth0
[67.310624 0.906122] [  OK  ] Started Network Configuration.
[67.461615 0.150991] [  OK  ] Started Network Name Resolution.
[67.573481 0.111866] [  OK  ] Found device /sys/subsystem/net/devices/eth0.
[69.840189 2.266707] [  OK  ] Created slice Slice
/system/xyz.openbmc_project.Hwmon.
[69.885086 0.044898] [  OK  ] Created slice Slice
/systepenbmc_project.led.controller.
[69.917047 0.031961] [  OK  ] Reached target Network.
[69.956052 0.039005] [  OK  ] Reached target Host and Network Name Lookups.
[69.994986 0.038934] [  OK  ] Reached target System Time Set.
[70.024949 0.029963] [  OK  ] Reached target Hardware activated USB gadget.
[70.089049 0.064100]          Starting Load Kernel Module fuse...
[70.168915 0.079866]          Starting Wait for Network to be Configured...
[70.261885 0.092970]          Starting Wait for udev To plete Device
Initialization...
[70.378769 0.116884] [  OK  ] Finished Load Kernel Module fuse.
[70.511690 0.132921] [  OK  ] Finished Wait for udev To Complete Device
Initialization.
[70.623694 0.112004] [  OK  ] Started Hardware RNG Entropy Gatherer Daemon.
[70.655513 0.031819] [  OK  ] Reached target System Initialization.
[70.736570 0.081057] [  OK  ] Started Daily rotation of log files.
[70.775594 0.039024] [  OK  ] Started Daily Cleanup of Temporary
Directories.
[70.815531 0.039937] [  OK  ] Reached target Timer Units.
[70.871529 0.055998] [  OK  ] Listening on Avahi mDNS/DNS-SD Stack
Activation Socket.
[70.966407 0.094877] [  OK  ] Listening on BMC Webserver socket.
[71.030405 0.063998] [  OK  ] Listening on D-Bus System Message Bus Socket.
[71.196403 0.165998] [  OK  ] Listening on dropbear.socket.
[71.292238 0.095835] [   48.163528] ftgmac100 1e680000.ethernet eth1: Link
is Up - 1Gbps/Full - flow control rx/tx
[71.320861 0.028622] [   48.171909] IPv6: ADDRCONF(NETDEV_CHANGE): eth1:
link becomes ready
[71.430178 0.109317] [  OK  ] Listening on Phosphor Hostole SSH
Per-Connection socket.
[71.526094 0.095916] [  OK  ] Listening on phosphor-ipmi-net@eth0.socket.
[71.586054 0.059961] [  OK  ] Reached target Socket Units.
[71.666205 0.080151]          Starting D-Bus System Message Bus...
[72.801349 1.135144] [  OK  ] Started D-Bus System Message Bus.
[73.068098 0.266749] [  OK  ] Reached target Basic System.
[73.180175 0.112077]          Starting Avahi mDNS/DNS-SD Stack...
[73.242047 0.061872] [  OK  ] Started Start bmcweb server.
[73.385968 0.143922]          Starting Clear one time boot overrides...
[73.497921 0.111952] [  OK  ] Started Collectd.
[73.721807 0.223886]          Starting SSH Key Generation...
[73.833714 0.111908] [  OK  ] Started LPC Snoop Daemon.
[73.897783 0.064069]          Starting Name Service Cache Daemon...
[73.945774 0.047991]          Starting LDAP daemon...
[74.370455 0.424681] [  OK  ] Started ttyS2 Console Server.
[74.536364 0.165909] [DEPEND] Dependency failed for Host logger for
ttyVUART0.
[74.680219 0.143855] [  OK  ] Started Phosphor Dump core monitor..
[75.061063 0.380844] [  OK  ] Started Phosphor certificate manager for
authority.
[75.471731 0.410668] [  OK  ] Started Phosphor certificate manager for
bmcweb.
[75.845591 0.373860] [  OK  ] Started Phosphor certificate manager for
nslcd.
[76.053437 0.207846]          Starting BMC health monitoring...
[76.405303 0.351866] [  OK  ] Started Lightweight SLP Server.
[76.740922 0.335620]          Starting OpenBMC ipKVM daemon...
[77.044809 0.303887]          Starting Permit User Sessions...
[77.252684 0.207875]          Starting Enable Linux trace events in the
boot loader...
[77.517459 0.264774]          Starting Intel Power Control for the Host 0..=
.
[77.789325 0.271866]          Starting Phosphor Dump Manager...
[77.917117 0.127793]          Starting Entity Manager...
[78.077091 0.159973] [  OK  ] Started Fru Device.
[78.371989 0.294899] [  OK  ] Started IPMI SEL Logging Service.
[78.595787 0.223798]          Starting Phosphor Log Manager...
[79.395339 0.799552]          Starting Phosphor DBus Service Discovery
Manager...
[79.523156 0.127818]          Starting Phosphor Settings Daemon...
[79.603066 0.079910]          Starting Phosphor Download Manager...
[79.922962 0.319896]          Starting Post code manager...
[80.050937 0.127975]          Starting Rsyslog config updater...
[80.354702 0.303764]          Starting Telemetry...
[80.562499 0.207797]          Starting Phosphor User Manager...
[80.792450 0.229951] [  OK  ] Started Phosphor sysfs LED controller.
[81.256206 0.463756] [  OK  ] Started Phosphor sysfs LED controller.
[83.070060 1.813854] [  OK  ] Finished Wait for Network to be Configured.
[83.507784 0.437724] [  OK  ] Finished SSH Key Generation.
[83.760672 0.252888] [  OK  ] Started Name Service Cache Daemon.
[83.851574 0.090902] [  OK  ] Started OpenBMC ipKVM daemon.
[83.888570 0.036996] [   60.740209] ftgmac100 1e660000.ethernet eth0: NCSI:
No channel found to configure!
[83.967398 0.078828] [  OK  ] Finished Permit User Sessions.
[84.047391 0.079993] [  OK  ] Finished Enable Linux trace events in the
boot loader.
[84.735110 0.687719] [  OK  ] Finished Clear one time boot overrides.
[84.894970 0.159860] [   61.762821] ftgmac100 1e660000.ethernet eth0: Wrong
NCSI state 0x100 in workqueue
[85.549486 0.654515] [  OK  ] Started Phosphor Settings Daemon.
[85.765249 0.215764] [  OK  ] Started Phosphor Download Manager.
[85.768340 0.003091] [  OK  ] Started Post code manager.
[85.869289 0.100949] [  OK  ] Started Intel Power Control for the Host 0.
[85.901206 0.031917] [  OK  ] Started LDAP daemon.
[86.011219 0.110013] [  OK  ] Started BMC health monitoring.
[86.091021 0.079802] [  OK  ] Started Phosphor Log Manager.
[86.106979 0.015958] [  OK  ] Started Rsyslog config updater.
[86.361989 0.255010] [  OK  ] Started Phosphor DBus Service Discovery
Manager.
[86.425885 0.063896] [  OK  ] Started Telemetry.
[86.553790 0.127905] [  OK  ] Started Phosphor User Manager.
[86.793664 0.239874] [  OK  ] Reached target Network is Online.
[86.899669 0.106005] [  OK  ] Reached target Phosphor Object Mapper.
[87.272368 0.372699]          Starting Wait for
/xyz/opecontrol/host0/boot/one_time...
[87.640217 0.367849]          Starting Wait for
/xyz/ope_project/control/host0/boot...
[87.894980 0.254763]          Starting Wait for
/xyz/ope/host0/power_restore_policy...
[88.241803 0.346823]          Starting Wait for
/xyz/opetrol/host0/restriction_mode...
[88.545633 0.303830]          Starting Wait for
/xyz/opeoject/led/groups/bmc_booted...
[88.882431 0.336798]          Starting Wait for
/xyz/opemc_project/time/sync_method...
[89.071213 0.188782] [  OK  ] Started phosphor systemd target monitor.
[89.375118 0.303905]          Starting System Logging Service...
[89.701887 0.326770] [  OK  ] Started Serial Getty on ttyS4.
[89.764756 0.062869] [  OK  ] Reached target Login Prompts.
[90.459415 0.694659]          Starting Phosphor LED Group Management
Daemon...
[90.744264 0.284849]          Starting Phosphor Ldap config updater...
[90.920100 0.175835]          Starting Phosphor Network Manager...
[91.335809 0.415709]          Starting OpenBMC Software Update Manager...
[91.653723 0.317914]          Starting Phosphor BMC State Manager...
[94.032272 2.378549] [  OK  ] Started System Logging Service.
[94.176078 0.143806] [  OK  ] Finished Wait for
/xyz/opet/control/host0/boot/one_time.
[94.325020 0.148942] [  OK  ] Finished Wait for
/xyz/opemc_project/control/host0/boot.
[94.452987 0.127967] [  OK  ] Finished Wait for
/xyz/opeol/host0/power_restore_policy.
[94.592883 0.139896] [  OK  ] Finished Wait for
/xyz/opeontrol/host0/restriction_mode.
[94.714805 0.121922] [  OK  ] Finished Wait for
/xyz/openbmc_project/time/sync_method.
[94.825732 0.110927] [  OK  ] Started Phosphor Dump Manager.
[95.438527 0.612794]
[95.438650 0.000123] Phosphor OpenBMC (Phosphor OpenBMC Project Reference
Distro) nodistro.0 s7106 ttyS4
[95.442250 0.003600]
[95.442283 0.000033] s7106 login: root (automatic login)
[95.443164 0.000881]
```

--000000000000988a3405e880cbe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is anyone interested in boot time improvements?=C2=A0 I re=
cently looked at my system just to get a baseline, and it seems like there&=
#39;s some low hanging fruit to be gained that could give us some significa=
nt speedups on the boot process.=C2=A0 Is anyone looking at this kind of th=
ing already?<div><br></div><div>My quick analysis from timing the serial lo=
g is below.=C2=A0 Total time to a login is 95 seconds, which it seems like =
we could improve quite a bit.</div><div><br></div><div>First serial line pr=
inted to u-boot &quot;hit any key&quot; startup init is 3 seconds<br>3 seco=
nds of countdown for &quot;hit any key to stop autoboot&quot;.=C2=A0 I&#39;=
m sure u-boot has a way to disable that, so there&#39;s 3 seconds right the=
re.<br>Decompressing the dtb, initramfs, and kernel images is seconds 5-14.=
=C2=A0 If there&#39;s a way to optimize that better that u-bmc has implemen=
ted ahead of us, that seems like an area for improvement that we could pull=
 in.<br>Kernel starts at ~20 seconds, then 3.5 seconds of dead air... not s=
ure what&#39;s going on there.<br>A big 17 second pause between these two l=
ines.=C2=A0 Not sure what that&#39;s about.<br>[25.443908 0.001845] [ =C2=
=A0 =C2=A02.294952] Driver for 1-wire Dallas network protocol.<br>[42.32159=
0 16.877682] [ =C2=A0 19.191143] SPI driver bmp280 has no spi_device_id for=
 bosch,bmp085<br>6. Init script runs at 46 seconds, so we&#39;re getting in=
to the realm of &quot;systemd problems&quot; at ~50% of our boot time.<br>7=
. 71 seconds in, all the user-facing sockets are up, and the NIC comes up; =
=C2=A0So far as a user is concerned, the bmc is &quot;up&quot; (kinda), giv=
en that the user facing services are socket activated.<br>8. 71-95, launchi=
ng all the various backend system services.<br>9. 95 seconds in, services h=
ave finished launching, and a login prompt is presented.<br></div><div><br>=
</div><div>```</div><div>~/grabserial master =E2=9D=AF sudo python3 grabser=
ial -v -d /dev/ttyUSB3 -b 115200 -f -w 8 -p N -s 1 -e 150 -t -m &quot;DRAM =
Init-V12-DDR4&quot;<br>Opening serial port /dev/ttyUSB3<br>115200:8N1:xonxo=
ff=3D0:rtscts=3D0:rts=3D1:dtr=3D1<br>Program set to end in 150 seconds<br>P=
rinting timing information for each line<br>Using pattern &#39;DRAM Init-V1=
2-DDR4&#39; to set base time<br>Use Control-C to stop...<br>[0.000001 0.000=
001] <br>[0.000531 0.000530] DRAM Init-V12-DDR4<br>[0.016045 0.016045] 0abc=
1-4Gb-Done<br>[0.271901 0.255857] Read margin-DL:0.3647/DH:0.3745 CK (min:0=
.30)<br>[1.971260 1.699359] <br>[1.971447 0.000186] <br>[1.971544 0.000097]=
 U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)<br>[1.973912 0.002369] <br>[=
1.973960 0.000047] =C2=A0 =C2=A0 =C2=A0 =C2=A0Watchdog enabled<br>[1.974791=
 0.000832] DRAM: =C2=A0496 MiB<br>[2.850693 0.875902] Flash: 128 MiB<br>[2.=
962520 0.111827] In: =C2=A0 =C2=A0serial<br>[3.000751 0.038230] Out: =C2=A0=
 serial<br>[3.001596 0.000845] Err: =C2=A0 serial<br>[3.002095 0.000499] Ne=
t: =C2=A0 MAC0 : RMII/NCSI<br>[3.002880 0.000785] MAC1 : RGMII<br>[3.003157=
 0.000277] FTGMAC100#0<br>[3.003447 0.000290] Error: FTGMAC100#0 address no=
t set.<br>[3.004289 0.000842] , FTGMAC100#1<br>[3.004628 0.000339] Error: F=
TGMAC100#1 address not set.<br>[3.005417 0.000789] <br>[3.005442 0.000025] =
Hit any key to stop autoboot: =C2=A00 <br>[5.037966 2.032524] ## Loading ke=
rnel from FIT Image at 20080000 ...<br>[5.039975 0.002010] =C2=A0 =C2=A0Usi=
ng &#39;conf-aspeed-bmc-tyan-s7106.dtb&#39; configuration<br>[5.041790 0.00=
1814] =C2=A0 =C2=A0Trying &#39;kernel-1&#39; kernel subimage<br>[5.042722 0=
.000932] =C2=A0 =C2=A0 =C2=A0Description: =C2=A0Linux kernel<br>[5.043504 0=
.000782] =C2=A0 =C2=A0 =C2=A0Type: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Kernel Image=
<br>[5.044270 0.000766] =C2=A0 =C2=A0 =C2=A0Compression: =C2=A0uncompressed=
<br>[5.045040 0.000770] =C2=A0 =C2=A0 =C2=A0Data Start: =C2=A0 0x20080128<b=
r>[5.045763 0.000723] =C2=A0 =C2=A0 =C2=A0Data Size: =C2=A0 =C2=A03168888 B=
ytes =3D 3 MiB<br>[5.046716 0.000954] =C2=A0 =C2=A0 =C2=A0Architecture: ARM=
<br>[5.047274 0.000558] =C2=A0 =C2=A0 =C2=A0OS: =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 Linux<br>[5.047869 0.000595] =C2=A0 =C2=A0 =C2=A0Load Address: 0x80=
001000<br>[5.048530 0.000660] =C2=A0 =C2=A0 =C2=A0Entry Point: =C2=A00x8000=
1000<br>[5.049099 0.000569] =C2=A0 =C2=A0 =C2=A0Hash algo: =C2=A0 =C2=A0sha=
256<br>[5.049564 0.000465] =C2=A0 =C2=A0 =C2=A0Hash value: =C2=A0 fed4aab9d=
e8bc0c04cb8a180da7a817b4c0e7db8c9608e1f59a0c7385eccd7a6<br>[5.059791 0.0102=
27] =C2=A0 =C2=A0Verifying Hash Integrity ... sha256+ OK<br>[11.582735 6.52=
2943] ## Loading ramdisk from FIT Image at 20080000 ...<br>[11.633128 0.050=
394] =C2=A0 =C2=A0Using &#39;conf-aspeed-bmc-tyan-s7106.dtb&#39; configurat=
ion<br>[11.634600 0.001472] =C2=A0 =C2=A0Trying &#39;ramdisk-1&#39; ramdisk=
 subimage<br>[11.635495 0.000895] =C2=A0 =C2=A0 =C2=A0Description: =C2=A0ob=
mc-phosphor-initramfs<br>[11.636475 0.000980] =C2=A0 =C2=A0 =C2=A0Type: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 RAMDisk Image<br>[11.637248 0.000773] =C2=A0 =C2=
=A0 =C2=A0Compression: =C2=A0uncompressed<br>[11.637960 0.000712] =C2=A0 =
=C2=A0 =C2=A0Data Start: =C2=A0 0x2038d038<br>[11.638650 0.000690] =C2=A0 =
=C2=A0 =C2=A0Data Size: =C2=A0 =C2=A01096840 Bytes =3D 1 MiB<br>[11.639495 =
0.000845] =C2=A0 =C2=A0 =C2=A0Architecture: ARM<br>[11.639993 0.000498] =C2=
=A0 =C2=A0 =C2=A0OS: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linux<br>[11.640573=
 0.000579] =C2=A0 =C2=A0 =C2=A0Load Address: unavailable<br>[11.641293 0.00=
0721] =C2=A0 =C2=A0 =C2=A0Entry Point: =C2=A0unavailable<br>[11.642033 0.00=
0740] =C2=A0 =C2=A0 =C2=A0Hash algo: =C2=A0 =C2=A0sha256<br>[11.642632 0.00=
0599] =C2=A0 =C2=A0 =C2=A0Hash value: =C2=A0 98744c2598168b3a123ef8760636a8=
c5e005948e67191646c017e877e7f86e51<br>[11.654930 0.012298] =C2=A0 =C2=A0Ver=
ifying Hash Integrity ... sha256+ OK<br>[13.909357 2.254427] ## Loading fdt=
 from FIT Image at 20080000 ...<br>[13.967636 0.058279] =C2=A0 =C2=A0Using =
&#39;conf-aspeed-bmc-tyan-s7106.dtb&#39; configuration<br>[13.969544 0.0019=
07] =C2=A0 =C2=A0Trying &#39;fdt-aspeed-bmc-tyan-s7106.dtb&#39; fdt subimag=
e<br>[13.970586 0.001042] =C2=A0 =C2=A0 =C2=A0Description: =C2=A0Flattened =
Device Tree blob<br>[13.971422 0.000836] =C2=A0 =C2=A0 =C2=A0Type: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Flat Device Tree<br>[13.972072 0.000650] =C2=A0 =C2=A0=
 =C2=A0Compression: =C2=A0uncompressed<br>[13.972657 0.000585] =C2=A0 =C2=
=A0 =C2=A0Data Start: =C2=A0 0x20385cb8<br>[13.973207 0.000550] =C2=A0 =C2=
=A0 =C2=A0Data Size: =C2=A0 =C2=A029362 Bytes =3D 28.7 KiB<br>[13.973970 0.=
000763] =C2=A0 =C2=A0 =C2=A0Architecture: ARM<br>[13.974391 0.000420] =C2=
=A0 =C2=A0 =C2=A0Hash algo: =C2=A0 =C2=A0sha256<br>[13.974972 0.000582] =C2=
=A0 =C2=A0 =C2=A0Hash value: =C2=A0 66368a4557754ea3287198f0d2b75f98bf6a6e1=
7a32c2a9bcc8a574b2dbe5a06<br>[13.976801 0.001829] =C2=A0 =C2=A0Verifying Ha=
sh Integrity ... sha256+ OK<br>[14.045789 0.068988] =C2=A0 =C2=A0Booting us=
ing the fdt blob at 0x20385cb8<br>[14.047312 0.001523] =C2=A0 =C2=A0Loading=
 Kernel Image ... OK<br>[18.347361 4.300049] =C2=A0 =C2=A0Loading Ramdisk t=
o 9ea90000, end 9eb9bc88 ... OK<br>[19.834330 1.486969] =C2=A0 =C2=A0Loadin=
g Device Tree to 9ea85000, end 9ea8f2b1 ... OK<br>[19.914132 0.079802] <br>=
[19.914196 0.000063] Starting kernel ...<br>[19.930654 0.016458] <br>[23.48=
8077 3.557423] [ =C2=A0 =C2=A00.000000] Booting Linux on physical CPU 0x0<b=
r>[23.490190 0.002112] [ =C2=A0 =C2=A00.000000] Linux version 5.15.59-51fd1=
1b (oe-user@oe-host) (arm-openbmc-linux-gnueabi-gcc (GCC) 12.1.0, GNU ld (G=
NU Binutils) 2.38.20220623) #1 Thu Aug 4 03:28:18 UTC 2022<br>[23.515911 0.=
025721] [ =C2=A0 =C2=A00.000000] CPU: ARMv6-compatible processor [410fb767]=
 revision 7 (ARMv7), cr=3D00c5387d<br>[23.522071 0.006160] [ =C2=A0 =C2=A00=
.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT nonaliasing instruct=
ion cache<br>[23.550850 0.028779] [ =C2=A0 =C2=A00.000000] OF: fdt: Machine=
 model: Tyan S7106 BMC<br>[23.552944 0.002095] [ =C2=A0 =C2=A00.000000] Mem=
ory policy: Data cache writeback<br>[23.554374 0.001430] [ =C2=A0 =C2=A00.0=
00000] Reserved memory: created CMA memory pool at 0x9d000000, size 16 MiB<=
br>[23.604916 0.050542] [ =C2=A0 =C2=A00.000000] OF: reserved mem: initiali=
zed node framebuffer, compatible id shared-dma-pool<br>[23.608081 0.003165]=
 [ =C2=A0 =C2=A00.000000] cma: Reserved 16 MiB at 0x9c000000<br>[23.609227 =
0.001147] [ =C2=A0 =C2=A00.000000] Zone ranges:<br>[23.609886 0.000659] [ =
=C2=A0 =C2=A00.000000] =C2=A0 Normal =C2=A0 [mem 0x0000000080000000-0x00000=
0009effffff]<br>[23.611526 0.001640] [ =C2=A0 =C2=A00.000000] Movable zone =
start for each node<br>[23.675950 0.064424] [ =C2=A0 =C2=A00.000000] Early =
memory node ranges<br>[23.677739 0.001789] [ =C2=A0 =C2=A00.000000] =C2=A0 =
node =C2=A0 0: [mem 0x0000000080000000-0x00000000987effff]<br>[23.680125 0.=
002386] [ =C2=A0 =C2=A00.000000] =C2=A0 node =C2=A0 0: [mem 0x00000000987f0=
000-0x00000000987fffff]<br>[23.681552 0.001427] [ =C2=A0 =C2=A00.000000] =
=C2=A0 node =C2=A0 0: [mem 0x0000000098800000-0x000000009effffff]<br>[23.68=
2810 0.001258] [ =C2=A0 =C2=A00.000000] Initmem setup node 0 [mem 0x0000000=
080000000-0x000000009effffff]<br>[23.684468 0.001658] [ =C2=A0 =C2=A00.0000=
00] Built 1 zonelists, mobility grouping on.=C2=A0 Total pages: 125984<br>[=
23.706800 0.022331] [ =C2=A0 =C2=A00.000000] Kernel command line: console=
=3DttyS4,115200n8 root=3D/dev/ram rw<br>[23.709396 0.002597] [ =C2=A0 =C2=
=A00.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes=
, linear)<br>[23.735743 0.026347] [ =C2=A0 =C2=A00.000000] Inode-cache hash=
 table entries: 32768 (order: 5, 131072 bytes, linear)<br>[23.738499 0.0027=
56] [ =C2=A0 =C2=A00.000000] mem auto-init: stack:all(zero), heap alloc:off=
, heap free:off<br>[23.765738 0.027239] [ =C2=A0 =C2=A00.000000] Memory: 45=
7284K/507904K available (8192K kernel code, 666K rwdata, 1560K rodata, 1024=
K init, 156K bss, 17852K reserved, 32768K cma-reserved)<br>[23.819745 0.054=
007] [ =C2=A0 =C2=A00.000000] SLUB: HWalign=3D32, Order=3D0-3, MinObjects=
=3D0, CPUs=3D1, Nodes=3D1<br>[23.822114 0.002369] [ =C2=A0 =C2=A00.000000] =
ftrace: allocating 23856 entries in 47 pages<br>[23.823525 0.001412] [ =C2=
=A0 =C2=A00.000000] ftrace: allocated 47 pages with 5 groups<br>[23.824556 =
0.001031] [ =C2=A0 =C2=A00.000000] trace event string verifier disabled<br>=
[23.825776 0.001220] [ =C2=A0 =C2=A00.000000] NR_IRQS: 16, nr_irqs: 16, pre=
allocated irqs: 16<br>[23.845754 0.019979] [ =C2=A0 =C2=A00.000000] i2c con=
troller registered, irq 17<br>[23.847347 0.001592] [ =C2=A0 =C2=A00.000000]=
 clocksource: FTTMR010-TIMER2: mask: 0xffffffff max_cycles: 0xffffffff, max=
_idle_ns: 77222644334 ns<br>[23.875768 0.028421] [ =C2=A0 =C2=A00.000004] s=
ched_clock: 32 bits at 24MHz, resolution 40ns, wraps every 86767015915ns<br=
>[23.878921 0.003153] [ =C2=A0 =C2=A00.000097] Switching to timer-based del=
ay loop, resolution 40ns<br>[23.944690 0.065770] [ =C2=A0 =C2=A00.000886] C=
alibrating delay loop (skipped), value calculated using timer frequency.. 4=
9.50 BogoMIPS (lpj=3D247500)<br>[23.948623 0.003933] [ =C2=A0 =C2=A00.00096=
7] pid_max: default: 32768 minimum: 301<br>[23.949579 0.000956] [ =C2=A0 =
=C2=A00.003104] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes,=
 linear)<br>[23.950998 0.001419] [ =C2=A0 =C2=A00.003192] Mountpoint-cache =
hash table entries: 1024 (order: 0, 4096 bytes, linear)<br>[23.952525 0.001=
527] [ =C2=A0 =C2=A00.006434] CPU: Testing write buffer coherency: ok<br>[2=
3.995660 0.043134] [ =C2=A0 =C2=A00.009700] Setting up static identity map =
for 0x80100000 - 0x80100038<br>[23.998464 0.002805] [ =C2=A0 =C2=A00.011248=
] ASPEED AST2500 rev A2 (04030303)<br>[23.999575 0.001111] [ =C2=A0 =C2=A00=
.012611] devtmpfs: initialized<br>[24.000401 0.000826] [ =C2=A0 =C2=A00.035=
630] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idl=
e_ns: 19112604462750000 ns<br>[24.044628 0.044227] [ =C2=A0 =C2=A00.035733]=
 futex hash table entries: 256 (order: -1, 3072 bytes, linear)<br>[24.04709=
3 0.002465] [ =C2=A0 =C2=A00.041939] pinctrl core: initialized pinctrl subs=
ystem<br>[24.048455 0.001362] [ =C2=A0 =C2=A00.045095] NET: Registered PF_N=
ETLINK/PF_ROUTE protocol family<br>[24.049654 0.001199] [ =C2=A0 =C2=A00.04=
7578] DMA: preallocated 256 KiB pool for atomic coherent allocations<br>[24=
.115643 0.065989] [ =C2=A0 =C2=A00.050560] hw-breakpoint: found 6 breakpoin=
t and 1 watchpoint registers.<br>[24.118448 0.002805] [ =C2=A0 =C2=A00.0506=
32] hw-breakpoint: maximum watchpoint size is 4 bytes.<br>[24.119609 0.0011=
61] [ =C2=A0 =C2=A00.127577] mc: Linux media interface: v0.10<br>[24.120438=
 0.000829] [ =C2=A0 =C2=A00.127769] videodev: Linux video capture interface=
: v2.00<br>[24.121494 0.001056] [ =C2=A0 =C2=A00.128051] pps_core: LinuxPPS=
 API ver. 1 registered<br>[24.122430 0.000937] [ =C2=A0 =C2=A00.128105] pps=
_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;<a hr=
ef=3D"mailto:giometti@linux.it">giometti@linux.it</a>&gt;<br>[24.140529 0.0=
18099] [ =C2=A0 =C2=A00.128212] PTP clock support registered<br>[24.142585 =
0.002055] [ =C2=A0 =C2=A00.132611] clocksource: Switched to clocksource FTT=
MR010-TIMER2<br>[24.146256 0.003671] [ =C2=A0 =C2=A00.224804] NET: Register=
ed PF_INET protocol family<br>[24.167846 0.021590] [ =C2=A0 =C2=A00.225299]=
 IP idents hash table entries: 8192 (order: 4, 65536 bytes, linear)<br>[24.=
196360 0.028513] [ =C2=A0 =C2=A00.226947] tcp_listen_portaddr_hash hash tab=
le entries: 512 (order: 0, 4096 bytes, linear)<br>[24.199464 0.003104] [ =
=C2=A0 =C2=A00.227069] Table-perturb hash table entries: 65536 (order: 6, 2=
62144 bytes, linear)<br>[24.226350 0.026886] [ =C2=A0 =C2=A00.227152] TCP e=
stablished hash table entries: 4096 (order: 2, 16384 bytes, linear)<br>[24.=
228337 0.001987] [ =C2=A0 =C2=A00.227259] TCP bind hash table entries: 4096=
 (order: 2, 16384 bytes, linear)<br>[24.274405 0.046068] [ =C2=A0 =C2=A00.2=
27349] TCP: Hash tables configured (established 4096 bind 4096)<br>[24.2772=
54 0.002849] [ =C2=A0 =C2=A00.227642] UDP hash table entries: 256 (order: 0=
, 4096 bytes, linear)<br>[24.279681 0.002427] [ =C2=A0 =C2=A00.227756] UDP-=
Lite hash table entries: 256 (order: 0, 4096 bytes, linear)<br>[24.281286 0=
.001605] [ =C2=A0 =C2=A00.228521] NET: Registered PF_UNIX/PF_LOCAL protocol=
 family<br>[24.300313 0.019027] [ =C2=A0 =C2=A00.232052] Unpacking initramf=
s...<br>[24.301608 0.001295] [ =C2=A0 =C2=A00.242800] workingset: timestamp=
_bits=3D30 max_order=3D17 bucket_order=3D0<br>[24.303753 0.002145] [ =C2=A0=
 =C2=A00.257235] squashfs: version 4.0 (2009/01/31) Phillip Lougher<br>[24.=
368598 0.064845] [ =C2=A0 =C2=A00.257303] jffs2: version 2.2. (SUMMARY) =C2=
=A0 2001-2006 Red Hat, Inc.<br>[24.370530 0.001932] [ =C2=A0 =C2=A00.275423=
] NET: Registered PF_ALG protocol family<br>[24.371767 0.001237] [ =C2=A0 =
=C2=A00.279878] ipmi-bt-host 1e789140.ibt: Found bt bmc device<br>[24.37317=
8 0.001411] [ =C2=A0 =C2=A00.280829] ipmi-bt-host 1e789140.ibt: Using IRQ 3=
4<br>[24.374452 0.001274] [ =C2=A0 =C2=A00.282479] ast-kcs-bmc 1e789024.kcs=
: Initialised raw client for channel 1<br>[24.419349 0.044897] [ =C2=A0 =C2=
=A00.283020] ast-kcs-bmc 1e789024.kcs: Initialised IPMI client for channel =
1<br>[24.422025 0.002676] [ =C2=A0 =C2=A00.283089] ast-kcs-bmc 1e789024.kcs=
: Initialised channel 1 at 0xca8<br>[24.423269 0.001244] [ =C2=A0 =C2=A00.2=
94041] ast-kcs-bmc 1e78902c.kcs: Initialised raw client for channel 3<br>[2=
4.424783 0.001514] [ =C2=A0 =C2=A00.294499] ast-kcs-bmc 1e78902c.kcs: Initi=
alised IPMI client for channel 3<br>[24.446348 0.021565] [ =C2=A0 =C2=A00.2=
94569] ast-kcs-bmc 1e78902c.kcs: Initialised channel 3 at 0xca2<br>[24.4495=
83 0.003235] [ =C2=A0 =C2=A00.300129] aspeed-uart-routing 1e78909c.uart-rou=
ting: module loaded<br>[24.476207 0.026623] [ =C2=A0 =C2=A00.303416] Serial=
: 8250/16550 driver, 6 ports, IRQ sharing enabled<br>[24.478619 0.002412] [=
 =C2=A0 =C2=A00.317481] 1e787000.serial: ttyS5 at MMIO 0x1e787000 (irq =3D =
34, base_baud =3D 1546875) is a ASPEED VUART<br>[24.511201 0.032583] [ =C2=
=A0 =C2=A00.319809] 1e783000.serial: ttyS0 at MMIO 0x1e783000 (irq =3D 32, =
base_baud =3D 1500000) is a 16550A<br>[24.514808 0.003607] [ =C2=A0 =C2=A00=
.321423] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (irq =3D 33, base_baud =
=3D 1500000) is a 16550A<br>[24.527183 0.012376] [ =C2=A0 =C2=A01.393553] p=
rintk: console [ttyS4] enabled<br>[24.528688 0.001505] [ =C2=A0 =C2=A01.399=
759] 1e78d000.serial: ttyS1 at MMIO 0x1e78d000 (irq =3D 35, base_baud =3D 1=
500000) is a 16550A<br>[24.571180 0.042492] [ =C2=A0 =C2=A01.424074] 1e78e0=
00.serial: ttyS2 at MMIO 0x1e78e000 (irq =3D 36, base_baud =3D 1500000) is =
a 16550A<br>[24.592127 0.020947] [ =C2=A0 =C2=A01.444561] 1e78f000.serial: =
ttyS3 at MMIO 0x1e78f000 (irq =3D 37, base_baud =3D 1500000) is a 16550A<br=
>[24.620174 0.028047] [ =C2=A0 =C2=A01.465512] timeriomem_rng 1e6e2078.hwrn=
g: 32bits from 0x(ptrval) @ 1us<br>[24.622947 0.002773] [ =C2=A0 =C2=A01.47=
3446] aspeed_gfx 1e6e6000.display: assigned reserved memory node framebuffe=
r<br>[24.636189 0.013241] [ =C2=A0 =C2=A01.503570] random: crng init done<b=
r>[24.652126 0.015937] [ =C2=A0 =C2=A01.524490] [drm] Initialized aspeed-gf=
x-drm 1.0.0 20180319 for 1e6e6000.display on minor 0<br>[24.701060 0.048934=
] [ =C2=A0 =C2=A01.553274] aspeed_gfx 1e6e6000.display: [drm] fb0: aspeed-g=
fx-drmd frame buffer device<br>[24.733143 0.032083] [ =C2=A0 =C2=A01.595158=
] loop: module loaded<br>[24.797137 0.063995] [ =C2=A0 =C2=A01.659126] spi-=
nor spi0.0: mx66l1g45g (131072 Kbytes)<br>[24.939029 0.141891] [ =C2=A0 =C2=
=A01.791345] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]<=
br>[25.098046 0.159017] [ =C2=A0 =C2=A01.945137] 5 fixed-partitions partiti=
ons found on MTD device bmc<br>[25.101257 0.003211] [ =C2=A0 =C2=A01.951289=
] Creating 5 MTD partitions on &quot;bmc&quot;:<br>[25.102476 0.001219] [ =
=C2=A0 =C2=A01.955967] 0x000000000000-0x000000060000 : &quot;u-boot&quot;<b=
r>[25.113789 0.011313] [ =C2=A0 =C2=A01.984254] 0x000000060000-0x0000000800=
00 : &quot;u-boot-env&quot;<br>[25.138113 0.024324] [ =C2=A0 =C2=A01.992205=
] 0x000000080000-0x0000004c0000 : &quot;kernel&quot;<br>[25.164872 0.026759=
] [ =C2=A0 =C2=A02.015047] 0x0000004c0000-0x000001c00000 : &quot;rofs&quot;=
<br>[25.168555 0.003682] [ =C2=A0 =C2=A02.022386] 0x000001c00000-0x00000200=
0000 : &quot;rwfs&quot;<br>[25.234758 0.066204] [ =C2=A0 =C2=A02.047580] sp=
i-nor spi1.0: unrecognized JEDEC id bytes: ff ff ff ff ff ff<br>[25.237092 =
0.002333] [ =C2=A0 =C2=A02.054602] spi-nor: probe of spi1.0 failed with err=
or -2<br>[25.237974 0.000883] [ =C2=A0 =C2=A02.065146] ftgmac100 1e660000.e=
thernet: Generated random MAC address ee:f3:83:36:82:59<br>[25.238928 0.000=
954] [ =C2=A0 =C2=A02.073315] ftgmac100 1e660000.ethernet: Using NCSI inter=
face<br>[25.239958 0.001030] [ =C2=A0 =C2=A02.080277] ftgmac100 1e660000.et=
hernet eth0: irq 20, mapped at fbb6b239<br>[25.241289 0.001331] [ =C2=A0 =
=C2=A02.087826] ftgmac100 1e680000.ethernet: Generated random MAC address 2=
e:e3:14:ec:62:ff<br>[25.243061 0.001772] [ =C2=A0 =C2=A02.105583] RTL8211E =
Gigabit Ethernet 1e680000.ethernet--1:00: attached PHY driver (mii_bus:phy_=
addr=3D1e680000.ethernet--1:00, irq=3DPOLL)<br>[25.271468 0.028407] [ =C2=
=A0 =C2=A02.119043] ftgmac100 1e680000.ethernet eth1: irq 21, mapped at dd7=
46f2b<br>[25.283708 0.012240] [ =C2=A0 =C2=A02.154169] Freeing initrd memor=
y: 1072K<br>[25.334315 0.050606] [ =C2=A0 =C2=A02.159954] aspeed_vhub 1e6a0=
000.usb-vhub: Initialized virtual hub in USB2 mode<br>[25.337081 0.002767] =
[ =C2=A0 =C2=A02.167969] Mass Storage Function, version: 2009/09/11<br>[25.=
338294 0.001213] [ =C2=A0 =C2=A02.173247] LUN: removable file: (no medium)<=
br>[25.339165 0.000871] [ =C2=A0 =C2=A02.177613] no file given for LUN0<br>=
[25.339808 0.000643] [ =C2=A0 =C2=A02.181098] udc 1e6a0000.usb-vhub:p1: fai=
led to start g_mass_storage: -22<br>[25.341107 0.001299] [ =C2=A0 =C2=A02.1=
88670] i2c_dev: i2c /dev entries driver<br>[25.341952 0.000845] [ =C2=A0 =
=C2=A02.194845] aspeed-i2c-bus 1e78a040.i2c-bus: i2c bus 0 registered, irq =
38<br>[25.343256 0.001304] [ =C2=A0 =C2=A02.203024] aspeed-i2c-bus 1e78a080=
.i2c-bus: i2c bus 1 registered, irq 39<br>[25.390362 0.047106] [ =C2=A0 =C2=
=A02.212682] at24 2-0050: 32768 byte 24c256 EEPROM, writable, 1 bytes/write=
<br>[25.392269 0.001907] [ =C2=A0 =C2=A02.219811] aspeed-i2c-bus 1e78a0c0.i=
2c-bus: i2c bus 2 registered, irq 40<br>[25.394077 0.001808] [ =C2=A0 =C2=
=A02.229401] at24 3-0050: 256 byte 24c02 EEPROM, writable, 1 bytes/write<br=
>[25.395848 0.001771] [ =C2=A0 =C2=A02.237783] at24 3-0051: 256 byte 24c02 =
EEPROM, writable, 1 bytes/write<br>[25.397618 0.001771] [ =C2=A0 =C2=A02.24=
5540] aspeed-i2c-bus 1e78a100.i2c-bus: i2c bus 3 registered, irq 41<br>[25.=
399389 0.001770] [ =C2=A0 =C2=A02.253818] aspeed-i2c-bus 1e78a140.i2c-bus: =
i2c bus 4 registered, irq 42<br>[25.401156 0.001767] [ =C2=A0 =C2=A02.26196=
3] aspeed-i2c-bus 1e78a180.i2c-bus: i2c bus 5 registered, irq 43<br>[25.438=
266 0.037110] [ =C2=A0 =C2=A02.270210] aspeed-i2c-bus 1e78a1c0.i2c-bus: i2c=
 bus 6 registered, irq 44<br>[25.440232 0.001966] [ =C2=A0 =C2=A02.278519] =
aspeed-i2c-bus 1e78a300.i2c-bus: i2c bus 7 registered, irq 45<br>[25.442063=
 0.001831] [ =C2=A0 =C2=A02.286725] aspeed-i2c-bus 1e78a340.i2c-bus: i2c bu=
s 8 registered, irq 46<br>[25.443908 0.001845] [ =C2=A0 =C2=A02.294952] Dri=
ver for 1-wire Dallas network protocol.<br>[42.321590 16.877682] [ =C2=A0 1=
9.191143] SPI driver bmp280 has no spi_device_id for bosch,bmp085<br>[42.36=
9245 0.047655] [ =C2=A0 19.202063] NET: Registered PF_INET6 protocol family=
<br>[42.370710 0.001465] [ =C2=A0 19.210275] Segment Routing with IPv6<br>[=
42.371670 0.000960] [ =C2=A0 19.214194] In-situ OAM (IOAM) with IPv6<br>[42=
.372684 0.001014] [ =C2=A0 19.218587] NET: Registered PF_PACKET protocol fa=
mily<br>[42.373994 0.001310] [ =C2=A0 19.223826] 8021q: 802.1Q VLAN Support=
 v1.8<br>[42.375069 0.001075] [ =C2=A0 19.240013] printk: console [netcon0]=
 enabled<br>[42.417406 0.042337] [ =C2=A0 19.244511] netconsole: network lo=
gging started<br>[42.418871 0.001465] [ =C2=A0 19.255290] Freeing unused ke=
rnel image (initmem) memory: 1024K<br>[42.420469 0.001598] [ =C2=A0 19.2652=
90] Checked W+X mappings: passed, no W+X pages found<br>[42.421951 0.001482=
] [ =C2=A0 19.271013] Run /init as init process<br>[43.119224 0.697273] rof=
s =3D mtd4 squashfs rwfs =3D mtd5 jffs2<br>[43.346902 0.227678] [ =C2=A0 20=
.193806] jffs2: notice: (101) jffs2_build_xattr_subsystem: complete buildin=
g xattr subsystem, 26 of xdatum (15 unchecked, 7 orphan) and 34 of xref (8 =
dead, 0 orphan) found.<br>[43.522817 0.175915] Tue Apr =C2=A05 23:02:44 UTC=
 2011<br>[43.551731 0.028914] [ =C2=A0 20.397227] overlayfs: upper fs does =
not support tmpfile.<br>[43.554043 0.002311] [ =C2=A0 20.403610] overlayfs:=
 upper fs does not support RENAME_WHITEOUT.<br>[46.530198 2.976155] [ =C2=
=A0 23.376894] systemd[1]: Current system time is further ahead 15y after b=
uild time, but cannot correct: Invalid argument<br>[46.545993 0.015796] [ =
=C2=A0 23.411753] systemd[1]: Failed to find module &#39;autofs4&#39;<br>[4=
6.773107 0.227114] [ =C2=A0 23.598149] systemd[1]: systemd 251.2+ running i=
n system mode (+PAM -AUDIT -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT =
-GNUTLS -OPENSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD =
-LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -TPM2 -BZIP2 -=
LZ4 -XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON -UTMP +SYSVINIT default-hiera=
rchy=3Dhybrid)<br>[46.783382 0.010274] [ =C2=A0 23.630127] systemd[1]: Dete=
cted architecture arm.<br>[46.832963 0.049582] <br>[46.833018 0.000055] Wel=
come to Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 2.11.0=
-dev!<br>[46.836568 0.003550] <br>[46.880928 0.044360] [ =C2=A0 23.746391] =
systemd[1]: Hostname set to &lt;s7106&gt;.<br>[50.045951 3.165023] [ =C2=A0=
 26.892896] systemd[1]: /lib/systemd/system/phosphor-ipmi-net@.socket:3: In=
valid interface name, ignoring: sys-subsystem-net-devices-%i.device<br>[50.=
214922 0.168972] [ =C2=A0 27.067199] systemd[1]: Queued start job for defau=
lt target Multi-User System.<br>[50.251829 0.036907] [ =C2=A0 27.097063] sy=
stemd[1]: Created slice Slice /system/getty.<br>[50.254950 0.003120] [ =C2=
=A0OK =C2=A0] Created slice Slice /system/getty.<br>[50.295814 0.040864] [ =
=C2=A0 27.141348] systemd[1]: Created slice Slice /system/hostlogger.<br>[5=
0.298493 0.002680] [ =C2=A0OK =C2=A0] Created slice Slice /system/hostlogge=
r.<br>[50.344807 0.046314] [ =C2=A0 27.191243] systemd[1]: Created slice Sl=
ice /system/mapper-wait.<br>[50.346868 0.002061] [ =C2=A0OK =C2=A0] Created=
 slice Slice /system/mapper-wait.<br>[50.394869 0.048001] [ =C2=A0 27.24120=
0] systemd[1]: Created slice Slice /system/modprobe.<br>[50.397565 0.002697=
] [ =C2=A0OK =C2=A0] Created slice Slice /system/modprobe.<br>[50.445728 0.=
048163] [ =C2=A0 27.291502] systemd[1]: Created slice Slice /system/obmc-co=
nsole.<br>[50.448524 0.002795] [ =C2=A0OK =C2=A0] Created slice Slice /syst=
em/obmc-console.<br>[50.495677 0.047153] [ =C2=A0 27.341588] systemd[1]: Cr=
eated slice Slice /system/obmc-led-group-start.<br>[50.498699 0.003022] [ =
=C2=A0OK =C2=A0] Created slice Slice /system/obmc-led-group-start.<br>[50.5=
45669 0.046970] [ =C2=A0 27.391644] systemd[1]: Created slice Slice /system=
/phosphor-certificate-manager.<br>[50.548889 0.003220] [ =C2=A0OK =C2=A0] C=
reated slice Slice /system/phosphor-certificate-manager.<br>[50.595607 0.04=
6717] [ =C2=A0 27.441589] systemd[1]: Created slice Slice /system/phosphor-=
ipmi-kcs.<br>[50.597484 0.001877] [ =C2=A0OK =C2=A0] Created slice Slice /s=
ystem/phosphor-ipmi-kcs.<br>[50.645620 0.048136] [ =C2=A0 27.491616] system=
d[1]: Created slice Slice /system/phosphor-ipmi-net.<br>[50.649161 0.003541=
] [ =C2=A0OK =C2=A0] Created slice Slice /system/phosphor-ipmi-net.<br>[50.=
695552 0.046391] [ =C2=A0 27.541962] systemd[1]: Created slice Slice /syste=
m/serial-getty.<br>[50.698557 0.003005] [ =C2=A0OK =C2=A0] Created slice Sl=
ice /system/serial-getty.<br>[50.751634 0.053077] [ =C2=A0 27.591873] syste=
md[1]: Created slice Slice /system/xyz.openbmc_project.Chassis.Control.Powe=
r.<br>[50.755019 0.003385] [ =C2=A0OK =C2=A0] Created slice Slice /systepro=
ject.Chassis.Control.Power.<br>[50.767445 0.012426] [ =C2=A0 27.635053] sys=
temd[1]: Started Dispatch Password Requests to Console Directory Watch.<br>=
[50.795528 0.028083] [ =C2=A0OK =C2=A0] Started Dispatch Password ts to Con=
sole Directory Watch.<br>[50.829517 0.033989] [ =C2=A0 27.675029] systemd[1=
]: Started Forward Password Requests to Wall Directory Watch.<br>[50.832890=
 0.003373] [ =C2=A0OK =C2=A0] Started Forward Password Ruests to Wall Direc=
tory Watch.<br>[50.867495 0.034605] [ =C2=A0 27.718553] systemd[1]: Reached=
 target Path Units.<br>[50.869946 0.002451] [ =C2=A0OK =C2=A0] Reached targ=
et Path Units.<br>[50.883339 0.013393] [ =C2=A0 27.754327] systemd[1]: Reac=
hed target Remote File Systems.<br>[50.906378 0.023038] [ =C2=A0OK =C2=A0] =
Reached target Remote File Systems.<br>[50.942467 0.036089] [ =C2=A0 27.793=
908] systemd[1]: Reached target Slice Units.<br>[50.945024 0.002557] [ =C2=
=A0OK =C2=A0] Reached target Slice Units.<br>[50.983415 0.038391] [ =C2=A0 =
27.834719] systemd[1]: Reached target Swaps.<br>[50.985597 0.002182] [ =C2=
=A0OK =C2=A0] Reached target Swaps.<br>[51.015376 0.029778] [ =C2=A0 27.887=
004] systemd[1]: Listening on Syslog Socket.<br>[51.037815 0.022439] [ =C2=
=A0OK =C2=A0] Listening on Syslog Socket.<br>[51.100454 0.062639] [ =C2=A0 =
27.969505] systemd[1]: Listening on Process Core Dump Socket.<br>[51.123107=
 0.022654] [ =C2=A0OK =C2=A0] Listening on Process Core Dump Socket.<br>[51=
.159312 0.036204] [ =C2=A0 28.005293] systemd[1]: Listening on initctl Comp=
atibility Named Pipe.<br>[51.163193 0.003882] [ =C2=A0OK =C2=A0] Listening =
on initctl Compatibility Named Pipe.<br>[51.175196 0.012003] [ =C2=A0 28.04=
5875] systemd[1]: Journal Audit Socket was skipped because of a failed cond=
ition check (ConditionSecurity=3Daudit).<br>[51.214864 0.039668] [ =C2=A0 2=
8.060598] systemd[1]: Listening on Journal Socket (/dev/log).<br>[51.216492=
 0.001628] [ =C2=A0OK =C2=A0] Listening on Journal Socket (/dev/log).<br>[5=
1.256257 0.039765] [ =C2=A0 28.107496] systemd[1]: Listening on Journal Soc=
ket.<br>[51.258725 0.002467] [ =C2=A0OK =C2=A0] Listening on Journal Socket=
.<br>[51.302207 0.043482] [ =C2=A0 28.147892] systemd[1]: Listening on Netw=
ork Service Netlink Socket.<br>[51.305223 0.003016] [ =C2=A0OK =C2=A0] List=
ening on Network Service Netlink Socket.<br>[51.347120 0.041897] [ =C2=A0 2=
8.193666] systemd[1]: Listening on udev Control Socket.<br>[51.349171 0.002=
052] [ =C2=A0OK =C2=A0] Listening on udev Control Socket.<br>[51.391152 0.0=
41980] [ =C2=A0 28.236804] systemd[1]: Listening on udev Kernel Socket.<br>=
[51.393638 0.002487] [ =C2=A0OK =C2=A0] Listening on udev Kernel Socket.<br=
>[51.407052 0.013414] [ =C2=A0 28.277443] systemd[1]: Huge Pages File Syste=
m was skipped because of a failed condition check (ConditionPathExists=3D/s=
ys/kernel/mm/hugepages).<br>[51.449995 0.042943] [ =C2=A0 28.293533] system=
d[1]: POSIX Message Queue File System was skipped because of a failed condi=
tion check (ConditionPathExists=3D/proc/sys/fs/mqueue).<br>[51.478059 0.028=
064] [ =C2=A0 28.323738] systemd[1]: Mounting Kernel Debug File System...<b=
r>[51.480142 0.002083] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mounting Kernel De=
bug File System...<br>[51.509969 0.029828] [ =C2=A0 28.380532] systemd[1]: =
Mounting Kernel Trace File System...<br>[51.539350 0.029380] =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Mounting Kernel Trace File System...<br>[51.597110 0.05=
7761] [ =C2=A0 28.443241] systemd[1]: Mounting Temporary Directory /tmp...<=
br>[51.599710 0.002600] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mounting Temporar=
y Directory /tmp...<br>[51.629030 0.029320] [ =C2=A0 28.496720] systemd[1]:=
 Create List of Static Device Nodes was skipped because of a failed conditi=
on check (ConditionFileNotEmpty=3D/lib/modules/5.15.59-51fd11b/modules.devn=
ame).<br>[51.694985 0.065954] [ =C2=A0 28.546605] systemd[1]: Starting Load=
 Kernel Module configfs...<br>[51.698977 0.003992] =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Starting Load Kernel Module configfs...<br>[51.772951 0.073974] [=
 =C2=A0 28.625054] systemd[1]: Starting Load Kernel Module fuse...<br>[51.7=
74767 0.001815] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Load Kernel Modu=
le fuse...<br>[51.818924 0.044157] [ =C2=A0 28.665147] systemd[1]: File Sys=
tem Check on Root Device was skipped because of a failed condition check (C=
onditionPathIsReadWrite=3D!/).<br>[51.891872 0.072948] [ =C2=A0 28.743206] =
systemd[1]: Starting Journal Service...<br>[51.893559 0.001687] =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Starting Journal Service...<br>[51.965837 0.072278]=
 [ =C2=A0 28.817654] systemd[1]: Load Kernel Modules was skipped because al=
l trigger condition checks failed.<br>[51.997672 0.031836] [ =C2=A0 28.8695=
43] systemd[1]: Starting Generate network units from Kernel command line...=
<br>[52.034659 0.036987] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Generat=
e network ts from Kernel command line...<br>[52.114632 0.079973] [ =C2=A0 2=
8.985213] systemd[1]: Starting Remount Root and Kernel File Systems...<br>[=
52.136827 0.022195] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Remount Root=
 and Kernel File Systems...<br>[52.199675 0.062847] [ =C2=A0 29.069243] sys=
temd[1]: Starting Apply Kernel Variables...<br>[52.247646 0.047972] =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Apply Kernel Variables...<br>[52.343694=
 0.096048] [ =C2=A0 29.215162] systemd[1]: Starting Coldplug All udev Devic=
es...<br>[52.366999 0.023305] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Co=
ldplug All udev Devices...<br>[52.868361 0.501362] [ =C2=A0 29.720007] syst=
emd[1]: Mounted Kernel Debug File System.<br>[52.932199 0.063838] [ =C2=A0O=
K =C2=A0] Mounted Kernel Debug File System.<br>[52.989149 0.056950] [ =C2=
=A0 29.835439] systemd[1]: Mounted Kernel Trace File System.<br>[52.991677 =
0.002527] [ =C2=A0OK =C2=A0] Mounted Kernel Trace File System.<br>[53.04912=
8 0.057451] [ =C2=A0 29.895548] systemd[1]: Mounted Temporary Directory /tm=
p.<br>[53.051853 0.002725] [ =C2=A0OK =C2=A0] Mounted Temporary Directory /=
tmp.<br>[53.077029 0.025176] [ =C2=A0 29.929350] systemd[1]: modprobe@confi=
gfs.service: Deactivated successfully.<br>[53.107001 0.029972] [ =C2=A0 29.=
953102] systemd[1]: Finished Load Kernel Module configfs.<br>[53.109846 0.0=
02845] [ =C2=A0OK =C2=A0] Finished Load Kernel Module configfs.<br>[53.1680=
76 0.058229] [ =C2=A0 30.020412] systemd[1]: modprobe@fuse.service: Deactiv=
ated successfully.<br>[53.200062 0.031986] [ =C2=A0 30.046159] systemd[1]: =
Finished Load Kernel Module fuse.<br>[53.202464 0.002403] [ =C2=A0OK =C2=A0=
] Finished Load Kernel Module fuse.<br>[53.204073 0.001608] [ =C2=A0 30.068=
653] systemd[1]: Finished Generate network units from Kernel command line.<=
br>[53.254024 0.049951] [ =C2=A0OK =C2=A0] Finished Generate network units =
from Kernel command line.<br>[53.285877 0.031853] [ =C2=A0 30.158111] syste=
md[1]: Finished Remount Root and Kernel File Systems.<br>[53.338859 0.05298=
2] [ =C2=A0OK =C2=A0] Finished Remount Root and Kernel File Systems.<br>[53=
.370881 0.032022] [ =C2=A0 30.241587] systemd[1]: Finished Apply Kernel Var=
iables.<br>[53.393164 0.022284] [ =C2=A0OK =C2=A0] Finished Apply Kernel Va=
riables.<br>[53.481021 0.087857] [ =C2=A0 30.318812] systemd[1]: Reached ta=
rget Preparation for Network.<br>[53.484837 0.003816] [ =C2=A0OK =C2=A0] Re=
ached target Preparation for Network.<br>[53.496938 0.012101] [ =C2=A0 30.3=
67036] systemd[1]: FUSE Control File System was skipped because of a failed=
 condition check (ConditionPathExists=3D/sys/fs/fuse/connections).<br>[53.5=
81825 0.084887] [ =C2=A0 30.453374] systemd[1]: Mounting Kernel Configurati=
on File System...<br>[53.611489 0.029664] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Mounting Kernel Configuration File System...<br>[53.687846 0.076357] [ =
=C2=A0 30.534063] systemd[1]: Rebuild Hardware Database was skipped because=
 of a failed condition check (ConditionNeedsUpdate=3D/etc).<br>[53.703639 0=
.015793] [ =C2=A0 30.574867] systemd[1]: Platform Persistent Storage Archiv=
al was skipped because of a failed condition check (ConditionDirectoryNotEm=
pty=3D/sys/fs/pstore).<br>[53.778705 0.075066] [ =C2=A0 30.625049] systemd[=
1]: Create System Users was skipped because of a failed condition check (Co=
nditionNeedsUpdate=3D/etc).<br>[53.847799 0.069094] [ =C2=A0 30.699639] sys=
temd[1]: Starting Create Static Device Nodes in /dev...<br>[53.893642 0.045=
844] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Create Static Device Nodes =
in /dev...<br>[54.014563 0.120921] [ =C2=A0 30.866554] systemd[1]: Mounted =
Kernel Configuration File System.<br>[54.041466 0.026903] [ =C2=A0OK =C2=A0=
] Mounted Kernel Configuration File System.<br>[54.567170 0.525704] [ =C2=
=A0 31.413009] systemd[1]: Finished Create Static Device Nodes in /dev.<br>=
[54.569438 0.002267] [ =C2=A0OK =C2=A0] Finished Create Static Device Nodes=
 in /dev.<br>[54.599150 0.029712] [ =C2=A0 31.445086] systemd[1]: Reached t=
arget Preparation for Local File Systems.<br>[54.601663 0.002513] [ =C2=A0O=
K =C2=A0] Reached target Preparation for Local File Systems.<br>[54.647228 =
0.045565] [ =C2=A0 31.508256] systemd[1]: Mounting /var/volatile...<br>[54.=
679114 0.031887] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mounting /var/volatile..=
.<br>[54.775250 0.096135] [ =C2=A0 31.647359] systemd[1]: Starting Rule-bas=
ed Manager for Device Events and Files...<br>[54.841080 0.065830] =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Rule-based Managefor Device Events and =
Files...<br>[54.933032 0.091952] [ =C2=A0 31.784875] systemd[1]: Started Jo=
urnal Service.<br>[54.935395 0.002362] [ =C2=A0OK =C2=A0] Started Journal S=
ervice.<br>[55.012993 0.077598] [ =C2=A0OK =C2=A0] Mounted /var/volatile.<b=
r>[55.124927 0.111934] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Flush Jou=
rnal to Persistent Storage...<br>[55.284726 0.159799] =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Starting Load/Save Random Seed...<br>[55.344767 0.060041] [ =
=C2=A0OK =C2=A0] Reached target Local File Systems.<br>[55.615663 0.270896]=
 [ =C2=A0 32.467582] systemd-journald[134]: Received client request to flus=
h runtime journal.<br>[55.677563 0.061900] [ =C2=A0OK =C2=A0] Finished Flus=
h Journal to Persistent Storage.<br>[55.764487 0.086923] =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Starting Create Volatile Files and Directories...<br>[55.7=
96511 0.032024] [ =C2=A0OK =C2=A0] Finished Load/Save Random Seed.<br>[56.5=
78026 0.781515] [ =C2=A0OK =C2=A0] Finished Create Volatile Files and Direc=
tories.<br>[56.705990 0.127965] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting =
Network Name Resolution...<br>[56.833921 0.127931] =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Starting Network Time Synchronization...<br>[57.247735 0.413814] =
[ =C2=A0OK =C2=A0] Started Rule-based Manager for Device Events and Files.<=
br>[57.375574 0.127839] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Network =
Configuration...<br>[59.322477 1.946902] [ =C2=A0OK =C2=A0] Finished Coldpl=
ug All udev Devices.<br>[61.836220 0.003311] [ =C2=A0OK =C2=A0] Started Net=
work Time Synchronization.<br>[66.404501 0.003257] [ =C2=A0 44.006597] 8021=
q: adding VLAN 0 to HW filter on device eth0<br>[67.310624 0.906122] [ =C2=
=A0OK =C2=A0] Started Network Configuration.<br>[67.461615 0.150991] [ =C2=
=A0OK =C2=A0] Started Network Name Resolution.<br>[67.573481 0.111866] [ =
=C2=A0OK =C2=A0] Found device /sys/subsystem/net/devices/eth0.<br>[69.84018=
9 2.266707] [ =C2=A0OK =C2=A0] Created slice Slice /system/xyz.openbmc_proj=
ect.Hwmon.<br>[69.885086 0.044898] [ =C2=A0OK =C2=A0] Created slice Slice /=
systepenbmc_project.led.controller.<br>[69.917047 0.031961] [ =C2=A0OK =C2=
=A0] Reached target Network.<br>[69.956052 0.039005] [ =C2=A0OK =C2=A0] Rea=
ched target Host and Network Name Lookups.<br>[69.994986 0.038934] [ =C2=A0=
OK =C2=A0] Reached target System Time Set.<br>[70.024949 0.029963] [ =C2=A0=
OK =C2=A0] Reached target Hardware activated USB gadget.<br>[70.089049 0.06=
4100] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Load Kernel Module fuse...=
<br>[70.168915 0.079866] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Wait fo=
r Network to be Configured...<br>[70.261885 0.092970] =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Starting Wait for udev To plete Device Initialization...<br>[7=
0.378769 0.116884] [ =C2=A0OK =C2=A0] Finished Load Kernel Module fuse.<br>=
[70.511690 0.132921] [ =C2=A0OK =C2=A0] Finished Wait for udev To Complete =
Device Initialization.<br>[70.623694 0.112004] [ =C2=A0OK =C2=A0] Started H=
ardware RNG Entropy Gatherer Daemon.<br>[70.655513 0.031819] [ =C2=A0OK =C2=
=A0] Reached target System Initialization.<br>[70.736570 0.081057] [ =C2=A0=
OK =C2=A0] Started Daily rotation of log files.<br>[70.775594 0.039024] [ =
=C2=A0OK =C2=A0] Started Daily Cleanup of Temporary Directories.<br>[70.815=
531 0.039937] [ =C2=A0OK =C2=A0] Reached target Timer Units.<br>[70.871529 =
0.055998] [ =C2=A0OK =C2=A0] Listening on Avahi mDNS/DNS-SD Stack Activatio=
n Socket.<br>[70.966407 0.094877] [ =C2=A0OK =C2=A0] Listening on BMC Webse=
rver socket.<br>[71.030405 0.063998] [ =C2=A0OK =C2=A0] Listening on D-Bus =
System Message Bus Socket.<br>[71.196403 0.165998] [ =C2=A0OK =C2=A0] Liste=
ning on dropbear.socket.<br>[71.292238 0.095835] [ =C2=A0 48.163528] ftgmac=
100 1e680000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx<br=
>[71.320861 0.028622] [ =C2=A0 48.171909] IPv6: ADDRCONF(NETDEV_CHANGE): et=
h1: link becomes ready<br>[71.430178 0.109317] [ =C2=A0OK =C2=A0] Listening=
 on Phosphor Hostole SSH Per-Connection socket.<br>[71.526094 0.095916] [ =
=C2=A0OK =C2=A0] Listening on phosphor-ipmi-net@eth0.socket.<br>[71.586054 =
0.059961] [ =C2=A0OK =C2=A0] Reached target Socket Units.<br>[71.666205 0.0=
80151] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting D-Bus System Message Bus.=
..<br>[72.801349 1.135144] [ =C2=A0OK =C2=A0] Started D-Bus System Message =
Bus.<br>[73.068098 0.266749] [ =C2=A0OK =C2=A0] Reached target Basic System=
.<br>[73.180175 0.112077] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Avahi =
mDNS/DNS-SD Stack...<br>[73.242047 0.061872] [ =C2=A0OK =C2=A0] Started Sta=
rt bmcweb server.<br>[73.385968 0.143922] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Starting Clear one time boot overrides...<br>[73.497921 0.111952] [ =C2=
=A0OK =C2=A0] Started Collectd.<br>[73.721807 0.223886] =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Starting SSH Key Generation...<br>[73.833714 0.111908] [ =
=C2=A0OK =C2=A0] Started LPC Snoop Daemon.<br>[73.897783 0.064069] =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Name Service Cache Daemon...<br>[73.945=
774 0.047991] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting LDAP daemon...<br>=
[74.370455 0.424681] [ =C2=A0OK =C2=A0] Started ttyS2 Console Server.<br>[7=
4.536364 0.165909] [DEPEND] Dependency failed for Host logger for ttyVUART0=
.<br>[74.680219 0.143855] [ =C2=A0OK =C2=A0] Started Phosphor Dump core mon=
itor..<br>[75.061063 0.380844] [ =C2=A0OK =C2=A0] Started Phosphor certific=
ate manager for authority.<br>[75.471731 0.410668] [ =C2=A0OK =C2=A0] Start=
ed Phosphor certificate manager for bmcweb.<br>[75.845591 0.373860] [ =C2=
=A0OK =C2=A0] Started Phosphor certificate manager for nslcd.<br>[76.053437=
 0.207846] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting BMC health monitoring=
...<br>[76.405303 0.351866] [ =C2=A0OK =C2=A0] Started Lightweight SLP Serv=
er.<br>[76.740922 0.335620] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Open=
BMC ipKVM daemon...<br>[77.044809 0.303887] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Starting Permit User Sessions...<br>[77.252684 0.207875] =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Starting Enable Linux trace events in the boot loader..=
.<br>[77.517459 0.264774] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Intel =
Power Control for the Host 0...<br>[77.789325 0.271866] =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Starting Phosphor Dump Manager...<br>[77.917117 0.127793] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Entity Manager...<br>[78.077091 =
0.159973] [ =C2=A0OK =C2=A0] Started Fru Device.<br>[78.371989 0.294899] [ =
=C2=A0OK =C2=A0] Started IPMI SEL Logging Service.<br>[78.595787 0.223798] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Phosphor Log Manager...<br>[79.3=
95339 0.799552] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Phosphor DBus Se=
rvice Discovery Manager...<br>[79.523156 0.127818] =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Starting Phosphor Settings Daemon...<br>[79.603066 0.079910] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Phosphor Download Manager...<br>[79=
.922962 0.319896] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Post code mana=
ger...<br>[80.050937 0.127975] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting R=
syslog config updater...<br>[80.354702 0.303764] =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Starting Telemetry...<br>[80.562499 0.207797] =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Starting Phosphor User Manager...<br>[80.792450 0.229951] =
[ =C2=A0OK =C2=A0] Started Phosphor sysfs LED controller.<br>[81.256206 0.4=
63756] [ =C2=A0OK =C2=A0] Started Phosphor sysfs LED controller.<br>[83.070=
060 1.813854] [ =C2=A0OK =C2=A0] Finished Wait for Network to be Configured=
.<br>[83.507784 0.437724] [ =C2=A0OK =C2=A0] Finished SSH Key Generation.<b=
r>[83.760672 0.252888] [ =C2=A0OK =C2=A0] Started Name Service Cache Daemon=
.<br>[83.851574 0.090902] [ =C2=A0OK =C2=A0] Started OpenBMC ipKVM daemon.<=
br>[83.888570 0.036996] [ =C2=A0 60.740209] ftgmac100 1e660000.ethernet eth=
0: NCSI: No channel found to configure!<br>[83.967398 0.078828] [ =C2=A0OK =
=C2=A0] Finished Permit User Sessions.<br>[84.047391 0.079993] [ =C2=A0OK =
=C2=A0] Finished Enable Linux trace events in the boot loader.<br>[84.73511=
0 0.687719] [ =C2=A0OK =C2=A0] Finished Clear one time boot overrides.<br>[=
84.894970 0.159860] [ =C2=A0 61.762821] ftgmac100 1e660000.ethernet eth0: W=
rong NCSI state 0x100 in workqueue<br>[85.549486 0.654515] [ =C2=A0OK =C2=
=A0] Started Phosphor Settings Daemon.<br>[85.765249 0.215764] [ =C2=A0OK =
=C2=A0] Started Phosphor Download Manager.<br>[85.768340 0.003091] [ =C2=A0=
OK =C2=A0] Started Post code manager.<br>[85.869289 0.100949] [ =C2=A0OK =
=C2=A0] Started Intel Power Control for the Host 0.<br>[85.901206 0.031917]=
 [ =C2=A0OK =C2=A0] Started LDAP daemon.<br>[86.011219 0.110013] [ =C2=A0OK=
 =C2=A0] Started BMC health monitoring.<br>[86.091021 0.079802] [ =C2=A0OK =
=C2=A0] Started Phosphor Log Manager.<br>[86.106979 0.015958] [ =C2=A0OK =
=C2=A0] Started Rsyslog config updater.<br>[86.361989 0.255010] [ =C2=A0OK =
=C2=A0] Started Phosphor DBus Service Discovery Manager.<br>[86.425885 0.06=
3896] [ =C2=A0OK =C2=A0] Started Telemetry.<br>[86.553790 0.127905] [ =C2=
=A0OK =C2=A0] Started Phosphor User Manager.<br>[86.793664 0.239874] [ =C2=
=A0OK =C2=A0] Reached target Network is Online.<br>[86.899669 0.106005] [ =
=C2=A0OK =C2=A0] Reached target Phosphor Object Mapper.<br>[87.272368 0.372=
699] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Wait for /xyz/opecontrol/ho=
st0/boot/one_time...<br>[87.640217 0.367849] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Starting Wait for /xyz/ope_project/control/host0/boot...<br>[87.89498=
0 0.254763] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Wait for /xyz/ope/ho=
st0/power_restore_policy...<br>[88.241803 0.346823] =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Starting Wait for /xyz/opetrol/host0/restriction_mode...<br>[8=
8.545633 0.303830] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Wait for /xyz=
/opeoject/led/groups/bmc_booted...<br>[88.882431 0.336798] =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Starting Wait for /xyz/opemc_project/time/sync_method..=
.<br>[89.071213 0.188782] [ =C2=A0OK =C2=A0] Started phosphor systemd targe=
t monitor.<br>[89.375118 0.303905] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starti=
ng System Logging Service...<br>[89.701887 0.326770] [ =C2=A0OK =C2=A0] Sta=
rted Serial Getty on ttyS4.<br>[89.764756 0.062869] [ =C2=A0OK =C2=A0] Reac=
hed target Login Prompts.<br>[90.459415 0.694659] =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Starting Phosphor LED Group Management Daemon...<br>[90.744264 0.=
284849] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Phosphor Ldap config upd=
ater...<br>[90.920100 0.175835] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting =
Phosphor Network Manager...<br>[91.335809 0.415709] =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Starting OpenBMC Software Update Manager...<br>[91.653723 0.31=
7914] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Phosphor BMC State Manager=
...<br>[94.032272 2.378549] [ =C2=A0OK =C2=A0] Started System Logging Servi=
ce.<br>[94.176078 0.143806] [ =C2=A0OK =C2=A0] Finished Wait for /xyz/opet/=
control/host0/boot/one_time.<br>[94.325020 0.148942] [ =C2=A0OK =C2=A0] Fin=
ished Wait for /xyz/opemc_project/control/host0/boot.<br>[94.452987 0.12796=
7] [ =C2=A0OK =C2=A0] Finished Wait for /xyz/opeol/host0/power_restore_poli=
cy.<br>[94.592883 0.139896] [ =C2=A0OK =C2=A0] Finished Wait for /xyz/opeon=
trol/host0/restriction_mode.<br>[94.714805 0.121922] [ =C2=A0OK =C2=A0] Fin=
ished Wait for /xyz/openbmc_project/time/sync_method.<br>[94.825732 0.11092=
7] [ =C2=A0OK =C2=A0] Started Phosphor Dump Manager.<br>[95.438527 0.612794=
] <br>[95.438650 0.000123] Phosphor OpenBMC (Phosphor OpenBMC Project Refer=
ence Distro) nodistro.0 s7106 ttyS4<br>[95.442250 0.003600] <br>[95.442283 =
0.000033] s7106 login: root (automatic login)<br>[95.443164 0.000881]<br>``=
`</div></div>

--000000000000988a3405e880cbe1--
