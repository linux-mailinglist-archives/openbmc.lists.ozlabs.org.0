Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 843ACF1601
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 13:25:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Qht71R5zF614
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 23:25:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=20695f9c9=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 477QWW29G4zF67J
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 23:16:49 +1100 (AEDT)
IronPort-SDR: l8LfNIugB1HQJi+3NxF48Yqbh+MGlijFjAkdBBplJMQk8trYNsV75eppHNgWXH4TMvTPWUl14a
 zg0AsXA+s2jA==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 06 Nov 2019 20:16:44 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 20:16:42 +0800
Received: from mailbx09.quanta.corp ([192.168.57.9]) by mailbx09.quanta.corp
 ([192.168.57.9]) with mapi id 15.01.1713.009; Wed, 6 Nov 2019 20:16:42 +0800
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: "kunyi@google.com" <kunyi@google.com>
Subject: [phosphor-ipmi-blobs-binarystore] Platform configuration and the
 host-tool questions
Thread-Topic: [phosphor-ipmi-blobs-binarystore] Platform configuration and the
 host-tool questions
Thread-Index: AdWUm6BObRcJA08TT5K9IUYz4nw1mg==
Date: Wed, 6 Nov 2019 12:16:42 +0000
Message-ID: <dbc2cc41e76c497cb551d81f8298ef0a@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25024.006
x-tm-as-result: No-10--10.457900-5.000000
x-tmase-matchedrid: LVkZzMT5mEqb5g0gI2gnR5zEHTUOuMX33dCmvEa6IiGNTQc/3yVzaAr2
 Te2qiFCjBur/0lbL6QzXyVtFrAtOqiSKeTIQJ1bz0DLmSnNTPI9Iq1BEJ6pINHv3ioAd9KrSsaz
 EWgN8IaAdcm2OGsPiPkU6jxiUzE2y0kZSdXm5RCTiHyvyXeXh5nnUZqRb3abmEOidyVT9wHnYdc
 WNicpUK45TZO4r6MeQyWJXJFoAf/3cAUnQBuvU5JN65fjGjYMQfYlavNIcDCpCYjM6zs5Y/0FCh
 e0zQXY5fS0Ip2eEHnzWRN8STJpl3PoLR4+zsDTtgUicvJ4MChkeQ4s5nEafLMTowLmFIj7rMedL
 6kI9Liz9kjN/cIap2q8e8eBqaP6r
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--10.457900-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25024.006
x-tm-snts-smtp: 262553E62C8B117C253C890F4B343ADB826713363E28D3392B848B4FADE4075D2000:B
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgS3VuLA0KDQpJJ2QgbGlrZSB0byBhZGQgYSBwbGF0Zm9ybSBjb25maWd1cmF0aW9uIGZpbGUg
Zm9yIGJsb2IgYmFzZCBpZCBhbmQgc3lzZmlsZSBwYXRoLCBidXQgSSBhbHdheXMgZ2V0IHRoZSBy
ZXR1cm4gZXJyb3IsICJFbmNvdW50ZXJlZCBlcnJvciB3aGVuIHBhcnNpbmcgY29uZmlnIGZpbGUi
Lg0KSXMgbXkgY29uZmlnIGZpbGUgZm9ybWF0IHdyb25nIG9yIHNvbWV0aGluZyBJIG1pc3NlZCA/
DQoNCk15IGV4YW1wbGUgY29uZmlnLmpzb246DQp7DQogICJibG9iQmFzZUlkIjogIi9za20vaHNz
LyIsDQogICJzeXNGaWxlUGF0aCI6ICIvc3lzL2NsYXNzL2kyYy1kZXYvaTJjLTgvZGV2aWNlLzgt
MDA1OC9lZXByb20iLA0KICAib2Zmc2V0Qnl0ZXMiOiAyNTYsDQogICJtYXhTaXplQnl0ZXMiOiAx
MDI0DQp9DQoNCkJUVywgaXMgdGhlcmUgdGhlIHV0aWxpdHkgc3VjaCBhcyB0aGUgaG9zdC10b29s
IG9mIHBob3NwaG9yLWlwbWktZmxhc2ggdG8gdGVzdCA/DQoNCg0KVGhhbmtzLg0KDQpCZXN0IFJl
Z2FyZHMgDQpHZW9yZ2UgSHVuZw0KUmVzZWFyY2ggRGl2aXNpb24gLSBTb2Z0d2FyZSBFbmdpbmVl
cg0KUXVhbnRhIENvbXB1dGVyIEluYy4NCkV4dDogMTY4MzANCkUtTWFpbCA6IEdlb3JnZS5IdW5n
QFF1YW50YVRXLmNvbQ0KDQo=
