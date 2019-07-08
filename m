Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4551C61E7F
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 14:34:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45j4dT6LSDzDqVB
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 22:34:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=08570055a=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 45j4cZ14qbzDqQY
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jul 2019 22:33:28 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 08 Jul 2019 20:33:25 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 8 Jul 2019
 20:33:22 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Mon, 8 Jul 2019 20:33:22 +0800
From: =?big5?B?RHVrZSBEdSAop/myu7nFKQ==?= <Duke.Du@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Could phosphor-hwmon support peci-sensors 
Thread-Topic: Could phosphor-hwmon support peci-sensors 
Thread-Index: AdU1iSUCJhGDbsKEQ6GlW/GsUn/vgw==
Date: Mon, 8 Jul 2019 12:33:21 +0000
Message-ID: <79563bbd625f412ab4695049df92a0bd@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24746.005
x-tm-as-result: No--4.515500-0.000000-31
x-tm-as-matchedid: 150588-700225-703140-701090-703503-704381-704585-704225-7
 05244-701029-106230-704706-148004-148133-10007-41000-42000-42003-63
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

SGkgQWxsLA0KICBJIGhhdmUgc29tZSBwcm9ibGVtcyB3aXRoIHBob3NwaG9yLWh3bW9uLiANCkNv
dWxkIHBhY2thZ2UgcGhvc3Bob3ItaHdtb24gc3VwcG9ydHMgcGVjaSBzZW5zb3JzIHN1Y2ggYXMg
Y3B1IGFuZCBkaW1tIHRlbXBhdHVyZXMgPyANCklmIHllcywgY291bGQgeW91IGdpdmUgbWUgc29t
ZSBoaW50cyB0aGF0IGhvdyBkbyBJIHdyaXRlIGNvbmZpZ3VyYXRpb24gZm9yIHBlY2kgc2Vuc29y
cywgcGxlYXNlIDopLiANCg0KVGhhbmtzLiANCkR1a2UsIER1DQo=
