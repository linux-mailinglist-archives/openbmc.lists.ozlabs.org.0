Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E28433140
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 10:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYS1J2pHJz3cPj
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 19:42:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=61.220.76.156; helo=mail.inventec.com;
 envelope-from=lin.tommysc@inventec.com; receiver=<UNKNOWN>)
Received: from mail.inventec.com (61-220-76-156.hinet-ip.hinet.net
 [61.220.76.156])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYS0z16mHz2ygC
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 19:42:26 +1100 (AEDT)
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 19 Oct 2021 16:42:20 +0800
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2308.14 via Frontend Transport; Tue, 19 Oct 2021 16:42:20 +0800
Received: from IEC1-EX2016-02.iec.inventec (iec1-ex2016-02.iec.inventec
 [10.1.254.221])
 by IEC1-MSE-FE1.inventec.com with ESMTP id 19J8gEku095312
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 16:42:14 +0800 (GMT-8)
 (envelope-from Lin.TommySC@inventec.com)
Received: from IEC1-EX2016-01.iec.inventec (10.15.2.58) by
 IEC1-EX2016-02.iec.inventec (10.1.254.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 19 Oct 2021 16:42:14 +0800
Received: from IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007]) by
 IEC1-EX2016-01.iec.inventec ([fe80::44f0:5c98:dc89:7007%8]) with mapi id
 15.01.2308.014; Tue, 19 Oct 2021 16:42:14 +0800
From: =?big5?B?TGluLlRvbW15U0MgqkylQLTcIFRBTw==?= <Lin.TommySC@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH v3] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Topic: [PATCH v3] ARM: dts: aspeed: Adding Inventec Transformers BMC
Thread-Index: AQHXxMT5p+2rySVIa0Wf/wrv7uwybqvaAIqZ
Date: Tue, 19 Oct 2021 08:42:14 +0000
Message-ID: <7d7b20575f994a3c9018223a3c5f198d@inventec.com>
References: <5804770039e74d319fee323d28bdcf46@inventec.com>
In-Reply-To: <5804770039e74d319fee323d28bdcf46@inventec.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.148.43]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE1.inventec.com 19J8gEku095312
X-TM-SNTS-SMTP: 87859771A1392299CAAD28B7E6211F9AFB9C6A733D65134A83550B0CD1888DD62000:8
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
biA8TGluLlRvbW15U0NAaW52ZW50ZWMuY29tPg0KLS0tDQogLi4uL2R0cy9hc3BlZWQtYm1jLWlu
dmVudGVjLXRyYW5zZm9ybWVycy5kdHMgIHwgMzI4ICsrKysrKysrKysrKysrKysrKw0KIDEgZmls
ZSBjaGFuZ2VkLCAzMjggaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtYm1jLWludmVudGVjLXRyYW5zZm9ybWVycy5kdHMNCg0KZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJz
LmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtaW52ZW50ZWMtdHJhbnNmb3JtZXJz
LmR0cw0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMC4uZTUwZDg4Mjhl
Njg0DQotLS0gL2Rldi9udWxsDQorKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWlu
dmVudGVjLXRyYW5zZm9ybWVycy5kdHMNCkBAIC0wLDAgKzEsMzI4IEBADQorLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXINCisvLyBDb3B5cmlnaHQgMjAyMSBJbnZl
bnRlYyBDb3JwLg0KKw0KKy9kdHMtdjEvOw0KKw0KKyNpbmNsdWRlICJhc3BlZWQtZzYuZHRzaSIN
CisjaW5jbHVkZSAiYXNwZWVkLWc2LXBpbmN0cmwuZHRzaSINCisjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvaTJjL2kyYy5oPg0KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2FzcGVlZC1ncGlvLmg+
DQorDQorLyB7DQorICAgICAgIG1vZGVsID0gIlRSQU5TRk9STUVSUyBCTUMiOw0KKyAgICAgICBj
b21wYXRpYmxlID0gImludmVudGVjLHRyYW5zZm9ybWVyLWJtYyIsICJhc3BlZWQsYXN0MjYwMCI7
DQorDQorICAgICAgIGFsaWFzZXMgew0KKyAgICAgICAgICAgICAgIHNlcmlhbDQgPSAmdWFydDU7
DQorICAgICAgIH07DQorDQorICAgICAgIGNob3NlbiB7DQorICAgICAgICAgICAgICAgc3Rkb3V0
LXBhdGggPSAmdWFydDU7DQorICAgICAgICAgICAgICAgYm9vdGFyZ3MgPSAiY29uc29sZT10dHlT
NCwxMTUyMDBuOCI7DQorICAgICAgIH07DQorDQorICAgICAgIG1lbW9yeUA4MDAwMDAwMCB7DQor
ICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCisgICAgICAgICAgICAgICBy
ZWcgPSA8MHg4MDAwMDAwMCAweDgwMDAwMDAwPjsNCisgICAgICAgfTsNCisNCisgICAgICAgbGVk
cyB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJncGlvLWxlZHMiOw0KKw0KKyAgICAg
ICAgICAgICAgIC8vIFVJRCBsZWQNCisgICAgICAgICAgICAgICB1aWQgew0KKyAgICAgICAgICAg
ICAgICAgICAgICAgbGFiZWwgPSAiVUlEX0xFRCI7DQorICAgICAgICAgICAgICAgICAgICAgICBn
cGlvcyA9IDwmZ3BpbzAgQVNQRUVEX0dQSU8oWCwgMCkgR1BJT19BQ1RJVkVfTE9XPjsNCisgICAg
ICAgICAgICAgICB9Ow0KKw0KKyAgICAgICAgICAgICAgIC8vIEhlYXJ0IGJlYXQgbGVkDQorICAg
ICAgICAgICAgICAgaGVhcnRiZWF0IHsNCisgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0g
IkhCX0xFRCI7DQorICAgICAgICAgICAgICAgICAgICAgICBncGlvcyA9IDwmZ3BpbzAgQVNQRUVE
X0dQSU8oUCwgNykgR1BJT19BQ1RJVkVfTE9XPjsNCisgICAgICAgICAgICAgICB9Ow0KKyAgICAg
ICB9Ow0KK307DQorDQorJm1kaW8wIHsNCisgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKw0KKyAg
ICAgICBldGhwaHkwOiBldGhlcm5ldC1waHlAMCB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiI7DQorICAgICAgICAgICAgICAgcmVnID0g
PDE+Ow0KKyAgICAgICB9Ow0KK307DQorDQorJm1hYzMgew0KKyAgICAgICBzdGF0dXMgPSAib2th
eSI7DQorICAgICAgIHBoeS1tb2RlID0gInJnbWlpIjsNCisgICAgICAgcGh5LWhhbmRsZSA9IDwm
ZXRocGh5MD47DQorICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQorICAgICAgIHBp
bmN0cmwtMCA9IDwmcGluY3RybF9yZ21paTRfZGVmYXVsdD47DQorfTsNCisNCismZm1jIHsNCisg
ICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKw0KKyAgICAgICBmbGFzaEAwIHsNCisgICAgICAgICAg
ICAgICBzdGF0dXMgPSAib2theSI7DQorICAgICAgICAgICAgICAgbTI1cCxmYXN0LXJlYWQ7DQor
ICAgICAgICAgICAgICAgbGFiZWwgPSAiYm1jIjsNCisgICAgICAgICAgICAgICBzcGktbWF4LWZy
ZXF1ZW5jeSA9IDwzMzAwMDAwMD47DQorICAgICAgICAgICAgICAgc3BpLXR4LWJ1cy13aWR0aCA9
IDwyPjsNCisgICAgICAgICAgICAgICBzcGktcngtYnVzLXdpZHRoID0gPDI+Ow0KKyNpbmNsdWRl
ICJvcGVuYm1jLWZsYXNoLWxheW91dC5kdHNpIg0KKyAgICAgICB9Ow0KKw0KKyAgICAgICBmbGFz
aEAxIHsNCisgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQorICAgICAgICAgICAgICAg
bTI1cCxmYXN0LXJlYWQ7DQorICAgICAgICAgICAgICAgbGFiZWwgPSAiYm1jMiI7DQorICAgICAg
ICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8MzMwMDAwMDA+Ow0KKyAgICAgICAgICAgICAg
IHNwaS10eC1idXMtd2lkdGggPSA8Mj47DQorICAgICAgICAgICAgICAgc3BpLXJ4LWJ1cy13aWR0
aCA9IDwyPjsNCisgICAgICAgfTsNCit9Ow0KKw0KKyZzcGkxIHsNCisgICAgICAgc3RhdHVzID0g
Im9rYXkiOw0KKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KKyAgICAgICBwaW5j
dHJsLTAgPSA8JnBpbmN0cmxfc3BpMV9kZWZhdWx0PjsNCisNCisgICAgICAgZmxhc2hAMCB7DQor
ICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKyAgICAgICAgICAgICAgIG0yNXAsZmFz
dC1yZWFkOw0KKyAgICAgICAgICAgICAgIGxhYmVsID0gImJpb3MiOw0KKyAgICAgICAgICAgICAg
IHNwaS1tYXgtZnJlcXVlbmN5ID0gPDMzMDAwMDAwPjsNCisgICAgICAgICAgICAgICBzcGktdHgt
YnVzLXdpZHRoID0gPDE+Ow0KKyAgICAgICAgICAgICAgIHNwaS1yeC1idXMtd2lkdGggPSA8MT47
DQorICAgICAgIH07DQorfTsNCisNCismd2R0MSB7DQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsN
Cit9Ow0KKw0KKyZ1YXJ0MSB7DQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCit9Ow0KKw0KKyZ1
YXJ0NSB7DQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCit9Ow0KKw0KKyZpMmMwIHsNCisgICAg
ICAgc3RhdHVzID0gIm9rYXkiOw0KKw0KKyAgICAgICAvL1NldCBibWMnIHNsYXZlIGFkZHJlc3M7
DQorICAgICAgIGJtY19zbGF2ZUAxMCB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJp
cG1iLWRldiI7DQorICAgICAgICAgICAgICAgcmVnID0gPCgweDEwIHwgSTJDX09XTl9TTEFWRV9B
RERSRVNTKT47DQorICAgICAgICAgICAgICAgaTJjLXByb3RvY29sOw0KKyAgICAgICB9Ow0KK307
DQorDQorJmkyYzIgew0KKyAgICAgICBzdGF0dXMgPSAib2theSI7DQorfTsNCisNCismaTJjMyB7
DQorICAgICAgIC8vIEZSVSBBVDI0QzUxMkMtU1NITS1UDQorICAgICAgIHN0YXR1cyA9ICJva2F5
IjsNCisgICAgICAgZWVwcm9tQDUwIHsNCisgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImF0
bWVsLDI0YzUxMiI7DQorICAgICAgICAgICAgICAgcmVnID0gPDB4NTA+Ow0KKyAgICAgICAgICAg
ICAgIHBhZ2VzaXplID0gPDEyOD47DQorICAgICAgIH07DQorfTsNCisNCismaTJjNSB7DQorICAg
ICAgIHN0YXR1cyA9ICJva2F5IjsNCit9Ow0KKw0KKyZpMmM2IHsNCisgICAgICAgc3RhdHVzID0g
Im9rYXkiOw0KKw0KKyAgICAgICB0bXA3NUA0OSB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJ0aSx0bXA3NSI7DQorICAgICAgICAgICAgICAgcmVnID0gPDB4NDk+Ow0KKyAgICAgICB9
Ow0KKw0KKyAgICAgICB0bXA3NUA0ZiB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0
aSx0bXA3NSI7DQorICAgICAgICAgICAgICAgcmVnID0gPDB4NGY+Ow0KKyAgICAgICB9Ow0KKw0K
KyAgICAgICB0bXA0NjhANDggew0KKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGksdG1w
NDY4IjsNCisgICAgICAgICAgICAgICByZWcgPSA8MHg0OD47DQorICAgICAgIH07DQorfTsNCisN
CismaTJjNyB7DQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCisgICAgICAgYWRtMTI3OEA0MCB7
DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhZGksYWRtMTI3OCI7DQorICAgICAgICAg
ICAgICAgcmVnID0gPDB4NDA+Ow0KKyAgICAgICB9Ow0KK307DQorDQorDQorJmkyYzggew0KKyAg
ICAgICAvLyBGUlUgQVQyNEM1MTJDLVNTSE0tVA0KKyAgICAgICBzdGF0dXMgPSAib2theSI7DQor
DQorICAgICAgIGVlcHJvbUA1MSB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhdG1l
bCwyNGM1MTIiOw0KKyAgICAgICAgICAgICAgIHJlZyA9IDwweDUxPjsNCisgICAgICAgICAgICAg
ICBwYWdlc2l6ZSA9IDwxMjg+Ow0KKyAgICAgICB9Ow0KKw0KKyAgICAgICBlZXByb21ANTMgew0K
KyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsMjRjNTEyIjsNCisgICAgICAgICAg
ICAgICByZWcgPSA8MHg1Mz47DQorICAgICAgICAgICAgICAgcGFnZXNpemUgPSA8MTI4PjsNCisg
ICAgICAgfTsNCit9Ow0KKw0KKyZpMmM5IHsNCisgICAgICAgLy8gTS4yDQorICAgICAgIHN0YXR1
cyA9ICJva2F5IjsNCit9Ow0KKw0KKyZpMmMxMCB7DQorICAgICAgIC8vIEkyQyBFWFBBTkRFUg0K
KyAgICAgICBzdGF0dXMgPSAib2theSI7DQorDQorICAgICAgIGkyYy1zd2l0Y2hANzEgew0KKyAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibnhwLHBjYTk1NDQiOw0KKyAgICAgICAgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KKyAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+
Ow0KKyAgICAgICAgICAgICAgIHJlZyA9IDwweDcxPjsNCisgICAgICAgfTsNCisNCisgICAgICAg
aTJjLXN3aXRjaEA3MyB7DQorICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJueHAscGNhOTU0
NCI7DQorICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQorICAgICAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47DQorICAgICAgICAgICAgICAgcmVnID0gPDB4NzM+Ow0KKyAg
ICAgICB9Ow0KK307DQorDQorJmkyYzExIHsNCisgICAgICAgLy8gSTJDIEVYUEFOREVSDQorICAg
ICAgIHN0YXR1cyA9ICJva2F5IjsNCisNCisgICAgICAgaTJjLXN3aXRjaEA3MCB7DQorICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJueHAscGNhOTU0NCI7DQorICAgICAgICAgICAgICAgI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47DQorICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQor
ICAgICAgICAgICAgICAgcmVnID0gPDB4NzA+Ow0KKw0KKyAgICAgICAgICAgICAgIHBjaWVfZWVw
cm9tX3Jpc2VyMTogaTJjQDAgew0KKyAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47DQorICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCisg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCisNCisgICAgICAgICAgICAgICAgICAg
ICAgIGVlcHJvbUA1NSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiYXRtZWwsMjRjNTEyIjsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4NTU+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlc2l6ZSA9IDwx
Mjg+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgfTsNCisgICAgICAgICAgICAgICB9Ow0KKw0K
KyAgICAgICAgICAgICAgIHBjaWVfZWVwcm9tX3Jpc2VyMjogaTJjQDEgew0KKyAgICAgICAgICAg
ICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQorICAgICAgICAgICAgICAgICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwwPjsNCisgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsN
CisNCisgICAgICAgICAgICAgICAgICAgICAgIGVlcHJvbUA1NSB7DQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsMjRjNTEyIjsNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NTU+Ow0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYWdlc2l6ZSA9IDwxMjg+Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgfTsN
CisgICAgICAgICAgICAgICB9Ow0KKw0KKyAgICAgICAgICAgICAgIHBjaWVfZWVwcm9tX3Jpc2Vy
MzogaTJjQDIgew0KKyAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
DQorICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCisgICAgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwyPjsNCisNCisgICAgICAgICAgICAgICAgICAgICAgIGVlcHJv
bUA1NSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXRt
ZWwsMjRjNTEyIjsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NTU+
Ow0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlc2l6ZSA9IDwxMjg+Ow0KKyAg
ICAgICAgICAgICAgICAgICAgICAgfTsNCisgICAgICAgICAgICAgICB9Ow0KKyAgICAgICB9Ow0K
K307DQorDQorJmkyYzEyIHsNCisgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKw0KKyAgICAgICBw
c3UwOnBzdTBANTggew0KKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicG1idXMiOw0KKyAg
ICAgICAgICAgICAgIHJlZyA9IDwweDU4PjsNCisgICAgICAgfTsNCit9Ow0KKw0KKyZncGlvMCB7
DQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCisgICAgICAgZ3Bpby1saW5lLW5hbWVzID0NCisg
ICAgICAgLypBMC1BNyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qQjAt
QjcqLyAgICJwcmVzZW5jZS1wczAiLCJwb3dlci1jaGFzc2lzLWdvb2QiLCIiLCIiLCIiLCIiLCJw
cmVzZW5jZS1wczEiLCIiLA0KKyAgICAgICAvKkMwLUM3Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwi
IiwiIiwNCisgICAgICAgLypEMC1ENyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAg
ICAgIC8qRTAtRTcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKkYwLUY3
Ki8gICAiIiwiIiwiIiwiIiwicG93ZXItY2hhc3Npcy1jb250cm9sIiwiIiwiIiwiIiwNCisgICAg
ICAgLypHMC1HNyovICAgIiIsIiIsImp0YWctbXV4IiwiIiwiIiwiIiwiIiwiIiwNCisgICAgICAg
LypIMC1INyovICAgIiIsIiIsIiIsIiIsInJlc2V0LWJ1dHRvbiIsInBvd2VyLWJ1dHRvbiIsIiIs
IiIsDQorICAgICAgIC8qSTAtSTcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAg
ICAvKkowLUo3Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwNCisgICAgICAgLypLMC1LNyov
ICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qTDAtTDcqLyAgICIiLCIiLCIi
LCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKk0wLU03Ki8gICAiIiwiIiwiIiwiIiwiIiwiIiwi
IiwiIiwNCisgICAgICAgLypOMC1ONyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAg
ICAgIC8qTzAtTzcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKlAwLVA3
Ki8gICAiIiwiIiwiIiwidGNrLW11eCIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qUTAtUTcqLyAg
ICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKlIwLVI3Ki8gICAiIiwiIiwiIiwi
IiwiIiwiIiwiIiwiIiwNCisgICAgICAgLypTMC1TNyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIs
IiIsDQorICAgICAgIC8qVDAtVDcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAg
ICAvKlUwLVU3Ki8gICAiIiwibm1pLWJ1dHRvbiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAgICAg
IC8qVjAtVjcqLyAgICIiLCIiLCIiLCIiLCJwb3dlci1jb25maWctZnVsbC1sb2FkIiwiIiwiIiwi
IiwNCisgICAgICAgLypXMC1XNyovICAgIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiIsDQorICAgICAg
IC8qWDAtWDcqLyAgICIiLCIiLCIiLCIiLCIiLCIiLCIiLCIiLA0KKyAgICAgICAvKlkwLVk3Ki8g
ICAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwNCisgICAgICAgLypaMC1aNyovICAgIiIsIiIsIiIs
IiIsIiIsIiIsIiIsIiIsDQorICAgICAgIC8qQUEwLUFBNyovICIiLCIiLCIiLCIiLCIiLCIiLCIi
LCIiLA0KKyAgICAgICAvKkFCMC1BQjcqLyAiIiwiIiwiIiwiIiwiIiwiIiwiIiwiIiwNCisgICAg
ICAgLypBQzAtQUM3Ki8gIiIsIiIsIiIsIiIsIiIsIiIsIiIsIiI7DQorfTsNCisNCismbHBjX3Nu
b29wIHsNCisgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KKyAgICAgICBzbm9vcC1wb3J0cyA9IDww
eDgwPjsNCit9Ow0KKw0KKyZlbW1jX2NvbnRyb2xsZXIgew0KKyAgICAgICBzdGF0dXMgPSAib2th
eSI7DQorfTsNCisNCismZW1tYyB7DQorICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCisgICAgICAg
bm9uLXJlbW92YWJsZTsNCisgICAgICAgbWF4LWZyZXF1ZW5jeSA9IDw1MjAwMDAwMD47DQorICAg
ICAgIGJ1cy13aWR0aCA9IDw4PjsNCit9Ow0KKw0KKyZ2aHViIHsNCisgICAgICAgc3RhdHVzID0g
Im9rYXkiOw0KKyAgICAgICBhc3BlZWQsdmh1Yi1kb3duc3RyZWFtLXBvcnRzID0gPDc+Ow0KKyAg
ICAgICBhc3BlZWQsdmh1Yi1nZW5lcmljLWVuZHBvaW50cyA9IDwyMT47DQorICAgICAgIHBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQorICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF91c2Iy
YWRfZGVmYXVsdD47DQorfTsNCisNCismcnRjIHsNCisgICAgICAgc3RhdHVzID0gIm9rYXkiOw0K
K307DQotLQ0KMi4zMy4wDQoNCg==
