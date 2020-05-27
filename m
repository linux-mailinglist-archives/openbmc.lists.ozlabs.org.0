Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5C51E3C07
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 10:33:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X3yT463ZzDqQr
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 18:33:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.24;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Zu0CTEQ/; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255024.outbound.protection.outlook.com [40.92.255.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X3xk1V6SzDqQb
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 18:33:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjX5RmSXZoY3+OpfT0bt6CoAKjfk74Ahj5EjhG12EMe6L5io9xXyTS0u2+TsKrHaJrV6ae3rQ61OQucR4rlA1UvLg961ITG3cR0DzrRQfCy9MPARRRtbKHQTdoKwXeWL1vklQiorccUXWc40KMcXPQzkjb89k0VRoTGuNpWF86Tkq3NvRva/rESv7NsBg+FZ89JLuknK3sION2Kn7OCug573aWfQqEr5Y7fHHVS/m9zsBbGVfwTL9emSE2YorroIK4lxkU6vhzlVizGG9ND5/8CzzGTJaODeXVuatFOPX0D8xyQkupigaMF0HAFjuf+UTfO2ABz/2+KYU9Vu4cYkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj5/WeXl10/vD8lh8YMV6iM0XpZSul0J5/i4rGp81t8=;
 b=Z1DbyhuzXXSza0BnfVE8Jn4EpdIfeE4yLnqO4OFPEG2dUAmknAtS2lEwrADPj9ORe/ZJGqaffWTh3jRlKN7O7u7UVAkRXphRgNDRLrDIlAfG+jwkPzguChXKC5tyi4y/Nxms+E0htUife7i9gQra82L9Ad/F+/YHWJWAsjJETJxN2T/UF+Itl2tbDWlOyO86jtoU1f405pbKeMKeJghSCjED0uqE+bjayrK7cGwdcVm6DXwlE0xyynGNhMiBNTiQiQwkTyZQlRsM6BpL7Lf5tw/pMGFCK+/9nY2TSexaF6m1spNTb/eQYadvO3nv0R+7ofKHIG4AMV3pNkVkPNZQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj5/WeXl10/vD8lh8YMV6iM0XpZSul0J5/i4rGp81t8=;
 b=Zu0CTEQ/egcAU2lyDm05fhnCuX5FYjcWzt4Hw1yFdXA7wGE9AzBG/epQ0DA541ZPpE3OghtAW7tjXIstjKq/25xV05fqPDIdhqmvbTWwaqF2Kv3C+T7wythMOQEdQUeb/GQev2tCkBKLNzDwYOKtMJRSU7OgFsExBi/cWKGswugF0JCtMooI42zSMSwZpNoiTmsqIJMWcJd7lJoMu+AZNnWt5wXPGknEjuUpyMlq20B4zcVJUBKilZ+fLl+JJLPJPdnbjA5+VDAM89C9RkkobN+xcvEPGLx2uQBsNnlElCqngQKbnOC3Wf7m1EXdff+019c5nUEIHVT6dssNjI+Cdg==
Received: from SG2APC01FT029.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::40) by
 SG2APC01HT083.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::457)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 27 May
 2020 08:33:07 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebd::48) by SG2APC01FT029.mail.protection.outlook.com
 (2a01:111:e400:7ebd::214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Wed, 27 May 2020 08:33:07 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.3045.016; Wed, 27 May 2020
 08:33:07 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: "Wang, Kuiying" <kuiying.wang@intel.com>, Vijay Khemka <vijaykhemka@fb.com>
Subject: =?gb2312?B?u9i4tDogQWJvdXQgRlJV?=
Thread-Topic: About FRU
Thread-Index: AdYz/Jgsd22LDGcdRYWJMXa/QfCfZwAAWgr8
Date: Wed, 27 May 2020 08:33:07 +0000
Message-ID: <HK2PR04MB3826F292E77DB3333854C473FEB10@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <29eb06b1954a4aac802d69ee7e667ae2@intel.com>
In-Reply-To: <29eb06b1954a4aac802d69ee7e667ae2@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:AC7B7C0C829BCDE59119086B86756ED1D7D4DAEA429C4988CDE21253C4C967F4;
 UpperCasedChecksum:8EAE0824A77BEEE9CD2E990801DBFC744DC07980C5D12160AA1ACB588ED87782;
 SizeAsReceived:6940; Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [JQw7d2TR8XZIOfkgtmof4TNVhc2CnCuk]
x-ms-publictraffictype: Email
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: dedd1ea4-1f68-40ad-1ff2-08d8021894d3
x-ms-traffictypediagnostic: SG2APC01HT083:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vx/J8kpF0waEtiUX/6/bBIw4GgwR8rtvFdkP3Dti1nRDSrOLhtWjc9b2xbGFBWRA2ZiUo9W/oLyi/OvMtQDA/icGfEarFPBwctJJ58B2uUjpOYy4petyYDPxSGqwC1R4143xInZ6EWQkOW6gYCnri6EgjdpErDFGb3HKjiV3CtwBvwIOteK1OXO8SgRwobVIBFT8jKR2nJPUGNVweBvN+2oHdBrlv+D+y5AxuosOExKopVsif9OCJmDrfg6RBZx7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: nBkiQopxFlZfUxpMJf55YVdR5vE7XeCtKmbbIcpKQJyNIgo+3CBxGqmhI1sAiLPnAVp6Twoi1HZPXID9atwX18IWt8ZPkGcrZmkPylL+x3UzXpVgiuOac8WgGsJ4rJVWyS8omOFgVguiu6wbssZEGQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826F292E77DB3333854C473FEB10HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: dedd1ea4-1f68-40ad-1ff2-08d8021894d3
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 08:33:07.1360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT083
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB3826F292E77DB3333854C473FEB10HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkNCg0KICAgICBNeSBwcm9qZWN0IHVzZXMgcGhvc3Bob3ItZnJ1LCBhbmQgYSBwaG9zcGhvci1y
ZWFkLWVlcHJvbSBpcyBnZW5lcmF0ZWQgZHVyaW5nIGNvbXBpbGF0aW9uLiBJIHRoaW5rIHdoZW4g
b3BlbmJtYyBzdGFydHMsIHBob3NwaG9yLXJlYWQtZWVwcm9tIHdpbGwgcmVhZCB0aGUgY29uZmln
dXJhdGlvbiBpbmZvcm1hdGlvbiBvZiBlZXByb20gZnJvbSBhIGNvbmZpZ3VyYXRpb24gZmlsZSAo
c3VjaCBhcyBpMmMgY2hhbm5lbCBudW1iZXIsIGkyYyBhZGRyZXNzKSwgYW5kIHRoZW4gcmVhZCBG
UlUgaW5mb3JtYXRpb24gZnJvbSBlZXByb20uDQogICAgIElmIHRoZSBlbnRpdHktbWFuYWdlciBt
b2R1bGUgaXMgdXNlZKOsYWRkIGpzb24gY29uZmlndXJhdGlvbiBmaWxlIGZvciBteSBkZXZpY2Ug
aW50byBlbnRpdHktbWFuYWdlci4gdGhlbiBJIHVzZSB0aGUgcGhvc2hvci1mcnUgbWV0aG9kLCBp
biB3aGljaCBjb25maWd1cmF0aW9uIGZpbGUgc2hvdWxkIEkgY29uZmlndXJlIHRoZSBlZXByb20g
aW5mb3JtYXRpb24/DQoNCiAgICAgcGhvc3Bob3ItcmVhZC1lZXByb20gd2lsbCBleGl0cyBhZnRl
ciByZWFkaW5nIHRoZSBlZXByb20gaW5mb3JtYXRpb24sIHNvIGhvdyBpcyB0aGUgRlJVIGluZm9y
bWF0aW9uIHJlYWQgdG8gdGhlIElQTUkgcHJvY2Vzc6O/DQoNClRoYW5rcw0KSGFybGV5DQoNCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogV2FuZywgS3VpeWluZyA8
a3VpeWluZy53YW5nQGludGVsLmNvbT4NCreiy83KsbzkOiAyMDIwxOo11MIyN8jVIDE1OjU4DQrK
1bz+yMs6IHpob3V5dWFucWluZzhAb3V0bG9vay5jb20gPHpob3V5dWFucWluZzhAb3V0bG9vay5j
b20+DQqzrcvNOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgPG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZz4NCtb3zOI6IFJFOiBBYm91dCBGUlUNCg0KDQpIaSBIYXJsZXksDQoNCllvdSBjb3VsZCBh
ZGQganNvbiBjb25maWd1cmF0aW9uIGZpbGUgZm9yIHlvdXIgZGV2aWNlIGludG8gZW50aXR5LW1h
bmFnZXIgYXMgYmVsb3c6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2VudGl0eS1tYW5h
Z2VyL3RyZWUvbWFzdGVyL2NvbmZpZ3VyYXRpb25zDQoNCg0KDQoNCg0KVGhhbmtzLA0KDQpLd2lu
Lg0KDQoNCg0KDQoNCkhlbGxvIGV2ZXJ5b25lLA0KDQoNCg0KICAgICAgIE15IG1vdGhlcmJvYXJk
IGhhcyBhbiBFRVBST00gZGV2aWNlIHRvIHN0b3JlIEZSVSByZWxhdGVkIGluZm9ybWF0aW9uLiBI
b3cgY2FuIEkgY29uZmlndXJlIGl0IGluIHRoZSBvcGVuYm1jIGNvbmZpZ3VyYXRpb24gZmlsZSB0
byBzZWUgdGhpcyBGUlUgaW5mb3JtYXRpb24gdGhyb3VnaCB0aGUgaXBtaXRvb2wgZnJ1IHByaW50
IGNvbW1hbmQ/DQoNCg0KDQpBcmUgdGhlcmUgc29tZSBleGFtcGxlcyB0byBwcm92aWRlIHJlZmVy
ZW5jZSwgSSBkaWQgbm90IGZpbmQgYSBwbGFjZSB0byBjb25maWd1cmUgdGhlIGVlcHJvbSBkZXZp
Y2UgaW4gdGhlIG9wZW5ibWMgcHJvamVjdD8NCg0KDQoNCklzIHRoZXJlIGFueSBkb2N1bWVudGF0
aW9uIGFib3V0IEZSVSBpbmRpY2F0aW5nIHRoYXQgdGhlIG1vZHVsZSByZWFkcyBhbmQgcGFyc2Vz
IGluZm9ybWF0aW9uIGZyb20gZWVwcm9tLCBhbmQgdGhlbiBpdCBjYW4gYmUgcmVhZCBieSB0aGUg
aXBtaXRvb2wgZnJ1IHByaW50IGNvbW1hbmQ/IFdoYXQgaXMgdGhlIHByb2Nlc3MgbGlrZT8NCg0K
DQoNClRoYW5rcw0KDQpIYXJsZXkNCg0KDQoNCg0K

--_000_HK2PR04MB3826F292E77DB3333854C473FEB10HK2PR04MB3826apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi&nbsp;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt;">&nbsp; &nbsp; &nbsp;My project uses pho=
sphor-fru, and a phosphor-read-eeprom is generated during compilation. I th=
ink when openbmc starts, phosphor-read-eeprom will
 read the configuration information of eeprom from a configuration file (su=
ch as i2c channel number, i2c address), and then read FRU information from =
eeprom.<br>
</span><font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-seri=
f" size=3D"3">&nbsp; &nbsp; &nbsp;</font>If the entity-manager module is us=
ed<font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-serif" si=
ze=3D"3"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Ar=
ial, Helvetica, sans-serif; font-size: medium; background-color: rgb(255, 2=
55, 255); display: inline !important">=A3=AC</span>add
 json configuration file for my device into entity-manager. then I use the =
phoshor-fru method, in which configuration file should I configure the eepr=
om information?</font><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span>&nbsp; &nbsp; &nbsp;phosphor-read-eeprom will exits <span style=3D"ca=
ret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif=
; background-color: rgb(255, 255, 255); display: inline !important">
after reading the eeprom information</span>, so how is the FRU information =
read to the IPMI process=A3=BF</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Harley</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp;</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Wang, K=
uiying &lt;kuiying.wang@intel.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA5=D4=C227=C8=D5 15:58<br>
<b>=CA=D5=BC=FE=C8=CB:</b> zhouyuanqing8@outlook.com &lt;zhouyuanqing8@outl=
ook.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&=
gt;<br>
<b>=D6=F7=CC=E2:</b> RE: About FRU</font>
<div>&nbsp;</div>
</div>
<div lang=3D"EN-US">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
Hi Harley,</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
You could add json configuration file for your device into entity-manager a=
s below:</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<a href=3D"https://github.com/openbmc/entity-manager/tree/master/configurat=
ions">https://github.com/openbmc/entity-manager/tree/master/configurations<=
/a>
</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
&nbsp;</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
&nbsp;</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
Thanks,</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
Kwin.</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
&nbsp;</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
&nbsp;</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">Hello everyone,</span></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;My motherboard has an EEPROM d=
evice to store FRU related information. How can I configure it in the openb=
mc configuration file to see this FRU information through the ipmitool fru
 print command?</span></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">Are there some examples to provide reference, I did not find a plac=
e to configure the eeprom device in the openbmc project?</span></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">Is there any documentation about FRU indicating that the module rea=
ds and parses information from eeprom, and then it can be read by the ipmit=
ool fru print command? What is the process like?</span></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">Thanks</span></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
<span style=3D"font-size:10.0pt; font-family:&quot;Courier New&quot;; color=
:black">Harley</span></p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
&nbsp;</p>
<p class=3D"x_MsoNormal" style=3D"margin-top: 0px; margin-bottom: 0px;margi=
n:0in 0in 0.0001pt; font-size:11pt; font-family:Calibri,sans-serif">
&nbsp;</p>
</div>
</div>
</div>
</body>
</html>

--_000_HK2PR04MB3826F292E77DB3333854C473FEB10HK2PR04MB3826apcp_--
