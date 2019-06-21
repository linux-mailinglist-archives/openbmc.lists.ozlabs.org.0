Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E84F0C5
	for <lists+openbmc@lfdr.de>; Sat, 22 Jun 2019 00:30:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Vtg371B9zDqgN
	for <lists+openbmc@lfdr.de>; Sat, 22 Jun 2019 08:30:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1075235023=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="R3RJMtXc"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="CHu4bchr"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VtfV1Mv2zDqcT
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jun 2019 08:29:52 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LMOVKq030437; Fri, 21 Jun 2019 15:29:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=E53yVL2MKMAk6xQQrYBvD9taXFLB4yKIPRwIg0JtxDE=;
 b=R3RJMtXcu/M8b/+JQfJwZY+FkKet5FGCT7wIpenB0fG9b42YRs67D8S0UvrpCinwMTBn
 TWemPt+5J4L5Dgly368wuGFrveQeb7Co86ZLFmE2GqO80nH+Qsd9mH/PhbdKDaRzw/yk
 U4I6MiddJkWV70O2lv/v8mYVzxnaTk1/6qk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2t90mjhs2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jun 2019 15:29:21 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 21 Jun 2019 15:29:19 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 21 Jun 2019 15:29:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E53yVL2MKMAk6xQQrYBvD9taXFLB4yKIPRwIg0JtxDE=;
 b=CHu4bchrH7fSwRoov8PEE0qx3rlyEXxtPv2viY3FcBQ6T3vkrpt5U1V96nUIeLtqjLBJorIl9L6kP6J5MV/H6BXjlL5an+d1eqTubyRb8c4ZfYH3Zv1h7EQetlEUb2JZ9eq1BHW1fhL1XkG3lhnqzOuNkduVZ06VUrTsN3D752M=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1725.namprd15.prod.outlook.com (10.174.255.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 21 Jun 2019 22:29:18 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8%6]) with mapi id 15.20.2008.014; Fri, 21 Jun 2019
 22:29:18 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, C?ric Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH dev-5.1 5/6] i2c: aspeed: add buffer mode transfer
 support
Thread-Topic: [RFC PATCH dev-5.1 5/6] i2c: aspeed: add buffer mode transfer
 support
Thread-Index: AQHVJ6IZ8x6amG19hEeJL59C6Whds6amsj+A
Date: Fri, 21 Jun 2019 22:29:18 +0000
Message-ID: <03abb910-c3aa-07af-1c08-8df83a1425e2@fb.com>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <20190620194922.15093-6-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190620194922.15093-6-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR10CA0019.namprd10.prod.outlook.com (2603:10b6:301::29)
 To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::1:fd4a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90ec79fe-46fa-44e2-6e37-08d6f697e5a0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1725; 
x-ms-traffictypediagnostic: MWHPR15MB1725:
x-microsoft-antispam-prvs: <MWHPR15MB172567D7275F535048F380F5B2E70@MWHPR15MB1725.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:241;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(81166006)(81156014)(71200400001)(65806001)(65956001)(71190400001)(53936002)(8676002)(64756008)(73956011)(66946007)(66476007)(66556008)(66446008)(36756003)(256004)(316002)(305945005)(4744005)(64126003)(110136005)(58126008)(7736002)(31686004)(8936002)(6512007)(76176011)(52116002)(99286004)(2906002)(68736007)(229853002)(6116002)(476003)(25786009)(4326008)(31696002)(478600001)(65826007)(6436002)(386003)(5660300002)(6486002)(6246003)(102836004)(186003)(14454004)(446003)(2616005)(86362001)(46003)(11346002)(6506007)(53546011)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1725;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 229eyXMqDElEf7Za4SmB96XH76V2DWFOz1QcQXhYlmRhc6jKyIYDG/4NYqnVDb/CWlPU6nCnh3p01D1RgTspsNun937cV84skNs4qLFf5n9aphQLYCpwRlgMbT3Ln5khOtclX1stlfQaTbFzcAnIR+AqmPE3v+uFdIztQQKwcANT0xu1cCf7je4ULzgDD52MOXauLeAlqwIeHyeCepYNYKD+HZszS7ObMj73/KvurgZ5k4NRy1MYfE1ybHXN5moSXeX9MqQOIeOjw3gS1ggrp3sNgH/zph5syKXHlrduAmsDu8zL9VAivhoE2mDQs/NaP9vWnhnP+xN6IF7zFW09rKWKPG7sIFPiQ4VWu5l4GDd9v0+IiEA2g6z2w4dz/kuQBTDU6dQF++0yV7NBpV5z4hAvpki4V5B7quKNH5QESoQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E84F4719BC8B24BA2770BF959298603@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ec79fe-46fa-44e2-6e37-08d6f697e5a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 22:29:18.5105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1725
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906210171
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

T24gNi8yMC8xOSAxMjo0OSBQTSwgSmFlIEh5dW4gWW9vIHdyb3RlOg0KPiBCeXRlIG1vZGUgY3Vy
cmVudGx5IHRoaXMgZHJpdmVyIHVzZXMgbWFrZXMgbG90cyBvZiBpbnRlcnJ1cHQgY2FsbA0KPiB3
aGljaCBpc24ndCBnb29kIGZvciBwZXJmb3JtYW5jZSBhbmQgaXQgbWFrZXMgdGhlIGRyaXZlciB2
ZXJ5DQo+IHRpbWluZyBzZW5zaXRpdmUuIFRvIGltcHJvdmUgcGVyZm9ybWFuY2Ugb2YgdGhlIGRy
aXZlciwgdGhpcyBjb21taXQNCj4gYWRkcyBidWZmZXIgbW9kZSB0cmFuc2ZlciBzdXBwb3J0IHdo
aWNoIHVzZXMgSTJDIFNSQU0gYnVmZmVyDQo+IGluc3RlYWQgb2YgdXNpbmcgYSBzaW5nbGUgYnl0
ZSBidWZmZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlv
b0BsaW51eC5pbnRlbC5jb20+DQoNCkxldCBtZSBhcHBseSB0aGUgcGF0Y2ggdG8gbXkgYXN0MjUw
MCBCTUMgcGxhdGZvcm0gYW5kIHdpbGwgc2hhcmUgcmVzdWx0cyBlYXJsaWVyIG5leHQgd2Vlay4N
Cg0KDQpDaGVlcnMsDQoNClRhbw0K
