Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1927C1B3A32
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 10:34:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496Ydf2wnNzDqs8
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 18:34:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=sumanth.bhat@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496Ycl0fwpzDqVS
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 18:33:50 +1000 (AEST)
IronPort-SDR: sLc35PH81pqZ1WzAmPf3yuRHvTgqPJH4I5CNCv6sZDNchLBddtr9nH4DJHqtUNhQQW8DUtRfps
 M6bKojonVuDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 01:33:46 -0700
IronPort-SDR: 7LRxlf8AsIWIC1BHtFCnLepyecA1wL6jX5KBVFVzfIOkLSdkTOjmUSP5AhT9KC6gNkTFxeKx3z
 CovH4btQF8bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,413,1580803200"; d="scan'208";a="334550282"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga001.jf.intel.com with ESMTP; 22 Apr 2020 01:33:46 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 22 Apr 2020 01:33:45 -0700
Received: from bgsmsx104.gar.corp.intel.com (10.223.4.190) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 22 Apr 2020 01:33:45 -0700
Received: from bgsmsx105.gar.corp.intel.com ([169.254.3.54]) by
 BGSMSX104.gar.corp.intel.com ([169.254.5.58]) with mapi id 14.03.0439.000;
 Wed, 22 Apr 2020 14:03:41 +0530
From: "Bhat, Sumanth" <sumanth.bhat@intel.com>
To: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: MCTP Sockets related questions
Thread-Topic: MCTP Sockets related questions
Thread-Index: AdYUClNg6nWRTjorRuWixhdXtdcv3QAMqFSAAACP8oABD7ec0A==
Date: Wed, 22 Apr 2020 08:33:41 +0000
Message-ID: <1504A9E7C77EF44697F386AD61B1626015347268@BGSMSX105.gar.corp.intel.com>
References: <1504A9E7C77EF44697F386AD61B1626015342605@BGSMSX105.gar.corp.intel.com>
 <8ae8365a-ff09-4f4a-9445-17898487cb29@www.fastmail.com>
 <c7996c7f-460a-41df-8d95-4444cee7462e@www.fastmail.com>
In-Reply-To: <c7996c7f-460a-41df-8d95-4444cee7462e@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [10.223.10.10]
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
Cc: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@intel.com>,
 "Winiarska, Iwona" <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmV3LA0KICAgIFRoYW5rcyBhIGxvdCBmb3IgdGFraW5nIHRoZSB0aW1lIG91dCBmb3Ig
YW5zd2VyaW5nIG91ciBxdWVzdGlvbnMgb24gTUNUUCBzb2NrZXRzIGluIGRldGFpbC4gRG8geW91
IGhhdmUgcGxhbnMgb2YgcHVzaGluZyBhIEtlcm5lbCBiYXNlZCBNQ1RQIGltcGxlbWVudGF0aW9u
IHByb3Bvc2FsIHRvIGdlcnJpdCA/DQoNClRoYW5rcywNClN1bWFudGgNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+IA0K
U2VudDogRnJpZGF5LCBBcHJpbCAxNywgMjAyMCA5OjM1IEFNDQpUbzogQmhhdCwgU3VtYW50aCA8
c3VtYW50aC5iaGF0QGludGVsLmNvbT47IEplcmVteSBLZXJyIDxqa0BvemxhYnMub3JnPjsgb3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnDQpDYzogVGhvbWFpeWFyLCBSaWNoYXJkIE1hcmlhbiA8cmlj
aGFyZC5tYXJpYW4udGhvbWFpeWFyQGludGVsLmNvbT47IFdpbmlhcnNrYSwgSXdvbmEgPGl3b25h
LndpbmlhcnNrYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogTUNUUCBTb2NrZXRzIHJlbGF0ZWQg
cXVlc3Rpb25zDQoNCitvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCg0KT24gRnJpLCAxNyBBcHIg
MjAyMCwgYXQgMTM6MTgsIEFuZHJldyBKZWZmZXJ5IHdyb3RlOg0KPiBIaSBTdW1hbnRoDQo+IA0K
PiBPbiBGcmksIDE3IEFwciAyMDIwLCBhdCAwMTo0OCwgQmhhdCwgU3VtYW50aCB3cm90ZToNCj4g
PiAgDQo+ID4gSGkgSmVyZW15LCBBbmRyZXcsDQo+ID4gDQo+ID4gIEkgaGF2ZSB0cmllZCB0byBj
YXB0dXJlIG91ciBxdWVzdGlvbnMgYW5kIGNvbmNlcm5zIHJlbGF0ZWQgdG8gTUNUUCANCj4gPiBT
b2NrZXRzIGluIHRoZSBQTUNJIFdvcmtHcm91cCBwYWdlIHVuZGVyIHRoZSB0b3BpYyDigJMgTUNU
UCBTb2NrZXQgDQo+ID4gSW50ZXJmYWNlczsgbGluayBoZXJlIC0gDQo+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvb3BlbmJtYy93aWtpL09wZW5CTUMtUE1DSS1XRy4gSG9wZSB5b3UgDQo+
ID4gY2FuIGhhdmUgYSBsb29rIGF0IGl0Lg0KPiANCj4gVGhhbmtzIGZvciBnZXR0aW5nIHRoZXNl
IHdyaXR0ZW4gZG93biwgdGhleSBhcmUgYWxsIGdyZWF0IHF1ZXN0aW9ucy4gDQo+IEl0J3MgaGFy
ZCB0byBoYXZlIGEgY29udmVyc2F0aW9uIHZpYSBhIHdpa2ksIHNvIEknbSBwYXN0aW5nIHRoZSBx
dWVzdGlvbnMgYmVsb3c6DQo+IA0KPiA+IEhlcmUgYXJlIGZldyBxdWVzdGlvbnMgZm9yIHNvY2tl
dCBiYXNlZCBpbXBsZW1lbnRhdGlvbiDigJMNCj4gPiANCj4gPiBCdXMgT3duZXIgLyBCcmlkZ2lu
ZyAvIEVuZHBvaW50IHJvbGVzOg0KPiA+IFRoZSBjdXJyZW50IGRlbXV4LWRhZW1vbiBzdXBwb3J0
cyBvbmx5IHN0YXRpYyBFSURzLiBIb3cgZG8gd2UgZXh0ZW5kIA0KPiA+IOKAmEJ1cyBPd25lcuKA
nSwg4oCYRW5kcG9pbnTigJkgYW5kIOKAmEJyaWRnaW5nIERldmljZeKAmSBjb25jZXB0cyB0byBk
ZW11eC1kYWVtb24/DQo+IA0KPiBJIHRoaW5rIGl0IHByb2JhYmx5IG5lZWRzIHRvIGJlIG1hZGUg
Y2xlYXIgdGhhdCB0aGUgcm9sZSBvZiB0aGUgDQo+IG1jdHAtZGVtdXgtZGFlbW9uIGlzIG5vdGhp
bmcgbW9yZSB0aGFuIHRvIHRyYW5zZm9ybSB0aGUgaW50ZXJmYWNlIGZvciANCj4gTUNUUCBtZXNz
YWdlcyBmcm9tIGRpcmVjdCBjYWxscyB0byBsaWJtY3RwIHRvIHVzZSBvZiBzb2NrZXRzLCBhcyB0
aGlzIA0KPiB3aWxsIG1ha2UgbWlncmF0aW9uIHRvIHRoZSBwbGFubmVkIGtlcm5lbCBpbnRlcmZh
Y2UgZWFzaWVyLiANCj4gQXBwbGljYXRpb25zIHdhbnRpbmcgdG8gdGFsayBvdmVyIE1DVFAgc2hv
dWxkIGNvbm5lY3QgdG8gdGhlIA0KPiBtY3RwLWRlbXV4LWRhZW1vbiBzb2NrZXQgYW5kIHNlbmQg
bWVzc2FnZXMgdGhpcyB3YXkuIFRoaXMgaW5jbHVkZXMgdGhlIA0KPiBhcHBsaWNhdGlvbiB0aGF0
IHdpbGwgaGFuZGxlIE1DVFAgY29udHJvbCBtZXNzYWdlcyBkZWZpbmVkIGluIHRoZSBiYXNlIHNw
ZWNpZmljYXRpb24uDQo+IA0KPiBOb3csIHRoZXJlIGlzIHRoZSBpc3N1ZSB0aGF0IE1DVFAgY29u
dHJvbCBjb21tYW5kcyBhZmZlY3QgdGhlIGJpbmRpbmcgDQo+IGFzc29jaWF0ZWQgd2l0aCBhbiBl
bmRwb2ludCwgYW5kIGFzIGFib3ZlIHRoZSBtY3RwLWRlbXV4LWRhZW1vbiANCj4gZG9lc24ndCBo
YW5kbGUgYW55IGNvbW1hbmRzIGl0c2VsZi4gV2hhdCdzIG1pc3NpbmcgZnJvbSANCj4gbWN0cC1k
ZW11eC1kYWVtb24gaXMgYW4gb3V0LW9mLWJhbmQgaW50ZXJmYWNlIHRvIG1hbmlwdWxhdGUgdGhl
IA0KPiBiaW5kaW5nIGluIHJlc3BvbnNlIHRvIGNvbnRyb2wgbWVzc2FnZXMuIEVsZW1lbnRzIG9m
IHRoaXMgb3V0LW9mLWJhbmQgDQo+IGludGVyZmFjZSBhcmUgYmVpbmcgcHJvcG9zZWQgaW4gdGhl
IHBob3NwaG9yLWRidXMtaW50ZXJmYWNlcyBwYXRjaCB0aGF0IGlzIGN1cnJlbnRseSB1bmRlciBy
ZXZpZXdbMV0uDQo+IA0KPiBSZWdhcmRpbmcgdGhlIHBsYW5uZWQga2VybmVsIGludGVyZmFjZSBm
b3IgTUNUUCwgaXQgd2lsbCBjb21lIGluIHR3byBwYXJ0czoNCj4gDQo+IDEuIEEgY29tbW9uIHNv
Y2tldC1iYXNlZCBpbnRlcmZhY2UgZm9yIGV4Y2hhbmdpbmcgbWVzc2FnZXMgYmV0d2VlbiANCj4g
ZW5kcG9pbnRzIDIuIEEgbmV0bGluayBpbnRlcmZhY2UgdG8gY29udHJvbCBjb25maWd1cmF0aW9u
IG9mIE1DVFAgbmV0d29ya3MgYW5kIGVuZHBvaW50cw0KPiAgICBjb25uZWN0ZWQgdG8gdGhlIHN5
c3RlbS4NCj4gDQo+IENvbnRyb2wgbWVzc2FnZXMgaW4gdGhlIGtlcm5lbCBpbXBsZW1lbnRhdGlv
biB3aWxsIGFsc28gYmUgaGFuZGxlZCBpbiANCj4gdXNlcnNwYWNlIChwb3NzaWJseSBleGNlcHQg
Zm9yIGJpbmRpbmctZGVmaW5lZCBtZXNzYWdlcykuIFRoZSBkYWVtb24gDQo+IGhhbmRsaW5nIGNv
bnRyb2wgbWVzc2FnZXMgcmVzcG9uZHMgYnkgcG9raW5nIHRoZSBuZXRsaW5rIGludGVyZmFjZSB0
byANCj4gcmVjb25maWd1cmUgdGhlIGtlcm5lbCBhcyBhcHByb3ByaWF0ZS4gTm90ZSB0aGF0IHdl
IGhhdmUgYW4gYWxpZ25tZW50IA0KPiBiZXR3ZWVuIHRoZSBrZXJuZWwgaW50ZXJmYWNlIHByb3Bv
c2VkIGhlcmUgYW5kIHRoZSBuZWVkIGZvciB0aGUgDQo+IG91dC1vZi1iYW5kIGludGVyZmFjZXMg
b24gdGhlIG1jdHAtZGVtdXgtZGFlbW9uIG91dGxpbmVkIGFib3ZlIA0KPiAobmV0bGluayBpcyBh
bHNvIG91dC1vZi1iYW5kKS4gQXMgcGFydCBvZiB0aGUgZXZlbnR1YWwgdHJhbnNpdGlvbiBhd2F5
IA0KPiBmcm9tIHRoZSBtY3RwLWRlbXV4LWRhZW1vbiB0byB0aGUga2VybmVsLWJhc2VkIHNvY2tl
dCBpbXBsZW1lbnRhdGlvbiANCj4gaXQncyBhIHBvc3NpYmlsaXR5IHRoYXQgd2UgY291bGQgd3Jh
cCB0aGUgbmV0bGluayBpbnRlcmZhY2Ugd2l0aCB0aGUgDQo+IEQtQnVzIGludGVyZmFjZSwgd2hp
Y2ggc2hvdWxkIG1lYW4gbWluaW1hbCBjaGFuZ2VzIGZvciBhcHBsaWNhdGlvbnMgDQo+IGFscmVh
ZHkgdXNpbmcgdGhlIEQtQnVzIGludGVyZmFjZSAodGhvdWdoIHJlYWxpc3RpY2FsbHkgdGhpcyBz
aG91bGQganVzdCBpbXBhY3QgdGhlIGRhZW1vbiBoYW5kbGluZyBjb250cm9sIG1lc3NhZ2VzKS4N
Cj4gDQo+IFJldHVybmluZyB0byB5b3VyIHF1ZXN0aW9uIGFib3V0IHRoZSB0aHJlZSBvcGVyYXRp
b25hbCBtb2RlcyBpbiBsaWdodCANCj4gb2YgdGhlIGFib3ZlLCBhIGZldyBwb2ludHM6DQo+IA0K
PiAxLiBFbmRwb2ludC1tb2RlIG5lZWRzIHRvIHJlc3BvbmQgdG8gZS5nLiBgU2V0IEVJRGAgbWVz
c2FnZXMuIEEgYFNldCANCj4gRUlEYCBtZXNzYWdlIHdvdWxkIGJlIHJlY2VpdmVkIGJ5IHRoZSBN
Q1RQIGNvbnRyb2wgZGFlbW9uIGNvbm5lY3RlZCB0byANCj4gdGhlIG1jdHAtZGVtdXgtZGFlbW9u
LCBhbmQgdGhlIE1DVFAgY29udHJvbCBkYWVtb24gd291bGQgZS5nLiBjYWxsIGEgDQo+IFNldEVJ
RCgpIG1ldGhvZCBvbiB0aGUgbWN0cC1kZW11eC1kYWVtb24gb2JqZWN0J3MgRC1CdXMgaW50ZXJm
YWNlIHRvIA0KPiByZWNvbmZpZ3VyZSB0aGUgZW5kcG9pbnQuDQo+IA0KPiAyLiBJIHRoaW5rIEJ1
cy1vd25lciBtb2RlIGlzIG1haW5seSBhIGNvbnNpZGVyYXRpb24gb2YgaG93IHRoZSBNQ1RQIA0K
PiBjb250cm9sIGRhZW1vbiBvcGVyYXRlcyAoaS5lLiBzZW5kaW5nIG1lc3NhZ2VzIHJhdGhlciB0
aGFuIHNpbXBseSANCj4gcmVzcG9uZGluZyB0byB0aGVtIGFzIGluIEVuZHBvaW50LW1vZGUpLg0K
PiANCj4gMy4gQnJpZGdpbmcgaXMgaGFuZGxlZCBpbiB0d28gcGFydHM6IFRoZSBiaW5kaW5nIHRv
Z2V0aGVyIG9mIGVuZHBvaW50cyANCj4gbWF5IG9jY3VyIGluIHRoZSBtY3RwLWRlbXV4LWRhZW1v
biBpZiB0aGUgZGVzaWduIGlzIHN1Y2ggdGhhdCB0aGUgDQo+IGJyaWRnZSBoYXMgYSBzaW5nbGVk
IEVJRCByYXRoZXIgdGhhbiBhbiBFSUQgcGVyIGJpbmRpbmcgaW5zdGFuY2UuIA0KPiBBbHRlcm5h
dGl2ZWx5LCBpZiBhbiBFSUQgaXMgcHJvdmlkZWQgcGVyLWVuZHBvaW50LCBtdWx0aXBsZSANCj4g
bWN0cC1kZW11eC1kYWVtb25zIGNvdWxkIGJlIHJ1biB3aXRoIGEgc2VwYXJhdGUgZGFlbW9uIHN1
YnNjcmliaW5nIHRvIA0KPiBlYWNoIG1jdHAtZGVtdXgtZGFlbW9uIHNvY2tldCBwYXJ0aWNpcGF0
aW5nIGluIHRoZSBicmlkZ2UuDQo+IA0KPiBQb2ludCAzLiByZXF1aXJlcyBzb21lIHJld29yayBv
ZiB0aGUgbWN0cC1kZW11eC1kYWVtb24gdG8gcHJvdmlkZSBhIA0KPiBkZXRlcm1pbmlzdGljIGFi
c3RyYWN0LXNvY2tldCBuYW1pbmcgc2NoZW1lIHRvIGVuYWJsZSBtdWx0aXBsZSANCj4gY29uY3Vy
cmVudCBtY3RwLWRlbXV4LWRhZW1vbiBpbnN0YW5jZXMgdG8gZXhpc3QsIGFuZCB0aGUgd29yayBp
cyANCj4gc2ltaWxhciB0byB3aGF0IEkndmUgcmVjZW50bHkgZG9uZSBmb3IgdGhlIG9ibWMtY29u
c29sZSBwYWNrYWdlLiBUaGUgDQo+IG5hbWluZy1zY2hlbWUgbWF5IGJlIGRlZmluZWQgYnkgdGhl
IHN5c3RlbSBjb25maWd1cmF0aW9uIChhcyBpcyB0aGUgY2FzZSB3aXRoIG9ibWMtY29uc29sZSku
DQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5i
bWMvcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzLw0KPiArLzMwMTM5DQo+IA0KPiA+IEFsc28sIHdo
ZW4gdGhlIHNvY2tldHMNCj4gPiBtb3ZlIHRvIEtlcm5lbCwgd2hhdCB3b3VsZCBiZSB0aGUgd2F5
IGZvciBhIHVzZXIgdG8gY29uZmlndXJlIGEgDQo+ID4gY2VydGFpbiBwaHlzaWNhbCBiaW5kaW5n
IGluIOKAnEJ1cyBPd25lcuKAnSBtb2RlIGFuZCBhbm90aGVyIGJpbmRpbmcgaW4g4oCcRW5kcG9p
bnTigJ0gbW9kZSA/DQo+IA0KPiBBcyBtZW50aW9uZWQgYWJvdmUsIHRoaXMgaXNuJ3QgYSBwcm9w
ZXJ0eSBvZiB0aGUgZW5kcG9pbnQgc28gbXVjaCBhcyANCj4gaG93IHRoZSBlbmRwb2ludCBpcyB1
c2VkIGJ5IGFwcGxpY2F0aW9ucyAoc3VjaCBhcyB0aGUgTUNUUCBjb250cm9sIA0KPiBkYWVtb24p
LiBUaGUga2VybmVsIHdpbGwgYmUgYWdub3N0aWMgdG8gaG93IGFuIGVuZHBvaW50IGlzIHVzZWQg
YmV5b25kIA0KPiBjb25maWd1cmluZyBiaW5kaW5ncyBhbmQgZW5kcG9pbnRzIGFzIGRpcmVjdGVk
IGJ5IHVzZXJzcGFjZSB2aWEgdGhlIG5ldGxpbmsgaW50ZXJmYWNlLg0KPiANCj4gPiBXZSB3aWxs
IGhhdmUgY2FzZXMNCj4gPiB3aGVyZSBCTUMgd2lsbCBiZSBCdXMgT3duZXIgb24gYSBjZXJ0YWlu
IGJ1cyBhbmQgRW5kcG9pbnQgb24gYW5vdGhlciBidXMgc2ltdWx0YW5lb3VzbHkuDQo+IA0KPiBU
aGF0J3MgZmluZSwgaXQncyBhIHVzZS1jYXNlIEkgYW50aWNpcGF0ZWQgKGFuZCBhZ2FpbiBpdCBw
YXJ0bHkgY29tZXMgDQo+IGJhY2sgdG8gaG93IGVuZHBvaW50cyBhcmUgdXNlZCBieSBhcHBsaWNh
dGlvbnMgcmF0aGVyIHRoYW4gYSBwcm9wZXJ0eSANCj4gb2YgdGhlIGVuZHBvaW50IGl0c2VsZiku
DQo+IA0KPiA+IA0KPiA+IE11bHRpcGxlIE1DVFAgRGFlbW9uIGluc3RhbnRpYXRpb25zOg0KPiA+
IA0KPiA+IFRoZSByYXRlIG9mIHRyYW5zbWlzc2lvbiBhbmQgcmVjZXB0aW9uIG9mIE1DVFAgbWVz
c2FnZXMgd2lsbCBiZSANCj4gPiBsaW1pdGVkIGJ5IHRoZSB1bmRlcmx5aW5nIHBoeXNpY2FsIGJp
bmRpbmcuIEhhdmluZyBvbmUgaW5zdGFuY2Ugb2YgDQo+ID4gTUNUUCB0cmFuc3BvcnQgaW50ZXJm
YWNlIHBlciBwaHlzaWNhbCBwb3J0IHdvdWxkIHNwZWVkIHVwIHRoZSBUWCBhbmQgDQo+ID4gUlgu
IEhvdyBjYW4gdGhpcyBiZSBhY2hpZXZlZCBpbiBkZW11eCBkYWVtb24/DQo+IA0KPiBUaGlzIGlz
IGVuYWJsZWQgYnkgZGV0ZXJtaW5pc3RpYyBuYW1pbmcgb2YgYWJzdHJhY3Qgc29ja2V0cyB0aGF0
IEkgDQo+IHRhbGtlZCBhYm91dCBhYm92ZS4NCj4gDQo+ID4gQW5kIGhvdyB3b3VsZCB0aGlzIGJl
IGFkZHJlc3NlZA0KPiA+IGluIEtlcm5lbCBiYXNlZCBzb2NrZXRzID8NCj4gDQo+IE1lc3NhZ2Vz
IGFyZSBzZW50IGluIHByb2Nlc3MgY29udGV4dCwgc28gY29uY3VycmVuY3kgaXMgYXMgd2lkZSBh
cyB0aGUgDQo+IG51bWJlciBvZiB0aHJlYWRzIGF2YWlsYWJsZSBhc3N1bWluZyB5b3UncmUgc2Vu
ZGluZyBhY3Jvc3MgZGlmZmVyZW50IGludGVyZmFjZXMuDQo+IA0KPiA+IEhvdyBjYW4gYSB1c2Vy
IHNwZWNpZnkgdGhlIHBoeXNpY2FsIGJpbmRpbmdzIGhlL3NoZSBpcyBnb2luZyB0byBuZWVkIA0K
PiA+IGFuZCBpbnN0YW5jZXMgZm9yIHRoZSBzYW1lID8NCj4gDQo+IFZpYSB0aGUgbmV0bGluayBp
bnRlcmZhY2UuDQo+IA0KPiA+IA0KPiA+IFN1cHBvcnQgZm9yIHVwcGVyIGxheWVyIHByb3RvY29s
czoNCj4gPiBJbiBJbnRlbOKAmXMgdXNlY2FzZXMsIG1vc3Qgb2YgdGhlIHVwcGVyIGxheWVyIHBy
b3RvY29scyBsaWtlIA0KPiA+IFBMRE0vSW50ZWwgVmVuZG9yIERlZmluZWQgTWVzc2FnaW5nIFR5
cGUvU1BETSBldGMuIGFyZSBnb2luZyB0byBiZSANCj4gPiDigJxSZXF1ZXN0ZXJz4oCdIGkuZS4g
dGhleSBhcmUgZ29pbmcgdG8gc2VuZCBvdXQgcmVxdWVzdCBwYWNrZXRzIHRvIGEgDQo+ID4gY29u
bmVjdGVkIGRldmljZSBvbiB0aGUgcGxhdGZvcm0gKGV4OiBBZGQtSW4gQ2FyZHMpIHVzaW5nIE1D
VFAuIA0KPiA+IFRoZXNlIHByb3RvY29scyB3aWxsIG5vdCBoYXZlIHByaW9yIGtub3dsZWRnZSBh
Ym91dCB0aGUgRUlEcyBhbmQgDQo+ID4gdGh1cyBuZWVkIGEgd2F5IHRvIHF1ZXJ5IHRoZSBleGlz
dGluZyBFSURzIGFuZCB0aGUgbWVzc2FnZSB0eXBlcyANCj4gPiBzdXBwb3J0ZWQgYnkgdGhlIEVJ
RHMgZnJvbSB0aGUgTUNUUCBsYXllciBpbiBvcmRlciB0byBzdGFydCB0aGVpciANCj4gPiBjb21t
dW5pY2F0aW9uLiBUaGUgRC1CdXMgcHJvcG9zYWwgaGFuZGxlcyB0aGlzIGJ5IGNyZWF0aW5nIEQt
QnVzIA0KPiA+IG9iamVjdHMgZm9yIHRoZSBFSURzLiBIb3cgd291bGQgd2UgYWNoaWV2ZSB0aGUg
c2FtZSBpbiBkZW11eCBkYWVtb24gPw0KPiANCj4gVGhpcyBpcyByZXNvbHZlZCBieSBlLmcuIHRo
ZSBtY3RwLWRlbXV4LWRhZW1vbiBpbXBsZW1lbnRpbmcgdGhlIEQtQnVzIA0KPiBpbnRlcmZhY2Vz
IHlvdXIgcHJvcG9zaW5nIChhc2lkZSBmcm9tIHRoZSBSeC9UeCBtZXRob2RzKSBhcyB0aGUgDQo+
IG91dC1vZi1iYW5kIGluZm9ybWF0aW9uL2V2ZW50IG1lY2hhbmlzbS4NCj4gDQo+ID4gSG93IHdv
dWxkIEtlcm5lbCBiYXNlZCBzb2NrZXRzIGhhbmRsZSB0aGlzID8NCj4gDQo+IFRoZSBuZXRsaW5r
IGludGVyZmFjZSBhbGxvd3MgdXNlcnNwYWNlIHRvIHF1ZXJ5IHRoZSB0b3BvbG9neSBvZiB0aGUg
DQo+IG5ldHdvcmssIHdoaWNoIHdpbGwgYmUgc2V0IHVwIGJ5IHRoZSBNQ1RQIGNvbnRyb2wgZGFl
bW9uLg0KPiANCj4gQXMgdG8gd2hhdCBtZXNzYWdlIHR5cGVzIGFyZSBzdXBwb3J0ZWQgYnkgZW5k
cG9pbnRzLCBJIGRpZG4ndCBoYXZlIGFueSANCj4gcGxhbiB0byBjYWNoZSB0aGlzIGluZm9ybWF0
aW9uIG9uIHRoZSBCTUMuIEkgZmlndXJlZCB0aGUgYXBwbGljYXRpb24gDQo+IHdhbnRpbmcgdG8g
dGFsayB0byB0aGUgZW5kcG9pbnQgd291bGQgcXVlcnkgdGhlIGVuZHBvaW50IGZvciB0aGlzIA0K
PiBpbmZvcm1hdGlvbiBkaXJlY3RseS4gVGhlc2UgcXVlcmllcyBvcGVyYXRlIGF0IG11bHRpcGxl
IGxldmVscywgZS5nOg0KPiANCj4gKiBXaGF0IE1DVFAgY29udHJvbCBjb21tYW5kcyBhcmUgc3Vw
cG9ydGVkPw0KPiAqIFdoYXQgUExETSBjb25zdHJ1Y3RzIGFyZSBzdXBwb3J0ZWQ/DQo+ICogV2hh
dCBTUERNIGNvbmNlcHRzIGFyZSBzdXBwb3J0ZWQ/DQo+IA0KPiBOb25lIG9mIHRoaXMgaW5mb3Jt
YXRpb24gYmVsb25ncyBpbiB0aGUga2VybmVsLiBXaGV0aGVyIHVzZXJzcGFjZSANCj4gc2hvdWxk
IGV4cG9zZSBpdCBpbiBzb21lIGdlbmVyaWMgZmFzaGlvbiBpcyB1cCBmb3IgZGViYXRlIGJ1dCBh
cyANCj4gbWVudGlvbmVkIEkgZmVlbCB0aGUgYW5zd2VyIGlzIHByb2JhYmx5IG5vdCwganVzdCBs
ZWF2ZSBpdCB0byBzcGVjaWZpYyBhcHBsaWNhdGlvbnMuDQo+IA0KPiA+IA0KPiA+IERpc2NvdmVy
eSBvZiBNQ1RQIGNhcGFibGUgZGV2aWNlczoNCj4gPiANCj4gPiBXZSB3b3VsZCBuZWVkIHRvIG1v
ZGlmeSB0aGUgZGVtdXgtZGFlbW9uIHRvIGNhdGVyIGZvciB0aGUgZGlzY292ZXJ5IG1lY2hhbmlz
bXMuDQo+ID4gV2hlbiBCTUMgYWN0cyBhcyBhIEJ1cyBPd25lciwgaXQgd291bGQgaGF2ZSB0byBn
byBhaGVhZCBhbmQgZGlzY292ZXIgDQo+ID4gb3RoZXIgZW5kIHBvaW50cyBvbiB0aGUgYnVzIGFu
ZCB0aGlzIGRpc2NvdmVyeSBtZWNoYW5pc20gdmFyaWVzIA0KPiA+IGFjY29yZGluZyB0byB0aGUg
YnVzLCBhbmQgdGhlIHJvbGU6IEZvciBleGFtcGxlOiBIb3cgYSBQQ0llIGRldmljZSANCj4gPiBk
aXNjb3ZlcnMgb3RoZXIgZW5kcG9pbnRzIGlzIHRvdGFsbHkgZGlmZmVyZW50IGZyb20gaG93IGEg
U01CdXMgZGV2aWNlIHdvdWxkIGRvLg0KPiANCj4gQnV0IHRoaXMgaXMgYmluZGluZy1pbXBsZW1l
bnRhdGlvbiBzcGVjaWZpYy4gVGhlIGxvZ2ljIHNob3VsZCBsaXZlIGluIA0KPiB0aGUgYmluZGlu
Zywgbm8/IERldmljZSBob3RwbHVnIG5vdGlmaWNhdGlvbnMgYXJlIGJpbmRpbmctc3BlY2lmaWMg
YnV0IA0KPiB0aGVyZSBpcyBhIHRoZSBEaXNjb3ZlcnkgTm90aWZ5IG1lc3NhZ2UgdGhhdCBiaW5k
aW5ncyBjYW4gcHJvcGFnYXRlIHVwIA0KPiB0aGUgc3RhY2sgdG8gbm90aWZ5IGUuZy4gdGhlIE1D
VFAgY29udHJvbCBkYWVtb24gdGhhdCBhIGRldmljZSBoYXMgYXBwZWFyZWQsIGFuZCB0aGlzIGlz
IGdlbmVyaWMuDQo+IA0KPiA+IFNpbWlsYXJseSwgaG93IEJNQyBhcyBQQ0llIGJ1cyBvd25lciB3
b3VsZCBkaXNjb3ZlciBvdGhlciBlbmRwb2ludHMgDQo+ID4gKEVuZHBvaW50IERpc2NvdmVyeSBj
b250cm9sIGNvbW1hbmRzKSBpcyBkaWZmZXJlbnQgZnJvbSBob3cgQk1DIGFzIA0KPiA+IFBDSWUg
ZW5kcG9pbnQgd291bGQgZGlzY292ZXIgb3RoZXIgZW5kcG9pbnRzKEdldCBSb3V0aW5nIFRhYmxl
IHVwZGF0ZSkuDQo+ID4gQW5kIGRpc2NvdmVyZWQgZW5kcG9pbnRzIG5lZWQgdG8gaGF2ZSBhIHJl
cHJlc2VudGF0aW9uIChleDogRC1CdXMgDQo+ID4gb2JqZWN0cykgc28gdGhhdCB1cHBlciBsYXll
ciBwcm90b2NvbHMgY2FuIGRpc2NvdmVyIHRoZW0uIEhvdyB3b3VsZCB0aGlzIGJlIGhhbmRsZWQg
aW4gZGVtdXggZGFlbW9uL0tlcm5lbCBhcHByb2FjaCA/DQo+IA0KPiBVc2Vyc3BhY2UgaW50ZXJh
Y3Rpbmcgd2l0aCB0aGUgZW5kcG9pbnQgYXQgYW4gTUNUUC1jb250cm9sIGxldmVsIHdpbGwgDQo+
IGtub3cgd2hpY2ggbW9kZSBpdCdzIG9wZXJhdGluZyBpbiwgYW5kIHNvIHdpbGwga25vdyB3aGF0
IG1ldGhvZCBpdCANCj4gbmVlZHMgdG8gdXNlIHRvIGNvbnN0cnVjdCB0aGUgcm91dGluZyB0YWJs
ZSAoYXMgYSBtZWFucyB0byBrbm93IHRoZSANCj4gb3RoZXIgZW5kcG9pbnRzIGluIHRoZSBuZXR3
b3JrKS4NCj4gDQo+IEl0IHNvdW5kcyBsaWtlIHdoYXQgeW91J3JlIGFmdGVyIGlzIGFuIGFic3Ry
YWN0aW9uIHRoYXQgcHJlc2VudHMgdGhlIA0KPiBuZXR3b3JrIHRvIGFwcGxpY2F0aW9ucyB0aGF0
IGRvIG5vdCBjYXJlIHdoaWNoIG1vZGUgaW4gd2hpY2ggdGhlIGVuZHBvaW50cyBhcmUgb3BlcmF0
aW5nPw0KPiBJZiBzbywgdGhpcyBpcyBzb21ldGhpbmcgSSBicm91Z2h0IHVwIG9uIHRoZSBwaG9z
cGhvci1kYnVzLWludGVyZmFjZXMgDQo+IHBhdGNoOiBXZSBzaG91bGQgY29tZSB1cCB3aXRoIGFu
IGFic3RyYWN0IHJlcHJlc2VudGF0aW9uIG9mIHRoZSANCj4gbmV0d29yayBmb3IgYXBwbGljYXRp
b25zIHRvIGNvbnN1bWUuDQo+IA0KPiA+IA0KPiA+IENvbnRyb2wgY29tbWFuZHM6DQo+ID4gDQo+
ID4gTW9zdCBjb250cm9sIGNvbW1hbmRzIGNvdXBsZSB0aWdodGx5IHdpdGggdGhlIGJpbmRpbmcg
YW5kIG1jdHAgbGF5ZXIgDQo+ID4gaXRzZWxmOyBmb3IgZXhhbXBsZSwgd2hlbiBTZXQgRUlEIGlz
IHVzZWQgYnkgdGhlIEJNQyB0byBhbGxvY2F0ZSBFSUQgDQo+ID4gdG8gYW5vdGhlciBkZXZpY2Us
IGl0IG5lZWRzIHRvIHVzZSBTcGVjaWFsIEVJRCAwICsgcGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUg
ZGV2aWNlLg0KPiANCj4gT2theSwgc28gSSBoYWQgYSBiaXQgb2YgYSBiYWcgb2YgdHJpY2tzIHBs
YW5uZWQgaGVyZSB0aGF0IG1lYW4gd2UgDQo+IGRvbid0IG5lZWQgdG8gZW1iZWQgcGh5c2ljYWwg
YWRkcmVzc2VzIGludG8gZS5nLiBgU2V0IEVJRGAgcGFja2V0cy4gDQo+IFRoZXJlJ3Mgbm8gYWxs
b3dhbmNlIGZvciB0aGlzIGluIHRoZSBzcGVjIGFueXdheS4NCj4gDQo+IFRoZSBtYWluIGluc2ln
aHQgZm9yIGUuZy4gYFNldCBFSURgIGlzIHRoYXQgY29tbWFuZHMgbGlrZSB0aGlzIGFyZSANCj4g
b25seSBzZW50IGJ5IGJ1cy1vd25lcnMgd2hvIG11c3QgYmUgY29udHJvbGxpbmcgdGhlaXIgb3du
IHJvdXRlIHRhYmxlLiANCj4gVGhlIE1DVFAgcm91dGUgdGFibGUgaXMgZWZmZWN0aXZlbHkgdGhl
IGNvbWJpbmF0aW9uIG9mIHRoZSBBUlAgdGFibGUgDQo+IGFuZCByb3V0ZSB0YWJsZSBjb25jZXB0
cyBmcm9tIElQIG5ldHdvcmtzLCBhbmQgc28gdGhlIGludGVudCB3aXRoIHRoZSANCj4ga2VybmVs
LWJhc2VkIE1DVFAgaW1wbGVtZW50YXRpb24gaXMgdG8gZXhwb3NlIHRoZSByb3V0ZSB0YWJsZSB0
byANCj4gdXNlcnNwYWNlIGp1c3QgbGlrZSB0aGUgQVJQIHRhYmxlLCBpbmNsdWRpbmcgdGhlIGFi
aWxpdHkgdG8gaW5qZWN0IGVudHJpZXMgaW50byB0aGUgdGFibGUgKGxpa2UgdGhlIEFSUCB0YWJs
ZSkuDQo+IA0KPiBGcm9tIHRoZXJlIHdlIG1haW50YWluIHN0YXRlIGZvciBlYWNoIGVudHJ5IHRo
YXQgZGVzY3JpYmVzIHdoZXRoZXIgb3IgDQo+IG5vdCB0aGUgRUlEIGhhcyBiZWVuIGFzc2lnbmVk
IGJ5IHVzZXJzcGFjZSwgYWtpbiB0byB0aGUgYGRpc2NvdmVyZWRgIA0KPiBmbGFnIHRoYXQgd2Ug
bWFpbnRhaW4gZm9yIHRoZSBlbmRwb2ludCBpdHNlbGY6IFRoaXMgaXMgc2V0IHdoZW4gdGhlIA0K
PiBlbmRwb2ludCBJRCBoYXMgYmVlbiBzdWNjZXNzZnVsbHkgYXNzaWduZWQgKGkuZS4gd2Ugc2Vl
IGEgYFNVQ0NFU1NgIA0KPiBjb21wbGV0aW9uIGNvZGUgdG8gZm9yIGEgYFNldCBFSURgIG1lc3Nh
Z2UpLg0KPiANCj4gRnVydGhlciwgRUlEcyBtdXN0IGJlIHVuaXF1ZSBpbiB0aGUgbmV0d29yaywg
c28gdGhlIHJvdXRlIHRhYmxlIG11c3QgDQo+IG5vdCBjb250YWluIHRoZSBzYW1lIEVJRCBhc3Np
Z25lZCB0byBtdWx0aXBsZSBkZXZpY2VzLiBUaGlzIG1lYW5zIHRoYXQgDQo+IHRoZSBFSUQgaXMg
dW5hbWJpZ3VvdXMgaW4gaWRlbnRpZnlpbmcgdGhlIGRldmljZS4NCj4gDQo+IFRoZSB0cmljayBp
cyB0aGF0IEVJRHMgdW5hbWJpZ3VvdXNseSBpZGVudGlmeWluZyBkZXZpY2VzIGlzIHRydWUgDQo+
IHJlZ2FyZGxlc3Mgb2YgdGhlIHN0YXRlIG9mIHRoZSBgZGlzY292ZXJlZGAgZmxhZyBhc3NvY2lh
dGVkIHdpdGggdGhlIA0KPiBlbnRyeSBpbiB0aGUgcm91dGUgdGFibGUuIFNvIHRoZSBwbGFuIGlz
IHRoYXQgaW4gb3JkZXIgdG8gc2VuZCBhIGBTZXQgDQo+IEVJRGAgdG8gYSBkaXNjb3ZlcmVkIGVu
ZHBvaW50LCB3ZSB0YWtlIHRoZSBmb2xsb3dpbmcgc3RlcHM6DQo+IA0KPiBGb3Igc3RhdGljIG5l
dHdvcmtzOg0KPiANCj4gMS4gVGhlIE1DVFAgY29udHJvbCBkYWVtb24gaW5qZWN0cyBhbiBlbnRy
eSBpbnRvIHRoZSByb3V0ZSB0YWJsZSwgDQo+IHNldHRpbmcgdGhlDQo+ICpwcm9wb3NlZCogRUlE
LCB0aGUgYnVzIGFuZCB0aGUgcGh5c2ljYWwgYWRkcmVzcy4gVGhlIGBkaXNjb3ZlcmVkYCBiaXQg
DQo+IGFzc29jaWF0ZWQgd2l0aCB0aGlzIGVudHJ5IHJlbWFpbnMgY2xlYXIuDQo+IA0KPiAyLiBU
aGUgTUNUUCBjb250cm9sIGRhZW1vbiBjb25zdHJ1Y3RzIGEgYFNldCBFSURgIG1lc3NhZ2Ugd2l0
aCBhbiBNQ1RQIA0KPiBoZWFkZXIgY29udGFpbmluZyB0aGUgZGVzdGluYXRpb24gRUlEIHNldCB0
byB0aGUgKnByb3Bvc2VkKiBFSUQgDQo+IChzZXR0aW5nIHRoZSBkZXN0aW5hdGlvbiBFSUQgdG8g
dGhlICpwcm9wb3NlZCogRUlEIGlzIHB1cmVseSBmb3IgDQo+IHJvdXRpbmcgcHVycG9zZXMsIHRo
ZSBtZXNzYWdlIGRvZXMgbm90IGdvIG9udG8gdGhlIHdpcmUgaW4gdGhpcyBzdGF0ZSkuDQo+IA0K
PiAzLiBUaGUgTUNUUCBjb250cm9sIGRhZW1vbiBzZW5kcyB0aGUgYFNldCBFSURgIG1lc3NhZ2Ug
dmlhIHRoZSBzb2NrZXQgaW50ZXJmYWNlLg0KPiANCj4gNC4gVGhlIGtlcm5lbCByZWNlaXZlcyB0
aGUgbWVzc2FnZSBhbmQgcGFyc2VzIHRoZSBNQ1RQIGhlYWRlciB0byANCj4gcmVzb2x2ZSB0aGUg
cm91dGUuDQo+IA0KPiA1LiBUaGUga2VybmVsIGRpc2NvdmVycyBmcm9tIHRoZSByb3V0aW5nIHRh
YmxlIHRoYXQgdGhlIGBkaXNjb3ZlcmVkYCANCj4gZmxhZyBpcyBfbm90XyBzZXQgZm9yIHRoZSBk
ZXN0aW5hdGlvbiBFSUQgYW5kIGludHJvc3BlY3RzIHRoZSBwYWNrZXQgDQo+IGZvciB0aGUgYFNl
dCBFSURgIE1DVFAgY29tbWFuZC4NCj4gDQo+IDYuIFRoZSBrZXJuZWwgX21vZGlmaWVzXyB0aGUg
cGFja2V0LCByZXBsYWNpbmcgZGVzdGluYXRpb24gRUlEIHdpdGggDQo+IFNwZWNpYWwgRUlEDQo+
IDAgZm9yIHRoZSBgU2V0IEVJRGAgcGFja2V0Lg0KPiANCj4gNy4gVGhlIGtlcm5lbCBwYXNzZXMg
dGhlIG1vZGlmaWVkIG1lc3NhZ2Ugb250byB0aGUgYmluZGluZyANCj4gaW1wbGVtZW50YXRpb24g
KHJlc29sdmVkIHZpYSB0aGUgcm91dGUgdGFibGUpIGZvciB0cmFuc21pc3Npb24gdG8gdGhlIHRh
cmdldCBlbmRwb2ludC4NCj4gDQo+IDguIFRoZSB0YXJnZXQgZW5kcG9pbnQgcmVzcG9uZHMgdG8g
dGhlIGBTZXQgRUlEYCBtZXNzYWdlLg0KPiANCj4gOS4gVGhlIGtlcm5lbCBwYXNzZXMgdGhlIHJl
c3BvbnNlIGJhY2sgdG8gdGhlIHVzZXJzcGFjZSBwcm9jZXNzIA0KPiBhc3NvY2lhdGVkIHdpdGgg
dGhlIHNlbmRpbmcgc29ja2V0Lg0KPiANCj4gMTAuIFRoZSBNQ1RQIGNvbnRyb2wgZGFlbW9uIHJl
Y2VpdmVzIHRoZSByZXNwb25zZSB0byB0aGUgYFNldCBFSURgIA0KPiBjb21tYW5kLiBJZiB0aGUg
Y29tbWFuZCBpcyBzdWNjZXNzZnVsIHRoZSBNQ1RQIGNvbnRyb2wgZGFlbW9uIHNldHMgdGhlIA0K
PiBgZGlzY292ZXJlZGAgZmxhZyBpbiB0aGUgcm91dGUgdGFibGUgYW5kIG5vIGZ1cnRoZXIgRUlE
IHJlcGxhY2VtZW50IGlzIA0KPiBwZXJmb3JtZWQgZm9yIHBhY2tldHMgcm91dGVkIHRvIHRoYXQg
ZGV2aWNlLiBJZiB0aGUgY29tbWFuZCBmYWlsZWQgdGhlbiB0aGUgZGlzY292ZXJlZCBmbGFnIHJl
bWFpbnMgY2xlYXIuDQo+IEZ1cnRoZXIsIHRoZSByZXNwb25zZSBtYXkgaW5kaWNhdGUgdGhlIGRl
dmljZSBoYXMgYWxyZWFkeSByZWNlaXZlZCBhIA0KPiBfZGlmZmVyZW50XyBlbmRwb2ludCBJRCBm
cm9tIGEgcHJldmlvdXMgYFNldCBFSURgIGNvbW1hbmQsIGluIHdoaWNoIA0KPiBjYXNlIHRoZSBy
b3V0ZSB0YWJsZSBpcyB1cGRhdGVkIHdpdGggdGhlIHJldHVybmVkIEVJRCBhbmQgdGhlIGRpc2Nv
dmVyZWQgZmxhZyBpcyBzZXQuDQo+IA0KPiBGb3IgZHluYW1pYyBuZXR3b3JrcyB0aGUgcHJvY2Vz
cyBpcyBsYXJnZWx5IHRoZSBzYW1lLCB0aG91Z2ggdGhlIHJvdXRlIA0KPiB0YWJsZSBpcyB1cGRh
dGVkIHRvIGNvbnRhaW4gdGhlIGRldmljZSBidXMgYWRkcmVzcyB3aGVuIHdlIHJlY2VpdmUgdGhl
IA0KPiBiaW5kaW5nLXNwZWNpZmljIGBEaXNjb3ZlcnkgTm90aWZ5YCBzaWduYWwuIFRoaXMgc2ln
bmFsIGlzIHRyYW5zbGF0ZWQgDQo+IHRvIGEgRGlzY292ZXJ5IE5vdGlmeSBtZXNzYWdlIHRvIHRy
aWdnZXIgdXNlcnNwYWNlIHByb2Jpbmcgb2YgdGhlIGJ1cyANCj4gZm9yIG5ldyBkZXZpY2VzIGFu
ZCB0byBwZXJmb3JtIGFkZHJlc3MgYXNzaWdubWVudC4gVXNlcnNwYWNlIGNhbiANCj4gaW5zcGVj
dCB0aGUgcm91dGUgdGFibGUgZm9yIGRldmljZXMgd2l0aCB0aGUgYGRpc2NvdmVyZWRgIGZsYWcg
Y2xlYXJlZCB0byBkZXRlcm1pbmUgd2hhdCBkZXZpY2VzIG5lZWQgYWRkcmVzcyBhc3NpZ25tZW50
Lg0KPiANCj4gPiBHZXQgRUlEIGNvbW1hbmQgbmVlZHMgdG8gcmV0dXJuDQo+ID4gYmluZGluZyBz
cGVjaWZpYyBpbmZvcm1hdGlvbiBhcyBhIHBhcnQgb2YgaXRzIHJlc3BvbnNlLg0KPiANCj4gUmF0
aGVyLCBgR2V0IEVJRGAgcmV0dXJucyB0aGUgRUlEIGZvciB0aGUgZGV2aWNlIGF0IGEgcGFydGlj
dWxhciANCj4gcGh5c2ljYWwgYWRkcmVzcy4gVGhpcyBpcyBzdWJqZWN0IHRvIHRoZSBzYW1lIHNl
cXVlbmNlIG91dGxpbmVkIGFib3ZlLg0KPiANCj4gPiBHZXQgVVVJRCBjb21tYW5kIG5lZWRzIHRv
DQo+ID4gcmV0dXJuIHNhbWUgVVVJRCBhY3Jvc3MgYWxsIHBoeXNpY2FsIGJpbmRpbmdzLg0KPiAN
Cj4gVGhpcyBpcyB0aWVkIHRvIGhvdyBicmlkZ2luZyB3aWxsIGJlIGltcGxlbWVudGVkLiBBZ2Fp
biwgYnJpZGdpbmcgaXMgDQo+IGhhbmRsZWQgYnkgY29tbWFuZHMgdGhyb3VnaCB0aGUgbmV0bGlu
ayBpbnRlcmZhY2UgaW4gdGhlIGNhc2Ugb2YgdGhlIA0KPiBwcm9wb3NlZCBrZXJuZWwgaW1wbGVt
ZW50YXRpb24sIGFuZCB3ZSBqdXN0IG5lZWQgdG8gYXNzb2NpYXRlIHRoZSBvbmUgDQo+IFVVSUQg
d2l0aCBlYWNoIG9mIHRoZSBlbmRwb2ludHMgcGFydGljaXBhdGluZyBpbiB0aGUgYnJpZGdlLg0K
PiANCj4gPiBBbmQgc28gb24uIFRodXMgaG93IHdvdWxkIGNvbnRyb2wNCj4gPiBjb21tYW5kcyBi
ZSBoYW5kbGVkIGluIGRlbXV4IGRhZW1vbj8gSG93IHdvdWxkIGl0IGxvb2sgbGlrZSB3aGVuIA0K
PiA+IEtlcm5lbCBiYXNlZCBzb2NrZXRzIGFyZSBpbnRyb2R1Y2VkID8NCj4gDQo+IFdlIG1heSBu
ZWVkIHRvIHRyYW5zbGF0ZSBzb21lIG9mIHRoZXNlIGNvbmNlcHRzIHRvIGRlc2lnbnMgdGhhdCB3
ZSANCj4gY291bGQgaW1wbGVtZW50IG9uIHRoZSBtY3RwLWRlbXV4LWRhZW1vbiwgYnV0IG90aGVy
d2lzZSBJIHRoaW5rIHlvdXIgDQo+IHR3byBxdWVzdGlvbnMgaGVyZSBhcmUgbGFyZ2VseSBhbnN3
ZXJlZCBieSB0aGUgZGVzY3JpcHRpb25zIGFib3ZlLg0KPiANCj4gSG9wZSB0aGF0IGhlbHBzIQ0K
PiANCj4gQW5kcmV3DQo=
