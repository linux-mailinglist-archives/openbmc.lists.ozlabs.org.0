Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 571DD11DC9A
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 04:28:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Yx2N13kZzDr7H
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 14:28:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=2436d9e8f=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 47Yx1j0xKvzDrC0
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 14:27:28 +1100 (AEDT)
IronPort-SDR: Yyn8pOR0+mqATHZMHR7sfGgUKPJbSeipcmD2Dpf85UC1pOvEMyT5nHyRciCJIqdeKU89gxDLoK
 c+jp6mCi4RFQ==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 13 Dec 2019 11:27:19 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 11:27:15 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Fri, 13 Dec 2019 11:27:15 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: Test case "Verify Get Device ID" in openbmc-test-automation
Thread-Topic: Test case "Verify Get Device ID" in openbmc-test-automation
Thread-Index: AdWxWtbDPNROnIBVTQ23Bto1J9dLBA==
Date: Fri, 13 Dec 2019 03:27:14 +0000
Message-ID: <b0eb13e760e64ab6bf16d287319e4b36@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25100.004
x-tm-as-result: No-10-2.673700-8.000000
x-tmase-matchedrid: dc8Jy61QoRr1DWHi1W6nNBvgzEPRJaDEWw/S0HB7eoMTiSW9r3PknHmp
 YhpUpTLt3UwJgnKc1S4m/dNk7wc2KaeGPGeXYECszNIobH2DzGGjXi/7W48JB1IxScKXZnK0uqB
 E5JB7VxH1JR9FN2G+bhTB5KTtvy+WQJPnjsQiDp8dkma85kGYEZamMVWnRzt+r6YZWwADPmkoU8
 34jt1i1O/Aj8CVQfB48pYyVSLJ3i2MfIz/dNu/Hn/HTU/OBaTGDyV2oSIWznL86vsWRXbgu/TEM
 eCZZJx+7ZbDmJQX+8+bKItl61J/yRf/rowQs3TRJ66gKKuhZcELbigRnpKlKTpcQTtiHDgWqQJA
 v3DlfDJ1mjdPqRHjRFs8p6lA0J/W6g0A/u4o33JU/PdUEUGCeC9akyMPg7AYkM2o8+qQbLZRy2B
 8U7NQUQJZU84xW/mTKKz2OxxCkpzNG0L98j8bMvraKq/vKbWfY+pdIoZ/f0qPQVGyGYqBuWcjFn
 ImzvyS
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10-2.673700-8.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25100.004
x-tm-snts-smtp: 1CD133F3CD9BE0B385815D85BD4041BE1BD2942826660560AA524BBF61D894E42000:B
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
Ym1jLXRlc3QtYXV0b21hdGlvbi9pc3N1ZXMvMTI0NA0KDQpDYXNlICJWZXJpZnkgR2V0IERldmlj
ZSBJRCIgaXMgc3lzdGVtIHNwZWNpZmljLiBCdXQgaXQgdmVyaWZ5IG1jIGluZm8gYnkgaGFyZCBj
b2RlIGN1cnJlbnRseS4NCldlIHdvdWxkIGxpa2UgdG8gYmUgYWJsZSB0byB2YWxpZGF0ZSB0aGlz
IGNhc2UgYWdhaW5zdCBkaWZmZXJlbnQgc3lzdGVtcy4NCg0KSGVyZSBpcyBvdXIgc29sdXRpb246
DQpSZXRyaWV2ZSB0aGUgIkRldmljZSBJRCIsICJEZXZpY2UgUmV2aXNpb24iLCAiTWFudWZhY3R1
cmVyIElEIiBhbmQgIlByb2R1Y3QgSUQiDQpieSBwYXJzaW5nIHRoZSBmaWxlIGRldl9pZC5qc29u
IGluIEJNQy4NClRoZW4gdmVyaWZ5IHRoZSBpdGVtcyBpbiBtYyBpbmZvIHJlc3BlY3RpdmVseS4N
Cmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL29wZW5ibWMtdGVz
dC1hdXRvbWF0aW9uLysvMjc5NDENCg0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMsDQpUb255DQoNCg==
