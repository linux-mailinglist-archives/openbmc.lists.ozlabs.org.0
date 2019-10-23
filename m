Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED891E0FC5
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 03:45:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yY9v1YpXzDqNk
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 12:45:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=1921e5584=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 46yY981sw2zDqPR
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 12:45:11 +1100 (AEDT)
IronPort-SDR: s2NpIPH1muVzN2EnD8+S8vvhlkH8He6zL6JtDFkqBsja5Ki3CFEhOf56PR/rivJlfbX+QFiOyu
 zG1AiJlYHArA==
Received: from unknown (HELO mailbx09.quanta.corp) ([10.243.91.106])
 by mx01.quantatw.com with ESMTP; 23 Oct 2019 09:45:09 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx09.quanta.corp
 (10.243.91.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 23 Oct
 2019 09:45:05 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Wed, 23 Oct 2019 09:45:05 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Showing signed sensor value when the command "ipmitool sdr" is
 executed.
Thread-Topic: Showing signed sensor value when the command "ipmitool sdr" is
 executed.
Thread-Index: AdWJQxVOJ6ixmrlwSXKaTONZZXz7UQ==
Date: Wed, 23 Oct 2019 01:45:05 +0000
Message-ID: <19467ab292c64593ae4ae7f2882ce61a@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-24996.004
x-tm-as-result: No-10--0.991500-5.000000
x-tmase-matchedrid: u8usGLXufdib5g0gI2gnR5zEHTUOuMX33dCmvEa6IiGoLZarzrrPmXW3
 XCenpuXrf1xSt/ApHHONXA6IRCXBU9f8LDBpR6a614YLSX/JYIqD6a56hLTj5Wjliw+xvItdnL/
 3kgndLptCT4s3SPWw2mDjlAC3n4bD/8TykoC75C1R5q8plSdLkIvkwJz527bY4PdcWsl+C/O6MS
 e39Ehpt+FK6c8K4adwB3tbnpnfEsijxYyRBa/qJcW2Ak5XjlH+fJ5/bZ6npdjKayT/BQTiGsor7
 IhhKtYPnzPENTMJMO0+KLR0wgh79VTmX2x5WnMuy4mQ+98IPwUO+xjWg/ZTjHxIDTivsViBY1QH
 sYMTMmJBeNZ8pgIa/cYcOhvfe+/mcCmyZvDwQy2t5ahRvDIGLa2t1VXHehFey/QKSya4k79DDKa
 3G4nrLQ==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--0.991500-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-24996.004
x-tm-snts-smtp: 0D1BC820AD95045A48F0C164B5BEE05C4C9E87628543C85F0DAEA48693D4D6832000:B
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
Cc: =?big5?B?QnVkZHkgSHVhbmcgKLbApNHCRSk=?= <Buddy.Huang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgdGVhbSwNCg0KVGhlIHRlbXBlcmF0dXJlIHNlbnNvciB2YWx1ZSBtYXkgYmUgbmVnYXRpdmUg
d2hlbiB0aGUgY29tbWFuZCAiaXBtaXRvb2wgc2RyIiBpcyBleGVjdXRlZC4NClNlbnNvciB2YWx1
ZSBjYW4gYmUgYSBzaWduZWQgdmFsdWUgYWNjb3JkaW5nIHRvIGlwbWkgU1BFQyAiVGFibGUgNDMt
LCBGdWxsIFNlbnNvciBSZWNvcmQgLSBTRFIgVHlwZSAwMWgiIGJ5dGUgMjEsICJTZW5zb3IgVW5p
dHMgMSIuDQoNCkhvd2V2ZXIsIHdlIGNhbiBmaW5kIHRoYXQgdGhlIHNlbnNvcl91bml0c18xIGlz
IHNldCB0byB6ZXJvIGluDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1ob3N0
LWlwbWlkL2Jsb2IvbWFzdGVyL3NlbnNvcmhhbmRsZXIuY3BwI0w2ODguDQoNCkFuZCB0aGUgbWV0
aG9kICJzZXRfYW5hbG9nX2RhdGFfZm9ybWF0IiwgYWx0aG91Z2h0IGl0IGhhcyBiZWVuIGRlY2xh
cmVkIGJ1dCBpdCBoYXMgbmV2ZXIgYmVlbiB1c2VkIGluIA0KaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvcGhvc3Bob3ItaG9zdC1pcG1pZC9ibG9iL21hc3Rlci9zZW5zb3JoYW5kbGVyLmhwcCNM
NDk3Lg0KDQpJbiBhZGRpdGlvbiwgc2luY2UgcmF3RGF0YSBoYXMgYmVlbiBjb252ZXJ0ZWQgdG8g
dWludDhfdCBieSBzdGF0aWNfY2FzdCA8dWludDhfdD4sIHRoZXJlIGlzIGFsd2F5cyBhIG5vbmUg
bmVnYXRpdmUgdmFsdWUuIGluDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1o
b3N0LWlwbWlkL2Jsb2IvbWFzdGVyL3NlbnNvcmRhdGFoYW5kbGVyLmhwcCNMMjI5DQoNCkJhc2Vk
IG9uIHRoZSBhYm92ZSB0aHJlZSBwb2ludHMsIGl0IHNlZW1zIHRoYXQgdGhlIGZ1bmN0aW9uIG5l
ZWRzIHRvIGJlIG1vZGlmaWVkDQogc28gdGhhdCB0aGUgc2Vuc29yIHZhbHVlIGNhbiBiZSBkaXNw
bGF5ZWQgYXMgYSBuZWdhdGl2ZSB2YWx1ZSB3aGVuIHRoZSAiaXBtaXRvb2wgc2RyIiBjb21tYW5k
IGlzIGV4ZWN1dGVkLg0KDQpBbSBJIHdyb25nLCBvciBJIG5lZWQgdG8gc2V0IGl0IHVwIHNvbWV3
aGVyZT8NCg0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMsDQpUb255DQoNCg==
