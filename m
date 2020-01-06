Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D7F130F91
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 10:35:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rr3V3x7JzDqDd
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 20:35:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=26795e754=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 47rr2f3975zDqBN
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2020 20:35:01 +1100 (AEDT)
IronPort-SDR: rg5kA/lKZ2QtV+RHVHWcPysLf7P8f79DzE35k4VCRt1O1dy7cefUqS9h8ud9p3zLTWydCeWc+b
 v79cfUfq4w2Q==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 06 Jan 2020 17:34:57 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 6 Jan 2020
 17:34:55 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Mon, 6 Jan 2020 17:34:55 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "adathatr@in.ibm.com" <adathatr@in.ibm.com>
Subject: Question about IPMI password MAX length test in
 openbmc-test-automation
Thread-Topic: Question about IPMI password MAX length test in
 openbmc-test-automation
Thread-Index: AdXEdAh4yQYp+bxUT2W6Ec1lkD4tXQ==
Date: Mon, 6 Jan 2020 09:34:55 +0000
Message-ID: <491f35b0a7fd4d10868bee1504f0c03c@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25150.006
x-tm-as-result: No-10--11.915000-8.000000
x-tmase-matchedrid: GBgFBUqwD4En0eXiyLC84BvgzEPRJaDEWw/S0HB7eoMTiSW9r3PknDmy
 vi/pk1f19JtgeSE3W339e3Z/kNGWmIRPgrxmtLhjXKHfOUu3xIAGchEhVwJY36jxqhyDxmYjfeR
 HqXTAYgaSWCW+D1mOc1Mxeks54Zy0gx2yb3aGNmrYeXBrcJgL5OUTAxTwDY0o3PShNosIMB65L4
 5fjiQfpMyGaZe9eC5JiZJ5NuSvuuTioxZcXLuQBqNT4eJsLoMrN3QQml6t1+mXBXaJoB9JZ4MbH
 85DUZXy3QfwsVk0UbvdirxFVpmK9a9AvzbfhvgyGB4kk90qjn9nvFkfMTGkibv+63yw76fxdOjy
 /0RJXwI=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--11.915000-8.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25150.006
x-tm-snts-smtp: BAD53DC654EE76D1768089A4F5D9960B7D7ED0181DF0458E1A2AD4AB3370DA992000:B
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW51c2hhLA0KDQpJIG1ldCBhbiBpc3N1ZSB0aGF0ICJWZXJpZnkgU2V0dGluZyBJUE1JIFVz
ZXIgV2l0aCBJbnZhbGlkIFBhc3N3b3JkIExlbmd0aCIgd2lsbCBmYWlsIHdoZW4NCml0cyB1c2Vy
IGlkIGlzIHNhbWUgYXMgIlZlcmlmeSBTZXR0aW5nIElQTUkgVXNlciBXaXRoIE1heCBQYXNzd29y
ZCBMZW5ndGgiLg0KIA0KVGhpcyBpcyBiZWNhdXNlIHRoZSBwYXNzd29yZCBsZW5ndGggMjAgaGFz
IGJlZW4gc3VjY2Vzc2Z1bGx5IHNldCBpbiAiVmVyaWZ5IFNldHRpbmcgSVBNSSBVc2VyIFdpdGgg
TWF4IFBhc3N3b3JkIExlbmd0aCIuDQpUaGVyZWZvcmUsIHRoZSBjYXNlIG9mIHBhc3N3b3JkX2xl
bmd0aCA9IDIxIGFuZCBwYXNzd29yZF9vcHRpb24gPSAyMCBpcyBleHBlY3RlZCB0byBmYWlsIGJ1
dCBwYXNzIHdoZW4gdGhlaXIgdXNlciBpZCBhcmUgdGhlIHNhbWUuDQoNCkkgaGF2ZSB0d28gc29s
dXRpb25zOg0KDQoxLiBPbmx5IHZlcmlmeSB0aGUgbWVzc2FnZSB0aGF0IGNhbm5vdCB1c2UgaW52
YWxpZCBwYXNzd29yZCBsZW5ndGggdG8gc2V0IHBhc3N3b3JkDQphbmQgZG8gbm90IHZlcmlmeSB0
aGF0IHVzZXIgaXMgYWJsZSB0byBydW4gSVBNSSBjb21tYW5kIHdpdGggZ2l2ZW4gdXNlcm5hbWUg
YW5kIHBhc3N3b3JkIGluIHRoaXMgY2FzZS4NCg0KMi4gQXQgdGhlIGVuZCBvZiBlYWNoIGNhc2Us
IGRlbGV0ZSB0aGUgdXNlciBpdCBqdXN0IGNyZWF0ZWQgdG8gZW5zdXJlIHRoYXQgaXQgd2lsbCBu
b3QgYWZmZWN0IG90aGVyIGNhc2VzLg0KDQpXaGljaCBpcyBiZXR0ZXIsIG9yIGRvIHlvdSBoYXZl
IG90aGVyIHN1Z2dlc3Rpb25zPw0KDQpUaGFua3MNCkJlc3QgUmVnYXJkcywNClRvbnkNCg0K
