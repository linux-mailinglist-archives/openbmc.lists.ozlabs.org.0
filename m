Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 097FD14754D
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 01:14:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483flq12SVzDqbx
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 11:14:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=82929cf7d0=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=oTm190Ly; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=hKiYZSkd; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483fl22KY8zDqb1
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 11:14:02 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00O0BBWG002743; Thu, 23 Jan 2020 16:13:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=q33+/XNxrFF+4jkYYkJkSW6ksJZ02RJFeEnYssvnVCk=;
 b=oTm190LyToc8+6uUJiSOTfVWtuWyJDzraFVhCeRFrfOrPB/F7ZFI+em1ubFvnXl0aorT
 gcQreXoX1VLl5DAkNpPipg4h5z5fLiIaiyGIn+hbezni8uMJIw9H757BEmdH50pSMED/
 oEPHWG7Vi4zueTN2X1ZhiNrnaIkUhUgO5Ng= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xqgc5sjfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jan 2020 16:13:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 23 Jan 2020 16:13:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khdiiCiq8FgkP/uLL1S+KuCAq28t3yStzb4kPOge3JQatOvuycjkH/gYclkcKKPky0C+5xP17/q4I4EIF1pZ0nYAoLOweKahlNU55RqYMiBa6o+vlrWIQVP30mDjyLS3WCTjgRhXkg3De27/QdvFtPV0XhI1z1f9SZYNfxp1KnikjJZGTZ4B56CGEC6iBs67TfytLt2FwSal0XPJcIEcaNSl0Hag34bvJCx0Bn46U67ui3w/tj/OO7t0IkXWIEODFLswOzkd/pDNTwX17xJo9jhWzAU3R88GmgPmZxXYGCSoC1SnpNG3hQQo9Fraq+N0aXgbQfosuuCXNMnf+0fipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q33+/XNxrFF+4jkYYkJkSW6ksJZ02RJFeEnYssvnVCk=;
 b=QvzPGeVCBWnEmZVUS63iIGsZfNpecQ/scyTfAoZ6S/CWZqkN4lnymPPVrmgzKViz5I4E9S4udzDy8wr4WNiAuUYGjQphkyvXgUD8SJWa5/ZMkSeAAl8gmlPcJy2Uh3nrGT/qZfi/6yy5MKdzn7OwT7jaA3kqSntbRJhOT0hDe61+YRpJ0XNUo2DV4RHvtO3+E32rX9R8wVw7+NxrhvfUgC9GjWeVfL+c7olueRf0UPGBb3Bld3DFoCGeCHLLQIpdhGySzdMYl3MW477Sj5qh0J0jmwXorKuEa2AtvTB3to7yl18Kj1eT8q2u4z+pYzFdqnKV9r9P3I3hzZeIx0sNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q33+/XNxrFF+4jkYYkJkSW6ksJZ02RJFeEnYssvnVCk=;
 b=hKiYZSkdcSkUqf4+xx+bBpB++aX3DrpAyk9BMHmBSJ1PR9ot37+P/BV5/pzYChCnnj/bv/DIFhtQoh2f2FbF//Y6aTpchVVu58mU3K5GVHd2MVDmQmFRQcURMuT2qkKlclxb6Jd0C7KOyX4suvfSr3p9N+iLFxC6EfFNoTTHGuM=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1389.namprd15.prod.outlook.com (10.173.235.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Fri, 24 Jan 2020 00:13:57 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.028; Fri, 24 Jan 2020
 00:13:57 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, James Feist
 <james.feist@linux.intel.com>
Subject: power button override
Thread-Topic: power button override
Thread-Index: AQHV0ksr3xkr2xM5GUmL71a8unTXDQ==
Date: Fri, 24 Jan 2020 00:13:57 +0000
Message-ID: <98EE6AEE-9440-4AA5-971A-833EA0342226@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:c2ea]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b82a1838-1c64-49a7-8251-08d7a0624e54
x-ms-traffictypediagnostic: MWHPR15MB1389:
x-microsoft-antispam-prvs: <MWHPR15MB1389C79A8E3EE1F450DFBBEDDD0E0@MWHPR15MB1389.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(376002)(366004)(346002)(39860400002)(189003)(199004)(9326002)(86362001)(7116003)(5660300002)(2906002)(558084003)(66446008)(66556008)(76116006)(3480700007)(64756008)(66476007)(2616005)(66946007)(6512007)(71200400001)(81156014)(8676002)(316002)(8936002)(33656002)(81166006)(186003)(36756003)(6506007)(110136005)(6486002)(478600001)(4326008)(133083001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1389;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yMRhC9b04Wrd6iHZhRDLIVxdS8MAS9QUiH/VKUO345EljBYGbvj3Kp6ezDAz5BWxbxl92eX216y3SasJ7ocKAJ+XZ2c0J/B7QvzBpe5mCw6EjN0eyzHLgea5abG0vALwOIKQVAy2BnGfA73dD6kH7dKjR6PEYmO09Kg2gY12x6gkgMClh1q9sWq6HqEgMoqAgONhZVSeGlYrNq9DRIjVHjnvxW0JmIjJN1qS0nyvD7jzRft0iL0pT6KbQW/Lvzoll187KZUfuHTopni0ydQ/2uJFYqIBdxvLhdU7dChrIV0cyyUGivPXdu5PYjxkElOEC5Eyy3Dx/hpVeG3i1L9D4iFuHfSOU7mP3W13CF/MvzDLFMZmCgtWpJ7YVrn+bLbqFmX6I+NOXzGHLOjF7ZZj9kX8fG9KcGJsi1l9Cq68mvQwYAh8jb40KCQQEXFZ4NoTWukro9gPssF9y4HRvDQBJ6wYV0wHC95BFvDK+1kMWQ8=
x-ms-exchange-antispam-messagedata: W5yh4vGmQ0U0c3obMCLOEFVx1AaSUuANZJHIAIbu11wvrL1WCi+GbhmLC/7DN3m0TAAzmxLswAU6EbE5CxfBoVYHdWRTCtM8ro1xQf5eqwDqKpb561Qc+ZzZTQ5NPMVPuAxNzHZ85Rj0eh0NVHn27FOZS9/lZBFGd3vipih2c9bIXX80SKYsiPeb8nSqLSyA
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_98EE6AEE94404AA5971A833EA0342226fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b82a1838-1c64-49a7-8251-08d7a0624e54
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 00:13:57.6735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +XEXqQFboSyjd1X4Iw+4COutkMTp6PA26afAgYpo5IufLBmEbGvqdlthpaoMuJ3PSWAeJZ9gu5qm+Yu8egv+VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1389
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_13:2020-01-23,
 2020-01-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 adultscore=0 mlxlogscore=517 mlxscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001240000
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

--_000_98EE6AEE94404AA5971A833EA0342226fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFzb24sDQpXZSBoYXZlIGEgcmVxdWlyZW1lbnQgb2YgcG93ZXIgYnV0dG9uIG92ZXJyaWRl
LiBJIGRvbuKAmXQgc2VlIHg4Ni1wb3dlciBjb250cm9sIGRvZXNu4oCZdCBzdXBwb3J0IHRoaXMg
Y3VycmVudGx5LiBEbyB5b3UgbmVlZCB0aGlzIGZlYXR1cmVzIG9yIGRvIHlvdSBoYXZlIGFueSBs
b2NhbCBwYXRjaCBmb3IgdGhpcy4NCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_98EE6AEE94404AA5971A833EA0342226fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <3EA63609C9F73042B654474DF59F0E8D@namprd15.prod.outlook.com>
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
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6
d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25s
eTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3JkU2VjdGlv
bjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGlu
O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4N
CjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3
MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpIEphc29uLDxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5X
ZSBoYXZlIGEgcmVxdWlyZW1lbnQgb2YgcG93ZXIgYnV0dG9uIG92ZXJyaWRlLiBJIGRvbuKAmXQg
c2VlIHg4Ni1wb3dlciBjb250cm9sIGRvZXNu4oCZdCBzdXBwb3J0IHRoaXMgY3VycmVudGx5LiBE
byB5b3UgbmVlZCB0aGlzIGZlYXR1cmVzIG9yIGRvIHlvdSBoYXZlIGFueSBsb2NhbCBwYXRjaCBm
b3IgdGhpcy48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2Fy
ZHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+LVZpamF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+
DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_98EE6AEE94404AA5971A833EA0342226fbcom_--
