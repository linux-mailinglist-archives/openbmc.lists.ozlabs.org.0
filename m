Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 571E11AE442
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 20:07:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493kb12Hl1zDqwD
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 04:07:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=13769785df=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Z80Wnp3o; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=O1sLgyhf; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493kZ36g1pzDrqV
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 04:06:51 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HI4ak8000623; Fri, 17 Apr 2020 11:06:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=brvXz/na+t1mBA4YtiMhq/wAtxS+32a6t1ZqWjxBOZY=;
 b=Z80Wnp3oxF4xmlu5cLmEL28KMiNPE1DrDiiqoG88IcePsQ/nS68wMmdw0eZMfzuENcdR
 tt24GA6JorD3yVkriTffv1s1tI0asz9MaYeyWVZDLwnK1q3uqzkXjgn/nJp1P4ZUTrVC
 rWM1huDxuJtkv0F/J3h/Jr1sBFkuW+U2NwE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30ff1q0wda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Apr 2020 11:06:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 17 Apr 2020 11:06:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpaHG17ZZSZFhdJN9XGQMHK08p6fxQzL0sNYex7ZgEIVPa0AydcJE1cPpXRZ0J7iSupfxoxUFC2IAIYVckmxpbuWGCPqFzQ2sG1ngC9tGOdmcgLt3xBn1aELQ8PtzEdR7d1/53K5nQC/+qxYFn33BFHqDtvfzUIkH5hK+2rf4jbB0DwDXdlZ2cQ/v7Kc6jB3vz9It03CoBh2JAp56tlh4Rn1ThDiy59lIgGFqciZLzbmN+XHx+KOUcq5hq/xorDkgML3lM9QsCFy0myjVGOVeGhBxuaJnJCR0ySbnWj1NlHeKoixfRqDlVJq/yC0SFnNqmNap9Gc06uB2UAd4/ZoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brvXz/na+t1mBA4YtiMhq/wAtxS+32a6t1ZqWjxBOZY=;
 b=QOYGY1xHgwA/DVpsNPbbklKAGZmY9PPNjX/frbXMtlv+7fRhHZ0n/grBo8abBQ36ZfVDWUb/S7bekve5kH9Zlk5OL0dpEtQj5L5n/sj2cH5Mkp+ysMmZk/vbWTF4z2YtJXCaSFcbKM1Grb34kc/nMMP+g8P0AV5Z7lG7EkeTmG7o/Bbk3XK5X6Te8PZRFqckzaJsyrXPPv97NwPigRT+Enwutqp2A2dmBdYvdO3P5usCGFrMDURkZto5OPZ4lQDahX4AGB0EtBGD5nkfYS+JplTKH2+PUxr8s5sVgBZyq5U14/Q58qYRkASmkT9RMNYb8t9Wv2Wd6N5wNbXzWYchuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brvXz/na+t1mBA4YtiMhq/wAtxS+32a6t1ZqWjxBOZY=;
 b=O1sLgyhfQpLWigBsazhvn5MzfSrUDl6IAJX8jp8k+oZXHvd1QCTXrV/QMtRS1OVJTWmazgX1kdqqk20oU1vPLnPNL5YifFGJ482UGu10uJfHWaGiUjPARoCcFo/r5Gx2xADVOVBHpWsjNVNIuU6WKjHARlAdLh/4GWbtPdVp3mM=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3319.namprd15.prod.outlook.com (2603:10b6:a03:10b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 17 Apr
 2020 18:06:32 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 18:06:32 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: PSU (PMBus) fault monitoring / logging
Thread-Topic: PSU (PMBus) fault monitoring / logging
Thread-Index: AdYUPUOzhfShaeRKTfKjB4RwKlmmUQAavwCA
Date: Fri, 17 Apr 2020 18:06:32 +0000
Message-ID: <EF8FF2A3-2EA7-42F5-A568-9AE3389CDE2B@fb.com>
References: <337b91ad1ac2401a982113f025564da7@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <337b91ad1ac2401a982113f025564da7@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6798]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20ae0797-4271-494e-db99-08d7e2fa0f69
x-ms-traffictypediagnostic: BYAPR15MB3319:
x-microsoft-antispam-prvs: <BYAPR15MB3319A8C35FB567C3803BB85FDDD90@BYAPR15MB3319.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(136003)(346002)(396003)(39860400002)(376002)(6512007)(71200400001)(5660300002)(4744005)(8676002)(81156014)(6486002)(8936002)(33656002)(2906002)(36756003)(86362001)(91956017)(186003)(478600001)(2616005)(316002)(66476007)(76116006)(66446008)(64756008)(66556008)(66946007)(110136005)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2EgBV59nsVA+sxbE1nIb3xybJE9rFAeceqWWOBQ+CNY99MJOpMqhBFicqzTOYsrAuzgdKaf/AZOtcSohIT7tt+E3KYVaAwMAAydrxVDp+nWJQLofsUAOvSANBBlTdv3Zxs8H23kFI6VIZfMi7zuvlftta4NVQt/xpOJx9x1K8tlQ1jJCfN14KMgcUG/i0i7aHop9sm8V3uJlJaOmQaN+UQrQuMFlL2klN307f1e4DRnrO6NNt/hzxR0Xtxh7v1RdvTqlTqhcUPBdzfHw/NAbILQB7CzprUFQcGWNB5nRpvD6ewsQDj4rfhDXNH9zug6U+6z6aytSLbJCrrQ+PVfjPptFG2pDSD0u4tk7xAtaln2t2TyQBmCUjH9BZGPg5gs2kldxjEvOfxh7YGfo8ycwLTS7xTt/0TtKv0A3akcp6FoXoita1eiEMJlRfTrrFvDv
x-ms-exchange-antispam-messagedata: zomZDqOruvXCyh+Uml7S+FlgMsTAbaWleyQXL84Cr5vJWPJKHuuHdNN3Ivpv0oApbf8Jb8fcsg+Y4ao1mdx1AFjppvA4DKiz64kBzNhY8W5vK8tApvawmMuud6t/Hk/9tuJUMz300XLFEiFfOLk2Q5OTfIDXKVpLQvZBUD6TDRRfXRp/YIZwY0udhYSf1MI6
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_EF8FF2A32EA742F5A5689AE3389CDE2Bfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ae0797-4271-494e-db99-08d7e2fa0f69
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 18:06:32.2842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: by81Vn8msrQyfZUg7DrBgrApcSvVTdM7/QSnn5OPxUaGf8G1XV2LL1z+v64wY187e7jMAMDa2hB3qEZ1Csj8RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3319
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_08:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 spamscore=0 mlxlogscore=914 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004170141
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

--_000_EF8FF2A32EA742F5A5689AE3389CDE2Bfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlcmUgYXJlIHBzdXNlbnNvciBkYWVtb24gd2hvIG1vbml0b3JzIHRoZXNlIFBTVSBzZW5zb3Jz
Lg0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxp
c3RzLm96bGFicy5vcmc+IG9uIGJlaGFsZiBvZiBQYXRyaWNrIFZvZWxrZXIgPFBhdHJpY2tfVm9l
bGtlckBwaG9lbml4LmNvbT4NCkRhdGU6IFRodXJzZGF5LCBBcHJpbCAxNiwgMjAyMCBhdCA3OjQw
IFBNDQpUbzogIm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyIgPG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZz4NClN1YmplY3Q6IFBTVSAoUE1CdXMpIGZhdWx0IG1vbml0b3JpbmcgLyBsb2dnaW5nDQoN
CklzIHRoZXJlIGEgbW9kdWxlIHRoYXQgaW5zdGFudGlhdGVzIHNlbnNvcnMgZm9yIFBTVSBQTUJ1
cyBiYXNlZCBmYXVsdHMgYWZ0ZXIgdGhlIGVudGl0eS1tYW5hZ2VyIHByb2JlcyB0aGUgYnVzc2Vz
IGFuZCBmaW5kcyB0aGUgUFNVcyBieSBGUlUNCg0KSSdtIGxvb2tpbmcgZm9yIHRoZSBtZXRob2Qg
Ynkgd2hpY2ggdGhlIGZhdWx0cyBhcmUgbW9uaXRvcmVkIGFuZCBsb2dnZWQuICBJIHNlZSB0aGF0
IHRoZXJl4oCZcyBrZXJuZWwgaHdtb24gc3VwcG9ydCBmb3IgUE1CdXMgYnV0IEnigJltIHRyeWlu
ZyB0byB1bmRlcnN0YW5kIGhvdyBJUE1JIHNlbnNvcnMgYW5kIGxvZ2dpbmcgdGllIGluLg0KDQo=

--_000_EF8FF2A32EA742F5A5689AE3389CDE2Bfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <BE554D921B35634A839B9F785B853C21@namprd15.prod.outlook.com>
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
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndp
bmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7
DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAx
MS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlv
bjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxh
bmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIj4NCjxkaXYgY2xhc3M9IldvcmRT
ZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGVyZSBhcmUgcHN1c2Vuc29yIGRhZW1v
biB3aG8gbW9uaXRvcnMgdGhlc2UgUFNVIHNlbnNvcnMuPG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpu
b25lO2JvcmRlci10b3A6c29saWQgI0I1QzRERiAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4g
MGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIu
MHB0O2NvbG9yOmJsYWNrIj5Gcm9tOiA8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTIuMHB0O2NvbG9yOmJsYWNrIj5vcGVuYm1jICZsdDtvcGVuYm1jLWJvdW5jZXMmIzQzO3ZpamF5
a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnJmd0OyBvbiBiZWhhbGYgb2YgUGF0cmljayBW
b2Vsa2VyICZsdDtQYXRyaWNrX1ZvZWxrZXJAcGhvZW5peC5jb20mZ3Q7PGJyPg0KPGI+RGF0ZTog
PC9iPlRodXJzZGF5LCBBcHJpbCAxNiwgMjAyMCBhdCA3OjQwIFBNPGJyPg0KPGI+VG86IDwvYj4m
cXVvdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmcXVvdDsgJmx0O29wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OiA8L2I+UFNVIChQTUJ1cykgZmF1bHQgbW9uaXRv
cmluZyAvIGxvZ2dpbmc8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+SXMgdGhlcmUgYSBtb2R1bGUgdGhhdCBpbnN0YW50aWF0ZXMgc2Vuc29ycyBm
b3IgUFNVIFBNQnVzIGJhc2VkIGZhdWx0cyBhZnRlciB0aGUgZW50aXR5LW1hbmFnZXIgcHJvYmVz
IHRoZSBidXNzZXMgYW5kIGZpbmRzIHRoZSBQU1VzIGJ5IEZSVTxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj5JJ20gbG9va2luZyBmb3IgdGhlIG1ldGhvZCBieSB3aGljaCB0aGUgZmF1bHRzIGFyZSBt
b25pdG9yZWQgYW5kIGxvZ2dlZC4mbmJzcDsgSSBzZWUgdGhhdCB0aGVyZeKAmXMga2VybmVsIGh3
bW9uIHN1cHBvcnQgZm9yIFBNQnVzIGJ1dCBJ4oCZbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCBob3cg
SVBNSSBzZW5zb3JzIGFuZCBsb2dnaW5nIHRpZSBpbi48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0
bWw+DQo=

--_000_EF8FF2A32EA742F5A5689AE3389CDE2Bfbcom_--
