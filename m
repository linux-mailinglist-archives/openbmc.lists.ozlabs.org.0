Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A74DB3E
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 22:31:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VD4C16nlzDrMb
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 06:31:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=10748cf007=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="phzqmAhx"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Ea4BoT0s"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VD3D6qcXzDrCW
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 06:30:30 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5KKLjTc014354; Thu, 20 Jun 2019 13:30:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=+OkULHMaiPHWmI4yfZxZBmSafI5ejsI8FLz5NDnRsEY=;
 b=phzqmAhx/nu69KsNxi1WEfWpsQ2uiBjaeJBPg72mCp0kGg1RIk62+3mBXckN3qld7yDv
 3sr8sKXN38nQ9gdVKK+fdqtC5BB7V3BWFNNv2AVuphbGpySeMAEk1pXYfRq2EnwnldzI
 aw0SjTJfHQnoxYG5Jzt6cYfM1gmumpQpfS8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0b-00082601.pphosted.com with ESMTP id 2t8aj99k5y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Jun 2019 13:30:14 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 20 Jun 2019 13:30:13 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 20 Jun 2019 13:30:13 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 20 Jun 2019 13:30:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OkULHMaiPHWmI4yfZxZBmSafI5ejsI8FLz5NDnRsEY=;
 b=Ea4BoT0sZfMhdyUQi9jbgTdfxSNLhrPtS6fPHkZM9HKmoZLkA/jTh2wvvx5qiLbbM4z9SY5tJgkRtZaHhcbD9Kxmn1Ddnfjx3ltbIAaMjifp0JKt0u0M+w9G1S1p7Ew1RSD0qX6KhJX3QBiD5bsCekp7S/4CxM8mcmRvO14ZmOA=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1439.namprd15.prod.outlook.com (10.173.235.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 20:30:12 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8%6]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 20:30:12 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, C?ric Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH dev-5.1 4/6] i2c: aspeed: fix master pending state
 handling
Thread-Topic: [RFC PATCH dev-5.1 4/6] i2c: aspeed: fix master pending state
 handling
Thread-Index: AQHVJ6H7QOwBCzWWtkKMU/ePa4MK56ak/qUA
Date: Thu, 20 Jun 2019 20:30:12 +0000
Message-ID: <4ef34869-3425-1258-2ab6-eecfee063aef@fb.com>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <20190620194922.15093-5-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190620194922.15093-5-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR18CA0038.namprd18.prod.outlook.com
 (2603:10b6:320:31::24) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::1:4620]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bedaa6e-c838-47e1-2d89-08d6f5be1857
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1439; 
x-ms-traffictypediagnostic: MWHPR15MB1439:
x-microsoft-antispam-prvs: <MWHPR15MB143958F4F2961F6D4764494AB2E40@MWHPR15MB1439.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(39860400002)(376002)(346002)(366004)(189003)(199004)(476003)(14454004)(8676002)(6246003)(65806001)(446003)(31696002)(81166006)(2616005)(316002)(11346002)(486006)(71190400001)(65956001)(386003)(4326008)(5660300002)(305945005)(31686004)(81156014)(4744005)(110136005)(52116002)(76176011)(86362001)(46003)(8936002)(186003)(68736007)(478600001)(102836004)(6116002)(65826007)(6512007)(36756003)(6436002)(25786009)(66446008)(6486002)(7736002)(14444005)(256004)(99286004)(53936002)(229853002)(53546011)(66476007)(58126008)(66946007)(6506007)(66556008)(64756008)(71200400001)(64126003)(2906002)(73956011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1439;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n6fBKjNSKXrD7bmstb54Yoal8Mn6tGhI05IGeaLlinJgbB5rAYSw7zDPUGo52o9y1hzcdO9BURa8ormRVqxZQVSaQ2B6pXSeImakxA9PKfGO/0cReY7iKtx7fnwe5v0z8flLtnHca/6cdFvywHtifsokFnlApQMVFYJJ+A2DmLASRIIo6qwlCSL39FC1fJQXaG2byaSI9nJwNOadHtPsKUl4STIfgcDr31huWEBivVhlzDPHzetBVPolkdYVxhDdlORSEM89VC/Z/9SlHc9ZdRpbWDFY+9Lrq4tpnuT3qQlxIxTvpfeI8oEiVH0adlFOR0tHXje7ucReL9ORAoFBdLIGg+02miXLcatdXsbSdHE7TgGn4YMri0Y5vnIn+kR1R0wu4XgGSqbP02gbyqmQ19wiJJwdEr+fO26LpgqLWMs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86CFD169C9E5E942BE3D5B48B2119254@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bedaa6e-c838-47e1-2d89-08d6f5be1857
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 20:30:12.4174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1439
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200146
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

T24gNi8yMC8xOSAxMjo0OSBQTSwgSmFlIEh5dW4gWW9vIHdyb3RlOg0KPiBJbiBjYXNlIG9mIGEg
bWFzdGVyIHBlbmRpbmcgc3RhdGUsIGl0IHNob3VsZCBub3QgdHJpZ2dlciB0aGUgbWFzdGVyDQo+
IGNvbW1hbmQgYmVjYXVzZSB0aGlzIEgvVyBpcyBzaGFyaW5nIHRoZSBzYW1lIGRhdGEgYnVmZmVy
IGZvciBzbGF2ZQ0KPiBhbmQgbWFzdGVyIG9wZXJhdGlvbiwgc28gdGhpcyBjb21taXQgZml4ZXMg
dGhlIGlzc3VlIHdpdGggbWFraW5nDQo+IHRoZSBtYXN0ZXIgY29tbWFuZCB0cmlnZ2VyaW5nIGhh
cHBlbnMgd2hlbiB0aGUgc3RhdGUgZ29lcyB0byBhY3RpdmUNCj4gc3RhdGUuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+DQoN
ClRoYW5rIHlvdSBKYWUgZm9yIHRoZSBwYXRjaC4gSSBiZWxpZXZlIEkgaGl0IHRoZSBidWcgd2hp
bGUgZGVidWdnaW5nIEJNQy1CSUMgbXVsdGktbWFzdGVyIGNvbW11bmljYXRpb24gb24gbXkgTWlu
aXBhY2sgYXN0MjUwMCBCTUMgcGxhdGZvcm0uIExldCBtZSBhcHBseSB0aGUgcGF0Y2ggYW5kIHJ1
biBzb21lIHRlc3RpbmcsIHdpbGwgdHJ5IHRvIHNoYXJlIG15IHJlc3VsdHMgYnkgdGhpcyBGcmlk
YXkgKFBhY2lmaWMgVGltZSkuDQoNCg0KQ2hlZXJzLA0KDQpUYW8NCg==
