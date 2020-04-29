Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A01BE9B4
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 23:19:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CBGp6m44zDqBM
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 07:19:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2388b7be44=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=EzK3/zBs; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=ZDsf7DyL; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CBG30MRZzDqBM
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 07:18:50 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TLId5c026096; Wed, 29 Apr 2020 14:18:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=ddofe66ZHjEvIxOElByPEE000qWc0r1oy6CmS+F38oE=;
 b=EzK3/zBsF8/1YSG2x6pZmvkWLRHOldALsKF66elKsGVhfVH/4qOUzHQiUpORDi6nqKUz
 PzkbpiDqnIDmGCQogpi20u0k3cWvHbH6vEOTWm07ZgoXAc02b1xDijY+APvZi432O9ez
 b3voEgfL2uqYuIKPVmdaZGuKXYDS07sGx5E= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30n54espre-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Apr 2020 14:18:46 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 29 Apr 2020 14:18:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRNF7UcuOwuYb1tA4vbFq+9ONEAD7QeCTDyigL+0dkG+6uXQ+hRI+fsbkMb4oEz1N1Me8lq0+V0+u+cfmnFKbDmpfeH2kzuKgMkDR7570p8ZoXZsYpRMLzpJi0ioSajCFgwi00I+xWMw9yYe/ou2bawSX4IWFkhoccJ5zzkDoPP2EwDJ1EOTJxernOz6EE4Yrfbf3eTi7+hl/R8M9WunQo03R+IGtKZU7Qs0WoTlOPoItMCjAqiewH39LFqWXvzDdvt9sjFDriHcL7T/0C+LlKgr96YbzKXb1I06AW49pJR9+QOSeOhebDD5x8DkgJZZeeAyXOw8X64FnS/+xvl2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddofe66ZHjEvIxOElByPEE000qWc0r1oy6CmS+F38oE=;
 b=EDpHYQ2aJ1czf2m6a8OBhXsvPO9VwXCZWJUlAVHyKCeWHG2cynH7fxEmYvvxJtHH3t+XxmdQMxnaohx3rjjSZdtXpdbxKY5mUUaMpTAHpSeUBwRLGQxayMxZtH27e+tjSlrgUTHGjbqYJRALtProMNrpTKD8uWPcet6/GCPeThHsZFH3UiF9/MAkpgAUCACBs2Xs10b1KwsHef+Th9+DNb4IEmt5bqs6IiCtD56Y+G99INutuadmvkyjjlRSxPwuuWf5+tyNvpmc/DUk7zkWnuFZvijDW4mJiPruimLPQ/aKq/M86gZhsURX0hyDaEE0VMCacuBE4z81n0vhUrZrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddofe66ZHjEvIxOElByPEE000qWc0r1oy6CmS+F38oE=;
 b=ZDsf7DyLTKbp51bzlLLekR3q+rh2bG84gUIs2Xq9M+9QaH4T45mMYGQMFzMWQDnP+YY4Wi5HeZ2Zf1tGicEU6R3GwUTeJyfzAEqQlY/5MA9hSUB+ljOrxRVhWUezhNtdI0ZKDs3g0UutnzxgLMtmGWPcR+puC2EyyeycXz0akw8=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2486.namprd15.prod.outlook.com (2603:10b6:a02:84::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 21:18:39 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2937.023; Wed, 29 Apr 2020
 21:18:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bhat, Sumanth" <sumanth.bhat@intel.com>, Konstantin Klubnichkin
 <kitsok@yandex-team.ru>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Polling OpenBMC using IPMB
Thread-Topic: Polling OpenBMC using IPMB
Thread-Index: AQHWHg1IfhcJ/gpW2U62Mmyiy81uf6iP31QAgABGuAA=
Date: Wed, 29 Apr 2020 21:18:38 +0000
Message-ID: <766A4A26-4877-4FA6-B723-515FEAD8E822@fb.com>
References: <8521588154162@mail.yandex-team.ru>
 <1504A9E7C77EF44697F386AD61B162601534A594@BGSMSX105.gar.corp.intel.com>
In-Reply-To: <1504A9E7C77EF44697F386AD61B162601534A594@BGSMSX105.gar.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:76e2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d6e7d28-6d41-4ace-c7ef-08d7ec82e2e0
x-ms-traffictypediagnostic: BYAPR15MB2486:
x-microsoft-antispam-prvs: <BYAPR15MB2486F72F0962ABD172E83AE1DDAD0@BYAPR15MB2486.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(396003)(366004)(376002)(136003)(346002)(71200400001)(966005)(316002)(86362001)(2616005)(33656002)(110136005)(66556008)(478600001)(91956017)(6512007)(76116006)(66946007)(8676002)(53546011)(66446008)(186003)(64756008)(66476007)(3480700007)(6506007)(2906002)(5660300002)(36756003)(6486002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cd7VuRa0mWvEjmf+KCaSZ241onChbd7ZPzvJ6VG2arzRsgeNIh3z/wBOXnf8HuatnQFWml/JU+oatjwaB1ZLNKkT/88wU6948pNrTn3Tx4YAcZwIV6OpWFGwxrJW729KSaPJe4QrI0C9jFUzwvo2Fj2CuSP6Qr8Vtyq3qLDsFMLuIIVRDMrz8sCAoABIHFQaUC6fmqkIa+/EPfNu3EU3cj2JKvt7qxvt5tTwSazY8Yz0kRcXZfY7Q7S0OfsbuD1JMYO1sqME82Eyll8Lu4uQk1zif+8OucUNnaaTQV8BnaXqgPIHyNMwrjxvRa/b4IMY/nx1BBvkEU4RcdfDZR/Die/Cox5UrBbg3BEp+SVmc21x1R0QakcCCJw7EL8oz4Rtg/9cjPsbUU5l5GoH96r1G+re2zi99tDR7pKtSJ3w7xl0pN8wtVGm3CjKum48JaHgpiQu3Olh5S5lvxvtGnP3UdKhSiDrVhpD+iBg5oEULWtOBCH2OEWTMKLkb6w/qWJ73qageg9SgbBa82REclmr9Q==
x-ms-exchange-antispam-messagedata: 60mrWWUXxcvwrzM7Hz1aQhX2JwB8qge8UcSWsSYuOW3ue1oK3A31stBP2L1SqK2dzU0L3hdP9qLNvdwD8XqsCe+e/fEyEZEFcp+3QqcONxmy92FFQlGCW9lRSO/DpJ/1QAGimAeaMAF8gn2bWjRGycE7ni5GG1BqKTfzfAbJiQsX+xo1CcXiUxFIb2SFjpZMPXDPZOAQBNh95BtzGWvaIPGzKanGSxihb4EJ5jSA7tPRrD8uB5nDIb/5OEfBLRniorIfkjGf1G3/zApPQGdnM6QvIPs0yt8vUQBr3bt6Z+WnrnEwIKjtBM5SY4rYGU+WyIE81zTEElKpzqN0+zV+aG2MNU7VQ3HCPujQu8+Gj0Y6sLwYmtoHS5ZWCIRD4BkXMYUz4OGqk5jkXqAy4wT8ktKJ1/vSQVRcC0jrSB9fwp9VTwt4FxsMFIfkp4dBLM+ba51vqb/d2rIOxC1gjn1E8N/hc8gziB4n6Q3IIPtpwVFzPMMvC/42G4fApRA+XsomDj5oX69GQYGVg/Thq1KIJjiw+mF/5VBx1s0CnFXl9BkNqxQb5N7w2EvaFQ+KKJL9gIK6yCpxEAU05BMg0Qd1S9JWysP4v3x+imK1RhAAnwlKGvyJBeZkISGrCtRCkP2V6TZvrOUGoBFRb9sM9MpmXWlcP1OKt6mYa/Lx6KNV57d/aaWEFEPLxJ8hgqDW+3FdQJcrk2x/vDfpbIFAeH7me5vomX9KYXkDBQ+2HoIyaA5fxVjw5+bwpkjgy+83h0hUaIgkGNnVQyc2RrWVTlZZKYrRHEXbiCj5yTJR27zEJI7iIawRGzfdIUlISA/mSkWT+/AGZu3mGicO/u9SC6Lx1g==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_766A4A2648774FA6B723515FEAD8E822fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6e7d28-6d41-4ace-c7ef-08d7ec82e2e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 21:18:39.1130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rE6dtF1n/XPjw7w11h6Hi0JO2JhY6H9nO+fyDjy8L3eZXWaXPc9WIYTSUgJBjdJ4MFnAlBWPd/iPGYr0kGzdrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2486
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_11:2020-04-29,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004290154
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

--_000_766A4A2648774FA6B723515FEAD8E822fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxzbyBkZWZpbmUgeW91ciBkZXZpY2UgaW4gRFRTIGNvbXBhdGlibGUgd2l0aCBpcG1iLWRldiBk
cml2ZXIuDQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5j
b21AbGlzdHMub3psYWJzLm9yZz4gb24gYmVoYWxmIG9mICJCaGF0LCBTdW1hbnRoIiA8c3VtYW50
aC5iaGF0QGludGVsLmNvbT4NCkRhdGU6IFdlZG5lc2RheSwgQXByaWwgMjksIDIwMjAgYXQgMzow
NyBBTQ0KVG86IEtvbnN0YW50aW4gS2x1Ym5pY2hraW4gPGtpdHNva0B5YW5kZXgtdGVhbS5ydT4s
ICJvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpT
dWJqZWN0OiBSRTogUG9sbGluZyBPcGVuQk1DIHVzaW5nIElQTUINCg0KSGkgS29uc3RhbnRpbiwN
CiAgIElwbWJicmlkZ2UgaXMgdGhlIHJpZ2h0IHNlcnZpY2UuIFBsZWFzZSBvdmVycmlkZSB0aGUg
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvaXBtYmJyaWRnZS9ibG9iL21hc3Rlci9pcG1iLWNo
YW5uZWxzLmpzb24gd2l0aCB0aGUgSVBNQiBjaGFubmVsIHJlbGV2YW50IG9uIHlvdXIgYm9hcmQu
DQoNClRoYW5rcywNClN1bWFudGgNCg0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3N1
bWFudGguYmhhdD1pbnRlbC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIEtvbnN0
YW50aW4gS2x1Ym5pY2hraW4NClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjksIDIwMjAgMzoyOSBQ
TQ0KVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUG9sbGluZyBPcGVuQk1D
IHVzaW5nIElQTUINCg0KDQoNCkhlbGxvIGFsbCENCg0KSSd2ZSBnb3QgYSBQdXJsZXkgbW90aGVy
Ym9hcmQgd2l0aCBvbmUgb2YgdGhlIEkyQyBidXNlcyBnb2luZyBvdXQgZnJvbSBBU1QyNTAwIHRv
IGV4dGVybmFsIGNvbnRyb2xsZXIuDQpJdCBnZXRzIEJNQyBkYXRhIChzZW5zb3JzLCBNQUMgYWRk
cmVzcywgZXRjKSBieSBwb2xsaW5nIGl0IHdpdGggSVBNQi4NCg0KSSdtIHRyeWluZyB0byBmaW5k
IG91dCBob3cgdG8gaW1wbGVtZW50IGl0IGluIE9wZW5CTUMuDQpJcyBpdCBpcG1iYnJpZGdlIHNl
cnZpY2UgdXNlZCBmb3IgdGhpcz8NCg0KVGhhbmsgeW91IQ0KLS0NCkJlc3QgcmVnYXJkcywNCktv
bnN0YW50aW4gS2x1Ym5pY2hraW4sDQpsZWFkIGZpcm13YXJlIGVuZ2luZWVyLA0Kc2VydmVyIGhh
cmR3YXJlIFImRCBncm91cCwNCllhbmRleCBNb3Njb3cgb2ZmaWNlLg0KdGVsOiArNy05MDMtNTEw
LTMzLTMzDQoNCg==

--_000_766A4A2648774FA6B723515FEAD8E822fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <F7FD7BA0031DB24E9F7B5B27060F7575@namprd15.prod.outlook.com>
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
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQpzcGFuLkVtYWlsU3R5bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglm
b250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5N
c29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZTox
MC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdp
bjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29y
ZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGlu
az0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPkFsc28gZGVmaW5lIHlvdXIgZGV2aWNlIGluIERUUyBjb21w
YXRpYmxlIHdpdGggaXBtYi1kZXYgZHJpdmVyLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTti
b3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtj
b2xvcjpibGFjayI+RnJvbTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBw
dDtjb2xvcjpibGFjayI+b3BlbmJtYyAmbHQ7b3BlbmJtYy1ib3VuY2VzJiM0Mzt2aWpheWtoZW1r
YT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyZndDsgb24gYmVoYWxmIG9mICZxdW90O0JoYXQsIFN1
bWFudGgmcXVvdDsgJmx0O3N1bWFudGguYmhhdEBpbnRlbC5jb20mZ3Q7PGJyPg0KPGI+RGF0ZTog
PC9iPldlZG5lc2RheSwgQXByaWwgMjksIDIwMjAgYXQgMzowNyBBTTxicj4NCjxiPlRvOiA8L2I+
S29uc3RhbnRpbiBLbHVibmljaGtpbiAmbHQ7a2l0c29rQHlhbmRleC10ZWFtLnJ1Jmd0OywgJnF1
b3Q7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJnF1b3Q7ICZsdDtvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDogPC9iPlJFOiBQb2xsaW5nIE9wZW5CTUMgdXNpbmcg
SVBNQjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij5IaSBLb25zdGFudGluLDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5i
c3A7Jm5ic3A7IElwbWJicmlkZ2UgaXMgdGhlIHJpZ2h0IHNlcnZpY2UuIFBsZWFzZSBvdmVycmlk
ZSB0aGUgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvaXBtYmJyaWRnZS9ibG9i
L21hc3Rlci9pcG1iLWNoYW5uZWxzLmpzb24iPg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
aXBtYmJyaWRnZS9ibG9iL21hc3Rlci9pcG1iLWNoYW5uZWxzLmpzb248L2E+IHdpdGggdGhlIElQ
TUIgY2hhbm5lbCByZWxldmFudCBvbiB5b3VyIGJvYXJkLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij5UaGFua3MsPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5TdW1hbnRoPG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPkZyb206PC9iPiBvcGVuYm1jICZsdDtvcGVuYm1jLWJv
dW5jZXMmIzQzO3N1bWFudGguYmhhdD1pbnRlbC5jb21AbGlzdHMub3psYWJzLm9yZyZndDsNCjxi
Pk9uIEJlaGFsZiBPZiA8L2I+S29uc3RhbnRpbiBLbHVibmljaGtpbjxicj4NCjxiPlNlbnQ6PC9i
PiBXZWRuZXNkYXksIEFwcmlsIDI5LCAyMDIwIDM6MjkgUE08YnI+DQo8Yj5Ubzo8L2I+IG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZzxicj4NCjxiPlN1YmplY3Q6PC9iPiBQb2xsaW5nIE9wZW5CTUMg
dXNpbmcgSVBNQjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86
cD48L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286
cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwv
bzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IZWxs
byBhbGwhPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPkkndmUgZ290IGEgUHVybGV5IG1vdGhlcmJvYXJkIHdpdGggb25lIG9mIHRoZSBJMkMgYnVz
ZXMgZ29pbmcgb3V0IGZyb20gQVNUMjUwMCB0byBleHRlcm5hbCBjb250cm9sbGVyLjxvOnA+PC9v
OnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SXQgZ2V0cyBCTUMg
ZGF0YSAoc2Vuc29ycywgTUFDIGFkZHJlc3MsIGV0YykgYnkgcG9sbGluZyBpdCB3aXRoIElQTUIu
PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJz
cDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkkn
bSB0cnlpbmcgdG8gZmluZCBvdXQgaG93IHRvIGltcGxlbWVudCBpdCBpbiBPcGVuQk1DLjxvOnA+
PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SXMgaXQgaXBt
YmJyaWRnZSBzZXJ2aWNlIHVzZWQgZm9yIHRoaXM/PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxk
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0K
PGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoYW5rIHlvdSE8bzpwPjwvbzpwPjwvcD4NCjwv
ZGl2Pg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+LS0mbmJzcDs8bzpwPjwv
bzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkJlc3QgcmVnYXJk
cyw8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPktv
bnN0YW50aW4gS2x1Ym5pY2hraW4sPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5sZWFkIGZpcm13YXJlIGVuZ2luZWVyLDxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+c2VydmVyIGhhcmR3YXJlIFImYW1w
O0QgZ3JvdXAsPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj5ZYW5kZXggTW9zY293IG9mZmljZS48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPnRlbDogJiM0Mzs3LTkwMy01MTAtMzMtMzM8bzpwPjwvbzpw
PjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9v
OnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_766A4A2648774FA6B723515FEAD8E822fbcom_--
