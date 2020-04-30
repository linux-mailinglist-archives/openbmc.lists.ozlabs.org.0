Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ECE1BECEA
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 02:16:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CGC42zJZzDqWG
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 10:16:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2389bc8553=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=LM8q7zzB; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=CulneFNI; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CGBM1FldzDqRd
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 10:15:50 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U0Esg6009157; Wed, 29 Apr 2020 17:15:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=GxdWhHpSGQlHeZbpOPi92C7WMbfH/TLhIS237TREmqE=;
 b=LM8q7zzBC+zteEHBHA8pEKU1E0ji2Ycpj+8gkN5AzOVIbqicR2tL0HfRVFjgFgdgvY5P
 HWJA8dPPMAowoDWQx5uKy9fhb/CRbBp5iyh2Ed8wsQqrAUhiw7LED+vXcZFQRGhtJPZF
 sQ2Y+iw84QyEIW3LbX4JiTeyMkIZohRp88E= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30n54eth9f-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Apr 2020 17:15:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 29 Apr 2020 17:15:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAWmeVPIgJ1tIJDJ2u+TTyJnlHIxCLazq1v3YVUwRWwt5DUNC9zGNnawV0MpXZHmKQ6w6FiQrPv7XAG/wQQaBNdMnMSM/9+d+VCZrinjKvY7Bl7iQL1HD2T5qMVqQDUhd1D0A8U0IkSPCFNb1EYLt7Jfmh7m3/bMJ8dR+030AvJPbrApJQPzmQe97YeU4LYdsKRImRGIXw1QV93E/Mi64Y5j6gp5zeO9H3ig4ms64dyQyjPGe3qNVEkZZYOjJ9INximkS82zBMjLJH+xBAP2YG5Bqht2c4Ts5PQt0DSmqFV0EYoHJHQRaezfjYxOTx9AfhImazH78hzljFv/mchHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxdWhHpSGQlHeZbpOPi92C7WMbfH/TLhIS237TREmqE=;
 b=KFmDbh4NserZ3bTjN16lmJ1v0htjpqiX9yj6R/rH4pS7eP/unKSJqBq49Sl6f427NH3uVjw/rDw0tllWSTJXeEEvz/3lUEzjLYONF9KTTa9623bJI7MvEYrITLyswmcUZAeXL4NyaKKvvSA16WHXz2lxANeFeC9FSzqxdMrDhCejpI+xtXQ6MMNv88PXCm82EuLLpM1tao3zCwVxZkyhm/qMxx1BjuoDEXG1fgqBbZ/K3Fr/BgGKry/5xV2KqqK/56XCUZ8mVSigA2d2pk9I9UE+iRP7w9CdLa4b5zTJu5km1p7mR5VENsXA27AjkDWh87qCOAXgIYj5UQhgqif4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxdWhHpSGQlHeZbpOPi92C7WMbfH/TLhIS237TREmqE=;
 b=CulneFNITDSHF+bS1lse8HsecZro53ULglPgzWWuKUjyVHr7OG+wSeDiglaFUYlhr+neAn8khdOW7JUtIYBPZxImFZcHcqfnYzAZ9K97858E0+p2CC9RjsramqujLLSdEzsCSESfgviSJRKeCURddix0SeuUHFiwHEX4o9xvczY=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2791.namprd15.prod.outlook.com (2603:10b6:a03:154::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 00:15:43 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2937.023; Thu, 30 Apr 2020
 00:15:43 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Nancy Yuen <yuenn@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
Thread-Topic: Multiple BMCs in a system: IPMB? Redfish? MCTP?
Thread-Index: AQHWHnkPYQJlRTUjS06KHOVKGww4dKiQVq0A
Date: Thu, 30 Apr 2020 00:15:43 +0000
Message-ID: <59A41CBD-05E4-4CE5-BFDB-19CA52FC8460@fb.com>
References: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
In-Reply-To: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:76e2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78284365-a566-4054-62d7-08d7ec9b9f69
x-ms-traffictypediagnostic: BYAPR15MB2791:
x-microsoft-antispam-prvs: <BYAPR15MB27910AAAECFCB41D60B25AFDDDAA0@BYAPR15MB2791.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0389EDA07F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZE1LeJ2BtBElG3or/paDmWVpT4vMC5dkWkCzbBYBj6pOYopInDntMFEwrOR3x30YFD2pgGfP2w1UWhUureU6KXMkdUEAb4cbVzHw3sT+osBI6Cxd3zZ09R+EtT9WNez4XZk/2XIy7gzRUYc3WNp2ELtA+VtzoHPsVNr6ra1YV7Gy1oaGGOcEUGvW9gQYck/NvMq+CMuPMelMWUJZHbCHcCBtpks8brqGTN1Dq28AlrPuvBkUFXm4+IBfyZ3PFAW6sZGKBIQV3SdhGqO+khseIf7v8gLe9yyyNr3/N2TNQ5CcbJdhVJZIliUDqILDiIBHjFsYMoKAlqxcvnY4pjlZJeaelefgsbrZUya+r5UGkKJysIEEalJCnsZ/cZW88KF1iTSzycVJQddpZrgCe6FouXl2A+I2ZlUo3RZwwxRjS4dK1uYcKCoKVe2B5WZELQBn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(39860400002)(376002)(346002)(396003)(66476007)(66446008)(66556008)(186003)(71200400001)(66946007)(4744005)(64756008)(2616005)(6486002)(91956017)(36756003)(2906002)(76116006)(6512007)(53546011)(6506007)(8936002)(8676002)(316002)(86362001)(9326002)(5660300002)(478600001)(110136005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jjE7wMgfWDkZVmNIFabpZpOxvtWIAZ4x6qbu38gmDNErP5TT5WqV8PazL9mO19yiA9CA1OnZzgzh02be0qoc0z4Ic4VwILsEeCkNMnm4mB5LTnPVlYsAuuu4ucGJ29tEQE+u/nKoZ3an09U2SA+EB80Am+UR0p6+KuYG6sQF/jJFkMMlHL1MxYdlIvpJAU6P/Mocq85MBRNhofq1JqzCt1ZjBGvqbHeaC8tPbzFx5aP3Za4x79Q4AOvnZaSc0lWvP1f50Aa9QHkIyJz7mbJ2GYFDVttVQ0DYP13t2KICXd1oSx+xrePDAkZgNgSJILjYi3AarbLB6NcrajISkhpoTVFXJEZIMqN+6FgCdFPcuRjFpDwmHFnkU1JFB7TWATeQUAuEpXLbS6CsKEBy/E0SvtlkJzvc+n5HH3WAUqO66KAFFTrbv0mKuRtH2WvkmpTNtGC9p9x0kxUSk5dwMjEHwJAciyMb+7aUIh7040Cp73X89p9mWC+9bFvvJpMmH1PFEplpVjxBKEw0Kj6gKLg7IT3auSXVe6zQrPV9abEEMiiLADaQAszNsOAgyQF3+PxCpspA3/xWz94+gBSFLoEdIP3/VmcbBt/VDp/NzamjKwA8UTGMsNfXsat48fU64ds8tAbkgVkbmKXiS0y/3K3pyDhZl8HKn4NAyJyLXklEwDa6myd4BeKkCAwKJ+Q8TwcOPKHZukZ1/A0P6kpT6tNC3iQroaeTBfWPoa25WhpCNz7UXb/yN2Y9J0Kz7gbAB+j1mDGWWr0aNm0hTyS5MDdR0ZgjwOdLZ9BRHDwBEBHsAn4r3BfG1RQ6Ep/Ss2ud2lJH8WGqp7Ui26PFx6C1CiysNw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_59A41CBD05E44CE5BFDB19CA52FC8460fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 78284365-a566-4054-62d7-08d7ec9b9f69
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 00:15:43.2795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrNxhrQKDmQzPIcoctkDtF4p2u2fyaB2IbG6OLlU8ERVC8icVOIJ+pMbHDnXKpD5H0oY2vSTHEp0rhEBcU3LDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2791
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_11:2020-04-29,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004300000
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

--_000_59A41CBD05E44CE5BFDB19CA52FC8460fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTmFuY3ksDQpXZSBhcmUgY3VycmVudGx5IHVzaW5nICgxKSBpbiBvdXIgY3VycmVudCBtdWx0
aSBob3N0IGRlc2lnbi4gT3B0aW9uICgzKSBhbHNvIGxvb2tzIGdvb2QuDQoNClJlZ2FyZHMNCi1W
aWpheQ0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29t
QGxpc3RzLm96bGFicy5vcmc+IG9uIGJlaGFsZiBvZiBOYW5jeSBZdWVuIDx5dWVubkBnb29nbGUu
Y29tPg0KRGF0ZTogV2VkbmVzZGF5LCBBcHJpbCAyOSwgMjAyMCBhdCAzOjUzIFBNDQpUbzogT3Bl
bkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogTXVsdGlw
bGUgQk1DcyBpbiBhIHN5c3RlbTogSVBNQj8gUmVkZmlzaD8gTUNUUD8NCg0KSSd2ZSB0YWxrZWQg
d2l0aCBzb21lIHBlb3BsZSBhIHdoaWxlIGJhY2sgKGxvbmcgd2hpbGUgYmFjaykgYWJvdXQgbXVs
dGlwbGUgQk1DcyBpbiBhIHN5c3RlbS4gIEVpdGhlciBmb3IgcmVkdW5kYW5jeSBvciBtYW5hZ2lu
ZyBzZXBhcmF0ZSBwYXJ0cyBvZiBhIHN5c3RlbS4gICBJJ20gd29uZGVyaW5nIHdoYXQgb3RoZXIg
cGVvcGxlIGFyZSB0aGlua2luZyBpbiB0aGlzIGFyZWEgaWYgYXQgYWxsLg0KDQpXZSBhcmUgY29u
c2lkZXJpbmcgc2ltaWxhciBkZXNpZ25zIGFuZCBJJ20gbG9va2luZyBpbnRvIG9wdGlvbnMgZm9y
IEJNQy1CTUMgY29tbXVuaWNhdGlvbnMuICBTb21lIEJNQ3MgbWF5IG5vdCBiZSBleHRlcm5hbGx5
IGFjY2Vzc2libGUuIEhlcmUgYXJlIHNvbWUgb3B0aW9ucyB0aGF0IHdlJ3ZlIGxvb2tlZCBhdDoN
Cg0KICAxLiAgaTJjL0lQTUINCiAgMi4gIHVzYm5ldC9SZWRmaXNoDQogIDMuICBpMmMvTUNUUC9Q
TERNIG9yIHNvbWV0aGluZyBlbHNlPw0KICA0LiAgaW50ZXJuYWwgbmV0d29yayB2aWEgc3dpdGNo
IGNoaXAvUmVkZmlzaCBvciBNQ1RQDQogSSdkIGxpa2UgdG8gcmVkdWNlIG91ciB1c2Ugb2YgSVBN
SSBzbyBJIHdhbnQgdG8gYXZvaWQgKDEpLg0KDQotLS0tLS0tLS0tDQpOYW5jeQ0K

--_000_59A41CBD05E44CE5BFDB19CA52FC8460fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <EF242610C933E543A68ED182799C241C@namprd15.prod.outlook.com>
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
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndp
bmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7
DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAx
MS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlv
bjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLyogTGlzdCBEZWZpbml0aW9ucyAqLw0KQGxpc3Qg
bDANCgl7bXNvLWxpc3QtaWQ6MjEzNjY3NjEzOTsNCgltc28tbGlzdC10ZW1wbGF0ZS1pZHM6LTM4
NDE2MTU4Mjt9DQpvbA0KCXttYXJnaW4tYm90dG9tOjBpbjt9DQp1bA0KCXttYXJnaW4tYm90dG9t
OjBpbjt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMw
NTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5IaSBOYW5jeSw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPldlIGFyZSBjdXJyZW50bHkgdXNpbmcgKDEpIGluIG91ciBjdXJyZW50IG11bHRpIGhv
c3QgZGVzaWduLiBPcHRpb24gKDMpIGFsc28gbG9va3MgZ29vZC48bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+UmVnYXJkczxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+LVZpamF5
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0I1QzRERiAxLjBw
dDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9tOiA8L3NwYW4+PC9i
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5vcGVuYm1jICZsdDtv
cGVuYm1jLWJvdW5jZXMmIzQzO3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnJmd0
OyBvbiBiZWhhbGYgb2YgTmFuY3kgWXVlbiAmbHQ7eXVlbm5AZ29vZ2xlLmNvbSZndDs8YnI+DQo8
Yj5EYXRlOiA8L2I+V2VkbmVzZGF5LCBBcHJpbCAyOSwgMjAyMCBhdCAzOjUzIFBNPGJyPg0KPGI+
VG86IDwvYj5PcGVuQk1DIE1haWxsaXN0ICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7
PGJyPg0KPGI+U3ViamVjdDogPC9iPk11bHRpcGxlIEJNQ3MgaW4gYSBzeXN0ZW06IElQTUI/IFJl
ZGZpc2g/IE1DVFA/PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8ZGl2
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SSd2ZSB0YWxrZWQgd2l0aCBzb21lIHBlb3BsZSBhIHdo
aWxlIGJhY2sgKGxvbmcgd2hpbGUgYmFjaykgYWJvdXQgbXVsdGlwbGUgQk1DcyBpbiBhIHN5c3Rl
bS4mbmJzcDsgRWl0aGVyIGZvciByZWR1bmRhbmN5IG9yIG1hbmFnaW5nIHNlcGFyYXRlIHBhcnRz
IG9mIGEgc3lzdGVtLiZuYnNwOyZuYnNwOyBJJ20gd29uZGVyaW5nIHdoYXQgb3RoZXIgcGVvcGxl
IGFyZSB0aGlua2luZyBpbiB0aGlzIGFyZWEgaWYgYXQgYWxsLjxvOnA+PC9vOnA+PC9wPg0KPC9k
aXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8
L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5XZSBhcmUgY29uc2lkZXJpbmcgc2lt
aWxhciBkZXNpZ25zIGFuZCBJJ20gbG9va2luZyBpbnRvIG9wdGlvbnMgZm9yIEJNQy1CTUMgY29t
bXVuaWNhdGlvbnMuJm5ic3A7IFNvbWUgQk1DcyBtYXkgbm90IGJlIGV4dGVybmFsbHkgYWNjZXNz
aWJsZS4mbmJzcDtIZXJlIGFyZSBzb21lIG9wdGlvbnMgdGhhdCB3ZSd2ZSBsb29rZWQgYXQ6PG86
cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8b2wgc3RhcnQ9IjEiIHR5cGU9IjEiPg0KPGxp
IGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFy
Z2luLWJvdHRvbS1hbHQ6YXV0bzttc28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+DQppMmMvSVBNQjxv
OnA+PC9vOnA+PC9saT48bGkgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9w
LWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvO21zby1saXN0OmwwIGxldmVsMSBs
Zm8xIj4NCnVzYm5ldC9SZWRmaXNoPG86cD48L286cD48L2xpPjxsaSBjbGFzcz0iTXNvTm9ybWFs
IiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1
dG87bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPg0KaTJjL01DVFAvUExETSBvciBzb21ldGhpbmcg
ZWxzZT88bzpwPjwvbzpwPjwvbGk+PGxpIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFy
Z2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0bzttc28tbGlzdDpsMCBs
ZXZlbDEgbGZvMSI+DQppbnRlcm5hbCBuZXR3b3JrIHZpYSBzd2l0Y2ggY2hpcC9SZWRmaXNoIG9y
IE1DVFA8bzpwPjwvbzpwPjwvbGk+PC9vbD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPiZuYnNwO0knZCBsaWtlIHRvIHJlZHVjZSBvdXIgdXNlIG9mIElQTUkgc28gSSB3YW50
IHRvIGF2b2lkICgxKS48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+LS0tLS0tLS0tLTxicj4NCk5hbmN5PG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_59A41CBD05E44CE5BFDB19CA52FC8460fbcom_--
