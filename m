Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 976E02E7755
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 10:13:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5QZ303cRzDqHh
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 20:13:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.75;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=liuxiwei1013@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=sgtypfAg; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253075.outbound.protection.outlook.com [40.92.253.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5QY86fTSzDqGp
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 20:12:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/yZRdQ2ItO33oir4y9ynmanrpFz7pnePY1+SDqFOEZJSc1q3jrYgYgImQM+k3M6j7klBytUeRli2vIXgEO7xDLVx8t2pHHWUwdBs4kyMmiLsWrkZ4iiYeOW0LIIMwqg00DUPikrf7EFCANtxLccc4DN282wuseWrRH1ztJH6p4nlZoKvDNlYFrzjwYi2ZkuqXc+yyrG/iuqWBAT6jd7g7a8zE/0oRoYMZL4eTjsfi/HcLBlRDh5TIdXiK4KPtcK58N5uhMTGPRiq0ryVvYEayAApEKHnWY7GI2DqYno57N7ATZsScVnn4WrtbsTO8OjymOgtLd0pahbGbbMv75tpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=om0zHZGK4Hqw9JuhTiucSqJz7hasSl6bfPoQLjMIUNY=;
 b=Bo4isJaOdW+pUY+PPRrJPI4BsBfYyfe/7V5iCwhWrYEBno4DVst869AD98a2cAmdUtI/5xrH1RHCQaaYzX48OH9fk+cNNz/cbIFkiq1t6VS4JZ0vS7nu0k9kl6+pQtBwQqge3sApBGaItLFBWGtGBvZAONilxI8cJywEwoz0dXiE301765uUZIomljSEu5n1IT9QRhlg6+bm6od/xlEbx3fyZXh82hHwt6CMgtE3WJAxyVh7F5YzTxTK8No+985Bedm8fo8b4PvQaIei/9Gn8q/HCrwI7iw8Yl/eWEUpiGKE7IK24NJKM8cnA7tmLXv5WD2GsB5CG0N9PFOJUMJKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=om0zHZGK4Hqw9JuhTiucSqJz7hasSl6bfPoQLjMIUNY=;
 b=sgtypfAgT3qMJ4leYtw6xw9ibMBMrKmszDnNKTPVVYIP4Abp9vE0/qHB2hX+thpoUY5DJ4vB/qq4PKDJ85LLosQJdu2NJtE4Bmqdtg1EelHO2Y/IUCmaWHJQmSQUfOhEIkW78cHlkQb8X6RO7znjQ8ivEeVVE3HGJSbfJmFDrzqNHrMXykJppTsP6ZTOsIxTsHSUtjl8vPmgE9fx+Zd/xEBk4ulUz9EUZjAchnuUh+BAyns7pfuJyEBCN6qzzwGy96IxUlVBIdbXFI16/8MK95Pr3/e5fw7NICXog7GtX7mKWl8M1pVStaWdJcxpGl1UFFKAfivTYqxMVDgPnHfy8A==
Received: from PU1APC01FT016.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::51) by
 PU1APC01HT237.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::411)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Wed, 30 Dec
 2020 09:12:33 +0000
Received: from SYBPR01MB5226.ausprd01.prod.outlook.com (10.152.252.54) by
 PU1APC01FT016.mail.protection.outlook.com (10.152.252.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Wed, 30 Dec 2020 09:12:33 +0000
Received: from SYBPR01MB5226.ausprd01.prod.outlook.com
 ([fe80::a964:8d8f:dae:9d5]) by SYBPR01MB5226.ausprd01.prod.outlook.com
 ([fe80::a964:8d8f:dae:9d5%5]) with mapi id 15.20.3611.031; Wed, 30 Dec 2020
 09:12:33 +0000
From: =?gb2312?B?wfUgzv3OsA==?= <liuxiwei1013@outlook.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Does the `Notify` method of phosphor-inventory-manager support the
 `com.ibm...` interface?
Thread-Topic: Does the `Notify` method of phosphor-inventory-manager support
 the `com.ibm...` interface?
Thread-Index: AQHW3ohXxWls3gNwT0K+Vfr4NOv+xQ==
Date: Wed, 30 Dec 2020 09:12:33 +0000
Message-ID: <SYBPR01MB52261EC1E2173DCA08BEE56CC5D70@SYBPR01MB5226.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:0685F61BD8FCBD5F1C31CD28F1A23537B0EEC4DE27F2F3CF2D45B6B44F4C8444;
 UpperCasedChecksum:ECF26127C86D944889ADBCB68847DA4AA9207FD42631B12DAF910283C82F874C;
 SizeAsReceived:6743; Count:41
x-tmn: [IKhQB0kT3y1xw1BdjvJMgrgmr+DBKOP6]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: cb713b9e-1df8-480b-a108-08d8aca30ae7
x-ms-traffictypediagnostic: PU1APC01HT237:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rpe32UrW54RLcPnapl0QWImxaniAprs+JAIa1ZPiaeAeAyJ0EitdLYe3eI4cEyhyg64rph4uGcxinA5d0OcF4rXEI0AUHVySI0tPwocW5QUtX8VefF5IYWysrullgNgpL30cYY5dUxduUHjxqwQOV67JQzzluOHDYY+48rlkx6NQmXtNZ3AiEsqkrCSpRlDyhJoaV2hFa2knqKkPCDm177pRL+VU4ON0uqYiRmzvuxlBUf1Cu4zed+ntN6xhdS23n81aCj73hci+BUgPoKDReZ1oyhTQd9xP7++Oi97eOKE=
x-ms-exchange-antispam-messagedata: 1arNrRYMAbPoidTcQI49XDGdBQBFVxrS1gA2SSLmZbsi4T52e43xtHXy+vWff2ndHF2gUKHJYAEzy6vvTFkneEzuvIDyskMX0Nb9un/IvcmBStu7k3L6q4+vkc4gB6fiI7X8NZ8xIBNZaEwAALBTHQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SYBPR01MB52261EC1E2173DCA08BEE56CC5D70SYBPR01MB5226ausp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT016.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cb713b9e-1df8-480b-a108-08d8aca30ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2020 09:12:33.4294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT237
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

--_000_SYBPR01MB52261EC1E2173DCA08BEE56CC5D70SYBPR01MB5226ausp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SSBwdXNoZWQgYW4gaXNzdWUgcmVsYXRlZCB0byB0aGUgTm90aWZ5IG1ldGhvZCBvZiB0aGUgYHBo
b3NwaG9yLWludmVudG9yeS1tYW5hZ2VyYCByZXBvLg0KDQpodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9vcGVucG93ZXItdnBkLXBhcnNlci9pc3N1ZXMvMw0KDQpJIGFtIG5vdCBzdXJlIHdoZXRo
ZXIgdGhlIE5vdGlmeSBtZXRob2Qgc3VwcG9ydHMgdGhlIGBjb20uaWJtYCBpbnRlcmZhY2UuDQoN
CkNvdWxkIGV2ZXJ5b25lIGhlbHAgbWUsIGxvb2tpbmcgZm9yd2FyZCB0byBldmVyeW9uZSByZXBs
eS4NClRoYW5rcy4NCg==

--_000_SYBPR01MB52261EC1E2173DCA08BEE56CC5D70SYBPR01MB5226ausp_
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
I pushed an issue related to the Notify method of the `phosphor-inventory-m=
anager` repo.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://github.com/openbmc/openpower-vpd-parser/issues/3" id=3D"=
LPlnk969045">https://github.com/openbmc/openpower-vpd-parser/issues/3</a><b=
r>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am not sure whether the Notify method supports the `com.ibm` interface.<b=
r>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Could everyone help me, looking forward to everyone reply.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks.</div>
</body>
</html>

--_000_SYBPR01MB52261EC1E2173DCA08BEE56CC5D70SYBPR01MB5226ausp_--
