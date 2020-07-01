Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96804211683
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 01:17:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xxvH6dTqzDqNH
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 09:16:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=renesas.com (client-ip=40.107.140.132;
 helo=jpn01-ty1-obe.outbound.protection.outlook.com;
 envelope-from=adam.vaughn.xh@renesas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=renesasgroup.onmicrosoft.com
 header.i=@renesasgroup.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-renesasgroup-onmicrosoft-com header.b=fmV16j0+; 
 dkim-atps=neutral
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400132.outbound.protection.outlook.com [40.107.140.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xm8D0zytzDqjb
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 01:57:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkH8nZBZKl6dLcWpXQwpaVfEnUcYpD2I3VyS+QgKheBx0wFzBX87x5G8hHHq+WJCDg2YHcIPQwGCwQg/j8OzISexd/pSlMDmiuuic7PdAEj4UeeV30tFO6CgpRKGXCK8hPQirwOE3/7w4VnHHKg2vu9JYcr0/CrOSfjctz/GyembX3j0uZiP2+LAmBc9YI619rnReFwUaZZRxtIsHGcKhFFnoeQJis+pzYwAfsZCaMzBVcYMjXsXldQ8hWyRrPNpC+ysEPjdW+9wID1Dn1b88aGfTW/InJZPR/euj/v4ZZc+SW5DXMHKPM6Cj+tA7rjhRqdhdYGMZlV7A3TE9+mxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQo7VGhXA91SJCpwY3ywPjvZyx+sA7KEJghg7ZpHzuA=;
 b=CPtS6GoEXNOZMYgvvpBMnhesBK1vImhD0COhv5/xeSRQZ7MXNR1LENaxjUH4W3TiW2cxRA3VhvsJ2SrigoUJ6IJYc9zTDDauO58Vt8BruABpKJGJGo6O1gUZXCJB+xgZy9aMeSgYwJX1NPw2F5fmR6caOJbd0KpWP+gnc8Uo2RBBa7KavN6Uh/qWbObG5ctf+3rnm8SDvzj5YpQjbm/mPafu7bp+9bpx937KFft4WP33kzJKVfowNH1MwmG4EOu0A7LUDHQkm+VdYUwKVWxuuN0uLZhJXVpIt+BXkoGdsi7wewdSbuvWAWQzOLlkFfQlOUZiPGrZ+vvIkJhYm08D6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQo7VGhXA91SJCpwY3ywPjvZyx+sA7KEJghg7ZpHzuA=;
 b=fmV16j0+28DgYQRLyqcKkYr9R2ErPaw5dYEYGhaSPWNkRVRoYWRf1Aq8+gQgFHwo6P6X5q9r9MATsM4yzYFr2ib4k0cnXKh+Oos/x/jkdxYnoJ7QBhTuqiKzGcBgAnbYNReRHy9qQ4T8t6fbRRx7DMbyxfc4rrBEi++pOkCmKgg=
Received: from OSAPR01MB3106.jpnprd01.prod.outlook.com (2603:1096:603:37::9)
 by OSAPR01MB4001.jpnprd01.prod.outlook.com (2603:1096:604:5f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Wed, 1 Jul
 2020 15:57:24 +0000
Received: from OSAPR01MB3106.jpnprd01.prod.outlook.com
 ([fe80::25c0:e3c5:124b:3125]) by OSAPR01MB3106.jpnprd01.prod.outlook.com
 ([fe80::25c0:e3c5:124b:3125%4]) with mapi id 15.20.3153.023; Wed, 1 Jul 2020
 15:57:24 +0000
From: Adam Vaughn <adam.vaughn.xh@renesas.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Backport isl68137 hwmon Driver
Thread-Topic: Backport isl68137 hwmon Driver
Thread-Index: AdZPvjSOMNudnG4aS4qJYJeMqfMLVw==
Date: Wed, 1 Jul 2020 15:57:23 +0000
Message-ID: <OSAPR01MB310610C13FA7E0EEF11D5931D26C0@OSAPR01MB3106.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXGF2YXVnaG5cYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy04YjY3MGE2YS1iYmIzLTExZWEtODMzNy1lNDcwYjg3NmViOTdcYW1lLXRlc3RcOGI2NzBhNmItYmJiMy0xMWVhLTgzMzctZTQ3MGI4NzZlYjk3Ym9keS5odG1sIiBzej0iMjg1MyIgdD0iMTMyMzgwOTI2NDExNzg0NDE0IiBoPSJjbVZVYkxZYjRTRjdkektISzNOS3N5Ylo1ZlE9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [72.48.120.28]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 43e65cc2-8c5e-4253-6cb9-08d81dd7720b
x-ms-traffictypediagnostic: OSAPR01MB4001:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB40010E36E748086378313837D26C0@OSAPR01MB4001.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jVp88rnuhunozymtXCXyf7rtBCVvLlbSgG8U7//vsZWGedqJlKBw5sv89ATGxSAQv8cEQIxAumwNiEtKP7FL0nuOnDyadO4IL+BOB5CQSuSYW1EJoopz/ktF//oftPNZvdYWgShW5NB7EB5Q9Smgv8/9XIL3jaaPE8cpq7XMovbKQy1jdrYuGdcSMfUvpxboLId4TXsHCyPz4Db3JfMtAfkksPJ55RJXTUdU9pvaUwC68S2NgKEEGCcZ0rMLdEVj199IcjkGQoH2Jqo3p5PSXEL/LbP8TyY19+dtNBoDG0cmOr0bkaCwnGnnQ3eZmkqtB3/fI/rMTGgUi627h6IsXvYZ2AaYwBX3x0P3xenhI2Cm3OfNTfqWCXRE52ll5yR+XLYgl2cYSrWq9OlqYckszw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB3106.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(71200400001)(7696005)(4326008)(52536014)(86362001)(33656002)(55016002)(316002)(8676002)(6506007)(9686003)(83380400001)(54906003)(5660300002)(26005)(66446008)(166002)(64756008)(6916009)(186003)(66556008)(2906002)(66476007)(107886003)(66946007)(478600001)(966005)(8936002)(76116006)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8JFg9uuhMp1ZilecIAiubBBqtISTceIkU/UKflYODAXbIislvBk1afnUJDAj8iJJBk/d/z2OE+h+t2wkpAsihoVOVTKy7Yrnd6aBW1ZHJOFYeJRHka6Lo7Ri3zjLo15e5tdeZ1317OU8gYCmTD4ZE3oLBo+nY1/ryqa08wjjAh3Qs59J2BR7sL6OS2bNAw1xnYcvGvLO1ESDRlJyo3wtv/E7YwgJEVR/wcwuS5QvvsW4Ug1guAUSxTKvZufrYx6eHlSqIoq39/W/bhx0ZgXydps8WT65ItU7Dkotnv5fzmx8Y2j+3JWyfFvDc0bQ7GhU8l3e/9NSXJ7uuFd4aDNDbkGaCpnat3WkAQq747oIcGmuroT1BUc3cwb9u2CUgko0JjJOEoJYaClK+WPW9n3HEDTjptKrdhkYER25HNKcMS/l7zgSdcg6+C+4vZWIePnULgkiGud7dTLKEIPjVNINQUWkBuR1yGWnDzicnm0pJWk=
Content-Type: multipart/alternative;
 boundary="_000_OSAPR01MB310610C13FA7E0EEF11D5931D26C0OSAPR01MB3106jpnp_"
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3106.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e65cc2-8c5e-4253-6cb9-08d81dd7720b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 15:57:23.9032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i9MoZo3MSScYBpOR5vtHj5TLLhqtO7smapuJPQB8W/IIlWvb9ZZRMwv4va8Zq85rkcLLwjLq5Rl8GKVSqJ8T0YbDi2WhpmI0aCWhhtU6hyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4001
X-Mailman-Approved-At: Thu, 02 Jul 2020 09:16:18 +1000
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
Cc: Grant Peltier <grant.peltier.jg@renesas.com>,
 Shea Petricek <shea.petricek.wz@renesas.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_OSAPR01MB310610C13FA7E0EEF11D5931D26C0OSAPR01MB3106jpnp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello, OpenBMC List,

Renesas recently published a patch to the kernel isl68137 hwmon driver whic=
h adds support for our current line of digital PWM voltage regulators. This=
 patch is included in the 5.7 release of the kernel. (See https://git.kerne=
l.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=3Dgrep&q=3Disl681=
37)

Many of our customers are OpenBMC users so we would like to integrate this =
new functionality into your codebase to support their current system develo=
pments.

How may we best include our code in the OpenBMC tree?

Regards,

Adam Vaughn
Staff Product Marketing Manager
Core Power Solutions
Mobility, Infrastructure, and IoT Power Business Division

--_000_OSAPR01MB310610C13FA7E0EEF11D5931D26C0OSAPR01MB3106jpnp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello, OpenBMC List,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Renesas recently published a patch to the kernel isl=
68137 hwmon driver which adds support for our current line of digital PWM v=
oltage regulators. This patch is included in the 5.7 release of the kernel.=
 (See
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/log/?qt=3Dgrep&amp;q=3Disl68137">
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=
=3Dgrep&amp;q=3Disl68137</a>)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Many of our customers are OpenBMC users so we would =
like to integrate this new functionality into your codebase to support thei=
r current system developments.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">How may we best include our code in the OpenBMC tree=
?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Adam Vaughn<o:p></o:p></p>
<p class=3D"MsoNormal">Staff Product Marketing Manager<o:p></o:p></p>
<p class=3D"MsoNormal">Core Power Solutions<o:p></o:p></p>
<p class=3D"MsoNormal">Mobility, Infrastructure, and IoT Power Business Div=
ision<o:p></o:p></p>
</div>
</body>
</html>

--_000_OSAPR01MB310610C13FA7E0EEF11D5931D26C0OSAPR01MB3106jpnp_--
