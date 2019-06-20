Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A434C586
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 04:40:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TmJ46SN3zDqtS
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 12:40:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=067d939f4=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 45TmHD464czDqsM
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 12:39:15 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 20 Jun 2019 10:39:13 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 20 Jun
 2019 10:39:06 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Thu, 20 Jun 2019 10:39:06 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: RE: NVME-MI temperature sensors
Thread-Topic: NVME-MI temperature sensors
Thread-Index: AQHVJhF1JZY8k04OyUub+UD9bakQWqahVysAgAATy4CAAmQCoA==
Date: Thu, 20 Jun 2019 02:39:06 +0000
Message-ID: <27597ce94a474ffea6348314d544ac56@quantatw.com>
References: <963572AF-71AC-4830-ACBE-CABBFDD2B929@fb.com>
 <d3212ced-52c2-9c30-7857-3a2f2b98aa3a@linux.intel.com>
 <CADKL2t57YnSFE0cABmnqUuGfo+p1sxQhgXY90JbU2LiVNHYziQ@mail.gmail.com>
In-Reply-To: <CADKL2t57YnSFE0cABmnqUuGfo+p1sxQhgXY90JbU2LiVNHYziQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24696.000
x-tm-as-result: No--15.463600-0.000000-31
x-tm-as-matchedid: 150567-700225-703140-701090-703503-702604-702754-702481-1
 39010-705249-110462-704662-187067-704224-701475-701342-703713-701274-703880
 -704714-702617-701478-701589-704225-704381-702962-863519-705213-703812-7012
 23-703039-704239-705253-703674-702395-701031-700946-702975-702500-139705-70
 4708-703061-704799-704274-704718-899168-190077-148004-148133-20025-29106-42
 000-42003-63
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

PiBPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAxOjMxIFBNIEphbWVzIEZlaXN0IDxqYW1lcy5mZWlz
dEBsaW51eC5pbnRlbC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gT24gNi8xOC8xOSAxOjA3IFBN
LCBWaWpheSBLaGVta2Egd3JvdGU6DQo+ID4gPiBUZWFtLA0KPiA+ID4NCj4gPiA+IEkgYW0gdHJ5
aW5nIHRvIGV4cG9zZSB0ZW1wZXJhdHVyZSBzZW5zb3IgcHJvdmlkZWQgYnkgTlZNRSBTU0QgZHJp
dmUuDQo+ID4gPiBBcyBwZXIgTlZNRS1NSSBzcGVjIGRldmljZSBwcm92aWRlcyB0ZW1wZXJhdHVy
ZSBzZW5zb3IgdmFsdWUgYXQNCj4gPiA+IGRlZmluZWQgcmVnaXN0ZXIuIElzIHRoZXJlIGFueSBM
aW51eCBrZXJuZWwgZHJpdmVyLCBJIG5lZWQgdG8gZW5hYmxlDQo+ID4gPiB0byBnZXQgdGhlc2Ug
c2Vuc29ycyBvZiBhIFNTRCBkZXZpY2Ugd2UgaGF2ZS4gSSBzZWUgc29tZSBOVk1FDQo+ID4gPiB0
ZW1wZXJhdHVyZSBzZW5zb3JzIGRlZmluaXRpb24gaW4gbWV0YS1xdWFudGEvbWV0YS1nc2ogY29u
ZmlnLnlhbWwNCj4gPiA+IGFuZCB3YXMgd29uZGVyaW5nIGhvdyBhcmUgdGhlc2UgcmVhZC4NCg0K
SGkgVmlqYXksDQoNCkRhZW1vblswXSBtb25pdG9ycyB0aGUgdGVtcGVyYXR1cmUgYW5kIHNldHMg
dGhlIHZhbHVlIHRvIHRoZSBvYmplY3QgcGF0aCB3ZSBjcmVhdGVkIC94eXovb3BlbmJtY19wcm9q
ZWN0L3NlbnNvcnMvdGVtcGVyYXR1cmUvbnZtZShpbmRleCkuDQpPbmNlIGNvbmZpZ3VyZWQgY29y
cmVjdGx5IGluIG1ldGEtcXVhbnRhL21ldGEtZ3NqIGNvbmZpZy55YW1sLCBpdCBjYW4gcmVhZCB0
aGVzZSB0ZW1wZXJhdHVyZXMgdmlhIGlwbWkgY29tbWFuZC4NCg0KQmVzdCBSZWdhcmRzLA0KVG9u
eQ0KDQo+ID4gPg0KPiA+ID4gQW55IGluZm9ybWF0aW9uIG9uIHRoaXMgd291bGQgYmUgaGVscGZ1
bC4NCj4gPg0KPiA+IFRoaXMgbWlnaHQgYmUgaW50ZXJlc3RpbmcgdG8geW91Og0KPiA+IGh0dHBz
Oi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL2RidXMtc2Vuc29ycy8rLzIw
ODU5DQo+ID4NCj4gDQo+IFRoYXQncyB0aGUgTUNUUCBpbXBsZW1lbnRhdGlvbiB3aGljaCBpcyB0
aGUgZGlyZWN0aW9uIGV2ZXJ5dGhpbmcgaXMgbW92aW5nDQo+IHRvd2FyZHMuDQo+IA0KPiBJbiB0
aGUgc2hvcnQgdGVybSwgUXVhbnRhIGlzIHdvcmtpbmcgb24gYSBkYWVtb25bMF0gdG8gbW9uaXRv
ciB0ZW1wZXJhdHVyZQ0KPiBhbmQgb3RoZXIgdGVsZW1ldHJ5IGRhdGEgb3ZlciBOVk1lLU1JIG9u
IFNNQnVzLiBUaGV5IGhhdmUgYW4NCj4gaW1wbGVtZW50YXRpb24gb24gdGhlaXIgb3duIEdpdEh1
YlsxXSBhbmQgYXJlIGN1cnJlbnRseSBpbiB0aGUgcHJvY2VzcyBvZg0KPiB1cHN0cmVhbWluZyBp
dFsyXS4NCj4gDQo+IFswXSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1udm1l
DQo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcXVhbnRhLWJtYy9waG9zcGhvci1udm1lDQo+IFsy
XSBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9waG9zcGhvci1u
dm1lLysvMjI1NjANCj4gDQo+ID4NCj4gPiAtSmFtZXMNCj4gPg0KPiA+ID4NCj4gPiA+IFJlZ2Fy
ZHMNCj4gPiA+DQo+ID4gPiAtVmlqYXkNCj4gPiA+DQoNCg==
