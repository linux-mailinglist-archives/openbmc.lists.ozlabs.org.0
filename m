Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9C29D106
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 17:40:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLvSw4pGZzDqTQ
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 03:40:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8570b325fc=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=HGhwjPQM; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=h5NMcwBM; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLvS01LlrzDqSl
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 03:39:39 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SGab87007230
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 09:39:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=7PIYO0mmwfL1S4FHRrw78HyRw9tYtALBVDl4o5hDVc8=;
 b=HGhwjPQMbED90HSqrwzIolXbRv5urmNqBlsnw4kHt3YaqS9tqg+KLeHoJKghgDo/IA9z
 OzVZM8DowxCOKxgOqv5O1P0hf2QyWfiSmOoyi52r7yqwxw4rLWEWDlgpGcAjrEqbXB2j
 qK3YKSIIDahSAtGJNE9GIGP3CVhjZRW5FpM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 34f0qbu8gg-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 09:39:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 28 Oct 2020 09:39:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRBWcz+IIowlZwAB4hWa9GbKMqYl4GA79rBq3t2edpXIHsxsVkzaB8yh/pGgy4chIjetRTcPf1FPKKZckwVw2fBOQ9kuLOBK4M9Kx4YiUKD8QLAhH2SrkAN0RMp89/w4kAIoqhV/FAmgQrWtZpqKotVlBuV+fQI7FHUOop78NMvUUjA2j1xsKkwJbZbqjr6wqTowvyzYP4uV9QgXJrj2Qi2Zo0m9jakkEGIdV4v3RBNO80s6mpWbJ/YDuiMf5GkvQ6FISlqlOpRpG1mnP+hNgVCEfjz1tGs0EXBa25NpL/vk5YkBnnIILZ5LG7xEOi8th0uZx/JE9Nx1LEoUCYSOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PIYO0mmwfL1S4FHRrw78HyRw9tYtALBVDl4o5hDVc8=;
 b=RK0qWpbX6UkxQLfNIFPQ0llRnhEmr3JzIIXuo1sGxakCMGM88JLbmCuwvTTr64RtP224tbIedejeekn0DFwLwSVwReDNnAXC+xgFbK58t8WjEhnjPwaUUc5mf4TYd5mhh+p9MBPDzaU2GFfOYcla1EOGg0tfG6LZsm7xnQiqPYLn6xtnSgLseT6tNYBRBC4pB14X91raz1eZ6J+UkXuaXiW03jGcZXmyX+uKEsuPyMsG2vN252skLsVhd8s6Ei/qZrRZ4ZoWUBi1lZjwFhYJz1CBxO20B9JbJi6AHEUeUPiVFQYrHBnFNEot/v9AwwqMDlPeUgeDpINaNnBUfmGx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PIYO0mmwfL1S4FHRrw78HyRw9tYtALBVDl4o5hDVc8=;
 b=h5NMcwBM29oKvPfNmwbTs2grYlGWldJi+JlmP8DyI/jNeMfjMsDc6zHgB9xTNF0flqHrOFL27XJJ5NdE7LG2Zi67rqZA1GFEntNK5BFruE8ttJP8wu1/WJlycWYV6ruyHCEqBZIRvMjOlBta4Y/54MqHs3vC+WZrYjpm36WVMkE=
Received: from BYAPR15MB3223.namprd15.prod.outlook.com (2603:10b6:a03:110::28)
 by BYAPR15MB2213.namprd15.prod.outlook.com (2603:10b6:a02:85::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 28 Oct
 2020 16:39:33 +0000
Received: from BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8]) by BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 16:39:33 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Learning Series
Thread-Topic: OpenBMC Learning Series
Thread-Index: AQHWdlCwHJzSAeOuJEOCEV5BbMCQvKlDLckAgAcppQCACtqLAIAB68aAgAkVIACAAcIFgIAIoUwAgAuQE4CACw4fgIAK7bAAgApn6wCACrH/AIAL89oA
Date: Wed, 28 Oct 2020 16:39:32 +0000
Message-ID: <69F5B6C0-60A7-4D5D-A841-AB4CE7E9AD2D@fb.com>
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
 <B765ACF5-8DD7-4995-8D62-8634F5A80243@fb.com>
 <091D0CE7-1D69-448E-8C82-C2EBA1DABF27@fb.com>
In-Reply-To: <091D0CE7-1D69-448E-8C82-C2EBA1DABF27@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.42.20101102
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:640:102:78cc:74:911e:35bc:9808]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb1affce-79f5-4b7c-b5d3-08d87b600cd3
x-ms-traffictypediagnostic: BYAPR15MB2213:
x-microsoft-antispam-prvs: <BYAPR15MB221392D12660E62A6E49C6CFCE170@BYAPR15MB2213.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:257;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1vou47peKyudYDKbQU4+zX8I7W9LO5XzBPgZtJb7+tr1i3U4u+PDOTu7+v566scPmPuvVvKX6GEyC5cDNmUFahjEK4IE1VHknN0rrJCVYT1ulp9itJcDUKF7SKReEB61uGFhxgqDnB6xouRCLl+6wKp4sOt2tKIJT/borUfcLDAUdHbbeXlstgPWU/py+HQFNw53SNe1WLOi4gFsGBFSrFBLEDuBYhdxaWcMjdVaJFX4VRQ7whU9JiwDWGDMy7B+Hl8mLhKHEb94uJobVYcRbFQRyG7rbrxDbRR5VrYiuHaFLN4GxTcETrnqjISXXH3LAa53gBw53vT2lBILzW5WZuXFx6iDLrFJveNkqoXfj+TLqBsiCCKHUxbJOIcz4HcGtit3XZssCgXdTOCYQDJcYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3223.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(396003)(366004)(39860400002)(2906002)(6512007)(6916009)(64756008)(66476007)(66946007)(66556008)(186003)(66616009)(91956017)(6506007)(66446008)(76116006)(966005)(33656002)(478600001)(86362001)(6486002)(36756003)(7116003)(71200400001)(83380400001)(99936003)(2616005)(5660300002)(316002)(8676002)(4744005)(3480700007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MEY2Qpx4opdAti11+Rx+WgN1JBDCKdGHGSqq8rrGmjKRJKEU/79GcfR9dSOX+DjFE3JD49KsxPew1a6HZ9V2ebg7BDRS5OhKsS8LD7kTt/XCiSnV4aQsrTfdjkgQiSXN9uQyrCwbmKBqLM8PUUSrVDCIc7P4fesRL2rHGttn8ZjxCCD+6vgXtc/kp2bPD1tYjSO04BZgweTsvFaw2VfL9eZGai56vYZK40ydz2e91nQcsWTM4NkwLiqvE/RCsVvXEiDFdrSCsrE5ik6SUGpW8BCUwJv3+8P5uYJMYTVPvAOujuW8UH1EAzPz8huzQYlqVN0AjTLI4kFkkjjTzeuf4/KaXm/j/o1A0UZG8ObdTXZz7P3fhME1Olfpg36ovlSNEWpKwp5ID6+6eb0y/MbM4rC9ztSjqTOptifMGfk6z9iG3g53jhInGtE8JMpmMWoYQQm6KUJEJ9T9njPFZKJ36jYNjqVE+YH52UdKyV8YcRcBqakGab78a13XJB5wYeWIZhqdCS07mT1rH6myB+SMolBGRVO27F/ohj/mjPtpWcdWaq4Ywv4YHhBbDeMBrmbAsTUtwNBLabbAi2svZqhcDYa4oCdgm8VO4KBXVlrPZOh8lkLURAAFwgluVEX9QWnYpiePiIKT1g0wA4Y28K3Bi2U+jHMBj8EEOr22ad6KQe5hwjrB/r6ZoWhtzETfy6sV7wsn1ritce6tf9cRtRSycw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_69F5B6C060A74D5DA841AB4CE7E9AD2Dfbcom_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3223.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1affce-79f5-4b7c-b5d3-08d87b600cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 16:39:33.3983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jHbcDb0ShrU5BXXmVIFAY70iaa/XJgMfeHv7yamvGB6Z8Atnv6Xzknwnf83L0Ywa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2213
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_08:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010280111
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

--_004_69F5B6C060A74D5DA841AB4CE7E9AD2Dfbcom_
Content-Type: multipart/alternative;
	boundary="_000_69F5B6C060A74D5DA841AB4CE7E9AD2Dfbcom_"

--_000_69F5B6C060A74D5DA841AB4CE7E9AD2Dfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UXVpY2sgcmVtaW5kZXIgYWJvdXQgdGhpcyB3ZWVr4oCZcyBsZWFybmluZyBzZXNzaW9uIOKAnE9w
ZW5CTUMgSW5mcmFzdHJ1Y3R1cmXigJ0gYnkgQW5kcmV3IEdlaXNzbGVyIG9uIFRodXJzZGF5QDEw
QU0gKFBEVCkuIEZvbGxvd2luZyBhcmUgdGhlIHNlc3Npb24gZGV0YWlscyBhbmQgYWxzbyBhdHRh
Y2hlZCBtZWV0aW5nIGludml0ZS4NCg0KVG9waWM6IE9wZW5CTUMgSW5mcmFzdHJ1Y3R1cmUNClRp
bWU6IE9jdCAyOSwgMjAyMCAxMDowMCBBTSBQYWNpZmljIFRpbWUgKFVTIGFuZCBDYW5hZGEpDQoN
CkpvaW4gWm9vbSBNZWV0aW5nDQpodHRwczovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/
cHdkPWEyZ3lZa1ZwUmpoQlpFdGhRVVF6Y0VGMlFqUlhVVDA5DQoNCk1lZXRpbmcgSUQ6IDkzOSA2
ODggMDQ3Ng0KUGFzc2NvZGU6IG9wZW5ibWMNCk9uZSB0YXAgbW9iaWxlDQorMTY2OTkwMDkxMjgs
LDkzOTY4ODA0NzYjLCwsLCwsMCMsLDg1OTI1MTUjIFVTIChTYW4gSm9zZSkNCisxMjUzMjE1ODc4
MiwsOTM5Njg4MDQ3NiMsLCwsLCwwIywsODU5MjUxNSMgVVMgKFRhY29tYSkNCg0KRGlhbCBieSB5
b3VyIGxvY2F0aW9uDQogICAgICAgICsxIDY2OSA5MDAgOTEyOCBVUyAoU2FuIEpvc2UpDQogICAg
ICAgICsxIDI1MyAyMTUgODc4MiBVUyAoVGFjb21hKQ0KICAgICAgICArMSAzNDYgMjQ4IDc3OTkg
VVMgKEhvdXN0b24pDQogICAgICAgICsxIDMwMSA3MTUgODU5MiBVUyAoR2VybWFudG93bikNCiAg
ICAgICAgKzEgMzEyIDYyNiA2Nzk5IFVTIChDaGljYWdvKQ0KICAgICAgICArMSA2NDYgNTU4IDg2
NTYgVVMgKE5ldyBZb3JrKQ0KTWVldGluZyBJRDogOTM5IDY4OCAwNDc2DQpQYXNzY29kZTogODU5
MjUxNQ0KRmluZCB5b3VyIGxvY2FsIG51bWJlcjogaHR0cHM6Ly91czAyd2ViLnpvb20udXMvdS9r
ZGRmU3BBa0VqDQo=

--_000_69F5B6C060A74D5DA841AB4CE7E9AD2Dfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <79E65A7FF01A424C933187A042578FD0@namprd15.prod.outlook.com>
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
b3V0IHRoaXMgd2Vla+KAmXMgbGVhcm5pbmcgc2Vzc2lvbiDigJw8Yj5PcGVuQk1DIEluZnJhc3Ry
dWN0dXJlPC9iPuKAnSBieSBBbmRyZXcgR2Vpc3NsZXIgb24gVGh1cnNkYXlAMTBBTSAoPGI+UERU
PC9iPikuIEZvbGxvd2luZyBhcmUgdGhlIHNlc3Npb24gZGV0YWlscyBhbmQgYWxzbyBhdHRhY2hl
ZCBtZWV0aW5nIGludml0ZS48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZu
YnNwOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VG9waWM6IE9wZW5CTUMg
SW5mcmFzdHJ1Y3R1cmU8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRpbWU6
IE9jdCAyOSwgMjAyMCAxMDowMCBBTSBQYWNpZmljIFRpbWUgKFVTIGFuZCBDYW5hZGEpPG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPkpvaW4gWm9vbSBNZWV0aW5nPG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5odHRwczovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdk
PWEyZ3lZa1ZwUmpoQlpFdGhRVVF6Y0VGMlFqUlhVVDA5PG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
Pk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3NjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+UGFzc2NvZGU6IG9wZW5ibWM8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPk9uZSB0YXAgbW9iaWxlPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4r
MTY2OTkwMDkxMjgsLDkzOTY4ODA0NzYjLCwsLCwsMCMsLDg1OTI1MTUjIFVTIChTYW4gSm9zZSk8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPisxMjUzMjE1ODc4MiwsOTM5Njg4
MDQ3NiMsLCwsLCwwIywsODU5MjUxNSMgVVMgKFRhY29tYSk8bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+RGlhbCBieSB5b3VyIGxvY2F0aW9uPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKzEgNjY5IDkw
MCA5MTI4IFVTIChTYW4gSm9zZSk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyArMSAyNTMgMjE1IDg3
ODIgVVMgKFRhY29tYSk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyArMSAzNDYgMjQ4IDc3OTkgVVMg
KEhvdXN0b24pPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKzEgMzAxIDcxNSA4NTkyIFVTIChHZXJt
YW50b3duKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICsxIDMxMiA2MjYgNjc5OSBVUyAoQ2hpY2Fn
byk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyArMSA2NDYgNTU4IDg2NTYgVVMgKE5ldyBZb3JrKTxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+TWVldGluZyBJRDogOTM5IDY4OCAw
NDc2PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5QYXNzY29kZTogODU5MjUx
NTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+RmluZCB5b3VyIGxvY2FsIG51
bWJlcjogaHR0cHM6Ly91czAyd2ViLnpvb20udXMvdS9rZGRmU3BBa0VqPG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_69F5B6C060A74D5DA841AB4CE7E9AD2Dfbcom_--

--_004_69F5B6C060A74D5DA841AB4CE7E9AD2Dfbcom_
Content-Type: text/calendar; name="meeting-Infrastructure.ics"
Content-Description: meeting-Infrastructure.ics
Content-Disposition: attachment; filename="meeting-Infrastructure.ics";
	size=1784; creation-date="Wed, 28 Oct 2020 16:39:32 GMT";
	modification-date="Wed, 28 Oct 2020 16:39:32 GMT"
Content-ID: <144B6573FADD724CAEBBCED40AD5E2C4@namprd15.prod.outlook.com>
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
VkVWRU5UDQpEVFNUQU1QOjIwMjAxMDI4VDE2MzU1N1oNCkRUU1RBUlQ7VFpJRD1BbWVyaWNhL0xv
c19BbmdlbGVzOjIwMjAxMDI5VDEwMDAwMA0KRFRFTkQ7VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVz
OjIwMjAxMDI5VDExMDAwMA0KU1VNTUFSWTpPcGVuQk1DIEluZnJhc3RydWN0dXJlDQpVSUQ6MjAy
MDEwMjhUMTYzNTU3Wi05Mzk2ODgwNDc2QGZlODA6MDowOjA6MTQwNTpmN2ZmOmZlOTI6Yzc5N2Vu
czUNClRaSUQ6QW1lcmljYS9Mb3NfQW5nZWxlcw0KREVTQ1JJUFRJT046U2FpIERhc2FyaSBpcyBp
bnZpdGluZyB5b3UgdG8gYSBzY2hlZHVsZWQgWm9vbSBtZWV0aW5nLlxuXG5Kbw0KIGluIFpvb20g
TWVldGluZ1xuaHR0cHM6Ly91czAyd2ViLnpvb20udXMvai85Mzk2ODgwNDc2P3B3ZD1hMmd5WWtW
cFJqaEJaRQ0KIHRoUVVRemNFRjJRalJYVVQwOVxuXG5NZWV0aW5nIElEOiA5MzkgNjg4IDA0NzZc
blBhc3Njb2RlOiBvcGVuYm1jXG5PbmUgdA0KIGFwIG1vYmlsZVxuKzE2Njk5MDA5MTI4XCxcLDkz
OTY4ODA0NzYjXCxcLFwsXCxcLFwsMCNcLFwsODU5MjUxNSMgVVMgKFNhbg0KICBKb3NlKVxuKzEy
NTMyMTU4NzgyXCxcLDkzOTY4ODA0NzYjXCxcLFwsXCxcLFwsMCNcLFwsODU5MjUxNSMgVVMgKFRh
Y29tYQ0KIClcblxuRGlhbCBieSB5b3VyIGxvY2F0aW9uXG4gICAgICAgICsxIDY2OSA5MDAgOTEy
OCBVUyAoU2FuIEpvc2UpXG4gICAgIA0KICAgICsxIDI1MyAyMTUgODc4MiBVUyAoVGFjb21hKVxu
ICAgICAgICArMSAzNDYgMjQ4IDc3OTkgVVMgKEhvdXN0b24pXG4gIA0KICAgICAgICsxIDMwMSA3
MTUgODU5MiBVUyAoR2VybWFudG93bilcbiAgICAgICAgKzEgMzEyIDYyNiA2Nzk5IFVTIChDaGlj
YQ0KIGdvKVxuICAgICAgICArMSA2NDYgNTU4IDg2NTYgVVMgKE5ldyBZb3JrKVxuTWVldGluZyBJ
RDogOTM5IDY4OCAwNDc2XG5QYQ0KIHNzY29kZTogODU5MjUxNVxuRmluZCB5b3VyIGxvY2FsIG51
bWJlcjogaHR0cHM6Ly91czAyd2ViLnpvb20udXMvdS9rZGRmUw0KIHBBa0VqXG5cbg0KTE9DQVRJ
T046aHR0cHM6Ly91czAyd2ViLnpvb20udXMvai85Mzk2ODgwNDc2P3B3ZD1hMmd5WWtWcFJqaEJa
RXRoUVVRemNFRg0KIDJRalJYVVQwOQ0KQkVHSU46VkFMQVJNDQpUUklHR0VSOi1QVDEwTQ0KQUNU
SU9OOkRJU1BMQVkNCkRFU0NSSVBUSU9OOlJlbWluZGVyDQpFTkQ6VkFMQVJNDQpFTkQ6VkVWRU5U
DQpFTkQ6VkNBTEVOREFSDQo=

--_004_69F5B6C060A74D5DA841AB4CE7E9AD2Dfbcom_--
