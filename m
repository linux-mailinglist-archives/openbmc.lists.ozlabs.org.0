Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C65911B7304
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 13:25:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497sKr6nf1zDr88
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 21:25:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 497sJy1kxWzDr7h
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 21:24:40 +1000 (AEST)
IronPort-SDR: UHQ8toukTYv64qJUpN7LLmb+O9FTa0KAo+e3ViAGIFuORJOK/L4z2SKF7j1tcn/lkF/DmdmUG9
 9Vyo1DmYBZpw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 04:24:18 -0700
IronPort-SDR: BGUDaaE/UZ5t2VDWnHdoJTTvBDiy8urz4KQJ9o9Q704wyMaqFSRf4d3/0NOVxgzZ0EeiFGwaKO
 +uYGPGfoDYCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,311,1583222400"; d="scan'208";a="292608501"
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
 by orsmga008.jf.intel.com with ESMTP; 24 Apr 2020 04:24:16 -0700
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 IRSMSX108.ger.corp.intel.com (163.33.3.3) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 24 Apr 2020 12:22:03 +0100
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 24 Apr 2020 12:22:03 +0100
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139]) by
 IRSMSX606.ger.corp.intel.com ([163.33.146.139]) with mapi id 15.01.1713.004;
 Fri, 24 Apr 2020 12:22:03 +0100
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>,
 =?utf-8?B?QWRyaWFuIEFtYnJvxbxld2ljeg==?=
 <adrian.ambrozewicz@linux.intel.com>, Richard Hanley <rhanley@google.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Subject: RE: [ExternalEmail] Re: Sensor history
Thread-Topic: [ExternalEmail] Re: Sensor history
Thread-Index: AQHWBs4VmN6lX3CS6Uq7IxtJ4cK5Bahy18aAgASxEQCAAXbpgIAAG/QAgADB7gCAABtAAIAOTe7Q
Date: Fri, 24 Apr 2020 11:22:02 +0000
Message-ID: <ad63e2f0c0d8423388ee5cfcb9d39380@intel.com>
References: <EED5BF91-4AE9-4B5A-BE68-BAE3D93C3704@fb.com>
 <20200410210033.GA9295@mauery.jf.intel.com>
 <85700953-1CBE-4DFB-9A5B-AF64B9735735@fuzziesquirrel.com>
 <A785371B-1AD2-45E0-AD62-60C7E8B2C69D@fb.com>
 <CAH1kD+b4GQFs_V13APk8123dc_vL0GVxXwZLx6pPdUHiKodZRA@mail.gmail.com>
 <bbd70c99-dc36-7d2b-ef25-a17108be8de0@linux.intel.com>
 <SN6PR13MB2480B3B7DED9EC3C8163E659EDDB0@SN6PR13MB2480.namprd13.prod.outlook.com>
In-Reply-To: <SN6PR13MB2480B3B7DED9EC3C8163E659EDDB0@SN6PR13MB2480.namprd13.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksIA0KDQpJIHdvdWxkIGxpa2UgdG8gdXBsb2FkIGEgcGF0Y2ggZm9yIHRoZSB0ZWxlbWV0cnkg
ZG9jdW1lbnRhdGlvbiB0aGF0IGFkZHJlc3NlcyB0aGUgcmVwb3J0IHN0b3JhZ2UgaW4gbm9uLXZv
bGF0aWxlIG1lbW9yeSBhbmQgc29tZSBELUJ1cyBBUEkgZXh0ZW5zaW9ucyBmb3IgYmV0dGVyIGFs
aWdubWVudCB3aXRoIHRoZSBSZWRmaXNoIFRlbGVtZXRyeSBTZXJ2aWNlLiBUaGUgY2hhbmdlcyBh
cmUgcmVzdWx0cyBvZiBpbnRlZ3JhdGlvbiB3aXRoIHRoZSBFdmVudCBTZXJ2aWNlLiANCg0KUGlv
dHIgTWF0dXN6Y3phaw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpJbnRlbCBUZWNobm9sb2d5IFBvbGFuZCBzcC4g
eiBvLm8uIA0KdWwuIFNsb3dhY2tpZWdvIDE3MywgODAtMjk4IEdkYW5zaw0KS1JTIDEwMTg4Mg0K
TklQIDk1Ny0wNy01Mi0zMTYNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9w
ZW5ibWMgPG9wZW5ibWMtYm91bmNlcytwaW90ci5tYXR1c3pjemFrPWludGVsLmNvbUBsaXN0cy5v
emxhYnMub3JnPiBPbiBCZWhhbGYgT2YgVHJveS5MZWVAdmVydGl2LmNvbQ0KU2VudDogV2VkbmVz
ZGF5LCBBcHJpbCAxNSwgMjAyMCAxMTo1MyBBTQ0KVG86IEFkcmlhbiBBbWJyb8W8ZXdpY3ogPGFk
cmlhbi5hbWJyb3pld2ljekBsaW51eC5pbnRlbC5jb20+OyBSaWNoYXJkIEhhbmxleSA8cmhhbmxl
eUBnb29nbGUuY29tPjsgVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+DQpDYzogVmVy
bm9uIE1hdWVyeSA8dmVybm9uLm1hdWVyeUBsaW51eC5pbnRlbC5jb20+OyBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc7IEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+DQpT
dWJqZWN0OiBSRTogW0V4dGVybmFsRW1haWxdIFJlOiBTZW5zb3IgaGlzdG9yeQ0KDQpBZHJpYW4s
DQoNClRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCg0KVGhhbmtzDQpUcm95IExlZQ0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3Ryb3ku
bGVlPXZlcnRpdi5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIEFkcmlhbiBBbWJy
bz9ld2ljeg0KU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxNSwgMjAyMCA0OjE1IFBNDQpUbzogUmlj
aGFyZCBIYW5sZXkgPHJoYW5sZXlAZ29vZ2xlLmNvbT47IFZpamF5IEtoZW1rYSA8dmlqYXlraGVt
a2FAZmIuY29tPg0KQ2M6IFZlcm5vbiBNYXVlcnkgPHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwu
Y29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6
emllc3F1aXJyZWwuY29tPg0KU3ViamVjdDogW0V4dGVybmFsRW1haWxdIFJlOiBTZW5zb3IgaGlz
dG9yeQ0KDQpUZWxlbWV0cnlTZXJ2aWNlIGlzIGN1cnJlbnRseSBpbiBkZXZlbG9wbWVudC4NCg0K
SW50ZWdyYXRpb24gd2l0aCBFdmVudFNlcnZpY2Ugd2FzIHRlc3RlZCBhbmQgcHJvdmVkIHRvIHdv
cmsgZmluZS4gSW50ZWwgaGF2ZSBwcmVwYXJlZCBkZW1vIGZvciAyMDIwIFZpcnR1YWwgT0NQIFN1
bW1pdCBpZiB5b3UgYXJlIHdpbGxpbmcgdG8gaGF2ZSBzb21lIGluc2lnaHQgYWJvdXQgdXNlIGNh
c2VzLg0KDQpXZSBzaG91bGQgZXhwZWN0IHNvbHV0aW9uIHRvIHN0YXJ0IGFwcGVhcmluZyBpbiB1
cHN0cmVhbSBzb29uZXIgdGhhbiBsYXRlciBhcyBmZWF0dXJlIGlzIGFsbW9zdCBjb21wbGV0ZSAt
IGl0IHJlcXVpcmVzIGxlZ2FsIGlzc3VlcyB0byBiZSBzb3J0ZWQgb3V0Lg0KDQpSZWdhcmRzLA0K
QWRyaWFuDQoNClcgZG5pdSA0LzE0LzIwMjAgbyAyMjo0MSwgUmljaGFyZCBIYW5sZXkgcGlzemU6
DQo+PiBIaSBUZWFtLA0KPj4NCj4+IFRoZXJlIGlzIGEgdGVsZW1ldHJ5IHByb3Bvc2FsIGluIGRv
Y3MgYW5kIHJlcG9zaXRvcnkuDQo+PiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Js
b2IvbWFzdGVyL2Rlc2lnbnMvdGVsZW1ldHJ5Lm1kDQo+PiBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy90ZWxlbWV0cnkNCj4gID4gVGhlIHByb3Bvc2FsIHNlZW1zIHByb21pc2luZyBhbmQgY29t
cGxldGUuDQo+ICA+IFdoYXQgaXMgdGhlIGltcGxlbWVudGF0aW9uIHN0YXR1cz8NCj4NCj4gSSdt
IGFsc28gY3VyaW91cyBhYm91dCBhIHN0YXR1cyB1cGRhdGUgaGVyZS4gIFdlcmUgdGhlcmUgYW55
IGRlc2lnbiANCj4gaXNzdWVzIHRoYXQgbmVlZGVkIHRvIGJlIHdvcmtlZCBvdXQsIG9yIGlzIGl0
IHJlYWR5IHRvIGRldmVsb3A/DQo+DQo+Pj4gICAgVG8gaW1wbGVtZW50IHRoZSBSZWRmaXNoIFRl
bGVtZXRyeSBzZXJ2aWNlIHdvdWxkIHdlIG5lZWQgdG8gc3RvcmUgDQo+Pj50aGVtIG9uDQo+Pj4g
ICAgdGhlIEJNQyBhcyB3ZWxsPw0KPiAgPkl0IHdpbGwgYmUgbmljZSBpZiB3ZSBjYW4gc3RvcmUg
aXQgaW4gUkFNIGF0IGxlYXN0IHdpdGggbGFyZ2VyIGRhdGEgDQo+IGFuZCBzb21lIGRpc2tzcGFj
ZSAgPldpdGggc21hbGwgbG9nIHJvdGF0ZS4NCj4NCj4gVGhlIFRlbGVtZXRyeSBTZXJ2aWNlIGFs
cmVhZHkgaGFzIGEgY29uY2VwdCBvZiBsb2cgcm90YXRpb24sIGJ1dCANCj4gb3ZlcmFsbCBJIGFn
cmVlIHRoYXQgc3RvcmluZyBpbiBSQU0gZmlyc3Qgd2l0aCBvcHRpb25hbCBwZXJzaXN0ZW5jZSBp
cyANCj4gYmV0dGVyIHRoYW4gdGhlIG90aGVyIHdheSBhcm91bmQuDQo+IC0gUmljaGFyZA0KQ09O
RklERU5USUFMSVRZIE5PVElDRTogVGhpcyBlLW1haWwgYW5kIGFueSBmaWxlcyB0cmFuc21pdHRl
ZCB3aXRoIGl0IGFyZSBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1
YWwgb3IgZW50aXR5IHRvIHdob20gdGhleSBhcmUgYWRkcmVzc2VkIGFuZCBtYXkgY29udGFpbiBj
b25maWRlbnRpYWwgYW5kIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gcHJvdGVjdGVkIGJ5IGxhdy4g
SWYgeW91IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBhbnkgcmV2aWV3LCB1c2UsIGRp
c3NlbWluYXRpb24sIGRpc3RyaWJ1dGlvbiwgb3IgY29weWluZyBvZiB0aGUgZS1tYWlsIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQuIFBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBi
eSByZXR1cm4gZS1tYWlsIGFuZCBkZWxldGUgYWxsIGNvcGllcyBmcm9tIHlvdXIgc3lzdGVtLg0K
