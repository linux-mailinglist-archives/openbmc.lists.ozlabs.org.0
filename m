Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86299144845
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 00:28:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482Ppx41C0zDqJ8
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 10:28:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8289fa29e8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=GzG4fSaL; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=flt59OuM; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482PpC0bPpzDqLv
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 10:27:28 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LNQKPJ014634; Tue, 21 Jan 2020 15:26:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=Dr+2JRkQcQpDEb1QgPgUS8m5R99TYQbvX5rKMAc8pso=;
 b=GzG4fSaLsVXRJxAJa97TNXWC7aN3Hje0I+9zSbxOg6oZT2uN74zhKLxyWpTVRuEegapJ
 weRKeM4Qeh+gJPMcF8Kcrc433k/W/+BkgW+mZYe2UzYtMKXWnFv3O0qAZDdVZ65YZgjF
 JgibLWvC60F1EH1Pf6CKoibFtCV+d0PW7QA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xp9a4rf51-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jan 2020 15:26:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 21 Jan 2020 15:26:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVN6cDE2tpJ7D5TaP6OCS9vdw0RNVj58XkKAZu2hZzb2QByUIWf+NVBYKUI2B+GSA0bwOLb4djPbkvgW0gTSy76NtBQ1fuHgmM0MbGPJl9OQD6fh7TGynEy5p96YxCw4/rIkd24/0RGqCS3LVZYvh2p0j6Lgt5r8TeM2l8kMtswCDg3xIJU4O+LmGi4nYEHHdFrtY/7BHSAC9D0EEyRyfSUZkoDMFgSUNXBL3aelv1MH+P3ePemyeg8OmbJ49JWcK3AcwLmAeP0jDIIXAEyVDeNcoEIBUGjwW9KSMDqfHzYx1P1vtF6XeVAn4AOU6w8zeniGuDNM0maj/N365JE5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr+2JRkQcQpDEb1QgPgUS8m5R99TYQbvX5rKMAc8pso=;
 b=N6qbuZ3EnMEcQRrDkkqNdhEA549Z4DbDzMkVIZYxD+l8sj6bwqoJ0mRf7LD/Ela+UpxXi/nsSQANLdB9IrZpgRZJP96i6uLjvZWRQaYH6cdHfvNYrydEBrp0SJ5cdSUJAPiP66kieC5eQUcblT8H/9I5X9d/4kVObjuSzyrfcVfPlmmVEaAOOeXFAy40lqXbvxQ8osClqQDHM9Gwcs0IjXB36AKnEejMag0A9SsPRvIoP9uQAG/qCGBVHS4bwqRFz9D4h8eFhJIfsp5It+VBwnbQT39ypcZfI3hNZ8HsgiBhBgs5uygEC+1Oh+gF3/YCasTX9cCCNm2c8F/shZ8yQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr+2JRkQcQpDEb1QgPgUS8m5R99TYQbvX5rKMAc8pso=;
 b=flt59OuMVXj4DI5ABRQVOfLYI83stdMG7o4kIzrj2xQFHcjWQXLLrG6O8amsTwcEJh7TzJbvpgHjSzSZN/y1lBagh9tYqNXW6AME3eeNNTbkBOpIvJ7qgbE0dq+Z4Fp8pni9A1sTrv41xIMLjgcuSwPEm3mABBScSjun/KiGFTk=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1469.namprd15.prod.outlook.com (10.173.233.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Tue, 21 Jan 2020 23:26:06 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 23:26:06 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
Subject: Re: x86 power control for multi host
Thread-Topic: x86 power control for multi host
Thread-Index: AQHV0K1XX03zkNGXPUaqdZ+5RqCG9af1PNaA
Date: Tue, 21 Jan 2020 23:26:06 +0000
Message-ID: <C1AA3F44-5589-4751-B023-8A28CC5ACC19@fb.com>
References: <E8A81BD0-04D4-4ED5-91E3-F4CA85DC8CAE@fb.com>
In-Reply-To: <E8A81BD0-04D4-4ED5-91E3-F4CA85DC8CAE@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:8d24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f50e1692-b106-488e-ed08-08d79ec94a21
x-ms-traffictypediagnostic: MWHPR15MB1469:
x-microsoft-antispam-prvs: <MWHPR15MB14690469D3F97339D0D28A6ADD0D0@MWHPR15MB1469.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(71200400001)(316002)(2906002)(110136005)(86362001)(2616005)(4326008)(36756003)(8676002)(478600001)(8936002)(6486002)(66446008)(186003)(5660300002)(81166006)(76116006)(66476007)(33656002)(81156014)(6506007)(53546011)(4744005)(6512007)(66946007)(66556008)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1469;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gmjnzceorhv10NMrS9J2yRK1aR0aMSrpWuTMSLHALilDgzhNybAzF4vPth7EfpRhbxCPImwCGsexszxRhK+ARZeKvJ44CsfBx/SS3UXX6OVGxO3RKo5D/AOr/ip7Xl1AE6nOLEPPSZ1GtGc/tYiRu19W9frjpxOWDz1O0MOQpFR3VDCnQdMG3oxSsS6QCifrfkDp7SvvlysQXnpVXu0JS2wsslDsCVi+3Xyb5eIeSBUQnOlYS4MwsrzTfcd0CXR/97wHOja1hrebkP7ojU0pPOuwLbuUOhk6OGl4O0MOUkRTC+uskRIZOkydr7+xnzlO2KKmIxf0xDSv7aJSpYAxiAZgaFipqHk4e84Ph0d6i8gODqWZR3xTAXqnenK7IU7SW0FOW/vLT/a3Quk6B0MQHrhOqK9CA+4R5xUjCc1325fLqN0s5E9VwiAO558Lv4aM
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_C1AA3F4455894751B0238A28CC5ACC19fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f50e1692-b106-488e-ed08-08d79ec94a21
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 23:26:06.3218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iUXkb2H5K0il6XToM61OE0m1mlZCxzlQBiYnJDZLjoMfMYKSByh+lf+OdZGuYDoWm3E2zaw8UQ0vu4BdhqS/tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1469
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001210172
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

--_000_C1AA3F4455894751B0238A28CC5ACC19fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIG1pc3NlZCB0byBhZGQgbWFpbGluZyBsaXN0Lg0KDQpGcm9tOiBWaWpheSBLaGVta2Eg
PHZpamF5a2hlbWthQGZiLmNvbT4NCkRhdGU6IFR1ZXNkYXksIEphbnVhcnkgMjEsIDIwMjAgYXQg
Mjo1MSBQTQ0KVG86IEphbWVzIEZlaXN0IDxqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20+LCAi
amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20iIDxqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVs
LmNvbT4NClN1YmplY3Q6IHg4NiBwb3dlciBjb250cm9sIGZvciBtdWx0aSBob3N0DQoNCkhpIEph
bWVzL0phc29uLA0KSSBhbSBwbGFubmluZyB0byBtb2RpZnkgeDg2IHBvd2VyIGNvbnRyb2wgZm9y
IG11bHRpcGxlIGhvc3Qgc3VwcG9ydC4gQXMgaXQgaGFzIGhhcmRjb2RlZCBuYW1lIGhvc3QwIGJ1
dCB3ZSB3YW50IHRvIHN1cHBvcnQgZm9yIG11bHRpcGxlIG51bWJlciBvZiBob3N0cyBiYXNlZCBv
biBjb25maWd1cmF0aW9uLiBJIGFtIHRoaW5raW5nIG9mIHJlYWRpbmcgZGlmZmVyZW50IEdQSU8g
bGluZXMgZm9yIGVhY2ggaG9zdCBmcm9tIGEgY29uZmlnLmpzb24gZmlsZSBhbmQgdGhlbiBtb25p
dG9yIGRpZmZlcmVudCBncGlvcy4gUGxlYXNlIHN1Z2dlc3QgdGhhdCBpZiB0aGVzZSBjb25maWd1
cmF0aW9uLCBJIHNob3VsZCByZWFkIGZyb20gZW50aXR5LW1hbmFnZXIuDQoNCkFsc28gbG9va2lu
ZyBmb3J3YXJkIHRvIHlvdXIgdGhvdWdodCBvZiB0aGlzIGZlYXR1cmUgYWRkaXRpb24gaW4gZXhp
c3RpbmcgZGFlbW9uIG9yIHNob3VsZCBJIGhhdmUgc2VwYXJhdGUgcmVwbyBpdHNlbGY/DQoNClJl
Z2FyZHMNCi1WaWpheQ0K

--_000_C1AA3F4455894751B0238A28CC5ACC19fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <CC89567B85589540B372762652755E40@namprd15.prod.outlook.com>
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
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lm1zb25vcm1hbDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1u
YW1lOm1zb25vcm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6
MGluOw0KCW1zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglm
b250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNw
YW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsOw0KCWZvbnQtZmFtaWx5
OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0Kc3Bhbi5FbWFpbFN0
eWxlMTkNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0K
CXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBwYWdl
IFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4g
MS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQot
LT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZs
aW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+U29ycnksIG1pc3NlZCB0byBh
ZGQgbWFpbGluZyBsaXN0LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bh
bj48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYg
MS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
Yj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPkZyb206IDwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9
ImNvbG9yOmJsYWNrIj5WaWpheSBLaGVta2EgJmx0O3ZpamF5a2hlbWthQGZiLmNvbSZndDs8YnI+
DQo8Yj5EYXRlOiA8L2I+VHVlc2RheSwgSmFudWFyeSAyMSwgMjAyMCBhdCAyOjUxIFBNPGJyPg0K
PGI+VG86IDwvYj5KYW1lcyBGZWlzdCAmbHQ7amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tJmd0
OywgJnF1b3Q7amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20mcXVvdDsgJmx0O2phc29uLm0u
YmlsbHNAbGludXguaW50ZWwuY29tJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj54ODYgcG93ZXIg
Y29udHJvbCBmb3IgbXVsdGkgaG9zdDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5IaSBKYW1lcy9KYXNvbiw8L3NwYW4+PG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+SSBhbSBwbGFubmluZyB0byBtb2RpZnkgeDg2IHBvd2VyIGNvbnRyb2wgZm9yIG11
bHRpcGxlIGhvc3Qgc3VwcG9ydC4gQXMgaXQgaGFzIGhhcmRjb2RlZCBuYW1lIGhvc3QwIGJ1dCB3
ZSB3YW50IHRvIHN1cHBvcnQgZm9yIG11bHRpcGxlIG51bWJlciBvZiBob3N0cyBiYXNlZCBvbiBj
b25maWd1cmF0aW9uLiBJIGFtIHRoaW5raW5nIG9mIHJlYWRpbmcgZGlmZmVyZW50DQogR1BJTyBs
aW5lcyBmb3IgZWFjaCBob3N0IGZyb20gYSBjb25maWcuanNvbiBmaWxlIGFuZCB0aGVuIG1vbml0
b3IgZGlmZmVyZW50IGdwaW9zLiBQbGVhc2Ugc3VnZ2VzdCB0aGF0IGlmIHRoZXNlIGNvbmZpZ3Vy
YXRpb24sIEkgc2hvdWxkIHJlYWQgZnJvbSBlbnRpdHktbWFuYWdlci4NCjwvc3Bhbj48bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0Ij4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+QWxzbyBsb29raW5nIGZvcndhcmQgdG8geW91
ciB0aG91Z2h0IG9mIHRoaXMgZmVhdHVyZSBhZGRpdGlvbiBpbiBleGlzdGluZyBkYWVtb24gb3Ig
c2hvdWxkIEkgaGF2ZSBzZXBhcmF0ZSByZXBvIGl0c2VsZj88L3NwYW4+PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Jm5i
c3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+LVZpamF5PC9z
cGFuPjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_C1AA3F4455894751B0238A28CC5ACC19fbcom_--
