Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0801139F6
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 03:36:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T0GZ2L2TzDqYL
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 13:36:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=235f777a0=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 47T0Fn0bYrzDqRR
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 13:35:49 +1100 (AEDT)
IronPort-SDR: Z49mayo3AmgUAobPYwHLqm/V7fYSuBMVsvYlDv/ttF/rpFKm38QqmpqnZWV4ePsbNqDVnrcBjF
 PlRr+pK4AdEg==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 05 Dec 2019 10:35:41 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 10:35:40 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Thu, 5 Dec 2019 10:35:40 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: Test Case "Verify IPMI Root User Password Change" in
 openbmc-test-automation 
Thread-Topic: Test Case "Verify IPMI Root User Password Change" in
 openbmc-test-automation 
Thread-Index: AdWrFEY2F63AP+A9TAS205f6FzSyRg==
Date: Thu, 5 Dec 2019 02:35:39 +0000
Message-ID: <d668c41428ad4e6db20a5221f4a2306b@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25084.003
x-tm-as-result: No-10--10.453400-8.000000
x-tmase-matchedrid: TMsvcu6/L5cn0eXiyLC84IzJSrP8XgcQPknazlXMVpV+SLLtNOiBhrLs
 vs6J0rHdbaAAwsTNebEs48eRdSsNN2X2LZvqrTj65Qo03mEdwAECn5QffvZFlVFbgxCd+zKGC7w
 CgDJ8bdFBOs1PbRLo6DAbdH82TYhSq2VcVGYJ233VsW2YGqoUtOqhuTPUDQDtWkvncDztoltpIb
 9sYgtpsymHmhSmnui8U7dfF4yykpKVzspOxMC4JfVY7U3NX8Jg64sVlliWKx+/WXZS/HqJ2paWK
 ijZlsbB2bNx1HEv7HAqtq5d3cxkNZd/mwLf2BVUgDuk3UwwkMF3hztGpETYo2KxSgx/l51sbCGQ
 SJZI7I9fCOKFKuVYGg==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--10.453400-8.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25084.003
x-tm-snts-smtp: ADD8BD2288CC423A0DB964B8E3A00BEF8148CEFB56B094F8ABB776CFE7A0074A2000:B
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

SGkgUmFodWwsDQoNClJlZmVyZW5jZSB0byBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVu
Ym1jLXRlc3QtYXV0b21hdGlvbi9pc3N1ZXMvMTkyMC4NCg0KQ2FzZSAiVmVyaWZ5IElQTUkgUm9v
dCBVc2VyIFBhc3N3b3JkIENoYW5nZSIgd2lsbCBjaGFuZ2Ugcm9vdCB1c2VyIHBhc3N3b3JkIGFu
ZA0KdW5hYmxlIHRvIHJlc2V0IGRlZmF1bHQgcGFzc3dvcmQgZHVlIHRvIHRoZSBsZW5ndGggaXMg
bGltaXRlZCB0byA4Lg0KQXMgYSByZXN1bHQsIGNhc2VzIHdpbGwgYWxzbyBmYWlsIGFmdGVyIHRo
aXMgYmVjYXVzZSB0aGUgcGFzc3dvcmQgaGFzIGJlZW4gY2hhbmdlZCB0byAwcGVuQm1jMS4NClNo
b3VsZCB3ZSByZW1vdmUgdGhpcyB0ZXN0IGNhc2U/IFRoZXJlIHNlZW1zIHRvIGJlIG5vIG90aGVy
IHdheSB0byBmaXggaXQuDQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0KDQoNCg==
