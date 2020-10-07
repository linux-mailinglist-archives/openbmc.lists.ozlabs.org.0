Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1E82862AD
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 17:55:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5zS303gyzDqPj
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 02:54:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=754966118e=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=IVMYsNiM; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=URLJ/iXN; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5zQv3t8fzDqMp
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 02:53:53 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097FrEDi014258
 for <openbmc@lists.ozlabs.org>; Wed, 7 Oct 2020 08:53:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=0mwj+cTspIV5Tu3rgFYEcRM4ZlCC5r2tJKWaYSf4R84=;
 b=IVMYsNiMFvJd1l8cFvPa3fmHogH+k1Mo52H92D0KS7gXlSpIouLBm+Cte9ZEQRjZcAzP
 mTIoSU9ZLgwNHm47bGsSk0EdvLx/krHKNpa3xpK70aN7u29Mqu6r7Xnke3ZjqOxM87et
 zfv1cKQKspDvLORRfSkvGqUQgzH0qh+3Fcs= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 341gpag0cx-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 08:53:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 7 Oct 2020 08:53:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PK9OVyTHfjYIczIWHYVc38NSpn1LLuhCfIkDb8Ud5gVHvgPOwAO3pAupTvB957KPzP4Qk64RWunuMYED/DB8Ts4ElIefCbnYTSkr0R6vg1Rzvl2yUh+DBHS5KxVoeGVBApT+xHPVzX+oGyIEM6rwLJRsRNgxOuwSnshpXob3IwsankKkhfM+OaDAdba7yLYHl+EUrS2iasP7QBeyDnvGO1LLaq3EfCzfOotdrCinXpx93cSiN5EyP6VgIfdUPX5b0obFIvm0lpzzYbutJqmaqn6nHNYpdj4QI6VyQAkfLokF5HvtPW0njEYc8vREmu9VUeeKSWtKatlphQSlcjPDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mwj+cTspIV5Tu3rgFYEcRM4ZlCC5r2tJKWaYSf4R84=;
 b=Q/PhatEBOOsu14a8x7rwRb9SilJMBmgq1b/7/7Ij2byUw5gpBx6kXkmcnzr1UX1b/QyBxDFuZ9UXQ/7t73tSM5gkGfdIFS7XzYgTm812iz5MlbZTBCu8HM7yP9VyZO3kUEXcN28fLiGNEwA/blBARXF0iYwVU/IilEA3F7bUCJiEKEIVPbFzAmUrIXSuUpSkruw0UEprsNDep6l1hEyWS4HT1b2bs4YsDWuhPxoowdzItUmJKBCYUEG30+ekxphoNGgiFLhvVslmi/MzqHWN1prJdPJ107eRwLs6N33ch00mkKaGrr0k+KExLWoKteBg3W2iAkmhF2j1VT9kx9STfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mwj+cTspIV5Tu3rgFYEcRM4ZlCC5r2tJKWaYSf4R84=;
 b=URLJ/iXNo3e/KqCak2bd7/ktsg+23xjcgN0F6GlHlFz9MbKojNBaS5FrZLUVttw8tpZxWSR3P2y/BonJMQprCie451ygK5/9EpOCO8caXWagBtXXuTIeviBPsEv3pi3j5TG4w7LryGdQMKoS+dSaJpTP9WKEW6Ef29TsxnA5HF8=
Received: from BYAPR15MB3223.namprd15.prod.outlook.com (2603:10b6:a03:110::28)
 by BYAPR15MB3030.namprd15.prod.outlook.com (2603:10b6:a03:fb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 15:53:41 +0000
Received: from BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8]) by BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8%7]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 15:53:41 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Learning Series
Thread-Topic: OpenBMC Learning Series
Thread-Index: AQHWdlCwHJzSAeOuJEOCEV5BbMCQvKlDLckAgAcppQCACtqLAIAB68aAgAkVIACAAcIFgIAIoUwAgAuQE4CACw4fgIAK7bAA
Date: Wed, 7 Oct 2020 15:53:41 +0000
Message-ID: <9EDCD78E-A095-48AA-93BC-BF73AD8BD533@fb.com>
References: <C24D4BAF-B185-4640-BFEF-D391E51A0A35@fb.com>
 <452FDC0B-2E4F-4AD9-97E6-DE9B2333D99B@fb.com>
 <8EE0F70D-78CB-4CDB-A51C-53FC33A2AC87@fb.com>
 <EFFBC9D1-BA53-4C61-8BC2-7F52320245F7@fb.com>
 <51C18C28-4894-4BEF-AAA6-BACE5B934B5C@fb.com>
 <AFA8029B-BBBC-41A5-9F66-671D41D0E624@fb.com>
 <D4F1F4FA-E1E2-425C-B685-D0BAE3D5E596@fb.com>
 <A6D2354C-DD02-4BCB-AAE2-2F6B16784DBD@fb.com>
 <A5439E11-28B2-4476-9A9E-D8A8CA525A32@fb.com>
 <179181C3-A497-4D36-8A73-F22DA7FF4D8B@fb.com>
In-Reply-To: <179181C3-A497-4D36-8A73-F22DA7FF4D8B@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.41.20091302
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:5200:3df0:18c7:4c63:3895:a54d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b079319-4f79-4f40-0d55-08d86ad929af
x-ms-traffictypediagnostic: BYAPR15MB3030:
x-microsoft-antispam-prvs: <BYAPR15MB3030CAD4A80D252B48A51892CE0A0@BYAPR15MB3030.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: miAjXN0EsXs1CtDu4+ejyO6p4uTkYhg+EzZZiP6r+PiSS0mxdjO3glUQxXkVGPlZKd2pit58RZWt7fvDAwYFifN+Rngi8nIJ03azAk6yS+jGE754zHO5BY4gxMpiogA1fWpdLQKJWZWR+KyNQ5SuSTxayZcRnBKBY8uh3i9kLKVRYWPQ0jQvdOulNZaTMhAPek/uF2+XZFh0LRVh+m9j+V9CsdwOfFy5a9o+tvCkQA3wnxATGD/lrXLBNaY8vJtuRrf+GXpWz4AZAlsm34DZAiMeAFfuNGKrEBXjR4a1vqD8DHVp5JZyiW2NGH6z+AKtRocHTxrryzYK7Xr8v55yQTsWv1Rah5Y0hOzQAsVsPDMzCezg3B5I0joy1fgsANZGQOeewxxAKhbS+tz1w/g3gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3223.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(136003)(376002)(396003)(346002)(6512007)(8936002)(4744005)(66476007)(2616005)(66556008)(64756008)(66946007)(66446008)(83380400001)(316002)(66616009)(86362001)(76116006)(71200400001)(6506007)(5660300002)(6916009)(478600001)(7116003)(36756003)(2906002)(8676002)(6486002)(186003)(99936003)(3480700007)(966005)(83080400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: aqnOYGEpdnd1sfTVTAbe+DAb5UiXhdTu1C73xhOtBv6rnkA2fEGAKOSAZ6EGd2RWtU+h71Y+ZVypcIiiimVdCPyvJOtHxjnHwrWf8EQdg2uj7OienCr8gobIrZ/yaHw8LHKOFGhpYc8qr0J/dA9tMayfH49C2v1qeyPfufnjRZuCHM1nzBe0Z7ljmttGsBhErhYZKhsbntkjtDb7FaBNn9OuEq9lGYT1fZW3R6Uw5psPeV4ZrVVYOsjDHSCyuzMLCtGCZ1/Oi+76IehgI2RBymKNGEZcWPq9PtrqmIlKoX/USK+hr7BQxWVyRqGFYi2WiN44hcVJOUaLxKWPRq2huyvPw/WP/vfSZZJ31+r+KA0I4s0aBcYTReYssb4dENUebZ/Qdmhw8M+N1XrKn8ngyWV++C2rEP2ZCUk1pZdc7HOl+XMOLU/mEJU4r76Qg5QFYLEfOEocPk80HCtetdhJAbwANzUdxlgmA3aavdqKyIvelLKLHZF+LGzoNp9LHBpTdwRU9UrY0ZRJgmMG6eI89+bO4QAzQ1nNJTS9/r3am2RaT0jC8777nVb8zkiLKDy9qSSaN6idEJB1KsMX+trhy+dupf81OgdVlxLKecx8XvFAobhfAvXsMpT6iYfBpSWWfscOCiK3liv4lIiy4TQzlKcIsvwe9cmvPeC/tDrCxSuTjqgI8JvUIaFf+DC3YmRjoihQzeIov8VGMHra8V5zlg==
x-ms-exchange-transport-forked: True
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3223.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b079319-4f79-4f40-0d55-08d86ad929af
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 15:53:41.0272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XCWi3Fi9naToaYk/kXplfv3M4lWrxyDncOSc5vewqFLouzR499VPIq3vkdaPSiib
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3030
X-OriginatorOrg: fb.com
Content-Type: multipart/mixed;
 boundary="_004_9EDCD78EA09548AA93BCBF73AD8BD533fbcom_"
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_10:2020-10-06,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2010070099
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

--_004_9EDCD78EA09548AA93BCBF73AD8BD533fbcom_
Content-Type: multipart/alternative;
	boundary="_000_9EDCD78EA09548AA93BCBF73AD8BD533fbcom_"

--_000_9EDCD78EA09548AA93BCBF73AD8BD533fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UXVpY2sgcmVtaW5kZXIgYWJvdXQgdGhpcyB3ZWVr4oCZcyBsZWFybmluZyBzZXNzaW9uIOKAnE9w
ZW5CTUMgR1VJL1ZVReKAnSBmcm9tIERpeHNpZSBXb2xtZXJzIG9uIFRodXJzZGF5QCAxMC84ICgx
MEFNIFBEVCkuIEZvbGxvd2luZyBhcmUgdGhlIHNlc3Npb24gZGV0YWlscyBhbmQgYWxzbyBhdHRh
Y2hlZCBtZWV0aW5nIGludml0ZS4NCg0KDQpUb3BpYzogT3BlbkJNQzogR1VJL1Z1ZQ0KVGltZTog
T2N0IDgsIDIwMjAgMTA6MDAgQU0gUGFjaWZpYyBUaW1lIChVUyBhbmQgQ2FuYWRhKQ0KDQpKb2lu
IFpvb20gTWVldGluZw0KaHR0cHM6Ly91czAyd2ViLnpvb20udXMvai85Mzk2ODgwNDc2P3B3ZD1h
Mmd5WWtWcFJqaEJaRXRoUVVRemNFRjJRalJYVVQwOQ0KDQpNZWV0aW5nIElEOiA5MzkgNjg4IDA0
NzYNClBhc3Njb2RlOiBvcGVuYm1jDQpPbmUgdGFwIG1vYmlsZQ0KKzE2Njk5MDA5MTI4LCw5Mzk2
ODgwNDc2IywsLCwsLDAjLCw4NTkyNTE1IyBVUyAoU2FuIEpvc2UpDQorMTI1MzIxNTg3ODIsLDkz
OTY4ODA0NzYjLCwsLCwsMCMsLDg1OTI1MTUjIFVTIChUYWNvbWEpDQoNCkRpYWwgYnkgeW91ciBs
b2NhdGlvbg0KICAgICAgICArMSA2NjkgOTAwIDkxMjggVVMgKFNhbiBKb3NlKQ0KICAgICAgICAr
MSAyNTMgMjE1IDg3ODIgVVMgKFRhY29tYSkNCiAgICAgICAgKzEgMzQ2IDI0OCA3Nzk5IFVTIChI
b3VzdG9uKQ0KICAgICAgICArMSAzMDEgNzE1IDg1OTIgVVMgKEdlcm1hbnRvd24pDQogICAgICAg
ICsxIDMxMiA2MjYgNjc5OSBVUyAoQ2hpY2FnbykNCiAgICAgICAgKzEgNjQ2IDU1OCA4NjU2IFVT
IChOZXcgWW9yaykNCk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3Ng0KUGFzc2NvZGU6IDg1OTI1MTUN
CkZpbmQgeW91ciBsb2NhbCBudW1iZXI6IGh0dHBzOi8vdXMwMndlYi56b29tLnVzL3Uva2RkZlNw
QWtFag0KDQoNCg==

--_000_9EDCD78EA09548AA93BCBF73AD8BD533fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <3AFF1601457F704E93E3C47AE14FDB19@namprd15.prod.outlook.com>
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
bFN0eWxlMTkNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVs
dA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBw
YWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4w
aW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9
DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEi
IHZsaW5rPSJwdXJwbGUiIHN0eWxlPSJ3b3JkLXdyYXA6YnJlYWstd29yZCI+DQo8ZGl2IGNsYXNz
PSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+UXVpY2sgcmVtaW5kZXIgYWJv
dXQgdGhpcyB3ZWVr4oCZcyBsZWFybmluZyBzZXNzaW9uIOKAnE9wZW5CTUMgR1VJL1ZVReKAnSBm
cm9tIERpeHNpZSBXb2xtZXJzIG9uIFRodXJzZGF5QCAxMC84ICgxMEFNIFBEVCkuIEZvbGxvd2lu
ZyBhcmUgdGhlIHNlc3Npb24gZGV0YWlscyBhbmQgYWxzbyBhdHRhY2hlZCBtZWV0aW5nIGludml0
ZS48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5Ub3BpYzogT3BlbkJNQzogR1VJL1Z1ZTxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+VGltZTogT2N0IDgsIDIwMjAgMTA6MDAgQU0gUGFjaWZpYyBUaW1l
IChVUyBhbmQgQ2FuYWRhKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86
cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Kb2luIFpvb20gTWVldGlu
ZzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+aHR0cHM6Ly91czAyd2ViLnpv
b20udXMvai85Mzk2ODgwNDc2P3B3ZD1hMmd5WWtWcFJqaEJaRXRoUVVRemNFRjJRalJYVVQwOTxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5NZWV0aW5nIElEOiA5MzkgNjg4IDA0NzY8bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBhc3Njb2RlOiBvcGVuYm1jPG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbmUgdGFwIG1vYmlsZTxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+KzE2Njk5MDA5MTI4LCw5Mzk2ODgwNDc2IywsLCwsLDAjLCw4
NTkyNTE1IyBVUyAoU2FuIEpvc2UpPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij4rMTI1MzIxNTg3ODIsLDkzOTY4ODA0NzYjLCwsLCwsMCMsLDg1OTI1MTUjIFVTIChUYWNvbWEp
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkRpYWwgYnkgeW91ciBsb2NhdGlvbjxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7ICsxIDY2OSA5MDAgOTEyOCBVUyAoU2FuIEpvc2UpPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgKzEgMjUzIDIxNSA4NzgyIFVTIChUYWNvbWEpPG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgKzEgMzQ2IDI0OCA3Nzk5IFVTIChIb3VzdG9uKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICsx
IDMwMSA3MTUgODU5MiBVUyAoR2VybWFudG93bik8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyArMSAz
MTIgNjI2IDY3OTkgVVMgKENoaWNhZ28pPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKzEgNjQ2IDU1
OCA4NjU2IFVTIChOZXcgWW9yayk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
Pk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3NjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+UGFzc2NvZGU6IDg1OTI1MTU8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPkZpbmQgeW91ciBsb2NhbCBudW1iZXI6IGh0dHBzOi8vdXMwMndlYi56b29tLnVzL3Uva2Rk
ZlNwQWtFajxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwv
ZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_9EDCD78EA09548AA93BCBF73AD8BD533fbcom_--

--_004_9EDCD78EA09548AA93BCBF73AD8BD533fbcom_
Content-Type: text/calendar; name="meeting-GUI.ics"
Content-Description: meeting-GUI.ics
Content-Disposition: attachment; filename="meeting-GUI.ics"; size=1778;
	creation-date="Wed, 07 Oct 2020 15:53:40 GMT";
	modification-date="Wed, 07 Oct 2020 15:53:40 GMT"
Content-ID: <D9343E2EAE765A429AF6C076785BDE69@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vem9vbS51cy8vaUNhbGVuZGFyIEV2ZW50Ly9FTg0K
VkVSU0lPTjoyLjANCkNBTFNDQUxFOkdSRUdPUklBTg0KTUVUSE9EOlBVQkxJU0gNCkNMQVNTOlBV
QkxJQw0KQkVHSU46VlRJTUVaT05FDQpUWklEOkFtZXJpY2EvTG9zX0FuZ2VsZXMNClRaVVJMOmh0
dHA6Ly90enVybC5vcmcvem9uZWluZm8tb3V0bG9vay9BbWVyaWNhL0xvc19BbmdlbGVzDQpYLUxJ
Qy1MT0NBVElPTjpBbWVyaWNhL0xvc19BbmdlbGVzDQpCRUdJTjpEQVlMSUdIVA0KVFpPRkZTRVRG
Uk9NOi0wODAwDQpUWk9GRlNFVFRPOi0wNzAwDQpUWk5BTUU6UERUDQpEVFNUQVJUOjE5NzAwMzA4
VDAyMDAwMA0KUlJVTEU6RlJFUT1ZRUFSTFk7QllNT05USD0zO0JZREFZPTJTVQ0KRU5EOkRBWUxJ
R0hUDQpCRUdJTjpTVEFOREFSRA0KVFpPRkZTRVRGUk9NOi0wNzAwDQpUWk9GRlNFVFRPOi0wODAw
DQpUWk5BTUU6UFNUDQpEVFNUQVJUOjE5NzAxMTAxVDAyMDAwMA0KUlJVTEU6RlJFUT1ZRUFSTFk7
QllNT05USD0xMTtCWURBWT0xU1UNCkVORDpTVEFOREFSRA0KRU5EOlZUSU1FWk9ORQ0KQkVHSU46
VkVWRU5UDQpEVFNUQU1QOjIwMjAxMDA3VDE1NTAxMloNCkRUU1RBUlQ7VFpJRD1BbWVyaWNhL0xv
c19BbmdlbGVzOjIwMjAxMDA4VDEwMDAwMA0KRFRFTkQ7VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVz
OjIwMjAxMDA4VDExMDAwMA0KU1VNTUFSWTpPcGVuQk1DOiBHVUkvVnVlDQpVSUQ6MjAyMDEwMDdU
MTU1MDEyWi05Mzk2ODgwNDc2QGZlODA6MDowOjA6MTQ1Mjo1M2ZmOmZlMzg6OTBmOWVuczUNClRa
SUQ6QW1lcmljYS9Mb3NfQW5nZWxlcw0KREVTQ1JJUFRJT046U2FpIERhc2FyaSBpcyBpbnZpdGlu
ZyB5b3UgdG8gYSBzY2hlZHVsZWQgWm9vbSBtZWV0aW5nLlxuXG5Kbw0KIGluIFpvb20gTWVldGlu
Z1xuaHR0cHM6Ly91czAyd2ViLnpvb20udXMvai85Mzk2ODgwNDc2P3B3ZD1hMmd5WWtWcFJqaEJa
RQ0KIHRoUVVRemNFRjJRalJYVVQwOVxuXG5NZWV0aW5nIElEOiA5MzkgNjg4IDA0NzZcblBhc3Nj
b2RlOiBvcGVuYm1jXG5PbmUgdA0KIGFwIG1vYmlsZVxuKzE2Njk5MDA5MTI4XCxcLDkzOTY4ODA0
NzYjXCxcLFwsXCxcLFwsMCNcLFwsODU5MjUxNSMgVVMgKFNhbg0KICBKb3NlKVxuKzEyNTMyMTU4
NzgyXCxcLDkzOTY4ODA0NzYjXCxcLFwsXCxcLFwsMCNcLFwsODU5MjUxNSMgVVMgKFRhY29tYQ0K
IClcblxuRGlhbCBieSB5b3VyIGxvY2F0aW9uXG4gICAgICAgICsxIDY2OSA5MDAgOTEyOCBVUyAo
U2FuIEpvc2UpXG4gICAgIA0KICAgICsxIDI1MyAyMTUgODc4MiBVUyAoVGFjb21hKVxuICAgICAg
ICArMSAzNDYgMjQ4IDc3OTkgVVMgKEhvdXN0b24pXG4gIA0KICAgICAgICsxIDMwMSA3MTUgODU5
MiBVUyAoR2VybWFudG93bilcbiAgICAgICAgKzEgMzEyIDYyNiA2Nzk5IFVTIChDaGljYQ0KIGdv
KVxuICAgICAgICArMSA2NDYgNTU4IDg2NTYgVVMgKE5ldyBZb3JrKVxuTWVldGluZyBJRDogOTM5
IDY4OCAwNDc2XG5QYQ0KIHNzY29kZTogODU5MjUxNVxuRmluZCB5b3VyIGxvY2FsIG51bWJlcjog
aHR0cHM6Ly91czAyd2ViLnpvb20udXMvdS9rZGRmUw0KIHBBa0VqXG5cbg0KTE9DQVRJT046aHR0
cHM6Ly91czAyd2ViLnpvb20udXMvai85Mzk2ODgwNDc2P3B3ZD1hMmd5WWtWcFJqaEJaRXRoUVVR
emNFRg0KIDJRalJYVVQwOQ0KQkVHSU46VkFMQVJNDQpUUklHR0VSOi1QVDEwTQ0KQUNUSU9OOkRJ
U1BMQVkNCkRFU0NSSVBUSU9OOlJlbWluZGVyDQpFTkQ6VkFMQVJNDQpFTkQ6VkVWRU5UDQpFTkQ6
VkNBTEVOREFSDQo=

--_004_9EDCD78EA09548AA93BCBF73AD8BD533fbcom_--
