Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF1C2477C5
	for <lists+openbmc@lfdr.de>; Mon, 17 Aug 2020 21:58:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVlH22445zDqBX
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 05:58:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=549848a2b7=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=BWqC8/0+; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=BMgK4AmJ; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVlG90KnSzDqVc
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 05:58:04 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HJnEbm026193; Mon, 17 Aug 2020 12:57:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=5YWUjvlgcmck9IXhyTYQSG9gTGgCi1F+kq9OlpsiE0c=;
 b=BWqC8/0+QlNvSZl0Pk4irGTTutHNRoiYEMJO0Mc0GW9p/5QZuONx21Y9dTRQtZRVeaXn
 dvmukxjx6YFqYZh5P79bsUP2j2chJmIyCrvSqsdkbbLgO5rXOtHcfuzJPVSqCkuO0lo4
 iU+tZTREWZ96se0yvMooilis7L8qv2/URmQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 32xyhk75r8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 17 Aug 2020 12:57:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 17 Aug 2020 12:57:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8Dv6A1oBK7E8nmgQ1k1UsULoUcIc+FsXa4wXdG/3Ot0M9DxF6UZhaYlO9Q02pj1QA9I0pO5zvgZiEpqb1FOJRrLDLX91dLh/17bGwNlkk/HGqVUb9GQ+M7f92a5IaTEfJ9fYnv+lMIuVqNg7HZ5674r/Vs0+0bP0eu5PZUoUal4tB6S/DvXWnm1Etb6zOIXLkkwvQdItMlgyQl7GjERuMzEFKJXVOUo0FknFavovikxsLTQoVrm9VV6r8kPALgQVuty2UyR9WoWl7N6xvBmiDIeJVh3ucalL3+P5CKKWNa9catf6UzBs18jw1DIPtv0qYQRajIyhfsOXNT4epZpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YWUjvlgcmck9IXhyTYQSG9gTGgCi1F+kq9OlpsiE0c=;
 b=ZXZmU7AhElHsviuIOhhHNqZj4/4y/mzIj+jAdgOmoYWOw2FprwZSxZ3XMeGV6sMg/XNDBzgTNAeWtc4ogp9y37aIuIOIIBF2NDnuyCsWvTYnlh5InszkUzzY16uhTrOLhSWJRg9LWw5ZxgBLehH6geyxf9mIWbcxU84DlgGVfYuD9PNOEKDsH8SnMFiqcHaLv/J72KQ7aViu1n8HqQH0wbxKt9gbV5bTt3krxIgNgnc6l7/FGJbi1uCo+AvQ5fLqR0GbOVrgPlsFtMak9PYn4Iv1txXcpj5n6GlSOPYmOkMXxkMjfCKYSlBG8SeSv3KSRSmxThlHqJmBNuLHDaZERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YWUjvlgcmck9IXhyTYQSG9gTGgCi1F+kq9OlpsiE0c=;
 b=BMgK4AmJ2WrGa1omAmXVesyE3Qmxr6dqUmQK3sJJHDB105+QgYnVaBezFLDekKHTRQMr5HBXxmK8cCW0v29jRQjPjqa2r7uoTVc5G5SPV0kZzTKxnNV7v2GBHxkKzvnAMbM+a85LKdgQkhs0TExAu6OO5NbJaoc7VEKy6BFBkiQ=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2567.namprd15.prod.outlook.com (2603:10b6:a03:151::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Mon, 17 Aug
 2020 19:57:55 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3283.027; Mon, 17 Aug 2020
 19:57:55 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "geissonator@gmail.com" <geissonator@gmail.com>
Subject: experts recipe from openembedded
Thread-Topic: experts recipe from openembedded
Thread-Index: AQHWdNCxd07rXaGimkuUcPwB3rfSqA==
Date: Mon, 17 Aug 2020 19:57:54 +0000
Message-ID: <5C98E525-D950-4347-87BD-C5EF1DCE3B49@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93c50f2d-0e47-4b7e-f8ac-08d842e7d4f5
x-ms-traffictypediagnostic: BYAPR15MB2567:
x-microsoft-antispam-prvs: <BYAPR15MB256796B21F598569CA29041BDD5F0@BYAPR15MB2567.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yd51tLTPKoPd/EllxSuN5nHTrkcDnophO053s5sBZGKRVb7RYX3E/U60d2vRqi6j1MWSRUfCS8SoZCtOj3yrzWjL8Fbr+lSt0JB4oAiEvH+2fWBeGVE69RUP/bIeMXR5jfC4bexVBH23zpOQ/cnV1oNWObKcp/b7mR2fIEWnp/FDzvY6vON+PLlq93MnLPJax92Ma+QrHzkuekfJ9kZLgB2oBWOfirJgivJqNeb18rRV2YwOGzllH33mEcPUFEFEioiA2IJNbu3RqCQNPZJ1L6uxXoDIFfwZkzYUPbtKNK+Zsa+A550K6jVZFGe9uSd1vWt+87SgKei9Bc8d4vlmnNnjQ+tEynzR60FRjUM5np4YengKOYT95OBh8EnoahKfgII5TKdXDdUvCXzoASRGzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(366004)(346002)(396003)(76116006)(5660300002)(2906002)(66476007)(4326008)(36756003)(64756008)(66556008)(66446008)(66946007)(8936002)(6486002)(3480700007)(558084003)(6916009)(6512007)(8676002)(316002)(33656002)(71200400001)(166002)(186003)(9326002)(2616005)(478600001)(86362001)(966005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Fng7i616fp3FZMoUu5WanuHY1Ryuh3kwx9g737dUP8CQYCWRahKVg1+ejGMWTgqfnM1BFqwEfSunS1ptktidmWrYNRwfvjvaj6g0i+/xlGWJ2mOD3K22vHzoISzkIUWz/qrA5E0IXNMWe46BFwhlAN7PJ4ZMDlz4qgGzhSRMfEWfjIMccbTqTRLVT7SG5sLNlG6unWnoXjC7DDFLaCejhCHmQDkRhq5KlEbj8kFVvnDfOeX0tO+7XryF+X228XI4Ei6WdqraPJG6uBZs5Gfi/lKQbvO6pkyNkxFPVKffZM4JMxMkQ50J6wcxUIjsw6DPdOcx8+0jpUFBMaKK2ys/J9pjf666kPWG1lXolmh4OjMd8JGOzXBLnwWdx1cMtSp9AlFCshH+kglcOxDZfSu9uJ9HS7W8cLr4E6clkRBHMMwRhXO0Sej5A11F3cMUzc32hopDhkMNVLhlRchS/fU73HYvIHC3Zwn4An1w7/hogAia5PWnEOWYvTKQkCoWzPSBZXPb9CzGdWpCdYUXqeYXI8KJLrxVLHcHnejnnqvaMQ5Mei86XNN1Bb5XpH4OvZ8PiITYOB+Vwt9OX2RK9vFqARSMHH1UI8jaoKzdca35eEPyHRSsmuNVX21kInyw/dCi9Ha4BXaY9v19njIp94ShU90YjvmMrpcQD0I0YXWZsSQz4iF5ZOzbu3ZbmhSoQaTJz3MD9OjGwC6JGM0Y+PI4CQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_5C98E525D950434787BDC5EF1DCE3B49fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c50f2d-0e47-4b7e-f8ac-08d842e7d4f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 19:57:54.8814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gwr4qmjXkXFAmgiMCx3y4gasDqB03otwbM/Ft2IO5W8csM7fEQyshfWZ/hueU6BG/Gc5a+ltUazC9aWWGR1FOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2567
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_14:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 clxscore=1011
 mlxlogscore=504 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170134
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_5C98E525D950434787BDC5EF1DCE3B49fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KQ2FuIHlvdSBwbGVhc2UgcHVsbCBmb2xsb3dpbmcgcGF0Y2ggZm9yIG1ldGEt
b3BlbmVtYmVkZGVkIGZyb20gbWFzdGVyLW5leHQgYnJhbmNoLiBJIG5lZWQgdGhpcyBsaWJyYXJ5
IGZvciBteSBtb2R1bGUuDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL21ldGEtb3Bl
bmVtYmVkZGVkL2NvbW1pdC9kZDBmYWZkYzUzODM0Yzk0ODdkYzI5MmVhN2EyZDg3MGM5NjU0ZTU1
DQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_5C98E525D950434787BDC5EF1DCE3B49fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C09A64EAD5250C4AB152161B4D6C58A4@namprd15.prod.outlook.com>
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
ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBz
cGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjND
MTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21z
by1zdHlsZS10eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNh
bnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5
bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJD
YWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDEx
LjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9u
MQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFu
Zz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9Ildv
cmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+SGkgQW5kcmV3LDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5DYW4geW91IHBsZWFzZSBwdWxs
IGZvbGxvd2luZyBwYXRjaCBmb3IgbWV0YS1vcGVuZW1iZWRkZWQgZnJvbSBtYXN0ZXItbmV4dCBi
cmFuY2guIEkgbmVlZCB0aGlzIGxpYnJhcnkgZm9yIG15IG1vZHVsZS48bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
b3BlbmVtYmVkZGVkL21ldGEtb3BlbmVtYmVkZGVkL2NvbW1pdC9kZDBmYWZkYzUzODM0Yzk0ODdk
YzI5MmVhN2EyZDg3MGM5NjU0ZTU1Ij5odHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL21l
dGEtb3BlbmVtYmVkZGVkL2NvbW1pdC9kZDBmYWZkYzUzODM0Yzk0ODdkYzI5MmVhN2EyZDg3MGM5
NjU0ZTU1PC9hPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86
cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9i
b2R5Pg0KPC9odG1sPg0K

--_000_5C98E525D950434787BDC5EF1DCE3B49fbcom_--
