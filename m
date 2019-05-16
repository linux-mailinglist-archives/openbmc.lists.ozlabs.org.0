Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B250A1FF7B
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 08:23:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454LvT28pqzDqXv
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 16:23:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=032b49070=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 454Ltx0VgyzDqYX
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 16:22:28 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 16 May 2019 14:22:24 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 16 May
 2019 14:22:22 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Thu, 16 May 2019 14:22:22 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Switching to static network address issues
Thread-Topic: Switching to static network address issues
Thread-Index: AQHU74DjzCUgLXria0m7wSP0r0wOn6Y0nx8AgAAGvgCAAC5hAIAAi1gAgDgeKHA=
Date: Thu, 16 May 2019 06:22:21 +0000
Message-ID: <1948c6f25ec94cb28fbb7927a42989f7@quantatw.com>
References: <CAN9Jwz1y3q3msG28uck2_0oyqNwmACbixHCRiF-hbshZ7ZLTJg@mail.gmail.com>
 <CAPnigKkYwyMKR3Wb2ehajEfmKjHgFdgHTZRXYcsF_RSyBiiKeg@mail.gmail.com>
 <CAN9Jwz3=X-FMaCgG9YNiU3VgtvqA34XRdfaS8rGDXdVgswKS4w@mail.gmail.com>
 <3e535745-9cc8-3289-61a7-8ad7a0bb9f9e@linux.vnet.ibm.com>
 <988b05f0-4d72-cf00-b717-82759a6eb8ac@linux.vnet.ibm.com>
In-Reply-To: <988b05f0-4d72-cf00-b717-82759a6eb8ac@linux.vnet.ibm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24614.001
x-tm-as-result: No--19.211900-0.000000-31
x-tm-as-matchedid: 150567-155709-700225-703140-701090-703503-704714-702558-7
 04613-703132-704477-105700-701029-704053-121463-701589-704978-780001-703238
 -704388-121657-702898-702829-701270-780012-188199-704564-702914-186035-7800
 33-700742-701750-701432-705220-705248-139010-139006-700273-702754-702304-10
 6660-702561-705249-110462-704633-705153-704976-705161-701510-703230-700385-
 705253-703674-106470-704240-139705-700251-702251-703948-704472-700051-70271
 5-700644-101000-704612-112033-700805-700786-148004-148133-20043-29090-42000
 -42003-51-63
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgdGhlcmUsDQpJIGFsc28gbWV0IGFuIHNpbWlsYXIgaXNzdWUgYWJvdXQgc3dpdGNoaW5nIG5l
dHdvcmsgYWRkcmVzcyBmcm9tIERIQ1AgdG8gc3RhdGljLg0KSGVyZSBpcyBteSBjb25maWd1cmF0
aW9uIHN0ZXBzOg0KDQoxLiBpcG1pdG9vbCAtSCAxMC4xMC4xNS4yMDYgLVUgcm9vdCAtUCAwcGVu
Qm1jIC1JIGxhbnBsdXMgbGFuIHByaW50IDINClNldCBpbiBQcm9ncmVzcyAgICAgICAgIDogU2V0
IENvbXBsZXRlDQpBdXRoIFR5cGUgU3VwcG9ydCAgICAgICA6IE1ENSANCkF1dGggVHlwZSBFbmFi
bGUgICAgICAgIDogQ2FsbGJhY2sgOiBNRDUgDQogICAgICAgICAgICAgICAgICAgICAgICA6IFVz
ZXIgICAgIDogTUQ1IA0KICAgICAgICAgICAgICAgICAgICAgICAgOiBPcGVyYXRvciA6IE1ENSAN
CiAgICAgICAgICAgICAgICAgICAgICAgIDogQWRtaW4gICAgOiBNRDUgDQogICAgICAgICAgICAg
ICAgICAgICAgICA6IE9FTSAgICAgIDogTUQ1IA0KSVAgQWRkcmVzcyBTb3VyY2UgICAgICAgOiBE
SENQIEFkZHJlc3MNCklQIEFkZHJlc3MgICAgICAgICAgICAgIDogMTAuMTAuMTUuMjA2DQpTdWJu
ZXQgTWFzayAgICAgICAgICAgICA6IDI1NS4yNTUuMC4wDQpNQUMgQWRkcmVzcyAgICAgICAgICAg
ICA6IDAwOjAwOmY3OmEwOjdmOmYyDQpEZWZhdWx0IEdhdGV3YXkgSVAgICAgICA6IDEwLjEwLjEw
LjIwNA0KODAyLjFxIFZMQU4gSUQgICAgICAgICAgOiBEaXNhYmxlZA0KUk1DUCsgQ2lwaGVyIFN1
aXRlcyAgICAgOiAzLDE3DQpDaXBoZXIgU3VpdGUgUHJpdiBNYXggICA6IE5vdCBBdmFpbGFibGUN
CkJhZCBQYXNzd29yZCBUaHJlc2hvbGQgIDogTm90IEF2YWlsYWJsZQ0KDQoyLiBpcG1pdG9vbCAt
SCAxMC4xMC4xNS4yMDYgLVUgcm9vdCAtUCAwcGVuQm1jIC1JIGxhbnBsdXMgbGFuIHNldCAyIGlw
c3JjIHN0YXRpYw0KDQozLiByb290QGdzajp+IyBjYXQgL2V0Yy9zeXN0ZW1kL25ldHdvcmsvMDAt
Ym1jLWV0aDEubmV0d29yaw0KW01hdGNoXQ0KTmFtZT1ldGgxDQpbTmV0d29ya10NCkxpbmtMb2Nh
bEFkZHJlc3Npbmc9bm8NCklQdjZBY2NlcHRSQT1mYWxzZQ0KREhDUD1mYWxzZQ0KQWRkcmVzcz1m
ZTgwOjoyMDA6ZjdmZjpmZWEwOjdmZjIvNjQNCkdhdGV3YXk9MTAuMTAuMTAuMjA0DQpbREhDUF0N
CkNsaWVudElkZW50aWZpZXI9bWFjDQpVc2VETlM9dHJ1ZQ0KVXNlTlRQPXRydWUNClVzZUhvc3Ru
YW1lPXRydWUNClNlbmRIb3N0bmFtZT10cnVlDQoNCjQuIFNldCBzdGF0aWMgaXANCnJvb3RAZ3Nq
On4jIGlwbWl0b29sIGxhbiBzZXQgMiBpcGFkZHIgMTAuMTAuOS4zIA0KU2V0dGluZyBMQU4gSVAg
QWRkcmVzcyB0byAxMC4xMC45LjMNCg0KNS4gcm9vdEBnc2o6fiMgY2F0IC9ldGMvc3lzdGVtZC9u
ZXR3b3JrLzAwLWJtYy1ldGgxLm5ldHdvcmsNCltNYXRjaF0NCk5hbWU9ZXRoMQ0KW05ldHdvcmtd
DQpMaW5rTG9jYWxBZGRyZXNzaW5nPW5vDQpJUHY2QWNjZXB0UkE9ZmFsc2UNCkRIQ1A9ZmFsc2UN
CkFkZHJlc3M9ZmU4MDo6MjAwOmY3ZmY6ZmVhMDo3ZmYyLzY0DQpHYXRld2F5PTEwLjEwLjEwLjIw
NA0KW0RIQ1BdDQpDbGllbnRJZGVudGlmaWVyPW1hYw0KVXNlRE5TPXRydWUNClVzZU5UUD10cnVl
DQpVc2VIb3N0bmFtZT10cnVlDQpTZW5kSG9zdG5hbWU9dHJ1ZQ0KDQpCdXQgc3RhdGljIElQIGRv
ZXNuJ3Qgd29yay4NCklzIG15IHN0ZXAgd3Jvbmc/DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogb3BlbmJtYw0KPiBbbWFpbHRvOm9wZW5ibWMtYm91bmNlcyt0b255Lmxl
ZT1xdWFudGF0dy5jb21AbGlzdHMub3psYWJzLm9yZ10gT24NCj4gQmVoYWxmIE9mIEd1bm5hciBN
aWxscw0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMTEsIDIwMTkgNToxNCBBTQ0KPiBUbzogUmF0
YW4gR3VwdGEgPHJhdGFndXB0QGxpbnV4LnZuZXQuaWJtLmNvbT47IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogU3dpdGNoaW5nIHRvIHN0YXRpYyBuZXR3b3JrIGFkZHJl
c3MgaXNzdWVzDQo+IA0KPiBPbiA0LzEwLzIwMTkgNzo1NSBBTSwgUmF0YW4gR3VwdGEgd3JvdGU6
DQo+IA0KPiA+DQo+ID4gQ2FuIHlvdSB0YWtlIGEgbG9vayBhdCB3aGF0IGFyZSB0aGUgcmVzdCB1
cmwgd2hpY2ggaXMgYmVpbmcgZXhlY3V0ZWQNCj4gPiB1bmRlcm5lYXRoPw0KPiA+DQo+IFdoZW4g
dGhlIERIQ1Agc2V0dGluZyBjaGFuZ2VzIG9uIHRoZSBHVUkgKGUuZy4gIk9CVEFJTiBBTiBJUCBB
RERSRVNTDQo+IEFVVE9NQVRJQ0FMTFkgVVNJTkcgREhDUCIgdG8gIkFTU0lHTiBBIFNUQVRJQyBJ
UCBBRERSRVNTIiksIHRoZQ0KPiAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrLzxpbnRlcmZh
Y2U+L2F0dHIvREhDUEVuYWJsZWQgaW50ZXJmYWNlIGlzDQo+IGNhbGxlZCBvbiAiU2F2ZSBzZXR0
aW5ncyIuDQo+IA0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci13ZWJ1aS9i
bG9iLzJmNDgxZTRjYjgzZjBjNzJhOWYzYWENCj4gZDExNDMxZTRhYmNmNWQ2MzJjL2FwcC9jb21t
b24vc2VydmljZXMvYXBpLXV0aWxzLmpzI0w0MjgNCj4gDQo+IEhvcGUgdGhpcyBoZWxwcy4NCj4g
DQo+ID4NCj4gPiBPbiAxMC8wNC8xOSAzOjM5IFBNLCBUcm95IExlZSB3cm90ZToNCj4gPj4gSGkg
V2lsbGlhbSwNCj4gPj4NCj4gPj4gVGhpcyBpc3N1ZSBjb3VsZCBiZSByZXByb2R1Y2Ugd2l0aCBX
ZWJVSSBvciBSRVNUIGludGVyZmFjZS4NCj4gPj4gMS4gU3RhcnRzIHVwIHJvbXVsdXMtYm1jIHFl
bXUgYXMgbm9ybWFsLCBzbyB0aGUgSVAgYWRkcmVzcyBpcw0KPiA+PiBhY3F1aXJlZCBmcm9tIERI
Q1AgYnkgZGVmYXVsdCwgbGV0J3Mgc2F5ICIxMC4xLjEuMiIuDQo+ID4+IDIuIE9wZW4gdGhlIGJy
b3dzZXIgYW5kIGxvZ2luIHRvIGh0dHBzOi8vMTAuMS4xLjIvLCAzLiBTd2l0Y2ggdG8NCj4gPj4g
W1NlcnZlciBDb25maWd1cmF0aW9uXSB0YWIuDQo+ID4+IMKgwqDCoMKgIFRoZW4geW91IHdpbGwg
c2VlIHRoZSBjdXJyZW50IHNldHRpbmcgaXMgIk9CVEFJTiBBTiBJUCBBRERSRVNTDQo+ID4+IEFV
VE9NQVRJQ0FMTFkgVVNJTkcgREhDUCIuDQo+ID4+IDQuIENsaWNrIG9uIGNoZWNrYm94ICJBU1NJ
R04gQSBTVEFUSUMgSVAgQUREUkVTUywgYW5kIERPIE5PVCBDSEFOR0UNCj4gPj4gdGhlIElQIGFk
ZHJlc3MsIGxlYXZlIGl0IHRoZSBzYW1lIGFzIERIQ1AgSVAgYWRkcmVzcyAiMTAuMS4xLjIiLg0K
PiA+PiA1LiBDbGljayBvbiAiU2F2ZSBzZXR0aW5ncyIgYnV0dG9uLg0KPiA+Pg0KDQo=
