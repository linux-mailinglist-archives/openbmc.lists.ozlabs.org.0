Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7941212CD43
	for <lists+openbmc@lfdr.de>; Mon, 30 Dec 2019 08:17:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47mTJn4VnNzDqB9
	for <lists+openbmc@lfdr.de>; Mon, 30 Dec 2019 18:17:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=260dbab58=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 47mTJ33TPMzDq9Z
 for <openbmc@lists.ozlabs.org>; Mon, 30 Dec 2019 18:16:27 +1100 (AEDT)
IronPort-SDR: hGyoCCXdiHreJyyCRi3CtGPodV8LuCSD5D+uBHcpJtjvqb/OQCrXcEtOgv4rNOtJHKg1qR9yM8
 /gX7Q+kpcAdA==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 30 Dec 2019 15:16:23 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 30 Dec
 2019 15:16:19 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Mon, 30 Dec 2019 15:16:19 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: Unable to use IPMI command "set lan access"
Thread-Topic: Unable to use IPMI command "set lan access"
Thread-Index: AdW+4ER9o+VFu5YZR7i1TDBMqzBZCw==
Date: Mon, 30 Dec 2019 07:16:19 +0000
Message-ID: <81e3354bd54948f8a1ead51c5e1487d4@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25136.005
x-tm-as-result: No-10--3.996500-8.000000
x-tmase-matchedrid: TMsvcu6/L5eb5g0gI2gnR5zEHTUOuMX33dCmvEa6IiGoLZarzrrPmZ+C
 GvJI0Sb3BRduVq1YDv1ysl39GV/StzqTwPAovW0E1lPAB9nbhDRbV4KUZZg3KIAQm5cbGx9Dhzg
 LHqCMyqiwSIJPki/yvojC/z3j0I38bw6bxgWmSFya+cpJvTbSHORjZuXE0WlH4nhkC0SGkyTLqK
 AdrGpCH1CRbT0AwgjzggK7rAYtBSOpoPO56643E4Y6rvd2gSeIX7bicKxRIU1mIVC+RmEW7drod
 TA8+XIX+gtHj7OwNO33FLeZXNZS4CiM3WUt6LtFRQAXr3/7wRL2XMi/1969mg9GLEplJZZqKusA
 XGL+M6tuIBZMiJwm7eEcvdQICFQ9MXqaAlIEIDypBmAF8Zv1riegh7gtsM+D5/e06ZNUVHJTKwh
 hBbtKVmr2hqxxFQgJrO69G0lyiGQ=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--3.996500-8.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25136.005
x-tm-snts-smtp: 1FFBB6266477372588F3F658B79C9E42A6E8FFB0E7F04BA16BBAB5349072CF8F2000:B
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

SGkgUmljaGFyZCwNCg0KVGhlIGlwbWkgY29tbWFuZCAic2V0IGxhbiBhY2Nlc3MiIGRvZXMgbm90
IHdvcmsgYmVjYXVzZSB0aGVyZSBpcw0Kbm8gc3BlY2lmeSBvYmplY3QgcGF0aCBpbiB4eXoub3Bl
bmJtY19wcm9qZWN0Lk5ldHdvcmsuDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhv
ci1ob3N0LWlwbWlkL2Jsb2IvbWFzdGVyL3VzZXJfY2hhbm5lbC9jaGFubmVsX21nbXQuY3BwI0w2
MTANCg0KUmVmZXIgdG8NCmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVu
Ym1jL3Bob3NwaG9yLW5ldHdvcmtkLysvMTMxMTQvDQpJdCBzZWVtcyB0aGlzIHBhdGNoIHJlc29s
dmVzIHRoaXMgaXNzdWUuIFdpbGwgdGhlIHBhdGNoIGJlIHVwZGF0ZWQgaW4gdGhlIGZ1dHVyZQ0K
b3IgaXMgdGhlcmUgYW5vdGhlciBzb2x1dGlvbiB0byB0aGlzIHByb2JsZW0/DQoNClRoYW5rcw0K
QmVzdCBSZWdhcmRzLA0KVG9ueQ0KDQo=
