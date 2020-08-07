Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE26F23E76A
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 08:44:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNG7T0c2mzDqw8
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 16:44:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.3.57;
 helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=rqGRQ5F1; 
 dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-oln040092003057.outbound.protection.outlook.com [40.92.3.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNG6D65LBzDqty
 for <openbmc@lists.ozlabs.org>; Fri,  7 Aug 2020 16:43:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLyJFgfbtcrKz/huayFLpogE4GaZjccI+5Vf71yFnqK7ti88h2Nazq77vwg02DUhPPz3g+vXGYQsgD61qEqi4J4dA/Fj4tUwt0MuJ/un8p/wv+dqkY7539Jgq7VYyHE0x84JY0OLndLtPlYePsyKTAdNSEckLTuA076xFZeI/PASgTxMDS/S135T7BuwKGUvt718SCxgGZgarTtA0eTeIHYNCUirpBYOBgWNb3Dx2RlEJhmnhlf04c0rI6ohw17LRifsq7R+6gqaR6ZO8/debLyV/elaEKvqaRSkbQ6+PyOnrSCLSSi7mOtQ7LmVA6qIssfdUOtGXzkCxD4+1Ow0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fkPF1D/OvvDNGJjOe5dhr7xu6isOoxAmoaHWLVvsHg=;
 b=VDkD9JxJMpgPcD77KLyfdDUcogbXg4M/41kj4kWP/5nwYKLkyJOWGzV5sliJgjpR6V+8ZCxzK+iTAlo9RYhTd8GZoozIh00VSifq19g3TlMTcbxyOrPWX26jTToFM+Biyv/QCWWjdn/mPHmGkdxaDrLpB9rmyyG0H8nUBCvYsNoVKq/ZZTtI6W9oZcSsgceAqFlz3K59pubc61zmt03I6ScvK0aRAOVF58/H4z4eqHZeSqZzhhk3fNc0Imj5Ea3znFbxA3pXf1HPgjKpRvKUkk39JyL6kkfWVzX5cfjSGLHRL47jotxp11vVXd0Bz/b6AQ8UorQCHRIC4wCUphHLRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fkPF1D/OvvDNGJjOe5dhr7xu6isOoxAmoaHWLVvsHg=;
 b=rqGRQ5F1g6bfXy/hVGwCt2grW7Ro+BzUaU0N8WDYdZLcEomuQPPGpIMK1ouX69f9Lsvo6gjiyIOgQnqwfRfqNT+HIRLIwlQY+jRTmU9QNsfVjEt3CXWquHOIV32BDXPpzgPvLx+p4y5Q21D6UBJ6FOTzd/HWqavzBS7bxxKzJLVoWBglHIBUvWdfqVjo7dPMr5Ubfdske1vz5G6c1CMIDUKwMAkQM2kSC5mfQcvknXvJM7hQ7zr57tNT6vtNlczdI7j8d7OvNNYjOAkFCGIJ0f4MGNuBQcCnQkcm4B6dc2gUar3TYhSpBOZRsYjzqXwDSgUiRrCK6/qmfwg95FFOvQ==
Received: from CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (10.152.74.54) by CY1NAM02HT104.eop-nam02.prod.protection.outlook.com
 (10.152.74.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 06:43:42 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:7e45::51) by CY1NAM02FT021.mail.protection.outlook.com
 (2a01:111:e400:7e45::443) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Fri, 7 Aug 2020 06:43:42 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3239.022; Fri, 7 Aug 2020
 06:43:42 +0000
From: Zhao Kun <zkxz@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: system power control
Thread-Topic: system power control
Thread-Index: AQHWbF26pALAg0inPk2bxRb0hBQoog==
Date: Fri, 7 Aug 2020 06:43:42 +0000
Message-ID: <BYAPR14MB2342FEAAE4DBA6383E3885FFCF490@BYAPR14MB2342.namprd14.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:182CA0441C4575B57FCDFA2509A1F3715E42C2C2DAF209244183FEE9CC1F7312;
 UpperCasedChecksum:49E8BB5A7C38778A0CF84E13A73472E0357ED1BF8ACBCD7EA6D6FE91322BFC3D;
 SizeAsReceived:6642; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [VLWic7BzYaspMLrvAZ0nBsG5dflfa7cN]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 2500179c-1fff-4379-338f-08d83a9d3981
x-ms-traffictypediagnostic: CY1NAM02HT104:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BXUdrKeRhaSBwZ3bQJgghF+bKdopCpHiMZhGJdi8iOPKEuSm58ErggKKiWet6Gez9vmwRMdL2zJ+RYQtGXDS5B1SKgiti+P6s/3LQbZd7zbafAJ3UmfYnY4p+jE/ZmEq4DyhYA9RIqg+oo6LgwNgCtG3YI/TQi3PPLNROily0dTopEkPMSGLQHpVTwxoHXQoL9hjpLUCjyAnak7xflJ2tQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR14MB2342.namprd14.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: 0NPSSoUbYJOq3o8zL+iRWcO0lqc+Aveo9XByiDACMLZP96FaQ+MiBQdbOtd3wxk4pgrWzdaYEzWAd5F/8U+XC04Z5EUHfUvf8U0+Lw18PGS6eT/FQy7meR4/RnrHkjvW21e0Lt00HvLAQWZuNVVL0Q==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR14MB2342FEAAE4DBA6383E3885FFCF490BYAPR14MB2342namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2500179c-1fff-4379-338f-08d83a9d3981
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2020 06:43:42.1130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT104
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

--_000_BYAPR14MB2342FEAAE4DBA6383E3885FFCF490BYAPR14MB2342namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

I=92m new to learn how to make OpenBMC work on a X86 based system. Currentl=
y I met a problem of mapping the GPIOs about power on/off/reset/status into=
 OpenBMC logic. I understand when user issue a power on request through any=
 user interfaces like RESTful, IPMI, etc., some service (phosphor-state-man=
ager?) will be triggered to check current status and roll out corresponding=
 systemd services to do the job. (please correct me if I=92m wrong)

But I=92m just confused on how those services actually toggle or check the =
GPIOs, there seems be many choices,

  1.  Device tree?
  2.  Using Workbook gpio_defs.json?
  3.  Create some services calling platform specific scripts to operate GPI=
O or I2C devices?
  4.  Using x86-power-control?

So what=92s the most recommended way to do it? Really appreciated If anyone=
 can share some lights.

I thought there must be a mechanism to consume some kind of configuration f=
ile as the hardware abstraction layer. So I guess it might be gpio_defs.jso=
n or device tree.



Thanks.

Best regards,

Kun Zhao
/*
  zkxz@hotmail.com<mailto:zkxz@hotmail.com>
*/


--_000_BYAPR14MB2342FEAAE4DBA6383E3885FFCF490BYAPR14MB2342namp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:872306296;
	mso-list-type:hybrid;
	mso-list-template-ids:93601928 -1 67698713 67698715 67698703 67698713 6769=
8715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I=92m new to learn how to make OpenBMC work on a X86=
 based system. Currently I met a problem of mapping the GPIOs about power o=
n/off/reset/status into OpenBMC logic. I understand when user issue a power=
 on request through any user interfaces
 like RESTful, IPMI, etc., some service (phosphor-state-manager?) will be t=
riggered to check current status and roll out corresponding systemd service=
s to do the job. (please correct me if I=92m wrong)</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But I=92m just confused on how those services actual=
ly toggle or check the GPIOs, there seems be many choices,</p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Device tree?</li><li class=3D"MsoListParagraph" style=3D"margin-left:=
0in;mso-list:l0 level1 lfo1">Using Workbook gpio_defs.json?</li><li class=
=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1">Cre=
ate some services calling platform specific scripts to operate GPIO or I2C =
devices?</li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-li=
st:l0 level1 lfo1">Using x86-power-control?</li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So what=92s the most recommended way to do it? Reall=
y appreciated If anyone can share some lights.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I thought there must be a mechanism to consume some =
kind of configuration file as the hardware abstraction layer. So I guess it=
 might be gpio_defs.json or device tree.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kun Zhao<o:p></o:p></p>
<p class=3D"MsoNormal">/*<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; <a href=3D"mailto:zkxz@hotmail.com">zkxz@hotm=
ail.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">*/<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR14MB2342FEAAE4DBA6383E3885FFCF490BYAPR14MB2342namp_--
