Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C91273D2
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 04:25:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fDdw73rtzDqty
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 14:25:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=2503569b6=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 47fDdF58s6zDqrs
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 14:24:45 +1100 (AEDT)
IronPort-SDR: MJ/zBRPnB3he1o4gpVsuqT2Nacx8lxCKrmZwEJCPRReZBoHtyh5+ie8sSnccmRsH4FFW78srK7
 CC7vOUBFRPyQ==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 20 Dec 2019 11:24:43 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 20 Dec
 2019 11:24:37 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Fri, 20 Dec 2019 11:24:37 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "micwalsh@us.ibm.com" <micwalsh@us.ibm.com>
Subject: JSON file boot_table in openbmc-test-automation
Thread-Topic: JSON file boot_table in openbmc-test-automation
Thread-Index: AdW25PDauD9IZkN7TnyNdIL4fSiWJA==
Date: Fri, 20 Dec 2019 03:24:37 +0000
Message-ID: <891637d68b4d48459658e139921a5b25@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25114.004
x-tm-as-result: No-10--3.400700-8.000000
x-tmase-matchedrid: w2TFuZOvAteb5g0gI2gnR5zEHTUOuMX33dCmvEa6IiGoLZarzrrPmTYe
 weEUQ/HnusMKJHei8F8ofYGvXrHQytGETJv1/WyOolVO7uyOCDXKNIO4Y+Xr0Arkj7klVufuMna
 dwj0BvkXtRdaYkrITBwd7W56Z3xLIo8WMkQWv6iUDpAZ2/B/Blg1fA1QHegDv3QfwsVk0Ubt2gy
 yw2xTBhTA9VeLdmdBhP0wSl55BuElyYrGH9jnl7tUomYun+un5JCYe58s2JOBMOrMlYPM+zICyy
 sCHU3NQ2OsaC9t3XDis8DtiILu+IN7hHyldoPK3Ce3HhLNk3bDTNQdFAimn3qV/ssqsXD7H1Orp
 Z+EtfaM=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--3.400700-8.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25114.004
x-tm-snts-smtp: DC800BF8583186AAC55F5DC4865FC3825B39B00689F1DB7E9A550F4190B2D2A82000:B
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

SGkgTWljaGFlbCwNCg0KUmVmZXIgdG8gdGhlIG1ldGhvZCByZWFkSG9zdFN0YXRlKCkgaW4gcmVw
byBwaG9zcGhvci1sb2dnaW5nLiBUaGUgZGVzY3JpcHRpb24gDQoiRm9yIGhvc3Qgb24sIGxvb2tz
IGZvciB0aGUgdmFsdWVzIG9mICdCb290Q29tcGxldGUnIG9yICdTdGFuZGJ5Jw0KaW4gdGhlIE9w
ZXJhdGluZ1N5c3RlbVN0YXRlIHByb3BlcnR5IC4uLiINClNvLCBJJ20gd29uZGVyIHRoYXQgaWYg
dGhlIHZhbHVlIG9mIHRoZSBrZXkgIm9wZXJhdGluZ19zeXN0ZW0iIGNhbiBiZQ0KIl5Cb290Q29t
cGxldGV8U3RhbmRieSQiIGZvciBhY3Rpb24gIlBvd2VyIE9uIiBpbiB0aGUgYm9vdF90YWJsZS5q
c29uPw0KDQpUaGFua3MNCkJlc3QgUmVnYXJkcywNClRvbnkNCg0K
