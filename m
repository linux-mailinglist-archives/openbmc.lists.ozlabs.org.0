Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BABB8103
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 20:45:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z5Q15jcxzF54G
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 04:45:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4165c99030=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="PHBFdGCe"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="j/r19ER5"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z5P06qNGzF49k
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 04:44:29 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8JIiI2T006548; Thu, 19 Sep 2019 11:44:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=3vqnBcGBXEqImEu/yve8iFsptASW6exFpy1JYXYp0ys=;
 b=PHBFdGCe5icYQh5Tb124ramD+oC9hWWVoFC7esfhzc02RjLxvTlzXKAYu+2ngLIzm40w
 zFLK1ZW4Xobxbjt5bID+rAm2UCXOBaDQOFgOlJ67uLuTcs/0B4RVhYg5f54MhTwLm8bA
 OoQWmiWdNwVURIRut/DEldYZrMdq3p1u0BQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v3vdq4j1r-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 Sep 2019 11:44:20 -0700
Received: from ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) by
 ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Sep 2019 11:44:18 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Sep 2019 11:44:17 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 19 Sep 2019 11:44:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cI9IGieWJHuH0axerboTlNTYsrViP/BZZcSVCOqXm0T9LWyiQ7sTidKAmXSp2DsiwdgzZmnIZNJ8c2Os52fPk9r6Uno8aoMv6jDygRuugEIHdSl248wIItoOgLypIYiYf6PieKJRiOVB7c1JMH/7jQWSEpbwqMfvsr2U9WevUQ/GbigwHZbApDerY5U12CzlMemsgPsmBKTPZECPN4bXBkorHOc1wNESBCbtFRBtH+ydKK1G/Kuuh9Ek/6lEbJ36oJajicoO24XKLJWr8UIi+ZGeS0Jp3cmOYTrqee6AInvoUOHcybL1tGkwFBA/YNYh8sxvRxWnoY0MENXC0atjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vqnBcGBXEqImEu/yve8iFsptASW6exFpy1JYXYp0ys=;
 b=bgfZ7uZkKNcQtQjGq0PZFT5nqQn983Fl4nyDBfTwhxHMvz7RVsjnPUCM6hZZkuuAdXiuY1CVGOyFevlGV8or681i+BvDgkZTJxX/Amgiz2dd2UeTNiR+2a2n2pqNQDHEue/9XmGM2F47YCoPwUrRbDHWoa6h6lLQ0s3oOM6O7v26pBshspAwGoyGn8Cq2kUMoBwP1jtVukXFRiqZb96R0rR8D1YJc3VbWPSdKcduuc0Zl0Z11r4GaMrL/Cm9Ju9L1De6qEDCHJoD9e8nLCNSAQejdvhcGQlv3htC8Ytd5l7JkpA0sjORNSmn9bkZ/+hYlSuiB4sQn8KL70jL64R+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vqnBcGBXEqImEu/yve8iFsptASW6exFpy1JYXYp0ys=;
 b=j/r19ER57ReAvnoz7zfTSH72ddNWfRXPr9+8cBBEQT5gDax9QCPzNARL+ELHu/4QroD9Gfv3fx2ndw+sofnHsQ9TTYoNSw+6rtjYmcHRWn8oS47/GDXZuH4qy6i4ts3QmyURyssZMrKtqp1d4+sonDCtURNMoqyKNFOPibZL7uM=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1232.namprd15.prod.outlook.com (10.175.4.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Thu, 19 Sep 2019 18:44:17 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 18:44:16 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: Lei YU <mine260309@gmail.com>
Subject: Re: Some Recipes Randomly Fail
Thread-Topic: Some Recipes Randomly Fail
Thread-Index: AQHVbmrOZEN1YldwhE6gGpzaQDskqqcx/3sAgAAHcwCAAE7TgIABAeMA
Date: Thu, 19 Sep 2019 18:44:16 +0000
Message-ID: <061BC777-BAA8-4C97-8552-9A9DD428B7ED@fb.com>
References: <857927E9-F872-4F90-A938-1B0635FB230D@fb.com>
 <D675A182-7304-4991-A5A5-261FEDAB62CA@fuzziesquirrel.com>
 <3EACE35D-7F22-4B2D-952C-7B9390C9BA3C@fb.com>
 <CAARXrtke98Da=kWKxJqpvNVf-ACe9jA64zJeeFRX+0duCURsCg@mail.gmail.com>
In-Reply-To: <CAARXrtke98Da=kWKxJqpvNVf-ACe9jA64zJeeFRX+0duCURsCg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::a006]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1a4d774-0d6d-4abf-a3eb-08d73d316004
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1232; 
x-ms-traffictypediagnostic: MWHPR15MB1232:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR15MB12327F6621206DD9C1F6662CBD890@MWHPR15MB1232.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(346002)(39860400002)(366004)(199004)(189003)(6436002)(46003)(4744005)(305945005)(14454004)(446003)(81166006)(8676002)(81156014)(7736002)(476003)(2616005)(8936002)(6116002)(229853002)(478600001)(5660300002)(1411001)(6486002)(25786009)(486006)(33656002)(4326008)(86362001)(966005)(11346002)(6916009)(6246003)(71190400001)(71200400001)(66476007)(66556008)(91956017)(76116006)(54906003)(64756008)(66446008)(66946007)(256004)(53546011)(6506007)(102836004)(2906002)(76176011)(36756003)(186003)(6306002)(3480700005)(6512007)(316002)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1232;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pbr+3HBTLL66Q216e+UiwF6RwzmjrNc5MtfhGsvS/F48w31pq5TlY84ryirFB39gsxHZ85RNAHPGBm91im5PdciNUaqaopHNS1iwt6kps19EFxi9ikzU/ZTKs2nmy0oy4wKjX9MgguZ5Mra2xeUzaB7OFENQALBVCCAEgB/tnewLPvQYw9d6XFzJGV/Buvw33WEz7tqfabX7BAY8gAkaekS6wOP7SWuCYEwPyXjKwGrvXUuLcQixkJa4ud2YlEoo86HeZaFoSpSeVlXquDCsph9BMiZhCeumPXV1mtNOt+ZAF+DGwiPCIwsU/RUeviX0x82cGxwWb5WQF4jLStOTPd7Se/kRgz4UYC9Uzgt0R5p4xOsxKU8TX5nMEh0W0OdyMuGgPgPN9fXGnzz+0jiPLP5UXPPwOwmdrBcAEVkrGD8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0FBD8EBE200974994B353B710120F15@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a4d774-0d6d-4abf-a3eb-08d73d316004
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 18:44:16.8453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W0J1qMz18dweVRAHtIBQAyj0eJLntk4UbJuZDy+sycdZmlH+5ozn0jAeN/SmkT1AokvaGT9nnLZW10myvHtrHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1232
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-19_05:2019-09-19,2019-09-19 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=909 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909190155
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

TGVpLA0KDQpUaGFua3MuIEnigJlsbCB0cnkgYnVtcGluZyB0aGUgUkFNIGF2YWlsYWJsZS4gU3Ry
YW5nZSB0aGF0IGl0IG5ldmVyIGFjdHVhbGx5IHJlYWNoZXMgdGhlIDEyTUIgSSBhbGxvY2F0ZWQg
Zm9yIHRoZSBWTSwgYW5kIHN3YXAgbmV2ZXIgZ29lcyBhYm92ZSA1MTJNQiwgYnV0IHRoYXQgYW5z
d2VyIGZpdHMgdGhlIHBhdHRlcm4gb2YgYmVoYXZpb3IuIEkgdGhpbmsgSSBjYW4gZ28gdG8gMTVN
QiB3aXRob3V0IHRoZSBob3N0IE9TIChtYWNPUykgZnJlYWtpbmcgb3V0LiBUaGlzIGxhcHRvcCB1
bmZvcnR1bmF0ZWx5IG9ubHkgaGFzIDE2TUIgUkFNLg0KDQpXbGlmcmVkDQoNCj4gT24gU2VwIDE4
LCAyMDE5LCBhdCA4OjIxIFBNLCBMZWkgWVUgPG1pbmUyNjAzMDlAZ21haWwuY29tPiB3cm90ZToN
Cj4gDQo+IE9uIFRodSwgU2VwIDE5LCAyMDE5IGF0IDY6NDAgQU0gV2lsZnJlZCBTbWl0aCA8d2ls
ZnJlZHNtaXRoQGZiLmNvbT4gd3JvdGU6DQo+PiANCj4+IEJyYWQsDQo+PiANCj4+IEhlcmXigJlz
IGEgR2lzdCBvZiBteSBjb25zb2xlIGZyb20gYSBiaXQgZWFybGllciB0b2RheS4gSW5maW5pdGUg
c2Nyb2xsIGJ1ZmZlciBpcyB2ZXJ5IGNvbnZlbmllbnQgc29tZXRpbWVzIQ0KPj4gDQo+PiBodHRw
czovL2dpc3QuZ2l0aHViLmNvbS93aWxmcmVkc21pdGhhdGZiLzZkY2NjOTAwMjBkZDUwZTEzOTAz
NmZlODViZDkxOTY5DQo+PiANCj4+IE9uIHRoaXMgcGFydGljdWxhciBvY2Nhc2lvbiwgdGhlIENM
STExIHJlY2lwZSBmYWlsZWQsIHdoaWNoIEkgZG9u4oCZdCByZW1lbWJlciBoYXBwZW5pbmcgYmVm
b3JlLg0KPiANCj4gRnJvbSB0aGUgZXJyb3IgYGZhdGFsIGVycm9yOiBLaWxsZWQgc2lnbmFsIHRl
cm1pbmF0ZWQgcHJvZ3JhbSBjYzFwbHVzYCwgbW9zdA0KPiBsaWtlbHkgdGhlIG1lbW9yeSBpcyBy
dW5uaW5nIG91dC4NCg0K
