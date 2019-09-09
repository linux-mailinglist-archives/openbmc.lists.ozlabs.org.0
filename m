Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6B3ADAC6
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 16:11:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rqp433gXzDqND
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 00:11:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.10.100; helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="f7cZaBvg"; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010100.outbound.protection.outlook.com [40.92.10.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rqn65pq0zDqFF
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 00:10:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwyNqWDKMrH32BOUMn4Rf/DGByVrPyTQTpdCwThJNPlrqg5MNrfVrumSOqlIfFr92nIuiZ+Na68UnKb3m2kqqzORGYJ+lcdFdBKlp+GBbjozKyzoW/huEbYXqwnmx/ah41Ncs1P/x5LGGmlmzhMNlbDI00gfgQardS/pKPcJIC1m48FKL1YsdMW31Vl/c7I70sLuz5zmqiIV+HnxkcfmSeHpVutmxbLMpMA6gVT+T74LTPtQx7TfhThvLN9yI7HzFembB/jwtY0DrWgtBck9Gw01RIOQi0nxD1J6zWO+dh3EnydUQrgPijb8L94PoJC17FBIzMMONQ+hESZdHT9iVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xB1//HKxNqRb9BnA1z61oEtvCfBwJ+yM1JWo/4UGKM=;
 b=hPqb7IZ+IKhSMV6P4WKylCwZMAiyYdVtXOV7t6ZFhMleLjUa8I/vJF4qIzjdyLFy7p0CxnclKDxs+s3FHzF8JyY3Q5CnXGLB5d78QbyX1OX8YUp36rjyyV3hXgTMw8bipPUIomPXj+NhEH7qB+UIR1CyMOgCq3/s8krdZIX6aZRutLbYWw9+DOGaT7+iMg25mEQSsITtYqHQQynKmSqwxhqK9Sf/wUH6zLmatUlTfu0n3F5Aic5tOhc/3GpSoMG+CWCEP3X/qI6qJ20PcZ2sisUHfZwF26eCmg7hXL3I51POeWpCEfMv5rwoP329UKClkLKZ/Kpo8yzSomgYoFigjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xB1//HKxNqRb9BnA1z61oEtvCfBwJ+yM1JWo/4UGKM=;
 b=f7cZaBvgjZnLbvNfkCIaKB9fFYdvFsLX7MWA5YdvVtYAAjwVyLakKjNBYrVq0PBp1ERnEpy8A4Rq8d1gDMi/tWkM3Kw2KQgQMfombHq1tv890E++hKKjgcu2U1O72+KN82NE7H3eSMlPEwIeyQp2aBTObSm1h5ExHBHbjxQYmouiEHU0HybFUvRpVdKd9cGWDj14V2ffkBDTC0eTGd2OqFtnSzJmQMDQmfPMD9Lx3mY2R3W1dBh7i7dsBr3edzxjVE9ktWzeE1GNwWx2vjADhOCuUKBB5LaVLtyq3wpNPd6x6f/TTP+mzPXKO0TuJuivZF+LmbY9hG5rgn+NqpAm3A==
Received: from SN1NAM04FT060.eop-NAM04.prod.protection.outlook.com
 (10.152.88.53) by SN1NAM04HT239.eop-NAM04.prod.protection.outlook.com
 (10.152.88.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16; Mon, 9 Sep
 2019 14:10:12 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.88.54) by
 SN1NAM04FT060.mail.protection.outlook.com (10.152.89.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14 via Frontend Transport; Mon, 9 Sep 2019 14:10:12 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676%2]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 14:10:12 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: Yong Li <yong.b.li@linux.intel.com>, 'Andrew Jeffery' <andrew@aj.id.au>,
 'AKASH G J' <akashgj91@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Enable KCS interface in zaius
Thread-Topic: Enable KCS interface in zaius
Thread-Index: AQHVXie2AsYNJ+CVFkiAFCdw53bpLacTHlaAgAAdxQCADEc8qIADmGgAgABVJa4=
Date: Mon, 9 Sep 2019 14:10:11 +0000
Message-ID: <MN2PR04MB6669546EB3CCCF31564B2C7ACDB70@MN2PR04MB6669.namprd04.prod.outlook.com>
References: <CAE33tLGxcBFHYzXQ7Uqdg03ZibvS4busoJT=iGTwLMb8TMD-2g@mail.gmail.com>
 <57995e3f-ef82-49b3-909a-054b5b9bef8e@www.fastmail.com>,
 <000001d55efc$36c53100$a44f9300$@linux.intel.com>
 <MN2PR04MB666979DC3506E051D6F44A54CDB50@MN2PR04MB6669.namprd04.prod.outlook.com>,
 <000401d566ec$08b5e0f0$1a21a2d0$@linux.intel.com>
In-Reply-To: <000401d566ec$08b5e0f0$1a21a2d0$@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:625F271A4ECB4E1A412DDF001DDE7A9FA4F24C627B5BBEAAAEE56B16AC10BA7C;
 UpperCasedChecksum:E8269568C740D29FB3EBC210D828F2355E1611B6DB05D2C10740342B114FE054;
 SizeAsReceived:7087; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [a8d7bw8yHjNN4hxSSZ93dAr4mhpcp9D/t8JM3faVyQs=]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:SN1NAM04HT239; 
x-ms-traffictypediagnostic: SN1NAM04HT239:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: tmRdVi/k8Hjg29ajE6sRDLXIAQG0WVjT5CmA71G++OVyIrAhCYf3AY7sxrCvT3sBtmTbzKB2FtEA5zZCoUODSYnmeIrMXO67ATp+Us0WyhdID4XXRGy8UUIhBm2xIn7ESU3ZMWpEkkNoa+AbdQuF6xp31Dty+IuOQd2K06O3L+v//OXokOYJwM+RwKWuzHUo
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB6669546EB3CCCF31564B2C7ACDB70MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbd051e-05ef-4876-e53a-08d7352f6df2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 14:10:11.9603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM04HT239
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

--_000_MN2PR04MB6669546EB3CCCF31564B2C7ACDB70MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

There is not any mtd file in deploy folder. The build process breaks at las=
t stage, so no mtd file is created.

Zheng

________________________________
From: Yong Li <yong.b.li@linux.intel.com>
Sent: Monday, September 9, 2019 8:53 AM
To: 'Zheng Bao' <fishbaoz@hotmail.com>; 'Andrew Jeffery' <andrew@aj.id.au>;=
 'AKASH G J' <akashgj91@gmail.com>; openbmc@lists.ozlabs.org <openbmc@lists=
.ozlabs.org>
Subject: RE: Enable KCS interface in zaius


Can you find the image-mtd file? You can flash this file with this command(=
scp it to /tmp folder on the board):



flashcp /tmp/image-mtd /dev/mtd0



Thanks,

Yong

From: openbmc <openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org=
> On Behalf Of Zheng Bao
Sent: Saturday, September 7, 2019 7:34 PM
To: Yong Li <yong.b.li@linux.intel.com>; 'Andrew Jeffery' <andrew@aj.id.au>=
; 'AKASH G J' <akashgj91@gmail.com>; openbmc@lists.ozlabs.org
Subject: Re: Enable KCS interface in zaius



I check out the https://github.com/Intel-BMC/openbmc

and build the board: meta-openbmc-mods/meta-wolfpass/conf



But got the error,

dd: failed to open '/home/baozheng/bmc/openbmc-github/build/tmp/deploy/imag=
es/intel-ast2500/fitImage-rootfs-intel-ast2500.bin': No such file or direct=
ory



Did I miss something?



Zheng





________________________________

From: openbmc <openbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org<mail=
to:openbmc-bounces+fishbaoz=3Dhotmail.com@lists.ozlabs.org>> on behalf of Y=
ong Li <yong.b.li@linux.intel.com<mailto:yong.b.li@linux.intel.com>>
Sent: Friday, August 30, 2019 6:29 AM
To: 'Andrew Jeffery' <andrew@aj.id.au<mailto:andrew@aj.id.au>>; 'AKASH G J'=
 <akashgj91@gmail.com<mailto:akashgj91@gmail.com>>; openbmc@lists.ozlabs.or=
g<mailto:openbmc@lists.ozlabs.org> <openbmc@lists.ozlabs.org<mailto:openbmc=
@lists.ozlabs.org>>
Subject: RE: Enable KCS interface in zaius



It seems that the kernel needs to enable KCS, and disable BT.
CONFIG_ASPEED_KCS_IPMI_BMC=3Dy

Suggest to check on this: https://github.com/Intel-BMC/openbmc

Thanks,
Yong
-----Original Message-----
From: openbmc <openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org=
<mailto:openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org>>
On Behalf Of Andrew Jeffery
Sent: Friday, August 30, 2019 12:42 PM
To: AKASH G J <akashgj91@gmail.com<mailto:akashgj91@gmail.com>>; openbmc@li=
sts.ozlabs.org<mailto:openbmc@lists.ozlabs.org>
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

--_000_MN2PR04MB6669546EB3CCCF31564B2C7ACDB70MN2PR04MB6669namp_
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
<div>
<div id=3D"appendonsend" style=3D"font-family: Calibri, Helvetica, sans-ser=
if; font-size: 12pt; color: rgb(0, 0, 0);">
There is not any mtd file in deploy folder. The build process breaks at las=
t stage, so no mtd file is created.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Zheng<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Yong Li &lt;yong.b.=
li@linux.intel.com&gt;<br>
<b>Sent:</b> Monday, September 9, 2019 8:53 AM<br>
<b>To:</b> 'Zheng Bao' &lt;fishbaoz@hotmail.com&gt;; 'Andrew Jeffery' &lt;a=
ndrew@aj.id.au&gt;; 'AKASH G J' &lt;akashgj91@gmail.com&gt;; openbmc@lists.=
ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> RE: Enable KCS interface in zaius</font>
<div>&nbsp;</div>
</div>
<div lang=3D"EN-US">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
Can you find the image-mtd file? You can flash this file with this command(=
scp it to /tmp folder on the board):</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
flashcp /tmp/image-mtd /dev/mtd0</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
Thanks,</p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
Yong</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
<a name=3D"x______replyseparator"></a><b>From:</b> openbmc &lt;openbmc-boun=
ces&#43;yong.b.li=3Dlinux.intel.com@lists.ozlabs.org&gt;
<b>On Behalf Of </b>Zheng Bao<br>
<b>Sent:</b> Saturday, September 7, 2019 7:34 PM<br>
<b>To:</b> Yong Li &lt;yong.b.li@linux.intel.com&gt;; 'Andrew Jeffery' &lt;=
andrew@aj.id.au&gt;; 'AKASH G J' &lt;akashgj91@gmail.com&gt;; openbmc@lists=
.ozlabs.org<br>
<b>Subject:</b> Re: Enable KCS interface in zaius</p>
</div>
</div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
I check out the <a href=3D"https://github.com/Intel-BMC/openbmc">https://gi=
thub.com/Intel-BMC/openbmc</a></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
and build the board: meta-openbmc-mods/meta-wolfpass/conf</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
But got the error,</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
dd: failed to open '/home/baozheng/bmc/openbmc-github/build/tmp/deploy/imag=
es/intel-ast2500/fitImage-rootfs-intel-ast2500.bin': No such file or direct=
ory</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
Did I miss something?</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
Zheng</p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
</div>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11=
pt; font-family: &quot;Calibri&quot;, sans-serif;text-align:center" align=
=3D"center">
<hr width=3D"98%" size=3D"3" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
<b><span style=3D"color:black">From:</span></b><span style=3D"color:black">=
 openbmc &lt;<a href=3D"mailto:openbmc-bounces&#43;fishbaoz=3Dhotmail.com@l=
ists.ozlabs.org">openbmc-bounces&#43;fishbaoz=3Dhotmail.com@lists.ozlabs.or=
g</a>&gt; on behalf of Yong Li &lt;<a href=3D"mailto:yong.b.li@linux.intel.=
com">yong.b.li@linux.intel.com</a>&gt;<br>
<b>Sent:</b> Friday, August 30, 2019 6:29 AM<br>
<b>To:</b> 'Andrew Jeffery' &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@a=
j.id.au</a>&gt;; 'AKASH G J' &lt;<a href=3D"mailto:akashgj91@gmail.com">aka=
shgj91@gmail.com</a>&gt;;
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a> &l=
t;<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&=
gt;<br>
<b>Subject:</b> RE: Enable KCS interface in zaius</span> </p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;">
&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt=
; font-family: &quot;Calibri&quot;, sans-serif;margin-bottom:12.0pt">
It seems that the kernel needs to enable KCS, and disable BT. <br>
CONFIG_ASPEED_KCS_IPMI_BMC=3Dy<br>
<br>
Suggest to check on this: <a href=3D"https://github.com/Intel-BMC/openbmc">=
https://github.com/Intel-BMC/openbmc</a><br>
<br>
Thanks,<br>
Yong<br>
-----Original Message-----<br>
From: openbmc &lt;<a href=3D"mailto:openbmc-bounces&#43;yong.b.li=3Dlinux.i=
ntel.com@lists.ozlabs.org">openbmc-bounces&#43;yong.b.li=3Dlinux.intel.com@=
lists.ozlabs.org</a>&gt;<br>
On Behalf Of Andrew Jeffery<br>
Sent: Friday, August 30, 2019 12:42 PM<br>
To: AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com">akashgj91@gmail.co=
m</a>&gt;; <a href=3D"mailto:openbmc@lists.ozlabs.org">
openbmc@lists.ozlabs.org</a><br>
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
Andrew</p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR04MB6669546EB3CCCF31564B2C7ACDB70MN2PR04MB6669namp_--
