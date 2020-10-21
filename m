Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDAE2945D3
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 02:16:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG9z05trKzDqdb
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 11:16:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7563812393=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=aRXqMXkz; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=VGO6ozR4; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG9xb6jtxzDqX2
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 11:15:29 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L0E3Xp005422; Tue, 20 Oct 2020 17:15:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=Orp2bMJ07VaVzlzO/SFNeN4fuIC7gc5RN3REohUIoCU=;
 b=aRXqMXkz9jvYYv2hYd7gV8YQyg3MdRn37+xseEIJky+YTPo8pm89zTeX1YUmWZ6fXrbH
 WCIQRdDciqenuKgAb/9NhKcVCupg9NnYAv+5UFjjaZsAE+6YyFXT3r0bsAITbA3YJbcl
 lpkyKLmy0UA4ZaEacJJAICnrrSGUrSedLzI= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 34a57yhjv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 20 Oct 2020 17:15:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 20 Oct 2020 17:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9UOdxbEXOfJf/eodOkogAjeONQax4sgKFJcE/jpEuYxUhP4qG3crnO2OCBHvqdsK2rPdIq+PbTFWO8/Jvtnl8k8O07UQZc3kZgSBwlRshJbDyzLUlsGl8O4iM1C1H2/5sig5wGffEusYF5bs7T4sfQe1aNiDHX7QODMC3sqKg0pOrEQXqr5TBD9UjIHRyMriNse5umCDBZFNimK3jqTqFKn8cc5mkgAVilSBau2xuwj6gj0d1Q+r8rTOJAtxZACjMpDHio1ClbwHtItUu1VYwf683KszRSwtoVmZTiXgJb7VO1slcE+kU5iwOkN3WAncn3gDkm1DviASxvHVr6JAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Orp2bMJ07VaVzlzO/SFNeN4fuIC7gc5RN3REohUIoCU=;
 b=iXURQvftYE5iurkDXtA6z2XDp8Sd7zsRF72UpC8m+Yby3n/40TZ4wOi81iLW5W/QLPbM2TksW95Oj0WsnF8CGE5imaPG8Z8YXHeTVJ0UvQkPZEIAopR2kzOuf1uTG5dguM5eYg3H6nG+iQVF14ftVc927OAVpx3eKYPRwuWb7riYwNpbOIS5Huo1V4X1GMLSWO0DnvApTTmqZOwgEAtuJWF6J4ym929/Ma9c01fhyZN72gd132l+EH/1NytuY6+E4MokUKWqCraiZ8pwarqe91DjI3q1ymW5r0IDjx2XXLddJFnD4HmeYHftD1HcjS0H2CWMPKSlFxClLh72RQmOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Orp2bMJ07VaVzlzO/SFNeN4fuIC7gc5RN3REohUIoCU=;
 b=VGO6ozR4B19miFom8LQ/K4uUzZn4TuYubh72Y6OjCaEP7d+Qe+vkGH1ke987K8RHnlhspe7Nfx5d4Q/4/itClxng8tRrrdH2wvYK+K63cK5HU3iyo2DIm1IjGyFmqvCeDSIVTz4MRwGGYbBlonAoWAu4xcC7kQuoWk/X8l/SIQU=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by SJ0PR15MB4234.namprd15.prod.outlook.com (2603:10b6:a03:2c9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Wed, 21 Oct
 2020 00:15:25 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 00:15:24 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Thu Ba Nguyen <tbnguyen1985@gmail.com>, Ed Tanous <ed@tanous.net>
Subject: Re: Enable/Disable some sensors when Host On/Off
Thread-Topic: Enable/Disable some sensors when Host On/Off
Thread-Index: AQHWpVcXCVA3BkWl7Eyj9ueTbWR8mamfML4AgAAOJgCAAX+fAA==
Date: Wed, 21 Oct 2020 00:15:24 +0000
Message-ID: <90950FB3-E1B3-4ACE-97C5-CB9582A94456@fb.com>
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
 <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
In-Reply-To: <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:745f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 551148d8-34f7-49a4-d4c6-08d875566843
x-ms-traffictypediagnostic: SJ0PR15MB4234:
x-microsoft-antispam-prvs: <SJ0PR15MB42340F5F5FFC13AAEF3BDBD8DD1C0@SJ0PR15MB4234.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:519;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 16ptL85N3m+oXSk4ZrzUGEoOYQMmyVQsUsIHBXnvLtOEBJUZjwV4ZpVVjW0NT+9TbFbgOJCDWQtv5xEhaQYjjfry40z6UKRSzEGQnfG2SqTFBSd47VnCJo0AUmoj+gVlWbn2bVAbhxl1fNlGXPAHhuIyLLi0ImTajgZGaiVdOngunw0MX9R3gofbCC9ZTZnHIyFvdV3sNa6+dtwItGKeZLP1ryKuvV6NZGVglE0KZYGDRBBvVXbp5FnQZ7d9l1ymKRBomkVtWmhgHLfqxhRQTnIJTySRyIaZFDILjJ1lPGZZo06aKxy9/OekTVlzJtAw5Wme8Wnb5JSDqoP+TlxxTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(39860400002)(136003)(366004)(33656002)(66476007)(53546011)(186003)(4326008)(2906002)(316002)(6506007)(478600001)(66446008)(6512007)(6486002)(66556008)(64756008)(91956017)(76116006)(66946007)(5660300002)(4744005)(86362001)(71200400001)(8936002)(110136005)(36756003)(2616005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XyLSXMCROYaI0FMTs57HaZ5gXD9bJRJIrMTGbLbOaf9n+3TMTVrka/SJ56NET2d8qj6HTAKcKdhgPZrFx2/5pnCWMjNADTjsJZdHY9dQjJPpwt24H5sYhqBWDZAhh134o5MvvRKiOnlMWpj4ZWUMesFYZtOrmGQi7d3JnmseJ+v7BldIbr2jJ5i4xB5OyXj7jPAI65l70MiAlsASgNpFYvETgT7TXR/Fd4r0z+9eyzJs4Hll/xCTWiZv9Tn4YX1zb/Ttszt+xFR2UwJh0hZ31dlyHhgefsAwHjWym2DJ+66vDC9kyzEuh8omeIqbbLlh9a1STkd6hw0uMOl1KMARnzDnfaocIErdbyyS5Bu+HOFjPomDMHy1hihfLbDOzqTvgmjoeoSIT5Tv8qbg/Zj2ytvtO5dt4oDZcFkbDOYUl0oze3RXSIyTRLKWW8VCtyYhrqqfvb7lIdqzvRigGjfloAAPabu1chRYvvZUI1ZHoGpL9Jk+6WfyCltzMoVB4qW/HP82CW4FOHT1VY3ae7LGvykPUEwX0+lGJf9f0a4Vu9VHTaz/8rNOkfVPfkeyQOdHCESnJoTlxQTteKz6fVQth+KAZtT9hCw/I4zNsARVMfdR064MVtNcBHtKfb6pvUbTWdctmmXmiWvG0dMJpWwd7OcKJlhopC5/b0EWVqY9787fWTaB8Q3C8xb/yoo3C65e
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_90950FB3E1B34ACE97C5CB9582A94456fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551148d8-34f7-49a4-d4c6-08d875566843
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 00:15:24.8828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DsZtvzsK1x/RiUFbkfCv1W6xhl2Pf5xUKqWXWfQ3gYaG4UPyQ9k1SdX5iAdMAnV8jp6IszaafxpOpWdTaRr8ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4234
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-20_13:2020-10-20,
 2020-10-20 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=902
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 phishscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010210000
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

--_000_90950FB3E1B34ACE97C5CB9582A94456fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlz
dHMub3psYWJzLm9yZz4gb24gYmVoYWxmIG9mIFRodSBCYSBOZ3V5ZW4gPHRibmd1eWVuMTk4NUBn
bWFpbC5jb20+DQpEYXRlOiBNb25kYXksIE9jdG9iZXIgMTksIDIwMjAgYXQgMTE6MjMgQU0NClRv
OiBFZCBUYW5vdXMgPGVkQHRhbm91cy5uZXQ+DQpDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IEVuYWJsZS9EaXNhYmxlIHNvbWUgc2Vu
c29ycyB3aGVuIEhvc3QgT24vT2ZmDQoNCkhpIEVkIFRhbm91cywNCg0KPiBUaGFua3MgZm9yIHlv
dXIgaW5mbywNCj4gQnV0IGluIHlvdXIgcGxhdGZvcm0gd2UgYXJlIHVzaW5nIHBob3NwaG9yLWh3
bW9uIHRvIG1hbmFnZSBzZW5zb3JzLg0KPiBXZSBkb24ndCB1c2UgZW50aXR5LW1hbmFnZXIuDQo+
IEFzIEkga25ldyB3ZSBjYW4ndCB1c2UgYm90aCBlbnRpdHktbWFuYWdlciBhbmQgcGhvc3Bob3It
aHdtb24gZm9yIG9uZSBwcm9qZWN0Lg0KDQpZb3UgY2FuIHVzZSBib3RoIGJ1dCBmb3IgZGlmZmVy
ZW50IHNlbnNvcnMuIFlvdSBjYW4gZGVjaWRlIHdoYXQgc2Vuc29ycyB0byBjb25maWd1cmUNCnZp
YSBFTS9kYnVzLXNlbnNvcnMgYW5kIHdoaWNoIG9uZSBmb3IgcGhvc3Bob3ItaHdtb24uDQoNClJl
Z2FyZHMNClRodSBOZ3V5ZW4uDQo=

--_000_90950FB3E1B34ACE97C5CB9582A94456fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2944F39B83C3C741B5F313AFDCB6B67D@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6
ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFp
bFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVs
dA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBw
YWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4w
aW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9
DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9ImJsdWUiIHZs
aW5rPSJwdXJwbGUiIHN0eWxlPSJ3b3JkLXdyYXA6YnJlYWstd29yZCI+DQo8ZGl2IGNsYXNzPSJX
b3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXYgc3R5bGU9
ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0I1QzRERiAxLjBwdDtwYWRkaW5nOjMuMHB0
IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9tOiA8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5vcGVuYm1jICZsdDtvcGVuYm1jLWJvdW5jZXMr
dmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcmZ3Q7IG9uIGJlaGFsZiBvZiBUaHUg
QmEgTmd1eWVuICZsdDt0Ym5ndXllbjE5ODVAZ21haWwuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwv
Yj5Nb25kYXksIE9jdG9iZXIgMTksIDIwMjAgYXQgMTE6MjMgQU08YnI+DQo8Yj5UbzogPC9iPkVk
IFRhbm91cyAmbHQ7ZWRAdGFub3VzLm5ldCZndDs8YnI+DQo8Yj5DYzogPC9iPk9wZW5CTUMgTWFp
bGxpc3QgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OiA8
L2I+UmU6IEVuYWJsZS9EaXNhYmxlIHNvbWUgc2Vuc29ycyB3aGVuIEhvc3QgT24vT2ZmPG86cD48
L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86
cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+SGkgRWQgVGFub3VzLDxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj4mZ3Q7IFRoYW5rcyBmb3IgeW91ciBpbmZvLCZuYnNwOzxvOnA+PC9v
OnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jmd0OyBCdXQgaW4g
eW91ciBwbGF0Zm9ybSB3ZSBhcmUgdXNpbmcgcGhvc3Bob3ItaHdtb24gdG8gbWFuYWdlIHNlbnNv
cnMuPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4m
Z3Q7IFdlIGRvbid0IHVzZSBlbnRpdHktbWFuYWdlci48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0K
PGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZndDsgQXMgSSBrbmV3IHdlIGNhbid0IHVzZSBi
b3RoIGVudGl0eS1tYW5hZ2VyIGFuZCBwaG9zcGhvci1od21vbiBmb3Igb25lIHByb2plY3QuPG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPllvdSBjYW4gdXNlIGJvdGggYnV0IGZvciBkaWZmZXJlbnQg
c2Vuc29ycy4gWW91IGNhbiBkZWNpZGUgd2hhdCBzZW5zb3JzIHRvIGNvbmZpZ3VyZTxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+dmlhIEVNL2RidXMtc2Vuc29ycyBhbmQgd2hp
Y2ggb25lIGZvciBwaG9zcGhvci1od21vbi48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+UmVnYXJkczxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGh1IE5ndXllbi48bzpwPjwvbzpwPjwvcD4NCjwv
ZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_90950FB3E1B34ACE97C5CB9582A94456fbcom_--
