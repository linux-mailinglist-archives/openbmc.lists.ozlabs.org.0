Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA75B104FE0
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 11:01:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JZpH2C4NzDr5s
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 21:01:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="toY5Sm8R"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JZkm4HHZzDr4L
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 20:58:24 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A30A2437F6;
 Thu, 21 Nov 2019 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1574330297; x=
 1576144698; bh=JUTcU7vOPCJnfwu8KsriZtUi6XsgI/ExWb9jFOorcDo=; b=t
 oY5Sm8R1cCyPVGgPMUo2y7wdN9adRnw6gQBXXJuNXmXMsMiB6bIy7GOlPLdGO4CL
 WFO1cQf+zhw7IakbpW5RwZjv2ZVjgnmN0YX0Ta2VLpgHknLlgiyIg/Vvwc+F0uHk
 5WZ83JcedHGdfrL5lY7GnIiwQvAUR+t/E8J14k4BVw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IgWGMFBUVHMO; Thu, 21 Nov 2019 12:58:17 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5859842004;
 Thu, 21 Nov 2019 12:58:13 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 21
 Nov 2019 12:58:13 +0300
Subject: Re: How to build for s2600wf ? Does it work at all?
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
References: <29e500ed-2f4c-5e44-02fc-80b44e1c6623@yadro.com>
 <4844180beece41d08af0206779f6286d@SCL-EXCHMB-13.phoenix.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <22d986a3-8525-b30c-2db3-5c63e55a1abe@yadro.com>
Date: Thu, 21 Nov 2019 12:58:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4844180beece41d08af0206779f6286d@SCL-EXCHMB-13.phoenix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hS6tOQaBbYJz4iT7cIFNHvQUFMqKczUtO"
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

--hS6tOQaBbYJz4iT7cIFNHvQUFMqKczUtO
Content-Type: multipart/mixed; boundary="qmjouldoPOuulDW2IsVhAFpCldLhAYNX7";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <22d986a3-8525-b30c-2db3-5c63e55a1abe@yadro.com>
Subject: Re: How to build for s2600wf ? Does it work at all?
References: <29e500ed-2f4c-5e44-02fc-80b44e1c6623@yadro.com>
 <4844180beece41d08af0206779f6286d@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <4844180beece41d08af0206779f6286d@SCL-EXCHMB-13.phoenix.com>

--qmjouldoPOuulDW2IsVhAFpCldLhAYNX7
Content-Type: multipart/alternative;
 boundary="------------69D0367B36B852EC46315590"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------69D0367B36B852EC46315590
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you Bruce!

Unfortunately, this procedure results in as non-functional an image as th=
e
default openbmc build procedure does.

The boot log is cleaner, but the final result is the same: no way to cont=
rol
power, and a crashing network driver:

--------------------------------------------------

Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 wolfpa=
ss ttyS4

wolfpass login: [=C2=A0 107.121476] ------------[ cut here ]------------
[=C2=A0 107.126171] WARNING: CPU: 0 PID: 1635 at net/sched/sch_generic.c:=
461
dev_watchdog+0x230/0x24c
[=C2=A0 107.134834] NETDEV WATCHDOG: eth1 (ftgmac100): transmit queue 0 t=
imed out
[=C2=A0 107.141718] CPU: 0 PID: 1635 Comm: swampd Not tainted
4.19.29-9bd1e03005e74ecfe16f58143714f25793ae1c5d #1
[=C2=A0 107.151284] Hardware name: Generic DT based system
[=C2=A0 107.156157] Backtrace:
[=C2=A0 107.158675] [<80107ddc>] (dump_backtrace) from [<80108010>]
(show_stack+0x20/0x24)
[=C2=A0 107.166341]=C2=A0 r7:80594a00 r6:00000009 r5:00000000 r4:9e1c3e1c=

[=C2=A0 107.172124] [<80107ff0>] (show_stack) from [<80682b2c>] (dump_sta=
ck+0x20/0x28)
[=C2=A0 107.179376] [<80682b0c>] (dump_stack) from [<801163f0>] (__warn.p=
art.3+0xb4/0xdc)
[=C2=A0 107.186972] [<8011633c>] (__warn.part.3) from [<80116484>]
(warn_slowpath_fmt+0x6c/0x90)
[=C2=A0 107.195160]=C2=A0 r6:000001cd r5:80843dac r4:80a03008
[=C2=A0 107.199818] [<8011641c>] (warn_slowpath_fmt) from [<80594a00>]
(dev_watchdog+0x230/0x24c)
[=C2=A0 107.208081]=C2=A0 r3:9e63a800 r2:80843d70
[=C2=A0 107.211741]=C2=A0 r7:80a12b60 r6:9e63a800 r5:00000000 r4:9e63aa2c=

[=C2=A0 107.217493] [<805947d0>] (dev_watchdog) from [<801572b8>]
(call_timer_fn+0x3c/0x120)
[=C2=A0 107.225357]=C2=A0 r7:805947d0 r6:00000100 r5:9e63aa2c r4:9e63aa2c=

[=C2=A0 107.231047] [<8015727c>] (call_timer_fn) from [<80157448>]
(expire_timers+0xac/0xb8)
[=C2=A0 107.238886]=C2=A0 r7:00000000 r6:9e1c3ecc r5:9e1c3ecc r4:9e63aa2c=

[=C2=A0 107.244652] [<8015739c>] (expire_timers) from [<801574f0>]
(run_timer_softirq+0x9c/0x190)
[=C2=A0 107.252914]=C2=A0 r9:80a03008 r8:80a12b60 r7:80a13860 r6:80a13860=
 r5:9e1c3ecc
r4:9e1c3ecc
[=C2=A0 107.260678] [<80157454>] (run_timer_softirq) from [<8010224c>]
(__do_softirq+0xdc/0x2f8)
[=C2=A0 107.268856]=C2=A0 r9:00000100 r8:9d047a00 r7:ffffe000 r6:80a674b0=
 r5:00000002
r4:00000001
[=C2=A0 107.276708] [<80102170>] (__do_softirq) from [<8011a490>] (irq_ex=
it+0xfc/0x110)
[=C2=A0 107.284118]=C2=A0 r10:76f0d2b0 r9:7e80fbf4 r8:9d047a00 r7:0000000=
0 r6:00000001
r5:80a46ed4
[=C2=A0 107.292017]=C2=A0 r4:00000000
[=C2=A0 107.294599] [<8011a394>] (irq_exit) from [<8014b20c>]
(__handle_domain_irq+0x60/0xb8)
[=C2=A0 107.302535] [<8014b1ac>] (__handle_domain_irq) from [<80102164>]
(avic_handle_irq+0x68/0x70)
[=C2=A0 107.310990]=C2=A0 r9:7e80fbf4 r8:00c5387d r7:00c5387d r6:ffffffff=
 r5:9e1c3fb0
r4:9d002620
[=C2=A0 107.318834] [<801020fc>] (avic_handle_irq) from [<80101db4>]
(__irq_usr+0x54/0x80)
[=C2=A0 107.326493] Exception stack(0x9e1c3fb0 to 0x9e1c3ff8)
[=C2=A0 107.331627] 3fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 00000062 76f0d2b0
7e80fbf4 415f4e60
[=C2=A0 107.339865] 3fc0: 6c3f6059 00000000 000001e0 41704b28 415f4e59 7e=
80fbf4
76f0d2b0 76f0d2b0
[=C2=A0 107.348141] 3fe0: 415de108 7e80fb00 410fc214 410fa370 20000010 ff=
ffffff
[=C2=A0 107.354863]=C2=A0 r5:20000010 r4:410fa370
[=C2=A0 107.358459] ---[ end trace 6fd5e4a9b4660326 ]---

Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 wolfpa=
ss ttyS4

wolfpass login: root
Password:
root@wolfpass:~#
root@wolfpass:~# power-control
terminate called after throwing an instance of 'sdbusplus::exception::SdB=
usError'
=C2=A0 what():=C2=A0 sd_bus_request_name: org.freedesktop.DBus.Error.File=
Exists: File exists
Aborted
root@wolfpass:~# obmcutil
-sh: obmcutil: command not found
root@wolfpass:~#

--------------------------------------------------

Any suggestions?

With best regards,
Alexander Amelkin,

19.11.2019 19:22, Bruce Mitchell wrote:
>
> https://github.com/Intel-BMC/openbmc#how-to-build-for-wolf-pass
>
> =C2=A0
>
> =C2=A0
>
> *From:*openbmc
> [mailto:openbmc-bounces+bruce_mitchell=3Dphoenix.com@lists.ozlabs.org] =
*On
> Behalf Of *Alexander Amelkin
> *Sent:* Tuesday, November 19, 2019 08:07
> *To:* openbmc@lists.ozlabs.org
> *Subject:* How to build for s2600wf ? Does it work at all?
>
> =C2=A0
>
> Hi all!
>
> We can't get OpenBMC to work with s2600wf.
>
> We tried openbmc/openbmc/master branch and got errors log from booted O=
penBMC
> (attached) regarding unavailability of power control, and also a netdev=
 watchdog
> timeout and a kernel crash.
>
> We tried Intel-BMC/master branch and got build errors, failed to build.=

>
> We tried Intel-BMC/clean_builds branch and ended up with an almost clea=
n boot
> log, but no 'obmcutil' and no apparent way to start the host. The netde=
v
> watchdog also crashed.
>
> Is there any instruction on how to properly build OpenBMC for s2600wf? =
Is it
> actually supported at all?
>
> Thank you.
>
> --=20
> With best regards,
> Alexander Amelkin
>
> =C2=A0
>

--------------69D0367B36B852EC46315590
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Thank you Bruce!</p>
    <p>Unfortunately, this procedure results in as non-functional an
      image as the default openbmc build procedure does.</p>
    <p>The boot log is cleaner, but the final result is the same: no way
      to control power, and a crashing network driver:<br>
    </p>
    <p>--------------------------------------------------</p>
    <p>Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
      0.1.0 wolfpass ttyS4<br>
      <br>
      wolfpass login: [=C2=A0 107.121476] ------------[ cut here
      ]------------<br>
      [=C2=A0 107.126171] WARNING: CPU: 0 PID: 1635 at
      net/sched/sch_generic.c:461 dev_watchdog+0x230/0x24c<br>
      [=C2=A0 107.134834] NETDEV WATCHDOG: eth1 (ftgmac100): transmit que=
ue 0
      timed out<br>
      [=C2=A0 107.141718] CPU: 0 PID: 1635 Comm: swampd Not tainted
      4.19.29-9bd1e03005e74ecfe16f58143714f25793ae1c5d #1<br>
      [=C2=A0 107.151284] Hardware name: Generic DT based system<br>
      [=C2=A0 107.156157] Backtrace: <br>
      [=C2=A0 107.158675] [&lt;80107ddc&gt;] (dump_backtrace) from
      [&lt;80108010&gt;] (show_stack+0x20/0x24)<br>
      [=C2=A0 107.166341]=C2=A0 r7:80594a00 r6:00000009 r5:00000000 r4:9e=
1c3e1c<br>
      [=C2=A0 107.172124] [&lt;80107ff0&gt;] (show_stack) from
      [&lt;80682b2c&gt;] (dump_stack+0x20/0x28)<br>
      [=C2=A0 107.179376] [&lt;80682b0c&gt;] (dump_stack) from
      [&lt;801163f0&gt;] (__warn.part.3+0xb4/0xdc)<br>
      [=C2=A0 107.186972] [&lt;8011633c&gt;] (__warn.part.3) from
      [&lt;80116484&gt;] (warn_slowpath_fmt+0x6c/0x90)<br>
      [=C2=A0 107.195160]=C2=A0 r6:000001cd r5:80843dac r4:80a03008<br>
      [=C2=A0 107.199818] [&lt;8011641c&gt;] (warn_slowpath_fmt) from
      [&lt;80594a00&gt;] (dev_watchdog+0x230/0x24c)<br>
      [=C2=A0 107.208081]=C2=A0 r3:9e63a800 r2:80843d70<br>
      [=C2=A0 107.211741]=C2=A0 r7:80a12b60 r6:9e63a800 r5:00000000 r4:9e=
63aa2c<br>
      [=C2=A0 107.217493] [&lt;805947d0&gt;] (dev_watchdog) from
      [&lt;801572b8&gt;] (call_timer_fn+0x3c/0x120)<br>
      [=C2=A0 107.225357]=C2=A0 r7:805947d0 r6:00000100 r5:9e63aa2c r4:9e=
63aa2c<br>
      [=C2=A0 107.231047] [&lt;8015727c&gt;] (call_timer_fn) from
      [&lt;80157448&gt;] (expire_timers+0xac/0xb8)<br>
      [=C2=A0 107.238886]=C2=A0 r7:00000000 r6:9e1c3ecc r5:9e1c3ecc r4:9e=
63aa2c<br>
      [=C2=A0 107.244652] [&lt;8015739c&gt;] (expire_timers) from
      [&lt;801574f0&gt;] (run_timer_softirq+0x9c/0x190)<br>
      [=C2=A0 107.252914]=C2=A0 r9:80a03008 r8:80a12b60 r7:80a13860 r6:80=
a13860
      r5:9e1c3ecc r4:9e1c3ecc<br>
      [=C2=A0 107.260678] [&lt;80157454&gt;] (run_timer_softirq) from
      [&lt;8010224c&gt;] (__do_softirq+0xdc/0x2f8)<br>
      [=C2=A0 107.268856]=C2=A0 r9:00000100 r8:9d047a00 r7:ffffe000 r6:80=
a674b0
      r5:00000002 r4:00000001<br>
      [=C2=A0 107.276708] [&lt;80102170&gt;] (__do_softirq) from
      [&lt;8011a490&gt;] (irq_exit+0xfc/0x110)<br>
      [=C2=A0 107.284118]=C2=A0 r10:76f0d2b0 r9:7e80fbf4 r8:9d047a00 r7:0=
0000000
      r6:00000001 r5:80a46ed4<br>
      [=C2=A0 107.292017]=C2=A0 r4:00000000<br>
      [=C2=A0 107.294599] [&lt;8011a394&gt;] (irq_exit) from
      [&lt;8014b20c&gt;] (__handle_domain_irq+0x60/0xb8)<br>
      [=C2=A0 107.302535] [&lt;8014b1ac&gt;] (__handle_domain_irq) from
      [&lt;80102164&gt;] (avic_handle_irq+0x68/0x70)<br>
      [=C2=A0 107.310990]=C2=A0 r9:7e80fbf4 r8:00c5387d r7:00c5387d r6:ff=
ffffff
      r5:9e1c3fb0 r4:9d002620<br>
      [=C2=A0 107.318834] [&lt;801020fc&gt;] (avic_handle_irq) from
      [&lt;80101db4&gt;] (__irq_usr+0x54/0x80)<br>
      [=C2=A0 107.326493] Exception stack(0x9e1c3fb0 to 0x9e1c3ff8)<br>
      [=C2=A0 107.331627] 3fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 00000062
      76f0d2b0 7e80fbf4 415f4e60<br>
      [=C2=A0 107.339865] 3fc0: 6c3f6059 00000000 000001e0 41704b28 415f4=
e59
      7e80fbf4 76f0d2b0 76f0d2b0<br>
      [=C2=A0 107.348141] 3fe0: 415de108 7e80fb00 410fc214 410fa370 20000=
010
      ffffffff<br>
      [=C2=A0 107.354863]=C2=A0 r5:20000010 r4:410fa370<br>
      [=C2=A0 107.358459] ---[ end trace 6fd5e4a9b4660326 ]---<br>
      <br>
      Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0
      wolfpass ttyS4<br>
      <br>
      wolfpass login: root<br>
      Password: <br>
      root@wolfpass:~# <br>
      root@wolfpass:~# power-control <br>
      terminate called after throwing an instance of
      'sdbusplus::exception::SdBusError'<br>
      =C2=A0 what():=C2=A0 sd_bus_request_name:
      org.freedesktop.DBus.Error.FileExists: File exists<br>
      Aborted<br>
      root@wolfpass:~# obmcutil<br>
      -sh: obmcutil: command not found<br>
      root@wolfpass:~# <br>
    </p>
    <p>--------------------------------------------------</p>
    <p>Any suggestions?<br>
    </p>
    <pre class=3D"moz-signature" cols=3D"80">With best regards,
Alexander Amelkin,
</pre>
    <div class=3D"moz-cite-prefix">19.11.2019 19:22, Bruce Mitchell wrote=
:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:4844180beece41d08af0206779f6286d@SCL-EXCHMB-13.phoenix.=
com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
=2EMsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span
style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-seri=
f&quot;;color:#1F497D"><a
href=3D"https://github.com/Intel-BMC/openbmc#how-to-build-for-wolf-pass"
              moz-do-not-send=3D"true">https://github.com/Intel-BMC/openb=
mc#how-to-build-for-wolf-pass</a><o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span
style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-seri=
f&quot;;color:#1F497D"><o:p>=C2=A0</o:p></span></p>
        <p class=3D"MsoNormal"><a name=3D"_MailEndCompose"
            moz-do-not-send=3D"true"><span
style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-seri=
f&quot;;color:#1F497D"><o:p>=C2=A0</o:p></span></a></p>
        <div style=3D"border:none;border-left:solid blue 1.5pt;padding:0i=
n
          0in 0in 4.0pt">
          <div>
            <div style=3D"border:none;border-top:solid #B5C4DF
              1.0pt;padding:3.0pt 0in 0in 0in">
              <p class=3D"MsoNormal"><b><span
style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif=
&quot;">From:</span></b><span
style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif=
&quot;">
                  openbmc
                  [<a class=3D"moz-txt-link-freetext" href=3D"mailto:open=
bmc-bounces+bruce_mitchell=3Dphoenix.com@lists.ozlabs.org">mailto:openbmc=
-bounces+bruce_mitchell=3Dphoenix.com@lists.ozlabs.org</a>]
                  <b>On Behalf Of </b>Alexander Amelkin<br>
                  <b>Sent:</b> Tuesday, November 19, 2019 08:07<br>
                  <b>To:</b> <a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>
                  <b>Subject:</b> How to build for s2600wf ? Does it
                  work at all?<o:p></o:p></span></p>
            </div>
          </div>
          <p class=3D"MsoNormal"><o:p>=C2=A0</o:p></p>
          <p><span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">Hi
              all!</span> <o:p></o:p></p>
          <p><span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">We
              can't get OpenBMC to work with s2600wf.</span> <o:p></o:p><=
/p>
          <p><span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">We
              tried openbmc/openbmc/master branch and got errors log
              from booted OpenBMC</span> <br>
            <span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">(attached)
              regarding unavailability of power control, and also a
              netdev watchdog</span> <br>
            <span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">timeout
              and a kernel crash.</span> <o:p></o:p></p>
          <p><span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">We
              tried Intel-BMC/master branch and got build errors, failed
              to build.</span> <o:p></o:p></p>
          <p><span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">We
              tried Intel-BMC/clean_builds branch and ended up with an
              almost clean boot</span> <br>
            <span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">log,
              but no 'obmcutil' and no apparent way to start the host.
              The netdev</span> <br>
            <span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">watchdog
              also crashed.</span> <o:p></o:p></p>
          <p><span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">Is
              there any instruction on how to properly build OpenBMC for
              s2600wf? Is it</span> <br>
            <span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">actually
              supported at all?</span> <o:p></o:p></p>
          <p><span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">Thank
              you.</span> <o:p></o:p></p>
          <p><span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">--
            </span><br>
            <span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">With
              best regards,</span> <br>
            <span
              style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;">Alexander
              Amelkin</span> <o:p></o:p></p>
          <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>=C2=A0=
</o:p></p>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------69D0367B36B852EC46315590--

--qmjouldoPOuulDW2IsVhAFpCldLhAYNX7--

--hS6tOQaBbYJz4iT7cIFNHvQUFMqKczUtO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJd1l+0AAoJEOiTWHtbdBeNM/IP/1OGnIoDinVfoC/kbw6J9a6I
ZCFFqr5NywWa658dSscy6VCOG4br6mPgx/5lTZo5En4Dq4yR6SnFdGwj2eL7iTep
kcY6TwvgPd63k66Am0y+IsDhhmP7ysjjN0YSyPqzWw1H3Kx6gDG7+/bwYZUc5rtL
cdiNI0f4rilNiZjRz/v5b7pAEYwbq8NfO3RN3Me14bnN/wjsOZlz2VIre4Gd9dUC
ZEcLb0aZk8lIF4r8L7PQlmdGhgHG661nvse3GixunHif1bgls9VDV9hmuVU9pPQz
3IdD3Iy16vruBjkW1+0IklPrlK2IUahvjbdGEdGyoK29XMIHb1Z+iuztyBxEoUzo
fU8GDiIiZZJX0XNGnpS2Ekr7oxMTsWdnZMA5XVpyS4upKYMLBwOiSMja194Bxh3g
Khywl7XPUucqF3EY5ao9gwcplpwi6GacDsD76wvrCBqS6e6dVy9jaOT7DSg8CiNP
0mi6suLGTrWR3t7kh9lFiekjMeIURMeahsHOmWap3XjvMOCZzol3/mmKyC11n2am
Z2benHV+leiIbcJNKBVTAQ07DQnjxhT3KpmOJA8T8/hF0o+XX5/QxHnmDB6g39fO
VVBT2ifHRdQDGElcXb6TL/72eMto7K1O69y+M6dNZr108JNeSOkNn/mPEyMHCzAL
Sz4k28LFRbvAL6WXnvPV
=nTf3
-----END PGP SIGNATURE-----

--hS6tOQaBbYJz4iT7cIFNHvQUFMqKczUtO--
