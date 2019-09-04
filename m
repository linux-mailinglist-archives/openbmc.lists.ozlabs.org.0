Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC01A9A11
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 07:24:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P8Jb67S7zDr24
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 15:24:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4150651e40=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="UbTbpMeF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="CJg17Uho"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P8Hy3QLJzDqfX
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 15:24:12 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x84MaT9l004657; Wed, 4 Sep 2019 15:37:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=1aH7FmQOgz+gGYX32xXhtjtvOrq866mxf90V4qpNs+c=;
 b=UbTbpMeF399ho8A7UttBT9y/YVp7doMuAIRVsRO9gIZb097IxMR5+bUtsLlH2Uqsk5YL
 LLyZoNk+WyzrknZKJfFFHRonhnNuAQTtxPEFdEUCn3f48D3hZRcZQxGtngPjPgyossEz
 PlAKE5adAEhXsHDdjKzw5B3Y67yLPf931mA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2utknmgqq4-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 Sep 2019 15:37:44 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 4 Sep 2019 15:37:43 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 4 Sep 2019 15:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHHzbkNPpTZTL/++aPy9nEiFP9BSvRPf9c2IXs/atbyW8ISknZu3VUVSAFo4+yg8cIy56ZG1i8nKXKDnm5lf1AZxoaJC84xA4fZgh3wnde5WGrWepPj1IDM5Y2U+RNWJUn4v2jz9kkHb63Ocf34C8lb/yG6GQ64nb13rHw2svzJg1FlHngMPqqJ/s7TCYrTyxc35olIQTtvvBU7HuDRhXXU8Nh/sw3CB2HLZPUSwolGu4f6avkLLdUnwFgnCxTcqprivVysdDy92TSutSVqXSI0b8x7VcPx84kU7DcrQIWcgdusKhpIGRR6IuqLviiiXoCQq7Kfi68TyNCk2K7Pjiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aH7FmQOgz+gGYX32xXhtjtvOrq866mxf90V4qpNs+c=;
 b=ddTELfKhmx891Vy5Wsw6545CSLZXilG7obtCeqGsqTZSay5bcjcKN3X+zAEqN+ksP6AkUiBFbdGtiOgYfy08BVZ736IOYeQYELNw+V3sd1WMV2AQkCEF8bOi0lseBKTYCTuzJiEwL3B+40Z1Y/L4LUhRnIKRhslD0BHBK7Y2cBebOD5qIV9fX/JEHtrHHbjSdudkSLSnzzccWYrO+rjy8+NEFpzq13d1/U0L0Zo2A9U2t56bnqaQBeKIuXsg1Edp03y9qdtA+XWiV6Z1+iu+AcGwhFy1UPkZdXXK+QDXWFPd+KhWSJBQjZ5oQVM5IjADbkE34LsVwWsQBYQM2HxsEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aH7FmQOgz+gGYX32xXhtjtvOrq866mxf90V4qpNs+c=;
 b=CJg17UhoB7EJVs30hz7jXq1lKsiAo1i774Ev7GwiLYkA5YTat4i9NqjRKo/muKuOWIgVZKrRBvueOmYazrlCQ6q2RFrbM61+VduZwkP9tJO8EjEVt7PuOrqA2LHDkJDbZgpys09cy6XPr/nOo/2ta0fNU27UIRfiY0okDPeHPQQ=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1360.namprd15.prod.outlook.com (10.173.228.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Wed, 4 Sep 2019 22:37:42 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801%9]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 22:37:42 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
Thread-Topic: [PATCH dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
Thread-Index: AQHVY1yDI28Zw8bU0kuhZOCPC1aBFKccG/2A
Date: Wed, 4 Sep 2019 22:37:42 +0000
Message-ID: <8bae3df6-c9bb-55b9-20bd-7d496b48ecaa@fb.com>
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
 <20190904200758.5420-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190904200758.5420-3-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0059.namprd07.prod.outlook.com
 (2603:10b6:a03:60::36) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:fd50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef4ddef6-ac2e-40a9-8c27-08d731887f65
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1360; 
x-ms-traffictypediagnostic: MWHPR15MB1360:
x-microsoft-antispam-prvs: <MWHPR15MB136064EAE4B1F942BA0AE5E4B2B80@MWHPR15MB1360.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:529;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(136003)(39860400002)(376002)(346002)(199004)(189003)(186003)(81166006)(76176011)(4326008)(110136005)(6512007)(446003)(5660300002)(53546011)(14454004)(6506007)(386003)(99286004)(229853002)(25786009)(8676002)(316002)(81156014)(86362001)(478600001)(14444005)(6246003)(58126008)(36756003)(71190400001)(71200400001)(6436002)(102836004)(7736002)(66946007)(53936002)(6116002)(66476007)(66556008)(64756008)(46003)(66446008)(31686004)(2906002)(8936002)(256004)(6486002)(2616005)(486006)(476003)(11346002)(52116002)(305945005)(65806001)(31696002)(65956001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1360;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fonplm8C7ACdOzhBwvrwAC9qYNE9jfCtpnI9efahfIHhtbsXVy9cIkII0ynNrbUnBYXqP6GnIXf2d0kgFWKgseQaJ0yiyurUoeRwNgzPUNQzD9cqBdOrMjDSWru/YSWxJA/fShRBDgq3ojlH8t7X0L+61W3xQGOlunZLGt4VfCo51m0FzZ3CWBbrj08UST7rjEnoVTjMUPNznUTgtFpnQ8Ef7o6xRAFVt49Gv6tmykHf/NiqcXI4KKnMlAr9rvmMLY6El69ydHHZvqANW8pHuMddVwzLbeIoae4zTqb724jI5ODfcCuEzoywUNXvhsjFOim2llLWs2sFo5tcyH8U0Zr0vcf8Dw/S+75Ki1Vg4zSXYCCge4qzLyn/PqVWwMV0e2GteYcT67JWDpod3/kttiotnRHDgpnGEMMUc2RJ+Cs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BFDD72C010B9643AB5E444CC7D67FE7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4ddef6-ac2e-40a9-8c27-08d731887f65
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 22:37:42.2957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b71NKKgPUJ7KBDaQuMm6PKFU3cvVFNrzxFJyFfwwOZy2qPbUTraPWPqywihVS+cf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1360
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-04_06:2019-09-04,2019-09-04 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1011
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1906280000 definitions=main-1909040218
X-FB-Internal: deliver
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

T24gOS80LzE5IDE6MDcgUE0sIEphZSBIeXVuIFlvbyB3cm90ZToNCj4gSW4gY2FzZSBvZiBtdWx0
aS1tYXN0ZXIgZW52aXJvbm1lbnQsIGlmIGEgcGVlciBtYXN0ZXIgaW5jb3JyZWN0bHkgaGFuZGxl
cw0KPiBhIGJ1cyBpbiB0aGUgbWlkZGxlIG9mIGEgdHJhbnNhY3Rpb24sIEkyQyBoYXJkd2FyZSBo
YW5ncyBpbiBzbGF2ZSBzdGF0ZQ0KPiBhbmQgaXQgY2FuJ3QgZXNjYXBlIGZyb20gdGhlIHNsYXZl
IHN0YXRlLCBzbyB0aGlzIGNvbW1pdCBhZGRzIHNsYXZlDQo+IGluYWN0aXZlIHRpbWVvdXQgc3Vw
cG9ydCB0byByZWNvdmVyIHRoZSBidXMgaW4gdGhlIGNhc2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+DQoNClRoYW5rIHlv
dSBKYWUgZm9yIHRoZSBwYXRjaC4gTGV0IG1lIHBsYXkgd2l0aCBpdCBhbmQgd2lsbCB1cGRhdGUg
YmFjayB3aXRoIG15IHJlc3VsdHMgbGF0ZXIgdGhpcyB3ZWVrLg0KDQpDaGVlcnMsDQoNClRhbw0K
DQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYyB8IDc5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDczIGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1hc3BlZWQuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMNCj4gaW5k
ZXggODkzMTc5MjliZWU0Li45MmUxYTI0OWIzOTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtYXNwZWVkLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3Bl
ZWQuYw0KPiBAQCAtNzAsMTAgKzcwLDE0IEBADQo+ICAjZGVmaW5lIEFTUEVFRF9JMkNEX1RJTUVf
U0NMX0hJR0hfTUFTSwkJCUdFTk1BU0soMTksIDE2KQ0KPiAgI2RlZmluZSBBU1BFRURfSTJDRF9U
SU1FX1NDTF9MT1dfU0hJRlQJCQkxMg0KPiAgI2RlZmluZSBBU1BFRURfSTJDRF9USU1FX1NDTF9M
T1dfTUFTSwkJCUdFTk1BU0soMTUsIDEyKQ0KPiArI2RlZmluZSBBU1BFRURfSTJDRF9USU1FX1RJ
TUVPVVRfQkFTRV9ESVZJU09SX1NISUZUCTgNCj4gKyNkZWZpbmUgQVNQRUVEX0kyQ0RfVElNRV9U
SU1FT1VUX0JBU0VfRElWSVNPUl9NQVNLCUdFTk1BU0soOSwgOCkNCj4gICNkZWZpbmUgQVNQRUVE
X0kyQ0RfVElNRV9CQVNFX0RJVklTT1JfTUFTSwkJR0VOTUFTSygzLCAwKQ0KPiAgI2RlZmluZSBB
U1BFRURfSTJDRF9USU1FX1NDTF9SRUdfTUFYCQkJR0VOTUFTSygzLCAwKQ0KPiArDQo+ICAvKiAw
eDA4IDogSTJDRCBDbG9jayBhbmQgQUMgVGltaW5nIENvbnRyb2wgUmVnaXN0ZXIgIzIgKi8NCj4g
LSNkZWZpbmUgQVNQRUVEX05PX1RJTUVPVVRfQ1RSTAkJCQkwDQo+ICsjZGVmaW5lIEFTUEVFRF9J
MkNEX1RJTUVPVVRfQ1lDTEVTX1NISUZUCQkwDQo+ICsjZGVmaW5lIEFTUEVFRF9JMkNEX1RJTUVP
VVRfQ1lDTEVTX01BU0sJCQlHRU5NQVNLKDQsIDApDQo+ICANCj4gIC8qIDB4MGMgOiBJMkNEIElu
dGVycnVwdCBDb250cm9sIFJlZ2lzdGVyICYNCj4gICAqIDB4MTAgOiBJMkNEIEludGVycnVwdCBT
dGF0dXMgUmVnaXN0ZXINCj4gQEAgLTgxLDYgKzg1LDcgQEANCj4gICAqIFRoZXNlIHNoYXJlIGJp
dCBkZWZpbml0aW9ucywgc28gdXNlIHRoZSBzYW1lIHZhbHVlcyBmb3IgdGhlIGVuYWJsZSAmDQo+
ICAgKiBzdGF0dXMgYml0cy4NCj4gICAqLw0KPiArI2RlZmluZSBBU1BFRURfSTJDRF9JTlRSX1NM
QVZFX0lOQUNUSVZFX1RJTUVPVVQJCUJJVCgxNSkNCj4gICNkZWZpbmUgQVNQRUVEX0kyQ0RfSU5U
Ul9TREFfRExfVElNRU9VVAkJCUJJVCgxNCkNCj4gICNkZWZpbmUgQVNQRUVEX0kyQ0RfSU5UUl9C
VVNfUkVDT1ZFUl9ET05FCQlCSVQoMTMpDQo+ICAjZGVmaW5lIEFTUEVFRF9JMkNEX0lOVFJfU0xB
VkVfTUFUQ0gJCQlCSVQoNykNCj4gQEAgLTk2LDggKzEwMSwxMSBAQA0KPiAgCQkgQVNQRUVEX0ky
Q0RfSU5UUl9TQ0xfVElNRU9VVCB8CQkJCSAgICAgICBcDQo+ICAJCSBBU1BFRURfSTJDRF9JTlRS
X0FCTk9STUFMIHwJCQkJICAgICAgIFwNCj4gIAkJIEFTUEVFRF9JMkNEX0lOVFJfQVJCSVRfTE9T
UykNCj4gKyNkZWZpbmUgQVNQRUVEX0kyQ0RfSU5UUl9TTEFWRV9FUlJPUlMJCQkJCSAgICAgICBc
DQo+ICsJCUFTUEVFRF9JMkNEX0lOVFJfU0xBVkVfSU5BQ1RJVkVfVElNRU9VVA0KPiAgI2RlZmlu
ZSBBU1BFRURfSTJDRF9JTlRSX0FMTAkJCQkJCSAgICAgICBcDQo+IC0JCShBU1BFRURfSTJDRF9J
TlRSX1NEQV9ETF9USU1FT1VUIHwJCQkgICAgICAgXA0KPiArCQkoQVNQRUVEX0kyQ0RfSU5UUl9T
TEFWRV9JTkFDVElWRV9USU1FT1VUIHwJCSAgICAgICBcDQo+ICsJCSBBU1BFRURfSTJDRF9JTlRS
X1NEQV9ETF9USU1FT1VUIHwJCQkgICAgICAgXA0KPiAgCQkgQVNQRUVEX0kyQ0RfSU5UUl9CVVNf
UkVDT1ZFUl9ET05FIHwJCQkgICAgICAgXA0KPiAgCQkgQVNQRUVEX0kyQ0RfSU5UUl9TQ0xfVElN
RU9VVCB8CQkJCSAgICAgICBcDQo+ICAJCSBBU1BFRURfSTJDRF9JTlRSX0FCTk9STUFMIHwJCQkJ
ICAgICAgIFwNCj4gQEAgLTE3Niw2ICsxODQsNyBAQCBzdHJ1Y3QgYXNwZWVkX2kyY19idXMgew0K
PiAgCQkJCQkJCSAgIHUzMiBkaXZpc29yKTsNCj4gIAl1bnNpZ25lZCBsb25nCQkJcGFyZW50X2Ns
a19mcmVxdWVuY3k7DQo+ICAJdTMyCQkJCWJ1c19mcmVxdWVuY3k7DQo+ICsJdTMyCQkJCWh3X3Rp
bWVvdXRfbXM7DQo+ICAJLyogVHJhbnNhY3Rpb24gc3RhdGUuICovDQo+ICAJZW51bSBhc3BlZWRf
aTJjX21hc3Rlcl9zdGF0ZQltYXN0ZXJfc3RhdGU7DQo+ICAJc3RydWN0IGkyY19tc2cJCQkqbXNn
czsNCj4gQEAgLTI3Niw2ICsyODUsMTQgQEAgc3RhdGljIGludCBhc3BlZWRfaTJjX3JlY292ZXJf
YnVzKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzKQ0KPiAgfQ0KPiAgDQo+ICAjaWYgSVNfRU5B
QkxFRChDT05GSUdfSTJDX1NMQVZFKQ0KPiArc3RhdGljIGludCBhc3BlZWRfaTJjX2NoZWNrX3Ns
YXZlX2Vycm9yKHUzMiBpcnFfc3RhdHVzKQ0KPiArew0KPiArCWlmIChpcnFfc3RhdHVzICYgQVNQ
RUVEX0kyQ0RfSU5UUl9TTEFWRV9JTkFDVElWRV9USU1FT1VUKQ0KPiArCQlyZXR1cm4gLUVJTzsN
Cj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgdTMyIGFzcGVlZF9pMmNf
c2xhdmVfaXJxKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzLCB1MzIgaXJxX3N0YXR1cykNCj4g
IHsNCj4gIAl1MzIgY29tbWFuZCwgaXJxX2hhbmRsZWQgPSAwOw0KPiBAQCAtMjg2LDYgKzMwMywx
NCBAQCBzdGF0aWMgdTMyIGFzcGVlZF9pMmNfc2xhdmVfaXJxKHN0cnVjdCBhc3BlZWRfaTJjX2J1
cyAqYnVzLCB1MzIgaXJxX3N0YXR1cykNCj4gIAlpZiAoIXNsYXZlKQ0KPiAgCQlyZXR1cm4gMDsN
Cj4gIA0KPiArCWlmIChhc3BlZWRfaTJjX2NoZWNrX3NsYXZlX2Vycm9yKGlycV9zdGF0dXMpKSB7
DQo+ICsJCWRldl9kYmcoYnVzLT5kZXYsICJyZWNlaXZlZCBzbGF2ZSBlcnJvciBpbnRlcnJ1cHQ6
IDB4JTA4eFxuIiwNCj4gKwkJCWlycV9zdGF0dXMpOw0KPiArCQlpcnFfaGFuZGxlZCB8PSAoaXJx
X3N0YXR1cyAmIEFTUEVFRF9JMkNEX0lOVFJfU0xBVkVfRVJST1JTKTsNCj4gKwkJYnVzLT5zbGF2
ZV9zdGF0ZSA9IEFTUEVFRF9JMkNfU0xBVkVfSU5BQ1RJVkU7DQo+ICsJCXJldHVybiBpcnFfaGFu
ZGxlZDsNCj4gKwl9DQo+ICsNCj4gIAljb21tYW5kID0gcmVhZGwoYnVzLT5iYXNlICsgQVNQRUVE
X0kyQ19DTURfUkVHKTsNCj4gIA0KPiAgCS8qIFNsYXZlIHdhcyByZXF1ZXN0ZWQsIHJlc3RhcnQg
c3RhdGUgbWFjaGluZS4gKi8NCj4gQEAgLTYwMiw3ICs2MjcsNyBAQCBzdGF0aWMgdm9pZCBhc3Bl
ZWRfaTJjX25leHRfbXNnX29yX3N0b3Aoc3RydWN0IGFzcGVlZF9pMmNfYnVzICpidXMpDQo+ICAJ
fQ0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IGFzcGVlZF9pMmNfaXNfaXJxX2Vycm9yKHUzMiBp
cnFfc3RhdHVzKQ0KPiArc3RhdGljIGludCBhc3BlZWRfaTJjX2NoZWNrX21hc3Rlcl9lcnJvcih1
MzIgaXJxX3N0YXR1cykNCj4gIHsNCj4gIAlpZiAoaXJxX3N0YXR1cyAmIEFTUEVFRF9JMkNEX0lO
VFJfQVJCSVRfTE9TUykNCj4gIAkJcmV0dXJuIC1FQUdBSU47DQo+IEBAIC02MzMsOSArNjU4LDkg
QEAgc3RhdGljIHUzMiBhc3BlZWRfaTJjX21hc3Rlcl9pcnEoc3RydWN0IGFzcGVlZF9pMmNfYnVz
ICpidXMsIHUzMiBpcnFfc3RhdHVzKQ0KPiAgCSAqIHNob3VsZCBjbGVhciB0aGUgY29tbWFuZCBx
dWV1ZSBlZmZlY3RpdmVseSB0YWtpbmcgdXMgYmFjayB0byB0aGUNCj4gIAkgKiBJTkFDVElWRSBz
dGF0ZS4NCj4gIAkgKi8NCj4gLQlyZXQgPSBhc3BlZWRfaTJjX2lzX2lycV9lcnJvcihpcnFfc3Rh
dHVzKTsNCj4gKwlyZXQgPSBhc3BlZWRfaTJjX2NoZWNrX21hc3Rlcl9lcnJvcihpcnFfc3RhdHVz
KTsNCj4gIAlpZiAocmV0KSB7DQo+IC0JCWRldl9kYmcoYnVzLT5kZXYsICJyZWNlaXZlZCBlcnJv
ciBpbnRlcnJ1cHQ6IDB4JTA4eFxuIiwNCj4gKwkJZGV2X2RiZyhidXMtPmRldiwgInJlY2VpdmVk
IG1hc3RlciBlcnJvciBpbnRlcnJ1cHQ6IDB4JTA4eFxuIiwNCj4gIAkJCWlycV9zdGF0dXMpOw0K
PiAgCQlpcnFfaGFuZGxlZCB8PSAoaXJxX3N0YXR1cyAmIEFTUEVFRF9JMkNEX0lOVFJfTUFTVEVS
X0VSUk9SUyk7DQo+ICAJCWlmIChidXMtPm1hc3Rlcl9zdGF0ZSAhPSBBU1BFRURfSTJDX01BU1RF
Ul9JTkFDVElWRSkgew0KPiBAQCAtMTE5NCw2ICsxMjE5LDcgQEAgc3RhdGljIHUzMiBhc3BlZWRf
aTJjXzI1eHhfZ2V0X2Nsa19yZWdfdmFsKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGRpdmlzb3Ip
DQo+ICAvKiBwcmVjb25kaXRpb246IGJ1cy5sb2NrIGhhcyBiZWVuIGFjcXVpcmVkLiAqLw0KPiAg
c3RhdGljIGludCBhc3BlZWRfaTJjX2luaXRfY2xrKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVz
KQ0KPiAgew0KPiArCXUzMiB0aW1lb3V0X2Jhc2VfZGl2aXNvciwgdGltZW91dF90aWNrX3VzLCB0
aW1lb3V0X2N5Y2xlczsNCj4gIAl1MzIgZGl2aXNvciwgY2xrX3JlZ192YWw7DQo+ICANCj4gIAlk
aXZpc29yID0gRElWX1JPVU5EX1VQKGJ1cy0+cGFyZW50X2Nsa19mcmVxdWVuY3ksIGJ1cy0+YnVz
X2ZyZXF1ZW5jeSk7DQo+IEBAIC0xMjAyLDggKzEyMjgsNDYgQEAgc3RhdGljIGludCBhc3BlZWRf
aTJjX2luaXRfY2xrKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzKQ0KPiAgCQkJQVNQRUVEX0ky
Q0RfVElNRV9USERTVEFfTUFTSyB8DQo+ICAJCQlBU1BFRURfSTJDRF9USU1FX1RBQ1NUX01BU0sp
Ow0KPiAgCWNsa19yZWdfdmFsIHw9IGJ1cy0+Z2V0X2Nsa19yZWdfdmFsKGJ1cy0+ZGV2LCBkaXZp
c29yKTsNCj4gKw0KPiArCWlmIChidXMtPmh3X3RpbWVvdXRfbXMpIHsNCj4gKwkJdTggZGl2X21h
eCA9IEFTUEVFRF9JMkNEX1RJTUVfVElNRU9VVF9CQVNFX0RJVklTT1JfTUFTSyA+Pg0KPiArCQkJ
ICAgICBBU1BFRURfSTJDRF9USU1FX1RJTUVPVVRfQkFTRV9ESVZJU09SX1NISUZUOw0KPiArCQl1
OCBjeWNsZXNfbWF4ID0gQVNQRUVEX0kyQ0RfVElNRU9VVF9DWUNMRVNfTUFTSyA+Pg0KPiArCQkJ
CUFTUEVFRF9JMkNEX1RJTUVPVVRfQ1lDTEVTX1NISUZUOw0KPiArDQo+ICsJCXRpbWVvdXRfYmFz
ZV9kaXZpc29yID0gMDsNCj4gKw0KPiArCQlkbyB7DQo+ICsJCQl0aW1lb3V0X3RpY2tfdXMgPSAx
MDAwICogKDE2Mzg0IDw8DQo+ICsJCQkJCQkgICh0aW1lb3V0X2Jhc2VfZGl2aXNvciA8PCAxKSkg
Lw0KPiArCQkJCQkgIChidXMtPnBhcmVudF9jbGtfZnJlcXVlbmN5IC8gMTAwMCk7DQo+ICsNCj4g
KwkJCWlmICh0aW1lb3V0X2Jhc2VfZGl2aXNvciA9PSBkaXZfbWF4IHx8DQo+ICsJCQkgICAgdGlt
ZW91dF90aWNrX3VzICogQVNQRUVEX0kyQ0RfVElNRU9VVF9DWUNMRVNfTUFTSyA+PQ0KPiArCQkJ
ICAgIGJ1cy0+aHdfdGltZW91dF9tcyAqIDEwMDApDQo+ICsJCQkJYnJlYWs7DQo+ICsJCX0gd2hp
bGUgKHRpbWVvdXRfYmFzZV9kaXZpc29yKysgPCBkaXZfbWF4KTsNCj4gKw0KPiArCQlpZiAodGlt
ZW91dF90aWNrX3VzKSB7DQo+ICsJCQl0aW1lb3V0X2N5Y2xlcyA9IERJVl9ST1VORF9VUChidXMt
Pmh3X3RpbWVvdXRfbXMgKiAxMDAwLA0KPiArCQkJCQkJICAgICAgdGltZW91dF90aWNrX3VzKTsN
Cj4gKwkJCWlmICh0aW1lb3V0X2N5Y2xlcyA9PSAwKQ0KPiArCQkJCXRpbWVvdXRfY3ljbGVzID0g
MTsNCj4gKwkJCWVsc2UgaWYgKHRpbWVvdXRfY3ljbGVzID4gY3ljbGVzX21heCkNCj4gKwkJCQl0
aW1lb3V0X2N5Y2xlcyA9IGN5Y2xlc19tYXg7DQo+ICsJCX0gZWxzZSB7DQo+ICsJCQl0aW1lb3V0
X2N5Y2xlcyA9IDA7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQl0aW1lb3V0X2Jhc2VfZGl2
aXNvciA9IDA7DQo+ICsJCXRpbWVvdXRfY3ljbGVzID0gMDsNCj4gKwl9DQo+ICsNCj4gKwljbGtf
cmVnX3ZhbCB8PSBGSUVMRF9QUkVQKEFTUEVFRF9JMkNEX1RJTUVfVElNRU9VVF9CQVNFX0RJVklT
T1JfTUFTSywNCj4gKwkJCQkgIHRpbWVvdXRfYmFzZV9kaXZpc29yKTsNCj4gKw0KPiAgCXdyaXRl
bChjbGtfcmVnX3ZhbCwgYnVzLT5iYXNlICsgQVNQRUVEX0kyQ19BQ19USU1JTkdfUkVHMSk7DQo+
IC0Jd3JpdGVsKEFTUEVFRF9OT19USU1FT1VUX0NUUkwsIGJ1cy0+YmFzZSArIEFTUEVFRF9JMkNf
QUNfVElNSU5HX1JFRzIpOw0KPiArCXdyaXRlbCh0aW1lb3V0X2N5Y2xlcywgYnVzLT5iYXNlICsg
QVNQRUVEX0kyQ19BQ19USU1JTkdfUkVHMik7DQo+ICANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4g
QEAgLTE0MDQsNiArMTQ2OCw5IEBAIHN0YXRpYyBpbnQgYXNwZWVkX2kyY19wcm9iZV9idXMoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJfQ0KPiAgCX0NCj4gIA0KPiArCWRldmlj
ZV9wcm9wZXJ0eV9yZWFkX3UzMigmcGRldi0+ZGV2LCAiYXNwZWVkLGh3LXRpbWVvdXQtbXMiLA0K
PiArCQkJCSAmYnVzLT5od190aW1lb3V0X21zKTsNCj4gKw0KPiAgCS8qIEluaXRpYWxpemUgdGhl
IEkyQyBhZGFwdGVyICovDQo+ICAJc3Bpbl9sb2NrX2luaXQoJmJ1cy0+bG9jayk7DQo+ICAJaW5p
dF9jb21wbGV0aW9uKCZidXMtPmNtZF9jb21wbGV0ZSk7DQo+IA0K
