Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B2B32023F
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 01:31:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj8Wr1QkLz3cLY
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 11:31:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=V+DhDy8H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.21.46;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=V+DhDy8H; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2046.outbound.protection.outlook.com [40.92.21.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj8WX3J55z3cGg
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2021 11:31:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPA8QKlcvdfTWS/PIus40fZkTNFQwFOtYjAnvCxJ+eFOYfF1RSqiLJoLUd8plQ/+eINyMDRuc+Y1q2nGMuLeuOPGf2HpEU9F6x2933o5IxTbWFFkPLsdiw6rDNKfgxBlGofKrfP34UZnbDTpNah7PjytqyEztiHP+7K0yAfaI++lFyG6aGCCLXJo8KFi1pK2qJdGMuEuleREpgekrQOKTAtBcEhvwRQ4Oyh7y5ZI9pQIXhoORNkT6TzXm5sjr4cQ++8WHL8NKtQ7+aJyKHeB1ujA9vo8muMpLPNezsEiugriy47Ka2oHbu+vxUi1+PZpuv5jbBT2uxMw+ifwCgaV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5+pG3RehBDBDrxRSxyuUT+ybbhQ4gABR+kkywXnegE=;
 b=GxaWtzmUYEdBy7GOxhOclm76dBRcCITDA8XVSN8USEYexQ9BrSQ2rt7p37bEqm57fS31A3alTykPjFqIsqGiFmJWsimPzqc8mIFAS/L6zXED68UG5C8FToBY/iJZ5BQBmDqbpsv3agcG5HjDzm2FKWz6n9MyYMsHbR2w8stwk7NFcTsovtOAln2SofGZOfUvIUitg+8z0J05TUB8mGF9f79nCuexvUch3mKX4Y7TlUy4tlebTwsBZPAH1ydCLL3ZclqII7wtG8pbGbdXXTLJbCBClhrTfQbphrK6Adwv5egtxkoGzpMd/5k3aMIb2gsbw1zhZ0HJMwAaAnA9DAe3Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5+pG3RehBDBDrxRSxyuUT+ybbhQ4gABR+kkywXnegE=;
 b=V+DhDy8HRBXIBgOxu0eW/qerRKnqgAGKUGP9PzikdtV2IYm8S8KtZPlQ1anxpCxD6rXC72wZv6/FINevcz51MI++O4W0k1N3lTVYKZe84/JcPX1MERJknkKvbHVMAPnGf2ClrsRS+dHnf296ym4BQ0YZoII665YxPql7OoO6vp6+M+TXPk0l2DWoN6WeD2BkMIr6/A4toOiCWEFdOlNujRwakrcuk4Ds14fK//KRwNrVONckBuO2qb3+9fZaxGfFdZF+1t8Nn2jNlLht7dmwKhDwnXX5QhQvwTeDnBKT7eQOHyuw/LvnWsXNqor2/vIxJxB/r5MvztOtrT3lesykeA==
Received: from DM6NAM12FT003.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::47) by
 DM6NAM12HT009.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::155)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8; Sat, 20 Feb
 2021 00:31:13 +0000
Received: from DM6PR14MB2348.namprd14.prod.outlook.com
 (2a01:111:e400:fc64::45) by DM6NAM12FT003.mail.protection.outlook.com
 (2a01:111:e400:fc64::340) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend
 Transport; Sat, 20 Feb 2021 00:31:13 +0000
Received: from DM6PR14MB2348.namprd14.prod.outlook.com
 ([fe80::31cf:2cae:54cf:8d8]) by DM6PR14MB2348.namprd14.prod.outlook.com
 ([fe80::31cf:2cae:54cf:8d8%3]) with mapi id 15.20.3868.029; Sat, 20 Feb 2021
 00:31:13 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: overlayFS security concern
Thread-Topic: overlayFS security concern
Thread-Index: AQHXBx2UWn4JuuHBIkS3VJD7oQMUJA==
Date: Sat, 20 Feb 2021 00:31:12 +0000
Message-ID: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:07FF6C7BC26040FD0E5CF4638F54A37E3CA0D41AF7A2EB38F3C4BF4FD62D15D0;
 UpperCasedChecksum:0C93C964D3C190620A73014B229D9D70A11919A70C171383D82C7AB0C895AE0E;
 SizeAsReceived:6659; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [iS2IeKtiDrMKP9b09LavSKELXRhZgFDp]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 1c891e18-0c8e-4440-8194-08d8d536d3ce
x-ms-traffictypediagnostic: DM6NAM12HT009:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tWkKsxYCNeFgJofMKvHyQzNlF1bh7hbTA/mGmwYAXPhMoxRU4o8c626kvz85d1JyFswGjnmANk/L3zvsFu7/UVC04SB9BHRvBU6f5QqxnGpdpRamn+HmYdHAytzWIP6jtva8zhfCOKn/IzYZ1CMOCix/Uy7qy6R/Vnu7Qv7Q1ZenVn6iWJHEt4SyVqmIwXemH3CmOllwYAaHfNWQHG2BjyLRNtH6syFJzHQNVZwHUxnxUrfsBmFcd3jxoW+UwDpsquUDcc00vAmPh9EDGiScrDe5NERzL+vgw8092cbMBZ7IWO+PYK5wZhuyGCMmIbNBWb+Pj9d0wPckt9MWhQDnmsDHn9K2MVwn0HkyGfnbvEU5rYQKTjv38qgANxNUkgAXApSgZlRSq6YFgZ/Hk9t3Pw==
x-ms-exchange-antispam-messagedata: OTqxjFbApkPaAMMvaL/XEj+EzNCSTD0kY0MfvatRcTShwHfXrl72C0NlmsSHfRxflpaPGqf7DGNVzuEb7FyKUq3acIV3FwLthEQwZTGstYDkeQ4ui+WutUmX5zThhEUoRoWsqdqhJU+9e18u74tEMQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR14MB23420BA1183F22A48EF8B97ACF839BYAPR14MB2342namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT003.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c891e18-0c8e-4440-8194-08d8d536d3ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2021 00:31:13.0072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT009
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

--_000_BYAPR14MB23420BA1183F22A48EF8B97ACF839BYAPR14MB2342namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Have the following case ever been discussed before?,
Anyone knows the root password will be able to let bmc run their own code b=
y scp the code into bmc with the same file path as any services in rootfs. =
It will make the secure boot totally useless.

So besides,
1. disable scp (but scp is one of the firmware upload way)
2. don=92t use overlayFS (but it=92s really useful for debugging during dev=
elop, and configuration management)
Any other solutions?



Thanks.
Kun


--_000_BYAPR14MB23420BA1183F22A48EF8B97ACF839BYAPR14MB2342namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:890070051;
	mso-list-type:hybrid;
	mso-list-template-ids:-1237923318 67698689 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
</head>
<body lang=3D"EN-US" style=3D"word-wrap:break-word">
<div class=3D"WordSection1">
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
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">2. don=92t us=
e overlayFS (but it=92s really useful for debugging during develop, and con=
figuration management)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle">Any other sol=
utions?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal">Kun<o:p></o:p></p>
<p class=3D"MsoNormal"><span class=3D"DefaultFontHxMailStyle"><o:p>&nbsp;</=
o:p></span></p>
</div>
</body>
</html>

--_000_BYAPR14MB23420BA1183F22A48EF8B97ACF839BYAPR14MB2342namp_--
