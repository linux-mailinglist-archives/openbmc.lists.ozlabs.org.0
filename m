Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EC01E0F82
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 15:30:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Vyf02rmwzDqPR
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 23:30:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.63;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=EoMKjrfl; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255063.outbound.protection.outlook.com [40.92.255.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Vyck320dzDqNd
 for <openbmc@lists.ozlabs.org>; Mon, 25 May 2020 23:29:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJgLlDmkRBxqwb/sHCOmoYETJj4BGkKLlG2/elekJ+vTFTLLvFkKsklMmyiWFRM6CKq0EVgum/MlaIZ//2z92GcV3dgjSFubc+jbjG0BJTTrhTw5/wJimHrB+dPEbFNsGoyIRiS38rVANydPR/NjSk5GKiAvWR+hCbLVPlTnLjPVNJjR1Hhv4RY/dl6Aqsm9ytVt6GQAJnqsQwkaQgJ9pkVU3MkJsy5JMxXB9nxiu+x69/lQtnGp2v/mK/NX7SjzJjdAM1cTTMOgSpLgMkeux8aA4M+Ds2ZhStCL2kFtD7dTIUj5N/FCHkBFQw7mEwgiTouctBKa6YndqpwuRM+LOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsFVr8X9Tw2yhK4VqHWaLxZUOT43wx94PZorATK3fjM=;
 b=DlmXqbIneRvWDgzzkl6vhkNN7vU5F53nh1UPzwu6t7vf/xf859ANE7EX0oDx3TGqZuZG9hdrr0kYHZ7hPCxRzqKErXfpZe4gTvGS/XZOYQK1o47LwtS2UhUHmJO6GrPbE3gMF6kGkhFjwzBZzmBK+Qx9OejEHg5uJoSRHLNeairdQE5DqJJqFQWY/fa1Q7kEPE8mfV8kJy/c8TuHSibMmiCpxMzhh3vkT7d2gkLAmOjSN0tILsh0sx0CpGORul/OmnqT3+nVhUAZng6upjN/xgt5obfxP4nd4/nfGiEsAm+qEebcT3TtrNRmhUJvkTvmvJ3mRQdEB0G9zPCPgN1sjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsFVr8X9Tw2yhK4VqHWaLxZUOT43wx94PZorATK3fjM=;
 b=EoMKjrfl+Hn6lR2gikk2Wm4Id5i8Z8yCPjWsk8gwfa0Y/ABf4HfCucPhGeHjBVnAFVyC1tL3c+A1QIrWOZnOrCeV30JuNRKhaEojLL/scKopPx9cQe1XcF4NXliaXf1/YRKyT+s6rG+T7Jr5ZfpFseFkFkBfEit10W9ReB/6o0o2rVotGn8n+IkF3iN3/9RzBMxMjUDCvD0xiZBm1hdZMXlOM7qFMVZWN4r7Scg7kb29hAfNzqi3mQkZkMZBuG43vKNsE+z7lUbf80Uc8Yks6BD/JMsj7DsXclqCt4oT+Edf7zSQXCtFq82mNQwvH1VrkzpeSmJ8WJxg33L2waKmQQ==
Received: from HK2APC01FT026.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::51) by
 HK2APC01HT216.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::309)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Mon, 25 May
 2020 13:29:35 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::41) by HK2APC01FT026.mail.protection.outlook.com
 (2a01:111:e400:7ebc::174) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Mon, 25 May 2020 13:29:35 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 13:29:35 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "uperic@163.com"
 <uperic@163.com>
Subject: About FRU
Thread-Topic: About FRU
Thread-Index: AQHWMphk/W/HEhL68Em0gcVDMnsrwA==
Date: Mon, 25 May 2020 13:29:35 +0000
Message-ID: <HK2PR04MB38261243DC62EC7BB7003ABAFEB30@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:BB8092F98F0428D9A758AD04258102E0DCF5B356621C9B975CE40A6408AE04DD;
 UpperCasedChecksum:546B75D116EE5BAA8679C2D59C907D4E63569BE7FC0ED127CBA8016B116E699B;
 SizeAsReceived:6683; Count:42
x-tmn: [N4pAdr5+E8MrKF/6afBKwtx7XWLzR3o8]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 8a6950a8-f290-4545-b148-08d800afaab5
x-ms-traffictypediagnostic: HK2APC01HT216:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PQDCWLNChgPhsvXhb3hCyGyXbRS+zyDdfd4Kt5F5Xwl8gpAjq/Y6SuM6bDXja2HzGng/Pui4ZxRNv67dQgVBP3ZHvOQX/uPS+iq+I3hFrcARzGMnYsvSvxnpFt7lFsA7YmpsZjyCEM1xTRB8p+OC0Hun955Ti70bJo25KN5bdCHGDtNX/B4P3GNaYdYfVWm0U01K0Z0/3gRgmZDUww8GzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: ge0NYJGJkHuytaii/b+VwLkKVaaU065nEmb2ZtmvQxzZyVUz6GED3ujShh1LhdvKin78oe8NXQho3SpNXJ4yiFG+L0RthoQW53dP3tWsqclLYaMEUw6AbOvnjQKM4rPRMyZBC5yTsjDYPuMGQXDYcA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB38261243DC62EC7BB7003ABAFEB30HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6950a8-f290-4545-b148-08d800afaab5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 13:29:35.5776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT216
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

--_000_HK2PR04MB38261243DC62EC7BB7003ABAFEB30HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

DQpIZWxsbyBldmVyeW9uZSwNCg0KICAgICAgIE15IG1vdGhlcmJvYXJkIGhhcyBhbiBFRVBST00g
ZGV2aWNlIHRvIHN0b3JlIEZSVSByZWxhdGVkIGluZm9ybWF0aW9uLiBIb3cgY2FuIEkgY29uZmln
dXJlIGl0IGluIHRoZSBvcGVuYm1jIGNvbmZpZ3VyYXRpb24gZmlsZSB0byBzZWUgdGhpcyBGUlUg
aW5mb3JtYXRpb24gdGhyb3VnaCB0aGUgaXBtaXRvb2wgZnJ1IHByaW50IGNvbW1hbmQ/DQoNCkFy
ZSB0aGVyZSBzb21lIGV4YW1wbGVzIHRvIHByb3ZpZGUgcmVmZXJlbmNlLCBJIGRpZCBub3QgZmlu
ZCBhIHBsYWNlIHRvIGNvbmZpZ3VyZSB0aGUgZWVwcm9tIGRldmljZSBpbiB0aGUgb3BlbmJtYyBw
cm9qZWN0Pw0KDQpJcyB0aGVyZSBhbnkgZG9jdW1lbnRhdGlvbiBhYm91dCBGUlUgaW5kaWNhdGlu
ZyB0aGF0IHRoZSBtb2R1bGUgcmVhZHMgYW5kIHBhcnNlcyBpbmZvcm1hdGlvbiBmcm9tIGVlcHJv
bSwgYW5kIHRoZW4gaXQgY2FuIGJlIHJlYWQgYnkgdGhlIGlwbWl0b29sIGZydSBwcmludCBjb21t
YW5kPyBXaGF0IGlzIHRoZSBwcm9jZXNzIGxpa2U/DQoNClRoYW5rcw0KSGFybGV5DQoNCg==

--_000_HK2PR04MB38261243DC62EC7BB7003ABAFEB30HK2PR04MB3826apcp_
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
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if; font-size: 12pt; background-color: rgb(255, 255, 255)">
Hello everyone,</div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if; font-size: 12pt; background-color: rgb(255, 255, 255)">
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if; font-size: 12pt; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px">&nbsp; &nbsp; &nbsp; &nbsp;My motherboard has a=
n EEPROM device to store FRU related information. How can I configure it in=
 the openbmc configuration file to see this FRU information through the ipm=
itool fru print command?</span>
<div style=3D"margin: 0px"><br>
</div>
<div style=3D"margin: 0px">Are there some examples to provide reference, I =
did not find a place to configure the eeprom device in the openbmc project?=
<br>
</div>
<div style=3D"margin: 0px"><br>
</div>
<span style=3D"margin: 0px">Is there any documentation about FRU indicating=
 that the module reads and parses information from eeprom, and then it can =
be read by the ipmitool fru print command? What is the process like?</span>=
<br>
</div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if; font-size: 12pt; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px"><br>
</span></div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if; font-size: 12pt; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px">Thanks</span></div>
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if; font-size: 12pt; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px">Harley</span></div>
<br>
</div>
</body>
</html>

--_000_HK2PR04MB38261243DC62EC7BB7003ABAFEB30HK2PR04MB3826apcp_--
