Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1DD216B1B
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 13:11:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1KVs4JFCzDqpv
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 21:11:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=45039a067=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B1KTy2dHNzDqXv
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jul 2020 21:10:06 +1000 (AEST)
IronPort-SDR: xlJNv2DRDmAwbevdEX6ckaT+Go1Xjs0YLI4DeBOUyfst3u9gD+px7bkoPdtoM/2a7eaC6fQTsH
 aHr/M4vi201g==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 07 Jul 2020 19:09:59 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 7 Jul 2020
 19:09:56 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Tue, 7 Jul 2020 19:09:56 +0800
From: =?big5?B?RGF2aWQgV2FuZyAopP2utqZ0KQ==?= <DavidWang@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Why IPv6AcceptRA is disabled in phosphor-network
Thread-Topic: Why IPv6AcceptRA is disabled in phosphor-network
Thread-Index: AdZUTe8tO+Ptvht9S2iy3iqkLOxtug==
Date: Tue, 7 Jul 2020 11:09:55 +0000
Message-ID: <6213f03910e14149a6964234961ae193@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 0E6A369E7C0F14AC75A571488EE6EF9292503CA8CC493DFCAFEC98FEB7C2E2D42000:8
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgYWxsLA0KICBJIHdhbnQgdG8gc2V0IERIQ1B2NiB0byBlbmFibGUgYnkgZGVmYXVsdCBpbiBt
eSBCTUMuDQpUaGF0IGlzLCBJIGNhbiBkZWxldGUgL2V0Yy9zeXN0ZW1kL25ldHdvcmsvMDAtYm1j
LWV0aCoubmV0d29yaw0KYW5kIHJlYm9vdCBhbmQgc3RpbGwgaGF2ZSBESENQdjYgcmVhY2hhYmxl
Lg0KDQpCdXQgSSBub3RpY2UgdGhhdCBJUHY2QWNjZXB0UkEgaXMgZGlzYWJsZWQgaW4gcGhvc3Bo
b3ItbmV0d29yaw0KaW4gb3JkZXIgbm90IHRvIGhhbmRsZSB0aGUgaXB2NiByb3V0aW5nIGFkdmVy
dGlzZW1lbnQgbWVzc2FnZSBwZXJpb2RpY2FsbHkuDQpTZWU6IGh0dHBzOi8vZ2Vycml0Lm9wZW5i
bWMtcHJvamVjdC54eXovYy9vcGVuYm1jL3Bob3NwaG9yLW5ldHdvcmtkLysvODM2MQ0KDQpXaHkg
d2UgbmVlZCB0byBhdm9pZCBoYW5kbGluZyBSQSBwZXJpb2RpY2FsbHk/DQpEb2VzIGl0IGNhdXNl
IGFueSBiYWQgZWZmZWN0Pw0KSWYgSSB3YW50IHRvIGtlZXAgdGhlIGFjY2VwdGFuY2UgUkEsIGhv
dyBzaG91bGQgSSBjb25maWd1cmUgaXQ/DQpPciBzaG91bGQgSSBqdXN0IHBhdGNoICJJUHY2QWNj
ZXB0UkE9dHJ1ZSIgaW4gcGhvc3Bob3ItbmV0d29yayBvZiBteSBCTUM/DQoNClRoYW5rIHlvdSwN
Cg0KUmVnYXJkcywNCkRhdmlkDQo=
