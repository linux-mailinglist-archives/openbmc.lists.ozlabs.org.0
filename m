Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 685652244E3
	for <lists+openbmc@lfdr.de>; Fri, 17 Jul 2020 22:04:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7htB3kDXzDrRr
	for <lists+openbmc@lfdr.de>; Sat, 18 Jul 2020 06:04:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4467857059=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=lo7wzOzt; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=GZ3UKGU6; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7hsS5Z0rzDrRQ
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jul 2020 06:04:07 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HK1img005012
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jul 2020 13:04:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=UFJ3LqeR+XFS9gZ41vH191IOGvp0BWGR2xtRWy7d8l8=;
 b=lo7wzOztpL5DwfCf/48zIqIhx06y4l3xW8QHPMg0gsgSRpfD5RWTTjkkSIu52Q2oJyuC
 zS6f8dEmYRwdQKEDhvANxWNP37+LXK0N1BSWqMYJQc+/3K+5gl70oN2C/NkQLE8264kw
 J530D9+b35mCkThjTZzy7NI8PWjN+K5Iq0c= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 32a43fce5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jul 2020 13:04:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 17 Jul 2020 13:04:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHa6gJ8NjC9TGUZJuKDPF7/sIKgBkDMFvaTUnfCtcFLpnNurHUtC0Jk0bXdWMmAKsFfUcyVtl4sQ5SUdmGIJMIbvhJHS+quoo/yLRWDStD4YKaTX98ne2lkJvfzNmsKtZcyyKZ8+jUEKlcAuWnREJ65AcnXucjmdkTxF2JRb36gJH1jbOoJSfYv9aNpuP36Xryy3N5xhvP79JwE1g5St2zfRNacPZj7k1ACHIj8W8Q9LfRxunTEj16zomu/pLt+T51r2I6/uGt2p6Nqr1R6eVe4eff40TLAJTmjbR6NwiBuymV8Xo4rV1kLMNu1k08yNn+wRbsv59jhxUFtDaQBBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFJ3LqeR+XFS9gZ41vH191IOGvp0BWGR2xtRWy7d8l8=;
 b=fF/g+cfIWMH3FoGPmEhrCrkoZUbWckkbcriuOnJZzWABNr0u6iA94GJFTRQ5aIOBAObs5OfOP1G46zQ6DO3mp9m11dTO+BDEv/9OZLYjCppvxv3ScHthAjWCWEWbPPECL5HVm89RDhhV3oWH28GY+FEkTniPG2dQjy6HN+v/fYgHUqw2J6eD0ZEmCgNjePA7jtboU9IhgtiIZPJE5xi9EibRvypWoDEzfydwxSYhLcjvQcQ0fiBwi/Obzt3AssjuyGsvBOufzApilHgHNiC50wPUrvCZazp7L86lvQXDUNZh3qQQvJ/VNz4N8Nq3p/GRg9VfcLxUXYcvXhelXbdWlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFJ3LqeR+XFS9gZ41vH191IOGvp0BWGR2xtRWy7d8l8=;
 b=GZ3UKGU642hqhOqRv9Yu9467bEmgTI8uviokxMXyOa6gWDbccfMSINqALkubfzJ6x2F6T5BWSSaW/y/2WjxfNzHGsaNVAUnPJ+bbPOtrWiZqP+CJuEw3W+bm17+y+9c9IyfpajjN4yFwcptfuymsBg18SmyLG1MIctBojOCYiS8=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2406.namprd15.prod.outlook.com (2603:10b6:a02:84::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Fri, 17 Jul
 2020 20:04:02 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 20:04:02 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Phosphor virtual sensor
Thread-Topic: Phosphor virtual sensor
Thread-Index: AQHWTlMkknRRiUDgBU+3FsJUUtOwWakL2NSA
Date: Fri, 17 Jul 2020 20:04:02 +0000
Message-ID: <85F50CF8-34D6-4DA4-9090-9FAE6AE07605@fb.com>
References: <DF74EA96-65CA-430F-9525-56DF39237550@fb.com>
In-Reply-To: <DF74EA96-65CA-430F-9525-56DF39237550@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1eb990a-2b6d-441f-7998-08d82a8c8d33
x-ms-traffictypediagnostic: BYAPR15MB2406:
x-microsoft-antispam-prvs: <BYAPR15MB2406E9373F1DC7A2CB9C822FDD7C0@BYAPR15MB2406.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5W5oY+p+eUg07zylb+wvvTmBE+OuHeNCXjQQrFDsnY475zJrMnPHyU2SR1u1OHWrbIt8c8snM5ocUOVSPJZk2m1k1KQgNAixCmS88d20jsik5QdtCM/t4wGGD5GHIqemkLudzkz/3stsbPZILZvgDK+MkF25nCTsGczh+FoghLJEgp3yTWf0ix6CqFKHdAunDRykw4EeORNstHACzG1WWgE8PkUXU7SZEWC/Z0Q0v2eF6aD8IdIZAuQiHKvPlx6EneuxldhnZIRXrEjS44PTbtp63geSZ9LH580GrbE5Ln0G10WDLaSsalfxlVY0Ah5o3RGDgoN1aQm1DF7YpsfjWYHUx/5VoC5iwXqsxiG2jsaKEGHgVGEj0xlx5Xhx/h+TEZLQXV4Ey90DYdrk65baSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(396003)(346002)(376002)(39860400002)(6916009)(36756003)(2616005)(53546011)(2906002)(8676002)(6506007)(478600001)(966005)(86362001)(186003)(9326002)(6486002)(6512007)(8936002)(4744005)(33656002)(64756008)(3480700007)(66556008)(5660300002)(166002)(76116006)(66446008)(66476007)(71200400001)(7116003)(66946007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 82lJMs7+h5zm03ASYMpXKh6NOa3tejlSIlxrVn4NEvF5MZA34qy+8Vqx1+r5Qx74DaPCec9VyOWcMJR6tnBcF789mL6jCccdRLlzAwJ5C4fpy5/IXnQbVkwbQYrobIMmHXWfIUmv8cKfxw8uwslFHukCQW5sGadDC74TD83Q/Ix+ojFPe5vYVWw8g8YxdeOGkBW+HCj9bUvDcmNcO3wdEcBx985M0OyArivoIXjxtZBUkqZnJYRurG+r1gA66Rb7FXjA6PoA6sC+lX/GPgE5ALAacMZOGdzkARoIRyzDnXS07pJi3aSdwAr/B3V3pCjXdYaPQNgH7pkhSk/r/QwJjBT7dVUKx2G5rCKt2491kdBJwjf70KxhT+46gBNTlHm0fT6DwjFLAi6ifXpAabnuDgvODBvK0aOdP7Jt7/O+xaHUASR90qGOr7zPV6EufR0RVBcvWPkICLFl+Xxa0B3CMyCD6vdVX0L7hteg1o42PXl4gr4rmIrphbTt0Bsanmm7nXkFISyDXYEU96yAXCwMLohJL/7gz5R8HBIB0cqg7VrEIUpYBVydgcV5dHjRJMuT
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_85F50CF834D64DA490909FAE6AE07605fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1eb990a-2b6d-441f-7998-08d82a8c8d33
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 20:04:02.3925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5SLV3yljlFID0hiv2gbeTaXeEJfdRKTRT5KUHA2/W002hXk3F140BOGV02oSQIzJtmP4kH27VjJ9xSGzb/5bVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2406
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_09:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 mlxlogscore=775
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170136
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

--_000_85F50CF834D64DA490909FAE6AE07605fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJhZCwNClBsZWFzZSBjcmVhdGUgYSBmb2xsb3dpbmcgcmVwbywgSSB3aWxsIHN0YXJ0IGNv
ZGluZy4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCkZyb206IFZpamF5IEtoZW1rYSA8dmlqYXlraGVt
a2FAZmIuY29tPg0KRGF0ZTogTW9uZGF5LCBKdW5lIDI5LCAyMDIwIGF0IDE6MjMgUE0NClRvOiAi
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3Vi
amVjdDogUGhvc3Bob3IgdmlydHVhbCBzZW5zb3INCg0KSGkgQnJhZCwNCkNhbiB5b3UgcGxlYXNl
IGNyZWF0ZSByZXBvIGZvciBQaG9zcGhvci12aXJ0dWFsLXNlbnNvci4gRm9sbG93aW5nIGlzIHRo
ZSBkZXNpZ24gZG9jdW1lbnQgdW5kZXIgcmV2aWV3Lg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1w
cm9qZWN0Lnh5ei8jL2Mvb3BlbmJtYy9kb2NzLysvMzIzNDUvDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_85F50CF834D64DA490909FAE6AE07605fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <FF3FD2532A9E424CA1B5560462BDBA95@namprd15.prod.outlook.com>
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
MTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21z
by1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5z
LXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxl
LXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlv
bjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGlu
O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4N
CjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0icHVycGxl
Ij4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SGkgQnJhZCw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UGxl
YXNlIGNyZWF0ZSBhIGZvbGxvd2luZyByZXBvLCBJIHdpbGwgc3RhcnQgY29kaW5nLjxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkczxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9w
Pg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERGIDEuMHB0
O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNw
YW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5Gcm9tOiA8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJjb2xv
cjpibGFjayI+VmlqYXkgS2hlbWthICZsdDt2aWpheWtoZW1rYUBmYi5jb20mZ3Q7PGJyPg0KPGI+
RGF0ZTogPC9iPk1vbmRheSwgSnVuZSAyOSwgMjAyMCBhdCAxOjIzIFBNPGJyPg0KPGI+VG86IDwv
Yj4mcXVvdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmcXVvdDsgJmx0O29wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OiA8L2I+UGhvc3Bob3IgdmlydHVhbCBzZW5z
b3I8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wPg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+SGkgQnJhZCw8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Q2FuIHlvdSBwbGVhc2UgY3Jl
YXRlIHJlcG8gZm9yIFBob3NwaG9yLXZpcnR1YWwtc2Vuc29yLiBGb2xsb3dpbmcgaXMgdGhlIGRl
c2lnbiBkb2N1bWVudCB1bmRlciByZXZpZXcuPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PGEgaHJlZj0iaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5
ei8jL2Mvb3BlbmJtYy9kb2NzLyYjNDM7LzMyMzQ1LyI+aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1w
cm9qZWN0Lnh5ei8jL2Mvb3BlbmJtYy9kb2NzLyYjNDM7LzMyMzQ1LzwvYT48bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4m
bmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkczwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4tVmlqYXk8
L3NwYW4+PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_85F50CF834D64DA490909FAE6AE07605fbcom_--
