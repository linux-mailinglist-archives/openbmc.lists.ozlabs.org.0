Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F5AC664
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2019 13:35:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46QXQn4XmGzDqwV
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2019 21:34:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.9.91; helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="Sg9LXfT8"; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-oln040092009091.outbound.protection.outlook.com [40.92.9.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46QXPy0hLBzDqSC
 for <openbmc@lists.ozlabs.org>; Sat,  7 Sep 2019 21:34:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CI+ADoO0tBh/bw3zX/k3cC1/bfAy5THEwALFk11w/qp3pDzuyk4qR6EefLGlgygr+dPuMKa/3K6dNwde0yw2QHeOOqgxgeK4JG8+LcFfOPjzxj0CwZ2dUyyWDF2P/RskwW6sVQqR2VI4TLjJ+cAKIP9Ed6lwZUmThi6u7em+gkhwXb7gTNYJ7DpVmk1oxR3Y+GJp+XQlPd7jrFoFaENmhXMls3lEkWleCcK/nl39p9ceOQCANroEBxPsQhLm91SIUPKneoiqup/jcZ1KPwRh6kG1Awe6IKG/xnpi6buvWuIQLggilnlzhnhn1388GAbOzKn5DTwRW8aXiX3Lay3ZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPFvBKsPwkcqWSdlOlTnTV3cuwMJcciveZ8QRe/eDwU=;
 b=OP+q8VhObGx4XpTlq6Qzz3RKtwvI5bSeuoro9EzGNBoWEXbLrCwcrvkmQPuAID7Hg/7jA2ivlQrfq1qCXQjeR8CAfziCNdopVAojSdeOozci/72yPqd8vKcSP3Xfmflpx0kjYGZA/f9E3xL/bUY1k4Z6bCUo7wZUSIzhqTIZwv+zdVsrI6HmwkjP29ptbvsV2vAYAyF9tJjUjS0kkRoLRBTjQa4q0XcH7ny6enmUK1RAJm4DcVGD3ceSmM3xUBmWHuFLEYfxW8rrotAK9amebokQvvxx9gD3ziLeUAyNHkKh0lVlXCop2+MZmJVOK8TvYdIFmROUV8soROxi2L2dIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPFvBKsPwkcqWSdlOlTnTV3cuwMJcciveZ8QRe/eDwU=;
 b=Sg9LXfT8FK36LuVDSALd1tQo9XtTyIyBidDqHCLJVnzw22LhuBc1EMbwmng42EA33ing7anRMa6ohjnxcXfDwND7OsrOh4kBOsxW0VkvD95D1/erbzYW+wNpvQc5asNZ7L1HaasMbf+C1NB/2oo8kKj3IB5N7AQ4umlKCMCV2XSxJL5t6BH6BDOoZAr52F/zAuJlV1MJ++r+CzsIRXPvhfeKCk/Mdew3Qw+fc20CDW0E0yg6HjIzKCeh8zlqCvjvUvZXkogxHX3tF0foYNmysjshoZn4Rx8MEu0KxeR+maI+yChHZSRgrW2T7yzDHddXQ0wZiPKFC7heVhubBz043Q==
Received: from BN3NAM04FT053.eop-NAM04.prod.protection.outlook.com
 (10.152.92.57) by BN3NAM04HT136.eop-NAM04.prod.protection.outlook.com
 (10.152.93.150) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14; Sat, 7 Sep
 2019 11:34:07 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.92.56) by
 BN3NAM04FT053.mail.protection.outlook.com (10.152.93.2) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14 via Frontend Transport; Sat, 7 Sep 2019 11:34:07 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676%2]) with mapi id 15.20.2220.022; Sat, 7 Sep 2019
 11:34:07 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: Yong Li <yong.b.li@linux.intel.com>, 'Andrew Jeffery' <andrew@aj.id.au>,
 'AKASH G J' <akashgj91@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Enable KCS interface in zaius
Thread-Topic: Enable KCS interface in zaius
Thread-Index: AQHVXie2AsYNJ+CVFkiAFCdw53bpLacTHlaAgAAdxQCADEc8qA==
Date: Sat, 7 Sep 2019 11:34:07 +0000
Message-ID: <MN2PR04MB666979DC3506E051D6F44A54CDB50@MN2PR04MB6669.namprd04.prod.outlook.com>
References: <CAE33tLGxcBFHYzXQ7Uqdg03ZibvS4busoJT=iGTwLMb8TMD-2g@mail.gmail.com>
 <57995e3f-ef82-49b3-909a-054b5b9bef8e@www.fastmail.com>,
 <000001d55efc$36c53100$a44f9300$@linux.intel.com>
In-Reply-To: <000001d55efc$36c53100$a44f9300$@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:B0D24A083EAE4AD7721F35B791CEFE5300D9EDC040B822E4363D843C638A6C11;
 UpperCasedChecksum:079FEED811B48D6FF440B4BE145827C0A734AE39931C3CB2E9FCF097C40EF37F;
 SizeAsReceived:6936; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [HBZRNJlA0EHAxLdEYo2WaOMKvmhMV2ccKo9vrAC+Uf0=]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:BN3NAM04HT136; 
x-ms-traffictypediagnostic: BN3NAM04HT136:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: 4BTmkjLZMJmEUq91XhjqbrBPcz6FIDYagwpM+soYuOnc4ZSTwCnAjfOR4TXcTbi8cwpusVcaqSXlLdDfI01l3fU2C7Vt+Wu6AbEfNRL/MohneQhJka+3D2TpYVRZlkUY2osPyPvZGwny9o7CTt4wrAElY4ZcskEyRjojzvV5rNWJMazbak7GgXplHYVg4Pkr
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB666979DC3506E051D6F44A54CDB50MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b161c1-c27e-4a4f-a293-08d733874b42
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2019 11:34:07.1643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT136
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

--_000_MN2PR04MB666979DC3506E051D6F44A54CDB50MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I check out the https://github.com/Intel-BMC/openbmc
and build the board: meta-openbmc-mods/meta-wolfpass/conf

But got the error,
dd: failed to open '/home/baozheng/bmc/openbmc-github/build/tmp/deploy/imag=
es/intel-ast2500/fitImage-rootfs-intel-ast2500.bin': No such file or direct=
ory

Did I miss something?

Zheng


________________________________
From: openbmc <openbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org> on =
behalf of Yong Li <yong.b.li@linux.intel.com>
Sent: Friday, August 30, 2019 6:29 AM
To: 'Andrew Jeffery' <andrew@aj.id.au>; 'AKASH G J' <akashgj91@gmail.com>; =
openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
Subject: RE: Enable KCS interface in zaius

It seems that the kernel needs to enable KCS, and disable BT.
CONFIG_ASPEED_KCS_IPMI_BMC=3Dy

Suggest to check on this: https://github.com/Intel-BMC/openbmc

Thanks,
Yong
-----Original Message-----
From: openbmc <openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org=
>
On Behalf Of Andrew Jeffery
Sent: Friday, August 30, 2019 12:42 PM
To: AKASH G J <akashgj91@gmail.com>; openbmc@lists.ozlabs.org
Subject: Re: Enable KCS interface in zaius



On Thu, 29 Aug 2019, at 09:05, AKASH G J wrote:
> Hi all,
>
> I am using server platform with Intel processor and Aspeed AST-2500
> BMC. OpenBMC firmware with zaius configuration is used for BMC.
>

Zaius is an OpenPOWER platform (and our OpenPOWER platforms use the BT
interface rather than KCS). You're using an Intel-based processor for the
host, so perhaps it's better to start with an x86-based platform such as th=
e
s2600wf. This should already have KCS IPMI enabled for you.

Andrew


--_000_MN2PR04MB666979DC3506E051D6F44A54CDB50MN2PR04MB6669namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>I check out the <font size=3D"2"><span style=3D"font-size:11pt"><a hre=
f=3D"https://github.com/Intel-BMC/openbmc">https://github.com/Intel-BMC/ope=
nbmc</a></span></font><br>
</div>
<div>and build the board: meta-openbmc-mods/meta-wolfpass/conf</div>
<div><br>
</div>
<div>But got the error,<br>
</div>
<div>dd: failed to open '/home/baozheng/bmc/openbmc-github/build/tmp/deploy=
/images/intel-ast2500/fitImage-rootfs-intel-ast2500.bin': No such file or d=
irectory</div>
<div><br>
</div>
<div>Did I miss something?</div>
<div><br>
</div>
<div>Zheng<br>
</div>
<div><br>
</div>
<div>
<div id=3D"appendonsend" style=3D"font-family: Calibri, Helvetica, sans-ser=
if; font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> openbmc &lt;openbmc=
-bounces&#43;fishbaoz=3Dhotmail.com@lists.ozlabs.org&gt; on behalf of Yong =
Li &lt;yong.b.li@linux.intel.com&gt;<br>
<b>Sent:</b> Friday, August 30, 2019 6:29 AM<br>
<b>To:</b> 'Andrew Jeffery' &lt;andrew@aj.id.au&gt;; 'AKASH G J' &lt;akashg=
j91@gmail.com&gt;; openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt=
;<br>
<b>Subject:</b> RE: Enable KCS interface in zaius</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">It seems that the kernel needs to enable KCS, and =
disable BT.
<br>
CONFIG_ASPEED_KCS_IPMI_BMC=3Dy<br>
<br>
Suggest to check on this: <a href=3D"https://github.com/Intel-BMC/openbmc">=
https://github.com/Intel-BMC/openbmc</a><br>
<br>
Thanks,<br>
Yong<br>
-----Original Message-----<br>
From: openbmc &lt;openbmc-bounces&#43;yong.b.li=3Dlinux.intel.com@lists.ozl=
abs.org&gt;<br>
On Behalf Of Andrew Jeffery<br>
Sent: Friday, August 30, 2019 12:42 PM<br>
To: AKASH G J &lt;akashgj91@gmail.com&gt;; openbmc@lists.ozlabs.org<br>
Subject: Re: Enable KCS interface in zaius<br>
<br>
<br>
<br>
On Thu, 29 Aug 2019, at 09:05, AKASH G J wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I am using server platform with Intel processor and Aspeed AST-2500 <b=
r>
&gt; BMC. OpenBMC firmware with zaius configuration is used for BMC.<br>
&gt; <br>
<br>
Zaius is an OpenPOWER platform (and our OpenPOWER platforms use the BT<br>
interface rather than KCS). You're using an Intel-based processor for the<b=
r>
host, so perhaps it's better to start with an x86-based platform such as th=
e<br>
s2600wf. This should already have KCS IPMI enabled for you.<br>
<br>
Andrew<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR04MB666979DC3506E051D6F44A54CDB50MN2PR04MB6669namp_--
