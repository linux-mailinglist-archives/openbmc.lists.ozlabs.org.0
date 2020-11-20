Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CCF2BA451
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 09:09:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ccq222tFbzDqxD
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 19:08:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.72;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=HGrTHu0d; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255072.outbound.protection.outlook.com [40.92.255.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccq186PZDzDqvj
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 19:08:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaLCX+zGvodzkfFpZodBptnrl+Dc7YODL6/L2diMCzY+/t/CPyYVj5Nky1a1M87DJb2leIW/SnXO4oibhhc5Lev7WceZzL0ycXhTL5f4DRaycSVRFYc3VfPc0IrYlaebNwJpsPIw92TG9UrH13ymkElgAyrCqrvt0iS5Xrfdjz7YcZ7G5ChP6fXszRiu/LYkVXMh2roBR1JG9RvsPrbdTS85bMN/9bveueEIV8hbwq0AzJmWe3CxR1L9xF5/23zrKZwMQHF8fIOQGShB/xb1d4nkOf1FCn0QiWZZ6xn0yzf2RZto2N/P3K33+LMGuZMVJMAXlLc4STy3UtSN+ygEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siKrDXYh8imwbQ8ZgXxpx/xjw6w7tHIYJua2FRViRfI=;
 b=TQM2NDqyaxQ8kfr7mU3FfIbpOY8YM57LD+8XKcsFZTuLxuhXQ4jh3HK9hTgneZpl3iE2IcWJa57w3Dp7RdPhNImSvKBebm3jVrXgoOX+fGaqbpzOKWVzlo4cHS8eEm3jjKaxAjOp8ntlWearXKPcVKywFd2xWVuSZU6SGv3Gv0I9FSbw2tzEOwqwifsdvEpMePaLo+2wR9UJk57TMTh1ygRBrrfsKsq+iaz96+NGOZiZ36/TPSsCzoejLKQyamDtZngdoqEY2N9CpZrD5nVBZNqMZFBB+45SyZCxocJxSJA7x8mQ0/qEV3zgQVnLjVQqIBnrZa6ETvfI+1bJady+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siKrDXYh8imwbQ8ZgXxpx/xjw6w7tHIYJua2FRViRfI=;
 b=HGrTHu0dwiGOjXv8z+MyWm6XcaxJCy1bd3ZnbRkkGjJlZahnJrTV0gx3mQWecrnH1SdsMX5vBaFVNaxI+sVKm3iySoi/AEGaula6o+dtni+KkMsrnFp0MW3eNSOnDLh8FvT52MCAbpxK5qu45QHIqYfWumkWuDc7krbNltkFiQE2HHIbg+kC7t0wB0D0RHAQpK+iho57y4dk0hTK6pmlhqQcQBwOUZulXST3cxAOHVQu+FFjiDvi+gbStPR0GWqkRvui/po6SetfWThPJdWzy/m8gSs+VpLiAVl+qO2C8rWdGsKz+9tEXCGJWpu0jTqFzm96RBcZJmkE47Jg74au9A==
Received: from HK2APC01FT054.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::51) by
 HK2APC01HT022.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::376)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 08:08:05 +0000
Received: from ME2PR01MB2675.ausprd01.prod.outlook.com (10.152.248.54) by
 HK2APC01FT054.mail.protection.outlook.com (10.152.249.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 08:08:05 +0000
Received: from ME2PR01MB2675.ausprd01.prod.outlook.com
 ([fe80::5d0e:df51:1d16:ea9a]) by ME2PR01MB2675.ausprd01.prod.outlook.com
 ([fe80::5d0e:df51:1d16:ea9a%5]) with mapi id 15.20.3541.025; Fri, 20 Nov 2020
 08:08:04 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: about sensor and sel
Thread-Topic: about sensor and sel
Thread-Index: AQHWvxMcn+9lCX7lxk22jvupDt0oRA==
Date: Fri, 20 Nov 2020 08:08:04 +0000
Message-ID: <ME2PR01MB2675B102E59FEA8233F6436CFEFF0@ME2PR01MB2675.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A1AB08312A38790DC16F98DBE9E3DEFE80CA9495359F3EBE0070F3EC3927B239;
 UpperCasedChecksum:DC188E129E1B6FE08107133EB04CEFFE67018A8CB439FE7584690FCD291E0AC9;
 SizeAsReceived:6620; Count:42
x-tmn: [yrfSB7aX/49UqMBPCtmjEXPsjIehL5m5]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 614b0326-31aa-48ad-97fe-08d88d2b6886
x-ms-traffictypediagnostic: HK2APC01HT022:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RLwjdiRy+r4NrTTsEqcli11volOffsNxDikdyxR5t1tkVMwgUmIuu4STw/rnumFzpgx+fV2Zb4mPIqU7kR6ajlG+m3RjcLxpV0VOTUlRbqOxeAxi/a9p1SXoTMkJXpKpCjUcCjcv+7ACeJneVc5j5CwY3XiKlLy4IzNyllqYVfGwwL+gE3D07BCSdFbrK5lJKZx/knHry7uTMYWVp4kxmA==
x-ms-exchange-antispam-messagedata: woU+bKDSSZ9vo0vl8alMj69XfPGUOmgAM2zl7JFtPRP06pxHhw1/dq7LQ9brILxWbOcIuLil/YwXdWCwGDlkljEVJLdnVgdUpdgDsxG/15w0uSTCqWCF0+1TQQMJFlULVTsAuIJrUpPAkLN9TAD4Dg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_ME2PR01MB2675B102E59FEA8233F6436CFEFF0ME2PR01MB2675ausp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT054.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 614b0326-31aa-48ad-97fe-08d88d2b6886
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 08:08:04.9396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT022
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

--_000_ME2PR01MB2675B102E59FEA8233F6436CFEFF0ME2PR01MB2675ausp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

aGVsbG8gZXZlcnlvbmUsDQoNCiAgICAgSSBsb29rZWQgYXQgdGhlIHBob3NwaG9yLWhvc3QtaXBt
aWQgY29kZSBhbmQgY29tYmluZWQgaXQgd2l0aCBpcG1pLWludmVudG9yeS1zZW5zb3JzLnlhbWwg
Zm9yIGRlYnVnZ2luZy4gSSBmb3VuZCB0aGF0IGluIHRoZSBpcG1pLWludmVudG9yeS1zZW5zb3Jz
LnlhbWwgZmlsZSwgb25lIGludmVudG9yeSBjYW4gb25seSBjb3JyZXNwb25kIHRvIG9uZSBvZmZz
ZXQgb2Ygb25lIHNlbnNvci4NCiAgICAgSWYgbWluZSBBbiBpbnZlbnRvcnkgaGFzIG11bHRpcGxl
IHNlbnNvcnMsIGFuZCBlYWNoIHNlbnNvciBoYXMgbXVsdGlwbGUgb2Zmc2V0cyB0byBiZSBwcm9j
ZXNzZWQuIEhvdyB0byBkZWFsIHdpdGggaXQ/DQoNCmlwbWktaW52ZW50b3J5LXNlbnNvcnMueWFt
bCBhcyBmb2xsb3c6DQoveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkvc3lzdGVtOg0KICAg
IGV2ZW50UmVhZGluZ1R5cGU6IDExMQ0KICAgIG9mZnNldDogMg0KICAgIHNlbnNvcklEOiAxNDQN
CiAgICBzZW5zb3JUeXBlOiAxOA0KL3h5ei9vcGVuYm1jX3Byb2plY3QvaW52ZW50b3J5L3N5c3Rl
bS9jaGFzc2lzL21vdGhlcmJvYXJkOg0KICAgIGV2ZW50UmVhZGluZ1R5cGU6IDMNCiAgICBvZmZz
ZXQ6IDANCiAgICBzZW5zb3JJRDogMTQwDQogICAgc2Vuc29yVHlwZTogMTk5DQoveHl6L29wZW5i
bWNfcHJvamVjdC9pbnZlbnRvcnkvc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvY3B1MDoNCiAg
ICBldmVudFJlYWRpbmdUeXBlOiAxMTENCiAgICBvZmZzZXQ6IDgNCiAgICBzZW5zb3JJRDogOA0K
ICAgIHNlbnNvclR5cGU6IDcNCi94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0v
Y2hhc3Npcy9tb3RoZXJib2FyZC9jcHUwL2NvcmUwOg0KICAgIGV2ZW50UmVhZGluZ1R5cGU6IDEx
MQ0KICAgIG9mZnNldDogOA0KICAgIHNlbnNvcklEOiA0Mw0KICAgIHNlbnNvclR5cGU6IDcNCi94
eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9j
cHUwL2NvcmUxOg0KICAgIGV2ZW50UmVhZGluZ1R5cGU6IDExMQ0KICAgIG9mZnNldDogOA0KICAg
IHNlbnNvcklEOiA0NA0KICAgIHNlbnNvclR5cGU6IDcNCi94eXovb3BlbmJtY19wcm9qZWN0L2lu
dmVudG9yeS9zeXN0ZW0vY2hhc3Npcy9tb3RoZXJib2FyZC9jcHUwL2NvcmUxMDoNCiAgICBldmVu
dFJlYWRpbmdUeXBlOiAxMTENCiAgICBvZmZzZXQ6IDgNCiAgICBzZW5zb3JJRDogNTMNCiAgICBz
ZW5zb3JUeXBlOiA3DQoveHl6L29wZW5ibWNfcHJvamVjdC9pbnZlbnRvcnkvc3lzdGVtL2NoYXNz
aXMvbW90aGVyYm9hcmQvY3B1MC9jb3JlMTE6DQogICAgZXZlbnRSZWFkaW5nVHlwZTogMTExDQog
ICAgb2Zmc2V0OiA4DQogICAgc2Vuc29ySUQ6IDU0DQogICAgc2Vuc29yVHlwZTogNw0KDQpIYXJs
ZXl6aG91DQo=

--_000_ME2PR01MB2675B102E59FEA8233F6436CFEFF0ME2PR01MB2675ausp_
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
hello everyone,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;I looked at the phosphor-host-ipmid code and combined i=
t with ipmi-inventory-sensors.yaml for debugging. I found that in the ipmi-=
inventory-sensors.yaml file, one inventory can only correspond to one offse=
t of one sensor.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;If mine An inventory has multiple sensors, and each sen=
sor has multiple offsets to be processed. How to deal with it?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
ipmi-inventory-sensors.yaml&nbsp;as follow:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
/xyz/openbmc_project/inventory/system:
<div>&nbsp; &nbsp; eventReadingType: 111</div>
<div>&nbsp; &nbsp; offset: 2</div>
<div>&nbsp; &nbsp; sensorID: 144</div>
<div>&nbsp; &nbsp; sensorType: 18</div>
<div>/xyz/openbmc_project/inventory/system/chassis/motherboard:</div>
<div>&nbsp; &nbsp; eventReadingType: 3</div>
<div>&nbsp; &nbsp; offset: 0</div>
<div>&nbsp; &nbsp; sensorID: 140</div>
<div>&nbsp; &nbsp; sensorType: 199</div>
<div>/xyz/openbmc_project/inventory/system/chassis/motherboard/cpu0:</div>
<div>&nbsp; &nbsp; eventReadingType: 111</div>
<div>&nbsp; &nbsp; offset: 8</div>
<div>&nbsp; &nbsp; sensorID: 8</div>
<div>&nbsp; &nbsp; sensorType: 7</div>
<div>/xyz/openbmc_project/inventory/system/chassis/motherboard/cpu0/core0:<=
/div>
<div>&nbsp; &nbsp; eventReadingType: 111</div>
<div>&nbsp; &nbsp; offset: 8</div>
<div>&nbsp; &nbsp; sensorID: 43</div>
<div>&nbsp; &nbsp; sensorType: 7</div>
<div>/xyz/openbmc_project/inventory/system/chassis/motherboard/cpu0/core1:<=
/div>
<div>&nbsp; &nbsp; eventReadingType: 111</div>
<div>&nbsp; &nbsp; offset: 8</div>
<div>&nbsp; &nbsp; sensorID: 44</div>
<div>&nbsp; &nbsp; sensorType: 7</div>
<div>/xyz/openbmc_project/inventory/system/chassis/motherboard/cpu0/core10:=
</div>
<div>&nbsp; &nbsp; eventReadingType: 111</div>
<div>&nbsp; &nbsp; offset: 8</div>
<div>&nbsp; &nbsp; sensorID: 53</div>
<div>&nbsp; &nbsp; sensorType: 7</div>
<div>/xyz/openbmc_project/inventory/system/chassis/motherboard/cpu0/core11:=
</div>
<div>&nbsp; &nbsp; eventReadingType: 111</div>
<div>&nbsp; &nbsp; offset: 8</div>
<div>&nbsp; &nbsp; sensorID: 54</div>
&nbsp; &nbsp; sensorType: 7<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Harleyzhou</div>
</body>
</html>

--_000_ME2PR01MB2675B102E59FEA8233F6436CFEFF0ME2PR01MB2675ausp_--
