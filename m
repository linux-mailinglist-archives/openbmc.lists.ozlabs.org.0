Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7FD1EF877
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 14:59:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49djR833J6zDr0p
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 22:59:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=4183acb97=fran.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 71 seconds by postgrey-1.36 at bilbo;
 Fri, 05 Jun 2020 22:58:57 AEST
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 49djQ91xGQzDqvD
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jun 2020 22:58:54 +1000 (AEST)
IronPort-SDR: C0oLhelnhvmn3LODTWDWTfkd0A0/lxTWAYGUaGPlYUfl/FkJrgD9Ssv3lKAO8IIWY9uFuUvAhH
 zBran55pY/+Q==
Received: from unknown (HELO mailbx10.quanta.corp) ([10.243.91.107])
 by mx02.quantatw.com with ESMTP; 05 Jun 2020 20:57:38 +0800
Received: from mailbx10.quanta.corp (10.243.91.107) by mailbx10.quanta.corp
 (10.243.91.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 5 Jun 2020
 20:57:35 +0800
Received: from mailbx10.quanta.corp ([192.168.57.10]) by mailbx10.quanta.corp
 ([192.168.57.10]) with mapi id 15.01.1713.009;
 Fri, 5 Jun 2020 20:57:35 +0800
From: =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: kcsbridge cannot work with the latest sdbusplus package.
Thread-Topic: kcsbridge cannot work with the latest sdbusplus package.
Thread-Index: AdY7ONkP8PPI8i4LSqengBYq7BmgNw==
Date: Fri, 5 Jun 2020 12:57:35 +0000
Message-ID: <25e5caa0753f41f1b6524c351ee87011@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 3CBB01ED41D44C0EDCC0FB67D54893E8811261BAF65D144BD20DCBC9732AAE9F2000:8
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

SGkgQWxsLA0KCUkgYnVpbHQgdGhlIEJNQyBGVyBmcm9tIHRoZSBsYXRlc3QgT3BlbkJNQyBicmFu
Y2guIEFuZCBJIGZvdW5kIHRoZSBrc2MgY2hhbm5lbCBpcyBub3Qgd29ya2luZy4NCkkgZ290IHRo
ZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZToNCglrY3NicmlkZ2VkIC1jIGlwbWkta2NzMQ0KCXRl
cm1pbmF0ZSBjYWxsZWQgYWZ0ZXIgdGhyb3dpbmcgYW4gaW5zdGFuY2Ugb2YgJ3NkYnVzcGx1czo6
ZXhjZXB0aW9uOjpTZEJ1c0Vycm9yJw0KICAJd2hhdCgpOiAgSW52YWxpZCBwYXRoIG9yIGludGVy
ZmFjZTogb3JnLmZyZWVkZXNrdG9wLkRCdXMuRXJyb3IuSW52YWxpZEFyZ3M6IEludmFsaWQgYXJn
dW1lbnQNCglBYm9ydGVkIChjb3JlIGR1bXBlZCkNCiBTbyBJIGRpZCBhIGNoZWNrIG9mIHRoZSBy
ZWNlbnQgcGFja2FnZSBjaGFuZ2VzLg0KVGhlIGxhdGVzdCBzZGJ1c3BsdXMgYWRkIHRoZSAidmFs
aWRhdGUgaW50ZXJmYWNlIGFuZCBwYXRoIHBhc3NlZCB0byBEQnVzIiwgYnV0IHRoZXJlIGlzIGEg
cHJvYmxlbSB3aGVuIGtjc2JyaWRnZSBjYWxsIHRoZSAiYWRkX2ludGVyZmFjZSIgQVBJLCB0aGUg
cGFydCBvZiB0aGUgcmVnZXggY2hlY2tpbmcgZnVuY3Rpb24uDQpodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9zZGJ1c3BsdXMvYmxvYi83ZjY2NDI1NGE0MzY1NjEyYjgyZGIyZmQ4ZmI4Mjc5ODY4
NmU3NzdiL2luY2x1ZGUvc2RidXNwbHVzL2FzaW8vb2JqZWN0X3NlcnZlci5ocHAjTDgxMQ0Ka2Nz
YnJpZGdlIHRha2VzIHRoZSBvbmUgcGFyYW1ldGVyIG9mIHRoZSAvZGV2L2lwbWkta2NzKi4gQnV0
IHJlZ2V4IGZ1bmN0aW9uIGRpZG4ndCBhbGxvdyB0aGUgY2hhcmFjdGVyICctJywgc28gSSBnb3Qg
dGhlIGV4Y2VwdGlvbiBtZXNzYWdlLg0KRG9lcyBpdCBuZWVkIHRvIGFkZCB0aGUgcmVnZXggY2hl
Y2tpbmcgdG8gdGhlICJhZGRfaW50ZXJmYWNlIiBBUEk/IE9yIGFkZCB0aGUgY2hhcmFjdGVyICct
JyB0byB0aGUgcmVnZXggY2hlY2tpbmcgcGF0dGVybj8NCg0KVGhhbmtzDQpGcmFuIEhzdQ0KRS1N
YWlsIDogRnJhbi5Ic3VAUXVhbnRhVFcuY29tDQoNCg==
