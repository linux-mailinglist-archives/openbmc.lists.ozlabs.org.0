Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 181DA1FCBE6
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 13:11:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n2SV0NDxzDqlS
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 21:11:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n2Pj6gFlzDqm6
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 21:08:56 +1000 (AEST)
IronPort-SDR: l4M4JwbEhfn/mAUwbqzuA8ywuE/ffrbzIMLW+Oc+Rih0klL1ND7pTx5hEY4gHHBjIfcfig/qTA
 Qglqt2wlcGNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 04:08:53 -0700
IronPort-SDR: loVo+Draja1Zv95jmirvfbi4y2hG/IlRzbRRt/nsmJluuRo/R9HxJdQbIf9yxIK+t8zF+VBtIJ
 mC8+qE6ACCqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,522,1583222400"; d="scan'208";a="317501681"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2020 04:08:52 -0700
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 17 Jun 2020 12:08:51 +0100
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 17 Jun 2020 12:08:51 +0100
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139]) by
 IRSMSX606.ger.corp.intel.com ([163.33.146.139]) with mapi id 15.01.1713.004;
 Wed, 17 Jun 2020 12:08:51 +0100
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Justin Thaler <thalerj@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Patch for telemetry design
Thread-Topic: Patch for telemetry design
Thread-Index: AdZDwKBuVxBSuCDdS16VHQTaIqereAAP6pkAACRONaA=
Date: Wed, 17 Jun 2020 11:08:51 +0000
Message-ID: <4a96dba004a84736b45771afbc68d35d@intel.com>
References: <8428bc15cb234328a6148d47eb2581c6@intel.com>
 <db250ff2-db9b-5297-31bd-fcae911aab25@linux.vnet.ibm.com>
In-Reply-To: <db250ff2-db9b-5297-31bd-fcae911aab25@linux.vnet.ibm.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [163.33.253.164]
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

SGkgSnVzdGluLCANCg0KPkkndmUgdGFrZW4gYSByZWFkIHRocm91Z2ggdGhlIGRlc2lnbiBwcm9w
b3NhbCBhcyBtb3JlIG9mIGEgY2xpZW50IG9mIHRoZSB0ZWxlbWV0cnkgZGF0YS4gSSBsaWtlIHRo
aXMgcHJvcG9zYWwgcXVpdGUgYSBiaXQgYXMgaXQgaXMgcHJldHR5IGNsZWFyLiBJIGhhZCBhIGNv
dXBsZSBvZiA+cXVlc3Rpb25zIGFuZCBnaXZlbiB0aGUgYnJvYWQgbGV2ZWwsIEkgd2Fzbid0IHN1
cmUgaWYgZ2Vycml0IHdhcyB0aGUgcmlnaHQgcGxhY2UgZm9yIHRoZW0uDQoNCkluIGZhY3QsIHRo
aXMgcGF0Y2ggaXMgY292ZXJpbmcgZmV3IGNoYW5nZXMgdGhhdCB3ZSd2ZSBtYWRlIHRvIEQtQnVz
IEFQSSBkdXJpbmcgdGhlIGRldmVsb3BtZW50IGFuZCBpbnRlZ3JhdGlvbi4gDQoNCj5PbiBUaW1l
c3RhbXBzLCBhcmUgdGhlIHRpbWVzdGFtcHMgZG9uZSBwZXIgbWV0cmljKHNlbnNvciByZWFkaW5n
KSBvciBwZXIgcmVwb3J0LiBUaGlzIHdhc24ndCBjbGVhciB0byBtZSBmcm9tIHRoZSBkZXNpZ24g
cHJvcG9zYWwsIGFuZCBhbHNvIGl0IHdhcyBoYXJkIHRvID50ZWxsIHdoZXJlIHRoZSB0aW1lc3Rh
bXAgd2FzIGJlaW5nIHNldC4NCg0KVGltZXN0YW1wcyBhcmUgZ2F0aGVyZWQgZm9yIGJvdGgsIG1l
dHJpY3MgYW5kIHJlcG9ydC4gVGltZXN0YW1wIGZvciBtZXRyaWMgaXMgdGhlIHRpbWVzdGFtcCBv
ZiBELUJ1cyBzZW5vciB1cGRhdGUsIHdoaWxlIHRpbWVzdGFtcCBvZiB0aGUgcmVwb3J0IGlzIGZv
ciB0aGUgcmVwb3J0IHVwZGF0ZS4gSXQgY29ycmVzcG9uZHMgd2l0aCB0aGUgUmVkZmlzaCBNZXRy
aWMgUmVwb3J0IHJlc291cmNlLCB3aGVyZSBib3RoLCBpbmRpdmlkdWFsIG1ldHJpY3MgYW5kIHRo
ZSB3aG9sZSByZXBvcnQgaGF2ZSB0aGVpciB1cGRhdGUgdGltZXN0YW1wcy4gDQoNCj5Gcm9tIHRo
ZSBwZXJmb3JtYW5jZSB0ZXN0cyBzZWN0aW9uLCBpcyB0aGVyZSBhIGxpbWl0IG9uIHRoZSBudW1i
ZXIgb2Ygc2Vuc29ycyBwZXIgcmVwb3J0LCBzZWVtaW5nbHkgaXQgaXMgMTAsIG9yIHdhcyB0aGlz
IGRvbmUgdG8gc2ltcGxpZnkgdGhlIHBlcmZvcm1hbmNlID50ZXN0aW5nPw0KDQpJdCB3YXMgZG9u
ZSBiZWNhdXNlIG9mIGxpbWl0ZWQgc2Vuc29ycyBzdXBwb3J0IG9uIHRoZSB0ZXN0IHBsYXRmb3Jt
Lg0KDQo+VGhlIG90aGVyIGdlbmVyYWwgcXVlc3Rpb24gSSBoYWQgd2FzIGFyb3VuZCB0aGUgYW1v
dW50IG9mIGRhdGEgYmVpbmcgdHJhbnNtaXR0ZWQuIEZvciBpbnN0YW5jZSwgaWYgeW91J3JlIGdl
dHRpbmcgcmVwb3J0cyBvbiBldmVyeSBzZW5zb3IgaW4gdGhlIHN5c3RlbSA+KDEwMHMpIHRoZSBy
ZXBvcnQocykgY291bGQgYmUgaHVnZSBhdCBzY2FsZS4gV291bGQgdGhlcmUgYmUgYW4gb3B0aW9u
IG9mIGNvbnNpZGVyaW5nIGNvbXByZXNzZWQgZGF0YSBsaWtlIEJFSlNPTj8gT3IgaXMgdGhpcyBm
ZWVkYmFjayB0aGF0IHNob3VsZCBnbyB0byB0aGUgPkRNVEY/DQoNCkZpcnN0IG9mIGFsbCwgdGhl
IG1heCBudW1iZXIgb2Ygc3VwcG9ydGVkIHJlcG9ydHMgd2lsbCBiZSBsaW1pdGVkIHRvIGFyb3Vu
ZCA1MCBkdWUgdG8gbGltaXRlZCBCTUMgcmVzb3VyY2VzLiBBcyBmb3IgdGhlIHVzaW5nIGNvbXBy
ZXNzZWQgZGF0YSwgaWYgd2Ugd291bGQgbGlrZSB0byBjb21wcmVzcyBkYXRhIGZvciB0aGUgSVBD
IChELUJ1cykgaXQgaXMgcG9zc2libGUgZm9yIHVzIHRvIGltcGxlbWVudCBhbnkgZm9ybWF0IHdl
IGxpa2UgYXMgbG9uZyBhcyB3ZSBkb2N1bWVudCBpdCBpbiB0aGUgZGVzaWduLiBBcyBmb3IgdGhl
IHVzaW5nIGNvbXByZXNzZWQgZm9ybWF0IGZvciB0aGUgUmVkZmlzaCBNZXRyaWMgcmVwb3J0IGl0
IHdpbGwgcmVxdWlyZSBhY2NlcHRhbmNlIGZyb20gdGhlIERNVEYsIGJlY2F1c2UgaXQgd2lsbCBy
ZXF1aXJlIGNoYW5nZXMgaW4gdGhlIHNjaGVtYS4gDQpZb3Ugd2VyZSByZWZlcnJpbmcgdG8gdXNp
bmcgQlNPTiBvbiBELUJ1cyBvciBpbiBSZWRmaXNoIE1ldHJpYyBSZXBvcnQgc2NoZW1hPw0KDQpQ
aW90ciBNYXR1c3pjemFrDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkludGVsIFRlY2hub2xvZ3kgUG9sYW5kIHNw
LiB6IG8uby4gDQp1bC4gU2xvd2Fja2llZ28gMTczLCA4MC0yOTggR2RhbnNrDQpLUlMgMTAxODgy
DQpOSVAgOTU3LTA3LTUyLTMxNg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
b3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3Bpb3RyLm1hdHVzemN6YWs9aW50ZWwuY29tQGxpc3Rz
Lm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBKdXN0aW4gVGhhbGVyDQpTZW50OiBUdWVzZGF5LCBK
dW5lIDE2LCAyMDIwIDg6MDUgUE0NClRvOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1Ympl
Y3Q6IFJlOiBQYXRjaCBmb3IgdGVsZW1ldHJ5IGRlc2lnbg0KDQpIaSBQaW90ciwNCglJJ3ZlIHRh
a2VuIGEgcmVhZCB0aHJvdWdoIHRoZSBkZXNpZ24gcHJvcG9zYWwgYXMgbW9yZSBvZiBhIGNsaWVu
dCBvZiB0aGUgdGVsZW1ldHJ5IGRhdGEuIEkgbGlrZSB0aGlzIHByb3Bvc2FsIHF1aXRlIGEgYml0
IGFzIGl0IGlzIHByZXR0eSBjbGVhci4gSSBoYWQgYSBjb3VwbGUgb2YgcXVlc3Rpb25zIGFuZCBn
aXZlbiB0aGUgYnJvYWQgbGV2ZWwsIEkgd2Fzbid0IHN1cmUgaWYgZ2Vycml0IHdhcyB0aGUgcmln
aHQgcGxhY2UgZm9yIHRoZW0uDQoNCk9uIFRpbWVzdGFtcHMsIGFyZSB0aGUgdGltZXN0YW1wcyBk
b25lIHBlciBtZXRyaWMoc2Vuc29yIHJlYWRpbmcpIG9yIHBlciByZXBvcnQuIFRoaXMgd2Fzbid0
IGNsZWFyIHRvIG1lIGZyb20gdGhlIGRlc2lnbiBwcm9wb3NhbCwgYW5kIGFsc28gaXQgd2FzIGhh
cmQgdG8gdGVsbCB3aGVyZSB0aGUgdGltZXN0YW1wIHdhcyBiZWluZyBzZXQuDQoNCiBGcm9tIHRo
ZSBwZXJmb3JtYW5jZSB0ZXN0cyBzZWN0aW9uLCBpcyB0aGVyZSBhIGxpbWl0IG9uIHRoZSBudW1i
ZXIgb2Ygc2Vuc29ycyBwZXIgcmVwb3J0LCBzZWVtaW5nbHkgaXQgaXMgMTAsIG9yIHdhcyB0aGlz
IGRvbmUgdG8gc2ltcGxpZnkgdGhlIHBlcmZvcm1hbmNlIHRlc3Rpbmc/DQoNClRoZSBvdGhlciBn
ZW5lcmFsIHF1ZXN0aW9uIEkgaGFkIHdhcyBhcm91bmQgdGhlIGFtb3VudCBvZiBkYXRhIGJlaW5n
IHRyYW5zbWl0dGVkLiBGb3IgaW5zdGFuY2UsIGlmIHlvdSdyZSBnZXR0aW5nIHJlcG9ydHMgb24g
ZXZlcnkgc2Vuc29yIGluIHRoZSBzeXN0ZW0gKDEwMHMpIHRoZSByZXBvcnQocykgY291bGQgYmUg
aHVnZSBhdCBzY2FsZS4gV291bGQgdGhlcmUgYmUgYW4gb3B0aW9uIG9mIGNvbnNpZGVyaW5nIGNv
bXByZXNzZWQgZGF0YSBsaWtlIEJFSlNPTj8gT3IgaXMgdGhpcyBmZWVkYmFjayB0aGF0IHNob3Vs
ZCBnbyB0byB0aGUgRE1URj8NCg0KVGhhbmtzLA0KSnVzdGluIFRoYWxlcg0KSUJNIFJBUyBFbmdp
bmVlcg0KDQpPbiA2LzE2LzIwIDQ6MzEgQU0sIE1hdHVzemN6YWssIFBpb3RyIHdyb3RlOg0KPiBI
aSwNCj4gDQo+IEkndmUgdXBsb2FkZWQgcGF0Y2ggZm9yIHRlbGVtZXRyeSBzZXJ2aWNlIGRlc2ln
biBzb21lIHRpbWUgYWdvLiBJIHdvdWxkIGxpa2UgdG8gYXNrIHlvdSBmb3IgcmV2aWV3Lg0KPiBo
dHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9kb2NzLysvMzE2OTAN
Cj4gDQo+IA0KPiBQaW90ciBNYXR1c3pjemFrDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBJbnRlbCBUZWNo
bm9sb2d5IFBvbGFuZCBzcC4geiBvLm8uDQo+IHVsLiBTbG93YWNraWVnbyAxNzMsIDgwLTI5OCBH
ZGFuc2sNCj4gS1JTIDEwMTg4Mg0KPiBOSVAgOTU3LTA3LTUyLTMxNg0KPiANCg==
