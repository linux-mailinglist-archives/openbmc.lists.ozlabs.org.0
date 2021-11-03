Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20594444BCF
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 00:54:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl3Wx0Gkgz2xtg
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 10:54:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=rVwoby1b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.20.84;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=rVwoby1b; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn2084.outbound.protection.outlook.com [40.92.20.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl3WN41Pmz2xBb
 for <openbmc@lists.ozlabs.org>; Thu,  4 Nov 2021 10:53:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZ5Ls2G19m567PF39sCeuhv0cSAezLWN68qFa/eyUnx0QcIxalkvG4kY7q289Dtrjh3u8X12ivxLlJWvRGR75rcbV4jY5dhChjQarNbojyAXo2mvriGWdTnmjOcRbicCw9ADJhenGKmPw34Cu8bx/NbiHGT1PcdJJqC0m4rimrsOqgDuA0ExdHD4XB9ua56DNtO1hM4n6gd0bbVpflWrUMF7B19YkPNzNi3EKbkDWnb7rrW6F5Ukqd+v0UVagQ4sNfarn6hkyfRmKYwa+srESr+1mA7N7MsJwHO91xfWV/pZKR3/Knuul+7SQYv0km/dC4fTTBVWQJ0U6H2s0CVKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1ZrrcL2RMTtR0GtFTdg0dEN3/e3VFOY3Fz6jPP2zTo=;
 b=OfKgshqMVPwWd83heFNWOPAxIjrBXB/pfAT64PtqYYONmXOvF92W+NpB5OlcKyNtE0beO/oC0IFuAF6eyoco9g1q0D0eXvYTOoD8IR8jMRRa7X9fVcFmgB5SUtr1UfemDOKTN2UKaDlzgFobPMalx+yQVla4HeLIKmH8ReyZVr4BMMXx4y8qEmeRanARV1IuuofZc9M1RYgCyPOiKt1uhjz96EqPaXwFI6O/RVHeBFtSQ4wwymstRWI8SfY0/ZI/tnkfJj3SAJx2qnmpAf6WhZeffcmJ/7vnCKtVd4JWPsaxjk6wfvdV48nNjGSobSmrWmxDc7IAY3wh0dId7u8uBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1ZrrcL2RMTtR0GtFTdg0dEN3/e3VFOY3Fz6jPP2zTo=;
 b=rVwoby1biI8a82P8Cy7rM6NMPID05REhIrIDwKK+zgC+szYwMePhIecgN9wa+LiBDsd07caX7QiTPqJ8/OryiIM4bm4H+OxWHit33/7CO04d6GEIVhMFjmuXrWz3RGjwZXw+1bC2ieTdFqMw35vOhwJyryrX6TiiAFdMtcRnsNKwygL8hEshLqvtdHJtaCm6oh5psZKk9U8BZ2+bMXA0lyyB8EOnT2pX/8UsjZfni08qw2+5tUXke4rZVcipxUWqMWjMhArnEuWeAKKL8q3K8Qc91kzpZL0sY7DvQeXEpQiHp7rpb/0q4jT88qeqyUzwN3Istvcxjvj0P3uyW4UzLQ==
Received: from MW4PR14MB4803.namprd14.prod.outlook.com (2603:10b6:303:108::9)
 by MW4PR14MB4777.namprd14.prod.outlook.com (2603:10b6:303:106::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 3 Nov
 2021 23:53:17 +0000
Received: from MW4PR14MB4803.namprd14.prod.outlook.com
 ([fe80::2c8e:4936:60bb:e7b]) by MW4PR14MB4803.namprd14.prod.outlook.com
 ([fe80::2c8e:4936:60bb:e7b%9]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 23:53:17 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: phosphor-logging Create API with Resolution
Thread-Topic: phosphor-logging Create API with Resolution
Thread-Index: AdfRDTdKznkCPPqvTeC8VYD0kwQi/g==
Date: Wed, 3 Nov 2021 23:53:17 +0000
Message-ID: <MW4PR14MB48034DC5EC5E1B30FCF58CE8DC8C9@MW4PR14MB4803.namprd14.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [3pbk/+qronpM5CvWzzCJfijyqQJvaRmj]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5232096d-b09a-47f2-ea0c-08d99f251b96
x-ms-traffictypediagnostic: MW4PR14MB4777:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9W+7czwKOuaWkot7EUkPAJJVFqSB8+II2XXmL/4eznENfxCZ2oun9//Xn0b1+UgZ50DgIDQm1isIpoMUWBZ+mxitk/TL2j/sYt/irZjLWDJwBnUoXx3Doq7W/UwfCDNSNRvtrJ/jzJS62X4seVs0/I3EIRVyIdC1Vm8dbOH3t0T9Bev5u3EjrMCwzr12/KKclscLMkc/6KMvsy/OE+aoUF5nX2yHejks9Lhl1EzvlHS65tHg0FewgrUWxlFGk+n2ken6PNXBvC+0/B5B2fY1DsVAY0GqeJtg6hOFEVU5nCrIorXIRXCAkzWUihpGy3k8Ged9Q0XpkSx1iGBPwID8c2ENTfzo96nnr1ZrCBGPqAwGnGQjIXy4+/v8RVTwRAsuxJSfEiHv/YxGreRWXi3V7KW3H+n5p39hhMyFQ4NjLQ9Y5GwDTraf0XunCZXMxWs0vbyiuyTKom601BGNaDSC/CX72STResIVvps/CrX8Nj188vcckcPhKoxlSf+8DxyfRC+IOSI2DaF1qnYHLvPmPjKpPvKVsUwQiQQlStV8Bj0=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: WaT/SqVGrb5vOi6Z2jPw9heihsFa5eZihnFQnaCTYCjBl+vfYTS5X67uIOxXQlO6HZuE5H450wVoS8fiOsEya0HE5Jtufa2DGeEwvWAJb5LRmWkYE9Uy9s+Oa35jf92EbhE1EH0fM7yFzbpuNLUAtfbzC9TyVbIZmjMqbzPBpPbo5YI+FeP6tq9NSZf+pQIRSmeGBThucpdnKhgg8jPZa+QViNCXHgbFP6J9qizANLtvpzLME1vUaTHo/dzQT+JWuw4VUk6bIMXMFEwo9hG5PhJ2g5jLuFZGA50odfy6Wmy7JH3Sss3mL/0TG9zN8DZQOuASGIrH7llQL2srQizsskfQ9yaSxxFtdk/+oQK1424CveWXNgBPiHhE18TMJFngdHRUPc83tkMy5EyL1Fk5iXEimVz4X4exHv1ojFvfABefoU1yDEibwvXdEiXXcw3VSzJNwV1BIsnJWRVM20qnpV59eYaQcJBXEh0lcLUldnn+19FBDxRoyZn2GxqWifOHJHCcudp8Y8x6K54MXZK5O03cQI91syxGmtX78ojP0a+tRC9X9oxUzByH0jFKBfjYGj14e3jhRDZBWhbyWlswk5TSs/Qh7EULGmveRAthzvVgcWqrnxpLcKUk8QvFXLRwtlUy8tqHO805U4NyvezxhmhVLe+ivfY+lXS69of9TtEV/NFjGwFvdi7UvMYGKfZY
Content-Type: multipart/alternative;
 boundary="_000_MW4PR14MB48034DC5EC5E1B30FCF58CE8DC8C9MW4PR14MB4803namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-32894.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR14MB4803.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5232096d-b09a-47f2-ea0c-08d99f251b96
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 23:53:17.4729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR14MB4777
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

--_000_MW4PR14MB48034DC5EC5E1B30FCF58CE8DC8C9MW4PR14MB4803namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVGVhbSwNCg0KV2UgaGF2ZSBhIHJlcXVpcmVtZW50IHRvIHByb3ZpZGUgdGhlIHZhbHVlIG9m
IFJlc29sdXRpb24gcHJvcGVydHkgYXQgdGhlIHRpbWUgb2YgbG9nIGNyZWF0aW9uIHdpdGggcGhv
c3Bob3ItbG9nZ2luZyBDcmVhdGUgQVBJLiBCdXQgY3VycmVudCBDcmVhdGUoKSBBUEkgZG9lc27i
gJl0IHN1cHBvcnQgUmVzb2x1dGlvbiBhcyBhIHBhcmFtZXRlciwgd2UgaGF2ZSB0byBkbyB0d28g
c3RlcHMgKGNyZWF0ZSBlbnRyeSwgc2V0LXByb3BlcnR5IG9mIFJlc29sdXRpb24gb2YgdGhpcyBl
bnRyeSkgZm9yIGl0Lg0KQW55IHN1Z2dlc3Rpb25zPyBNb2RpZnkgQ3JlYXRlKCkgQVBJIG9yIGFk
ZCBhIG5ldyBDcmVhdGVXaXRoUmVzb2x1dGlvbigpIEFQST8NCg0KUmVnYXJkcywNCkt1bg0K

--_000_MW4PR14MB48034DC5EC5E1B30FCF58CE8DC8C9MW4PR14MB4803namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
5a6L5L2TOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUg
MiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQOWui+S9kyI7DQoJ
cGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0K
cC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0K
CW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5
OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNv
LXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVu
ZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0
eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVy
bGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21w
b3NlOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3Rl
eHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9u
dC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3Np
emU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjI1aW4gMS4waW4gMS4yNWluO30NCmRp
di5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lm
IGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9
IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxv
OnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIx
IiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkg
bGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9
IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSBUZWFtLDxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5XZSBoYXZlIGEgcmVxdWlyZW1lbnQgdG8gcHJvdmlkZSB0aGUgdmFsdWUg
b2YgUmVzb2x1dGlvbiBwcm9wZXJ0eSBhdCB0aGUgdGltZSBvZiBsb2cgY3JlYXRpb24gd2l0aCBw
aG9zcGhvci1sb2dnaW5nIENyZWF0ZSBBUEkuIEJ1dCBjdXJyZW50IENyZWF0ZSgpIEFQSSBkb2Vz
buKAmXQgc3VwcG9ydCBSZXNvbHV0aW9uIGFzIGEgcGFyYW1ldGVyLCB3ZSBoYXZlIHRvIGRvIHR3
byBzdGVwcyAoY3JlYXRlIGVudHJ5LCBzZXQtcHJvcGVydHkNCiBvZiBSZXNvbHV0aW9uIG9mIHRo
aXMgZW50cnkpIGZvciBpdC48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkFu
eSBzdWdnZXN0aW9ucz8gTW9kaWZ5IENyZWF0ZSgpIEFQSSBvciBhZGQgYSBuZXcgQ3JlYXRlV2l0
aFJlc29sdXRpb24oKSBBUEk/PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlJlZ2FyZHMsPG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5LdW48bzpwPjwvbzpwPjwvcD4NCjwvZGl2
Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_MW4PR14MB48034DC5EC5E1B30FCF58CE8DC8C9MW4PR14MB4803namp_--
