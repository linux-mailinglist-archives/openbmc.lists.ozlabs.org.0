Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E265B9F91B
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 06:12:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JC4W3WFjzDqN0
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 14:12:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=vertiv.com
 (client-ip=40.107.72.45; helo=nam05-co1-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.b="H2dGIzVe"; 
 dkim-atps=neutral
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720045.outbound.protection.outlook.com [40.107.72.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JC3q5JJ0zDqw0
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 14:11:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O78eLVe4vD58+cqcwRb5Hf3vzGUCsl4s/pFQ526q1OLGYoqhvREDmpe0y9h2IhKaphHcgyv6Tvzswul0a//95hsR6w9kbBbBCV24WIAVIbPeXW269dKgrV0sZfVgglHt4EL6AjqGudsWir1HuDt2ta289gxMiuoI4B3vwjpexrIuwpn47nBH4u5s4HlTbBk6S/LA43XsR2K0OUUdYPXCXBM327R1duQFrw7BjpQupxftHvS7rW4Ws6VY3p5E+FxPD4wICOaTta+7zH4ACn5vslo2w+OaslRRZkYH/7CM00ZO7BznYfaoFRnpnDhZvcF1tnDjN5/cgA0nX/1l+RUMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT/IyjHZV4HTbHaWlblOfjz3Pg9EeRavj38Yo1+39QU=;
 b=FL+Vbj6Yr3G2rdB9W31cZRK0mxcCdtmmEbq/ksy6it6ZNVY/DpbsHNRWDVflkHvMKfOFBBawJITIGOVd0yiq7jHHbRU/y9w7NwWRYetoI73rm9USwff9ax3fRTi2/tBwEU/VLDSBIWLCiAL1JY2508TPzf8/2aSSx3t6bxQIfeaj+6DUgGLDbniSMZcDYi3prp33rOW6WIYu6IJwa/z7QrbOhzDSPGPGDSm+bcu/P1MWbD+4QRzAV/7gwT5cUdmeDW68pZ0bQD/1btV9u9zPFfH+n57V6sytGBSLU3eexoPxOjCpbOKwbslN6/98K62HrgPGE1mAmdSs8It4HCwXlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT/IyjHZV4HTbHaWlblOfjz3Pg9EeRavj38Yo1+39QU=;
 b=H2dGIzVe7b3Pnxtn9KIsiTVlMnSbMqHu8m5sCe9rAdd6wultvjH7F1y6Y4CHDJv+j79/aCM7J2XQ7xRnmOMsKaIhPvkm1dUQMymudcUaRD7nViYZPIM5hjcenI1AIGoNkF4A6FMGsBRRab/yI+PAqsDphJIGmhdHgDZSvyo7vVU=
Received: from MWHPR13MB1360.namprd13.prod.outlook.com (10.173.120.8) by
 MWHPR13MB1182.namprd13.prod.outlook.com (10.169.203.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.13; Wed, 28 Aug 2019 04:11:27 +0000
Received: from MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::f8a0:214c:cccd:85a8]) by MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::f8a0:214c:cccd:85a8%6]) with mapi id 15.20.2241.000; Wed, 28 Aug 2019
 04:11:27 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [ExternalEmail] Re: Asynchronous Event Notification support.
Thread-Topic: [ExternalEmail] Re: Asynchronous Event Notification support.
Thread-Index: AQHVXH+GlPJYVUNaM023WUEVCq+P3acOjymQgACyVwCAALJYsA==
Date: Wed, 28 Aug 2019 04:11:26 +0000
Message-ID: <MWHPR13MB13602718636BB70207D36596EDA30@MWHPR13MB1360.namprd13.prod.outlook.com>
References: <ad95a67f-dbf9-450b-9cf4-38d9a595bf76@linux.vnet.ibm.com>
 <CF0228C6-5A25-452E-8849-7BCC778593FA@fb.com>
 <MWHPR13MB1360DD37BA66B55F2A1E0495EDA00@MWHPR13MB1360.namprd13.prod.outlook.com>
 <2a89f6df-5e60-1dfb-b2d9-a8a16b194b13@linux.intel.com>
In-Reply-To: <2a89f6df-5e60-1dfb-b2d9-a8a16b194b13@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 400f9cf8-b043-41e6-26da-08d72b6dcc2f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR13MB1182; 
x-ms-traffictypediagnostic: MWHPR13MB1182:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MWHPR13MB118239F48FCD924CD5E58406EDA30@MWHPR13MB1182.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(376002)(346002)(136003)(53754006)(199004)(189003)(13464003)(8676002)(3846002)(6116002)(6506007)(9686003)(55016002)(26005)(7736002)(6306002)(6436002)(11346002)(15650500001)(81166006)(81156014)(14454004)(66066001)(256004)(53546011)(14444005)(486006)(476003)(6246003)(446003)(53936002)(2501003)(305945005)(71200400001)(25786009)(99286004)(74316002)(966005)(186003)(33656002)(86362001)(76176011)(316002)(2906002)(229853002)(102836004)(64756008)(66556008)(66476007)(8936002)(76116006)(66446008)(110136005)(478600001)(5660300002)(52536014)(66946007)(7696005)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR13MB1182;
 H:MWHPR13MB1360.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pkaWuVlNlBKiPoRQM/NG/PPGSYnbqkRClcuDxS05U+fmRYwN+/JX/l0OL4xQxdakoX6E85BroxBf/DsPloVM6ONXYszdvVxbRVWuqSdeVdUbNj4uhmWbs0LDqLhDbuhYQ5q0oDDmoy8NyXPjvPEKxFuSNwughWb92ibSbbh/16mQ/8r1oNZDvIQGlCfZWtFoheQh8k/SYbkAAdWBCHtZQFFbosrDTZS+wRjFq2GHqsqoxbVtAiovLDK/exh/om91Ke+jPkCt2zGuaRZZCzb/6rLjQlU7JT2YkUTxfK9owHgz5h3kV+1TY9y7NBtrPyxovZxgy8i7wT3gZ1j+jv+8i7dywoSq0coUC9pZ5uj37SgouzhxmtnIshpkVYB8Kyv5w+lQmN0sVdl37PZ11m3pKLj5PZBsi4qHsxpDaVbPIQI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400f9cf8-b043-41e6-26da-08d72b6dcc2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 04:11:26.7898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5gpXIPdWOw1V3BiiENpj2kSbYfjrFM7Sgawvqwr7v5brtLzXk97CV4+hib8WhdAqBW003TJ6wuQ0ZSbCGIoAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR13MB1182
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

SGkgSmFzb24sDQoNCkl0J3MgdmVyeSB1c2VmdWwgaW5mb3JtYXRpb24gdG8ga25vdy4NCg0KVGhh
bmtzLA0KVHJveSBMZWUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5i
bWMgPG9wZW5ibWMtYm91bmNlcyt0cm95LmxlZT12ZXJ0aXYuY29tQGxpc3RzLm96bGFicy5vcmc+
IE9uIEJlaGFsZiBPZiBCaWxscywgSmFzb24gTQ0KU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjgs
IDIwMTkgMTozMSBBTQ0KVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6
IFtFeHRlcm5hbEVtYWlsXSBSZTogQXN5bmNocm9ub3VzIEV2ZW50IE5vdGlmaWNhdGlvbiBzdXBw
b3J0Lg0KDQoNCg0KT24gOC8yNy8yMDE5IDEyOjAyIEFNLCBUcm95LkxlZUB2ZXJ0aXYuY29tIHdy
b3RlOg0KPiBIaSwNCj4NCj4gQXMgZmFyIGFzIEkga25vdywgdGhlIHBob3NwaG9yLXNlbC1sb2dn
ZXIgaGFzIHRoZSBhYmlsaXR5IHRvIG1vbml0b3IgdGhlIHRocmVzaG9sZCBjcm9zc2luZyB3aGlj
aCBnZW5lcmF0ZWQgYnkgcGhvc3Bob3ItaHdtb24gb3IgZGJ1cy1zZW5zb3JzIG9uIERCdXMsIGFu
ZCB0aGVuIGl0IHdpbGwgZ2VuZXJhdGUgcmVkZmlzaCBldmVudCBsb2cgb3Igam91cm5hbCBsb2cu
DQo+DQo+IEhvd2V2ZXIsIEkgZGlkbid0IHNlZSB0aGUgSVBNSSBTRUwgYmVpbmcgZ2VuZXJhdGVk
IHJlZ2FyZGluZyB0byB0aGUgbmFtZSBvZiB0aGUgcmVwb3NpdG9yeS4NCkhpIFRyb3ksDQoNClRo
ZSBwaG9zcGhvci1zZWwtbG9nZ2VyIHdpbGwgbG9nIHRoZSBJUE1JIFNFTCBhbmQgUmVkZmlzaCBl
dmVudCB0byB0aGUgam91cm5hbC4gIE90aGVyIG1vZHVsZXMgYXJlIHRoZW4gcmVzcG9uc2libGUg
Zm9yIGdldHRpbmcgdGhlIGV2ZW50cyBvdXQgb2YgdGhlIGpvdXJuYWwgYW5kIG1ha2luZyB0aGVt
IGF2YWlsYWJsZSB0byBhIHVzZXIuDQoNCkZvciBleGFtcGxlIGluIEludGVsIHN5c3RlbXMsIHdl
IHVzZSByc3lzbG9nIHRvIGV4dHJhY3QgdGhlIElQTUkgU0VMIGxvZyBlbnRyaWVzIGZyb20gdGhl
IGpvdXJuYWwgYW5kIHN0b3JlIHRoZW0gdG8gYSBwZXJzaXN0ZWQgc3lzbG9nIGZpbGUuIChTZWUN
Cmh0dHBzOi8vZ2l0aHViLmNvbS9JbnRlbC1CTUMvb3BlbmJtYy90cmVlL2ludGVsL21ldGEtb3Bl
bmJtYy1tb2RzL21ldGEtY29tbW9uL3JlY2lwZXMtZXh0ZW5kZWQvcnN5c2xvZy4pDQoNClRoZW4s
IElQTUkgdXNlcyB0aGUgU0VMIGVudHJpZXMgaW4gdGhlIHN5c2xvZyBmaWxlIHRvIGhhbmRsZSB0
aGUgU0VMIElQTUkgY29tbWFuZHMuIChTZWUNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2lu
dGVsLWlwbWktb2VtL2Jsb2IvbWFzdGVyL3NyYy9zdG9yYWdlY29tbWFuZHMuY3BwLikNCg0KPg0K
PiBUaGFua3MsDQo+IFRyb3kgTGVlDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt0cm95LmxlZT12ZXJ0aXYuY29tQGxpc3Rz
Lm96bGFicy5vcmc+DQo+IE9uIEJlaGFsZiBPZiBWaWpheSBLaGVta2ENCj4gU2VudDogVHVlc2Rh
eSwgQXVndXN0IDI3LCAyMDE5IDEwOjMwIEFNDQo+IFRvOiBSYXRhbiBHdXB0YSA8cmF0YWd1cHRA
bGludXgudm5ldC5pYm0uY29tPjsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBUYW5vdXMs
IEVkIDxlZC50YW5vdXNAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxFbWFpbF0gUmU6
IEFzeW5jaHJvbm91cyBFdmVudCBOb3RpZmljYXRpb24gc3VwcG9ydC4NCj4NCj4NCj4NCj4g77u/
T24gOC8yNS8xOSwgMzo0MyBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIFJhdGFuIEd1cHRhIiA8
b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJl
aGFsZiBvZiByYXRhZ3VwdEBsaW51eC52bmV0LmlibS5jb20+IHdyb3RlOg0KPg0KPiAgICAgIEhp
IEFsbCwNCj4NCj4gICAgICBEb2VzIGFueW9uZSBoYXZlIHN1Z2dlc3Rpb25zIG9uIGVuYWJsaW5n
IEFzeW5jaHJvbnVzIEV2ZW50IG5vdGlmaWNhdGlvbg0KPiAgICAgIHN1cHBvcnQgZm9yIFJlZGZp
c2g/DQo+IEFyZSB5b3UgbG9va2luZyBmb3IgcmVkZmlzaCBvbmx5PyBBcmUgd2UgZXZlbiBoYW5k
bGluZyBhbnkgc3VjaCBldmVudCBpbiBCTUMgTGlrZSBzZW5zb3IgdGhyZXNob2xkIGNyb3NzaW5n
IG9yIGFueSBzeXN0ZW0gZmFpbHVyZSBldGMuDQo+DQo+ICAgICAgV2UgYXJlIGRvaW5nIHNvbWUg
ZXhwbG9yYXRpb24gb24gdGhpcyBhcmVhIGFuZCB3YW50ZWQgdG8gaGVhciBpZiBzb21lb25lDQo+
ICAgICAgaXMgYWxyZWFkeSB3b3JraW5nIG9uIGl0LiBXaWxsIGJlIGhhcHB5IHRvIGNvbGxhYm9y
YXRlLg0KPg0KPiAgICAgIFRoYW5rcywNCj4gICAgICBSYXRhbg0KPg0KPg0KPg0KPg0KPg0KPiBD
T05GSURFTlRJQUxJVFkgTk9USUNFOiBUaGlzIGUtbWFpbCBhbmQgYW55IGZpbGVzIHRyYW5zbWl0
dGVkIHdpdGggaXQgYXJlIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZp
ZHVhbCBvciBlbnRpdHkgdG8gd2hvbSB0aGV5IGFyZSBhZGRyZXNzZWQgYW5kIG1heSBjb250YWlu
IGNvbmZpZGVudGlhbCBhbmQgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbiBwcm90ZWN0ZWQgYnkgbGF3
LiBJZiB5b3UgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIGFueSByZXZpZXcsIHVzZSwg
ZGlzc2VtaW5hdGlvbiwgZGlzdHJpYnV0aW9uLCBvciBjb3B5aW5nIG9mIHRoZSBlLW1haWwgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZC4gUGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5
IGJ5IHJldHVybiBlLW1haWwgYW5kIGRlbGV0ZSBhbGwgY29waWVzIGZyb20geW91ciBzeXN0ZW0u
DQo+DQpDT05GSURFTlRJQUxJVFkgTk9USUNFOiBUaGlzIGUtbWFpbCBhbmQgYW55IGZpbGVzIHRy
YW5zbWl0dGVkIHdpdGggaXQgYXJlIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUg
aW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSB0aGV5IGFyZSBhZGRyZXNzZWQgYW5kIG1heSBj
b250YWluIGNvbmZpZGVudGlhbCBhbmQgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbiBwcm90ZWN0ZWQg
YnkgbGF3LiBJZiB5b3UgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIGFueSByZXZpZXcs
IHVzZSwgZGlzc2VtaW5hdGlvbiwgZGlzdHJpYnV0aW9uLCBvciBjb3B5aW5nIG9mIHRoZSBlLW1h
aWwgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gUGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVk
aWF0ZWx5IGJ5IHJldHVybiBlLW1haWwgYW5kIGRlbGV0ZSBhbGwgY29waWVzIGZyb20geW91ciBz
eXN0ZW0uDQo=
