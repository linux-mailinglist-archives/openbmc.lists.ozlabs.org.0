Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A845A432BB3
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 04:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYHK21gsmz3cQZ
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 13:10:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=61.220.76.156; helo=mail.inventec.com;
 envelope-from=lin.tommysc@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (61-220-76-156.hinet-ip.hinet.net
 [61.220.76.156])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYHDj35y3z2y7K
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 13:06:59 +1100 (AEDT)
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 19 Oct 2021 10:06:51 +0800
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2308.14 via Frontend Transport; Tue, 19 Oct 2021 10:06:51 +0800
Received: from IEC1-EX2016-02.iec.inventec (iec1-ex2016-02.iec.inventec
 [10.1.254.221])
 by IEC1-MSE-FE1.inventec.com with ESMTP id 19J26ggX038812;
 Tue, 19 Oct 2021 10:06:42 +0800 (GMT-8)
 (envelope-from Lin.TommySC@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-02.iec.inventec (10.1.254.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 19 Oct 2021 10:06:42 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007]) by
 IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007%8]) with mapi id
 15.01.2308.014; Tue, 19 Oct 2021 10:06:42 +0800
From: =?big5?B?TGluLlRvbW15U0MgqkylQLTcIFRBTw==?= <Lin.TommySC@inventec.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH v2] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Topic: [PATCH v2] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Index: AQHXwKNCpIlpS3Zzk0u4F9ucNjrfgKvRxce0gAcmr4CAAAF/AIAAqbbE
Date: Tue, 19 Oct 2021 02:06:42 +0000
Message-ID: <dc78dc3324284fbaa45da37fb1ac4798@inventec.com>
References: <3a7fed78df06416da20ec72f14111c97@inventec.com>
 <e57d58c0b44b4a289c580e188f7d5580@inventec.com>
 <CACPK8XeZ9esWimkv+RbeP3xyohzcPiUkXFhDWqB6ANjJ0aBvHw@mail.gmail.com>,
 <CACPK8XdzUf9nK_PNQcEJCs+9fMv-J=ZP4hetQ2ofbB=5GGALXw@mail.gmail.com>
In-Reply-To: <CACPK8XdzUf9nK_PNQcEJCs+9fMv-J=ZP4hetQ2ofbB=5GGALXw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.148.43]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE1.inventec.com 19J26ggX038812
X-TM-SNTS-SMTP: 0484E7850C2AB519CB2A0E3A658055A85EC44F9FBBE76511618B0E436391A71B2000:8
X-Mailman-Approved-At: Tue, 19 Oct 2021 13:10:32 +1100
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
Cc: =?big5?B?WWUuVmljILitpnSyTSBUQU8=?= <ye.vic@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Mohammed.Habeeb
 ISV" <mohammed.habeeb@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KQ291bGQgeW91IGdpdmUgc29tZSBoaW50IG9uIGhvdyB0byB1cGdyYWRlIHRv
IHY1LjE1LXJjMT8gSSBkb24ndCBzZWUgdGhpcyB0YWcgaW4gdXBzdHJlYW0gZ2l0aHViIGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4Lg0KDQpCUg0KVG9tbXkNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCrFIpfOqzDogSm9lbCBTdGFubGV5IDxqb2VsQGpt
cy5pZC5hdT4NCrFIpfOk6bTBOiAyMDIxpn4xMKTrMTmk6SCkV6TIIDA3OjQ4DQqmrKXzqsw6IExp
bi5Ub21teVNDIKpMpUC03CBUQU8NCrDGpbs6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgWWUu
VmljILitpnSyTSBUQU87IE1vaGFtbWVkLkhhYmVlYiBJU1YNCqVEpq46IFJlOiBbUEFUQ0ggdjJd
IEFSTTogZHRzOiBhc3BlZWQ6IEFkZGluZyBJbnZlbnRlYyBUcmFuc2Zvcm1lcnMgQk1DDQoNCk9u
IE1vbiwgMTggT2N0IDIwMjEgYXQgMjM6NDMsIEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+
IHdyb3RlOg0KPg0KPiBPbiBNb24sIDE4IE9jdCAyMDIxIGF0IDIyOjUxLCBMaW4uVG9tbXlTQyCq
TKVAtNwgVEFPDQo+IDxMaW4uVG9tbXlTQ0BpbnZlbnRlYy5jb20+IHdyb3RlOg0KPiA+DQo+ID4g
SW5pdGlhbCBpbnRyb2R1Y3Rpb24gb2YgSW52ZW50ZWMgVHJhbnNmb3JtZXJzIHg4NiBmYW1pbHkg
ZXF1aXBwZWQgd2l0aCBBU1QyNjAwIEJNQyBTb0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBU
b21teSBMaW4gPExpbi5Ub21teVNDQGludmVudGVjLmNvbT4NCj4NCj4gUmV2aWV3ZWQtYnk6IEpv
ZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQo+DQo+IFRoYW5rcyEgSSd2ZSBhcHBsaWVkIHRo
aXMgdG8gdGhlIGFzcGVlZCB0cmVlIChidXQgSSd2ZSBhbHJlYWR5IHNlbnQgbXkNCj4gcHVsbCBy
ZXF1ZXN0IGZvciB2NS4xNikgYW5kIHRvIHRoZSBvcGVuYm1jIHRyZWUuDQoNCkkgc3Bva2UgdG9v
IHNvb24hIFRoZSBwYXRjaCBpbnRyb2R1Y2VzIGEgbG90IG9mIHdhcm5pbmdzIHRoYXQgSSB3aWxs
DQpnZXQgeW91IHRvIGZpeCBiZWZvcmUgSSBhcHBseS4gUGxlYXNlIGFwcGx5IHlvdXIgcGF0Y2gg
dG8gdjUuMTUtcmMxDQphbmQgYnVpbGQgaXQgdG8gZW5zdXJlIHlvdSBoYXZlIHNlZW4gYWxsIG9m
IHRoZSB3YXJuaW5ncy4NCg0KPiA+ICsgICAgICAgcHdtX3RhY2hvIHsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCg0KPiA+ICsgICAgICAgICAgICAgICBmYW5A
MCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDA+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGFzcGVlZCx0YXJnZXRfcHdtID0gPDI1MDAwPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjb29saW5nLWxldmVscyA9IDwxMjUgMTUxIDE3NyAyMDMgMjI5
IDI1NT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLGZhbi10YWNoLWNoID0g
PDB4MDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGFzcGVlZCxtaW5fcnBtID0gPDc1
MDAwMD47DQoNCiAgRFRDICAgICBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVj
LXRyYW5zZm9ybWVycy5kdGINCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50
ZWMtdHJhbnNmb3JtZXJzLmR0czo3MC4yNC0zNzoNCldhcm5pbmcgKHJlZ19mb3JtYXQpOiAvcHdt
X3RhY2hvL2ZhbkAwOnJlZzogcHJvcGVydHkgaGFzIGludmFsaWQNCmxlbmd0aCAoNCBieXRlcykg
KCNhZGRyZXNzLWNlbGxzID09IDIsICNzaXplLWNlbGxzID09IDEpDQouLi9hcmNoL2FybS9ib290
L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHM6NzguMjQtMzc6DQpXYXJu
aW5nIChyZWdfZm9ybWF0KTogL3B3bV90YWNoby9mYW5AMTpyZWc6IHByb3BlcnR5IGhhcyBpbnZh
bGlkDQpsZW5ndGggKDQgYnl0ZXMpICgjYWRkcmVzcy1jZWxscyA9PSAyLCAjc2l6ZS1jZWxscyA9
PSAxKQ0KLi4vYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1l
cnMuZHRzOjg2LjI0LTM3Og0KV2FybmluZyAocmVnX2Zvcm1hdCk6IC9wd21fdGFjaG8vZmFuQDI6
cmVnOiBwcm9wZXJ0eSBoYXMgaW52YWxpZA0KbGVuZ3RoICg0IGJ5dGVzKSAoI2FkZHJlc3MtY2Vs
bHMgPT0gMiwgI3NpemUtY2VsbHMgPT0gMSkNCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1i
bWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJzLmR0czo5NC4yNC0zNzoNCldhcm5pbmcgKHJlZ19mb3Jt
YXQpOiAvcHdtX3RhY2hvL2ZhbkAzOnJlZzogcHJvcGVydHkgaGFzIGludmFsaWQNCmxlbmd0aCAo
NCBieXRlcykgKCNhZGRyZXNzLWNlbGxzID09IDIsICNzaXplLWNlbGxzID09IDEpDQouLi9hcmNo
L2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHM6MTAyLjI0
LTM3Og0KV2FybmluZyAocmVnX2Zvcm1hdCk6IC9wd21fdGFjaG8vZmFuQDQ6cmVnOiBwcm9wZXJ0
eSBoYXMgaW52YWxpZA0KbGVuZ3RoICg0IGJ5dGVzKSAoI2FkZHJlc3MtY2VsbHMgPT0gMiwgI3Np
emUtY2VsbHMgPT0gMSkNCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMt
dHJhbnNmb3JtZXJzLmR0czoxMTAuMjQtMzc6DQpXYXJuaW5nIChyZWdfZm9ybWF0KTogL3B3bV90
YWNoby9mYW5ANTpyZWc6IHByb3BlcnR5IGhhcyBpbnZhbGlkDQpsZW5ndGggKDQgYnl0ZXMpICgj
YWRkcmVzcy1jZWxscyA9PSAyLCAjc2l6ZS1jZWxscyA9PSAxKQ0KLi4vYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRzOjExOC4yNC0zNzoNCldhcm5p
bmcgKHJlZ19mb3JtYXQpOiAvcHdtX3RhY2hvL2ZhbkA2OnJlZzogcHJvcGVydHkgaGFzIGludmFs
aWQNCmxlbmd0aCAoNCBieXRlcykgKCNhZGRyZXNzLWNlbGxzID09IDIsICNzaXplLWNlbGxzID09
IDEpDQouLi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVy
cy5kdHM6MTI2LjI0LTM3Og0KV2FybmluZyAocmVnX2Zvcm1hdCk6IC9wd21fdGFjaG8vZmFuQDc6
cmVnOiBwcm9wZXJ0eSBoYXMgaW52YWxpZA0KbGVuZ3RoICg0IGJ5dGVzKSAoI2FkZHJlc3MtY2Vs
bHMgPT0gMiwgI3NpemUtY2VsbHMgPT0gMSkNCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1i
bWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJzLmR0czoxMzQuMjQtMzc6DQpXYXJuaW5nIChyZWdfZm9y
bWF0KTogL3B3bV90YWNoby9mYW5AODpyZWc6IHByb3BlcnR5IGhhcyBpbnZhbGlkDQpsZW5ndGgg
KDQgYnl0ZXMpICgjYWRkcmVzcy1jZWxscyA9PSAyLCAjc2l6ZS1jZWxscyA9PSAxKQ0KLi4vYXJj
aC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRzOjEzOS4y
NC0zNzoNCldhcm5pbmcgKHJlZ19mb3JtYXQpOiAvcHdtX3RhY2hvL2ZhbkA5OnJlZzogcHJvcGVy
dHkgaGFzIGludmFsaWQNCmxlbmd0aCAoNCBieXRlcykgKCNhZGRyZXNzLWNlbGxzID09IDIsICNz
aXplLWNlbGxzID09IDEpDQouLi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVj
LXRyYW5zZm9ybWVycy5kdHM6MTQ0LjI0LTM3Og0KV2FybmluZyAocmVnX2Zvcm1hdCk6IC9wd21f
dGFjaG8vZmFuQDEwOnJlZzogcHJvcGVydHkgaGFzIGludmFsaWQNCmxlbmd0aCAoNCBieXRlcykg
KCNhZGRyZXNzLWNlbGxzID09IDIsICNzaXplLWNlbGxzID09IDEpDQouLi9hcmNoL2FybS9ib290
L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHM6MTQ5LjI0LTM3Og0KV2Fy
bmluZyAocmVnX2Zvcm1hdCk6IC9wd21fdGFjaG8vZmFuQDExOnJlZzogcHJvcGVydHkgaGFzIGlu
dmFsaWQNCmxlbmd0aCAoNCBieXRlcykgKCNhZGRyZXNzLWNlbGxzID09IDIsICNzaXplLWNlbGxz
ID09IDEpDQouLi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9y
bWVycy5kdHM6MTU0LjI0LTM3Og0KV2FybmluZyAocmVnX2Zvcm1hdCk6IC9wd21fdGFjaG8vZmFu
QDEyOnJlZzogcHJvcGVydHkgaGFzIGludmFsaWQNCmxlbmd0aCAoNCBieXRlcykgKCNhZGRyZXNz
LWNlbGxzID09IDIsICNzaXplLWNlbGxzID09IDEpDQouLi9hcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHM6MTU5LjI0LTM3Og0KV2FybmluZyAocmVn
X2Zvcm1hdCk6IC9wd21fdGFjaG8vZmFuQDEzOnJlZzogcHJvcGVydHkgaGFzIGludmFsaWQNCmxl
bmd0aCAoNCBieXRlcykgKCNhZGRyZXNzLWNlbGxzID09IDIsICNzaXplLWNlbGxzID09IDEpDQou
Li9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHM6
MTY0LjI0LTM3Og0KV2FybmluZyAocmVnX2Zvcm1hdCk6IC9wd21fdGFjaG8vZmFuQDE0OnJlZzog
cHJvcGVydHkgaGFzIGludmFsaWQNCmxlbmd0aCAoNCBieXRlcykgKCNhZGRyZXNzLWNlbGxzID09
IDIsICNzaXplLWNlbGxzID09IDEpDQouLi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWlu
dmVudGVjLXRyYW5zZm9ybWVycy5kdHM6MTY5LjI0LTM3Og0KV2FybmluZyAocmVnX2Zvcm1hdCk6
IC9wd21fdGFjaG8vZmFuQDE1OnJlZzogcHJvcGVydHkgaGFzIGludmFsaWQNCmxlbmd0aCAoNCBi
eXRlcykgKCNhZGRyZXNzLWNlbGxzID09IDIsICNzaXplLWNlbGxzID09IDEpDQphcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdGI6IFdhcm5pbmcNCihw
Y2lfZGV2aWNlX3JlZyk6IEZhaWxlZCBwcmVyZXF1aXNpdGUgJ3JlZ19mb3JtYXQnDQphcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdGI6IFdhcm5pbmcN
CihwY2lfZGV2aWNlX2J1c19udW0pOiBGYWlsZWQgcHJlcmVxdWlzaXRlICdyZWdfZm9ybWF0Jw0K
YXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRiOiBX
YXJuaW5nDQooaTJjX2J1c19yZWcpOiBGYWlsZWQgcHJlcmVxdWlzaXRlICdyZWdfZm9ybWF0Jw0K
YXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRiOiBX
YXJuaW5nDQooc3BpX2J1c19yZWcpOiBGYWlsZWQgcHJlcmVxdWlzaXRlICdyZWdfZm9ybWF0Jw0K
Li4vYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRz
OjY5LjIyLTc1LjE4Og0KV2FybmluZyAoYXZvaWRfZGVmYXVsdF9hZGRyX3NpemUpOiAvcHdtX3Rh
Y2hvL2ZhbkAwOiBSZWx5aW5nIG9uDQpkZWZhdWx0ICNhZGRyZXNzLWNlbGxzIHZhbHVlDQouLi9h
cmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHM6Njku
MjItNzUuMTg6DQpXYXJuaW5nIChhdm9pZF9kZWZhdWx0X2FkZHJfc2l6ZSk6IC9wd21fdGFjaG8v
ZmFuQDA6IFJlbHlpbmcgb24NCmRlZmF1bHQgI3NpemUtY2VsbHMgdmFsdWUNCi4uL2FyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJzLmR0czo3Ny4yMi04My4x
ODoNCldhcm5pbmcgKGF2b2lkX2RlZmF1bHRfYWRkcl9zaXplKTogL3B3bV90YWNoby9mYW5AMTog
UmVseWluZyBvbg0KZGVmYXVsdCAjYWRkcmVzcy1jZWxscyB2YWx1ZQ0KLi4vYXJjaC9hcm0vYm9v
dC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRzOjc3LjIyLTgzLjE4Og0K
V2FybmluZyAoYXZvaWRfZGVmYXVsdF9hZGRyX3NpemUpOiAvcHdtX3RhY2hvL2ZhbkAxOiBSZWx5
aW5nIG9uDQpkZWZhdWx0ICNzaXplLWNlbGxzIHZhbHVlDQouLi9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHM6ODUuMjItOTEuMTg6DQpXYXJuaW5n
IChhdm9pZF9kZWZhdWx0X2FkZHJfc2l6ZSk6IC9wd21fdGFjaG8vZmFuQDI6IFJlbHlpbmcgb24N
CmRlZmF1bHQgI2FkZHJlc3MtY2VsbHMgdmFsdWUNCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC1ibWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJzLmR0czo4NS4yMi05MS4xODoNCldhcm5pbmcgKGF2
b2lkX2RlZmF1bHRfYWRkcl9zaXplKTogL3B3bV90YWNoby9mYW5AMjogUmVseWluZyBvbg0KZGVm
YXVsdCAjc2l6ZS1jZWxscyB2YWx1ZQ0KLi4vYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1p
bnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRzOjkzLjIyLTk5LjE4Og0KV2FybmluZyAoYXZvaWRfZGVm
YXVsdF9hZGRyX3NpemUpOiAvcHdtX3RhY2hvL2ZhbkAzOiBSZWx5aW5nIG9uDQpkZWZhdWx0ICNh
ZGRyZXNzLWNlbGxzIHZhbHVlDQouLi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVu
dGVjLXRyYW5zZm9ybWVycy5kdHM6OTMuMjItOTkuMTg6DQpXYXJuaW5nIChhdm9pZF9kZWZhdWx0
X2FkZHJfc2l6ZSk6IC9wd21fdGFjaG8vZmFuQDM6IFJlbHlpbmcgb24NCmRlZmF1bHQgI3NpemUt
Y2VsbHMgdmFsdWUNCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJh
bnNmb3JtZXJzLmR0czoxMDEuMjItMTA3LjE4Og0KV2FybmluZyAoYXZvaWRfZGVmYXVsdF9hZGRy
X3NpemUpOiAvcHdtX3RhY2hvL2ZhbkA0OiBSZWx5aW5nIG9uDQpkZWZhdWx0ICNhZGRyZXNzLWNl
bGxzIHZhbHVlDQouLi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5z
Zm9ybWVycy5kdHM6MTAxLjIyLTEwNy4xODoNCldhcm5pbmcgKGF2b2lkX2RlZmF1bHRfYWRkcl9z
aXplKTogL3B3bV90YWNoby9mYW5ANDogUmVseWluZyBvbg0KZGVmYXVsdCAjc2l6ZS1jZWxscyB2
YWx1ZQ0KLi4vYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1l
cnMuZHRzOjEwOS4yMi0xMTUuMTg6DQpXYXJuaW5nIChhdm9pZF9kZWZhdWx0X2FkZHJfc2l6ZSk6
IC9wd21fdGFjaG8vZmFuQDU6IFJlbHlpbmcgb24NCmRlZmF1bHQgI2FkZHJlc3MtY2VsbHMgdmFs
dWUNCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJz
LmR0czoxMDkuMjItMTE1LjE4Og0KV2FybmluZyAoYXZvaWRfZGVmYXVsdF9hZGRyX3NpemUpOiAv
cHdtX3RhY2hvL2ZhbkA1OiBSZWx5aW5nIG9uDQpkZWZhdWx0ICNzaXplLWNlbGxzIHZhbHVlDQou
Li9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHM6
MTE3LjIyLTEyMy4xODoNCldhcm5pbmcgKGF2b2lkX2RlZmF1bHRfYWRkcl9zaXplKTogL3B3bV90
YWNoby9mYW5ANjogUmVseWluZyBvbg0KZGVmYXVsdCAjYWRkcmVzcy1jZWxscyB2YWx1ZQ0KLi4v
YXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRzOjEx
Ny4yMi0xMjMuMTg6DQpXYXJuaW5nIChhdm9pZF9kZWZhdWx0X2FkZHJfc2l6ZSk6IC9wd21fdGFj
aG8vZmFuQDY6IFJlbHlpbmcgb24NCmRlZmF1bHQgI3NpemUtY2VsbHMgdmFsdWUNCi4uL2FyY2gv
YXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJzLmR0czoxMjUuMjIt
MTMxLjE4Og0KV2FybmluZyAoYXZvaWRfZGVmYXVsdF9hZGRyX3NpemUpOiAvcHdtX3RhY2hvL2Zh
bkA3OiBSZWx5aW5nIG9uDQpkZWZhdWx0ICNhZGRyZXNzLWNlbGxzIHZhbHVlDQouLi9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHM6MTI1LjIyLTEz
MS4xODoNCldhcm5pbmcgKGF2b2lkX2RlZmF1bHRfYWRkcl9zaXplKTogL3B3bV90YWNoby9mYW5A
NzogUmVseWluZyBvbg0KZGVmYXVsdCAjc2l6ZS1jZWxscyB2YWx1ZQ0KLi4vYXJjaC9hcm0vYm9v
dC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRzOjEzMy4yMi0xMzYuMTg6
DQpXYXJuaW5nIChhdm9pZF9kZWZhdWx0X2FkZHJfc2l6ZSk6IC9wd21fdGFjaG8vZmFuQDg6IFJl
bHlpbmcgb24NCmRlZmF1bHQgI2FkZHJlc3MtY2VsbHMgdmFsdWUNCi4uL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJzLmR0czoxMzMuMjItMTM2LjE4Og0K
V2FybmluZyAoYXZvaWRfZGVmYXVsdF9hZGRyX3NpemUpOiAvcHdtX3RhY2hvL2ZhbkA4OiBSZWx5
aW5nIG9uDQpkZWZhdWx0ICNzaXplLWNlbGxzIHZhbHVlDQouLi9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHM6MTM4LjIyLTE0MS4xODoNCldhcm5p
bmcgKGF2b2lkX2RlZmF1bHRfYWRkcl9zaXplKTogL3B3bV90YWNoby9mYW5AOTogUmVseWluZyBv
bg0KZGVmYXVsdCAjYWRkcmVzcy1jZWxscyB2YWx1ZQ0KLi4vYXJjaC9hcm0vYm9vdC9kdHMvYXNw
ZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRzOjEzOC4yMi0xNDEuMTg6DQpXYXJuaW5n
IChhdm9pZF9kZWZhdWx0X2FkZHJfc2l6ZSk6IC9wd21fdGFjaG8vZmFuQDk6IFJlbHlpbmcgb24N
CmRlZmF1bHQgI3NpemUtY2VsbHMgdmFsdWUNCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1i
bWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJzLmR0czoxNDMuMjMtMTQ2LjE4Og0KV2FybmluZyAoYXZv
aWRfZGVmYXVsdF9hZGRyX3NpemUpOiAvcHdtX3RhY2hvL2ZhbkAxMDogUmVseWluZyBvbg0KZGVm
YXVsdCAjYWRkcmVzcy1jZWxscyB2YWx1ZQ0KLi4vYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJt
Yy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMuZHRzOjE0My4yMy0xNDYuMTg6DQpXYXJuaW5nIChhdm9p
ZF9kZWZhdWx0X2FkZHJfc2l6ZSk6IC9wd21fdGFjaG8vZmFuQDEwOiBSZWx5aW5nIG9uDQpkZWZh
dWx0ICNzaXplLWNlbGxzIHZhbHVlDQouLi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWlu
dmVudGVjLXRyYW5zZm9ybWVycy5kdHM6MTQ4LjIzLTE1MS4xODoNCldhcm5pbmcgKGF2b2lkX2Rl
ZmF1bHRfYWRkcl9zaXplKTogL3B3bV90YWNoby9mYW5AMTE6IFJlbHlpbmcgb24NCmRlZmF1bHQg
I2FkZHJlc3MtY2VsbHMgdmFsdWUNCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52
ZW50ZWMtdHJhbnNmb3JtZXJzLmR0czoxNDguMjMtMTUxLjE4Og0KV2FybmluZyAoYXZvaWRfZGVm
YXVsdF9hZGRyX3NpemUpOiAvcHdtX3RhY2hvL2ZhbkAxMTogUmVseWluZyBvbg0KZGVmYXVsdCAj
c2l6ZS1jZWxscyB2YWx1ZQ0KLi4vYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRl
Yy10cmFuc2Zvcm1lcnMuZHRzOjE1My4yMy0xNTYuMTg6DQpXYXJuaW5nIChhdm9pZF9kZWZhdWx0
X2FkZHJfc2l6ZSk6IC9wd21fdGFjaG8vZmFuQDEyOiBSZWx5aW5nIG9uDQpkZWZhdWx0ICNhZGRy
ZXNzLWNlbGxzIHZhbHVlDQouLi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVj
LXRyYW5zZm9ybWVycy5kdHM6MTUzLjIzLTE1Ni4xODoNCldhcm5pbmcgKGF2b2lkX2RlZmF1bHRf
YWRkcl9zaXplKTogL3B3bV90YWNoby9mYW5AMTI6IFJlbHlpbmcgb24NCmRlZmF1bHQgI3NpemUt
Y2VsbHMgdmFsdWUNCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJh
bnNmb3JtZXJzLmR0czoxNTguMjMtMTYxLjE4Og0KV2FybmluZyAoYXZvaWRfZGVmYXVsdF9hZGRy
X3NpemUpOiAvcHdtX3RhY2hvL2ZhbkAxMzogUmVseWluZyBvbg0KZGVmYXVsdCAjYWRkcmVzcy1j
ZWxscyB2YWx1ZQ0KLi4vYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFu
c2Zvcm1lcnMuZHRzOjE1OC4yMy0xNjEuMTg6DQpXYXJuaW5nIChhdm9pZF9kZWZhdWx0X2FkZHJf
c2l6ZSk6IC9wd21fdGFjaG8vZmFuQDEzOiBSZWx5aW5nIG9uDQpkZWZhdWx0ICNzaXplLWNlbGxz
IHZhbHVlDQouLi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9y
bWVycy5kdHM6MTYzLjIzLTE2Ni4xODoNCldhcm5pbmcgKGF2b2lkX2RlZmF1bHRfYWRkcl9zaXpl
KTogL3B3bV90YWNoby9mYW5AMTQ6IFJlbHlpbmcgb24NCmRlZmF1bHQgI2FkZHJlc3MtY2VsbHMg
dmFsdWUNCi4uL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJhbnNmb3Jt
ZXJzLmR0czoxNjMuMjMtMTY2LjE4Og0KV2FybmluZyAoYXZvaWRfZGVmYXVsdF9hZGRyX3NpemUp
OiAvcHdtX3RhY2hvL2ZhbkAxNDogUmVseWluZyBvbg0KZGVmYXVsdCAjc2l6ZS1jZWxscyB2YWx1
ZQ0KLi4vYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZlbnRlYy10cmFuc2Zvcm1lcnMu
ZHRzOjE2OC4yMy0xNzEuMTg6DQpXYXJuaW5nIChhdm9pZF9kZWZhdWx0X2FkZHJfc2l6ZSk6IC9w
d21fdGFjaG8vZmFuQDE1OiBSZWx5aW5nIG9uDQpkZWZhdWx0ICNhZGRyZXNzLWNlbGxzIHZhbHVl
DQouLi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5k
dHM6MTY4LjIzLTE3MS4xODoNCldhcm5pbmcgKGF2b2lkX2RlZmF1bHRfYWRkcl9zaXplKTogL3B3
bV90YWNoby9mYW5AMTU6IFJlbHlpbmcgb24NCmRlZmF1bHQgI3NpemUtY2VsbHMgdmFsdWUNCg0K
DQoNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGZh
bkAxIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMT47DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLHRhcmdldF9wd20gPSA8MjUwMDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGNvb2xpbmctbGV2ZWxzID0gPDEyNSAxNTEgMTc3IDIwMyAy
MjkgMjU1PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2gg
PSA8MHgwMT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLG1pbl9ycG0gPSA8
NzUwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAg
ICAgIGZhbkAyIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMj47DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLHRhcmdldF9wd20gPSA8MjUwMDA+Ow0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvb2xpbmctbGV2ZWxzID0gPDEyNSAxNTEgMTc3
IDIwMyAyMjkgMjU1PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQsZmFuLXRh
Y2gtY2ggPSA8MHgwMj47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLG1pbl9y
cG0gPSA8NzUwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAg
ICAgICAgICAgIGZhbkAzIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgw
Mz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLHRhcmdldF9wd20gPSA8MjUw
MDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvb2xpbmctbGV2ZWxzID0gPDEyNSAx
NTEgMTc3IDIwMyAyMjkgMjU1PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQs
ZmFuLXRhY2gtY2ggPSA8MHgwMz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVk
LG1pbl9ycG0gPSA8NzUwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgICAgIGZhbkA0IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcg
PSA8MHgwND47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLHRhcmdldF9wd20g
PSA8MjUwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvb2xpbmctbGV2ZWxzID0g
PDEyNSAxNTEgMTc3IDIwMyAyMjkgMjU1PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBh
c3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwND47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
YXNwZWVkLG1pbl9ycG0gPSA8NzUwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiAr
DQo+ID4gKyAgICAgICAgICAgICAgIGZhbkA1IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICByZWcgPSA8MHgwNT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLHRhcmdl
dF9wd20gPSA8MjUwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvb2xpbmctbGV2
ZWxzID0gPDEyNSAxNTEgMTc3IDIwMyAyMjkgMjU1PjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBhc3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwNT47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgYXNwZWVkLG1pbl9ycG0gPSA8NzUwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsN
Cj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGZhbkA2IHsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICByZWcgPSA8MHgwNj47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVk
LHRhcmdldF9wd20gPSA8MjUwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvb2xp
bmctbGV2ZWxzID0gPDEyNSAxNTEgMTc3IDIwMyAyMjkgMjU1PjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwNj47DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgYXNwZWVkLG1pbl9ycG0gPSA8NzUwMDAwPjsNCj4gPiArICAgICAgICAgICAg
ICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGZhbkA3IHsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICByZWcgPSA8MHgwNz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
YXNwZWVkLHRhcmdldF9wd20gPSA8MjUwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGNvb2xpbmctbGV2ZWxzID0gPDEyNSAxNTEgMTc3IDIwMyAyMjkgMjU1PjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwNz47DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgYXNwZWVkLG1pbl9ycG0gPSA8NzUwMDAwPjsNCj4gPiArICAgICAg
ICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGZhbkA4IHsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwOD47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgYXNwZWVkLGZhbi10YWNoLWNoID0gPDB4MDg+Ow0KPiA+ICsgICAgICAgICAgICAgICB9
Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgZmFuQDkgew0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDA5PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBhc3Bl
ZWQsZmFuLXRhY2gtY2ggPSA8MHgwOT47DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKw0K
PiA+ICsgICAgICAgICAgICAgICBmYW5AMTAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwweDBhPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQsZmFuLXRh
Y2gtY2ggPSA8MHgwYT47DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAg
ICAgICAgICAgICBmYW5AMTEgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
eDBiPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2ggPSA8
MHgwYj47DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg
ICBmYW5AMTIgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDBjPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwYz47DQo+
ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBmYW5AMTMg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDBkPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwZD47DQo+ID4gKyAgICAg
ICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBmYW5AMTQgew0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDBlPjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwZT47DQo+ID4gKyAgICAgICAgICAgICAg
IH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBmYW5AMTUgew0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwweDBmPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBh
c3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwZj47DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4g
KyAgICAgICB9Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJm1kaW8wIHsNCj4gPiArICAgICAgIHN0
YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKyAgICAgICBldGhwaHkwOiBldGhlcm5ldC1waHlA
MCB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZXRoZXJuZXQtcGh5LWllZWU4
MDIuMy1jMjIiOw0KPiA+ICsgICAgICAgICAgICAgICByZWcgPSA8MT47DQo+ID4gKyAgICAgICB9
Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJm1hYzMgew0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9r
YXkiOw0KPiA+ICsgICAgICAgcGh5LW1vZGUgPSAicmdtaWkiOw0KPiA+ICsgICAgICAgcGh5LWhh
bmRsZSA9IDwmZXRocGh5MD47DQo+ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
Ow0KPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3JnbWlpNF9kZWZhdWx0PjsNCj4g
PiArfTsNCj4gPiArDQo+ID4gKyZmbWMgew0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0K
PiA+ICsNCj4gPiArICAgICAgIGZsYXNoQDAgew0KPiA+ICsgICAgICAgICAgICAgICBzdGF0dXMg
PSAib2theSI7DQo+ID4gKyAgICAgICAgICAgICAgIG0yNXAsZmFzdC1yZWFkOw0KPiA+ICsgICAg
ICAgICAgICAgICBsYWJlbCA9ICJibWMiOw0KPiA+ICsgICAgICAgICAgICAgICBzcGktbWF4LWZy
ZXF1ZW5jeSA9IDwzMzAwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgIHNwaS10eC1idXMtd2lk
dGggPSA8Mj47DQo+ID4gKyAgICAgICAgICAgICAgIHNwaS1yeC1idXMtd2lkdGggPSA8Mj47DQo+
ID4gKyNpbmNsdWRlICJvcGVuYm1jLWZsYXNoLWxheW91dC5kdHNpIg0KPiA+ICsgICAgICAgfTsN
Cj4gPiArDQo+ID4gKyAgICAgICBmbGFzaEAxIHsNCj4gPiArICAgICAgICAgICAgICAgc3RhdHVz
ID0gIm9rYXkiOw0KPiA+ICsgICAgICAgICAgICAgICBtMjVwLGZhc3QtcmVhZDsNCj4gPiArICAg
ICAgICAgICAgICAgbGFiZWwgPSAiYm1jMiI7DQo+ID4gKyAgICAgICAgICAgICAgIHNwaS1tYXgt
ZnJlcXVlbmN5ID0gPDMzMDAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgc3BpLXR4LWJ1cy13
aWR0aCA9IDwyPjsNCj4gPiArICAgICAgICAgICAgICAgc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsN
Cj4gPiArICAgICAgIH07DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmc3BpMSB7DQo+ID4gKyAgICAg
ICBzdGF0dXMgPSAib2theSI7DQo+ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQi
Ow0KPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3NwaTFfZGVmYXVsdD47DQo+ID4g
Kw0KPiA+ICsgICAgICAgZmxhc2hAMCB7DQo+ID4gKyAgICAgICAgICAgICAgIHN0YXR1cyA9ICJv
a2F5IjsNCj4gPiArICAgICAgICAgICAgICAgbTI1cCxmYXN0LXJlYWQ7DQo+ID4gKyAgICAgICAg
ICAgICAgIGxhYmVsID0gImJpb3MiOw0KPiA+ICsgICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1
ZW5jeSA9IDwzMzAwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgIHNwaS10eC1idXMtd2lkdGgg
PSA8MT47DQo+ID4gKyAgICAgICAgICAgICAgIHNwaS1yeC1idXMtd2lkdGggPSA8MT47DQo+ID4g
KyAgICAgICB9Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJndkdDEgew0KPiA+ICsgICAgICAgc3Rh
dHVzID0gIm9rYXkiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJnVhcnQxIHsNCj4gPiArICAgICAg
IHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZ1YXJ0NSB7DQo+ID4gKyAg
ICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmaTJjMCB7DQo+ID4g
KyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gKw0KPiA+ICsgICAgICAgLy9TZXQgYm1jJyBz
bGF2ZSBhZGRyZXNzOw0KPiA+ICsgICAgICAgYm1jX3NsYXZlQDEwIHsNCj4gPiArICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJpcG1iLWRldiI7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZyA9
IDwoMHgxMCB8IEkyQ19PV05fU0xBVkVfQUREUkVTUyk+Ow0KPiA+ICsgICAgICAgICAgICAgICBp
MmMtcHJvdG9jb2w7DQo+ID4gKyAgICAgICB9Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJmkyYzIg
ew0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJmky
YzMgew0KPiA+ICsgICAgICAgLy8gRlJVIEFUMjRDNTEyQy1TU0hNLVQNCj4gPiArICAgICAgIHN0
YXR1cyA9ICJva2F5IjsNCj4gPiArICAgICAgIGVlcHJvbUA1MCB7DQo+ID4gKyAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsMjRjNTEyIjsNCj4gPiArICAgICAgICAgICAgICAgcmVn
ID0gPDB4NTA+Ow0KPiA+ICsgICAgICAgICAgICAgICBwYWdlc2l6ZSA9IDwxMjg+Ow0KPiA+ICsg
ICAgICAgfTsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZpMmM1IHsNCj4gPiArICAgICAgIHN0YXR1
cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZpMmM2IHsNCj4gPiArICAgICAgIHN0
YXR1cyA9ICJva2F5IjsNCj4gPiArDQo+ID4gKyAgICAgICB0bXA3NUA0OSB7DQo+ID4gKyAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAidGksdG1wNzUiOw0KPiA+ICsgICAgICAgICAgICAgICBy
ZWcgPSA8MHg0OT47DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgIHRtcDc1QDRm
IHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aSx0bXA3NSI7DQo+ID4gKyAg
ICAgICAgICAgICAgIHJlZyA9IDwweDRmPjsNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICsg
ICAgICAgdG1wNDY4QDQ4IHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aSx0
bXA0NjgiOw0KPiA+ICsgICAgICAgICAgICAgICByZWcgPSA8MHg0OD47DQo+ID4gKyAgICAgICB9
Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJmkyYzcgew0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9r
YXkiOw0KPiA+ICsgICAgICAgYWRtMTI3OEA0MCB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiYWRpLGFkbTEyNzgiOw0KPiA+ICsgICAgICAgICAgICAgICByZWcgPSA8MHg0MD47
DQo+ID4gKyAgICAgICB9Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArDQo+ID4gKyZpMmM4IHsNCj4g
PiArICAgICAgIC8vIEZSVSBBVDI0QzUxMkMtU1NITS1UDQo+ID4gKyAgICAgICBzdGF0dXMgPSAi
b2theSI7DQo+ID4gKw0KPiA+ICsgICAgICAgZWVwcm9tQDUxIHsNCj4gPiArICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJhdG1lbCwyNGM1MTIiOw0KPiA+ICsgICAgICAgICAgICAgICByZWcg
PSA8MHg1MT47DQo+ID4gKyAgICAgICAgICAgICAgIHBhZ2VzaXplID0gPDEyOD47DQo+ID4gKyAg
ICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgIGVlcHJvbUA1MyB7DQo+ID4gKyAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsMjRjNTEyIjsNCj4gPiArICAgICAgICAgICAgICAgcmVn
ID0gPDB4NTM+Ow0KPiA+ICsgICAgICAgICAgICAgICBwYWdlc2l6ZSA9IDwxMjg+Ow0KPiA+ICsg
ICAgICAgfTsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZpMmM5IHsNCj4gPiArICAgICAgIC8vIE0u
Mg0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJmky
YzEwIHsNCj4gPiArICAgICAgIC8vIEkyQyBFWFBBTkRFUg0KPiA+ICsgICAgICAgc3RhdHVzID0g
Im9rYXkiOw0KPiA+ICsNCj4gPiArICAgICAgIGkyYy1zd2l0Y2hANzEgew0KPiA+ICsgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gIm54cCxwY2E5NTQ0IjsNCj4gPiArICAgICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0g
PDA+Ow0KPiA+ICsgICAgICAgICAgICAgICByZWcgPSA8MHg3MT47DQo+ID4gKyAgICAgICB9Ow0K
PiA+ICsNCj4gPiArICAgICAgIGkyYy1zd2l0Y2hANzMgew0KPiA+ICsgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gIm54cCxwY2E5NTQ0IjsNCj4gPiArICAgICAgICAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+
ICsgICAgICAgICAgICAgICByZWcgPSA8MHg3Mz47DQo+ID4gKyAgICAgICB9Ow0KPiA+ICt9Ow0K
PiA+ICsNCj4gPiArJmkyYzExIHsNCj4gPiArICAgICAgIC8vIEkyQyBFWFBBTkRFUg0KPiA+ICsg
ICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICsNCj4gPiArICAgICAgIGkyYy1zd2l0Y2hANzAg
ew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm54cCxwY2E5NTQ0IjsNCj4gPiAr
ICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICByZWcgPSA8MHg3MD47DQo+
ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBwY2llX2VlcHJvbV9yaXNlcjE6IGkyY0AwIHsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGVlcHJvbUA1NSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gImF0bWVsLDI0YzUxMiI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZWcgPSA8MHg1NT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdl
c2l6ZSA9IDwxMjg+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAg
ICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBwY2llX2VlcHJvbV9yaXNl
cjI6IGkyY0AxIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47DQo+ID4gKw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGVlcHJvbUA1NSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImF0bWVsLDI0YzUxMiI7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHg1NT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYWdlc2l6ZSA9IDwxMjg+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IH07DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBw
Y2llX2VlcHJvbV9yaXNlcjM6IGkyY0AyIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAj
YWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8Mj47DQo+ID4g
Kw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGVlcHJvbUA1NSB7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImF0bWVsLDI0YzUxMiI7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHg1NT47DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlc2l6ZSA9IDwxMjg+Ow0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICB9
Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJmkyYzEyIHsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJv
a2F5IjsNCj4gPiArDQo+ID4gKyAgICAgICBwc3UwOnBzdTBANTggew0KPiA+ICsgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInBtYnVzIjsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gPDB4
NTg+Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZncGlvMCB7DQo+ID4g
KyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gKyAgICAgICBncGlvLWxpbmUtbmFtZXMgPQ0K
PiA+ICsgICAgICAgLypBMC1BNyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQo+ID4gKyAg
ICAgICAvKkIwLUI3Ki8gICAicHJlc2VuY2UtcHMwIiwicG93ZXItY2hhc3Npcy1nb29kIiwiIiwi
IiwiIiwiIiwicHJlc2VuY2UtcHMxIiwiIiwNCj4gPiArICAgICAgIC8qQzAtQzcqLyAgICIiLCIi
LCIiLCIiLCIiLCIiLCIiLCIiLA0KPiA+ICsgICAgICAgLypEMC1ENyovICAgIiIsIiIsIiIsIiIs
IiIsIiIsIiIsIiIsDQo+ID4gKyAgICAgICAvKkUwLUU3Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwi
IiwiIiwNCj4gPiArICAgICAgIC8qRjAtRjcqLyAgICIiLCIiLCIiLCIiLCJwb3dlci1jaGFzc2lz
LWNvbnRyb2wiLCIiLCIiLCIiLA0KPiA+ICsgICAgICAgLypHMC1HNyovICAgIiIsIiIsImp0YWct
bXV4IiwiIiwiIiwiIiwiIiwiIiwNCj4gPiArICAgICAgIC8qSDAtSDcqLyAgICIiLCIiLCIiLCIi
LCJyZXNldC1idXR0b24iLCJwb3dlci1idXR0b24iLCIiLCIiLA0KPiA+ICsgICAgICAgLypJMC1J
NyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQo+ID4gKyAgICAgICAvKkowLUo3Ki8gICAi
IiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwNCj4gPiArICAgICAgIC8qSzAtSzcqLyAgICIiLCIiLCIi
LCIiLCIiLCIiLCIiLCIiLA0KPiA+ICsgICAgICAgLypMMC1MNyovICAgIiIsIiIsIiIsIiIsIiIs
IiIsIiIsIiIsDQo+ID4gKyAgICAgICAvKk0wLU03Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwi
IiwNCj4gPiArICAgICAgIC8qTjAtTjcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KPiA+
ICsgICAgICAgLypPMC1PNyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQo+ID4gKyAgICAg
ICAvKlAwLVA3Ki8gICAiIiwiIiwiIiwidGNrLW11eCIsIiIsIiIsIiIsIiIsDQo+ID4gKyAgICAg
ICAvKlEwLVE3Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwNCj4gPiArICAgICAgIC8qUjAt
UjcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KPiA+ICsgICAgICAgLypTMC1TNyovICAg
IiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQo+ID4gKyAgICAgICAvKlQwLVQ3Ki8gICAiIiwiIiwi
IiwiIiwiIiwiIiwiIiwiIiwNCj4gPiArICAgICAgIC8qVTAtVTcqLyAgICIiLCJubWktYnV0dG9u
IiwiIiwiIiwiIiwiIiwiIiwiIiwNCj4gPiArICAgICAgIC8qVjAtVjcqLyAgICIiLCIiLCIiLCIi
LCJwb3dlci1jb25maWctZnVsbC1sb2FkIiwiIiwiIiwiIiwNCj4gPiArICAgICAgIC8qVzAtVzcq
LyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KPiA+ICsgICAgICAgLypYMC1YNyovICAgIiIs
IiIsIiIsIiIsIiIsIiIsIiIsIiIsDQo+ID4gKyAgICAgICAvKlkwLVk3Ki8gICAiIiwiIiwiIiwi
IiwiIiwiIiwiIiwiIiwNCj4gPiArICAgICAgIC8qWjAtWjcqLyAgICIiLCIiLCIiLCIiLCIiLCIi
LCIiLCIiLA0KPiA+ICsgICAgICAgLypBQTAtQUE3Ki8gIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIs
DQo+ID4gKyAgICAgICAvKkFCMC1BQjcqLyAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwNCj4gPiAr
ICAgICAgIC8qQUMwLUFDNyovICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiOw0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArJmxwY19zbm9vcCB7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4g
KyAgICAgICBzbm9vcC1wb3J0cyA9IDwweDgwPjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZlbW1j
X2NvbnRyb2xsZXIgew0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArJmVtbWMgew0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICsgICAg
ICAgbm9uLXJlbW92YWJsZTsNCj4gPiArICAgICAgIG1heC1mcmVxdWVuY3kgPSA8NTIwMDAwMDA+
Ow0KPiA+ICsgICAgICAgYnVzLXdpZHRoID0gPDg+Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJnZo
dWIgew0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICsgICAgICAgYXNwZWVkLHZo
dWItZG93bnN0cmVhbS1wb3J0cyA9IDw3PjsNCj4gPiArICAgICAgIGFzcGVlZCx2aHViLWdlbmVy
aWMtZW5kcG9pbnRzID0gPDIxPjsNCj4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7DQo+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfdXNiMmFkX2RlZmF1bHQ+Ow0K
PiA+ICt9Ow0KPiA+ICsNCj4gPiArJnJ0YyB7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7
DQo+ID4gK307DQo+ID4gLS0NCj4gPiAyLjMzLjANCj4gPg0K
