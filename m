Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9C2A12DA
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 03:32:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNNW84XwXzDqw6
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 13:32:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.33;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=C4psGafC; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253033.outbound.protection.outlook.com [40.92.253.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNNVP6SL3zDqsW
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2020 13:31:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CugNJr8Fn0iWxqI+qD1Uf2PXqfovhNEIaVRwkVbzk8RKvb5OwTvUTlL27o7kI9UOpnPmZ/VWQMw7doUC98oN6jvF/sB1iMXSZDdOhf2DY0Nb02oQ9cY/GYtaqhd6XL3HFxxgAgNVOvvo7crLmtS8QXlAmzoUUzTVN6o4o9y70BEaLu7U96rWYCBQA28wVEtPvhiv+Hmmg8I6EPDOvXpDJy1mj9bXpf+ISY0n/tYbHrfYcx+hELuHJO8U+xZtL49C5t7PGsIBEas7zge9abxZ1/33ahcxz2pt8qYPGDm7G9vTD2ZGFqOJ8DjGWch2R2xTV4WCyAMH9ER0A/bvnFdhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1JnCovxy++SPkS7IKYmjaKxu29tCL6D3FUI+KloV4w=;
 b=Quzb5nkaN/ZF4CprWipRCaSc5jMb+Wxjq0JnVQ/dx66an0QwQ6g+YpQA/77481PuRDuuDqBSUeLeUR66OFLbQULy1STFwB44GPNZXQuTS6EAF2IbkzO73ePOjMy7z6cn6vKlt/0E9bZbQV8gMJDyqGH89XqNDueQnwg42EfanV+Mnok0v8dL/myX1m7ZKa0a+h+VMsDWWBq43U+Gspjb7GQtrf80tgxisJHPpDU5ZkOyhbW9F7zUN1WlE1zQNy8o4cnCVZEvCJQXg5Ls2KBO0hWROtDDCokPZHyNcBEZUzgHiwMqK1tISPfx4ov44wfDv7jn+cC+yHqtj/NUbcD36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1JnCovxy++SPkS7IKYmjaKxu29tCL6D3FUI+KloV4w=;
 b=C4psGafCmsDeL9ltTU7g2V5fNDtkJfhejkzjDNn7pErS9RqbEVOPDRMfnxo9eTmZVRRj0z8/jSl1Yk9yEyj4ZU1tBglaQ4alEM6bexvA5mRnVkNwptlbLS1DbCIefTyOeJuxuBiEufmc3lu1FnQiFuUSbSBNrqR0bShayyW/idUQ/6r5bKtrubJkfVXRhnnCzR9/9iUYhxPHKfGUPAvixGVGlSOo5fTfBGDG/WjERX3yEs9W21fNeu/aILF6E+gHhhHBs6KFq+awvWArsvhDRTYHOoHP0HCHjombUrlqeRG62WRI4xHs9h4f3ACNLepA4v85cWvIfBDb4wDzJrLqEw==
Received: from SG2APC01FT057.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::4d) by
 SG2APC01HT097.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::456)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3520.15; Sat, 31 Oct
 2020 02:31:49 +0000
Received: from MEAPR01MB3335.ausprd01.prod.outlook.com (10.152.250.58) by
 SG2APC01FT057.mail.protection.outlook.com (10.152.251.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Sat, 31 Oct 2020 02:31:49 +0000
Received: from MEAPR01MB3335.ausprd01.prod.outlook.com
 ([fe80::48f:b699:9fb2:52d0]) by MEAPR01MB3335.ausprd01.prod.outlook.com
 ([fe80::48f:b699:9fb2:52d0%6]) with mapi id 15.20.3477.035; Sat, 31 Oct 2020
 02:31:49 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: all discrete sensor shows na
Thread-Topic: all discrete sensor shows na
Thread-Index: AQHWryxt+3AP5Ft2cUyUGo53J0xAkQ==
Date: Sat, 31 Oct 2020 02:31:49 +0000
Message-ID: <MEAPR01MB3335EABEA5565F42170CB4F2FE120@MEAPR01MB3335.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:49884BAC3A19713068DF050D8AC61A33097CCE28A2AEDF8773974F6AF4E069C7;
 UpperCasedChecksum:C60A48C9CD4A7BFA9198EAA4F18508A1BCB6DE7F65EE3AD0A6E6C62CB53BA10F;
 SizeAsReceived:6659; Count:42
x-tmn: [y6ymRFlkNnmFz9z+waAE0eyDIF2CzxAp]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 340fd7a8-586c-4a1b-ae39-08d87d451ea4
x-ms-traffictypediagnostic: SG2APC01HT097:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NmNBVDPglDVUyl0EOFsJNtJpmVPy9USCYndRRn9UcMp2+VLBA/+Wcsmmn+u8cskUzCEx3crgOs2R4xMiUFPCa/8b5C5/W42pJaH+8FCUSDwVITynKWpgXj4C8dgiXE+kHK9JTQdL0xrURt1UlXzBFeo5lTpWGJvQGmfRCsJpMxS6tJOB3hxYmEvTdLzKT7SIjl+bUsyG6XctoL/JcWtX8Q==
x-ms-exchange-antispam-messagedata: E+h0yATPCue3bv6hLOsoV7ox4b7u0936W1bF7ptZg1kHHXl6KkVTABNEAsW95SfDyTzw2evW6+ojUn/MSSiAei81PXPA7FBCdqZlJbj9lELvH8CaNisl1vDdmNEUlFAOxeas80+tyPWcWlA4PIOT6A==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MEAPR01MB3335EABEA5565F42170CB4F2FE120MEAPR01MB3335ausp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT057.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 340fd7a8-586c-4a1b-ae39-08d87d451ea4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2020 02:31:49.2530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT097
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

--_000_MEAPR01MB3335EABEA5565F42170CB4F2FE120MEAPR01MB3335ausp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQoNCiAgIEkgYWRkZWQgc29tZSBkaXNjcmV0ZSBzZW5zb3JzIHRvIG9wZW5ibWMsIGJ1dCBJ
IHVzZWQgdGhlIGlwbWl0b29sIGNvbW1hbmQgdG8gcXVlcnkgYW5kIGZvdW5kIHRoYXQgYWxsIGRp
c2NyZXRlIHNlbnNvcnMgZGlzcGxheWVkIG5hLiBQbGVhc2UgaGVscCBhbmQgZ3VpZGUsIHRoYW5r
IHlvdS4gRXhhbXBsZXMgYXJlIGFzIGZvbGxvd3MuDQoNCkY6XGlwbWl0b29sIHYxLjguMTg+aXBt
aXRvb2wuZXhlIC1JIGxhbnBsdXMgLUMgMTcgLUggMTcyLjE2LjkwLjE3MiAtVSByb290IC1QIDBw
ZW5CbWMgc2Vuc29yIGxpc3QNClBvd2VyRHJvcCAgICAgICAgfCBuYSAgICAgICAgIHwgZGlzY3Jl
dGUgICB8IG5hICAgIHwgbmEgICAgICAgIHwgbmEgICAgICAgIHwgbmEgICAgICAgIHwgbmEgICAg
ICAgIHwgbmEgICAgICAgIHwgbmENCg0KRjpcaXBtaXRvb2wgdjEuOC4xOD5pcG1pdG9vbC5leGUg
LUkgbGFucGx1cyAtQyAxNyAtSCAxNzIuMTYuOTAuMTcyIC1VIHJvb3QgLVAgMHBlbkJtYyBzZW5z
b3IgZ2V0IFBvd2VyRHJvcA0KTG9jYXRpbmcgc2Vuc29yIHJlY29yZC4uLg0KU2Vuc29yIElEICAg
ICAgICAgICAgICA6IFBvd2VyRHJvcCAgKDB4MjgpDQogRW50aXR5IElEICAgICAgICAgICAgIDog
Ny4xDQogU2Vuc29yIFR5cGUgKERpc2NyZXRlKTogUG93ZXIgU3VwcGx5DQogVW5hYmxlIHRvIHJl
YWQgc2Vuc29yOiBEZXZpY2UgTm90IFByZXNlbnQNCg0KSSBoYXZlIGNoZWNrZWQgdGhlIGRidXMg
aW50ZXJmYWNlIGNvcnJlc3BvbmRpbmcgdG8gUG93ZXJEcm9wLCBhbmQgaXQgY2FuIGJlIHNldCBh
bmQgaW5xdWlyZWQgdGhyb3VnaCB0aGUgYnVzY3RsIGNvbW1hbmQ7DQoNClRoYW5reW91IQ0KDQpo
YXJsZXkuDQo=

--_000_MEAPR01MB3335EABEA5565F42170CB4F2FE120MEAPR01MB3335ausp_
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
&nbsp; &nbsp;I added some discrete sensors to openbmc, but I used the ipmit=
ool command to query and found that all discrete sensors displayed na. Plea=
se help and guide, thank you. Examples are as follows.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color:rgb(0, 0, 0);background-color:rgb(255, 255, 255)=
;display:inline !important">F:\ipmitool v1.8.18&gt;</span>ipmitool.exe -I l=
anplus -C 17 -H 172.16.90.172 -U root -P 0penBmc sensor list</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
PowerDrop &nbsp; &nbsp; &nbsp; &nbsp;| na &nbsp; &nbsp; &nbsp; &nbsp; | dis=
crete &nbsp; | na &nbsp; &nbsp;| na &nbsp; &nbsp; &nbsp; &nbsp;| na &nbsp; =
&nbsp; &nbsp; &nbsp;| na &nbsp; &nbsp; &nbsp; &nbsp;| na &nbsp; &nbsp; &nbs=
p; &nbsp;| na &nbsp; &nbsp; &nbsp; &nbsp;| na<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
F:\ipmitool v1.8.18&gt;ipmitool.exe -I lanplus -C 17 -H 172.16.90.172 -U ro=
ot -P 0penBmc sensor get
<span style=3D"caret-color:rgb(0, 0, 0);background-color:rgb(255, 255, 255)=
;display:inline !important">
PowerDrop<span class=3D"Apple-converted-space">&nbsp;</span></span>
<div>Locating sensor record...</div>
<div>Sensor ID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: <span styl=
e=3D"caret-color:rgb(0, 0, 0);background-color:rgb(255, 255, 255);display:i=
nline !important">
PowerDrop<span class=3D"Apple-converted-space">&nbsp;</span></span> (0x28)<=
/div>
<div>&nbsp;Entity ID &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 7.1</div>
<div>&nbsp;Sensor Type (Discrete): Power Supply</div>
&nbsp;Unable to read sensor: Device Not Present<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have checked the dbus interface corresponding to PowerDrop, and it can be=
 set and inquired through the busctl command;<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thankyou!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
harley.</div>
</body>
</html>

--_000_MEAPR01MB3335EABEA5565F42170CB4F2FE120MEAPR01MB3335ausp_--
