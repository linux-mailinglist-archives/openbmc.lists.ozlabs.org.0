Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B45813F5
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 10:09:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4629QQ47ZWzDqnD
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 18:09:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=vertiv.com
 (client-ip=40.107.68.74; helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.b="TOoZf2Uv"; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680074.outbound.protection.outlook.com [40.107.68.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4629Lr0CQVzDqgl
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 18:05:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WArn2POeqLaG+B8bWDJCozU2gMaHOw0g4VvKJ53vYRaBbdclTlOs2xB87nBlK4IC/68jtDfj39J3FuRtUJH394Bh4I0pQcTXcFWCIZqmf3lE5CQ1Uq2ujetGfyaqncxhUEwKSwgnUjQ9zfVW+25BXJ9wDWTEnF5l7LriEvfwl6wOgE/AIEcONWR9N3yNlxRzCAGzGYJ2s2dRsxxC8WebCD4OwOUjUpecLG0xO0CR7RSWGJjbdO5eRSjYdQKDowrXlza7oasHqv4XeLb/T27P0iQsEQE4j/1m40uIE6Zr5miAiWuqgLmL7tOMMXEjGBCVxwL0RPIT4ERmG27DMi1rfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpsGS0xCiZ48PBjeKcY4LCj0Mq2o0DOcarp2Z9Rf9T0=;
 b=KN4nZl857exHTpD5l9NCkyVU29vt+6l/ehieda4/LA1hJnrjXkUtEeSLx3UpBJ1a0YP6IPWlQjnWRowbIC6/DsFujj07ZSWUJPeA5gCkkWRhAnlUahDuCMKyY7Z0UyR+5Su3czWrnWP1QPNnZJZ6Tgev/j46j15G0q7vtZHdNz/pBcNkMeW2iN7ECYMHDfUEbKbcGVhNpJK7CprkX0TLhzFYyhOQD2wkx7/7gKGmOWSAbTcqMtmAZSyszp3orovr0Vr9pY+ebHaMNTP8ckJi5/g8+iNOqy9AMMbkaFQM4rj/p1brnRmrjfI53kQcBhnZuZWgnDE4tE5W0TV81sUUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpsGS0xCiZ48PBjeKcY4LCj0Mq2o0DOcarp2Z9Rf9T0=;
 b=TOoZf2UvqdadTZeLrNp4SNOzzcC1wtdzPiO2uouF4nT5UJ0VwOdiWj0c8Oo9o9QMffrW2kg5w9y/acKQ6h8Xx6ha6NTyVjOkzENas+/PKpZTq7jPAgl+7MMHQKABHqDlMXTY6kCy9HVYGL6tN8rCkq2+tPr2mDV8F5IeVk0acAw=
Received: from MWHPR13MB1360.namprd13.prod.outlook.com (10.173.120.8) by
 MWHPR13MB1341.namprd13.prod.outlook.com (10.173.123.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.9; Mon, 5 Aug 2019 08:05:48 +0000
Received: from MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::f8a0:214c:cccd:85a8]) by MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::f8a0:214c:cccd:85a8%6]) with mapi id 15.20.2157.011; Mon, 5 Aug 2019
 08:05:48 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: krtaylor <kurt.r.taylor@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: [ExternalEmail] Re: Signed CCLA from Vertiv
Thread-Topic: [ExternalEmail] Re: Signed CCLA from Vertiv
Thread-Index: AdVI1QWAN3LhRCTKR7+J3UF7per7QgAjYeUAAICAlCA=
Date: Mon, 5 Aug 2019 08:05:48 +0000
Message-ID: <MWHPR13MB136028DCE650949F5F86841AEDDA0@MWHPR13MB1360.namprd13.prod.outlook.com>
References: <MWHPR13MB1360C410A284A04C167D7397EDD90@MWHPR13MB1360.namprd13.prod.outlook.com>
 <8ccde7bc-5991-209e-1fd9-3240f6b80cb9@gmail.com>
In-Reply-To: <8ccde7bc-5991-209e-1fd9-3240f6b80cb9@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c017a3ff-d1df-4ea6-b5fa-08d7197bb995
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR13MB1341; 
x-ms-traffictypediagnostic: MWHPR13MB1341:
x-microsoft-antispam-prvs: <MWHPR13MB13413BADCFD6EB294C9B9CE0EDDA0@MWHPR13MB1341.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(39860400002)(136003)(376002)(13464003)(199004)(189003)(316002)(71200400001)(7736002)(81166006)(81156014)(305945005)(74316002)(71190400001)(6116002)(2906002)(110136005)(3846002)(11346002)(55016002)(486006)(66946007)(229853002)(86362001)(76116006)(446003)(66446008)(66556008)(53936002)(6436002)(8676002)(8936002)(64756008)(33656002)(476003)(66476007)(5660300002)(7696005)(9686003)(26005)(76176011)(186003)(99286004)(53546011)(102836004)(52536014)(6506007)(68736007)(478600001)(25786009)(5024004)(14444005)(256004)(6246003)(66066001)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR13MB1341;
 H:MWHPR13MB1360.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qRl006EmXSToE2KUGquCwMffWx0ARzb7BUjMxlv+dIDZMO07AQ1gttX0GEnJHNChUGsANNEWGoMMg+eJY9ukcULp5hV2PlUkgMG6vQhgFFsuVnSfqELBSBQv4B8ICgBC0u5d4ZuLZgUyJR7xjjPth/kR3QSi53BBCLnk6mK8yKtQm/Vo4qSRTYx/8tqTShvzbjwgpQg7XhuAxHbJFsq85Z04SQI/VSQ97fRdzOf5Tb+cnQey+fWJJoej3bglfwrxA4EW6JdcGEPLR3fblnp0rHZ2ZpczhoiUn4sPLO1UezFqVjcIL5dexoaA163wTtmjEmfosDqF8ReHpspLF0YsSRSSuFXJMg7W49Ftfze9bjtfMDSzvHEau10X4epCaYAs2OyUW6LNxahB0poruxuZ1Hjz9OZNO9CSf57BfjjHnyk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c017a3ff-d1df-4ea6-b5fa-08d7197bb995
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 08:05:48.0373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GPayfw8/GB6QwNoSRYBoAS7f0sCO1GuOGtQc04N5VOwUl3m91Nv1U1gwCsHLSIpsLpa8TDlC+USn0GTV6ObfGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR13MB1341
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

VGhhbmsgeW91IQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbToga3J0YXlsb3Ig
PGt1cnQuci50YXlsb3JAZ21haWwuY29tPg0KU2VudDogU2F0dXJkYXksIEF1Z3VzdCAwMywgMjAx
OSAyOjQ2IEFNDQpUbzogTGVlLCBUcm95IDxUcm95LkxlZUB2ZXJ0aXYuY29tPjsgT3BlbkJNQyBN
YWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogW0V4dGVybmFsRW1h
aWxdIFJlOiBTaWduZWQgQ0NMQSBmcm9tIFZlcnRpdg0KDQpPbiA4LzEvMTkgOToxNCBQTSwgVHJv
eS5MZWVAdmVydGl2LmNvbSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaXMgaXMgYSBmcmllbmRseSBy
ZW1pbmRlci4NCj4gUGxlYXNlIGxldCB1cyBrbm93IGlmIHRoZXJlIGlzIGFueSBvZiBpbmZvcm1h
dGlvbiBtaXNzaW5nLg0KDQpJIGd1ZXNzIEkgbWlzc2VkIHRoaXMgYmVjYXVzZSBvZiB2YWNhdGlv
bi4NCg0KV2VsY29tZSEgVGhhbmtzIGZvciBzaWduaW5nLiBZb3VyIENDTEEgaGFzIGJlZW4gYWNj
ZXB0ZWQuDQoNCkt1cnQgVGF5bG9yIChrcnRheWxvcikNCg0KPg0KPg0KPiBUaGFua3MsDQo+IFRy
b3kgTGVlDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5ibWMg
PG9wZW5ibWMtYm91bmNlcyt0cm95LmxlZT12ZXJ0aXYuY29tQGxpc3RzLm96bGFicy5vcmc+IE9u
IEJlaGFsZiBPZiBUcm95LkxlZUB2ZXJ0aXYuY29tDQo+IFNlbnQ6IFN1bmRheSwgSnVseSAyMSwg
MjAxOSAzOjE4IFBNDQo+IFRvOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc+DQo+IFN1YmplY3Q6IFtFeHRlcm5hbEVtYWlsXSBTaWduZWQgQ0NMQSBmcm9tIFZlcnRp
dg0KPg0KPiBHcmVldGluZ3MsDQo+DQo+IFRoaXMgaXMgVHJveSBMZWUgZnJvbSBWZXJ0aXYuDQo+
IFBsZWFzZSBmaW5kIHNpZ25lZCBDQ0xBIGZyb20gVmVydGl2L0F2b2NlbnQgYXR0YWNoZWQuDQo+
IFBsZWFzZSBoZWxwIHRvIGFjY2VwdCBpdC4NCj4NCj4gVGhhbmtzLA0KPiBUcm95IExlZQ0KPiBD
T05GSURFTlRJQUxJVFkgTk9USUNFOiBUaGlzIGUtbWFpbCBhbmQgYW55IGZpbGVzIHRyYW5zbWl0
dGVkIHdpdGggaXQgYXJlIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZp
ZHVhbCBvciBlbnRpdHkgdG8gd2hvbSB0aGV5IGFyZSBhZGRyZXNzZWQgYW5kIG1heSBjb250YWlu
IGNvbmZpZGVudGlhbCBhbmQgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbiBwcm90ZWN0ZWQgYnkgbGF3
LiBJZiB5b3UgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIGFueSByZXZpZXcsIHVzZSwg
ZGlzc2VtaW5hdGlvbiwgZGlzdHJpYnV0aW9uLCBvciBjb3B5aW5nIG9mIHRoZSBlLW1haWwgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZC4gUGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5
IGJ5IHJldHVybiBlLW1haWwgYW5kIGRlbGV0ZSBhbGwgY29waWVzIGZyb20geW91ciBzeXN0ZW0u
DQo+IENPTkZJREVOVElBTElUWSBOT1RJQ0U6IFRoaXMgZS1tYWlsIGFuZCBhbnkgZmlsZXMgdHJh
bnNtaXR0ZWQgd2l0aCBpdCBhcmUgaW50ZW5kZWQgc29sZWx5IGZvciB0aGUgdXNlIG9mIHRoZSBp
bmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIHRoZXkgYXJlIGFkZHJlc3NlZCBhbmQgbWF5IGNv
bnRhaW4gY29uZmlkZW50aWFsIGFuZCBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIHByb3RlY3RlZCBi
eSBsYXcuIElmIHlvdSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgYW55IHJldmlldywg
dXNlLCBkaXNzZW1pbmF0aW9uLCBkaXN0cmlidXRpb24sIG9yIGNvcHlpbmcgb2YgdGhlIGUtbWFp
bCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBQbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRp
YXRlbHkgYnkgcmV0dXJuIGUtbWFpbCBhbmQgZGVsZXRlIGFsbCBjb3BpZXMgZnJvbSB5b3VyIHN5
c3RlbS4NCj4NCg0KQ09ORklERU5USUFMSVRZIE5PVElDRTogVGhpcyBlLW1haWwgYW5kIGFueSBm
aWxlcyB0cmFuc21pdHRlZCB3aXRoIGl0IGFyZSBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ug
b2YgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20gdGhleSBhcmUgYWRkcmVzc2VkIGFu
ZCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgYW5kIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gcHJv
dGVjdGVkIGJ5IGxhdy4gSWYgeW91IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBhbnkg
cmV2aWV3LCB1c2UsIGRpc3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiwgb3IgY29weWluZyBvZiB0
aGUgZS1tYWlsIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIFBsZWFzZSBub3RpZnkgdGhlIHNlbmRl
ciBpbW1lZGlhdGVseSBieSByZXR1cm4gZS1tYWlsIGFuZCBkZWxldGUgYWxsIGNvcGllcyBmcm9t
IHlvdXIgc3lzdGVtLg0K
