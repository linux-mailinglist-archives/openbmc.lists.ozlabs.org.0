Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82607A4D60
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 05:03:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MFJM24lbzDqZB
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 13:02:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=apc01-hk2-obe.outbound.protection.outlook.com
 (client-ip=40.107.130.87; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=ctcchien@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="E1ZISYYE"; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300087.outbound.protection.outlook.com [40.107.130.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MFHb0Mt6zDqYj
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 13:02:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9zvTzphSXP9/70/IMAVkWlkqInoLKA6CyLdrMHOA5aeN+jJ0MjjmZ/T/i1EbtGPWE7XPwf25cVQDbMDpzqwR5P0Z1QDJGSsjifT/fY630FxWnW7Wv8hFT/MwmwlvPXNyp00jwbfLtITseqU/2TFQuSmyBDdbLjejV6QAR+UHOGG5FPzkv4dNYSMfDlOotFuanPp1eqfeMZAWf9Y8tQbFhpGKbQa/abAembb9wwbD0Kwuh/dcbfpbu2ltsIPMJvkLX5rvNg/SRhqqrGJex8/AYwlc07iFlNCeTYDKYvJpbD6gj+Qa0192GC5fcQF8DGPP3BPYZrUhDww8iI3eVGexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAjIbTnvSYI34M3o9oeYzUYdnLTvG2gGGfkdr61PtEg=;
 b=LcOBcnhLGPWcWv8h3J+zx/SDeqQwE60jl4lX2qnJcfdzWgvsVw1plpp/mO/Ij7dBBB0DAa0QOJz7zpyswscWDg3EWXbxJYGRo2AGpRPrM3sQhuvoMeN1U2TshFalafBZ4qeSgd1rnVA0Cc5Sn7XOIlDl4wqbmHoqVXoRYqVNvpBRPZOTzHbzVhON/QtjQqrA/hJp3jObkdtsXuAl38npUKeNjnzzlj04cDGP5b09flTrU8DWwrzMoJfxiA9uag63W+Rxu6Sc7N98HBFHEcsgMmZjhGt9XIhtfDe8zXfJK8DNO6FxEbJUnnxQcm537Bh5qO5m3mY+VTdJNNu0bseJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAjIbTnvSYI34M3o9oeYzUYdnLTvG2gGGfkdr61PtEg=;
 b=E1ZISYYE6kOw3KHDjwqqBW0qjicEGjy6Ih+y01XpJbpkO2jk8caOyd+aGxSCeY6tlJET3+5mTHfrEmwQG0vNRvUoHYg7fo/srN8l/oEWfIK+bT6gyGpYeLNdBLFcuQQtIaRb2ZrkKo4xkcrg7Px4vrAQFmWjfaifwjLEYJcmE5E=
Received: from HK0PR03MB5123.apcprd03.prod.outlook.com (52.132.237.76) by
 HK0PR03MB3330.apcprd03.prod.outlook.com (52.133.215.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.10; Mon, 2 Sep 2019 03:02:10 +0000
Received: from HK0PR03MB5123.apcprd03.prod.outlook.com
 ([fe80::4cec:74fb:671:5050]) by HK0PR03MB5123.apcprd03.prod.outlook.com
 ([fe80::4cec:74fb:671:5050%7]) with mapi id 15.20.2241.012; Mon, 2 Sep 2019
 03:02:10 +0000
From: CS20 CTCchien <CTCCHIEN@nuvoton.com>
To: Patrick Venture <venture@google.com>, CS20 KWLiu <KWLIU@nuvoton.com>,
 Benjamin Fair <benjaminfair@google.com>
Subject: RE: phosphor-ipmi-flash: A problem in BMC FW update over LPC
Thread-Topic: phosphor-ipmi-flash: A problem in BMC FW update over LPC
Thread-Index: AdVZo6Jl7YalvxqwR/SsXogzldHHZQAHWEgAAd5Z28A=
Date: Mon, 2 Sep 2019 03:02:10 +0000
Message-ID: <HK0PR03MB5123707BA82D7033A19F36EADFBE0@HK0PR03MB5123.apcprd03.prod.outlook.com>
References: <HK0PR03MB4068E6EB742A7088B92362A7AEA40@HK0PR03MB4068.apcprd03.prod.outlook.com>
 <CAO=notyaNX1JO2S6AdJd39oP-JqKef62G5w=2h2j-AXCrz1-WQ@mail.gmail.com>
In-Reply-To: <CAO=notyaNX1JO2S6AdJd39oP-JqKef62G5w=2h2j-AXCrz1-WQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CTCCHIEN@nuvoton.com; 
x-originating-ip: [60.250.194.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da77c4c0-29a2-4e9d-fb3c-08d72f51f2af
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HK0PR03MB3330; 
x-ms-traffictypediagnostic: HK0PR03MB3330:|HK0PR03MB3330:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB33308814A418AF5CEE5D3A94DFBE0@HK0PR03MB3330.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(136003)(39840400004)(376002)(199004)(13464003)(189003)(478600001)(66556008)(66946007)(71200400001)(71190400001)(110136005)(55016002)(5660300002)(33656002)(7696005)(81166006)(14454004)(81156014)(8676002)(76176011)(4326008)(186003)(99286004)(25786009)(8936002)(2906002)(316002)(52536014)(102836004)(6506007)(53546011)(26005)(15650500001)(14444005)(256004)(3846002)(6116002)(66066001)(86362001)(53936002)(6246003)(229853002)(6436002)(486006)(305945005)(7736002)(9686003)(476003)(446003)(76116006)(74316002)(66476007)(11346002)(66446008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB3330;
 H:HK0PR03MB5123.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FF5+rQF6XNV14R/1YyvcX87vph4rFlF1Ybc+GvjdnMmZ01k1wbRrORrn3RqWQbtotywrbBz+GzNmcb4maaOdKO0PYEJD70C9wCGrNzWcGT12OLNmbZguHE+1fBt8daXzlF4uraFLVE3tM88p9tCc5afeHuEFZfJPx2AvWC6FXcz6XA0jR/G3z8D6HmMQzzWZdh8QWxmX6ociKdQlkM/VnzePJSRDgT/UWBrnYmK5Ot5xiZlJT8DK4qkPPMNimmgzYcsYKgPxF9Qc0XuSkHDrxArnjgKoIqm+hyMmEiAnwZW/ErYqdGDf25o0Mc7ZIpOt3GIQqLeYj9XUksT6Dld3N9phlpq+xQPab88bPNwU32EqoXRA3Sg1TWlO2IgbkWcpD2GhgnLGUbZ4tosTrg0Uzv4OFR5VnOhY5lwwI6FzF0g=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da77c4c0-29a2-4e9d-fb3c-08d72f51f2af
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 03:02:10.4651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F3knej0bfjEmIQ77opdpZUdgwxLj2hGeX3fTyk0pD48QZgF/WbHLAipHXreP2xVmOdeo0QazI5zjxRham16zIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3330
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

SGkgUGF0cmljaywNCg0KSSB1c2UgbGF0ZXN0IHBob3NwaG9yLWlwbWktZmxhc2gsIGFuZCBJIG1l
dCBhbiBlcnJvciBhYm91dCAvZmxhc2gvaW1hZ2UgaW4gYm1jL2NvbmZpZy1zdGF0aWMtYm1jLXJl
Ym9vdC5qc29uLmluLA0KSSBjaGFuZ2UgaXQgdG8gL2ZsYXNoL3N0YXRpYywgdGhlbiB0aGUgaXNz
dWUgZGlzYXBwZWFyZWQuDQpEaWQgSSBtaXNzIHNvbWV0aGluZz8NCg0KVGhhbmtzDQoNCkIuUi4N
Ck1lZGFkDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBhdHJpY2sgVmVu
dHVyZSA8dmVudHVyZUBnb29nbGUuY29tPg0KU2VudDogRnJpZGF5LCBBdWd1c3QgMjMsIDIwMTkg
MTA6NDMgUE0NClRvOiBDUzIwIEtXTGl1IDxLV0xJVUBudXZvdG9uLmNvbT47IEJlbmphbWluIEZh
aXIgPGJlbmphbWluZmFpckBnb29nbGUuY29tPg0KQ2M6IENTMjAgQ1RDY2hpZW4gPENUQ0NISUVO
QG51dm90b24uY29tPjsgQ29yZXkgQ2hlbiAo6Zmz5b+X6YqYKSA8Q29yZXkuQ2hlbkBxdWFudGF0
dy5jb20+OyBGcmFuIEhzdSAo5b6Q6KqM6KyZKSA8RnJhbi5Ic3VAcXVhbnRhdHcuY29tPjsgU2Ft
dWVsIEppYW5nICjmsZ/pqI/lhYgpIDxTYW11ZWwuSmlhbmdAcXVhbnRhdHcuY29tPjsgR2Vvcmdl
IEh1bmcgKOa0quW/oOaVrCkgPEdlb3JnZS5IdW5nQHF1YW50YXR3LmNvbT47IG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IHBob3NwaG9yLWlwbWktZmxhc2g6IEEgcHJvYmxl
bSBpbiBCTUMgRlcgdXBkYXRlIG92ZXIgTFBDDQoNCk9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDQ6
MTMgQU0gQ1MyMCBLV0xpdSA8S1dMSVVAbnV2b3Rvbi5jb20+IHdyb3RlOg0KPg0KPiBIZWxsbyBQ
YXRyaWNrOg0KPg0KPg0KPg0KPiBXZSBhcmUgY3VycmVudGx5IHRyeWluZyB0byBlbmFibGUgdGhl
IEJNQyBGVyB1cGRhdGUgb3ZlciBMUEMgb24gb3VyIHBsYXRmb3JtIChudXZvdG9uIEJNQyksIGJ1
dCB3ZSBlbmNvdW50ZXIgYSBwcm9ibGVtIHdpdGggQklPUy4NCj4gVGhlIEJJT1MgZW5naW5lZXIg
aGFzIHJlc2VydmVkIG1lbW9yeSByZWdpb24gYXMgbW1pbyBzcGFjZSwgYnV0IHdlIGNvdWxkbid0
IHNlZSBhbnkgZGF0YSBjaGFuZ2UgaW4gdGhpcyByZWdpb24gZHVyaW5nIHJ1biBidXJuX215X2Jt
Yy4NCj4gV2UgaGF2ZSBjaGVja2VkIHRoZSBCTUMgc2V0dGluZyhpbiBscGNfbnV2b3Rvbi5jIGFu
ZCBMRE4gU0hNKSBidXQgd2UgY291bGRuJ3QgaWRlbnRpZnkgdGhlIHJvb3QgY2F1c2Ugb2YgdGhp
cyBwcm9ibGVtLg0KDQorQmVuamFtaW4gRmFpcg0KDQpJIGRvbid0IGtub3cgdGhlIE51dm90b24g
Qk1DIHRoYXQgd2VsbCwgYnV0IEkgZG8ga25vdyB0aGF0IEkgdGVzdGVkIGl0IG9uIGEgc3lzdGVt
IHdlIGhhdmUgdGhhdCB1c2VzIGl0LiAgSSdtIGFkZGluZyBCZW5qYW1pbiBhcyBoZSdzIG1vcmUg
ZmFtaWxpYXIgd2l0aCBhbnkgbnVhbmNlcyBhc3NvY2lhdGVkIHdpdGggTnV2b3RvbidzIEJNQy4N
Cg0KPg0KPg0KPg0KPiBJcyB0aGVyZSBhbnkgc2V0dGluZ3Mgd2UgbG9zdD8NCj4NCj4NCj4NCj4g
VGhhbmtzLA0KPg0KPiBKb3NlcGgNCj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gVGhlIHByaXZpbGVnZWQgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIGVtYWlsIGlzIGludGVuZGVkIGZvciB1c2Ugb25seSBieSB0aGUgYWRkcmVzc2VlcyBh
cyBpbmRpY2F0ZWQgYnkgdGhlIG9yaWdpbmFsIHNlbmRlciBvZiB0aGlzIGVtYWlsLiBJZiB5b3Ug
YXJlIG5vdCB0aGUgYWRkcmVzc2VlIGluZGljYXRlZCBpbiB0aGlzIGVtYWlsIG9yIGFyZSBub3Qg
cmVzcG9uc2libGUgZm9yIGRlbGl2ZXJ5IG9mIHRoZSBlbWFpbCB0byBzdWNoIGEgcGVyc29uLCBw
bGVhc2Uga2luZGx5IHJlcGx5IHRvIHRoZSBzZW5kZXIgaW5kaWNhdGluZyB0aGlzIGZhY3QgYW5k
IGRlbGV0ZSBhbGwgY29waWVzIG9mIGl0IGZyb20geW91ciBjb21wdXRlciBhbmQgbmV0d29yayBz
ZXJ2ZXIgaW1tZWRpYXRlbHkuIFlvdXIgY29vcGVyYXRpb24gaXMgaGlnaGx5IGFwcHJlY2lhdGVk
LiBJdCBpcyBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXplZCB1c2Ugb2YgY29uZmlkZW50aWFs
IGluZm9ybWF0aW9uIG9mIE51dm90b24gaXMgc3RyaWN0bHkgcHJvaGliaXRlZDsgYW5kIGFueSBp
bmZvcm1hdGlvbiBpbiB0aGlzIGVtYWlsIGlycmVsZXZhbnQgdG8gdGhlIG9mZmljaWFsIGJ1c2lu
ZXNzIG9mIE51dm90b24gc2hhbGwgYmUgZGVlbWVkIGFzIG5laXRoZXIgZ2l2ZW4gbm9yIGVuZG9y
c2VkIGJ5IE51dm90b24uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCiBUaGUgcHJpdmlsZWdlZCBjb25maWRlbnRpYWwg
aW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZW1haWwgaXMgaW50ZW5kZWQgZm9yIHVzZSBv
bmx5IGJ5IHRoZSBhZGRyZXNzZWVzIGFzIGluZGljYXRlZCBieSB0aGUgb3JpZ2luYWwgc2VuZGVy
IG9mIHRoaXMgZW1haWwuIElmIHlvdSBhcmUgbm90IHRoZSBhZGRyZXNzZWUgaW5kaWNhdGVkIGlu
IHRoaXMgZW1haWwgb3IgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcnkgb2YgdGhlIGVt
YWlsIHRvIHN1Y2ggYSBwZXJzb24sIHBsZWFzZSBraW5kbHkgcmVwbHkgdG8gdGhlIHNlbmRlciBp
bmRpY2F0aW5nIHRoaXMgZmFjdCBhbmQgZGVsZXRlIGFsbCBjb3BpZXMgb2YgaXQgZnJvbSB5b3Vy
IGNvbXB1dGVyIGFuZCBuZXR3b3JrIHNlcnZlciBpbW1lZGlhdGVseS4gWW91ciBjb29wZXJhdGlv
biBpcyBoaWdobHkgYXBwcmVjaWF0ZWQuIEl0IGlzIGFkdmlzZWQgdGhhdCBhbnkgdW5hdXRob3Jp
emVkIHVzZSBvZiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gb2YgTnV2b3RvbiBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkOyBhbmQgYW55IGluZm9ybWF0aW9uIGluIHRoaXMgZW1haWwgaXJyZWxldmFu
dCB0byB0aGUgb2ZmaWNpYWwgYnVzaW5lc3Mgb2YgTnV2b3RvbiBzaGFsbCBiZSBkZWVtZWQgYXMg
bmVpdGhlciBnaXZlbiBub3IgZW5kb3JzZWQgYnkgTnV2b3Rvbi4NCg==
