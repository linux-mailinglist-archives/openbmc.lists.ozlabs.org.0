Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A133E1BDF92
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 15:51:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C0L62rhszDr6P
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 23:51:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.88;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=VJAz+wra; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253088.outbound.protection.outlook.com [40.92.253.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C0JR59lZzDr0D
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 23:50:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGFeUiBNiIScEBf2LbTjjNUdgRY17H/SiYbBid0+RT4ebQfsKRh42BXy2bKGNJXedOAwbD84iGN3m/+RGDbRHTHEWfT3Yrod01RYw1gq5RuciVdeEsoXPowhsx2zrpK31XWOQCkliw4qeXlGksWzn8h7T+Cg5bB7fZsF/AbE0OXhIodTBsTcLs6k0FZDpFlWKd+rH/81vccQTZGvG5CJlmhvtC8ldcRvOpKLHkPw+uFor0AS6Uv6BlvxRmiKYdXtSXdJm3R/LGqSFx+rGWwP1AWnfJv6oZkILcj0l0W8iVtrLYVjN8rJ1K//E9zsqPK+E/Oj1BgUOcsQCz3Zu2Qt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Spr/P7YuA2Ucv8tQRWaJUljErGDob9mSrYM0M6Qk+A=;
 b=E3M4MhAPQW6DQMrHlBnKaopJ0vcXpMxbwAKFCV1mZrNVTYKSkqL0wxRgjLFPT12r9lKzm2pBx1wh0wiPUWlMhy/kE+mTzMW4i0iTOaMZO+U9lw+BKyUsXx7UV+DAFRRi88zz9x+SfG7xbtpmbKid6Ob2z6crJRVCOKm4phsY37WdMgumsRH/lmqRzyXkgfw9lJfyu9UszbiHgHwoPe1jfH55D4nzLHP/4JDVKzS2KuDy1OHWRet9kSHIJiqgUdTKpe2ifOTzC9ZbNAk8R2hn1sax5thZb6pGMo0sBPkXrT/mCkUsjNfAw7yzYCsRVhg0VeicNfgVEZEPpTosAbTCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Spr/P7YuA2Ucv8tQRWaJUljErGDob9mSrYM0M6Qk+A=;
 b=VJAz+wraOociMts/0NUu4RFg5gbWntrRJ1gBvNtdpwUP60kKVLS7TgaA5bq3TYUluzS+HWUZ8Z08vNILRLyISiv8O0SQ8091FovLocirMOsgv8wNKKYRYxDEf+GfCFF+BbrW2rB5uW531/kiHQy310YX9xyGs4jqD9cuzCnricfuqxWgfeMpad+fZ0kd+spWRe4cRjBpsjGMvlOBRrTyAqhHBKFCF1em72pgttfcFdLElScbyd+RWw6fqFmCns87bThzYKdBEsuACFSBpH+rNZNPXO+ApcZgNyku7BIfOiOmr/Jkl+fqopgt8AB1Fce7LcDU76oaWghIpII4W9cEFQ==
Received: from PU1APC01FT013.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::51) by
 PU1APC01HT209.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::436)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Wed, 29 Apr
 2020 13:50:09 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::47) by PU1APC01FT013.mail.protection.outlook.com
 (2a01:111:e400:7ebe::78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Wed, 29 Apr 2020 13:50:09 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.2958.020; Wed, 29 Apr 2020
 13:50:09 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Regarding power control
Thread-Topic: Regarding power control
Thread-Index: AQHWHiqrGzFH1lz7CECP6c78axiiEw==
Date: Wed, 29 Apr 2020 13:50:09 +0000
Message-ID: <HK2PR04MB3826D1F6EF548308AC59B65AFEAD0@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:D8D48CCDF03FCCB543B802D5CC5E6AA2671714E128C5CED3C13538B066CF6B33;
 UpperCasedChecksum:9B9F41DA60BD4147632917C80506054666ED3308543AF6B0C7F26C7B30DD107C;
 SizeAsReceived:6723; Count:43
x-tmn: [C71Kqpl9cSgfUZxT+W5jKNxlOX4BgCHa]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: c61da059-cb98-4cce-d498-08d7ec443b54
x-ms-traffictypediagnostic: PU1APC01HT209:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rZox+IP34gwGLNM9sGGSs7/s+IdvuIPc16YMedocqJBKxK028BGgbXg0wXYloNJnw0tHHiGmnJDRY2lTLIETpW2E2tHJHv7Z7fYEJl2oHE1f2zxeVDyt1USa6qht5XHYvcnI/xwZl1OM2Tcf/bVQ7lCXJYMYqlVv/K5EqaC/XbkoeWyF09rHnN7b0IxrGMRXLdwoLOV4EQ8tcShlruWlJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: +2nlhIyoRu34Qrsg1geMhWVb4NchxANZpp7gjHGSKMzwWZgjnFpiTBSWTqSVetHaVGZnnN/uYP3dg7Gcp7T7bMtM21lDRSck36iUiS4xA2mMG/7YDcyhXFw3ssbXFIllf1veVRcGIuI4CTgJp5xnrw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826D1F6EF548308AC59B65AFEAD0HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c61da059-cb98-4cce-d498-08d7ec443b54
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 13:50:09.2351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT209
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
Cc: "uperic@163.com" <uperic@163.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB3826D1F6EF548308AC59B65AFEAD0HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkNCg0KUmVnYXJkaW5nIHBvd2VyIGNvbnRyb2wsIEkgcmVhZCB0aGUgY29kZXMgaW4gdGhlIGZv
bGxvd2luZyB0d28gZGlyZWN0b3JpZXMoZ2l0aHViLmNvbS9vcGVuYm1jL3g4Ni1wb3dlci1jb250
cm9sLmdpdCAmIGdpdGh1Yi5jb20vb3BlbmJtYy9za2VsZXRvbi90cmVlL21hc3Rlci9vcC1wd3Jj
dGwpLiBUaGUgcG93ZXIgY29udHJvbCBpcyBjb250cm9sbGVkIGJ5IEdQSU8sIGJ1dCB0aGUgcG93
ZXIgb2YgbXkgYm9hcmQgaXMgY29udHJvbGxlZCBieSBDUExELiBEbyBJIGhhdmUgdG8gYWRkIGNv
ZGUgdG8gc29sdmUgdGhpcyBwcm9ibGVtPyBJcyB0aGVyZSBhbnkgZXhpc3Rpbmcgc29sdXRpb24g
Zm9yIHRoZSBPcGVuQm1jIGNvbW11bml0eSBjb2RlPw0KDQpUaGFua3MNCmhhcmxleQ0KDQoNCg==

--_000_HK2PR04MB3826D1F6EF548308AC59B65AFEAD0HK2PR04MB3826apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regarding power control, I read the codes in the following two directories(=
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant">github.com/openbmc/x86-power-control.git
 &amp; g</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: Calib=
ri, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255); dis=
play: inline !important">ithub.com/openbmc/skeleton/tree/master/op-pwrctl</=
span>).&nbsp;<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Aria=
l, Helvetica, sans-serif; font-size: 12pt; background: var(--white);">The
 power control is controlled by GPIO, but the power of my board is controll=
ed by CPLD. Do I have to add code to solve this problem? Is there any exist=
ing solution for the OpenBmc community code?</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background: var(--white);"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt; background: var(--white);">Thanks</span></div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
harley</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;&nbsp;</div>
</body>
</html>

--_000_HK2PR04MB3826D1F6EF548308AC59B65AFEAD0HK2PR04MB3826apcp_--
