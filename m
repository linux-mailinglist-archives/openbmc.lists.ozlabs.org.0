Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C49561A4
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 07:15:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YWSF1W0WzDqbq
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 15:15:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YWRZ1JqfzDqRK
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 15:14:32 +1000 (AEST)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x5Q50flU005523;
 Wed, 26 Jun 2019 13:00:41 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Wed, 26 Jun
 2019 13:10:47 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Wed, 26 Jun 2019 13:10:46 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, C?ric Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: RE: [RFC PATCH dev-5.1 3/6] irqchip/aspeed-i2c-ic: add I2C SRAM
 enabling control
Thread-Topic: [RFC PATCH dev-5.1 3/6] irqchip/aspeed-i2c-ic: add I2C SRAM
 enabling control
Thread-Index: AQHVJ6HvLShnZ8JPmk6GW8AjxYiUw6alQa9wgACqzoCABjNpAIABSzhw
Date: Wed, 26 Jun 2019 05:10:45 +0000
Message-ID: <aae91ebe2e4d4b8ea56f7df2ce543971@TWMBX02.aspeed.com>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <20190620194922.15093-4-jae.hyun.yoo@linux.intel.com>
 <c64ab19a31d1495f8e137d5ac58645b2@TWMBX02.aspeed.com>
 <2539f657-1966-c00d-dace-fa382bd1b85f@linux.intel.com>
 <ba119b24-6f5d-f25c-fe63-3b3c05d70152@linux.intel.com>
In-Reply-To: <ba119b24-6f5d-f25c-fe63-3b3c05d70152@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.253]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x5Q50flU005523
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gSmFlLA0KCUFjdHVhbGx5LCBteSByZWNvbW1lbmQgaXMgZm9sbG93aW5nLg0KCTEuIE1v
dmUgaTJjIHNjdSByZXNldCB0byBpcnEtYXNwZWVkLWkyYy1pYy5jIGFuZCBhbHNvIGtlZXAgU1JB
TSBidWZmZXIgZW5hYmxlLg0KCTIuIHJlbW92ZSBpMmMgZWFjaCBidXMgcmVzZXQuIA0KUnlhbiAN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEphZSBIeXVuIFlvbyBbbWFpbHRv
OmphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb21dIA0KU2VudDogV2VkbmVzZGF5LCBKdW5lIDI2
LCAyMDE5IDE6MjMgQU0NClRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47
IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT47IEJlbmphbWluIEhl
cnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz47IEM/cmljIExlIEdvYXRlciA8
Y2xnQGthb2Qub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEFuZHJldyBKZWZm
ZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJq
ZWN0OiBSZTogW1JGQyBQQVRDSCBkZXYtNS4xIDMvNl0gaXJxY2hpcC9hc3BlZWQtaTJjLWljOiBh
ZGQgSTJDIFNSQU0gZW5hYmxpbmcgY29udHJvbA0KDQpPbiA2LzIxLzIwMTkgMTE6NDEgQU0sIEph
ZSBIeXVuIFlvbyB3cm90ZToNCj4gT24gNi8yMC8yMDE5IDU6MzMgUE0sIFJ5YW4gQ2hlbiB3cm90
ZToNCj4+IEhlbGxvIEphZSwNCj4+IMKgwqDCoMKgVGhlIGkyYyByZWdpc3RlciBzZXR0aW5nIG11
c3QgYWZ0ZXIgc2N1IHJlc2V0LiAtIA0KPj4gQVBFRURfSTJDX1NSQU1fQlVGRkVSX0VODQo+PiDC
oMKgwqDCoE15IHJlY29tbWVuZCBhc3BlZWQtaTJjLWljLmMgbmVlZCBiZSBwcm9iZSBhZnRlciBz
Y3UgcmVzZXQuIEFuZCANCj4+IGFsbCBvdGhlcnMgaTJjIGJ1cyBpcyBubyBuZWVkZWQgZm9yIHNj
dSByZXNldC4NCj4gDQo+IEhlbGxvIFJ5YW4sDQo+IA0KPiBUaGlzIG1vZHVsZSBpcyByZWdpc3Rl
cmVkIGFmdGVyIHRoZSBTQ1UgcmVzZXQuDQo+IFRoYW5rIHlvdSBmb3IgdGhlIGluZm9ybWF0aW9u
Lg0KPiANCj4gUmVnYXJkcywNCj4gSmFlDQoNCkhlbGxvIFJ5YW4sDQoNCkkgZ290IHlvdXIgcG9p
bnQgbm93LiBZb3UgbWVhbnQgdGhlIEkyQyBIL1cgcmVzZXQgdGhyb3VnaCBTQ1UwNCByZWdpc3Rl
ciwgcmlnaHQ/IEknbGwgbW92ZSB0aGUgU1JBTSBidWZmZXIgZW5hYmxlIGNvbnRyb2wgZnJvbSBp
cnEtYXNwZWVkLWkyYy1pYyBtb2R1bGUgdG8gaTJjLWFzcGVlZCBtb2R1bGUgc28gdGhhdCB0aGUg
U1JBTSBjYW4gYmUgZW5hYmxlZCBjb3JyZWN0bHkuDQoNClRoYW5rcyBmb3IgeW91ciBwb2ludGlu
ZyBpdCBvdXQuDQoNCkphZQ0KDQo+Pg0KPj4gUnlhbg0KPj4NCj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+PiBGcm9tOiBvcGVuYm1jDQo+PiBbbWFpbHRvOm9wZW5ibWMtYm91bmNlcyty
eWFuX2NoZW49YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZ10gT24gDQo+PiBCZWhhbGYg
T2YgSmFlIEh5dW4gWW9vDQo+PiBTZW50OiBGcmlkYXksIEp1bmUgMjEsIDIwMTkgMzo0OSBBTQ0K
Pj4gVG86IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT47IEJlbmph
bWluIA0KPj4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPjsgQz9yaWMg
TGUgR29hdGVyIA0KPj4gPGNsZ0BrYW9kLm9yZz47IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQu
YXU+OyBBbmRyZXcgSmVmZmVyeSANCj4+IDxhbmRyZXdAYWouaWQuYXU+DQo+PiBDYzogb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnOyBKYWUgSHl1biBZb28gDQo+PiA8amFlLmh5dW4ueW9vQGxpbnV4
LmludGVsLmNvbT4NCj4+IFN1YmplY3Q6IFtSRkMgUEFUQ0ggZGV2LTUuMSAzLzZdIGlycWNoaXAv
YXNwZWVkLWkyYy1pYzogYWRkIEkyQyBTUkFNIA0KPj4gZW5hYmxpbmcgY29udHJvbA0KPj4NCj4+
IFRoaXMgY29tbWl0IGFkZHMgSTJDIFNSQU0gZW5hYmxpbmcgY29udHJvbCBmb3IgQVNUMjUwMCBT
b0MgdG8gc3VwcG9ydCANCj4+IGJ1ZmZlciBtb2RlIGFuZCBETUEgbW9kZSB0cmFuc2Zlci4gVGhl
IFNSQU0gaXMgZW5hYmxlZCBieSBkZWZhdWx0IGluDQo+PiBBU1QyNDAwIFNvQy4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+
DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvaXJxY2hpcC9pcnEtYXNwZWVkLWkyYy1pYy5jIHwgOCAr
KysrKysrKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLWFzcGVlZC1pMmMtaWMuYw0KPj4gYi9kcml2
ZXJzL2lycWNoaXAvaXJxLWFzcGVlZC1pMmMtaWMuYw0KPj4gaW5kZXggZjIwMjAwYWYwOTkyLi45
OTk4NWIyMmE5ZmEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWFzcGVlZC1p
MmMtaWMuYw0KPj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1hc3BlZWQtaTJjLWljLmMNCj4+
IEBAIC0xOCw2ICsxOCw5IEBADQo+PiDCoCAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+DQo+PiDC
oCAjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4+ICsvKiBJMkMgR2xvYmFsIENvbnRyb2wgUmVnaXN0
ZXIgKEFTVDI1MDApICovICNkZWZpbmUgDQo+PiArQVNQRUVEX0kyQ19HTE9CQUxfQ1RSTF9SRUfC
oMKgwqAgMHhjICNkZWZpbmXCoCBBU1BFRURfSTJDX1NSQU1fQlVGRkVSX0VOwqDCoMKgIA0KPj4g
K0JJVCgwKQ0KPj4gwqAgI2RlZmluZSBBU1BFRURfSTJDX0lDX05VTV9CVVMgMTQNCj4+IEBAIC0x
MDAsNiArMTAzLDExIEBAIHN0YXRpYyBpbnQgX19pbml0IGFzcGVlZF9pMmNfaWNfb2ZfaW5pdChz
dHJ1Y3QgDQo+PiBkZXZpY2Vfbm9kZSAqbm9kZSwNCj4+IMKgwqDCoMKgwqAgaXJxX3NldF9jaGFp
bmVkX2hhbmRsZXJfYW5kX2RhdGEoaTJjX2ljLT5wYXJlbnRfaXJxLA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXNwZWVkX2kyY19pY19pcnFfaGFuZGxl
ciwgaTJjX2ljKTsNCj4+ICvCoMKgwqAgLyogRW5hYmxlIEkyQyBTUkFNIGJ1ZmZlciBpbiBjYXNl
IG9mIEFTVDI1MDAgKi8NCj4+ICvCoMKgwqAgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5v
ZGUsICJhc3BlZWQsYXN0MjUwMC1pMmMtaWMiKSkNCj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZWwo
QVNQRUVEX0kyQ19TUkFNX0JVRkZFUl9FTiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGkyY19pYy0+YmFzZSArIEFTUEVFRF9JMkNfR0xPQkFMX0NUUkxfUkVHKTsNCj4+ICsNCj4+
IMKgwqDCoMKgwqAgcHJfaW5mbygiaTJjIGNvbnRyb2xsZXIgcmVnaXN0ZXJlZCwgaXJxICVkXG4i
LCANCj4+IGkyY19pYy0+cGFyZW50X2lycSk7DQo+PiDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4g
LS0NCj4+IDIuMjIuMA0KPj4NCg==
