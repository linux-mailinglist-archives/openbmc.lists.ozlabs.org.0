Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF63521D1E4
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 10:38:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4xr75xtmzDqV3
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 18:38:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.255.23;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=fY5Puh5J; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-oln040092255023.outbound.protection.outlook.com [40.92.255.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4xpy6vT2zDqRb
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 18:37:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMcyjJSzx3hflD/PuWKPoo+VlNiu0Z+LpvPUMHB/v7Z9j9Ai5/7udVOZMsDBDZP4rRlKWHhpb9B0o0NZUDfUDCmWj1qCo0skph7PNdG1nl0EHVSW1mfer+w/KtCnW0yC43g+CavNsnZcOJklR93G8z86kWOOAZttuIIM//aBA8Iy8nMjphzHgK4XrDtU1QCglgY3uw8CEGYgZNjY06P4qS8KotNwLtIboYxYhnxE9UmV9SaluxzVR00oFt2u/235rxCHloddYAJzFkXwd3x/VjeUMJCfFdg+CM3rMRoTHc2jwNCExJUi6zev7bYnuBWWlBRg0AOrDqMefzUMGVwAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlB2IjfV6I+YID/N+T3Mvto+b8ZGpN2sOsGp45zwyx0=;
 b=BcGk52ySf7H0oqh2nBTFg6ULC9vCzB1SWXTm23TVG5MMdK66QF41jnmB+hLwhWVh7LNxTJSbNEwJwKwMgpB/TPGhSP7AI3PCbc6VSopO5xraADozUuUVwiENPpBLvxRpWmAE+2ocaMsAjta1kqkSHd6NPMYRmJWUFPw5fSfTHU4t2vycP7HnMzy4Y/HZ4NJbUaf7E0fzKmB2ELPLoZR6OAvRnTfKgyuA1BPeMosbdfIixLMLmjvW7pZswMjRQ1z0XIva3DrbgzjZa600b4tCkQbzZLauJ9K2uksnaDl2JQO+qLHU72i5MuG09FlSAyP+xhqiVSn/9pzOwFopNfQj/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlB2IjfV6I+YID/N+T3Mvto+b8ZGpN2sOsGp45zwyx0=;
 b=fY5Puh5JRy4V7tppLOzc5DlbAf4rDC8pmMkT+Y09Xyl6wBNNykMe0EKQRXWPxnZxeD5GII1EwAsX6uCQnJG/GqktTPfMWpCVDtJ0d/Qz3K8TjdrGQH441zN31+HaK4Oc8Bv/gTZjmns1OA+zjdZ3AqpOalpV71ARewu6Rx1DpSe47bh6sXGaW1tyzgaS1n5kO02jcRDbE/kRax6ISH/RDNDesU0YXyQyTa+M2qy2VgQHCM+PCrmRvdmIUqd+5NNCad4JcS27aR548JcKOp+FQ+9Oef1eIIQjPBTWxOIY599dGuLAwz8Rfvybn9FJdJ4WvXw5WDo8CgrM1+k6IZRjRA==
Received: from PU1APC01FT033.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::4a) by
 PU1APC01HT064.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::272)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Mon, 13 Jul
 2020 08:37:23 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::46) by PU1APC01FT033.mail.protection.outlook.com
 (2a01:111:e400:7ebe::223) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Mon, 13 Jul 2020 08:37:23 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f%6]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 08:37:23 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "uperic@163.com"
 <uperic@163.com>
Subject: busctl call "led method" failed
Thread-Topic: busctl call "led method" failed
Thread-Index: AQHWWOqIeDidKmsYQEOnQI+B0F5CRg==
Date: Mon, 13 Jul 2020 08:37:23 +0000
Message-ID: <HK2PR04MB38264AF28981EE1CCA3FBCA2FE600@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:D5BE7F31B88D490B5DF6A821E880673A0EC20E76D7CBEC4D63515524CDE31DA7;
 UpperCasedChecksum:84597092AF211E8024BECAD44B59101917E19688799D1812F9585E739B093D41;
 SizeAsReceived:6685; Count:41
x-tmn: [Zpaq6JqFnE4gQgoL1od2sHL1VIbkWPsJ]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: daf4b8ee-8ea3-4073-1224-08d82707f70a
x-ms-traffictypediagnostic: PU1APC01HT064:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3d5QAPOtqgjSQq8vSzNeNPQ9HZ5Xwgda+2+i0mu4QtAJ1aii64Bup5TTSGsdU+2UgIlID3kZ7joPvqorjAoRpngaeNTTwYtFUZ1wRboi2L1r1/4gbT5qCzZVcEF4IHpj15k7npDmrD9Oiay2HzEJjq6zsqSJNCsoGX5On2h8izs8aNuvITDl2TBBcEmpRfHRratxkS5kA/gRN2jpIZrglQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: x1fmRNWhnfwOYZdA3Qbv806vRmD0V8MVToUakymNixzCY7c73vAQIvxmu+N0yZ7sfD1KYJLElKcDCMyf7tZWXfCGhATutT9BcMBXYlWVyLUEnYGPcp7nBCAsEzjag372Y9o9Kgnzb8X5pp5bc4v2bQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB38264AF28981EE1CCA3FBCA2FE600HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT033.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: daf4b8ee-8ea3-4073-1224-08d82707f70a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 08:37:23.4682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT064
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

--_000_HK2PR04MB38264AF28981EE1CCA3FBCA2FE600HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmWjrA0KDQogICAgICAgICBUaGVyZSBhcmUgdGhlIGZvbGxvd2luZyBjYWxs
cyB0byBidXNjdGwsIGl0IGlzIG5vcm1hbCB0byB1c2UgdGhlIGdldCBjb21tYW5kLCBidXQgdGhl
IHNldCBjb21tYW5kIHByb21wdHMgIkNhbGwgZmFpbGVkOiBwYXRoIG9yIG9iamVjdCBub3QgZm91
bmQiLCBhbmQgbm8gb3RoZXIgbG9nIGluZm9ybWF0aW9uIGlzIG91dHB1dCB0aHJvdWdoIHRoZSBq
b3VybmFsY3RsIGNvbW1hbmQuIFBsZWFzZSB0YWtlIGEgbG9vayBhdCBob3cgdG8gbG9jYXRlIHRo
aXMgcHJvYmxlbS4gVGhhbmsgeW91o6ENCg0KDQogfiMgYnVzY3RsIC0tdmVyYm9zZSAgY2FsbCB4
eXoub3BlbmJtY19wcm9qZWN0LkxFRC5Hcm91cE1hbmFnZXIgL3h5ei9vcGVuYm1jX3Byb2plY3Qv
bGVkL2dyb3Vwcy9wb3dlcl9vbiBvcmcuZnJlZWRlc2t0b3AuREJ1cy5Qcm9wZXJ0aWVzIEdldCBz
cyB4eXoub3BlbmJtY19wcm9qZWN0LkxlZC5Hcm91cCBBc3NlcnRlZA0KTUVTU0FHRSAidiIgew0K
ICAgICAgICBWQVJJQU5UICJiIiB7DQogICAgICAgICAgICAgICAgQk9PTEVBTiBmYWxzZTsNCiAg
ICAgICAgfTsNCn07DQoNCiB+IyBidXNjdGwgLS12ZXJib3NlICBjYWxsIHh5ei5vcGVuYm1jX3By
b2plY3QuTEVELkdyb3VwTWFuYWdlciAveHl6L29wZW5ibWNfcHJvamVjdC9sZWQvZ3JvdXBzL3Bv
d2VyX29uIG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgU2V0IHNzdiB4eXoub3BlbmJt
Y19wcm9qZWN0LkxlZC5Hcm91cCBBc3NlcnRlZCBiIHRydWUNCkNhbGwgZmFpbGVkOiBwYXRoIG9y
IG9iamVjdCBub3QgZm91bmQNCg0KaGFybGV5DQo=

--_000_HK2PR04MB38264AF28981EE1CCA3FBCA2FE600HK2PR04MB3826apcp_
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
Hello everyone=A3=AC<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;There are the following calls to busctl, =
it is normal to use the get command, but the set command prompts &quot;Call=
 failed: path or object not found&quot;, and no other log information is ou=
tput through the journalctl command. Please take a look at how to locate
 this problem. Thank you=A3=A1</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupManager /=
xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties
<span style=3D"color: rgb(23, 78, 134);"><b>Get</b></span> ss xyz.openbmc_p=
roject.Led.Group Asserted<br>
<div>MESSAGE &quot;v&quot; {<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; VARIANT &quot;b&quot; {<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOOLEAN false;=
<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; };<br>
</div>
};</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;~# busctl --verbose &nbsp;call xyz.openbmc_project.LED.GroupManager /=
xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties
<span style=3D"color: rgb(12, 100, 192);"><b>Set</b></span> ssv xyz.openbmc=
_project.Led.Group Asserted b true<br>
Call failed: path or object not found</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
harley</div>
</body>
</html>

--_000_HK2PR04MB38264AF28981EE1CCA3FBCA2FE600HK2PR04MB3826apcp_--
