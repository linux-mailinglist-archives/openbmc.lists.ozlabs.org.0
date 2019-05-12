Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9327F1C056
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 03:24:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4530NL4nvyzDqJN
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 11:24:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4529gY43M2zDqJ5
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 03:20:02 +1000 (AEST)
Received: from NTILML02.nuvoton.com (212.199.177.21.static.012.net.il
 [212.199.177.21])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x4CHJln0019302
 for <openbmc@lists.ozlabs.org>; Sun, 12 May 2019 20:19:47 +0300
Received: from NTILML02.nuvoton.com (10.190.1.46) by NTILML02.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Sun, 12 May
 2019 20:19:46 +0300
Received: from NTILML02.nuvoton.com ([::1]) by NTILML02.nuvoton.com ([::1])
 with mapi id 15.00.1130.005; Sun, 12 May 2019 20:19:46 +0300
From: <tomer.maimon@nuvoton.com>
To: <joel@jms.id.au>
Subject: RE: Moving kernel to 5.1
Thread-Topic: Moving kernel to 5.1
Thread-Index: AQHVBXhJ8svVcELBDkig3D3KSViQqaZhkVQAgAIYxoCABBbBYA==
Date: Sun, 12 May 2019 17:19:46 +0000
Message-ID: <b211f8797d984e45bc50f65547863a39@NTILML02.nuvoton.com>
References: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
 <9a1adf03-ee54-0674-54bc-d5c37a9ae516@linux.intel.com>
 <CACPK8XfQVySsmzUGLenPA5cM2AdCfgTzf1hO2cbqg1_D62tK8w@mail.gmail.com>
In-Reply-To: <CACPK8XfQVySsmzUGLenPA5cM2AdCfgTzf1hO2cbqg1_D62tK8w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.191.10.124]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 May 2019 11:23:06 +1000
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
Cc: openbmc@lists.ozlabs.org, jae.hyun.yoo@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LCB3ZSB3ZXJlIG9uIGhvbGlkYXku
DQoNCldlIGhhZCBjaGVja2VkIGRldi01LjEgb24gTnV2b3RvbiBOUENNNzUwIEVWQiBhbmQgaXQg
bG9va3MgZmluZS4NClRoZXJlIGlzIGEgbWlub3IgY2hhbmdlIHRoYXQgbmVlZCB0byBkb25lIGlu
IHRoZSBzcGkgbm9kZSBpbiB0aGUgZHRzIGZpbGUuDQoNCkFib3V0IE51dm90b24gZHJpdmVyczoN
CjEuIEV0aGVybmV0IG1hYyAoRU1DKSAtIG9uIHdvcmssIGhvcGVmdWxseSBmaXJzdCB1cHN0cmVh
bSB2ZXJzaW9uIHdpbGwgc2VudCBzb29uLg0KMi4gSTJDIC0gb24gdXBzdHJlYW0gcHJvY2Vzcywg
dGhlIG1haW50YWluZXIgaGF2ZSBub3Qgc2VuZCBmZWVkYmFjayB5ZXQuDQozLiBQQ0kgbWFpbGJv
eCAtIGNhbm5vdCB1cHN0cmVhbSwgaXQgdGhlIHNhbWUgcmVhc29uIGFzIEFzcGVlZC4NCjQuIEJJ
T1MgcG9zdCBjb2RlIC0gb24gdXBzdHJlYW0gcHJvY2VzcywgdGhlIG1haW50YWluZXIgaGF2ZSBu
b3Qgc2VuZCBmZWVkYmFjayB5ZXQuDQo1LiBTUEktTk9SIC0gaG9wZWZ1bGx5IGZpcnN0IHVwc3Ry
ZWFtIHZlcnNpb24gdG8gU1BJIHdpbGwgc2VudCBzb29uLg0KDQpUaGFua3MsDQoNClRvbWVyDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1Pg0KU2VudDogRnJpZGF5LCAxMCBNYXkgMjAxOSA4OjQ2DQpUbzogSmFlIEh5dW4gWW9v
IDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPg0KQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IElTMjAgVG9tZXIgTWFpbW9uIDx0b21lci5tYWltb25A
bnV2b3Rvbi5jb20+DQpTdWJqZWN0OiBSZTogTW92aW5nIGtlcm5lbCB0byA1LjENCg0KT24gV2Vk
LCA4IE1heSAyMDE5IGF0IDIxOjQ1LCBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5p
bnRlbC5jb20+IHdyb3RlOg0KPg0KPiBPbiA1LzgvMjAxOSAxOjI5IEFNLCBKb2VsIFN0YW5sZXkg
d3JvdGU6DQo+ID4gSGVsbG8gT3BlbkJNQyBkZXZlbG9wZXJzLA0KPiA+DQo+ID4gTGludXggNS4x
IHdhcyB0YWdnZWQgYSBmZXcgZGF5cyBhZ28uIEkndmUgcmViYXNlZCB0aGUgb3BlbmJtYyB0cmVl
DQo+ID4gb24gdGhpcyByZWxlYXNlIGFuZCBwdXNoZWQgYSBkZXYtNS4xIGJyYW5jaCB0byBnaXRo
dWIuDQo+ID4NCj4gPiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQgdGhlIGJ1bXAgY29tbWl0LCBnaXZl
IGl0IGEgc3BpbiBvbiB5b3VyDQo+ID4gaGFyZHdhcmUsIGFuZCArMSBpZiBpdCBsb29rcyBnb29k
IHRvIHlvdToNCj4gPg0KPiA+DQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29t
L3YyL3VybD91PWh0dHBzLTNBX19nZXJyaXQub3BlbmJtYy0NCj4gPiAyRHByb2plY3QueHl6X2Nf
b3BlbmJtY19tZXRhLTJEYXNwZWVkXy0yQl8yMTIxMiZkPUR3SUJhUSZjPXVlOG1POHpnQw0KPiA+
IDRWWjRxX2FOVkt0OEc5TUMwMVVGRG1pc3ZNUjFrLUVvRE0mcj1XSlctdlBGTlRjZktIYjQydlRj
NHkzSUJRN2FraEk3DQo+ID4gd0MxMU84Rm4wZjdNJm09aGJ6TTEyaFFVRWlSRzNLQ21xam92azBJ
ZE44Q1NMV1FXeTAxQTlVdE5jayZzPVZ0ZUJVWG0NCj4gPiBYTGFhcVpWZmlEbDVtNHJZTXp5MDlT
ekEydlFCcHR3RFc1Y3MmZT0NCj4NCj4gSW50ZWwgcGxhdGZvcm1zIGJvb3RlZCB3ZWxsLiBUaGFu
a3MgYSBsb3QhDQoNClRoYW5rcyB0byBKYWUsIFRhbyBhbmQgUGF0cmljayBmb3IgdGhlIHRlc3Rp
bmcuIEdlb3JnZSBhbHNvIHRlc3RlZCBXaXRoZXJzcG9vbiBhbmQgcmVwb3J0ZWQgYWxsIGdvb2Qu
DQoNCldlJ3ZlIG5vdyBtZXJnZWQgdGhlIGJ1bXAgZm9yIHRoZSBhc3BlZWQga2VybmVsIGludG8g
bWFzdGVyLg0KDQpOdXZvdG9uIHdpbGwgYmUgbWVyZ2VkIG9uY2Ugc29tZW9uZSB3aXRoIGhhcmR3
YXJlIHJlcG9ydHMgaW4uDQoNCkNoZWVycywNCg0KSm9lbA0KDQoNCj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0NClRoZSBwcml2aWxlZ2VkIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBlbWFpbCBpcyBpbnRlbmRlZCBmb3IgdXNlIG9ubHkgYnkgdGhl
IGFkZHJlc3NlZXMgYXMgaW5kaWNhdGVkIGJ5IHRoZSBvcmlnaW5hbCBzZW5kZXIgb2YgdGhpcyBl
bWFpbC4gSWYgeW91IGFyZSBub3QgdGhlIGFkZHJlc3NlZSBpbmRpY2F0ZWQgaW4gdGhpcyBlbWFp
bCBvciBhcmUgbm90IHJlc3BvbnNpYmxlIGZvciBkZWxpdmVyeSBvZiB0aGUgZW1haWwgdG8gc3Vj
aCBhIHBlcnNvbiwgcGxlYXNlIGtpbmRseSByZXBseSB0byB0aGUgc2VuZGVyIGluZGljYXRpbmcg
dGhpcyBmYWN0IGFuZCBkZWxldGUgYWxsIGNvcGllcyBvZiBpdCBmcm9tIHlvdXIgY29tcHV0ZXIg
YW5kIG5ldHdvcmsgc2VydmVyIGltbWVkaWF0ZWx5LiBZb3VyIGNvb3BlcmF0aW9uIGlzIGhpZ2hs
eSBhcHByZWNpYXRlZC4gSXQgaXMgYWR2aXNlZCB0aGF0IGFueSB1bmF1dGhvcml6ZWQgdXNlIG9m
IGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBvZiBOdXZvdG9uIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQ7IGFuZCBhbnkgaW5mb3JtYXRpb24gaW4gdGhpcyBlbWFpbCBpcnJlbGV2YW50IHRvIHRoZSBv
ZmZpY2lhbCBidXNpbmVzcyBvZiBOdXZvdG9uIHNoYWxsIGJlIGRlZW1lZCBhcyBuZWl0aGVyIGdp
dmVuIG5vciBlbmRvcnNlZCBieSBOdXZvdG9uLg0K
