Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1CC13A3B6
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 10:23:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xlPW3QH4zDqNG
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 20:23:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=2756bdd45=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 47xlNg1NFqzDq9W
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 20:22:38 +1100 (AEDT)
IronPort-SDR: Osmp8zdXu5EIj+HqCpahfxPWqTL20Y8kcAQRLLCKp2/Gf5PVctVyYeyGSdFBja7OCJlHq0+X9u
 VNL7hK+ahqoA==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 14 Jan 2020 17:22:34 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 14 Jan
 2020 17:22:31 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Tue, 14 Jan 2020 17:22:31 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: Verify Privilege For Different Channels in openbmc-test-automation
Thread-Topic: Verify Privilege For Different Channels in
 openbmc-test-automation
Thread-Index: AdXKuxmeAxEUTzgySNaVM+b2wNcnWQ==
Date: Tue, 14 Jan 2020 09:22:31 +0000
Message-ID: <10cf015965644daf9cfae7421e9f4710@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 2FD0239F17B5F5E76C887FF8D93D06CDF1266F66D3925FF5D251ECC3E7558EEC2000:8
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUmFodWwsDQoNCkkgbWVldCB3aXRoIGRpZmZpY3VsdGllcyBmb3IgdGhlIGNhc2VzICJWZXJp
ZnkgQWRtaW5pc3RyYXRvciBBbmQgTm8gQWNjZXNzIFByaXZpbGVnZSBGb3IgRGlmZmVyZW50IENo
YW5uZWxzIiBhbmQNCiJWZXJpZnkgT3BlcmF0b3IgQW5kIFVzZXIgUHJpdmlsZWdlIEZvciBEaWZm
ZXJlbnQgQ2hhbm5lbHMiIGluIHRlc3RfaXBtaV91c2VyLnJvYm90Lg0KDQpSZWZlciB0byBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jLXRlc3QtYXV0b21hdGlvbi9pc3N1ZXMvMTUy
Mw0KQWNjb3JkaW5nIHRvIFJpY2hhcmQncyBjb21tZW50OiAiQ2hhbm5lbCBjb21tYW5kIHByaXZp
bGVnZSBhcmUgd29ya2luZyBhcyBwZXIgdGhlIGNoYW5uZWwgKGJ1dCBhdCB0aGlzIHBvaW50IG9m
IHRpbWUgdGhpcyBkaWZmZXJlbnRpYXRpb24gY2FuJ3QgYmUgbWFkZSBkdWUgdG8gYXJjaGl0ZWN0
dXJlIGxpbWl0YXRpb25zLCBidXQgb2sgdG8gd3JpdGUgdGVzdCBjYXNlIGFuZCBtYXJrIGl0IGFz
IGZhaWxlZCwgcmF0aGVyIHRoYW4gc2tpcHBpbmcgdGhlIHNhbWUpIg0KDQpBcmUgdGhlc2UgdHdv
IGNhc2VzIGJlIGV4cGVjdGVkIHRvIGZhaWw/DQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9u
eQ0KDQo=
