Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F621154D5
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 17:05:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ty9j2n6vzDqgG
	for <lists+openbmc@lfdr.de>; Sat,  7 Dec 2019 03:05:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ty8m4TBczDqgC
 for <openbmc@lists.ozlabs.org>; Sat,  7 Dec 2019 03:04:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2019 08:04:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,285,1571727600"; d="scan'208";a="209473850"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
 by fmsmga008.fm.intel.com with ESMTP; 06 Dec 2019 08:04:44 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.76]) by
 IRSMSX102.ger.corp.intel.com ([169.254.2.40]) with mapi id 14.03.0439.000;
 Fri, 6 Dec 2019 16:04:44 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Justin Thaler <thalerj@linux.vnet.ibm.com>, Neeraj Ladkani
 <neladk@microsoft.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, vishwa <vishwa@linux.vnet.ibm.com>
Subject: RE: [EXTERNAL] Telemetry Reports dynamic update
Thread-Topic: [EXTERNAL] Telemetry Reports dynamic update
Thread-Index: AQHVqjVywGxdTPBGi062fZI96945iqeph/yAgABw3QCAAYpaoA==
Date: Fri, 6 Dec 2019 16:04:44 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D7A310AA67@IRSMSX101.ger.corp.intel.com>
References: <da4d443c-e7e1-6980-af49-15d05360feff@linux.vnet.ibm.com>
 <DM6PR21MB1388E6CEF6424B616C7C7B1DC85D0@DM6PR21MB1388.namprd21.prod.outlook.com>
 <df5cf925-4999-18ab-8b6f-dfe7a9c38fff@linux.vnet.ibm.com>
In-Reply-To: <df5cf925-4999-18ab-8b6f-dfe7a9c38fff@linux.vnet.ibm.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2Y3MTc3ODAtOTE0OS00NDQ4LWIyNDQtODRiZGE2NmQwMGU3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoialVYMEMraTVweVRjckxcL3FOZ1Rpcm93RlFWYnR3QWlITWxxY3U0RDV1VkJxdWdVSXRrc1dXM1h3b2hCZmZMT28ifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [163.33.239.182]
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

SGkgSnVzdGluLCANCg0KWW91J3ZlIHJhaXNlZCBhbiBpbnRlcmVzdGluZyB0b3BpYy4gSW4gY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiwgd2hlbiBPcGVuQk1DIGJvb3RzIHdoZW4gcGxhdGZvcm0gaXMg
aW4gcG93ZXIgb2ZmIHN0YXRlLCBub3QgYWxsIHNlbnNvcnMgYXJlIGF2YWlsYWJsZSwgdGh1cyB0
aGV5IHdvbid0IGFwcGVhciBpbiBSZWRmaXNoIHRyZWUgYW5kIHlvdSB3b24ndCBiZSBhYmxlIHRv
IGNvbmZpZ3VyZSBtZXRyaWMgcmVwb3J0IGlmIHlvdSB3YW50IHRvIHVzZSB0aGVzZSBzZW5zb3Jz
LiBJZiBCTUMgYm9vdHMgZHVyaW5nIHRoZSBwbGF0Zm9ybSBib290LCBhbGwgYXZhaWxhYmxlIHNl
bnNvcnMgd2lsbCBiZSBkaXNjb3ZlcmVkIGFuZCBleHBvc2VkIGluIHRoZSBSZWRmaXNoIHRyZWUu
IEFmdGVyIHRoaXMsIHdoZW4gcGxhdGZvcm0gaXMgcG93ZXJlZCBvZmYsIHRoZSBzZW5zb3JzLCB0
aGF0IGFyZSBub3QgYXZhaWxhYmxlIGluIHRoaXMgcGxhdGZvcm0gc3RhdGUgc2hhbGwgYmUgc3Rp
bGwgYXZhaWxhYmxlIGluIHRoZSBSZWRmaXNoIHRyZWUsIGJ1dCB0aGV5IHdvbid0IHByb3ZpZGUg
dmFsaWQgcmVhZGluZ3MuIFVuZm9ydHVuYXRlbHksIHN1Y2ggYmVoYXZpb3IgaXMgbm90IHN0YW5k
YXJkaXplZCwgdGh1cyBpZiB3ZSB3YW50IHRvIGJlIGFibGUgdG8gZGVmaW5lIG1ldHJpYyByZXBv
cnRzIHdoZW4gcGxhdGZvcm0gaXMgcG93ZXJlZCBvZmYsIHdlIHdpbGwgaGF2ZSB0byBtYWtlIHRo
ZSByZXF1aXJlZCBzZW5zb3JzIGJlaGF2aW9yIHBhcnQgb2YgdGhlIGRlc2lnbi4gDQoNClJlZ2Fy
ZHMNClBpb3RyDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEp1c3RpbiBU
aGFsZXIgPHRoYWxlcmpAbGludXgudm5ldC5pYm0uY29tPiANClNlbnQ6IFdlZG5lc2RheSwgRGVj
ZW1iZXIgNCwgMjAxOSAyOjI4IFBNDQpUbzogTmVlcmFqIExhZGthbmkgPG5lbGFka0BtaWNyb3Nv
ZnQuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBNYXR1c3pjemFrLCBQaW90ciA8cGlv
dHIubWF0dXN6Y3pha0BpbnRlbC5jb20+OyB2aXNod2EgPHZpc2h3YUBsaW51eC52bmV0LmlibS5j
b20+DQpTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBUZWxlbWV0cnkgUmVwb3J0cyBkeW5hbWljIHVw
ZGF0ZQ0KDQoNCg0KT24gMTIvNC8xOSAxMjo0MyBBTSwgTmVlcmFqIExhZGthbmkgd3JvdGU6DQo+
IFdlIGRvbuKAmXQgaGF2ZSB0ZWxlbWV0cnlzZXJ2aWNlIGluIEJNQyBjdXJyZW50bHkgc28gYXJl
IHlvdSBjdXJyZW50bHkgZG9pbmcgaXQgdXNpbmcgd2VidWk/IE9yIHlvdSBoYXZlIHdyaXR0ZW4g
YSBhcHAgdXNpbmcgcmVkZmlzaCBBUElzPyAgSSBhc2tlZCBzaW1pbGFyIHF1ZXN0aW9uIGluIGxh
c3Qgd2VlayB3b3JrIGdyb3VwIG1lZXRpbmcuIEkgdGhpbmsgaXQgd2lsbCBiZSB1c2VmdWwgdG8g
aGF2ZSBhYmlsaXR5IHRvIGFkZCBuZXcgcmVwb3J0IGRlZmluaXRpb25zLg0KSSBoYXZlIGFuIGFw
cCB0aGF0IHVzZXMgdGhlIGN1cnJlbnQgd2Vic29ja2V0IGltcGxlbWVudGF0aW9uIG9uIG9wZW5C
TUMgYW5kIGhhdmUgYmVlbiByZXZpZXdpbmcgdGhlIG5lZWRzIGZvciB0cmFuc2l0aW9uaW5nIHRo
ZSBhcHAgdG8gcmVkZmlzaCB3aGVuIHRoZSB0aW1lIGNvbWVzLiBPbmUgbGltaXRhdGlvbiBvZiB0
aG9zZSBpcyBub3QgYmVpbmcgYWJsZSB0byB1cGRhdGUgdGhlIGFjdGl2ZSBzdWJzY3JpcHRpb24g
d2l0aG91dCB0ZWFyaW5nIGl0IGRvd24gYW5kIHN0YXJ0aW5nIGl0IGFnYWluLCByZXN1bHRpbmcg
aW4gYSBmZXcgc2Vjb25kcyBvZiBtaXNzZWQgcmVhZGluZ3MuDQoNCkJlaW5nIGFibGUgdG8gdXBk
YXRlIHRoZSBjb250ZW50IG9mIHRoZSBzdWJzY3JpcHRpb24gb24gdGhlIGZseSB3b3VsZCBiZSBh
IGh1Z2UgdmFsdWUgYWRkIEkgdGhpbmsuDQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBKdXN0aW4gVGhhbGVyIDx0aGFsZXJqQGxpbnV4LnZuZXQuaWJtLmNvbT4NCj4g
U2VudDogVHVlc2RheSwgRGVjZW1iZXIgMywgMjAxOSAzOjU3IFBNDQo+IFRvOiBvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmc7IE1hdHVzemN6YWssIFBpb3RyIA0KPiA8cGlvdHIubWF0dXN6Y3pha0Bp
bnRlbC5jb20+OyB2aXNod2EgPHZpc2h3YUBsaW51eC52bmV0LmlibS5jb20+OyANCj4gTmVlcmFq
IExhZGthbmkgPG5lbGFka0BtaWNyb3NvZnQuY29tPg0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFRl
bGVtZXRyeSBSZXBvcnRzIGR5bmFtaWMgdXBkYXRlDQo+IA0KPiBIaSBBbGwsDQo+IAlJJ3ZlIGJl
ZW4gc29ydCBvZiBzaWxlbnRseSByZXZpZXdpbmcgdGhlIGRlc2lnbnMgdG8gdGVsZW1ldHJ5IHJl
cG9ydHMgZGVzaWduIGFsb25nIHdpdGggc3Vic2NyaXB0aW9ucy4gQXMgSSB3YXMgcmV2aWV3aW5n
IGl0LCBJJ3ZlIGhhZCBhIGNvdXBsZSBvZiBkaWZmZXJlbnQgZGVzaWduIHBvaW50cyBjb21lIHVw
IGFuZCBhbiBpbnRlcmVzdGluZyB1c2UgY2FzZSBJJ3ZlIHdhbnRlZCB0byBhc2sgYWJvdXQuIFNv
IGhlcmUncyBteSBzY2VuYXJpbzoNCj4gDQo+IEkndmUgc2V0IHVwIGEgdGVsZW1ldHJ5IHJlcG9y
dCB0byB0aGUgc3lzdGVtIGR5bmFtaWNhbGx5IGJ5IHF1ZXJ5aW5nIHRoZSBzZW5zb3JzIGFuZCBy
ZXF1ZXN0IHRoZSB2YWx1ZXMgYXJlIHVwZGF0ZWQgZXZlcnkgc2Vjb25kLiBUaGUgc3lzdGVtIHdh
cyBpbiBhIHN0YXRlIHdoZXJlIGl0IHdhcyBwb3dlcmVkIG9mZiwgc28gbm90IG1hbnkgc2Vuc29y
cyB3ZXJlIGF2YWlsYWJsZS4NCj4gQWZ0ZXIgdGhlIHN5c3RlbSBpcyBwb3dlcmVkIG9uLCBtb3Jl
IHNlbnNvcnMgYXJlIGFkZGVkIGFzIGRpZmZlcmVudCBkZXZpY2VzIGFyZSBwb3dlcmVkIHVwLiBB
dCB0aGlzIHBvaW50IEknZCB3YW50IHRvIGFkZCB0aGUgYWRkaXRpb25hbCBzZW5zb3JzIHRvIG15
IHJlcG9ydC4gSSBxdWVyeSB0aGUgc3lzdGVtIGFnYWluIGZvciBhbGwgdGhlIGF2YWlsYWJsZSBz
ZW5zb3JzIGFuZCBzZWUgdGhlcm1hbCBhbmQgcG93ZXIgcmVhZGluZ3MgZm9yIHRoZSBDUFVzLiBJ
IHdhbnQgdXBkYXRlcyBvbiB0aGVzZSBldmVyeSBzZWNvbmQganVzdCBsaWtlIG15IGluaXRpYWwg
cmVwb3J0Lg0KPiANCj4gVGhpcyBsZWFkcyBtZSB0byB0aGUgZm9sbG93aW5nIHF1ZXN0aW9uOg0K
PiBDYW4gSSBwdXNoIGEgbmV3IHJlcG9ydCBkZWZpbml0aW9uIHRvIHRoZSBUZWxlbWV0cnlTZXJ2
aWNlIGFuZCBoYXZlIHRoZSBldmVudCBzZXJ2aWNlIHN0YXJ0IHByb3ZpZGluZyB0aGF0IG5ldyBk
ZWZpbml0aW9uIHdpdGhvdXQgdGVhcmluZyBkb3duIHRoZSBzdWJzY3JpcHRpb24gZmlyc3QsIHdo
aWNoIHdvdWxkIGxlYXZlIGEgZ2FwIGluIHRoZSBkYXRhPw0KPiANCj4gVGhhbmtzLA0KPiBKdXN0
aW4gVGhhbGVyDQo+IA0K
