Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3F61E0804
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 09:29:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VpdV3xPbzDqLD
	for <lists+openbmc@lfdr.de>; Mon, 25 May 2020 17:29:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=407f1e190=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 49Vpcm1tbKzDqKw
 for <openbmc@lists.ozlabs.org>; Mon, 25 May 2020 17:29:07 +1000 (AEST)
IronPort-SDR: 59YJBz67d6+4B8ye5OFFkVtnGT44RAv4G47sjfpHQgWWuWiWQpaoi//ktfi+WZgmDz51hHut39
 v6i+pywfi2Bw==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 25 May 2020 15:29:01 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 25 May
 2020 15:28:58 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Mon, 25 May 2020 15:28:58 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: Question of ipmi command "Set User Access" in phosphor-host-ipmid
Thread-Topic: Question of ipmi command "Set User Access" in phosphor-host-ipmid
Thread-Index: AdYyYr9zUCZXjmdTQfedJ4FkegeSTQ==
Date: Mon, 25 May 2020 07:28:58 +0000
Message-ID: <e46d19fbea37479ca10df26e35d474b2@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 16DC690BF8DABC48FE473ADC5D5069B62F3595D9DE261963D78EB091A0644F6A2000:8
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

SGkgUmljaGFyZCwNCg0KSW4gdGhlIHByb2Nlc3Mgb2YgY3JlYXRpbmcgYW4gdXNlciwNCkkgdXNl
ZCB0aGUgaXBtaSBjb21tYW5kICJpcG1pdG9vbCBwcml2IDx1c2VyIGlkPiA8cHJpdmlsZWdlIGxl
dmVsPiBbPGNoYW5uZWwgbnVtYmVyPl0iLg0KVGhlICJVc2VyUHJpdmlsZWdlIiBvZiB0aGUgdXNl
ciBJIGNyZWF0ZWQgaW4gZGJ1cyBpcyBlbXB0eS4gQmVjYXVzZSBteSBMQU4gY2hhbm5lbCBudW1i
ZXIgaXMgbm90IDEuDQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWhvc3Qt
aXBtaWQvYmxvYi9tYXN0ZXIvdXNlcl9jaGFubmVsL3VzZXJfbWdtdC5jcHAjTDg3OA0KDQpXaHkg
ZGlkIGl0IG5lZWQgdG8gY2hlY2sgdGhlIHJlcXVlc3QgY2hhbm5lbCBudW1iZXIgYmVmb3JlIHNl
dHRpbmcgdGhlIGRidXM/DQpJIGNhbid0IGZpbmQgdGhlIHJlbGF0ZWQgcmVzdHJpY3Rpb24gb2Yg
aXQgaW4gIlNldCBVc2VyIEFjY2VzcyBDb21tYW5kIiBpbiBJUE1JIFNQRUMuDQoNClRoYW5rcw0K
QmVzdCBSZWdhcmRzLA0KVG9ueQ0KDQo=
