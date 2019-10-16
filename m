Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC64D86CC
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 05:35:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tHxf2L4TzDqgL
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 14:35:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tHwj24rqzDqW0
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 14:34:43 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 20:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,302,1566889200"; d="scan'208";a="186028432"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.197.24])
 by orsmga007.jf.intel.com with ESMTP; 15 Oct 2019 20:34:39 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Vijay Khemka'" <vijaykhemka@fb.com>, "'Andrew Jeffery'" <andrew@aj.id.au>
References: <81DE4370-D135-48EE-A8FC-B079C4CE3648@fb.com>
 <06d793dc-a0f0-4917-a0c7-135767f6c19b@www.fastmail.com>
 <11B7B23D-B689-4B0B-A177-E6E4891C923A@fb.com>
In-Reply-To: <11B7B23D-B689-4B0B-A177-E6E4891C923A@fb.com>
Subject: RE: speed-bmc-misc driver
Date: Wed, 16 Oct 2019 11:34:38 +0800
Message-ID: <000001d583d2$a4456600$ecd03200$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHbLn/aQ8+vUJFQNzvkjLjSVrJqjQJ7qmruAdOhLeanLs0rQA==
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTIzYmQyZTItZGQzZC00MTk0LWJjYjktZmU1ZTA0ZGE3MjI0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiXC9lSXVtR21vbXBzS3NkaWJOXC9ZUkdPZlNoQ3NEdk5ub1FcL2RsYWJwNnFPSzYzMEUzOWZLdWUyMjRuREpxVmw1XC8ifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: request-justification,no-action
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
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Regarding this bmc-misc driver, I noticed the exported sysfs entries are =
read-write. Is it possible to export the register value as read-only? =
Sometimes we only want to display the registers, but users cannot change =
them.

Thanks,
Yong

-----Original Message-----
From: openbmc =
<openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org> On Behalf =
Of Vijay Khemka
Sent: Thursday, October 10, 2019 9:17 AM
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: speed-bmc-misc driver

Hi Andrew,
Thanks for detailed explanation.

Regards
-Vijay


=EF=BB=BFOn 10/9/19, 3:46 PM, "Andrew Jeffery" <andrew@aj.id.au> wrote:

    Hi Vijay,
   =20
    On Thu, 10 Oct 2019, at 04:17, Vijay Khemka wrote:
    > =20
    > Hi Andrew,
    >=20
    > I saw this driver in LF aspeed Linux=20
   =20
    What do you mean by "LF aspeed Linux"? The only place this driver =
lives is
    in the OpenBMC kernel tree (openbmc/linux on github).
   =20
    > and was wondering how to use. Can=20
    > you please suggest some usage example like device tree entry as =
well as=20
    > sysfs interface.
   =20
    Honestly, I wouldn't recommend using (yet). It can't be upstreamed =
in its
    current form (I've tried), and so using it as is comes with =
userspace-breaking
    changes in the future. I reserve the right to break your machines if =
you do
    make use of it when I get the time to rework the patches.
   =20
    Having said that, its purpose is to expose arbitrary fields in =
arbitrary registers
    on the BMC to userspace via sysfs. This is useful when the field's =
value is
    entirely determined by userspace policy and there's no need for =
additional
    kernel infrastructure around the configuration.
   =20
    Originally this was intended to expose to userspace the bits that =
control the
    state of the ASPEED hardware backdoors, but we changed tack on the
    solution to CVE-2019-6260 before the bmc-misc idea got very far.
   =20
    However you can find some slightly abusive uses if you search the =
dtsis:
   =20
    =
https://github.com/openbmc/linux/blob/dev-5.3/arch/arm/boot/dts/aspeed-g5=
.dtsi#L1682
   =20
    In that instance we're exposing the SuperIO scratch registers to =
userspace
    using this mechanism. The attributes can be found in sysfs =
associated with
    the devicetree node. I did have a hack to add a sysfs class for =
them, but that
    was even more controversial than the general concept of the "driver" =
so
    you're going to have to cope with changes to the devicetree =
potentially
    breaking userspace unless you're willing to rework the patches =
yourself.
   =20
    Hope that helps.
   =20
    Andrew
   =20


