Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD9E1DDFFB
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 08:33:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SxXJ1pSVzDqy9
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 16:33:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=404173d94=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 49SxW92sDnzDqSC
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 16:32:48 +1000 (AEST)
IronPort-SDR: 2daTgA0sFOl29m7NjasvzyNfBbhBBvphuY+cAIGYEVfV78D7bZhzJkLnR8Ipk+PrcbZ6ZfN2TZ
 gsa2lAxjWwEA==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 22 May 2020 14:32:45 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 22 May
 2020 14:32:43 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Fri, 22 May 2020 14:32:43 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "sivas.srr@in.ibm.com" <sivas.srr@in.ibm.com>
Subject: Test suite 'test_event_logging' in openbmc-test-automation   
Thread-Topic: Test suite 'test_event_logging' in openbmc-test-automation   
Thread-Index: AdYwAU3Cbxnw7oO2QHG0Q440j4S7gQ==
Date: Fri, 22 May 2020 06:32:43 +0000
Message-ID: <87d0d525b6bc4599b9f85ac0e28fbd0e@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: BA3CF6040F5A156E739BDA1462DDC8015F0E5B12A10DCD75AD82497F764D52CE2000:8
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

SGkgU2l2YXMsDQoNClRoZSBrZXl3b3JkICdDcmVhdGUgVGVzdCBFcnJvciBMb2cnIGlzIHVzZWQg
aW4gdGhpcyB0ZXN0IHN1aXRlIGFuZCB1c2UgYSBiaW5hcnkgJ2xvZ2dpbmctdGVzdCcgdG8gY3Jl
YXRlIHRoZSBlcnJvciBsb2cuDQoNCk15IHF1ZXN0aW9uIGl0IHRoYXQgaG93IGRvZXMgdGhlICds
b2dnaW5nLXRlc3QnIHdvcmsgdG8gY3JlYXRlIHRoZSBlcnJvciBsb2c/DQpEb2VzIGl0IGFsc28g
dXNlIHJlZGZpc2ggb3IgbWF5YmUgY2FsbCBkYnVzIGluIEJNQz8NCg0KVGhhbmtzDQpCZXN0IFJl
Z2FyZHMsDQpUb255DQoNCg==
