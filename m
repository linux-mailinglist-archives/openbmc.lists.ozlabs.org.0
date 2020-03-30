Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 973EC198508
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 22:00:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rjxm70Q2zDqYn
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 07:00:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=135822d9d6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=EfPVs7YP; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=JOrzyUCZ; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rjwx0p7NzDqXm
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 06:59:50 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UJrlqb000795; Mon, 30 Mar 2020 12:59:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=tkxsSvk9L1Rh6JHPVuNG3i7ZSO9cBiTdB7Ahjc8QBc0=;
 b=EfPVs7YPVe0kddfdNpH4QVAhmRMUssZdvOju8hV4q2AYqjIMOlWYW/mSKnZrLBU2q3r5
 zWu48oqhPMI2nI5ie8gZ7CUS1xdND1wrdodJjJs5QI8+Dcuy7Le6cZGKHyHEv6GC3aiV
 FrklD13GA3XE4QjnGGje6+VGmFkkiz6yJMU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 302pgedegg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 30 Mar 2020 12:59:47 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Mar 2020 12:59:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNEzID6iklmnV0Ibt/+ePdEbOE30ZRxP/CAOE7tf9wjobCYHFYULPNyjWruYrWFB5kxdn4l9A18LVCJ/ibUzpqlGT1CJN530XOE5fL28iURs0+iqKdawsLvmPHBAAUD+kPZNtdG7OC9ryM9hMPb+7DA6b2U1q0SW1haIxha5BSW2hAh+2xHjXjOsjZx0ZPcSXiOd3wb/tzeGKkCEt4Wik/oQcjHhx5jZNRCb8YR1MarBX3+UldGGggGDk2ARRfIL3O/M6a5yJ+fnBtALWj4WcrYwxHArLBBlSqzwIu7kKM7RR/Rp44CzcoXFEux/4xiOBMiwN23PJ+qzgHL9cVdhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkxsSvk9L1Rh6JHPVuNG3i7ZSO9cBiTdB7Ahjc8QBc0=;
 b=W/QhPHEhLsIgRk9j+HfSjI+YKXSOKewGG5snBZifk2dFTdO5oUjGAMEY6mMVZ0Wzwtab10Z2A+dl2s0dULtAiWa98by2OfPbdF66Ckz9DH4aoxEaVOdidnh4iJwkdcFvopNnT1G6KVYHS6eUjjg4x+VaShisLDH8kLWXWcIS6XCBcLc8bCzYbO4XMYsjM3SM6Cc2j1o48BEDYDgXjCJtsJvWT7w7oIjQZqTDdOAhjfa2OoTXDyjKwCIMIloPKQ0hOMdd4maKE/Jbyk6rSvGQyZTYHFonOc6v2wdmDr+GxyhlLZFTIdu806U9Z3g67EAx2JpjOaDBcjLpXI9WREhPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkxsSvk9L1Rh6JHPVuNG3i7ZSO9cBiTdB7Ahjc8QBc0=;
 b=JOrzyUCZYJwW5UJqNW55I0oWyqWvgES24K7QCtGIWcZn/bUVRn62aaRVl1C0LdH3iDLIFW/P3zEhm7BqFV/DtcVLIKXRfK8yxV4lBs/3MtLlqE0vbrpsFni7mLzJZBgTgV7NtVrj8Y//z0mcJKNpuafjOOwuQMzriselELLUnFo=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3932.namprd15.prod.outlook.com (2603:10b6:303:51::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Mon, 30 Mar
 2020 19:59:45 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 19:59:45 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
Subject: Chassis sled cycle
Thread-Topic: Chassis sled cycle
Thread-Index: AQHWBs3CzC9IpdImME+X8ulcZoCifQ==
Date: Mon, 30 Mar 2020 19:59:45 +0000
Message-ID: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:679b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b37b8480-9f52-4809-1c03-08d7d4e4e4de
x-ms-traffictypediagnostic: MW3PR15MB3932:
x-microsoft-antispam-prvs: <MW3PR15MB3932EA479D9F3657B9A209FADDCB0@MW3PR15MB3932.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(136003)(346002)(396003)(39860400002)(376002)(4326008)(6506007)(33656002)(8676002)(81156014)(8936002)(81166006)(86362001)(110136005)(36756003)(9326002)(558084003)(478600001)(316002)(7116003)(3480700007)(76116006)(186003)(6486002)(71200400001)(6512007)(66556008)(2906002)(2616005)(5660300002)(66446008)(64756008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F6i1kZsOuYGPQFkXVNtkedpXrrpHdjViYjUcU9jDX01HEY0cN0/GoscOZ0y+uRQAU+nHhxPLr0mimrV+ojqUhnumVAtTfO8zuwQLevWAxuNlZkIXyiDXBkTXVYhsFEH3S4POi2hrpo4Q7wNLx+ytw1JYUcCaTmuH45CtP7tQ+TlEMcv0pnPUuSNOSn6O9VIwzhqXj7rurnojKXhX55hp34DVDKeTJc4PGSTDNsJZAedAs+mDan3SM+fmFbmsUQNn2rbwL0u1CtEUaMk+g8mFeLyTqx1rkJoqJXioYu5vzVpzRzm0Us7tW94b+rH8KAcTW2sPRXk+VnX69YJDK6pBpGzUmrYGLcxMN1oEGNWUoxrpvOegsscDKHYAMY8NmmKPKu37icZJW3tbsxGDZY3NI2utmPXLQnhmtFU+UWYBKTXb6Yl/9/gDHSeUG5BnMC3g
x-ms-exchange-antispam-messagedata: 5Hr5aAjQATHXoEMG0mI06dJBmpMBmDrxjVeJsxGp/o9O8Wc0GV78CR/R7EqLal4MELElWLGldzkFhDZhrolifvx2QhckQOQPISlDwwfKt4r6bKsasnCYGpA8JDJ5v72JYfOum09erP6Vxe89CtrZ42hkEz6mThWsx2uasLA2nVyREcwi2mebWPiwtqaRfmZG
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_F69B446CE70B4B0483A1618A4F60E965fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b37b8480-9f52-4809-1c03-08d7d4e4e4de
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 19:59:45.2821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/kEOK/gMU5fRnDogDWlr3U3ZZIwbxtegGMWpHxUtjE52QraaxFlGLy0tCFMOjQAh7+qz6Cf+6bErjWG0ZkERw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3932
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-30_07:2020-03-30,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=862 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003300169
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

--_000_F69B446CE70B4B0483A1618A4F60E965fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFzb24sDQpXZSBoYXZlIGEgcmVxdWlyZW1lbnQgb2YgQ2hhc3NpcyBzbGVkIGN5Y2xlIGFu
ZCBpdCBjYW4gYmUgYWNoaWV2ZWQgYnkgc2VuZGluZyBhbiBpMmMgY29tbWFuZCB0byBob3Rzd2Fw
IGNvbnRyb2xsZXIuIElzIHRoZXJlIGFueSBwbGFuIHRvIGFkZCB0aGlzIGZlYXR1cmUgaW4geDg2
LXBvd2VyLWNvbnRyb2wuIEl0IHNob3VsZCB0YWtlIGkyYyBidXMgYWRkcmVzcyBmcm9tIGNvbmZp
Z3VyYXRpb24gZmlsZS4NCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_F69B446CE70B4B0483A1618A4F60E965fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <90CB073CAC4B5C4BA983A40784951719@namprd15.prod.outlook.com>
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
ZSBoYXZlIGEgcmVxdWlyZW1lbnQgb2YgQ2hhc3NpcyBzbGVkIGN5Y2xlIGFuZCBpdCBjYW4gYmUg
YWNoaWV2ZWQgYnkgc2VuZGluZyBhbiBpMmMgY29tbWFuZCB0byBob3Rzd2FwIGNvbnRyb2xsZXIu
IElzIHRoZXJlIGFueSBwbGFuIHRvIGFkZCB0aGlzIGZlYXR1cmUgaW4geDg2LXBvd2VyLWNvbnRy
b2wuIEl0IHNob3VsZCB0YWtlIGkyYyBidXMgYWRkcmVzcw0KIGZyb20gY29uZmlndXJhdGlvbiBm
aWxlLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkczxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij4tVmlqYXkgPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8
L2JvZHk+DQo8L2h0bWw+DQo=

--_000_F69B446CE70B4B0483A1618A4F60E965fbcom_--
