Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEDCDFFF2
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 10:46:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y6Yp3XgbzDqJt
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 19:46:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axentia.se (client-ip=40.107.15.105;
 helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=peda@axentia.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" (0-bit key;
 unprotected) header.d=axentia.se header.i=@axentia.se header.b="JyGeA52f"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150105.outbound.protection.outlook.com [40.107.15.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y6XR3pjLzDqJW;
 Tue, 22 Oct 2019 19:45:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NH6ICw/aGJGLXiBO1oiObwDqLU8GftqOiP767cGnR6reQmnHQbqaylRVOjUs3ra76WMR/MFiD9KnzY6YoGyMVHEypYoa5msaAvgSSG7XIG6oJGqsl5lzSF97t/6dvCUL3VKV0OJMqOBzScXdAU6GLzkwd4haGWxp52j8Kc3IhYc4gkgaC6wgaMi3k6cVR5tmjR2g3E7IOrLIJ2xFndjCYvk6I3map847qZe9+HAJc7dxLsIurSjyq8Z5BIjoAY2q42yTVzvHH6QW7UAFh0c3VQ73QYnxTnF0PT7Y4El4OuUM5H/kWEpf1nSanZScQuaYrRtYI3eFZRwc95O3uaiDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RDd6uHjnaIl18b9/q1LJ/A6qy5517LdOU+CAcC+MiA=;
 b=TxUdCh5SdODfPQD99jlSdzEnyonsC3uFG8BBHuS6QBU7bZsVMrI5XqbCuWrA9YzpXrJFO4MwkRjt8o4RNERUo4BroFjIkYvbiQ2Y3KG17fG8QFQSvSsDo6R7OUSjY6Q4iNezPhLZ3+n29KL0a3vJMQksRjLZo5S+bqVYkEUyB/JjsY7gJCzch/e6JOC3YFAVpCogEYOhPk0kHuo8xKJ41fkM+kA6jWzcm8NAXmhEYsmpdb9DUyp5PIK8/hKXu0xk8Cs3TP+95WJwjoAZJdWwzEC16uuckWdz6Miqlw47s32jaQX1RGtH/pazmvM7S9YeG6orbU82gLhPOYuG/z5q4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RDd6uHjnaIl18b9/q1LJ/A6qy5517LdOU+CAcC+MiA=;
 b=JyGeA52ffsz9qpXXEdEFFSALP+9cfSZIWSCbTjEQYDTKNRLN3yCTggqufdCYkiKHlwRInQhR5iL8Pqv+zqs5gZn4m5VQgEhX0KrpdXAzCASaJN7RE5wWnTDQEdGjuG/b8t8R0HJXfgNjgEAXiEVnbDYRABoCiR1kJaUuEXs6xTA=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3340.eurprd02.prod.outlook.com (52.134.67.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 08:45:18 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 08:45:17 +0000
From: Peter Rosin <peda@axentia.se>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Wolfram Sang <wsa@the-dreams.de>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew
 Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>, Cedric Le Goater
 <clg@kaod.org>
Subject: Re: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
Thread-Topic: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
Thread-Index: AQHViE2KU5aZojIjkUqCdR4ab3gQm6dlt3EA///tFICAALTpgA==
Date: Tue, 22 Oct 2019 08:45:17 +0000
Message-ID: <b98827fa-462a-060b-efc7-27fe5d7742ff@axentia.se>
References: <20191021202414.17484-1-jae.hyun.yoo@linux.intel.com>
 <20191021202414.17484-2-jae.hyun.yoo@linux.intel.com>
 <0a629f7b-b829-c332-27d8-dc825205ff72@axentia.se>
 <7abf933b-cb18-10af-9c1b-163ec65ffae5@linux.intel.com>
In-Reply-To: <7abf933b-cb18-10af-9c1b-163ec65ffae5@linux.intel.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0102CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::30) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c73b2ee-2f98-46ee-46ee-08d756cc29f3
x-ms-traffictypediagnostic: DB3PR0202MB3340:
x-microsoft-antispam-prvs: <DB3PR0202MB3340855FD970AFD95B1783C4BC680@DB3PR0202MB3340.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(366004)(396003)(39830400003)(199004)(52314003)(189003)(6512007)(54906003)(6436002)(99286004)(6506007)(386003)(53546011)(6246003)(229853002)(110136005)(58126008)(6486002)(25786009)(66066001)(65806001)(65956001)(102836004)(8936002)(4326008)(26005)(52116002)(76176011)(81156014)(81166006)(8676002)(316002)(5660300002)(186003)(7416002)(71200400001)(256004)(14444005)(66946007)(305945005)(6116002)(3846002)(86362001)(31696002)(66446008)(64756008)(66556008)(66476007)(4001150100001)(2906002)(11346002)(476003)(486006)(36756003)(508600001)(14454004)(31686004)(446003)(71190400001)(7736002)(2616005)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3340;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fn4FipVxJlznXQexa6vcgCYlFcElZLKNZhs5iuxQcsBnm/aFtkVR7sY6nYcq96lVeMoS02TKUIRn0vT7GYzk7fbPwwAHcbs05kU/5e1JYkJQQ+/eRT6cmbCsE99AJOP7CXhpSz2sAf1KRxTdo6G4y/fh18aNXmRGBUmbZc4yDWP5doupqeXgd5vBLhzr0f7WUMq/i1u8lv03V9jpuN6XoNWvwQkSu1klbawffZ+rhWqhwQP/jgdpnK5k9eKiM+cufKCcCQCA0WEe3tLtPLQZmid7jlXzviqmyqkrjLBwMprFQ/DTDUsT7vD10z3NAtiVcYkBD0DjnM0SRAYxhHO0Aoe8ilUQ+6KbaOfj5AqO9Fspfn2Q6jX2HRdX5rr78DIljv3Fq+NLdR+jZ3wOsi33SxOBqe9JqIZu5TSfPwkOMxkkzKYJHOnxnTErmSfhqTWG
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7084A791E746C8458A822A468C1DDC13@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c73b2ee-2f98-46ee-46ee-08d756cc29f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 08:45:17.8657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/uZAiNNWtS+LEk6fQyPy4opUMAHDU6rylu/WPazBum4gEOjYR6VHXTGI8UWBELj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3340
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gMjAxOS0xMC0yMSAyMzo1NywgSmFlIEh5dW4gWW9vIHdyb3RlOg0KPiBIaSBQZXRlciwNCj4g
DQo+IE9uIDEwLzIxLzIwMTkgMjowNSBQTSwgUGV0ZXIgUm9zaW4gd3JvdGU6DQo+PiBPbiAyMDE5
LTEwLTIxIDIyOjI0LCBKYWUgSHl1biBZb28gd3JvdGU6DQo+Pj4gQXBwZW5kIGEgYmluZGluZyB0
byBzdXBwb3J0IGhhcmR3YXJlIHRpbWVvdXQgZmVhdHVyZS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYt
Ynk6IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4NCj4+PiAtLS0N
Cj4+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWFzcGVlZC50
eHQgfCAyICsrDQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMt
YXNwZWVkLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLWFz
cGVlZC50eHQNCj4+PiBpbmRleCBiNDdmNmNjYjE5NmEuLjEzM2JmZWRmNGNkZCAxMDA2NDQNCj4+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1hc3BlZWQu
dHh0DQo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMt
YXNwZWVkLnR4dA0KPj4+IEBAIC0xNyw2ICsxNyw4IEBAIE9wdGlvbmFsIFByb3BlcnRpZXM6DQo+
Pj4gICAtIGJ1cy1mcmVxdWVuY3kJOiBmcmVxdWVuY3kgb2YgdGhlIGJ1cyBjbG9jayBpbiBIeiBk
ZWZhdWx0cyB0byAxMDAga0h6IHdoZW4gbm90DQo+Pj4gICAJCSAgc3BlY2lmaWVkDQo+Pj4gICAt
IG11bHRpLW1hc3Rlcgk6IHN0YXRlcyB0aGF0IHRoZXJlIGlzIGFub3RoZXIgbWFzdGVyIGFjdGl2
ZSBvbiB0aGlzIGJ1cy4NCj4+PiArLSBhc3BlZWQsaHctdGltZW91dC1tcwk6IEhhcmR3YXJlIHRp
bWVvdXQgaW4gbWlsbGlzZWNvbmRzLiBJZiBpdCdzIG5vdA0KPj4+ICsJCQkgIHNwZWNpZmllZCwg
dGhlIEgvVyB0aW1lb3V0IGZlYXR1cmUgd2lsbCBiZSBkaXNhYmxlZC4NCj4+PiAgIA0KPj4+ICAg
RXhhbXBsZToNCj4+PiAgIA0KPj4+DQo+Pg0KPj4gU29tZSBTTUJ1cyBjbGllbnRzIHN1cHBvcnQg
YSBzbWJ1cy10aW1lb3V0LWRpc2FibGUgYmluZGluZyBmb3IgZGlzYWJsaW5nDQo+PiB0aW1lb3V0
cyBsaWtlIHRoaXMsIGZvciBjYXNlcyB3aGVyZSB0aGUgSTJDIGFkYXB0ZXIgaW4gcXVlc3Rpb24g
b24gb2NjYXNpb24NCj4+IGlzIHVuYWJsZSB0byBrZWVwIHRoZSBwYWNlLiBBZGRpbmcgdGhhdCBw
cm9wZXJ0eSB0aHVzIGF2b2lkcyB1bmRlc2lyZWQNCj4+IHRpbWVvdXRzIHdoZW4gdGhlIGNsaWVu
dCBpcyBTTUJ1cyBjb25mb3JtYW50IHdpdGhvdXQgaXQuIFlvdXIgbmV3IGJpbmRpbmcNCj4+IGlz
IHRoZSByZXZlcnNlIHNpdHVhdGlvbiwgd2hlcmUgeW91IHdhbnQgdG8gYWRkIGEgdGltZW91dCB3
aGVyZSBvbmUgaXMNCj4+IG90aGVyd2lzZSBtaXNzaW5nLg0KPj4NCj4+IEFueXdheSwgc2luY2Ug
STJDIGRvZXMgbm90IGhhdmUgYSBzcGVjaWZpZWQgbG93ZXN0IHBvc3NpYmxlIGZyZXF1ZW5jeSwg
dGhpcw0KPj4gZmVlbHMgbGlrZSBzb21ldGhpbmcgdGhhdCBpcyBtb3JlIGluIHRoZSBTTUJ1cyBh
cmVuYS4gU2hvdWxkIHRoZSBwcm9wZXJ0eQ0KPj4gcGVyaGFwcyBiZSBhIGdlbmVyaWMgcHJvcGVy
dHkgbmFtZWQgc21idXMtdGltZW91dC1tcywgb3Igc29tZXRoaW5nIGxpa2UNCj4+IHRoYXQ/DQo+
IA0KPiBXZWxsLCBJIHRyaWVkIHVwc3RyZWFtaW5nIG9mIHRoZSBnZW5lcmljIHRpbWVvdXQgcHJv
cGVydHkgYSB5ZWFyIGFnbyBidXQNCj4gSSBhZ3JlZWQgdGhhdCB0aGUgZ2VuZXJpYyBidXMgdGlt
ZW91dCBwcm9wZXJ0eSBjYW4gYmUgc2V0IGJ5IGFuIGlvY3RsDQo+IGNvbW1hbmQgc28gaXQgZGlk
bid0IG5lZWQgdG8gYmUgYWRkZWQgaW50byBkZXZpY2UgdHJlZSBhdCB0aGF0IHRpbWUuIE5vdA0K
PiBzdXJlIGlmIGFueSBuZWVkIGhhcyBjb21lIHJlY2VudGx5IGJ1dCBJIGhhdmVuJ3QgaGVhcmQg
dGhhdC4gVGhpcyBkcml2ZXINCj4gc3RpbGwgdXNlcyB0aGUgZ2VuZXJpYyB0aW1lb3V0IHByb3Bl
cnR5IHdoaWNoIGlzIHByb3ZpZGVkIGJ5IGkyYyBjb3JlDQo+IGZvciBoYW5kbGluZyBjb21tYW5k
IHRpbWVvdXRzLCBhbmQgaXQncyBvdXQgb2Ygc2NvcGUgZnJvbSB0aGlzIHBhdGNoDQo+IHNlcmll
cy4NCj4gDQo+PiBJZiB0aGUgYWJvdmUgaXMgbm90IHdhbnRlZCBvciBhcHByb3ByaWF0ZSwgdGhl
biBJIHdvdWxkIHBlcnNvbmFsbHkgcHJlZmVyDQo+PiBhc3BlZWQsYnVzLXRpbWVvdXQtbXMgb3Zl
ciBhc3BlZWQsaHctdGltZW91dC1tcy4gVG8gbWUsIGh3LXRpbWVvdXQtbXMgc291bmRzDQo+PiBs
aWtlIGEgKG1vcmUgc2VyaW91cykgdGltZW91dCBiZXR3ZWVuIHRoZSBDUFUgYW5kIHRoZSBJMkMg
cGVyaXBoZXJhbCB1bml0DQo+PiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LiBCdXQgSSBkb24ndCBj
YXJlIGRlZXBseS4uLg0KPiANCj4gQ2hhbmdlcyBJIHN1Ym1pdHRlZCBpbiB0aGlzIHBhdGNoIHNl
dCBpcyBmb3IgYSBkaWZmZXJlbnQgcHVycG9zZSB3aGljaA0KPiBpcyB2ZXJ5IEFzcGVlZCBIL1cg
c3BlY2lmaWMsIGFuZCBhY3R1YWxseSBpdCdzIGEgbW9yZSBzZXJpb3VzIHRpbWVvdXQNCj4gc2V0
dGluZyBpbmRlZWQuIElmIHRoaXMgSC9XIGlzIHVzZWQgaW4gbXVsdGktbWFzdGVyIGVudmlyb25t
ZW50LCBpdA0KPiBjb3VsZCBtZWV0IGEgSC9XIGhhbmcgdGhhdCBmcmVlemVzIGl0c2VsZiBpbiBz
bGF2ZSBtb2RlIGFuZCBpdCBjYW4ndA0KPiBlc2NhcGUgZnJvbSB0aGUgc3RhdGUuIFRvIHJlc29s
dmUgdGhlIHNwZWNpZmljIGNhc2UsIHRoaXMgSC9XIHByb3ZpZGVzDQo+IHNlbGYtcmVjb3Zlcnkg
ZmVhdHVyZSB3aGljaCBtb25pdG9ycyBhYm5vcm1hbCBzdGF0ZSBvZiBTREEsIFNDTCBhbmQgaXRz
DQo+IEgvVyBzdGF0ZSBtYWNoaW5lIHVzaW5nIHRoZSB0aW1lb3V0IHNldHRpbmcgdG8gZGV0ZXJt
aW5lIHRoZSBlc2NhcGUNCj4gY29uZGl0aW9uLg0KDQpBcmUgeW91IHNheWluZyB0aGF0IHRoZSBh
c3BlZWQgSFcgaXMgYnVnZ3kgYW5kIHRoYXQgdGhpcyBhYm5vcm1hbCBzdGF0ZQ0KaXMgc2VsZiBp
bmZsaWN0ZWQgYnkgdGhlIGFzcGVlZCBIVyBldmVuIGlmIG90aGVyIG1hc3RlcnMgb24gdGhlIGJ1
cw0KYmVoYXZlIHNhbmVseT8gQmVjYXVzZSBJIGRpZG4ndCBxdWl0ZSByZWFkIGl0IHRoYXQgd2F5
IGF0IGFsbC4uLg0KDQpUbyBtZSwgaXQgc291bmRlZCAqZXhhY3RseSogbGlrZSB0aGUgc3RhdGUg
STJDIGNsaWVudHMgZW5kIHVwIGluIHdoZW4gYW4NCkkyQyBtYXN0ZXIgImRpZXMiIGFuZCBzdG9w
cyBjb21tdW5pY2F0aW5nIGluIHRoZSBtaWRkbGUgb2YgYSB0cmFuc2FjdGlvbi4NCkkuZS4gdGhl
IHRoaW5nIHRoYXQgdGhlIFNNQnVzIHRpbWVvdXQgaXMgZGVzaWduZWQgdG8gcHJldmVudCAoYW5k
IHRoZQ0Kc3RhdGUgdGhlIEkyQyBuaW5lLWNsay1yZWNvdmVyeSBzZXF1ZW5jZSBhZGRyZXNzZXMp
LiBUaGUgb25seSB0d2lzdCAodGhhdA0KSSBzYXcpIHdhcyB0aGF0IHRoZSBhc3BlZWQgSFcgaXMg
YWxzbyBhIG1hc3RlciBhbmQgdGhhdCB0aGUgYXNwZWVkIG1hc3Rlcg0KZHJpdmVyIGlzIGNvbXBs
ZXRlbHkgbG9ja2VkIG91dCBmcm9tIHRoZSBidXMgd2hpbGUgc29tZSBvYm5veGlvdXMgbWFzdGVy
DQpmYWlscyB0byBjb21wbGV0ZSBpdHMgdHJhbnNhY3Rpb24gKG9yIHdoYXRldmVyIGl0IHdhcyB1
cCB0bykuDQoNCklmIHRoaXMgY2FuIG9ubHkgYmUgdHJpZ2dlcmVkIHdoZW4gdGhlIEhXIGlzIGFj
dGluZyBhcyBhIHNsYXZlLCBhbmQgYnkNCmFib3J0ZWQgb3Igb3RoZXJ3aXNlIGZ1bmt5IG1hc3Rl
ciBhY3Rpdml0eSBvbiB0aGUgYnVzLCB0aGVuIEkgd291bGRuJ3QNCmNhbGwgaXQgYW4gSFcgaXNz
dWUuIFRoZW4gaXQgd291bGQgYmUgYSBidXMgaXNzdWUuIEkuZS4gc29tZXRoaW5nIG5lZWRpbmcN
CmEgYnVzLXRpbWVvdXQgaW5zdGVhZCBvZiBhIGh3LXRpbWVvdXQuDQoNCkkgZG9uJ3QgaGF2ZSB0
aGUgc3BlY2lmaWNzLCBzbyBJIGNhbid0IHRlbGwgd2hpY2ggd2F5IGl0IGlzLiBJJ20ganVzdA0K
cmVhY3RpbmcgdG8gdGhlIHByZXNlbnRlZCBpbmZvcm1hdGlvbi4NCg0KQ2hlZXJzLA0KUGV0ZXIN
Cg0KPiBHZW5lcmFsbHksIHRoaXMgSC9XIHRpbWVvdXQgdmFsdWUgaXMgc21hbGxlciB0aGFuIHRo
ZSBnZW5lcmljIGJ1cw0KPiB0aW1lb3V0IHZhbHVlIChJJ20gdXNpbmcgMzAwbXMgZm9yIHRoZSBI
L1cgdGltZW91dCB3aGlsZSBJJ20gdXNpbmcgMQ0KPiBzZWNvbmQgZm9yIHRoZSBnZW5lcmljIGJ1
cyB0aW1lb3V0KSBzbyBJIHRoaW5rIGl0IHNob3VsZCBiZQ0KPiBkaXN0aW5ndWlzaGVkIGZyb20g
dGhlIGdlbmVyaWMgYnVzIHRpbWVvdXQuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBKYWUNCj4gDQoN
Cg==
