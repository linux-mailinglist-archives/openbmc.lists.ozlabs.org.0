Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77B1F61C0
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 08:29:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jDV42jyDzDqmX
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 16:29:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.254.37;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=HMp4ZBSb; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254037.outbound.protection.outlook.com [40.92.254.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jDT85L8YzDqlD
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 16:28:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N84NHVFlRrKoVR5c10SI1mWj/yCovw0hwblUg0sChLD8uhXZOHKHIP8dvCBNv44bSq//H2jnTcHeskAfFsusyzi2PFaP7lUF7ZHNYBmnrgQ8VEB05BKscoWvBvh0L2N80cFAYphydlRreJoR3TRfNmLoKH2fubsugs6FABYsJx3+W/s4S/mae7TzOyb2OZVZfcn0x5jkeSi8HkUZPel0k4ob7+IrVeYMjN04GxVnIol9KJDbc+dfMlg5a1D34Y6aEKdBQdFp2E4yGvALKQ7z7FuwNzUCmxG0ne+TlhKOPvB6wGdoU/pRwJn/g8ej7A4iU2Y+3Ec0SwGZaiO9J2t9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdATo1Rs8WRhab8SAwQ06CZo5eQHCtoOxI3IwV+NXBw=;
 b=MTiQ3pSMMGrJ98auWUg7CinYQOBtYZFMNt8Y+7C2DJX76vFlwycgPPL4CEMelc1sSKKn3BcS8bt3MwWxdHeS2L+FPKvWXR/AHXBYpCuDDHPrFJ81I70SiPiSixoqW+Y7wqEFQhayFMnOXFN/YHGuOrUotaP+sXFn+6UqH7i08SKjpwajLhSjNEt6Yj9IwRi3LhVjcK+P0HcqZRs9klTuBxn6H1x9CHIjOEayj/UneGp/rg8XQdDTtHmv9O/jPe8NAKOyBiJJ51IgDdvDrbQ51uUDx7s6Kf+Y7M9uSLGTg70kiAncUrovB7fkPW7+rdbQSyAvOBU36VzCxYlKOZiaaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdATo1Rs8WRhab8SAwQ06CZo5eQHCtoOxI3IwV+NXBw=;
 b=HMp4ZBSb2SEgptkAtMFC2CCm+xyMeIuo+L2/BMp6AT4+bZAVfXwb+ampkrJVvVjy8eOcqoy64Cm8uO0hlN9bJwwiqEGQFn+czK8mwVxwe+t5h8capishXwaf5cM4bny3pc/cJOWxTqDp6OvoNkbZGO4kBYs2DP8VZ1j1nqsWooXUWRA6a1T70dzQOIgLlpo+bHnV8GB2s3WOLYwZ8wtS+q32EaaJEpy1oLU9Q4cNkT1ERqBDKuXpV0rUllO/QoXcsaRxJqvqERHNJIoaTBLfUEPjvbB4Egb8oY+eZHKeNj0DzklFDMEbxkLDECJtWtMTT8ZiXW9FA3FPKpEOw5J1Ng==
Received: from HK2APC01FT009.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4d) by
 HK2APC01HT110.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::457)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 06:28:36 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::4a) by HK2APC01FT009.mail.protection.outlook.com
 (2a01:111:e400:7ebc::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Thu, 11 Jun 2020 06:28:36 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 06:28:36 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: =?gb2312?B?u9i4tDogc2Vuc29yIGRpc2FibGVk?=
Thread-Topic: sensor disabled
Thread-Index: AQHWP7eE9kG9vOyhE0mKy0QV4Mudpg==
Date: Thu, 11 Jun 2020 06:28:36 +0000
Message-ID: <HK2PR04MB38263508CDCAA2BE3413DFC4FE800@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:D7B99BA9BD91605C6721470EC4A94FA804CDBE20A81FE2A3004800CD6D50C427;
 UpperCasedChecksum:B0F734CD0AB08D09106D0550AFD9879DED33B40729EB405A0A6AEE89A8D41DE9;
 SizeAsReceived:6753; Count:43
x-tmn: [gvVxCaS7MvRN6KbfAx0lzkBpYoeDzJF+]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 692cd45b-7209-4c20-6aec-08d80dd0abf8
x-ms-traffictypediagnostic: HK2APC01HT110:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cLt83uvh1DrTbfxrMXhH6mIYcA8O6J3jdGd8c0zQuYHIau0ChjczuutBf1uzUusgLXvMUKDUyr9TxVdVS72d3FBmhpyycw1oTHm3VXGdzT2lwmy7DfQrmklhZYOFc/l18NHiT/4EgaoN71sE8lT78zZKPeqV2W5pGyyZB5sJx7aaH5XbKfQUbEP0TYtn5lMYeOFolJ6KihjBZKA5OBUfag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: ZOAV2S82B1oldEUraNjsNpN7HNrhJIlvwskQvicWN7f0gMzlqhCOy2sfY/9PC9u7WgUk1l5cCOTYhinV2FgK3xJnw7AKCT17gjA57hHFaVVM0r6R1N7NBmNjF8SdB6Si6nwPJxJ0H1hG4Dna7xcVeg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB38263508CDCAA2BE3413DFC4FE800HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 692cd45b-7209-4c20-6aec-08d80dd0abf8
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 06:28:36.1458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT110
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

--_000_HK2PR04MB38263508CDCAA2BE3413DFC4FE800HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUGF0cmljaywNCg0KICAgIFRoZSBjb21tdW5pY2F0aW9uIGJldHdlZW4gQklPUyBhbmQgQk1D
IGlzIG5vdCB5ZXQgYXZhaWxhYmxlIGluIG15IGJvYXJkLg0KDQogICAgQXNrIGFub3RoZXIgcXVl
c3Rpb24sIGhvdyBpcyB0aGUgdmFsdWUgb2Ygc2Vuc29yJ3MgZXZlbnRkYXRhMS8yLzMgdXBkYXRl
ZD8gRm9yIGV4YW1wbGUsIHRoZSBzZW5zb3IgobBCb290UHJvZ3Jlc3OhsS4NCg0KICAgIFdoZW4g
bW9uaXRvcmluZyB0aGUgdmFsdWUgb2YgYSBzZW5zb3IgY2hhbmdlcywgdGhlIG9wZW5ibWMgY29k
ZSBpcyB1cGRhdGVkIGZpcnN0IHRoZSB2YWx1ZSBvZiBzZW5zb3IncyBldmVudGRhdGExLCBvciB1
cGRhdGUgdGhlIHByb3BlcnRpZXMgb2YgeHl6Lm9wZW5ibWNfcHJvamVjdC5TdGF0ZS5Cb290LlBy
b2dyZXNzLkJvb3RQcm9ncmVzcyBmaXJzdD8NCg0KVGhhbmtzDQpIYXJsZXkNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogUGF0cmljayBXaWxsaWFtcw0K0tG3osvN
OiAyMDIwIDYg1MIgMTEgyNUg0MfG2svEIDQ6MjYNCsrVvP7Iyzog1twg1LbH5Q0Ks63LzTogb3Bl
bmJtYzsgdXBlcmljQDE2My5jb20NCtb3zOI6IFJlOiBzZW5zb3IgZGlzYWJsZWQNCg0KT24gV2Vk
LCBKdW4gMTAsIDIwMjAgYXQgMDE6MjY6MzBQTSArMDAwMCwg1twg1LbH5SB3cm90ZToNCj4gSGmj
rA0KPg0KPiAgICAgQWZ0ZXIgb3BlbmJtYyBpcyBzdGFydGVkLCBhbGwgc2Vuc29ycyBhcmUgaW4g
dGhlIGRpc2FibGVkIHN0YXRlLCBwbGVhc2UgaGVscCBndWlkZSwgd2hlcmUgbmVlZCB0byBiZSBj
b25maWd1cmVkIHRvIGVuYWJsZSBieSBkZWZhdWx0Pw0KDQpJcyB0aGlzIGFsbCBzZW5zb3JzIG9y
IGp1c3QgRElNTSBzZW5zb3JzIGxpa2UgeW91J3ZlIGxpc3RlZCBiZWxvdz8NCkxpa2VseSwgRElN
TSBpbmZvcm1hdGlvbiBjb21lcyBmcm9tIHlvdXIgQklPUyBvdmVyIElQTUkgc28gdGhlIHNlbnNv
cnMNCndvbid0IGJlIGVuYWJsZWQgdW50aWwgYWZ0ZXIgeW91ciBob3N0IHN0YXJ0cyB1cCBhbmQg
YmVnaW5zDQpjb21tdW5pY2F0aW9uLg0KDQo+IGRpbW0wICAgICAgICAgICAgfCBkaXNhYmxlZCAg
ICAgICAgICB8IG5zDQo+IGRpbW0xICAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5z
DQo+IGRpbW0yICAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW0zICAg
ICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW00ICAgICAgICAgICAgfCBk
aXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW01ICAgICAgICAgICAgfCBkaXNhYmxlZCAgICAg
ICAgICB8IG5zDQo+IGRpbW02ICAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+
IGRpbW03ICAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW04ICAgICAg
ICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW05ICAgICAgICAgICAgfCBkaXNh
YmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW0xMCAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAg
ICB8IG5zDQo+IGRpbW0xMSAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRp
bW0xMiAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW0xMyAgICAgICAg
ICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW0xNCAgICAgICAgICAgfCBkaXNhYmxl
ZCAgICAgICAgICB8IG5zDQo+IGRpbW0xNSAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8
IG5zDQo+IGRpbW0wX3RlbXAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW0x
X3RlbXAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW0yX3RlbXAgICAgICAg
fCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQo+IGRpbW0zX3RlbXAgICAgICAgfCBkaXNhYmxlZCAg
ICAgICAgICB8IG5zDQo+IGRpbW00X3RlbXAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5z
DQo+IGRpbW01X3RlbXAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQoNCkkgZG9uJ3Qg
ZGlyZWN0bHkgcmVjb2duaXplIHRoaXMgb3V0cHV0LiAgV2hhdCB0b29sIGlzIGl0IGNvbWluZyBm
cm9tPw0KSXQgbWF5IGFsc28gaGVscCB0byBrbm93IHdoYXQgbWFjaGluZSAvIGFyY2hpdGVjdHVy
ZSB0aGlzIHN5c3RlbSBpcy4NCg0KLS0NClBhdHJpY2sgV2lsbGlhbXMNCg==

--_000_HK2PR04MB38263508CDCAA2BE3413DFC4FE800HK2PR04MB3826apcp_
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
Hi&nbsp;<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Ari=
al, Helvetica, sans-serif; background-color: rgb(255, 255, 255); display: i=
nline !important">Patrick,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant">&nbsp; &nbsp;&nbsp;The communication between BIOS and BMC is not =
yet available in my board.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant">&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant">&nbsp; &nbsp;&nbsp;Ask another question, how is the value of sens=
or's eventdata1/2/3 updated? For example, the sensor
 =A1=B0BootProgress=A1=B1.</span></div>
<div>
<div><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
&nbsp; &nbsp;&nbsp;<span>When monitoring the value of a sensor changes, the=
 openbmc code is updated first&nbsp;</span><span>the value of sensor's even=
tdata1, or update the properties of xyz.openbmc_project.State.Boot.Progress=
.BootProgress first?</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
Thanks&nbsp;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
Harley</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>=B7=A2=BC=FE=C8=CB:</b> Patrick Williams<br>
<b>=D2=D1=B7=A2=CB=CD:</b> 2020 6 =D4=C2 11 =C8=D5 =D0=C7=C6=DA=CB=C4 4:26<=
br>
<b>=CA=D5=BC=FE=C8=CB:</b> =D6=DC =D4=B6=C7=E5<br>
<b>=B3=AD=CB=CD:</b> openbmc; uperic@163.com<br>
<b>=D6=F7=CC=E2:</b> Re: sensor disabled
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Jun 10, 2020 at 01:26:30PM &#43;0000, =D6=
=DC =D4=B6=C7=E5 wrote:<br>
&gt; Hi=A3=AC<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; After openbmc is started, all sensors are in t=
he disabled state, please help guide, where need to be configured to enable=
 by default?<br>
<br>
Is this all sensors or just DIMM sensors like you've listed below?<br>
Likely, DIMM information comes from your BIOS over IPMI so the sensors<br>
won't be enabled until after your host starts up and begins<br>
communication.<br>
<br>
&gt; dimm0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | disabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | disabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | disabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | disabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | disabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | disabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | disabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | disabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | disabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | disabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | d=
isabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | d=
isabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | d=
isabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | d=
isabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | d=
isabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | d=
isabled&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm0_temp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | disabled&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm1_temp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | disabled&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm2_temp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | disabled&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm3_temp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | disabled&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm4_temp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | disabled&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
&gt; dimm5_temp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | disabled&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ns<br>
<br>
I don't directly recognize this output.&nbsp; What tool is it coming from?<=
br>
It may also help to know what machine / architecture this system is.<br>
<br>
-- <br>
Patrick Williams<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_HK2PR04MB38263508CDCAA2BE3413DFC4FE800HK2PR04MB3826apcp_--
