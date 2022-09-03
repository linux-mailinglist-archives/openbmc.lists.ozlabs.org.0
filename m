Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4F45B5A52
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:43:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5qh392Sz30B1
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:43:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ciJjTuUP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=66.163.190.31; helo=sonic307-56.consmr.mail.ne1.yahoo.com; envelope-from=hr_mehrabian@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ciJjTuUP;
	dkim-atps=neutral
Received: from sonic307-56.consmr.mail.ne1.yahoo.com (sonic307-56.consmr.mail.ne1.yahoo.com [66.163.190.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKXQt5ShFz2xrW
	for <openbmc@lists.ozlabs.org>; Sat,  3 Sep 2022 21:21:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1662204064; bh=HBWQhq+aefSveXIDA7fe4IGJUYIpTLyyYgUanO9BqTw=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=ciJjTuUPzc0eaUz5OsAkLa43OsjRsatrqJ1SKbfNdiyOCH8FHyr0chAMw2wUQnwEXzQ1G87D9eO/nMZmuiytCaPU29pbSh2VHeh9TyR8URMgWhQsNbcZEWlOnVWEuvqdbkub98xMNyfQCCD6S0g3oLU+4Xman2UNCEMV6AOsWq3JrlpO9iJOWgg72Tbweg7if1TEeX5rY/VJK1FRtWsDmOm5IEqkEm+a+3dL5DHBvzlqHjGNUWCviN2Tqntl7cfgSp3IfqTWecnWujbTyMXHtUQ2W7rZHuusHrUgjA3lUals+MxN0FKpAn+xxoIAFgpNQ06c0EroASmzy6tTtI9UbA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1662204064; bh=UUzDs9g52GnNQPnL7rzO+depXrgZPdUDu4a2q8QXr8Q=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=d5CCTlwB4aqSygojkoEfFMujAcBIWSKrURyz/VhiWgeLRuDrZjd5dBNICshJgK6jv8fx1XfVU15h2cPdToSNiSijjU/AV5pa0hafOQOQXPdqPrV6IFMjIfhn1E7q3O/Sxryr4m0ideIKwXriASDtR231IGhGqH1wjskTuwvjvXMckRPYW3gtr6AOuJLQFFkdp9UyIxmJaG3IzJ0sxlaRtVYMPo8LFWpdrCJeYo1dFZjhcXolhLlJCuix2xWzyneAvXwS/i7rYMkRlgP3JYQR9WNsKWwj8NdQHbrwRJdR6Ptt5UdXtPw8RIXbjMdeD8nZZ5J3aGG8DEtEjS9YDniKFw==
X-YMail-OSG: eBwjtXEVM1lPisMjjmNE8rRvPThXsT1OrOsQqVa3gUE9DWUzE_66a61dS.LNexv
 RRquh3mSps5NfWYqTO_JtXr3Fc7AvxbaVvolFiW6oDOZv9ThXnCYjrPbvQ33Gdc16WiyA_zz8Wty
 srsXfhnv_mqPOaTN2SxEPwhtFeGQ2_KfHkpiQW69RF2dnClfMLiSrGVtWPM_Aho_ijkePX9FxHPQ
 yd2ywsuLgX0TjfK4abfiHl__8OzeylCxG_RJFfuokmWbQz87Nkpkg6Ebx0IDFW981FG9AF1gWWSt
 .LYH9M.sglyQ.kKRtKY59DOXP_eSd.Gj35.3CAr0IjmeC2XauZ_l34BG83PCu5Y0oSrC2a.tch3Y
 XUGBsm4bj0bL9iG98r1jDDExNwAD254ooJxgXHnVd_MIIKGqEvv6bFxH34qWy4Oh6jD0Ws2Li1.B
 xKP0tWWu_tyCOuI7e5ucXLlgMtDb8IzLSmoRpnQ1NAuYwypqg3q90Xsf9wygjlZLxAua.IXivjPP
 wE0chpX1ndoskcJ3Fd6oiDxQA8DE107PLyj_GjUP4gUYaWlIZO5LjTZBIe6ACD431b4NOlYf0be_
 eqDy3loaGfRtrXHYS0y_10g9eLXRZRt7AZYDgM8s_5FecNRY2N6AnM0VydS.9StAtPGJKtB_8.PV
 lMczEuG.r.SgTASLaF.XcDKrzerRzc4FiAYBfHx0B5SDczZEcpjnwBUVWu7.UWLodvNUeJ5dsKWF
 N37obTVz.vhBPR4H.KRSWAWJ5qvrJMrxVOt5HOhUGBZC0r4t2aB77eklJwNnl2ao61XhtaEBIg7E
 SB0ZMq458AWpRd3JbbElOYpCqo7KGmrKA_WVhE9xgDGTISaMCYx9DsLizpf.NqtkP.UoQdKr7cOY
 6g2PQgvufKM80KjK7XxH6LYAuAlE7HScZyqAUAhpuE67vJfDZPbQ50x4yAk3BECorbJ8Lzat_Yns
 tT3_1rfPbBjw07G.SyZw0quay3uweluwtEZ0p6DlsNhJQtuyBAA1lS.RDg603lcipsSDYPgUcW3E
 9xHWCyNbNAj6M3iYrBpsZ07HJzOZkO2hR1oZTWj7Xr1qVgS12r4YofLcGF6ibn9cY558MUWMza9y
 JLoiVxKpTVH1lA_7sTlQEMDrucgmhmfvrhYJDDnqXH9J2j6X90CsKBaB1g63s5FxZp4yjmNhOMbS
 HY4qaWgs_KwiaT5ZnWATqPVFVomcVMIXiF6iZ90OjqtHPAKuWLgocX_uOawwP4TFnF3tIswZhild
 T9PeoCrlSdxd9FXNKPAvkqKp7pYq2JUpE2M3hBaaP8wBD4iXdWlYaxhbiwnwjI8Pl9Z2OVSorX7Y
 5FzHZV90hufvwWVJkm8wv7REZBspIptfZXIUYm_VDWehHTN9HcI.Nor5Feez3GLLZebHOaDkDV7l
 Wp7LyOaLUMtJA7m.wIR2ukYALBPxaCsQvfyCzyhGE6DGFmhMElSHBnFSiHe_oQJZoaEJA0VsUF_4
 Sse6Kz_WTDhjJ87.WZp1c4hr.XLZckXIeZCXjVJRQjKQChOffNP.Qzi7tpE2O1q_wS5Sbuun9mgI
 6IL6FPi_WW9hEORc6KP66Iko1jmWqQYc_jwXYm_GOycbbY3GEWQMCGLrK8LtyicoojT0HU2OKIre
 vD15NAxwExCtZnFOxK0_ZoQnyNZcPqXTMPWZzx_mVae9iz4aG_ZJyhotY9gBq3uC5kEuzFp75jdC
 M7.adLTIBu6IfPaqiyfBJm9zuOx_QKquSbh1MkrwxUVEpQJ9c2rUZTfWXyr9if2wkOieyVX7zW0M
 Rix2Bsa16sdLzXoXz04ARLfdVRmyZDvRH2UQ3dPkcu3VV8ZgXGzeACWenzNonF472pETGIEwMxF1
 5WPE4QsW8dvN1IxqXPhs5U957oZtvnUzDNllySv5bGMqqNbYUWB3sGuYT.Ky2.FT.kTQctLw2IDU
 j9r_UsVY_Zff_SnmHSZMcP9H2nLms8KyK6kmh8QDbNUJacve_KeKoLb1PgiC_wDGmRbYdlaUa42t
 3stp4.iBG8z_pp0j94FSHl5IFZZsS50305__Jms8tLyEikjTk1wzAbX9kFOwB3dK0NebXkBm8xxA
 IV9BCzc2hI00KTN5FmuibnXArAOjtDh3nxdloD6TZDjKLfmOGKvYLWVrPW.NQURuKbn3jTHkp0Zu
 NweZIv6biflJsZpj75W.4qwjHQh26678izCHTbytZbVsQ8KxxhL0S729o0AarmWoSEjvyZLOoQEh
 QU7XCp7Rh8TcPsYHVaHP1SFqk5l314sOtOw--
X-Sonic-MF: <hr_mehrabian@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Sat, 3 Sep 2022 11:21:04 +0000
Date: Sat, 3 Sep 2022 11:21:03 +0000 (UTC)
From: Hamid reza Mehrabian <hr_mehrabian@yahoo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <1919673638.3824165.1662204063469@mail.yahoo.com>
Subject: Porting OBMC
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3824164_481857794.1662204063457"
References: <1919673638.3824165.1662204063469.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20595 YMailNorrin
X-Mailman-Approved-At: Mon, 12 Sep 2022 22:41:37 +1000
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

------=_Part_3824164_481857794.1662204063457
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,
I'm trying to port OBMC to a new server motherboard. some of the hardware s=
pecification:

- 3rd Gen Intel Xeon Scalable Processor x2 slots
- Intel=C2=AE C621A chipset
- ASPEED AST2500
- x6 Fan with tacho

Are Done :
I wrote the device tree according to its schematic and other similar server=
 motherboards. Also, I wrote a new JSON configuration for Entity-Manager an=
d x86-Power-Control. I created .conf files of the sensors in /recipes-phosp=
hor/sensors/phosphor-hwmon/obmc/hwmon/*.

Current Status :
- I can watch the Sensors and ADC values correctly.
- I can see current power status and turn off/on the server.
Current Problems :
- PWM of all fans is set on 100%.
- BIOS is frozen at DXE running stage.

conf/machine/test_obmc.conf :
...
VRTUAL-RUNTIME_obmc-inventory-manager =3D "entity-manager=E2=80=9D
VRTUAL-RUNTIME_obmc-sensors-hwmon =3D "dbus-sensors=E2=80=9D
VRTUAL-RUNTIME_obmc-host-state-manager =3D "x86-power-control=E2=80=9D
VRTUAL-RUNTIME_obmc-chassis-state-manager =3D "x86-power-control=E2=80=9D
VRTUAL-RUNTIME_obmc-fan-control =3D "phosphor-pid-control=E2=80=9D

recipes-kernel/linux/linux-aspeed/test_obmc.cfg :
...
CONFIG_PECI=3Dy
...

My Questions :
- I built the sensors .conf files in /reciptes-phosphor/sensors/*. Is it ne=
eded spite Entity-Manager has been configured?
- Why isn't `/dev/peci-1` created though `CONFIG_PECI=3Dy`?=C2=A0 Is it rea=
son of restarting CPU Sensor service?
- I defines two LED as `heartbeat` and `system-fault` inside the DTS file.=
=C2=A0 What's the problem with `Phosphor LED Group Management?
- Why all of the PWM values are invalid? I set `phosphor-pid-control`, Alth=
ough, There are multiple errors with PWM and tacho sensors.

journalctl output :
Jan 01 00:00:12 test_obmc kernel: Booting Linux on physical CPU 0x0
Jan 01 00:00:12 test_obmc kernel: Linux version 5.15.36-8ddab47 (oe-user@oe=
-host) (arm-openbmc-linux-gnueabi-gcc (GCC) 11.3.0, GNU ld (GNU Binutils) 2=
.38.20220313) #1 Tue May 3 06:36:43 UTC 2022
Jan 01 00:00:12 test_obmc kernel: CPU: ARMv6-compatible processor [410fb767=
] revision 7 (ARMv7), cr=3D00c5387d
Jan 01 00:00:12 test_obmc kernel: CPU: PIPT / VIPT nonaliasing data cache, =
VIPT nonaliasing instruction cache
Jan 01 00:00:12 test_obmc kernel: OF: fdt: Machine model: ASRock test_obmc
Jan 01 00:00:12 test_obmc kernel: Memory policy: Data cache writeback
Jan 01 00:00:12 test_obmc kernel: cma: Reserved 16 MiB at 0x9d800000
Jan 01 00:00:12 test_obmc kernel: Zone ranges:
Jan 01 00:00:12 test_obmc kernel:=C2=A0=C2=A0 Normal=C2=A0 em 0x00000000800=
00000-0x000000009effffff]
Jan 01 00:00:12 test_obmc kernel: Movable zone start for each node
Jan 01 00:00:12 test_obmc kernel: Early memory node ranges
Jan 01 00:00:12 test_obmc kernel:=C2=A0=C2=A0 node=C2=A0=C2=A0 0:em 0x00000=
00080000000-0x000000009effffff]
Jan 01 00:00:12 test_obmc kernel: Initmem setup node 0em 0x0000000080000000=
-0x000000009effffff]
Jan 01 00:00:12 test_obmc kernel: Built 1 zonelists, mobility grouping on.=
=C2=A0 Total pages: 125984
Jan 01 00:00:12 test_obmc kernel: Kernel command line: console=3DttyS4,1152=
00n8 root=3D/dev/ram rw
Jan 01 00:00:12 test_obmc kernel: Dentry cache hash table entries: 65536 (o=
rder: 6, 262144 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: Inode-cache hash table entries: 32768 (or=
der: 5, 131072 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: mem auto-init: stack:off, heap alloc:off,=
 heap free:off
Jan 01 00:00:12 test_obmc kernel: Memory: 474768K/507904K available (7168K =
kernel code, 664K rwdata, 1556K rodata, 1024K init, 160K bss, 16752K reserv=
ed, 16384K cma-reserved)
Jan 01 00:00:12 test_obmc kernel: random: get_random_u32 called from __kmem=
_cache_create+0x30/0x400 with crng_init=3D0
Jan 01 00:00:12 test_obmc kernel: SLUB: HWalign=3D32, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D1, Nodes=3D1
Jan 01 00:00:12 test_obmc kernel: ftrace: allocating 23765 entries in 47 pa=
ges
Jan 01 00:00:12 test_obmc kernel: ftrace: allocated 47 pages with 5 groups
Jan 01 00:00:12 test_obmc kernel: trace event string verifier disabled
Jan 01 00:00:12 test_obmc kernel: NR_IRQS: 16, nr_irqs: 16, preallocated ir=
qs: 16
Jan 01 00:00:12 test_obmc kernel: i2c controller registered, irq 17
Jan 01 00:00:12 test_obmc kernel: clocksource: FTTMR010-TIMER2: mask: 0xfff=
fffff max_cycles: 0xffffffff, max_idle_ns: 77222644334 ns
Jan 01 00:00:12 test_obmc kernel: sched_clock: 32 bits at 24MHz, resolution=
 40ns, wraps every 86767015915ns
Jan 01 00:00:12 test_obmc kernel: Switching to timer-based delay loop, reso=
lution 40ns
Jan 01 00:00:12 test_obmc kernel: Calibrating delay loop (skipped), value c=
alculated using timer frequency.. 49.50 BogoMIPS (lpj=3D247500)
Jan 01 00:00:12 test_obmc kernel: pid_max: default: 32768 minimum: 301
Jan 01 00:00:12 test_obmc kernel: Mount-cache hash table entries: 1024 (ord=
er: 0, 4096 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: Mountpoint-cache hash table entries: 1024=
 (order: 0, 4096 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: CPU: Testing write buffer coherency: ok
Jan 01 00:00:12 test_obmc kernel: Setting up static identity map for 0x8010=
0000 - 0x80100038
Jan 01 00:00:12 test_obmc kernel: ASPEED AST2500 rev A2 (04030303)
Jan 01 00:00:12 test_obmc kernel: devtmpfs: initialized
Jan 01 00:00:12 test_obmc kernel: clocksource: jiffies: mask: 0xffffffff ma=
x_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
Jan 01 00:00:12 test_obmc kernel: futex hash table entries: 256 (order: -1,=
 3072 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: pinctrl core: initialized pinctrl subsyst=
em
Jan 01 00:00:12 test_obmc kernel: NET: Registered PF_NETLINK/PF_ROUTE proto=
col family
Jan 01 00:00:12 test_obmc kernel: DMA: preallocated 256 KiB pool for atomic=
 coherent allocations
Jan 01 00:00:12 test_obmc kernel: hw-breakpoint: found 6 breakpoint and 1 w=
atchpoint registers.
Jan 01 00:00:12 test_obmc kernel: hw-breakpoint: maximum watchpoint size is=
 4 bytes.
Jan 01 00:00:12 test_obmc kernel: mc: Linux media interface: v0.10
Jan 01 00:00:12 test_obmc kernel: videodev: Linux video capture interface: =
v2.00
Jan 01 00:00:12 test_obmc kernel: pps_core: LinuxPPS API ver. 1 registered
Jan 01 00:00:12 test_obmc kernel: pps_core: Software ver. 5.3.6 - Copyright=
 2005-2007 Rodolfo Giometti <giometti@linux.it>
Jan 01 00:00:12 test_obmc kernel: PTP clock support registered
Jan 01 00:00:12 test_obmc kernel: clocksource: Switched to clocksource FTTM=
R010-TIMER2
Jan 01 00:00:12 test_obmc kernel: NET: Registered PF_INET protocol family
Jan 01 00:00:12 test_obmc kernel: IP idents hash table entries: 8192 (order=
: 4, 65536 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: tcp_listen_portaddr_hash hash table entri=
es: 512 (order: 0, 4096 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: TCP established hash table entries: 4096 =
(order: 2, 16384 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: TCP bind hash table entries: 4096 (order:=
 2, 16384 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: TCP: Hash tables configured (established =
4096 bind 4096)
Jan 01 00:00:12 test_obmc kernel: UDP hash table entries: 256 (order: 0, 40=
96 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: UDP-Lite hash table entries: 256 (order: =
0, 4096 bytes, linear)
Jan 01 00:00:12 test_obmc kernel: NET: Registered PF_UNIX/PF_LOCAL protocol=
 family
Jan 01 00:00:12 test_obmc kernel: Unpacking initramfs...
Jan 01 00:00:12 test_obmc kernel: workingset: timestamp_bits=3D30 max_order=
=3D17 bucket_order=3D0
Jan 01 00:00:12 test_obmc kernel: squashfs: version 4.0 (2009/01/31) Philli=
p Lougher
Jan 01 00:00:12 test_obmc kernel: jffs2: version 2.2. (SUMMARY)=C2=A0 =C2=
=A9 2001-2006 Red Hat, Inc.
Jan 01 00:00:12 test_obmc kernel: NET: Registered PF_ALG protocol family
Jan 01 00:00:12 test_obmc kernel: gpio-794 (bmc-ready): hogged as output/hi=
gh
Jan 01 00:00:12 test_obmc kernel: gpio-832 (bmc-smb): hogged as output/low
Jan 01 00:00:12 test_obmc kernel: ast-kcs-bmc 1e78902c.kcs: Initialised raw=
 client for channel 3
Jan 01 00:00:12 test_obmc kernel: ast-kcs-bmc 1e78902c.kcs: Initialised IPM=
I client for channel 3
Jan 01 00:00:12 test_obmc kernel: ast-kcs-bmc 1e78902c.kcs: Initialised cha=
nnel 3 at 0xca2
Jan 01 00:00:12 test_obmc kernel: Serial: 8250/16550 driver, 6 ports, IRQ s=
haring enabled
Jan 01 00:00:12 test_obmc kernel: printk: console [ttyS4] disabled
Jan 01 00:00:13 test_obmc kernel: 1e784000.serial: ttyS4 at MMIO 0x1e784000=
 (irq =3D 31, base_baud =3D 1500000) is a 16550A
Jan 01 00:00:13 test_obmc kernel: printk: console [ttyS4] enabled
Jan 01 00:00:13 test_obmc kernel: timeriomem_rng 1e6e2078.hwrng: 32bits fro=
m 0x(ptrval) @ 1us
Jan 01 00:00:13 test_obmc kernel: random: fast init done
Jan 01 00:00:13 test_obmc kernel: random: crng init done
Jan 01 00:00:13 test_obmc kernel: loop: module loaded
Jan 01 00:00:13 test_obmc kernel: spi-nor spi0.0: w25q512jv (65536 Kbytes)
Jan 01 00:00:13 test_obmc kernel: spi-aspeed-smc 1e620000.spi: CE0 read bus=
width:2 [0x203c0641]
Jan 01 00:00:13 test_obmc kernel: 5 fixed-partitions partitions found on MT=
D device bmc
Jan 01 00:00:13 test_obmc kernel: Creating 5 MTD partitions on "bmc":
Jan 01 00:00:13 test_obmc kernel: 0x000000000000-0x0000000e0000 : "u-boot"
Jan 01 00:00:13 test_obmc kernel: 0x0000000e0000-0x000000100000 : "u-boot-e=
nv"
Jan 01 00:00:13 test_obmc kernel: 0x000000100000-0x000000a00000 : "kernel"
Jan 01 00:00:13 test_obmc kernel: 0x000000a00000-0x000002a00000 : "rofs"
Jan 01 00:00:13 test_obmc kernel: 0x000002a00000-0x000004000000 : "rwfs"
Jan 01 00:00:13 test_obmc kernel: spi-nor spi1.0: unrecognized JEDEC id byt=
es: 00 00 00 00 00 00
Jan 01 00:00:13 test_obmc kernel: spi-nor: probe of spi1.0 failed with erro=
r -2
Jan 01 00:00:13 test_obmc kernel: ftgmac100 1e660000.ethernet: Generated ra=
ndom MAC address 2e:28:4e:8b:ce:8a
Jan 01 00:00:13 test_obmc kernel: RTL8211E Gigabit Ethernet 1e660000.ethern=
et--1:00: attached PHY driver (mii_bus:phy_addr=3D1e660000.ethernet--1:00, =
irq=3DPOLL)
Jan 01 00:00:13 test_obmc kernel: ftgmac100 1e660000.ethernet eth0: irq 20,=
 mapped at f4c72443
Jan 01 00:00:13 test_obmc kernel: aspeed_vhub 1e6a0000.usb-vhub: Initialize=
d virtual hub in USB2 mode
Jan 01 00:00:13 test_obmc kernel: Mass Storage Function, version: 2009/09/1=
1
Jan 01 00:00:13 test_obmc kernel: LUN: removable file: (no medium)
Jan 01 00:00:13 test_obmc kernel: no file given for LUN0
Jan 01 00:00:13 test_obmc kernel: udc 1e6a0000.usb-vhub:p1: failed to start=
 g_mass_storage: -22
Jan 01 00:00:13 test_obmc kernel: i2c_dev: i2c /dev entries driver
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a040.i2c-bus: i2c bus =
0 registered, irq 33
Jan 01 00:00:13 test_obmc kernel: at24 1-0053: 16384 byte 24c128 EEPROM, wr=
itable, 64 bytes/write
Jan 01 00:00:13 test_obmc kernel: pca953x 1-001c: using no AI
Jan 01 00:00:13 test_obmc kernel: pca953x 1-001c: failed writing register
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a080.i2c-bus: i2c bus =
1 registered, irq 34
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a0c0.i2c-bus: i2c bus =
2 registered, irq 35
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a100.i2c-bus: i2c bus =
3 registered, irq 36
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a140.i2c-bus: i2c bus =
4 registered, irq 37
Jan 01 00:00:13 test_obmc kernel: Freeing initrd memory: 1084K
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a180.i2c-bus: i2c bus =
5 registered, irq 38
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a1c0.i2c-bus: i2c bus =
6 registered, irq 39
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a300.i2c-bus: i2c bus =
7 registered, irq 40
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a340.i2c-bus: i2c bus =
8 registered, irq 41
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a380.i2c-bus: i2c bus =
9 registered, irq 42
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a3c0.i2c-bus: i2c bus =
10 registered, irq 43
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a400.i2c-bus: i2c bus =
11 registered, irq 44
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a440.i2c-bus: i2c bus =
12 registered, irq 45
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a480.i2c-bus: i2c bus =
13 registered, irq 46
Jan 01 00:00:13 test_obmc kernel: pca954x 4-0038: probe failed
Jan 01 00:00:13 test_obmc kernel: pca954x 5-0038: probe failed
Jan 01 00:00:13 test_obmc kernel: pca954x 12-0071: probe failed
Jan 01 00:00:13 test_obmc kernel: Driver for 1-wire Dallas network protocol=
.
Jan 01 00:00:13 test_obmc kernel: SPI driver bmp280 has no spi_device_id fo=
r bosch,bmp085
Jan 01 00:00:13 test_obmc kernel: NET: Registered PF_INET6 protocol family
Jan 01 00:00:13 test_obmc kernel: Segment Routing with IPv6
Jan 01 00:00:13 test_obmc kernel: In-situ OAM (IOAM) with IPv6
Jan 01 00:00:13 test_obmc kernel: NET: Registered PF_PACKET protocol family
Jan 01 00:00:13 test_obmc kernel: 8021q: 802.1Q VLAN Support v1.8
Jan 01 00:00:13 test_obmc kernel: printk: console [netcon0] enabled
Jan 01 00:00:13 test_obmc kernel: netconsole: network logging started
Jan 01 00:00:13 test_obmc kernel: Freeing unused kernel image (initmem) mem=
ory: 1024K
Jan 01 00:00:13 test_obmc kernel: Checked W+X mappings: passed, no W+X page=
s found
Jan 01 00:00:13 test_obmc kernel: Run /init as init process
Jan 01 00:00:13 test_obmc kernel: jffs2: notice: (100) jffs2_build_xattr_su=
bsystem: complete building xattr subsystem, 20 of xdatum (19 unchecked, 1 o=
rphan) and 27 of xref (1 dead, 0 orphan) found.
Jan 01 00:00:13 test_obmc kernel: overlayfs: upper fs does not support tmpf=
ile.
Jan 01 00:00:13 test_obmc kernel: overlayfs: upper fs does not support RENA=
ME_WHITEOUT.
Jan 01 00:00:13 test_obmc systemd[1]: Failed to look up module alias 'autof=
s4': Function not implemented
Jan 01 00:00:13 test_obmc systemd[1]: systemd 250 running in system mode (+=
PAM -AUDIT -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT -GNUTLS -OPENSSL=
 -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTSETUP +=
LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4 -XZ -ZLIB +ZSTD -B=
PF_FRAMEWORK -XKBCOMMON -UTMP +SYSVINIT default-hierarchy=3Dhybrid)
Jan 01 00:00:13 test_obmc systemd[1]: Detected architecture arm.
Jan 01 00:00:13 test_obmc systemd[1]: Hostname set to <test_obmc>.
Jan 01 00:00:13 test_obmc systemd[111]: /lib/systemd/system-generators/syst=
emd-gpt-auto-generator failed with exit status 1.
Jan 01 00:00:13 test_obmc systemd[1]: /lib/systemd/system/phosphor-ipmi-net=
@.socket:3: Invalid interface name, ignoring: sys-subsystem-net-devices-%i.=
device
Jan 01 00:00:13 test_obmc systemd[1]: Queued start job for default target M=
ulti-User System.
Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/getty.
Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/mapper-wa=
it.
Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/modprobe.
Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/obmc-led-=
group-start.
Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/phosphor-=
certificate-manager.
Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/phosphor-=
ipmi-kcs.
Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/phosphor-=
ipmi-net.
Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/serial-ge=
tty.
Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/xyz.openb=
mc_project.Chassis.Control.Power.
Jan 01 00:00:13 test_obmc systemd[1]: Started Dispatch Password Requests to=
 Console Directory Watch.
Jan 01 00:00:13 test_obmc systemd[1]: Started Forward Password Requests to =
Wall Directory Watch.
Jan 01 00:00:13 test_obmc systemd[1]: Reached target Path Units.
Jan 01 00:00:13 test_obmc systemd[1]: Reached target Remote File Systems.
Jan 01 00:00:13 test_obmc systemd[1]: Reached target Slice Units.
Jan 01 00:00:13 test_obmc systemd[1]: Reached target Swaps.
Jan 01 00:00:13 test_obmc systemd[1]: Listening on Syslog Socket.
Jan 01 00:00:13 test_obmc systemd[1]: Listening on Process Core Dump Socket=
.
Jan 01 00:00:13 test_obmc systemd[1]: Listening on initctl Compatibility Na=
med Pipe.
Jan 01 00:00:13 test_obmc systemd[1]: Journal Audit Socket was skipped beca=
use of a failed condition check (ConditionSecurity=3Daudit).
Jan 01 00:00:13 test_obmc systemd[1]: Listening on Journal Socket (/dev/log=
).
Jan 01 00:00:13 test_obmc systemd[1]: Listening on Journal Socket.
Jan 01 00:00:13 test_obmc systemd[1]: Listening on Network Service Netlink =
Socket.
Jan 01 00:00:13 test_obmc systemd[1]: Listening on udev Control Socket.
Jan 01 00:00:13 test_obmc systemd[1]: Listening on udev Kernel Socket.
Jan 01 00:00:13 test_obmc systemd[1]: Huge Pages File System was skipped be=
cause of a failed condition check (ConditionPathExists=3D/sys/kernel/mm/hug=
epages).
Jan 01 00:00:13 test_obmc systemd[1]: POSIX Message Queue File System was s=
kipped because of a failed condition check (ConditionPathExists=3D/proc/sys=
/fs/mqueue).
Jan 01 00:00:13 test_obmc systemd[1]: Mounting Kernel Debug File System...
Jan 01 00:00:13 test_obmc systemd[1]: Mounting Kernel Trace File System...
Jan 01 00:00:13 test_obmc systemd[1]: Mounting Temporary Directory /tmp...
Jan 01 00:00:13 test_obmc systemd[1]: Create List of Static Device Nodes wa=
s skipped because of a failed condition check (ConditionFileNotEmpty=3D/lib=
/modules/5.15.36-8ddab47/modules.devname).
Jan 01 00:00:13 test_obmc systemd[1]: Starting Load Kernel Module configfs.=
..
Jan 01 00:00:13 test_obmc systemd[1]: Starting Load Kernel Module fuse...
Jan 01 00:00:13 test_obmc systemd[1]: File System Check on Root Device was =
skipped because of a failed condition check (ConditionPathIsReadWrite=3D!/)=
.
Jan 01 00:00:13 test_obmc systemd[1]: Starting Journal Service...
Jan 01 00:00:13 test_obmc systemd[1]: Load Kernel Modules was skipped becau=
se all trigger condition checks failed.
Jan 01 00:00:13 test_obmc systemd[1]: Starting Generate network units from =
Kernel command line...
Jan 01 00:00:13 test_obmc systemd[1]: Starting Remount Root and Kernel File=
 Systems...
Jan 01 00:00:13 test_obmc systemd[1]: Starting Apply Kernel Variables...
Jan 01 00:00:13 test_obmc systemd[1]: Starting Coldplug All udev Devices...
Jan 01 00:00:13 test_obmc systemd[1]: Mounted Kernel Debug File System.
Jan 01 00:00:13 test_obmc systemd[1]: Mounted Kernel Trace File System.
Jan 01 00:00:13 test_obmc systemd[1]: Mounted Temporary Directory /tmp.
Jan 01 00:00:13 test_obmc systemd[1]: modprobe@configfs.service: Deactivate=
d successfully.
Jan 01 00:00:13 test_obmc systemd[1]: Finished Load Kernel Module configfs.
Jan 01 00:00:13 test_obmc systemd[1]: modprobe@fuse.service: Deactivated su=
ccessfully.
Jan 01 00:00:13 test_obmc systemd[1]: Finished Load Kernel Module fuse.
Jan 01 00:00:13 test_obmc systemd[1]: Finished Generate network units from =
Kernel command line.
Jan 01 00:00:13 test_obmc systemd[1]: Finished Remount Root and Kernel File=
 Systems.
Jan 01 00:00:13 test_obmc systemd[1]: Finished Apply Kernel Variables.
Jan 01 00:00:13 test_obmc systemd[1]: Reached target Preparation for Networ=
k.
Jan 01 00:00:13 test_obmc systemd[1]: FUSE Control File System was skipped =
because of a failed condition check (ConditionPathExists=3D/sys/fs/fuse/con=
nections).
Jan 01 00:00:13 test_obmc systemd[1]: Mounting Kernel Configuration File Sy=
stem...
Jan 01 00:00:13 test_obmc systemd[1]: Rebuild Hardware Database was skipped=
 because of a failed condition check (ConditionNeedsUpdate=3D/etc).
Jan 01 00:00:13 test_obmc systemd[1]: Platform Persistent Storage Archival =
was skipped because of a failed condition check (ConditionDirectoryNotEmpty=
=3D/sys/fs/pstore).
Jan 01 00:00:13 test_obmc systemd[1]: Create System Users was skipped becau=
se of a failed condition check (ConditionNeedsUpdate=3D/etc).
Jan 01 00:00:13 test_obmc systemd[1]: Starting Create Static Device Nodes i=
n /dev...
Jan 01 00:00:13 test_obmc systemd[1]: Mounted Kernel Configuration File Sys=
tem.
Jan 01 00:00:13 test_obmc systemd[1]: Finished Create Static Device Nodes i=
n /dev.
Jan 01 00:00:13 test_obmc systemd[1]: Reached target Preparation for Local =
File Systems.
Jan 01 00:00:13 test_obmc systemd[1]: Mounting /var/volatile...
Jan 01 00:00:13 test_obmc systemd-journald[125]: Journal started
Jan 01 00:00:13 test_obmc systemd-journald[125]: Runtime Journal (/run/log/=
journal/96af4eacf7ca4faa85a8bdc626516057) is 8.0M, max 64.0M, 56.0M free.
Jan 01 00:00:12 test_obmc systemd-sysctl[128]: Couldn't write '16' to 'kern=
el/sysrq', ignoring: No such file or directory
Jan 01 00:00:13 test_obmc systemd-tmpfiles[135]: ]8;;file://test_obmc/usr/l=
ib/tmpfiles.d/dbus.conf/usr/lib/tmpfiles.d/dbus.conf]8;;:13: Line reference=
s path below legacy directory /var/run/, updating /var/run/dbus/containers =
=E2=86=92 /run/dbus/containers; please update the tmpfiles.d/ drop-in file =
accordingly.
Jan 01 00:00:14 test_obmc systemd[1]: Starting Rule-based Manager for Devic=
e Events and Files...
Jan 01 00:00:14 test_obmc systemd[1]: Started Journal Service.
Jan 01 00:00:14 test_obmc systemd[1]: Mounted /var/volatile.
Jan 01 00:00:14 test_obmc systemd[1]: Starting Flush Journal to Persistent =
Storage...
Jan 01 00:00:14 test_obmc systemd[1]: Bind mount volatile /var/cache was sk=
ipped because of a failed condition check (ConditionPathIsReadWrite=3D!/var=
/cache).
Jan 01 00:00:14 test_obmc systemd[1]: Bind mount volatile /var/lib was skip=
ped because of a failed condition check (ConditionPathIsReadWrite=3D!/var/l=
ib).
Jan 01 00:00:14 test_obmc systemd[1]: Starting Load/Save Random Seed...
Jan 01 00:00:14 test_obmc systemd[1]: Bind mount volatile /var/spool was sk=
ipped because of a failed condition check (ConditionPathIsReadWrite=3D!/var=
/spool).
Jan 01 00:00:14 test_obmc systemd[1]: Bind mount volatile /srv was skipped =
because of a failed condition check (ConditionPathIsReadWrite=3D!/srv).
Jan 01 00:00:14 test_obmc systemd[1]: Reached target Local File Systems.
Jan 01 00:00:14 test_obmc systemd-journald[125]: Runtime Journal (/run/log/=
journal/96af4eacf7ca4faa85a8bdc626516057) is 8.0M, max 64.0M, 56.0M free.
Jan 01 00:00:14 test_obmc systemd-journald[125]: Received client request to=
 flush runtime journal.
Jan 01 00:00:14 test_obmc systemd[1]: Finished Flush Journal to Persistent =
Storage.
Jan 01 00:00:14 test_obmc systemd[1]: Starting Create Volatile Files and Di=
rectories...
Jan 01 00:00:14 test_obmc systemd[1]: Finished Load/Save Random Seed.
Jan 01 00:00:15 test_obmc systemd[1]: First Boot Complete was skipped becau=
se of a failed condition check (ConditionFirstBoot=3Dyes).
Jan 01 00:00:15 test_obmc systemd[1]: Commit a transient machine-id on disk=
 was skipped because of a failed condition check (ConditionPathIsMountPoint=
=3D/etc/machine-id).
Jan 01 00:00:15 test_obmc systemd-tmpfiles[141]: ]8;;file://test/usr/lib/tm=
pfiles.d/dbus.conf/usr/lib/tmpfiles.d/dbus.conf]8;;:13: Line references pat=
h below legacy directory /var/run/, updating /var/run/dbus/containers =E2=
=86=92 /run/dbus/containers; please update the tmpfiles.d/ drop-in file acc=
ordingly.
Jan 01 00:00:15 test_obmc systemd[1]: Finished Create Volatile Files and Di=
rectories.
Jan 01 00:00:15 test_obmc systemd[1]: Rebuild Journal Catalog was skipped b=
ecause of a failed condition check (ConditionNeedsUpdate=3D/var).
Jan 01 00:00:15 test_obmc systemd[1]: Update is Completed was skipped becau=
se all trigger condition checks failed.
Jan 01 00:00:16 test_obmc systemd[1]: Started Rule-based Manager for Device=
 Events and Files.
Jan 01 00:00:16 test_obmc systemd[1]: Starting Network Configuration...
Jan 01 00:00:17 test_obmc systemd[1]: Finished Coldplug All udev Devices.
Jan 01 00:00:17 test_obmc systemd[1]: Starting Wait for udev To Complete De=
vice Initialization...
Jan 01 00:00:18 test_obmc systemd-udevd[142]: Using default interface namin=
g scheme 'v250'.
Jan 01 00:00:21 test_obmc systemd[1]: Found device /sys/subsystem/net/devic=
es/eth0.
Jan 01 00:00:22 test_obmc udevadm[149]: systemd-udev-settle.service is depr=
ecated. Please fix rngd.service not to pull it in.
Jan 01 00:00:22 test_obmc systemd[1]: Finished Wait for udev To Complete De=
vice Initialization.
Jan 01 00:00:22 test_obmc systemd-networkd[148]: lo: Link UP
Jan 01 00:00:22 test_obmc systemd-networkd[148]: lo: Gained carrier
Jan 01 00:00:22 test_obmc systemd-networkd[148]: Enumeration completed
Jan 01 00:00:22 test_obmc systemd[1]: Started Network Configuration.
Jan 01 00:00:22 test_obmc systemd-networkd[148]: eth0: Link UP
Jan 01 00:00:22 test_obmc systemd[1]: Created slice Slice /system/xyz.openb=
mc_project.led.controller.
Jan 01 00:00:22 test_obmc systemd[1]: Reached target Hardware activated USB=
 gadget.
Jan 01 00:00:22 test_obmc systemd[1]: Huge Pages File System was skipped be=
cause of a failed condition check (ConditionPathExists=3D/sys/kernel/mm/hug=
epages).
Jan 01 00:00:22 test_obmc systemd[1]: POSIX Message Queue File System was s=
kipped because of a failed condition check (ConditionPathExists=3D/proc/sys=
/fs/mqueue).
Jan 01 00:00:22 test_obmc systemd[1]: Create List of Static Device Nodes wa=
s skipped because of a failed condition check (ConditionFileNotEmpty=3D/lib=
/modules/5.15.36-8ddab47/modules.devname).
Jan 01 00:00:22 test_obmc systemd[1]: Starting Load Kernel Module fuse...
Jan 01 00:00:22 test_obmc systemd[1]: Started Hardware RNG Entropy Gatherer=
 Daemon.
Jan 01 00:00:22 test_obmc systemd[1]: Rebuild Hardware Database was skipped=
 because of a failed condition check (ConditionNeedsUpdate=3D/etc).
Jan 01 00:00:22 test_obmc systemd[1]: Rebuild Journal Catalog was skipped b=
ecause of a failed condition check (ConditionNeedsUpdate=3D/var).
Jan 01 00:00:22 test_obmc systemd[1]: Commit a transient machine-id on disk=
 was skipped because of a failed condition check (ConditionPathIsMountPoint=
=3D/etc/machine-id).
Jan 01 00:00:22 test_obmc systemd[1]: Load Kernel Modules was skipped becau=
se all trigger condition checks failed.
Jan 01 00:00:22 test_obmc systemd[1]: Starting Wait for Network to be Confi=
gured...
Jan 01 00:00:22 test_obmc systemd[1]: Platform Persistent Storage Archival =
was skipped because of a failed condition check (ConditionDirectoryNotEmpty=
=3D/sys/fs/pstore).
Jan 01 00:00:22 test_obmc systemd[1]: Create System Users was skipped becau=
se of a failed condition check (ConditionNeedsUpdate=3D/etc).
Jan 01 00:00:23 test_obmc systemd[1]: Starting Network Name Resolution...
Jan 01 00:00:23 test_obmc systemd[1]: Update is Completed was skipped becau=
se all trigger condition checks failed.
Jan 01 00:00:23 test_obmc systemd[1]: modprobe@fuse.service: Deactivated su=
ccessfully.
Jan 01 00:00:23 test_obmc systemd[1]: Finished Load Kernel Module fuse.
Jan 01 00:00:23 test_obmc systemd[1]: FUSE Control File System was skipped =
because of a failed condition check (ConditionPathExists=3D/sys/fs/fuse/con=
nections).
Jan 01 00:00:23 test_obmc systemd[1]: Reached target System Initialization.
Jan 01 00:00:23 test_obmc systemd[1]: logrotate.timer: Not using persistent=
 file timestamp Thu 1970-01-01 00:00:32 UTC as it is in the future.
Jan 01 00:00:23 test_obmc systemd[1]: Started Daily rotation of log files.
Jan 01 00:00:23 test_obmc systemd[1]: Started Daily Cleanup of Temporary Di=
rectories.
Jan 01 00:00:23 test_obmc systemd[1]: Reached target Timer Units.
Jan 01 00:00:23 test_obmc systemd[1]: Listening on Avahi mDNS/DNS-SD Stack =
Activation Socket.
Jan 01 00:00:23 test_obmc systemd[1]: Listening on BMC Webserver socket.
Jan 01 00:00:23 test_obmc systemd[1]: Listening on D-Bus System Message Bus=
 Socket.
Jan 01 00:00:23 test_obmc systemd[1]: Listening on dropbear.socket.
Jan 01 00:00:23 test_obmc systemd[1]: Listening on Phosphor Host Console SS=
H Per-Connection socket.
Jan 01 00:00:24 test_obmc systemd[1]: Listening on phosphor-ipmi-net@eth0.s=
ocket.
Jan 01 00:00:24 test_obmc systemd[1]: Reached target Socket Units.
Jan 01 00:00:24 test_obmc systemd[1]: Starting D-Bus System Message Bus...
Jan 01 00:00:24 test_obmc kernel: ftgmac100 1e660000.ethernet eth0: Link is=
 Up - 100Mbps/Full - flow control rx/tx
Jan 01 00:00:24 test_obmc kernel: IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link=
 becomes ready
Jan 01 00:00:24 test_obmc systemd-networkd[148]: eth0: Gained carrier
Jan 01 00:00:25 test_obmc rngd[163]: Initializing available sources
Jan 01 00:00:25 test_obmc rngd[163]: [hwrng ]: Initialized
Jan 01 00:00:26 test_obmc systemd[1]: Started D-Bus System Message Bus.
Jan 01 00:00:26 test_obmc systemd-networkd[148]: eth0: Gained IPv6LL
Jan 01 00:00:26 test_obmc systemd[1]: Reached target Basic System.
Jan 01 00:00:26 test_obmc systemd[1]: System is tainted: cgroupsv1
Jan 01 00:00:26 test_obmc dbus-broker-lau[170]: Ready
Jan 01 00:00:26 test_obmc systemd[1]: Starting Clear one time boot override=
s...
Jan 01 00:00:26 test_obmc systemd[1]: Starting SSH Key Generation...
Jan 01 00:00:26 test_obmc systemd[1]: Started LPC Snoop Daemon.
Jan 01 00:00:26 test_obmc systemd[1]: Starting Name Service Cache Daemon...
Jan 01 00:00:26 test_obmc systemd[1]: Started Phosphor Dump core monitor..
Jan 01 00:00:27 test_obmc systemd[1]: Started Phosphor certificate manager =
for authority.
Jan 01 00:00:27 test_obmc systemd[1]: Started Phosphor certificate manager =
for bmcweb.
Jan 01 00:00:27 test_obmc systemd[1]: Started Phosphor certificate manager =
for nslcd.
Jan 01 00:00:27 test_obmc systemd[1]: Starting BMC health monitoring...
Jan 01 00:00:27 test_obmc systemd-networkd[148]: eth0: DHCPv4 address 192.1=
68.200.5/20, gateway 192.168.192.1 acquired from 192.168.192.1
Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based monitoring =
for file `/passwd': No such file or directory
Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file `/passwd'; wi=
ll try again later: No such file or directory
Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based monitoring =
for file `/group': No such file or directory
Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file `/group'; wil=
l try again later: No such file or directory
Jan 01 00:00:27 test_obmc systemd[1]: Starting OpenBMC ipKVM daemon...
Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based monitoring =
for file `/hosts': No such file or directory
Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file `/hosts'; wil=
l try again later: No such file or directory
Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based monitoring =
for file `/resolv.conf': No such file or directory
Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file `/resolv.conf=
'; will try again later: No such file or directory
Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based monitoring =
for file `/services': No such file or directory
Jan 01 00:00:28 test_obmc systemd[1]: Starting Enable Linux trace events in=
 the boot loader...
Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file `/services'; =
will try again later: No such file or directory
Jan 01 00:00:28 test_obmc systemd[1]: Starting Intel Power Control for the =
Host 0...
Jan 01 00:00:28 test_obmc systemd-resolved[165]: Positive Trust Anchors:
Jan 01 00:00:28 test_obmc nscd[182]: 182 disabled inotify-based monitoring =
for file `/nsswitch.conf': No such file or directory
Jan 01 00:00:28 test_obmc systemd-resolved[165]: . IN DS 20326 8 2 e06d44b8=
0b8f1d39a95c0b0d7c65d08458e880409bbc683457104237c7f8ec8d
Jan 01 00:00:28 test_obmc nscd[182]: 182 stat failed for file `/nsswitch.co=
nf'; will try again later: No such file or directory
Jan 01 00:00:28 test_obmc systemd-resolved[165]: Negative trust anchors: ho=
me.arpa 10.in-addr.arpa 16.172.in-addr.arpa 17.172.in-addr.arpa 18.172.in-a=
ddr.arpa 19.172.in-addr.arpa 20.172.in-addr.arpa 21.172.in-addr.arpa 22.172=
.in-addr.arpa 23.172.in-addr.arpa 24.172.in-addr.arpa 25.172.in-addr.arpa 2=
6.172.in-addr.arpa 27.172.in-addr.arpa 28.172.in-addr.arpa 29.172.in-addr.a=
rpa 30.172.in-addr.arpa 31.172.in-addr.arpa 168.192.in-addr.arpa d.f.ip6.ar=
pa corp home internal intranet lan local private test
Jan 01 00:00:28 test_obmc nscd[182]: 182 disabled inotify-based monitoring =
for file `/nsswitch.conf': No such file or directory
Jan 01 00:00:28 test_obmc systemd[1]: Starting Phosphor Dump Manager...
Jan 01 00:00:28 test_obmc nscd[182]: 182 stat failed for file `/nsswitch.co=
nf'; will try again later: No such file or directory
Jan 01 00:00:28 test_obmc nscd[182]: 182 disabled inotify-based monitoring =
for file `/nsswitch.conf': No such file or directory
Jan 01 00:00:28 test_obmc nscd[182]: 182 stat failed for file `/nsswitch.co=
nf'; will try again later: No such file or directory
Jan 01 00:00:28 test_obmc nscd[182]: 182 disabled inotify-based monitoring =
for file `/nsswitch.conf': No such file or directory
Jan 01 00:00:28 test_obmc nscd[182]: 182 stat failed for file `/nsswitch.co=
nf'; will try again later: No such file or directory
Jan 01 00:00:28 test_obmc systemd[1]: Starting Entity Manager...
Jan 01 00:00:28 test_obmc systemd[1]: Started Fru Device.
Jan 01 00:00:28 test_obmc systemd-resolved[165]: Using system hostname 'tes=
t_obmc'.
Jan 01 00:00:28 test_obmc nscd[182]: 182 cannot write to database file /var=
/db/nscd/passwd: Invalid argument
Jan 01 00:00:29 test_obmc systemd[1]: Starting Phosphor Log Manager...
Jan 01 00:00:29 test_obmc systemd[1]: Starting Phosphor DBus Service Discov=
ery Manager...
Jan 01 00:00:29 test_obmc systemd[1]: Starting Phosphor Settings Daemon...
Jan 01 00:00:29 test_obmc systemd[1]: Starting Phosphor Download Manager...
Jan 01 00:00:29 test_obmc nscd[182]: 182 cannot write to database file /var=
/db/nscd/group: Invalid argument
Jan 01 00:00:29 test_obmc systemd[1]: Starting Post code manager...
Jan 01 00:00:29 test_obmc systemd[1]: Starting Rsyslog config updater...
Jan 01 00:00:30 test_obmc systemd[1]: Starting Telemetry...
Jan 01 00:00:30 test_obmc nscd[182]: 182 cannot write to database file /var=
/db/nscd/hosts: Invalid argument
Jan 01 00:00:30 test_obmc systemd[1]: Starting Phosphor User Manager...
Jan 01 00:00:30 test_obmc systemd[1]: Started Phosphor sysfs LED controller=
.
Jan 01 00:00:30 test_obmc systemd[1]: Started Phosphor sysfs LED controller=
.
Jan 01 00:00:31 test_obmc nscd[182]: 182 cannot write to database file /var=
/db/nscd/services: Invalid argument
Jan 01 00:00:32 test_obmc systemd[1]: Started Network Name Resolution.
Jan 01 00:00:32 test_obmc systemd[1]: Finished Wait for Network to be Confi=
gured.
Jan 01 00:00:33 test_obmc systemd[1]: Finished SSH Key Generation.
Jan 01 00:00:33 test_obmc systemd[1]: Started Name Service Cache Daemon.
Jan 01 00:00:33 test_obmc systemd[1]: Started OpenBMC ipKVM daemon.
Jan 01 00:00:33 test_obmc systemd[1]: trace-enable.service: Deactivated suc=
cessfully.
Jan 01 00:00:33 test_obmc systemd[1]: Finished Enable Linux trace events in=
 the boot loader.
Jan 01 00:00:34 test_obmc systemd[1]: Reached target Network.
Jan 01 00:00:34 test_obmc systemd[1]: Reached target Network is Online.
Jan 01 00:00:34 test_obmc systemd[1]: Reached target Host and Network Name =
Lookups.
Jan 01 00:00:34 test_obmc post-code-manager[202]: Start post code manager s=
ervice...
Jan 01 00:00:34 test_obmc systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
Jan 01 00:00:34 test_obmc health-monitor[181]: Path /xyz/openbmc_project/in=
ventory does not exist in ObjectMapper, cannot create association
Jan 01 00:00:35 test_obmc systemd[1]: Started Start bmcweb server.
Jan 01 00:00:35 test_obmc telemetry[204]: Telemetry starting
Jan 01 00:00:35 test_obmc systemd[1]: Starting LDAP daemon...
Jan 01 00:00:35 test_obmc systemd[1]: Starting System Logging Service...
Jan 01 00:00:35 test_obmc systemd[1]: Started Lightweight SLP Server.
Jan 01 00:00:36 test_obmc systemd[1]: Starting Permit User Sessions...
Jan 01 00:00:36 test_obmc phosphor-certificate-manager[179]: Certificate in=
stall
Jan 01 00:00:36 test_obmc health-monitor[181]: CPU Health Sensor initialize=
d
Jan 01 00:00:36 test_obmc health-monitor[181]: CPU Health Sensor created
Jan 01 00:00:36 test_obmc health-monitor[181]: Memory Health Sensor initial=
ized
Jan 01 00:00:36 test_obmc health-monitor[181]: Memory Health Sensor created
Jan 01 00:00:36 test_obmc health-monitor[181]: Storage_RW Health Sensor ini=
tialized
Jan 01 00:00:36 test_obmc power-control[185]: Start Chassis power control s=
ervice for host : 0
Jan 01 00:00:36 test_obmc health-monitor[181]: Storage_RW Health Sensor cre=
ated
Jan 01 00:00:36 test_obmc post-code-manager[202]: PostCode is created
Jan 01 00:00:37 test_obmc systemd[1]: Finished Clear one time boot override=
s.
Jan 01 00:00:37 test_obmc power-control[185]: SIO control GPIOs not defined=
, disable SIO support.
Jan 01 00:00:37 test_obmc systemd[1]: Started Post code manager.
Jan 01 00:00:37 test_obmc power-control[185]: BMC_NMI set to 0
Jan 01 00:00:37 test_obmc health-monitor[181]: ASSERT: sensor CPU is above =
the upper threshold critical high
Jan 01 00:00:37 test_obmc power-control[185]: FM_BMC_PWRBTN_OUT_N set to 1
Jan 01 00:00:37 test_obmc power-control[185]: RST_BMC_RSTBTN_OUT_N set to 1
Jan 01 00:00:37 test_obmc power-control[185]: PowerControl: power restore p=
olicy applied
Jan 01 00:00:37 test_obmc systemd[1]: Finished Permit User Sessions.
Jan 01 00:00:37 test_obmc power-control[185]: NMI Source Property Monitor
Jan 01 00:00:37 test_obmc power-control[185]: Initializing power state.
Jan 01 00:00:37 test_obmc power-control[185]: Host0: Moving to "Off" state
Jan 01 00:00:37 test_obmc post-code-manager[202]: HostState changed to OFF.=
 Empty postcode log, keep boot cycle at 0
Jan 01 00:00:37 test_obmc systemd[1]: Started BMC health monitoring.
Jan 01 00:00:37 test_obmc power-control[185]: RestartCause set to xyz.openb=
mc_project.State.Host.RestartCause.Unknown
Jan 01 00:00:38 test_obmc systemd[1]: Started Rsyslog config updater.
Jan 01 00:00:38 test_obmc systemd[1]: Started Telemetry.
Jan 01 00:00:38 test_obmc phosphor-user-manager[207]: Group not found
Jan 01 00:00:38 test_obmc systemd[1]: Started Phosphor Download Manager.
Jan 01 00:00:38 test_obmc systemd[1]: Started Phosphor DBus Service Discove=
ry Manager.
Jan 01 00:00:38 test_obmc systemd[1]: Started Phosphor Log Manager.
Jan 01 00:00:38 test_obmc power-control[185]: Invoking Power Restore Policy=
 xyz.openbmc_project.Control.Power.RestorePolicy.Policy.Restore
Jan 01 00:00:38 test_obmc power-control[185]: Power was dropped, restoring =
Host On state
Jan 01 00:00:38 test_obmc power-control[185]: powerStateOff: power-on reque=
st event received
Jan 01 00:00:38 test_obmc power-control[185]: power supply power OK watchdo=
g timer started
Jan 01 00:00:38 test_obmc power-control[185]: Host0: Moving to "Wait for Po=
wer Supply Power OK" state
Jan 01 00:00:38 test_obmc power-control[185]: FM_BMC_PWRBTN_OUT_N set to 0
Jan 01 00:00:38 test_obmc power-control[185]: RestartCause set to xyz.openb=
mc_project.State.Host.RestartCause.PowerPolicyPreviousState
Jan 01 00:00:39 test_obmc systemd[1]: Started Intel Power Control for the H=
ost 0.
Jan 01 00:00:39 test_obmc power-control[185]: FM_BMC_PWRBTN_OUT_N released
Jan 01 00:00:39 test_obmc systemd[1]: Started Phosphor Dump Manager.
Jan 01 00:00:39 test_obmc systemd[1]: Started Phosphor Settings Daemon.
Jan 01 00:00:39 test_obmc systemd[1]: Started Entity Manager.
Jan 01 00:00:39 test_obmc fru-device[189]: device at bus 1 address 76 busy
Jan 01 00:00:39 test_obmc systemd[1]: Started Phosphor User Manager.
Jan 01 00:00:39 test_obmc systemd[1]: Reached target Phosphor Object Mapper=
.
Jan 01 00:00:39 test_obmc systemd[1]: Getty on tty1 was skipped because of =
a failed condition check (ConditionPathExists=3D/dev/tty0).
Jan 01 00:00:40 test_obmc systemd[1]: Starting Wait for /xyz/openbmc_projec=
t/control/host0/boot/one_time...
Jan 01 00:00:40 test_obmc power-control[185]: powerStateWaitForPSPowerOK: p=
ower supply power OK assert event received
Jan 01 00:00:40 test_obmc power-control[185]: Host0: Moving to "On" state
Jan 01 00:00:40 test_obmc power-control[185]: power supply power OK watchdo=
g timer canceled
Jan 01 00:00:40 test_obmc power-control[185]: POH timer started
Jan 01 00:00:40 test_obmc power-control[185]: Host system DC power is on
Jan 01 00:00:40 test_obmc fru-device[189]: device at bus 2 address 76 busy
Jan 01 00:00:40 test_obmc systemd[1]: Starting Wait for /xyz/openbmc_projec=
t/control/host0/boot...
Jan 01 00:00:40 test_obmc obmc-ikvm[221]: 01/01/1970 00:00:40 Listening for=
 VNC connections on TCP port 5900
Jan 01 00:00:40 test_obmc systemd[1]: Starting Wait for /xyz/openbmc_projec=
t/control/host0/power_restore_policy...
Jan 01 00:00:40 test_obmc systemd[1]: Starting Wait for /xyz/openbmc_projec=
t/control/host0/restriction_mode...
Jan 01 00:00:41 test_obmc systemd[1]: Starting Wait for /xyz/openbmc_projec=
t/led/groups/bmc_booted...
Jan 01 00:00:41 test_obmc systemd[1]: Starting Wait for /xyz/openbmc_projec=
t/time/sync_method...
Jan 01 00:00:41 test_obmc avahi-daemon[240]: Found user 'avahi' (UID 996) a=
nd group 'avahi' (GID 995).
Jan 01 00:00:41 test_obmc rsyslogd[229]: imuxsock: Acquired UNIX socket '/r=
un/systemd/journal/syslog' (fd 3) from systemd.=C2=A0 [v8.2202.0]
Jan 01 00:00:41 test_obmc rsyslogd[229]: [origin software=3D"rsyslogd" swVe=
rsion=3D"8.2202.0" x-pid=3D"229" x-info=3D"https://www.rsyslog.com"] start
Jan 01 00:00:41 test_obmc systemd[1]: Started Phosphor-Pid-Control Margin-b=
ased Fan Control Daemon.
Jan 01 00:00:42 test_obmc systemd[1]: Started phosphor systemd target monit=
or.
Jan 01 00:00:42 test_obmc systemd[1]: Starting Ramoops monitor....
Jan 01 00:00:42 test_obmc systemd[1]: Started Serial Getty on ttyS4.
Jan 01 00:00:42 test_obmc systemd[1]: Reached target Login Prompts.
Jan 01 00:00:43 test_obmc systemd[1]: Starting Phosphor LED Group Managemen=
t Daemon...
Jan 01 00:00:43 test_obmc systemd[1]: Starting Phosphor Network Manager...
Jan 01 00:00:43 test_obmc systemd[1]: Starting OpenBMC Software Update Mana=
ger...
Jan 01 00:00:44 test_obmc systemd[1]: Starting Phosphor BMC State Manager..=
.
Jan 01 00:00:44 test_obmc systemd[1]: Started Adc Sensor.
Jan 01 00:00:44 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:00:44 test_obmc systemd[1]: Started Exit Air Temp Sensor.
Jan 01 00:00:45 test_obmc systemd[1]: Started External Sensor.
Jan 01 00:00:45 test_obmc systemd[1]: Started Fan Sensor.
Jan 01 00:00:46 test_obmc nscd[182]: 182 checking for monitored file `/nssw=
itch.conf': No such file or directory
Jan 01 00:00:46 test_obmc nscd[182]: 182 checking for monitored file `/pass=
wd': No such file or directory
Jan 01 00:00:46 test_obmc systemd[1]: Started Hwmon Temp Sensor.
Jan 01 00:00:46 test_obmc phosphor-image-updater[262]: Error in mapper GetS=
ubTreePath: sd_bus_call: xyz.openbmc_project.Common.Error.ResourceNotFound:=
 The resource is not found.
Jan 01 00:00:46 test_obmc phosphor-certificate-manager[179]: Error occurred=
 during X509_verify_cert call, checking for known error
Jan 01 00:00:46 test_obmc swampd[253]: Tuning enabled
Jan 01 00:00:46 test_obmc systemd[1]: Started Intrusion Sensor.
Jan 01 00:00:47 test_obmc swampd[253]: No fan zones, application pausing un=
til new configuration
Jan 01 00:00:47 test_obmc mapperx[199]: Introspect call failed with error: =
generic:53, Invalid request descriptor on process: xyz.openbmc_project.Hwmo=
n.external path: /
Jan 01 00:00:47 test_obmc nscd[182]: 182 checking for monitored file `/nssw=
itch.conf': No such file or directory
Jan 01 00:00:47 test_obmc nscd[182]: 182 checking for monitored file `/grou=
p': No such file or directory
Jan 01 00:00:47 test_obmc systemd[1]: Started IPMB Sensor.
Jan 01 00:00:47 test_obmc adcsensor[265]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:00:47 test_obmc systemd[1]: Started MCU Temp Sensor.
Jan 01 00:00:47 test_obmc cpusensor[266]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:00:48 test_obmc systemd[1]: Started PSU Sensor.
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in7_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in12_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in15_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in2_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in5_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in8_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in10_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in13_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in3_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in6_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in9_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in11_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in14_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in1_input
Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/cla=
ss/hwmon/hwmon3/in4_input
Jan 01 00:00:48 test_obmc nscd[182]: 182 checking for monitored file `/nssw=
itch.conf': No such file or directory
Jan 01 00:00:48 test_obmc fru-device[189]: failed to read bus 9 address 40
Jan 01 00:00:48 test_obmc fru-device[189]: failed to read bus 9 address 55
Jan 01 00:00:48 test_obmc nscd[182]: 182 checking for monitored file `/reso=
lv.conf': No such file or directory
Jan 01 00:00:48 test_obmc nscd[182]: 182 checking for monitored file `/host=
s': No such file or directory
Jan 01 00:00:49 test_obmc nscd[182]: 182 checking for monitored file `/nssw=
itch.conf': No such file or directory
Jan 01 00:00:49 test_obmc nscd[182]: 182 checking for monitored file `/serv=
ices': No such file or directory
Jan 01 00:00:49 test_obmc exitairtempsensor[268]: error getting=C2=A0 Speci=
alMode status No route to host
Jan 01 00:00:49 test_obmc mapperx[199]: Found invalid association on path /=
xyz/openbmc_project/software/0908ea58
Jan 01 00:00:49 test_obmc phosphor-certificate-manager[179]: Certificate co=
mpareKeys
Jan 01 00:00:49 test_obmc fansensor[270]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:00:50 test_obmc intrusion-sensor[273]: can't find matched I2C or =
GPIO configuration for intrusion sensor.
Jan 01 00:00:50 test_obmc systemd[1]: Started System Logging Service.
Jan 01 00:00:50 test_obmc hwmontempsensor[272]: error getting=C2=A0 Special=
Mode status No route to host
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan9_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan13_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan16_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan1_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan4_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan7_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan11_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan14_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan2_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan5_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan8_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan12_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan15_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan3_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan6_input
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan10_input
Jan 01 00:00:50 test_obmc systemd[1]: Finished Wait for /xyz/openbmc_projec=
t/control/host0/boot/one_time.
Jan 01 00:00:50 test_obmc systemd[1]: Finished Wait for /xyz/openbmc_projec=
t/control/host0/boot.
Jan 01 00:00:51 test_obmc systemd[1]: Finished Wait for /xyz/openbmc_projec=
t/control/host0/power_restore_policy.
Jan 01 00:00:51 test_obmc ipmbsensor[274]: error getting=C2=A0 SpecialMode =
status No route to host
Jan 01 00:00:51 test_obmc mcutempsensor[276]: error getting=C2=A0 SpecialMo=
de status No route to host
Jan 01 00:00:51 test_obmc systemd[1]: Finished Wait for /xyz/openbmc_projec=
t/control/host0/restriction_mode.
Jan 01 00:00:51 test_obmc systemd[1]: Finished Wait for /xyz/openbmc_projec=
t/time/sync_method.
Jan 01 00:00:51 test_obmc systemd[1]: ramoops-monitor.service: Deactivated =
successfully.
Jan 01 00:00:51 test_obmc systemd[1]: Finished Ramoops monitor..
Jan 01 00:00:51 test_obmc avahi-daemon[240]: Successfully dropped root priv=
ileges.
Jan 01 00:00:51 test_obmc avahi-daemon[240]: avahi-daemon 0.8 starting up.
Jan 01 00:00:51 test_obmc nslcd[283]: version 0.9.8 starting
Jan 01 00:00:51 test_obmc nslcd[283]: accepting connections
Jan 01 00:00:51 test_obmc systemd[1]: Started LDAP daemon.
Jan 01 00:00:51 test_obmc systemd[1]: Started Phosphor Network Manager.
Jan 01 00:00:51 test_obmc systemd[1]: Started OpenBMC Software Update Manag=
er.
Jan 01 00:00:52 test_obmc phosphor-bmc-state-manager[264]: Unit obmc-bmc-se=
rvice-quiesce@0.target not found: sd_bus_call: org.freedesktop.systemd1.NoS=
uchUnit: Unit obmc-bmc-service-quiesce@0.target not loaded.
Jan 01 00:00:52 test_obmc systemd[1]: Starting Phosphor Inband IPMI...
Jan 01 00:00:52 test_obmc psusensor[277]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:00:52 test_obmc systemd[1]: Starting Phosphor Ldap config updater=
...
Jan 01 00:00:52 test_obmc psusensor[277]: Driver name aspeed_pwm_tacho not =
found in sensor whitelist
Jan 01 00:00:52 test_obmc psusensor[277]: Driver name w83773g not found in =
sensor whitelist
Jan 01 00:00:52 test_obmc psusensor[277]: Driver name iio_hwmon not found i=
n sensor whitelist
Jan 01 00:00:52 test_obmc psusensor[277]: Driver name w83773g not found in =
sensor whitelist
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Successfully called chroot().
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Successfully dropped remaining=
 capabilities.
Jan 01 00:00:52 test_obmc systemd[1]: Starting Phosphor Version Software Ma=
nager...
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Loading service file /services=
/obmc_console.service.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast group o=
n interface eth0.IPv6 with address fe80::68e9:3dff:fe93:825c.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: New relevant interface eth0.IP=
v6 for mDNS.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast group o=
n interface eth0.IPv4 with address 192.168.200.5.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: New relevant interface eth0.IP=
v4 for mDNS.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast group o=
n interface lo.IPv6 with address ::1.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: New relevant interface lo.IPv6=
 for mDNS.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast group o=
n interface lo.IPv4 with address 127.0.0.1.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: New relevant interface lo.IPv4=
 for mDNS.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Network interface enumeration =
completed.
Jan 01 00:00:52 test_obmc systemd[1]: Starting Phosphor Time Manager daemon=
...
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Registering new address record=
 for fe80::68e9:3dff:fe93:825c on eth0.*.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Registering new address record=
 for 192.168.200.5 on eth0.IPv4.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Registering new address record=
 for ::1 on lo.*.
Jan 01 00:00:52 test_obmc avahi-daemon[240]: Registering new address record=
 for 127.0.0.1 on lo.IPv4.
Jan 01 00:00:53 test_obmc systemd[1]: Started Avahi mDNS/DNS-SD Stack.
Jan 01 00:00:53 test_obmc phosphor-bmc-state-manager[264]: Setting the BMCS=
tate field to BMC_NOTREADY
Jan 01 00:00:53 test_obmc phosphor-bmc-state-manager[264]: Setting the BMCS=
tate field to xyz.openbmc_project.State.BMC.BMCState.NotReady
Jan 01 00:00:53 test_obmc phosphor-bmc-state-manager[264]: Setting the Rebo=
otCause field to xyz.openbmc_project.State.BMC.RebootCause.Unknown
Jan 01 00:00:53 test_obmc systemd[1]: Started Phosphor BMC State Manager.
Jan 01 00:00:53 test_obmc avahi-daemon[240]: Server startup complete. Host =
name is test_obmc.local. Local service cookie is 1954789941.
Jan 01 00:00:53 test_obmc nslcd[283]: caught signal SIGTERM (15), shutting =
down
Jan 01 00:00:53 test_obmc systemd[1]: Stopping LDAP daemon...
Jan 01 00:00:53 test_obmc nslcd[283]: thread 0 is still running, shutting d=
own anyway
Jan 01 00:00:53 test_obmc nslcd[283]: thread 1 is still running, shutting d=
own anyway
Jan 01 00:00:53 test_obmc nslcd[283]: thread 2 is still running, shutting d=
own anyway
Jan 01 00:00:53 test_obmc nslcd[283]: thread 3 is still running, shutting d=
own anyway
Jan 01 00:00:53 test_obmc nslcd[283]: thread 4 is still running, shutting d=
own anyway
Jan 01 00:00:53 test_obmc nslcd[283]: version 0.9.8 bailing out
Jan 01 00:00:53 test_obmc systemd[1]: Started Phosphor Ldap config updater.
Jan 01 00:00:54 test_obmc systemd[1]: nslcd.service: Deactivated successful=
ly.
Jan 01 00:00:54 test_obmc systemd[1]: Stopped LDAP daemon.
Jan 01 00:00:54 test_obmc systemd[1]: Started Phosphor Version Software Man=
ager.
Jan 01 00:00:54 test_obmc avahi-daemon[240]: Service "obmc_console on test_=
obmc" (/services/obmc_console.service) successfully established.
Jan 01 00:00:54 test_obmc fru-device[189]: device at bus 1 address 76 busy
Jan 01 00:00:54 test_obmc systemd[1]: Starting Time & Date Service...
Jan 01 00:00:55 test_obmc fru-device[189]: device at bus 2 address 76 busy
Jan 01 00:00:56 test_obmc ipmid[290]: JSON file not found
Jan 01 00:00:56 test_obmc phosphor-network-manager[261]: Refreshing the obj=
ects.
Jan 01 00:00:57 test_obmc systemd[1]: Starting Hostname Service...
Jan 01 00:00:57 test_obmc fru-device[189]: failed to read bus 9 address 40
Jan 01 00:00:57 test_obmc fru-device[189]: failed to read bus 9 address 55
Jan 01 00:00:59 test_obmc systemd[1]: Started Time & Date Service.
Jan 01 00:01:00 test_obmc systemd-timedated[297]: Set NTP to disabled.
Jan 01 00:01:00 test_obmc phosphor-time-manager[293]: Updated NTP setting
Jan 01 00:01:00 test_obmc systemd[1]: Started Phosphor Time Manager daemon.
Jan 01 00:01:00 test_obmc phosphor-network-manager[261]: Refreshing complet=
e.
Jan 01 00:01:00 test_obmc bmcweb[226]: Checking certs in file /etc/ssl/cert=
s/https/server.pem
Jan 01 00:01:00 test_obmc bmcweb[226]: Generating new keys
Jan 01 00:01:00 test_obmc bmcweb[226]: Generating EC key
Jan 01 00:01:01 test_obmc bmcweb[226]: Generating x509 Certificate
Jan 01 00:01:01 test_obmc ipmid[290]: Registering OEM:[0X00C2CF], Cmd:[0X04=
] for Manual Zone Control
Jan 01 00:01:01 test_obmc systemd[1]: Started Hostname Service.
Jan 01 00:01:01 test_obmc systemd[1]: Started Phosphor Inband IPMI.
Jan 01 00:01:01 test_obmc systemd[1]: Starting Phosphor IPMI KCS DBus Bridg=
e...
Jan 01 00:01:01 test_obmc phosphor-certificate-manager[179]: Certificate in=
stall
Jan 01 00:01:01 test_obmc systemd[1]: Started Network IPMI daemon.
Jan 01 00:01:02 test_obmc systemd[1]: Started Phosphor IPMI KCS DBus Bridge=
.
Jan 01 00:01:02 test_obmc kcsbridged-ipmi-kcs3[312]: IPMI response failure:=
 ipmid response: org.freedesktop.DBus.Error.ServiceUnknown: The name is not=
 activatable
Jan 01 00:01:02 test_obmc kcsbridged-ipmi-kcs3[312]: IPMI response failure:=
 ipmid response: org.freedesktop.DBus.Error.ServiceUnknown: The name is not=
 activatable
Jan 01 00:01:02 test_obmc kcsbridged-ipmi-kcs3[312]: IPMI response failure:=
 ipmid response: org.freedesktop.DBus.Error.ServiceUnknown: The name is not=
 activatable
Jan 01 00:01:02 test_obmc ipmid[290]: Loading whitelist filter
Jan 01 00:01:03 test_obmc phosphor-certificate-manager[179]: Certificate co=
mpareKeys
Jan 01 00:01:03 test_obmc ipmid[290]: New interface mapping
Jan 01 00:01:03 test_obmc ipmid[290]: Set restrictedMode =3D false
Jan 01 00:01:03 test_obmc netipmid[313]: Failed to get bus name
Jan 01 00:01:03 test_obmc netipmid[313]: Bind to interfae
Jan 01 00:01:03 test_obmc ipmid[290]: New interface mapping
Jan 01 00:01:03 test_obmc phosphor-certificate-manager[179]: Inotify callba=
ck to update certificate properties
Jan 01 00:01:03 test_obmc systemd[1]: Reloading Start bmcweb server...
Jan 01 00:01:03 test_obmc systemd[1]: Reloaded Start bmcweb server.
Jan 01 00:01:08 test_obmc entity-manager[224]: Inventory Added
Jan 01 00:01:12 test_obmc adcsensor[265]: Sensor VCCM_IJKL low threshold 1.=
135 assert: value 0.003 raw data 3
Jan 01 00:01:12 test_obmc adcsensor[265]: Sensor VCCM_IJKL low threshold 1.=
08 assert: value 0.003 raw data 3
Jan 01 00:01:12 test_obmc adcsensor[265]: Sensor VCCM_MNOP low threshold 1.=
135 assert: value 0 raw data 0
Jan 01 00:01:12 test_obmc adcsensor[265]: Sensor VCCM_MNOP low threshold 1.=
08 assert: value 0 raw data 0
Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan9_input
Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan13_input
Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan16_input
Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write "/sys/class/hwmo=
n/hwmon2/pwm3_enable"
Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor PVCCIN_CPU2 low threshold =
1.75 assert: value 0.029 raw data 29
Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor PVCCIN_CPU2 low threshold =
1.72 assert: value 0.029 raw data 29
Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write "/sys/class/hwmo=
n/hwmon2/pwm5_enable"
Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write "/sys/class/hwmo=
n/hwmon2/pwm7_enable"
Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor VCCM_IJKL low threshold 1.=
135 assert: value 0.001 raw data 1
Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor VCCM_IJKL low threshold 1.=
08 assert: value 0.001 raw data 1
Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor VCCM_MNOP low threshold 1.=
135 assert: value 0.003 raw data 3
Jan 01 00:01:13 test_obmc cpusensor[266]: CPU configs are parsed
Jan 01 00:01:13 test_obmc cpusensor[266]: unable to open /dev/peci-1
Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan11_input
Jan 01 00:01:13 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan14_input
Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write "/sys/class/hwmo=
n/hwmon2/pwm1_enable"
Jan 01 00:01:13 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write "/sys/class/hwmo=
n/hwmon2/pwm2_enable"
Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write "/sys/class/hwmo=
n/hwmon2/pwm8_enable"
Jan 01 00:01:14 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan12_input
Jan 01 00:01:14 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan15_input
Jan 01 00:01:14 test_obmc fansensor[270]: Error read/write "/sys/class/hwmo=
n/hwmon2/pwm4_enable"
Jan 01 00:01:14 test_obmc fansensor[270]: Error read/write "/sys/class/hwmo=
n/hwmon2/pwm6_enable"
Jan 01 00:01:14 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan10_input
Jan 01 00:01:14 test_obmc intrusion-sensor[273]: can't find matched NIC nam=
e.
Jan 01 00:01:16 test_obmc ipmid[290]: wd_set: sd_bus_call: xyz.openbmc_proj=
ect.Common.Error.ResourceNotFound: The resource is not found.
Jan 01 00:01:16 test_obmc ipmid[290]: Set Sol Config - Invalid solInterface
Jan 01 00:01:16 test_obmc ipmid[290]: Failed to check request for full unpa=
ck
Jan 01 00:01:16 test_obmc swampd[253]: New configuration detected, reloadin=
g
Jan 01 00:01:16 test_obmc swampd[253]: .No fan zones, application pausing u=
ntil new configuration
Jan 01 00:01:18 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 1.
Jan 01 00:01:18 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:01:18 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:01:18 test_obmc cpusensor[319]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:01:21 test_obmc cpusensor[319]: CPU configs are parsed
Jan 01 00:01:21 test_obmc cpusensor[319]: unable to open /dev/peci-1
Jan 01 00:01:21 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:01:21 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:01:26 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 2.
Jan 01 00:01:26 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:01:26 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:01:26 test_obmc cpusensor[325]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:01:26 test_obmc health-monitor[181]: DEASSERT: sensor CPU is unde=
r the upper threshold critical high
Jan 01 00:01:28 test_obmc cpusensor[325]: CPU configs are parsed
Jan 01 00:01:28 test_obmc cpusensor[325]: unable to open /dev/peci-1
Jan 01 00:01:28 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:01:28 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:01:30 test_obmc systemd[1]: systemd-hostnamed.service: Deactivate=
d successfully.
Jan 01 00:01:31 test_obmc systemd[1]: systemd-timedated.service: Deactivate=
d successfully.
Jan 01 00:01:33 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 3.
Jan 01 00:01:33 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:01:33 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:01:33 test_obmc cpusensor[333]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:01:34 test_obmc fansensor[270]: Sensor SP_FAN0_TACH reading error=
!
Jan 01 00:01:35 test_obmc fansensor[270]: Sensor SP_FAN3_TACH reading error=
!
Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN6_TACH reading error=
!
Jan 01 00:01:36 test_obmc cpusensor[333]: CPU configs are parsed
Jan 01 00:01:36 test_obmc cpusensor[333]: unable to open /dev/peci-1
Jan 01 00:01:36 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:01:36 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN1_TACH reading error=
!
Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN4_TACH reading error=
!
Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN7_TACH reading error=
!
Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN2_TACH reading error=
!
Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN5_TACH reading error=
!
Jan 01 00:01:38 test_obmc nscd[182]: 182 checking for monitored file `/nssw=
itch.conf': No such file or directory
Jan 01 00:01:38 test_obmc nscd[182]: 182 checking for monitored file `/grou=
p': No such file or directory
Jan 01 00:01:41 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 4.
Jan 01 00:01:41 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:01:41 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:01:41 test_obmc cpusensor[334]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:01:43 test_obmc cpusensor[334]: CPU configs are parsed
Jan 01 00:01:43 test_obmc cpusensor[334]: unable to open /dev/peci-1
Jan 01 00:01:43 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:01:43 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:01:48 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 5.
Jan 01 00:01:48 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:01:48 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:01:48 test_obmc cpusensor[335]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:01:49 test_obmc ipmid[290]: Set Sol Config - Invalid solInterface
Jan 01 00:01:49 test_obmc ipmid[290]: Failed to check request for full unpa=
ck
Jan 01 00:01:51 test_obmc cpusensor[335]: CPU configs are parsed
Jan 01 00:01:51 test_obmc cpusensor[335]: unable to open /dev/peci-1
Jan 01 00:01:51 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:01:51 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:01:53 test_obmc nscd[182]: 182 checking for monitored file `/nssw=
itch.conf': No such file or directory
Jan 01 00:01:53 test_obmc nscd[182]: 182 checking for monitored file `/grou=
p': No such file or directory
Jan 01 00:01:54 test_obmc ipmid[290]: wd_get: sd_bus_call: xyz.openbmc_proj=
ect.Common.Error.ResourceNotFound: The resource is not found.
Jan 01 00:01:56 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 6.
Jan 01 00:01:56 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:01:56 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:01:56 test_obmc cpusensor[338]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:01:58 test_obmc cpusensor[338]: CPU configs are parsed
Jan 01 00:01:58 test_obmc cpusensor[338]: unable to open /dev/peci-1
Jan 01 00:01:58 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:01:58 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:02:03 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 7.
Jan 01 00:02:03 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:02:03 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:02:03 test_obmc cpusensor[339]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:02:06 test_obmc cpusensor[339]: CPU configs are parsed
Jan 01 00:02:06 test_obmc cpusensor[339]: unable to open /dev/peci-1
Jan 01 00:02:06 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:02:06 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:02:11 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 8.
Jan 01 00:02:11 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:02:11 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:02:11 test_obmc cpusensor[340]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:02:13 test_obmc systemd[1]: xyz.openbmc_project.LED.GroupManager.=
service: start operation timed out. Terminating.
Jan 01 00:02:13 test_obmc systemd[1]: xyz.openbmc_project.LED.GroupManager.=
service: Failed with result 'timeout'.
Jan 01 00:02:13 test_obmc systemd[1]: Failed to start Phosphor LED Group Ma=
nagement Daemon.
Jan 01 00:02:13 test_obmc systemd[1]: Starting Wait for /xyz/openbmc_projec=
t/led/groups...
Jan 01 00:02:13 test_obmc cpusensor[340]: CPU configs are parsed
Jan 01 00:02:13 test_obmc cpusensor[340]: unable to open /dev/peci-1
Jan 01 00:02:13 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:02:13 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:02:14 test_obmc systemd[1]: xyz.openbmc_project.LED.GroupManager.=
service: Scheduled restart job, restart counter is at 1.
Jan 01 00:02:14 test_obmc systemd[1]: Stopped Phosphor LED Group Management=
 Daemon.
Jan 01 00:02:14 test_obmc systemd[1]: Starting Phosphor LED Group Managemen=
t Daemon...
Jan 01 00:02:18 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 9.
Jan 01 00:02:18 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:02:18 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:02:18 test_obmc cpusensor[344]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:02:21 test_obmc cpusensor[344]: CPU configs are parsed
Jan 01 00:02:21 test_obmc cpusensor[344]: unable to open /dev/peci-1
Jan 01 00:02:21 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:02:21 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:02:26 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 10.
Jan 01 00:02:26 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:02:26 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:02:26 test_obmc cpusensor[347]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:02:28 test_obmc cpusensor[347]: CPU configs are parsed
Jan 01 00:02:28 test_obmc cpusensor[347]: unable to open /dev/peci-1
Jan 01 00:02:28 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:02:28 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:02:31 test_obmc fansensor[270]: Sensor SP_FAN5_TACH reading error=
!
Jan 01 00:02:33 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 11.
Jan 01 00:02:33 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:02:33 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:02:33 test_obmc cpusensor[348]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:02:34 test_obmc login[259]: pam_lastlog(login:session): file /var=
/log/lastlog created
Jan 01 00:02:34 test_obmc login[349]: ROOT LOGIN=C2=A0 on '/dev/ttyS4'
Jan 01 00:02:36 test_obmc cpusensor[348]: CPU configs are parsed
Jan 01 00:02:36 test_obmc cpusensor[348]: unable to open /dev/peci-1
Jan 01 00:02:36 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:02:36 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:02:41 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 12.
Jan 01 00:02:41 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:02:41 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:02:41 test_obmc cpusensor[354]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:02:43 test_obmc cpusensor[354]: CPU configs are parsed
Jan 01 00:02:43 test_obmc cpusensor[354]: unable to open /dev/peci-1
Jan 01 00:02:43 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:02:43 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:02:48 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 13.
Jan 01 00:02:48 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:02:48 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:02:49 test_obmc cpusensor[356]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:02:51 test_obmc cpusensor[356]: CPU configs are parsed
Jan 01 00:02:51 test_obmc cpusensor[356]: unable to open /dev/peci-1
Jan 01 00:02:51 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:02:51 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:02:56 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 14.
Jan 01 00:02:56 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:02:56 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:02:56 test_obmc cpusensor[359]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:02:58 test_obmc cpusensor[359]: CPU configs are parsed
Jan 01 00:02:58 test_obmc cpusensor[359]: unable to open /dev/peci-1
Jan 01 00:02:58 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:02:58 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:03:03 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 15.
Jan 01 00:03:04 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:03:04 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:03:04 test_obmc cpusensor[363]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:03:06 test_obmc cpusensor[363]: CPU configs are parsed
Jan 01 00:03:06 test_obmc cpusensor[363]: unable to open /dev/peci-1
Jan 01 00:03:06 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:03:06 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:03:11 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 16.
Jan 01 00:03:11 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:03:11 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:03:11 test_obmc cpusensor[364]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:03:13 test_obmc cpusensor[364]: CPU configs are parsed
Jan 01 00:03:13 test_obmc cpusensor[364]: unable to open /dev/peci-1
Jan 01 00:03:13 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:03:13 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:03:18 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 17.
Jan 01 00:03:19 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:03:19 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:03:19 test_obmc cpusensor[366]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:03:21 test_obmc cpusensor[366]: CPU configs are parsed
Jan 01 00:03:21 test_obmc cpusensor[366]: unable to open /dev/peci-1
Jan 01 00:03:21 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:03:21 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:03:26 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 18.
Jan 01 00:03:26 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:03:26 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:03:26 test_obmc cpusensor[367]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:03:28 test_obmc cpusensor[367]: CPU configs are parsed
Jan 01 00:03:28 test_obmc cpusensor[367]: unable to open /dev/peci-1
Jan 01 00:03:28 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:03:28 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:03:34 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 19.
Jan 01 00:03:34 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:03:34 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:03:34 test_obmc cpusensor[368]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:03:36 test_obmc cpusensor[368]: CPU configs are parsed
Jan 01 00:03:36 test_obmc cpusensor[368]: unable to open /dev/peci-1
Jan 01 00:03:36 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:03:36 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:03:41 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 20.
Jan 01 00:03:41 test_obmc systemd[1]: Stopped CPU Sensor.
Jan 01 00:03:41 test_obmc systemd[1]: Started CPU Sensor.
Jan 01 00:03:41 test_obmc cpusensor[370]: error getting=C2=A0 SpecialMode s=
tatus No route to host
Jan 01 00:03:43 test_obmc cpusensor[370]: CPU configs are parsed
Jan 01 00:03:43 test_obmc cpusensor[370]: unable to open /dev/peci-1
Jan 01 00:03:43 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Main process exited, code=3Dexited, status=3D1/FAILURE
Jan 01 00:03:43 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Failed with result 'exit-code'.
Jan 01 00:03:44 test_obmc systemd[1]: xyz.openbmc_project.LED.GroupManager.=
service: start operation timed out. Terminating.
Jan 01 00:03:44 test_obmc systemd[1]: xyz.openbmc_project.LED.GroupManager.=
service: Failed with result 'timeout'.
Jan 01 00:03:44 test_obmc systemd[1]: Failed to start Phosphor LED Group Ma=
nagement Daemon.
Jan 01 00:03:45 test_obmc systemd[1]: xyz.openbmc_project.LED.GroupManager.=
service: Scheduled restart job, restart counter is at 2.
Jan 01 00:03:46 test_obmc systemd[1]: Stopped Phosphor LED Group Management=
 Daemon.
Jan 01 00:03:46 test_obmc systemd[1]: Starting Phosphor LED Group Managemen=
t Daemon...
Jan 01 00:03:48 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service=
: Scheduled restart job, restart counter is at 21.
....
Thanks in advance,
 Sincerely Yours,Hamidreza

------=_Part_3824164_481857794.1662204063457
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div dir=
=3D"ltr" data-setdir=3D"false">Hi all,<br></div><div dir=3D"ltr" data-setdi=
r=3D"false"><div>I'm trying to port OBMC to a new server motherboard. some =
of the hardware specification:<br><br>- 3rd Gen Intel Xeon Scalable Process=
or x2 slots<br>- Intel=C2=AE C621A chipset<br>- ASPEED AST2500<br>- x6 Fan =
with tacho<br><br><b>Are Done :</b><br>I wrote the device tree according to=
 its schematic and other similar server motherboards. Also, I wrote a new J=
SON configuration for Entity-Manager and x86-Power-Control. I created .conf=
 files of the sensors in /recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmo=
n/*.<br><b><br>Current Status :</b><br>- I can watch the Sensors and ADC va=
lues correctly.<br><div>- I can see current power status and turn off/on th=
e server.</div><div><b><br></b></div><b>Current Problems :</b><br>- PWM of =
all fans is set on 100%.<br>- BIOS is frozen at DXE running stage.<br><b><b=
r>conf/machine/test_obmc.conf :</b><br>...<br>VRTUAL-RUNTIME_obmc-inventory=
-manager =3D "entity-manager=E2=80=9D<br>VRTUAL-RUNTIME_obmc-sensors-hwmon =
=3D "dbus-sensors=E2=80=9D<br>VRTUAL-RUNTIME_obmc-host-state-manager =3D "x=
86-power-control=E2=80=9D<br>VRTUAL-RUNTIME_obmc-chassis-state-manager =3D =
"x86-power-control=E2=80=9D<br>VRTUAL-RUNTIME_obmc-fan-control =3D "phospho=
r-pid-control=E2=80=9D<br><br><b>recipes-kernel/linux/linux-aspeed/test_obm=
c.cfg :</b><br>...<br>CONFIG_PECI=3Dy<br>...<br><br><b>My Questions :</b><b=
r>- I built the sensors .conf files in /reciptes-phosphor/sensors/*. Is it =
needed spite Entity-Manager has been configured?<br>- Why isn't `/dev/peci-=
1` created though `CONFIG_PECI=3Dy`?&nbsp; Is it reason of restarting CPU S=
ensor service?<br>- I defines two LED as `heartbeat` and `system-fault` ins=
ide the DTS file.&nbsp; What's the problem with `Phosphor LED Group Managem=
ent?<br>- Why all of the PWM values are invalid? I set `phosphor-pid-contro=
l`, Although, There are multiple errors with PWM and tacho sensors.</div><d=
iv><br></div><div dir=3D"ltr" data-setdir=3D"false"><div><br><b>journalctl =
output :</b><br>Jan 01 00:00:12 test_obmc kernel: Booting Linux on physical=
 CPU 0x0<br>Jan 01 00:00:12 test_obmc kernel: Linux version 5.15.36-8ddab47=
 (oe-user@oe-host) (arm-openbmc-linux-gnueabi-gcc (GCC) 11.3.0, GNU ld (GNU=
 Binutils) 2.38.20220313) #1 Tue May 3 06:36:43 UTC 2022<br>Jan 01 00:00:12=
 test_obmc kernel: CPU: ARMv6-compatible processor [410fb767] revision 7 (A=
RMv7), cr=3D00c5387d<br>Jan 01 00:00:12 test_obmc kernel: CPU: PIPT / VIPT =
nonaliasing data cache, VIPT nonaliasing instruction cache<br>Jan 01 00:00:=
12 test_obmc kernel: OF: fdt: Machine model: ASRock test_obmc<br>Jan 01 00:=
00:12 test_obmc kernel: Memory policy: Data cache writeback<br>Jan 01 00:00=
:12 test_obmc kernel: cma: Reserved 16 MiB at 0x9d800000<br>Jan 01 00:00:12=
 test_obmc kernel: Zone ranges:<br>Jan 01 00:00:12 test_obmc kernel:&nbsp;&=
nbsp; Normal&nbsp; em 0x0000000080000000-0x000000009effffff]<br>Jan 01 00:0=
0:12 test_obmc kernel: Movable zone start for each node<br>Jan 01 00:00:12 =
test_obmc kernel: Early memory node ranges<br>Jan 01 00:00:12 test_obmc ker=
nel:&nbsp;&nbsp; node&nbsp;&nbsp; 0:em 0x0000000080000000-0x000000009efffff=
f]<br>Jan 01 00:00:12 test_obmc kernel: Initmem setup node 0em 0x0000000080=
000000-0x000000009effffff]<br>Jan 01 00:00:12 test_obmc kernel: Built 1 zon=
elists, mobility grouping on.&nbsp; Total pages: 125984<br>Jan 01 00:00:12 =
test_obmc kernel: Kernel command line: console=3DttyS4,115200n8 root=3D/dev=
/ram rw<br>Jan 01 00:00:12 test_obmc kernel: Dentry cache hash table entrie=
s: 65536 (order: 6, 262144 bytes, linear)<br>Jan 01 00:00:12 test_obmc kern=
el: Inode-cache hash table entries: 32768 (order: 5, 131072 bytes, linear)<=
br>Jan 01 00:00:12 test_obmc kernel: mem auto-init: stack:off, heap alloc:o=
ff, heap free:off<br>Jan 01 00:00:12 test_obmc kernel: Memory: 474768K/5079=
04K available (7168K kernel code, 664K rwdata, 1556K rodata, 1024K init, 16=
0K bss, 16752K reserved, 16384K cma-reserved)<br>Jan 01 00:00:12 test_obmc =
kernel: random: get_random_u32 called from __kmem_cache_create+0x30/0x400 w=
ith crng_init=3D0<br>Jan 01 00:00:12 test_obmc kernel: SLUB: HWalign=3D32, =
Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1<br>Jan 01 00:00:12 test_ob=
mc kernel: ftrace: allocating 23765 entries in 47 pages<br>Jan 01 00:00:12 =
test_obmc kernel: ftrace: allocated 47 pages with 5 groups<br>Jan 01 00:00:=
12 test_obmc kernel: trace event string verifier disabled<br>Jan 01 00:00:1=
2 test_obmc kernel: NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16<br>Jan =
01 00:00:12 test_obmc kernel: i2c controller registered, irq 17<br>Jan 01 0=
0:00:12 test_obmc kernel: clocksource: FTTMR010-TIMER2: mask: 0xffffffff ma=
x_cycles: 0xffffffff, max_idle_ns: 77222644334 ns<br>Jan 01 00:00:12 test_o=
bmc kernel: sched_clock: 32 bits at 24MHz, resolution 40ns, wraps every 867=
67015915ns<br>Jan 01 00:00:12 test_obmc kernel: Switching to timer-based de=
lay loop, resolution 40ns<br>Jan 01 00:00:12 test_obmc kernel: Calibrating =
delay loop (skipped), value calculated using timer frequency.. 49.50 BogoMI=
PS (lpj=3D247500)<br>Jan 01 00:00:12 test_obmc kernel: pid_max: default: 32=
768 minimum: 301<br>Jan 01 00:00:12 test_obmc kernel: Mount-cache hash tabl=
e entries: 1024 (order: 0, 4096 bytes, linear)<br>Jan 01 00:00:12 test_obmc=
 kernel: Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, l=
inear)<br>Jan 01 00:00:12 test_obmc kernel: CPU: Testing write buffer coher=
ency: ok<br>Jan 01 00:00:12 test_obmc kernel: Setting up static identity ma=
p for 0x80100000 - 0x80100038<br>Jan 01 00:00:12 test_obmc kernel: ASPEED A=
ST2500 rev A2 (04030303)<br>Jan 01 00:00:12 test_obmc kernel: devtmpfs: ini=
tialized<br>Jan 01 00:00:12 test_obmc kernel: clocksource: jiffies: mask: 0=
xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns<br>Jan =
01 00:00:12 test_obmc kernel: futex hash table entries: 256 (order: -1, 307=
2 bytes, linear)<br>Jan 01 00:00:12 test_obmc kernel: pinctrl core: initial=
ized pinctrl subsystem<br>Jan 01 00:00:12 test_obmc kernel: NET: Registered=
 PF_NETLINK/PF_ROUTE protocol family<br>Jan 01 00:00:12 test_obmc kernel: D=
MA: preallocated 256 KiB pool for atomic coherent allocations<br>Jan 01 00:=
00:12 test_obmc kernel: hw-breakpoint: found 6 breakpoint and 1 watchpoint =
registers.<br>Jan 01 00:00:12 test_obmc kernel: hw-breakpoint: maximum watc=
hpoint size is 4 bytes.<br>Jan 01 00:00:12 test_obmc kernel: mc: Linux medi=
a interface: v0.10<br>Jan 01 00:00:12 test_obmc kernel: videodev: Linux vid=
eo capture interface: v2.00<br>Jan 01 00:00:12 test_obmc kernel: pps_core: =
LinuxPPS API ver. 1 registered<br>Jan 01 00:00:12 test_obmc kernel: pps_cor=
e: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;giometti@=
linux.it&gt;<br>Jan 01 00:00:12 test_obmc kernel: PTP clock support registe=
red<br>Jan 01 00:00:12 test_obmc kernel: clocksource: Switched to clocksour=
ce FTTMR010-TIMER2<br>Jan 01 00:00:12 test_obmc kernel: NET: Registered PF_=
INET protocol family<br>Jan 01 00:00:12 test_obmc kernel: IP idents hash ta=
ble entries: 8192 (order: 4, 65536 bytes, linear)<br>Jan 01 00:00:12 test_o=
bmc kernel: tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 409=
6 bytes, linear)<br>Jan 01 00:00:12 test_obmc kernel: TCP established hash =
table entries: 4096 (order: 2, 16384 bytes, linear)<br>Jan 01 00:00:12 test=
_obmc kernel: TCP bind hash table entries: 4096 (order: 2, 16384 bytes, lin=
ear)<br>Jan 01 00:00:12 test_obmc kernel: TCP: Hash tables configured (esta=
blished 4096 bind 4096)<br>Jan 01 00:00:12 test_obmc kernel: UDP hash table=
 entries: 256 (order: 0, 4096 bytes, linear)<br>Jan 01 00:00:12 test_obmc k=
ernel: UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)<br>J=
an 01 00:00:12 test_obmc kernel: NET: Registered PF_UNIX/PF_LOCAL protocol =
family<br>Jan 01 00:00:12 test_obmc kernel: Unpacking initramfs...<br>Jan 0=
1 00:00:12 test_obmc kernel: workingset: timestamp_bits=3D30 max_order=3D17=
 bucket_order=3D0<br>Jan 01 00:00:12 test_obmc kernel: squashfs: version 4.=
0 (2009/01/31) Phillip Lougher<br>Jan 01 00:00:12 test_obmc kernel: jffs2: =
version 2.2. (SUMMARY)&nbsp; =C2=A9 2001-2006 Red Hat, Inc.<br>Jan 01 00:00=
:12 test_obmc kernel: NET: Registered PF_ALG protocol family<br>Jan 01 00:0=
0:12 test_obmc kernel: gpio-794 (bmc-ready): hogged as output/high<br>Jan 0=
1 00:00:12 test_obmc kernel: gpio-832 (bmc-smb): hogged as output/low<br>Ja=
n 01 00:00:12 test_obmc kernel: ast-kcs-bmc 1e78902c.kcs: Initialised raw c=
lient for channel 3<br>Jan 01 00:00:12 test_obmc kernel: ast-kcs-bmc 1e7890=
2c.kcs: Initialised IPMI client for channel 3<br>Jan 01 00:00:12 test_obmc =
kernel: ast-kcs-bmc 1e78902c.kcs: Initialised channel 3 at 0xca2<br>Jan 01 =
00:00:12 test_obmc kernel: Serial: 8250/16550 driver, 6 ports, IRQ sharing =
enabled<br>Jan 01 00:00:12 test_obmc kernel: printk: console [ttyS4] disabl=
ed<br>Jan 01 00:00:13 test_obmc kernel: 1e784000.serial: ttyS4 at MMIO 0x1e=
784000 (irq =3D 31, base_baud =3D 1500000) is a 16550A<br>Jan 01 00:00:13 t=
est_obmc kernel: printk: console [ttyS4] enabled<br>Jan 01 00:00:13 test_ob=
mc kernel: timeriomem_rng 1e6e2078.hwrng: 32bits from 0x(ptrval) @ 1us<br>J=
an 01 00:00:13 test_obmc kernel: random: fast init done<br>Jan 01 00:00:13 =
test_obmc kernel: random: crng init done<br>Jan 01 00:00:13 test_obmc kerne=
l: loop: module loaded<br>Jan 01 00:00:13 test_obmc kernel: spi-nor spi0.0:=
 w25q512jv (65536 Kbytes)<br>Jan 01 00:00:13 test_obmc kernel: spi-aspeed-s=
mc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]<br>Jan 01 00:00:13 test_o=
bmc kernel: 5 fixed-partitions partitions found on MTD device bmc<br>Jan 01=
 00:00:13 test_obmc kernel: Creating 5 MTD partitions on "bmc":<br>Jan 01 0=
0:00:13 test_obmc kernel: 0x000000000000-0x0000000e0000 : "u-boot"<br>Jan 0=
1 00:00:13 test_obmc kernel: 0x0000000e0000-0x000000100000 : "u-boot-env"<b=
r>Jan 01 00:00:13 test_obmc kernel: 0x000000100000-0x000000a00000 : "kernel=
"<br>Jan 01 00:00:13 test_obmc kernel: 0x000000a00000-0x000002a00000 : "rof=
s"<br>Jan 01 00:00:13 test_obmc kernel: 0x000002a00000-0x000004000000 : "rw=
fs"<br>Jan 01 00:00:13 test_obmc kernel: spi-nor spi1.0: unrecognized JEDEC=
 id bytes: 00 00 00 00 00 00<br>Jan 01 00:00:13 test_obmc kernel: spi-nor: =
probe of spi1.0 failed with error -2<br>Jan 01 00:00:13 test_obmc kernel: f=
tgmac100 1e660000.ethernet: Generated random MAC address 2e:28:4e:8b:ce:8a<=
br>Jan 01 00:00:13 test_obmc kernel: RTL8211E Gigabit Ethernet 1e660000.eth=
ernet--1:00: attached PHY driver (mii_bus:phy_addr=3D1e660000.ethernet--1:0=
0, irq=3DPOLL)<br>Jan 01 00:00:13 test_obmc kernel: ftgmac100 1e660000.ethe=
rnet eth0: irq 20, mapped at f4c72443<br>Jan 01 00:00:13 test_obmc kernel: =
aspeed_vhub 1e6a0000.usb-vhub: Initialized virtual hub in USB2 mode<br>Jan =
01 00:00:13 test_obmc kernel: Mass Storage Function, version: 2009/09/11<br=
>Jan 01 00:00:13 test_obmc kernel: LUN: removable file: (no medium)<br>Jan =
01 00:00:13 test_obmc kernel: no file given for LUN0<br>Jan 01 00:00:13 tes=
t_obmc kernel: udc 1e6a0000.usb-vhub:p1: failed to start g_mass_storage: -2=
2<br>Jan 01 00:00:13 test_obmc kernel: i2c_dev: i2c /dev entries driver<br>=
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a040.i2c-bus: i2c bus =
0 registered, irq 33<br>Jan 01 00:00:13 test_obmc kernel: at24 1-0053: 1638=
4 byte 24c128 EEPROM, writable, 64 bytes/write<br>Jan 01 00:00:13 test_obmc=
 kernel: pca953x 1-001c: using no AI<br>Jan 01 00:00:13 test_obmc kernel: p=
ca953x 1-001c: failed writing register<br>Jan 01 00:00:13 test_obmc kernel:=
 aspeed-i2c-bus 1e78a080.i2c-bus: i2c bus 1 registered, irq 34<br>Jan 01 00=
:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a0c0.i2c-bus: i2c bus 2 registe=
red, irq 35<br>Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a100.i2=
c-bus: i2c bus 3 registered, irq 36<br>Jan 01 00:00:13 test_obmc kernel: as=
peed-i2c-bus 1e78a140.i2c-bus: i2c bus 4 registered, irq 37<br>Jan 01 00:00=
:13 test_obmc kernel: Freeing initrd memory: 1084K<br>Jan 01 00:00:13 test_=
obmc kernel: aspeed-i2c-bus 1e78a180.i2c-bus: i2c bus 5 registered, irq 38<=
br>Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a1c0.i2c-bus: i2c b=
us 6 registered, irq 39<br>Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus=
 1e78a300.i2c-bus: i2c bus 7 registered, irq 40<br>Jan 01 00:00:13 test_obm=
c kernel: aspeed-i2c-bus 1e78a340.i2c-bus: i2c bus 8 registered, irq 41<br>=
Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a380.i2c-bus: i2c bus =
9 registered, irq 42<br>Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e=
78a3c0.i2c-bus: i2c bus 10 registered, irq 43<br>Jan 01 00:00:13 test_obmc =
kernel: aspeed-i2c-bus 1e78a400.i2c-bus: i2c bus 11 registered, irq 44<br>J=
an 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a440.i2c-bus: i2c bus 1=
2 registered, irq 45<br>Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e=
78a480.i2c-bus: i2c bus 13 registered, irq 46<br>Jan 01 00:00:13 test_obmc =
kernel: pca954x 4-0038: probe failed<br>Jan 01 00:00:13 test_obmc kernel: p=
ca954x 5-0038: probe failed<br>Jan 01 00:00:13 test_obmc kernel: pca954x 12=
-0071: probe failed<br>Jan 01 00:00:13 test_obmc kernel: Driver for 1-wire =
Dallas network protocol.<br>Jan 01 00:00:13 test_obmc kernel: SPI driver bm=
p280 has no spi_device_id for bosch,bmp085<br>Jan 01 00:00:13 test_obmc ker=
nel: NET: Registered PF_INET6 protocol family<br>Jan 01 00:00:13 test_obmc =
kernel: Segment Routing with IPv6<br>Jan 01 00:00:13 test_obmc kernel: In-s=
itu OAM (IOAM) with IPv6<br>Jan 01 00:00:13 test_obmc kernel: NET: Register=
ed PF_PACKET protocol family<br>Jan 01 00:00:13 test_obmc kernel: 8021q: 80=
2.1Q VLAN Support v1.8<br>Jan 01 00:00:13 test_obmc kernel: printk: console=
 [netcon0] enabled<br>Jan 01 00:00:13 test_obmc kernel: netconsole: network=
 logging started<br>Jan 01 00:00:13 test_obmc kernel: Freeing unused kernel=
 image (initmem) memory: 1024K<br>Jan 01 00:00:13 test_obmc kernel: Checked=
 W+X mappings: passed, no W+X pages found<br>Jan 01 00:00:13 test_obmc kern=
el: Run /init as init process<br>Jan 01 00:00:13 test_obmc kernel: jffs2: n=
otice: (100) jffs2_build_xattr_subsystem: complete building xattr subsystem=
, 20 of xdatum (19 unchecked, 1 orphan) and 27 of xref (1 dead, 0 orphan) f=
ound.<br>Jan 01 00:00:13 test_obmc kernel: overlayfs: upper fs does not sup=
port tmpfile.<br>Jan 01 00:00:13 test_obmc kernel: overlayfs: upper fs does=
 not support RENAME_WHITEOUT.<br>Jan 01 00:00:13 test_obmc systemd[1]: Fail=
ed to look up module alias 'autofs4': Function not implemented<br>Jan 01 00=
:00:13 test_obmc systemd[1]: systemd 250 running in system mode (+PAM -AUDI=
T -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT -GNUTLS -OPENSSL -ACL +BL=
KID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTSETUP +LIBFDISK =
-PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4 -XZ -ZLIB +ZSTD -BPF_FRAMEW=
ORK -XKBCOMMON -UTMP +SYSVINIT default-hierarchy=3Dhybrid)<br>Jan 01 00:00:=
13 test_obmc systemd[1]: Detected architecture arm.<br>Jan 01 00:00:13 test=
_obmc systemd[1]: Hostname set to &lt;test_obmc&gt;.<br>Jan 01 00:00:13 tes=
t_obmc systemd[111]: /lib/systemd/system-generators/systemd-gpt-auto-genera=
tor failed with exit status 1.<br>Jan 01 00:00:13 test_obmc systemd[1]: /li=
b/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name, ignor=
ing: sys-subsystem-net-devices-%i.device<br>Jan 01 00:00:13 test_obmc syste=
md[1]: Queued start job for default target Multi-User System.<br>Jan 01 00:=
00:13 test_obmc systemd[1]: Created slice Slice /system/getty.<br>Jan 01 00=
:00:13 test_obmc systemd[1]: Created slice Slice /system/mapper-wait.<br>Ja=
n 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/modprobe.<b=
r>Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/obmc-le=
d-group-start.<br>Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice=
 /system/phosphor-certificate-manager.<br>Jan 01 00:00:13 test_obmc systemd=
[1]: Created slice Slice /system/phosphor-ipmi-kcs.<br>Jan 01 00:00:13 test=
_obmc systemd[1]: Created slice Slice /system/phosphor-ipmi-net.<br>Jan 01 =
00:00:13 test_obmc systemd[1]: Created slice Slice /system/serial-getty.<br=
>Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/xyz.open=
bmc_project.Chassis.Control.Power.<br>Jan 01 00:00:13 test_obmc systemd[1]:=
 Started Dispatch Password Requests to Console Directory Watch.<br>Jan 01 0=
0:00:13 test_obmc systemd[1]: Started Forward Password Requests to Wall Dir=
ectory Watch.<br>Jan 01 00:00:13 test_obmc systemd[1]: Reached target Path =
Units.<br>Jan 01 00:00:13 test_obmc systemd[1]: Reached target Remote File =
Systems.<br>Jan 01 00:00:13 test_obmc systemd[1]: Reached target Slice Unit=
s.<br>Jan 01 00:00:13 test_obmc systemd[1]: Reached target Swaps.<br>Jan 01=
 00:00:13 test_obmc systemd[1]: Listening on Syslog Socket.<br>Jan 01 00:00=
:13 test_obmc systemd[1]: Listening on Process Core Dump Socket.<br>Jan 01 =
00:00:13 test_obmc systemd[1]: Listening on initctl Compatibility Named Pip=
e.<br>Jan 01 00:00:13 test_obmc systemd[1]: Journal Audit Socket was skippe=
d because of a failed condition check (ConditionSecurity=3Daudit).<br>Jan 0=
1 00:00:13 test_obmc systemd[1]: Listening on Journal Socket (/dev/log).<br=
>Jan 01 00:00:13 test_obmc systemd[1]: Listening on Journal Socket.<br>Jan =
01 00:00:13 test_obmc systemd[1]: Listening on Network Service Netlink Sock=
et.<br>Jan 01 00:00:13 test_obmc systemd[1]: Listening on udev Control Sock=
et.<br>Jan 01 00:00:13 test_obmc systemd[1]: Listening on udev Kernel Socke=
t.<br>Jan 01 00:00:13 test_obmc systemd[1]: Huge Pages File System was skip=
ped because of a failed condition check (ConditionPathExists=3D/sys/kernel/=
mm/hugepages).<br>Jan 01 00:00:13 test_obmc systemd[1]: POSIX Message Queue=
 File System was skipped because of a failed condition check (ConditionPath=
Exists=3D/proc/sys/fs/mqueue).<br>Jan 01 00:00:13 test_obmc systemd[1]: Mou=
nting Kernel Debug File System...<br>Jan 01 00:00:13 test_obmc systemd[1]: =
Mounting Kernel Trace File System...<br>Jan 01 00:00:13 test_obmc systemd[1=
]: Mounting Temporary Directory /tmp...<br>Jan 01 00:00:13 test_obmc system=
d[1]: Create List of Static Device Nodes was skipped because of a failed co=
ndition check (ConditionFileNotEmpty=3D/lib/modules/5.15.36-8ddab47/modules=
.devname).<br>Jan 01 00:00:13 test_obmc systemd[1]: Starting Load Kernel Mo=
dule configfs...<br>Jan 01 00:00:13 test_obmc systemd[1]: Starting Load Ker=
nel Module fuse...<br>Jan 01 00:00:13 test_obmc systemd[1]: File System Che=
ck on Root Device was skipped because of a failed condition check (Conditio=
nPathIsReadWrite=3D!/).<br>Jan 01 00:00:13 test_obmc systemd[1]: Starting J=
ournal Service...<br>Jan 01 00:00:13 test_obmc systemd[1]: Load Kernel Modu=
les was skipped because all trigger condition checks failed.<br>Jan 01 00:0=
0:13 test_obmc systemd[1]: Starting Generate network units from Kernel comm=
and line...<br>Jan 01 00:00:13 test_obmc systemd[1]: Starting Remount Root =
and Kernel File Systems...<br>Jan 01 00:00:13 test_obmc systemd[1]: Startin=
g Apply Kernel Variables...<br>Jan 01 00:00:13 test_obmc systemd[1]: Starti=
ng Coldplug All udev Devices...<br>Jan 01 00:00:13 test_obmc systemd[1]: Mo=
unted Kernel Debug File System.<br>Jan 01 00:00:13 test_obmc systemd[1]: Mo=
unted Kernel Trace File System.<br>Jan 01 00:00:13 test_obmc systemd[1]: Mo=
unted Temporary Directory /tmp.<br>Jan 01 00:00:13 test_obmc systemd[1]: mo=
dprobe@configfs.service: Deactivated successfully.<br>Jan 01 00:00:13 test_=
obmc systemd[1]: Finished Load Kernel Module configfs.<br>Jan 01 00:00:13 t=
est_obmc systemd[1]: modprobe@fuse.service: Deactivated successfully.<br>Ja=
n 01 00:00:13 test_obmc systemd[1]: Finished Load Kernel Module fuse.<br>Ja=
n 01 00:00:13 test_obmc systemd[1]: Finished Generate network units from Ke=
rnel command line.<br>Jan 01 00:00:13 test_obmc systemd[1]: Finished Remoun=
t Root and Kernel File Systems.<br>Jan 01 00:00:13 test_obmc systemd[1]: Fi=
nished Apply Kernel Variables.<br>Jan 01 00:00:13 test_obmc systemd[1]: Rea=
ched target Preparation for Network.<br>Jan 01 00:00:13 test_obmc systemd[1=
]: FUSE Control File System was skipped because of a failed condition check=
 (ConditionPathExists=3D/sys/fs/fuse/connections).<br>Jan 01 00:00:13 test_=
obmc systemd[1]: Mounting Kernel Configuration File System...<br>Jan 01 00:=
00:13 test_obmc systemd[1]: Rebuild Hardware Database was skipped because o=
f a failed condition check (ConditionNeedsUpdate=3D/etc).<br>Jan 01 00:00:1=
3 test_obmc systemd[1]: Platform Persistent Storage Archival was skipped be=
cause of a failed condition check (ConditionDirectoryNotEmpty=3D/sys/fs/pst=
ore).<br>Jan 01 00:00:13 test_obmc systemd[1]: Create System Users was skip=
ped because of a failed condition check (ConditionNeedsUpdate=3D/etc).<br>J=
an 01 00:00:13 test_obmc systemd[1]: Starting Create Static Device Nodes in=
 /dev...<br>Jan 01 00:00:13 test_obmc systemd[1]: Mounted Kernel Configurat=
ion File System.<br>Jan 01 00:00:13 test_obmc systemd[1]: Finished Create S=
tatic Device Nodes in /dev.<br>Jan 01 00:00:13 test_obmc systemd[1]: Reache=
d target Preparation for Local File Systems.<br>Jan 01 00:00:13 test_obmc s=
ystemd[1]: Mounting /var/volatile...<br>Jan 01 00:00:13 test_obmc systemd-j=
ournald[125]: Journal started<br>Jan 01 00:00:13 test_obmc systemd-journald=
[125]: Runtime Journal (/run/log/journal/96af4eacf7ca4faa85a8bdc626516057) =
is 8.0M, max 64.0M, 56.0M free.<br>Jan 01 00:00:12 test_obmc systemd-sysctl=
[128]: Couldn't write '16' to 'kernel/sysrq', ignoring: No such file or dir=
ectory<br>Jan 01 00:00:13 test_obmc systemd-tmpfiles[135]: =1B]8;;file://te=
st_obmc/usr/lib/tmpfiles.d/dbus.conf=07/usr/lib/tmpfiles.d/dbus.conf=1B]8;;=
=07:13: Line references path below legacy directory /var/run/, updating /va=
r/run/dbus/containers =E2=86=92 /run/dbus/containers; please update the tmp=
files.d/ drop-in file accordingly.<br>Jan 01 00:00:14 test_obmc systemd[1]:=
 Starting Rule-based Manager for Device Events and Files...<br>Jan 01 00:00=
:14 test_obmc systemd[1]: Started Journal Service.<br>Jan 01 00:00:14 test_=
obmc systemd[1]: Mounted /var/volatile.<br>Jan 01 00:00:14 test_obmc system=
d[1]: Starting Flush Journal to Persistent Storage...<br>Jan 01 00:00:14 te=
st_obmc systemd[1]: Bind mount volatile /var/cache was skipped because of a=
 failed condition check (ConditionPathIsReadWrite=3D!/var/cache).<br>Jan 01=
 00:00:14 test_obmc systemd[1]: Bind mount volatile /var/lib was skipped be=
cause of a failed condition check (ConditionPathIsReadWrite=3D!/var/lib).<b=
r>Jan 01 00:00:14 test_obmc systemd[1]: Starting Load/Save Random Seed...<b=
r>Jan 01 00:00:14 test_obmc systemd[1]: Bind mount volatile /var/spool was =
skipped because of a failed condition check (ConditionPathIsReadWrite=3D!/v=
ar/spool).<br>Jan 01 00:00:14 test_obmc systemd[1]: Bind mount volatile /sr=
v was skipped because of a failed condition check (ConditionPathIsReadWrite=
=3D!/srv).<br>Jan 01 00:00:14 test_obmc systemd[1]: Reached target Local Fi=
le Systems.<br>Jan 01 00:00:14 test_obmc systemd-journald[125]: Runtime Jou=
rnal (/run/log/journal/96af4eacf7ca4faa85a8bdc626516057) is 8.0M, max 64.0M=
, 56.0M free.<br>Jan 01 00:00:14 test_obmc systemd-journald[125]: Received =
client request to flush runtime journal.<br>Jan 01 00:00:14 test_obmc syste=
md[1]: Finished Flush Journal to Persistent Storage.<br>Jan 01 00:00:14 tes=
t_obmc systemd[1]: Starting Create Volatile Files and Directories...<br>Jan=
 01 00:00:14 test_obmc systemd[1]: Finished Load/Save Random Seed.<br>Jan 0=
1 00:00:15 test_obmc systemd[1]: First Boot Complete was skipped because of=
 a failed condition check (ConditionFirstBoot=3Dyes).<br>Jan 01 00:00:15 te=
st_obmc systemd[1]: Commit a transient machine-id on disk was skipped becau=
se of a failed condition check (ConditionPathIsMountPoint=3D/etc/machine-id=
).<br>Jan 01 00:00:15 test_obmc systemd-tmpfiles[141]: =1B]8;;file://test/u=
sr/lib/tmpfiles.d/dbus.conf=07/usr/lib/tmpfiles.d/dbus.conf=1B]8;;=07:13: L=
ine references path below legacy directory /var/run/, updating /var/run/dbu=
s/containers =E2=86=92 /run/dbus/containers; please update the tmpfiles.d/ =
drop-in file accordingly.<br>Jan 01 00:00:15 test_obmc systemd[1]: Finished=
 Create Volatile Files and Directories.<br>Jan 01 00:00:15 test_obmc system=
d[1]: Rebuild Journal Catalog was skipped because of a failed condition che=
ck (ConditionNeedsUpdate=3D/var).<br>Jan 01 00:00:15 test_obmc systemd[1]: =
Update is Completed was skipped because all trigger condition checks failed=
.<br>Jan 01 00:00:16 test_obmc systemd[1]: Started Rule-based Manager for D=
evice Events and Files.<br>Jan 01 00:00:16 test_obmc systemd[1]: Starting N=
etwork Configuration...<br>Jan 01 00:00:17 test_obmc systemd[1]: Finished C=
oldplug All udev Devices.<br>Jan 01 00:00:17 test_obmc systemd[1]: Starting=
 Wait for udev To Complete Device Initialization...<br>Jan 01 00:00:18 test=
_obmc systemd-udevd[142]: Using default interface naming scheme 'v250'.<br>=
Jan 01 00:00:21 test_obmc systemd[1]: Found device /sys/subsystem/net/devic=
es/eth0.<br>Jan 01 00:00:22 test_obmc udevadm[149]: systemd-udev-settle.ser=
vice is deprecated. Please fix rngd.service not to pull it in.<br>Jan 01 00=
:00:22 test_obmc systemd[1]: Finished Wait for udev To Complete Device Init=
ialization.<br>Jan 01 00:00:22 test_obmc systemd-networkd[148]: lo: Link UP=
<br>Jan 01 00:00:22 test_obmc systemd-networkd[148]: lo: Gained carrier<br>=
Jan 01 00:00:22 test_obmc systemd-networkd[148]: Enumeration completed<br>J=
an 01 00:00:22 test_obmc systemd[1]: Started Network Configuration.<br>Jan =
01 00:00:22 test_obmc systemd-networkd[148]: eth0: Link UP<br>Jan 01 00:00:=
22 test_obmc systemd[1]: Created slice Slice /system/xyz.openbmc_project.le=
d.controller.<br>Jan 01 00:00:22 test_obmc systemd[1]: Reached target Hardw=
are activated USB gadget.<br>Jan 01 00:00:22 test_obmc systemd[1]: Huge Pag=
es File System was skipped because of a failed condition check (ConditionPa=
thExists=3D/sys/kernel/mm/hugepages).<br>Jan 01 00:00:22 test_obmc systemd[=
1]: POSIX Message Queue File System was skipped because of a failed conditi=
on check (ConditionPathExists=3D/proc/sys/fs/mqueue).<br>Jan 01 00:00:22 te=
st_obmc systemd[1]: Create List of Static Device Nodes was skipped because =
of a failed condition check (ConditionFileNotEmpty=3D/lib/modules/5.15.36-8=
ddab47/modules.devname).<br>Jan 01 00:00:22 test_obmc systemd[1]: Starting =
Load Kernel Module fuse...<br>Jan 01 00:00:22 test_obmc systemd[1]: Started=
 Hardware RNG Entropy Gatherer Daemon.<br>Jan 01 00:00:22 test_obmc systemd=
[1]: Rebuild Hardware Database was skipped because of a failed condition ch=
eck (ConditionNeedsUpdate=3D/etc).<br>Jan 01 00:00:22 test_obmc systemd[1]:=
 Rebuild Journal Catalog was skipped because of a failed condition check (C=
onditionNeedsUpdate=3D/var).<br>Jan 01 00:00:22 test_obmc systemd[1]: Commi=
t a transient machine-id on disk was skipped because of a failed condition =
check (ConditionPathIsMountPoint=3D/etc/machine-id).<br>Jan 01 00:00:22 tes=
t_obmc systemd[1]: Load Kernel Modules was skipped because all trigger cond=
ition checks failed.<br>Jan 01 00:00:22 test_obmc systemd[1]: Starting Wait=
 for Network to be Configured...<br>Jan 01 00:00:22 test_obmc systemd[1]: P=
latform Persistent Storage Archival was skipped because of a failed conditi=
on check (ConditionDirectoryNotEmpty=3D/sys/fs/pstore).<br>Jan 01 00:00:22 =
test_obmc systemd[1]: Create System Users was skipped because of a failed c=
ondition check (ConditionNeedsUpdate=3D/etc).<br>Jan 01 00:00:23 test_obmc =
systemd[1]: Starting Network Name Resolution...<br>Jan 01 00:00:23 test_obm=
c systemd[1]: Update is Completed was skipped because all trigger condition=
 checks failed.<br>Jan 01 00:00:23 test_obmc systemd[1]: modprobe@fuse.serv=
ice: Deactivated successfully.<br>Jan 01 00:00:23 test_obmc systemd[1]: Fin=
ished Load Kernel Module fuse.<br>Jan 01 00:00:23 test_obmc systemd[1]: FUS=
E Control File System was skipped because of a failed condition check (Cond=
itionPathExists=3D/sys/fs/fuse/connections).<br>Jan 01 00:00:23 test_obmc s=
ystemd[1]: Reached target System Initialization.<br>Jan 01 00:00:23 test_ob=
mc systemd[1]: logrotate.timer: Not using persistent file timestamp Thu 197=
0-01-01 00:00:32 UTC as it is in the future.<br>Jan 01 00:00:23 test_obmc s=
ystemd[1]: Started Daily rotation of log files.<br>Jan 01 00:00:23 test_obm=
c systemd[1]: Started Daily Cleanup of Temporary Directories.<br>Jan 01 00:=
00:23 test_obmc systemd[1]: Reached target Timer Units.<br>Jan 01 00:00:23 =
test_obmc systemd[1]: Listening on Avahi mDNS/DNS-SD Stack Activation Socke=
t.<br>Jan 01 00:00:23 test_obmc systemd[1]: Listening on BMC Webserver sock=
et.<br>Jan 01 00:00:23 test_obmc systemd[1]: Listening on D-Bus System Mess=
age Bus Socket.<br>Jan 01 00:00:23 test_obmc systemd[1]: Listening on dropb=
ear.socket.<br>Jan 01 00:00:23 test_obmc systemd[1]: Listening on Phosphor =
Host Console SSH Per-Connection socket.<br>Jan 01 00:00:24 test_obmc system=
d[1]: Listening on phosphor-ipmi-net@eth0.socket.<br>Jan 01 00:00:24 test_o=
bmc systemd[1]: Reached target Socket Units.<br>Jan 01 00:00:24 test_obmc s=
ystemd[1]: Starting D-Bus System Message Bus...<br>Jan 01 00:00:24 test_obm=
c kernel: ftgmac100 1e660000.ethernet eth0: Link is Up - 100Mbps/Full - flo=
w control rx/tx<br>Jan 01 00:00:24 test_obmc kernel: IPv6: ADDRCONF(NETDEV_=
CHANGE): eth0: link becomes ready<br>Jan 01 00:00:24 test_obmc systemd-netw=
orkd[148]: eth0: Gained carrier<br>Jan 01 00:00:25 test_obmc rngd[163]: Ini=
tializing available sources<br>Jan 01 00:00:25 test_obmc rngd[163]: [hwrng =
]: Initialized<br>Jan 01 00:00:26 test_obmc systemd[1]: Started D-Bus Syste=
m Message Bus.<br>Jan 01 00:00:26 test_obmc systemd-networkd[148]: eth0: Ga=
ined IPv6LL<br>Jan 01 00:00:26 test_obmc systemd[1]: Reached target Basic S=
ystem.<br>Jan 01 00:00:26 test_obmc systemd[1]: System is tainted: cgroupsv=
1<br>Jan 01 00:00:26 test_obmc dbus-broker-lau[170]: Ready<br>Jan 01 00:00:=
26 test_obmc systemd[1]: Starting Clear one time boot overrides...<br>Jan 0=
1 00:00:26 test_obmc systemd[1]: Starting SSH Key Generation...<br>Jan 01 0=
0:00:26 test_obmc systemd[1]: Started LPC Snoop Daemon.<br>Jan 01 00:00:26 =
test_obmc systemd[1]: Starting Name Service Cache Daemon...<br>Jan 01 00:00=
:26 test_obmc systemd[1]: Started Phosphor Dump core monitor..<br>Jan 01 00=
:00:27 test_obmc systemd[1]: Started Phosphor certificate manager for autho=
rity.<br>Jan 01 00:00:27 test_obmc systemd[1]: Started Phosphor certificate=
 manager for bmcweb.<br>Jan 01 00:00:27 test_obmc systemd[1]: Started Phosp=
hor certificate manager for nslcd.<br>Jan 01 00:00:27 test_obmc systemd[1]:=
 Starting BMC health monitoring...<br>Jan 01 00:00:27 test_obmc systemd-net=
workd[148]: eth0: DHCPv4 address 192.168.200.5/20, gateway 192.168.192.1 ac=
quired from 192.168.192.1<br>Jan 01 00:00:27 test_obmc nscd[182]: 182 disab=
led inotify-based monitoring for file `/passwd': No such file or directory<=
br>Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file `/passwd';=
 will try again later: No such file or directory<br>Jan 01 00:00:27 test_ob=
mc nscd[182]: 182 disabled inotify-based monitoring for file `/group': No s=
uch file or directory<br>Jan 01 00:00:27 test_obmc nscd[182]: 182 stat fail=
ed for file `/group'; will try again later: No such file or directory<br>Ja=
n 01 00:00:27 test_obmc systemd[1]: Starting OpenBMC ipKVM daemon...<br>Jan=
 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based monitoring for=
 file `/hosts': No such file or directory<br>Jan 01 00:00:27 test_obmc nscd=
[182]: 182 stat failed for file `/hosts'; will try again later: No such fil=
e or directory<br>Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify=
-based monitoring for file `/resolv.conf': No such file or directory<br>Jan=
 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file `/resolv.conf'; =
will try again later: No such file or directory<br>Jan 01 00:00:27 test_obm=
c nscd[182]: 182 disabled inotify-based monitoring for file `/services': No=
 such file or directory<br>Jan 01 00:00:28 test_obmc systemd[1]: Starting E=
nable Linux trace events in the boot loader...<br>Jan 01 00:00:27 test_obmc=
 nscd[182]: 182 stat failed for file `/services'; will try again later: No =
such file or directory<br>Jan 01 00:00:28 test_obmc systemd[1]: Starting In=
tel Power Control for the Host 0...<br>Jan 01 00:00:28 test_obmc systemd-re=
solved[165]: Positive Trust Anchors:<br>Jan 01 00:00:28 test_obmc nscd[182]=
: 182 disabled inotify-based monitoring for file `/nsswitch.conf': No such =
file or directory<br>Jan 01 00:00:28 test_obmc systemd-resolved[165]: . IN =
DS 20326 8 2 e06d44b80b8f1d39a95c0b0d7c65d08458e880409bbc683457104237c7f8ec=
8d<br>Jan 01 00:00:28 test_obmc nscd[182]: 182 stat failed for file `/nsswi=
tch.conf'; will try again later: No such file or directory<br>Jan 01 00:00:=
28 test_obmc systemd-resolved[165]: Negative trust anchors: home.arpa 10.in=
-addr.arpa 16.172.in-addr.arpa 17.172.in-addr.arpa 18.172.in-addr.arpa 19.1=
72.in-addr.arpa 20.172.in-addr.arpa 21.172.in-addr.arpa 22.172.in-addr.arpa=
 23.172.in-addr.arpa 24.172.in-addr.arpa 25.172.in-addr.arpa 26.172.in-addr=
.arpa 27.172.in-addr.arpa 28.172.in-addr.arpa 29.172.in-addr.arpa 30.172.in=
-addr.arpa 31.172.in-addr.arpa 168.192.in-addr.arpa d.f.ip6.arpa corp home =
internal intranet lan local private test<br>Jan 01 00:00:28 test_obmc nscd[=
182]: 182 disabled inotify-based monitoring for file `/nsswitch.conf': No s=
uch file or directory<br>Jan 01 00:00:28 test_obmc systemd[1]: Starting Pho=
sphor Dump Manager...<br>Jan 01 00:00:28 test_obmc nscd[182]: 182 stat fail=
ed for file `/nsswitch.conf'; will try again later: No such file or directo=
ry<br>Jan 01 00:00:28 test_obmc nscd[182]: 182 disabled inotify-based monit=
oring for file `/nsswitch.conf': No such file or directory<br>Jan 01 00:00:=
28 test_obmc nscd[182]: 182 stat failed for file `/nsswitch.conf'; will try=
 again later: No such file or directory<br>Jan 01 00:00:28 test_obmc nscd[1=
82]: 182 disabled inotify-based monitoring for file `/nsswitch.conf': No su=
ch file or directory<br>Jan 01 00:00:28 test_obmc nscd[182]: 182 stat faile=
d for file `/nsswitch.conf'; will try again later: No such file or director=
y<br>Jan 01 00:00:28 test_obmc systemd[1]: Starting Entity Manager...<br>Ja=
n 01 00:00:28 test_obmc systemd[1]: Started Fru Device.<br>Jan 01 00:00:28 =
test_obmc systemd-resolved[165]: Using system hostname 'test_obmc'.<br>Jan =
01 00:00:28 test_obmc nscd[182]: 182 cannot write to database file /var/db/=
nscd/passwd: Invalid argument<br>Jan 01 00:00:29 test_obmc systemd[1]: Star=
ting Phosphor Log Manager...<br>Jan 01 00:00:29 test_obmc systemd[1]: Start=
ing Phosphor DBus Service Discovery Manager...<br>Jan 01 00:00:29 test_obmc=
 systemd[1]: Starting Phosphor Settings Daemon...<br>Jan 01 00:00:29 test_o=
bmc systemd[1]: Starting Phosphor Download Manager...<br>Jan 01 00:00:29 te=
st_obmc nscd[182]: 182 cannot write to database file /var/db/nscd/group: In=
valid argument<br>Jan 01 00:00:29 test_obmc systemd[1]: Starting Post code =
manager...<br>Jan 01 00:00:29 test_obmc systemd[1]: Starting Rsyslog config=
 updater...<br>Jan 01 00:00:30 test_obmc systemd[1]: Starting Telemetry...<=
br>Jan 01 00:00:30 test_obmc nscd[182]: 182 cannot write to database file /=
var/db/nscd/hosts: Invalid argument<br>Jan 01 00:00:30 test_obmc systemd[1]=
: Starting Phosphor User Manager...<br>Jan 01 00:00:30 test_obmc systemd[1]=
: Started Phosphor sysfs LED controller.<br>Jan 01 00:00:30 test_obmc syste=
md[1]: Started Phosphor sysfs LED controller.<br>Jan 01 00:00:31 test_obmc =
nscd[182]: 182 cannot write to database file /var/db/nscd/services: Invalid=
 argument<br>Jan 01 00:00:32 test_obmc systemd[1]: Started Network Name Res=
olution.<br>Jan 01 00:00:32 test_obmc systemd[1]: Finished Wait for Network=
 to be Configured.<br>Jan 01 00:00:33 test_obmc systemd[1]: Finished SSH Ke=
y Generation.<br>Jan 01 00:00:33 test_obmc systemd[1]: Started Name Service=
 Cache Daemon.<br>Jan 01 00:00:33 test_obmc systemd[1]: Started OpenBMC ipK=
VM daemon.<br>Jan 01 00:00:33 test_obmc systemd[1]: trace-enable.service: D=
eactivated successfully.<br>Jan 01 00:00:33 test_obmc systemd[1]: Finished =
Enable Linux trace events in the boot loader.<br>Jan 01 00:00:34 test_obmc =
systemd[1]: Reached target Network.<br>Jan 01 00:00:34 test_obmc systemd[1]=
: Reached target Network is Online.<br>Jan 01 00:00:34 test_obmc systemd[1]=
: Reached target Host and Network Name Lookups.<br>Jan 01 00:00:34 test_obm=
c post-code-manager[202]: Start post code manager service...<br>Jan 01 00:0=
0:34 test_obmc systemd[1]: Starting Avahi mDNS/DNS-SD Stack...<br>Jan 01 00=
:00:34 test_obmc health-monitor[181]: Path /xyz/openbmc_project/inventory d=
oes not exist in ObjectMapper, cannot create association<br>Jan 01 00:00:35=
 test_obmc systemd[1]: Started Start bmcweb server.<br>Jan 01 00:00:35 test=
_obmc telemetry[204]: Telemetry starting<br>Jan 01 00:00:35 test_obmc syste=
md[1]: Starting LDAP daemon...<br>Jan 01 00:00:35 test_obmc systemd[1]: Sta=
rting System Logging Service...<br>Jan 01 00:00:35 test_obmc systemd[1]: St=
arted Lightweight SLP Server.<br>Jan 01 00:00:36 test_obmc systemd[1]: Star=
ting Permit User Sessions...<br>Jan 01 00:00:36 test_obmc phosphor-certific=
ate-manager[179]: Certificate install<br>Jan 01 00:00:36 test_obmc health-m=
onitor[181]: CPU Health Sensor initialized<br>Jan 01 00:00:36 test_obmc hea=
lth-monitor[181]: CPU Health Sensor created<br>Jan 01 00:00:36 test_obmc he=
alth-monitor[181]: Memory Health Sensor initialized<br>Jan 01 00:00:36 test=
_obmc health-monitor[181]: Memory Health Sensor created<br>Jan 01 00:00:36 =
test_obmc health-monitor[181]: Storage_RW Health Sensor initialized<br>Jan =
01 00:00:36 test_obmc power-control[185]: Start Chassis power control servi=
ce for host : 0<br>Jan 01 00:00:36 test_obmc health-monitor[181]: Storage_R=
W Health Sensor created<br>Jan 01 00:00:36 test_obmc post-code-manager[202]=
: PostCode is created<br>Jan 01 00:00:37 test_obmc systemd[1]: Finished Cle=
ar one time boot overrides.<br>Jan 01 00:00:37 test_obmc power-control[185]=
: SIO control GPIOs not defined, disable SIO support.<br>Jan 01 00:00:37 te=
st_obmc systemd[1]: Started Post code manager.<br>Jan 01 00:00:37 test_obmc=
 power-control[185]: BMC_NMI set to 0<br>Jan 01 00:00:37 test_obmc health-m=
onitor[181]: ASSERT: sensor CPU is above the upper threshold critical high<=
br>Jan 01 00:00:37 test_obmc power-control[185]: FM_BMC_PWRBTN_OUT_N set to=
 1<br>Jan 01 00:00:37 test_obmc power-control[185]: RST_BMC_RSTBTN_OUT_N se=
t to 1<br>Jan 01 00:00:37 test_obmc power-control[185]: PowerControl: power=
 restore policy applied<br>Jan 01 00:00:37 test_obmc systemd[1]: Finished P=
ermit User Sessions.<br>Jan 01 00:00:37 test_obmc power-control[185]: NMI S=
ource Property Monitor<br>Jan 01 00:00:37 test_obmc power-control[185]: Ini=
tializing power state.<br>Jan 01 00:00:37 test_obmc power-control[185]: Hos=
t0: Moving to "Off" state<br>Jan 01 00:00:37 test_obmc post-code-manager[20=
2]: HostState changed to OFF. Empty postcode log, keep boot cycle at 0<br>J=
an 01 00:00:37 test_obmc systemd[1]: Started BMC health monitoring.<br>Jan =
01 00:00:37 test_obmc power-control[185]: RestartCause set to xyz.openbmc_p=
roject.State.Host.RestartCause.Unknown<br>Jan 01 00:00:38 test_obmc systemd=
[1]: Started Rsyslog config updater.<br>Jan 01 00:00:38 test_obmc systemd[1=
]: Started Telemetry.<br>Jan 01 00:00:38 test_obmc phosphor-user-manager[20=
7]: Group not found<br>Jan 01 00:00:38 test_obmc systemd[1]: Started Phosph=
or Download Manager.<br>Jan 01 00:00:38 test_obmc systemd[1]: Started Phosp=
hor DBus Service Discovery Manager.<br>Jan 01 00:00:38 test_obmc systemd[1]=
: Started Phosphor Log Manager.<br>Jan 01 00:00:38 test_obmc power-control[=
185]: Invoking Power Restore Policy xyz.openbmc_project.Control.Power.Resto=
rePolicy.Policy.Restore<br>Jan 01 00:00:38 test_obmc power-control[185]: Po=
wer was dropped, restoring Host On state<br>Jan 01 00:00:38 test_obmc power=
-control[185]: powerStateOff: power-on request event received<br>Jan 01 00:=
00:38 test_obmc power-control[185]: power supply power OK watchdog timer st=
arted<br>Jan 01 00:00:38 test_obmc power-control[185]: Host0: Moving to "Wa=
it for Power Supply Power OK" state<br>Jan 01 00:00:38 test_obmc power-cont=
rol[185]: FM_BMC_PWRBTN_OUT_N set to 0<br>Jan 01 00:00:38 test_obmc power-c=
ontrol[185]: RestartCause set to xyz.openbmc_project.State.Host.RestartCaus=
e.PowerPolicyPreviousState<br>Jan 01 00:00:39 test_obmc systemd[1]: Started=
 Intel Power Control for the Host 0.<br>Jan 01 00:00:39 test_obmc power-con=
trol[185]: FM_BMC_PWRBTN_OUT_N released<br>Jan 01 00:00:39 test_obmc system=
d[1]: Started Phosphor Dump Manager.<br>Jan 01 00:00:39 test_obmc systemd[1=
]: Started Phosphor Settings Daemon.<br>Jan 01 00:00:39 test_obmc systemd[1=
]: Started Entity Manager.<br>Jan 01 00:00:39 test_obmc fru-device[189]: de=
vice at bus 1 address 76 busy<br>Jan 01 00:00:39 test_obmc systemd[1]: Star=
ted Phosphor User Manager.<br>Jan 01 00:00:39 test_obmc systemd[1]: Reached=
 target Phosphor Object Mapper.<br>Jan 01 00:00:39 test_obmc systemd[1]: Ge=
tty on tty1 was skipped because of a failed condition check (ConditionPathE=
xists=3D/dev/tty0).<br>Jan 01 00:00:40 test_obmc systemd[1]: Starting Wait =
for /xyz/openbmc_project/control/host0/boot/one_time...<br>Jan 01 00:00:40 =
test_obmc power-control[185]: powerStateWaitForPSPowerOK: power supply powe=
r OK assert event received<br>Jan 01 00:00:40 test_obmc power-control[185]:=
 Host0: Moving to "On" state<br>Jan 01 00:00:40 test_obmc power-control[185=
]: power supply power OK watchdog timer canceled<br>Jan 01 00:00:40 test_ob=
mc power-control[185]: POH timer started<br>Jan 01 00:00:40 test_obmc power=
-control[185]: Host system DC power is on<br>Jan 01 00:00:40 test_obmc fru-=
device[189]: device at bus 2 address 76 busy<br>Jan 01 00:00:40 test_obmc s=
ystemd[1]: Starting Wait for /xyz/openbmc_project/control/host0/boot...<br>=
Jan 01 00:00:40 test_obmc obmc-ikvm[221]: 01/01/1970 00:00:40 Listening for=
 VNC connections on TCP port 5900<br>Jan 01 00:00:40 test_obmc systemd[1]: =
Starting Wait for /xyz/openbmc_project/control/host0/power_restore_policy..=
.<br>Jan 01 00:00:40 test_obmc systemd[1]: Starting Wait for /xyz/openbmc_p=
roject/control/host0/restriction_mode...<br>Jan 01 00:00:41 test_obmc syste=
md[1]: Starting Wait for /xyz/openbmc_project/led/groups/bmc_booted...<br>J=
an 01 00:00:41 test_obmc systemd[1]: Starting Wait for /xyz/openbmc_project=
/time/sync_method...<br>Jan 01 00:00:41 test_obmc avahi-daemon[240]: Found =
user 'avahi' (UID 996) and group 'avahi' (GID 995).<br>Jan 01 00:00:41 test=
_obmc rsyslogd[229]: imuxsock: Acquired UNIX socket '/run/systemd/journal/s=
yslog' (fd 3) from systemd.&nbsp; [v8.2202.0]<br>Jan 01 00:00:41 test_obmc =
rsyslogd[229]: [origin software=3D"rsyslogd" swVersion=3D"8.2202.0" x-pid=
=3D"229" x-info=3D"https://www.rsyslog.com"] start<br>Jan 01 00:00:41 test_=
obmc systemd[1]: Started Phosphor-Pid-Control Margin-based Fan Control Daem=
on.<br>Jan 01 00:00:42 test_obmc systemd[1]: Started phosphor systemd targe=
t monitor.<br>Jan 01 00:00:42 test_obmc systemd[1]: Starting Ramoops monito=
r....<br>Jan 01 00:00:42 test_obmc systemd[1]: Started Serial Getty on ttyS=
4.<br>Jan 01 00:00:42 test_obmc systemd[1]: Reached target Login Prompts.<b=
r>Jan 01 00:00:43 test_obmc systemd[1]: Starting Phosphor LED Group Managem=
ent Daemon...<br>Jan 01 00:00:43 test_obmc systemd[1]: Starting Phosphor Ne=
twork Manager...<br>Jan 01 00:00:43 test_obmc systemd[1]: Starting OpenBMC =
Software Update Manager...<br>Jan 01 00:00:44 test_obmc systemd[1]: Startin=
g Phosphor BMC State Manager...<br>Jan 01 00:00:44 test_obmc systemd[1]: St=
arted Adc Sensor.<br>Jan 01 00:00:44 test_obmc systemd[1]: Started CPU Sens=
or.<br>Jan 01 00:00:44 test_obmc systemd[1]: Started Exit Air Temp Sensor.<=
br>Jan 01 00:00:45 test_obmc systemd[1]: Started External Sensor.<br>Jan 01=
 00:00:45 test_obmc systemd[1]: Started Fan Sensor.<br>Jan 01 00:00:46 test=
_obmc nscd[182]: 182 checking for monitored file `/nsswitch.conf': No such =
file or directory<br>Jan 01 00:00:46 test_obmc nscd[182]: 182 checking for =
monitored file `/passwd': No such file or directory<br>Jan 01 00:00:46 test=
_obmc systemd[1]: Started Hwmon Temp Sensor.<br>Jan 01 00:00:46 test_obmc p=
hosphor-image-updater[262]: Error in mapper GetSubTreePath: sd_bus_call: xy=
z.openbmc_project.Common.Error.ResourceNotFound: The resource is not found.=
<br>Jan 01 00:00:46 test_obmc phosphor-certificate-manager[179]: Error occu=
rred during X509_verify_cert call, checking for known error<br>Jan 01 00:00=
:46 test_obmc swampd[253]: Tuning enabled<br>Jan 01 00:00:46 test_obmc syst=
emd[1]: Started Intrusion Sensor.<br>Jan 01 00:00:47 test_obmc swampd[253]:=
 No fan zones, application pausing until new configuration<br>Jan 01 00:00:=
47 test_obmc mapperx[199]: Introspect call failed with error: generic:53, I=
nvalid request descriptor on process: xyz.openbmc_project.Hwmon.external pa=
th: /<br>Jan 01 00:00:47 test_obmc nscd[182]: 182 checking for monitored fi=
le `/nsswitch.conf': No such file or directory<br>Jan 01 00:00:47 test_obmc=
 nscd[182]: 182 checking for monitored file `/group': No such file or direc=
tory<br>Jan 01 00:00:47 test_obmc systemd[1]: Started IPMB Sensor.<br>Jan 0=
1 00:00:47 test_obmc adcsensor[265]: error getting&nbsp; SpecialMode status=
 No route to host<br>Jan 01 00:00:47 test_obmc systemd[1]: Started MCU Temp=
 Sensor.<br>Jan 01 00:00:47 test_obmc cpusensor[266]: error getting&nbsp; S=
pecialMode status No route to host<br>Jan 01 00:00:48 test_obmc systemd[1]:=
 Started PSU Sensor.<br>Jan 01 00:00:48 test_obmc adcsensor[265]: failed to=
 find match for /sys/class/hwmon/hwmon3/in7_input<br>Jan 01 00:00:48 test_o=
bmc adcsensor[265]: failed to find match for /sys/class/hwmon/hwmon3/in12_i=
nput<br>Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for =
/sys/class/hwmon/hwmon3/in15_input<br>Jan 01 00:00:48 test_obmc adcsensor[2=
65]: failed to find match for /sys/class/hwmon/hwmon3/in2_input<br>Jan 01 0=
0:00:48 test_obmc adcsensor[265]: failed to find match for /sys/class/hwmon=
/hwmon3/in5_input<br>Jan 01 00:00:48 test_obmc adcsensor[265]: failed to fi=
nd match for /sys/class/hwmon/hwmon3/in8_input<br>Jan 01 00:00:48 test_obmc=
 adcsensor[265]: failed to find match for /sys/class/hwmon/hwmon3/in10_inpu=
t<br>Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sy=
s/class/hwmon/hwmon3/in13_input<br>Jan 01 00:00:48 test_obmc adcsensor[265]=
: failed to find match for /sys/class/hwmon/hwmon3/in3_input<br>Jan 01 00:0=
0:48 test_obmc adcsensor[265]: failed to find match for /sys/class/hwmon/hw=
mon3/in6_input<br>Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find =
match for /sys/class/hwmon/hwmon3/in9_input<br>Jan 01 00:00:48 test_obmc ad=
csensor[265]: failed to find match for /sys/class/hwmon/hwmon3/in11_input<b=
r>Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for /sys/c=
lass/hwmon/hwmon3/in14_input<br>Jan 01 00:00:48 test_obmc adcsensor[265]: f=
ailed to find match for /sys/class/hwmon/hwmon3/in1_input<br>Jan 01 00:00:4=
8 test_obmc adcsensor[265]: failed to find match for /sys/class/hwmon/hwmon=
3/in4_input<br>Jan 01 00:00:48 test_obmc nscd[182]: 182 checking for monito=
red file `/nsswitch.conf': No such file or directory<br>Jan 01 00:00:48 tes=
t_obmc fru-device[189]: failed to read bus 9 address 40<br>Jan 01 00:00:48 =
test_obmc fru-device[189]: failed to read bus 9 address 55<br>Jan 01 00:00:=
48 test_obmc nscd[182]: 182 checking for monitored file `/resolv.conf': No =
such file or directory<br>Jan 01 00:00:48 test_obmc nscd[182]: 182 checking=
 for monitored file `/hosts': No such file or directory<br>Jan 01 00:00:49 =
test_obmc nscd[182]: 182 checking for monitored file `/nsswitch.conf': No s=
uch file or directory<br>Jan 01 00:00:49 test_obmc nscd[182]: 182 checking =
for monitored file `/services': No such file or directory<br>Jan 01 00:00:4=
9 test_obmc exitairtempsensor[268]: error getting&nbsp; SpecialMode status =
No route to host<br>Jan 01 00:00:49 test_obmc mapperx[199]: Found invalid a=
ssociation on path /xyz/openbmc_project/software/0908ea58<br>Jan 01 00:00:4=
9 test_obmc phosphor-certificate-manager[179]: Certificate compareKeys<br>J=
an 01 00:00:49 test_obmc fansensor[270]: error getting&nbsp; SpecialMode st=
atus No route to host<br>Jan 01 00:00:50 test_obmc intrusion-sensor[273]: c=
an't find matched I2C or GPIO configuration for intrusion sensor.<br>Jan 01=
 00:00:50 test_obmc systemd[1]: Started System Logging Service.<br>Jan 01 0=
0:00:50 test_obmc hwmontempsensor[272]: error getting&nbsp; SpecialMode sta=
tus No route to host<br>Jan 01 00:00:50 test_obmc fansensor[270]: failed to=
 find match for /sys/class/hwmon/hwmon2/fan9_input<br>Jan 01 00:00:50 test_=
obmc fansensor[270]: failed to find match for /sys/class/hwmon/hwmon2/fan13=
_input<br>Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match fo=
r /sys/class/hwmon/hwmon2/fan16_input<br>Jan 01 00:00:50 test_obmc fansenso=
r[270]: failed to find match for /sys/class/hwmon/hwmon2/fan1_input<br>Jan =
01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/class/h=
wmon/hwmon2/fan4_input<br>Jan 01 00:00:50 test_obmc fansensor[270]: failed =
to find match for /sys/class/hwmon/hwmon2/fan7_input<br>Jan 01 00:00:50 tes=
t_obmc fansensor[270]: failed to find match for /sys/class/hwmon/hwmon2/fan=
11_input<br>Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match =
for /sys/class/hwmon/hwmon2/fan14_input<br>Jan 01 00:00:50 test_obmc fansen=
sor[270]: failed to find match for /sys/class/hwmon/hwmon2/fan2_input<br>Ja=
n 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/class=
/hwmon/hwmon2/fan5_input<br>Jan 01 00:00:50 test_obmc fansensor[270]: faile=
d to find match for /sys/class/hwmon/hwmon2/fan8_input<br>Jan 01 00:00:50 t=
est_obmc fansensor[270]: failed to find match for /sys/class/hwmon/hwmon2/f=
an12_input<br>Jan 01 00:00:50 test_obmc fansensor[270]: failed to find matc=
h for /sys/class/hwmon/hwmon2/fan15_input<br>Jan 01 00:00:50 test_obmc fans=
ensor[270]: failed to find match for /sys/class/hwmon/hwmon2/fan3_input<br>=
Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for /sys/cla=
ss/hwmon/hwmon2/fan6_input<br>Jan 01 00:00:50 test_obmc fansensor[270]: fai=
led to find match for /sys/class/hwmon/hwmon2/fan10_input<br>Jan 01 00:00:5=
0 test_obmc systemd[1]: Finished Wait for /xyz/openbmc_project/control/host=
0/boot/one_time.<br>Jan 01 00:00:50 test_obmc systemd[1]: Finished Wait for=
 /xyz/openbmc_project/control/host0/boot.<br>Jan 01 00:00:51 test_obmc syst=
emd[1]: Finished Wait for /xyz/openbmc_project/control/host0/power_restore_=
policy.<br>Jan 01 00:00:51 test_obmc ipmbsensor[274]: error getting&nbsp; S=
pecialMode status No route to host<br>Jan 01 00:00:51 test_obmc mcutempsens=
or[276]: error getting&nbsp; SpecialMode status No route to host<br>Jan 01 =
00:00:51 test_obmc systemd[1]: Finished Wait for /xyz/openbmc_project/contr=
ol/host0/restriction_mode.<br>Jan 01 00:00:51 test_obmc systemd[1]: Finishe=
d Wait for /xyz/openbmc_project/time/sync_method.<br>Jan 01 00:00:51 test_o=
bmc systemd[1]: ramoops-monitor.service: Deactivated successfully.<br>Jan 0=
1 00:00:51 test_obmc systemd[1]: Finished Ramoops monitor..<br>Jan 01 00:00=
:51 test_obmc avahi-daemon[240]: Successfully dropped root privileges.<br>J=
an 01 00:00:51 test_obmc avahi-daemon[240]: avahi-daemon 0.8 starting up.<b=
r>Jan 01 00:00:51 test_obmc nslcd[283]: version 0.9.8 starting<br>Jan 01 00=
:00:51 test_obmc nslcd[283]: accepting connections<br>Jan 01 00:00:51 test_=
obmc systemd[1]: Started LDAP daemon.<br>Jan 01 00:00:51 test_obmc systemd[=
1]: Started Phosphor Network Manager.<br>Jan 01 00:00:51 test_obmc systemd[=
1]: Started OpenBMC Software Update Manager.<br>Jan 01 00:00:52 test_obmc p=
hosphor-bmc-state-manager[264]: Unit obmc-bmc-service-quiesce@0.target not =
found: sd_bus_call: org.freedesktop.systemd1.NoSuchUnit: Unit obmc-bmc-serv=
ice-quiesce@0.target not loaded.<br>Jan 01 00:00:52 test_obmc systemd[1]: S=
tarting Phosphor Inband IPMI...<br>Jan 01 00:00:52 test_obmc psusensor[277]=
: error getting&nbsp; SpecialMode status No route to host<br>Jan 01 00:00:5=
2 test_obmc systemd[1]: Starting Phosphor Ldap config updater...<br>Jan 01 =
00:00:52 test_obmc psusensor[277]: Driver name aspeed_pwm_tacho not found i=
n sensor whitelist<br>Jan 01 00:00:52 test_obmc psusensor[277]: Driver name=
 w83773g not found in sensor whitelist<br>Jan 01 00:00:52 test_obmc psusens=
or[277]: Driver name iio_hwmon not found in sensor whitelist<br>Jan 01 00:0=
0:52 test_obmc psusensor[277]: Driver name w83773g not found in sensor whit=
elist<br>Jan 01 00:00:52 test_obmc avahi-daemon[240]: Successfully called c=
hroot().<br>Jan 01 00:00:52 test_obmc avahi-daemon[240]: Successfully dropp=
ed remaining capabilities.<br>Jan 01 00:00:52 test_obmc systemd[1]: Startin=
g Phosphor Version Software Manager...<br>Jan 01 00:00:52 test_obmc avahi-d=
aemon[240]: Loading service file /services/obmc_console.service.<br>Jan 01 =
00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast group on inter=
face eth0.IPv6 with address fe80::68e9:3dff:fe93:825c.<br>Jan 01 00:00:52 t=
est_obmc avahi-daemon[240]: New relevant interface eth0.IPv6 for mDNS.<br>J=
an 01 00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast group on=
 interface eth0.IPv4 with address 192.168.200.5.<br>Jan 01 00:00:52 test_ob=
mc avahi-daemon[240]: New relevant interface eth0.IPv4 for mDNS.<br>Jan 01 =
00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast group on inter=
face lo.IPv6 with address ::1.<br>Jan 01 00:00:52 test_obmc avahi-daemon[24=
0]: New relevant interface lo.IPv6 for mDNS.<br>Jan 01 00:00:52 test_obmc a=
vahi-daemon[240]: Joining mDNS multicast group on interface lo.IPv4 with ad=
dress 127.0.0.1.<br>Jan 01 00:00:52 test_obmc avahi-daemon[240]: New releva=
nt interface lo.IPv4 for mDNS.<br>Jan 01 00:00:52 test_obmc avahi-daemon[24=
0]: Network interface enumeration completed.<br>Jan 01 00:00:52 test_obmc s=
ystemd[1]: Starting Phosphor Time Manager daemon...<br>Jan 01 00:00:52 test=
_obmc avahi-daemon[240]: Registering new address record for fe80::68e9:3dff=
:fe93:825c on eth0.*.<br>Jan 01 00:00:52 test_obmc avahi-daemon[240]: Regis=
tering new address record for 192.168.200.5 on eth0.IPv4.<br>Jan 01 00:00:5=
2 test_obmc avahi-daemon[240]: Registering new address record for ::1 on lo=
.*.<br>Jan 01 00:00:52 test_obmc avahi-daemon[240]: Registering new address=
 record for 127.0.0.1 on lo.IPv4.<br>Jan 01 00:00:53 test_obmc systemd[1]: =
Started Avahi mDNS/DNS-SD Stack.<br>Jan 01 00:00:53 test_obmc phosphor-bmc-=
state-manager[264]: Setting the BMCState field to BMC_NOTREADY<br>Jan 01 00=
:00:53 test_obmc phosphor-bmc-state-manager[264]: Setting the BMCState fiel=
d to xyz.openbmc_project.State.BMC.BMCState.NotReady<br>Jan 01 00:00:53 tes=
t_obmc phosphor-bmc-state-manager[264]: Setting the RebootCause field to xy=
z.openbmc_project.State.BMC.RebootCause.Unknown<br>Jan 01 00:00:53 test_obm=
c systemd[1]: Started Phosphor BMC State Manager.<br>Jan 01 00:00:53 test_o=
bmc avahi-daemon[240]: Server startup complete. Host name is test_obmc.loca=
l. Local service cookie is 1954789941.<br>Jan 01 00:00:53 test_obmc nslcd[2=
83]: caught signal SIGTERM (15), shutting down<br>Jan 01 00:00:53 test_obmc=
 systemd[1]: Stopping LDAP daemon...<br>Jan 01 00:00:53 test_obmc nslcd[283=
]: thread 0 is still running, shutting down anyway<br>Jan 01 00:00:53 test_=
obmc nslcd[283]: thread 1 is still running, shutting down anyway<br>Jan 01 =
00:00:53 test_obmc nslcd[283]: thread 2 is still running, shutting down any=
way<br>Jan 01 00:00:53 test_obmc nslcd[283]: thread 3 is still running, shu=
tting down anyway<br>Jan 01 00:00:53 test_obmc nslcd[283]: thread 4 is stil=
l running, shutting down anyway<br>Jan 01 00:00:53 test_obmc nslcd[283]: ve=
rsion 0.9.8 bailing out<br>Jan 01 00:00:53 test_obmc systemd[1]: Started Ph=
osphor Ldap config updater.<br>Jan 01 00:00:54 test_obmc systemd[1]: nslcd.=
service: Deactivated successfully.<br>Jan 01 00:00:54 test_obmc systemd[1]:=
 Stopped LDAP daemon.<br>Jan 01 00:00:54 test_obmc systemd[1]: Started Phos=
phor Version Software Manager.<br>Jan 01 00:00:54 test_obmc avahi-daemon[24=
0]: Service "obmc_console on test_obmc" (/services/obmc_console.service) su=
ccessfully established.<br>Jan 01 00:00:54 test_obmc fru-device[189]: devic=
e at bus 1 address 76 busy<br>Jan 01 00:00:54 test_obmc systemd[1]: Startin=
g Time &amp; Date Service...<br>Jan 01 00:00:55 test_obmc fru-device[189]: =
device at bus 2 address 76 busy<br>Jan 01 00:00:56 test_obmc ipmid[290]: JS=
ON file not found<br>Jan 01 00:00:56 test_obmc phosphor-network-manager[261=
]: Refreshing the objects.<br>Jan 01 00:00:57 test_obmc systemd[1]: Startin=
g Hostname Service...<br>Jan 01 00:00:57 test_obmc fru-device[189]: failed =
to read bus 9 address 40<br>Jan 01 00:00:57 test_obmc fru-device[189]: fail=
ed to read bus 9 address 55<br>Jan 01 00:00:59 test_obmc systemd[1]: Starte=
d Time &amp; Date Service.<br>Jan 01 00:01:00 test_obmc systemd-timedated[2=
97]: Set NTP to disabled.<br>Jan 01 00:01:00 test_obmc phosphor-time-manage=
r[293]: Updated NTP setting<br>Jan 01 00:01:00 test_obmc systemd[1]: Starte=
d Phosphor Time Manager daemon.<br>Jan 01 00:01:00 test_obmc phosphor-netwo=
rk-manager[261]: Refreshing complete.<br>Jan 01 00:01:00 test_obmc bmcweb[2=
26]: Checking certs in file /etc/ssl/certs/https/server.pem<br>Jan 01 00:01=
:00 test_obmc bmcweb[226]: Generating new keys<br>Jan 01 00:01:00 test_obmc=
 bmcweb[226]: Generating EC key<br>Jan 01 00:01:01 test_obmc bmcweb[226]: G=
enerating x509 Certificate<br>Jan 01 00:01:01 test_obmc ipmid[290]: Registe=
ring OEM:[0X00C2CF], Cmd:[0X04] for Manual Zone Control<br>Jan 01 00:01:01 =
test_obmc systemd[1]: Started Hostname Service.<br>Jan 01 00:01:01 test_obm=
c systemd[1]: Started Phosphor Inband IPMI.<br>Jan 01 00:01:01 test_obmc sy=
stemd[1]: Starting Phosphor IPMI KCS DBus Bridge...<br>Jan 01 00:01:01 test=
_obmc phosphor-certificate-manager[179]: Certificate install<br>Jan 01 00:0=
1:01 test_obmc systemd[1]: Started Network IPMI daemon.<br>Jan 01 00:01:02 =
test_obmc systemd[1]: Started Phosphor IPMI KCS DBus Bridge.<br>Jan 01 00:0=
1:02 test_obmc kcsbridged-ipmi-kcs3[312]: IPMI response failure: ipmid resp=
onse: org.freedesktop.DBus.Error.ServiceUnknown: The name is not activatabl=
e<br>Jan 01 00:01:02 test_obmc kcsbridged-ipmi-kcs3[312]: IPMI response fai=
lure: ipmid response: org.freedesktop.DBus.Error.ServiceUnknown: The name i=
s not activatable<br>Jan 01 00:01:02 test_obmc kcsbridged-ipmi-kcs3[312]: I=
PMI response failure: ipmid response: org.freedesktop.DBus.Error.ServiceUnk=
nown: The name is not activatable<br>Jan 01 00:01:02 test_obmc ipmid[290]: =
Loading whitelist filter<br>Jan 01 00:01:03 test_obmc phosphor-certificate-=
manager[179]: Certificate compareKeys<br>Jan 01 00:01:03 test_obmc ipmid[29=
0]: New interface mapping<br>Jan 01 00:01:03 test_obmc ipmid[290]: Set rest=
rictedMode =3D false<br>Jan 01 00:01:03 test_obmc netipmid[313]: Failed to =
get bus name<br>Jan 01 00:01:03 test_obmc netipmid[313]: Bind to interfae<b=
r>Jan 01 00:01:03 test_obmc ipmid[290]: New interface mapping<br>Jan 01 00:=
01:03 test_obmc phosphor-certificate-manager[179]: Inotify callback to upda=
te certificate properties<br>Jan 01 00:01:03 test_obmc systemd[1]: Reloadin=
g Start bmcweb server...<br>Jan 01 00:01:03 test_obmc systemd[1]: Reloaded =
Start bmcweb server.<br>Jan 01 00:01:08 test_obmc entity-manager[224]: Inve=
ntory Added<br>Jan 01 00:01:12 test_obmc adcsensor[265]: Sensor VCCM_IJKL l=
ow threshold 1.135 assert: value 0.003 raw data 3<br>Jan 01 00:01:12 test_o=
bmc adcsensor[265]: Sensor VCCM_IJKL low threshold 1.08 assert: value 0.003=
 raw data 3<br>Jan 01 00:01:12 test_obmc adcsensor[265]: Sensor VCCM_MNOP l=
ow threshold 1.135 assert: value 0 raw data 0<br>Jan 01 00:01:12 test_obmc =
adcsensor[265]: Sensor VCCM_MNOP low threshold 1.08 assert: value 0 raw dat=
a 0<br>Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for /=
sys/class/hwmon/hwmon2/fan9_input<br>Jan 01 00:01:13 test_obmc fansensor[27=
0]: failed to find match for /sys/class/hwmon/hwmon2/fan13_input<br>Jan 01 =
00:01:13 test_obmc fansensor[270]: failed to find match for /sys/class/hwmo=
n/hwmon2/fan16_input<br>Jan 01 00:01:13 test_obmc fansensor[270]: Error rea=
d/write "/sys/class/hwmon/hwmon2/pwm3_enable"<br>Jan 01 00:01:13 test_obmc =
adcsensor[265]: Sensor PVCCIN_CPU2 low threshold 1.75 assert: value 0.029 r=
aw data 29<br>Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor PVCCIN_CPU2 =
low threshold 1.72 assert: value 0.029 raw data 29<br>Jan 01 00:01:13 test_=
obmc fansensor[270]: Error read/write "/sys/class/hwmon/hwmon2/pwm5_enable"=
<br>Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write "/sys/class/=
hwmon/hwmon2/pwm7_enable"<br>Jan 01 00:01:13 test_obmc adcsensor[265]: Sens=
or VCCM_IJKL low threshold 1.135 assert: value 0.001 raw data 1<br>Jan 01 0=
0:01:13 test_obmc adcsensor[265]: Sensor VCCM_IJKL low threshold 1.08 asser=
t: value 0.001 raw data 1<br>Jan 01 00:01:13 test_obmc adcsensor[265]: Sens=
or VCCM_MNOP low threshold 1.135 assert: value 0.003 raw data 3<br>Jan 01 0=
0:01:13 test_obmc cpusensor[266]: CPU configs are parsed<br>Jan 01 00:01:13=
 test_obmc cpusensor[266]: unable to open /dev/peci-1<br>Jan 01 00:01:13 te=
st_obmc fansensor[270]: failed to find match for /sys/class/hwmon/hwmon2/fa=
n11_input<br>Jan 01 00:01:13 test_obmc systemd[1]: xyz.openbmc_project.cpus=
ensor.service: Main process exited, code=3Dexited, status=3D1/FAILURE<br>Ja=
n 01 00:01:13 test_obmc fansensor[270]: failed to find match for /sys/class=
/hwmon/hwmon2/fan14_input<br>Jan 01 00:01:13 test_obmc fansensor[270]: Erro=
r read/write "/sys/class/hwmon/hwmon2/pwm1_enable"<br>Jan 01 00:01:13 test_=
obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Failed with result =
'exit-code'.<br>Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write =
"/sys/class/hwmon/hwmon2/pwm2_enable"<br>Jan 01 00:01:13 test_obmc fansenso=
r[270]: Error read/write "/sys/class/hwmon/hwmon2/pwm8_enable"<br>Jan 01 00=
:01:14 test_obmc fansensor[270]: failed to find match for /sys/class/hwmon/=
hwmon2/fan12_input<br>Jan 01 00:01:14 test_obmc fansensor[270]: failed to f=
ind match for /sys/class/hwmon/hwmon2/fan15_input<br>Jan 01 00:01:14 test_o=
bmc fansensor[270]: Error read/write "/sys/class/hwmon/hwmon2/pwm4_enable"<=
br>Jan 01 00:01:14 test_obmc fansensor[270]: Error read/write "/sys/class/h=
wmon/hwmon2/pwm6_enable"<br>Jan 01 00:01:14 test_obmc fansensor[270]: faile=
d to find match for /sys/class/hwmon/hwmon2/fan10_input<br>Jan 01 00:01:14 =
test_obmc intrusion-sensor[273]: can't find matched NIC name.<br>Jan 01 00:=
01:16 test_obmc ipmid[290]: wd_set: sd_bus_call: xyz.openbmc_project.Common=
.Error.ResourceNotFound: The resource is not found.<br>Jan 01 00:01:16 test=
_obmc ipmid[290]: Set Sol Config - Invalid solInterface<br>Jan 01 00:01:16 =
test_obmc ipmid[290]: Failed to check request for full unpack<br>Jan 01 00:=
01:16 test_obmc swampd[253]: New configuration detected, reloading<br>Jan 0=
1 00:01:16 test_obmc swampd[253]: .No fan zones, application pausing until =
new configuration<br>Jan 01 00:01:18 test_obmc systemd[1]: xyz.openbmc_proj=
ect.cpusensor.service: Scheduled restart job, restart counter is at 1.<br>J=
an 01 00:01:18 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:01:18=
 test_obmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:01:18 test_obmc cpu=
sensor[319]: error getting&nbsp; SpecialMode status No route to host<br>Jan=
 01 00:01:21 test_obmc cpusensor[319]: CPU configs are parsed<br>Jan 01 00:=
01:21 test_obmc cpusensor[319]: unable to open /dev/peci-1<br>Jan 01 00:01:=
21 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Main proces=
s exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:01:21 test_obmc sy=
stemd[1]: xyz.openbmc_project.cpusensor.service: Failed with result 'exit-c=
ode'.<br>Jan 01 00:01:26 test_obmc systemd[1]: xyz.openbmc_project.cpusenso=
r.service: Scheduled restart job, restart counter is at 2.<br>Jan 01 00:01:=
26 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:01:26 test_obmc s=
ystemd[1]: Started CPU Sensor.<br>Jan 01 00:01:26 test_obmc cpusensor[325]:=
 error getting&nbsp; SpecialMode status No route to host<br>Jan 01 00:01:26=
 test_obmc health-monitor[181]: DEASSERT: sensor CPU is under the upper thr=
eshold critical high<br>Jan 01 00:01:28 test_obmc cpusensor[325]: CPU confi=
gs are parsed<br>Jan 01 00:01:28 test_obmc cpusensor[325]: unable to open /=
dev/peci-1<br>Jan 01 00:01:28 test_obmc systemd[1]: xyz.openbmc_project.cpu=
sensor.service: Main process exited, code=3Dexited, status=3D1/FAILURE<br>J=
an 01 00:01:28 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service:=
 Failed with result 'exit-code'.<br>Jan 01 00:01:30 test_obmc systemd[1]: s=
ystemd-hostnamed.service: Deactivated successfully.<br>Jan 01 00:01:31 test=
_obmc systemd[1]: systemd-timedated.service: Deactivated successfully.<br>J=
an 01 00:01:33 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service:=
 Scheduled restart job, restart counter is at 3.<br>Jan 01 00:01:33 test_ob=
mc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:01:33 test_obmc systemd[1]:=
 Started CPU Sensor.<br>Jan 01 00:01:33 test_obmc cpusensor[333]: error get=
ting&nbsp; SpecialMode status No route to host<br>Jan 01 00:01:34 test_obmc=
 fansensor[270]: Sensor SP_FAN0_TACH reading error!<br>Jan 01 00:01:35 test=
_obmc fansensor[270]: Sensor SP_FAN3_TACH reading error!<br>Jan 01 00:01:36=
 test_obmc fansensor[270]: Sensor SP_FAN6_TACH reading error!<br>Jan 01 00:=
01:36 test_obmc cpusensor[333]: CPU configs are parsed<br>Jan 01 00:01:36 t=
est_obmc cpusensor[333]: unable to open /dev/peci-1<br>Jan 01 00:01:36 test=
_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Main process exite=
d, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:01:36 test_obmc systemd[1=
]: xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.<b=
r>Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN1_TACH reading err=
or!<br>Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN4_TACH readin=
g error!<br>Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN7_TACH r=
eading error!<br>Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN2_T=
ACH reading error!<br>Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_F=
AN5_TACH reading error!<br>Jan 01 00:01:38 test_obmc nscd[182]: 182 checkin=
g for monitored file `/nsswitch.conf': No such file or directory<br>Jan 01 =
00:01:38 test_obmc nscd[182]: 182 checking for monitored file `/group': No =
such file or directory<br>Jan 01 00:01:41 test_obmc systemd[1]: xyz.openbmc=
_project.cpusensor.service: Scheduled restart job, restart counter is at 4.=
<br>Jan 01 00:01:41 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:=
01:41 test_obmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:01:41 test_obm=
c cpusensor[334]: error getting&nbsp; SpecialMode status No route to host<b=
r>Jan 01 00:01:43 test_obmc cpusensor[334]: CPU configs are parsed<br>Jan 0=
1 00:01:43 test_obmc cpusensor[334]: unable to open /dev/peci-1<br>Jan 01 0=
0:01:43 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Main p=
rocess exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:01:43 test_ob=
mc systemd[1]: xyz.openbmc_project.cpusensor.service: Failed with result 'e=
xit-code'.<br>Jan 01 00:01:48 test_obmc systemd[1]: xyz.openbmc_project.cpu=
sensor.service: Scheduled restart job, restart counter is at 5.<br>Jan 01 0=
0:01:48 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:01:48 test_o=
bmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:01:48 test_obmc cpusensor[=
335]: error getting&nbsp; SpecialMode status No route to host<br>Jan 01 00:=
01:49 test_obmc ipmid[290]: Set Sol Config - Invalid solInterface<br>Jan 01=
 00:01:49 test_obmc ipmid[290]: Failed to check request for full unpack<br>=
Jan 01 00:01:51 test_obmc cpusensor[335]: CPU configs are parsed<br>Jan 01 =
00:01:51 test_obmc cpusensor[335]: unable to open /dev/peci-1<br>Jan 01 00:=
01:51 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Main pro=
cess exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:01:51 test_obmc=
 systemd[1]: xyz.openbmc_project.cpusensor.service: Failed with result 'exi=
t-code'.<br>Jan 01 00:01:53 test_obmc nscd[182]: 182 checking for monitored=
 file `/nsswitch.conf': No such file or directory<br>Jan 01 00:01:53 test_o=
bmc nscd[182]: 182 checking for monitored file `/group': No such file or di=
rectory<br>Jan 01 00:01:54 test_obmc ipmid[290]: wd_get: sd_bus_call: xyz.o=
penbmc_project.Common.Error.ResourceNotFound: The resource is not found.<br=
>Jan 01 00:01:56 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.servic=
e: Scheduled restart job, restart counter is at 6.<br>Jan 01 00:01:56 test_=
obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:01:56 test_obmc systemd[1=
]: Started CPU Sensor.<br>Jan 01 00:01:56 test_obmc cpusensor[338]: error g=
etting&nbsp; SpecialMode status No route to host<br>Jan 01 00:01:58 test_ob=
mc cpusensor[338]: CPU configs are parsed<br>Jan 01 00:01:58 test_obmc cpus=
ensor[338]: unable to open /dev/peci-1<br>Jan 01 00:01:58 test_obmc systemd=
[1]: xyz.openbmc_project.cpusensor.service: Main process exited, code=3Dexi=
ted, status=3D1/FAILURE<br>Jan 01 00:01:58 test_obmc systemd[1]: xyz.openbm=
c_project.cpusensor.service: Failed with result 'exit-code'.<br>Jan 01 00:0=
2:03 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Scheduled=
 restart job, restart counter is at 7.<br>Jan 01 00:02:03 test_obmc systemd=
[1]: Stopped CPU Sensor.<br>Jan 01 00:02:03 test_obmc systemd[1]: Started C=
PU Sensor.<br>Jan 01 00:02:03 test_obmc cpusensor[339]: error getting&nbsp;=
 SpecialMode status No route to host<br>Jan 01 00:02:06 test_obmc cpusensor=
[339]: CPU configs are parsed<br>Jan 01 00:02:06 test_obmc cpusensor[339]: =
unable to open /dev/peci-1<br>Jan 01 00:02:06 test_obmc systemd[1]: xyz.ope=
nbmc_project.cpusensor.service: Main process exited, code=3Dexited, status=
=3D1/FAILURE<br>Jan 01 00:02:06 test_obmc systemd[1]: xyz.openbmc_project.c=
pusensor.service: Failed with result 'exit-code'.<br>Jan 01 00:02:11 test_o=
bmc systemd[1]: xyz.openbmc_project.cpusensor.service: Scheduled restart jo=
b, restart counter is at 8.<br>Jan 01 00:02:11 test_obmc systemd[1]: Stoppe=
d CPU Sensor.<br>Jan 01 00:02:11 test_obmc systemd[1]: Started CPU Sensor.<=
br>Jan 01 00:02:11 test_obmc cpusensor[340]: error getting&nbsp; SpecialMod=
e status No route to host<br>Jan 01 00:02:13 test_obmc systemd[1]: xyz.open=
bmc_project.LED.GroupManager.service: start operation timed out. Terminatin=
g.<br>Jan 01 00:02:13 test_obmc systemd[1]: xyz.openbmc_project.LED.GroupMa=
nager.service: Failed with result 'timeout'.<br>Jan 01 00:02:13 test_obmc s=
ystemd[1]: Failed to start Phosphor LED Group Management Daemon.<br>Jan 01 =
00:02:13 test_obmc systemd[1]: Starting Wait for /xyz/openbmc_project/led/g=
roups...<br>Jan 01 00:02:13 test_obmc cpusensor[340]: CPU configs are parse=
d<br>Jan 01 00:02:13 test_obmc cpusensor[340]: unable to open /dev/peci-1<b=
r>Jan 01 00:02:13 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.servi=
ce: Main process exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:02:=
13 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Failed with=
 result 'exit-code'.<br>Jan 01 00:02:14 test_obmc systemd[1]: xyz.openbmc_p=
roject.LED.GroupManager.service: Scheduled restart job, restart counter is =
at 1.<br>Jan 01 00:02:14 test_obmc systemd[1]: Stopped Phosphor LED Group M=
anagement Daemon.<br>Jan 01 00:02:14 test_obmc systemd[1]: Starting Phospho=
r LED Group Management Daemon...<br>Jan 01 00:02:18 test_obmc systemd[1]: x=
yz.openbmc_project.cpusensor.service: Scheduled restart job, restart counte=
r is at 9.<br>Jan 01 00:02:18 test_obmc systemd[1]: Stopped CPU Sensor.<br>=
Jan 01 00:02:18 test_obmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:02:1=
8 test_obmc cpusensor[344]: error getting&nbsp; SpecialMode status No route=
 to host<br>Jan 01 00:02:21 test_obmc cpusensor[344]: CPU configs are parse=
d<br>Jan 01 00:02:21 test_obmc cpusensor[344]: unable to open /dev/peci-1<b=
r>Jan 01 00:02:21 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.servi=
ce: Main process exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:02:=
21 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Failed with=
 result 'exit-code'.<br>Jan 01 00:02:26 test_obmc systemd[1]: xyz.openbmc_p=
roject.cpusensor.service: Scheduled restart job, restart counter is at 10.<=
br>Jan 01 00:02:26 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:0=
2:26 test_obmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:02:26 test_obmc=
 cpusensor[347]: error getting&nbsp; SpecialMode status No route to host<br=
>Jan 01 00:02:28 test_obmc cpusensor[347]: CPU configs are parsed<br>Jan 01=
 00:02:28 test_obmc cpusensor[347]: unable to open /dev/peci-1<br>Jan 01 00=
:02:28 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Main pr=
ocess exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:02:28 test_obm=
c systemd[1]: xyz.openbmc_project.cpusensor.service: Failed with result 'ex=
it-code'.<br>Jan 01 00:02:31 test_obmc fansensor[270]: Sensor SP_FAN5_TACH =
reading error!<br>Jan 01 00:02:33 test_obmc systemd[1]: xyz.openbmc_project=
.cpusensor.service: Scheduled restart job, restart counter is at 11.<br>Jan=
 01 00:02:33 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:02:33 t=
est_obmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:02:33 test_obmc cpuse=
nsor[348]: error getting&nbsp; SpecialMode status No route to host<br>Jan 0=
1 00:02:34 test_obmc login[259]: pam_lastlog(login:session): file /var/log/=
lastlog created<br>Jan 01 00:02:34 test_obmc login[349]: ROOT LOGIN&nbsp; o=
n '/dev/ttyS4'<br>Jan 01 00:02:36 test_obmc cpusensor[348]: CPU configs are=
 parsed<br>Jan 01 00:02:36 test_obmc cpusensor[348]: unable to open /dev/pe=
ci-1<br>Jan 01 00:02:36 test_obmc systemd[1]: xyz.openbmc_project.cpusensor=
.service: Main process exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 =
00:02:36 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Faile=
d with result 'exit-code'.<br>Jan 01 00:02:41 test_obmc systemd[1]: xyz.ope=
nbmc_project.cpusensor.service: Scheduled restart job, restart counter is a=
t 12.<br>Jan 01 00:02:41 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 0=
1 00:02:41 test_obmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:02:41 tes=
t_obmc cpusensor[354]: error getting&nbsp; SpecialMode status No route to h=
ost<br>Jan 01 00:02:43 test_obmc cpusensor[354]: CPU configs are parsed<br>=
Jan 01 00:02:43 test_obmc cpusensor[354]: unable to open /dev/peci-1<br>Jan=
 01 00:02:43 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: M=
ain process exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:02:43 te=
st_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Failed with resu=
lt 'exit-code'.<br>Jan 01 00:02:48 test_obmc systemd[1]: xyz.openbmc_projec=
t.cpusensor.service: Scheduled restart job, restart counter is at 13.<br>Ja=
n 01 00:02:48 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:02:48 =
test_obmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:02:49 test_obmc cpus=
ensor[356]: error getting&nbsp; SpecialMode status No route to host<br>Jan =
01 00:02:51 test_obmc cpusensor[356]: CPU configs are parsed<br>Jan 01 00:0=
2:51 test_obmc cpusensor[356]: unable to open /dev/peci-1<br>Jan 01 00:02:5=
1 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Main process=
 exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:02:51 test_obmc sys=
temd[1]: xyz.openbmc_project.cpusensor.service: Failed with result 'exit-co=
de'.<br>Jan 01 00:02:56 test_obmc systemd[1]: xyz.openbmc_project.cpusensor=
.service: Scheduled restart job, restart counter is at 14.<br>Jan 01 00:02:=
56 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:02:56 test_obmc s=
ystemd[1]: Started CPU Sensor.<br>Jan 01 00:02:56 test_obmc cpusensor[359]:=
 error getting&nbsp; SpecialMode status No route to host<br>Jan 01 00:02:58=
 test_obmc cpusensor[359]: CPU configs are parsed<br>Jan 01 00:02:58 test_o=
bmc cpusensor[359]: unable to open /dev/peci-1<br>Jan 01 00:02:58 test_obmc=
 systemd[1]: xyz.openbmc_project.cpusensor.service: Main process exited, co=
de=3Dexited, status=3D1/FAILURE<br>Jan 01 00:02:58 test_obmc systemd[1]: xy=
z.openbmc_project.cpusensor.service: Failed with result 'exit-code'.<br>Jan=
 01 00:03:03 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: S=
cheduled restart job, restart counter is at 15.<br>Jan 01 00:03:04 test_obm=
c systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:03:04 test_obmc systemd[1]: =
Started CPU Sensor.<br>Jan 01 00:03:04 test_obmc cpusensor[363]: error gett=
ing&nbsp; SpecialMode status No route to host<br>Jan 01 00:03:06 test_obmc =
cpusensor[363]: CPU configs are parsed<br>Jan 01 00:03:06 test_obmc cpusens=
or[363]: unable to open /dev/peci-1<br>Jan 01 00:03:06 test_obmc systemd[1]=
: xyz.openbmc_project.cpusensor.service: Main process exited, code=3Dexited=
, status=3D1/FAILURE<br>Jan 01 00:03:06 test_obmc systemd[1]: xyz.openbmc_p=
roject.cpusensor.service: Failed with result 'exit-code'.<br>Jan 01 00:03:1=
1 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Scheduled re=
start job, restart counter is at 16.<br>Jan 01 00:03:11 test_obmc systemd[1=
]: Stopped CPU Sensor.<br>Jan 01 00:03:11 test_obmc systemd[1]: Started CPU=
 Sensor.<br>Jan 01 00:03:11 test_obmc cpusensor[364]: error getting&nbsp; S=
pecialMode status No route to host<br>Jan 01 00:03:13 test_obmc cpusensor[3=
64]: CPU configs are parsed<br>Jan 01 00:03:13 test_obmc cpusensor[364]: un=
able to open /dev/peci-1<br>Jan 01 00:03:13 test_obmc systemd[1]: xyz.openb=
mc_project.cpusensor.service: Main process exited, code=3Dexited, status=3D=
1/FAILURE<br>Jan 01 00:03:13 test_obmc systemd[1]: xyz.openbmc_project.cpus=
ensor.service: Failed with result 'exit-code'.<br>Jan 01 00:03:18 test_obmc=
 systemd[1]: xyz.openbmc_project.cpusensor.service: Scheduled restart job, =
restart counter is at 17.<br>Jan 01 00:03:19 test_obmc systemd[1]: Stopped =
CPU Sensor.<br>Jan 01 00:03:19 test_obmc systemd[1]: Started CPU Sensor.<br=
>Jan 01 00:03:19 test_obmc cpusensor[366]: error getting&nbsp; SpecialMode =
status No route to host<br>Jan 01 00:03:21 test_obmc cpusensor[366]: CPU co=
nfigs are parsed<br>Jan 01 00:03:21 test_obmc cpusensor[366]: unable to ope=
n /dev/peci-1<br>Jan 01 00:03:21 test_obmc systemd[1]: xyz.openbmc_project.=
cpusensor.service: Main process exited, code=3Dexited, status=3D1/FAILURE<b=
r>Jan 01 00:03:21 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.servi=
ce: Failed with result 'exit-code'.<br>Jan 01 00:03:26 test_obmc systemd[1]=
: xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart cou=
nter is at 18.<br>Jan 01 00:03:26 test_obmc systemd[1]: Stopped CPU Sensor.=
<br>Jan 01 00:03:26 test_obmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:=
03:26 test_obmc cpusensor[367]: error getting&nbsp; SpecialMode status No r=
oute to host<br>Jan 01 00:03:28 test_obmc cpusensor[367]: CPU configs are p=
arsed<br>Jan 01 00:03:28 test_obmc cpusensor[367]: unable to open /dev/peci=
-1<br>Jan 01 00:03:28 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.s=
ervice: Main process exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00=
:03:28 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Failed =
with result 'exit-code'.<br>Jan 01 00:03:34 test_obmc systemd[1]: xyz.openb=
mc_project.cpusensor.service: Scheduled restart job, restart counter is at =
19.<br>Jan 01 00:03:34 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 =
00:03:34 test_obmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:03:34 test_=
obmc cpusensor[368]: error getting&nbsp; SpecialMode status No route to hos=
t<br>Jan 01 00:03:36 test_obmc cpusensor[368]: CPU configs are parsed<br>Ja=
n 01 00:03:36 test_obmc cpusensor[368]: unable to open /dev/peci-1<br>Jan 0=
1 00:03:36 test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Mai=
n process exited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:03:36 test=
_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Failed with result=
 'exit-code'.<br>Jan 01 00:03:41 test_obmc systemd[1]: xyz.openbmc_project.=
cpusensor.service: Scheduled restart job, restart counter is at 20.<br>Jan =
01 00:03:41 test_obmc systemd[1]: Stopped CPU Sensor.<br>Jan 01 00:03:41 te=
st_obmc systemd[1]: Started CPU Sensor.<br>Jan 01 00:03:41 test_obmc cpusen=
sor[370]: error getting&nbsp; SpecialMode status No route to host<br>Jan 01=
 00:03:43 test_obmc cpusensor[370]: CPU configs are parsed<br>Jan 01 00:03:=
43 test_obmc cpusensor[370]: unable to open /dev/peci-1<br>Jan 01 00:03:43 =
test_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Main process e=
xited, code=3Dexited, status=3D1/FAILURE<br>Jan 01 00:03:43 test_obmc syste=
md[1]: xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code=
'.<br>Jan 01 00:03:44 test_obmc systemd[1]: xyz.openbmc_project.LED.GroupMa=
nager.service: start operation timed out. Terminating.<br>Jan 01 00:03:44 t=
est_obmc systemd[1]: xyz.openbmc_project.LED.GroupManager.service: Failed w=
ith result 'timeout'.<br>Jan 01 00:03:44 test_obmc systemd[1]: Failed to st=
art Phosphor LED Group Management Daemon.<br>Jan 01 00:03:45 test_obmc syst=
emd[1]: xyz.openbmc_project.LED.GroupManager.service: Scheduled restart job=
, restart counter is at 2.<br>Jan 01 00:03:46 test_obmc systemd[1]: Stopped=
 Phosphor LED Group Management Daemon.<br>Jan 01 00:03:46 test_obmc systemd=
[1]: Starting Phosphor LED Group Management Daemon...<br>Jan 01 00:03:48 te=
st_obmc systemd[1]: xyz.openbmc_project.cpusensor.service: Scheduled restar=
t job, restart counter is at 21.<br><div>....</div><div><br></div><div dir=
=3D"ltr" data-setdir=3D"false">Thanks in advance,</div><div dir=3D"ltr" dat=
a-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false"> <span>=
Sincerely </span>Yours,<span></span></div><div dir=3D"ltr" data-setdir=3D"f=
alse">Hamidreza<br></div></div></div></div></div></body></html>
------=_Part_3824164_481857794.1662204063457--
