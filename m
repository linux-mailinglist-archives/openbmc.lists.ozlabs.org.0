Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E902BEC076
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 10:24:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474Gwh74zrzF6gD
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 20:24:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=201f8f3f1=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 474Gvw0HFRzF6V5
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 20:23:35 +1100 (AEDT)
IronPort-SDR: 04MqLJohD7Rj8SJfi7tugvBP4ga3+nx3D+AF49d2hREy6dxbmsA13ntIPuLxx6Mkn/HORkVXo6
 H6hF6f4Q9jcw==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 01 Nov 2019 17:23:30 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 1 Nov 2019
 17:23:27 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Fri, 1 Nov 2019 17:23:27 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "mutyalax.jayaprakash@intel.com" <mutyalax.jayaprakash@intel.com>
Subject: RE: Showing signed sensor value when the command "ipmitool sdr" is
 executed.
Thread-Topic: Showing signed sensor value when the command "ipmitool sdr" is
 executed.
Thread-Index: AdWJQxVOJ6ixmrlwSXKaTONZZXz7UQHUK33A
Date: Fri, 1 Nov 2019 09:23:27 +0000
Message-ID: <bc2c7a6d88654d2fa33ad03084160bbc@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25014.006
x-tm-as-result: No-10--6.764600-5.000000
x-tmase-matchedrid: a3sLnpBpvfTUL3YCMmnG4hvgzEPRJaDEWw/S0HB7eoMTiSW9r3PknEfj
 d+aXilyPcz51x1l2sWqWRrFafMg9IqPn/MZq9jbtZj7E6vHnuNYGchEhVwJY32KuDy0kKGx0/pE
 4pKve7n/3yiqO1llPS3Nyq0Gwang33FeDc6zNiLEBnSWdyp4eoaizFDHVmY+j31mPd8OfRg71Yg
 vxvp++iXmXGiy04R+tmvgss00VvY2i1w0PYZvqFLU+IyHhkXf1W1eClGWYNyhvbqBDKETkeoXvt
 eZ/aS6ReX/L2MY3Fxr/xE9lptDOpaLdtSd6djXdvoQkZKo949P4qCLIu0mtILeMU2j6emqfLg4a
 EfqmR9fglM4gIqfe3RP+4hrT4NGjxjOi8n/dz9t2GcWKGZufBRiDIOPlOJG1K67xqaKqOgr0xDH
 gmWScfu2Ww5iUF/vPmyiLZetSf8my5/tFZu9S3N7f/25JKIC+qaa2PjMPevXEQdG7H66TyND1NE
 3SaFLXsIGGWDbANqckWCl/ZWNPULrHZ9K7wyn73lGEYg54uw7AhiGL9yyEZmrqvyZBrtdYTIux9
 /YvXVXpPckQarJKcPhPtGMvBKPo39InOc4KUjGgIAoCghvZZgz+8rPHUa6xHcvjWJiii5nxeUDt
 pfRpDQ==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--6.764600-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25014.006
x-tm-snts-smtp: D00A4D4BADA9A4285E0699DA9BC08CB9E2E71D0FA0640CC4897141E17402DC4F2000:B
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?big5?B?QnVkZHkgSHVhbmcgKLbApNHCRSk=?= <Buddy.Huang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgamF5YXByYWthc2gsDQoNCkkgZm91bmQgdGhlIGZvbGxvd2luZyBwcm9ibGVtOg0KSWYgdGhl
IHNlbnNvciBpcyBkaXNjcmV0ZSBhbmQgdGhlIHNlbnNvclJlYWRpbmdUeXBlIGlzIDB4NkYsDQp0
aGUgc2Vuc29yIHdpbGwgYmVjb21lICJkaXNhYmxlZCIgd2hlbiB0aGUgY29tbWFuZCAiaXBtaXRv
b2wgc2RyIGVsaXN0IiBpcyBleGVjdXRlZC4NCkJlY2F1c2Ugbm8gbWF0dGVyIHdoYXQgc2Vuc29y
IHR5cGUgaXQgaXMsIHRoZSBwcmV2aW91cyBjb2RlIHdpbGwgZXZlbnR1YWxseSBlbmFibGUgc2Nh
bm5pbmcuDQpCdXQgbm93IGl0IHNlZW1zIHRvIGZvcmdldCB0byBlbmFibGUgc2Nhbm5pbmcgd2hl
biB0aGUgc2Vuc29yIGlzIGRpc2NyZXRlIChhc3NlcnRpb24pLg0KDQpBbHNvLCB3aGVuIHRoZSBz
ZW5zb3IgdmFsdWUgaXMgbmVnYXRpdmUgaW4gZC1idXMsIHRoZSBzZW5zb3IgcmVhZGluZyB3aWxs
IGJlIDAuDQpGaXggaXQgYnkgdXNpbmcgYSBpbnQzMl90IGFuZCBhZGQgYW4gb3ZlcmZsb3cgY2hl
Y2suDQogDQoic2Vuc29yX3VuaXRzXzEiLCBkZWZpbmVkIGJ5IGlwbWkgU1BFQyAiVGFibGUgNDMt
LCBGdWxsIFNlbnNvciBSZWNvcmQgLSBTRFIgVHlwZSAwMWgiIGJ5dGUgMjEsICJTZW5zb3IgVW5p
dHMgMSIuIA0KQ3VycmVudGx5LCAic2Vuc29yX3VuaXRzXzEiIGlzIGFsd2F5cyBzZXQgdG8gMCwg
c28gdGhlIHNpZ25lZCBzZW5zb3IgdmFsdWUgY2Fubm90IGJlIGRpc3BsYXllZCANCndoZW4gdGhl
IGNvbW1hbmQgImlwbWl0b29sIHNkciIgaXMgZXhlY3V0ZWQuIFRvIHN1cHBvcnQgdGhhdCwgd2Ug
YWRkIHRoZSBhdHRyaWJ1dGUgInNlbnNvclVuaXRzMSIgdG8gdGhlDQpzZW5zb3IgbWFwcGluZyB5
YW1sIHRoYXQgaXQgY2FuIGJlIHVzZWQgdG8gZGV0ZXJtaW5lIGlmIHRoZSBzZW5zb3IgaXMgYSBz
aWduZWQgdmFsdWUuDQoNCkluIGNvbmNsdXNpb24sIEkndmUgbW9kaWZpZWQgaXQgaW4gDQpodHRw
czovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9waG9zcGhvci1ob3N0LWlw
bWlkLysvMjY3NTQNCg0KSWYgeW91IGNhbiBnaXZlIG1lIHNvbWUgY29tbWVudHMgdGhhdCB3b3Vs
ZCBiZSBncmVhdC4NCg0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMsDQpUb255DQoNCj4gSGkgdGVhbSwN
Cj4gDQo+IFRoZSB0ZW1wZXJhdHVyZSBzZW5zb3IgdmFsdWUgbWF5IGJlIG5lZ2F0aXZlIHdoZW4g
dGhlIGNvbW1hbmQgImlwbWl0b29sDQo+IHNkciIgaXMgZXhlY3V0ZWQuDQo+IFNlbnNvciB2YWx1
ZSBjYW4gYmUgYSBzaWduZWQgdmFsdWUgYWNjb3JkaW5nIHRvIGlwbWkgU1BFQyAiVGFibGUgNDMt
LCBGdWxsDQo+IFNlbnNvciBSZWNvcmQgLSBTRFIgVHlwZSAwMWgiIGJ5dGUgMjEsICJTZW5zb3Ig
VW5pdHMgMSIuDQo+IA0KPiBIb3dldmVyLCB3ZSBjYW4gZmluZCB0aGF0IHRoZSBzZW5zb3JfdW5p
dHNfMSBpcyBzZXQgdG8gemVybyBpbg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9z
cGhvci1ob3N0LWlwbWlkL2Jsb2IvbWFzdGVyL3NlbnNvcmhhbmRsZXIuY3BwI0w3MTINCg0KPiBB
bmQgdGhlIG1ldGhvZCAic2V0X2FuYWxvZ19kYXRhX2Zvcm1hdCIsIGFsdGhvdWdodCBpdCBoYXMg
YmVlbiBkZWNsYXJlZA0KPiBidXQgaXQgaGFzIG5ldmVyIGJlZW4gdXNlZCBpbg0KPiBodHRwczov
L2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1ob3N0LWlwbWlkL2Jsb2IvbWFzdGVyL3NlbnNv
cmhhbmRsDQo+IGVyLmhwcCNMNDk3Lg0KPiANCj4gSW4gYWRkaXRpb24sIHNpbmNlIHJhd0RhdGEg
aGFzIGJlZW4gY29udmVydGVkIHRvIHVpbnQ4X3QgYnkgc3RhdGljX2Nhc3QNCj4gPHVpbnQ4X3Q+
LCB0aGVyZSBpcyBhbHdheXMgYSBub25lIG5lZ2F0aXZlIHZhbHVlLiBpbg0KPiBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1ob3N0LWlwbWlkL2Jsb2IvbWFzdGVyL3NlbnNvcmRh
dGFoYW5kbGVyLmhwcCNMMjI3DQo+IA0KPiBCYXNlZCBvbiB0aGUgYWJvdmUgdGhyZWUgcG9pbnRz
LCBpdCBzZWVtcyB0aGF0IHRoZSBmdW5jdGlvbiBuZWVkcyB0byBiZQ0KPiBtb2RpZmllZCAgc28g
dGhhdCB0aGUgc2Vuc29yIHZhbHVlIGNhbiBiZSBkaXNwbGF5ZWQgYXMgYSBuZWdhdGl2ZSB2YWx1
ZSB3aGVuDQo+IHRoZSAiaXBtaXRvb2wgc2RyIiBjb21tYW5kIGlzIGV4ZWN1dGVkLg0KPiANCj4g
QW0gSSB3cm9uZywgb3IgSSBuZWVkIHRvIHNldCBpdCB1cCBzb21ld2hlcmU/DQoNCg==
