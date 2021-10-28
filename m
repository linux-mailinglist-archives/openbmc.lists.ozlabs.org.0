Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0543D94C
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 04:25:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfqCR29YBz30RS
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 13:25:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com;
 envelope-from=lin.tommysc@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (unknown [218.32.67.185])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfqCC087zz2xlC
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 13:24:53 +1100 (AEDT)
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 28 Oct 2021 10:24:42 +0800
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2308.15 via Frontend Transport; Thu, 28 Oct 2021 10:24:42 +0800
Received: from IEC1-EX2016-01.iec.inventec (iec1-ex2016-01.iec.inventec
 [10.15.2.58])
 by IEC1-MSE-FE1.inventec.com with ESMTP id 19S2Obhm058744
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 10:24:37 +0800 (GMT-8)
 (envelope-from Lin.TommySC@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-01.iec.inventec (10.15.2.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.14; Thu, 28 Oct 2021 10:24:37 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007]) by
 IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007%8]) with mapi id
 15.01.2308.014; Thu, 28 Oct 2021 10:24:37 +0800
From: =?big5?B?TGluLlRvbW15U0MgqkylQLTcIFRBTw==?= <Lin.TommySC@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH] dt-bindings: vendor-prefixes: Add Inventec
Thread-Topic: [PATCH] dt-bindings: vendor-prefixes: Add Inventec
Thread-Index: AQHXy6K467i8Dh7xnEC5Q+4lBC80Eqvnrkvw
Date: Thu, 28 Oct 2021 02:24:37 +0000
Message-ID: <7a62cb26b93c4256a83d6ae941d92b34@inventec.com>
References: <0531f4c274774cb4b2840888ff2b7ebd@inventec.com>
In-Reply-To: <0531f4c274774cb4b2840888ff2b7ebd@inventec.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.148.43]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE1.inventec.com 19S2Obhm058744
X-TM-SNTS-SMTP: DEA3FA4DDA82A14864EFB53B174874EBF50EF5099F46D49227085D598CFD7E3F2000:8
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

SW52ZW50ZWMgQ29ycG9yYXRpb24uIChodHRwczovL3d3dy5pbnZlbnRlYy5jb20vZW4pLCBjb21t
b25seSBrbm93biBhcyBJbnZlbnRlYywgaXMgYSBtYW51ZmFjdHVyZXIgb2Ygc2VydmVyIGFuZCBs
YXB0b3AgaGFyZHdhcmUuDQoNClNpZ25lZC1vZmYtYnk6IFRvbW15IExpbiA8bGluLnRvbW15c2NA
aW52ZW50ZWMuY29tPg0KLS0tDQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Zl
bmRvci1wcmVmaXhlcy55YW1sIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5k
b3ItcHJlZml4ZXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5k
b3ItcHJlZml4ZXMueWFtbA0KaW5kZXggYTg2N2Y3MTAyYzM1Li40NGUxNWIzNmM0ZjggMTAwNjQ0
DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJl
Zml4ZXMueWFtbA0KQEAgLTU1Myw2ICs1NTMsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoNCiAgICAg
ZGVzY3JpcHRpb246IEludGVyIENvbnRyb2wgR3JvdXANCiAgICJeaW52ZW5zZW5zZSwuKiI6DQog
ICAgIGRlc2NyaXB0aW9uOiBJbnZlblNlbnNlIEluYy4NCisgICJeaW52ZW50ZWMsLioiOg0KKyAg
ICBkZXNjcmlwdGlvbjogSW52ZW50ZWMgQ29ycG9yYXRpb24NCiAgICJeaW52ZXJzZXBhdGgsLioi
Og0KICAgICBkZXNjcmlwdGlvbjogSW52ZXJzZSBQYXRoDQogICAiXmlvbSwuKiI6DQotLQ0KMi4z
My4wDQoNCg==
