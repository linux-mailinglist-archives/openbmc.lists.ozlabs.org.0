Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66398E76D1
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 17:42:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4720rZ4w55zDrNR
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 03:42:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4720qt5BNjzDrN6
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 03:42:17 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 09:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="198117756"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
 by fmsmga008.fm.intel.com with ESMTP; 28 Oct 2019 09:42:13 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.76]) by
 IRSMSX109.ger.corp.intel.com ([169.254.13.52]) with mapi id 14.03.0439.000;
 Mon, 28 Oct 2019 16:42:12 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: multiple telemetry designs
Thread-Topic: multiple telemetry designs
Thread-Index: AQHVicBpLOT3TrTciEijW5fZBUhB6Kdp+H+AgAFLSoCAACcoYIAAJMEAgAS4L9A=
Date: Mon, 28 Oct 2019 16:42:12 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D7A30FA6BC@IRSMSX101.ger.corp.intel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <493fa207-61eb-d393-0ea9-a8296a14d256@linux.vnet.ibm.com>
 <2C816F5E-C0F9-4C2F-899C-34B7CA984826@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9D72@IRSMSX101.ger.corp.intel.com>
 <2782E6C9-E976-4D06-B3A9-77E8FD4BB860@fuzziesquirrel.com>
In-Reply-To: <2782E6C9-E976-4D06-B3A9-77E8FD4BB860@fuzziesquirrel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGQwMzJmNDctMWM1OS00NGFmLTg5N2UtYjJmMTc0NjU5NzE2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoia2RGMEw3UDZraEJjeENtNHlPRG9pQjBaSXJGVlFTZzk2eCtiRkpmXC9OaTU3d1hESnZ0dFRhbnBWQTk1bDNnY1oifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [163.33.239.181]
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
Cc: "Mihm, James" <james.mihm@intel.com>,
 Justin Thaler <thalerj@linux.vnet.ibm.com>,
 Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Neeraj
 Ladkani <neladk@microsoft.com>, James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQnJhZCwgDQoNClRoYW5rIHlvdSBmb3IgeW91ciBhbnN3ZXJzLiBJIGJlbGlldmUsIHRoYXQg
dGhlcmUgd2FzIHNvbWUgbWlzdW5kZXJzdGFuZGluZy4gSSd2ZSBzYWlkLCB0aGF0IHRoZXJlIGlz
IFBvQyBpbXBsZW1lbnRhdGlvbiwgYnV0IEkndmUgYWxzbyBzYWlkLCB0aGF0IHRoZSBjb2RlIGhh
cyB0byBiZSByZXdyaXR0ZW4uIEFub3RoZXIgdGhpbmcgaXMsIHRoYXQgTW9uaXRvcmluZyBTZXJ2
aWNlIGlzIHJlbGF0aXZlbHkgc2ltcGxlIGFuZCBJIGRpZG4ndCBhc3N1bWUgdGhhdCB3cml0aW5n
IG91ciBiYWNrLWVuZCAodGhlIE1vbml0b2lybmcgU2VydmljZSkgd2lsbCBiZSBsZXNzIHdvcmsg
dGhhbiB1c2luZyBjb2xsZWN0ZC4gT3VyIG1haW4gY29uY2VybiB3YXMgdGhlIGNvbGxlY3RkIHN0
b3JhZ2UsICBwZXJmb3JtYW5jZSByZXF1aXJlbWVudHMgYW5kIFJlZGZpc2ggY29tcGF0aWJpbGl0
eS4gDQoNCkkgd2lsbCBpbmNvcnBvcmF0ZSBpbiBteSBkZXNpZ24gdGhlIHByb3Bvc2FsIHRvIHVz
ZSBjb2xsZWN0ZCBhcyBhbiBhbHRlcm5hdGl2ZSBiYWNrLWVuZCBmb3IgdGVsZW1ldHJ5LiANCg0K
VGhhbmsgeW91DQpQaW90cg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnJh
ZCBCaXNob3AgW21haWx0bzpicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb21dIA0KU2VudDogRnJp
ZGF5LCBPY3RvYmVyIDI1LCAyMDE5IDc6MzEgUE0NClRvOiBNYXR1c3pjemFrLCBQaW90ciA8cGlv
dHIubWF0dXN6Y3pha0BpbnRlbC5jb20+DQpDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnPjsgSmFtZXMgRmVpc3QgPGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNv
bT47IEt1biBZaSA8a3VueWlAZ29vZ2xlLmNvbT47IEp1c3RpbiBUaGFsZXIgPHRoYWxlcmpAbGlu
dXgudm5ldC5pYm0uY29tPjsgTWlobSwgSmFtZXMgPGphbWVzLm1paG1AaW50ZWwuY29tPjsgTmVl
cmFqIExhZGthbmkgPG5lbGFka0BtaWNyb3NvZnQuY29tPjsgU2hhd24gTWNDYXJuZXkgPHNoYXdu
bW1AbGludXgudm5ldC5pYm0uY29tPg0KU3ViamVjdDogUmU6IG11bHRpcGxlIHRlbGVtZXRyeSBk
ZXNpZ25zDQoNCkhpIFBpb3RyDQoNCj4gT24gT2N0IDI1LCAyMDE5LCBhdCAxMTowOCBBTSwgTWF0
dXN6Y3phaywgUGlvdHIgPHBpb3RyLm1hdHVzemN6YWtAaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+
IEhpLA0KPiANCj4gT3VyIGRlc2lnbiBpcyB0YWlsb3JlZCB0byBzdXBwb3J0IHRoZSBSZWRmaXNo
IFRlbGVtZXRyeSBTZXJ2aWNlLCBidXQgaXQgaXMgbm90IGxpbWl0ZWQgdG8gaXQgYW5kIGVpdGhl
ciwgdGhlIHRlbGVtZXRyeSBjb25maWd1cmF0aW9uIGFuZCBwcmVzZW50YXRpb24gaXMgZG9uZSB2
aWEgdGhlIFJlZGZpc2guIEFsc28sIHRoZSBtb25pdG9yaW5nIHNlcnZpY2UgaXMgZGVzaWduZWQg
dG8gc3VwcG9ydCBSZWRmaXNoIHRyaWdnZXJzIGxldmVyYWdpbmcgdGhlIFJlZGZpc2ggRXZlbnQg
U2VydmljZSBmb3Igc2VuZGluZyBldmVudHMuIA0KDQpJIHdhc27igJl0IHRyeWluZyB0byBzdWdn
ZXN0IHRoYXQgeW91ciBkZXNpZ24gd2FzIGluZmxleGlibGUuICBJIGFwb2xvZ2l6ZSBpZiB0aGF0
IHNlZW1lZCB0byBiZSB0aGUgY2FzZS4NCg0KPiBJZiB0aGUgY29sbGVjdGQgaXMgdG8gZXhpc3Qg
aW5kZXBlbmRlbnRseSBvZiBSZWRmaXNoIGFuZCBELUJ1cyBpdCBpcyBwb3NzaWJsZSB0byB1c2Ug
Ym90aCBzb2x1dGlvbnMuIEkgaGF2ZSBzb21lIHF1ZXN0aW9ucywgdGhvdWdoOg0KPiAxLiBIb3cg
dGhlIHRlbGVtZXRyeSBnYXRoZXJpbmcgd2lsbCBiZSBjb25maWd1cmVkIGJ5IHRoZSB1c2VyLCB3
aGVuIGNvbGxlY3RkIGlzIHVzZWQ/DQoNCi1PRU0gZXh0ZW5zaW9uIHRvIGFueSBtYW5hZ2VtZW50
IHByb3RvY29sIC1zc2ggKyBjb2xsZWN0ZCBjb25maWcgZmlsZSAtbm8gY29uZmlndXJhdGlvbiAo
YmFrZWQgaW50byB0aGUgaW1hZ2UgLSB0aGluayBwZXItc3lzdGVtIGltYWdlcyBkZXBsb3llZCB0
byAxMDAwMCBzeXN0ZW1zKS4NCg0KYnV0IEnigJltIGp1c3QgYmxhc3RpbmcgaWRlYXMgLSBJIGRv
buKAmXQgaGF2ZSBhbnkgbmVlZCBmb3IgcnVubmluZyB0aGUgY29sbGVjdGQgbmV0d29yayBvdXRw
dXQgcGx1Z2luLg0KDQo+IDIuIFdoYXQgaXMgdGhlIHVzZSBjYXNlIGZvciBzdG9yaW5nIGhpc3Rv
cmljYWwgcmVhZGluZ3MgaW4gdGhlIEJNQywgdXNpbmcgbm9uLXZvbGF0aWxlIHN0b3JhZ2UgKG9y
IGRpZCBJIG1pc3VuZGVyc3Rvb2QgdGhlIHJyZCBmaWxlcyk/IA0KDQpDbGllbnRzIGNhbiBoYXZl
IGhhdmUgdHJhbnNpZW50IGRpc2Nvbm5lY3RzIGFuZCBub3QgbWlzcyBhbnkgc2Vuc29yIHJlYWRp
bmdzLg0KDQo+IEFzIGZvciBtZXJnaW5nIHRoZSB0d28gcHJvcG9zYWxzLCB0aGUgY29tbW9uIEQt
QnVzIEFQSSBmb3IgdGhlIHRlbGVtZXRyeSBiYWNrLWVuZCAoZWl0aGVyIGNvbGxlY3RkIG9yIG1v
bml0b3Jpbmcgc2VydmljZSkgd2FzIHdoYXQgSSB0aG91Z2h0IGFib3V0IGF0IGZpcnN0LiBPZiBj
b3Vyc2UsIHRoZSBiYWNrLWVuZCB3aWxsIGhhdmUgdG8gc3VwcG9ydCBtZXRyaWMgcmVwb3J0IGFu
ZCB0cmlnZ2VycyBtYW5hZ2VtZW50LCBiZWNhdXNlIHRoZSBibWN3ZWIgaXMgb25seSB0aGUgcHJl
c2VudGF0aW9uIGxheWVyIChSZWRmaXNoIFRlbGVtZXRyeSBTZXJ2aWNlKSBmb3IgdGhlIHRlbGVt
ZXRyeSBkYXRhLiANCg0KVGhhdCBtYWtlcyBzZW5zZS4gIEFuZCBJIGFzc3VtZSB5b3UgYmVsaWV2
ZSB0aGF0IGl0IGlzIG1vcmUgd29yayB0byB1c2UgY29sbGVjdGQgYXMgdGhhdCBiYWNrLWVuZCB0
aGFuIHdyaXRpbmcgb25lIGZyb20gc2NyYXRjaD8gIEkgZ3Vlc3MgYXQgdGhpcyBwb2ludCBpdCBp
cyBhIGxpdHRsZSBtb290IC0gZnJvbSB0aGUgb3RoZXIgdGhyZWFkIGl0IHNvdW5kcyBsaWtlIHlv
dSBoYXZlIHRoZSBjb2RlIG1vc3RseSBkb25lIGFscmVhZHkgYW55d2F5Li4uDQoNCnRoeCAtIGJy
YWQNCg==
