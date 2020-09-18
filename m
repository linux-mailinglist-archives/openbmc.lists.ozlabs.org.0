Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF5A2705D0
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 21:51:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtPbr2MgvzDqsw
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 05:51:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=653035d8c3=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=rms15lw/; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=NGAJIYIY; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtPb04G44zDqKj
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 05:50:44 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 08IJiFMj005893
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 12:50:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=UKTetEf0zL1xDq1ILPHT+RjGdeTP9DZsYHCG8qzKEFI=;
 b=rms15lw/ffUUjDvKqkJdWMA05Fc9+pNpMYbWET9IUtsvR9Bx19uGM0lCiUWsO4eHiskK
 CB0SvS0NSO2r94aoCN6M83uXAqoVRwu40iRekd40kznYY8USYcsEOgvOoU8AcMJ2Ojhc
 g3bMSpE9ytajigoLjG8dF/4DHb65jfx+mLU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 33mc4regqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 12:50:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 18 Sep 2020 12:50:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVYKdrI1osJyXcZg1rJG0+Fxa/RM+yLSW/zF95Nh6Yp5rMTwbCnU72GcRDIKx603KjwKYN9OI/Ub43QgPrrH3UNVr8kkLUz08MO5nvxJn1zyIo4GEvePghCNaOJ+4fA9+PJJ3D8ZRgwLMVCjdgTHeQ5To4VwAYYDNTWhv13EjkdphLqRUW9H29joq2Lvt0wkqGFzzfy9D2DB6Vy1wB/mmqXNvge0h6GUSiRBLA+psCm89GRN07TpLNCVatpBOfgxoA1fT+JsY1GiTWV/gwbKmVEneCC/FWBEc3BMvyUyibbTJyrgbqrUHmd9qQCVqcVQ080YL9qYda1KmjneO1PgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKTetEf0zL1xDq1ILPHT+RjGdeTP9DZsYHCG8qzKEFI=;
 b=ewP6sKrnqkFp3w8OF/i5XqZZfIMzcB9JMYscTqm1/W7LBQqU/XPentpXBQ/CBFB1x8ZymDnuASC1MwMiJ9lLC4EE6pQZaBPNyB3f+q/EslBAS5luSR5Mh2TQruXcNfOHhOjbYiS3d3MkY+zNaHZopIPynh4IRP+PZtL8l8qC5NjF+vAcPoBZYQUItmUkz9Vk2afS4wB+ZPwPfzI02SHBidcsi1Qhx9AtKDujDHZkczcAfzIE/iYF0z5+aTZDjjvPBekBOk2p0crrGvkbjnZ5oZViMVi1SBktJMc/Zh9rYkUdwDOlQWbGf5CwDgXUh08lIB9q3NkiiUpClsxV0IGnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKTetEf0zL1xDq1ILPHT+RjGdeTP9DZsYHCG8qzKEFI=;
 b=NGAJIYIYdDpwHBj5+xdJcs1anNrYXsDFxIVluJQG2A3/MP2p1G9c13sC4iYCm/9dDWUP3qnpUKlVuv01F641umkOI9Y8CG5VQyCLGk9kiiD5IOrnBP5y/m6lYsIDaa/UI01VMUp6Oyt+XfYsuXezfRMruS3vEpEnuyZNqwhcqc0=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3206.namprd15.prod.outlook.com (2603:10b6:a03:10d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Fri, 18 Sep
 2020 19:50:39 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 19:50:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Chassis reset
Thread-Topic: Chassis reset
Thread-Index: AQHWjfT7lWI0BIvUr06gDFlShL1iFg==
Date: Fri, 18 Sep 2020 19:50:38 +0000
Message-ID: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:65b6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c0d30fc-e86b-4e50-afec-08d85c0c1e90
x-ms-traffictypediagnostic: BYAPR15MB3206:
x-microsoft-antispam-prvs: <BYAPR15MB3206A8CB0213FD97D8817210DD3F0@BYAPR15MB3206.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c7WHmfnrnyL8O0/xLrvVtd9Nly7WtwX+4AmajoSPeu+LpqFg6+0IpVrCi5R2HyRP9lNVkHENk0YzGrnQ/mk3zh9tczV2myNvc4NbW4pnHvjEjx20mP5Xaevg6rlgYqG2CVyY6s3lVf5YlsX2mjzNUOdAHSRit5Yl7Aq8R+2JGVwtdVJFkYWOAvbXKkGexIIRzDBkKOu7HLrxwQLbAmX8fCNvIiwuqsNWH9qjCM/FMzcyfxh9gYs+sNPaCkApQrJpsWJvCuGf0U7md4hDixEfUVPLvz+mKvtYNhoagLblLxcrRKW80VOmTFW931jmscz8eSCXxcAIL+Tyr/ck0thrMDnjUZttwkyoUdWUR6cBBSk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(396003)(346002)(366004)(5660300002)(478600001)(4744005)(6512007)(33656002)(76116006)(91956017)(66556008)(71200400001)(6916009)(316002)(66476007)(3480700007)(66946007)(66446008)(64756008)(2616005)(7116003)(8936002)(6506007)(36756003)(86362001)(186003)(2906002)(8676002)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: L9FpjvBSDrDpwC3QV3IXk3/5VwhhhHDCnXWjwS6ygjgl0SB2u93o7JIgPpkqRm5yxBFVWqtOONy9rIMrpJ8mpj0t3WcsQeYA+pbhErYk/+tm7s9tJW/Ai1k634jQ2CudTXKua53jcqNC/+Obk/4ZqJm58Y7L7JbLAYDX0K513wOQhJD5BguJU2qO7ydRF8wg6e8+qTNINz/LDx5heZCNMVhopVFDYzWkJqKZ6e0scUqmOS/Rub9Tng9zPqK7Q2dI4zowGPMlXd9Pg4uom9Mw9/7fFQRbfJi0/Cx+khfUOD66U2oClu2aPe6sN7uSbO49alxtdMH1RNRG8H2Qsb63hjb7fmVGTp1K4EOvsMmwoDOgesONAzFiBlSuNOK8XQGOlcMpElVFWTHgpLZtbQXpPrdlY1nSzSqcq05UunP1FAPU4frWKujc3lJKybUkaFMss/7h7G7V19I5Ty8GowbGzd1uv2e1R8UCNOHzKict0YR0eMvMF9fHBLyy2NwhsWuTeMQP/kQPoiPEXbIO8sdnX06fxT8gyd4WjI5rqphzjC9oCn3PmN+sZfUo1XLhUVVKCPW4JyI1KZwARRm/qWTBbYNfYBQsbduQCqM+CghrtibASeSTINBjXcUaSEWVW+5zrhHOC9Jm9GLhZvncB9zCxyzWkZLj1ZA3mxgaFNfb/ULyKjE/skFa8hA0MSCRe+5q
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_46F3C05C7CEC42FDA9B78E55AE56FE3Ffbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0d30fc-e86b-4e50-afec-08d85c0c1e90
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 19:50:39.4307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KgGde2z+tN1/qFztvX4PVk2yN1HQrlYcvogS+Phtg411r6m3DUnxChWtOuPqIEjdhKOhcX3glhSw7BSre5iQ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3206
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_17:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=883 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180160
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

--_000_46F3C05C7CEC42FDA9B78E55AE56FE3Ffbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCkkgYW0gYWdhaW4gd2FudCB0byBkaXNjdXNzIGNvbXBsZXRlIHN5c3RlbSByZXNldC4g
V2UgaGFkIGRpc2N1c3Npb24gaW4gcGFzdCBmb3IgdGhpcyBhbmQgSSBpbXBsZW1lbnRlZCB0aGlz
IGFzIGEgY2hhc3NpcyBpbnN0YW5jZSBzeXN0ZW1fY2hhc3NpczAgYW5kIGFsbG93ZWQgdXNlciB0
byBpbml0aWF0ZSBQb3dlckN5Y2xlIHdoaWNoIHdpbGwgcmVzZXQgdGhlIGNvbXBsZXRlIHN5c3Rl
bS4NClBsZWFzZSBoZWxwIG1lIHVuZGVyc3RhbmQgZm9sbG93aW5nIHNjZW5hcmlvDQoNCiAgMS4g
IEhvc3QgcmVzZXQg4oCTIHJlc2V0dGluZyBob3N0IG9ubHkNCiAgMi4gIENoYXNzaXMgcmVzZXQg
4oCTIHJlc2V0dGluZyBob3N0IGFuZCBibWMgdmlhIHNpbmdsZSBjb21tYW5kLg0KICAzLiAgU3lz
dGVtIHJlc2V0IOKAkyBUaGlzIGlzIGEgaGFyZCByZXNldCBvZiBjb21wbGV0ZSBzeXN0ZW0gaW5j
bHVkaW5nIGV2ZXJ5IGRldmljZS4NCg0KUmVkZmlzaCBkZWZpbmVzIG9ubHkgYWJvdmUgMiB0eXBl
IGFuZCBzeXN0ZW0gcmVzZXQgY2FuIGJlIGNvdmVyZWQgdW5kZXIgY2hhc3NpcyByZXNldC4gQXMg
cGVyIGltcGxlbWVudGF0aW9uIGluIHg4Ni1wb3dlci1jb250cm9sLCBob3N0IHJlc2V0IGFuZCBj
aGFzc2lzIHJlc2V0IGJvdGggdGFrZXMgc2FtZSBhY3Rpb24gbGlrZSByZWJvb3RpbmcgaG9zdCBv
bmx5LiBGb3Igc3lzdGVtIHJlc2V0IGl0IGhhcyBhIHNlcGFyYXRlIGludGVyZmFjZSBzeXN0ZW1f
Y2hhc3NpczAgYW5kIFBvd2VyQ3ljbGUgY29tbWFuZCB0cmlnZ2VycyB0aGlzIHJlc2V0Lg0KDQpQ
bGVhc2UgaGVscCBtZSBob3cgZG8gSSBzdXBwb3J0IHRoaXMgc3lzdGVtIHJlc2V0IGluIHJlZGZp
c2guDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_46F3C05C7CEC42FDA9B78E55AE56FE3Ffbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2A9CBDBA0F21264D8C2D19DF04BF8ED6@namprd15.prod.outlook.com>
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
ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KcC5Nc29MaXN0
UGFyYWdyYXBoLCBsaS5Nc29MaXN0UGFyYWdyYXBoLCBkaXYuTXNvTGlzdFBhcmFncmFwaA0KCXtt
c28tc3R5bGUtcHJpb3JpdHk6MzQ7DQoJbWFyZ2luLXRvcDowaW47DQoJbWFyZ2luLXJpZ2h0OjBp
bjsNCgltYXJnaW4tYm90dG9tOjBpbjsNCgltYXJnaW4tbGVmdDouNWluOw0KCWZvbnQtc2l6ZTox
Mi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0
eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToi
Q2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0
DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9u
dC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3Np
emU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYu
V29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi8qIExpc3QgRGVmaW5pdGlvbnMg
Ki8NCkBsaXN0IGwwDQoJe21zby1saXN0LWlkOjE0MDg0NjExNTI7DQoJbXNvLWxpc3QtdHlwZTpo
eWJyaWQ7DQoJbXNvLWxpc3QtdGVtcGxhdGUtaWRzOjI2NDI4MDAwMiA2NzY5ODcwMyA2NzY5ODcx
MyA2NzY5ODcxNSA2NzY5ODcwMyA2NzY5ODcxMyA2NzY5ODcxNSA2NzY5ODcwMyA2NzY5ODcxMyA2
NzY5ODcxNTt9DQpAbGlzdCBsMDpsZXZlbDENCgl7bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJ
bXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpA
bGlzdCBsMDpsZXZlbDINCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YWxwaGEtbG93ZXI7DQoJ
bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0
Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMDpsZXZlbDMNCgl7bXNvLWxldmVsLW51
bWJlci1mb3JtYXQ6cm9tYW4tbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNv
LWxldmVsLW51bWJlci1wb3NpdGlvbjpyaWdodDsNCgl0ZXh0LWluZGVudDotOS4wcHQ7fQ0KQGxp
c3QgbDA6bGV2ZWw0DQoJe21zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1i
ZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw1
DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmFscGhhLWxvd2VyOw0KCW1zby1sZXZlbC10YWIt
c3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVu
dDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw2DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OnJv
bWFuLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXIt
cG9zaXRpb246cmlnaHQ7DQoJdGV4dC1pbmRlbnQ6LTkuMHB0O30NCkBsaXN0IGwwOmxldmVsNw0K
CXttc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxl
ZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwwOmxldmVsOA0KCXttc28tbGV2ZWwt
bnVtYmVyLWZvcm1hdDphbHBoYS1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCglt
c28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBs
aXN0IGwwOmxldmVsOQ0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpyb21hbi1sb3dlcjsNCglt
c28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOnJpZ2h0
Ow0KCXRleHQtaW5kZW50Oi05LjBwdDt9DQpvbA0KCXttYXJnaW4tYm90dG9tOjBpbjt9DQp1bA0K
CXttYXJnaW4tYm90dG9tOjBpbjt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0i
RU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRT
ZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEx
LjBwdCI+VGVhbSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBhbSBhZ2FpbiB3YW50IHRvIGRpc2N1c3Mg
Y29tcGxldGUgc3lzdGVtIHJlc2V0LiBXZSBoYWQgZGlzY3Vzc2lvbiBpbiBwYXN0IGZvciB0aGlz
IGFuZCBJIGltcGxlbWVudGVkIHRoaXMgYXMgYSBjaGFzc2lzIGluc3RhbmNlIHN5c3RlbV9jaGFz
c2lzMCBhbmQgYWxsb3dlZCB1c2VyIHRvIGluaXRpYXRlIFBvd2VyQ3ljbGUgd2hpY2ggd2lsbCBy
ZXNldCB0aGUNCiBjb21wbGV0ZSBzeXN0ZW0uPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlBsZWFzZSBoZWxw
IG1lIHVuZGVyc3RhbmQgZm9sbG93aW5nIHNjZW5hcmlvPG86cD48L286cD48L3NwYW4+PC9wPg0K
PG9sIHN0eWxlPSJtYXJnaW4tdG9wOjBpbiIgc3RhcnQ9IjEiIHR5cGU9IjEiPg0KPGxpIGNsYXNz
PSJNc29MaXN0UGFyYWdyYXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGluO21zby1saXN0OmwwIGxl
dmVsMSBsZm8xIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SG9zdCByZXNldCDigJMg
cmVzZXR0aW5nIGhvc3Qgb25seTxvOnA+PC9vOnA+PC9zcGFuPjwvbGk+PGxpIGNsYXNzPSJNc29M
aXN0UGFyYWdyYXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGluO21zby1saXN0OmwwIGxldmVsMSBs
Zm8xIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Q2hhc3NpcyByZXNldCDigJMgcmVz
ZXR0aW5nIGhvc3QgYW5kIGJtYyB2aWEgc2luZ2xlIGNvbW1hbmQuPG86cD48L286cD48L3NwYW4+
PC9saT48bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47
bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5T
eXN0ZW0gcmVzZXQg4oCTIFRoaXMgaXMgYSBoYXJkIHJlc2V0IG9mIGNvbXBsZXRlIHN5c3RlbSBp
bmNsdWRpbmcgZXZlcnkgZGV2aWNlLjxvOnA+PC9vOnA+PC9zcGFuPjwvbGk+PC9vbD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+UmVkZmlzaCBkZWZpbmVzIG9ubHkgYWJvdmUgMiB0eXBlIGFuZCBzeXN0
ZW0gcmVzZXQgY2FuIGJlIGNvdmVyZWQgdW5kZXIgY2hhc3NpcyByZXNldC4gQXMgcGVyIGltcGxl
bWVudGF0aW9uIGluIHg4Ni1wb3dlci1jb250cm9sLCBob3N0IHJlc2V0IGFuZCBjaGFzc2lzIHJl
c2V0IGJvdGggdGFrZXMgc2FtZSBhY3Rpb24gbGlrZSByZWJvb3RpbmcgaG9zdCBvbmx5Lg0KIEZv
ciBzeXN0ZW0gcmVzZXQgaXQgaGFzIGEgc2VwYXJhdGUgaW50ZXJmYWNlIHN5c3RlbV9jaGFzc2lz
MCBhbmQgUG93ZXJDeWNsZSBjb21tYW5kIHRyaWdnZXJzIHRoaXMgcmVzZXQuPG86cD48L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5QbGVhc2UgaGVscCBtZSBob3cgZG8gSSBz
dXBwb3J0IHRoaXMgc3lzdGVtIHJlc2V0IGluIHJlZGZpc2guPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_46F3C05C7CEC42FDA9B78E55AE56FE3Ffbcom_--
