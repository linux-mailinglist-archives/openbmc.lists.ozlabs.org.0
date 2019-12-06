Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30116114B06
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 03:44:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TcNn4K4DzDqXb
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 13:44:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.5.55;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="ZXgggV/8"; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092005055.outbound.protection.outlook.com [40.92.5.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TcMv3TynzDqGh
 for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2019 13:43:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7sGH5kLcDfkNnFQNCJeZ/vVGHvKalTdItYDIEfA4VL5vz5x+ZAQJkHpPL3jOZjQUPK5cgcg4FSSJ5fvJRKHX/KNPRYu0Z8J0cc5rvLxhGGXz8nRMcXEA8ZTsAVz59y/RZPvrhAwH8dCWqUEDIyqJxsteE7eHvj0wnurulT5xostUtbao40FFSSy7l8E3gpDGnZ1C+b8Bf33b+8P6xsgaxGTjOLdExRFzD3fPLptjyBOBq8jd96/6ljPZX4Q0YoGdv72ldCq0VBf5OmEUJhrwnvWU7Oqy2AfsNEHbxfiQEUW4dz7lqyhmP6pEnXzp/s1QQGCuPQdYiz3GbFCXIegNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OOlHUgxefnw3JFYA9LSLXlEgVPqfI9X/2xnzR5jrRw=;
 b=h4P5Z61iWRMGPUbJnE99wki9DHnujAFXCuLWJt8y3uVt0eg/uKaLS+9ahlYWGW8lwEjaWPGJSQ4jkVegBxmp/uf0l6B+nTy7HgnZar+kf2Q5J71vEGnZ0WkkbCKbhZR2W9lgC7RrBoakxCB7pBokvpa1W3F4AdVDeTtrYiKK5LWWhUCRZtM/cFkbLtOgOcCeVLCpN+EJr0ifuWX4M7taMVwKmY8kwpZ2OcthjI1jmrQwr1HXqcY0q0Hfkf/uLH6E3/cjmaoy1aMlom9eq3xi1nyBjnHCwgEl0SexAVCYDJuXeDFugJAJoGOwqLXjQ2v0j1d2GQcV3IIF7zVXNINZgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OOlHUgxefnw3JFYA9LSLXlEgVPqfI9X/2xnzR5jrRw=;
 b=ZXgggV/80fXHI6uOLCONTKJiA5nOs7QRxbvZ1viujfJjIJZiomJMYGujBzynSTjUSqnuPWrFva3/v2ueeE+zE3XDNFZjaXfZWRn9CCnIdchRNjPNgMWRq1gQoqzdtr4TjibL0v3g2o7VFqRCW1tkzcuBuQNIdJVk/XGFYVoQcGLbzKz+p0Bhdd+91NxuJktQboK/626t//FVgVNury8X+iC00JnawfOO4iXByfyYYc157i8zp+PnsdSgQVAwOhSTE3X0w4TKC8JqwfN64zw/UXQmQdH8JxzBqa/RLS2VHtVb5Od4rf8qokcS8aLsEXRyzD3c49jdviRLE6JcaoIcuw==
Received: from SN1NAM02FT030.eop-nam02.prod.protection.outlook.com
 (10.152.72.57) by SN1NAM02HT008.eop-nam02.prod.protection.outlook.com
 (10.152.72.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Fri, 6 Dec
 2019 02:43:15 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.72.51) by
 SN1NAM02FT030.mail.protection.outlook.com (10.152.72.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Fri, 6 Dec 2019 02:43:15 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::64f4:9bd0:ebf9:844e]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::64f4:9bd0:ebf9:844e%2]) with mapi id 15.20.2516.014; Fri, 6 Dec 2019
 02:43:15 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: Alexander Amelkin <a.amelkin@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
Subject: Re: s2600wf problems (was: openbmc power-control can't work OK)
Thread-Topic: s2600wf problems (was: openbmc power-control can't work OK)
Thread-Index: AQHVq97lo3I6MVTV2UOD8zJ9XLWP0w==
Date: Fri, 6 Dec 2019 02:43:15 +0000
Message-ID: <MN2PR04MB6669193B89BEFFF3252A1216CD5F0@MN2PR04MB6669.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:49F44A57FCD47E24463E185724D457160852710BB9D7FE2E2A63BE866D881416;
 UpperCasedChecksum:646B7F6E7D8F2D1B8BAA9B2E11427A3CAA68E2457554D3E0963882525F32659D;
 SizeAsReceived:6819; Count:42
x-tmn: [3bS/o4cxe2lPzGH24zr/xdWqwHpl5hLY]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: f105fa5e-944b-443d-82b3-08d779f60b84
x-ms-traffictypediagnostic: SN1NAM02HT008:
x-ms-exchange-purlcount: 4
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zJhC2411qVInwMd/faQ8vPfmsAZxYfhKcC1djjIv2bVZ9dSBfzZonzAqnki5yxUkGEA5WFkvgWITaK2rGmZWxuD9BABlFrcR+RdGQXwRcEtHQT4oqcM+YExl4CQQUMAiHAVQ7Kc28yMm1HQNGBeB6QE1WCm7ui+5mzPiqygjLTObaalvKZbnxTNL5OF5EKF3RVYCTRpv193x3iTOLEiKq+35SBsUYkVKDzS1ov6zU1c=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB6669193B89BEFFF3252A1216CD5F0MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f105fa5e-944b-443d-82b3-08d779f60b84
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 02:43:15.8005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT008
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

--_000_MN2PR04MB6669193B89BEFFF3252A1216CD5F0MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Is this problem solved?
I met the same problem.

Zheng

________________________________
From: openbmc on behalf of Alexander Amelkin
Sent: Friday, November 15, 2019 10:53 AM
To: openbmc@lists.ozlabs.org; jason.m.bills@linux.intel.com
Subject: s2600wf problems (was: openbmc power-control can't work OK)

Hi Bill!

We're also having difficulties running a generic meta-s2600wf on Intel refe=
rence
s2600wf "Woflpass" board.

We're using a newer openbmc commit (985dee9cb6bb29800a933e882913a44e6b9d4f4=
20)
with a patch to phosphor-dbus-interfaces taken from commit
0bbcc8f0cc34236d6f8549c5f51410420dbc8f08 of that project.
The patch is applied in order to make openbmc build for s2600wf, without th=
e
patch the build fails complaining about the missing NMISource interface.

When we boot the image on s2600wf, we get a LOT of errors. The main problem=
s we
have are:

1. Host power can't be controlled

2. Ethernet driver crashes

Below are the logs. I've cut out all the non-error output here, except for =
the
log header.

-- Logs begin at Thu 1970-01-01 00:00:10 UTC, end at Thu 1970-01-01 01:02:0=
6 UTC. --
Jan 01 00:00:10 vegman-s2600wf kernel: Booting Linux on physical CPU 0x0
Jan 01 00:00:10 vegman-s2600wf kernel: Linux version 5.3.10-7b61b9e
(oe-user@oe-host) (gcc version 9.2.0 (GCC)) #1 Thu Nov 14 14:13:03 UTC 2019
Jan 01 00:00:10 vegman-s2600wf kernel: CPU: ARMv6-compatible processor
[410fb767] revision 7 (ARMv7), cr=3D00c5387d
Jan 01 00:00:10 vegman-s2600wf kernel: CPU: PIPT / VIPT nonaliasing data ca=
che,
VIPT nonaliasing instruction cache
Jan 01 00:00:10 vegman-s2600wf kernel: OF: fdt: Machine model: S2600WF BMC
Jan 01 00:00:10 vegman-s2600wf kernel: Memory policy: Data cache writeback
Jan 01 00:00:10 vegman-s2600wf kernel: cma: Reserved 16 MiB at 0x9d800000
Jan 01 00:00:10 vegman-s2600wf kernel: Built 1 zonelists, mobility grouping=
 on.
Total pages: 125984
Jan 01 00:00:10 vegman-s2600wf kernel: Kernel command line:
console=3DttyS4,115200n8 root=3D/dev/ram rw
----- 8< ------
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed_gfx 1e6e6000.display: failed =
to
initialize reserved mem: -19
----- 8< ------
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Error apply=
ing
setting, reverse things back
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Using 50 MH=
z SPI
frequency
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: unrecognize=
d
JEDEC id bytes: 0a 0a 0a 0a 0a 0a
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Aspeed SMC =
probe
failed -2
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc: probe of 1e630000.spi fa=
iled
with error -2
----- 8< ------
Jan 01 00:00:10 vegman-s2600wf kernel: overlayfs: upper fs does not support=
 tmpfile.
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to lookup module alias
'autofs4': Function not implemented
----- 8< ------
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to put bus name to hashma=
p:
File exists
Jan 01 00:00:10 vegman-s2600wf systemd[1]:
xyz.openbmc_project.State.Host.service: Two services allocated for the same=
 bus
name xyz.openbmc_project.State.Host, refusing operation.
Jan 01 00:00:10 vegman-s2600wf systemd[1]: unit_file_find_fragment:
obmc-host-reset-running@.target+0 =1B$B"*=1B(B obmc-host-reset-running@0.ta=
rget
Jan 01 00:00:10 vegman-s2600wf systemd[1]: unit_file_find_fragment:
obmc-host-reset@.target+0 =1B$B"*=1B(B obmc-host-reset@0.target
Jan 01 00:00:10 vegman-s2600wf systemd[1]:
/lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name,
ignoring: sys-subsystem-net-devices-%i.device
Jan 01 00:00:10 vegman-s2600wf systemd[1]:
xyz.openbmc_project.State.Host.service: Cannot add dependency job, ignoring=
:
Unit xyz.openbmc_project.State.Host.service failed to load properly: File e=
xists.
----- 8< ------
Jan 01 00:00:28 vegman-s2600wf power-control[172]: Failed to find the PS_PW=
ROK line
Jan 01 00:00:28 vegman-s2600wf systemd[1]:
xyz.openbmc_project.Chassis.Control.Power.service: Main process exited,
code=3Dexited, status=3D255/EXCEPTION
Jan 01 00:00:28 vegman-s2600wf systemd[1]:
xyz.openbmc_project.Chassis.Control.Power.service: Failed with result 'exit=
-code'.
Jan 01 00:00:29 vegman-s2600wf systemd[1]: Failed to start Intel Power Cont=
rol.
----- 8< ------
Jan 01 00:01:12 vegman-s2600wf kernel: ------------[ cut here ]------------
Jan 01 00:01:12 vegman-s2600wf kernel: WARNING: CPU: 0 PID: 331 at
net/sched/sch_generic.c:447 dev_watchdog+0x268/0x288
Jan 01 00:01:12 vegman-s2600wf kernel: NETDEV WATCHDOG: eth0 (ftgmac100):
transmit queue 0 timed out
Jan 01 00:01:12 vegman-s2600wf kernel: CPU: 0 PID: 331 Comm: python Not tai=
nted
5.3.10-7b61b9e #1
Jan 01 00:01:12 vegman-s2600wf kernel: Hardware name: Generic DT based syst=
em
Jan 01 00:01:12 vegman-s2600wf kernel: Backtrace:
Jan 01 00:01:12 vegman-s2600wf kernel: [<80107c84>] (dump_backtrace) from
[<80107eb8>] (show_stack+0x20/0x24)
Jan 01 00:01:12 vegman-s2600wf kernel:  r7:80a12d20 r6:00000000 r5:9972378c
r4:00000009
Jan 01 00:01:12 vegman-s2600wf kernel: [<80107e98>] (show_stack) from
[<806a84b0>] (dump_stack+0x20/0x28)
Jan 01 00:01:12 vegman-s2600wf kernel: [<806a8490>] (dump_stack) from
[<80116900>] (__warn.part.0+0xb4/0xdc)
Jan 01 00:01:12 vegman-s2600wf kernel: [<8011684c>] (__warn.part.0) from
[<80116998>] (warn_slowpath_fmt+0x70/0x98)
Jan 01 00:01:12 vegman-s2600wf kernel:  r6:805ad4bc r5:000001bf r4:80840b28
Jan 01 00:01:12 vegman-s2600wf kernel: [<80116928>] (warn_slowpath_fmt) fro=
m
[<805ad4bc>] (dev_watchdog+0x268/0x288)
Jan 01 00:01:12 vegman-s2600wf kernel:  r3:99094000 r2:80840aec
Jan 01 00:01:12 vegman-s2600wf kernel:  r6:00000000 r5:99071900 r4:9909422c
Jan 01 00:01:12 vegman-s2600wf kernel: [<805ad254>] (dev_watchdog) from
[<8015ad94>] (call_timer_fn+0x40/0x124)
Jan 01 00:01:12 vegman-s2600wf kernel:  r9:00000122 r8:ffffa6f8 r7:00000100
r6:805ad254 r5:9909422c r4:9909422c
Jan 01 00:01:12 vegman-s2600wf kernel: [<8015ad54>] (call_timer_fn) from
[<8015af18>] (expire_timers+0xa0/0xdc)
Jan 01 00:01:12 vegman-s2600wf kernel:  r8:ffffa6f8 r7:80a13a40 r6:99723854
r5:99723854 r4:9909422c
Jan 01 00:01:12 vegman-s2600wf kernel: [<8015ae78>] (expire_timers) from
[<8015aff4>] (run_timer_softirq+0xa0/0x198)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000002 r9:00000100 r8:80a12d2=
0
r7:80a13a40 r6:80a13a40 r5:99723854
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:99723854 r3:ffffa6f9
Jan 01 00:01:12 vegman-s2600wf kernel: [<8015af54>] (run_timer_softirq) fro=
m
[<801022b4>] (__do_softirq+0xdc/0x314)
Jan 01 00:01:12 vegman-s2600wf kernel:  r8:00000000 r7:99722000 r6:80a62334
r5:00000002 r4:00000001
Jan 01 00:01:12 vegman-s2600wf kernel: [<801021d8>] (__do_softirq) from
[<8011a93c>] (irq_exit+0xac/0xe4)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:98e186dc r9:99722000 r8:0000000=
0
r7:9d413600 r6:00000001 r5:80a4a5d8
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:00000000
Jan 01 00:01:12 vegman-s2600wf kernel: [<8011a890>] (irq_exit) from [<8014d=
1f4>]
(__handle_domain_irq+0x60/0xb4)
Jan 01 00:01:12 vegman-s2600wf kernel: [<8014d194>] (__handle_domain_irq) f=
rom
[<801021cc>] (avic_handle_irq+0x68/0x70)
Jan 01 00:01:12 vegman-s2600wf kernel:  r9:99722000 r8:98e18206 r7:9972396c
r6:ffffffff r5:99723938 r4:9d402e40
Jan 01 00:01:12 vegman-s2600wf kernel: [<80102164>] (avic_handle_irq) from
[<80101a6c>] (__irq_svc+0x6c/0x90)
Jan 01 00:01:12 vegman-s2600wf kernel: Exception stack(0x99723938 to 0x9972=
3980)
Jan 01 00:01:12 vegman-s2600wf kernel:
3920:                                                       00000460 000005=
4b
Jan 01 00:01:12 vegman-s2600wf kernel: 3940: 00000008 000002df 98e18000 de7=
85a57
00000008 98e1800e 98e18206 000001cb
Jan 01 00:01:12 vegman-s2600wf kernel: 3960: 98e186dc 997239b4 0a4e3ec5 997=
23988
00000458 803b58e0 20000013 ffffffff
Jan 01 00:01:12 vegman-s2600wf kernel:  r5:20000013 r4:803b58e0
Jan 01 00:01:12 vegman-s2600wf kernel: [<803b559c>] (lzma_main) from
[<803b64ec>] (xz_dec_lzma2_run+0x678/0x824)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:00000000 r8:98e1e00=
0
r7:98e1eee8 r6:0000002a r5:98e09a84
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:98e18000 r3:000003fd
Jan 01 00:01:12 vegman-s2600wf kernel: [<803b5e74>] (xz_dec_lzma2_run) from
[<803b4ad4>] (xz_dec_run+0x2d8/0xa78)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:994b0c00 r9:00000000 r8:98e09a8=
4
r7:9d608800 r6:00000001 r5:00000001
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:98e09a80
Jan 01 00:01:12 vegman-s2600wf kernel: [<803b47fc>] (xz_dec_run) from
[<802c6618>] (squashfs_xz_uncompress+0x8c/0x234)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:994b0c00 r9:98e09a84 r8:98e0956=
0
r7:0000001b r6:0000000d r5:00000001
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:98e09a80
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c658c>] (squashfs_xz_uncompress=
)
from [<802c6538>] (squashfs_decompress+0x68/0xa0)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:98e09560 r9:98e09440 r8:98e0944=
4
r7:0000001b r6:994b0c00 r5:802c658c
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:990f4200
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c64d0>] (squashfs_decompress) f=
rom
[<802c20ac>] (squashfs_read_data+0x404/0x734)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:994b0c68 r8:98e0956=
0
r7:994b0bfc r6:0000001b r5:0000026c
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:0000001b
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c1ca8>] (squashfs_read_data) fr=
om
[<802c27b8>] (squashfs_cache_get+0x238/0x388)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000002 r9:9d602fc0 r8:990ba7b=
8
r7:00000000 r6:0131366c r5:990ba780
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:00000001
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c2580>] (squashfs_cache_get) fr=
om
[<802c2d88>] (squashfs_get_fragment+0x2c/0x34)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:9ee5c5e0 r9:00000004 r8:99723cd=
4
r7:ffffffff r6:9a05be18 r5:9a05be18
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:00000000
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c2d5c>] (squashfs_get_fragment)=
 from
[<802c3b2c>] (squashfs_readpage+0xf4/0x920)
Jan 01 00:01:12 vegman-s2600wf kernel: [<802c3a38>] (squashfs_readpage) fro=
m
[<802000b8>] (read_pages+0x10c/0x160)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00112cca r9:00000004 r8:99723cd=
4
r7:9a05bf00 r6:00000000 r5:9ee5c5e0
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:9ee5c5e4
Jan 01 00:01:12 vegman-s2600wf kernel: [<801fffac>] (read_pages) from
[<80200494>] (__do_page_cache_readahead+0x1b8/0x1d8)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:9a05bf04 r9:00112cca r8:99723cd=
4
r7:00000003 r6:00000004 r5:00000004
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:00000003
Jan 01 00:01:12 vegman-s2600wf kernel: [<802002dc>] (__do_page_cache_readah=
ead)
from [<802006cc>] (ondemand_readahead+0x218/0x288)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:99f785a0 r8:0000000=
0
r7:9a05bf00 r6:00000000 r5:00000003
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:99f785f8
Jan 01 00:01:12 vegman-s2600wf kernel: [<802004b4>] (ondemand_readahead) fr=
om
[<802008b0>] (page_cache_sync_readahead+0x5c/0x7c)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:99723ec0 r9:99723dd8 r8:0000000=
0
r7:00000000 r6:00000000 r5:99f785a0
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:9a05bf00
Jan 01 00:01:12 vegman-s2600wf kernel: [<80200854>] (page_cache_sync_readah=
ead)
from [<801f8138>] (generic_file_read_iter+0x680/0x970)
Jan 01 00:01:12 vegman-s2600wf kernel: [<801f7ab8>] (generic_file_read_iter=
)
from [<80242ef4>] (do_iter_readv_writev+0x150/0x1dc)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:99723ec0 r8:0000000=
0
r7:99723ee0 r6:00000000 r5:00000000
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:99f785a0
Jan 01 00:01:12 vegman-s2600wf kernel: [<80242da4>] (do_iter_readv_writev) =
from
[<80243940>] (do_iter_read+0xf4/0x1ac)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:00000000 r8:0000000=
1
r7:99723ee0 r6:99723ec0 r5:99f785a0
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:00000000
Jan 01 00:01:12 vegman-s2600wf kernel: [<8024384c>] (do_iter_read) from
[<80244d1c>] (vfs_iter_read+0x28/0x34)
Jan 01 00:01:12 vegman-s2600wf kernel:  r10:00000000 r9:00000000 r8:0000040=
0
r7:99495b40 r6:99723ec0 r5:99723ed8
Jan 01 00:01:12 vegman-s2600wf kernel:  r4:9974d700
Jan 01 00:01:12 vegman-s2600wf kernel: [<80244cf4>] (vfs_iter_read) from
[<8031e23c>] (ovl_read_iter+0xc0/0x114)
Jan 01 00:01:12 vegman-s2600wf kernel: [<8031e17c>] (ovl_read_iter) from
[<802442f4>] (__vfs_read+0x150/0x1d4)
Jan 01 00:01:12 vegman-s2600wf kernel:  r7:00000000 r6:00000000 r5:99723f60
r4:99495b40
Jan 01 00:01:12 vegman-s2600wf kernel: [<802441a4>] (__vfs_read) from
[<80244418>] (vfs_read+0xa0/0x120)
Jan 01 00:01:12 vegman-s2600wf kernel:  r9:00000000 r8:00000001 r7:99723f60
r6:0175bec0 r5:99495b40 r4:00000400
Jan 01 00:01:12 vegman-s2600wf kernel: [<80244378>] (vfs_read) from [<80244=
838>]
(ksys_read+0x70/0xf8)
Jan 01 00:01:12 vegman-s2600wf kernel:  r9:00000000 r8:00000000 r7:00000400
r6:0175bec0 r5:99495b40 r4:99495b40
Jan 01 00:01:12 vegman-s2600wf kernel: [<802447c8>] (ksys_read) from
[<802448d8>] (sys_read+0x18/0x1c)
Jan 01 00:01:12 vegman-s2600wf kernel:  r9:99722000 r8:801011e4 r7:00000003
r6:76fe64d0 r5:430015bc r4:01695198
Jan 01 00:01:12 vegman-s2600wf kernel: [<802448c0>] (sys_read) from [<80101=
000>]
(ret_fast_syscall+0x0/0x54)
Jan 01 00:01:12 vegman-s2600wf kernel: Exception stack(0x99723fa8 to 0x9972=
3ff0)
Jan 01 00:01:12 vegman-s2600wf kernel: 3fa0:                   01695198 430=
015bc
00000004 0175bec0 00000400 00000000
Jan 01 00:01:12 vegman-s2600wf kernel: 3fc0: 01695198 430015bc 76fe64d0 000=
00003
000005e8 432d4000 00001001 5dc2157e
Jan 01 00:01:12 vegman-s2600wf kernel: 3fe0: fbad2488 7ee24820 42f2d824 42f=
85f7c
Jan 01 00:01:12 vegman-s2600wf kernel: ---[ end trace 0910e44f554793b0 ]---
----- 8< ------

There are more errors as well. Please see the attached full log.

What do you suggest? How can we make it control the power of s2600wf host a=
nd
how do we make the network interface work?

Thank you.

With best regards,
Alexander Amelkin,
YADRO [https://yadro.com]

25.10.2019 18:59, Bills, Jason M wrote:
> I'm copying the mailing list in case there are others who have similar qu=
estions.
>
> On 10/25/2019 2:57 AM, =1B$B0$7K=1B(B wrote:
>>     Hi, jason
>>           Could you help me, please ? My board is not a evb board, but i=
t is
>> x86 platform. So i build openbmc *meta-s2600wf*(commit
>> ID c549f3a7f5496ec3b54ed65c8b4d8351db10995e) instead=1B$B!$=1B(Bwhich us=
e
>> x86-power-control version f61ca6fdcc52beba485e014b5fad38a9e9a555ad
>> <https://github.com/openbmc/x86-power-control/commit/f61ca6fdcc52beba485=
e014b5fad38a9e9a555ad>.
>> But when i use "ipmitools chassis power status" commond to get host stat=
us at
>> my board, it point out "Get Chassis Power Status failed: Unspecified err=
or",
>> journalctl -f command refer to "ipmid[279]: Failed to fetch ACBoot prope=
rty,
>> ipmid[279]: Failed to fetch RestartCause property". It seems there have =
no
>> property in dbus.  Where is the dbus property ACBoot and RestartCause
>> defined?I'm puzzled about this /situation. Could you///give me some sugg=
estions?
>
> This is because the IPMI chassis power status command gets the power stat=
us by
> calling the IPMI chassis status command which requires a lot of other
> information such as the restart cause and AC fail status to return succes=
sfully.
>
> The ACBoot property is provided by a small script that we run to get the =
reset
> reason from uboot.  You can find it here:
> https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-co=
mmon/recipes-core/ac-boot-check.
>
> The RestartCause property recently moved to x86-power-control and is bein=
g
> synced up in this review:
> https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-control/+/26491.
>
> Thanks,
> -Jason
>
>> /         Thanks a lot./
>>
>>

--_000_MN2PR04MB6669193B89BEFFF3252A1216CD5F0MN2PR04MB6669namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Is this problem solved?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I met the same problem.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Zheng<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> openbmc on behalf of Alexander Amelkin<br>
<b>Sent:</b> Friday, November 15, 2019 10:53 AM<br>
<b>To:</b> openbmc@lists.ozlabs.org; jason.m.bills@linux.intel.com<br>
<b>Subject:</b> s2600wf problems (was: openbmc power-control can't work OK)
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Bill!<br>
<br>
We're also having difficulties running a generic meta-s2600wf on Intel refe=
rence<br>
s2600wf &quot;Woflpass&quot; board.<br>
<br>
We're using a newer openbmc commit (985dee9cb6bb29800a933e882913a44e6b9d4f4=
20)<br>
with a patch to phosphor-dbus-interfaces taken from commit<br>
0bbcc8f0cc34236d6f8549c5f51410420dbc8f08 of that project.<br>
The patch is applied in order to make openbmc build for s2600wf, without th=
e<br>
patch the build fails complaining about the missing NMISource interface.<br=
>
<br>
When we boot the image on s2600wf, we get a LOT of errors. The main problem=
s we<br>
have are:<br>
<br>
1. Host power can't be controlled<br>
<br>
2. Ethernet driver crashes<br>
<br>
Below are the logs. I've cut out all the non-error output here, except for =
the<br>
log header.<br>
<br>
-- Logs begin at Thu 1970-01-01 00:00:10 UTC, end at Thu 1970-01-01 01:02:0=
6 UTC. --<br>
Jan 01 00:00:10 vegman-s2600wf kernel: Booting Linux on physical CPU 0x0<br=
>
Jan 01 00:00:10 vegman-s2600wf kernel: Linux version 5.3.10-7b61b9e<br>
(oe-user@oe-host) (gcc version 9.2.0 (GCC)) #1 Thu Nov 14 14:13:03 UTC 2019=
<br>
Jan 01 00:00:10 vegman-s2600wf kernel: CPU: ARMv6-compatible processor<br>
[410fb767] revision 7 (ARMv7), cr=3D00c5387d<br>
Jan 01 00:00:10 vegman-s2600wf kernel: CPU: PIPT / VIPT nonaliasing data ca=
che,<br>
VIPT nonaliasing instruction cache<br>
Jan 01 00:00:10 vegman-s2600wf kernel: OF: fdt: Machine model: S2600WF BMC<=
br>
Jan 01 00:00:10 vegman-s2600wf kernel: Memory policy: Data cache writeback<=
br>
Jan 01 00:00:10 vegman-s2600wf kernel: cma: Reserved 16 MiB at 0x9d800000<b=
r>
Jan 01 00:00:10 vegman-s2600wf kernel: Built 1 zonelists, mobility grouping=
 on.&nbsp;<br>
Total pages: 125984<br>
Jan 01 00:00:10 vegman-s2600wf kernel: Kernel command line:<br>
console=3DttyS4,115200n8 root=3D/dev/ram rw<br>
----- 8&lt; ------<br>
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed_gfx 1e6e6000.display: failed =
to<br>
initialize reserved mem: -19<br>
----- 8&lt; ------<br>
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Error apply=
ing<br>
setting, reverse things back<br>
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Using 50 MH=
z SPI<br>
frequency<br>
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: unrecognize=
d<br>
JEDEC id bytes: 0a 0a 0a 0a 0a 0a<br>
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Aspeed SMC =
probe<br>
failed -2<br>
Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc: probe of 1e630000.spi fa=
iled<br>
with error -2<br>
----- 8&lt; ------<br>
Jan 01 00:00:10 vegman-s2600wf kernel: overlayfs: upper fs does not support=
 tmpfile.<br>
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to lookup module alias<br=
>
'autofs4': Function not implemented<br>
----- 8&lt; ------<br>
Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to put bus name to hashma=
p:<br>
File exists<br>
Jan 01 00:00:10 vegman-s2600wf systemd[1]:<br>
xyz.openbmc_project.State.Host.service: Two services allocated for the same=
 bus<br>
name xyz.openbmc_project.State.Host, refusing operation.<br>
Jan 01 00:00:10 vegman-s2600wf systemd[1]: unit_file_find_fragment:<br>
obmc-host-reset-running@.target&#43;0 =1B$B"*=1B(B obmc-host-reset-running@=
0.target<br>
Jan 01 00:00:10 vegman-s2600wf systemd[1]: unit_file_find_fragment:<br>
obmc-host-reset@.target&#43;0 =1B$B"*=1B(B obmc-host-reset@0.target<br>
Jan 01 00:00:10 vegman-s2600wf systemd[1]:<br>
/lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name,<br=
>
ignoring: sys-subsystem-net-devices-%i.device<br>
Jan 01 00:00:10 vegman-s2600wf systemd[1]:<br>
xyz.openbmc_project.State.Host.service: Cannot add dependency job, ignoring=
:<br>
Unit xyz.openbmc_project.State.Host.service failed to load properly: File e=
xists.<br>
----- 8&lt; ------<br>
Jan 01 00:00:28 vegman-s2600wf power-control[172]: Failed to find the PS_PW=
ROK line<br>
Jan 01 00:00:28 vegman-s2600wf systemd[1]:<br>
xyz.openbmc_project.Chassis.Control.Power.service: Main process exited,<br>
code=3Dexited, status=3D255/EXCEPTION<br>
Jan 01 00:00:28 vegman-s2600wf systemd[1]:<br>
xyz.openbmc_project.Chassis.Control.Power.service: Failed with result 'exit=
-code'.<br>
Jan 01 00:00:29 vegman-s2600wf systemd[1]: Failed to start Intel Power Cont=
rol.<br>
----- 8&lt; ------<br>
Jan 01 00:01:12 vegman-s2600wf kernel: ------------[ cut here ]------------=
<br>
Jan 01 00:01:12 vegman-s2600wf kernel: WARNING: CPU: 0 PID: 331 at<br>
net/sched/sch_generic.c:447 dev_watchdog&#43;0x268/0x288<br>
Jan 01 00:01:12 vegman-s2600wf kernel: NETDEV WATCHDOG: eth0 (ftgmac100):<b=
r>
transmit queue 0 timed out<br>
Jan 01 00:01:12 vegman-s2600wf kernel: CPU: 0 PID: 331 Comm: python Not tai=
nted<br>
5.3.10-7b61b9e #1<br>
Jan 01 00:01:12 vegman-s2600wf kernel: Hardware name: Generic DT based syst=
em<br>
Jan 01 00:01:12 vegman-s2600wf kernel: Backtrace:<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80107c84&gt;] (dump_backtrace) =
from<br>
[&lt;80107eb8&gt;] (show_stack&#43;0x20/0x24)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r7:80a12d20 r6:00000000 r5:997=
2378c<br>
r4:00000009<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80107e98&gt;] (show_stack) from=
<br>
[&lt;806a84b0&gt;] (dump_stack&#43;0x20/0x28)<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;806a8490&gt;] (dump_stack) from=
<br>
[&lt;80116900&gt;] (__warn.part.0&#43;0xb4/0xdc)<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8011684c&gt;] (__warn.part.0) f=
rom<br>
[&lt;80116998&gt;] (warn_slowpath_fmt&#43;0x70/0x98)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r6:805ad4bc r5:000001bf r4:808=
40b28<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80116928&gt;] (warn_slowpath_fm=
t) from<br>
[&lt;805ad4bc&gt;] (dev_watchdog&#43;0x268/0x288)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r3:99094000 r2:80840aec<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r6:00000000 r5:99071900 r4:990=
9422c<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;805ad254&gt;] (dev_watchdog) fr=
om<br>
[&lt;8015ad94&gt;] (call_timer_fn&#43;0x40/0x124)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r9:00000122 r8:ffffa6f8 r7:000=
00100<br>
r6:805ad254 r5:9909422c r4:9909422c<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8015ad54&gt;] (call_timer_fn) f=
rom<br>
[&lt;8015af18&gt;] (expire_timers&#43;0xa0/0xdc)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r8:ffffa6f8 r7:80a13a40 r6:997=
23854<br>
r5:99723854 r4:9909422c<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8015ae78&gt;] (expire_timers) f=
rom<br>
[&lt;8015aff4&gt;] (run_timer_softirq&#43;0xa0/0x198)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:00000002 r9:00000100 r8:80=
a12d20<br>
r7:80a13a40 r6:80a13a40 r5:99723854<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:99723854 r3:ffffa6f9<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8015af54&gt;] (run_timer_softir=
q) from<br>
[&lt;801022b4&gt;] (__do_softirq&#43;0xdc/0x314)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r8:00000000 r7:99722000 r6:80a=
62334<br>
r5:00000002 r4:00000001<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;801021d8&gt;] (__do_softirq) fr=
om<br>
[&lt;8011a93c&gt;] (irq_exit&#43;0xac/0xe4)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:98e186dc r9:99722000 r8:00=
000000<br>
r7:9d413600 r6:00000001 r5:80a4a5d8<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:00000000<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8011a890&gt;] (irq_exit) from [=
&lt;8014d1f4&gt;]<br>
(__handle_domain_irq&#43;0x60/0xb4)<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8014d194&gt;] (__handle_domain_=
irq) from<br>
[&lt;801021cc&gt;] (avic_handle_irq&#43;0x68/0x70)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r9:99722000 r8:98e18206 r7:997=
2396c<br>
r6:ffffffff r5:99723938 r4:9d402e40<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80102164&gt;] (avic_handle_irq)=
 from<br>
[&lt;80101a6c&gt;] (__irq_svc&#43;0x6c/0x90)<br>
Jan 01 00:01:12 vegman-s2600wf kernel: Exception stack(0x99723938 to 0x9972=
3980)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:<br>
3920:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000460 0000054b<br>
Jan 01 00:01:12 vegman-s2600wf kernel: 3940: 00000008 000002df 98e18000 de7=
85a57<br>
00000008 98e1800e 98e18206 000001cb<br>
Jan 01 00:01:12 vegman-s2600wf kernel: 3960: 98e186dc 997239b4 0a4e3ec5 997=
23988<br>
00000458 803b58e0 20000013 ffffffff<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r5:20000013 r4:803b58e0<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;803b559c&gt;] (lzma_main) from<=
br>
[&lt;803b64ec&gt;] (xz_dec_lzma2_run&#43;0x678/0x824)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:00000000 r9:00000000 r8:98=
e1e000<br>
r7:98e1eee8 r6:0000002a r5:98e09a84<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:98e18000 r3:000003fd<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;803b5e74&gt;] (xz_dec_lzma2_run=
) from<br>
[&lt;803b4ad4&gt;] (xz_dec_run&#43;0x2d8/0xa78)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:994b0c00 r9:00000000 r8:98=
e09a84<br>
r7:9d608800 r6:00000001 r5:00000001<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:98e09a80<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;803b47fc&gt;] (xz_dec_run) from=
<br>
[&lt;802c6618&gt;] (squashfs_xz_uncompress&#43;0x8c/0x234)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:994b0c00 r9:98e09a84 r8:98=
e09560<br>
r7:0000001b r6:0000000d r5:00000001<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:98e09a80<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c658c&gt;] (squashfs_xz_unco=
mpress)<br>
from [&lt;802c6538&gt;] (squashfs_decompress&#43;0x68/0xa0)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:98e09560 r9:98e09440 r8:98=
e09444<br>
r7:0000001b r6:994b0c00 r5:802c658c<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:990f4200<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c64d0&gt;] (squashfs_decompr=
ess) from<br>
[&lt;802c20ac&gt;] (squashfs_read_data&#43;0x404/0x734)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:00000000 r9:994b0c68 r8:98=
e09560<br>
r7:994b0bfc r6:0000001b r5:0000026c<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:0000001b<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c1ca8&gt;] (squashfs_read_da=
ta) from<br>
[&lt;802c27b8&gt;] (squashfs_cache_get&#43;0x238/0x388)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:00000002 r9:9d602fc0 r8:99=
0ba7b8<br>
r7:00000000 r6:0131366c r5:990ba780<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:00000001<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c2580&gt;] (squashfs_cache_g=
et) from<br>
[&lt;802c2d88&gt;] (squashfs_get_fragment&#43;0x2c/0x34)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:9ee5c5e0 r9:00000004 r8:99=
723cd4<br>
r7:ffffffff r6:9a05be18 r5:9a05be18<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:00000000<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c2d5c&gt;] (squashfs_get_fra=
gment) from<br>
[&lt;802c3b2c&gt;] (squashfs_readpage&#43;0xf4/0x920)<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c3a38&gt;] (squashfs_readpag=
e) from<br>
[&lt;802000b8&gt;] (read_pages&#43;0x10c/0x160)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:00112cca r9:00000004 r8:99=
723cd4<br>
r7:9a05bf00 r6:00000000 r5:9ee5c5e0<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:9ee5c5e4<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;801fffac&gt;] (read_pages) from=
<br>
[&lt;80200494&gt;] (__do_page_cache_readahead&#43;0x1b8/0x1d8)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:9a05bf04 r9:00112cca r8:99=
723cd4<br>
r7:00000003 r6:00000004 r5:00000004<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:00000003<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802002dc&gt;] (__do_page_cache_=
readahead)<br>
from [&lt;802006cc&gt;] (ondemand_readahead&#43;0x218/0x288)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:00000000 r9:99f785a0 r8:00=
000000<br>
r7:9a05bf00 r6:00000000 r5:00000003<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:99f785f8<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802004b4&gt;] (ondemand_readahe=
ad) from<br>
[&lt;802008b0&gt;] (page_cache_sync_readahead&#43;0x5c/0x7c)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:99723ec0 r9:99723dd8 r8:00=
000000<br>
r7:00000000 r6:00000000 r5:99f785a0<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:9a05bf00<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80200854&gt;] (page_cache_sync_=
readahead)<br>
from [&lt;801f8138&gt;] (generic_file_read_iter&#43;0x680/0x970)<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;801f7ab8&gt;] (generic_file_rea=
d_iter)<br>
from [&lt;80242ef4&gt;] (do_iter_readv_writev&#43;0x150/0x1dc)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:00000000 r9:99723ec0 r8:00=
000000<br>
r7:99723ee0 r6:00000000 r5:00000000<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:99f785a0<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80242da4&gt;] (do_iter_readv_wr=
itev) from<br>
[&lt;80243940&gt;] (do_iter_read&#43;0xf4/0x1ac)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:00000000 r9:00000000 r8:00=
000001<br>
r7:99723ee0 r6:99723ec0 r5:99f785a0<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:00000000<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8024384c&gt;] (do_iter_read) fr=
om<br>
[&lt;80244d1c&gt;] (vfs_iter_read&#43;0x28/0x34)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r10:00000000 r9:00000000 r8:00=
000400<br>
r7:99495b40 r6:99723ec0 r5:99723ed8<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r4:9974d700<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80244cf4&gt;] (vfs_iter_read) f=
rom<br>
[&lt;8031e23c&gt;] (ovl_read_iter&#43;0xc0/0x114)<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8031e17c&gt;] (ovl_read_iter) f=
rom<br>
[&lt;802442f4&gt;] (__vfs_read&#43;0x150/0x1d4)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r7:00000000 r6:00000000 r5:997=
23f60<br>
r4:99495b40<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802441a4&gt;] (__vfs_read) from=
<br>
[&lt;80244418&gt;] (vfs_read&#43;0xa0/0x120)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r9:00000000 r8:00000001 r7:997=
23f60<br>
r6:0175bec0 r5:99495b40 r4:00000400<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80244378&gt;] (vfs_read) from [=
&lt;80244838&gt;]<br>
(ksys_read&#43;0x70/0xf8)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r9:00000000 r8:00000000 r7:000=
00400<br>
r6:0175bec0 r5:99495b40 r4:99495b40<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802447c8&gt;] (ksys_read) from<=
br>
[&lt;802448d8&gt;] (sys_read&#43;0x18/0x1c)<br>
Jan 01 00:01:12 vegman-s2600wf kernel:&nbsp; r9:99722000 r8:801011e4 r7:000=
00003<br>
r6:76fe64d0 r5:430015bc r4:01695198<br>
Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802448c0&gt;] (sys_read) from [=
&lt;80101000&gt;]<br>
(ret_fast_syscall&#43;0x0/0x54)<br>
Jan 01 00:01:12 vegman-s2600wf kernel: Exception stack(0x99723fa8 to 0x9972=
3ff0)<br>
Jan 01 00:01:12 vegman-s2600wf kernel: 3fa0:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 01695198 430015bc<br>
00000004 0175bec0 00000400 00000000<br>
Jan 01 00:01:12 vegman-s2600wf kernel: 3fc0: 01695198 430015bc 76fe64d0 000=
00003<br>
000005e8 432d4000 00001001 5dc2157e<br>
Jan 01 00:01:12 vegman-s2600wf kernel: 3fe0: fbad2488 7ee24820 42f2d824 42f=
85f7c<br>
Jan 01 00:01:12 vegman-s2600wf kernel: ---[ end trace 0910e44f554793b0 ]---=
<br>
----- 8&lt; ------<br>
<br>
There are more errors as well. Please see the attached full log.<br>
<br>
What do you suggest? How can we make it control the power of s2600wf host a=
nd<br>
how do we make the network interface work?<br>
<br>
Thank you.<br>
<br>
With best regards,<br>
Alexander Amelkin,<br>
YADRO [<a href=3D"https://yadro.com" target=3D"_blank" rel=3D"noopener nore=
ferrer" data-auth=3D"NotApplicable">https://yadro.com</a>]<br>
<br>
25.10.2019 18:59, Bills, Jason M wrote:<br>
&gt; I'm copying the mailing list in case there are others who have similar=
 questions.<br>
&gt;<br>
&gt; On 10/25/2019 2:57 AM, =1B$B0$7K=1B(B wrote:<br>
&gt;&gt; &nbsp;&nbsp; &nbsp;Hi, jason<br>
&gt;&gt; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Could you help me, please =
? My board is not a evb board, but it is<br>
&gt;&gt; x86 platform. So i&nbsp;build openbmc *meta-s2600wf*(commit<br>
&gt;&gt; ID&nbsp;c549f3a7f5496ec3b54ed65c8b4d8351db10995e) instead=1B$B!$=
=1B(Bwhich use<br>
&gt;&gt; x86-power-control version f61ca6fdcc52beba485e014b5fad38a9e9a555ad=
<br>
&gt;&gt; &lt;<a href=3D"https://github.com/openbmc/x86-power-control/commit=
/f61ca6fdcc52beba485e014b5fad38a9e9a555ad" target=3D"_blank" rel=3D"noopene=
r noreferrer" data-auth=3D"NotApplicable">https://github.com/openbmc/x86-po=
wer-control/commit/f61ca6fdcc52beba485e014b5fad38a9e9a555ad</a>&gt;.<br>
&gt;&gt; But when i use &quot;ipmitools chassis power status&quot; commond =
to get host status at<br>
&gt;&gt; my board, it point out &quot;Get Chassis Power Status failed: Unsp=
ecified error&quot;,<br>
&gt;&gt; journalctl -f command refer to &quot;ipmid[279]: Failed to fetch A=
CBoot property,<br>
&gt;&gt; ipmid[279]: Failed to fetch RestartCause property&quot;. It seems =
there have no<br>
&gt;&gt; property in dbus.&nbsp; Where is the dbus property&nbsp;ACBoot and=
&nbsp;RestartCause<br>
&gt;&gt; defined?I'm puzzled about this /situation. Could you///give me som=
e suggestions?<br>
&gt;<br>
&gt; This is because the IPMI chassis power status command gets the power s=
tatus by<br>
&gt; calling the IPMI chassis status command which requires a lot of other<=
br>
&gt; information such as the restart cause and AC fail status to return suc=
cessfully.<br>
&gt;<br>
&gt; The ACBoot property is provided by a small script that we run to get t=
he reset<br>
&gt; reason from uboot.&nbsp; You can find it here:<br>
&gt; <a href=3D"https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbm=
c-mods/meta-common/recipes-core/ac-boot-check" target=3D"_blank" rel=3D"noo=
pener noreferrer" data-auth=3D"NotApplicable">
https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-comm=
on/recipes-core/ac-boot-check</a>.<br>
&gt;<br>
&gt; The RestartCause property recently moved to x86-power-control and is b=
eing<br>
&gt; synced up in this review:<br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-cont=
rol/&#43;/26491" target=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D=
"NotApplicable">
https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-control/&#43;/26491<=
/a>.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; -Jason<br>
&gt;<br>
&gt;&gt; /&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Thanks a lot./<br>
&gt;&gt;<br>
&gt;&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR04MB6669193B89BEFFF3252A1216CD5F0MN2PR04MB6669namp_--
