Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C89E20BB
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 18:36:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ywxn2nvBzDqHm
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 03:36:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5199b5af04=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="RnGlqclO"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="iMf600Qb"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ywwf6wWczDqQn
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 03:35:38 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9NGRnRl027345;
 Wed, 23 Oct 2019 09:35:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=D6hi1eX6KsG758taIfNi2/eDgpQq0NW2ZjO0aQ/MNv0=;
 b=RnGlqclOHtER+zfpDae4PnOlH4t/a+4EHxTeuFrs85bthoa6XYlemmKyuMVba9FgzdvP
 MZWlYfNPT/pyGpeMGNQsszHeyb4UQhyBBqpsyqRmbjf8aRcniURXuIemZ6E13azG/gVz
 SV8YTfdGn4o2MpFInaUvP6Ht3KOGHWC4sos= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2vt9ssm9e7-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 09:35:32 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 23 Oct 2019 09:35:04 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 23 Oct 2019 09:35:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwG/CYoVl/oL+usuYv42LkMdi2WH1bBrSHP0ZjdPBQATyta1l57FzxQtJRP433L7HKoBobsv2KUytEHCfiNVgvNcJNtXRjQFCwdEVq4scJBaT9Ac5rPqFhoPhjUvwSRWWVrfl6jAnVZBbbkGdXKMvYh68wPBz1ljgxEOYg8Ws7Dzetm2AYW1drh6qvJiCIJwKOgIq9T+fGDqwgsPwBZB+ia9gc/+jsFe+xQ19zxWKcgornVC0/wKSsDrn6/DYqpgSybJotHeHWIPeXsvH7+5BN8fi+lFi5vj5DeuJaE5k+jUIM5mUQBQwbRrLkfOObezPLwuWckylh2lZgNxtc5pzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6hi1eX6KsG758taIfNi2/eDgpQq0NW2ZjO0aQ/MNv0=;
 b=JHhEXaUk0Cc1KQVeREvNKtZ3xGUWdL7GIRYMgLzeULKjGpt6kuYC9LZeOsilYmIoAgXF02PyNcuOd5JYo+KmFYR37z6JaABJ/a+d3SM1VH7AshL9aJ+P78I7h9/ZBT4ouK4/hE2P1SrtMoHLDFCX+pD+R3FzXc57JdYC9qOCInyWnex7DRZRiqs7inrg9ROO0xcg8Wn0Rzu5Wcc5BMTH2INlv85EHHB0eZRtlVz0znLDubBHqKLT+YRd9PMZXMyKen/cfmNtUBdE7lNRHYP/Cd+nkKl0IfKBC+0rGA+/9lfUwqJ/Qzz9YiJ6ErDmR2TBN0h6KhhAREcfuZ5QLEOPlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6hi1eX6KsG758taIfNi2/eDgpQq0NW2ZjO0aQ/MNv0=;
 b=iMf600Qblo+ETqIYd7UmrEKsVgDpLNY9iYZWfV26FaC88lbYHqv66ypbL/jLGV9MbPsZRnzpIL4MZZFPZ9IHAYyny16nXLC7N5z3cEd8g7dCe898gBSrcLqa76cuKCgxqyVJo78+Rlz9ohHlbfDrvi78jEFHhZ4nMgIt5rhBs0k=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3716.namprd15.prod.outlook.com (52.133.255.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Wed, 23 Oct 2019 16:35:03 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2387.021; Wed, 23 Oct 2019
 16:35:02 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>, James Feist
 <james.feist@linux.intel.com>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: x86-power-control
Thread-Topic: x86-power-control
Thread-Index: AQHVhIgk7/7PtKOKbUeMJf/8spu+0qde/1mA///3sgCAAIQ8gP//kgqAgAGlawD//9+wgAClgtMA//+vbgCAAYFlgP//k3gAgAB4GgCAAAJfgP//0tyA
Date: Wed, 23 Oct 2019 16:35:02 +0000
Message-ID: <6FC6FAA0-C715-4462-8A10-1BBEFC07D6BB@fb.com>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
 <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
 <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
 <8F55F038-A6E7-46A4-8C27-93C738AFEBDC@fb.com>
 <5d43146c-b8b9-164e-ed54-33df4bae6dce@linux.intel.com>
 <F590F665-9327-4C8D-8C23-C317DA71D7F0@fb.com>
 <54c375be-e45e-fc2a-dd31-6c9d61158169@linux.intel.com>
 <6DA89556-AD25-4BEE-AF40-9D7A129B7CB9@fb.com>
 <548712d2-820b-7c20-f05e-fbd80ab38c62@linux.intel.com>
 <4230479D-77FD-4073-B478-2D0B34C2927A@fb.com>
 <286a9c11-565f-35f7-bdd6-2099e926bf5a@linux.intel.com>
 <a62a6c18-c184-61b4-2e47-b5a26088ba04@intel.com>
In-Reply-To: <a62a6c18-c184-61b4-2e47-b5a26088ba04@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:295c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 723186a6-269b-4350-b890-08d757d6f441
x-ms-traffictypediagnostic: BY5PR15MB3716:
x-microsoft-antispam-prvs: <BY5PR15MB371687B95FDFD2B6966F190DDD6B0@BY5PR15MB3716.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(396003)(346002)(366004)(39860400002)(199004)(189003)(51444003)(46003)(6506007)(478600001)(33656002)(476003)(6486002)(6246003)(53546011)(110136005)(25786009)(86362001)(102836004)(186003)(6116002)(486006)(11346002)(81156014)(2906002)(76176011)(99286004)(446003)(2501003)(2616005)(71190400001)(8676002)(81166006)(71200400001)(229853002)(316002)(6512007)(4744005)(54896002)(236005)(6306002)(256004)(5660300002)(66476007)(6436002)(66946007)(8936002)(64756008)(66556008)(76116006)(66446008)(14454004)(36756003)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3716;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1iGRWrLL4Q0hNIM9JIo+0DvbkPlC3RYqhXVq0gVqD9NTOjY+mVpLnXsVtM0JP2SjoLFKKd7eVp4F+Yy/x6Q/8piZXgJp+81bzkjxYyqNAWjbin9YDFMaUYHCMosg9zQhLMPJJIRekOY2b36jEsT7i5hhbdgET+A7E17iMePtcdSUYRlcolyCuWrX5wsfdafo5xRKjTIxOp61iJCu7nm8VcRZ7iZJYMRb8bXSSkYfbIxdyIEtp/FP0E39Svd1RbhW4wezL0oDHFr4IIv51ldo4jwmEgkqfJfRsjjjSVXGOPl1TfRIgbYLsu5AFTjiuaGkIMo+bXu/BrudJw1lHKy7LU68Y4UfU8kwQHQIlKI7H4r+K1Ew5aYO1xI9mqEKFwFFKYW2cjBj5vjqmaTMzi79QJ8zG74ZpAuBR/Jg4qAibgkv7kG5UHlIvxwoFEy3WhfH
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_6FC6FAA0C71544628A101BBEFC07D6BBfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 723186a6-269b-4350-b890-08d757d6f441
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 16:35:02.6761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: donFBi9e6el6lqIwDsj5NBgLsBSD61ofgBvdWd7zyUKG6LCPSycMIUVf/RPkLVaRySvSsIdfw3GNVtweTDjv0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3716
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_04:2019-10-23,2019-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=828
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910230157
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_6FC6FAA0C71544628A101BBEFC07D6BBfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIEphbWVzLCBCaWxsIGFuZCBKb2huLg0KDQpGcm9tOiBKb2huYXRoYW4gTWFudGV5IDxq
b2huYXRoYW54Lm1hbnRleUBpbnRlbC5jb20+DQpEYXRlOiBUdWVzZGF5LCBPY3RvYmVyIDIyLCAy
MDE5IGF0IDExOjA1IEFNDQpUbzogSmFtZXMgRmVpc3QgPGphbWVzLmZlaXN0QGxpbnV4LmludGVs
LmNvbT4sIFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiwgIkJpbGxzLCBKYXNvbiBN
IiA8amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+LCAib3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnIiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IHg4Ni1wb3dlci1j
b250cm9sDQoNCllvdSBtYXkgd2FudCB0byBkZWxheSB0aGUgY29weSB1bnRpbCB0aGUgY29tcGls
ZSBzdGVwLiAgRm9yIGV4YW1wbGU6DQoNClBST0pFQ1RfU1JDX0RJUiA6PSAiJHtUSElTRElSfS8k
e1BOfSINCmRvX2NvbXBpbGVfcHJlcGVuZCgpew0KICAgIGNwIC1mICR7UFJPSkVDVF9TUkNfRElS
fS95b3VyLWhlYWRlci5ocHAgJHtTfQ0KfQ0KDQpEb24ndCBwYXRjaCwgc2ltcGx5IGNvcHkgb3Zl
ciB5b3VyIG5ldyBoZWFkZXIgaW50byB0aGUgY29ycmVjdCBkaXJlY3RvcnkgaW4gYSBkb19jb25m
aWd1cmVfcHJlcGVuZCAoSSB0aGluayB0aGF0J3MgdGhlIHJpZ2h0IHlvY3RvIHN0ZXAgdG8gb3Zl
cndyaXRlLCBidXQgSSBtaWdodCBiZSBvZmYpLiAtLQ0KSm9obmF0aGFuIE1hbnRleQ0KU2VuaW9y
IFNvZnR3YXJlIEVuZ2luZWVyDQphemFkIHRlY2hub2xvZ3kgcGFydG5lcnMNCkNvbnRyaWJ1dGlu
ZyB0byBUZWNobm9sb2d5IElubm92YXRpb24gc2luY2UgMTk5Mg0KUGhvbmU6ICg1MDMpIDcxMi02
NzY0DQpFbWFpbDogam9obmF0aGFueC5tYW50ZXlAaW50ZWwuY29tPG1haWx0bzpqb2huYXRoYW54
Lm1hbnRleUBpbnRlbC5jb20+DQo=

--_000_6FC6FAA0C71544628A101BBEFC07D6BBfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <6D097233343E7C479C7BCB83726D84AC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDZW50dXJ5
IEdvdGhpYyI7DQoJcGFub3NlLTE6MiAxMSA1IDIgMiAyIDIgMiAyIDQ7fQ0KLyogU3R5bGUgRGVm
aW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7
bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjExLjBwdDsN
Cglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQphOmxpbmssIHNwYW4uTXNvSHlw
ZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpibHVlOw0KCXRleHQtZGVj
b3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFuLk1zb0h5cGVybGlua0ZvbGxvd2Vk
DQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpwdXJwbGU7DQoJdGV4dC1kZWNvcmF0
aW9uOnVuZGVybGluZTt9DQpwLm1zb25vcm1hbDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3Jt
YWwwDQoJe21zby1zdHlsZS1uYW1lOm1zb25vcm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0
bzsNCgltYXJnaW4tcmlnaHQ6MGluOw0KCW1zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1h
cmdpbi1sZWZ0OjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndp
bmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7
DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAx
MS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlv
bjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxh
bmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIj4NCjxkaXYgY2xhc3M9IldvcmRT
ZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3MgSmFtZXMsIEJpbGwgYW5kIEpv
aG4uPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpw
PjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0I1QzRERiAx
LjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9tOiA8L3NwYW4+
PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5Kb2huYXRoYW4g
TWFudGV5ICZsdDtqb2huYXRoYW54Lm1hbnRleUBpbnRlbC5jb20mZ3Q7PGJyPg0KPGI+RGF0ZTog
PC9iPlR1ZXNkYXksIE9jdG9iZXIgMjIsIDIwMTkgYXQgMTE6MDUgQU08YnI+DQo8Yj5UbzogPC9i
PkphbWVzIEZlaXN0ICZsdDtqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20mZ3Q7LCBWaWpheSBL
aGVta2EgJmx0O3ZpamF5a2hlbWthQGZiLmNvbSZndDssICZxdW90O0JpbGxzLCBKYXNvbiBNJnF1
b3Q7ICZsdDtqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbSZndDssICZxdW90O29wZW5ibWNA
bGlzdHMub3psYWJzLm9yZyZxdW90OyAmbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Ozxi
cj4NCjxiPlN1YmplY3Q6IDwvYj5SZTogeDg2LXBvd2VyLWNvbnRyb2w8bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwv
bzpwPjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+WW91IG1heSB3YW50IHRvIGRl
bGF5IHRoZSBjb3B5IHVudGlsIHRoZSBjb21waWxlIHN0ZXAuJm5ic3A7IEZvciBleGFtcGxlOjxi
cj4NCjxicj4NCjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDb3VyaWVyIE5ldyZxdW90
OyI+UFJPSkVDVF9TUkNfRElSIDo9ICZxdW90OyR7VEhJU0RJUn0vJHtQTn0mcXVvdDs8YnI+DQpk
b19jb21waWxlX3ByZXBlbmQoKXs8YnI+DQombmJzcDsmbmJzcDsmbmJzcDsgY3AgLWYgJHtQUk9K
RUNUX1NSQ19ESVJ9L3lvdXItaGVhZGVyLmhwcCAke1N9PGJyPg0KfTwvc3Bhbj48YnI+DQo8YnI+
DQo8bzpwPjwvbzpwPjwvcD4NCjxibG9ja3F1b3RlIHN0eWxlPSJtYXJnaW4tdG9wOjUuMHB0O21h
cmdpbi1ib3R0b206NS4wcHQiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+RG9uJ3QgcGF0Y2gsIHNp
bXBseSBjb3B5IG92ZXIgeW91ciBuZXcgaGVhZGVyIGludG8gdGhlIGNvcnJlY3QgZGlyZWN0b3J5
IGluIGEgZG9fY29uZmlndXJlX3ByZXBlbmQgKEkgdGhpbmsgdGhhdCdzIHRoZSByaWdodCB5b2N0
byBzdGVwIHRvIG92ZXJ3cml0ZSwgYnV0IEkgbWlnaHQgYmUgb2ZmKS4gLS0NCjxvOnA+PC9vOnA+
PC9wPg0KPC9ibG9ja3F1b3RlPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJt
YXJnaW4tYm90dG9tOjEyLjBwdCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0NlbnR1
cnkgR290aGljJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+Sm9obmF0aGFuIE1hbnRl
eTxicj4NCjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjcuNXB0O2ZvbnQtZmFtaWx5OiZx
dW90O0NlbnR1cnkgR290aGljJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+U2VuaW9y
IFNvZnR3YXJlIEVuZ2luZWVyPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtD
ZW50dXJ5IEdvdGhpYyZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPjxicj4NCjwvc3Bh
bj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjBwdDtmb250LWZhbWlseTomcXVvdDtDZW50
dXJ5IEdvdGhpYyZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiM1NTU1NTUiPmF6YWQgdGVjaG5vbG9n
eSBwYXJ0bmVyczwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Zm9udC1m
YW1pbHk6JnF1b3Q7Q2VudHVyeSBHb3RoaWMmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojNTU1NTU1
Ij48YnI+DQo8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo3LjVwdDtmb250LWZhbWlseTom
cXVvdDtDZW50dXJ5IEdvdGhpYyZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPkNvbnRy
aWJ1dGluZyB0byBUZWNobm9sb2d5IElubm92YXRpb24gc2luY2UgMTk5Mjwvc3Bhbj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjcuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O0NlbnR1cnkgR290aGljJnF1
b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzU1NTU1NSI+PGJyPg0KPC9zcGFuPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6Ny41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2VudHVyeSBHb3RoaWMmcXVvdDssc2Fu
cy1zZXJpZjtjb2xvcjojMUY0OTdEIj5QaG9uZTogKDUwMykgNzEyLTY3NjQ8YnI+DQpFbWFpbDog
PGEgaHJlZj0ibWFpbHRvOmpvaG5hdGhhbngubWFudGV5QGludGVsLmNvbSI+am9obmF0aGFueC5t
YW50ZXlAaW50ZWwuY29tPC9hPjwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+
DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_6FC6FAA0C71544628A101BBEFC07D6BBfbcom_--
