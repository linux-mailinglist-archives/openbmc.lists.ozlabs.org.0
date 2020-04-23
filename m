Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8C01B5139
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 02:20:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496ycg1b0VzDqlD
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 10:20:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1382a73f5b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=o6ZCLKy6; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Gqz2yBqF; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496yby6SNwzDqdq
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 10:19:34 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03N0Etv5014084; Wed, 22 Apr 2020 17:19:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=xs36J4VMeLNBcOVxwlcteiXMgKAV7vzpzf6P4Z2tbkM=;
 b=o6ZCLKy6uxD0bpXKXHf6eywyZbaxysznfNAPyY5xQzH9mAlouoIrQXGxB3U+rJg5tKMc
 q3GO5LyG2wfSCuCfkcYXrM9bI4CeiEq71VmVQDbnj5UmGevpGxo+ThPj5+u47xcWkZ07
 6UJIbIMiAJAwTkP+V6GtYlvEWkd5G0lsGg0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 30ghpwvm0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Apr 2020 17:19:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 22 Apr 2020 17:19:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1Yas8bh+pXwvfZww/iLN35EYi7lGcO+0ktHUZBsugNQbc3jezfQENuR0cJUfJTDhGTW5J8Zh4orhNDTHMqIqWkKtAdhmMLTtiLe4DuWAJ0lZJcjFRqERs/YoK45XHQQD2ORHCLvrKywT/Oy1WTMmouZL0ovG5DkS48anBrFOzGQu83wDme74BBJ4LRNsGmfuvL/AkN96XPTiwyQWf6jUr8ll9Ji2Cb50x81IFBO5kWIp2j8IifcOFrLdBGAwIiEjisz3B4pPjgWOP6xSgNGiSKwZBL8Qn5Vg1WVu7SXUBJOH3sYj3lYMVfyrVcIKj/0B3nse6blFuFGRIZH+cf2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs36J4VMeLNBcOVxwlcteiXMgKAV7vzpzf6P4Z2tbkM=;
 b=is+fTExFqtd0gRr+VAHzI/Q9AC67H+N057a9WlCsmZPdlWBonuwM5zyMNaee2C7xALbmHYAW1bbMW+YAqetLz75OLuZWd0d5Gqb9kWnucENLfASmTjoJdNBIyRgZAfE2WjJfWKqvDgYNhAyxzT4qjYF9KJz9lqzHBECd47vXU7RQ8G9/6FGFjxlk8pYC2dT1IbFmjF9iSmjW6nIsWj2d6b+kyyGCzo27GOvrSLV80NkHoA13NM9jK7rzSOeWVrnZKJTP9K/nwogFP8uOAWke2rb8Qj2RgF7IPaQ9jZVkFj4kjlJl/Rm4aCljrH+JOD1KfXGMgpZ7gpJp6hL02v9pYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xs36J4VMeLNBcOVxwlcteiXMgKAV7vzpzf6P4Z2tbkM=;
 b=Gqz2yBqFxbHcon0RfNl9Jm2K6MrX2WxNfFZflsgJ0sbB0whzMnbNG6Pj67vL0BLYUa+j2+W4tQuh6Be2xZ8Sb8ddKfNhcDV6lQPeWi+jXFv+9/e9/FzBBV5tR/y0c6j5PJp9gCIJ2uPnWWhvPkouya0Dk27bs02miv8g+QiYkB4=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3144.namprd15.prod.outlook.com (2603:10b6:a03:fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Thu, 23 Apr
 2020 00:19:29 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.030; Thu, 23 Apr 2020
 00:19:29 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: phosphor-host-ipmid code review
Thread-Topic: phosphor-host-ipmid code review
Thread-Index: AQHWGQTautjVFD4sgkOLaz4cNDarMQ==
Date: Thu, 23 Apr 2020 00:19:29 +0000
Message-ID: <6EBB9FFD-2EFA-4092-9F1A-5BDDB405A958@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:61fd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 005b38d3-64aa-4068-ec1c-08d7e71bfd77
x-ms-traffictypediagnostic: BYAPR15MB3144:
x-microsoft-antispam-prvs: <BYAPR15MB31441392387E646A8B493B31DDD30@BYAPR15MB3144.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(346002)(376002)(39860400002)(136003)(366004)(5660300002)(558084003)(86362001)(6486002)(71200400001)(2906002)(4326008)(91956017)(6916009)(6512007)(66946007)(76116006)(316002)(966005)(66446008)(64756008)(36756003)(478600001)(6506007)(66556008)(8676002)(33656002)(2616005)(3480700007)(66476007)(8936002)(81156014)(186003)(9326002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GUcDszc7OfWM9Gl1uCWCD6qmGCY4YLkfA7dilBOkaiUaAzboLTrgLTK5ciVEgn1EsyW+LX3nXEbrIsU6kdW2z1gj/uHRQYTekT3fKIqkiSszojKuYguFZTG2A7HRg5n1DBjyjB9fmvoTaRBywhsYxAAznznsvjhG2XL2UOU1YGpMZR8pPKDqv3n5kbYAMiG+JSST3tRN207YYLawGwpIwjyt/Hp2gjT49NIjLNOgI1P4/zDSCECRHINz/rvdDEpYCMymXI7Ur/Sz57HUhJPI7ufhih2mc9mH9/yX0RRgrc6xo6r5UVqGb0JdghKZbXAxi6+5172McnpPvdpqwfsqZJ7z4pXeCxseHdK5iPZq6n+ig13txHjRzDM+IGLIzjfPNi29O0kZnny2s+BNQhWdLJi/5jpI74Tvv8yj4iUHKq+epVXLK50n/ykcv6uZCu6ViwANgGqQxfINz/yRP3s9ZyNRjLA1zL91i2zcMItop8uepiKeTzp/84byAFn9PmxyyRA8nbcjk/RGpBImv15eJg==
x-ms-exchange-antispam-messagedata: IbgWCD9Kko1jocdI2OKXwQbc0NxQhaqs4lRlH5/zsRVwisUDDO4SoepPfLtXuxxd6ksfd2c1kkn4XZk38oXVQlXu0ekohgPDePY6qlkpReCO/ViK2xDQZB5njvTrQdNnJTjQd03bO7xyRnHpHD1ehECaDNW6X+SX+8HYwQxDiNPPEuqYdSaV67fNNdOsvZgD
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_6EBB9FFD2EFA40929F1A5BDDB405A958fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 005b38d3-64aa-4068-ec1c-08d7e71bfd77
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 00:19:29.7173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xvcK7Jby/5+iyVS2jg6ePWDt3Ner+/NU2GExRSdofpsX3Jjnd3CqJ7/YOuqvxeu8Vo+sEPX82u8EZyqKl7o++g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3144
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_08:2020-04-22,
 2020-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=512
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004230000
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_6EBB9FFD2EFA40929F1A5BDDB405A958fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVmVybm9uLA0KQ2FuIHlvdSBwbGVhc2UgbWVyZ2UgZm9sbG93aW5nIGNvZGUgYXMgaXQgaXMg
cGVuZGluZyBtb3JlIHRoYW4gYSBtb250aC4NCmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVj
dC54eXovIy9jL29wZW5ibWMvcGhvc3Bob3ItaG9zdC1pcG1pZC8rLzI5OTYyLw0KDQpSZWdhcmRz
DQotVmlqYXkNCg==

--_000_6EBB9FFD2EFA40929F1A5BDDB405A958fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <8249D8D1AA88C84DB46E03A0F2FFC0A9@namprd15.prod.outlook.com>
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
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQpzcGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0K
CWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0K
Lk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41
aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNl
Y3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9k
eSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFz
cz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij5IaSBWZXJub24sPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkNhbiB5b3UgcGxlYXNl
IG1lcmdlIGZvbGxvd2luZyBjb2RlIGFzIGl0IGlzIHBlbmRpbmcgbW9yZSB0aGFuIGEgbW9udGgu
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGEgaHJlZj0iaHR0
cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2Mvb3BlbmJtYy9waG9zcGhvci1ob3N0
LWlwbWlkLyYjNDM7LzI5OTYyLyI+aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8j
L2Mvb3BlbmJtYy9waG9zcGhvci1ob3N0LWlwbWlkLyYjNDM7LzI5OTYyLzwvYT48bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkczxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4tVmlq
YXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_6EBB9FFD2EFA40929F1A5BDDB405A958fbcom_--
