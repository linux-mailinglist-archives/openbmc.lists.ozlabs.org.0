Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9751FEA68
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 06:51:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nV010gM3zDrDp
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 14:51:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.94;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=EG2AYYVx; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253094.outbound.protection.outlook.com [40.92.253.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nRdw2WxnzDr3r
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 13:05:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9dqa5xURXqD5jOxCiYxM9w9m1GkoReokN/6rjOVbxvBjIUxrUwkjImx7L9I47d1FiI2e5tFBBbJziOkUjIa8KvtNKQrXgH9Z36OujKT47z2PcjuGqSBYxf+aCXnGjFxe/wZ6+T3vbaO76X+adX8tSno8jtm8JLOw1e1UQdhKFMuGGUaV4PlIrwyEjlbf0xJgEcGnE3HUnI6JFQNT3WgTOlFHEsoroiUjVateZsKkK7G/1MdEEsBmUPEkPN004X6nq+m5popLNA81sFrTm+LCjf5NVdfMCeT7hbNwRG1cXchTI3pycSwOxvLP0NhNEKAnjnYIP1hFSnVd3DIJcp53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb5FWx7uFkqrwZYCTHK38gxThnFWwW1Q5AUbD73YI+U=;
 b=W05ea0YD8TfpVzEtZ6TmN69KPQY/w5/PDQ4FnGke5t4oKrDhJOt+lMUu3LSFohZkVaZaNfGmnEr1E8UZ3mowriENkZ1J2U90a7J/g7h6lY3wDco6df09A0QcXp0EehVlDpWWUNUnYF0lK57lygRyBhxyGmjTcGp9LxHkFvYu0+pbTzJRL39DwIW6PFLYiPfIEXXtp6Drh0Z1FVFg6s/77Of2QGfsxhZpkFIHnkICRxKXrvIo3XxstPG4e4EHO0z0P3MtQVOknrBh2hmB1tOcXUgR3XhYf9zGX9CRFbQzptoDSuMNM4L2GIHzDhoWYzha7XUgt+b16cgxOiAeywxsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb5FWx7uFkqrwZYCTHK38gxThnFWwW1Q5AUbD73YI+U=;
 b=EG2AYYVxSZcnWXXIufCNRZSELHmWA/NneiAJzsl8bV1pPIFb34yD7Cjg0jVOPS7F5hVLkYDAl0AKH9caSNDi7tPxB36e8aeIc31aaP2oiKSiaiBo5JjAmLGHgd3UtLxAbD6cX13jh09khPEbFdzZ9b6R3Yfg1C0aDu9khgXzGUGYFB7sjsO11234hac56BKKVQQWv8145seFi7o5EI/VVwb5PI9398u82R0o3kZlS9RMVPkTPNWrw3fI5I1EQlwyU9967eIb7etMX8gwm776oAKREZpw7gKw+rJ7dhiyyxHxIaYTPkNXm3HsrajurM0/R0mN5fw53dQ2J3Y7TU9FDg==
Received: from PU1APC01FT063.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::41) by
 PU1APC01HT021.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::264)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 03:05:50 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::4c) by PU1APC01FT063.mail.protection.outlook.com
 (2a01:111:e400:7ebe::296) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Thu, 18 Jun 2020 03:05:50 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f%6]) with mapi id 15.20.3088.029; Thu, 18 Jun 2020
 03:05:49 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: There is no kcs device in the /dev directory
Thread-Topic: There is no kcs device in the /dev directory
Thread-Index: AQHWRQ7NnKu+sXrNAki49Znemi3j0A==
Date: Thu, 18 Jun 2020 03:05:49 +0000
Message-ID: <HK2PR04MB3826A23CDAA3FC0CE9660D1BFE9B0@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:80D0B76EE6966F7B31C3FDACEB62FD5F216817FB35F2E637C541699228C9D56E;
 UpperCasedChecksum:3E590BBCBDC4ED8A915E89E89602E432089F131F5CB7DFB7378ECB64D1522F16;
 SizeAsReceived:6677; Count:42
x-tmn: [Rf388x4zTp64Cr+yBM5te+HmB9do4rFU]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: d80a912c-fb09-4db3-33bd-08d813348136
x-ms-traffictypediagnostic: PU1APC01HT021:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F4Sd+ETa5EROnIsXs4h1NoSslX4TjHUcYRUa/qYWJZEaQWjk1c0RVX/t4uWiwibUtGYDtNEZOyN6uIuxCaaN2m4q6nFLK4Owdpil8L236u4Je2HgBE9r2JbHAkUzMh6OTvYO5e9KKt27D7MkHJvjjCv5/dfW9giUWVAdGqRzQUMYwT3wSlg57MJx2pkcSBaXpiw7P4CcHtZvaTnAkEQB0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: ckH8ldDkFi18snHe2wBuYyeQJSP4mOfl3ADva1mxGDvH04JF2HTjl/ydfLxIj1257jy4zUXx0WrRCGvY4Ep/PgJu6TvsU/t3vXdFG9vmTwAV+kyxhzU+ng1GaYbqh7ZeAk1kAxXs9djFPQXEya0Tpg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826A23CDAA3FC0CE9660D1BFE9B0HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d80a912c-fb09-4db3-33bd-08d813348136
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 03:05:49.9215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT021
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

--_000_HK2PR04MB3826A23CDAA3FC0CE9660D1BFE9B0HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgZXZlcnlvbmUsDQoNCiAgICBUaGVyZSBpcyBubyBrY3MgZGV2aWNlIGluIHRoZSAvZGV2IGRp
cmVjdG9yeaOsSSB1c2VkIHRoZSBmb2xsb3dpbmcgY29tbWFuZCB0byBmaW5kIGl0IGluIHRoZSBy
b290IGRpcmVjdG9yeSwgYW5kIEkgZGlkIG5vdCBmaW5kIGlwbWkta2NzIGRldmljZSwgcGxlYXNl
IGhlbHAgZ3VpZGUsIHRoYW5rIHlvdS4NCg0KMS5maW5kIC8gLW5hbWUgKmtjcyoNCg0KMi5CZWxv
dyBpcyBteSBrZXJuZWwgY29uZmlndXJhdGlvbg0KQ09ORklHX1NFUklBTF9NQ1RSTF9HUElPPXkN
CiMgQ09ORklHX1NFUklBTF9ERVZfQlVTIGlzIG5vdCBzZXQNCiMgQ09ORklHX1RUWV9QUklOVEsg
aXMgbm90IHNldA0KIyBDT05GSUdfSFZDX0RDQyBpcyBub3Qgc2V0DQpDT05GSUdfSVBNSV9IQU5E
TEVSPXkNCiMgQ09ORklHX0lQTUlfUEFOSUNfRVZFTlQgaXMgbm90IHNldA0KIyBDT05GSUdfSVBN
SV9ERVZJQ0VfSU5URVJGQUNFIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lQTUlfU0kgaXMgbm90IHNl
dA0KIyBDT05GSUdfSVBNSV9TU0lGIGlzIG5vdCBzZXQNCiMgQ09ORklHX0lQTUlfV0FUQ0hET0cg
aXMgbm90IHNldA0KIyBDT05GSUdfSVBNSV9QT1dFUk9GRiBpcyBub3Qgc2V0DQpDT05GSUdfSVBN
SV9LQ1NfQk1DPXkNCkNPTkZJR19BU1BFRURfS0NTX0lQTUlfQk1DPXkNCkNPTkZJR19BU1BFRURf
QlRfSVBNSV9CTUM9eQ0KQ09ORklHX0hXX1JBTkRPTT15DQpDT05GSUdfSFdfUkFORE9NX1RJTUVS
SU9NRU09eQ0KIyBDT05GSUdfUkFXX0RSSVZFUiBpcyBub3Qgc2V0DQojIENPTkZJR19UQ0dfVFBN
IGlzIG5vdCBzZXQNCiMgQ09ORklHX1hJTExZQlVTIGlzIG5vdCBzZXQNCiMgZW5kIG9mIENoYXJh
Y3RlciBkZXZpY2VzDQoNClRoYW5rcw0KSGFybGV5DQo=

--_000_HK2PR04MB3826A23CDAA3FC0CE9660D1BFE9B0HK2PR04MB3826apcp_
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
Hi everyone,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background: var(--white);"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background: var(--white);">&nbsp; &nbsp; There is no kcs dev=
ice in the /dev directory=A3=ACI used the following command to find it in t=
he root directory, and I did not find ipmi-kcs device, please help guide, t=
hank you.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
1.find / -name *kcs*</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background: var(--white);">2.Below is my kernel configuratio=
n</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"background: var(--white);">CONFIG_SERIAL_MCTRL_GPIO=3Dy</spa=
n><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div># CONFIG_SERIAL_DEV_BUS is not set<br>
</div>
<div># CONFIG_TTY_PRINTK is not set<br>
</div>
<div># CONFIG_HVC_DCC is not set<br>
</div>
<div>CONFIG_IPMI_HANDLER=3Dy<br>
</div>
<div># CONFIG_IPMI_PANIC_EVENT is not set<br>
</div>
<div># CONFIG_IPMI_DEVICE_INTERFACE is not set<br>
</div>
<div># CONFIG_IPMI_SI is not set<br>
</div>
<div># CONFIG_IPMI_SSIF is not set<br>
</div>
<div># CONFIG_IPMI_WATCHDOG is not set<br>
</div>
<div># CONFIG_IPMI_POWEROFF is not set<br>
</div>
<div>CONFIG_IPMI_KCS_BMC=3Dy<br>
</div>
<div>CONFIG_ASPEED_KCS_IPMI_BMC=3Dy<br>
</div>
<div>CONFIG_ASPEED_BT_IPMI_BMC=3Dy<br>
</div>
<div>CONFIG_HW_RANDOM=3Dy<br>
</div>
<div>CONFIG_HW_RANDOM_TIMERIOMEM=3Dy<br>
</div>
<div># CONFIG_RAW_DRIVER is not set<br>
</div>
<div># CONFIG_TCG_TPM is not set<br>
</div>
<div># CONFIG_XILLYBUS is not set<br>
</div>
<div># end of Character devices<br>
</div>
<div><br>
</div>
<div>Thanks</div>
<div>Harley</div>
<span></span></div>
</body>
</html>

--_000_HK2PR04MB3826A23CDAA3FC0CE9660D1BFE9B0HK2PR04MB3826apcp_--
