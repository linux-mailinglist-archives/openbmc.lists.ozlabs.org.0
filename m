Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C30258E80
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 01:25:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zbbd1x3bzDqfk
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 09:25:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=10815e4c86=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="JW6ANEgd"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="dL/N4MWZ"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZbZw2Gy4zDqfk
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 09:24:35 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x5RNMmBM011364;
 Thu, 27 Jun 2019 16:24:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=TfdxsjqnUabvlehg3u9W6bt80PAJDi38cZ0O1rENqb4=;
 b=JW6ANEgdN+spmmJ8h7OETa35vE6YE22goLXV070MiHXn06p+7N75GjkmFiKUYrIIMVEG
 kqUs/cGYGrALZp39kw/LVADZidP2CKdoRA8cATHA4/ZciuLW+W0yVqa93fx9mVPs/0LE
 /lJwEOWd1T03eFGd8022XJLnzflDMy8EHno= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2tcc49wq83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 27 Jun 2019 16:24:08 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Jun 2019 16:24:07 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 27 Jun 2019 16:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=HuQM23hTFoqxUQaaW/MjGRuBqXvJEFFx0uGwnU+zYfd2NIW0GdJiOWt0Bx3lW3AGPYu2HdZYD2DG5GEpytumXgmD20XMPlxbHNGFTGD0L4oj0KfUCk9VYwjreY+5woHUQIW3Ytu42FsobPqRdlUamEIoCzsOHwpQrCm7/xmGMgw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfdxsjqnUabvlehg3u9W6bt80PAJDi38cZ0O1rENqb4=;
 b=DGqFOPj+/HfpgJ1p/dFsECjz0lf1rtQVH6Qp8bCD5RncMEblEZOLDjmWmqcPaXstw+iSDk7wPuQEWD5stimirRkmBiZbhM7gTj+9grOVJ3hCqTUIC1N4A7RlcLtNRx3fJRUlXJrLqVviA5RDs9oRgoFNbQJLTNtQsCIvP0le3BI=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfdxsjqnUabvlehg3u9W6bt80PAJDi38cZ0O1rENqb4=;
 b=dL/N4MWZ/LjbNi2n/iZNmrWk5pzCVP+XfdzRC2b5ROcXN2k8XR5RWWVg50xohqNmGf2wkxLcf6c5CYW/XlMC7Qk28tnW1y+zP9rqI7S0M2TuDIXR/dkbLoRa4tyAGfHwQGMv0dsHOu6uj5cfwHvtS6oHXbaTAqmpQpcJKJ6XAW0=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1934.namprd15.prod.outlook.com (10.174.99.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Thu, 27 Jun 2019 23:24:06 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8%6]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 23:24:06 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Cedric Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Subject: Re: [RFC v2 dev-5.1 4/5] i2c: aspeed: add buffer mode transfer support
Thread-Topic: [RFC v2 dev-5.1 4/5] i2c: aspeed: add buffer mode transfer
 support
Thread-Index: AQHVK5fGifcEdpjKlUmvpczxzq7UA6awJ6EA
Date: Thu, 27 Jun 2019 23:24:06 +0000
Message-ID: <5cc696ba-7fa7-c7cb-0ba6-81df3015e974@fb.com>
References: <20190625205109.27672-1-jae.hyun.yoo@linux.intel.com>
 <20190625205109.27672-5-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190625205109.27672-5-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:300:4b::29) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::3:fd3e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7d12120-990a-4567-e1f4-08d6fb568c4c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1934; 
x-ms-traffictypediagnostic: MWHPR15MB1934:
x-microsoft-antispam-prvs: <MWHPR15MB1934D15568B5CDA62ABA322AB2FD0@MWHPR15MB1934.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:274;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(39860400002)(376002)(346002)(189003)(199004)(46003)(256004)(6486002)(7736002)(81166006)(6436002)(99286004)(66556008)(73956011)(6512007)(64756008)(4744005)(305945005)(110136005)(31686004)(316002)(66446008)(66476007)(66946007)(52116002)(81156014)(53936002)(229853002)(14454004)(64126003)(8676002)(58126008)(5660300002)(386003)(71190400001)(86362001)(8936002)(25786009)(68736007)(6246003)(65826007)(4326008)(76176011)(65956001)(71200400001)(31696002)(476003)(478600001)(2906002)(486006)(446003)(6506007)(53546011)(11346002)(36756003)(2616005)(186003)(102836004)(6116002)(65806001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1934;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7JCZt2ef7i1RlGBqeiXwEb0uxF3ef8Pa83B0IuiZBjoRWBGTvrM/wG4E9YJmcUM/X94EJvy227fENV9SQgRW5nUT2i5nCME9AgFTFa5GGHe+avHYIEOwZhf5wiMzQdz2bnBypJ3r8XcUMMD3S1lrdvzHoZ1BpCl5o0ba2rPa035q8qYqliQbr5AI15bEWtusN23UUYTfNMsUuFgDsgYYQPY/xOa8ZfLmyyV4A7afezPd1u0Gl3bGJQdPMAOCbEGP/Y7qeoBywy5ipzUDUGMidwkLy/VyQmySh5I+1uEGIA+q0xzmzThMndY6QcD3nv/N+9Q9GQ5IM5CKVtkwLee/q+Z8dPG2l0AludBDDHkayJ6dfXklWLMhxZ8pRwj2LT9pxEXxTWMcR01eCk2ewd5wWuo0ABZ/dla1KV/WAG/AtRw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38836820F892194B88C5FAC849566B3E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d12120-990a-4567-e1f4-08d6fb568c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 23:24:06.3275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1934
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270271
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

T24gNi8yNS8xOSAxOjUxIFBNLCBKYWUgSHl1biBZb28gd3JvdGU6DQo+IEJ5dGUgbW9kZSBjdXJy
ZW50bHkgdGhpcyBkcml2ZXIgdXNlcyBtYWtlcyBsb3RzIG9mIGludGVycnVwdCBjYWxsDQo+IHdo
aWNoIGlzbid0IGdvb2QgZm9yIHBlcmZvcm1hbmNlIGFuZCBpdCBtYWtlcyB0aGUgZHJpdmVyIHZl
cnkNCj4gdGltaW5nIHNlbnNpdGl2ZS4gVG8gaW1wcm92ZSBwZXJmb3JtYW5jZSBvZiB0aGUgZHJp
dmVyLCB0aGlzIGNvbW1pdA0KPiBhZGRzIGJ1ZmZlciBtb2RlIHRyYW5zZmVyIHN1cHBvcnQgd2hp
Y2ggdXNlcyBJMkMgU1JBTSBidWZmZXINCj4gaW5zdGVhZCBvZiB1c2luZyBhIHNpbmdsZSBieXRl
IGJ1ZmZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9v
QGxpbnV4LmludGVsLmNvbT4NCg0KVGVzdGVkLWJ5OiBUYW8gUmVuIDx0YW9yZW5AZmIuY29tPg0K
DQpBcHBsaWVkIHBhdGNoIHNlcmlhbCAxLTQgdG8gb3BlbmJtYyBrZXJuZWwgNS4xLjE1IGFuZCBi
b290ZWQgdXAgRmFjZWJvb2sgQ01NIEFTVDI1MDAgQk1DOiBJMkMgY29tcG9uZW50IGxvb2tzIG5v
cm1hbCB0byBtZS4NCg0KQ2hlZXJzLA0KDQpUYW8NCg==
