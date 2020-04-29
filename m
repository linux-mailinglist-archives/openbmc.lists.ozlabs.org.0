Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9181BD99D
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 12:28:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BvqP5FVVzDr2q
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 20:28:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=3815c1e60=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Wed, 29 Apr 2020 20:27:18 AEST
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 49BvpG2R0YzDqsJ
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 20:27:15 +1000 (AEST)
IronPort-SDR: bMI2sZErMOEVhVAWQXRdBC0Wy1fASV7tHc0PjecUr6GOvqUPyWrNEs3viIhboLdBljewBB/OiS
 4SbCmFmXEHpA==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 29 Apr 2020 18:26:04 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 29 Apr
 2020 18:26:02 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Wed, 29 Apr 2020 18:26:02 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: Test suite 'test_bmc_network_conf' in openbmc-test-automation
Thread-Topic: Test suite 'test_bmc_network_conf' in openbmc-test-automation
Thread-Index: AdYeEGdCkY6HbbSwSXGhsJ5X59kV2w==
Date: Wed, 29 Apr 2020 10:26:02 +0000
Message-ID: <77fbcecc2f4b4ceab3dca7319b2a9f66@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: F04A68D093FCA8F1C8997D3AD927480F0C56B3FF1F608F2170DB842C4C0EB6BB2000:8
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

SGkgUmFodWwsIA0KDQpDYXNlcyBsaWtlICdDb25maWd1cmUgQnJvYWRjYXN0IElQJywgJ0NvbmZp
Z3VyZSBNdWx0aWNhc3QgSVAnIGFuZCAnQ29uZmlndXJlIExvb3BiYWNrIElQJyBpbiByZWRmaXNo
IHRlc3RfYm1jX25ldHdvcmtfY29uZi5yb2JvdC4NCkluIHRoZXNlIGNhc2VzLCB3aGVuIHVzaW5n
IHJlZGZpc2ggdG8gc2V0IGFuIGludmFsaWQgdHlwZSBpcCAoc3VjaCBhcyBicm9hZGNhc3QgaXAp
LCBhbiBIVFRQX0JBRF9SRVFVRVNUIHJlc3BvbnNlIGlzIGV4cGVjdGVkLg0KDQpIb3dldmVyLCB0
aGUgaW52YWxpZCB0eXBlIGlwIGluIG9wZW5ibWMgcmVwbyAnYm1jd2ViJyBoYXMgbm8gcmVzdHJp
Y3Rpb25zLg0KVGhlcmVmb3JlLCB0aG9zZSB0ZXN0IGNhc2VzIHJlbGF0ZWQgdG8gc2V0dGluZyBp
bnZhbGlkIHR5cGUgaXAgb3IgZ2F0ZXdheSB3aWxsIGZhaWwuDQoNCkRvIHlvdSBoYXZlIGFueSBz
dWdnZXN0aW9ucyBmb3IgdGhpcyBpc3N1ZT8gV2lsbCB0aGVzZSBjYXNlcyBhbHNvIGZhaWwgaW4g
eW91ciBlbnZpcm9ubWVudD8NCg0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMsDQpUb255DQoNCg0K
