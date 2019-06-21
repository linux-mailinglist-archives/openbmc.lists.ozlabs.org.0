Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE544F0A7
	for <lists+openbmc@lfdr.de>; Sat, 22 Jun 2019 00:12:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VtGD5hKnzDqk9
	for <lists+openbmc@lfdr.de>; Sat, 22 Jun 2019 08:12:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1075235023=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="JU83EPLb"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="UlKXaQuo"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VtFc12zwzDqfC
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jun 2019 08:11:39 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x5LM97SE032675;
 Fri, 21 Jun 2019 15:11:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=yt8JX70FjqsOLeP3eJinFsfiTDa7/6nkT9cEA0ODqBk=;
 b=JU83EPLbDJNhQV+PO9VHRsf4XXdyQRG+fygfU5bvTjiZWcrZFJdaaLe6veY8ZeqfXBRf
 +hYhiH+6LSCcjj56Bm5LYVcOdvGhQBkyDtZ88BhY88ys6DsflW/Oyw35f7uOHfcK5aIm
 z1lrR3vuVkl/nWMvZzZcQ08yAmfYuqJXxpc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2t936x1082-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jun 2019 15:11:05 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 21 Jun 2019 15:11:04 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 21 Jun 2019 15:11:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yt8JX70FjqsOLeP3eJinFsfiTDa7/6nkT9cEA0ODqBk=;
 b=UlKXaQuoqh9WI5GHGqRyiMhomtEJYKovhCRBsKujiX0TTbFO4SHA4m+O5W72PWwglU/m7A6q3i9YrxckojeF3JV5oYAENrhQIHhA0+zkRYCBambmETpDP5Kc4JCv6nUIg2b2kzFX2b0pdft8ON0LO/iydJjt5+I4uKe7dbFe4Jw=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1600.namprd15.prod.outlook.com (10.173.235.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Fri, 21 Jun 2019 22:11:00 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8%6]) with mapi id 15.20.2008.014; Fri, 21 Jun 2019
 22:11:00 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, C?ric Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH dev-5.1 4/6] i2c: aspeed: fix master pending state
 handling
Thread-Topic: [RFC PATCH dev-5.1 4/6] i2c: aspeed: fix master pending state
 handling
Thread-Index: AQHVJ6H7QOwBCzWWtkKMU/ePa4MK56akiUwAgAB2hICAAa1SgA==
Date: Fri, 21 Jun 2019 22:11:00 +0000
Message-ID: <1086141d-8c9b-36bf-66b4-c9404c40196d@fb.com>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <20190620194922.15093-5-jae.hyun.yoo@linux.intel.com>
 <4ef34869-3425-1258-2ab6-eecfee063aef@fb.com>
 <5afd2271-e5f4-1358-a1b3-da00a9fc8fb1@linux.intel.com>
In-Reply-To: <5afd2271-e5f4-1358-a1b3-da00a9fc8fb1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR1701CA0014.namprd17.prod.outlook.com
 (2603:10b6:301:14::24) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::1:fd4a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 267158c1-9eb9-447d-e71f-08d6f695577d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1600; 
x-ms-traffictypediagnostic: MWHPR15MB1600:
x-microsoft-antispam-prvs: <MWHPR15MB160095C276E3EF77D19BE211B2E70@MWHPR15MB1600.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(346002)(366004)(376002)(39860400002)(45904002)(199004)(189003)(7736002)(478600001)(73956011)(99286004)(14444005)(81166006)(229853002)(81156014)(386003)(102836004)(86362001)(71190400001)(8676002)(46003)(6506007)(53546011)(14454004)(11346002)(31686004)(8936002)(71200400001)(65826007)(486006)(446003)(6436002)(2616005)(2906002)(58126008)(476003)(110136005)(53936002)(64126003)(316002)(66476007)(256004)(6246003)(305945005)(6116002)(76176011)(66556008)(65806001)(52116002)(65956001)(25786009)(6486002)(4326008)(36756003)(68736007)(186003)(31696002)(5660300002)(6512007)(66946007)(64756008)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1600;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IfSONUdlXIJ4SqKmf/WESn1V3KbcqarNOUzE8Ze6Fk0M04qi8KV5hbyQq0Eq7awKcDsSBAEOeKAk92vUOzb/Jj7OWOE32rW9rWm6bhVsmxTzXQhZBbYbDN3lGuhnizi47FJPaLF+l4b3jT1lZDyH0tcD+oOHBh47gCYouU5hdFXW5IEV4Pp4zJ0tV3gakVPi+fcKH+b4rdVRhkFgRQFc/HDpDCjH1L0A+srAOwEuyT9sq2sNZTpTtmIa9goAqzJlYHOVHPeptAHutgmvUVfd5yEzLHqQeauGEGTmxzkuvZiFQcSKjSs1mrfFNyK2Kmk5Gz8EkfguVmkHjrfBCk8selPsANPXqQd6px69EwgdrCfZ97JwDL396aPGibG0L6lhhgeNqa29omSZnMnR6HPgZzkjf5H9MrE7mCNWv03nZwc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57EBB5821FC8F248AAECECEE229920C0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 267158c1-9eb9-447d-e71f-08d6f695577d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 22:11:00.2716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1600
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906210168
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

T24gNi8yMC8xOSAxOjM0IFBNLCBKYWUgSHl1biBZb28gd3JvdGU6DQo+IE9uIDYvMjAvMjAxOSAx
OjMwIFBNLCBUYW8gUmVuIHdyb3RlOg0KPj4gT24gNi8yMC8xOSAxMjo0OSBQTSwgSmFlIEh5dW4g
WW9vIHdyb3RlOg0KPj4+IEluIGNhc2Ugb2YgYSBtYXN0ZXIgcGVuZGluZyBzdGF0ZSwgaXQgc2hv
dWxkIG5vdCB0cmlnZ2VyIHRoZSBtYXN0ZXINCj4+PiBjb21tYW5kIGJlY2F1c2UgdGhpcyBIL1cg
aXMgc2hhcmluZyB0aGUgc2FtZSBkYXRhIGJ1ZmZlciBmb3Igc2xhdmUNCj4+PiBhbmQgbWFzdGVy
IG9wZXJhdGlvbiwgc28gdGhpcyBjb21taXQgZml4ZXMgdGhlIGlzc3VlIHdpdGggbWFraW5nDQo+
Pj4gdGhlIG1hc3RlciBjb21tYW5kIHRyaWdnZXJpbmcgaGFwcGVucyB3aGVuIHRoZSBzdGF0ZSBn
b2VzIHRvIGFjdGl2ZQ0KPj4+IHN0YXRlLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogSmFlIEh5
dW4gWW9vIDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPg0KPj4NCj4+IFRoYW5rIHlvdSBK
YWUgZm9yIHRoZSBwYXRjaC4gSSBiZWxpZXZlIEkgaGl0IHRoZSBidWcgd2hpbGUgZGVidWdnaW5n
IEJNQy1CSUMgbXVsdGktbWFzdGVyIGNvbW11bmljYXRpb24gb24gbXkgTWluaXBhY2sgYXN0MjUw
MCBCTUMgcGxhdGZvcm0uIExldCBtZSBhcHBseSB0aGUgcGF0Y2ggYW5kIHJ1biBzb21lIHRlc3Rp
bmcsIHdpbGwgdHJ5IHRvIHNoYXJlIG15IHJlc3VsdHMgYnkgdGhpcyBGcmlkYXkgKFBhY2lmaWMg
VGltZSkuDQo+IA0KPiBUaGFuayB5b3UgVGFvIGZvciB5b3VyIGhlbHAgZm9yIHRlc3RpbmcgaXQu
IEl0IHdvdWxkIGJlIHJlYWxseSBoZWxwZnVsDQo+IHRvIGNvbXBsZXRlIHRoaXMgcGF0Y2ggaW1w
bGVtZW50YXRpb24uIFdpbGwgd2FpdCB0aGUgdGVzdCByZXN1bHRzLg0KPiANCj4gUmVnYXJkcywN
Cj4gSmFlDQoNCkhpIEphZSwNCg0KQWx0aG91Z2ggbXkgcHJvYmxlbSBpcyBub3QgZml4ZWQgYnkg
dGhpcyBwYXRjaCwgbm90aGluZyBnZXRzIHdvcnNlIDopIEFuZCBwYXRjaCBpdHNlbGYgbG9va3Mg
cmVhc29uYWJsZSB0byBtZS4NCg0KVGhlIHByb2JsZW0gSSdtIGZhY2luZyBpczogaTJjLTAgKG11
bHRpLW1hc3Rlcikgc3RheXMgaW4gIlNMQVZFX0FDVElWRSIgc3RhdGU6IHNsYXZlX3N0YXRlIGlz
IGJyb3VnaHQgYmFjayB0byBTTEFWRV9TVEFSVCBhZ2FpbiBhbmQgYWdhaW4gZHVlIHRvIFNMQVZF
X01BVENIIGludGVycnVwdC4gSSBkaWRuJ3QgZ2V0IGNoYW5jZSB0byBjaGVjayBtYXN0ZXIgc3Rh
dGUgbWFjaGluZSwgYnV0IEknZCBhc3N1bWUgaXQncyBhbHdheXMgcGVuZGluZyB3aGljaCBleHBs
YWlucyB3aHkgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyBnZXQgImNvbm5lY3Rpb24gdGltZWQgb3V0
IiBlcnJvciBmb3IgaTJjIG1hc3RlciB0cmFuc2ZlcnMuIA0KDQoNCkNoZWVycywNCg0KVGFvDQo=
