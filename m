Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863BAA4CB
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 15:42:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PMM44vMdzDqsq
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 23:42:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=144806772=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 46PMGz6JhZzDqpp
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 23:39:02 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 05 Sep 2019 21:38:58 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Sep 2019
 21:38:57 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%3]) with mapi id
 15.01.1713.004; Thu, 5 Sep 2019 21:38:57 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: About phosphor-ipmi-host question
Thread-Topic: About phosphor-ipmi-host question
Thread-Index: AdVj7vvtN7ipwP/6QJSKa9lqqDO8Uw==
Date: Thu, 5 Sep 2019 13:38:57 +0000
Message-ID: <9472474a08d4469c825aa2a440ce8ce2@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
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

SGksDQoNCkkgbmVlZCB0byBjYWxpYnJhdGUgdGhlIFNEUiBzZW5zb3IgcmVhZGluZyB2YWx1ZS4N
CkZvciBzb21lIG9mIHRoZSBzcGVjaWZpZWQgc2Vuc29ycywgSSBoYXZlIHRvIGFkanVzdCB0aGUg
InNjYWxlIlsxXSBmaWVsZCB0byAiZG91YmxlIiAobm93IGludDE2X3QpLg0KRG8geW91IGhhdmUg
YW55IGNvbmNlcm4gYWJvdXQgdGhpcyBmaWVsZCBmcm9tIGludDE2X3QgdG8gZG91YmxlPw0KDQpb
MV0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItaG9zdC1pcG1pZC9ibG9iLzdk
YzRhYzAyNDZiZmFlM2RhMDRjMTFlN2EyMDUzZDI4YWNmZGUzNWMvc2NyaXB0cy9zZW5zb3ItZXhh
bXBsZS55YW1sI0wxMTMNCg0KDQpCUnMsDQpXaWxsDQo=
