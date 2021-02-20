Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4C320268
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 02:14:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj9Sp0n70z3cML
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 12:14:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=BPaxp0rK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.21.57;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=BPaxp0rK; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2057.outbound.protection.outlook.com [40.92.21.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj9SV5H63z30Ht
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2021 12:13:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtCAYEm8X5gnE9v+gUZzeEO3Q/ynMwRfpfqBCN4z9NAVVPmJSbxRwMO9p6xk2ySgfzjTb70v3nvhbW3K32EFk2o5IZeYlgDzXyqcOH/O8oHsLX0dKyqY2HPLhTjHQupRO3z45qgyvNvpkAIPQczgtPBhinGO2Xi1+l9BukSIfiyligJU/dbEgc8zQaKB7ojWMShFh9SZxr+/iWezToYCG61BWNpUmfp6x2panzFFpz9ypbXzGw0RekYG/Z3UKcBz6wIBVCSpOd1vCqiBt97/b2uvQw8vfbKUicJuoX+OAesx4iabkbNIh3YS1t4yd2KLtK4fElvfCwRFMfKoFUzL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqiHhfVNLDNxEVXO8xoCLFTNRKBwN6fEEAaCpw2DFFs=;
 b=lT/2w7Sh2SMLJq7Vif/oLROEZED9yVD39aWlObDfetzRohw8tdExcRHnBvJLquhMvX5mHIlLmSpNhWfCGnq45TgpfbT62LF0HQNF4z42sRpZSLR9bLqGEKrjJAVxv6agqgV7Y3zJEpikaanr6fZxxR7Hju+Pnp7J/ZU0nF0Lks35+/wlAynIpQddT/kSvxlZzv4U8zb57VNBRvJXasSuAvEiJNVojvT/4Du0+jH6FxHF2av7vYCan1ZEzlx9xKDqLrJsta7/KG/AKXZvLbEuqL3lX5i31WyXk1NGLxHYGvM/ut5vfdqf4iQBPARBsNgVsZMyw/dLb9P1K+TqCM87pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqiHhfVNLDNxEVXO8xoCLFTNRKBwN6fEEAaCpw2DFFs=;
 b=BPaxp0rKhsCPgy95q3LKXinmH8X1OmTnC9nDrMj3CBby+qwNAiRWPZhZjEV3Ki+p10+e020gyU2xu4MV/cxGfSTLDU2vtaZ3FoAdnbYXV1Dw7kD6lAiQFiqq3VgWj8aiG965aKdgfrG87lWT8ABWvOEt9UMbFwaaW8Wm/A80Q+9bXcXbsKckGn+6fqlpqfDi2c2JYvIoWMa6i77hl5YTIlSII8NTes1DvD654TSKZXimjEQ1peqH0BncHGUlQmbqCzqPrNEi//1YxRTLHQZJssRpbRpLeShH1Q+gxo5ZxTGQVOXNemAvRtPHMCEk1V+w+Z5CTDEY/2tni2W9GDKHVg==
Received: from BN8NAM12FT049.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc66::44) by
 BN8NAM12HT172.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc66::332)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8; Sat, 20 Feb
 2021 01:13:41 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:fc66::42) by BN8NAM12FT049.mail.protection.outlook.com
 (2a01:111:e400:fc66::124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend
 Transport; Sat, 20 Feb 2021 01:13:40 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::5d98:ad3a:8911:84b6]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::5d98:ad3a:8911:84b6%7]) with mapi id 15.20.3868.030; Sat, 20 Feb 2021
 01:13:40 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: chunhui.jia <chunhui.jia@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE:  overlayFS security concern
Thread-Topic: overlayFS security concern
Thread-Index: AQHXBx2UWn4JuuHBIkS3VJD7oQMUJKpgNzsAgAADpCQ=
Date: Sat, 20 Feb 2021 01:13:40 +0000
Message-ID: <BYAPR14MB2342F147732017184BC1C58ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
References: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>,
 <60305D66.2050303@linux.intel.com>
In-Reply-To: <60305D66.2050303@linux.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:286B31AA3F85BD0DB131FB7321058BAA21C16A1E54AB99C5D024C1507D951811;
 UpperCasedChecksum:EE7EDEA8D78BCD02F5BDE4820FF95854F28A8F47432E2A3F82C3E0EE2C2FE305;
 SizeAsReceived:6922; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [QpYiU1f2SfH5IggOL/ShhW76YedJpMZh]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: a6892b34-d59c-4427-47ae-08d8d53cc26c
x-ms-traffictypediagnostic: BN8NAM12HT172:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bVFUDtcQFFv7s6e/0sFKbWBMaTmGTyGg8G5xEohK26jQrwSLg3G6ireAU8ZkZXI+oZyujnBguuPUHNG1fbnS4nuSeYfvdFAkRbPjrGdHHPjSlaT0n4XKa1Z7lukphsUs4wu+tkZyYNYBmpnlykgv0hhG9K4SIkxVl+rzjdAAgNwFAaMCNrGelYsR37FPVA5gxXkqnF9c7z9nY5bxd/uySUzX7ds4wz75/R0F+yPCZmiofpvA5CwB71OhZLcful9JqLxVf4Rjlz9Q3pXmzOJOYEQ0zJxdfHisI9RjumjPtFgK6JH/ZQ8s70QnGutM8OMN3gFhtSQuefbrpvvU/LdjVwPM1L9ehoC3HhnoYT2GxyOFDm+ritwk5mvsIq4RzRqwy5tmsktwBpL2vVw7Kk1nPg==
x-ms-exchange-antispam-messagedata: G4R7e3wW1v8uV2xsVwT9dEQty1+7+LPuDKrHK+hfTQa31zOUxvVpudt46Js2Bq5zt4Li6O24hN+4Mi1Zc2hXTCmU9yBUg4KiMCyh94HEeh9aFkOOHmfkF9cYt2nLV6L8ORQSOgqhvGikSiS+UpG+Vg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/related;
 boundary="_005_BYAPR14MB2342F147732017184BC1C58ACF839BYAPR14MB2342namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT049.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a6892b34-d59c-4427-47ae-08d8d53cc26c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2021 01:13:40.8086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM12HT172
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

--_005_BYAPR14MB2342F147732017184BC1C58ACF839BYAPR14MB2342namp_
Content-Type: multipart/alternative;
	boundary="_000_BYAPR14MB2342F147732017184BC1C58ACF839BYAPR14MB2342namp_"

--_000_BYAPR14MB2342F147732017184BC1C58ACF839BYAPR14MB2342namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmsgeW91LCBDaHVuaHVpLiBCdXQgeW91IG1lYW4gdG8gZGlzYWJsZSBzY3AsIHJpZ2h0PyBG
aXJtd2FyZSB1cGxvYWQgdGhyb3VnaCBzY3AgZnVuY3Rpb24gd2lsbCBiZSBsb3N0IGluIHRoaXMg
d2F5LiBNYXliZSBub3QgYSBnb29kIGNob2ljZSBmb3IgdXMuDQpCVFcsIGlzIHNjcCBzdGlsbCBh
IHJlY29tbWVuZGVkIHdheSBmb3IgT3BlbkJNQyBmaXJtd2FyZSB1cGRhdGU/DQoNCg0KDQpUaGFu
a3MuDQpLdW4NCg0KRnJvbTogY2h1bmh1aS5qaWE8bWFpbHRvOmNodW5odWkuamlhQGxpbnV4Lmlu
dGVsLmNvbT4NClNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTksIDIwMjEgNDo1MyBQTQ0KVG86IEt1
biBaaGFvPG1haWx0bzp6a3h6QGhvdG1haWwuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
PG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpTdWJqZWN0OiBSZTogb3ZlcmxheUZT
IHNlY3VyaXR5IGNvbmNlcm4NCg0KTWFpbnRhaW5pbmcgMiBkaWZmZXJlbnQgYnVpbGQgY29uZmln
dXJhdGlvbnMgd291bGQgYmUgcG9zc2libGUgc29sdXRpb246ICBkZXYgYnVpbGQgYW5kIHJlbGVh
c2UgYnVpbGQuDQoxLiBlbmFibGUgZGVidWdnaW5nIHRlY2ggaW4gZGV2IGJ1aWxkLg0KMi4gd2hl
biB1c2luZyBvcGVuYm1jIGZvciBwcm9kdWN0LCBkaXNhYmxlIGFsbCBwb3RlbnRpYWwgd2F5cyB0
aGF0IGNvdWxkIGhhcm0gc2VjdXJpdHkuDQoNCg0KMjAyMS0wMi0yMA0KDQpjaHVuaHVpLmppYQ0K
DQq3orz+yMujukt1biBaaGFvIDx6a3h6QGhvdG1haWwuY29tPg0Kt6LLzcqxvOSjujIwMjEtMDIt
MjAgMDg6MzENCtb3zOKjum92ZXJsYXlGUyBzZWN1cml0eSBjb25jZXJuDQrK1bz+yMujuiJvcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmciPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCrOty82jug0K
DQpIaSBUZWFtLA0KDQpIYXZlIHRoZSBmb2xsb3dpbmcgY2FzZSBldmVyIGJlZW4gZGlzY3Vzc2Vk
IGJlZm9yZT8sDQpBbnlvbmUga25vd3MgdGhlIHJvb3QgcGFzc3dvcmQgd2lsbCBiZSBhYmxlIHRv
IGxldCBibWMgcnVuIHRoZWlyIG93biBjb2RlIGJ5IHNjcCB0aGUgY29kZSBpbnRvIGJtYyB3aXRo
IHRoZSBzYW1lIGZpbGUgcGF0aCBhcyBhbnkgc2VydmljZXMgaW4gcm9vdGZzLiBJdCB3aWxsIG1h
a2UgdGhlIHNlY3VyZSBib290IHRvdGFsbHkgdXNlbGVzcy4NCg0KU28gYmVzaWRlcywNCjEuIGRp
c2FibGUgc2NwIChidXQgc2NwIGlzIG9uZSBvZiB0aGUgZmlybXdhcmUgdXBsb2FkIHdheSkNCjIu
IGRvbqGvdCB1c2Ugb3ZlcmxheUZTIChidXQgaXShr3MgcmVhbGx5IHVzZWZ1bCBmb3IgZGVidWdn
aW5nIGR1cmluZyBkZXZlbG9wLCBhbmQgY29uZmlndXJhdGlvbiBtYW5hZ2VtZW50KQ0KQW55IG90
aGVyIHNvbHV0aW9ucz8NCg0KDQoNClRoYW5rcy4NCkt1bg0KDQoNCg==

--_000_BYAPR14MB2342F147732017184BC1C58ACF839BYAPR14MB2342namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Microsoft YaHei";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@Microsoft YaHei";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.DefaultFontHxMailStyle
	{mso-style-name:"Default Font HxMail Style";
	font-family:"Calibri",sans-serif;
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">Thank you, Ch=
unhui. But you mean to disable scp, right? Firmware upload through scp func=
tion will be lost in this way. Maybe not a good choice for us.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">BTW, is scp s=
till a recommended way for OpenBMC firmware update?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal">Kun<o:p></o:p></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:chunhui.jia@linux.intel.com">chunhui.jia</a><br>
<b>Sent: </b>Friday, February 19, 2021 4:53 PM<br>
<b>To: </b><a href=3D"mailto:zkxz@hotmail.com">Kun Zhao</a>; <a href=3D"mai=
lto:openbmc@lists.ozlabs.org">
openbmc@lists.ozlabs.org</a><br>
<b>Subject: </b>Re: overlayFS security concern</p>
</div>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black">Maintaining 2 different build configurati=
ons would be possible solution: &nbsp;dev build and release build.
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black">1. enable debugging tech in&nbsp;dev buil=
d.
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black">2. when using openbmc for product, disabl=
e all potential ways&nbsp;that could harm security.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:silver">2021-02-20
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:silver"><img border=3D"0" width=3D"122" height=
=3D"1" style=3D"width:1.2708in;height:.0104in" id=3D"Horizontal_x0020_Line_=
x0020_1" src=3D"cid:image001.png@01D706E2.906431E0"></span><span style=3D"f=
ont-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:silver"><o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:silver">chunhui.jia
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black"><img border=3D"0" width=3D"684" height=3D=
"1" style=3D"width:7.125in;height:.0104in" id=3D"Horizontal_x0020_Line_x002=
0_2" src=3D"cid:image002.png@01D706E2.906431E0"></span><span style=3D"font-=
size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:=
p></span></p>
<blockquote style=3D"margin-left:0in;margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal"><strong><span lang=3D"ZH-CN" style=3D"font-size:10.0=
pt;font-family:&quot;Microsoft YaHei&quot;,sans-serif;color:black">=B7=A2=
=BC=FE=C8=CB=A3=BA</span></strong><span style=3D"font-size:10.0pt;font-fami=
ly:&quot;Verdana&quot;,sans-serif;color:black">Kun Zhao &lt;zkxz@hotmail.co=
m&gt;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><strong><span lang=3D"ZH-CN" style=3D"font-size:10.0=
pt;font-family:&quot;Microsoft YaHei&quot;,sans-serif;color:black">=B7=A2=
=CB=CD=CA=B1=BC=E4=A3=BA</span></strong><span style=3D"font-size:10.0pt;fon=
t-family:&quot;Verdana&quot;,sans-serif;color:black">2021-02-20&nbsp;08:31<=
o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><strong><span lang=3D"ZH-CN" style=3D"font-size:10.0=
pt;font-family:&quot;Microsoft YaHei&quot;,sans-serif;color:black">=D6=F7=
=CC=E2=A3=BA</span></strong><span style=3D"font-size:10.0pt;font-family:&qu=
ot;Verdana&quot;,sans-serif;color:black">overlayFS security concern<o:p></o=
:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><strong><span lang=3D"ZH-CN" style=3D"font-size:10.0=
pt;font-family:&quot;Microsoft YaHei&quot;,sans-serif;color:black">=CA=D5=
=BC=FE=C8=CB=A3=BA</span></strong><span style=3D"font-size:10.0pt;font-fami=
ly:&quot;Verdana&quot;,sans-serif;color:black">&quot;openbmc@lists.ozlabs.o=
rg&quot;&lt;openbmc@lists.ozlabs.org&gt;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><strong><span lang=3D"ZH-CN" style=3D"font-size:10.0=
pt;font-family:&quot;Microsoft YaHei&quot;,sans-serif;color:black">=B3=AD=
=CB=CD=A3=BA</span></strong><span style=3D"font-size:10.0pt;font-family:&qu=
ot;Verdana&quot;,sans-serif;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ve=
rdana&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">Hi Team,<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">Have the foll=
owing case ever been discussed before?,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">Anyone knows =
the root password will be able to let bmc run their own code by scp the cod=
e into bmc with the same file path as any services in rootfs. It will make =
the secure boot totally useless.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">So besides,<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">1. disable sc=
p (but scp is one of the firmware upload way)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">2. don=A1=AFt=
 use overlayFS (but it=A1=AFs really useful for debugging during develop, a=
nd configuration management)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">Any other sol=
utions?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Thanks.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Kun<o:p></o:p></span></p=
>
</div>
</blockquote>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:0in;margin-right:45.0pt;=
margin-bottom:9.0pt;margin-left:9.0pt">
<span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
</div>
</body>
</html>

--_000_BYAPR14MB2342F147732017184BC1C58ACF839BYAPR14MB2342namp_--

--_005_BYAPR14MB2342F147732017184BC1C58ACF839BYAPR14MB2342namp_
Content-Type: image/png; name="A24FB62FC7144662BA1C9A0C79685324.png"
Content-Description: A24FB62FC7144662BA1C9A0C79685324.png
Content-Disposition: inline; filename="A24FB62FC7144662BA1C9A0C79685324.png";
	size=122; creation-date="Sat, 20 Feb 2021 01:13:39 GMT";
	modification-date="Sat, 20 Feb 2021 01:13:39 GMT"
Content-ID: <image001.png@01D706E2.906431E0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAHoAAAABCAYAAAARvLrmAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAPSURBVChTYxgFIwEwMAAAAekAAR2FTkQAAAAA
SUVORK5CYII=

--_005_BYAPR14MB2342F147732017184BC1C58ACF839BYAPR14MB2342namp_
Content-Type: image/png; name="82282195F0154A20AF6CCE387F3ED633.png"
Content-Description: 82282195F0154A20AF6CCE387F3ED633.png
Content-Disposition: inline; filename="82282195F0154A20AF6CCE387F3ED633.png";
	size=133; creation-date="Sat, 20 Feb 2021 01:13:39 GMT";
	modification-date="Sat, 20 Feb 2021 01:13:39 GMT"
Content-ID: <image002.png@01D706E2.906431E0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAqwAAAABCAYAAAAb3/wpAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAaSURBVEhL7cExAQAAAMKg9U9tDQ8gAAD4VQMK
sQAB44Zk/AAAAABJRU5ErkJggg==

--_005_BYAPR14MB2342F147732017184BC1C58ACF839BYAPR14MB2342namp_--
