Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC11FFFC6
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 03:38:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p1fT0s7RzDqWY
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 11:38:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.109;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=FqWd3GRf; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253109.outbound.protection.outlook.com [40.92.253.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p1db1FDNzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 11:37:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGBT7MxljskI3mfoY2kKPH0F8goz4Z7IF7cOyc5neLzQUqHpTDaQH0DMPDwZv79bLRq/fYT7yRJu8IIwx4cCp7Ho8AKIiSZIk86vbViC3/C0xCSwRtvvx8tqasUgtcJHnhz3Kke2hji8OIxdu/FvaUizA99fntbIvJ9uoGu0AIDVFJpMhn5yy0lAwpUfE6ZqQFDRKu+nBz+rbb2HWXQ4R0Tl0O0kBITpwggsOdZOp1NU9TwU878lETj0fYZbLY/mLaPSVwCl/UuKTij86ai17Mad27nDp+4MZBIqJq36741uXrOHMXMsA4AysOeAnakC3I8N/kpY9Lym/DrPwMIwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvtmui3cQ+MsAg+9DCIiI8Yy8vJm99c5KRYiVsJ+cr8=;
 b=IEAsvEad5907xdMHI7yL5GqQcCGhT2EdeU4tcCSlDAcaPCUnJwA5WempRw//JAn7dWVYiu8aRoFqmecO6V30vhcJ5W1mwTdyK2gphZeqO9D583Bj/qfYFjbtbPJsmTrLQLur57vLGVtUtCC6PVpCyttYoaqfY2ZULRAyVj7rf1btq1ouiyh1jNtPYFiuQXgAxYJTMRY953z5mIFw+BqRdEuDW2duev80sBwpNsbQo5dn8eq2slL1TeP3OTGO+sOkfvlS7tbiqUrVnRdPca4a7AetjXc7DJHRG3RP2rgc24ZwRBM97vOEdSpQcxmjzQBOD5DprUj/zvIaEfTEAAotRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvtmui3cQ+MsAg+9DCIiI8Yy8vJm99c5KRYiVsJ+cr8=;
 b=FqWd3GRfrgIguQN7E7vl0lEutYGsrmHxR0NevFF0yQ4lA18X403RgwhxVaC2z19jYa8dww2Bs1SQUWEgE79GJCP3CE1To98dGt1MfHKRTLaBuwCP2vCD5Q/0uwpbFxpEqGrqZ1VDKX1rNz60s3huWebYfqjrcUKYMxmR78e6k0pkjlpkwMmlGMkWetugwQo0Y/PUvnnYubGScvh7Byp2wFm0sgQ5FZJxkdxHw4dh0/sHyM+7xGGisLCD6uS6wjpRPyPWXXacMzRdO81pAwOJVjYn/GLGgqpcZIp9cUaPkmggLmJq3gstiCNBVzb+aG/iI2KfmbYt2UWB6U9g09OgLg==
Received: from PU1APC01FT020.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::4c) by
 PU1APC01HT195.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::451)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 01:37:32 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::52) by PU1APC01FT020.mail.protection.outlook.com
 (2a01:111:e400:7ebe::217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Fri, 19 Jun 2020 01:37:32 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f%6]) with mapi id 15.20.3109.023; Fri, 19 Jun 2020
 01:37:31 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>, =?gb2312?B?0/TA1w==?=
 <yulei.sh@bytedance.com>
Subject: =?gb2312?B?u9i4tDogu9i4tDogVGhlcmUgaXMgbm8ga2NzIGRldmljZSBpbiB0aGUgL2Rl?=
 =?gb2312?Q?v_directory?=
Thread-Topic: =?gb2312?B?u9i4tDogVGhlcmUgaXMgbm8ga2NzIGRldmljZSBpbiB0aGUgL2RldiBkaXJl?=
 =?gb2312?Q?ctory?=
Thread-Index: AQHWRQ7NnKu+sXrNAki49Znemi3j0Kjd16MAgAAZhjiAAAjngIABLx95
Date: Fri, 19 Jun 2020 01:37:31 +0000
Message-ID: <HK2PR04MB3826593F8491B30E7CF4190BFE980@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB3826A23CDAA3FC0CE9660D1BFE9B0@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <CAGm54UEHECbM+UjOsGvWDv3XvZr0NZq+-coDPe-MFvGyyDAOsQ@mail.gmail.com>
 <HK2PR04MB382611A4F5E268A3DDD02E10FE9B0@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <27531592465266@mail.yandex-team.ru>
In-Reply-To: <27531592465266@mail.yandex-team.ru>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:3B09CEC267D7F546C4527E3CC12D6133133C1844B3429D30C99337B1B00F11BE;
 UpperCasedChecksum:3578B7997BA7B7B4FEE25F4F13A01C6DCDE77F3B8D5BE960E3D0FC08E8C96A4E;
 SizeAsReceived:7260; Count:44
x-tmn: [sL0PuKbo5LG1gpHzWr4aeEd8hXmiBk7I]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 3e323827-a3a1-41ba-fb86-08d813f155c5
x-ms-traffictypediagnostic: PU1APC01HT195:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bRFtdY8vrmvVF70Q1v0znhRge+6KChCVSom8H4FCc8GAs6GeB818bMME0udPpk4xqM7AA8EkLkrfnux9C2yjS0gVls6Tv7oIVrCL+FlgIZo/QShCObdTgVL56BX6ugG8uLbi01YacKS0dMmUHlmAAK78kxqJUNUprgsJBVzNzWMj35bBQVJqnZcUU5gHixKSsgYGGthphTLG7H5GkvSZSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: /oA5rhf+N+icaLv2vNzorEkRg8L2lLoQCwOkyoBbTtW5hx+Fz8dX5D9mJv6qXz94jVTYNVbUpmMDxVE03JHM24dwvW+BOy8x1GoaJO6HeRCJYNyYjIVCAGMPek+v7MDwUtwZPzBYuU/JfEuS3/4lSw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826593F8491B30E7CF4190BFE980HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e323827-a3a1-41ba-fb86-08d813f155c5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 01:37:31.9619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT195
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB3826593F8491B30E7CF4190BFE980HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQoNCiAgICAgIFRoYW5rIHlvdSBmb3IgeW91ciBoZWxwLCBpIGNhbiBzZWUgdGhlIGlwbWkt
a2NzMyBhbmQgaXBtaS1rY3M0IGRldmljZXMgYWZ0ZXIgdGhlIG1vZGlmaWNhdGlvbi4NCg0KVGhh
bmtzDQpoYXJsZXkNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7Iyzog
S29uc3RhbnRpbiBLbHVibmljaGtpbiA8a2l0c29rQHlhbmRleC10ZWFtLnJ1Pg0Kt6LLzcqxvOQ6
IDIwMjDE6jbUwjE4yNUgMTU6MjgNCsrVvP7Iyzog1twg1LbH5SA8emhvdXl1YW5xaW5nOEBvdXRs
b29rLmNvbT47INP0wNcgPHl1bGVpLnNoQGJ5dGVkYW5jZS5jb20+DQqzrcvNOiB1cGVyaWNAMTYz
LmNvbSA8dXBlcmljQDE2My5jb20+OyBvcGVuYm1jIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+
DQrW98ziOiBSZTogu9i4tDogVGhlcmUgaXMgbm8ga2NzIGRldmljZSBpbiB0aGUgL2RldiBkaXJl
Y3RvcnkNCg0KSGVsbG8hDQoNCkl0IHNob3VsZCBiZSBsaWtlIHRoaXM6DQoNCiZrY3MzIHsNCmtj
c19hZGRyID0gPDB4Q0EyPjsNCnN0YXR1cyA9ICJva2F5IjsNCn07DQoNCiZrY3M0IHsNCmtjc19h
ZGRyID0gPDB4Q0E0PjsNCnN0YXR1cyA9ICJva2F5IjsNCn07DQoNCg0KUGxlYXNlIGNoZWNrIHRo
ZSBhZGRyZXNzZXMsIHlvdXIncyBtYXkgYmUgZGlmZmVyZW50Lg0KDQpUaGFuayB5b3UhDQoxOC4w
Ni4yMDIwLCAxMDowMywgItbcINS2x+UiIDx6aG91eXVhbnFpbmc4QG91dGxvb2suY29tPjoNCkVy
cm9yIHJlcG9ydGVkIGR1cmluZyBrZXJuZWwgc3RhcnR1cKOsQ2FuIHlvdSBoZWxwIHRvIGNoZWNr
IHdoZXJlIHRoZSBjb25maWd1cmF0aW9uIGlzIHdyb25no78NCg0KWyAgICAxLjA3NTkwMV0gaXBt
aS1idC1ob3N0IDFlNzg5MTQwLmlidDogVXNpbmcgSVJRIDMzDQoNClsgICAgMS4wNzY1NDddIGFz
dC1rY3MtYm1jIDFlNzg5MDAwLmxwYy1ibWM6a2NzMTxtYWlsdG86MWU3ODkwMDAubHBjLWJtYzpr
Y3MxPkAwOiBubyB2YWxpZCAna2NzX2FkZHInIGNvbmZpZ3VyZWQNCg0KWyAgICAxLjA3Njc0M10g
YXN0LWtjcy1ibWMgMWU3ODkwMDAubHBjLWJtYzprY3MyPG1haWx0bzoxZTc4OTAwMC5scGMtYm1j
OmtjczI+QDA6IG5vIHZhbGlkICdrY3NfYWRkcicgY29uZmlndXJlZA0KDQpbICAgIDEuMDc2OTIy
XSBhc3Qta2NzLWJtYyAxZTc4OTAwMC5scGMtYm1jOmtjczM8bWFpbHRvOjFlNzg5MDAwLmxwYy1i
bWM6a2NzMz5AMDogbm8gdmFsaWQgJ2tjc19hZGRyJyBjb25maWd1cmVkDQoNClsgICAgMS4wNzcx
MDJdIGFzdC1rY3MtYm1jIDFlNzg5MDgwLmxwYy1ob3N0OmtjczQ8bWFpbHRvOjFlNzg5MDgwLmxw
Yy1ob3N0OmtjczQ+QDA6IG5vIHZhbGlkICdrY3NfYWRkcicgY29uZmlndXJlZA0KDQpbICAgIDEu
MDgzMDIwXSBTZXJpYWw6IDgyNTAvMTY1NTAgZHJpdmVyLCA2IHBvcnRzLCBJUlEgc2hhcmluZyBl
bmFibGVkDQoNCg0KVGhlIGNvbmZpZ3VyZSBpbiBhc3BlZWRfZ3QuZHRzOg0KIGxwY19ibWM6IGxw
Yy1ibWM8bWFpbHRvOmxwYy1ibWM+QDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI1MDAtbHBjLWJtYyIsICJzaW1wbGUt
bWZkIiwgInN5c2NvbiI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4MCAweDgwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZWctaW8td2lkdGggPSA8ND47DQoNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByYW5nZXMgPSA8MHgwIDB4MCAweDgwPjsNCg0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtjczE6IGtjczE8bWFpbHRvOmtjczE+QDAgew0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJhc3BlZWQsYXN0MjUwMC1rY3MtYm1jIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8OD47DQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrY3NfY2hhbiA9IDwxPjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxl
ZCI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrY3MyOiBrY3MyPG1haWx0bzprY3MyPkAw
IHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiYXNwZWVkLGFzdDI1MDAta2NzLWJtYyI7DQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDg+Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga2NzX2NoYW4gPSA8Mj47DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlz
YWJsZWQiOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga2NzMzoga2NzMzxtYWlsdG86a2Nz
Mz5AMCB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLWtjcy1ibWMiOw0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDw4PjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtjc19jaGFuID0gPDM+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0g
ImRpc2FibGVkIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KDQoNClRoZSBjb25maWd1cmUgaW4g
YXNwZWVkLWJtYy1vcHAtc3Rhci5kdHM6DQoma2NzMSB7DQogICAgICAgIHN0YXR1cyA9ICJva2F5
IjsNCn07DQoNCiZrY3MyIHsNCiAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KfTsNCg0KJmtjczMg
ew0KICAgICAgICBzdGF0dXMgPSAib2theSI7DQp9Ow0KDQoma2NzNCB7DQogICAgICAgIHN0YXR1
cyA9ICJva2F5IjsNCn07DQoNCiZpYnQgew0KICAgICAgICBzdGF0dXMgPSAib2theSI7DQp9Ow0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiDT9MDXIDx5dWxlaS5z
aEBieXRlZGFuY2UuY29tPG1haWx0bzp5dWxlaS5zaEBieXRlZGFuY2UuY29tPj4NCreiy83Ksbzk
OiAyMDIwxOo21MIxOMjVIDEzOjI1DQrK1bz+yMs6INbcINS2x+UgPHpob3V5dWFucWluZzhAb3V0
bG9vay5jb208bWFpbHRvOnpob3V5dWFucWluZzhAb3V0bG9vay5jb20+Pg0Ks63LzTogb3BlbmJt
YyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmc+PjsgdXBlcmljQDE2My5jb208bWFpbHRvOnVwZXJpY0AxNjMuY29tPiA8dXBlcmljQDE2My5j
b208bWFpbHRvOnVwZXJpY0AxNjMuY29tPj4NCtb3zOI6IFJlOiBUaGVyZSBpcyBubyBrY3MgZGV2
aWNlIGluIHRoZSAvZGV2IGRpcmVjdG9yeQ0KDQpPbiBUaHUsIEp1biAxOCwgMjAyMCBhdCAxMjo1
MSBQTSDW3CDUtsflIDx6aG91eXVhbnFpbmc4QG91dGxvb2suY29tPG1haWx0bzp6aG91eXVhbnFp
bmc4QG91dGxvb2suY29tPj4gd3JvdGU6DQo+DQo+IEhpIGV2ZXJ5b25lLA0KPg0KPiAgICAgVGhl
cmUgaXMgbm8ga2NzIGRldmljZSBpbiB0aGUgL2RldiBkaXJlY3RvcnmjrEkgdXNlZCB0aGUgZm9s
bG93aW5nIGNvbW1hbmQgdG8gZmluZCBpdCBpbiB0aGUgcm9vdCBkaXJlY3RvcnksIGFuZCBJIGRp
ZCBub3QgZmluZCBpcG1pLWtjcyBkZXZpY2UsIHBsZWFzZSBoZWxwIGd1aWRlLCB0aGFuayB5b3Uu
DQoNClByb2JhYmx5IHlvdSBjb3VsZCBjaGVjayB0aGUgZGV2aWNlIHRyZWUgdG8gc2VlIGlmIHRo
ZSBrY3MgaXMgZW5hYmxlZCBvciBub3QuDQoNCj4NCj4gMS5maW5kIC8gLW5hbWUgKmtjcyoNCj4N
Cj4gMi5CZWxvdyBpcyBteSBrZXJuZWwgY29uZmlndXJhdGlvbg0KPiBDT05GSUdfU0VSSUFMX01D
VFJMX0dQSU89eQ0KPiAjIENPTkZJR19TRVJJQUxfREVWX0JVUyBpcyBub3Qgc2V0DQo+ICMgQ09O
RklHX1RUWV9QUklOVEsgaXMgbm90IHNldA0KPiAjIENPTkZJR19IVkNfRENDIGlzIG5vdCBzZXQN
Cj4gQ09ORklHX0lQTUlfSEFORExFUj15DQo+ICMgQ09ORklHX0lQTUlfUEFOSUNfRVZFTlQgaXMg
bm90IHNldA0KPiAjIENPTkZJR19JUE1JX0RFVklDRV9JTlRFUkZBQ0UgaXMgbm90IHNldA0KPiAj
IENPTkZJR19JUE1JX1NJIGlzIG5vdCBzZXQNCj4gIyBDT05GSUdfSVBNSV9TU0lGIGlzIG5vdCBz
ZXQNCj4gIyBDT05GSUdfSVBNSV9XQVRDSERPRyBpcyBub3Qgc2V0DQo+ICMgQ09ORklHX0lQTUlf
UE9XRVJPRkYgaXMgbm90IHNldA0KPiBDT05GSUdfSVBNSV9LQ1NfQk1DPXkNCj4gQ09ORklHX0FT
UEVFRF9LQ1NfSVBNSV9CTUM9eQ0KPiBDT05GSUdfQVNQRUVEX0JUX0lQTUlfQk1DPXkNCj4gQ09O
RklHX0hXX1JBTkRPTT15DQo+IENPTkZJR19IV19SQU5ET01fVElNRVJJT01FTT15DQo+ICMgQ09O
RklHX1JBV19EUklWRVIgaXMgbm90IHNldA0KPiAjIENPTkZJR19UQ0dfVFBNIGlzIG5vdCBzZXQN
Cj4gIyBDT05GSUdfWElMTFlCVVMgaXMgbm90IHNldA0KPiAjIGVuZCBvZiBDaGFyYWN0ZXIgZGV2
aWNlcw0KPg0KPiBUaGFua3MNCj4gSGFybGV5DQoNCg0KLS0NCkJlc3QgcmVnYXJkcywNCktvbnN0
YW50aW4gS2x1Ym5pY2hraW4sDQpsZWFkIGZpcm13YXJlIGVuZ2luZWVyLA0Kc2VydmVyIGhhcmR3
YXJlIFImRCBncm91cCwNCllhbmRleCBNb3Njb3cgb2ZmaWNlLg0KdGVsOiArNy05MDMtNTEwLTMz
LTMzDQoNCg==

--_000_HK2PR04MB3826593F8491B30E7CF4190BFE980HK2PR04MB3826apcp_
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
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Thank you for your help, i can see the ipmi-=
kcs3 and ipmi-kcs4 devices after the modification.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
harley</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Konstan=
tin Klubnichkin &lt;kitsok@yandex-team.ru&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA6=D4=C218=C8=D5 15:28<br>
<b>=CA=D5=BC=FE=C8=CB:</b> =D6=DC =D4=B6=C7=E5 &lt;zhouyuanqing8@outlook.co=
m&gt;; =D3=F4=C0=D7 &lt;yulei.sh@bytedance.com&gt;<br>
<b>=B3=AD=CB=CD:</b> uperic@163.com &lt;uperic@163.com&gt;; openbmc &lt;ope=
nbmc@lists.ozlabs.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: =BB=D8=B8=B4: There is no kcs device in the /dev d=
irectory</font>
<div>&nbsp;</div>
</div>
<div>
<div>Hello!</div>
<div>&nbsp;</div>
<div>It should be like this:</div>
<div>&nbsp;</div>
<div>
<div>&amp;kcs3 {</div>
<div>kcs_addr =3D &lt;0xCA2&gt;;</div>
<div>status =3D &quot;okay&quot;;</div>
<div>};</div>
<div>&nbsp;</div>
<div>&amp;kcs4 {</div>
<div>kcs_addr =3D &lt;0xCA4&gt;;</div>
<div>status =3D &quot;okay&quot;;</div>
<div>};</div>
<div>&nbsp;</div>
<div><br>
Please check the addresses, your's may be different.</div>
<div>&nbsp;</div>
<div>Thank you!</div>
</div>
<div>18.06.2020, 10:03, &quot;=D6=DC =D4=B6=C7=E5&quot; &lt;zhouyuanqing8@o=
utlook.com&gt;:</div>
<blockquote>
<div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
<div style=3D"font-family:'helvetica'; font-size:12px; font-style:normal; f=
ont-weight:normal; line-height:normal; margin:0px">
Error reported during kernel startup=A3=ACCan you help to check where the c=
onfiguration is wrong=A3=BF</div>
<p style=3D"font:12px 'helvetica'; margin:0px">[&nbsp; &nbsp; 1.075901] ipm=
i-bt-host 1e789140.ibt: Using IRQ 33</p>
<p style=3D"font:12px 'helvetica'; margin:0px">[&nbsp; &nbsp; 1.076547] ast=
-kcs-bmc <a href=3D"mailto:1e789000.lpc-bmc:kcs1">
1e789000.lpc-bmc:kcs1</a>@0: no valid 'kcs_addr' configured</p>
<p style=3D"font:12px 'helvetica'; margin:0px">[&nbsp; &nbsp; 1.076743] ast=
-kcs-bmc <a href=3D"mailto:1e789000.lpc-bmc:kcs2">
1e789000.lpc-bmc:kcs2</a>@0: no valid 'kcs_addr' configured</p>
<p style=3D"font:12px 'helvetica'; margin:0px">[&nbsp; &nbsp; 1.076922] ast=
-kcs-bmc <a href=3D"mailto:1e789000.lpc-bmc:kcs3">
1e789000.lpc-bmc:kcs3</a>@0: no valid 'kcs_addr' configured</p>
<p style=3D"font:12px 'helvetica'; margin:0px">[&nbsp; &nbsp; 1.077102] ast=
-kcs-bmc <a href=3D"mailto:1e789080.lpc-host:kcs4">
1e789080.lpc-host:kcs4</a>@0: no valid 'kcs_addr' configured</p>
<p style=3D"font:12px 'helvetica'; margin:0px">[&nbsp; &nbsp; 1.083020] Ser=
ial: 8250/16550 driver, 6 ports, IRQ sharing enabled</p>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
The configure in aspeed_gt.dts:<br>
&nbsp;lpc_bmc: <a href=3D"mailto:lpc-bmc">lpc-bmc</a>@0 {
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compa=
tible =3D &quot;aspeed,ast2500-lpc-bmc&quot;, &quot;simple-mfd&quot;, &quot=
;syscon&quot;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =
=3D &lt;0x0 0x80&gt;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg-i=
o-width =3D &lt;4&gt;;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #addr=
ess-cells =3D &lt;1&gt;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #size=
-cells =3D &lt;1&gt;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; range=
s =3D &lt;0x0 0x0 0x80&gt;;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kcs1:=
 <a href=3D"mailto:kcs1">kcs1</a>@0 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; compatible =3D &quot;aspeed,ast2500-kcs-bmc&quot;;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; interrupts =3D &lt;8&gt;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; kcs_chan =3D &lt;1&gt;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; status =3D &quot;disabled&quot;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kcs2:=
 <a href=3D"mailto:kcs2">kcs2</a>@0 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; compatible =3D &quot;aspeed,ast2500-kcs-bmc&quot;;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; interrupts =3D &lt;8&gt;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; kcs_chan =3D &lt;2&gt;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; status =3D &quot;disabled&quot;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kcs3:=
 <a href=3D"mailto:kcs3">kcs3</a>@0 {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; compatible =3D &quot;aspeed,ast2500-kcs-bmc&quot;;</=
div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; interrupts =3D &lt;8&gt;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; kcs_chan =3D &lt;3&gt;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; status =3D &quot;disabled&quot;;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</d=
iv>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</div>
</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<div>
<div>&nbsp;</div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif">The configure in aspeed-bmc-opp-star.dts:</span></di=
v>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif">&amp;kcs1 {</span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;ok=
ay&quot;;</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">};</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div>&nbsp;</div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">&amp;kcs2 {</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;ok=
ay&quot;;</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">};</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div>&nbsp;</div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">&amp;kcs3 {</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;ok=
ay&quot;;</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">};</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div>&nbsp;</div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">&amp;kcs4 {</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;ok=
ay&quot;;</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">};</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div>&nbsp;</div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">&amp;ibt {</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;ok=
ay&quot;;</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span>
<div><span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial=
' ,'helvetica' ,sans-serif">};</span></div>
<span style=3D"background-color:#ffffff; font-family:'calibri' ,'arial' ,'h=
elvetica' ,sans-serif"></span></div>
<div style=3D"color:rgb(0 ,0 ,0); font-family:'calibri' ,'arial' ,'helvetic=
a' ,sans-serif; font-size:12pt">
&nbsp;</div>
<hr style=3D"width:98%">
<div><font color=3D"#000000" face=3D"Calibri, sans-serif" style=3D"font-siz=
e:11pt"><strong>=B7=A2=BC=FE=C8=CB:</strong> =D3=F4=C0=D7 &lt;<a href=3D"ma=
ilto:yulei.sh@bytedance.com">yulei.sh@bytedance.com</a>&gt;<br>
<strong>=B7=A2=CB=CD=CA=B1=BC=E4:</strong> 2020=C4=EA6=D4=C218=C8=D5 13:25<=
br>
<strong>=CA=D5=BC=FE=C8=CB:</strong> =D6=DC =D4=B6=C7=E5 &lt;<a href=3D"mai=
lto:zhouyuanqing8@outlook.com">zhouyuanqing8@outlook.com</a>&gt;<br>
<strong>=B3=AD=CB=CD:</strong> openbmc &lt;<a href=3D"mailto:openbmc@lists.=
ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;;
<a href=3D"mailto:uperic@163.com">uperic@163.com</a> &lt;<a href=3D"mailto:=
uperic@163.com">uperic@163.com</a>&gt;<br>
<strong>=D6=F7=CC=E2:</strong> Re: There is no kcs device in the /dev direc=
tory</font>
<div>&nbsp;</div>
</div>
<div>
<div><font size=3D"2"><span style=3D"font-size:11pt">On Thu, Jun 18, 2020 a=
t 12:51 PM =D6=DC =D4=B6=C7=E5 &lt;<a href=3D"mailto:zhouyuanqing8@outlook.=
com">zhouyuanqing8@outlook.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi everyone,<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; There is no kcs device in the /dev directory=
=A3=ACI used the following command to find it in the root directory, and I =
did not find ipmi-kcs device, please help guide, thank you.<br>
<br>
Probably you could check the device tree to see if the kcs is enabled or no=
t.<br>
<br>
&gt;<br>
&gt; 1.find / -name *kcs*<br>
&gt;<br>
&gt; 2.Below is my kernel configuration<br>
&gt; CONFIG_SERIAL_MCTRL_GPIO=3Dy<br>
&gt; # CONFIG_SERIAL_DEV_BUS is not set<br>
&gt; # CONFIG_TTY_PRINTK is not set<br>
&gt; # CONFIG_HVC_DCC is not set<br>
&gt; CONFIG_IPMI_HANDLER=3Dy<br>
&gt; # CONFIG_IPMI_PANIC_EVENT is not set<br>
&gt; # CONFIG_IPMI_DEVICE_INTERFACE is not set<br>
&gt; # CONFIG_IPMI_SI is not set<br>
&gt; # CONFIG_IPMI_SSIF is not set<br>
&gt; # CONFIG_IPMI_WATCHDOG is not set<br>
&gt; # CONFIG_IPMI_POWEROFF is not set<br>
&gt; CONFIG_IPMI_KCS_BMC=3Dy<br>
&gt; CONFIG_ASPEED_KCS_IPMI_BMC=3Dy<br>
&gt; CONFIG_ASPEED_BT_IPMI_BMC=3Dy<br>
&gt; CONFIG_HW_RANDOM=3Dy<br>
&gt; CONFIG_HW_RANDOM_TIMERIOMEM=3Dy<br>
&gt; # CONFIG_RAW_DRIVER is not set<br>
&gt; # CONFIG_TCG_TPM is not set<br>
&gt; # CONFIG_XILLYBUS is not set<br>
&gt; # end of Character devices<br>
&gt;<br>
&gt; Thanks<br>
&gt; Harley</span></font></div>
</div>
</div>
</div>
</blockquote>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>--&nbsp;</div>
<div>Best regards,</div>
<div>Konstantin Klubnichkin,</div>
<div>lead firmware engineer,</div>
<div>server hardware R&amp;D group,</div>
<div>Yandex Moscow office.</div>
<div>tel: &#43;7-903-510-33-33</div>
<div>&nbsp;</div>
</div>
</div>
</body>
</html>

--_000_HK2PR04MB3826593F8491B30E7CF4190BFE980HK2PR04MB3826apcp_--
