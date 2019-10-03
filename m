Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E06B0C96C1
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 04:38:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kHHN19PCzDqXV
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 12:38:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=temperror (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (unknown [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kHGW52J2zDqWW;
 Thu,  3 Oct 2019 12:36:23 +1000 (AEST)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x932J6BT043282;
 Thu, 3 Oct 2019 10:19:06 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 3 Oct
 2019 10:35:03 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Thu, 3 Oct 2019 10:35:02 +0800
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH 0/2] peci: aspeed: Add AST2600 compatible
Thread-Topic: [PATCH 0/2] peci: aspeed: Add AST2600 compatible
Thread-Index: AQHVeOhVfyr8hf/PLEOlKG455HFAV6dHIbEAgABBZgCAABszgIAAsqtw
Date: Thu, 3 Oct 2019 02:35:02 +0000
Message-ID: <4af9eb8fa6fd41fc87708fc8afdcc83e@TWMBX02.aspeed.com>
References: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
 <70044749-785b-6ff3-7a28-fb049dcfec54@linux.intel.com>
 <CACPK8XfBxC+4PHHCkMoXr+twjfWaovcJ5c=hfCmHRJ6LpGNeFg@mail.gmail.com>
 <03d21443-aa9a-a126-dc77-a21f14f708c9@linux.intel.com>
In-Reply-To: <03d21443-aa9a-a126-dc77-a21f14f708c9@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.133]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x932J6BT043282
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSmFlIEh5dW4sDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KRm9yIG5vdyBzaG91bGQg
SSB1c2UgR2l0SHViIHB1bGwtcmVxdWVzdCB0byBzdWJtaXQgdGhlIHBhdGNoZXMgb2YgUEVDSS1y
ZWxhdGVkIGNoYW5nZSB0byBPcGVuQk1DIGRldi01LjMgdHJlZSBvbmx5Pw0KDQpSZWdhcmRzLA0K
Q2hpYXdlaQ0KDQoqKioqKioqKioqKioqIEVtYWlsIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioq
KioqKioqKioqKioqKioqKioNCkRJU0NMQUlNRVI6DQpUaGlzIG1lc3NhZ2UgKGFuZCBhbnkgYXR0
YWNobWVudHMpIG1heSBjb250YWluIGxlZ2FsbHkgcHJpdmlsZWdlZCBhbmQvb3Igb3RoZXIgY29u
ZmlkZW50aWFsIGluZm9ybWF0aW9uLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCBpdCBpbiBlcnJvciwg
cGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGUtbWFpbCBhbmQgaW1tZWRpYXRlbHkg
ZGVsZXRlIHRoZSBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyB3aXRob3V0IGNvcHlpbmcgb3Ig
ZGlzY2xvc2luZyB0aGUgY29udGVudHMuIFRoYW5rIHlvdS4NCg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogSmFlIEh5dW4gWW9vIFttYWlsdG86amFlLmh5dW4ueW9vQGxpbnV4
LmludGVsLmNvbV0gDQpTZW50OiBUaHVyc2RheSwgT2N0b2JlciAzLCAyMDE5IDc6NDMgQU0NClRv
OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KQ2M6IENoaWFXZWkgV2FuZyA8Y2hpYXdl
aV93YW5nQGFzcGVlZHRlY2guY29tPjsgSmFzb24gTSBCaWlscyA8amFzb24ubS5iaWxsc0BsaW51
eC5pbnRlbC5jb20+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWFyayBSdXRs
YW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQu
YXU+OyBsaW51eC1hc3BlZWQgPGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnPjsgT3BlbkJN
QyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsgZGV2aWNldHJlZSA8ZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51eCBBUk0gPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc+OyBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NClN1
YmplY3Q6IFJlOiBbUEFUQ0ggMC8yXSBwZWNpOiBhc3BlZWQ6IEFkZCBBU1QyNjAwIGNvbXBhdGli
bGUNCg0KT24gMTAvMi8yMDE5IDM6MDUgUE0sIEpvZWwgU3RhbmxleSB3cm90ZToNCj4gT24gV2Vk
LCAyIE9jdCAyMDE5IGF0IDE4OjExLCBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5p
bnRlbC5jb20+IHdyb3RlOg0KPj4NCj4+IEhpIENoaWEtV2VpLA0KPj4NCj4+IE9uIDEwLzEvMjAx
OSAxMToxMSBQTSwgQ2hpYS1XZWksIFdhbmcgd3JvdGU6DQo+Pj4gVXBkYXRlIHRoZSBBc3BlZWQg
UEVDSSBkcml2ZXIgd2l0aCB0aGUgQVNUMjYwMCBjb21wYXRpYmxlIHN0cmluZy4NCj4+PiBBIG5l
dyBjb21wdGFiaWxlIHN0cmluZyBpcyBuZWVkZWQgZm9yIHRoZSBleHRlbmRlZCBIVyBmZWF0dXJl
IG9mIA0KPj4+IEFTVDI2MDAuDQo+Pj4NCj4+PiBDaGlhLVdlaSwgV2FuZyAoMik6DQo+Pj4gICAg
IHBlY2k6IGFzcGVlZDogQWRkIEFTVDI2MDAgY29tcGF0aWJsZSBzdHJpbmcNCj4+PiAgICAgZHQt
YmluZGluZ3M6IHBlY2k6IGFzcGVlZDogQWRkIEFTVDI2MDAgY29tcGF0aWJsZQ0KPj4+DQo+Pj4g
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlY2kvcGVjaS1hc3BlZWQudHh0
IHwgMSArDQo+Pj4gICAgZHJpdmVycy9wZWNpL3BlY2ktYXNwZWVkLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMSArDQo+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykNCj4+Pg0KPj4NCj4+IFBFQ0kgc3Vic3lzdGVtIGlzbid0IGluIGxpbnV4IHVwc3RyZWFtIHll
dCBzbyB5b3Ugc2hvdWxkIHN1Ym1pdCBpdCANCj4+IGludG8gT3BlbkJNQyBkZXYtNS4zIHRyZWUg
b25seS4NCj4gDQo+IE9wZW5CTUMgaGFzIGJlZW4gY2FycnlpbmcgdGhlIG91dCBvZiB0cmVlIHBh
dGNoZXMgZm9yIHNvbWUgdGltZSBub3cuIEkgDQo+IGhhdmVuJ3Qgc2VlbiBhIG5ldyB2ZXJzaW9u
IHBvc3RlZCBmb3IgYSB3aGlsZS4gRG8geW91IGhhdmUgYSB0aW1lbGluZSANCj4gZm9yIHdoZW4g
eW91IHBsYW4gdG8gc3VibWl0IGl0IHVwc3RyZWFtPw0KDQpUaGFua3MgZm9yIHlvdXIgZWZmb3J0
IGZvciBjYXJyeWluZyB0aGUgb3V0IG9mIHRyZWUgcGF0Y2hlcyBpbiBPcGVuQk1DLg0KSSBkb24n
dCBoYXZlIGEgZXhhY3QgdGltZWxpbmUgYnV0IEknbSBnb25uYSB1cHN0cmVhbSBpdCBhcyBzb29u
IGFzIGl0IGdldHMgcmVhZHkuDQoNClRoYW5rcywNCg0KSmFlDQo=
