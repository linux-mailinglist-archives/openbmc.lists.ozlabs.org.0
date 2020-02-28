Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9871731A6
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 08:18:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TLV818CrzDrJY
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 18:18:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=9327be7d46=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=hQeg8yOK; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=GUBERgJD; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TLTP59r9zDrCG
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 18:17:27 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01S78w6c020219; Thu, 27 Feb 2020 23:17:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=HiZPbCOkfzKHnI7GmYKD+bUhnEvSKVS15wsze2Fg/cE=;
 b=hQeg8yOK0fHa/vw2WBPJjdHMvbfENK2b5Q3RZQnecOHYpZsqI9b3EVnOVfM64NJkF6yt
 gUXD+HhCYqwkj4V8FHImnZJjiHZ3pA1d0KZwljQiNENBaXvyXc4nGAGpterTw/zmZ0/n
 y/jLXF99q70qtKSRXOyCsIjFZnF9s2ilrUw= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 2yeputsr8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 27 Feb 2020 23:17:22 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 27 Feb 2020 23:17:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXuy0EZkF3RcErK+rDqg14I6g9rTQ6pjhOgUzbKZSDeBaoFcD0oQTjAcLHvra9TUOvglOzr85P3BDAqqbzU9aEylJGM3oMLCgOEuobJm4F2TlM86592HrRWlDWP7UMSY5R8YsT/qrfW7wwGCVBONW3J81+ueqrZoBE+HVhZYVyD/purOZGmQGdwjwb3/9mycHMAHm4LvRa3K+QoJ6hxF59qTCVQh18zIPy3jnADNRfTPBXXqLcwgkutJBYuSOj7lRn2XlcoFG6+WLoIG7wo6/UJq38zo093FL3cfK0NaT2XfZRmsX5AIy1LpqTrSgDEYnGgUOQhXuO1k72wnsG4Sng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiZPbCOkfzKHnI7GmYKD+bUhnEvSKVS15wsze2Fg/cE=;
 b=j2ImPl76gq9NqqpshKjlbAH9hArQSv3U9R5Qw6XguWi6GrXu8jqSI72QBgzZnHTlGfjyGNVA1PhmEYnpy1++vmOlwU0HmubuqCb5L70tpWPM5MHvFgzGNGjFk0SL93Febr5UjzOw/UnX7XCAehPqKcn1DFx8b82jH65q3U4SIAqrCeGGvRTC0UPoDv2DBdOkfRQBdCTUg4luC9Uzx248MgZxTd8WEB8UylVA+abygOMi9BPyFgq0D4GdKkvBV1E81lIli7EOQEiE2QjiJcYqIlc2RH6Qylm9Ksb5rSt6kyvMT5E713NwP1FTbuyvHqN9pqUKTtPPLzR9umCiT2HxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiZPbCOkfzKHnI7GmYKD+bUhnEvSKVS15wsze2Fg/cE=;
 b=GUBERgJD8zbGG/HeHWvUVC+WwfGJHbSc4R5CKdTndAJBAlrqfEqp2vzPYhBVsXqrczwWOtmxmgSRvvBCpCx1wjZSRe/k9uPJgF58DlSZcBNoPz7qSAKTxeCaMw7Lr+/uHJXYjaCjca45omoASB53YonBfWqjQRnWiV6MvpezqMo=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB4073.namprd15.prod.outlook.com (2603:10b6:303:4f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Fri, 28 Feb
 2020 07:17:16 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2772.018; Fri, 28 Feb 2020
 07:17:16 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: obmc console for multiple host
Thread-Topic: obmc console for multiple host
Thread-Index: AQHV7faP5RFIDWYuz0yVWkpwSrbrE6gwE56A//+YjYA=
Date: Fri, 28 Feb 2020 07:17:16 +0000
Message-ID: <ADC7A8E6-4398-427E-A538-D21456863D48@fb.com>
References: <37851ADF-67EC-4761-A4C5-33F28373A609@fb.com>
 <64e1858f-7713-4ca4-880f-db639ab78d30@www.fastmail.com>
In-Reply-To: <64e1858f-7713-4ca4-880f-db639ab78d30@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:773f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8a3e77a-5512-48e4-77fe-08d7bc1e3d85
x-ms-traffictypediagnostic: MW3PR15MB4073:
x-microsoft-antispam-prvs: <MW3PR15MB40730DE310904B62D0EAA143DDE80@MW3PR15MB4073.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(346002)(376002)(366004)(39860400002)(199004)(189003)(6512007)(33656002)(316002)(81156014)(5660300002)(966005)(8676002)(6506007)(81166006)(478600001)(6916009)(6486002)(4326008)(71200400001)(86362001)(2906002)(36756003)(66446008)(66556008)(66476007)(66946007)(64756008)(2616005)(8936002)(186003)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW3PR15MB4073;
 H:MW3PR15MB3947.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sXGqCl6C6LDWE/1IWasotoxr0Gs/z2kCO31l2NL7HZx1gnM+HawtNA874L6SiKUVg4eNwcgkCgIHe7l7fwoSEfoDfLR3efm+n9bFXvdrQtrPVXcfcsq+DrCm8LorLfnJFX+kDY20LJFJadG72a0DULyO0Mxg/0pPWJeP9Ftkhsp4rWLUC4nCWf+Y1Gm9y6rAT4DxyFZnsJ5vPYIly7b7Y2uBJhWKvEWNaDZitTe1HRriEj7X/I4cKM0rPeO+QRZgXzmwHnDrEwDrPqabfSgqZBccguXsMTYQikf2ax3FVr4VOzfFRBhYdXs05urNnGJn0eloyKt3lXrcCMKLJl1bHb285K7rRUKU+LZTejwQQhW1J6lJfKbIOMDVtLs58RVabb5ehnpFvanphzv/RD4B8tOIhUVa68tX+xuBuyQL/QHhTb54DgkYdvHWMaEM7LA8QuN97E3yAJbz6YIlWEaKQDXpO1CSKRiZvqiq5Gwc+zj8c9g9W3kCHVNztBe70X0XamdmMHgekj3q0M47OfyPFw==
x-ms-exchange-antispam-messagedata: bVj1qnid8fxLElZaoS5HVsR1xg//OPfk17fBdP2H052SOWmEGpZyGGhIMKMzqQwdIZdrp2SZEd+E1DzRhq3QR3PLvhXO6lesqCYzHrtqlar+7aKFVhnna6HhhZCBOp92TLKAFwcFzNTAtg7jaY1AWlHm1Gqc2o7D/XfYZOHIPJU26vGYSmOaGG3jk04P+n/T
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <55C9AC5E190C22419A675DA46636AC37@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a3e77a-5512-48e4-77fe-08d7bc1e3d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 07:17:16.1779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pV37kepTR0Zkt+E0WyiyciUdlNgE5Rr/lIIQaGHAElFB96lv1irK/G1vJ+IkEiAzpp1Vsh8RL8D8qKgjls9stQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB4073
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_01:2020-02-26,
 2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 mlxlogscore=818 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280061
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmV3LA0KVGhhbmtzIGZvciB0aGlzLCBJIG1pc3NlZCB0aGlzIGVtYWlsIHNvbWVob3cu
IEkgd2lsbCBsb29rIGludG8gdGhpcyBhbmQgZ2V0IGJhY2sgdG8geW91IGlmIGFueXRoaW5nIGVs
c2UgcmVxdWlyZWQuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrvu79PbiAyLzI3LzIwLCA5OjI3IFBN
LCAiQW5kcmV3IEplZmZlcnkiIDxhbmRyZXdAYWouaWQuYXU+IHdyb3RlOg0KDQogICAgSGkgVmlq
YXksDQogICAgDQogICAgT24gRnJpLCAyOCBGZWIgMjAyMCwgYXQgMTU6NDgsIFZpamF5IEtoZW1r
YSB3cm90ZToNCiAgICA+ICANCiAgICA+IEhpIEFuZHJldywNCiAgICA+IA0KICAgID4gSSBzYXcg
bmV3IG11bHRpIGhvc3Qgc3VwcG9ydCBpbiBvYm1jIGNvbnNvbGUuIFRoYW5rcyBmb3IgZXh0ZW5k
aW5nIA0KICAgID4gb2JtYy1jb25zb2xlIGZvciBtdWx0aSBob3N0IGNvbm5lY3Rpb24uDQogICAg
DQogICAgTm8gcHJvYmxlbXMhDQogICAgDQogICAgPiANCiAgICA+IA0KICAgID4gQ2FuIHlvdSBw
bGVhc2Ugc2VuZCBtZSBuZXcgY2hhbmdlcyByZXF1aXJlZCBpbiBjb25maWd1cmF0aW9uIGZpbGUg
YXMgd2UgDQogICAgPiBhcmUgZGVmaW5pbmcgbG9jYWwtdHR5IGFuZCBiYXVkIGZvciBob3N0IGlu
IG91dCBjb25maWd1cmF0aW9uIGZpbGUgZm9yIA0KICAgID4gc2luZ2xlIGhvc3QuIFdoYXQgd291
bGQgYmUgYSBzYW1wbGUgY29uZmlnIGZpbGUgZm9yIG11bHRpcGxlIGhvc3QgDQogICAgPiBzdXBw
b3J0IGFuZCBhbHNvIHdoYXQgYXJlIGNvbW1hbmQgbGluZSBvcHRpb24gd291bGQgYmUgZm9yIGNs
aWVudCB0byANCiAgICA+IGNvbm5lY3QgdG8gcGFydGljdWxhciB0dHkuDQogICAgDQogICAgRGlk
IHlvdSBzZWUgbXkgcmVzcG9uc2UgaGVyZT8gSSB0aGluayBpdCBjb3ZlcnMgdGhlIGFuc3dlcnMg
dG8geW91cg0KICAgIHF1ZXN0aW9uczoNCiAgICANCiAgICBodHRwczovL3VybGRlZmVuc2UucHJv
b2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2xpc3RzLm96bGFicy5vcmdfcGlwZXJtYWls
X29wZW5ibWNfMjAyMC0yREZlYnJ1YXJ5XzAyMDczNi5odG1sJmQ9RHdJQkFnJmM9NVZEMFJUdE5s
VGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNs
NWcmbT1rcDhkUTNmTlNjcUJwUFI2QlFnRTJOaWlxN3NSQnFvT1BGMVN6cTgySmdFJnM9NTVSa1hm
ektYM0ZHYVpWVU0yYVhnUlRIYkRZbXlXQnlHamN6dWpublo1byZlPSANCiAgICANCiAgICBJZiBp
dCBkb2Vzbid0IGNhbiB5b3UgcGxlYXNlIHJlc3BvbmQgaW4gdGhhdCB0aHJlYWQgYWJvdXQgd2hh
dCBpcyB1bmNsZWFyPw0KICAgIA0KICAgIEkgZGlkIGxlYXZlIG91dCBleGFjdCBkZXRhaWxzIG9u
IGhvdyB5b3UgbWlnaHQgaW50ZWdyYXRlIGNvbmN1cnJlbnQgc2VydmVyDQogICAgc3VwcG9ydCBp
bnRvIHlvdXIgYml0YmFrZSByZWNpcGVzLiBJIGNhbiBwcm92aWRlIHN1Z2dlc3Rpb25zIG9uIGhv
dyB0byBkbw0KICAgIHNvIGlmIGl0IGhlbHBzLg0KICAgIA0KICAgIENoZWVycywNCiAgICANCiAg
ICBBbmRyZXcNCiAgICANCg0K
