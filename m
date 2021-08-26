Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EFC3F8152
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 05:54:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw89Q0RFWz2ygC
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 13:54:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com;
 envelope-from=lin.tommysc@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (unknown [218.32.67.185])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw6Dx52cJz2xsF
 for <openbmc@lists.ozlabs.org>; Thu, 26 Aug 2021 12:27:13 +1000 (AEST)
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 26 Aug 2021 10:12:00 +0800
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 26 Aug 2021 10:12:00 +0800
Received: from IEC1-EX2016-02.iec.inventec (iec1-ex2016-02.iec.inventec
 [10.1.254.221])
 by IEC1-MSE-FE1.inventec.com with ESMTP id 17Q2BsBN049456;
 Thu, 26 Aug 2021 10:11:54 +0800 (GMT-8)
 (envelope-from Lin.TommySC@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-02.iec.inventec (10.1.254.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 26 Aug 2021 10:11:54 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::d5d8:f435:eb2c:676b]) by
 IEC1-EX2016-01.iec.inventec ([fe80::d5d8:f435:eb2c:676b%8]) with mapi id
 15.01.2176.014; Thu, 26 Aug 2021 10:11:54 +0800
From: =?utf-8?B?TGluLlRvbW15U0Mg5p6X5LiW5qy9IFRBTw==?=
 <Lin.TommySC@inventec.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Topic: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Index: AdeZffCe3FTiFR09TPmVfTNzFwE6kP//0zWA//6RBqA=
Date: Thu, 26 Aug 2021 02:11:54 +0000
Message-ID: <3f49a1350d374eb7a915ad7f8392895b@inventec.com>
References: <aab1dd3f9c034bc3a1eef34306149833@inventec.com>
 <CACPK8Xf7iYijTAfcDUOH3bs-gGdM9Yton4isuuLc2w-mosapig@mail.gmail.com>
In-Reply-To: <CACPK8Xf7iYijTAfcDUOH3bs-gGdM9Yton4isuuLc2w-mosapig@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.254.21]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE1.inventec.com 17Q2BsBN049456
X-TM-SNTS-SMTP: 0D1C5563B4ECD58BA844313707217A7EDED081A285356840D25EC0F0728B7E512000:8
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

SGkgSm9lbCwNCg0KSXMgaXQgcG9zc2libGUgdGhhdCBJIHJlc2VuZCBteSBtYWlsIHdpdGggaW5s
aW5lIGRpZmYgcGF0Y2ggYWdhaW4/IEJlY2F1c2UgaXQgbG9va3MgbGlrZSBnaXQtc2VuZC1lbWFp
bCBzdXBwb3J0cyBvbmx5IFBPUCB3aGljaCBpcyBub3Qgc3VwcG9ydGVkIGJ5IG91ciBjb21wYW55
J3MgbWFpbCBzZXJ2ZXIuDQoNCkJSDQpUb21teQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogSm9lbCBTdGFubGV5IFttYWlsdG86am9lbEBqbXMuaWQuYXVdIA0KU2VudDogV2Vk
bmVzZGF5LCBBdWd1c3QgMjUsIDIwMjEgODoxMyBQTQ0KVG86IExpbi5Ub21teVNDIOael+S4luas
vSBUQU8gPExpbi5Ub21teVNDQGludmVudGVjLmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc7IFllLlZpYyDokYnlrofmuIUgVEFPIDx5ZS52aWNAaW52ZW50ZWMuY29tPjsgTW9oYW1t
ZWQuSGFiZWViIElTViA8bW9oYW1tZWQuaGFiZWViQGludmVudGVjLmNvbT47IEt1by5NYXJjZWwg
6YOt5aOr5b63IElTViA8a3VvLm1hcmNlbEBpbnZlbnRlYy5jb20+DQpTdWJqZWN0OiBSZTogW1BB
VENIXSBBUk06IGR0czogYXNwZWVkOiBBZGRpbmcgSW52ZW50ZWMgVHJhbnNmb3JtZXJzIEJNQw0K
DQpIaSBUb21teSwNCg0KT24gV2VkLCAyNSBBdWcgMjAyMSBhdCAxMjoxMSwgTGluLlRvbW15U0Mg
5p6X5LiW5qy9IFRBTyA8TGluLlRvbW15U0NAaW52ZW50ZWMuY29tPiB3cm90ZToNCj4NCj4gQXMg
dGl0bGVkLg0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KV2hlbiBzdWJtaXR0aW5nIHBhdGNo
ZXMgZm9yIG9wZW4gc291cmNlIHByb2plY3RzIGxpa2UgdGhlIGtlcm5lbCwgd2UgdXN1YWxseSB1
c2UgZ2l0LXNlbmQtZW1haWwuIFRoaXMgd2lsbCBzZW5kIHlvdXIgY29kZSBhcyBhbiBpbmxpbmUg
ZGlmZiwgYWxsb3dpbmcgdXMgdG8gcmV2aWV3IGFuZCBhcHBseSBpdC4NCg0KSWYgeW91IGNvdWxk
IHJlc2VuZCB0aGF0IHdvdWxkIGJlIGFwcHJlY2lhdGVkLg0KDQpDaGVlcnMsDQoNCkpvZWwNCg==
