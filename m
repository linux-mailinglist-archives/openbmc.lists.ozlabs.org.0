Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B8F1EBECD
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 17:13:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bwXf06Y6zDqJ8
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 01:13:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.74;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=q+93lIua; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253074.outbound.protection.outlook.com [40.92.253.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bwWr4NCGzDqH4
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 01:12:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZtTSKKjsZFVW8+6qID6o8OzPAmqRoVBma60E4ZbImIYZ6C9k9GNo3n3NyrjeXEJjvRHHmPijCBQY/vSGo/FmYKK1yQUQ8k3L1YirNalpMf+JONZeOMMjoI7CBxkfjBlp8Axhl4kio4NDYSVgFI15VSjHe0mnQ3Tkvb+PWsRN/NazzYVSmjAZ+KdNS7l8d59I+DEwIFRXap3UqUz765EJV9ES+miqjUK59AcV/tIEyjVeKTNZTicgXqKXJ4dRGE0uVHY+h3c84BCCW0+LvRhG+KF6l/zcGCQ/vuD3rRV3rHD77yY7zN30MwvkreIatnfJMqGLSwkU/LBRt0L7R8itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjUSauaUG77rHTrwkkZ7t55wS5xpSaWpvl9CF7JEMdo=;
 b=kRfQUWh5iJ1InAF0isgY58Ooi8GKs5irox8uM4UMnaMzNmb9Nzb4gU7JEwzMl15cynsB9SL+1sr+CdS3APnqg2KJRQ8hdcrZFAfPOZSdK2Gqb9cQ+DsVSt6ME1aQwe/pQ5vwvSpnprizxwmxckwZhRO7mwMqMpS6kk9/fybp74SFzk3gXk9zOyGxHKbqQsrnqyP+BupqMGX13nBf8HpkFjIxCOH5wHIzvDLrtyXbmrIw60Pe/CdCYj/PwynzCjX/RWWb7kAFq/GuBEfrDYqed6049FKX++9GNC0c3RkhEsWAp4mNykhF/jqBj1cXuYGRhzU9d1ySRDR9SxUfwJQYug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjUSauaUG77rHTrwkkZ7t55wS5xpSaWpvl9CF7JEMdo=;
 b=q+93lIuabZV6OkqVCEsEqaKAkyDhXs6GlBEwA8leo44+PzsLsN2KaHOXCMq4j1mLhp/E9KNNIECTS6AdkuLdxicz55BjRpABsq7mvMqQJwGDXH3cXBSdh+3eEuxHGI5KK47Ay41MN0WkwU/RkHOnOJm69e0XUI9b3a2usDxPeGUk5Cn5UERgiCnpenXNeFF+x4A897FODySQWxxbhyBzCCUVbQH1dMiyy15saWFgPOgAymnGcLk4mnvAeB6FQx9PazR8Sm8bNIcCce5ADe1+Fy0J6ksiQRLeu07nu3wDufzJupX7Uhp3cdxIkzQm1e7QRzENlgaiN5WjvB2roGC5hA==
Received: from HK2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::43) by
 HK2APC01HT126.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::377)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 15:12:33 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::41) by HK2APC01FT037.mail.protection.outlook.com
 (2a01:111:e400:7ebc::223) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 15:12:33 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 15:12:33 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: About sensor question
Thread-Topic: About sensor question
Thread-Index: AQHWOO0JiWj6Gxy9FEamScvT+s401A==
Date: Tue, 2 Jun 2020 15:12:33 +0000
Message-ID: <HK2PR04MB382605B981F79CA4C9771507FE8B0@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A14D0719336AED9D54007C596D971E3952C2C50EAF2A9E1F9D34425CDA16B278;
 UpperCasedChecksum:1EDB37BEA7766DFE3C43A18E171A3D0CE089229723B54314940B01C167D97DF0;
 SizeAsReceived:6690; Count:43
x-tmn: [kcCjFl7dFL/P1wEbyKdTsnWC+3w5cna4]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: d6924b5c-9335-4df9-4f20-08d80707604f
x-ms-traffictypediagnostic: HK2APC01HT126:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mTVEI2xKsmYBhiRr/EoivSXZVdnIu9uKOgAs0/JWNY4Dsu7cXGErk8mdq/HlqffzJWTj12aUMILptbs70+2uBQiCmecvY5iNr5JeknOYqHT7Z8oPMN/irJE7AIZVdr4q3+sYTtgw3CF/Nzw646Tu9zmFTaNAaPhzcfDzdu7gKbPLw5SJ5seWB99xjRvgTGmW8xInvYBwdlTxAz7mFWlxSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: VzHES5HQhr/9F0sZY8ZoQK4vTwqb61zut3TrUL69SQlPcQUdU7JYdsyHWrxIoQ4179KHAY/ZuSTC8OimI2GNxY+0DJFdBsMyh7OSYnkSy/bzUuHJzTV2XSsFQiXWy757Pn6645alGU6XmDeTV1xgAA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB382605B981F79CA4C9771507FE8B0HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d6924b5c-9335-4df9-4f20-08d80707604f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 15:12:33.4641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT126
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

--_000_HK2PR04MB382605B981F79CA4C9771507FE8B0HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkNCg0KICAgICAgSW4gdGhlIGRpcmVjdG9yeSBvZiBtZXRhLXJvbXVsdXMvcmVjaXBlcy1waG9z
cGhvci9jb25maWd1cmF0aW9uLCB0aGVyZSBhcmUgdGhlIGZvbGxvd2luZyBmaWxlczoNCiAgICAg
IHJvbXVsdXMtaXBtaS1zZW5zb3JzLnlhbWwNCiAgICAgIHJvbXVsdXMtaXBtaS1pbnZlbnRvcnkt
c2Vuc29ycy55YW1sDQoNCiAgICAgIEkgdHJhY2tlZCB0aGUgY29tcGlsYXRpb24gcHJvY2VzcyBh
bmQgZm91bmQgdGhhdCB0aGVzZSB0d28gZmlsZXMgd2VyZSBjb3BpZWQgdG8gdGhlIGNvbXBpbGF0
aW9uIGRpcmVjdG9yeSAvcm9tdWx1cy15YW1sLWNvbmZpZy8xLjAtcjEvaW1hZ2UgYW5kIHRoZSBy
b211bHVzLXlhbWwtY29uZmlnLWRldi5ycG0gcGFja2FnZSB3YXMgZ2VuZXJhdGVkLg0KDQogICAg
ICBBZnRlciBoZXJlLCBJIGRvbqGvdCBrbm93IGhvdyB0aGUgdHdvIGZpbGVzIGFyZSBwYWNrYWdl
ZCBpbnRvIHRoZSBvcGVuYm1jIGltYWdlo78NCg0KICAgICAgQW5kIEkgYWxzbyB3YW50IHRvIGtu
b3cgaW4gd2hhdCBmb3JtYXQgdGhlc2UgdHdvIGZpbGVzIGFyZSBzdG9yZWQgaW4gdGhlIE9wZW5i
bWMgaW1hZ2U/IEhvdyBpcyBpdCBwYXJzZWQgYnkgdGhlIG9wZW5ibWMgY29kZT8NCg0KVGhhbmtz
DQpIYXJsYXkNCg==

--_000_HK2PR04MB382605B981F79CA4C9771507FE8B0HK2PR04MB3826apcp_
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
Hi&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>&nbsp; &nbsp; &nbsp; In the directory of meta-romulus/recipes-phospho=
r/configuration, there are the following files:<br>
</span>
<div>&nbsp; &nbsp; &nbsp; romulus-ipmi-sensors.yaml<br>
</div>
<div>&nbsp; &nbsp; &nbsp; romulus-ipmi-inventory-sensors.yaml<br>
</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; I tracked the compilation process and found that =
these two files were copied to the compilation directory /romulus-yaml-conf=
ig/1.0-r1/image and the romulus-yaml-config-dev.rpm package was generated.<=
br>
</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp;&nbsp;After here, I don=A1=AFt know how the two fi=
les are packaged into the openbmc image=A3=BF</div>
<div><br>
</div>
<div><span style=3D"background: var(--white);">&nbsp; &nbsp; &nbsp; And I a=
lso want to know in what format these two files are stored in the Openbmc i=
mage? How is it parsed by the openbmc code?</span><br>
</div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>Thanks</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>Harlay</span></div>
</body>
</html>

--_000_HK2PR04MB382605B981F79CA4C9771507FE8B0HK2PR04MB3826apcp_--
