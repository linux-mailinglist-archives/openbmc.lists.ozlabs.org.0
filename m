Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA81435B46
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 09:01:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZdh16PJVz2yp8
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 18:01:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com;
 envelope-from=lin.tommysc@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (unknown [218.32.67.185])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZdgm1VfKz2xsq
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 18:01:39 +1100 (AEDT)
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 15:01:31 +0800
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2308.14 via Frontend Transport; Thu, 21 Oct 2021 15:01:31 +0800
Received: from IEC1-EX2016-01.iec.inventec (iec1-ex2016-01.iec.inventec
 [10.15.2.58])
 by IEC1-MSE-FE2.inventec.com with ESMTP id 19L71LCv011083
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 15:01:21 +0800 (GMT-8)
 (envelope-from Lin.TommySC@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-01.iec.inventec (10.15.2.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.14; Thu, 21 Oct 2021 15:01:22 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007]) by
 IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007%8]) with mapi id
 15.01.2308.014; Thu, 21 Oct 2021 15:01:22 +0800
From: =?big5?B?TGluLlRvbW15U0MgqkylQLTcIFRBTw==?= <Lin.TommySC@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH 2/2] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Topic: [PATCH 2/2] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Index: AQHXxklHwTX2MTXzuUO/N2tnikXos6vdBif4
Date: Thu, 21 Oct 2021 07:01:21 +0000
Message-ID: <3adf961c273c4535a6041fb54af2d610@inventec.com>
References: <d60053760fc145ec97bcb2ad10e97ee1@inventec.com>
In-Reply-To: <d60053760fc145ec97bcb2ad10e97ee1@inventec.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.148.43]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com 19L71LCv011083
X-TM-SNTS-SMTP: 42F0AD44A3A6EC47444D30E31AB62745AB0DDCFA7EB1D2B247108546CD4D65DC2000:8
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
Cc: =?big5?B?WWUuVmljILitpnSyTSBUQU8=?= <ye.vic@inventec.com>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

QWRkIFRyYW5zZm9ybWVycyBkdHMgdG8gYnVpbGQgdGFyZ2V0IGluIE1ha2VmaWxlDQoNClNpZ25l
ZC1vZmYtYnk6IFRvbW15IExpbiA8bGluLnRvbW15c2NAaW52ZW50ZWMuY29tPg0KLS0tDQogYXJj
aC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlIGIvYXJjaC9h
cm0vYm9vdC9kdHMvTWFrZWZpbGUNCmluZGV4IDdlMDkzNDE4MDcyNC4uNGRkMDY3ODk2OTJjIDEw
MDY0NA0KLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUNCisrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL01ha2VmaWxlDQpAQCAtMTQ4MSw2ICsxNDgxLDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hf
QVNQRUVEKSArPSBcDQogICAgICAgIGFzcGVlZC1ibWMtaW50ZWwtczI2MDB3Zi5kdGIgXA0KICAg
ICAgICBhc3BlZWQtYm1jLWluc3B1ci1mcDUyODBnMi5kdGIgXA0KICAgICAgICBhc3BlZWQtYm1j
LWluc3B1ci1uZjUyODBtNi5kdGIgXA0KKyAgICAgICBhc3BlZWQtYm1jLWludmVudGVjLXRyYW5z
Zm9ybWVycy5kdGIgXA0KICAgICAgICBhc3BlZWQtYm1jLWxlbm92by1ocjYzMC5kdGIgXA0KICAg
ICAgICBhc3BlZWQtYm1jLWxlbm92by1ocjg1NXhnMi5kdGIgXA0KICAgICAgICBhc3BlZWQtYm1j
LW1pY3Jvc29mdC1vbHltcHVzLmR0YiBcDQotLQ0KMi4zMy4wDQoNCg==
