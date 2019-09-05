Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F95AAE7B
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 00:30:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Pb3q3RqVzDr5Z
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 08:30:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=41516ba7b5=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="gBLUiZGT"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Dv7dPrsr"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Pb2x4ZC7zDqdg
 for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2019 08:29:21 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x85MNlPX031724; Thu, 5 Sep 2019 15:28:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=LzONAWZF+LIguJXwFMo68LQcsWwvrVaelJ00BsqjjUs=;
 b=gBLUiZGTqCMA9nahb2Peuk8sMLqlCDf0wCcJmlhqN42zMoBIMFigr/PcHQKbfK0zULWX
 saxjgGDsyXe5FIHTvO/t42C8qfE0hmkI0lVMY9kPME2dYKwmP3R18UXfhMfciDTORbVt
 qnRA9/cJGz83csIYeMXcC+SKfRwRW+nNkl4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2uu4yj9ue4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 05 Sep 2019 15:28:04 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 5 Sep 2019 15:28:03 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 5 Sep 2019 15:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/7tUIQ+dcaiXMMw3eIDByBDx8fUBwgABdWbrzcRl8jpyG+A4CEWOqHy/STwGqic8CENepjBhIFz/Pddl4Zm5KXiDwMH0S+6ZHebKighs7nDJH6AlxhpcYC7FEVkV8ryrAOKX0mnH6wFqzVvXc0l0KeoWBemW9Aq+Z9V9ySCoHESFnzqfsLVLg/SuUk/wamqZImj3UCP9JmVowYsw0QyeCEWKuiV4Z9CVWNpRPxhMsCXF99Wl5De0q+MRurHVk+Z7lzB8uKNNiagkalNa5Vpy9SKhmwmCFL238Qn97UXE5wzKzrwVqByrd7wUinLZiJ4qK/45Ep4dTfmeTwTVQiBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzONAWZF+LIguJXwFMo68LQcsWwvrVaelJ00BsqjjUs=;
 b=ddQNTKTDE4P1zq3tZ0rXIkiVg1vYSsHFQNC9Yn7KhthCfcFYrLqJQ/ajKQeraDXLtajV6ac967cIHPuUpVZ1e10onaCi5rl5nxrPM557nL/p8c8hTheGKx5XOOYx9eiYjdnkGK0piQqXAEvf/x5v00WvLxsZa0eKtdyYFt63QPe1iQqo5e6QCv7oWDHkw/2XPKcpJ9ZFloMSg+fG2jG5OMmhy4utHRsvJfnL4mfBE9W7z+mS3sUsJndH0iNPQtj139QDxXmMiVrUTrbNhD/r4TMRFxETdL4+9LKQgi+sx7vn1ponNslWijXn/WIPmZl7yc30YEgD+vB8uA2aWxU5fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzONAWZF+LIguJXwFMo68LQcsWwvrVaelJ00BsqjjUs=;
 b=Dv7dPrsr9MEsZeu4XwTtdQCW07TiIWS8tstj2i5Vz2KQz5a7fZzUKFNEusTTbGmGeq5kMxvoaWdoNLuVwqxp5V6TED8HzqW9h2Bz2R/qP2KVM/4PI9bSrpufdSdvNtVct5itcK3voQ0C0qQqscGMTWaKAP5mWNZVofYWJ9qNU9s=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1294.namprd15.prod.outlook.com (10.175.3.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.22; Thu, 5 Sep 2019 22:28:02 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801%9]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 22:28:02 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
Thread-Topic: [PATCH dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
Thread-Index: AQHVY1yDI28Zw8bU0kuhZOCPC1aBFKcdq6AA
Date: Thu, 5 Sep 2019 22:28:02 +0000
Message-ID: <f0f1a11c-4e0a-0ac0-b1dd-d05931bf5b4e@fb.com>
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
 <20190904200758.5420-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190904200758.5420-3-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR15CA0047.namprd15.prod.outlook.com
 (2603:10b6:300:ad::33) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:1461]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b8829e2-13cf-4ccb-5c6e-08d732505025
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1294; 
x-ms-traffictypediagnostic: MWHPR15MB1294:
x-microsoft-antispam-prvs: <MWHPR15MB12945C621431C8D8AE34D88AB2BB0@MWHPR15MB1294.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(39860400002)(136003)(376002)(396003)(199004)(189003)(66946007)(6246003)(66476007)(66556008)(478600001)(66446008)(6512007)(76176011)(36756003)(14454004)(6486002)(46003)(6436002)(53936002)(8676002)(4326008)(305945005)(8936002)(7736002)(229853002)(64756008)(86362001)(14444005)(256004)(71200400001)(71190400001)(31696002)(2906002)(81156014)(81166006)(386003)(5660300002)(11346002)(65956001)(6506007)(52116002)(316002)(476003)(58126008)(99286004)(186003)(65806001)(110136005)(486006)(2616005)(25786009)(102836004)(6116002)(31686004)(446003)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1294;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wR/xdfML6ftJuggsK3TYskXyvLQsbWwebUHf2Z4ESeO864h9oHgC0lLaQ5ITV7Opk8ugIkjC4qW8WwQv+Gk/MSheqXnjswDxlcvjmFFudLYQBTdR+BL1e13C40kvcLLhAYZYFAlpkwoXABLXXbJ1GnMzyucjrYi8eLTfveKaaZQRHT04SDfx3/cuyqRwxmVVZMOvSP3KlJfhStghbAC3k4X5eHacvcdGKIfMxSWiewKMGzotKxTtdOzlOK4f4aGAo+3fqlbwQLBaFuvJUf5isA5DWWr39jdaZLeMdRDxRsmZ08zhEvwtgrLcNMI2eI41yDC9cXb8WsfbHf6kx33m3mcWPPws7SgyNiWEcDr6jtMPDtQkjlqjhZxS6fe5cKMUk8Tpk5L1pqY5MnIIUIWsDmHGcC9EtrusSiDi144bsXM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6590E612213FF448BDBB3624437B7229@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8829e2-13cf-4ccb-5c6e-08d732505025
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 22:28:02.2181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZKcrOu9M1oAKiHYdk/x0lxo14u1tkpPLw7uHM4YLT8sfygaWtNGsdIsP4JvKv7B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1294
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_09:2019-09-04,2019-09-05 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909050208
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

SGkgSmFlLA0KDQpPbiA5LzQvMTkgMTowNyBQTSwgSmFlIEh5dW4gWW9vIHdyb3RlOg0KPiBJbiBj
YXNlIG9mIG11bHRpLW1hc3RlciBlbnZpcm9ubWVudCwgaWYgYSBwZWVyIG1hc3RlciBpbmNvcnJl
Y3RseSBoYW5kbGVzDQo+IGEgYnVzIGluIHRoZSBtaWRkbGUgb2YgYSB0cmFuc2FjdGlvbiwgSTJD
IGhhcmR3YXJlIGhhbmdzIGluIHNsYXZlIHN0YXRlDQo+IGFuZCBpdCBjYW4ndCBlc2NhcGUgZnJv
bSB0aGUgc2xhdmUgc3RhdGUsIHNvIHRoaXMgY29tbWl0IGFkZHMgc2xhdmUNCj4gaW5hY3RpdmUg
dGltZW91dCBzdXBwb3J0IHRvIHJlY292ZXIgdGhlIGJ1cyBpbiB0aGUgY2FzZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4N
Cg0KSSBoYXZlIGEgZ2VuZXJpYyBxdWVzdGlvbiBvbiB0aGUgcGF0Y2g6IGlzIGl0IGdvb2QgZW5v
dWdoIHRvIGp1c3QgZW5hYmxlIHNsYXZlX2luYWN0aXZlX3RpbWVvdXQgYW5kIGFja25vd2xlZGdl
IHRoZSBpbnRlcnJ1cHQgd2hlbiBpdCBoYXBwZW5zPyBPciBkbyB3ZSBuZWVkIHRvIHJlc2V0IHRo
ZSBpMmMgY29udHJvbGxlciB0byBicmluZyBpdCBvdXQgb2Ygc2xhdmUgc3RhdGU/DQoNCkknbSBh
c2tpbmcgdGhpcyBiZWNhdXNlIEkgaGl0IGFuIGlzc3VlIG9uIG15IE1pbmlwYWNrIEJNQyB3aGVy
ZSB0aGUgc2xhdmVfaW5hY3RpdmVfdGltZW91dCBpbnRlcnJ1cHQgd2FzIGdlbmVyYXRlZCBvbmNl
IGV2ZXJ5IH4wLjEgc2Vjb25kcyAoSSBzZXQgYXNwZWVkLGh3LXRpbWVvdXQtbXMgdG8gMTAwMCks
IGFuZCBhIGZldyBzZWNvbmRzIGxhdGVyIG15IEJNQyB3YXMgcmVib290ZWQgKEkgZ3Vlc3Mgd2F0
Y2hkb2cgdGltZWQgb3V0KS4gR2l2ZW4gdGhlIGlzc3VlIGhhcHBlbmVkIG9ubHkgb25jZSwgSSBk
b24ndCBoYXZlIGNoYW5jZSB0byBjb2xsZWN0IG1vcmUgaW5mb3JtYXRpb24gKHN1Y2ggYXMgd2h5
IHRoZSByZXBldGl0aXZlIGludGVycnVwdCB3YXMgZ2VuZXJhdGVkLCB3aHkgQk1DIHJlYm9vdGVk
LCBhbmQgZXRjLikuIFdpbGwgc2hhcmUgbW9yZSBpZiBJIG1ldCB0aGUgcHJvYmxlbSBhZ2Fpbi4N
Cg0KDQpDaGVlcnMsDQoNClRhbw0KDQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1h
c3BlZWQuYyB8IDc5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtYXNwZWVkLmMNCj4gaW5kZXggODkzMTc5MjliZWU0Li45MmUxYTI0OWIzOTMgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMNCj4gKysrIGIvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYw0KPiBAQCAtNzAsMTAgKzcwLDE0IEBADQo+ICAjZGVm
aW5lIEFTUEVFRF9JMkNEX1RJTUVfU0NMX0hJR0hfTUFTSwkJCUdFTk1BU0soMTksIDE2KQ0KPiAg
I2RlZmluZSBBU1BFRURfSTJDRF9USU1FX1NDTF9MT1dfU0hJRlQJCQkxMg0KPiAgI2RlZmluZSBB
U1BFRURfSTJDRF9USU1FX1NDTF9MT1dfTUFTSwkJCUdFTk1BU0soMTUsIDEyKQ0KPiArI2RlZmlu
ZSBBU1BFRURfSTJDRF9USU1FX1RJTUVPVVRfQkFTRV9ESVZJU09SX1NISUZUCTgNCj4gKyNkZWZp
bmUgQVNQRUVEX0kyQ0RfVElNRV9USU1FT1VUX0JBU0VfRElWSVNPUl9NQVNLCUdFTk1BU0soOSwg
OCkNCj4gICNkZWZpbmUgQVNQRUVEX0kyQ0RfVElNRV9CQVNFX0RJVklTT1JfTUFTSwkJR0VOTUFT
SygzLCAwKQ0KPiAgI2RlZmluZSBBU1BFRURfSTJDRF9USU1FX1NDTF9SRUdfTUFYCQkJR0VOTUFT
SygzLCAwKQ0KPiArDQo+ICAvKiAweDA4IDogSTJDRCBDbG9jayBhbmQgQUMgVGltaW5nIENvbnRy
b2wgUmVnaXN0ZXIgIzIgKi8NCj4gLSNkZWZpbmUgQVNQRUVEX05PX1RJTUVPVVRfQ1RSTAkJCQkw
DQo+ICsjZGVmaW5lIEFTUEVFRF9JMkNEX1RJTUVPVVRfQ1lDTEVTX1NISUZUCQkwDQo+ICsjZGVm
aW5lIEFTUEVFRF9JMkNEX1RJTUVPVVRfQ1lDTEVTX01BU0sJCQlHRU5NQVNLKDQsIDApDQo+ICAN
Cj4gIC8qIDB4MGMgOiBJMkNEIEludGVycnVwdCBDb250cm9sIFJlZ2lzdGVyICYNCj4gICAqIDB4
MTAgOiBJMkNEIEludGVycnVwdCBTdGF0dXMgUmVnaXN0ZXINCj4gQEAgLTgxLDYgKzg1LDcgQEAN
Cj4gICAqIFRoZXNlIHNoYXJlIGJpdCBkZWZpbml0aW9ucywgc28gdXNlIHRoZSBzYW1lIHZhbHVl
cyBmb3IgdGhlIGVuYWJsZSAmDQo+ICAgKiBzdGF0dXMgYml0cy4NCj4gICAqLw0KPiArI2RlZmlu
ZSBBU1BFRURfSTJDRF9JTlRSX1NMQVZFX0lOQUNUSVZFX1RJTUVPVVQJCUJJVCgxNSkNCj4gICNk
ZWZpbmUgQVNQRUVEX0kyQ0RfSU5UUl9TREFfRExfVElNRU9VVAkJCUJJVCgxNCkNCj4gICNkZWZp
bmUgQVNQRUVEX0kyQ0RfSU5UUl9CVVNfUkVDT1ZFUl9ET05FCQlCSVQoMTMpDQo+ICAjZGVmaW5l
IEFTUEVFRF9JMkNEX0lOVFJfU0xBVkVfTUFUQ0gJCQlCSVQoNykNCj4gQEAgLTk2LDggKzEwMSwx
MSBAQA0KPiAgCQkgQVNQRUVEX0kyQ0RfSU5UUl9TQ0xfVElNRU9VVCB8CQkJCSAgICAgICBcDQo+
ICAJCSBBU1BFRURfSTJDRF9JTlRSX0FCTk9STUFMIHwJCQkJICAgICAgIFwNCj4gIAkJIEFTUEVF
RF9JMkNEX0lOVFJfQVJCSVRfTE9TUykNCj4gKyNkZWZpbmUgQVNQRUVEX0kyQ0RfSU5UUl9TTEFW
RV9FUlJPUlMJCQkJCSAgICAgICBcDQo+ICsJCUFTUEVFRF9JMkNEX0lOVFJfU0xBVkVfSU5BQ1RJ
VkVfVElNRU9VVA0KPiAgI2RlZmluZSBBU1BFRURfSTJDRF9JTlRSX0FMTAkJCQkJCSAgICAgICBc
DQo+IC0JCShBU1BFRURfSTJDRF9JTlRSX1NEQV9ETF9USU1FT1VUIHwJCQkgICAgICAgXA0KPiAr
CQkoQVNQRUVEX0kyQ0RfSU5UUl9TTEFWRV9JTkFDVElWRV9USU1FT1VUIHwJCSAgICAgICBcDQo+
ICsJCSBBU1BFRURfSTJDRF9JTlRSX1NEQV9ETF9USU1FT1VUIHwJCQkgICAgICAgXA0KPiAgCQkg
QVNQRUVEX0kyQ0RfSU5UUl9CVVNfUkVDT1ZFUl9ET05FIHwJCQkgICAgICAgXA0KPiAgCQkgQVNQ
RUVEX0kyQ0RfSU5UUl9TQ0xfVElNRU9VVCB8CQkJCSAgICAgICBcDQo+ICAJCSBBU1BFRURfSTJD
RF9JTlRSX0FCTk9STUFMIHwJCQkJICAgICAgIFwNCj4gQEAgLTE3Niw2ICsxODQsNyBAQCBzdHJ1
Y3QgYXNwZWVkX2kyY19idXMgew0KPiAgCQkJCQkJCSAgIHUzMiBkaXZpc29yKTsNCj4gIAl1bnNp
Z25lZCBsb25nCQkJcGFyZW50X2Nsa19mcmVxdWVuY3k7DQo+ICAJdTMyCQkJCWJ1c19mcmVxdWVu
Y3k7DQo+ICsJdTMyCQkJCWh3X3RpbWVvdXRfbXM7DQo+ICAJLyogVHJhbnNhY3Rpb24gc3RhdGUu
ICovDQo+ICAJZW51bSBhc3BlZWRfaTJjX21hc3Rlcl9zdGF0ZQltYXN0ZXJfc3RhdGU7DQo+ICAJ
c3RydWN0IGkyY19tc2cJCQkqbXNnczsNCj4gQEAgLTI3Niw2ICsyODUsMTQgQEAgc3RhdGljIGlu
dCBhc3BlZWRfaTJjX3JlY292ZXJfYnVzKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzKQ0KPiAg
fQ0KPiAgDQo+ICAjaWYgSVNfRU5BQkxFRChDT05GSUdfSTJDX1NMQVZFKQ0KPiArc3RhdGljIGlu
dCBhc3BlZWRfaTJjX2NoZWNrX3NsYXZlX2Vycm9yKHUzMiBpcnFfc3RhdHVzKQ0KPiArew0KPiAr
CWlmIChpcnFfc3RhdHVzICYgQVNQRUVEX0kyQ0RfSU5UUl9TTEFWRV9JTkFDVElWRV9USU1FT1VU
KQ0KPiArCQlyZXR1cm4gLUVJTzsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBz
dGF0aWMgdTMyIGFzcGVlZF9pMmNfc2xhdmVfaXJxKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVz
LCB1MzIgaXJxX3N0YXR1cykNCj4gIHsNCj4gIAl1MzIgY29tbWFuZCwgaXJxX2hhbmRsZWQgPSAw
Ow0KPiBAQCAtMjg2LDYgKzMwMywxNCBAQCBzdGF0aWMgdTMyIGFzcGVlZF9pMmNfc2xhdmVfaXJx
KHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzLCB1MzIgaXJxX3N0YXR1cykNCj4gIAlpZiAoIXNs
YXZlKQ0KPiAgCQlyZXR1cm4gMDsNCj4gIA0KPiArCWlmIChhc3BlZWRfaTJjX2NoZWNrX3NsYXZl
X2Vycm9yKGlycV9zdGF0dXMpKSB7DQo+ICsJCWRldl9kYmcoYnVzLT5kZXYsICJyZWNlaXZlZCBz
bGF2ZSBlcnJvciBpbnRlcnJ1cHQ6IDB4JTA4eFxuIiwNCj4gKwkJCWlycV9zdGF0dXMpOw0KPiAr
CQlpcnFfaGFuZGxlZCB8PSAoaXJxX3N0YXR1cyAmIEFTUEVFRF9JMkNEX0lOVFJfU0xBVkVfRVJS
T1JTKTsNCj4gKwkJYnVzLT5zbGF2ZV9zdGF0ZSA9IEFTUEVFRF9JMkNfU0xBVkVfSU5BQ1RJVkU7
DQo+ICsJCXJldHVybiBpcnFfaGFuZGxlZDsNCj4gKwl9DQo+ICsNCj4gIAljb21tYW5kID0gcmVh
ZGwoYnVzLT5iYXNlICsgQVNQRUVEX0kyQ19DTURfUkVHKTsNCj4gIA0KPiAgCS8qIFNsYXZlIHdh
cyByZXF1ZXN0ZWQsIHJlc3RhcnQgc3RhdGUgbWFjaGluZS4gKi8NCj4gQEAgLTYwMiw3ICs2Mjcs
NyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfaTJjX25leHRfbXNnX29yX3N0b3Aoc3RydWN0IGFzcGVl
ZF9pMmNfYnVzICpidXMpDQo+ICAJfQ0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IGFzcGVlZF9p
MmNfaXNfaXJxX2Vycm9yKHUzMiBpcnFfc3RhdHVzKQ0KPiArc3RhdGljIGludCBhc3BlZWRfaTJj
X2NoZWNrX21hc3Rlcl9lcnJvcih1MzIgaXJxX3N0YXR1cykNCj4gIHsNCj4gIAlpZiAoaXJxX3N0
YXR1cyAmIEFTUEVFRF9JMkNEX0lOVFJfQVJCSVRfTE9TUykNCj4gIAkJcmV0dXJuIC1FQUdBSU47
DQo+IEBAIC02MzMsOSArNjU4LDkgQEAgc3RhdGljIHUzMiBhc3BlZWRfaTJjX21hc3Rlcl9pcnEo
c3RydWN0IGFzcGVlZF9pMmNfYnVzICpidXMsIHUzMiBpcnFfc3RhdHVzKQ0KPiAgCSAqIHNob3Vs
ZCBjbGVhciB0aGUgY29tbWFuZCBxdWV1ZSBlZmZlY3RpdmVseSB0YWtpbmcgdXMgYmFjayB0byB0
aGUNCj4gIAkgKiBJTkFDVElWRSBzdGF0ZS4NCj4gIAkgKi8NCj4gLQlyZXQgPSBhc3BlZWRfaTJj
X2lzX2lycV9lcnJvcihpcnFfc3RhdHVzKTsNCj4gKwlyZXQgPSBhc3BlZWRfaTJjX2NoZWNrX21h
c3Rlcl9lcnJvcihpcnFfc3RhdHVzKTsNCj4gIAlpZiAocmV0KSB7DQo+IC0JCWRldl9kYmcoYnVz
LT5kZXYsICJyZWNlaXZlZCBlcnJvciBpbnRlcnJ1cHQ6IDB4JTA4eFxuIiwNCj4gKwkJZGV2X2Ri
ZyhidXMtPmRldiwgInJlY2VpdmVkIG1hc3RlciBlcnJvciBpbnRlcnJ1cHQ6IDB4JTA4eFxuIiwN
Cj4gIAkJCWlycV9zdGF0dXMpOw0KPiAgCQlpcnFfaGFuZGxlZCB8PSAoaXJxX3N0YXR1cyAmIEFT
UEVFRF9JMkNEX0lOVFJfTUFTVEVSX0VSUk9SUyk7DQo+ICAJCWlmIChidXMtPm1hc3Rlcl9zdGF0
ZSAhPSBBU1BFRURfSTJDX01BU1RFUl9JTkFDVElWRSkgew0KPiBAQCAtMTE5NCw2ICsxMjE5LDcg
QEAgc3RhdGljIHUzMiBhc3BlZWRfaTJjXzI1eHhfZ2V0X2Nsa19yZWdfdmFsKHN0cnVjdCBkZXZp
Y2UgKmRldiwgdTMyIGRpdmlzb3IpDQo+ICAvKiBwcmVjb25kaXRpb246IGJ1cy5sb2NrIGhhcyBi
ZWVuIGFjcXVpcmVkLiAqLw0KPiAgc3RhdGljIGludCBhc3BlZWRfaTJjX2luaXRfY2xrKHN0cnVj
dCBhc3BlZWRfaTJjX2J1cyAqYnVzKQ0KPiAgew0KPiArCXUzMiB0aW1lb3V0X2Jhc2VfZGl2aXNv
ciwgdGltZW91dF90aWNrX3VzLCB0aW1lb3V0X2N5Y2xlczsNCj4gIAl1MzIgZGl2aXNvciwgY2xr
X3JlZ192YWw7DQo+ICANCj4gIAlkaXZpc29yID0gRElWX1JPVU5EX1VQKGJ1cy0+cGFyZW50X2Ns
a19mcmVxdWVuY3ksIGJ1cy0+YnVzX2ZyZXF1ZW5jeSk7DQo+IEBAIC0xMjAyLDggKzEyMjgsNDYg
QEAgc3RhdGljIGludCBhc3BlZWRfaTJjX2luaXRfY2xrKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAq
YnVzKQ0KPiAgCQkJQVNQRUVEX0kyQ0RfVElNRV9USERTVEFfTUFTSyB8DQo+ICAJCQlBU1BFRURf
STJDRF9USU1FX1RBQ1NUX01BU0spOw0KPiAgCWNsa19yZWdfdmFsIHw9IGJ1cy0+Z2V0X2Nsa19y
ZWdfdmFsKGJ1cy0+ZGV2LCBkaXZpc29yKTsNCj4gKw0KPiArCWlmIChidXMtPmh3X3RpbWVvdXRf
bXMpIHsNCj4gKwkJdTggZGl2X21heCA9IEFTUEVFRF9JMkNEX1RJTUVfVElNRU9VVF9CQVNFX0RJ
VklTT1JfTUFTSyA+Pg0KPiArCQkJICAgICBBU1BFRURfSTJDRF9USU1FX1RJTUVPVVRfQkFTRV9E
SVZJU09SX1NISUZUOw0KPiArCQl1OCBjeWNsZXNfbWF4ID0gQVNQRUVEX0kyQ0RfVElNRU9VVF9D
WUNMRVNfTUFTSyA+Pg0KPiArCQkJCUFTUEVFRF9JMkNEX1RJTUVPVVRfQ1lDTEVTX1NISUZUOw0K
PiArDQo+ICsJCXRpbWVvdXRfYmFzZV9kaXZpc29yID0gMDsNCj4gKw0KPiArCQlkbyB7DQo+ICsJ
CQl0aW1lb3V0X3RpY2tfdXMgPSAxMDAwICogKDE2Mzg0IDw8DQo+ICsJCQkJCQkgICh0aW1lb3V0
X2Jhc2VfZGl2aXNvciA8PCAxKSkgLw0KPiArCQkJCQkgIChidXMtPnBhcmVudF9jbGtfZnJlcXVl
bmN5IC8gMTAwMCk7DQo+ICsNCj4gKwkJCWlmICh0aW1lb3V0X2Jhc2VfZGl2aXNvciA9PSBkaXZf
bWF4IHx8DQo+ICsJCQkgICAgdGltZW91dF90aWNrX3VzICogQVNQRUVEX0kyQ0RfVElNRU9VVF9D
WUNMRVNfTUFTSyA+PQ0KPiArCQkJICAgIGJ1cy0+aHdfdGltZW91dF9tcyAqIDEwMDApDQo+ICsJ
CQkJYnJlYWs7DQo+ICsJCX0gd2hpbGUgKHRpbWVvdXRfYmFzZV9kaXZpc29yKysgPCBkaXZfbWF4
KTsNCj4gKw0KPiArCQlpZiAodGltZW91dF90aWNrX3VzKSB7DQo+ICsJCQl0aW1lb3V0X2N5Y2xl
cyA9IERJVl9ST1VORF9VUChidXMtPmh3X3RpbWVvdXRfbXMgKiAxMDAwLA0KPiArCQkJCQkJICAg
ICAgdGltZW91dF90aWNrX3VzKTsNCj4gKwkJCWlmICh0aW1lb3V0X2N5Y2xlcyA9PSAwKQ0KPiAr
CQkJCXRpbWVvdXRfY3ljbGVzID0gMTsNCj4gKwkJCWVsc2UgaWYgKHRpbWVvdXRfY3ljbGVzID4g
Y3ljbGVzX21heCkNCj4gKwkJCQl0aW1lb3V0X2N5Y2xlcyA9IGN5Y2xlc19tYXg7DQo+ICsJCX0g
ZWxzZSB7DQo+ICsJCQl0aW1lb3V0X2N5Y2xlcyA9IDA7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0K
PiArCQl0aW1lb3V0X2Jhc2VfZGl2aXNvciA9IDA7DQo+ICsJCXRpbWVvdXRfY3ljbGVzID0gMDsN
Cj4gKwl9DQo+ICsNCj4gKwljbGtfcmVnX3ZhbCB8PSBGSUVMRF9QUkVQKEFTUEVFRF9JMkNEX1RJ
TUVfVElNRU9VVF9CQVNFX0RJVklTT1JfTUFTSywNCj4gKwkJCQkgIHRpbWVvdXRfYmFzZV9kaXZp
c29yKTsNCj4gKw0KPiAgCXdyaXRlbChjbGtfcmVnX3ZhbCwgYnVzLT5iYXNlICsgQVNQRUVEX0ky
Q19BQ19USU1JTkdfUkVHMSk7DQo+IC0Jd3JpdGVsKEFTUEVFRF9OT19USU1FT1VUX0NUUkwsIGJ1
cy0+YmFzZSArIEFTUEVFRF9JMkNfQUNfVElNSU5HX1JFRzIpOw0KPiArCXdyaXRlbCh0aW1lb3V0
X2N5Y2xlcywgYnVzLT5iYXNlICsgQVNQRUVEX0kyQ19BQ19USU1JTkdfUkVHMik7DQo+ICANCj4g
IAlyZXR1cm4gMDsNCj4gIH0NCj4gQEAgLTE0MDQsNiArMTQ2OCw5IEBAIHN0YXRpYyBpbnQgYXNw
ZWVkX2kyY19wcm9iZV9idXMoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJfQ0K
PiAgCX0NCj4gIA0KPiArCWRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMigmcGRldi0+ZGV2LCAiYXNw
ZWVkLGh3LXRpbWVvdXQtbXMiLA0KPiArCQkJCSAmYnVzLT5od190aW1lb3V0X21zKTsNCj4gKw0K
PiAgCS8qIEluaXRpYWxpemUgdGhlIEkyQyBhZGFwdGVyICovDQo+ICAJc3Bpbl9sb2NrX2luaXQo
JmJ1cy0+bG9jayk7DQo+ICAJaW5pdF9jb21wbGV0aW9uKCZidXMtPmNtZF9jb21wbGV0ZSk7DQo+
IA0K
