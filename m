Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 090391D9136
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 09:41:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R79M35D2zDqNN
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 17:41:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=2a01:111:f400:febc::802;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=KXJgGZiD; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01olkn0802.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::802])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R78P0GrrzDqNL
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 17:40:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLQGHqQuTcC3byyPsuPIwi762YHzi+nZXpQD4dpq7AwMdJMMSa4oPqqV8q74ytDyL17CHVCWU5D6jdijnFb7XFLEe8ZVIy+vYzxLgro14tzFQtkL/2lo26MVS7A11KLLldvuSQb+rzQojJT89l7z5yiMDRmA4fdmd1I1qfM2p3iRTr4ShnEMAvpZy+9ZLk+ZyV+siPaNeFRqii6+dSZIdMiLYgaphgPzh05dluxC+Ql9HS6rd7xI5diHnz/A0aWxoq7Da0kZaFLmgjzHDjAqDjcKCl2AI+9tf7kCI47icD5iTmRi08n1Q1ZG/Pqd0jZT0C2BxSwlWmtsxZFs66pzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTmnRndQ7jXtzdCDJ4cMtfYA8YThY1G23QrCuCE7OVQ=;
 b=aZ1qDZwwB4PyahS7sG5IdX4cq6FR831BQDUZIAgVjX0sPfj4i/v9vj7M3liCzhelztHPgKxGMAtKeg+G5YezRP+NXS15F83nOKjONMeB17WmWZ3/DKpmRL/0hST32xIi5gX98CJSZ2drEhdSZMCOVoh6NFC8tecK1qE/29RUfkWkfRBIH6RVDoEeFPeexEAHaEatnmuaXcZkuFs2ugC77SrCyKVhHflBBxVP/trCW3VH0T990tGGgZgcc9mwPVOcx9XMNMEFY/j+NzCyst6csZh1UlaBqCpXqlAmFMyMC0RiIlHSJ8rWZB7hQIYrEVmH+5NNASKbSRexaDjvpSBL5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTmnRndQ7jXtzdCDJ4cMtfYA8YThY1G23QrCuCE7OVQ=;
 b=KXJgGZiDMtg5ARGijRLqLAVr21hb4vjAYM9++RCjOclZXt/bSsrPwKNjWak30iuZ2gOO6KRmNuhD82RJw99PUq1T4z4lXbluwVCeNTcc4pKRYM3A5ruSyCEbwUSEb0Z/ms55Cl+lqcP3d4bAuNcZGyqAYA6Q+MKRJgQYF9jTCM2d12HTmIWUbFadHbFltYa2J5tdaCq1HSxE3AtdRyC9mcJIIh8R++zq2dvj46GiFAPPIbCMuuOx9qeHDkDHJccTh8kiV4tRffoT71rpX+1ib3Lex68e07uydOb5U4dnzV7WfQOMWIrpmisTkzGkMuIQWvazX/AdRhXNTIcPOUZmVQ==
Received: from HK2APC01FT042.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4f) by
 HK2APC01HT197.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::238)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Tue, 19 May
 2020 07:40:13 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::51) by HK2APC01FT042.mail.protection.outlook.com
 (2a01:111:e400:7ebc::322) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Tue, 19 May 2020 07:40:13 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 07:40:13 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: about i2cset tool
Thread-Topic: about i2cset tool
Thread-Index: AQHWLa7MbAvo7dLSNkS2YWkgRula2g==
Date: Tue, 19 May 2020 07:40:13 +0000
Message-ID: <HK2PR04MB38266B4510637846C7FAF9FCFEB90@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:98672BC017D1DC8900B9F7C318B1E58419B312810C97192AD49B5A49234FF252;
 UpperCasedChecksum:498CCF95C45268D2B7E776971C30E0AF6685B802D8744BDA2E5A5191232DA3A4;
 SizeAsReceived:6685; Count:43
x-tmn: [cmGxyLTmaSfxynzI9SUUTRSnRAoyiDep]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: ea11e1d8-77a0-4b3e-6d69-08d7fbc7dd97
x-ms-traffictypediagnostic: HK2APC01HT197:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rrDDuteT5tzhzSJaWT5mrSvk725Ahomm2uUQeqzG9+KL8Lf6627WZBTSdt7tHuuMToCNkj3SGsmhhR2fx8aXCAHVxpdttclLwp+GvP1BBAz0rvbBjNEsQjgoZjzLojraj7cMYDsicV7L6F7gnSiQwmvoDXp8G0z3/eo/5bT+WD08/lhP9Oqx6rFOg1dA8k1oLDQghwR8ySjpG3GMIhEPvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: dOlh5mEn5SAItV5WJtc7ZU3nySQ8PIPf0EO9ELcT+T75B8lcKS1vPZvVFmcmtYsdQjERHbE/ULJFUpNiYDPGgLI2OaiZ5efKVQtu8vU47e40mR0Y2itOlS1DerMVyzamf3yTjAeCAjnmKD5KQC7ssw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB38266B4510637846C7FAF9FCFEB90HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ea11e1d8-77a0-4b3e-6d69-08d7fbc7dd97
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 07:40:13.0747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT197
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

--_000_HK2PR04MB38266B4510637846C7FAF9FCFEB90HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxsDQoNCiAgICBJIHVzZSB0aGUgaTJjZ2V0IHRvIHJlYWQgdGhlIGRldmljZSBkYXRhLCBi
dXQgdGhlIGkyY3NldCBkaWQgbm90IHdyaXRlIHRoZSBkYXRhIHRvIHRoZSBkZXZpY2UsIGFuZCB0
aGUgb3BlcmF0aW9uIG9mIGkyY3NldCBkaWQgbm90IHJlcG9ydCBhbnkgZXJyb3JzLg0KDQpmb3Ig
ZXhhbXBsZToNCg0Kcm9vdEBzdGFybGFrZS1ibWM6L3Vzci9zYmluIyBpMmNnZXQgOSAweDEwIDB4
MDAgaSAzDQpXQVJOSU5HISBUaGlzIHByb2dyYW0gY2FuIGNvbmZ1c2UgeW91ciBJMkMgYnVzLCBj
YXVzZSBkYXRhIGxvc3MgYW5kIHdvcnNlIQ0KSSB3aWxsIHJlYWQgZnJvbSBkZXZpY2UgZmlsZSAv
ZGV2L2kyYy05LCBjaGlwIGFkZHJlc3MgMHgxMCwgZGF0YSBhZGRyZXNzDQoweDAwLCAzIGJ5dGVz
IHVzaW5nIHJlYWQgSTJDIGJsb2NrIGRhdGEuDQpDb250aW51ZT8gW1kvbl0NCjM6IDB4MDIgMHgz
MiAweGNjDQoNCnJvb3RAc3Rhcmxha2UtYm1jOi91c3Ivc2JpbiMgaTJjc2V0IDkgMHgxMCAweDgy
IDB4MDEwMSAyDQpXQVJOSU5HISBUaGlzIHByb2dyYW0gY2FuIGNvbmZ1c2UgeW91ciBJMkMgYnVz
LCBjYXVzZSBkYXRhIGxvc3MgYW5kIHdvcnNlIQ0KSSB3aWxsIHJlYWQgZnJvbSBkZXZpY2UgZmls
ZSAvZGV2L2kyYy05LCBjaGlwIGFkZHJlc3MgMHgxMCwgZGF0YSBhZGRyZXNzDQoweDAwLCB1c2lu
ZyByZWFkIHdvcmQgZGF0YS4NCg0Kd2hlbiBJIGNoZWNrIHRoZSAweDgyIHJlZ6OsdGhlIHZhbHVl
IGlzIG5vdCBjaGFuZ2VkLg0KDQpUaGFua3MNCmhhcmxleQ0KDQo=

--_000_HK2PR04MB38266B4510637846C7FAF9FCFEB90HK2PR04MB3826apcp_
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
Hi All</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; I use the i2cget to read the device data, but the i2cset did =
not write the data to the device, and the operation of i2cset did not repor=
t any errors.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
for example:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>root@starlake-bmc:/usr/sbin# i2cget 9 0x10 0x00 i 3<br>
</span>
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
<div>root@starlake-bmc:/usr/sbin# i2cset 9 0x10 0x82 0x0101 2<br>
</div>
<div>WARNING! This program can confuse your I2C bus, cause data loss and wo=
rse!<br>
</div>
<div>I will read from device file /dev/i2c-9, chip address 0x10, data addre=
ss<br>
</div>
<span>0x00, using read word data.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div><font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-serif"=
 size=3D"3">when&nbsp;</font><font color=3D"#000000" face=3D"Calibri, Arial=
, Helvetica, sans-serif"><span style=3D"caret-color: rgb(0, 0, 0);">I</span=
></font><font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-ser=
if" size=3D"3">&nbsp;check
 the 0x82 reg=A3=ACthe value is not changed.</font></div>
<div><font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-serif"=
 size=3D"3"><br>
</font></div>
<div><font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-serif"=
 size=3D"3">Thanks</font></div>
<div><font color=3D"#000000" face=3D"Calibri, Arial, Helvetica, sans-serif"=
 size=3D"3">harley</font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
</body>
</html>

--_000_HK2PR04MB38266B4510637846C7FAF9FCFEB90HK2PR04MB3826apcp_--
