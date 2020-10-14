Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D628DA45
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 09:05:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB3MT5SX3zDqZQ
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 18:05:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=75569156a5=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=ZUp8iePU; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=HUAHoao4; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB3LX00wnzDqW0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 18:04:15 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E710rG014455
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 00:04:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=R18Ho1XFtqSVF6ScE01jSXn8gCMk0M/kc6N4TgM0rAU=;
 b=ZUp8iePUywDW5fUEPPMes+UZSoCy07L2JlJQdlgLflpdTf/yyrXWv2tcADjUBE4iya89
 6StobXy2cKhXH4IVYqNc0PcXg5TzttHId29x20EliH5RJPRwVCYmrt2FfYlXd5sucyuP
 lcqrqun76JNIIecicCkBB0caiW6llhVUypo= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 345pwshcm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 00:04:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 14 Oct 2020 00:04:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFI0POIOQUTizJeB8F0EgDzrsZ5eTXCcCtEPQiM8W8ruHbtV6+T4/XCqq77ebhufEWsJbGTrsM3Ksv9lbTEm5Qh+ORle3Tn/4r8fJETUl0TU/wo2/D49QH9sgqw2pUPhhcqA/2uG56lIyTsBvxDQmko51X5uroA6ffM9Y0j+Pz6jsdFex0JXuNwssIcxKoyAc0zVaSCHyBJJ1b5Zlzot4sKJ+R+b1AcGCfmouoi/lM3Sje5RH3up7rlTXAtJjw9wr5jiK38BTFFzzshk5XvttFWxiA/hpowsHYBfgTVZ+RZAey8D1/+YB4XMRJJK+E2nlk5WhogqvA75bgukLPdhmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R18Ho1XFtqSVF6ScE01jSXn8gCMk0M/kc6N4TgM0rAU=;
 b=PPDKTS5gHx7Z/iU7NiX3//MlHIRLAVNQwT1ay7PoUcuRUF64dyjrDIiika007fRQxJlMlZIC7p2YWADGXokk+t33w5DMWkaJPqKkvUfG7mfwzjbZR0Y1D5TK2cCAkwYPusIx+PCkJHe0VH7omZ9T+Kh8/1m+B1ruyOOtrfBismzmdAKpe7LvAIcIjqF7dHFsp4ervlwVmUMjDZ6Tsh49v/EpjQWNnL38xx15lSBsImb5Lla+U27n/9ZeA5PLI7/T0JevFg5GXHRAwp2Urd37XaaS48zQIEccr677R99jTol52CiGjicbGCchvgHdpB3sNYQp2ft0ndG2D/ThbKwQJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R18Ho1XFtqSVF6ScE01jSXn8gCMk0M/kc6N4TgM0rAU=;
 b=HUAHoao4FIzzTktilcw3Fu++HgVI4eq/Rsl0Aip/NFyunX02Chx8/KcCx5TzH5jQU0jVkwcNyRVuFmwBAmTvhFG3Z3CaHmdLD3TkY1l1aCU6iFzZ0zsreAEPuUWtCocvkNq1NpeLJnckhY2pZua00Wx0uApLL23GdX8rdaqUSmw=
Received: from BYAPR15MB3223.namprd15.prod.outlook.com (2603:10b6:a03:110::28)
 by BYAPR15MB2599.namprd15.prod.outlook.com (2603:10b6:a03:15a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Wed, 14 Oct
 2020 06:48:19 +0000
Received: from BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8]) by BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8%7]) with mapi id 15.20.3455.031; Wed, 14 Oct 2020
 06:48:19 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Learning Series
Thread-Topic: OpenBMC Learning Series
Thread-Index: AQHWdlCwHJzSAeOuJEOCEV5BbMCQvKlDLckAgAcppQCACtqLAIAB68aAgAkVIACAAcIFgIAIoUwAgAuQE4CACw4fgIAK7bAAgApn6wA=
Date: Wed, 14 Oct 2020 06:48:19 +0000
Message-ID: <B765ACF5-8DD7-4995-8D62-8634F5A80243@fb.com>
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
 <9EDCD78E-A095-48AA-93BC-BF73AD8BD533@fb.com>
In-Reply-To: <9EDCD78E-A095-48AA-93BC-BF73AD8BD533@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.41.20091302
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:640:102:8766:141e:75a7:d760:95f7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18a3dce8-f076-428f-e527-08d8700d22d4
x-ms-traffictypediagnostic: BYAPR15MB2599:
x-microsoft-antispam-prvs: <BYAPR15MB25992DC2DBEA2F64491BEEFDCE050@BYAPR15MB2599.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K/jBKYdbdH6ZCaz5WO3nJ+YsEhfyolVE/SXNfiov7G3c/5c7WGmpnMT1sqcuSKT0EU7+3XLNmflyCg4ctGqrBWCo1JXcfSABC6pRfrNKFX6hvnJw5p1644u84NrX58rNJFcJdEG33MzPrPS5+ZB9UZUm8zZmS/MWtodUr0ZO+HmDbwTRS4mxQH3IYrofCMgR4OupeYOz5Ev55++yMDXZIR62ih/Ruz3kHnQwJAqnd0OXh3ee2+DRNYwWlsEBGgemoXxuYKIr27+Mqk6dL1zuZ6bVenDD4jGe52064MH5lzr+WehT4ItGBHe2RM6ShAAktBaZHaNWrz9HUIK00EMjLj3kslgDCgYgjO97D1MvE/INB6XHn4Ixj5NrLl0/sxDvtgfGtTilD9SbQAKizaNYNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3223.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(136003)(346002)(376002)(366004)(6512007)(5660300002)(99936003)(33656002)(66616009)(66476007)(66556008)(64756008)(66446008)(4744005)(6916009)(7116003)(83080400001)(2906002)(2616005)(83380400001)(86362001)(6506007)(8676002)(316002)(3480700007)(36756003)(66946007)(76116006)(186003)(6486002)(71200400001)(478600001)(966005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: p3KY002L7qL0cffngE6fzWZx16IkLtp+IHOWPQWag1Qp3mmaq/VPK0GkdYFm4ST/IE60NVcjoLFjfegExi2LwR9exX5S4mtS2FlQZk9VDmisr9Zp06awIqBLafOEdtXdYcCO4uBuwiJdUmzRFV4l76Tsnt9FfD8HMJ3c6n2vSPePcMC5b11aSigwCvNHlyuVSzHFmR2V3if++cJyGxu/ANoqH8ROzI835ApkEbIFKNPFs5/Q69gz8XGTDr+ARCWLg1TdF9RaHOH5WebgqBeBsqp6xwP4ElKxwH+rNnt9FUL5FzVd8Ml1MQ+8S1JjAtgpFgKXk896dCV9YAp3Qekl8+eoiwFuZQvVGVdl7h0X1yEKFjHZ2IOiFLJgZdUoep8qqP/+mHmjJGCnFIToGv53s4zqt1sp2MhE466RLJqHRcCPnapbvKVT51Rn69owv2KlUEhk7vNeV4mmUKvKxkCQrz4E+CGi1pD3wjXPkjJ46kbWuRyxRDgGsu9xs8nBYpiwsfK8c/Jf9HB8DOLsyQ3aMOE7PWivp56aR9ATWruAGcR3yH49pwzHM0Tt/aIsK/SgVIj1s9ouYfheMzC35beJwyW/bvawH3BztJwqPJXa0ntoZULS8EdHLGvc+uTC+DMR8u2wvSJ8QRkDWMhH8OC5pmcau3mTcDHuQlx3nFGY0rAvB+OdDa8BlFaK6fCdmQ3POYdW34BpHpNQ/43jX3Micg==
x-ms-exchange-transport-forked: True
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3223.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a3dce8-f076-428f-e527-08d8700d22d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 06:48:19.2699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hI6Nc110QjpiSyIApHbwT4yk81wSYqybGjIfhatjatwQwmq3T5l83YqOkVHofz4g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2599
X-OriginatorOrg: fb.com
Content-Type: multipart/mixed;
 boundary="_004_B765ACF58DD749958D628634F5A80243fbcom_"
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_03:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 adultscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140048
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

--_004_B765ACF58DD749958D628634F5A80243fbcom_
Content-Type: multipart/alternative;
	boundary="_000_B765ACF58DD749958D628634F5A80243fbcom_"

--_000_B765ACF58DD749958D628634F5A80243fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UXVpY2sgcmVtaW5kZXIgYWJvdXQgdGhpcyB3ZWVr4oCZcyBsZWFybmluZyBzZXNzaW9uIOKAnFJl
ZGZpc2ggRXZlbnQgTG9ncy9TZXJ2aWNl4oCdIGZyb20gQXBwYXJhbyBQdWxpIG9uIFRodXJzZGF5
QDEwQU0gKElTVCkuIEZvbGxvd2luZyBhcmUgdGhlIHNlc3Npb24gZGV0YWlscyBhbmQgYWxzbyBh
dHRhY2hlZCBtZWV0aW5nIGludml0ZS4NCg0KDQpUb3BpYzogT3BlbkJNQzogUmVkZmlzaCBFdmVu
dCBMb2dzL1NlcnZpY2UNClRpbWU6IE9jdCAxNSwgMjAyMCAxMDowMCBBTSBJbmRpYQ0KDQpKb2lu
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
QWtFag0KDQo=

--_000_B765ACF58DD749958D628634F5A80243fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2A1CA1531001DA4FA05270FE3FC80531@namprd15.prod.outlook.com>
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
IHZsaW5rPSIjOTU0RjcyIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFz
cz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlF1aWNrIHJlbWluZGVyIGFi
b3V0IHRoaXMgd2Vla+KAmXMgbGVhcm5pbmcgc2Vzc2lvbiDigJxSZWRmaXNoIEV2ZW50IExvZ3Mv
U2VydmljZeKAnSBmcm9tIEFwcGFyYW8gUHVsaSBvbiBUaHVyc2RheUAxMEFNICg8Yj5JU1Q8L2I+
KS4gRm9sbG93aW5nIGFyZSB0aGUgc2Vzc2lvbiBkZXRhaWxzIGFuZCBhbHNvIGF0dGFjaGVkIG1l
ZXRpbmcgaW52aXRlLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRvcGljOiBPcGVuQk1DOiBSZWRmaXNoIEV2ZW50IExv
Z3MvU2VydmljZTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGltZTogT2N0
IDE1LCAyMDIwIDEwOjAwIEFNIEluZGlhPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkpvaW4gWm9v
bSBNZWV0aW5nPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5odHRwczovL3Vz
MDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdkPWEyZ3lZa1ZwUmpoQlpFdGhRVVF6Y0VGMlFq
UlhVVDA5PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3Njxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+UGFzc2NvZGU6IG9wZW5ibWM8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uZSB0YXAgbW9iaWxlPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4rMTY2OTkwMDkxMjgsLDkzOTY4ODA0NzYjLCws
LCwsMCMsLDg1OTI1MTUjIFVTIChTYW4gSm9zZSk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPisxMjUzMjE1ODc4MiwsOTM5Njg4MDQ3NiMsLCwsLCwwIywsODU5MjUxNSMgVVMg
KFRhY29tYSk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+RGlhbCBieSB5b3VyIGxvY2F0aW9uPG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgKzEgNjY5IDkwMCA5MTI4IFVTIChTYW4gSm9zZSk8bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyArMSAyNTMgMjE1IDg3ODIgVVMgKFRhY29tYSk8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyArMSAzNDYgMjQ4IDc3OTkgVVMgKEhvdXN0b24pPG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgKzEgMzAxIDcxNSA4NTkyIFVTIChHZXJtYW50b3duKTxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7ICsxIDMxMiA2MjYgNjc5OSBVUyAoQ2hpY2Fnbyk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAr
MSA2NDYgNTU4IDg2NTYgVVMgKE5ldyBZb3JrKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+TWVldGluZyBJRDogOTM5IDY4OCAwNDc2PG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5QYXNzY29kZTogODU5MjUxNTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+RmluZCB5b3VyIGxvY2FsIG51bWJlcjogaHR0cHM6Ly91czAyd2ViLnpvb20u
dXMvdS9rZGRmU3BBa0VqPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpw
PiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_B765ACF58DD749958D628634F5A80243fbcom_--

--_004_B765ACF58DD749958D628634F5A80243fbcom_
Content-Type: text/calendar; name="meeting-RedfishLogs.ics"
Content-Description: meeting-RedfishLogs.ics
Content-Disposition: attachment; filename="meeting-RedfishLogs.ics";
	size=1569; creation-date="Wed, 14 Oct 2020 06:48:18 GMT";
	modification-date="Wed, 14 Oct 2020 06:48:18 GMT"
Content-ID: <72D7994D1456FD49A7D82FD1F494C652@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vem9vbS51cy8vaUNhbGVuZGFyIEV2ZW50Ly9FTg0K
VkVSU0lPTjoyLjANCkNBTFNDQUxFOkdSRUdPUklBTg0KTUVUSE9EOlBVQkxJU0gNCkNMQVNTOlBV
QkxJQw0KQkVHSU46VlRJTUVaT05FDQpUWklEOkFzaWEvS29sa2F0YQ0KVFpVUkw6aHR0cDovL3R6
dXJsLm9yZy96b25laW5mby1vdXRsb29rL0FzaWEvS29sa2F0YQ0KWC1MSUMtTE9DQVRJT046QXNp
YS9Lb2xrYXRhDQpCRUdJTjpTVEFOREFSRA0KVFpPRkZTRVRGUk9NOiswNTMwDQpUWk9GRlNFVFRP
OiswNTMwDQpUWk5BTUU6SVNUDQpEVFNUQVJUOjE5NzAwMTAxVDAwMDAwMA0KRU5EOlNUQU5EQVJE
DQpFTkQ6VlRJTUVaT05FDQpCRUdJTjpWRVZFTlQNCkRUU1RBTVA6MjAyMDEwMTRUMDY0MzQ5Wg0K
RFRTVEFSVDtUWklEPUFzaWEvS29sa2F0YToyMDIwMTAxNVQxMDAwMDANCkRURU5EO1RaSUQ9QXNp
YS9Lb2xrYXRhOjIwMjAxMDE1VDExMDAwMA0KU1VNTUFSWTpPcGVuQk1DOiBSZWRmaXNoIEV2ZW50
IExvZ3MvU2VydmljZQ0KVUlEOjIwMjAxMDE0VDA2NDM1MFotOTM5Njg4MDQ3NkBmZTgwOjA6MDow
OjFlOmRlZmY6ZmU1OTo5MDQwZW5zNQ0KVFpJRDpBc2lhL0tvbGthdGENCkRFU0NSSVBUSU9OOlNh
aSBEYXNhcmkgaXMgaW52aXRpbmcgeW91IHRvIGEgc2NoZWR1bGVkIFpvb20gbWVldGluZy5cblxu
Sm8NCiBpbiBab29tIE1lZXRpbmdcbmh0dHBzOi8vdXMwMndlYi56b29tLnVzL2ovOTM5Njg4MDQ3
Nj9wd2Q9YTJneVlrVnBSamhCWkUNCiB0aFFVUXpjRUYyUWpSWFVUMDlcblxuTWVldGluZyBJRDog
OTM5IDY4OCAwNDc2XG5QYXNzY29kZTogb3BlbmJtY1xuT25lIHQNCiBhcCBtb2JpbGVcbisxNjY5
OTAwOTEyOFwsXCw5Mzk2ODgwNDc2I1wsXCxcLFwsXCxcLDAjXCxcLDg1OTI1MTUjIFVTIChTYW4N
CiAgSm9zZSlcbisxMjUzMjE1ODc4MlwsXCw5Mzk2ODgwNDc2I1wsXCxcLFwsXCxcLDAjXCxcLDg1
OTI1MTUjIFVTIChUYWNvbWENCiApXG5cbkRpYWwgYnkgeW91ciBsb2NhdGlvblxuICAgICAgICAr
MSA2NjkgOTAwIDkxMjggVVMgKFNhbiBKb3NlKVxuICAgICANCiAgICArMSAyNTMgMjE1IDg3ODIg
VVMgKFRhY29tYSlcbiAgICAgICAgKzEgMzQ2IDI0OCA3Nzk5IFVTIChIb3VzdG9uKVxuICANCiAg
ICAgICArMSAzMDEgNzE1IDg1OTIgVVMgKEdlcm1hbnRvd24pXG4gICAgICAgICsxIDMxMiA2MjYg
Njc5OSBVUyAoQ2hpY2ENCiBnbylcbiAgICAgICAgKzEgNjQ2IDU1OCA4NjU2IFVTIChOZXcgWW9y
aylcbk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3NlxuUGENCiBzc2NvZGU6IDg1OTI1MTVcbkZpbmQg
eW91ciBsb2NhbCBudW1iZXI6IGh0dHBzOi8vdXMwMndlYi56b29tLnVzL3Uva2RkZlMNCiBwQWtF
alxuXG4NCkxPQ0FUSU9OOmh0dHBzOi8vdXMwMndlYi56b29tLnVzL2ovOTM5Njg4MDQ3Nj9wd2Q9
YTJneVlrVnBSamhCWkV0aFFVUXpjRUYNCiAyUWpSWFVUMDkNCkJFR0lOOlZBTEFSTQ0KVFJJR0dF
UjotUFQxME0NCkFDVElPTjpESVNQTEFZDQpERVNDUklQVElPTjpSZW1pbmRlcg0KRU5EOlZBTEFS
TQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K

--_004_B765ACF58DD749958D628634F5A80243fbcom_--
