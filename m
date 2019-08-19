Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A5923D9
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 14:51:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bv224r5gzDqfS
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 22:51:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.4.85; helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="dKdSYl9Z"; 
 dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-oln040092004085.outbound.protection.outlook.com [40.92.4.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bv0w6J4TzDqcm
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 22:50:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOC+PGsMB2/Z71+bAVuv/IaZXFtlB0t0cGXN3I/r7ybsNITt55xIpDzSSG9ZHu4XIleMFNM2ZPOtTzFA8A4jqAjdzFnVvUZSho82GFttid2kNRmWcjnH1ssS5+9ceQkgpgZAwuA0TPalWGXkWCltK4wefKJtfzRXS03EhKxTHDOF5LdcUmTb6lywbWgpHBBuN5DqM+x+NzUkJcaF+Ywqy6AV2LIme8d9KEtTYYRD5ola4nVPylkLwXbLd221p40atiUlG2rUysI532M6ywbEdCB03C7LjBTUJy4OcqYGtpBiZaRoZdZtzkEF1dtDKm/fAssM+rpKOQYtSlD8IDdCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeaDqNliFOrTDuMH0ZTHd2s99mJGhr9DYyQhoMB3O1A=;
 b=C99dkZuQ/Wj7RBnK++YPiFEqwCH4xGd8hCyvhZw74kd8J2xPPgF5LFm+ehUuiC507c1ZMK8vJbVyJ8Yxe6RxgFqPGFhRbbshWtZZ5o+isJPa6LzP1r6jHkmjJ63KG/eYker+aCaqKjMqBIciiT5W1hV/SxbxXklajVsqdpYq4mcNNP0JFvsPGK/7IxSiE1kyIQpWdgzJVmtOPsjrfW1LnOpCvUCHEL22gPaAXEBH1omwbwCTbJ4JcyXMRIekYon0ut3/QqYd3Ab6dGU0hfWS+HLa6jfqfPCQOeCsB1QdRS/Ct8us1H+Z2PUipgB7Lp28JSJka4ItH0qb6ZHDSrQaPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeaDqNliFOrTDuMH0ZTHd2s99mJGhr9DYyQhoMB3O1A=;
 b=dKdSYl9ZGEFeickqZ5UiYgrHpt/3svY3EszUVbObHNJ3WDF7nD63cy0E+c7Y2suM1KTCvUceKQ7uYLV5LuozGOEsUSJMs9DN6p+yO+lU8irlleXB12XH16rQNfqNdHc4g+OjZ2uR3YaZwIttY2INO16A3qD2TunOxfDBqHnYwJ4plmzqRSIoKB5yJZNXz9YfgkDFu+4TSBZsioMePAQBCPEOdwD0YaFm6mG9jz0fw3U4m9HUadIFQRigejR0DnYXVr3SMoErBYBwinpTt/3gMJKvkdNhA962lNsQlX4Ik5DQdcsGHg2cnTZCqkHpIScFeqkfWRF5yjX2Eo4QSv9w3g==
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (10.152.72.56) by SN1NAM02HT124.eop-nam02.prod.protection.outlook.com
 (10.152.73.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16; Mon, 19 Aug
 2019 12:50:34 +0000
Received: from MN2PR04MB5839.namprd04.prod.outlook.com (10.152.72.59) by
 SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 12:50:34 +0000
Received: from MN2PR04MB5839.namprd04.prod.outlook.com
 ([fe80::c5ce:5bc3:b0fa:7d0]) by MN2PR04MB5839.namprd04.prod.outlook.com
 ([fe80::c5ce:5bc3:b0fa:7d0%4]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 12:50:34 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Socflash says the bmc is write protected.
Thread-Topic: Socflash says the bmc is write protected.
Thread-Index: AQHVVoxoxs+m3mo6VES5fDtPvSrCtg==
Date: Mon, 19 Aug 2019 12:50:34 +0000
Message-ID: <MN2PR04MB5839D33826EF08A499E32167CDA80@MN2PR04MB5839.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:0EACD864B6E452A3ECD551C646100F22C9783C1A8D8F4FB4BE8A4BB7C1FC19E8;
 UpperCasedChecksum:58ECE37A76D2262549E261A7C15E5F18495D4A767EDC22BB9EA15D627F0F1C11;
 SizeAsReceived:6542; Count:40
x-tmn: [5lFiffs7yjqj7Akvdkwzl5lR8yKDmGLCpd4mUllbUXM=]
x-ms-publictraffictype: Email
x-incomingheadercount: 40
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:SN1NAM02HT124; 
x-ms-traffictypediagnostic: SN1NAM02HT124:
x-microsoft-antispam-message-info: pahQqr6aDiwv+e/49l3MaU4mvySpApnYJ3o9+erClxkbGJ5jGrNogTCQcbaNUqziTsNE6J2nSjtOBv7HJJE3CAfkEXnIA+lUe7M3fgGDP/NxelUWQSXsnyZ93Dbmhb+NEPI4FiVwqozPMGvsw+uytDpC17mOuqhDsU5Y6Rp3wbNIP4j/LIOPXDMFaxZJvb8f
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB5839D33826EF08A499E32167CDA80MN2PR04MB5839namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 213e45e3-2cb9-4e60-bc3d-08d724a3d395
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 12:50:34.3539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT124
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

--_000_MN2PR04MB5839D33826EF08A499E32167CDA80MN2PR04MB5839namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, All,
I use socflash to update the BMC firmware. The original BMC firmware can be=
 updated, but openbmc can not be.
Socflash says the BMC is protected. Does anybody know why?

Thanks.
Joe

--_000_MN2PR04MB5839D33826EF08A499E32167CDA80MN2PR04MB5839namp_
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
I use socflash to update the BMC firmware. The original BMC firmware can be=
 updated, but openbmc can not be.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Socflash says the BMC is protected. Does anybody know why?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Thanks. <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Joe<br>
</div>
</body>
</html>

--_000_MN2PR04MB5839D33826EF08A499E32167CDA80MN2PR04MB5839namp_--
