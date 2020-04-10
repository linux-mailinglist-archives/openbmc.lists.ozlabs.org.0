Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 819EE1A3FC7
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 05:56:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z41b4qSqzDrLk
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 13:56:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zhaoxin.com (client-ip=203.148.12.81; helo=zxshcas1.zhaoxin.com;
 envelope-from=tigerliu@zhaoxin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zhaoxin.com
Received: from ZXSHCAS1.zhaoxin.com (unknown [203.148.12.81])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z40206VjzDqNV
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 13:54:35 +1000 (AEST)
Received: from zxbjmbx3.zhaoxin.com (10.29.252.165) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Fri, 10 Apr
 2020 11:54:24 +0800
Received: from zxbjmbx2.zhaoxin.com (10.29.252.164) by zxbjmbx3.zhaoxin.com
 (10.29.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Fri, 10 Apr
 2020 11:54:24 +0800
Received: from zxbjmbx2.zhaoxin.com ([fe80::4d77:9dba:64a8:8ec3]) by
 zxbjmbx2.zhaoxin.com ([fe80::4d77:9dba:64a8:8ec3%4]) with mapi id
 15.01.1261.035; Fri, 10 Apr 2020 11:54:23 +0800
From: "Tiger Liu(BJ-RD)" <TigerLiu@zhaoxin.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Eddie James <eajames@linux.ibm.com>
Subject: Re: OpenBMC : KVM over IP and media redirection function
Thread-Topic: OpenBMC : KVM over IP and media redirection function
Thread-Index: AdYO61ehmQuksx5zT0mO9/AFvvAtXQ==
Date: Fri, 10 Apr 2020 03:54:23 +0000
Message-ID: <c4b2766b9e0145c180ee894105554496@zhaoxin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.29.28.153]
Content-Type: text/plain; charset="gb2312"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksIEFuZHJldzoNClRoYW5rcyBmb3IgeW91ciByZXBseSENCg0KSSBhbSBzdHVkeWluZyBCTUMg
a25vd2xlZGdlIGJhc2VkIG9uIG9wZW5ibWMgcHJvamVjdC4NCg0KDQpUaGFua3MNCg0KLS0tLS3T
yrz+1K28/i0tLS0tDQq3orz+yMs6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQq3
osvNyrG85DogMjAyMMTqNNTCMTDI1SAxMDo0MQ0KytW8/sjLOiBUaWdlciBMaXUoQkotUkQpIDxU
aWdlckxpdUB6aGFveGluLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgRWRkaWUgSmFt
ZXMgPGVhamFtZXNAbGludXguaWJtLmNvbT4NCtb3zOI6IFJlOiBPcGVuQk1DIDogS1ZNIG92ZXIg
SVAgYW5kIG1lZGlhIHJlZGlyZWN0aW9uIGZ1bmN0aW9uDQoNCkhpIFRpZ2VyIExpdSwNCg0KT24g
VGh1LCA5IEFwciAyMDIwLCBhdCAxNzoyNiwgVGlnZXIgTGl1KEJKLVJEKSB3cm90ZToNCj4NCj4g
SGksIGV4cGVydHM6DQo+DQo+IEkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0IEtWTSBvdmVyIElQIGFu
ZCBtZWRpYSByZWRpcmVjdGlvbiBmdW5jdGlvbi4NCj4NCj4gSW50ZWwgcHJvdmlkZWQgYSBSTU0g
bGl0ZSBjb21wb25lbnQsIHdoaWNoIHByb3ZpZGVkIEtWTS9NZWRpYQ0KPiByZWRpcmVjdGlvbiBj
YXBhYmlsaXR5Lg0KPg0KPg0KPiBTbyBteSBxdWVzdGlvbiBpczoNCj4NCj4gMS4gT3BlbkJNQyAr
IEFTVDI1MDAgQ2hpcCwgY291bGQgbm90IGltcGxlbWVudCBLVk0vTWVkaWEgcmVkaXJlY3Rpb24g
Y2FwYWJpbGl0eT8NCg0KRG8geW91IGhhdmUgbW9yZSBzcGVjaWZpYyBxdWVzdGlvbnM/IEFyZSB5
b3UgcG9ydGluZyBPcGVuQk1DIHRvIGEgcGxhdGZvcm0geW91J3ZlIGRldmVsb3BlZCwgb3IgYXJl
IHlvdSBqdXN0IHRyeWluZyB0byB1c2UgYSBzeXN0ZW0gdGhhdCBoYXMgYSBCTUMgaW1wbGVtZW50
YXRpb24gYmFzZSBvbiBPcGVuQk1DPw0KDQpSZWdhcmRsZXNzLCBJJ3ZlIGFkZGVkIEVkZGllIGlu
IFRvOiBhcyBoZSBpbXBsZW1lbnRlZCB0aGUgS1ZNIHN1cHBvcnQuIElmIHlvdSBhcmUgdHJ5aW5n
IHRvIHN1cHBvcnQgS1ZNIG9uIGEgcGxhdGZvcm0geW91J3JlIGRldmVsb3BpbmcgdGhlbiBoZSBj
YW4gbGlrZWx5IG9mZmVyIHlvdSBzb21lIGFkdmljZS4NCg0KPg0KPiAyLiBJZiB3YW50aW5nIHRv
IHVzZSBLVk0vTWVkaWEgcmVkaXJlY3Rpb24gLG11c3QgYnV5IGEgUk1NIGNvbXBvbmVudD8NCg0K
T3BlbkJNQyBoYXMgbm8gY29uY2VwdCBvZiBhbiBSTU0gY29tcG9uZW50Lg0KDQpIb3BlIHRoYXQg
aGVscHMuDQoNCkFuZHJldw0KDQoNCrGjw9zJ+cP3o7oNCrG+08q8/rqs09Cxo8Pcu/LXqNPQ0MXP
oqOsvfa5qda4tqjK1bz+yMvKudPDoaPRz737ttSxvtPKvP678sbkxNrI3df2yM66zs60vq3K2sio
tcSy6dTEoaLKudPDoaK4tNbGu/LXqreioaMNCkNPTkZJREVOVElBTCBOT1RFOg0KVGhpcyBlbWFp
bCBjb250YWlucyBjb25maWRlbnRpYWwgb3IgbGVnYWxseSBwcml2aWxlZ2VkIGluZm9ybWF0aW9u
IGFuZCBpcyBmb3IgdGhlIHNvbGUgdXNlIG9mIGl0cyBpbnRlbmRlZCByZWNpcGllbnQuIEFueSB1
bmF1dGhvcml6ZWQgcmV2aWV3LCB1c2UsIGNvcHlpbmcgb3IgZm9yd2FyZGluZyBvZiB0aGlzIGVt
YWlsIG9yIHRoZSBjb250ZW50IG9mIHRoaXMgZW1haWwgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4N
Cg==
