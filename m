Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 755F0EFCE6
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 13:03:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476pGr44WPzF33Z
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 23:03:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=20550e625=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 476pFX4lsBzF4xt
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 23:02:32 +1100 (AEDT)
IronPort-SDR: EoRyqhgIbOqhkY3iCK0aWYhWHLkHbF5YvFEoSShlkqibQxA8MHgvMVl6a5bB+9bmqy5f3WhRPw
 91gFLa8hXCKA==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 05 Nov 2019 20:02:31 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 5 Nov 2019
 20:02:27 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Tue, 5 Nov 2019 20:02:27 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: James Feist <james.feist@linux.intel.com>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>
Subject: sel-logger package issue
Thread-Topic: sel-logger package issue
Thread-Index: AdWTo46lNIfYSul9Qqq4O62d3ZbzuQ==
Date: Tue, 5 Nov 2019 12:02:27 +0000
Message-ID: <8475c2506dda499788d71ff2b0f25e0f@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25022.006
x-tm-as-result: No-10--1.571600-5.000000
x-tmase-matchedrid: 9886Ub8IUam1r7noZYx5QxvgzEPRJaDEWw/S0HB7eoMTiSW9r3PknEfj
 d+aXilyPCInPV8MyzbYAf/HImzvCGHY917X+PPp6gq+cWtkrZSHLRD51bz5RZLYy6PPkBq0EngI
 gpj8eDcByZ8zcONpAscRB0bsfrpPI34T9cYMsdwyEHJ8CsORlkYw98Uen3EOSt4AM7fwaLxOJWC
 6ji13csIHkGoeHlAcUeHtefjHNnW3fwnM1Ii8/zAwjCaeeoplMrKO81fpYJyvf0ic5zgpSMaAgC
 gKCG9lmDP7ys8dRrrEdy+NYmKKLmVrVflnGTvH9
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--1.571600-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25022.006
x-tm-snts-smtp: 2E86E7D238BDDEE58016BCFA307D47DAEC0E6499EFAC6E5B1D489D979A2849AE2000:B
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

SGksDQoNCkkgZm91bmQgdGhhdCB0aGUgc2VsLWxvZ2dlciBzZXJ2aWNlIGNyYXNoZWQgd2hlbiB0
aGUgIlZhbHVlIG91dCBvZiByYW5nZSJbMV0gZXhjZXB0aW9uIG9jY3VycmVkLg0KDQpbMV1odHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1zZWwtbG9nZ2VyL2Jsb2IvNmFmZTk1NjA4
NTJjNjQzMWM0M2M4ZTc5YTI4ZTJiN2NiNDk4ZTM1NS9pbmNsdWRlL3NlbnNvcnV0aWxzLmhwcCNM
MTY2DQoNCkl0IGlzIGJlY2F1c2UgdGhlIHRyeS1jYXRjaFsyXSBkb2VzIG5vdCBjYXRjaCB0aGUg
ZXhjZXB0aW9uIHR5cGUoc3RkOjpvdXRfb2ZfcmFuZ2UpLg0KVGhlcmVmb3JlLCB5b3UgY2FuIGNo
YW5nZSB0aGUgY2F0Y2ggdHlwZSB0byAic3RkOjpleGNlcHRpb24iIHRvIGNhdGNoIGFsbCB0aGUg
ZXhjZXB0aW9uIG9yIG9ubHkgY2F0Y2ggdGhlICJzdGQ6Om91dF9vZl9yYW5nZSIgdHlwZS4NCg0K
WzJdaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3Itc2VsLWxvZ2dlci9ibG9iLzZh
ZmU5NTYwODUyYzY0MzFjNDNjOGU3OWEyOGUyYjdjYjQ5OGUzNTUvaW5jbHVkZS90aHJlc2hvbGRf
ZXZlbnRfbW9uaXRvci5ocHAjTDE2Mg0KDQoNCkJScywNCldpbGwNCg==
