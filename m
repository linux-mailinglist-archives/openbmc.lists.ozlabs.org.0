Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B31320849
	for <lists+openbmc@lfdr.de>; Sun, 21 Feb 2021 05:57:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DjtN620N9z3cKW
	for <lists+openbmc@lfdr.de>; Sun, 21 Feb 2021 15:57:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nokia-sbell.com (client-ip=116.246.26.71;
 helo=cnshjsmin03.nokia-sbell.com; envelope-from=jie.n.li@nokia-sbell.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 902 seconds by postgrey-1.36 at boromir;
 Sun, 21 Feb 2021 15:57:16 AEDT
Received: from CNSHJSMIN03.NOKIA-SBELL.COM (cnshjsmin03.nokia-sbell.com
 [116.246.26.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DjtMw6qq4z30LH
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2021 15:57:15 +1100 (AEDT)
X-AuditID: ac189297-667ff700000022b5-1d-6031e49c8896
Received: from CNSHPPEXCH1609.nsn-intra.net (Unknown_Domain [135.251.51.109])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by CNSHJSMIN03.NOKIA-SBELL.COM (Symantec Messaging Gateway) with SMTP id
 8E.21.08885.C94E1306; Sun, 21 Feb 2021 12:42:04 +0800 (HKT)
Received: from CNSHPPEXCH1601.nsn-intra.net (135.251.51.101) by
 CNSHPPEXCH1609.nsn-intra.net (135.251.51.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 21 Feb 2021 12:42:03 +0800
Received: from CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) by
 CNSHPPEXCH1601.nsn-intra.net ([135.251.51.101]) with mapi id 15.01.2106.006;
 Sun, 21 Feb 2021 12:42:03 +0800
From: "Li, Jie N. (NSB - CN/Shanghai)" <jie.n.li@nokia-sbell.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: openbmc Digest, Vol 66, Issue 67
Thread-Topic: openbmc Digest, Vol 66, Issue 67
Thread-Index: AQHXByZve7ALfEmbCUWQHjJNu0JGZapiCU+Q
Date: Sun, 21 Feb 2021 04:42:02 +0000
Message-ID: <cd556658042b4bf9afb6a021a0fe23a6@nokia-sbell.com>
References: <mailman.453.1613783906.7079.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.453.1613783906.7079.openbmc@lists.ozlabs.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsXS/ts4V3fOE8MEg7N/hC1OtbxgcWD0OD9j
 IWMAYxSXTUpqTmZZapG+XQJXxqUpoQWNRhXvFu1kbmBcoNXFyMkhIWAi8WHeY6YuRi4OIYFD
 TBK9t/+zQTh/GSWevT/BDlIlJLCJUeJ0mxOIzSbgKDHr62lWEFtEwFJiyYN2NhBbWEBXYsLC
 yWwQcT2JyV9Xs0PYRhJLX/Yyg9gsAqoSCy8fBrN5BewkLt06wgIx30ni1ZobYHFOAWeJrzcv
 g81hFJCVmPboPhOIzSwgLnHryXwmiKsFJJbsOc8MYYtKvHz8D+geDiBbSaJvA1S5jsSC3Z/Y
 IGxtiWULX0OtFZQ4OfMJywRG0VlIps5C0jILScssJC0LGFlWMUo7+wV7eAX7evoZGOv5+Xt7
 OuoGO7n6+Og5+/tuYgRGxxqJSdN3MD6f9UHvECMTB+MhRgkOZiUR3u3P9RKEeFMSK6tSi/Lj
 i0pzUosPMUpzsCiJ8x5/IZAgJJCeWJKanZpakFoEk2Xi4JRqYGLj2zZJ+/Xh1xprvsk4flmm
 KyV09bu/kqfCJEv+mT6Biv/+LdWfFhDOueTHSekKjdzGH3FbMt+tmfTfeUUBG6tN9M8nE1zW
 LBI4mfo74bDyFnuWjR8NtQ4/utfh3CtV+rPZgE/yZa7G1YclOqxd64/YPDkj/fj2suk2DItd
 Cn45763ePeVi43q7/GPOh5lnNn4s9ZIKlFP6oDw37IrgfhHvphWnVzuUr5ri0demuMvC/fWc
 2zOjt8lOvxz0tKcnWqbq1A6ZC9qh7ydzzHg5Y5vK/SWeLakxN5/ejsma69o08eC84t7eimf7
 z0+ao8ohWsTWviPkWM0/a8sW5aNCGwWvTOyzanq8c57M5D67Q1xKLMUZiYZazEXFiQCecKew
 /QIAAA==
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

Subscribe



-----Original Message-----
From: openbmc <openbmc-bounces+jie.n.li=3Dnokia-sbell.com@lists.ozlabs.org>=
 On Behalf Of openbmc-request@lists.ozlabs.org
Sent: Saturday, February 20, 2021 9:18 AM
To: openbmc@lists.ozlabs.org
Subject: openbmc Digest, Vol 66, Issue 67

Send openbmc mailing list submissions to
	openbmc@lists.ozlabs.org

To subscribe or unsubscribe via the World Wide Web, visit
	https://lists.ozlabs.org/listinfo/openbmc
or, via email, send a message with subject or body 'help' to
	openbmc-request@lists.ozlabs.org

You can reach the person managing the list at
	openbmc-owner@lists.ozlabs.org

When replying, please edit your Subject line so it is more specific than "R=
e: Contents of openbmc digest..."


Today's Topics:

   1. RE:  overlayFS security concern (Kun Zhao)
   2. Re:  RE:  overlayFS security concern (chunhui.jia)


----------------------------------------------------------------------

Message: 1
Date: Sat, 20 Feb 2021 01:13:40 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: chunhui.jia <chunhui.jia@linux.intel.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE:  overlayFS security concern
Message-ID:
	<BYAPR14MB2342F147732017184BC1C58ACF839@BYAPR14MB2342.namprd14.prod.outloo=
k.com>
=09
Content-Type: text/plain; charset=3D"gb2312"

Thank you, Chunhui. But you mean to disable scp, right? Firmware upload thr=
ough scp function will be lost in this way. Maybe not a good choice for us.
BTW, is scp still a recommended way for OpenBMC firmware update?



Thanks.
Kun

From: chunhui.jia<mailto:chunhui.jia@linux.intel.com>
Sent: Friday, February 19, 2021 4:53 PM
To: Kun Zhao<mailto:zkxz@hotmail.com>; openbmc@lists.ozlabs.org<mailto:open=
bmc@lists.ozlabs.org>
Subject: Re: overlayFS security concern

Maintaining 2 different build configurations would be possible solution:  d=
ev build and release build.
1. enable debugging tech in dev build.
2. when using openbmc for product, disable all potential ways that could ha=
rm security.


2021-02-20

chunhui.jia

????Kun Zhao <zkxz@hotmail.com>
?????2021-02-20 08:31
???overlayFS security concern
????"openbmc@lists.ozlabs.org"<openbmc@lists.ozlabs.org>
???

Hi Team,

Have the following case ever been discussed before?, Anyone knows the root =
password will be able to let bmc run their own code by scp the code into bm=
c with the same file path as any services in rootfs. It will make the secur=
e boot totally useless.

So besides,
1. disable scp (but scp is one of the firmware upload way) 2. don?t use ove=
rlayFS (but it?s really useful for debugging during develop, and configurat=
ion management) Any other solutions?



Thanks.
Kun


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20210220/288d22=
0f/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: A24FB62FC7144662BA1C9A0C79685324.png
Type: image/png
Size: 122 bytes
Desc: A24FB62FC7144662BA1C9A0C79685324.png
URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20210220/288d22=
0f/attachment-0002.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 82282195F0154A20AF6CCE387F3ED633.png
Type: image/png
Size: 133 bytes
Desc: 82282195F0154A20AF6CCE387F3ED633.png
URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20210220/288d22=
0f/attachment-0003.png>

------------------------------

Message: 2
Date: Sat, 20 Feb 2021 09:17:16 +0800
From: "chunhui.jia" <chunhui.jia@linux.intel.com>
To: "Kun Zhao" <zkxz@hotmail.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: Re:  RE:  overlayFS security concern
Message-ID: 60306319.8090700@linux.intel.com
Content-Type: text/plain; charset=3D"utf-8"

You could use redfish firmware update instead.

2021-02-20=20

chunhui.jia=20



????Kun Zhao <zkxz@hotmail.com>
?????2021-02-20 09:13
???RE: overlayFS security concern
????"chunhui.jia"<chunhui.jia@linux.intel.com>,"openbmc@lists.ozlabs.org"<o=
penbmc@lists.ozlabs.org>
???

Thank you, Chunhui. But you mean to disable scp, right? Firmware upload thr=
ough scp function will be lost in this way. Maybe not a good choice for us.
BTW, is scp still a recommended way for OpenBMC firmware update?
=20
=20
=20
Thanks.
Kun
=20
From: chunhui.jia
Sent: Friday, February 19, 2021 4:53 PM
To: Kun Zhao; openbmc@lists.ozlabs.org
Subject: Re: overlayFS security concern
=20
Maintaining 2 different build configurations would be possible solution:  d=
ev build and release build.=20
1. enable debugging tech in dev build.=20
2. when using openbmc for product, disable all potential ways that could ha=
rm security.
=20
=20
2021-02-20=20

chunhui.jia=20

????Kun Zhao <zkxz@hotmail.com>
?????2021-02-20 08:31
???overlayFS security concern
????"openbmc@lists.ozlabs.org"<openbmc@lists.ozlabs.org>
???
=20
Hi Team,
=20
Have the following case ever been discussed before?, Anyone knows the root =
password will be able to let bmc run their own code by scp the code into bm=
c with the same file path as any services in rootfs. It will make the secur=
e boot totally useless.
=20
So besides,
1. disable scp (but scp is one of the firmware upload way) 2. don?t use ove=
rlayFS (but it?s really useful for debugging during develop, and configurat=
ion management) Any other solutions?
=20
=20
=20
Thanks.
Kun
=20
=20
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20210220/edec9e=
49/attachment.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: A24FB62FC7144662BA1C9A0C79685324.png
Type: image/png
Size: 122 bytes
Desc: not available
URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20210220/edec9e=
49/attachment.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 82282195F0154A20AF6CCE387F3ED633.png
Type: image/png
Size: 133 bytes
Desc: not available
URL: <http://lists.ozlabs.org/pipermail/openbmc/attachments/20210220/edec9e=
49/attachment-0001.png>

End of openbmc Digest, Vol 66, Issue 67
***************************************
