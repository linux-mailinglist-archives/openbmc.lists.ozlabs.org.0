Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D37AB4329E0
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 00:51:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYBtx3mM9z305C
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 09:51:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=61.220.76.156; helo=mail.inventec.com;
 envelope-from=lin.tommysc@inventec.com; receiver=<UNKNOWN>)
X-Greylist: delayed 904 seconds by postgrey-1.36 at boromir;
 Thu, 14 Oct 2021 13:47:04 AEDT
Received: from mail.inventec.com (61-220-76-156.hinet-ip.hinet.net
 [61.220.76.156])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVDMD6ssnz2xtj
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 13:47:04 +1100 (AEDT)
Received: from IEC1-EX2016-03.iec.inventec (10.15.2.59) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 14 Oct 2021 10:31:49 +0800
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server id
 15.1.2308.14 via Frontend Transport; Thu, 14 Oct 2021 10:31:48 +0800
Received: from IEC1-EX2016-02.iec.inventec (iec1-ex2016-02.iec.inventec
 [10.1.254.221])
 by IEC1-MSE-FE2.inventec.com with ESMTP id 19E2Vloe087317
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 10:31:47 +0800 (GMT-8)
 (envelope-from Lin.TommySC@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-02.iec.inventec (10.1.254.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 14 Oct 2021 10:31:47 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007]) by
 IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007%8]) with mapi id
 15.01.2308.014; Thu, 14 Oct 2021 10:31:47 +0800
From: =?big5?B?TGluLlRvbW15U0MgqkylQLTcIFRBTw==?= <Lin.TommySC@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH v2] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Topic: [PATCH v2] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Index: AQHXwKNCpIlpS3Zzk0u4F9ucNjrfgKvRxce0
Date: Thu, 14 Oct 2021 02:31:47 +0000
Message-ID: <e57d58c0b44b4a289c580e188f7d5580@inventec.com>
References: <3a7fed78df06416da20ec72f14111c97@inventec.com>
In-Reply-To: <3a7fed78df06416da20ec72f14111c97@inventec.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.148.43]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com 19E2Vloe087317
X-TM-SNTS-SMTP: 369B1457E100F7B5CF1435AFABE56A4F1C052462FF96E61781F65234EFC78C0C2000:8
X-Mailman-Approved-At: Tue, 19 Oct 2021 09:51:07 +1100
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

SW5pdGlhbCBpbnRyb2R1Y3Rpb24gb2YgSW52ZW50ZWMgVHJhbnNmb3JtZXJzIHg4NiBmYW1pbHkg
ZXF1aXBwZWQgd2l0aCBBU1QyNjAwIEJNQyBTb0MuDQoNClNpZ25lZC1vZmYtYnk6IFRvbW15IExp
biA8TGluLlRvbW15U0NAaW52ZW50ZWMuY29tPg0KLS0tDQogYXJjaC9hcm0vYm9vdC9kdHMvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCiAuLi4vZHRzL2FzcGVlZC1ibWMtaW52
ZW50ZWMtdHJhbnNmb3JtZXJzLmR0cyAgfCA0NTcgKysrKysrKysrKysrKysrKysrDQogMiBmaWxl
cyBjaGFuZ2VkLCA0NTggaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHMNCg0KZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlIGIvYXJjaC9hcm0vYm9vdC9kdHMvTWFr
ZWZpbGUNCmluZGV4IDQ4ZDQ4Yzg1ZGU5ZS4uOTMwYjhiYTZjM2M1IDEwMDY0NA0KLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUNCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxl
DQpAQCAtMTQwNyw2ICsxNDA3LDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hfQVNQRUVEKSArPSBcDQog
ICAgICAgIGFzcGVlZC1ibWMtaW50ZWwtczI2MDB3Zi5kdGIgXA0KICAgICAgICBhc3BlZWQtYm1j
LWluc3B1ci1mcDUyODBnMi5kdGIgXA0KICAgICAgICBhc3BlZWQtYm1jLWluc3B1ci1uZjUyODBt
Ni5kdGIgXA0KKyAgICAgICBhc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdGIgXA0K
ICAgICAgICBhc3BlZWQtYm1jLWxlbm92by1ocjYzMC5kdGIgXA0KICAgICAgICBhc3BlZWQtYm1j
LWxlbm92by1ocjg1NXhnMi5kdGIgXA0KICAgICAgICBhc3BlZWQtYm1jLW1pY3Jvc29mdC1vbHlt
cHVzLmR0YiBcDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZl
bnRlYy10cmFuc2Zvcm1lcnMuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1pbnZl
bnRlYy10cmFuc2Zvcm1lcnMuZHRzDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAw
MDAwMDAwLi43MWU4NTY5NGMzYzcNCi0tLSAvZGV2L251bGwNCisrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJzLmR0cw0KQEAgLTAsMCArMSw0NTcg
QEANCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcg0KKy8vIENv
cHlyaWdodCAyMDIxIEludmVudGVjIENvcnAuDQorDQorL2R0cy12MS87DQorDQorI2luY2x1ZGUg
ImFzcGVlZC1nNi5kdHNpIg0KKyNpbmNsdWRlICJhc3BlZWQtZzYtcGluY3RybC5kdHNpIg0KKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9pMmMvaTJjLmg+DQorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dw
aW8vYXNwZWVkLWdwaW8uaD4NCisNCisvIHsNCisgICAgICAgbW9kZWwgPSAiVFJBTlNGT1JNRVJT
IEJNQyI7DQorICAgICAgIGNvbXBhdGlibGUgPSAiaW52ZW50ZWMsdHJhbnNmb3JtZXItYm1jIiwg
ImFzcGVlZCxhc3QyNjAwIjsNCisNCisgICAgICAgYWxpYXNlcyB7DQorICAgICAgICAgICAgICAg
c2VyaWFsNCA9ICZ1YXJ0NTsNCisgICAgICAgfTsNCisNCisgICAgICAgY2hvc2VuIHsNCisgICAg
ICAgICAgICAgICBzdGRvdXQtcGF0aCA9ICZ1YXJ0NTsNCisgICAgICAgICAgICAgICBib290YXJn
cyA9ICJjb25zb2xlPXR0eVM0LDExNTIwMG44IjsNCisgICAgICAgfTsNCisNCisgICAgICAgbWVt
b3J5QDgwMDAwMDAwIHsNCisgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0K
KyAgICAgICAgICAgICAgIHJlZyA9IDwweDgwMDAwMDAwIDB4ODAwMDAwMDA+Ow0KKyAgICAgICB9
Ow0KKw0KKyAgICAgICBpaW8taHdtb24gew0KKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
aWlvLWh3bW9uIjsNCisgICAgICAgICAgICAgICBpby1jaGFubmVscyA9IDwmYWRjMCAwPiwgPCZh
ZGMwIDE+LCA8JmFkYzAgMj4sIDwmYWRjMCAzPiwgPCZhZGMwIDQ+Ow0KKyAgICAgICB9Ow0KKw0K
KyAgICAgICBsZWRzIHsNCisgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImdwaW8tbGVkcyI7
DQorDQorICAgICAgICAgICAgICAgLy8gVUlEIGxlZA0KKyAgICAgICAgICAgICAgIHVpZCB7DQor
ICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJVSURfTEVEIjsNCisgICAgICAgICAgICAg
ICAgICAgICAgIGdwaW9zID0gPCZncGlvMCBBU1BFRURfR1BJTyhYLCAwKSBHUElPX0FDVElWRV9M
T1c+Ow0KKyAgICAgICAgICAgICAgIH07DQorDQorICAgICAgICAgICAgICAgLy8gSGVhcnQgYmVh
dCBsZWQNCisgICAgICAgICAgICAgICBoZWFydGJlYXQgew0KKyAgICAgICAgICAgICAgICAgICAg
ICAgbGFiZWwgPSAiSEJfTEVEIjsNCisgICAgICAgICAgICAgICAgICAgICAgIGdwaW9zID0gPCZn
cGlvMCBBU1BFRURfR1BJTyhQLCA3KSBHUElPX0FDVElWRV9MT1c+Ow0KKyAgICAgICAgICAgICAg
IH07DQorICAgICAgIH07DQorDQorICAgICAgIHB3bV90YWNobyB7DQorICAgICAgICAgICAgICAg
ICAgICAgICBzdGF0dXMgPSAib2theSI7DQorICAgICAgICAgICAgICAgICAgICAgICBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOw0KKyAgICAgICAgICAgICAgICAgICAgICAgcGluY3RybC0wID0g
PCZwaW5jdHJsX3B3bTBfZGVmYXVsdCAmcGluY3RybF90YWNoMF9kZWZhdWx0DQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwaW5jdHJsX3B3
bTFfZGVmYXVsdCAmcGluY3RybF90YWNoMV9kZWZhdWx0DQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwaW5jdHJsX3B3bTJfZGVmYXVsdCAm
cGluY3RybF90YWNoMl9kZWZhdWx0DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICZwaW5jdHJsX3B3bTNfZGVmYXVsdCAmcGluY3RybF90YWNo
M19kZWZhdWx0DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICZwaW5jdHJsX3B3bTRfZGVmYXVsdCAmcGluY3RybF90YWNoNF9kZWZhdWx0DQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZw
aW5jdHJsX3B3bTVfZGVmYXVsdCAmcGluY3RybF90YWNoNV9kZWZhdWx0DQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwaW5jdHJsX3B3bTZf
ZGVmYXVsdCAmcGluY3RybF90YWNoNl9kZWZhdWx0DQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwaW5jdHJsX3B3bTdfZGVmYXVsdCAmcGlu
Y3RybF90YWNoN19kZWZhdWx0DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmcGluY3RybF90YWNoOF9kZWZhdWx0DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmcGluY3RybF90YWNoOV9kZWZhdWx0DQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmcGluY3RybF90YWNoMTBfZGVmYXVsdA0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJnBpbmN0cmxfdGFjaDExX2RlZmF1bHQNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwaW5jdHJsX3RhY2gxMl9kZWZhdWx0DQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcGluY3RybF90YWNoMTNfZGVmYXVs
dA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBpbmN0cmxfdGFjaDE0
X2RlZmF1bHQNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwaW5jdHJs
X3RhY2gxNV9kZWZhdWx0PjsNCisgICAgICAgICAgICAgICBmYW5AMCB7DQorICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MHgwMD47DQorICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQs
dGFyZ2V0X3B3bSA9IDwyNTAwMD47DQorICAgICAgICAgICAgICAgICAgICAgICBjb29saW5nLWxl
dmVscyA9IDwxMjUgMTUxIDE3NyAyMDMgMjI5IDI1NT47DQorICAgICAgICAgICAgICAgICAgICAg
ICBhc3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwMD47DQorICAgICAgICAgICAgICAgICAgICAgICBh
c3BlZWQsbWluX3JwbSA9IDw3NTAwMDA+Ow0KKyAgICAgICAgICAgICAgIH07DQorDQorICAgICAg
ICAgICAgICAgZmFuQDEgew0KKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDE+Ow0K
KyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLHRhcmdldF9wd20gPSA8MjUwMDA+Ow0KKyAg
ICAgICAgICAgICAgICAgICAgICAgY29vbGluZy1sZXZlbHMgPSA8MTI1IDE1MSAxNzcgMjAzIDIy
OSAyNTU+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLGZhbi10YWNoLWNoID0gPDB4
MDE+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLG1pbl9ycG0gPSA8NzUwMDAwPjsN
CisgICAgICAgICAgICAgICB9Ow0KKw0KKyAgICAgICAgICAgICAgIGZhbkAyIHsNCisgICAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwweDAyPjsNCisgICAgICAgICAgICAgICAgICAgICAgIGFz
cGVlZCx0YXJnZXRfcHdtID0gPDI1MDAwPjsNCisgICAgICAgICAgICAgICAgICAgICAgIGNvb2xp
bmctbGV2ZWxzID0gPDEyNSAxNTEgMTc3IDIwMyAyMjkgMjU1PjsNCisgICAgICAgICAgICAgICAg
ICAgICAgIGFzcGVlZCxmYW4tdGFjaC1jaCA9IDwweDAyPjsNCisgICAgICAgICAgICAgICAgICAg
ICAgIGFzcGVlZCxtaW5fcnBtID0gPDc1MDAwMD47DQorICAgICAgICAgICAgICAgfTsNCisNCisg
ICAgICAgICAgICAgICBmYW5AMyB7DQorICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgw
Mz47DQorICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQsdGFyZ2V0X3B3bSA9IDwyNTAwMD47
DQorICAgICAgICAgICAgICAgICAgICAgICBjb29saW5nLWxldmVscyA9IDwxMjUgMTUxIDE3NyAy
MDMgMjI5IDI1NT47DQorICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2gg
PSA8MHgwMz47DQorICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQsbWluX3JwbSA9IDw3NTAw
MDA+Ow0KKyAgICAgICAgICAgICAgIH07DQorDQorICAgICAgICAgICAgICAgZmFuQDQgew0KKyAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDQ+Ow0KKyAgICAgICAgICAgICAgICAgICAg
ICAgYXNwZWVkLHRhcmdldF9wd20gPSA8MjUwMDA+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAg
Y29vbGluZy1sZXZlbHMgPSA8MTI1IDE1MSAxNzcgMjAzIDIyOSAyNTU+Ow0KKyAgICAgICAgICAg
ICAgICAgICAgICAgYXNwZWVkLGZhbi10YWNoLWNoID0gPDB4MDQ+Ow0KKyAgICAgICAgICAgICAg
ICAgICAgICAgYXNwZWVkLG1pbl9ycG0gPSA8NzUwMDAwPjsNCisgICAgICAgICAgICAgICB9Ow0K
Kw0KKyAgICAgICAgICAgICAgIGZhbkA1IHsNCisgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDA1PjsNCisgICAgICAgICAgICAgICAgICAgICAgIGFzcGVlZCx0YXJnZXRfcHdtID0gPDI1
MDAwPjsNCisgICAgICAgICAgICAgICAgICAgICAgIGNvb2xpbmctbGV2ZWxzID0gPDEyNSAxNTEg
MTc3IDIwMyAyMjkgMjU1PjsNCisgICAgICAgICAgICAgICAgICAgICAgIGFzcGVlZCxmYW4tdGFj
aC1jaCA9IDwweDA1PjsNCisgICAgICAgICAgICAgICAgICAgICAgIGFzcGVlZCxtaW5fcnBtID0g
PDc1MDAwMD47DQorICAgICAgICAgICAgICAgfTsNCisNCisgICAgICAgICAgICAgICBmYW5ANiB7
DQorICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwNj47DQorICAgICAgICAgICAgICAg
ICAgICAgICBhc3BlZWQsdGFyZ2V0X3B3bSA9IDwyNTAwMD47DQorICAgICAgICAgICAgICAgICAg
ICAgICBjb29saW5nLWxldmVscyA9IDwxMjUgMTUxIDE3NyAyMDMgMjI5IDI1NT47DQorICAgICAg
ICAgICAgICAgICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwNj47DQorICAgICAgICAg
ICAgICAgICAgICAgICBhc3BlZWQsbWluX3JwbSA9IDw3NTAwMDA+Ow0KKyAgICAgICAgICAgICAg
IH07DQorDQorICAgICAgICAgICAgICAgZmFuQDcgew0KKyAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4MDc+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLHRhcmdldF9wd20g
PSA8MjUwMDA+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgY29vbGluZy1sZXZlbHMgPSA8MTI1
IDE1MSAxNzcgMjAzIDIyOSAyNTU+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLGZh
bi10YWNoLWNoID0gPDB4MDc+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLG1pbl9y
cG0gPSA8NzUwMDAwPjsNCisgICAgICAgICAgICAgICB9Ow0KKw0KKyAgICAgICAgICAgICAgIGZh
bkA4IHsNCisgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDA4PjsNCisgICAgICAgICAg
ICAgICAgICAgICAgIGFzcGVlZCxmYW4tdGFjaC1jaCA9IDwweDA4PjsNCisgICAgICAgICAgICAg
ICB9Ow0KKw0KKyAgICAgICAgICAgICAgIGZhbkA5IHsNCisgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwweDA5PjsNCisgICAgICAgICAgICAgICAgICAgICAgIGFzcGVlZCxmYW4tdGFjaC1j
aCA9IDwweDA5PjsNCisgICAgICAgICAgICAgICB9Ow0KKw0KKyAgICAgICAgICAgICAgIGZhbkAx
MCB7DQorICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwYT47DQorICAgICAgICAgICAg
ICAgICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2ggPSA8MHgwYT47DQorICAgICAgICAgICAgICAg
fTsNCisNCisgICAgICAgICAgICAgICBmYW5AMTEgew0KKyAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4MGI+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgYXNwZWVkLGZhbi10YWNoLWNo
ID0gPDB4MGI+Ow0KKyAgICAgICAgICAgICAgIH07DQorDQorICAgICAgICAgICAgICAgZmFuQDEy
IHsNCisgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDBjPjsNCisgICAgICAgICAgICAg
ICAgICAgICAgIGFzcGVlZCxmYW4tdGFjaC1jaCA9IDwweDBjPjsNCisgICAgICAgICAgICAgICB9
Ow0KKw0KKyAgICAgICAgICAgICAgIGZhbkAxMyB7DQorICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwZD47DQorICAgICAgICAgICAgICAgICAgICAgICBhc3BlZWQsZmFuLXRhY2gtY2gg
PSA8MHgwZD47DQorICAgICAgICAgICAgICAgfTsNCisNCisgICAgICAgICAgICAgICBmYW5AMTQg
ew0KKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MGU+Ow0KKyAgICAgICAgICAgICAg
ICAgICAgICAgYXNwZWVkLGZhbi10YWNoLWNoID0gPDB4MGU+Ow0KKyAgICAgICAgICAgICAgIH07
DQorDQorICAgICAgICAgICAgICAgZmFuQDE1IHsNCisgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDBmPjsNCisgICAgICAgICAgICAgICAgICAgICAgIGFzcGVlZCxmYW4tdGFjaC1jaCA9
IDwweDBmPjsNCisgICAgICAgICAgICAgICB9Ow0KKyAgICAgICB9Ow0KK307DQorDQorJm1kaW8w
IHsNCisgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKw0KKyAgICAgICBldGhwaHkwOiBldGhlcm5l
dC1waHlAMCB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWVl
ZTgwMi4zLWMyMiI7DQorICAgICAgICAgICAgICAgcmVnID0gPDE+Ow0KKyAgICAgICB9Ow0KK307
DQorDQorJm1hYzMgew0KKyAgICAgICBzdGF0dXMgPSAib2theSI7DQorICAgICAgIHBoeS1tb2Rl
ID0gInJnbWlpIjsNCisgICAgICAgcGh5LWhhbmRsZSA9IDwmZXRocGh5MD47DQorICAgICAgIHBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQorICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9y
Z21paTRfZGVmYXVsdD47DQorfTsNCisNCismZm1jIHsNCisgICAgICAgc3RhdHVzID0gIm9rYXki
Ow0KKw0KKyAgICAgICBmbGFzaEAwIHsNCisgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7
DQorICAgICAgICAgICAgICAgbTI1cCxmYXN0LXJlYWQ7DQorICAgICAgICAgICAgICAgbGFiZWwg
PSAiYm1jIjsNCisgICAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDwzMzAwMDAwMD47
DQorICAgICAgICAgICAgICAgc3BpLXR4LWJ1cy13aWR0aCA9IDwyPjsNCisgICAgICAgICAgICAg
ICBzcGktcngtYnVzLXdpZHRoID0gPDI+Ow0KKyNpbmNsdWRlICJvcGVuYm1jLWZsYXNoLWxheW91
dC5kdHNpIg0KKyAgICAgICB9Ow0KKw0KKyAgICAgICBmbGFzaEAxIHsNCisgICAgICAgICAgICAg
ICBzdGF0dXMgPSAib2theSI7DQorICAgICAgICAgICAgICAgbTI1cCxmYXN0LXJlYWQ7DQorICAg
ICAgICAgICAgICAgbGFiZWwgPSAiYm1jMiI7DQorICAgICAgICAgICAgICAgc3BpLW1heC1mcmVx
dWVuY3kgPSA8MzMwMDAwMDA+Ow0KKyAgICAgICAgICAgICAgIHNwaS10eC1idXMtd2lkdGggPSA8
Mj47DQorICAgICAgICAgICAgICAgc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsNCisgICAgICAgfTsN
Cit9Ow0KKw0KKyZzcGkxIHsNCisgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKyAgICAgICBwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOw0KKyAgICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfc3Bp
MV9kZWZhdWx0PjsNCisNCisgICAgICAgZmxhc2hAMCB7DQorICAgICAgICAgICAgICAgc3RhdHVz
ID0gIm9rYXkiOw0KKyAgICAgICAgICAgICAgIG0yNXAsZmFzdC1yZWFkOw0KKyAgICAgICAgICAg
ICAgIGxhYmVsID0gImJpb3MiOw0KKyAgICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0g
PDMzMDAwMDAwPjsNCisgICAgICAgICAgICAgICBzcGktdHgtYnVzLXdpZHRoID0gPDE+Ow0KKyAg
ICAgICAgICAgICAgIHNwaS1yeC1idXMtd2lkdGggPSA8MT47DQorICAgICAgIH07DQorfTsNCisN
Cismd2R0MSB7DQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCit9Ow0KKw0KKyZ1YXJ0MSB7DQor
ICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCit9Ow0KKw0KKyZ1YXJ0NSB7DQorICAgICAgIHN0YXR1
cyA9ICJva2F5IjsNCit9Ow0KKw0KKyZpMmMwIHsNCisgICAgICAgc3RhdHVzID0gIm9rYXkiOw0K
Kw0KKyAgICAgICAvL1NldCBibWMnIHNsYXZlIGFkZHJlc3M7DQorICAgICAgIGJtY19zbGF2ZUAx
MCB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJpcG1iLWRldiI7DQorICAgICAgICAg
ICAgICAgcmVnID0gPCgweDEwIHwgSTJDX09XTl9TTEFWRV9BRERSRVNTKT47DQorICAgICAgICAg
ICAgICAgaTJjLXByb3RvY29sOw0KKyAgICAgICB9Ow0KK307DQorDQorJmkyYzIgew0KKyAgICAg
ICBzdGF0dXMgPSAib2theSI7DQorfTsNCisNCismaTJjMyB7DQorICAgICAgIC8vIEZSVSBBVDI0
QzUxMkMtU1NITS1UDQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCisgICAgICAgZWVwcm9tQDUw
IHsNCisgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImF0bWVsLDI0YzUxMiI7DQorICAgICAg
ICAgICAgICAgcmVnID0gPDB4NTA+Ow0KKyAgICAgICAgICAgICAgIHBhZ2VzaXplID0gPDEyOD47
DQorICAgICAgIH07DQorfTsNCisNCismaTJjNSB7DQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsN
Cit9Ow0KKw0KKyZpMmM2IHsNCisgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKw0KKyAgICAgICB0
bXA3NUA0OSB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aSx0bXA3NSI7DQorICAg
ICAgICAgICAgICAgcmVnID0gPDB4NDk+Ow0KKyAgICAgICB9Ow0KKw0KKyAgICAgICB0bXA3NUA0
ZiB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0aSx0bXA3NSI7DQorICAgICAgICAg
ICAgICAgcmVnID0gPDB4NGY+Ow0KKyAgICAgICB9Ow0KKw0KKyAgICAgICB0bXA0NjhANDggew0K
KyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGksdG1wNDY4IjsNCisgICAgICAgICAgICAg
ICByZWcgPSA8MHg0OD47DQorICAgICAgIH07DQorfTsNCisNCismaTJjNyB7DQorICAgICAgIHN0
YXR1cyA9ICJva2F5IjsNCisgICAgICAgYWRtMTI3OEA0MCB7DQorICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJhZGksYWRtMTI3OCI7DQorICAgICAgICAgICAgICAgcmVnID0gPDB4NDA+Ow0K
KyAgICAgICB9Ow0KK307DQorDQorDQorJmkyYzggew0KKyAgICAgICAvLyBGUlUgQVQyNEM1MTJD
LVNTSE0tVA0KKyAgICAgICBzdGF0dXMgPSAib2theSI7DQorDQorICAgICAgIGVlcHJvbUA1MSB7
DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhdG1lbCwyNGM1MTIiOw0KKyAgICAgICAg
ICAgICAgIHJlZyA9IDwweDUxPjsNCisgICAgICAgICAgICAgICBwYWdlc2l6ZSA9IDwxMjg+Ow0K
KyAgICAgICB9Ow0KKw0KKyAgICAgICBlZXByb21ANTMgew0KKyAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiYXRtZWwsMjRjNTEyIjsNCisgICAgICAgICAgICAgICByZWcgPSA8MHg1Mz47DQor
ICAgICAgICAgICAgICAgcGFnZXNpemUgPSA8MTI4PjsNCisgICAgICAgfTsNCit9Ow0KKw0KKyZp
MmM5IHsNCisgICAgICAgLy8gTS4yDQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCit9Ow0KKw0K
KyZpMmMxMCB7DQorICAgICAgIC8vIEkyQyBFWFBBTkRFUg0KKyAgICAgICBzdGF0dXMgPSAib2th
eSI7DQorDQorICAgICAgIGkyYy1zd2l0Y2hANzEgew0KKyAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAibnhwLHBjYTk1NDQiOw0KKyAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
Ow0KKyAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KKyAgICAgICAgICAgICAgIHJl
ZyA9IDwweDcxPjsNCisgICAgICAgfTsNCisNCisgICAgICAgaTJjLXN3aXRjaEA3MyB7DQorICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJueHAscGNhOTU0NCI7DQorICAgICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47DQorICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
DQorICAgICAgICAgICAgICAgcmVnID0gPDB4NzM+Ow0KKyAgICAgICB9Ow0KK307DQorDQorJmky
YzExIHsNCisgICAgICAgLy8gSTJDIEVYUEFOREVSDQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsN
CisNCisgICAgICAgaTJjLXN3aXRjaEA3MCB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJueHAscGNhOTU0NCI7DQorICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQor
ICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQorICAgICAgICAgICAgICAgcmVnID0g
PDB4NzA+Ow0KKw0KKyAgICAgICAgICAgICAgIHBjaWVfZWVwcm9tX3Jpc2VyMTogaTJjQDAgew0K
KyAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQorICAgICAgICAg
ICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCisgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwwPjsNCisNCisgICAgICAgICAgICAgICAgICAgICAgIGVlcHJvbUA1NSB7DQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsMjRjNTEyIjsN
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NTU+Ow0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYWdlc2l6ZSA9IDwxMjg+Ow0KKyAgICAgICAgICAgICAg
ICAgICAgICAgfTsNCisgICAgICAgICAgICAgICB9Ow0KKw0KKyAgICAgICAgICAgICAgIHBjaWVf
ZWVwcm9tX3Jpc2VyMjogaTJjQDEgew0KKyAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQorICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsN
CisgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsNCisNCisgICAgICAgICAgICAgICAg
ICAgICAgIGVlcHJvbUA1NSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiYXRtZWwsMjRjNTEyIjsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4NTU+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlc2l6ZSA9
IDwxMjg+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgfTsNCisgICAgICAgICAgICAgICB9Ow0K
Kw0KKyAgICAgICAgICAgICAgIHBjaWVfZWVwcm9tX3Jpc2VyMzogaTJjQDIgew0KKyAgICAgICAg
ICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQorICAgICAgICAgICAgICAgICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCisgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwy
PjsNCisNCisgICAgICAgICAgICAgICAgICAgICAgIGVlcHJvbUA1NSB7DQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsMjRjNTEyIjsNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NTU+Ow0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYWdlc2l6ZSA9IDwxMjg+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAg
fTsNCisgICAgICAgICAgICAgICB9Ow0KKyAgICAgICB9Ow0KK307DQorDQorJmkyYzEyIHsNCisg
ICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKw0KKyAgICAgICBwc3UwOnBzdTBANTggew0KKyAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAicG1idXMiOw0KKyAgICAgICAgICAgICAgIHJlZyA9IDww
eDU4PjsNCisgICAgICAgfTsNCit9Ow0KKw0KKyZncGlvMCB7DQorICAgICAgIHN0YXR1cyA9ICJv
a2F5IjsNCisgICAgICAgZ3Bpby1saW5lLW5hbWVzID0NCisgICAgICAgLypBMC1BNyovICAgIiIs
IiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qQjAtQjcqLyAgICJwcmVzZW5jZS1wczAi
LCJwb3dlci1jaGFzc2lzLWdvb2QiLCIiLCIiLCIiLCIiLCJwcmVzZW5jZS1wczEiLCIiLA0KKyAg
ICAgICAvKkMwLUM3Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwNCisgICAgICAgLypEMC1E
NyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qRTAtRTcqLyAgICIiLCIi
LCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKkYwLUY3Ki8gICAiIiwiIiwiIiwiIiwicG93
ZXItY2hhc3Npcy1jb250cm9sIiwiIiwiIiwiIiwNCisgICAgICAgLypHMC1HNyovICAgIiIsIiIs
Imp0YWctbXV4IiwiIiwiIiwiIiwiIiwiIiwNCisgICAgICAgLypIMC1INyovICAgIiIsIiIsIiIs
IiIsInJlc2V0LWJ1dHRvbiIsInBvd2VyLWJ1dHRvbiIsIiIsIiIsDQorICAgICAgIC8qSTAtSTcq
LyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKkowLUo3Ki8gICAiIiwiIiwi
IiwiIiwiIiwiIiwiIiwiIiwNCisgICAgICAgLypLMC1LNyovICAgIiIsIiIsIiIsIiIsIiIsIiIs
IiIsIiIsDQorICAgICAgIC8qTDAtTDcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAg
ICAgICAvKk0wLU03Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwNCisgICAgICAgLypOMC1O
NyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qTzAtTzcqLyAgICIiLCIi
LCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKlAwLVA3Ki8gICAiIiwiIiwiIiwidGNrLW11
eCIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qUTAtUTcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIi
LCIiLA0KKyAgICAgICAvKlIwLVI3Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwNCisgICAg
ICAgLypTMC1TNyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qVDAtVDcq
LyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKlUwLVU3Ki8gICAiIiwibm1p
LWJ1dHRvbiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qVjAtVjcqLyAgICIiLCIiLCIi
LCIiLCJwb3dlci1jb25maWctZnVsbC1sb2FkIiwiIiwiIiwiIiwNCisgICAgICAgLypXMC1XNyov
ICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qWDAtWDcqLyAgICIiLCIiLCIi
LCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKlkwLVk3Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwi
IiwiIiwNCisgICAgICAgLypaMC1aNyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAg
ICAgIC8qQUEwLUFBNyovICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKkFCMC1B
QjcqLyAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwNCisgICAgICAgLypBQzAtQUM3Ki8gIiIsIiIs
IiIsIiIsIiIsIiIsIiIsIiI7DQorfTsNCisNCismbHBjX3Nub29wIHsNCisgICAgICAgc3RhdHVz
ID0gIm9rYXkiOw0KKyAgICAgICBzbm9vcC1wb3J0cyA9IDwweDgwPjsNCit9Ow0KKw0KKyZlbW1j
X2NvbnRyb2xsZXIgew0KKyAgICAgICBzdGF0dXMgPSAib2theSI7DQorfTsNCisNCismZW1tYyB7
DQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCisgICAgICAgbm9uLXJlbW92YWJsZTsNCisgICAg
ICAgbWF4LWZyZXF1ZW5jeSA9IDw1MjAwMDAwMD47DQorICAgICAgIGJ1cy13aWR0aCA9IDw4PjsN
Cit9Ow0KKw0KKyZ2aHViIHsNCisgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKyAgICAgICBhc3Bl
ZWQsdmh1Yi1kb3duc3RyZWFtLXBvcnRzID0gPDc+Ow0KKyAgICAgICBhc3BlZWQsdmh1Yi1nZW5l
cmljLWVuZHBvaW50cyA9IDwyMT47DQorICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
DQorICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF91c2IyYWRfZGVmYXVsdD47DQorfTsNCisN
CismcnRjIHsNCisgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KK307DQotLQ0KMi4zMy4wDQoNCg==
