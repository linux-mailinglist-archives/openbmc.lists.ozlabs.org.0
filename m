Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 709406C932
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 08:19:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q3r22632zDqRv
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 16:19:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=09553e69f=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 45q3qS3QhMzDqBZ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 16:18:39 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 18 Jul 2019 14:18:35 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 18 Jul
 2019 14:18:32 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Thu, 18 Jul 2019 14:18:32 +0800
From: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
To: AKASH G J <akashgj91@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Fan not recognized
Thread-Topic: Fan not recognized
Thread-Index: AQHVPInvzg1jDzgaOUyfXS7ho9hy06bP5+OA
Date: Thu, 18 Jul 2019 06:18:32 +0000
Message-ID: <57af9e34cf2e4a1e885e87ff7e9f8319@quantatw.com>
References: <CAE33tLGM-13m=Ni=77vULrqD=d6HRYqZ48rjAy2NV5OenFb9ZA@mail.gmail.com>
In-Reply-To: <CAE33tLGM-13m=Ni=77vULrqD=d6HRYqZ48rjAy2NV5OenFb9ZA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24768.001
x-tm-as-result: No--9.091100-0.000000-31
x-tm-as-matchedid: 140026-150567-700225-703140-701090-703503-701919-705271-7
 01877-704714-703655-704240-701342-704841-701429-703674-702617-704388-188199
 -702601-106660-187067-700562-701029-703914-704053-700863-702438-704997-7038
 15-139504-704706-148004-148133-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
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

SGksIA0KDQpZb3Ugd2FudCB0byB1c2UgdHdvIFBXTXMgdG8gY29udHJvbCBzZXZlbiBmYW5zLCBi
dXQgSSBmb3VuZCBlaWdodCBQV01zIChQV00xflBXTTgpIGluIHlvdXIgaHdtb24gZm9sZGVyLg0K
VGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggeW91ciBmYW4gc2V0dGluZ3Mgb24gZGV2aWNlIHRyZWUu
DQoNCllvdSBjYW4gcmVmZXJlbmNlIHRoZSBmb2xsb3dpbmcgZG9jdW1lbnRhdGlvbiBpbiB5b3Vy
IHByb2plY3QsIHdoaWNoIGV4cGxhaW5zIGhvdyB0byBkZWZpbmUgZmFucyBhdCB0aGUgZGV2aWNl
IHRyZWUuDQoqL2tlcm5lbC1zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2h3bW9uL2FzcGVlZC1wd20tdGFjaG8udHh0DQoNCldpbGwNCg0KDQpGcm9tOiBvcGVuYm1jIFtt
YWlsdG86b3BlbmJtYy1ib3VuY2VzK3dpbGwubGlhbmc9cXVhbnRhdHcuY29tQGxpc3RzLm96bGFi
cy5vcmddIE9uIEJlaGFsZiBPZiBBS0FTSCBHIEoNClNlbnQ6IFdlZG5lc2RheSwgSnVseSAxNywg
MjAxOSA2OjIzIFBNDQpUbzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBGYW4g
bm90IHJlY29nbml6ZWQNCg0KSGkgQWxsLA0KDQpJIGFtIHVzaW5nIGEgc2VydmVyIGJvYXJkIHdp
dGggQk1DIEFzcGVlZCBBU1QtMjUwMCBhbmQgQk1DIGZpcm13YXJlIHdpdGggemFpdXMgY29uZmln
dXJhdGlvbi4gDQoNClNldmVuIGZhbnMgYXJlIGNvbm5lY3RlZCB0byB0aGUgYm9hcmQgYW5kIHdl
IGFyZSB1c2luZyBQV00wIHRvIGNvbnRyb2wgZmlyc3QgZm91ciBmYW5zIGFuZCBQV00xIHRvIMKg
Y29udHJvbCByZW1haW5pbmcgZmFucy4NCg0Kcm9vdEB6YWl1czpscyAvc3lzL2NsYXNzL2h3bW9u
L2h3bW9uMA0KZGV2aWNlIGZhbjRfaW5wdXQgZmFuOF9pbnB1dCBwd20yIHB3bTYgdWV2ZW50DQpm
YW4xX2lucHV0IGZhbjVfaW5wdXQgbmFtZSBwd20zIHB3bTcNCmZhbjJfaW5wdXQgZmFuNl9pbnB1
dCBvZl9ub2RlIHB3bTQgcHdtOA0KZmFuM19pbnB1dCBmYW43X2lucHV0IHB3bTEgcHdtNSBzdWJz
eXN0ZW0NCg0KRXZlbiBjaGFuZ2luZyB2YWx1ZXMgb2YgcHdtMSBhbmQgcHdtMiB0byAwIG9yIDEy
NywgdGhlIHNwZWVkIG9mIHRoZSBmYW4gaXMgbm90IGNoYW5naW5nLg0KDQpBbHNvLCByZWFkaW5n
IHRoZSBmaWxlcyBmYW4xX2lucHV0IHNob3dpbmcgZXJyb3IuDQoNClRoYW5rcyBpbiBhZHZhbmNl
Lg0K
