Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1331DA788
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 03:53:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RbPF3dc8zDqT1
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 11:53:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.24;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=VCvlr38Q; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253024.outbound.protection.outlook.com [40.92.253.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RbNY6p43zDqBs
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 11:52:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AStn7QPZN1frrQHo9yJ/lbEYy5/BXEGirrHA+EtZXKEc04WCEtiATCY3rV6CtssN5J6Hms8RkMlo0jTFxOQsMJ5VigULXL/yX+OdMT53++rSXB8fX2NikRqDOdvq6Lck6vu9vt4r5dtIMGP90aUh/LYpTQUNAFu51er6EneOk2gAaIAk1WNUsGaykGpDDtsup0tWpuhrRQuyEJ++D3qq+wHpimYFZ7l/8OT2CyhPRundGfSf5a90IA//LfcpWQawcIyTtGP1rUUyvkehHodSLSUES+4BnVvCN30zh46UNghroMmZBoG7yVb7hX10rN2DsXCx1o42CCPJ4L3A3Lt9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut8lbvQAPLTVKt/4mK59B4hESGAsof62CmZ4PPATBwQ=;
 b=elQWoT/qdptUK9WusDU1Wpi2l/gS0TNWE1M7Ofl5DGkwWmgCESpWjeu5fc5YLO4ivNptCatWk2poMPxwcIKMWjNPxfuOvTRKmsZASUyOqdiDddrRBVn48vPLVyt8mf8MbE7ojqbPsznyk5RTm1Y3ZNbM1nAzEomUrvB5t7SG6wh3Sby4EZwBoCACGnDgyFY2h+cJ32Dx+3UD86zXacYrAEibUrn8RkOnEwckz7/+5fQdc22q6i6EDd87r6Ob9AUgheAAciNkTvUFCMMuFVMqetvQX/0BLhi63NlrQiTnoR2c3VGc26SXgEJ4WuuGUX0zeRxD9lZg3d0GukmeYlZnvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut8lbvQAPLTVKt/4mK59B4hESGAsof62CmZ4PPATBwQ=;
 b=VCvlr38QCjaoFSYdIQ+LbjhFaf9Xopz0SxoAyFWFk62jJ8Qs/9ySwoYpnuBwSvgcOePiMsZ2GI1U3FKXKNNVYgxbxKANvrkHu1Ss54cTVe0eXLPVql35zGFTQt73nsGD5nivJCD6EzuMrDP7HfdiX44YC+HbD1MIz8JRDyU9wRpjTW3eJZJ4EmkmATbWSOxe7iSoN4A1Eu0HNL1xmuZyxZLLpnlluC8cLrnGH/VwMhA3diFFVWkhgBtrfV0myRnqSqHrGiZrKrHlOqGHiQgNAQnEomjE9PC1s8vRJad/8cgPMKfNnqwdFf89sb6SabKHIMsdjWfGFi7xSPo7pYT+cg==
Received: from SG2APC01FT039.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4c) by
 SG2APC01HT129.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::254)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Wed, 20 May
 2020 01:52:22 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebd::4b) by SG2APC01FT039.mail.protection.outlook.com
 (2a01:111:e400:7ebd::268) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Wed, 20 May 2020 01:52:21 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 01:52:21 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: Brandon Wyman <bjwyman@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?gb2312?B?u9i4tDogYWJvdXQgaTJjc2V0IHRvb2w=?=
Thread-Topic: about i2cset tool
Thread-Index: AQHWLa7MbAvo7dLSNkS2YWkgRula2qivyvOAgABjYbo=
Date: Wed, 20 May 2020 01:52:21 +0000
Message-ID: <HK2PR04MB38264DE2EBB55794E2913D3FFEB60@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB38266B4510637846C7FAF9FCFEB90@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <28c93e52-3e69-79b4-69f0-c30d2422dbc2@gmail.com>
In-Reply-To: <28c93e52-3e69-79b4-69f0-c30d2422dbc2@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A92581612A5E013D66CC17C64DB67451256CA1AEEF83ABB2D3740B79FBD2397F;
 UpperCasedChecksum:1A08D9FFBEAD2B0B5D627CED8C20D442F04168790EB4750D272BF2571CFE0C6F;
 SizeAsReceived:6976; Count:44
x-tmn: [JHt+MezODHep8zR4eZq113VP8MkxV7hR]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: d4f6b46f-6e87-40ca-d21a-08d7fc606fd6
x-ms-traffictypediagnostic: SG2APC01HT129:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: skaTO0gzmVcfVQuXwUO8XdaLFveMimlzsmT5FiRFlmt5g6Fdbmw9JaOZnyC2wVd67bSWEPX3ltscmeMHzDSx1TZAuzG4CLaNZIfN1ymTStFyjIdGfa6EFgcqVK2P6+w/hOxahg1+eDXlVOJGtQzyMiTnRLcpi5yxMG/vnc4Qjgg9T7zZPDaNUj/oENJkRNhKcT+YwC07XR9P2MWBKKeKl/SQPkjiyGymKphq274UMLDE4IFJtaVq6+piZ1VGOVJH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: q8bD9+F3KNsenJlOJw38qJHvOVv1oWgIsWyFrmU75vbHBzgAVQ0H0iDb9/0tIaW0/cu8uN6OmR5x6xLeJejNjigUZnkmPkak+log6r8KPYkx/XxuUyzIN/oe3yH2FspchBb/UV6s8ydxPBsrQvRiTQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB38264DE2EBB55794E2913D3FFEB60HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f6b46f-6e87-40ca-d21a-08d7fc606fd6
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 01:52:21.4706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT129
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

--_000_HK2PR04MB38264DE2EBB55794E2913D3FFEB60HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQnJhbmRvbiwNCg0KICAgU29ycnksIEkgZGlkIG5vdCByZXRhaW4gdGhlIG91dHB1dCBpbmZv
cm1hdGlvbiBvZiB0aGUgaTJjc2V0IGNvbW1hbmQgYmVmb3JlLCBJIGNvcGllZCB0aGUgb3V0cHV0
IGluZm9ybWF0aW9uIGZyb20gdGhlIGkyY2dldCBjb21tYW5kLg0KDQogICBJIHRyaWVkIHRoZSBm
b2xsb3dpbmcgY29tbWFuZCwgdGhlIHJlZ2lzdGVyIHN0aWxsIGNhbm5vdCBiZSB3cml0dGVuLCBh
bmQgdGhlcmUgd2FzIG5vIGVycm9yIG1lc3NhZ2UuVGhpcyBjb21tYW5kIGlzIHRvIHR1cm4gb24g
dGhlIExFRCBsaWdodC4NCg0KL3Vzci9zYmluIyBpMmNzZXQgLWYgOSAweDEwIDB4ODIgMHhmZmZm
IHcNCldBUk5JTkchIFRoaXMgcHJvZ3JhbSBjYW4gY29uZnVzZSB5b3VyIEkyQyBidXMsIGNhdXNl
IGRhdGEgbG9zcyBhbmQgd29yc2UhDQpJIHdpbGwgd3JpdGUgdG8gZGV2aWNlIGZpbGUgL2Rldi9p
MmMtOSwgY2hpcCBhZGRyZXNzIDB4MTAsIGRhdGEgYWRkcmVzcw0KMHg4MiwgZGF0YSAweDEwMiwg
bW9kZSB3b3JkLg0KQ29udGludWU/IFtZL25dIFkNCg0KICAgIGkyY2dldCBjb21tYW5kIHdvcmtz
IGp1c3QgZmluZS4NCi91c3Ivc2JpbiMgaTJjZ2V0IDkgMHgxMCAweDAyIGkgMw0KV0FSTklORyEg
VGhpcyBwcm9ncmFtIGNhbiBjb25mdXNlIHlvdXIgSTJDIGJ1cywgY2F1c2UgZGF0YSBsb3NzIGFu
ZCB3b3JzZSENCkkgd2lsbCByZWFkIGZyb20gZGV2aWNlIGZpbGUgL2Rldi9pMmMtOSwgY2hpcCBh
ZGRyZXNzIDB4MTAsIGRhdGEgYWRkcmVzcw0KMHgwMiwgMyBieXRlcyB1c2luZyByZWFkIEkyQyBi
bG9jayBkYXRhLg0KQ29udGludWU/IFtZL25dIFkNCjM6IDB4MDMgMHgwMCAweDAwDQoNCi91c3Iv
c2JpbiMgaTJjZ2V0IDkgMHgxMCAweDAyIGkgMw0KV0FSTklORyEgVGhpcyBwcm9ncmFtIGNhbiBj
b25mdXNlIHlvdXIgSTJDIGJ1cywgY2F1c2UgZGF0YSBsb3NzIGFuZCB3b3JzZSENCkkgd2lsbCBy
ZWFkIGZyb20gZGV2aWNlIGZpbGUgL2Rldi9pMmMtOSwgY2hpcCBhZGRyZXNzIDB4MTAsIGRhdGEg
YWRkcmVzcw0KMHgwMiwgMyBieXRlcyB1c2luZyByZWFkIEkyQyBibG9jayBkYXRhLg0KQ29udGlu
dWU/IFtZL25dIFkNCjM6IDB4MDMgMHhmZiAweDAwDQoNCi91c3Ivc2JpbiMgaTJjZ2V0IDkgMHgx
MCAweDAyIGkgMw0KV0FSTklORyEgVGhpcyBwcm9ncmFtIGNhbiBjb25mdXNlIHlvdXIgSTJDIGJ1
cywgY2F1c2UgZGF0YSBsb3NzIGFuZCB3b3JzZSENCkkgd2lsbCByZWFkIGZyb20gZGV2aWNlIGZp
bGUgL2Rldi9pMmMtOSwgY2hpcCBhZGRyZXNzIDB4MTAsIGRhdGEgYWRkcmVzcw0KMHgwMiwgMyBi
eXRlcyB1c2luZyByZWFkIEkyQyBibG9jayBkYXRhLg0KQ29udGludWU/IFtZL25dIHkNCjM6IDB4
MDMgMHgwMCAweDAwDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7I
yzogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3pob3V5dWFucWluZzg9b3V0bG9vay5jb21AbGlz
dHMub3psYWJzLm9yZz4gtPqx7SBCcmFuZG9uIFd5bWFuIDxiand5bWFuQGdtYWlsLmNvbT4NCrei
y83KsbzkOiAyMDIwxOo11MIyMMjVIDM6MjQNCsrVvP7Iyzogb3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQrW98ziOiBSZTogYWJvdXQgaTJjc2V0IHRv
b2wNCg0KDQoNCk9uIDIwMjAtMDUtMTkgMDI6NDAsIHpob3V5dWFucWluZzhAb3V0bG9vay5jb208
bWFpbHRvOnpob3V5dWFucWluZzhAb3V0bG9vay5jb20+IHdyb3RlOg0KSGkgQWxsDQoNCiAgICBJ
IHVzZSB0aGUgaTJjZ2V0IHRvIHJlYWQgdGhlIGRldmljZSBkYXRhLCBidXQgdGhlIGkyY3NldCBk
aWQgbm90IHdyaXRlIHRoZSBkYXRhIHRvIHRoZSBkZXZpY2UsIGFuZCB0aGUgb3BlcmF0aW9uIG9m
IGkyY3NldCBkaWQgbm90IHJlcG9ydCBhbnkgZXJyb3JzLg0KDQpmb3IgZXhhbXBsZToNCg0KOi91
c3Ivc2JpbiMgaTJjZ2V0IDkgMHgxMCAweDAwIGkgMw0KV0FSTklORyEgVGhpcyBwcm9ncmFtIGNh
biBjb25mdXNlIHlvdXIgSTJDIGJ1cywgY2F1c2UgZGF0YSBsb3NzIGFuZCB3b3JzZSENCkkgd2ls
bCByZWFkIGZyb20gZGV2aWNlIGZpbGUgL2Rldi9pMmMtOSwgY2hpcCBhZGRyZXNzIDB4MTAsIGRh
dGEgYWRkcmVzcw0KMHgwMCwgMyBieXRlcyB1c2luZyByZWFkIEkyQyBibG9jayBkYXRhLg0KQ29u
dGludWU/IFtZL25dDQozOiAweDAyIDB4MzIgMHhjYw0KDQo6L3Vzci9zYmluIyBpMmNzZXQgOSAw
eDEwIDB4ODIgMHgwMTAxIDINCldBUk5JTkchIFRoaXMgcHJvZ3JhbSBjYW4gY29uZnVzZSB5b3Vy
IEkyQyBidXMsIGNhdXNlIGRhdGEgbG9zcyBhbmQgd29yc2UhDQpJIHdpbGwgcmVhZCBmcm9tIGRl
dmljZSBmaWxlIC9kZXYvaTJjLTksIGNoaXAgYWRkcmVzcyAweDEwLCBkYXRhIGFkZHJlc3MNCjB4
MDAsIHVzaW5nIHJlYWQgd29yZCBkYXRhLg0KDQpXZWxsLCB0aGF0IGlzIGEgYml0IG9kZC4gSXQg
bG9va3MgbGlrZSB0aGF0IGp1c3QgZGlkIGEgcmVhZCwgbm90IGEgd3JpdGUuDQoNCg0KRG8geW91
IG5lZWQgdG8gdXNlIHRoZSBmb3JjZSBhY2Nlc3Mgb3B0aW9uPyBXaGF0IGlzIHRoYXQgMj8gU2hv
dWxkIGl0IGJlIGEgd29yZCAodyk/DQoNCmh0dHBzOi8vbGludXguZGllLm5ldC9tYW4vOC9pMmNz
ZXQNCg0KaTJjc2V0IC1mIDkgMHgxMCAweDgyIDB4MDEwMSB3DQoNCndoZW4gSSBjaGVjayB0aGUg
MHg4MiByZWejrHRoZSB2YWx1ZSBpcyBub3QgY2hhbmdlZC4NCg0KVGhhbmtzDQpoYXJsZXkNCg0K

--_000_HK2PR04MB38264DE2EBB55794E2913D3FFEB60HK2PR04MB3826apcp_
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
Hi Brandon,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;Sorry, I did not retain the output information of the i2cset c=
ommand before, I copied the output information from the i2cget command.</di=
v>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>&nbsp; &nbsp;I tried the following command, the register still cannot=
 be written,&nbsp;and there was no error message.This command is to turn on=
 the LED light.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span><span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri,=
 Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255); displa=
y: inline !important">/usr/sbin#<span>&nbsp;</span></span>i2cset -f 9 0x10 =
0x82 0xffff w<br>
</span>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will write to device file /dev/i2c-9, chip address 0x10, data addres=
s<br>
</div>
<div>0x82, data 0x102, mode word.<br>
</div>
<div>Continue? [Y/n] Y<br>
</div>
<span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>&nbsp; &nbsp;&nbsp;i2cget command works just fine.<span style=3D"care=
t-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; =
background-color: rgb(255, 255, 255); display: inline !important"></span></=
span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>/usr/sbin# i2cget 9 0x10 0x02 i 3<br>
</span>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<div>0x02, 3 bytes using read I2C block data.<br>
</div>
<div>Continue? [Y/n] Y<br>
</div>
<div>3: 0x03 0x00 0x00<br>
</div>
<div><br>
</div>
<div>/usr/sbin# i2cget 9 0x10 0x02 i 3<br>
</div>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<div>0x02, 3 bytes using read I2C block data.<br>
</div>
<div>Continue? [Y/n] Y<br>
</div>
<div>3: 0x03 0xff 0x00<br>
</div>
<div><br>
</div>
<div>/usr/sbin# i2cget 9 0x10 0x02 i 3<br>
</div>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<div>0x02, 3 bytes using read I2C block data.<br>
</div>
<div>Continue? [Y/n] y<br>
</div>
<div>3: 0x03 0x00 0x00</div>
<div><br>
</div>
<span></span></div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> openbmc=
 &lt;openbmc-bounces&#43;zhouyuanqing8=3Doutlook.com@lists.ozlabs.org&gt; =
=B4=FA=B1=ED Brandon Wyman &lt;bjwyman@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA5=D4=C220=C8=D5 3:24<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlab=
s.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: about i2cset tool</font>
<div>&nbsp;</div>
</div>
<div>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><br>
</p>
<div class=3D"x_moz-cite-prefix">On 2020-05-19 02:40, <a class=3D"x_moz-txt=
-link-abbreviated" href=3D"mailto:zhouyuanqing8@outlook.com">
zhouyuanqing8@outlook.com</a> wrote:<br>
</div>
<blockquote type=3D"cite">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi All</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp; I use the i2cget to read the device data, but the i2cset did =
not write the data to the device, and the operation of i2cset did not repor=
t any errors.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
for example:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>:/usr/sbin# i2cget 9 0x10 0x00 i 3<br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<div>0x00, 3 bytes using read I2C block data.<br>
</div>
<div>Continue? [Y/n]<br>
</div>
<div>3: 0x02 0x32 0xcc<br>
</div>
<div><br>
</div>
<div>:/usr/sbin# i2cset 9 0x10 0x82 0x0101 2<br>
</div>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<span>0x00, using read word data.</span></div>
</blockquote>
<p style=3D"margin-top: 0px; margin-bottom: 0px;">Well, that is a bit odd. =
It looks like that just did a read, not a write.</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><br>
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;">Do you need to use the fo=
rce access option? What is that 2? Should it be a word (w)?<br>
</p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;"><a class=3D"x_moz-txt-lin=
k-freetext" href=3D"https://linux.die.net/man/8/i2cset">https://linux.die.n=
et/man/8/i2cset</a></p>
<p style=3D"margin-top: 0px; margin-bottom: 0px;">i2cset -f 9 0x10 0x82 0x0=
101 w<br>
</p>
<blockquote type=3D"cite">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
<div><font size=3D"3" face=3D"Calibri, Arial, Helvetica, sans-serif" color=
=3D"#000000">when&nbsp;</font><font face=3D"Calibri, Arial,=0A=
          Helvetica, sans-serif" color=3D"#000000"><span style=3D"">I</span=
></font><font size=3D"3" face=3D"Calibri, Arial, Helvetica, sans-serif" col=
or=3D"#000000">&nbsp;check
 the 0x82 reg=A3=ACthe value is not changed.</font></div>
<div><font size=3D"3" face=3D"Calibri, Arial, Helvetica, sans-serif" color=
=3D"#000000"><br>
</font></div>
<div><font size=3D"3" face=3D"Calibri, Arial, Helvetica, sans-serif" color=
=3D"#000000">Thanks</font></div>
<div><font size=3D"3" face=3D"Calibri, Arial, Helvetica, sans-serif" color=
=3D"#000000">harley</font></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_HK2PR04MB38264DE2EBB55794E2913D3FFEB60HK2PR04MB3826apcp_--
