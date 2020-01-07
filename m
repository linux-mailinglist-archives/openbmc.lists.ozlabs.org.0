Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86063131CC8
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 01:30:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sCvT4RzbzDqS7
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 11:30:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8275cdec92=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="fQC9a/1h"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="PXQYhRXi"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sCtd2kBgzDqRh
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 11:29:27 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0070MbTL031422; Mon, 6 Jan 2020 16:29:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=lX7J5M9oaoXJRqia/2Y5T8qYRvEqV6wlX36rQq9O38E=;
 b=fQC9a/1hv1tEX9sVKVGIVefJCZPvMMNBITO3iOjjma+3a7vJAL9ZKqDDHIVcnd6spgq/
 k1nLNvaebTXnMjwPfRmmCOnbIRB/IjY7NeJei7fVPw8wgmYBO9TkKsViaBwepKnuOD7K
 6yNjx5szsJ/ja5FL0wN9vPsB1f5gKzVu+Cc= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 2xbbb1rn8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 06 Jan 2020 16:29:24 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 6 Jan 2020 16:29:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUO1/6j3k8587Ssn++PSjkIts4f2iL7bW6YyvZWZ7xsiHCaPDuG+L6uS6Lf+z6ay1dNy5a557Jpc8XaGh5hixca4n19uTZW/3L1mMVoSURBRm4PwCuFgwO6EKWpxmvdFoOin9m86yV9uvD8ZKOpxQIXDqg8xf+6HQ5TDS3oaKD65CLeYEzO5Fl8pT7CuhR1IP8t3heJ1KMmJSbWF69jN7owY1PqDY0NjJW9IviLYFPWi6SLoJkDYdJDPi9OlkckAgtjkMbXEplOV+uhB7PNhbtMth/ztTftTjGmNp5XLYjlAAm/2qLeMeyOurZDnSkhbxbQ4JNpivNKmsn5VkHVfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX7J5M9oaoXJRqia/2Y5T8qYRvEqV6wlX36rQq9O38E=;
 b=TVhRftaxQ5E3nY/+3HQTfVQLgIHa5WGMUDcIrO21o92zF6Pue9OicyWIOtsVoyndydS+29s28tsW+vscWv9EI2sDC1GSyMvlcSRojL9Sp6T9rQDRxc9GZVyfyUK4Fw2zgbpQGbsN89e1P9/UYNe5PbHPVFFmHAJ0Z9EH07Jkxe51l6VmCfJ+hS8Aaw2eYcgqHbVORpDGP1hzoBy4FNODVTX/sHettsWUkoTBv31ZJ/yMO5DOHJpV4KRfoUR1V7ZeU81R7eJ4j9g/hQO1/jbMFTwGzXCpffqst/Qvu9K4qljWYAi7flAtLnoEc43AbYZovsZNOWHsHuuCMDDmGcH3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX7J5M9oaoXJRqia/2Y5T8qYRvEqV6wlX36rQq9O38E=;
 b=PXQYhRXi4IYoks1o61cCwxBY2Rlz++AIGFSDZ/Ldo2JWynija21YLEbp7truEC9CQXfWNmWLq54aQPvej0sfKv4j13IiRTTJT7/Ox+L0bvyndFKb26edXbSNBhnWcQPO7KyygSBtkGkUKW4DJRerMepkRznGlFbSPg+Hnm6Hx7Y=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1725.namprd15.prod.outlook.com (10.174.255.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Tue, 7 Jan 2020 00:29:09 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2602.015; Tue, 7 Jan 2020
 00:29:09 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: webui not working for me
Thread-Topic: webui not working for me
Thread-Index: AQHVwp+iARalw1g7X0WpTmm06cK1kqfdIe6AgABhfACAANBLAP//gSIAgACHeID//3tIAA==
Date: Tue, 7 Jan 2020 00:29:09 +0000
Message-ID: <D4297867-C2F9-448D-887E-032C1EF5B871@fb.com>
References: <41D87A5C-8EBF-4DA2-9E1E-A37D51A4CA72@fb.com>
 <a009631a-efec-2e14-6871-b8618ffb4b96@linux.vnet.ibm.com>
 <E008BED2-5B56-4946-BD37-1F6928AE60BE@fb.com>
 <1bec6eda-be49-e9b7-2ba3-f1ec5d4d89e8@linux.vnet.ibm.com>
 <FF4567F9-FA73-4076-AD9E-67C0237F4521@fb.com>
 <e100a34f-0335-d557-7e83-ebae9338b02f@linux.vnet.ibm.com>
In-Reply-To: <e100a34f-0335-d557-7e83-ebae9338b02f@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:889a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a71a06f8-2e0b-411f-783d-08d793089cc0
x-ms-traffictypediagnostic: MWHPR15MB1725:
x-microsoft-antispam-prvs: <MWHPR15MB1725D19182ED38C7FF360CC3DD3F0@MWHPR15MB1725.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(396003)(39860400002)(366004)(189003)(199004)(110136005)(8936002)(6512007)(6506007)(53546011)(36756003)(76116006)(66556008)(66946007)(2616005)(6486002)(64756008)(71200400001)(81166006)(8676002)(66446008)(66476007)(81156014)(478600001)(316002)(86362001)(66574012)(966005)(2906002)(186003)(33656002)(4744005)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1725;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fx/CEpMhdCsZwXTkWKu0/ygFDGdXweWpmBXlQYs865cL3LPXOQ4dIIFtIA0OJDkkK8rN5eU/cuFbC2N6WOznUFpsM3GHxMmCvA0tnsijBZ7OrqjJn592fyKy0zaW9PGYjxyH4oWBcNgqll2CkVOLQeNs/6wBGlFplF8NJYbx+TToR4vjJKCu6GaNv3YJODle9fVgXLlu1tFbR3RC+dr0q3AgNNGq/xbdwokF0YQ57Pz9J2EBUvKEOi/r/lqj4j5yLep1Yp6tJmcPqOydQJvQtvHd6Rl3G/psZzoTb1sD/FT8P5jV+eInpyuwAcFwkB5mYuPbCnaHZSeLgKwV0ge9pUlSLw1QGiPDDuf4L+ritAnV3ndldWdiwVF1Ms9ND7lkXIJsbuTKkkkQSbTahAsc+us1YxbNeHh1ko5JGbVbYTAOgupjjKCjheSJ8rA+KiPdn5vXNCIxBzWomjuw5L4yrP7IjSnzFpK+/mVl86kI00M=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_D4297867C2F9448D887E032C1EF5B871fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a71a06f8-2e0b-411f-783d-08d793089cc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 00:29:09.4025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Nq8ykZqB7g4519i1AumsQWOpXUap65c5aLSmQHIZuf07o6QCaMwAi8/W0cUQ64uh23F61kxv0P77f6Cx7TTOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1725
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_08:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 mlxlogscore=999 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070001
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

--_000_D4297867C2F9448D887E032C1EF5B871fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpGcm9tOiBHdW5uYXIgTWlsbHMgPGdtaWxsc0BsaW51eC52bmV0LmlibS5jb20+DQpEYXRlOiBN
b25kYXksIEphbnVhcnkgNiwgMjAyMCBhdCA0OjI0IFBNDQpUbzogVmlqYXkgS2hlbWthIDx2aWph
eWtoZW1rYUBmYi5jb20+LCAib3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiA8b3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IHdlYnVpIG5vdCB3b3JraW5nIGZvciBtZQ0KDQoN
Cg0KT24gMS82LzIwMjAgNjoxOSBQTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KWWVzLCBJIGFtIGFi
bGUgdG8gZ2V0IGl0IGJ1dCBJIGNhbuKAmXQgc2VlIGFueSBzZW5zb3JzIG9yLCBldmVudCBsb2dz
IGFzIHdlbGwgYXMgc3lzdGVtIGxvZ3MuIEkgZGlzY3Vzc2VkIHdpdGggS2F0aHkgYW5kIGl0IHNl
ZW1zIHNoZSBoYXMgZGlmZmVyZW50IHBhdGNoIGZvciBzZW5zb3JzIHRvIHdvcmsgZnJvbSBpbnRl
bC1ibWMgYnJhbmNoLiBCdXQgdGhhdCBwYXRjaCBkb2VzbuKAmXQgc2VlbSB0byBhcHBseSBpbiB0
aGlzIHVwc3RyZWFtIHJlcG8uDQoNCkRvIHlvdSBoYXZlIGFueSBpZGVhcyB3aGF0IGNvdWxkIGJl
IHdyb25nIHdpdGggc2Vuc29ycy4gSSBhbSB1c2luZyBkYnVzLXNlbnNvcnMuDQoNCkFueXRoaW5n
IGluIHRoZSBicm93c2VyIGNvbnNvbGU/DQoNCkl0IHNheXMgb24gcGFnZSDigJx0aGVyZSBhcmUg
bm8gc2Vuc29ycyBhdmFpbGFibGXigJ0NCg0KDQpUaGUgc2Vuc29ycyBwYWdlIGlzIG1ha2luZyBh
IGNhbGwgdG8gYC94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvZW51bWVyYXRlYA0KaHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3Itd2VidWkvYmxvYi9mNzBmNDI1NTM2MTU5NzIx
NjNiMzZjOWI0ZDc3YmUwN2U0Mzk5MTIyL2FwcC9jb21tb24vc2VydmljZXMvYXBpLXV0aWxzLmpz
I0w5MTYNCg==

--_000_D4297867C2F9448D887E032C1EF5B871fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <AC66D1BEDE02B44F8F5BFD487C158F56@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5Ok1lbmxvOw0K
CXBhbm9zZS0xOjIgMTEgNiA5IDMgOCA0IDIgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICov
DQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47
DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXtt
c28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjNDMTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28t
c3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Izk1NEY3MjsNCgl0ZXh0LWRlY29yYXRpb246dW5k
ZXJsaW5lO30NCnAuTXNvTGlzdFBhcmFncmFwaCwgbGkuTXNvTGlzdFBhcmFncmFwaCwgZGl2Lk1z
b0xpc3RQYXJhZ3JhcGgNCgl7bXNvLXN0eWxlLXByaW9yaXR5OjM0Ow0KCW1hcmdpbi10b3A6MGlu
Ow0KCW1hcmdpbi1yaWdodDowaW47DQoJbWFyZ2luLWJvdHRvbTowaW47DQoJbWFyZ2luLWxlZnQ6
LjVpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250
LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpwLm1zb25vcm1hbDAsIGxpLm1zb25vcm1h
bDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1uYW1lOm1zb25vcm1hbDsNCgltc28tbWFy
Z2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6MGluOw0KCW1zby1tYXJnaW4tYm90dG9t
LWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnAucDEsIGxpLnAxLCBkaXYucDENCgl7bXNv
LXN0eWxlLW5hbWU6cDE7DQoJbWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjguNXB0Ow0KCWZvbnQtZmFtaWx5Ok1lbmxvOw0KCWNvbG9yOmJsYWNrO30NCnAu
cDIsIGxpLnAyLCBkaXYucDINCgl7bXNvLXN0eWxlLW5hbWU6cDI7DQoJbWFyZ2luOjBpbjsNCglt
YXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjguNXB0Ow0KCWZvbnQtZmFtaWx5Ok1l
bmxvOw0KCWNvbG9yOmJsYWNrO30NCnNwYW4uRW1haWxTdHlsZTIyDQoJe21zby1zdHlsZS10eXBl
OnBlcnNvbmFsOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndp
bmRvd3RleHQ7fQ0Kc3Bhbi5zMQ0KCXttc28tc3R5bGUtbmFtZTpzMTsNCgljb2xvcjojQjJCMkIy
Ow0KCWJhY2tncm91bmQ6YmxhY2s7fQ0Kc3Bhbi5zMw0KCXttc28tc3R5bGUtbmFtZTpzMzsNCgli
YWNrZ3JvdW5kOiM4NzhBMDQ7fQ0Kc3Bhbi5zNA0KCXttc28tc3R5bGUtbmFtZTpzNDsNCgljb2xv
cjojRUJFRjE4O30NCnNwYW4uczINCgl7bXNvLXN0eWxlLW5hbWU6czI7fQ0Kc3Bhbi5hcHBsZS1j
b252ZXJ0ZWQtc3BhY2UNCgl7bXNvLXN0eWxlLW5hbWU6YXBwbGUtY29udmVydGVkLXNwYWNlO30N
CnNwYW4uRW1haWxTdHlsZTI4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsOw0KCWZvbnQtZmFt
aWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0Kc3Bhbi5FbWFp
bFN0eWxlMjkNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWw7DQoJZm9udC1mYW1pbHk6IkNhbGli
cmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQpzcGFuLnBsLXMNCgl7bXNvLXN0
eWxlLW5hbWU6cGwtczt9DQpzcGFuLnBsLXBkcw0KCXttc28tc3R5bGUtbmFtZTpwbC1wZHM7fQ0K
c3Bhbi5FbWFpbFN0eWxlMzINCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9u
dC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNv
Q2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAu
MHB0O30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46
MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRT
ZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9
IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4m
bmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRv
cDpzb2xpZCAjQjVDNERGIDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5Gcm9tOiA8L3NwYW4+
PC9iPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+R3VubmFyIE1pbGxzICZsdDtnbWlsbHNAbGlu
dXgudm5ldC5pYm0uY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5Nb25kYXksIEphbnVhcnkgNiwg
MjAyMCBhdCA0OjI0IFBNPGJyPg0KPGI+VG86IDwvYj5WaWpheSBLaGVta2EgJmx0O3ZpamF5a2hl
bWthQGZiLmNvbSZndDssICZxdW90O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZxdW90OyAmbHQ7
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5SZTogd2Vi
dWkgbm90IHdvcmtpbmcgZm9yIG1lPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPHA+PG86cD4mbmJzcDs8L286cD48
L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T24gMS82LzIwMjAgNjoxOSBQTSwgVmlq
YXkgS2hlbWthIHdyb3RlOjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8YmxvY2txdW90ZSBzdHls
ZT0ibWFyZ2luLXRvcDo1LjBwdDttYXJnaW4tYm90dG9tOjUuMHB0Ij4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5ZZXMsIEkgYW0gYWJsZSB0byBn
ZXQgaXQgYnV0IEkgY2Fu4oCZdCBzZWUgYW55IHNlbnNvcnMgb3IsIGV2ZW50IGxvZ3MgYXMgd2Vs
bCBhcyBzeXN0ZW0gbG9ncy4gSSBkaXNjdXNzZWQgd2l0aCBLYXRoeSBhbmQgaXQgc2VlbXMgc2hl
IGhhcyBkaWZmZXJlbnQgcGF0Y2ggZm9yIHNlbnNvcnMgdG8gd29yayBmcm9tIGludGVsLWJtYyBi
cmFuY2guIEJ1dCB0aGF0IHBhdGNoDQogZG9lc27igJl0IHNlZW0gdG8gYXBwbHkgaW4gdGhpcyB1
cHN0cmVhbSByZXBvLjwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4mbmJzcDs8L3NwYW4+PG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
RG8geW91IGhhdmUgYW55IGlkZWFzIHdoYXQgY291bGQgYmUgd3Jvbmcgd2l0aCBzZW5zb3JzLiBJ
IGFtIHVzaW5nIGRidXMtc2Vuc29ycy48L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Jm5ic3A7PC9zcGFuPjxv
OnA+PC9vOnA+PC9wPg0KPC9ibG9ja3F1b3RlPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5Bbnl0aGluZyBpbiB0aGUgYnJvd3NlciBj
b25zb2xlPw0KPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JdCBz
YXlzIG9uIHBhZ2Ug4oCcdGhlcmUgYXJlIG5vIHNlbnNvcnMgYXZhaWxhYmxl4oCdPG86cD48L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMS4wcHQiPjxicj4NCjxicj4NClRoZSBzZW5zb3JzIHBhZ2UgaXMgbWFraW5nIGEgY2FsbCB0
byBgPHNwYW4gY2xhc3M9InBsLXMiPi94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvZW51bWVy
YXRlPC9zcGFuPmA8YnI+DQo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9z
cGhvci13ZWJ1aS9ibG9iL2Y3MGY0MjU1MzYxNTk3MjE2M2IzNmM5YjRkNzdiZTA3ZTQzOTkxMjIv
YXBwL2NvbW1vbi9zZXJ2aWNlcy9hcGktdXRpbHMuanMjTDkxNiI+aHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvcGhvc3Bob3Itd2VidWkvYmxvYi9mNzBmNDI1NTM2MTU5NzIxNjNiMzZjOWI0ZDc3
YmUwN2U0Mzk5MTIyL2FwcC9jb21tb24vc2VydmljZXMvYXBpLXV0aWxzLmpzI0w5MTY8L2E+PG86
cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_D4297867C2F9448D887E032C1EF5B871fbcom_--
