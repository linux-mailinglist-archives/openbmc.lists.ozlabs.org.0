Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBF4421AFC
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 02:12:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNdLb5GThz2yms
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 11:12:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com;
 envelope-from=lin.tommysc@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (unknown [218.32.67.185])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKb3q6F8tz2xY6
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 11:18:46 +1000 (AEST)
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 30 Sep 2021 09:18:35 +0800
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2308.14 via Frontend Transport; Thu, 30 Sep 2021 09:18:35 +0800
Received: from IEC1-EX2016-02.iec.inventec (iec1-ex2016-02.iec.inventec
 [10.1.254.221])
 by IEC1-MSE-FE2.inventec.com with ESMTP id 18U1IUSn068235;
 Thu, 30 Sep 2021 09:18:30 +0800 (GMT-8)
 (envelope-from Lin.TommySC@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-02.iec.inventec (10.1.254.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 30 Sep 2021 09:18:30 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007]) by
 IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007%8]) with mapi id
 15.01.2308.014; Thu, 30 Sep 2021 09:18:30 +0800
From: =?utf-8?B?TGluLlRvbW15U0Mg5p6X5LiW5qy9IFRBTw==?=
 <Lin.TommySC@inventec.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Topic: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Index: AdeZffCe3FTiFR09TPmVfTNzFwE6kP//0zWA//6RBqD//R/wgIAFU/WA/8ikBlA=
Date: Thu, 30 Sep 2021 01:18:30 +0000
Message-ID: <b65afcf4d8224325861fd1ac285d0132@inventec.com>
References: <aab1dd3f9c034bc3a1eef34306149833@inventec.com>
 <CACPK8Xf7iYijTAfcDUOH3bs-gGdM9Yton4isuuLc2w-mosapig@mail.gmail.com>
 <89f94a107b4f48328f865c5d40a15a23@inventec.com>
 <CACPK8XfvpZB-88+4ZHt1THmGc1c93prOv_eZmN5DwtXLcCVFog@mail.gmail.com>
In-Reply-To: <CACPK8XfvpZB-88+4ZHt1THmGc1c93prOv_eZmN5DwtXLcCVFog@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.177.156]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com 18U1IUSn068235
X-TM-SNTS-SMTP: 253E7D71319EF616F3CCDD039EDF2A74A14147540CB8187BE76F0CF38027B9222000:8
X-Mailman-Approved-At: Tue, 05 Oct 2021 11:10:55 +1100
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

SGkgSm9lbCwNCg0KSSd2ZSBzZW50IG15IHBhdGNoIGFnYWluIHVzaW5nICJnaXQgaW1hcC1zZW5k
IiBidXQgd2l0aG91dCBhbnkgZmVlZGJhY2suIFdvdWxkIHlvdSBtaW5kIGNoZWNraW5nIHRoaXMg
bGluaz8NCmh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9waXBlcm1haWwvb3BlbmJtYy8yMDIxLUF1
Z3VzdC8wMjczODMuaHRtbA0KDQpUaGFua3MNClRvbW15DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBKb2VsIFN0YW5sZXkgW21haWx0bzpqb2VsQGptcy5pZC5hdV0gDQpTZW50
OiBUaHVyc2RheSwgQXVndXN0IDI2LCAyMDIxIDExOjQ3IEFNDQpUbzogTGluLlRvbW15U0Mg5p6X
5LiW5qy9IFRBTyA8TGluLlRvbW15U0NAaW52ZW50ZWMuY29tPg0KQ2M6IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZzsgWWUuVmljIOiRieWuh+a4hSBUQU8gPHllLnZpY0BpbnZlbnRlYy5jb20+OyBN
b2hhbW1lZC5IYWJlZWIgSVNWIDxtb2hhbW1lZC5oYWJlZWJAaW52ZW50ZWMuY29tPjsgS3VvLk1h
cmNlbCDpg63lo6vlvrcgSVNWIDxrdW8ubWFyY2VsQGludmVudGVjLmNvbT4NClN1YmplY3Q6IFJl
OiBbUEFUQ0hdIEFSTTogZHRzOiBhc3BlZWQ6IEFkZGluZyBJbnZlbnRlYyBUcmFuc2Zvcm1lcnMg
Qk1DDQoNCk9uIFRodSwgMjYgQXVnIDIwMjEgYXQgMDI6MTgsIExpbi5Ub21teVNDIOael+S4luas
vSBUQU8gPExpbi5Ub21teVNDQGludmVudGVjLmNvbT4gd3JvdGU6DQo+DQo+IEhpIEpvZWwsDQo+
DQo+IFNvcnJ5IGZvciBteSB0eXBvLiBJIG1lYW4gaXQgc2VlbXMgdGhhdCBnaXQtc2VuZC1lbWFp
bCBjb21tYW5kIHN1cHBvcnRzIG9ubHkgU01UUC4gQW5kIG91ciBtYWlsIHNlcnZlciBzdXBwb3J0
cyBvbmx5IFBPUCBhbmQgSU1BUC4gU28gZG8geW91IGFjY2VwdCB0aGF0IEkgcmVzZW5kIG15IG1h
aWwgd2l0aCBpbmxpbmUgZGlmZiBwYXRjaD8NCg0KVGhlIHByb2JsZW0gd2l0aCBwYXN0aW5nIHRo
ZSBwYXRjaCBpbnRvIHlvdXIgZW1haWwgY2xpZW50IGlzIGl0IG9mdGVuIG1vZGlmaWVzIHRoZSB3
aGl0ZXNwYWNlLCBjYXVzaW5nIHRoZSBwYXRjaCB0byBiZSBjb3JydXB0LiBZb3UgY2FuIHRyeSB0
aG91Z2guDQoNCkEgY29tbW9uIHdvcmthcm91bmQgaXMgdG8gdXNlIGEgZGlmZmVyZW50IGFkZHJl
c3MgZm9yIHlvdXIgb3BlbiBzb3VyY2Ugd29yaywgc3VjaCBhcyBhIGdtYWlsLmNvbSBhY2NvdW50
Lg0KDQpDaGVlcnMsDQoNCkpvZWwNCg==
