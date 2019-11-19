Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA60E105D61
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 00:46:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jx5x5pMhzDql8
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 10:46:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axentia.se (client-ip=40.107.6.121;
 helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=peda@axentia.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" (0-bit key;
 unprotected) header.d=axentia.se header.i=@axentia.se header.b="iPrivwnJ"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60121.outbound.protection.outlook.com [40.107.6.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HgWS6bNhzDqg7
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 09:30:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWWYCsfNUQwuHvR+h4Uka/PISvaJdo6HXT5eGy6GPoh/gIwUMRKV/09xWuYn37MvmYIUICmLP5KjYisYsoaOT/DvQEhyPmDOgCOybKJe2/ZgexElN/1qaA4JPRaRqiaM7PtVqD71/2EzLbYumhVMxE4SZ/MhlEmf0Ur+u0YK3tbsGVTOJUcqQMDP9komWjI4GoB9XJI+xZ6YuXCXLGheCNo7BNpwA47gSwSr2MFw6mM380l+AzDPm7nlmtyWSDkLH0W/DuIv3Ob8EQ6oZijxEqUL8WzUPZLEoMhKBGBxWihFIK0Q3xbvcb8smtwF0WBDwktuIEhPo0PpOL/XDhxvqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/VSrS/n5InuP5tEJCL71Pa5tjEe6M0q8kgMJqdj/Mw=;
 b=YrZHnQabuNEIdE5oaY2/KcZFHlP/mPhqcigUKb7cMaJLzVNh5Cq+VBE5Yx0Us2Meyz4xmETU36of9lVHK26pLBC7nyjYuk/al3dkJ4goMvw5F/1LRPHYKSeyAeFJOq7t8MigQiE5QnrqcMOb98rgyoDlOWpwZXfn9r9dxzJKGvF1wI9AyhSLfMjrqt9QaSeQVEWevTxlRcgiUL8tN83ibHJZw+Xn5nRVIMcipBth6ODbMTbNSMLRmReJXcjAlGXFRez2RnrPkW8xqMh0ieiiAkFY30cIdpmyj1R7xmXM1Sv0nS/S8/9/fD1zgO11Ed/wgshih+1gntvtDcodxnIlpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/VSrS/n5InuP5tEJCL71Pa5tjEe6M0q8kgMJqdj/Mw=;
 b=iPrivwnJZzG86aYb0QPrKnz9ITNzCE1fi9mtLYaDWPxcZLL+SWkdInNnjFBq7TtDFLoVqIag5sIprQaIhKHqi8BsVbWgNCtLw0sAJYq9RYQrueEX81J+1sLyUhD3B7YUjvAEyDgzBOdsZwTuElbhHPzKVr2gY+jpGjPVh//kC1k=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3513.eurprd02.prod.outlook.com (52.134.68.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Tue, 19 Nov 2019 22:30:21 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca%7]) with mapi id 15.20.2474.015; Tue, 19 Nov 2019
 22:30:19 +0000
From: Peter Rosin <peda@axentia.se>
To: Tali Perry <tali.perry1@gmail.com>, "avifishman70@gmail.com"
 <avifishman70@gmail.com>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "venture@google.com" <venture@google.com>, "yuenn@google.com"
 <yuenn@google.com>, "benjaminfair@google.com" <benjaminfair@google.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "robh@kernel.org" <robh@kernel.org>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>, "jdelvare@suse.de"
 <jdelvare@suse.de>, "jarkko.nikula@linux.intel.com"
 <jarkko.nikula@linux.intel.com>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "arnd@arndb.de" <arnd@arndb.de>, "max@enpas.org"
 <max@enpas.org>, "krzysztof.adamski@nokia.com" <krzysztof.adamski@nokia.com>, 
 "syniurge@gmail.com" <syniurge@gmail.com>, "puwen@hygon.cn" <puwen@hygon.cn>, 
 "jfi@ssv-embedded.de" <jfi@ssv-embedded.de>, "sr@denx.de" <sr@denx.de>,
 "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
 "kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>, "enric.balletbo@collabora.com"
 <enric.balletbo@collabora.com>, "baolin.wang@linaro.org"
 <baolin.wang@linaro.org>, "ludovic.desroches@microchip.com"
 <ludovic.desroches@microchip.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: npcm7xx: * add binding for i2c
 controller
Thread-Topic: [PATCH v5 1/2] dt-bindings: i2c: npcm7xx: * add binding for i2c
 controller
Thread-Index: AQHVnu54E09/kMD0Sk6PJN8U0wqzjqeTE/aA
Date: Tue, 19 Nov 2019 22:30:19 +0000
Message-ID: <a599e9e7-6b00-2bbc-407a-8f48b17b43c5@axentia.se>
References: <20191119144930.227241-1-tali.perry1@gmail.com>
 <20191119144930.227241-2-tali.perry1@gmail.com>
In-Reply-To: <20191119144930.227241-2-tali.perry1@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: AM0PR05CA0049.eurprd05.prod.outlook.com
 (2603:10a6:208:be::26) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dbfa4d7-2ba0-475b-b7b3-08d76d400f2d
x-ms-traffictypediagnostic: DB3PR0202MB3513:
x-microsoft-antispam-prvs: <DB3PR0202MB351311F23EA34548BF0A7AE6BC4C0@DB3PR0202MB3513.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39830400003)(366004)(136003)(346002)(199004)(189003)(53546011)(14444005)(52116002)(256004)(14454004)(36756003)(58126008)(11346002)(5660300002)(4001150100001)(7416002)(86362001)(508600001)(2201001)(54906003)(110136005)(7406005)(316002)(2501003)(76176011)(71200400001)(386003)(6116002)(31686004)(71190400001)(7736002)(66066001)(65806001)(25786009)(81166006)(4326008)(26005)(229853002)(99286004)(65956001)(6246003)(81156014)(6506007)(66446008)(64756008)(66476007)(486006)(6486002)(66556008)(446003)(2906002)(186003)(8676002)(31696002)(66946007)(2616005)(305945005)(6436002)(476003)(3846002)(8936002)(102836004)(6512007)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3513;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gWbsGoklobIuGWcp2TnxqrMMP9RUPwCtcXAP+puQe306aIzqKHQgRRlokWzzbKICUAR8ME+jc1HYJaNq+5shbR00LEbSPoPDpAxyyl6ksGdaSouCPss6tdXaezbCxAsQli3eNPQ0Hknf84yeM/qUFwHENBFnNWiFOShwGzKx6RgbaQzKCzYRICInZL5QPHq8N/WXaupifg47x8jIRAAclSE6XV/fPgBFaKLYtugVHcwiyrOBl+UVzSogmR3uGLXmYzXe+21JYyD6yKdX1q2O8GPUhkopHnRWca4YFSKbEd6E+RHAnklETIklKxaMdqqpAojF+O2PDCyuVk9fDnPAXccwZxBP1ufRTaljSzzM64j5zQ12Goa99K/xEuecmckDY457HLPkbVQg2m3WioYxMEYPlI/EeWU6KrFbAIavJpITDwYB9heqLtRZ5z37ukfe
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6B6B04574D64B46A7E1AA33AC408CDD@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbfa4d7-2ba0-475b-b7b3-08d76d400f2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 22:30:19.8102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHrF/mfdGwrMxHzdfdxrMjN7frT3F/D8YfkpNQshMAoHoek2tVEtcJ0saBNDFDHU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3513
X-Mailman-Approved-At: Fri, 22 Nov 2019 10:41:01 +1100
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gMjAxOS0xMS0xOSAxNTo0OSwgVGFsaSBQZXJyeSB3cm90ZToNCj4gIGR0LWJpbmRpbmdzOiBp
MmM6IG5wY203eHg6ICogYWRkIGJpbmRpbmcgZm9yIGkyYyBjb250cm9sbGVyDQoNCkkgbWlzc2lu
ZyBhbiBlbXB0eSBsaW5lIGJlZm9yZSB0aGUgYmxvY2sgb2YgdGFncywgYnV0IHRoZSBiaWdnZXIg
cHJvYmxlbQ0KaXMgdGhlIHJlcGVhdGVkIHN1YmplY3QgbGluZS4gQWxzbywgdGhlICcqJyBpbiB0
aGUgc3ViamVjdCBtYWtlcyBubw0Kc2Vuc2UgdG8gbWUuDQoNCj4gU2lnbmVkLW9mZi1ieTogVGFs
aSBQZXJyeSA8dGFsaS5wZXJyeTFAZ21haWwuY29tPg0KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gLS0tDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvaTJjLW5wY203eHgudHh0ICAgfCAyOSArKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW5wY203eHgudHh0DQo+IA0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbnBjbTd4
eC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1ucGNtN3h4
LnR4dA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjBlY2Fl
OTUwNzQ4Yg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pMmMvaTJjLW5wY203eHgudHh0DQo+IEBAIC0wLDAgKzEsMjkgQEANCj4gK051
dm90b24gTlBDTTdYWCBJMkMgYnVzDQo+ICsNCj4gK1RoZSBOUENNNzUweCBpbmNsdWRlcyBzaXh0
ZWVuIEkyQyBidXMgY29udHJvbGxlcnMuIEFsbCBDb250cm9sbGVycyBzdXBwb3J0DQo+ICtib3Ro
IG1hc3RlciBhbmQgc2xhdmUgbW9kZS4gRWFjaCBjb250cm9sbGVyIGhhcyB0d28gMTYgYnl0ZSBI
VyBGSUZPIGZvciBUWCBhbmQNCj4gK1JYLg0KPiArDQo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
PiArLSBjb21wYXRpYmxlICAgICAgOiBtdXN0IGJlICJudXZvdG9uLG5wY203NTAtaTJjIg0KPiAr
LSByZWcgICAgICAgICAgICAgOiBPZmZzZXQgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0ZXIgc2V0
IGZvciB0aGUgZGV2aWNlLg0KPiArLSBpbnRlcnJ1cHRzICAgICAgOiBDb250YWluIHRoZSBJMkMg
aW50ZXJydXB0IHdpdGggZmxhZ3MgZm9yIGZhbGxpbmcgZWRnZS4NCj4gKy0gY2xvY2tzICAgICAg
ICAgIDogcGhhbmRsZSBvZiBJMkMgcmVmZXJlbmNlIGNsb2NrLg0KPiArDQo+ICtPcHRpb25hbDoN
Cj4gKy0gYnVzLWZyZXF1ZW5jeSAgIDogQ29udGFpbiB0aGUgSTJDIGJ1cyBmcmVxdWVuY3ksDQo+
ICsJCQl0aGUgZGVmYXVsdCBJMkMgYnVzIGZyZXF1ZW5jeSBpcyAxMDAwMDAuDQo+ICstIHBpbmN0
cmwtMCAgICAgICA6IG11c3QgYmUgPCZzbWJYX3BpbnM+LCBYIGlzIG1vZHVsZSBudW1iZXINCj4g
KwkJCShvbiBOUENNN1hYIGl0J3MgMCB0byAxNSkNCg0KSXNuJ3QgdGhpcyBhIHN0cmFuZ2UgcmVx
dWlyZW1lbnQ/IEFtIEksIGFzIGEgZGV2aWNlIHRyZWUgYXV0aG9yLCBub3QgZnJlZSB0bw0KdXNl
IGFueSBsYWJlbCBuYW1lcyBJIHdhbnQ/IFN1cmVseSwgd2hhdCBpcyBpbXBvcnRhbnQgaXMgd2hh
dCB0aGUgbGFiZWwgcmVmZXJzDQp0byBhbmQgbm90IGl0cyBuYW1lPw0KDQpDaGVlcnMsDQpQZXRl
cg0KDQo+ICstIHBpbmN0cmwtbmFtZXMgICA6IHNob3VsZCBiZSBzZXQgdG8gImRlZmF1bHQiDQo+
ICtFeGFtcGxlOg0KPiArDQo+ICsJaTJjMDogaTJjQDgwMDAwIHsNCj4gKwkJY29tcGF0aWJsZSA9
ICJudXZvdG9uLG5wY203NTAtaTJjIjsNCj4gKwkJcmVnID0gPDB4ODAwMDAgMHgxMDAwPjsNCj4g
KwkJY2xvY2tzID0gPCZjbGsgTlBDTTdYWF9DTEtfQVBCMj47DQo+ICsJCWJ1cy1mcmVxdWVuY3kg
PSA8MTAwMDAwPjsNCj4gKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDY0IElSUV9UWVBFX0xFVkVM
X0hJR0g+Ow0KPiArCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiArCQlwaW5jdHJsLTAg
PSA8JnNtYjBfcGlucz47DQo+ICsJfTsNCj4gDQoNCg==
