Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 436D9A1307
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 09:54:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jvz05KJlzDqQC
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 17:54:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.6.21; helo=nam03-by2-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="qlJWSCnn"; 
 dkim-atps=neutral
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-oln040092006021.outbound.protection.outlook.com [40.92.6.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jvx10BVxzDrQd
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 17:53:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9D3GsI7NAvT6Xh8W2cumQHxnrtANKy+NzTRuyhOnDXVp3oc3IQWIpqWkKyBQrpI2t9Ck/eSRtOpWQ6O7JUTupMry19EMEI/Lnhhg2LCyr5+gLlP6UrpF/EkzuEiggJDvLV7R98PbiXbfbefkLwmm/bAnmD0aSeHzoduEW4dWG+3SpPSCmVTjssr+VDJ8Kotp53ihX9lIAEd80JTTNehBTON/48DkTCFjUtWSHuTGur1cf6pykOH12y+Q+7RHYZfbq6t1VhRwYN9y4VholVVQJuAa+ASb4Ji98nyb8YWgz7Cr9+ESGAi8yPfeYaJHYf3RHf/UKEmrl5GejBUczQ+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEBsIpLtUyPTfjI5sFMf/4Yge/Hg0hK1ZNE2gJ8Ee5Q=;
 b=a8MH5n1nC7GhgHiNVRqQ+ZWyfnfOSsdBZkqwv0UZ/2dEsdaYAnzs9i2ZydzFaY+Yr3B9TzwwYO0M2QWrY+ScjGN1HRX8J7COXttL7ILGgYz3pBvL68nqY1Vg5nmbal6TzANRBQilS9KvWj5b6Fskgw8mtbRfrScowyr9812YMRELd1WCKa1LGDn96DsuLCs5SoC10WsiWPLVgLH6i535gQ43Bl3xMh+NDkL477sioQkkamQVaraSAkZ6oTibJFDmGt0sKWa6zg7R4o4kCIQqlAExJA2Bc5e4B/VvJQi+EobrEh80Qn4R9mU6W+1O63sdBx8kAtZx5X0N1ZRF3hNDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEBsIpLtUyPTfjI5sFMf/4Yge/Hg0hK1ZNE2gJ8Ee5Q=;
 b=qlJWSCnnH6MD1XtULrdtjcLJAAOkd6YDi0qnJpvEDI5F9tfmK2aJC/SxI30EadbYCJwEwfqJBeoFUuaesdz+BkweYSy1vRnQjAgaUlc9FC230P7uDlIFHfsliQIKPL8xR8qlYPc+bIPQtY4sutD4KTD8nodPDmRZrVjfPRUa/20jUBDT0iEIyiVg2izUHz0gIt+fut5vwPiwalOE9by69qzPNTpeJ2lGn3p855nNKP6neEE1m5q1v8PKpvPdZ1l+CAyclSOuPViMHqzQJbglniLWZrDU0YAYFkkEJZS/UAywFdp45fOMYkmdrS2n4LB33iLhA3lGrE0NjSgKmGrqBw==
Received: from BY2NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (10.152.84.53) by BY2NAM03HT032.eop-NAM03.prod.protection.outlook.com
 (10.152.85.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Thu, 29 Aug
 2019 07:53:03 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.84.60) by
 BY2NAM03FT049.mail.protection.outlook.com (10.152.85.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 07:53:03 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676%2]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 07:53:03 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: phosphor-ipmi-kcs(kcsbridge) is not included in image.
Thread-Topic: phosphor-ipmi-kcs(kcsbridge) is not included in image.
Thread-Index: AQHVXj5rgjE4Apjpo0elvejN3Ix5/A==
Date: Thu, 29 Aug 2019 07:53:03 +0000
Message-ID: <MN2PR04MB666928CBD20DF6A0D894273FCDA20@MN2PR04MB6669.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:2C338F23E4968BA4092885EE75295F5E6AA95060F15C4430D42D92697721553C;
 UpperCasedChecksum:6937C135A098ACA123A28F3A55F63E6A150A28CC4E54042E63EF8D53A661DD06;
 SizeAsReceived:6525; Count:40
x-tmn: [tTVRob5MuyHh6LhdcyvyiPfb0MZEIHm3]
x-ms-publictraffictype: Email
x-incomingheadercount: 40
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119158)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:BY2NAM03HT032; 
x-ms-traffictypediagnostic: BY2NAM03HT032:
x-microsoft-antispam-message-info: lryFDxswg9q5LCkwoeFPYQ7oaWYM6fQTWHmj1xF+9WZDFIcPcOEAbwcJJqgnQs9iZg6bKne0iFeSK0IKYcyRrz/vAnIPAZpbe5a0vR2AIsMQjUP2W4gby+5V0DGCAVJq5x4jpEZBGChKn6jO8wuTps9gNGyfB1nBECtVT6Swvh4jhDdFtdhdq3L3kdRpyZZS
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB666928CBD20DF6A0D894273FCDA20MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 35afcfc1-88ea-42c0-7817-08d72c55ebd1
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 07:53:03.5259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2NAM03HT032
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

--_000_MN2PR04MB666928CBD20DF6A0D894273FCDA20MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, All,
I tried intel/s2600wf and faceboot/tiogapass, but neither of the final imag=
e has kcsbridge.

I checked both machine/xxx.conf and found the line
PREFERRED_PROVIDER_virtual/obmc-host-ipmi-hw =3D "phosphor-ipmi-kcs".

It seems that it should be built and included in the image.

Anything wrong? Thanks.

Joe

--_000_MN2PR04MB666928CBD20DF6A0D894273FCDA20MN2PR04MB6669namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hi, All,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I tried intel/s2600wf and faceboot/tiogapass, but neither of the final imag=
e has kcsbridge.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I checked both machine/xxx.conf and found the line</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
PREFERRED_PROVIDER_virtual/obmc-host-ipmi-hw =3D &quot;phosphor-ipmi-kcs&qu=
ot;.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
It seems that it should be built and included in the image.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Anything wrong? Thanks.<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Joe<br>
</div>
</body>
</html>

--_000_MN2PR04MB666928CBD20DF6A0D894273FCDA20MN2PR04MB6669namp_--
