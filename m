Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF07B51F52
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 01:56:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XmQT5x8GzDqTd
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 09:56:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=107877cf83=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="gp1DGxmk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="XH9fiZwF"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XmPv2pd4zDqSt
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 09:55:25 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5ONne58025550; Mon, 24 Jun 2019 16:54:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=5rke1KmjL3WAlygVvSo8WFASTQ6ieEuWOWvXOtUek5Y=;
 b=gp1DGxmk+uunYUhptW6w4J9pihjlG5jRIcCtvQFLTb8RIFt+UxIBohkQiF5XJEh687Ov
 68Hr4hb/y8knQb6eBjIeSyj/mc40u0tZjB7GgKY9QOsFRiUdJZSK/fhE/cYUrrkp75sa
 Xg0UbM+Zoe3XDndIyeAVWHflAEv0h8hM8/o= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2tb3cm997k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2019 16:54:52 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 24 Jun 2019 16:54:51 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 24 Jun 2019 16:54:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rke1KmjL3WAlygVvSo8WFASTQ6ieEuWOWvXOtUek5Y=;
 b=XH9fiZwFSmDfAwnV5QCqaa5qPsJYdrr89eMxa55kc5CDnf++hxUMVAPjaAAQFD+e8p+xkwkCSJmkK54ecw9QYVzD7+Cu1lOKoTrun/0FmGUxslJrb1Mb6XZEQDRrjoEfl1Wm+FVNMKYD2kj0OC/nd3CrQMxgUuDmXZLrErKipGc=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1183.namprd15.prod.outlook.com (10.175.2.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 23:54:50 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8%6]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 23:54:49 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, C?ric Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH dev-5.1 5/6] i2c: aspeed: add buffer mode transfer
 support
Thread-Topic: [RFC PATCH dev-5.1 5/6] i2c: aspeed: add buffer mode transfer
 support
Thread-Index: AQHVJ6IZ8x6amG19hEeJL59C6Whds6amPOaAgAB27ICABM1RgA==
Date: Mon, 24 Jun 2019 23:54:49 +0000
Message-ID: <0801acf7-3c24-0a6c-c454-43a8521adb89@fb.com>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <20190620194922.15093-6-jae.hyun.yoo@linux.intel.com>
 <03abb910-c3aa-07af-1c08-8df83a1425e2@fb.com>
 <c6dc2095-3b2a-322c-e131-2056ab0ef4c7@linux.intel.com>
In-Reply-To: <c6dc2095-3b2a-322c-e131-2056ab0ef4c7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR1301CA0016.namprd13.prod.outlook.com
 (2603:10b6:301:29::29) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::1:c163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 828399b2-7b6f-4161-a7e0-08d6f8ff57bd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1183; 
x-ms-traffictypediagnostic: MWHPR15MB1183:
x-microsoft-antispam-prvs: <MWHPR15MB1183AE5361DDCECD1BC8C3FDB2E00@MWHPR15MB1183.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(136003)(39860400002)(366004)(346002)(199004)(189003)(6512007)(6486002)(25786009)(6436002)(186003)(6246003)(2906002)(4326008)(102836004)(53936002)(386003)(478600001)(76176011)(6506007)(53546011)(31696002)(64126003)(14454004)(65956001)(65806001)(110136005)(99286004)(86362001)(52116002)(58126008)(65826007)(6116002)(316002)(7736002)(64756008)(46003)(66946007)(66556008)(66446008)(73956011)(66476007)(476003)(486006)(8936002)(256004)(71190400001)(71200400001)(2616005)(31686004)(5660300002)(36756003)(229853002)(11346002)(8676002)(81156014)(81166006)(446003)(305945005)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1183;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kXcHO7nltrtiam3v6Ezu7wAFjBDS7yn3oe/9UAiCdOVmpIISCGIJufta9QOz+YCqfoxkOewMiQbKKmImj1LS6wLolNM+F2Azl23WUXVpWqb2qMUBzuAy5pSQ72HqnsvJfBJdpGlkPKx4e+GSbijDUyoBd3pGIJ1WB5I4Xckc4kN2jfwZ8QqdGLFbTn2xVPHsTpXXZqs/FMBb+7dLISEUa6k0D/FpChfy3MnGkLCHAyx9WVPLAzztm7oeDouJjxUmh1Hi0z9suKZmLtZVQW+WTwlBU8U7g2bZBqfbl9AUUVwATwyXGMNHnvJABR+uCe9zYqs2ELtHZIdz16pJIGzMvOYXBzvbSNniDDNPJ/xz9KbhqsZPAxWPUYj48JzInPU7gR23uPIhHW2edCcjRFCMmBoGwO3V+KF0Q1yBR8dhZlg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02AB3068D174E8438AA80A47FD8F5C0E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 828399b2-7b6f-4161-a7e0-08d6f8ff57bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 23:54:49.5933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1183
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240188
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

T24gNi8yMS8xOSAzOjM0IFBNLCBKYWUgSHl1biBZb28gd3JvdGU6DQo+IE9uIDYvMjEvMjAxOSAz
OjI5IFBNLCBUYW8gUmVuIHdyb3RlOg0KPj4gT24gNi8yMC8xOSAxMjo0OSBQTSwgSmFlIEh5dW4g
WW9vIHdyb3RlOg0KPj4+IEJ5dGUgbW9kZSBjdXJyZW50bHkgdGhpcyBkcml2ZXIgdXNlcyBtYWtl
cyBsb3RzIG9mIGludGVycnVwdCBjYWxsDQo+Pj4gd2hpY2ggaXNuJ3QgZ29vZCBmb3IgcGVyZm9y
bWFuY2UgYW5kIGl0IG1ha2VzIHRoZSBkcml2ZXIgdmVyeQ0KPj4+IHRpbWluZyBzZW5zaXRpdmUu
IFRvIGltcHJvdmUgcGVyZm9ybWFuY2Ugb2YgdGhlIGRyaXZlciwgdGhpcyBjb21taXQNCj4+PiBh
ZGRzIGJ1ZmZlciBtb2RlIHRyYW5zZmVyIHN1cHBvcnQgd2hpY2ggdXNlcyBJMkMgU1JBTSBidWZm
ZXINCj4+PiBpbnN0ZWFkIG9mIHVzaW5nIGEgc2luZ2xlIGJ5dGUgYnVmZmVyLg0KPj4+DQo+Pj4g
U2lnbmVkLW9mZi1ieTogSmFlIEh5dW4gWW9vIDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29t
Pg0KPj4NCj4+IExldCBtZSBhcHBseSB0aGUgcGF0Y2ggdG8gbXkgYXN0MjUwMCBCTUMgcGxhdGZv
cm0gYW5kIHdpbGwgc2hhcmUgcmVzdWx0cyBlYXJsaWVyIG5leHQgd2Vlay4NCj4gDQo+IFRoYW5r
cyBUYW8hIEl0IHdvdWxkIGJlIGhlbHBmdWwuDQoNCkhpIEphZSwNCg0KSSBhcHBsaWVkIHBhdGNo
ZXMgMS01IChleGNlcHQgRE1BIG1vZGUpIHRvIG15IGxvY2FsIHRyZWU6IGJ1ZmZlciBtb2RlIGlz
IGVuYWJsZWQgYnkgZGVmYXVsdCwgYW5kIHJlZ19iYXNlL2J1Zl9iYXNlIGFsc28gbG9va3MgY29y
cmVjdCB0byBtZSwgYnV0IEknbSBzZWVpbmcgc29tZSBwY2E5NTQ4L2xtNzUgZHJpdmVyIGJpbmRp
bmcgZmFpbHVyZXMgb24gQ01NIEJNQy4gSSdtIHdvbmRlcmluZyBpZiBJIG1pc3NlZCBzb21lIGRl
cGVuZGVuY3kgcGF0Y2hlcyBhcyBJJ20gc3RpbGwgd29ya2luZyBvbiBrZXJuZWwgNS4wIChhbHRo
b3VnaCBpMmMtYXNwZWVkLmMgaXMgdXAgdG8gZGF0ZSk/DQoNCkJUVywgVVNCIGlzIGVuYWJsZWQg
aW4gbXkgaW1hZ2UgYmVjYXVzZSBib3RoIEVIQ0kgYW5kIFVIQ0kgYXJlIG5lZWRlZC4gQnV0IEkg
Z3Vlc3MgaXQgd29uJ3QgaW1wYWN0IGJ1ZmZlciBtb2RlPw0KDQpMZXQgbWUgc2VlIGlmIEkgY2Fu
IHF1aWNrbHkgc2V0IHVwIGtlcm5lbCA1LjEgYW5kIHJlLXJ1biB0ZXN0aW5nOyBtZWFud2hpbGUs
IGtpbmRseSBsZXQgbWUga25vdyB3aGF0IGluZm9ybWF0aW9uIHdpbGwgYmUgaGVscGZ1bCBmb3Ig
eW91ciBkZWJ1Z2dpbmcuDQoNCg0KQ2hlZXJzLA0KDQpUYW8NCg==
