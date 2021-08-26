Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 757803F8151
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 05:53:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw88y2wDDz2yZt
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 13:53:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com;
 envelope-from=lin.tommysc@inventec.com; receiver=<UNKNOWN>)
X-Greylist: delayed 389 seconds by postgrey-1.36 at boromir;
 Thu, 26 Aug 2021 12:18:37 AEST
Received: from mail.inventec.com (unknown [218.32.67.185])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw63164csz2xy4
 for <openbmc@lists.ozlabs.org>; Thu, 26 Aug 2021 12:18:37 +1000 (AEST)
Received: from IEC1-EX2016-03.iec.inventec (10.15.2.59) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 26 Aug 2021 10:18:32 +0800
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 26 Aug 2021 10:18:30 +0800
Received: from IEC1-EX2016-02.iec.inventec (iec1-ex2016-02.iec.inventec
 [10.1.254.221])
 by IEC1-MSE-FE2.inventec.com with ESMTP id 17Q2I7Ot072804;
 Thu, 26 Aug 2021 10:18:07 +0800 (GMT-8)
 (envelope-from Lin.TommySC@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-02.iec.inventec (10.1.254.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 26 Aug 2021 10:18:07 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::d5d8:f435:eb2c:676b]) by
 IEC1-EX2016-01.iec.inventec ([fe80::d5d8:f435:eb2c:676b%8]) with mapi id
 15.01.2176.014; Thu, 26 Aug 2021 10:18:07 +0800
From: =?utf-8?B?TGluLlRvbW15U0Mg5p6X5LiW5qy9IFRBTw==?=
 <Lin.TommySC@inventec.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Topic: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Index: AdeZffCe3FTiFR09TPmVfTNzFwE6kP//0zWA//6RBqD//R/wgA==
Date: Thu, 26 Aug 2021 02:18:06 +0000
Message-ID: <89f94a107b4f48328f865c5d40a15a23@inventec.com>
References: <aab1dd3f9c034bc3a1eef34306149833@inventec.com>
 <CACPK8Xf7iYijTAfcDUOH3bs-gGdM9Yton4isuuLc2w-mosapig@mail.gmail.com> 
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.254.21]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com 17Q2I7Ot072804
X-TM-SNTS-SMTP: 137D06E575E277358908550D53A4D8072F84D6B8B196BC9230687CE4B7A61D592000:8
X-Mailman-Approved-At: Thu, 26 Aug 2021 13:52:25 +1000
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
Cc: =?utf-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>,
 =?utf-8?B?S3VvLk1hcmNlbCDpg63lo6vlvrcgSVNW?= <kuo.marcel@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KU29ycnkgZm9yIG15IHR5cG8uIEkgbWVhbiBpdCBzZWVtcyB0aGF0IGdpdC1z
ZW5kLWVtYWlsIGNvbW1hbmQgc3VwcG9ydHMgb25seSBTTVRQLiBBbmQgb3VyIG1haWwgc2VydmVy
IHN1cHBvcnRzIG9ubHkgUE9QIGFuZCBJTUFQLiBTbyBkbyB5b3UgYWNjZXB0IHRoYXQgSSByZXNl
bmQgbXkgbWFpbCB3aXRoIGlubGluZSBkaWZmIHBhdGNoPw0KDQpCUg0KVG9tbXkNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IExpbi5Ub21teVNDIOael+S4luasvSBUQU8gDQpT
ZW50OiBUaHVyc2RheSwgQXVndXN0IDI2LCAyMDIxIDEwOjEyIEFNDQpUbzogJ0pvZWwgU3Rhbmxl
eScgPGpvZWxAam1zLmlkLmF1Pg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgWWUuVmlj
IOiRieWuh+a4hSBUQU8gPHllLnZpY0BpbnZlbnRlYy5jb20+OyBNb2hhbW1lZC5IYWJlZWIgSVNW
IDxNb2hhbW1lZC5IYWJlZWJAaW52ZW50ZWMuY29tPjsgS3VvLk1hcmNlbCDpg63lo6vlvrcgSVNW
IDxLdW8uTWFyY2VsQGludmVudGVjLmNvbT4NClN1YmplY3Q6IFJFOiBbUEFUQ0hdIEFSTTogZHRz
OiBhc3BlZWQ6IEFkZGluZyBJbnZlbnRlYyBUcmFuc2Zvcm1lcnMgQk1DDQoNCkhpIEpvZWwsDQoN
CklzIGl0IHBvc3NpYmxlIHRoYXQgSSByZXNlbmQgbXkgbWFpbCB3aXRoIGlubGluZSBkaWZmIHBh
dGNoIGFnYWluPyBCZWNhdXNlIGl0IGxvb2tzIGxpa2UgZ2l0LXNlbmQtZW1haWwgc3VwcG9ydHMg
b25seSBQT1Agd2hpY2ggaXMgbm90IHN1cHBvcnRlZCBieSBvdXIgY29tcGFueSdzIG1haWwgc2Vy
dmVyLg0KDQpCUg0KVG9tbXkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEpv
ZWwgU3RhbmxleSBbbWFpbHRvOmpvZWxAam1zLmlkLmF1XSANClNlbnQ6IFdlZG5lc2RheSwgQXVn
dXN0IDI1LCAyMDIxIDg6MTMgUE0NClRvOiBMaW4uVG9tbXlTQyDmnpfkuJbmrL0gVEFPIDxMaW4u
VG9tbXlTQ0BpbnZlbnRlYy5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBZZS5W
aWMg6JGJ5a6H5riFIFRBTyA8eWUudmljQGludmVudGVjLmNvbT47IE1vaGFtbWVkLkhhYmVlYiBJ
U1YgPG1vaGFtbWVkLmhhYmVlYkBpbnZlbnRlYy5jb20+OyBLdW8uTWFyY2VsIOmDreWjq+W+tyBJ
U1YgPGt1by5tYXJjZWxAaW52ZW50ZWMuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gQVJNOiBk
dHM6IGFzcGVlZDogQWRkaW5nIEludmVudGVjIFRyYW5zZm9ybWVycyBCTUMNCg0KSGkgVG9tbXks
DQoNCk9uIFdlZCwgMjUgQXVnIDIwMjEgYXQgMTI6MTEsIExpbi5Ub21teVNDIOael+S4luasvSBU
QU8gPExpbi5Ub21teVNDQGludmVudGVjLmNvbT4gd3JvdGU6DQo+DQo+IEFzIHRpdGxlZC4NCg0K
VGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCldoZW4gc3VibWl0dGluZyBwYXRjaGVzIGZvciBvcGVu
IHNvdXJjZSBwcm9qZWN0cyBsaWtlIHRoZSBrZXJuZWwsIHdlIHVzdWFsbHkgdXNlIGdpdC1zZW5k
LWVtYWlsLiBUaGlzIHdpbGwgc2VuZCB5b3VyIGNvZGUgYXMgYW4gaW5saW5lIGRpZmYsIGFsbG93
aW5nIHVzIHRvIHJldmlldyBhbmQgYXBwbHkgaXQuDQoNCklmIHlvdSBjb3VsZCByZXNlbmQgdGhh
dCB3b3VsZCBiZSBhcHByZWNpYXRlZC4NCg0KQ2hlZXJzLA0KDQpKb2VsDQo=
