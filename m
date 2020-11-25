Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0212C4C61
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 02:06:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChKMl5w9fzDqxB
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 12:06:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=591725123=jun-lin.chen@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CglTF0MX4zDqTm
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 13:39:11 +1100 (AEDT)
IronPort-SDR: eqaLKL9Z1HVT+mXy0vKQQ4iubBguX9y1TJ+tX7enMBhtq+qHB2gBM2h0gy6NnXUa6zHIBTDyeD
 UaTmlEfQRIwQ==
Received: from unknown (HELO mailbx09.quanta.corp) ([10.243.91.106])
 by mx02.quantatw.com with ESMTP; 25 Nov 2020 10:39:09 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx09.quanta.corp
 (10.243.91.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 25 Nov
 2020 10:39:08 +0800
Received: from mailbx09.quanta.corp ([192.168.57.9]) by mailbx09.quanta.corp
 ([192.168.57.9]) with mapi id 15.01.2044.004; Wed, 25 Nov 2020 10:39:08 +0800
From: =?utf-8?B?SnVuLUxpbiBDaGVuICjpmbPkv4rpnJYp?= <Jun-Lin.Chen@quantatw.com>
To: Milton Miller II <miltonm@us.ibm.com>
Subject: RE:  The Subscription will disappear and config of EventService
 restore initial value after reboot
Thread-Topic: The Subscription will disappear and config of EventService
 restore initial value after reboot
Thread-Index: Ada8zTtwo1eSvSPzTqi+6szJ11/xAAB91RmAAQNOOOAAAHncsA==
Date: Wed, 25 Nov 2020 02:39:07 +0000
Message-ID: <cf8515fb323e4f28a961e9f20ca6ff92@quantatw.com>
References: <94a84c0d54f94193be2f21212e3749a7@quantatw.com>
 <OF6C0BDCD9.6939B3A4-ON00258626.00246422-00258626.0024642A@notes.na.collabserv.com>
 <c86861793db64730b5959db71028d87e@quantatw.com>
In-Reply-To: <c86861793db64730b5959db71028d87e@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Nov 2020 12:05:47 +1100
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

SGkgbWlsdG9uLA0KDQpJIGFkZCAnbWtkaXInIGNvbW1hbmQgdG8gYm1jd2ViLmJiYXBwZW5kIHRo
ZW4gaXQgd2lsbCBjcmVhdGUgZGlyZWN0b3J5IHdoaWxlIGJ1aWxkaW5nIGltYWdlLiBJdCB3b3Jr
cyBub3JtYWxseSBub3cuIFRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uLg0KDQpKaW0NCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1pbHRvbiBNaWxsZXIgSUkgPG1pbHRv
bm1AdXMuaWJtLmNvbT4NClNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjAsIDIwMjAgMjozNyBQTQ0K
VG86IEp1bi1MaW4gQ2hlbiAo6Zmz5L+K6ZyWKSA8SnVuLUxpbi5DaGVuQHF1YW50YXR3LmNvbT4N
CkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBUaGUgU3Vic2NyaXB0
aW9uIHdpbGwgZGlzYXBwZWFyIGFuZCBjb25maWcgb2YgRXZlbnRTZXJ2aWNlIHJlc3RvcmUgaW5p
dGlhbCB2YWx1ZSBhZnRlciByZWJvb3QNCg0KT24gTm92ZW1iZXIgMTksIDIwMjAgYXJvdW5kIDEx
OjQ3UE0gaW4gc29tZSB0aW1lem9uZSwgSnVuLUxpbiBDaGVuICjpmbPkv4rpnJYpIHdyb3RlOg0K
DQo+IEhpLA0KPiBJIGhhdmUgYW4gaXNzdWUgYWJvdXQgRXZlbnRTZXJ2aWNlOiBhZnRlciByZWJv
b3QsIFN1YnNjcmlwdGlvbiANCj5kaXNhcHBlYXIgYW5kIGNvbmZpZyBvZiBFdmVudFNlcnZpY2Ug
cmVzdG9yZSBpbml0aWFsIHZhbHVlLg0KPiBJIGxvb2sgdXAgdGhlIGNvZGVzIGluIGV2ZW50X3Nl
cnZpY2VfbWFuYWdlci5ocHAgYW5kIGZvdW5kIA0KPlN1YnNjcmlwdGlvbiBhbmQgRXZlbnRTZXJ2
aWNlIGNvbmZpZyB3aWxsIHN0b3JlIGkgDQo+L3Zhci9saWIvYm1jd2ViL2V2ZW50c2VydmljZV9j
b25maWcuanNvbi4NCj4gQnV0IElmIEJNQyBoYXMgbm8gYm1jd2ViIGZvbGRlciBpbiAvdmFyL2xp
Yi8gLCBJdCBub3Qgc2F2ZSANCj5ldmVudHNlcnZpY2VfY29uZmlnLmpzb24uDQo+ICANCj4gSSB0
cnkgY3JlYXRlIGJtY3dlYiBmb2xkZXIgbWFudWFsbHkgYW5kIFBPU1QgYSBuZXcgU3Vic2NyaXB0
aW9uIHRoZW4gDQo+cmVib290LCB0aGUgU3Vic2NyaXB0aW9uIHdpbGwgYmUgc2F2ZWQgYW5kIG5v
dCBkaXNhcHBlYXIgdGhpcyB0aW1lLg0KPiBUaGlzIHBlcmZvcm1hbmNlIHNlZW1zIHRvIGJlIGlu
Y29uc2lzdGVudCB3aXRoIHRoZSBkZXNpZ24gY29uY2VwdCBpZiANCj50aGVyZSBpcyBubyBibWN3
ZWIgZm9sZGVyIGF0IHRoZSBiZWdpbm5pbmcuIERvZXMgbmVlZCB0byBhZGQgdG8gdGhlIA0KPmNv
ZGUgdGhhdCBkZXRlY3QgdGhlIHBhdGggaXMgdmFsaWQ/DQo+ICANCg0KUmF0aGVyIHRoYW4gYWRk
IHRvIHRoZSBjb2RlIHRvIGRldGVjdCBpZiB0aGUgcGF0aCBpcyB2YWxpZCwgYWRkIHRvIHRoZSBz
ZXJ2aWNlICBzY3JpcHQgYSBwcmVzZXR1cCBjb21tYW5kIHRoYXQgZG9lcyANCidta2RpciAtcCAv
dmFyL2xpYi9ibWN3ZWIvJyB0byBjcmVhdGUgdGhlIGRpcmVjdG9yeS4gICBJZGVhbGx5IHRoaXMg
DQp3b3VsZCBiZSB3cml0dGVuIHRvIGhhdmUgdGhlIHBhdGggaW4gYSBtZXNvbiB2YXJpYWJsZSB0
aGF0IGlzIGJ1aWx0IGludG8gYSBjb25maWd1cmF0aW9uIC5oIGZpbGUgYW5kIGludG8gdGhlIHNl
cnZpY2UgZmlsZSB1c2luZyB2YXJpYWJsZSBzdWJzdGl0aW9uIHRvIG1ha2Ugc3VyZSB0aGUgcGF0
aCBpbiB0aGUgY29kZSBpcyB0aGUgc2FtZSBhcyB0aGUgZGlyZWN0b3J5IGluIHRoZSBzZXJ2aWNl
IGZpbGUuDQoNCm1pbHRvbg0KDQoNCj4gSmltPiAgDQo+ICAgICANCg0K
