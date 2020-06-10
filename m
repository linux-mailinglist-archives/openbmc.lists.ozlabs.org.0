Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FE51F55C0
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 15:27:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hnpt0fnzzDqmX
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 23:27:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.254.46;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Vl4XVUub; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254046.outbound.protection.outlook.com [40.92.254.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hnnn3W59zDqlY
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2020 23:26:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBewtX0OabTvqQscUFXaOQkrH4tW4FkNyYkg4Tzb5knQVcSBZsDQZu3tVA8o06yCiVNVHpmnTtc1XBSUaY3YFtrYFX2l++3HbDhm+pMdG1o05BJF0rZ7QKpULWEiFwB9yj03vzw6ULbmkW55ybuMDvg/TkjXbrpeve879kFLIMddbyYqO3jOOKIai0By4TwoeW7rAWplvBgRiLClJaMWojJ9KwE0v3V4esBk+O6sWpzBgfl/irpq+JqOgPYy09bcK/C01Ez98+JgRgt7IHJHhRTNyPWmSYyJAOF6sB7mRuGrlbJNBwBW6Cj30u/pjhU0jAVu1Msz5/MqsaptwkwhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fZH/yizvhjP+V0gr9AfRTQhxsgClgq5/t93ZYdcwwY=;
 b=N3PAXrwSdTVSQMv7O0Jmyedo9W7LxsEVcScRpXiilDUDOaNzNnrfuvnoTfhBpkRv5oSTcxAq86bB99q6aBnguz4Zhyg7Q3hmwWq49JV8LXa387gQhGwEDo4mlTchQOo5kpmhI7mj3e/b1zfNkFBkYnLGHtjAgFXVsJBZmasx8HTy5KqCXCiyr+ENauVxHhQ9f90Cb7C8gO9NHnJWxUES/G3U0hsXAG5ui6tTyJuws7PWh+zzrqOetyQTOQIPm7sGC1ReDokBTkpPW9axYhIr3kMx6nMeJkJ/is+i5yM8kULEPipR5Mvv1j7x4TW0KBvNb0puBzWcU9/Ac9IUb8UsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fZH/yizvhjP+V0gr9AfRTQhxsgClgq5/t93ZYdcwwY=;
 b=Vl4XVUubAkqt5ntBUeMnYXX3fhnQsyaDeyCzwt8+olIUavjG5tOhS+z0inNxsNuS1H3k1GqW5YMZ9HK0WoXdO1VT5bIucHA1KGkq/rNpC/KNwAfNtV+2NuPMfybAPYaejqNJFH2XhO+I3hY3ezfNFoHSwZdbFXGkl/EObMylbZKoIZWOFgwJLHIJkhZFKjUr0vJ67PJ3UwpUpOVH1Z69LdbpCtYFdpPGeMbFYOTAApcDtLeT9z2ufUYaDNoImWcUCUdEHZFGNRitLA2pYdNr4mgdsSbPs436ALNv5ZiCBWVQKsRJXbTOaiVmFz18qwTK2dT8pnBsgZUkLf5/3DouXA==
Received: from PU1APC01FT006.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::4a) by
 PU1APC01HT050.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::274)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 13:26:31 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::4a) by PU1APC01FT006.mail.protection.outlook.com
 (2a01:111:e400:7ebe::104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Wed, 10 Jun 2020 13:26:31 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 13:26:31 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: sensor disabled
Thread-Topic: sensor disabled
Thread-Index: AQHWPyolQGuQM5PqKU26jeujP7kd0Q==
Date: Wed, 10 Jun 2020 13:26:30 +0000
Message-ID: <HK2PR04MB3826A575A7AA400905596A58FE830@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:42F3AE98BCAA3E725086501A824493FCCF6CF2681DA292FD970ECAB761C4159A;
 UpperCasedChecksum:2772CC6979EC11D841807B8E195EC1B26653C30DF6668B9338C75B65A8144254;
 SizeAsReceived:6680; Count:43
x-tmn: [mjjMp9IVEyG+qDF6QGYIuN6RmF2OSnCs]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: c8f683f8-472b-4041-1578-08d80d41e348
x-ms-traffictypediagnostic: PU1APC01HT050:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ws3PeVFuUd+bAz68iN+FcS6M5r5i5rUnkaHq/h18I9CC67GWXT/aSRCSZjmkjhGGlcjnN31PPVMdGEz1+9d3TEAnLXkDBnhy6q7qEFgFiuZZvLtpk7PFETsUroU67ldxnDq+fkJM7BQ3ldx4tag9hhjiTyuRmJQM7m9BfPgM8sYuF+NfGZAaOP7W2s9tbfP3ZRbdZzjAOdkD4bEa9LgDTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: s3urFeN8XO8t1N/xyiU/PAvhjo407Zgk5+40PwfwZJU3gDbTWPvvcPRp8A8XR3b0NDEIgY2CVBIjn6UmoNbI/uQdLpD/kTfjKW63F35UYF0mj/MVpbYMGFIGp7UJAudDesh8EY0ysyYNiRLl4MENCw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826A575A7AA400905596A58FE830HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f683f8-472b-4041-1578-08d80d41e348
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2020 13:26:30.9632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT050
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

--_000_HK2PR04MB3826A575A7AA400905596A58FE830HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGmjrA0KDQogICAgQWZ0ZXIgb3BlbmJtYyBpcyBzdGFydGVkLCBhbGwgc2Vuc29ycyBhcmUgaW4g
dGhlIGRpc2FibGVkIHN0YXRlLCBwbGVhc2UgaGVscCBndWlkZSwgd2hlcmUgbmVlZCB0byBiZSBj
b25maWd1cmVkIHRvIGVuYWJsZSBieSBkZWZhdWx0Pw0KDQpkaW1tMCAgICAgICAgICAgIHwgZGlz
YWJsZWQgICAgICAgICAgfCBucw0KZGltbTEgICAgICAgICAgICB8IGRpc2FibGVkICAgICAgICAg
IHwgbnMNCmRpbW0yICAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQpkaW1tMyAg
ICAgICAgICAgIHwgZGlzYWJsZWQgICAgICAgICAgfCBucw0KZGltbTQgICAgICAgICAgICB8IGRp
c2FibGVkICAgICAgICAgIHwgbnMNCmRpbW01ICAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAg
ICB8IG5zDQpkaW1tNiAgICAgICAgICAgIHwgZGlzYWJsZWQgICAgICAgICAgfCBucw0KZGltbTcg
ICAgICAgICAgICB8IGRpc2FibGVkICAgICAgICAgIHwgbnMNCmRpbW04ICAgICAgICAgICAgfCBk
aXNhYmxlZCAgICAgICAgICB8IG5zDQpkaW1tOSAgICAgICAgICAgIHwgZGlzYWJsZWQgICAgICAg
ICAgfCBucw0KZGltbTEwICAgICAgICAgICB8IGRpc2FibGVkICAgICAgICAgIHwgbnMNCmRpbW0x
MSAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQpkaW1tMTIgICAgICAgICAgIHwg
ZGlzYWJsZWQgICAgICAgICAgfCBucw0KZGltbTEzICAgICAgICAgICB8IGRpc2FibGVkICAgICAg
ICAgIHwgbnMNCmRpbW0xNCAgICAgICAgICAgfCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQpkaW1t
MTUgICAgICAgICAgIHwgZGlzYWJsZWQgICAgICAgICAgfCBucw0KZGltbTBfdGVtcCAgICAgICB8
IGRpc2FibGVkICAgICAgICAgIHwgbnMNCmRpbW0xX3RlbXAgICAgICAgfCBkaXNhYmxlZCAgICAg
ICAgICB8IG5zDQpkaW1tMl90ZW1wICAgICAgIHwgZGlzYWJsZWQgICAgICAgICAgfCBucw0KZGlt
bTNfdGVtcCAgICAgICB8IGRpc2FibGVkICAgICAgICAgIHwgbnMNCmRpbW00X3RlbXAgICAgICAg
fCBkaXNhYmxlZCAgICAgICAgICB8IG5zDQpkaW1tNV90ZW1wICAgICAgIHwgZGlzYWJsZWQgICAg
ICAgICAgfCBucw0KDQpUaGFua3MuDQo=

--_000_HK2PR04MB3826A575A7AA400905596A58FE830HK2PR04MB3826apcp_
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
<span>Hi=A3=AC</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>&nbsp; &nbsp;&nbsp;After openbmc is started, all sensors are in the d=
isabled state, please help guide, where need to be configured to enable by =
default?</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>dimm0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| disabled &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;| ns<br>
</span>
<div>dimm1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| disabled &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| disabled &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm3 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| disabled &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| disabled &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm5 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| disabled &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| disabled &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm7 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| disabled &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm8 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| disabled &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm9 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| disabled &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm10 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm11 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm12 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm13 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm14 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm15 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;| ns<br>
</div>
<div>dimm0_temp &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| ns<br>
</div>
<div>dimm1_temp &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| ns<br>
</div>
<div>dimm2_temp &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| ns<br>
</div>
<div>dimm3_temp &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| ns<br>
</div>
<div>dimm4_temp &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| ns<br>
</div>
<span>dimm5_temp &nbsp; &nbsp; &nbsp; | disabled &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;| ns</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks.</div>
</body>
</html>

--_000_HK2PR04MB3826A575A7AA400905596A58FE830HK2PR04MB3826apcp_--
