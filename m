Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E2107091
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 12:23:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KDZS378XzDrHg
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 22:23:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="f/aAnJKl"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KDWc5WV3zDqDB
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 22:20:59 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id AB8C3438D1;
 Fri, 22 Nov 2019 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1574421653; x=
 1576236054; bh=3gUt5ZOArgE7fEwaMIpu8mdy7ZpWpd91I82ErwTBaVw=; b=f
 /aAnJKlouYQVCc2jMv5FTCKxeGf3IZvDA17BWJXJ3hC5Yz0ZwKXovSeCzv6bPWLt
 kN14verthSqPOVUReVdk6mC7Z9RvJYup6lcaadf7JnPvAGZ8HKxdNlIfRjJTww7d
 NCM99416f2+uxeJ2uoTckChBCnti0YyJP+Fug9Qr/g=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCSj9EerwBC7; Fri, 22 Nov 2019 14:20:53 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1ACFF43130;
 Fri, 22 Nov 2019 14:20:53 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 22
 Nov 2019 14:20:52 +0300
Subject: Re: How to build for s2600wf ? Does it work at all?
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 <openbmc@lists.ozlabs.org>
References: <29e500ed-2f4c-5e44-02fc-80b44e1c6623@yadro.com>
 <4844180beece41d08af0206779f6286d@SCL-EXCHMB-13.phoenix.com>
 <22d986a3-8525-b30c-2db3-5c63e55a1abe@yadro.com>
 <bc283b6a-fb40-2980-faed-aed0bb717458@linux.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <01237467-fde3-1b5c-f2e9-ecd935e6ffde@yadro.com>
Date: Fri, 22 Nov 2019 14:20:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bc283b6a-fb40-2980-faed-aed0bb717458@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3Mjucd3QOu22gnAfd5XyEsxNd7SGfbZfo"
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

--3Mjucd3QOu22gnAfd5XyEsxNd7SGfbZfo
Content-Type: multipart/mixed; boundary="bjmgIcCUeeSMkNkHm9zuZiHoU0AWBegFv";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
Message-ID: <01237467-fde3-1b5c-f2e9-ecd935e6ffde@yadro.com>
Subject: Re: How to build for s2600wf ? Does it work at all?
References: <29e500ed-2f4c-5e44-02fc-80b44e1c6623@yadro.com>
 <4844180beece41d08af0206779f6286d@SCL-EXCHMB-13.phoenix.com>
 <22d986a3-8525-b30c-2db3-5c63e55a1abe@yadro.com>
 <bc283b6a-fb40-2980-faed-aed0bb717458@linux.intel.com>
In-Reply-To: <bc283b6a-fb40-2980-faed-aed0bb717458@linux.intel.com>

--bjmgIcCUeeSMkNkHm9zuZiHoU0AWBegFv
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

21.11.2019 20:32, Bills, Jason M wrote:
>
>
> Hi Alexander,
>
> On 11/21/2019 1:58 AM, Alexander Amelkin wrote:
>> Thank you Bruce!
>>
>> Unfortunately, this procedure results in as non-functional an image as=
 the
>> default openbmc build procedure does.
>>
>> The boot log is cleaner, but the final result is the same: no way to c=
ontrol
>> power, and a crashing network driver:
>>
>> --------------------------------------------------
>>
>> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 wol=
fpass
>> ttyS4
>>
>> wolfpass login: [=C2=A0 107.121476] ------------[ cut here ]----------=
--
>> [=C2=A0 107.126171] WARNING: CPU: 0 PID: 1635 at net/sched/sch_generic=
=2Ec:461
>> dev_watchdog+0x230/0x24c
>> [=C2=A0 107.134834] NETDEV WATCHDOG: eth1 (ftgmac100): transmit queue =
0 timed out
>> [=C2=A0 107.141718] CPU: 0 PID: 1635 Comm: swampd Not tainted
>> 4.19.29-9bd1e03005e74ecfe16f58143714f25793ae1c5d #1
>> [=C2=A0 107.151284] Hardware name: Generic DT based system
>> [=C2=A0 107.156157] Backtrace:
>> [=C2=A0 107.158675] [<80107ddc>] (dump_backtrace) from [<80108010>]
>> (show_stack+0x20/0x24)
>> [=C2=A0 107.166341]=C2=A0 r7:80594a00 r6:00000009 r5:00000000 r4:9e1c3=
e1c
>> [=C2=A0 107.172124] [<80107ff0>] (show_stack) from [<80682b2c>]
>> (dump_stack+0x20/0x28)
>> [=C2=A0 107.179376] [<80682b0c>] (dump_stack) from [<801163f0>]
>> (__warn.part.3+0xb4/0xdc)
>> [=C2=A0 107.186972] [<8011633c>] (__warn.part.3) from [<80116484>]
>> (warn_slowpath_fmt+0x6c/0x90)
>> [=C2=A0 107.195160]=C2=A0 r6:000001cd r5:80843dac r4:80a03008
>> [=C2=A0 107.199818] [<8011641c>] (warn_slowpath_fmt) from [<80594a00>]=

>> (dev_watchdog+0x230/0x24c)
>> [=C2=A0 107.208081]=C2=A0 r3:9e63a800 r2:80843d70
>> [=C2=A0 107.211741]=C2=A0 r7:80a12b60 r6:9e63a800 r5:00000000 r4:9e63a=
a2c
>> [=C2=A0 107.217493] [<805947d0>] (dev_watchdog) from [<801572b8>]
>> (call_timer_fn+0x3c/0x120)
>> [=C2=A0 107.225357]=C2=A0 r7:805947d0 r6:00000100 r5:9e63aa2c r4:9e63a=
a2c
>> [=C2=A0 107.231047] [<8015727c>] (call_timer_fn) from [<80157448>]
>> (expire_timers+0xac/0xb8)
>> [=C2=A0 107.238886]=C2=A0 r7:00000000 r6:9e1c3ecc r5:9e1c3ecc r4:9e63a=
a2c
>> [=C2=A0 107.244652] [<8015739c>] (expire_timers) from [<801574f0>]
>> (run_timer_softirq+0x9c/0x190)
>> [=C2=A0 107.252914]=C2=A0 r9:80a03008 r8:80a12b60 r7:80a13860 r6:80a13=
860 r5:9e1c3ecc
>> r4:9e1c3ecc
>> [=C2=A0 107.260678] [<80157454>] (run_timer_softirq) from [<8010224c>]=

>> (__do_softirq+0xdc/0x2f8)
>> [=C2=A0 107.268856]=C2=A0 r9:00000100 r8:9d047a00 r7:ffffe000 r6:80a67=
4b0 r5:00000002
>> r4:00000001
>> [=C2=A0 107.276708] [<80102170>] (__do_softirq) from [<8011a490>]
>> (irq_exit+0xfc/0x110)
>> [=C2=A0 107.284118]=C2=A0 r10:76f0d2b0 r9:7e80fbf4 r8:9d047a00 r7:0000=
0000 r6:00000001
>> r5:80a46ed4
>> [=C2=A0 107.292017]=C2=A0 r4:00000000
>> [=C2=A0 107.294599] [<8011a394>] (irq_exit) from [<8014b20c>]
>> (__handle_domain_irq+0x60/0xb8)
>> [=C2=A0 107.302535] [<8014b1ac>] (__handle_domain_irq) from [<80102164=
>]
>> (avic_handle_irq+0x68/0x70)
>> [=C2=A0 107.310990]=C2=A0 r9:7e80fbf4 r8:00c5387d r7:00c5387d r6:fffff=
fff r5:9e1c3fb0
>> r4:9d002620
>> [=C2=A0 107.318834] [<801020fc>] (avic_handle_irq) from [<80101db4>]
>> (__irq_usr+0x54/0x80)
>> [=C2=A0 107.326493] Exception stack(0x9e1c3fb0 to 0x9e1c3ff8)
>> [=C2=A0 107.331627] 3fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 00000062 76f0d2b0
>> 7e80fbf4 415f4e60
>> [=C2=A0 107.339865] 3fc0: 6c3f6059 00000000 000001e0 41704b28 415f4e59=
 7e80fbf4
>> 76f0d2b0 76f0d2b0
>> [=C2=A0 107.348141] 3fe0: 415de108 7e80fb00 410fc214 410fa370 20000010=
 ffffffff
>> [=C2=A0 107.354863]=C2=A0 r5:20000010 r4:410fa370
>> [=C2=A0 107.358459] ---[ end trace 6fd5e4a9b4660326 ]---
>>
> This is an issue we were seeing for a while, but I think we have it res=
olved.=C2=A0
> I'm working on another update that will hopefully resolve this one.

Thanks! We'll be waiting for it!


>
>> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 wol=
fpass
>> ttyS4
>>
>> wolfpass login: root
>> Password:
>> root@wolfpass:~#
>> root@wolfpass:~# power-control
>> terminate called after throwing an instance of
>> 'sdbusplus::exception::SdBusError'
>> =C2=A0=C2=A0 what():=C2=A0 sd_bus_request_name: org.freedesktop.DBus.E=
rror.FileExists: File
>> exists
>> Aborted
> Power control should already be running as a systemd service, so this e=
rror is
> expected when trying to start the service again.
>
> To use power control, you can use ipmitool power commands from the BMC =
command
> line:
> ipmitool power status
> ipmitool power on
> ipmitool power off
> etc.

Thank you so much!

Funny, I didn't even think about using ipmitool internally from openbmc. =
Got
used to obmutil.

It really does work.

Thanks again!

Alexander Amelkin,
https://yadro.com



--bjmgIcCUeeSMkNkHm9zuZiHoU0AWBegFv--

--3Mjucd3QOu22gnAfd5XyEsxNd7SGfbZfo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJd18SUAAoJEOiTWHtbdBeNif8P/3kTawPYVxgBI+vSID9rOYFS
wkypl7ZVGku7QxJZTJAkt7aaX6MU5HEMrI4LWNOGi8pkmFJWxmAQNbO6+94SuE06
4xPE1Y4uQAo9IyBVXLoiyFA8mHzM4ctbtThgSvyGiNRyShaKTUEzyOHAN39sosrb
lNsJYatlLhCoGUNW5p65Gh8vx8sv8EbhghDlPye1V9At5IvmQA4FOeIdWq9BQ3WB
xfyKzDY7VhEBYSLFQr7m6fZNShlldruZduNYt8PQBXtg6Q/B5VUPnfX0D6LtuwFl
Js9SmfW2Nk7aKwdGa0YHuuL2o6k0ea8mAugvqEOhRST4cq5DNH4LRQT/rniRMTYG
5NaiY6iEnVY3dJWZIBsciWeLaiVJ6erlIcPu2+TY89Ia24WrAruaWLMCH0T7robw
uZdyGQBxIaNT3abUPrRxKPZn7e6C9p25DbVCQXc5g1TWBU5ErBEGT5NOBStiTGla
V3hmGptEPzoJxMbT5T0OAOJPe06WuxP0DriNk65CUnIs+ufpf+2HJM6GAVjW1KDO
fMxXYfQlIZgOWglwCBQb2lIWf/aot8oubzGDwa4txsYNNh9cES1KUNXCs12xPPCL
lHMwnLVbJRqaJKGxrEOo1e30HipLPAr9WC4hHODQmtR7SjDPwfNA0RmX73Njj28o
ogUvBeP30d7LZ4hdrhbb
=JUxV
-----END PGP SIGNATURE-----

--3Mjucd3QOu22gnAfd5XyEsxNd7SGfbZfo--
