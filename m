Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B2B17AFC
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 15:47:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zd7h1RQYzDqGv
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 23:47:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=024c9d0f4=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44zd663QXrzDqGn
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 23:45:45 +1000 (AEST)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 08 May 2019 21:45:43 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 8 May 2019
 21:45:42 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Wed, 8 May 2019 21:45:41 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: about phosphor pid control package
Thread-Topic: about phosphor pid control package
Thread-Index: AdUFo9RcAeugSeF6TkK3RbzjlTMQiQ==
Date: Wed, 8 May 2019 13:45:41 +0000
Message-ID: <28581f1979a946fdb2f53013bab4661c@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24596.006
x-tm-as-result: No--0.220000-0.000000-31
x-tm-as-matchedid: 140026-701625-704425-700685-703378-702169-105250-700752-7
 04341-704421-701914-700173-708797-188019-148004-148133-41000-42000-42003-63
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksDQoNCkkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0IGdldEZhaWxTYWZlTW9kZSgpLg0KDQpDdXJy
ZW50bHksIG9ubHkgc2Vuc29ycyB0aGF0IGFyZSBkZWZpbmVkIGFzICJ0ZW1wIiB0eXBlcyBjYW4g
YmUgY2hlY2tlZCBmb3IgZmFpbHVyZS4NCkkgZGlkIG5vdCBmaW5kIGFueSAiZmFuIiB0eXBlIHNl
bnNvcnMgdG8gY2hlY2sgaWYgdGhlIGZhbiBoYXMgZmFpbGVkLg0KT3VyIHByb2plY3QgbmVlZCB0
byBjaGVjayB0aGUgZmFuIGZhaWwgc28gIEkgd2FudCB0byBhZGQgYW5vdGhlciAiZmFuIiBzZW5z
b3IgdHlwZSB0byBjaGVjay4NCg0KQ2FuIEkgYWRkIG9uZSBtb3JlICJmb3IgbG9vcCIgdG8gY2hl
Y2sgdGhlIGZhbiBzZW5zb3IgaW4gdXBkYXRlU2Vuc29ycygpIGZ1bmN0aW9uIGluIHpvbmUuY3Bw
Pz8NCg0KZm9yIChjb25zdCBhdXRvJiB0IDogX3RoZXJtYWxJbnB1dHMpDQp7DQogICAgLi4uLi4u
Li4NCn0NCmZvciAoY29uc3QgYXV0byYgdCA6IF9mYW5JbnB1dHMpDQp7DQogICAgLi4uLi4uLi4N
Cn0NCg0KQlJzLA0KV2lsbA0K
