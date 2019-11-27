Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 832ED10AAF7
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 08:12:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NBmt0HQyzDqlc
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 18:12:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=227322a56=p.k.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 47NBjc6WGYzDqjX
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 18:09:55 +1100 (AEDT)
IronPort-SDR: SB/dHkq8nKylD4/TXvVn7qufALYuUp1xCtgpRZMK5rkj+4azevrmRuw0uv+LYxNJ5mb9WRXIWK
 1iWk1l7j7C/A==
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 27 Nov 2019 15:09:52 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 27 Nov
 2019 15:09:50 +0800
Received: from mailbx11.quanta.corp ([192.168.57.11]) by mailbx11.quanta.corp
 ([192.168.57.11]) with mapi id 15.01.1713.009;
 Wed, 27 Nov 2019 15:09:50 +0800
From: =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
To: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Subject: Re: Trigger conditions for beeps in x86-power-control
Thread-Topic: Trigger conditions for beeps in x86-power-control
Thread-Index: AQHVpNU2k+MROeFktEqbLYp0O34qSaeeE4mA
Date: Wed, 27 Nov 2019 07:09:50 +0000
Message-ID: <6697A849-BDBD-4E9A-8697-9D5D9D0645AB@quantatw.com>
References: <8B379F39-4E90-4C49-8A95-0A365A4DA277@quantatw.com>
In-Reply-To: <8B379F39-4E90-4C49-8A95-0A365A4DA277@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25068.005
x-tm-as-result: No-10--8.995600-8.000000
x-tmase-matchedrid: c/HXCguHooHUL3YCMmnG4hvgzEPRJaDEWw/S0HB7eoMTiSW9r3PknBkX
 +si55c+xVuw94JEv8tNXd3FV+S33VZ4l4oqN5cKRPja3w1ExF8SkpLxVvVhtnWmycYYiBYyZkBo
 2na6+eDGoJT6zGWPFGd7pjJo6gLgo1mST6qAbuwzVsW2YGqoUtAvxMaV6x4s8XKZrN6TIU9EADV
 ryRoxCDlYxmEhyom0jyCgHGmP6Zdm9Ih7W6ONFmm6HurDH4PpPghehpAfYfg+xK/qamqYywYKfE
 phMWSElr9eP9htW2V8He1uemd8SyKPFjJEFr+olSXhbxZVQ5H/3FLeZXNZS4KBkcgGnJ4WmBOW3
 IIKUPUY8sceIvUztpP+RGMtITacQAO/VPwnxlA5+3BndfXUhXQ==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--8.995600-8.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25068.005
x-tm-snts-smtp: 9CD4F7A22B56D422DA9EA154B73CFAC8D20272C1DB42C7C86F75AE80A61C622A2000:B
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4804BA097299842B54A809FC4FC4332@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQmlsbHMsDQoNClNvcnJ5IEkgZm91bmQgdGhhdCBJIHNhaWQgdGhlIHdyb25nIGV2ZW50LCBu
b3QgdGhlIHBvd2VyQnV0dG9uUHJlc3NlZCBldmVudCwgYnV0IHRoZSBzb2Z0IHNodXRkb3duLg0K
DQpJbiB0aGUgYWJzZW5jZSBvZiBTSU9fUzUgbW9uaXRvcmluZywgd2hlbiB0aGVyZSB3YXMgbm8g
Y2FzZSBvZiBwb3N0Q29tcGxldGVEZUFzc2VydCBpbiB0aGUgc3RhdGUgb2YgcG93ZXJTdGF0ZU9u
LCB0aGUgYmVlcCBmdW5jdGlvbiB3aWxsIGJlIGNhbGxlZCBiZWNhdXNlIHRoZSBzb2Z0IHNodXRk
b3duIGluIHRoZSBPUyBhbmQgaXQgd2FzIHN3aXRjaGVkIHRvIHBzUG93ZXJPS0RlQXNzZXJ0Lg0K
DQpOb3cgdGhlIHNvZnQgc2h1dGRvd24gaW4gdGhlIE9TIHdpbGwgc3dpdGNoIHRvIHBvc3RDb21w
bGV0ZURlQXNzZXJ0IGJ1dCBpdCB3aWxsIHRyaWdnZXIgYSBzb2Z0IHJlc2V0LCBhbmQgZmluYWxs
eSB0aGUgaG9zdCBzaHV0ZG93biBhbmQgdGhlIHBvd2VyIHN0YXRlIGlzIG9uLg0KDQpSZWdhcmRz
LA0KUC5LLg0KDQo+IE9uIE5vdiAyNywgMjAxOSwgYXQgMTE6NDYsIFAuIEsuIExlZSAo5p2O5p+P
5a+sKSA8UC5LLkxlZUBxdWFudGF0dy5jb20+IHdyb3RlOg0KPiANCj4gSGkgQmlsbHMsDQo+IA0K
PiBJIG9ic2VydmVkIHRoYXQgdGhlIGJlZXAgc291bmQgd2FzIHRyaWdnZXJlZCBieSByZWNlaXZp
bmcgdGhlIHBzUHBvd2VyT0tEZUFzc2VydCBldmVudCBpbiB0aGUgc3RhdGUgb2YgcG93ZXJTdGF0
ZU9uLCANCj4gYnV0IG15IG1hY2hpbmUgZG9lcyBub3QgaGF2ZSB0aGUgU0lPX1M1IEdQSU8gZXZl
bnRzLCBzbyBJIG5lZWQgdG8gYWRkIGEganVkZ21lbnQgd2hlbiBhIGJlZXAgc291bmQgaXMgbmVl
ZGVkLg0KPiANCj4gVGhlIHF1ZXN0aW9uIGlzLCBpcyB0aGUgZm9yY2VkIHNodXRkb3duIChwcmVz
c2luZyB0aGUgcG93ZXIgYnV0dG9uIGZvciBtb3JlIHRoYW4gNCBzZWNvbmRzKSBpbmNsdWRlZCBp
biAiREMgcG93ZXIgaXMgdW5leHBlY3RlZGx5IGxvc3QiIG1lbnRpb25lZCBpbiB0aGUgY29tbWVu
dD8NCj4gDQo+IFRoYW5rcywNCj4gUC5LLg0KPiANCg0K
