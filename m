Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6CA1AA0F5
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 14:33:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492MGS4z0VzDqKf
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 22:33:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1374acb622=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=ZeNhN5jL; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=aooKJ34X; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492M8Q4T6szDr0f
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 22:28:21 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FCRk22000475; Wed, 15 Apr 2020 05:28:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=BoPc3uI/bT7BagO9iKV5uulUK1t9T16wlzJfqNKHky4=;
 b=ZeNhN5jLZFUnkm61uMmdf8c+K0udZoJJ2gXnfah9c2+n52Y9Lk0ViYAVVzAn+CBKRwjb
 i70VuTDTqeVHJtCwaOizTI5o97GLu7rc2KJ2HDecipR9iDOyvZWPOZp3h2F4pQQBZWxq
 QnKYcygKH1pJguSaCJGwlr4Wk+sUK1X8ZcQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30dn82nkjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 15 Apr 2020 05:28:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 15 Apr 2020 05:28:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVyyBgw4sSYRdNQJpKIofjCZil4+q0/NgrGOvKxCtzQ4xxmZGNYqK3QwnxNYo5pXNULuM0Jd/ae6YwmqwbxbU5wxH9tja42wCQdlbbJnGZPwF84QIbIOapUeI1Zmb9PO9rir5gT14AJTv4DmzuVlLwuL7ZNUS39mhJ0mFGGBEk4s/SL/tiWFHP//RUGQ4HrQOe5lJQYMbcOFRaG6Edg/d4lEHPFhFUpNW0dz7esltOkL+iIaL2nHdFd4U36wzzAwzjgqnFjc1uNRoerrXa2+135tymGt6g391u9nH8dd/jjoI2freX7ZcFTLw1ZfMq+ebllai8lDbr+xKGb0HeYwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoPc3uI/bT7BagO9iKV5uulUK1t9T16wlzJfqNKHky4=;
 b=Y2oaLkaUH2vZFO/gX0DvN0BcC3NlrmOpHMNRZ1cCwUdRBR0d0Fqt2L88A/lHuIQ4KiOD91ryl4FrHrBg5WZwJxlH9aALh7YsqK55qSsdYHyil10qk8juukTG0xJjQwnVic6bNJ/RW7hHjSkmz2r66OeYKxtt/QHCBzBvKO0WDjy1gXTsgZasY+YNIGm1xHKiGnvWrsURpUf0Dz+9ilrXStKdVvL+bD+cGNvRQCkyQj9Y4dfrgwnsN+4HstkJjdKVQDEiEYTyQhwk2NzqwOxNJc5oSsu/YJrp90afYSlFSfXZDOpaqMCudKcgsbNC72nAiNZK8b+zN/NiktRcU74HMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoPc3uI/bT7BagO9iKV5uulUK1t9T16wlzJfqNKHky4=;
 b=aooKJ34XC2QEXCvf00Rww8mrBSIjAU7zavODWcz54bxMHfgviX75kav9+YfV5JFC83BGVPjoiaMq6colRHOGlShP0V89Z/zeSbDsWTbwCSwl9mJLN1hhqIZ4KPaBaLjMRsB8KXiTJ2ndfa9fir86t0MPD9wC2FOIXLphY16E+uM=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB4027.namprd15.prod.outlook.com (2603:10b6:303:4f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Wed, 15 Apr
 2020 12:28:14 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8%4]) with mapi id 15.20.2921.024; Wed, 15 Apr 2020
 12:28:14 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Subject: Re: nvme sensors
Thread-Topic: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV76h5pxOA
Date: Wed, 15 Apr 2020 12:28:14 +0000
Message-ID: <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
In-Reply-To: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6ff6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09ac8564-24e9-4692-15ef-08d7e138783c
x-ms-traffictypediagnostic: MW3PR15MB4027:
x-microsoft-antispam-prvs: <MW3PR15MB40275C05F093A728BCF33592DDDB0@MW3PR15MB4027.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(366004)(136003)(396003)(39860400002)(346002)(2616005)(316002)(64756008)(4326008)(5660300002)(76116006)(66556008)(66446008)(53546011)(6506007)(7116003)(186003)(66476007)(66946007)(2906002)(6916009)(33656002)(4744005)(81156014)(8936002)(8676002)(478600001)(36756003)(6512007)(3480700007)(6486002)(71200400001)(86362001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IoT/mJKJndOdcp7vQQolB31Wqp9+rSmtBZKOaBFAen2gmkspupfmH+VrUBpcqZS17JdD9l0NlKMeslRfInPjsogwSYQg/T9kGVz7RNVNCjgeYWzqOwlZcw1wK6idbXJEzlXkYgIc+/r6kvo6uGyGHv02eUZSj++CPcWUe+hi/8i76EOUxCE3ORqMqQMrr/K3c/cpfCaIBiAxI1PHX63ZvFHfcL96AoWOdCcdBN66QwevW4BBWbx0MaqqdAh+R03Q1ADnAiYkq6xTn86fsMtfgHZpfm78v211CqewbaVOb9bhTHeN18tSXJULKQVUm7gngwZBsUTu4hnbvtgtcKbi8JvLLfW/2rNDSPxQulyU/1r+2/CBr9oNum2csaEc/ODuhnMNkLaAB0fiYoANeiQE044cnxyptl/nYawJpqnuPHQs0LcaTiqzS776kPP7Wij/
x-ms-exchange-antispam-messagedata: fFlK55xMqKMs/l2EPcEITcXwu3zEtpQS6laA9z5HXe/1BNoooF15r1a3JlWlHc4CzKvgl6YcxQh7L01sroQ/hr3Mmvi9zMW+KZqaPDWmsWK5JkCPfyd5Qz0L72+S05a6PAqkEjyaJqzckBrzKlsYKwm+nwUs+NhL59K+6/ozkYjbIlL48k8FvfpNQKyRleeN
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_8022481D7C724A7BAF9CD144177B4C88fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ac8564-24e9-4692-15ef-08d7e138783c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 12:28:14.5685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DICP1vHU342lMCwdcxKYtOFXHzNEqUBhn5G5rjyMk5enP0Ako1VXy6Wcxrmk5ZaEPNqFjPPdGo3zavM+0SmypQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB4027
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_04:2020-04-14,
 2020-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=890
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004150093
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

--_000_8022481D7C724A7BAF9CD144177B4C88fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIHBsZWFzZSBpZ25vcmUgdGhpcywgSSBmb3VuZCBOVk1FIGluIGRidXMtc2Vuc29ycy4g
SSBuZWVkZWQgdG8gdXBkYXRlIHJlcG8gaW4gbG9jYWwgd29ya3NwYWNlLg0KDQpSZWdhcmRzDQot
VmlqYXkNCg0KDQpGcm9tOiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCkRhdGU6
IFdlZG5lc2RheSwgQXByaWwgMTUsIDIwMjAgYXQgNTowNyBBTQ0KVG86ICJqYW1lcy5mZWlzdEBs
aW51eC5pbnRlbC5jb20iIDxqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20+DQpDYzogIm9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZyIgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6
IG52bWUgc2Vuc29ycw0KDQpIaSBKYW1lcywNCkRvIHdlIGhhdmUgc3VwcG9ydCBmb3IgTlZNRSBz
ZW5zb3JzIGluIGRidXMgc2Vuc29ycz8gSSBzZWUgcGhvc3Bob3ItbnZtZSByZXBvIHdoaWNoIG5l
ZWRzIGNvbmZpZ3VyYXRpb24gZnJvbSB5YW1sIGZpbGUsIGlzIGl0IHBvc3NpYmxlIHRvIGludGVn
cmF0ZSB0aGlzIHdpdGggZW50aXR5IG1hbmFnZXI/DQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_8022481D7C724A7BAF9CD144177B4C88fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <4B93DF63EC95F44FB84538D45C47267B@namprd15.prod.outlook.com>
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
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndp
bmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7
DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAx
MS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlv
bjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxh
bmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8ZGl2IGNsYXNzPSJX
b3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMS4wcHQiPlNvcnJ5LCBwbGVhc2UgaWdub3JlIHRoaXMsIEkgZm91bmQgTlZNRSBpbiBkYnVz
LXNlbnNvcnMuIEkgbmVlZGVkIHRvIHVwZGF0ZSByZXBvIGluIGxvY2FsIHdvcmtzcGFjZS48bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+LVZpamF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTti
b3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPkZyb206
IDwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5WaWpheSBLaGVta2EgJmx0O3Zp
amF5a2hlbWthQGZiLmNvbSZndDs8YnI+DQo8Yj5EYXRlOiA8L2I+V2VkbmVzZGF5LCBBcHJpbCAx
NSwgMjAyMCBhdCA1OjA3IEFNPGJyPg0KPGI+VG86IDwvYj4mcXVvdDtqYW1lcy5mZWlzdEBsaW51
eC5pbnRlbC5jb20mcXVvdDsgJmx0O2phbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbSZndDs8YnI+
DQo8Yj5DYzogPC9iPiZxdW90O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZxdW90OyAmbHQ7b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5udm1lIHNlbnNv
cnM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wPg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+SGkgSmFtZXMsPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkRvIHdlIGhhdmUgc3VwcG9y
dCBmb3IgTlZNRSBzZW5zb3JzIGluIGRidXMgc2Vuc29ycz8gSSBzZWUgcGhvc3Bob3ItbnZtZSBy
ZXBvIHdoaWNoIG5lZWRzIGNvbmZpZ3VyYXRpb24gZnJvbSB5YW1sIGZpbGUsIGlzIGl0IHBvc3Np
YmxlIHRvIGludGVncmF0ZSB0aGlzIHdpdGggZW50aXR5IG1hbmFnZXI/PC9zcGFuPjxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPiZuYnNwOzwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPC9zcGFuPjxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1W
aWpheTwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_8022481D7C724A7BAF9CD144177B4C88fbcom_--
