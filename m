Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEFA11AABF
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 13:27:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xx5P4GyPzDqnc
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 23:27:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="k3Tr8Y2/"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xx4260nNzDqmJ
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 23:26:09 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 50F0D43E4A;
 Wed, 11 Dec 2019 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1576067160; x=
 1577881561; bh=S2JRVmPeg9wYVg7YYw4HqCmt0rOjo1mu1RYttGN0IJg=; b=k
 3Tr8Y2/egHNQOSC7E7MjJcKnySJ6q9KShK2JmHnBJX78fG6YPHj045hlYIc9xid6
 hCQQDvEN3ahQfc9mztz73vHz95tFRVqlOM185c0zyih+1/Erlbz1w3Wa6PSbWhvE
 j3EBrXNUF8qh7kuYpuTJLjZKfb00jzYzeA78YzVloI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpR09CIh0qie; Wed, 11 Dec 2019 15:26:00 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 943D442492;
 Wed, 11 Dec 2019 15:26:00 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 11
 Dec 2019 15:26:00 +0300
Subject: Re: s2600wf problems (was: openbmc power-control can't work OK)
To: Zheng Bao <fishbaoz@hotmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
References: <MN2PR04MB6669193B89BEFFF3252A1216CD5F0@MN2PR04MB6669.namprd04.prod.outlook.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <602d4661-5fbc-9476-3cc1-d4baa41cd44a@yadro.com>
Date: Wed, 11 Dec 2019 15:25:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <MN2PR04MB6669193B89BEFFF3252A1216CD5F0@MN2PR04MB6669.namprd04.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XEJTss4roU6Y3QL2axdvtDTmkNagag4E5"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

--XEJTss4roU6Y3QL2axdvtDTmkNagag4E5
Content-Type: multipart/mixed; boundary="MCBO8PbaSmA8e5y8Of8RVs5cZAN0XX5Pd";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Zheng Bao <fishbaoz@hotmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Message-ID: <602d4661-5fbc-9476-3cc1-d4baa41cd44a@yadro.com>
Subject: Re: s2600wf problems (was: openbmc power-control can't work OK)
References: <MN2PR04MB6669193B89BEFFF3252A1216CD5F0@MN2PR04MB6669.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB6669193B89BEFFF3252A1216CD5F0@MN2PR04MB6669.namprd04.prod.outlook.com>

--MCBO8PbaSmA8e5y8Of8RVs5cZAN0XX5Pd
Content-Type: multipart/alternative;
 boundary="------------693E5A31575456EA42173DB6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------693E5A31575456EA42173DB6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

06.12.2019 5:43, Zheng Bao wrote:
> Is this problem solved?
> I met the same problem.
>
Well, AFAIU the meta-s2600wf layer in upstream openbmc is still non-funct=
ional.

We're using the `wolfpass` machine from Intel-BMC/clean_builds now.

We still see those network driver related backtraces, but the rest seems =
to work
more or less fine.

Host power can be controlled (even locally from openbmc shell) using ipmi=
tool.

With best regards,
Alexander Amelkin,


> Zheng
>
> -----------------------------------------------------------------------=
---------
> *From:* openbmc on behalf of Alexander Amelkin
> *Sent:* Friday, November 15, 2019 10:53 AM
> *To:* openbmc@lists.ozlabs.org; jason.m.bills@linux.intel.com
> *Subject:* s2600wf problems (was: openbmc power-control can't work OK)
>
> Hi Bill!
>
> We're also having difficulties running a generic meta-s2600wf on Intel =
reference
> s2600wf "Woflpass" board.
>
> We're using a newer openbmc commit (985dee9cb6bb29800a933e882913a44e6b9=
d4f420)
> with a patch to phosphor-dbus-interfaces taken from commit
> 0bbcc8f0cc34236d6f8549c5f51410420dbc8f08 of that project.
> The patch is applied in order to make openbmc build for s2600wf, withou=
t the
> patch the build fails complaining about the missing NMISource interface=
=2E
>
> When we boot the image on s2600wf, we get a LOT of errors. The main pro=
blems we
> have are:
>
> 1. Host power can't be controlled
>
> 2. Ethernet driver crashes
>
> Below are the logs. I've cut out all the non-error output here, except =
for the
> log header.
>
> -- Logs begin at Thu 1970-01-01 00:00:10 UTC, end at Thu 1970-01-01 01:=
02:06
> UTC. --
> Jan 01 00:00:10 vegman-s2600wf kernel: Booting Linux on physical CPU 0x=
0
> Jan 01 00:00:10 vegman-s2600wf kernel: Linux version 5.3.10-7b61b9e
> (oe-user@oe-host) (gcc version 9.2.0 (GCC)) #1 Thu Nov 14 14:13:03 UTC =
2019
> Jan 01 00:00:10 vegman-s2600wf kernel: CPU: ARMv6-compatible processor
> [410fb767] revision 7 (ARMv7), cr=3D00c5387d
> Jan 01 00:00:10 vegman-s2600wf kernel: CPU: PIPT / VIPT nonaliasing dat=
a cache,
> VIPT nonaliasing instruction cache
> Jan 01 00:00:10 vegman-s2600wf kernel: OF: fdt: Machine model: S2600WF =
BMC
> Jan 01 00:00:10 vegman-s2600wf kernel: Memory policy: Data cache writeb=
ack
> Jan 01 00:00:10 vegman-s2600wf kernel: cma: Reserved 16 MiB at 0x9d8000=
00
> Jan 01 00:00:10 vegman-s2600wf kernel: Built 1 zonelists, mobility grou=
ping on.=C2=A0
> Total pages: 125984
> Jan 01 00:00:10 vegman-s2600wf kernel: Kernel command line:
> console=3DttyS4,115200n8 root=3D/dev/ram rw
> ----- 8< ------
> Jan 01 00:00:10 vegman-s2600wf kernel: aspeed_gfx 1e6e6000.display: fai=
led to
> initialize reserved mem: -19
> ----- 8< ------
> Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Error a=
pplying
> setting, reverse things back
> Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Using 5=
0 MHz SPI
> frequency
> Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: unrecog=
nized
> JEDEC id bytes: 0a 0a 0a 0a 0a 0a
> Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc 1e630000.spi: Aspeed =
SMC probe
> failed -2
> Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc: probe of 1e630000.sp=
i failed
> with error -2
> ----- 8< ------
> Jan 01 00:00:10 vegman-s2600wf kernel: overlayfs: upper fs does not sup=
port
> tmpfile.
> Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to lookup module alia=
s
> 'autofs4': Function not implemented
> ----- 8< ------
> Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to put bus name to ha=
shmap:
> File exists
> Jan 01 00:00:10 vegman-s2600wf systemd[1]:
> xyz.openbmc_project.State.Host.service: Two services allocated for the =
same bus
> name xyz.openbmc_project.State.Host, refusing operation.
> Jan 01 00:00:10 vegman-s2600wf systemd[1]: unit_file_find_fragment:
> obmc-host-reset-running@.target+0 =E2=86=92 obmc-host-reset-running@0.t=
arget
> Jan 01 00:00:10 vegman-s2600wf systemd[1]: unit_file_find_fragment:
> obmc-host-reset@.target+0 =E2=86=92 obmc-host-reset@0.target
> Jan 01 00:00:10 vegman-s2600wf systemd[1]:
> /lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name=
,
> ignoring: sys-subsystem-net-devices-%i.device
> Jan 01 00:00:10 vegman-s2600wf systemd[1]:
> xyz.openbmc_project.State.Host.service: Cannot add dependency job, igno=
ring:
> Unit xyz.openbmc_project.State.Host.service failed to load properly: Fi=
le exists.
> ----- 8< ------
> Jan 01 00:00:28 vegman-s2600wf power-control[172]: Failed to find the P=
S_PWROK
> line
> Jan 01 00:00:28 vegman-s2600wf systemd[1]:
> xyz.openbmc_project.Chassis.Control.Power.service: Main process exited,=

> code=3Dexited, status=3D255/EXCEPTION
> Jan 01 00:00:28 vegman-s2600wf systemd[1]:
> xyz.openbmc_project.Chassis.Control.Power.service: Failed with result '=
exit-code'.
> Jan 01 00:00:29 vegman-s2600wf systemd[1]: Failed to start Intel Power =
Control.
> ----- 8< ------
> Jan 01 00:01:12 vegman-s2600wf kernel: ------------[ cut here ]--------=
----
> Jan 01 00:01:12 vegman-s2600wf kernel: WARNING: CPU: 0 PID: 331 at
> net/sched/sch_generic.c:447 dev_watchdog+0x268/0x288
> Jan 01 00:01:12 vegman-s2600wf kernel: NETDEV WATCHDOG: eth0 (ftgmac100=
):
> transmit queue 0 timed out
> Jan 01 00:01:12 vegman-s2600wf kernel: CPU: 0 PID: 331 Comm: python Not=
 tainted
> 5.3.10-7b61b9e #1
> Jan 01 00:01:12 vegman-s2600wf kernel: Hardware name: Generic DT based =
system
> Jan 01 00:01:12 vegman-s2600wf kernel: Backtrace:
> Jan 01 00:01:12 vegman-s2600wf kernel: [<80107c84>] (dump_backtrace) fr=
om
> [<80107eb8>] (show_stack+0x20/0x24)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r7:80a12d20 r6:00000000 r5=
:9972378c
> r4:00000009
> Jan 01 00:01:12 vegman-s2600wf kernel: [<80107e98>] (show_stack) from
> [<806a84b0>] (dump_stack+0x20/0x28)
> Jan 01 00:01:12 vegman-s2600wf kernel: [<806a8490>] (dump_stack) from
> [<80116900>] (__warn.part.0+0xb4/0xdc)
> Jan 01 00:01:12 vegman-s2600wf kernel: [<8011684c>] (__warn.part.0) fro=
m
> [<80116998>] (warn_slowpath_fmt+0x70/0x98)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r6:805ad4bc r5:000001bf r4=
:80840b28
> Jan 01 00:01:12 vegman-s2600wf kernel: [<80116928>] (warn_slowpath_fmt)=
 from
> [<805ad4bc>] (dev_watchdog+0x268/0x288)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r3:99094000 r2:80840aec
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r6:00000000 r5:99071900 r4=
:9909422c
> Jan 01 00:01:12 vegman-s2600wf kernel: [<805ad254>] (dev_watchdog) from=

> [<8015ad94>] (call_timer_fn+0x40/0x124)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:00000122 r8:ffffa6f8 r7=
:00000100
> r6:805ad254 r5:9909422c r4:9909422c
> Jan 01 00:01:12 vegman-s2600wf kernel: [<8015ad54>] (call_timer_fn) fro=
m
> [<8015af18>] (expire_timers+0xa0/0xdc)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r8:ffffa6f8 r7:80a13a40 r6=
:99723854
> r5:99723854 r4:9909422c
> Jan 01 00:01:12 vegman-s2600wf kernel: [<8015ae78>] (expire_timers) fro=
m
> [<8015aff4>] (run_timer_softirq+0xa0/0x198)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000002 r9:00000100 r=
8:80a12d20
> r7:80a13a40 r6:80a13a40 r5:99723854
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:99723854 r3:ffffa6f9
> Jan 01 00:01:12 vegman-s2600wf kernel: [<8015af54>] (run_timer_softirq)=
 from
> [<801022b4>] (__do_softirq+0xdc/0x314)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r8:00000000 r7:99722000 r6=
:80a62334
> r5:00000002 r4:00000001
> Jan 01 00:01:12 vegman-s2600wf kernel: [<801021d8>] (__do_softirq) from=

> [<8011a93c>] (irq_exit+0xac/0xe4)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:98e186dc r9:99722000 r=
8:00000000
> r7:9d413600 r6:00000001 r5:80a4a5d8
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000000
> Jan 01 00:01:12 vegman-s2600wf kernel: [<8011a890>] (irq_exit) from [<8=
014d1f4>]
> (__handle_domain_irq+0x60/0xb4)
> Jan 01 00:01:12 vegman-s2600wf kernel: [<8014d194>] (__handle_domain_ir=
q) from
> [<801021cc>] (avic_handle_irq+0x68/0x70)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:99722000 r8:98e18206 r7=
:9972396c
> r6:ffffffff r5:99723938 r4:9d402e40
> Jan 01 00:01:12 vegman-s2600wf kernel: [<80102164>] (avic_handle_irq) f=
rom
> [<80101a6c>] (__irq_svc+0x6c/0x90)
> Jan 01 00:01:12 vegman-s2600wf kernel: Exception stack(0x99723938 to 0x=
99723980)
> Jan 01 00:01:12 vegman-s2600wf kernel:
> 3920:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000460 0000054b
> Jan 01 00:01:12 vegman-s2600wf kernel: 3940: 00000008 000002df 98e18000=
 de785a57
> 00000008 98e1800e 98e18206 000001cb
> Jan 01 00:01:12 vegman-s2600wf kernel: 3960: 98e186dc 997239b4 0a4e3ec5=
 99723988
> 00000458 803b58e0 20000013 ffffffff
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r5:20000013 r4:803b58e0
> Jan 01 00:01:12 vegman-s2600wf kernel: [<803b559c>] (lzma_main) from
> [<803b64ec>] (xz_dec_lzma2_run+0x678/0x824)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:00000000 r=
8:98e1e000
> r7:98e1eee8 r6:0000002a r5:98e09a84
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:98e18000 r3:000003fd
> Jan 01 00:01:12 vegman-s2600wf kernel: [<803b5e74>] (xz_dec_lzma2_run) =
from
> [<803b4ad4>] (xz_dec_run+0x2d8/0xa78)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:994b0c00 r9:00000000 r=
8:98e09a84
> r7:9d608800 r6:00000001 r5:00000001
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:98e09a80
> Jan 01 00:01:12 vegman-s2600wf kernel: [<803b47fc>] (xz_dec_run) from
> [<802c6618>] (squashfs_xz_uncompress+0x8c/0x234)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:994b0c00 r9:98e09a84 r=
8:98e09560
> r7:0000001b r6:0000000d r5:00000001
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:98e09a80
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802c658c>] (squashfs_xz_uncomp=
ress)
> from [<802c6538>] (squashfs_decompress+0x68/0xa0)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:98e09560 r9:98e09440 r=
8:98e09444
> r7:0000001b r6:994b0c00 r5:802c658c
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:990f4200
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802c64d0>] (squashfs_decompres=
s) from
> [<802c20ac>] (squashfs_read_data+0x404/0x734)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:994b0c68 r=
8:98e09560
> r7:994b0bfc r6:0000001b r5:0000026c
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:0000001b
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802c1ca8>] (squashfs_read_data=
) from
> [<802c27b8>] (squashfs_cache_get+0x238/0x388)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000002 r9:9d602fc0 r=
8:990ba7b8
> r7:00000000 r6:0131366c r5:990ba780
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000001
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802c2580>] (squashfs_cache_get=
) from
> [<802c2d88>] (squashfs_get_fragment+0x2c/0x34)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:9ee5c5e0 r9:00000004 r=
8:99723cd4
> r7:ffffffff r6:9a05be18 r5:9a05be18
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000000
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802c2d5c>] (squashfs_get_fragm=
ent) from
> [<802c3b2c>] (squashfs_readpage+0xf4/0x920)
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802c3a38>] (squashfs_readpage)=
 from
> [<802000b8>] (read_pages+0x10c/0x160)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00112cca r9:00000004 r=
8:99723cd4
> r7:9a05bf00 r6:00000000 r5:9ee5c5e0
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:9ee5c5e4
> Jan 01 00:01:12 vegman-s2600wf kernel: [<801fffac>] (read_pages) from
> [<80200494>] (__do_page_cache_readahead+0x1b8/0x1d8)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:9a05bf04 r9:00112cca r=
8:99723cd4
> r7:00000003 r6:00000004 r5:00000004
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000003
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802002dc>] (__do_page_cache_re=
adahead)
> from [<802006cc>] (ondemand_readahead+0x218/0x288)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:99f785a0 r=
8:00000000
> r7:9a05bf00 r6:00000000 r5:00000003
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:99f785f8
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802004b4>] (ondemand_readahead=
) from
> [<802008b0>] (page_cache_sync_readahead+0x5c/0x7c)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:99723ec0 r9:99723dd8 r=
8:00000000
> r7:00000000 r6:00000000 r5:99f785a0
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:9a05bf00
> Jan 01 00:01:12 vegman-s2600wf kernel: [<80200854>] (page_cache_sync_re=
adahead)
> from [<801f8138>] (generic_file_read_iter+0x680/0x970)
> Jan 01 00:01:12 vegman-s2600wf kernel: [<801f7ab8>] (generic_file_read_=
iter)
> from [<80242ef4>] (do_iter_readv_writev+0x150/0x1dc)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:99723ec0 r=
8:00000000
> r7:99723ee0 r6:00000000 r5:00000000
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:99f785a0
> Jan 01 00:01:12 vegman-s2600wf kernel: [<80242da4>] (do_iter_readv_writ=
ev) from
> [<80243940>] (do_iter_read+0xf4/0x1ac)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:00000000 r=
8:00000001
> r7:99723ee0 r6:99723ec0 r5:99f785a0
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000000
> Jan 01 00:01:12 vegman-s2600wf kernel: [<8024384c>] (do_iter_read) from=

> [<80244d1c>] (vfs_iter_read+0x28/0x34)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000 r9:00000000 r=
8:00000400
> r7:99495b40 r6:99723ec0 r5:99723ed8
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:9974d700
> Jan 01 00:01:12 vegman-s2600wf kernel: [<80244cf4>] (vfs_iter_read) fro=
m
> [<8031e23c>] (ovl_read_iter+0xc0/0x114)
> Jan 01 00:01:12 vegman-s2600wf kernel: [<8031e17c>] (ovl_read_iter) fro=
m
> [<802442f4>] (__vfs_read+0x150/0x1d4)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r7:00000000 r6:00000000 r5=
:99723f60
> r4:99495b40
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802441a4>] (__vfs_read) from
> [<80244418>] (vfs_read+0xa0/0x120)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:00000000 r8:00000001 r7=
:99723f60
> r6:0175bec0 r5:99495b40 r4:00000400
> Jan 01 00:01:12 vegman-s2600wf kernel: [<80244378>] (vfs_read) from [<8=
0244838>]
> (ksys_read+0x70/0xf8)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:00000000 r8:00000000 r7=
:00000400
> r6:0175bec0 r5:99495b40 r4:99495b40
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802447c8>] (ksys_read) from
> [<802448d8>] (sys_read+0x18/0x1c)
> Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:99722000 r8:801011e4 r7=
:00000003
> r6:76fe64d0 r5:430015bc r4:01695198
> Jan 01 00:01:12 vegman-s2600wf kernel: [<802448c0>] (sys_read) from [<8=
0101000>]
> (ret_fast_syscall+0x0/0x54)
> Jan 01 00:01:12 vegman-s2600wf kernel: Exception stack(0x99723fa8 to 0x=
99723ff0)
> Jan 01 00:01:12 vegman-s2600wf kernel: 3fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 01695198 430015bc
> 00000004 0175bec0 00000400 00000000
> Jan 01 00:01:12 vegman-s2600wf kernel: 3fc0: 01695198 430015bc 76fe64d0=
 00000003
> 000005e8 432d4000 00001001 5dc2157e
> Jan 01 00:01:12 vegman-s2600wf kernel: 3fe0: fbad2488 7ee24820 42f2d824=
 42f85f7c
> Jan 01 00:01:12 vegman-s2600wf kernel: ---[ end trace 0910e44f554793b0 =
]---
> ----- 8< ------
>
> There are more errors as well. Please see the attached full log.
>
> What do you suggest? How can we make it control the power of s2600wf ho=
st and
> how do we make the network interface work?
>
> Thank you.
>
> With best regards,
> Alexander Amelkin,
> YADRO [https://yadro.com]
>
> 25.10.2019 18:59, Bills, Jason M wrote:
> > I'm copying the mailing list in case there are others who have simila=
r
> questions.
> >
> > On 10/25/2019 2:57 AM, =E9=98=BF=E6=A1=82 wrote:
> >> =C2=A0=C2=A0 =C2=A0Hi, jason
> >> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Could you help me, please ? =
My board is not a evb board, but it is
> >> x86 platform. So i=C2=A0build openbmc *meta-s2600wf*(commit
> >> ID=C2=A0c549f3a7f5496ec3b54ed65c8b4d8351db10995e) instead=EF=BC=8Cwh=
ich use
> >> x86-power-control version f61ca6fdcc52beba485e014b5fad38a9e9a555ad
> >>
> <https://github.com/openbmc/x86-power-control/commit/f61ca6fdcc52beba48=
5e014b5fad38a9e9a555ad>.
> >> But when i use "ipmitools chassis power status" commond to get host =
status at
> >> my board, it point out "Get Chassis Power Status failed: Unspecified=
 error",
> >> journalctl -f command refer to "ipmid[279]: Failed to fetch ACBoot p=
roperty,
> >> ipmid[279]: Failed to fetch RestartCause property". It seems there h=
ave no
> >> property in dbus.=C2=A0 Where is the dbus property=C2=A0ACBoot and=C2=
=A0RestartCause
> >> defined?I'm puzzled about this /situation. Could you///give me some
> suggestions?
> >
> > This is because the IPMI chassis power status command gets the power =
status by
> > calling the IPMI chassis status command which requires a lot of other=

> > information such as the restart cause and AC fail status to return su=
ccessfully.
> >
> > The ACBoot property is provided by a small script that we run to get =
the reset
> > reason from uboot.=C2=A0 You can find it here:
> >
> https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-=
common/recipes-core/ac-boot-check.
> >
> > The RestartCause property recently moved to x86-power-control and is =
being
> > synced up in this review:
> > https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-control/+/2649=
1.
> >
> > Thanks,
> > -Jason
> >
> >> /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks a lot./
> >>
> >>

--------------693E5A31575456EA42173DB6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    06.12.2019 5:43, Zheng Bao wrote:<br>
    <blockquote type=3D"cite"
cite=3D"mid:MN2PR04MB6669193B89BEFFF3252A1216CD5F0@MN2PR04MB6669.namprd04=
=2Eprod.outlook.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;m=
argin-bottom:0;} </style>
      <div style=3D"font-family: Calibri, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Is this problem solved?</div>
      <div style=3D"font-family: Calibri, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        I met the same problem.</div>
      <div style=3D"font-family: Calibri, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
    </blockquote>
    <p>Well, AFAIU the meta-s2600wf layer in upstream openbmc is still
      non-functional.</p>
    <p>We're using the `wolfpass` machine from Intel-BMC/clean_builds
      now.</p>
    <p>We still see those network driver related backtraces, but the
      rest seems to work more or less fine.</p>
    <p>Host power can be controlled (even locally from openbmc shell)
      using ipmitool.<br>
    </p>
    <pre class=3D"moz-signature" cols=3D"80">With best regards,
Alexander Amelkin,
</pre>
    <br>
    <blockquote type=3D"cite"
cite=3D"mid:MN2PR04MB6669193B89BEFFF3252A1216CD5F0@MN2PR04MB6669.namprd04=
=2Eprod.outlook.com">
      <div style=3D"font-family: Calibri, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
      </div>
      <div style=3D"font-family: Calibri, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Zheng<br>
      </div>
      <div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;
        font-size:12pt; color:rgb(0,0,0);">
        <br>
        <hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
        <b>From:</b> openbmc on behalf of Alexander Amelkin<br>
        <b>Sent:</b> Friday, November 15, 2019 10:53 AM<br>
        <b>To:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:o=
penbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>;
        <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:jason.m.bill=
s@linux.intel.com">jason.m.bills@linux.intel.com</a><br>
        <b>Subject:</b> s2600wf problems (was: openbmc power-control
        can't work OK)
        <div><br>
        </div>
      </div>
      <div class=3D"BodyFragment"><font size=3D"2"><span
            style=3D"font-size:11pt;">
            <div class=3D"PlainText">Hi Bill!<br>
              <br>
              We're also having difficulties running a generic
              meta-s2600wf on Intel reference<br>
              s2600wf "Woflpass" board.<br>
              <br>
              We're using a newer openbmc commit
              (985dee9cb6bb29800a933e882913a44e6b9d4f420)<br>
              with a patch to phosphor-dbus-interfaces taken from commit<=
br>
              0bbcc8f0cc34236d6f8549c5f51410420dbc8f08 of that project.<b=
r>
              The patch is applied in order to make openbmc build for
              s2600wf, without the<br>
              patch the build fails complaining about the missing
              NMISource interface.<br>
              <br>
              When we boot the image on s2600wf, we get a LOT of errors.
              The main problems we<br>
              have are:<br>
              <br>
              1. Host power can't be controlled<br>
              <br>
              2. Ethernet driver crashes<br>
              <br>
              Below are the logs. I've cut out all the non-error output
              here, except for the<br>
              log header.<br>
              <br>
              -- Logs begin at Thu 1970-01-01 00:00:10 UTC, end at Thu
              1970-01-01 01:02:06 UTC. --<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: Booting Linux on
              physical CPU 0x0<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: Linux version
              5.3.10-7b61b9e<br>
              (oe-user@oe-host) (gcc version 9.2.0 (GCC)) #1 Thu Nov 14
              14:13:03 UTC 2019<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: CPU:
              ARMv6-compatible processor<br>
              [410fb767] revision 7 (ARMv7), cr=3D00c5387d<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: CPU: PIPT / VIPT
              nonaliasing data cache,<br>
              VIPT nonaliasing instruction cache<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: OF: fdt: Machine
              model: S2600WF BMC<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: Memory policy: Data
              cache writeback<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: cma: Reserved 16
              MiB at 0x9d800000<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: Built 1 zonelists,
              mobility grouping on.=C2=A0<br>
              Total pages: 125984<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: Kernel command
              line:<br>
              console=3DttyS4,115200n8 root=3D/dev/ram rw<br>
              ----- 8&lt; ------<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: aspeed_gfx
              1e6e6000.display: failed to<br>
              initialize reserved mem: -19<br>
              ----- 8&lt; ------<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc
              1e630000.spi: Error applying<br>
              setting, reverse things back<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc
              1e630000.spi: Using 50 MHz SPI<br>
              frequency<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc
              1e630000.spi: unrecognized<br>
              JEDEC id bytes: 0a 0a 0a 0a 0a 0a<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc
              1e630000.spi: Aspeed SMC probe<br>
              failed -2<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: aspeed-smc: probe
              of 1e630000.spi failed<br>
              with error -2<br>
              ----- 8&lt; ------<br>
              Jan 01 00:00:10 vegman-s2600wf kernel: overlayfs: upper fs
              does not support tmpfile.<br>
              Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to
              lookup module alias<br>
              'autofs4': Function not implemented<br>
              ----- 8&lt; ------<br>
              Jan 01 00:00:10 vegman-s2600wf systemd[1]: Failed to put
              bus name to hashmap:<br>
              File exists<br>
              Jan 01 00:00:10 vegman-s2600wf systemd[1]:<br>
              xyz.openbmc_project.State.Host.service: Two services
              allocated for the same bus<br>
              name xyz.openbmc_project.State.Host, refusing operation.<br=
>
              Jan 01 00:00:10 vegman-s2600wf systemd[1]:
              unit_file_find_fragment:<br>
              <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:obmc-h=
ost-reset-running@.target+0">obmc-host-reset-running@.target+0</a> =E2=86=
=92
              <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:obmc-h=
ost-reset-running@0.target">obmc-host-reset-running@0.target</a><br>
              Jan 01 00:00:10 vegman-s2600wf systemd[1]:
              unit_file_find_fragment:<br>
              <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:obmc-h=
ost-reset@.target+0">obmc-host-reset@.target+0</a> =E2=86=92 <a class=3D"=
moz-txt-link-abbreviated" href=3D"mailto:obmc-host-reset@0.target">obmc-h=
ost-reset@0.target</a><br>
              Jan 01 00:00:10 vegman-s2600wf systemd[1]:<br>
              /lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid
              interface name,<br>
              ignoring: sys-subsystem-net-devices-%i.device<br>
              Jan 01 00:00:10 vegman-s2600wf systemd[1]:<br>
              xyz.openbmc_project.State.Host.service: Cannot add
              dependency job, ignoring:<br>
              Unit xyz.openbmc_project.State.Host.service failed to load
              properly: File exists.<br>
              ----- 8&lt; ------<br>
              Jan 01 00:00:28 vegman-s2600wf power-control[172]: Failed
              to find the PS_PWROK line<br>
              Jan 01 00:00:28 vegman-s2600wf systemd[1]:<br>
              xyz.openbmc_project.Chassis.Control.Power.service: Main
              process exited,<br>
              code=3Dexited, status=3D255/EXCEPTION<br>
              Jan 01 00:00:28 vegman-s2600wf systemd[1]:<br>
              xyz.openbmc_project.Chassis.Control.Power.service: Failed
              with result 'exit-code'.<br>
              Jan 01 00:00:29 vegman-s2600wf systemd[1]: Failed to start
              Intel Power Control.<br>
              ----- 8&lt; ------<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: ------------[ cut
              here ]------------<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: WARNING: CPU: 0
              PID: 331 at<br>
              net/sched/sch_generic.c:447 dev_watchdog+0x268/0x288<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: NETDEV WATCHDOG:
              eth0 (ftgmac100):<br>
              transmit queue 0 timed out<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: CPU: 0 PID: 331
              Comm: python Not tainted<br>
              5.3.10-7b61b9e #1<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: Hardware name:
              Generic DT based system<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: Backtrace:<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80107c84&gt;]
              (dump_backtrace) from<br>
              [&lt;80107eb8&gt;] (show_stack+0x20/0x24)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r7:80a12d20
              r6:00000000 r5:9972378c<br>
              r4:00000009<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80107e98&gt;]
              (show_stack) from<br>
              [&lt;806a84b0&gt;] (dump_stack+0x20/0x28)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;806a8490&gt;]
              (dump_stack) from<br>
              [&lt;80116900&gt;] (__warn.part.0+0xb4/0xdc)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8011684c&gt;]
              (__warn.part.0) from<br>
              [&lt;80116998&gt;] (warn_slowpath_fmt+0x70/0x98)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r6:805ad4bc
              r5:000001bf r4:80840b28<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80116928&gt;]
              (warn_slowpath_fmt) from<br>
              [&lt;805ad4bc&gt;] (dev_watchdog+0x268/0x288)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r3:99094000
              r2:80840aec<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r6:00000000
              r5:99071900 r4:9909422c<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;805ad254&gt;]
              (dev_watchdog) from<br>
              [&lt;8015ad94&gt;] (call_timer_fn+0x40/0x124)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:00000122
              r8:ffffa6f8 r7:00000100<br>
              r6:805ad254 r5:9909422c r4:9909422c<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8015ad54&gt;]
              (call_timer_fn) from<br>
              [&lt;8015af18&gt;] (expire_timers+0xa0/0xdc)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r8:ffffa6f8
              r7:80a13a40 r6:99723854<br>
              r5:99723854 r4:9909422c<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8015ae78&gt;]
              (expire_timers) from<br>
              [&lt;8015aff4&gt;] (run_timer_softirq+0xa0/0x198)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000002
              r9:00000100 r8:80a12d20<br>
              r7:80a13a40 r6:80a13a40 r5:99723854<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:99723854
              r3:ffffa6f9<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8015af54&gt;]
              (run_timer_softirq) from<br>
              [&lt;801022b4&gt;] (__do_softirq+0xdc/0x314)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r8:00000000
              r7:99722000 r6:80a62334<br>
              r5:00000002 r4:00000001<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;801021d8&gt;]
              (__do_softirq) from<br>
              [&lt;8011a93c&gt;] (irq_exit+0xac/0xe4)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:98e186dc
              r9:99722000 r8:00000000<br>
              r7:9d413600 r6:00000001 r5:80a4a5d8<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000000<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8011a890&gt;]
              (irq_exit) from [&lt;8014d1f4&gt;]<br>
              (__handle_domain_irq+0x60/0xb4)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8014d194&gt;]
              (__handle_domain_irq) from<br>
              [&lt;801021cc&gt;] (avic_handle_irq+0x68/0x70)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:99722000
              r8:98e18206 r7:9972396c<br>
              r6:ffffffff r5:99723938 r4:9d402e40<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80102164&gt;]
              (avic_handle_irq) from<br>
              [&lt;80101a6c&gt;] (__irq_svc+0x6c/0x90)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: Exception
              stack(0x99723938 to 0x99723980)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:<br>
3920:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000460
              0000054b<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: 3940: 00000008
              000002df 98e18000 de785a57<br>
              00000008 98e1800e 98e18206 000001cb<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: 3960: 98e186dc
              997239b4 0a4e3ec5 99723988<br>
              00000458 803b58e0 20000013 ffffffff<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r5:20000013
              r4:803b58e0<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;803b559c&gt;]
              (lzma_main) from<br>
              [&lt;803b64ec&gt;] (xz_dec_lzma2_run+0x678/0x824)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000
              r9:00000000 r8:98e1e000<br>
              r7:98e1eee8 r6:0000002a r5:98e09a84<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:98e18000
              r3:000003fd<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;803b5e74&gt;]
              (xz_dec_lzma2_run) from<br>
              [&lt;803b4ad4&gt;] (xz_dec_run+0x2d8/0xa78)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:994b0c00
              r9:00000000 r8:98e09a84<br>
              r7:9d608800 r6:00000001 r5:00000001<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:98e09a80<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;803b47fc&gt;]
              (xz_dec_run) from<br>
              [&lt;802c6618&gt;] (squashfs_xz_uncompress+0x8c/0x234)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:994b0c00
              r9:98e09a84 r8:98e09560<br>
              r7:0000001b r6:0000000d r5:00000001<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:98e09a80<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c658c&gt;]
              (squashfs_xz_uncompress)<br>
              from [&lt;802c6538&gt;] (squashfs_decompress+0x68/0xa0)<br>=

              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:98e09560
              r9:98e09440 r8:98e09444<br>
              r7:0000001b r6:994b0c00 r5:802c658c<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:990f4200<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c64d0&gt;]
              (squashfs_decompress) from<br>
              [&lt;802c20ac&gt;] (squashfs_read_data+0x404/0x734)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000
              r9:994b0c68 r8:98e09560<br>
              r7:994b0bfc r6:0000001b r5:0000026c<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:0000001b<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c1ca8&gt;]
              (squashfs_read_data) from<br>
              [&lt;802c27b8&gt;] (squashfs_cache_get+0x238/0x388)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000002
              r9:9d602fc0 r8:990ba7b8<br>
              r7:00000000 r6:0131366c r5:990ba780<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000001<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c2580&gt;]
              (squashfs_cache_get) from<br>
              [&lt;802c2d88&gt;] (squashfs_get_fragment+0x2c/0x34)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:9ee5c5e0
              r9:00000004 r8:99723cd4<br>
              r7:ffffffff r6:9a05be18 r5:9a05be18<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000000<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c2d5c&gt;]
              (squashfs_get_fragment) from<br>
              [&lt;802c3b2c&gt;] (squashfs_readpage+0xf4/0x920)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802c3a38&gt;]
              (squashfs_readpage) from<br>
              [&lt;802000b8&gt;] (read_pages+0x10c/0x160)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00112cca
              r9:00000004 r8:99723cd4<br>
              r7:9a05bf00 r6:00000000 r5:9ee5c5e0<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:9ee5c5e4<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;801fffac&gt;]
              (read_pages) from<br>
              [&lt;80200494&gt;] (__do_page_cache_readahead+0x1b8/0x1d8)<=
br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:9a05bf04
              r9:00112cca r8:99723cd4<br>
              r7:00000003 r6:00000004 r5:00000004<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000003<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802002dc&gt;]
              (__do_page_cache_readahead)<br>
              from [&lt;802006cc&gt;] (ondemand_readahead+0x218/0x288)<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000
              r9:99f785a0 r8:00000000<br>
              r7:9a05bf00 r6:00000000 r5:00000003<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:99f785f8<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802004b4&gt;]
              (ondemand_readahead) from<br>
              [&lt;802008b0&gt;] (page_cache_sync_readahead+0x5c/0x7c)<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:99723ec0
              r9:99723dd8 r8:00000000<br>
              r7:00000000 r6:00000000 r5:99f785a0<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:9a05bf00<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80200854&gt;]
              (page_cache_sync_readahead)<br>
              from [&lt;801f8138&gt;]
              (generic_file_read_iter+0x680/0x970)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;801f7ab8&gt;]
              (generic_file_read_iter)<br>
              from [&lt;80242ef4&gt;] (do_iter_readv_writev+0x150/0x1dc)<=
br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000
              r9:99723ec0 r8:00000000<br>
              r7:99723ee0 r6:00000000 r5:00000000<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:99f785a0<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80242da4&gt;]
              (do_iter_readv_writev) from<br>
              [&lt;80243940&gt;] (do_iter_read+0xf4/0x1ac)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000
              r9:00000000 r8:00000001<br>
              r7:99723ee0 r6:99723ec0 r5:99f785a0<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:00000000<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8024384c&gt;]
              (do_iter_read) from<br>
              [&lt;80244d1c&gt;] (vfs_iter_read+0x28/0x34)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r10:00000000
              r9:00000000 r8:00000400<br>
              r7:99495b40 r6:99723ec0 r5:99723ed8<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r4:9974d700<br=
>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80244cf4&gt;]
              (vfs_iter_read) from<br>
              [&lt;8031e23c&gt;] (ovl_read_iter+0xc0/0x114)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;8031e17c&gt;]
              (ovl_read_iter) from<br>
              [&lt;802442f4&gt;] (__vfs_read+0x150/0x1d4)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r7:00000000
              r6:00000000 r5:99723f60<br>
              r4:99495b40<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802441a4&gt;]
              (__vfs_read) from<br>
              [&lt;80244418&gt;] (vfs_read+0xa0/0x120)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:00000000
              r8:00000001 r7:99723f60<br>
              r6:0175bec0 r5:99495b40 r4:00000400<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;80244378&gt;]
              (vfs_read) from [&lt;80244838&gt;]<br>
              (ksys_read+0x70/0xf8)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:00000000
              r8:00000000 r7:00000400<br>
              r6:0175bec0 r5:99495b40 r4:99495b40<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802447c8&gt;]
              (ksys_read) from<br>
              [&lt;802448d8&gt;] (sys_read+0x18/0x1c)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:=C2=A0 r9:99722000
              r8:801011e4 r7:00000003<br>
              r6:76fe64d0 r5:430015bc r4:01695198<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: [&lt;802448c0&gt;]
              (sys_read) from [&lt;80101000&gt;]<br>
              (ret_fast_syscall+0x0/0x54)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: Exception
              stack(0x99723fa8 to 0x99723ff0)<br>
              Jan 01 00:01:12 vegman-s2600wf kernel:
              3fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 01695198 430015bc<=
br>
              00000004 0175bec0 00000400 00000000<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: 3fc0: 01695198
              430015bc 76fe64d0 00000003<br>
              000005e8 432d4000 00001001 5dc2157e<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: 3fe0: fbad2488
              7ee24820 42f2d824 42f85f7c<br>
              Jan 01 00:01:12 vegman-s2600wf kernel: ---[ end trace
              0910e44f554793b0 ]---<br>
              ----- 8&lt; ------<br>
              <br>
              There are more errors as well. Please see the attached
              full log.<br>
              <br>
              What do you suggest? How can we make it control the power
              of s2600wf host and<br>
              how do we make the network interface work?<br>
              <br>
              Thank you.<br>
              <br>
              With best regards,<br>
              Alexander Amelkin,<br>
              YADRO [<a href=3D"https://yadro.com" target=3D"_blank"
                rel=3D"noopener noreferrer" data-auth=3D"NotApplicable"
                moz-do-not-send=3D"true">https://yadro.com</a>]<br>
              <br>
              25.10.2019 18:59, Bills, Jason M wrote:<br>
              &gt; I'm copying the mailing list in case there are others
              who have similar questions.<br>
              &gt;<br>
              &gt; On 10/25/2019 2:57 AM, =E9=98=BF=E6=A1=82 wrote:<br>
              &gt;&gt; =C2=A0=C2=A0 =C2=A0Hi, jason<br>
              &gt;&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Could you =
help me, please ? My board is
              not a evb board, but it is<br>
              &gt;&gt; x86 platform. So i=C2=A0build openbmc
              *meta-s2600wf*(commit<br>
              &gt;&gt; ID=C2=A0c549f3a7f5496ec3b54ed65c8b4d8351db10995e)
              instead=EF=BC=8Cwhich use<br>
              &gt;&gt; x86-power-control version
              f61ca6fdcc52beba485e014b5fad38a9e9a555ad<br>
              &gt;&gt; &lt;<a
href=3D"https://github.com/openbmc/x86-power-control/commit/f61ca6fdcc52b=
eba485e014b5fad38a9e9a555ad"
                target=3D"_blank" rel=3D"noopener noreferrer"
                data-auth=3D"NotApplicable" moz-do-not-send=3D"true">http=
s://github.com/openbmc/x86-power-control/commit/f61ca6fdcc52beba485e014b5=
fad38a9e9a555ad</a>&gt;.<br>
              &gt;&gt; But when i use "ipmitools chassis power status"
              commond to get host status at<br>
              &gt;&gt; my board, it point out "Get Chassis Power Status
              failed: Unspecified error",<br>
              &gt;&gt; journalctl -f command refer to "ipmid[279]:
              Failed to fetch ACBoot property,<br>
              &gt;&gt; ipmid[279]: Failed to fetch RestartCause
              property". It seems there have no<br>
              &gt;&gt; property in dbus.=C2=A0 Where is the dbus
              property=C2=A0ACBoot and=C2=A0RestartCause<br>
              &gt;&gt; defined?I'm puzzled about this /situation. Could
              you///give me some suggestions?<br>
              &gt;<br>
              &gt; This is because the IPMI chassis power status command
              gets the power status by<br>
              &gt; calling the IPMI chassis status command which
              requires a lot of other<br>
              &gt; information such as the restart cause and AC fail
              status to return successfully.<br>
              &gt;<br>
              &gt; The ACBoot property is provided by a small script
              that we run to get the reset<br>
              &gt; reason from uboot.=C2=A0 You can find it here:<br>
              &gt; <a
href=3D"https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods=
/meta-common/recipes-core/ac-boot-check"
                target=3D"_blank" rel=3D"noopener noreferrer"
                data-auth=3D"NotApplicable" moz-do-not-send=3D"true">
https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-co=
mmon/recipes-core/ac-boot-check</a>.<br>
              &gt;<br>
              &gt; The RestartCause property recently moved to
              x86-power-control and is being<br>
              &gt; synced up in this review:<br>
              &gt; <a
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-control/+/=
26491"
                target=3D"_blank" rel=3D"noopener noreferrer"
                data-auth=3D"NotApplicable" moz-do-not-send=3D"true">
https://gerrit.openbmc-project.xyz/c/openbmc/x86-power-control/+/26491</a=
>.<br>
              &gt;<br>
              &gt; Thanks,<br>
              &gt; -Jason<br>
              &gt;<br>
              &gt;&gt; /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks a lot./<=
br>
              &gt;&gt;<br>
              &gt;&gt;<br>
            </div>
          </span></font></div>
    </blockquote>
  </body>
</html>

--------------693E5A31575456EA42173DB6--

--MCBO8PbaSmA8e5y8Of8RVs5cZAN0XX5Pd--

--XEJTss4roU6Y3QL2axdvtDTmkNagag4E5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJd8OBXAAoJEOiTWHtbdBeNqhsQAN+nt3I6ivh37zOQIlvS2kb2
4WsmBJILgZdQOSnOX/2lFzPfzePk0Jkt1o/2Xbp8JXgDA4k02Mt/ndm+ytp7/KOi
Pd1i+pbURRUGzRqS4mz7tEMvpGFF8Q1msd/+DgiOBOgjGKmjVRApVldeHZmtxPvN
U9macc97wWwxLkUFDdhXrB7mfLKkIHBaAhRHOOHLhciDeDMLMrfOZQCHCMECRhdW
PxtxTvVOVItLzIEje83DZiIW3rb7m0L4kopsIzUgRuy/IaTjFAJ8r213oejuyQ0P
UrcvVkiOruPoBMCgcc2mE0/fDxHcAGq1NtiOSvZ+uHjzUpxg3lx7ja9Tf77cqUXT
/YOBzh1dGv93z3ORsnUlSkFuj+94mHGkKXKjBZHk0boZjl8qMGy9aa6yVP+UCIjA
DHWiLXh3wPd+79y7XxpKWZFWwMgNzx0Jg39zN4kayXN+EJnZtQ+9dF/j6mBG+B3o
pkcVP9FFRpBZ7WBY3NeoSC103e3udoG51NL9xK3hzY0FLDe66zIMU1rjzuf05+od
aFTQvuE4Nt6TdmHoagdKJXf760rsM1EhL4meb0sH+3RmXE8xsAZ0H4EmgmzZE7VI
lfM21spzt5WAOTvvpkDhQyLg4d7DHKP4oC0wNnwKu6gI1pp0gux8QRBLpoHMDXv9
2KYXoRTSnOmf2kvPM7yD
=Yevx
-----END PGP SIGNATURE-----

--XEJTss4roU6Y3QL2axdvtDTmkNagag4E5--

