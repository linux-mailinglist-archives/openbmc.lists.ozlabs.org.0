Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB46F10A937
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 04:47:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47N6CV2RbFzDqjg
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 14:47:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=227322a56=p.k.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 47N6Bk4XHkzDq60
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 14:46:17 +1100 (AEDT)
IronPort-SDR: Zd2RDtktVCpckOb7u7liYofREN6rNqCU0SPozY7NeVdnX4F5H6KoyWuSgZo0d9syS7B8y70Ras
 vZHzZE8GvpGg==
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx01.quantatw.com with ESMTP; 27 Nov 2019 11:46:14 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 27 Nov
 2019 11:46:12 +0800
Received: from mailbx11.quanta.corp ([192.168.57.11]) by mailbx11.quanta.corp
 ([192.168.57.11]) with mapi id 15.01.1713.009;
 Wed, 27 Nov 2019 11:46:12 +0800
From: =?big5?B?UC4gSy4gTGVlICin9axmvGUp?= <P.K.Lee@quantatw.com>
To: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Subject: Trigger conditions for beeps in x86-power-control
Thread-Topic: Trigger conditions for beeps in x86-power-control
Thread-Index: AQHVpNU2KPK8zdUu+06/pjSbtbok2Q==
Date: Wed, 27 Nov 2019 03:46:12 +0000
Message-ID: <8B379F39-4E90-4C49-8A95-0A365A4DA277@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25068.004
x-tm-as-result: No-10--5.645500-8.000000
x-tmase-matchedrid: h20DFeLkM8+b5g0gI2gnR5zEHTUOuMX33dCmvEa6IiGoLZarzrrPmYln
 5Zr8g5nmX4zBZkugLy3bhCyicp/JyL0iHtbo40Waboe6sMfg+k8GchEhVwJY30vEK4FMJdoqB+0
 4Sblnf6Br/Bu9dH12VQrg0CA7hmxDqRlSh2BLwB/nzlXMYw4XMCAtDqHg/4Qm0C1sQRfQzEHEQd
 G7H66TyF82MXkEdQ779oXx0C7xa4rQI/mW1Yua7qiJDy3nzmbonCUNnHp7cWwZRgUjUoVOjA==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--5.645500-8.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25068.004
x-tm-snts-smtp: E92D18E1521F43A4713C4296B75DEF7E2CD918DB8F1E22432C79B6BCBB5B420C2000:B
Content-Type: text/plain; charset="big5"
Content-ID: <64575E57FAD66345ADA257822C10F529@quantatw.com>
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

SGkgQmlsbHMsDQoNCkkgb2JzZXJ2ZWQgdGhhdCB0aGUgYmVlcCBzb3VuZCB3YXMgdHJpZ2dlcmVk
IGJ5IHJlY2VpdmluZyB0aGUgcHNQcG93ZXJPS0RlQXNzZXJ0IGV2ZW50IGluIHRoZSBzdGF0ZSBv
ZiBwb3dlclN0YXRlT24sIA0KYnV0IG15IG1hY2hpbmUgZG9lcyBub3QgaGF2ZSB0aGUgU0lPX1M1
IEdQSU8gZXZlbnRzLCBzbyBJIG5lZWQgdG8gYWRkIGEganVkZ21lbnQgd2hlbiBhIGJlZXAgc291
bmQgaXMgbmVlZGVkLg0KDQpUaGUgcXVlc3Rpb24gaXMsIGlzIHRoZSBmb3JjZWQgc2h1dGRvd24g
KHByZXNzaW5nIHRoZSBwb3dlciBidXR0b24gZm9yIG1vcmUgdGhhbiA0IHNlY29uZHMpIGluY2x1
ZGVkIGluICJEQyBwb3dlciBpcyB1bmV4cGVjdGVkbHkgbG9zdCIgbWVudGlvbmVkIGluIHRoZSBj
b21tZW50Pw0KDQpUaGFua3MsDQpQLksuDQoNCg==
