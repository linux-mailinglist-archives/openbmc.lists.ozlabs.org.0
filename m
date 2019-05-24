Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D7428EC7
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 03:26:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4597xh4tg1zDqdX
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 11:26:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=040654a5f=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4597xL0M0BzDqX2
 for <openbmc@lists.ozlabs.org>; Fri, 24 May 2019 11:26:08 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 24 May 2019 09:26:06 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 24 May
 2019 09:26:05 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Fri, 24 May 2019 09:26:05 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: Repository for phosphor-nvme
Thread-Topic: Repository for phosphor-nvme
Thread-Index: AdUK8TnZQgSCiHBZSDKonbEkKk/RYQGUIFyAACNhQxA=
Date: Fri, 24 May 2019 01:26:04 +0000
Message-ID: <cc95beae385043d2a491c84f363699d5@quantatw.com>
References: <59731b596a7048fab67aa03456c2058c@quantatw.com>
 <20190523163009.unv7lnvn6x7duieu@thinkpad>
In-Reply-To: <20190523163009.unv7lnvn6x7duieu@thinkpad>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24632.006
x-tm-as-result: No--9.221800-0.000000-31
x-tm-as-matchedid: 150567-700225-703140-701090-703503-704704-705271-704706-1
 39010-139006-701946-106660-703945-705249-701443-704384-700488-703729-703956
 -704949-703655-148004-148133-20043-42000-42003-63-190014
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
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

SXQncyBvaywgdGhhbmsgeW91IGZvciB5b3VyIGhlbHAuDQoNClRoYW5rcw0KQmVzdCBSZWdhcmRz
LA0KVG9ueQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJyYWQgQmlz
aG9wIFttYWlsdG86YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tXQ0KPiBTZW50OiBGcmlkYXks
IE1heSAyNCwgMjAxOSAxMjozMCBBTQ0KPiBUbzogVG9ueSBMZWUgKOadjuaWh+WvjCkgPFRvbnku
TGVlQHF1YW50YXR3LmNvbT4NCj4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJq
ZWN0OiBSZTogUmVwb3NpdG9yeSBmb3IgcGhvc3Bob3ItbnZtZQ0KPiANCj4gT24gRnJpLCBNYXkg
MTcsIDIwMTkgYXQgMDc6NTE6NTBBTSArMDAwMCwgVG9ueSBMZWUgKOadjuaWh+WvjCkgd3JvdGU6
DQo+ID5IaSBCcmFkLA0KPiA+DQo+ID4NCj4gPg0KPiA+Q291bGQgeW91IGhlbHAgY3JlYXRlIHJl
cG9zaXRvcnkgZm9yICJwaG9zcGhvci1udm1lIj8NCj4gDQo+IERvbmUuICBTb3JyeSBhYm91dCB0
aGUgZGVsYXkuDQo+IA0KPiBBcyB3aXRoIHRoZSBsYXN0IGNvdXBsZSBuZXcgcmVwb3MgdGhhdCBo
YXZlIGJlZW4gY3JlYXRlZCB5b3UnbGwgaGF2ZSB0byB1c2UNCj4gZ2l0aHViIHB1bGwgcmVxdWVz
dHMgdW50aWwgdGhlIGdlcnJpdC9naXRodWIgc3luY3Jvbml6YXRpb24gcHJvYmxlbSBjYW4gYmUN
Cj4gc29sdmVkLg0KPiANCj4gdGh4IC0gYnJhZA0K
