Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ABCAE756
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 11:52:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SL1g0qrXzDrgp
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 19:52:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=149c6841d=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Sep 2019 19:42:37 AEST
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 46SKnn3wRczDrWQ
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 19:42:35 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 10 Sep 2019 17:41:23 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 10 Sep
 2019 17:41:23 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%3]) with mapi id
 15.01.1713.004; Tue, 10 Sep 2019 17:41:23 +0800
From: =?big5?B?RHVrZSBEdSAop/myu7nFKQ==?= <Duke.Du@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Package dbus-sensors build fail
Thread-Topic: Package dbus-sensors build fail
Thread-Index: AdVnu60zQYlxEWnWSTGQxlLcEDNbzg==
Date: Tue, 10 Sep 2019 09:41:23 +0000
Message-ID: <76010efa07d040d6abcc5a0b51740cc2@quantatw.com>
Accept-Language: en-US, zh-TW
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
Cc: "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQWxsLA0KICBJIGJpdGJha2UgcGFja2FnZSBkYnVzLXNlbnNvcnMgaW4gb3BlbmJtYyByZXBv
IGZkNGY3NTMgaXMgT0sgWzFdLCBidXQgaW4gb3BlbmJtYyByZXBvIGM2ODM4OGYgaXMgZmFpbCBb
Ml0uIEFuZCBJIGdvdCBzb21lIGVycm9ycyBzdWNoIGFzIGNvbXBpbGUgZXJyb3JzLCBmb3IgZXhh
bXBsZSwgdG1wL3dvcmsvYXJtdjdhLW9wZW5ibWMtbGludXgtZ251ZWFiaS9kYnVzLXNlbnNvcnMv
MC4xK2dpdEFVVE9JTkMrMzU0NmFkYjkyYi1yMC9yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9j
KysvOS4yLjAvY29tcGxleDoxOTU1Ojg6IGVycm9yOiBleHBlY3RlZCB1bnF1YWxpZmllZC1pZCBi
ZWZvcmUgJ25hbWVzcGFjZScNCnwgIDE5NTUgfCBpbmxpbmUgbmFtZXNwYWNlIGxpdGVyYWxzIHsN
CnwgICAgICAgfCAgICAgICAgXn5+fn5+fn5+DQp8IG5pbmphOiBidWlsZCBzdG9wcGVkOiBzdWJj
b21tYW5kIGZhaWxlZC4NCiAgDQogIERvIEkgbG9zZSBzb21lIHNldHRpbmdzIGZvciBkYnVzLXNl
bnNvcnMgcGFja2FnZSwgY291bGQgeW91IGdpdmUgbWUgc29tZSBzdWdnZXN0aW9ucywgdGhhbmtz
Lg0KDQpbMV0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy9jb21taXQvZmQ0Zjc1
MzdlYmVlZTQ5NGQ0ZGQ5MWI3NDM4ZWQ5NTEyZWVkYTMwMw0KDQpbMl0gaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvb3BlbmJtYy9jb21taXQvYzY4Mzg4ZmNjYjhjMGI1YmY0ZDZiOGVmZmY5MTIw
Mzc5NmJlOThiMg0KDQpUaGFua3MuDQpEdWtlLCBEdQ0K
