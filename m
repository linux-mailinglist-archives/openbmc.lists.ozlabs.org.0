Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E112765F0
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 03:40:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxd5y74jCzDqRg
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 11:40:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=6536d4a058=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=iXvNGkf1; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=U8To5MjR; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxd4s5kXWzDqRF;
 Thu, 24 Sep 2020 11:39:22 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O1Z2IX010741; Wed, 23 Sep 2020 18:39:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=tSXBfy6AuoL62o7G50pkUFlcg7Kt20nr2ITW7evxtMI=;
 b=iXvNGkf1nXU+eTZeysxNTDmEz6WYjahytPBki9N9luQv8ltTpUNJEVl/3nCbl6DZG3Nq
 90iYcDn90msg6Yf7KcuBMVw4UDz7TnMv9P8KB5/D6Kje9rJHssfhC5k/Vb8cbWWKifoj
 t46tsOXYapmMqe2+BlBBs+wN3UThuyL8naY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33qsp4f3s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Sep 2020 18:39:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 23 Sep 2020 18:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwXBUAoHggpNJQzvRvNDGO/XY6um8a1mEYHO8YOIdha/M+v24Gt8FJ7+hXSWJJhZGReoTWsCkzEhn3CqVNhO+gIn49YNPZIFvCFSm65tqpLZ5wSSKvBfFyZQUhKlslasr2hSUnscWl0z1u8cR/kvhWh2khiB5MSx2CpCBY7+SozzKpkm2o89K9n6coYdxXzCdOqktOgSevuSlxcoiJrqGvw27pateCwbkB9wslfwM/ydv4qoO3BwEazdaGEH4s2D/rdYiHEZiURz7r5QH2zFkd9Py5ReI0kh7MzSz2bnKY46x3Zu6BwIvKYa9OVBQ1CvULZLQvGBHznd9V72MI0foQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSXBfy6AuoL62o7G50pkUFlcg7Kt20nr2ITW7evxtMI=;
 b=DXry2XC06PcCQ5FWMs5cgchWFXDS5KWvDycxF5lU41Psv0KGxtu8PxJAxFjrzabZZu9ixt8nMDnsYyRQK3Rzf9/PlkZxfc+EmHZ66FDlyQHIzrNiwZlAovG4hQF7qX6wIHpGJ8Sw2/SflARA6oXWhaAGTTSiyjxVQnQIKGKZeGP93ryCrhwMS4BIuxqv5wyiK1fVfYcGSAzUBG+ixUHCQD5W6p+TgKWe2bvuDl4kGR5z18IR79En5TgM7+gEV9BwReyeJeiIle8E7lt5CwGuwcom7Ynm3yIhIcOCvJbWWNZdkWXomZPsoEGS1xnZ+TptuxiEHcMvRCHe/deoS/3iMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSXBfy6AuoL62o7G50pkUFlcg7Kt20nr2ITW7evxtMI=;
 b=U8To5MjR491DcTByc1/Efh1X79McNEpIVPnA8SBYRhvVRKexmEUHepzv8CMweUzjXCbNs7l5FLJxKqnKsOxxKhrMyE/K4tcRchB1/7zXuMc6dSqpOUlRMJnlBe+an2W7grXPqc/mAuqIHVZAo8DMjOFq5Oo577IGJ/1JhwJFF80=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB4086.namprd15.prod.outlook.com (2603:10b6:a02:ca::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 24 Sep
 2020 01:39:12 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 01:39:12 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Adriana Kobylak <anoo@linux.ibm.com>, Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Read Firmware Versions
Thread-Topic: Read Firmware Versions
Thread-Index: AdaQIMU5ljsiRzlYTUW3d3oi6MD/gwACmf2AAC39YUAANv8YAAAJ2/UA///kioA=
Date: Thu, 24 Sep 2020 01:39:11 +0000
Message-ID: <5FEF272B-706E-4C48-978D-1C3CEB137CFD@fb.com>
References: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200921152337.GJ6152@heinlein>
 <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200923153510.GP6152@heinlein>
 <974e9c2abdf54c96038585730403d5b9@linux.vnet.ibm.com>
In-Reply-To: <974e9c2abdf54c96038585730403d5b9@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:ab1c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6843c8f5-6339-436b-9be8-08d8602aa379
x-ms-traffictypediagnostic: BYAPR15MB4086:
x-microsoft-antispam-prvs: <BYAPR15MB4086FF0938EA82541A65625FDD390@BYAPR15MB4086.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4gKTE+ocgEcHtlT1Mk4tQTMD1k1i3lYNSQHVg02qIqV99If/kgI8xEMziXsC/hAhueMqllJqcwGT0vK6lvtu/W/Xsxc1ug3s8GIUnys9rL7yjmgrXFzMa9pHAmF15aqJ6lN5TymjPjvSVCaAnejvW2A9Sp49NyiOY0jAuf0nVsuWA1iSlRxvP8DBd6qzSMRGKVqrAH5ok8lja/ejOi990AAHijDYNHLMVaRNj24MTbJYiIqXSIHyWKHRBS1/HtDZCnBrITgsgOlteaHj9URWj1UK3sjvdQCq7sGH7O7X29Q1oIcxm/xjv2POmlc4S0aYo43tiOVD/0nXDDQFbMoYIjs35T27QuRrIWpnMgk39nh9exLVp57PMDif/dcvHDv+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(8676002)(33656002)(6486002)(5660300002)(54906003)(36756003)(83380400001)(2616005)(3480700007)(110136005)(6512007)(478600001)(316002)(71200400001)(186003)(4326008)(8936002)(66946007)(6506007)(64756008)(86362001)(2906002)(66556008)(53546011)(7116003)(76116006)(91956017)(66476007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 2kvrnfFJ+RqX55hin2pbimsQzadEoLdUoi1EJt0idfpryW+fkvZDEjDZ2lBov/KpmZZrBDbVXaTWRGq+fiRY1tGDJtjBrkn8gPwY9UWiidHiKs+BJotRXsWHkiHUzzu8NU3h7azYPaohf0KNGkeD7k0hO40rP4H3lSNtjBAYeIg1Tl59T1XMdkLq82VlSWpy/jASgxTlEhuokVB+rWpgdlVZgt8GqzBIPXveZThVVCetZ+0ddRh9khv3pbmjytLnFU8rTU9jvY62bl473tNNUq1gaCjzZT5Xk2h9dNUAzuudJPhXACTXaqhHsm6e2FMmng2I0TcT2ofz22qVTJ175769ft5hetTasyv6Vid7DQljZ67L3Y77SGVhicuPYrWXefg5vnx5zIi5oH55FfcseSB8l2rfQFaPNPBI4iBYV02WvXlZEQPwWs9MtdhvQPFaqcyYwD4+WxFmxizDS9O59hrAWCiZ/O8ZHnwCHutwd2QxHIXw3b7z0gEmL4ejMLzEHHwvlJhcuQT+spSXkrKxX4rHKU+OGTVNkn5k648Lv0W3urmTu5AjJd7942VmT4vWCHdSDh1GFx5ipAKqvGrrM0+7B+fbhHChPXIOSUUQy+TKTI/J4Tk0kDszZ6C/+l1Q0A116B8xKgrrkUzo+QDRXJQIgix7wOleZp6n4f2mFTdRd7AnXDBeV3VUMGqWFy/N
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <55EB96F21B3B204CB98571D3A11E090A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6843c8f5-6339-436b-9be8-08d8602aa379
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 01:39:11.9284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gHhEfh0yHXMyvm4z9gQwJcjH7nsKyNRi4JcVc0w6q4x4EGhKpbwadKZPS3mNrYwgAwCqylUDAZcAa0m/CkeZwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB4086
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_19:2020-09-23,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240010
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
Cc: Jayashree D <jayashree-d@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMjMvMjAsIDE6MTkgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBBZHJpYW5h
IEtvYnlsYWsiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIGFub29AbGludXguaWJtLmNvbT4gd3JvdGU6DQoNCiAgICBPbiAy
MDIwLTA5LTIzIDEwOjM1LCBQYXRyaWNrIFdpbGxpYW1zIHdyb3RlOg0KICAgID4gT24gVHVlLCBT
ZXAgMjIsIDIwMjAgYXQgMDE6MzQ6NTBQTSArMDAwMCwgSmF5YXNocmVlIEQgd3JvdGU6DQogICAg
Pj4gQ2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5hbA0KICAgID4+IA0KICAgID4+IFRoYW5rcyBQ
YXRyaWNrIGZvciB5b3VyIHJlc3BvbnNlLg0KICAgID4+IA0KICAgID4+IEluIHBob3NwaG9yLWJt
Yy1jb2RlLW1nbXQsIEkgYW0gc2VlaW5nIHRoZSBzb2Z0d2FyZSBpbWFnZSBpcyB1cGdyYWRlZCAN
CiAgICA+PiBhbmQgYmFzZWQgb24gdGhlIGltYWdlIHVwZGF0ZSwgdmVyc2lvbiBpcyB1cGRhdGVk
Lg0KICAgID4+IEJ1dCBpbiBteSBwbGF0Zm9ybSwgSSBoYXZlIHRvIHJlYWQgZmlybXdhcmUgdmVy
c2lvbnMgdXNpbmcgb2VtIA0KICAgID4+IGNvbW1hbmRzIGFuZCB0aGF0IHZlcnNpb24gc2hvdWxk
IGJlIGRpc3BsYXllZCB1bmRlciBkYnVzIG9iamVjdHMuDQogICAgPj4gV2hldGhlciBwaG9zcGhv
ci1ibWMtY29kZS1tZ210IHJlcG8gd2lsbCBiZSBzdWl0YWJsZSB0byBkaXNwbGF5IHRoZSANCiAg
ICA+PiBmaXJtd2FyZSB2ZXJzaW9uIHVzaW5nIGRidXMgb2JqZWN0cz8NCiAgICA+IA0KICAgID4g
VmlqYXkgcmVjZW50bHkgYWRkZWQgYSBzaW1wbGUgQklPUyBmbGFzaCBtYW5hZ2VtZW50IHRvDQog
ICAgPiBwaG9zcGhvci1ibWMtY29kZS1tZ210LCBidXQgdGhlcmUgaXMgYWxzbyBhIG9wZW5wb3dl
ci1wbm9yLWNvZGUtbWdtdCANCiAgICA+IGZvcg0KICAgID4gdGhlIGVxdWl2YWxlbnQgb2YgQklP
UyBtYW5hZ2VtZW50IG9uIG9wZW5wb3dlciBzeXN0ZW1zLiAgU2luY2UgeW91ciANCiAgICA+IGNv
ZGUNCiAgICA+IHVwZGF0ZSBzY2hlbWUgaXMgbGlrZWx5IHRvIGJlIHNwZWNpZmljIHRvIHlvdXIg
SVBNQiBjb21tYW5kcywgSSBkb24ndA0KICAgID4ga25vdyBpZiB0aGF0IHdvdWxkIGJlIGJlc3Qg
aW4gYSBzZXBhcmF0ZSByZXBvc2l0b3J5IG9yIGFuIGV4dGVuc2lvbiANCiAgICA+IG9udG8NCiAg
ICA+IHBob3NwaG9yLWJtYy1jb2RlLW1nbXQuDQogICAgPiANCiAgICA+IEFkcmlhbmEsIGFueSBv
cGluaW9ucz8NCg0KICAgIEl0IGNvdWxkIGZpdCBpbiBwaG9zcGhvci1ibWMtY29kZS1tZ210LCBz
b21lIHRob3VnaHRzOg0KDQogICAgVGhlIGQtYnVzIG9iamVjdHMgZ2V0IGNyZWF0ZWQgYXQgMiBk
aWZmZXJlbnQgdGltZXM6DQoNCiAgICAxLiBPbmUgc2NlbmFyaW8gaXMgd2hlbiBhbiBpbWFnZSBp
cyB1cGxvYWRlZCB0byBiZSB1cGRhdGVkLCB0aGlzIGlzIHRoZSANCiAgICBzdXBwb3J0IHRoYXQg
VmlqYXkgYWRkZWQgd2hpY2ggYWxsb3dzIGEgY3VzdG9tIHNjcmlwdCB0byBiZSBydW4gdG8gDQog
ICAgdXBkYXRlIHRoZSBCSU9TIGltYWdlLiBJZiB5b3UncmUgaW50ZXJlc3RlZCBpbiB0aGlzIG1l
dGhvZCBmb3IgdXBkYXRpbmcgDQogICAgeW91ciBCSU9TLCB5b3UgY291bGQgcG90ZW50aWFsbHkg
YWRkIHlvdXIgSVBNQiBjb21tYW5kcyBpbiB0aGF0IHNlcnZpY2UgDQogICAgYW5kIHVzZSB0aGUg
QWN0aXZhdGlvbiBpbnRlcmZhY2VzIHRvIGRyaXZlIHRoZSB1cGRhdGUuDQoNCiAgICAyLiBUaGUg
c2Vjb25kIHNjZW5hcmlvIGlzIHdoZW4gdGhlIEJNQyByZWJvb3RzIGFuZCBpdCByZWNyZWF0ZXMg
dGhlIA0KICAgIGQtYnVzIG9iamVjdHMuIEZvciB0aGlzIHNjZW5hcmlvLCB0aGVyZSdzIG5vIGN1
cnJlbnRseSBzdXBwb3J0IGZvciBCSU9TLCANCiAgICBzbyBmb3IgZXhhbXBsZSB0aGUgc3VwcG9y
dCB0aGF0IFZpamF5IGFkZGVkIGRvZXMgbm90IGNyZWF0ZSBhIGQtYnVzIA0KICAgIGludGVyZmFj
ZSBpZiB0aGUgQk1DIHJlYm9vdHMsIHdoaWNoIGlzIG9rIGlmIHlvdSBvbmx5IHdhbnQgdG8gdXNl
IHRoZSANCiAgICBBY3RpdmF0aW9uIGludGVyZmFjZSB0byB0cmlnZ2VyIHRoZSB1cGRhdGUuIEJ1
dCBzb3VuZHMgbGlrZSB5b3Ugd2FudCB0byANCiAgICBhbHdheXMgaGF2ZSB0aGUgdmVyc2lvbiBp
bmZvcm1hdGlvbiBhcyBhIGQtYnVzIG9iamVjdCwgc28gc3VwcG9ydCBmb3IgDQogICAgQklPUyBj
b3VsZCBiZSBhZGRlZC4gRm9yIGV4YW1wbGUsIHRvIGdldCB0aGUgQk1DIGxldmVscywgdGhlIGNv
ZGUgbG9va3MgDQogICAgZm9yIHZlcnNpb24gaW5mb3JtYXRpb24gaW4gdGhlIEJNQyBpbiB0aGUg
bWVkaWEgZGlyZWN0b3J5LiBJZiB5b3UgZ2V0IA0KICAgIHlvdXIgYXBwIHRvIGdldCB0aGUgdmVy
c2lvbiBpbmZvcm1hdGlvbiB2aWEgdGhlIG9lbSBjb21tYW5kcyB5b3UgDQogICAgbWVudGlvbmVk
IGFuZCBjcmVhdGUgYSBmaWxlIGluIHRoZSBibWMgaW4gdGhlIG1lZGlhIGRpcmVjdG9yeSB3ZSBj
b3VsZCANCiAgICBleHRlbmQgdGhlIGxvZ2ljIHRvIGNyZWF0ZSB0aGUgVmVyc2lvbiBkLWJ1cyBv
YmplY3RzIGZvciBlYWNoIEJJT1MgDQogICAgdmVyc2lvbiB3aGVuIHRoZSBCTUMgcmVib290cy4g
V2UnZCBqdXN0IG5lZWQgdG8gd29yayBvdXQgdGhlIGRldGFpbHMgZm9yIA0KICAgIHRoZSBmb3Jt
YXQgZm9yIHRoZSBmaWxlcyB0aGF0IHdvdWxkIGhvc3QgdGhlIHZlcnNpb24gaW5mb3JtYXRpb24s
IGFuZCANCiAgICBob3cgdG8gaWRlbnRpZnkgdGhleSdyZSBCSU9TIHZlcnNpb25zIHZzIEJNQy4N
Cg0KSSBhbHJlYWR5IGNyZWF0ZSBhIGZpbGUgYWZ0ZXIgcmVhZGluZyBiaW9zIHZlcnNpb24gdmlh
IG9lbSBjb21tYW5kcywgSXMgdGhlcmUgDQphIHBhdHRlcm4gd2hlcmUgc2hvdWxkIHdlIGtlZXAg
dGhpcyBmaWxlIGFuZCB3aGF0IGlzIHRoZSBuYW1lIG9mIGZpbGUuIEFsc28NCkkgdGhvdWdodCB0
aGVyZSBpcyBhIGRidXMgaW50ZXJmYWNlIGZvciBiaW9zIG1hbmFnZW1lbnQgYWxyZWFkeSBjcmVh
dGVkIGJ5DQpzb21lIGRhZW1vbiBuZXdseSBhZGRlZCB3aGljaCBjYW4ga2VlcCBiaW9zIHZlcnNp
b24uDQoNCg0K
