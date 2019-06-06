Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B096371D2
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 12:35:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KMVY4JPFzDqgN
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 20:35:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=053381cd9=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 45KMV34wFYzDqdh
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 20:34:29 +1000 (AEST)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx01.quantatw.com with ESMTP; 06 Jun 2019 18:34:24 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 6 Jun 2019
 18:33:36 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Thu, 6 Jun 2019 18:33:36 +0800
From: =?big5?B?RHVrZSBEdSAop/myu7nFKQ==?= <Duke.Du@quantatw.com>
To: "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Subject: phosphor-pid-control about commit "Add Fan Redundancy Support"
Thread-Topic: phosphor-pid-control about commit "Add Fan Redundancy Support"
Thread-Index: AdUcUv63yA6VzbGXQRuJQTSQmzQbwQ==
Date: Thu, 6 Jun 2019 10:33:36 +0000
Message-ID: <8d8b1c0184c246b589b47ad9b5e11988@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24660.004
x-tm-as-result: No--3.088100-0.000000-31
x-tm-as-matchedid: 700225-703140-701090-703503-704381-700069-700308-705253-7
 03674-705153-704315-700786-704225-704706-148004-148133-10019-41000-42000-42
 003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
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

SGkgSmFtZXMsDQoJV2UgaGF2ZSBzb21lIHByb2JsZW1zIHdpdGggcGhvc3Bob3ItcGlkLWNvbnRy
b2wgYWJvdXQgY29tbWl0ICJBZGQgRmFuIFJlZHVuZGFuY3kgU3VwcG9ydCIgYXMgZm9sbG93cywg
DQogICAgMS4gSG93IHRoZSBpbnRlcmZhY2UgInh5ei5vcGVuYm1jX3Byb2plY3QuQ29udHJvbC5G
YW5SZWR1bmRhbmN5IiB0byBiZSBjcmVhdGVkIGFuZCB3aGVyZSBjYW4gSSBmaW5kIGl0ID8NCiAg
ICAyLiBXaGF0IGtpbmQgb2Ygc2l0dWF0aW9uIHdpbGwgY2hhbmdlIHRoZSBwcm9wZXJ0eSBTdGF0
dXMgb2YgeHl6Lm9wZW5ibWNfcHJvamVjdC5Db250cm9sLkZhblJlZHVuZGFuY3kgdG8gZmFpbCA/
DQoJMy4gV2hlcmUgY2FuIEkgc2V0IHNlbnNvcnMgb2YgcHJvcGVydHkgQ29sbGVjdGlvbiA/DQoN
ClRoYW5rcy4NCkJlc3QgcmVnYXJkcywNCkR1a2UsIER1DQoNCg==
