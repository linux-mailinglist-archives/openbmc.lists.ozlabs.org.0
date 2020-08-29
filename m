Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0D62563F6
	for <lists+openbmc@lfdr.de>; Sat, 29 Aug 2020 03:21:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bddwd6TdfzDqsJ
	for <lists+openbmc@lfdr.de>; Sat, 29 Aug 2020 11:21:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=2a01:111:f400:febe::706;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on0706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::706])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bddvp1gwZzDqNn
 for <openbmc@lists.ozlabs.org>; Sat, 29 Aug 2020 11:21:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYFvDFLL3BQjHrrdNRTwy4pm6ySXtr48BYrWiiEx8SlAVRiJNw+TuBRkOwS3nNKI2Yq6jVU+/YN6yt/HwtIts+wgeBV7pNejWgjyTUrEqUnMI7QGjlc7YWaD7ZPdWjCs1Dg/I4puhIzm2I8YehUMt0LAgJNHPGXouTg0ASik3Kg6H8DNpMNoMmjV+Vmxe+vOnBhMNvh2ISDq5wacuXdZ6gSfcArwC3WaCgqjpkKTLn7v2vUzBUAAfGCIsbqxv37Ckqq77UUvqABG/VFQ6cDj5svtgZDDkoY8PttTRzfg/YGTnjiwqOMh96NGOGlJxWLq1O+pssiv+ceUNQT7FpbCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObeRSG804p6ov/pah2kusDOsCnkdN5HtWbfyPeQwQEQ=;
 b=Fht7v9erCbyEPXTw2RcptPTXifCR2/FIQ4IT9AnYXWGdVHWV6FHrsQ2GYOv+se1+EwyE9fZ+uZWCWPZmk23J/dkGJE2rTJGgtluYdyNKssCFcKqF5aE2HYWZQFfOqhVflMHoLbfpqGjvVJElUBGS0BlMXrfsWZx84hbHzeXx5zhT5waH76lFiiZV2By9uQscEckBvIXf4RzOc5nNv0kxmMWAheX5z5BoTljZBaZyFnXTa5KyutL6dGWonu43sBZcNOKv/Ppm5zpdqm81YHrGRI7P2ic5hTUhQbr6GZ2GPTr/+jy09KKqcPDc7K10MARoYJNKONhV3COSlNT0hQx6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK2PR06MB3313.apcprd06.prod.outlook.com (2603:1096:202:3c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Sat, 29 Aug
 2020 01:20:44 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::2173:463d:ac23:2a7d]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::2173:463d:ac23:2a7d%5]) with mapi id 15.20.3326.023; Sat, 29 Aug 2020
 01:20:44 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: =?gb2312?B?xM/SsKXgpeult6WopemltA==?= <1181052146@qq.com>, openbmc
 <openbmc@lists.ozlabs.org>
Subject: =?gb2312?B?u9i4sjogWERNQSBlbmdpbmUgZm9yIEFTVDI0MDA=?=
Thread-Topic: XDMA engine for AST2400
Thread-Index: AQHWfOFG9IgKj1kx+kumz5G2raFA66lM0pUQgAF4lWU=
Date: Sat, 29 Aug 2020 01:20:44 +0000
Message-ID: <HK0PR06MB3380370D4870483EB130C2CEF2530@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <tencent_6FC98F43C847A4FA599681BF8ABCC554C006@qq.com>,
 <23a6e0dde0144751b936877af5f049ef@TWMBX02.aspeed.com>
In-Reply-To: <23a6e0dde0144751b936877af5f049ef@TWMBX02.aspeed.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: qq.com; dkim=none (message not signed)
 header.d=none;qq.com; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d2a6b81-4bba-4cad-68b5-08d84bb9c09a
x-ms-traffictypediagnostic: HK2PR06MB3313:
x-microsoft-antispam-prvs: <HK2PR06MB331312B7244CC530B650878CF2530@HK2PR06MB3313.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kJAhfR6SiT9gg+D/D+3YgYPWpLduyGVPA9eqYlI8+S8/zIgdEcnlejFoX8q/HlJTvhfSAfAs+XbClvYbP0Lt4NJVwpF3qPKvSUak7QYRxIdgxkITqe+uIcOGVmJzkcuCO5XnqOzjrFCwndaIlwwwVheoKwOXQWYaJ/LANigBbV0it1T1kk26KT/QsEpq7McMvCWRabP0k93tQ6tQ2T3u3bZ5c/NH7psdJL/OCvC1aGyMn0JUcag4wNwr5T7GMZqjBrcXqOcJFoLamEWTQ/+FGmcNETkjXVEP8FvZZlePhAYlhclQ9G/+BQOFuaYl1iny
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39830400003)(366004)(136003)(346002)(34096005)(26005)(316002)(110136005)(5660300002)(9686003)(19627405001)(55016002)(53546011)(55236004)(186003)(66946007)(76116006)(66476007)(64756008)(66556008)(224303003)(7696005)(478600001)(66446008)(52536014)(6506007)(71200400001)(2906002)(86362001)(8936002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: UpejlOp6nXnFHxJBZto5JaNso/+V3+AqC5yHcSSJFPIuEIpbi68bhf4CbtwCQZdCM8aVlRv6EKPKZDVdzNR92BWPj61Uvc9i6oeeTT7MRvZgrwuvMgRvDUft5Nn8UFH/kaPu60JoCF2qcMgjdzSydpoSX3OT2wDgZvpJI/batkWnAkmmMGbwlt1exjugSQMqr7DcsNzg/kj2TId2LN8reAK6LfT/d2gjj3spBayM8p+Ehj5tjYjctKgqnzoFBiFKNv5foV8dc0MKzz6wd2wOoWNsmQOYiyn+CWAJhYgrIGHuDH3P94KExw4aIfB9mWUb+0/Zc5BCiN+UWYeH0F+Mtik4hV0RcfisuNMjQW2P3J0KdjlvZI+ZSSPY1bFprvnNQmeyBao08dMPabocrzdjh0LNx7JS+yER6JWeszdh4I17qrDv3Jj1z6giSC69IWDxKM2L9qYiKSJ1oQFBl171GPL+4DYqr/3Drka9UkSTa8Rr3QW2KorwF7UMhxvKRHSeGvtzZlXOvjb4fGhFD+GD2tCykbyUsTwt3d5xOI+fFffcCzE/Q7SgGiu1fiQJKUa3So7QpVnRzlou9zeNF6Zi+6f7WQ0+8l4H9rG3L2e6Aa7Eu9/EWoiChwf5mJvaJxPk4WXX3ZY/Xu+qc8IJteXL6w==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR06MB3380370D4870483EB130C2CEF2530HK0PR06MB3380apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2a6b81-4bba-4cad-68b5-08d84bb9c09a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2020 01:20:44.3503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHB1H4auTe6gg3KGtYdocTvYJClv5W2i38nFO+9uli6fy38M2WlQL+16e8QaaW58veA/ikH1Iqg8GqPDYH6URB6zCPUpdNR15xpTHINR7RY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3313
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

--_000_HK0PR06MB3380370D4870483EB130C2CEF2530HK0PR06MB3380apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8sDQogICAgIEl0IHN1cHBvcnRzIEFTVDI0MDAsIHlvdSBjYW4gY2hlY2sgZHJpdmVyICJ7
IC5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNDAwLXhkbWEiLCAuZGF0YSA9ICh2b2lkICopIDAs
IH0sIg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCrzEvP7V3zogb3BlbmJtYyA8
b3BlbmJtYy1ib3VuY2VzK3J5YW5fY2hlbj1hc3BlZWR0ZWNoLmNvbUBsaXN0cy5vemxhYnMub3Jn
PiC0+rHtIFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KvMS8/sjVxto6IDIw
MjDE6jjUwjI4yNUgyc/O5yAxMDo1Mg0KytW8/tXfOiDEz9KwpeCl66W3pail6aW0IDwxMTgxMDUy
MTQ2QHFxLmNvbT47IG9wZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCtb31rw6IFJF
OiBYRE1BIGVuZ2luZSBmb3IgQVNUMjQwMA0KDQpIZWxsbywNCiAgICAgICAgQVNUMjQwMCBzdXBw
b3J0IHhETUEsIHRoZSBkaWZmZXJlbnQgd2lsbCBiZSBjb21tYW5kIGZvcm1hdC4gSXQgbmVlZCB0
byBtb2RpZnkgZm9yIEFTVDI0MDAuDQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyty
eWFuX2NoZW49YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIMTP
0rA/Pz8/Pz8NClNlbnQ6IEZyaWRheSwgQXVndXN0IDI4LCAyMDIwIDEwOjEzIEFNDQpUbzogb3Bl
bmJtYyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogWERNQSBlbmdpbmUgZm9y
IEFTVDI0MDANCg0KR3JlZXRpbmdzLA0KDQpJIGFtIGxlYXJuaW5nIE9wZW5ibWMgd2l0aCBhIEFT
VDI0MDAgQk1DLiBJIGFtIGxlYXJuaW5nIFhETUEgZW5naW5lLiBJIHNhdyB0aGVyZSBpcyBhIGRy
aXZlciBpbiB0aGUgbGludXgga2VybmVsKC9kcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLXhkbWEu
YykgZm9yIFhETUEgZW5naW5lLiBCdXQgdGhpcyBkcml2ZXIncyAib2ZfbWF0Y2hfdGFibGUiIG9u
bHkgc3VwcG9ydCBBU1QyNTAwIGFuZCBBU1QyNjAwLg0KRG9lcyBBU1QyNDAwIG5vdCBzdXBwb3J0
IFhETUEgZW5naW5lPyBCdXQgaW4gdGhlIGRhdGFzaGVldCwgdGhlIEFTVDI0MDAgaGFzIGEgWERN
QSBlbmdpbmUgYXMgd2l0aCBBU1QyNTAwLg0KQ2FuIHNvbWUgb25lIGhlbHAgbWU/IFRoYW5rcyEN
Cg0KQmVzdCBSZWdhcmRzIQ0KTGl1IEhvbmd3ZWkNCg==

--_000_HK0PR06MB3380370D4870483EB130C2CEF2530HK0PR06MB3380apcp_
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
Hello,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp;It supports AST2400, you can check driver &quot;{ .comp=
atible =3D &quot;aspeed,ast2400-xdma&quot;, .data =3D (void *) 0, },&quot;<=
/div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=BC=C4=BC=FE=D5=DF:</b> openbmc=
 &lt;openbmc-bounces+ryan_chen=3Daspeedtech.com@lists.ozlabs.org&gt; =B4=FA=
=B1=ED Ryan Chen &lt;ryan_chen@aspeedtech.com&gt;<br>
<b>=BC=C4=BC=FE=C8=D5=C6=DA:</b> 2020=C4=EA8=D4=C228=C8=D5 =C9=CF=CE=E7 10:=
52<br>
<b>=CA=D5=BC=FE=D5=DF:</b> =C4=CF=D2=B0=A5=E0=A5=EB=A5=B7=A5=A8=A5=E9=A5=B4=
 &lt;1181052146@qq.com&gt;; openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=D6=F7=D6=BC:</b> RE: XDMA engine for AST2400</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello, <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AST2400 support xDMA, the differ=
ent will be command format. It need to modify for AST2400.<br>
<br>
From: openbmc &lt;openbmc-bounces+ryan_chen=3Daspeedtech.com@lists.ozlabs.o=
rg&gt; On Behalf Of =C4=CF=D2=B0??????<br>
Sent: Friday, August 28, 2020 10:13 AM<br>
To: openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
Subject: XDMA engine for AST2400<br>
<br>
Greetings,<br>
<br>
I am learning Openbmc with a AST2400 BMC. I am learning XDMA engine. I saw =
there is a driver in the linux kernel(/drivers/soc/aspeed/aspeed-xdma.c) fo=
r XDMA engine. But this driver's &quot;of_match_table&quot; only support AS=
T2500 and AST2600.<br>
Does AST2400 not support XDMA engine? But in the datasheet, the AST2400 has=
 a XDMA engine as with AST2500.<br>
Can some one help me? Thanks!<br>
<br>
Best Regards!<br>
Liu Hongwei<br>
</div>
</span></font></div>
</body>
</html>

--_000_HK0PR06MB3380370D4870483EB130C2CEF2530HK0PR06MB3380apcp_--
