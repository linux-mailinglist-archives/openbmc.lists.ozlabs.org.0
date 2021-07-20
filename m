Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D13CFA10
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 15:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTf9S2WGXz3bVK
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 23:06:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 76 seconds by postgrey-1.36 at boromir;
 Tue, 20 Jul 2021 23:06:04 AEST
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTf980c8dz2ykQ
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 23:06:03 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-142-ZznYomwVPdSR4LXY_KNiYA-1; Tue, 20 Jul 2021 14:04:39 +0100
X-MC-Unique: ZznYomwVPdSR4LXY_KNiYA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Tue, 20 Jul 2021 14:04:39 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Tue, 20 Jul 2021 14:04:39 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Eddie James' <eajames@linux.ibm.com>, Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 1/2] spi: fsi: Reduce max transfer size to 8 bytes
Thread-Topic: [PATCH 1/2] spi: fsi: Reduce max transfer size to 8 bytes
Thread-Index: AQHXfL3Ikg6avb1lOkyp/qlhiL4746tL1OlQ
Date: Tue, 20 Jul 2021 13:04:38 +0000
Message-ID: <0a637d7704df4303abe783215080578d@AcuMS.aculab.com>
References: <20210716133915.14697-1-eajames@linux.ibm.com>
 <20210716133915.14697-2-eajames@linux.ibm.com>
 <20210716171936.GB4137@sirena.org.uk>
 <81a40f8690d297ebfb6697dbea63279bcf2f24fa.camel@linux.ibm.com>
 <20210719152010.GB4174@sirena.org.uk>
 <d2e07f0beda57ffeaa31e8cf5bf28edfbd982e58.camel@linux.ibm.com>
In-Reply-To: <d2e07f0beda57ffeaa31e8cf5bf28edfbd982e58.camel@linux.ibm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RnJvbTogRWRkaWUgSmFtZXMgPGVhamFtZXNAbGludXguaWJtLmNvbT4NCj4gU2VudDogMTkgSnVs
eSAyMDIxIDE2OjQ3DQo+IFRvOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+DQo+IENj
OiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBy
b2JoK2R0QGtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1zcGlAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBzcGk6IGZz
aTogUmVkdWNlIG1heCB0cmFuc2ZlciBzaXplIHRvIDggYnl0ZXMNCj4gDQo+IE9uIE1vbiwgMjAy
MS0wNy0xOSBhdCAxNjoyMCArMDEwMCwgTWFyayBCcm93biB3cm90ZToNCj4gPiBPbiBGcmksIEp1
bCAxNiwgMjAyMSBhdCAwMTozNDozOFBNIC0wNTAwLCBFZGRpZSBKYW1lcyB3cm90ZToNCj4gPg0K
PiA+ID4gU2VjdXJpdHkgY2hhbmdlcyBpbiB0aGUgU1BJIGNvbnRyb2xsZXIgLSBpbiB0aGUgZGV2
aWNlIG1pY3JvY29kZS4gSQ0KPiA+ID4gY2FuDQo+ID4gPiByZXdvcmQgdGhlIGNvbW1pdCBpZiB5
b3UgbGlrZS4NCj4gPg0KPiA+IEhvdyB3aWxsIHBlb3BsZSBlbmQgdXAgcnVubmluZyB0aGlzIGRl
dmljZSBtaWNyb2NvZGU/ICBJcyB0aGlzIGEgYnVnDQo+ID4gZml4LCBvciBpcyB0aGlzIGdvaW5n
IHRvIG5lZWRsZXNzbHkgcmVkdWNlIHBlcmZvcm1hbmNlIGZvciBwZW9wbGUNCj4gPiB3aXRoDQo+
ID4gZXhpc3RpbmcgaGFyZHdhcmU/DQo+IA0KPiBUaGUgaGFyZHdhcmUgaXMgc3RpbGwgaW4gZGV2
ZWxvcG1lbnQuIEFzIHBhcnQgb2YgdGhlIGRldmVsb3BtZW50LCB0aGUNCj4gZGV2aWNlIG1pY3Jv
Y29kZSB3YXMgY2hhbmdlZCB0byByZXN0cmljdCB0cmFuc2ZlcnMuIFRoZSByZWFzb24gZm9yIHRo
aXMNCj4gcmVzdHJpY3Rpb24gd2FzICJzZWN1cml0eSBjb25jZXJucyIuIFRoaXMgcmVzdHJpY3Rp
b24gZGlzYWxsb3dzIHRoZQ0KPiBsb29wIChvciBicmFuY2gtaWYtbm90LWVxdWFsLWFuZC1pbmNy
ZW1lbnQpIHNlcXVlbmNlciBjb21tYW5kLiBJdCBhbHNvDQo+IGRvZXMgbm90IGFsbG93IHRoZSBy
ZWFkIChvciBzaGlmdCBpbiBpZiB5b3UgcHJlZmVyKSBjb21tYW5kIHRvIHNwZWNpZnkNCj4gdGhl
IG51bWJlciBvZiBieXRlcyBpbiB0aGUgY29tbWFuZCBpdHNlbGYuIFJhdGhlciwgdGhlIG51bWJl
ciBvZiBiaXRzDQo+IHRvIHNoaWZ0IGluIG11c3QgYmUgc3BlY2lmaWVkIGluIGEgc2VwYXJhdGUg
Y29udHJvbCByZWdpc3Rlci4gVGhpcw0KPiBlZmZlY3RpdmVseSBtZWFucyB0aGF0IHRoZSBjb250
cm9sbGVyIGNhbm5vdCB0cmFuc2ZlciBtb3JlIHRoYW4gOCBieXRlcw0KPiBhdCBhIHRpbWUuDQo+
IFRoZXJlZm9yZSBJIHN1cHBvc2UgdGhpcyBpcyBlZmZlY3RpdmVseSBhIGJ1ZyBmaXguIFRoZXJl
IHdpbGwgYmUgbm8NCj4gaGFyZHdhcmUgYXZhaWxhYmxlIHdpdGhvdXQgdGhlc2UgcmVzdHJpY3Rp
b25zLCBzbyBpdCBpcyBub3QgYSBuZWVkbGVzcw0KPiByZWR1Y3Rpb24gaW4gcGVyZm9ybWFuY2Uu
IEV2ZXJ5IHN5c3RlbSB0aGF0IGNhbiBydW4gdGhpcyBkcml2ZXIgd2lsbA0KPiBydW4gdGhlIG1v
cmUgcmVzdHJpY3RpdmUgZGV2aWNlIG1pY3JvY29kZS4NCg0KU28ganVzdCBzYXkgdGhhdCByZWxl
YXNlIHZlcnNpb25zIG9mIHRoZSBoYXJkd2FyZSB3b24ndCBzdXBwb3J0DQptb3JlIHRoYW4gOCBi
eXRlIHRyYW5zZmVycy4NCg0KSGF2aW5nIHNhaWQgdGhhdCwgeW91IG1pZ2h0IHdhbnQgYSBsb29w
IGluIHRoZSBkcml2ZXIgc28gdGhhdA0KYXBwbGljYXRpb24gcmVxdWVzdHMgZm9yIGxvbmdlciB0
cmFuc2ZlcnMgYXJlIGltcGxlbWVudGVkDQp3aXRoIG11bHRpcGxlIGhhcmR3YXJlIHJlcXVlc3Rz
Lg0KDQpJIGRvIGFsc28gd29uZGVyIHdoeSB0aGVyZSBpcyBzdXBwb3J0IGluIHRoZSBtYWluIGtl
cm5lbCBzb3VyY2VzDQpmb3IgaGFyZHdhcmUgdGhhdCBkb2Vzbid0IGFjdHVhbGx5IGV4aXN0Lg0K
DQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQs
IE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86
IDEzOTczODYgKFdhbGVzKQ0K

