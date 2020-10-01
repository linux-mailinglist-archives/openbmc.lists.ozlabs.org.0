Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF72D280787
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 21:08:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2N2c2XmBzDqbs
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 05:08:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7543e82648=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=qbcbYSFn; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=AyDFaVL3; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2MzW2PNFzDqZL
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 05:06:05 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 091J5wGZ026779; Thu, 1 Oct 2020 12:05:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=QQ0aS2b0d/g5zfQ+ln021JTm/jNvFOFaNVhjRvkU+eM=;
 b=qbcbYSFndqBkjpPRVlwNntOmBfmMNDbYuZuEnw0HR7Dq4BCs0p/NhS5KdywPWt7pHDNT
 znbMICbV2wlj5SKWL7RDp57CsojLMgF8m3bXAsUkf47BdSsH65jqGGtvPc72iauvWz/Y
 92XEiPXeRIVRIU3dIijdsxyQJF68RIQeCIw= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 33vwu3f2fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 01 Oct 2020 12:05:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 12:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIRWkm26E5AaWUT6htOMikcUTNv9VKcgbbU5DPXsYSfT1wM5wi8KHRbUofvk0nndv9nFwz9s8aEEvgVp3pqQj5uX5A8N/GITQ8N3GRpAfopcdRhim30x9aw1Im77kQSR70qPdyUg6gV359kevqQ1arOw2ROiGhjYVy/DYrY3kCGDQicgU7hkHfGXxQV0p6g8JPEAHdzBbeqZ+1gnt5pmkL0/jU9h6/kWRamIBq68MjQnJ4we7gD7z/v+PiF1ij/2CQ88UrvurlH31NZYsQjZOJiqrbN5PI0hxKy/uq0CbaJGJfMJZVrFfcSsUQoV4Qkx0GlGOJBAdPk4igLyERKv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ0aS2b0d/g5zfQ+ln021JTm/jNvFOFaNVhjRvkU+eM=;
 b=NBFAwDItyZeD2jflT3hTEKVR1c/R3X2hmM44kUuDXS5erewwuIzhhBySQ73jpHWNYGF5DOfTYq9uonw/ZrO4UhNXprAcC3SLDa55eeMvQgpVW+SyIEC7+mr4GU1l8MLmjT41jxIXuSZLG5GsPG4AQvsngov11N/r80eOEDeL1pzlsizyrOEgvp8zBo5Kg0H7tTUDRI5ZaoydAyt1k9YO4aTp8f8YdGnFeagBYSCxZiFghrb7oXF1k7sme9XnqMBh8fOt+dsrQ82Py5J5jP1vyC5HEceHmPxYWyj8ZOC/nqaaE7yMp/KixWVf1tERmfEeanqFcbmYpDyjNMM3Py8CfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ0aS2b0d/g5zfQ+ln021JTm/jNvFOFaNVhjRvkU+eM=;
 b=AyDFaVL3kfKQNbhwSvGqLciaPfEtR6Qdn6Y0zJ2zjtYZDjJibBztHlINnPkZqosMK6xvr42a7nO0bmk3SypFikpzE9fIglOUGh4zDg0KoFKFEGpAnBkejmd//RlJPw1dw7kD8V4QYzQ8pgUS+DphpxqVBTNPOAovzrrKi/GQSYE=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2565.namprd15.prod.outlook.com (2603:10b6:a03:14f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 1 Oct
 2020 19:05:28 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3412.029; Thu, 1 Oct 2020
 19:05:28 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Sui Chen <suichen@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Request to create repository google-ipmi-bmc-health
Thread-Topic: Request to create repository google-ipmi-bmc-health
Thread-Index: AQHWlz6Q/XqpUMkh00OhuoNUmWav8qmCp84A
Date: Thu, 1 Oct 2020 19:05:28 +0000
Message-ID: <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
In-Reply-To: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:be3c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63617df1-002a-4deb-bd71-08d8663cf62a
x-ms-traffictypediagnostic: BYAPR15MB2565:
x-microsoft-antispam-prvs: <BYAPR15MB25658C4DC0B4A2273F33FF7EDD300@BYAPR15MB2565.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8FHoOoO4zgNzQShuRpiMJIQmU9ypY6NNI2OIZHfu/gexTi0R5FTPo9q93AlNptGXvjI7ffTVWUE6NPE71u/cgV52WKm3W5BSjurXGN8MWHdrYUEcdk66zdOsfI3sBDDW6mt+LO5njLarMzHwPHVI2UkUUyfIehid9Edz5U/1nV8Py9jIIUBe5wQkve/1WHC7ATk4H6TMTWsB1zI4ZW7UEKh8Jcv3hwo5D5kMZv7B40e2K7/mDS8HwjQ7pJ/EPJQNZo1X0jTR0U6bSoMPYorU9wORJjkeaISj+Ll6Z9opKoOchLpqTrX/J8xMSgJHd0fJ1G7cnpkz5mMB/0FiANGwTmdA3BtjA7y9qE2REFtnlWvtDMbNGdMJn0XNSxbuwKvJBafsfd1KQ5h/U6e+Cm0qHs0FcVE9S6P1yv5Xq2VWD/YrGHzd5UbYxQJEkOuPzl/H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(376002)(366004)(396003)(2906002)(66556008)(66946007)(76116006)(8936002)(6512007)(91956017)(66476007)(966005)(36756003)(2616005)(8676002)(478600001)(66446008)(110136005)(6506007)(71200400001)(6486002)(33656002)(86362001)(186003)(64756008)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: J7aF51FjrgZci77YZEX2aU0OHzcXtNDf5ZfToKiUw/hzLAMZbTWAMheyuQo3joh9Wydie9w+sQ/eEFYL/gEyZRTcik91wSfWbZPOkDiUYytVIhtEvON9wVfJ3G/k3Byls9A4Ena3vCr6J2JdafE102BLpav6RjsWdC6ZoyJK1tXJ1lE9Z3L0lViyH7fAqv6xCw1u12JzyBlx2vtzIq/8oqYAYzbY0AolW/rwp2APv1anSh7mbP6r1vytFuwmwCuoie0MuISA2RqsCtl/DGs4Y88q01MFU11/WxQKXsA4/1xaUquMbp9/oDqKd2OGvroWicYeGpPEK2xN0VIgJ73Wwrs5J4xnzJCClBeyEzKvDW9w5fG+KsKrqQr2SRxF8jVxugCWmhF3/3gSDD+o35BGfVcmjQCoNuyon3I0Hi/vpgZLiFa9LC3gIeUp47MLqcrM67/294l8mNza87wuhdtggPpQKhqVARvOpHeini276eN+dnIKR1zapzeHM8EpVPiLFCmm1dCUC7xbSWFpENPhIbQXczFg5qJact62lgifJaNpnQckbpR6w1OL5Tbx0nTp4k5Ruv3mJ+tCdIOB0hljTsDkb853LkXj+ZBm2QnpZ3oCAGLd7NyEknf4gkbTpYu72a5he659Q/F/7RSxJxZOYIyRAQZF/jTsP6/OU0gqQ2lnaKcwyMuRI/7fRmXNtv6Z
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1795DFBC9608974081F582D60E8E0B04@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63617df1-002a-4deb-bd71-08d8663cf62a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 19:05:28.5343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uj3jvAOXavVO1PFBRVwdspJVVDN39DQ8nb1JLzng5YvB3WcUfsHxP9SmOuk+wDNIkW/+g1gZJJLBRrENUi75PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2565
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-01_07:2020-10-01,
 2020-10-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1011
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010010155
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

SGkgU3VpLA0KDQrvu79PbiA5LzMwLzIwLCA4OjMwIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2Yg
U3VpIENoZW4iIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIHN1aWNoZW5AZ29vZ2xlLmNvbT4gd3JvdGU6DQoNCiAgICBIZWxs
byBPcGVuQk1DIGNvbW11bml0eSwNCg0KICAgIFdlIGFyZSB3b3JraW5nIG9uIGFuIElQTUkgYmxv
Yi1iYXNlZCBpbXBsZW1lbnRhdGlvbiBvZiBCTUMgaGVhbHRoDQogICAgbW9uaXRvcmluZy4gV2Ug
Y3VycmVudGx5IGhhdmUgYW4gaW50ZXJuYWwgd29ya2luZyBwcm90b3R5cGUgdmVyc2lvbg0KICAg
IGFuZCB3b3VsZCBsaWtlIHRvIHVwbG9hZCBpdCB0byB0aGlzIG5ld2x5IHByb3Bvc2VkIHJlcG9z
aXRvcnksDQogICAgb3BlbmJtYy9nb29nbGUtaXBtaS1ibWMtaGVhbHRoIC4NCg0KSW4gbXkgb3Bp
bmlvbiwgd2UgY2FuIGVuaGFuY2UgZXhpc3RpbmcgaGVhbHRoLW1vbml0b3IgYW5kIGFkZCB5b3Vy
IGZlYXR1cmVzLg0KDQogICAgV2UgYXJlIGF3YXJlIG9mIGV4aXN0aW5nIEJNQyBoZWFsdGggbW9u
aXRvcmluZyBkZXNpZ25zIHN1Y2ggYXM6DQogICAgMS4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvcGhvc3Bob3ItaGVhbHRoLW1vbml0b3IgYW5kIGl0cw0KICAgIGRvY3VtZW50YXRpb24gaHR0
cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19nZXJyaXQu
b3BlbmJtYy0yRHByb2plY3QueHl6X2Nfb3BlbmJtY19kb2NzXy0yQl8zMTk1NyZkPUR3SUJhUSZj
PTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtr
Y3JJYXFVN1VTbDVnJm09Wi1fUnN1ZTFaSEJEX1RnUHc3RURJYzhkaDhFOG84ZGxVZThhS3I3STVW
QSZzPUhUS0VNOHRjSWd3endMNE9RVlAxS2N2ZTZaZm5oU1RvaGR3UG1Jcmp3ZTQmZT0gDQogICAg
Mi4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19n
ZXJyaXQub3BlbmJtYy0yRHByb2plY3QueHl6X2Nfb3BlbmJtY19kb2NzXy0yQl8zNDc2NiZkPUR3
SUJhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNS
ODB2WGtrY3JJYXFVN1VTbDVnJm09Wi1fUnN1ZTFaSEJEX1RnUHc3RURJYzhkaDhFOG84ZGxVZThh
S3I3STVWQSZzPUVjeFNyVTFQQzZBa2Z5MUZSMHdvLTVUQ19Rdk1sZDlTRFQ3cEpBaDVRY00mZT0g
DQoNCiAgICBNYWluIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhpcyBpbXBsZW1lbnRhdGlvbiBhbmQg
ZXhpc3Rpbmcgb25lcyBhcmU6DQogICAgLSBnb29nbGUtaXBtaS1ibWMtaGVhbHRoIGlzIGltcGxl
bWVudGVkIHdpdGggdGhlIElQTUkgYmxvYiBoYW5kbGVyDQogICAgZnJhbWV3b3JrIGFuZCBleGlz
dHMgYXMgYW4gSVBNSSBibG9iIGhhbmRsZXIsIHdoaWxlDQogICAgcGhvc3Bob3ItaGVhbHRoLW1v
bml0b3IgcnVucyBhcyBhIGRhZW1vbiBhbmQgZXhwb3NlcyBCTUMgaGVhbHRoDQogICAgbWV0cmlj
cyBvbiBEQnVzIGluIHRoZSBzYW1lIG1hbm5lciBzZW5zb3JzIGFyZSBleHBvc2VkLg0KDQpJcyB0
aGlzIGdvaW5nIHRvIGJlIGEgbGlicmFyeSBvciBkYWVtb24sIFNhbWUgaGVhbHRoLW1vbml0b3Ig
ZGFlbW9uIGNhbiANCkJlIGVuaGFuY2VkIHRvIGFkZCB0aGVzZSBmdW5jdGlvbmFsaXRpZXMuDQoN
CiAgICAtIFRoaXMgaW1wbGVtZW50YXRpb24gZG9lcyBub3QgY2hlY2sgaGVhbHRoIG1ldHJpYyB2
YWx1ZXMgYWdhaW5zdA0KICAgIHRocmVzaG9sZHMgb3IgcGVyZm9ybSBhY3Rpb25zIHdoZW4gdGhy
ZXNob2xkcyBhcmUgY3Jvc3NlZC4NCg0KSWYgeW91IGRvbid0IGRlZmluZSB0aHJlc2hvbGQgaW4g
Y29uZmlndXJhdGlvbiBmaWxlLCBoZWFsdGgtbW9uaXRvciB3aWxsDQphbHNvIG5vdCBtb25pdG9y
IG1ldHJpY3MgZGVmaW5lZC4NCg0KICAgIC0gVGhpcyBpbXBsZW1lbnRhdGlvbiBjdXJyZW50bHkg
cmVwb3J0cyB1cHRpbWUsIG1lbW9yeSB1c2FnZSwgZnJlZQ0KICAgIGRpc2sgc3BhY2UsIENQVSB0
aW1lIGNvbnN1bWVkIGJ5IHByb2Nlc3NlcywgYW5kIGZpbGUgZGVzY3JpcHRvciBzdGF0cy4NCg0K
U2FtZSBjYW4gYmUgYWRkZWQgYXMgZXh0cmEgbWV0cmljcy4gVGhhdCB3YXMgdGhlIGdvYWwgb2Yg
dGhpcyByZXBvIGFzIHRvDQpzdGFydCB3aXRoIGJhc2ljIG1ldHJpY3MgYW5kIGFkZCBtb3JlIGFz
IHJlcXVpcmVkLg0KDQogICAgLSBUaGlzIGltcGxlbWVudGF0aW9uIGRvZXMgbm90IHJlYWQgYSBj
b25maWd1cmF0aW9uIGZpbGUgeWV0LiBJdA0KICAgIGFsd2F5cyByZWFkcyB0aGUgaGFyZC1jb2Rl
ZCBzZXQgb2YgaGVhbHRoIG1ldHJpY3MgbGlzdGVkIGFib3ZlLg0KDQpXZSBjYW4gZW5hYmxlIG9y
IGRpc2FibGUgY2VydGFpbiBtZXRyaWNzIHRocm91Z2ggdGhpcyBjb25maWd1cmF0aW9uIGZpbGUu
DQoNCiAgICAtIFRoaXMgaW1wbGVtZW50YXRpb24gZG9lcyBub3QgcG9zdC1wcm9jZXNzIHNlbnNv
ciByZWFkaW5ncyBzdWNoIGFzDQogICAgY29tcHV0ZSB0aGUgYXZlcmFnZSBDUFUgdXNhZ2Ugb3Zl
ciBhIGNlcnRhaW4gdGltZSB3aW5kb3cuDQoNCldpbmRvdyBzaXplIDEgY2FuIGdpdmUgbGF0ZXN0
IGRhdGEgcmF0aGVyIHRoYW4gYXZlcmFnZWQgZGF0YS4NCg0KICAgIEFzIHN1Y2gsIHRoaXMgaW1w
bGVtZW50YXRpb24gZGlmZmVycyBlbm91Z2ggZnJvbSBleGlzdGluZyBvbmVzIHN1Y2gNCiAgICB0
aGF0IHdlIGJlbGlldmUgd2UgaGF2ZSBlbm91Z2ggcmVhc29ucyB0byBoYXZlIGEgc2VwYXJhdGUg
cmVwb3NpdG9yeQ0KICAgIGZvciBpdC4NCg0KSSB3aWxsIHN0cm9uZ2x5IHByZWZlciB0byBhZGQg
YWxsIG9mIHRoZSBmZWF0dXJlcyBpbiB0aGUgZXhpc3RpbmcgcmVwby4NCg0KICAgIFRoYW5rcyEN
Cg0K
