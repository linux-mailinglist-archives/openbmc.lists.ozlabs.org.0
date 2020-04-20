Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A01B141E
	for <lists+openbmc@lfdr.de>; Mon, 20 Apr 2020 20:13:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495ZZW00HlzDqlZ
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 04:13:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=13794f8ec5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=ZziHKTpP; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=PqqYTQYF; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495ZYR2NFCzDqG9
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 04:12:34 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KIAccc025115; Mon, 20 Apr 2020 11:12:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=QmtmLVZ6ACA/BQh8+u0wtpHg4QRfxAcevD/6VdkMoSg=;
 b=ZziHKTpPbKpKfK82cZJJID7mbVQ8DcxFp1DQX/RvKQNQTfnTm70Zs+ryGjU6FpOBh+Qb
 NPqnwM+V5JWnm9cx2DXgAdEL8O7NZZAYxiV+D0SXqjEfWxhSugLWYE37g7OkehY+r3s8
 46SI4YNIfu9Ls8zWLyaSpqVgQo6z0xXVCnY= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 30ghpwef52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 20 Apr 2020 11:12:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 20 Apr 2020 11:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4UcQuSh/erqX+L0TCMBiFlyQ30ot00B+gAu6JOi/lI85Wr4h3onrfUlRA8KlhFqu4KCGY8AkH5CUzixs1D9Kmavh4annCeUZ2B/uRGVP2v8q+hina9e/qKR10+K/vH0v1w8ftZgzoC2CwElBlSgk4Nye8p9RfA9c2oLPEPoKIwUOPxbC/zXcYXjdyQfr9WsW4XjRA+AldrUoAJPANFJ6z933uvlkIaKM1ordsQKyEehsavyYVt75mLiAgRgcYpFsQixnidBnFTAVbWoFWWuDEnNp7TPSV10QvnrwubTfJyvsUiGHNvIvTrE7Ja45SFFd8sT5WUdlkuTkpM9b0QMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmtmLVZ6ACA/BQh8+u0wtpHg4QRfxAcevD/6VdkMoSg=;
 b=CTfptn0epIQ5Qoch7MRvxD6rKXYY4CAgQyb865igceuvQ1hfcQ5pyV+fT8H76ACCroR4fxMmYn2jmd6pcIeUkmYz1VrYh1q4uVW8uotzl69LF3mcnkhwPIjilA+M11ZiHJ7Nw0p1C/n/n1iOjdtptjemo6y0vLZvJNsxXyYBuCg2PbJiZ4p67e+AQ31ia3JY99DcAhHYJhsSRLI4Z9ztcP4zkyVL2bYrAVRYqrtVJBESGa4qn3/9Slxz80AjVg4QRgERvc5oFaGN6B/grIkTxed3SC6yJ5UjgnNA2/EiOg1uq2BmbTo42a1reFqGmeEmnKqtIEK9Z4qtffvGLRpRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmtmLVZ6ACA/BQh8+u0wtpHg4QRfxAcevD/6VdkMoSg=;
 b=PqqYTQYFAEY9RDTTBURrmGbRbT3r6YxAqUnDeDF+11cTDlrA26z6kJMX4su9QeEEX/E1h/6QYui2ORauUn2zQ5AHrfhuyFvyBnGFSPdrUfRtzEyKF2FZyIwaR3yCofA2yHrOYU6Ni4otpUbdqk5WvWArdQ2eHs30AIGdPdeau54=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2935.namprd15.prod.outlook.com (2603:10b6:a03:fd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 18:12:27 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 18:12:27 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Oskar Senft <osk@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Access Intel ME IPMB from BMC
Thread-Topic: Access Intel ME IPMB from BMC
Thread-Index: AQHWFexuK6oXnP3TQkeAetsUpPklTKiB3UuA
Date: Mon, 20 Apr 2020 18:12:27 +0000
Message-ID: <70D0A47B-9C5B-418C-BC1F-7379493C60AA@fb.com>
References: <CABoTLcSOQYY+gk=7Q2w6Ny02L15yM19vTPmJxDfZVst6FV5r+Q@mail.gmail.com>
In-Reply-To: <CABoTLcSOQYY+gk=7Q2w6Ny02L15yM19vTPmJxDfZVst6FV5r+Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 099cbce0-3334-4eff-430c-08d7e5566235
x-ms-traffictypediagnostic: BYAPR15MB2935:
x-microsoft-antispam-prvs: <BYAPR15MB2935D1F4A22AB0222E3FE8B5DDD40@BYAPR15MB2935.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(396003)(376002)(346002)(136003)(366004)(316002)(66556008)(66946007)(66446008)(64756008)(66476007)(2616005)(478600001)(186003)(966005)(6506007)(53546011)(76116006)(110136005)(8676002)(8936002)(81156014)(33656002)(6486002)(71200400001)(6512007)(9326002)(5660300002)(36756003)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tkE7Yx2h2uO2ukzOKibd+2OZw+HbLXYc+LYVNbpFdzEaNbe70Vk5y+pnPZkAWvpKmKMc5H6HbQG6HpaVFEjzYBQVCnK+gEKgnS4E1QjEmsI0Wug3kCesvLr0XotyG/hDODPq84aH8NuseGjVVxRzbvBL6QYMzCNgIZqvUAl46F+KnPMJRrQCfZVFkk3RlauFODcyBIWMVWWMC+fP5SHl36lWFZ3wV9hAwU3JqeKy0zeX0cMGZUSBOBPTQE2OTRE5sg/d8wnCrnFfgWkoCYWCeljXuXiPMu2TmfV2fUivvULHxrEZ9VuqN9Gz+W3nQxiXVypZpurkbM1oYvPyJuB2lU+VY/jWaeM4+8jLXw6E0PmFfV04FtALQQ1+Q+01zM9Xa0xVO89r5XLRtcAuTjdf78sazcCeVXpccHzs9DeR1Uv0LXlgTfDmt/85RrSUlAjGNGaBID2jrwbjkSTp9x0RsGRSTwARr+ygK918DUGAr30RELRFSw+55fkyjwmCQptwTusCuSf543uFWS/qiZsKCg==
x-ms-exchange-antispam-messagedata: yDL8avPBNqxc/G27l25fvAvcMFaGKSBf9FVmPoVU79yI/e/RHJdi4FBJLTd0O+SLmrTBvvOB6RLZaifjb1Z3dYmxN+6zk4DqebE9eDz0ftiBUetBov3Vv0fg34E8S8IRU/I3Ev8ZjFZf5EjlZbMNDXpzCyJNDmcZdDsbTxEgOk4KrZQ4qfKW5TsIFaqDaOzt0yXpvZHx24cal/jrR0/bTA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_70D0A47B9C5B418CBC1F7379493C60AAfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 099cbce0-3334-4eff-430c-08d7e5566235
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 18:12:27.2831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IPkoFETGkmRYHDz2qVel2jg/1mvwPgZodfqtEHR1suvtSNVtVo/BUqVvG8d1XHMZd64EfukmMoJPRn5C6YG46w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2935
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_07:2020-04-20,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004200147
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

--_000_70D0A47B9C5B418CBC1F7379493C60AAfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgT3NrYXIsDQpZb3UgbmVlZCB0byBjb25maWd1cmUgeW91ciBNRSBjaGFubmVsIGluIGlwbWIg
Y2hhbm5lbCBjb25maWcgZmlsZSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9pcG1iYnJpZGdl
L2Jsb2IvbWFzdGVyL2lwbWItY2hhbm5lbHMuanNvbg0KQW5kIG1ha2Ugc3VyZSBpcG1iYnJpZGdl
IGlzIHJ1bm5pbmcuIFRoZW4geW91IGNhbiBzZW5kIGdldCBkZXZpY2UgaWQgY29tbWFuZCB0byBN
RSBmcm9tIGNvbW1hbmQgbGluZSBpdHNlbGYgdG8gdGVzdCBpZiBldmVyeXRoaW5nIGlzIHdvcmtp
bmcuDQoNCg0KDQpidXNjdGwgY2FsbCB4eXoub3BlbmJtY19wcm9qZWN0LklwbWkuQ2hhbm5lbC5J
cG1iIC94eXovb3BlbmJtY19wcm9qZWN0L0lwbWkvQ2hhbm5lbC9JcG1iIG9yZy5vcGVuYm1jLklw
bWIgc2VuZFJlcXVlc3QgeXl5eWF5IDEgNiAwIDB4MSAwDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQpG
cm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96
bGFicy5vcmc+IG9uIGJlaGFsZiBvZiBPc2thciBTZW5mdCA8b3NrQGdvb2dsZS5jb20+DQpEYXRl
OiBTYXR1cmRheSwgQXByaWwgMTgsIDIwMjAgYXQgNjo0NyBQTQ0KVG86IE9wZW5CTUMgTWFpbGxp
c3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IEFjY2VzcyBJbnRlbCBNRSBJ
UE1CIGZyb20gQk1DDQoNCkhpIGV2ZXJ5b25lDQoNCkknbSB0cnlpbmcgdG8gZmluZCBvdXQgaG93
IEkgY2FuIGFjY2VzcyB0aGUgSW50ZWwgTUUgdmlhIElQTUIgZnJvbSB0aGUgQk1DIChPcGVuQk1D
KS4NCg0KRnJvbSB3aGF0IEkgZ2F0aGVyZWQsIEludGVsIE1FJ3MgSVBNQiBpcyBvbiB0aGUgUENI
J3MgU01MaW5rMC4gSSBrbm93IHRoaXMgaXMgY29ubmVjdGVkIHRvIG9uZSBvZiB0aGUgU01CdXMg
bW9kdWxlcyBvbiBteSBBU1QyNTAwLiBCdXQgd2hhdCBJIGNhbid0IGZpbmQgb3V0IGlzIGhvdyBJ
IGFjdHVhbGx5IHNlbmQgY29tbWFuZHMgdGhlcmU/IEknbSBzdXJlIEknbSBtaXNzaW5nIGEgZG9j
dW1lbnQgdGhhdCBtYWtlcyB0aGlzIG9idmlvdXMuDQoNCk9yIGlzIGl0IGFzIHNpbXBsZSBhcyBk
cm9wcGluZyBJUE1JIHBhY2tldHMgb250byB0aGUgYnVzPw0KDQpJcyB0aGlzIGJ5IGFueSBjaGFu
Y2UgYWxyZWFkeSBpbXBsZW1lbnRlZCBpbiBPcGVuQk1DPw0KDQpUaGFua3MgZm9yIGFueSBoaW50
cyENCg0KT3NrYXINCg==

--_000_70D0A47B9C5B418CBC1F7379493C60AAfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <190AB60832E79B49843C7D539CCE0C38@namprd15.prod.outlook.com>
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
DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXtt
c28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjNDMTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFs
LXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRv
d3RleHQ7fQ0KcC5wMSwgbGkucDEsIGRpdi5wMQ0KCXttc28tc3R5bGUtbmFtZTpwMTsNCgltYXJn
aW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6OC41cHQ7DQoJZm9u
dC1mYW1pbHk6TWVubG87DQoJY29sb3I6YmxhY2s7fQ0Kc3Bhbi5zMQ0KCXttc28tc3R5bGUtbmFt
ZTpzMTt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglm
b250LXNpemU6MTAuMHB0O30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBp
bjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0K
CXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0i
RU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRT
ZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSBPc2thciw8bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPllvdSBuZWVkIHRvIGNvbmZpZ3VyZSB5b3VyIE1FIGNoYW5u
ZWwgaW4gaXBtYiBjaGFubmVsIGNvbmZpZyBmaWxlDQo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vb3BlbmJtYy9pcG1iYnJpZGdlL2Jsb2IvbWFzdGVyL2lwbWItY2hhbm5lbHMuanNvbiI+aHR0
cHM6Ly9naXRodWIuY29tL29wZW5ibWMvaXBtYmJyaWRnZS9ibG9iL21hc3Rlci9pcG1iLWNoYW5u
ZWxzLmpzb248L2E+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5BbmQgbWFr
ZSBzdXJlIGlwbWJicmlkZ2UgaXMgcnVubmluZy4gVGhlbiB5b3UgY2FuIHNlbmQgZ2V0IGRldmlj
ZSBpZCBjb21tYW5kIHRvIE1FIGZyb20gY29tbWFuZCBsaW5lIGl0c2VsZiB0byB0ZXN0IGlmIGV2
ZXJ5dGhpbmcgaXMgd29ya2luZy48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4g
Y2xhc3M9InMxIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0icDEiPjxz
cGFuIGNsYXNzPSJzMSI+YnVzY3RsIGNhbGwgeHl6Lm9wZW5ibWNfcHJvamVjdC5JcG1pLkNoYW5u
ZWwuSXBtYiAveHl6L29wZW5ibWNfcHJvamVjdC9JcG1pL0NoYW5uZWwvSXBtYiBvcmcub3BlbmJt
Yy5JcG1iIHNlbmRSZXF1ZXN0IHl5eXlheSAxIDYgMCAweDEgMDwvc3Bhbj48bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+UmVnYXJkczxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
LVZpamF5PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwv
bzpwPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0I1QzRE
RiAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9tOiA8L3Nw
YW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5vcGVuYm1j
ICZsdDtvcGVuYm1jLWJvdW5jZXMmIzQzO3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMu
b3JnJmd0OyBvbiBiZWhhbGYgb2YgT3NrYXIgU2VuZnQgJmx0O29za0Bnb29nbGUuY29tJmd0Ozxi
cj4NCjxiPkRhdGU6IDwvYj5TYXR1cmRheSwgQXByaWwgMTgsIDIwMjAgYXQgNjo0NyBQTTxicj4N
CjxiPlRvOiA8L2I+T3BlbkJNQyBNYWlsbGlzdCAmbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
Jmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5BY2Nlc3MgSW50ZWwgTUUgSVBNQiBmcm9tIEJNQzxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+SGkgZXZlcnlvbmUgPG86cD48L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj5JJ20gdHJ5aW5nIHRvIGZpbmQgb3V0IGhvdyBJIGNhbiBhY2Nlc3MgdGhlIEludGVsIE1F
IHZpYSBJUE1CIGZyb20gdGhlIEJNQyAoT3BlbkJNQykuPG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2
Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkZyb20gd2hhdCBJIGdhdGhlcmVkLCBJbnRl
bCBNRSdzIElQTUIgaXMgb24gdGhlIFBDSCdzIFNNTGluazAuIEkga25vdyB0aGlzIGlzIGNvbm5l
Y3RlZCB0byBvbmUgb2YgdGhlIFNNQnVzIG1vZHVsZXMgb24gbXkgQVNUMjUwMC4gQnV0IHdoYXQg
SSBjYW4ndCBmaW5kIG91dCBpcyBob3cgSSBhY3R1YWxseSBzZW5kIGNvbW1hbmRzIHRoZXJlPyBJ
J20gc3VyZSBJJ20gbWlzc2luZyBhIGRvY3VtZW50IHRoYXQgbWFrZXMNCiB0aGlzIG9idmlvdXMu
PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpw
PiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9y
IGlzIGl0IGFzIHNpbXBsZSBhcyZuYnNwO2Ryb3BwaW5nIElQTUkgcGFja2V0cyBvbnRvIHRoZSBi
dXM/PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PklzIHRoaXMgYnkgYW55IGNoYW5jZSBhbHJlYWR5IGltcGxlbWVudGVkIGluIE9wZW5CTUM/PG86
cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZu
YnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoYW5r
cyBmb3IgYW55IGhpbnRzITxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5Pc2thcjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2
Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_70D0A47B9C5B418CBC1F7379493C60AAfbcom_--
