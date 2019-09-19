Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC57B702F
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 02:51:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YdZW2b7HzF4jx
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 10:51:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
X-Greylist: delayed 912 seconds by postgrey-1.36 at bilbo;
 Thu, 19 Sep 2019 10:50:34 AEST
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YdYk0qMSzF4gm
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 10:50:33 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id x8J0KHqo002186
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 08:20:17 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x8J0JZRA002014;
 Thu, 19 Sep 2019 08:19:35 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 19 Sep
 2019 08:34:42 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 19 Sep
 2019 08:34:51 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Thu, 19 Sep 2019 08:34:40 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Eddie James
 <eajames@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH linux dev-5.2 v2 3/4] ARM: dts: Aspeed: ast2600: Add I2C
 busses
Thread-Topic: [PATCH linux dev-5.2 v2 3/4] ARM: dts: Aspeed: ast2600: Add
 I2C busses
Thread-Index: AQHValABq3Nhn/9c0UK4vSvqDTYP3acwuioAgABMzACAABHTAIAAEiGAgAEEJFA=
Date: Thu, 19 Sep 2019 00:34:40 +0000
Message-ID: <75a2d5dfc1e04527b0fc258df9426015@TWMBX02.aspeed.com>
References: <1568391353-32584-1-git-send-email-eajames@linux.ibm.com>
 <1568391353-32584-4-git-send-email-eajames@linux.ibm.com>
 <9f747c91-0988-2eb1-7387-6bb5edff8611@kaod.org>
 <7079ed45-7bfe-f580-2829-5d984c520608@linux.ibm.com>
 <41fe74ea-4186-e059-401d-f6a6ed39e4ec@kaod.org>
 <c5a539f1-2304-0ef3-b6a2-9ee96614924b@kaod.org>
In-Reply-To: <c5a539f1-2304-0ef3-b6a2-9ee96614924b@kaod.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x8J0JZRA002014
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
Cc: "andrew@aj.id.au" <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8sDQoJSXQgaXMgY29ycmVjdCwgdGhlIEFTVDI2MDAgSVJRIG51bWJlciByYW5nZSBpcyBm
cm9tIEdJQ19TUEkgMTEwIH4xMjUuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBvcGVuYm1jIFttYWlsdG86b3BlbmJtYy1ib3VuY2VzK3J5YW5fY2hlbj1hc3BlZWR0ZWNoLmNv
bUBsaXN0cy5vemxhYnMub3JnXSBPbiBCZWhhbGYgT2YgQ2VkcmljIExlIEdvYXRlcg0KU2VudDog
VGh1cnNkYXksIFNlcHRlbWJlciAxOSwgMjAxOSAxOjAyIEFNDQpUbzogRWRkaWUgSmFtZXMgPGVh
amFtZXNAbGludXguaWJtLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KQ2M6IGFuZHJl
d0Bhai5pZC5hdQ0KU3ViamVjdDogUmU6IFtQQVRDSCBsaW51eCBkZXYtNS4yIHYyIDMvNF0gQVJN
OiBkdHM6IEFzcGVlZDogYXN0MjYwMDogQWRkIEkyQyBidXNzZXMNCg0KT24gMTgvMDkvMjAxOSAx
Nzo1NywgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6DQo+IE9uIDE4LzA5LzIwMTkgMTY6NTMsIEVk
ZGllIEphbWVzIHdyb3RlOg0KPj4NCj4+IE9uIDkvMTgvMTkgNToxOCBBTSwgQ8OpZHJpYyBMZSBH
b2F0ZXIgd3JvdGU6DQo+Pj4gT24gMTMvMDkvMjAxOSAxODoxNSwgRWRkaWUgSmFtZXMgd3JvdGU6
DQo+Pj4+IEFkZCBhbGwgdGhlIEkyQyBidXNzZXMgdG8gdGhlIEFTVDI2MDAgZHRzaSBhbmQgc2V0
IHRoZWlyIHJlcXVpcmVkIA0KPj4+PiBwcm9wZXJ0aWVzLg0KPj4+Pg0KPj4+IFRoZSBEVCBkZWZp
bmVzIGFuIGludGVycnVwdCBwZXIgSTJDIGJ1cyBidXQgdGhpcyBpcyBub3QgaG93IHRoZSBJMkMg
DQo+Pj4gZHJpdmVyIG9wZXJhdGVzLiBJdCBzdGlsbCB1c2VzIHRoZSBvbGQgbW9kZSBmcm9tIHRo
ZSBBc3BlZWQgQVNUMjUwMC4NCj4+DQo+Pg0KPj4gT2g/IFRoZSBJMkMgaW50ZXJydXB0IGNvbnRy
b2xsZXIgZHJpdmVyIGlzIGEgc2VwYXJhdGUgZHJpdmVyLCB3aGljaCBJIGRpZG4ndCBpbmNsdWRl
IGEgbm9kZSBmb3IgaW4gdGhlIEFTVDI2MDAgZHRzLiBBcyBmYXIgYXMgSSBjYW4gdGVsbCB0aGUg
STJDIGJ1cyBkcml2ZXIganVzdCBhc2tzIGZvciBpdCdzIGludGVycnVwdCBhbmQgdXNlcyBpdCwg
c28gYnkgc2V0dGluZyBlYWNoIGJ1cyB0byBpdCdzIEdJQyBpbnRlcnJ1cHQgbGluZSAoaW5zdGVh
ZCBvZiB0aGUgbGluZSBmcm9tIHRoZSBJMkMgaW50ZXJydXB0IGNvbnRyb2xsZXIgbGlrZSBpbiB0
aGUgQVNUMjUwMCksIHRoZSBJMkMgZHJpdmVyIHJlY2VpdmVzIHRoZSBjb3JyZWN0IGludGVycnVw
dC4NCj4gDQo+IG9rLiBJIGFtIHNlZWluZyB0aGlzIGZyb20gdGhlIEkyQyBtb2RlbCBzaWRlIGFu
ZCB0aGF0IGlzIHdoZXJlIHRoZSANCj4gcHJvYmxlbSBtdXN0IGJlLiBJIHdpbGwgZGlnIGluIFFF
TVUuDQoNCldlIG5vdyBoYXZlIG9uZSBpcnEgcGVyIGJ1cyBhbmQgdGhlIEkyQyBtb2RlbCBuZWVk
cyBzb21lIHJld29yayBmb3IgdGhlIEFTVDI2MDAgYmVjYXVzZSB3ZSBvbmx5IGhhZCBvbmUgd2l0
aCB0aGUgcHJldmlvdXMgQXNwZWVkIFNvQy4NCg0KQXJlIHlvdSBzdXJlIG9mIHRoZSBJMkMgSVJR
IG51bWJlciByYW5nZSA/IFNob3VsZG4ndCB3ZSB1c2luZyByYW5nZQ0KMTQyLTE1NyBpbnN0ZWFk
ID8gDQoNClRoYW5rcywNCg0KQy4NCg==
