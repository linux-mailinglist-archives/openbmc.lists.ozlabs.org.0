Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E176F7EADD
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 05:59:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460D1d4895zDqs6
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 13:59:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=31170bfc9b=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="LF8vF2zi"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="NgaeKIaD"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460D0z4HrWzDqQR;
 Fri,  2 Aug 2019 13:58:42 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x723sbGK027673; Thu, 1 Aug 2019 20:58:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=lgYn/GHQ2ve4YnEndOVI+6nM2w3g64fGwXQiboiOO8c=;
 b=LF8vF2zip75ZTdSpKoYTYLXhzg5fMcPWNbVOt8Fn76SDwigXkl0XfbHVaaZsax9/I6Fq
 fcFH7gPKqkCxifymf0JW1+qURPPOaz6UmNvFE752Wi2B4q8/CWeK8eVKJDv5EpmVE9SI
 hK2GuyciwJmIdkcQSE1XGnHEXx7MmM6uKV0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2u430yt9sa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 01 Aug 2019 20:58:30 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Aug 2019 20:58:29 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Aug 2019 20:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq+RN4q+lUSSfvk+ZCKIaSRCXvE00VBeZ2M6xf4h3GTa828qfrQzfDIHFD+fqH4jzaIfhTPJwGN6c5KcWywZp8aPS8C4+MwdSsv3d96U1KslpBb0AdzorZbAQPzfIqkhqWPPKh1wgoq84G1uYe4Kzw6aE2u2zpIE0MyFDl6BLqExEPZaKwCLcCyAH6WXIKpcaEGITYDVozTCNvRhvvvoiruOxkgV8Q8V9zmWupIcNZSnXCN4ocZVOKre69dSgduXU2UB0PJXOtXsUVnQENvPubLJVEDCZXlSgFpJspBpmqrzsOc9WIgcNrA41dXHnEW2sk/Dt3nj3N8l0xAoqlfnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgYn/GHQ2ve4YnEndOVI+6nM2w3g64fGwXQiboiOO8c=;
 b=Mq4hkcJComWFJfL6B+S+NdYIgIHlg6q1BgzDxtKBkLtQVASbFs8SIZBy0xKdPt+SeAB3Bkx08z3sZ0wANXyQxslZbUTvw17N9+/yuJdkN9yBEe2hHat+YjTlmAbk92ABIk/Sj5nSiBp2loxYqPBHVHY6upkDvP7SsL/3GNSw+LCuhB43g2mrtIJU6E/UmJFGFNBIfJgIzUc9JyRgF4sytE/f2zf/4DgJy9g24Q4siF8yc0hxUFqBgOwqPD8JhoqrwiXZOJlyAr/xK7xFkoPOMbmBH0TU0HiG+dj0v+8Ynx2HbNUcn1/K0OvvDFHNk0276KBYx3htD46prmYSxmYgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgYn/GHQ2ve4YnEndOVI+6nM2w3g64fGwXQiboiOO8c=;
 b=NgaeKIaDY87Og+i4Nj8edflE3/pj6V+vPemHDPMZy/3kCMc22CpNoPlHe3wIe11jekjVzF4OIZlZ9HAPza7u9ToRX7lOyBHDeupEEYRoGpdqvXFieHlSthnAX6YLz23UbWPais1o9LINntbjGdosyaP7yEZbeKoO9k96ClZl5b4=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1197.namprd15.prod.outlook.com (10.175.7.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 2 Aug 2019 03:58:28 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::c66:6d60:f6e5:773c]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::c66:6d60:f6e5:773c%8]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 03:58:28 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Facebook Wedge40 BMC
Thread-Topic: [PATCH] ARM: dts: aspeed: Add Facebook Wedge40 BMC
Thread-Index: AQHVSMzi2YI0OqbiWE+Xo4WCtkS/eabnKj4A//+b4gA=
Date: Fri, 2 Aug 2019 03:58:27 +0000
Message-ID: <A7C478FF-F7C9-4877-AC7E-69ADDE2EA144@fb.com>
References: <20190802005427.467841-1-taoren@fb.com>
 <266be87c-3bf2-4dcb-9d90-8272fbc3b057@www.fastmail.com>
In-Reply-To: <266be87c-3bf2-4dcb-9d90-8272fbc3b057@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.1a.0.190609
x-originating-ip: [2620:10d:c090:180::1:d664]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f5e8c93-a76c-421a-2f15-08d716fdacf4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1197; 
x-ms-traffictypediagnostic: MWHPR15MB1197:
x-microsoft-antispam-prvs: <MWHPR15MB11978B9C90E42A3131A5D23EB2D90@MWHPR15MB1197.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(376002)(346002)(39850400004)(366004)(47680400002)(189003)(199004)(186003)(8936002)(7736002)(86362001)(8676002)(25786009)(6512007)(71190400001)(71200400001)(110136005)(316002)(305945005)(6486002)(76176011)(6436002)(53546011)(99286004)(102836004)(6246003)(2201001)(256004)(6116002)(58126008)(2906002)(229853002)(76116006)(66946007)(66446008)(53936002)(64756008)(66556008)(66476007)(14454004)(6506007)(33656002)(5660300002)(446003)(11346002)(36756003)(476003)(81156014)(2616005)(68736007)(46003)(2501003)(486006)(81166006)(478600001)(4744005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1197;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CbId0CHQWeoVFP8y482rvZHQV8SPARAMRg2QVpAw8Z+zWHe67KMz2YGSkg5HMLR7lQlXRMsEas0OW29tJ4z0z5x7gQHtJjGx4k/pJ9eO75wlpVwaJlz3YXMKJxWZvlQDGQGbWpfZdxwZjEtGgJ53pjxLVt5qhtfvwYrnLRbsv0nUbwMDuZfZ9uxzU+stzZQFLKbU1mfu4jS6o1oxVbmN1BiALF2khDSOJQ6esFWBBA/nd3h5Xg2+CDwfV8xLOEtM5EfI88qWYzrRIk13WpGWpLKYwg9He4mU4BLV2q7YZVTyIoBVO4JtdyYWI8hxAbhMToil7wHH/Zkn6HjbuggBCZenbQRPcoARLaguncHV8OKi7X0O1BxM+Yo2o5NB/tzfKNYkRETuJxR58xA3mtTHnZ/neiy6y9DpeJAkxCNhAuQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5A34078B1920E4FB419DE9990F41BB3@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5e8c93-a76c-421a-2f15-08d716fdacf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 03:58:27.8403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1197
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=882 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908020040
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

T24gOC8xLzE5LCA3OjU2IFBNLCAiQW5kcmV3IEplZmZlcnkiIDxhbmRyZXdAYWouaWQuYXU+IHdy
b3RlOg0KDQo+ICAgIE9uIEZyaSwgMiBBdWcgMjAxOSwgYXQgMTA6MjQsIFRhbyBSZW4gd3JvdGU6
IA0KPj4gQWRkIGluaXRpYWwgdmVyc2lvbiBvZiBkZXZpY2UgdHJlZSBmb3IgRmFjZWJvb2sgV2Vk
Z2U0MCBBU1QyNDAwIEJNQw0KPj4gcGxhdGZvcm0uDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFRh
byBSZW4gPHRhb3JlbkBmYi5jb20+DQo+ICANCj4gIFJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVy
eSA8YW5kcmV3QGFqLmlkLmF1Pg0KDQpUaGFuayB5b3UgQW5kcmV3IGZvciB0aGUgcXVpY2sgcmV2
aWV3IChvbiBib3RoIHBhdGNoZXMpIQ0KDQpDaGVlcnMsDQoNClRhbw0KIA0KDQo=
