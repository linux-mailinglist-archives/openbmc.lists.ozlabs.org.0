Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF612683
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 05:40:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wHvf2wpGzDqRn
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 13:40:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=0190b1154=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44wHtn6l9nzDqN1
 for <openbmc@lists.ozlabs.org>; Fri,  3 May 2019 13:39:25 +1000 (AEST)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 03 May 2019 11:39:21 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 3 May 2019
 11:39:19 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Fri, 3 May 2019 11:39:19 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: RE: A question about phosphor-sel-logger
Thread-Topic: A question about phosphor-sel-logger
Thread-Index: AdUAjyy781fIgI1HTSKO9wlhvkw5CQALNbGAACgxNBA=
Date: Fri, 3 May 2019 03:39:19 +0000
Message-ID: <2b26e8a78f5548bc9d68349e5323b861@quantatw.com>
References: <f68b269b1a854bfabfb021c1ae1955cc@quantatw.com>
 <04fa16ca-4f2a-0f2d-e6ef-8118fd757b0e@linux.intel.com>
In-Reply-To: <04fa16ca-4f2a-0f2d-e6ef-8118fd757b0e@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24586.004
x-tm-as-result: No--18.828400-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139010-700075-110462-7
 00752-700153-700767-106470-702507-704980-139504-700264-702609-707321-700016
 -105700-701594-700758-710207-703440-703788-704439-780022-701305-105040-7013
 95-705178-139705-704341-703674-113898-707788-780048-705388-701236-187067-70
 5861-702020-701100-701005-706817-709291-704421-708797-700107-899168-190077-
 148004-148133-20043-29106-42000-42003-63-190014
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
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

PiANCj4gT24gNS8xLzIwMTkgNzozNiBQTSwgV2lsbCBMaWFuZyAoseelw7liKSB3cm90ZToNCj4g
PiBIaSwNCj4gPg0KPiA+IE91ciBCTUMgaXMgdXNpbmcgcGFja2FnZSAicGhvc3Bob3Itc2VsLWxv
Z2dlciIgdG8gc3VwcG9ydCBJUE1JIFNFTC4gaXQNCj4gc2F2ZWQgdGhlIGV2ZW50IGRhdGEgaW4g
dGhlIGpvdXJuYWwgYW5kIHRoZSBpZCBpcyAxLTY1NTM0Lg0KPiA+IEl0IG1lYW5zIGl0IGNhbiBz
YXZlIDY1NTM0IHJlY29yZHMuIEFjdHVhbGx5LCB3ZSBmb3VuZCB0aGUgZmlsZSBzaXplIG9mIHNp
bmdsZQ0KPiBqb3VybmFsIGZpbGUgaXMgYXJvdW5kIDhNQih0aGUgZGVmYXVsdCBvZiBqb3VybmFs
IGZpbGUgaXMgNjRNQiwgaXQgd2lsbCBiZQ0KPiBzZXBhcmF0ZWQgYnkgOCBmaWxlcykuDQo+ID4g
V2UgY2Fubm90IHNob3cgYWxsIFNFTHMoNjU1MzQgcmVjb3JkcykgaW4gSVBNSS4gaXQgbWlnaHQg
YmUgYSBidWcgaGVyZSBpZiB3ZQ0KPiBkb24ndCBsaW1pdCB0aGUgbWF4aW11bS4NCj4gPg0KPiA+
IElzIGl0IG5lY2Vzc2FyeSB0byBsaW1pdCB0aGUgbnVtYmVyIG9mIFNFTHMgdG8gc21hbGxlcj8N
Cj4gDQo+IEhpIFdpbGwsDQo+IA0KPiBUaGUgcmVhc29uIHRoYXQgdmFsdWUgaXMgbGVmdCBhdCA2
NTUzNCBpcyBiZWNhdXNlIGluIHRoZSBqb3VybmFsIHdlIGRvbid0IGhhdmUgYQ0KPiB3YXkgdG8g
ZGV0ZXJtaW5lIGhvdyBtYW55IHRvdGFsIFNFTCBlbnRyaWVzIGFyZSBwb3NzaWJsZSBvciBob3cg
bXVjaCBzcGFjZQ0KPiBpcyBsZWZ0Lg0KPiANCj4gV2l0aCB0aGUgam91cm5hbCBzZXQgYXQgNjRN
QiB3ZSBjb3VsZCBzZWUgbW9yZSB0aGFuIDMwMDAwIGVudHJpZXMuICBXaGVuIEkNCj4gbWFkZSB0
aGUgam91cm5hbCBwZXJzaXN0ZW50IGF0IDZNQiwgd2UgY291bGQgc2VlIGFueXdoZXJlIGJldHdl
ZW4NCj4gMTIwMC0yMDAwIGVudHJpZXMuDQo+IA0KPiBXZSBjb3VsZCBjaG9vc2UgYSBzbWFsbGVy
IG51bWJlciBmb3IgSVBNSSB0byByZXBvcnQsIGJ1dCBpdCB3aWxsIGJlIGFyYml0cmFyeQ0KPiBi
ZWNhdXNlIHRoZSBqb3VybmFsIHNpemUgY2FuIGJlIGNoYW5nZWQgd2l0aG91dCBub3RpZnlpbmcg
SVBNSS4NCj4gDQo+IEhvd2V2ZXIsIGJlY2F1c2Ugb2YgdGhlIHNpemUgKDEyMDAgZW50cmllcyBp
biA2TUIpIGFuZCBvdGhlciBsaW1pdGF0aW9ucyB3aXRoDQo+IGEgcGVyc2lzdGVudCBqb3VybmFs
LCBJJ20gZXhwZXJpbWVudGluZyB3aXRoIHVzaW5nIHJzeXNsb2cgdG8gbG9nIFNFTCBlbnRyaWVz
DQo+IGludG8gYSBzeXNsb2cgZmlsZS4gIFRoaXMgd2lsbCBhbGxvdyB0aGUgam91cm5hbCB0byBy
ZW1haW4gdm9sYXRpbGUgd2hpbGUNCj4gcGVyc2lzdGluZyBvbmx5IHRoZSBsb2dzIHRoYXQgd2Ug
bmVlZCB0by4gIEl0IHdpbGwgYWxzbyBoYXZlIGEgbW9yZSBjb25zaXN0ZW50DQo+IHNpemUsIHNv
IGl0IHdpbGwgYmUgcG9zc2libGUgdG8gZml4IHRoZSBzaXplIHRvIGEgc21hbGxlciBudW1iZXIg
bW9yZSBhY2N1cmF0ZWx5DQo+IGFzIHlvdSBzdWdnZXN0Lg0KPiANCj4gWW91IGNhbiBzZWUgbXkg
Y3VycmVudCByc3lzbG9nIGNoYW5nZXMgaGVyZToNCj4gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1w
cm9qZWN0Lnh5ei9xL3RvcGljOiJyc3lzbG9nK1NFTCIrKHN0YXR1czpvcGVuJTIwT1IlDQo+IDIw
c3RhdHVzOm1lcmdlZCkNCj4gDQo+IElmIHlvdSBhcmUgaW50ZXJlc3RlZCwgSSB3aWxsIGFsc28g
c2hhcmUgbXkgcnN5c2xvZyBjb25maWd1cmF0aW9uLCBidXQgSSB3YXMNCj4gcGxhbm5pbmcgdG8g
dGVzdCBpdCBvdXQgaW50ZXJuYWxseSBmb3IgYSB3aGlsZSB0byBtYWtlIHN1cmUgaXQgd2lsbCB3
b3JrIHNvIEkgZG9uJ3QNCj4gY2F1c2UgdGhyYXNoIGlmIGl0IGhhcyB0byBjaGFuZ2UgYWdhaW4u
DQoNCkhpIEphc29uLA0KDQpJIGFtIHZlcnkgdGhhbmtmdWwgdGhhdCB5b3UgcmVwbHkgbWUgcXVp
Y2tseSBhbmQgaXQncyBncmVhdCB0byBoZWFyIHRoYXQgeW91IGFyZSB3b3JraW5nIG9uIHRoaXMg
aXNzdWUuDQpJZiB5b3UgY2FuIHNoYXJlIHlvdXIgcnN5c2xvZyBjb25maWd1cmF0aW9uIHdpdGgg
bWUgdGhhdCB3aWxsIGJlIGEgZ29vZCBuZXdzIGZvciBtZSwgSSBjYW4gdHJhY2UgaXQgZmlyc3Qu
DQoNCkFjY29yZGluZyB0byB0aGUgYWJvdmUgVVJMLCBpcyBpdCBzb21ldGhpbmcgSSBtaXNzZWQs
IEkgZGlkIG5vdCBmaW5kIHRoZSAiYWRkIHNlbCIgdG8gc3lzIGxvZyBmdW5jdGlvbj8NCkkgd2Fu
ZGVyIHRvIGtub3cgaG93IHlvdSBhZGQgc2VsIHRvIHN5cyBsb2cuIE9yIHlvdSB3YW50IHRvIHNo
YXJlIGl0IGFmdGVyIGludGVybmFsIHRlc3RpbmcuDQoNClRoYW5rcywNCldpbGwNCg0KPiBUaGFu
a3MsDQo+IC1KYXNvbg0KPiA+DQo+ID4gQlJzLA0KPiA+IFdpbGwNCj4gPg0K
