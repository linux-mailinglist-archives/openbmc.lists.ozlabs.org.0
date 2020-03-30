Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA3219850B
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 22:02:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rk0701WNzDqZB
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 07:02:47 +1100 (AEDT)
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
 header.s=facebook header.b=GH0oxYom; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=YSqf2nH0; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rjzS33RSzDqXm
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 07:02:11 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UK1o5M003169
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 13:02:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=U1XIoJH5WgFLjMppnxIDX1+PQ2PQCzaVbyH+fDy9ksE=;
 b=GH0oxYomtErFtBNO8WO/5b3Hvxo7mv5oNOS8aiWWMOyojp3M4PXO6H47IkWGotpvfP8G
 gVo3DUOFOVDHeLmwkV2rvnhnbYdVoG8B6XWBxgCRqWqUEnRMP9ZPyuvH2L1y7Z0Q25HC
 3/S/rnzDE8W4qhTs6JBpDpbFdou7BchfYFE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 303dj66ugd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 13:02:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Mar 2020 13:02:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4hll5aZYJnoIR3fFfQVSRNGBUt3UBi6GyWdo/L37D/kawy8bp0Sc+YtbUlnYMcLm0Ld6RlabCh1Nj9oSOLoBcOWbPvCl8q+xKO6VUcDcZg2u4mR76e7yBHO2ftwMCzwMokeAENdspIzZLCeKdHWv6gKzKaSpSgzvVyyCAfjSkqmCMxISVSWpZkEDEyk+zCc669wK/DQbEl65gHY5EgwsE50ptdHVvvs/BeAcc2Rn/9AoWd5919TuvsdLi8Mcd+gpHOJ0DWet686Fo0vbCyUhh26oG39lQdOf+G4L1v/MvWMJdZ4d95dg3XOp8nzjDI44VMWp5JOaEanuiVZ4AZieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1XIoJH5WgFLjMppnxIDX1+PQ2PQCzaVbyH+fDy9ksE=;
 b=Wptljp+eiO77lD6pgzxXbRq3Mugm/6+VKywKA25SPMMvlAQmFhg8EE26cqL+y5/+GGASqc550ckyl8fWxhhdWIuhBXasPiY7u/aTKhcyt3/cGPKskrXHH8L7aaOjm+LrKRULFXonJBKuxtZwG7Tpffe7hrjJThJq2xqmRv7bHzX43rzeldXrUii7m0mop6+4H7tPCeDhyEZ4fMWewnVz1MyIW/cehHIFRxBZM3KGVTsh29E4ksDzrQdSNv6IRvYSyFEsKOnoQPxTewnCBOvcTnOA1hg+CeHQnxMN+lW7GJLXpmDenlSqe6E/rMadrjHkHXuwGtQKlmFZIpWR2c/i8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1XIoJH5WgFLjMppnxIDX1+PQ2PQCzaVbyH+fDy9ksE=;
 b=YSqf2nH0scDE6wx9mX2pgzlaZhPzr6f6LMz8l28pK7Faas3sYvM7hkAwVhUVd9z/w41XHn8wH3JI2PWRNXXK0cXR8dMENyCBIGheA4hfp9AZZu1stxMi1JDwZP1JXe2eQOarbXFmLPvhLupDtc99fhsnjfdTowvULkHazpkEYaU=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3995.namprd15.prod.outlook.com (2603:10b6:303:40::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Mon, 30 Mar
 2020 20:02:04 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 20:02:04 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Sensor history
Thread-Topic: Sensor history
Thread-Index: AQHWBs4VmN6lX3CS6Uq7IxtJ4cK5BQ==
Date: Mon, 30 Mar 2020 20:02:04 +0000
Message-ID: <EED5BF91-4AE9-4B5A-BE68-BAE3D93C3704@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:679b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97dc9dc5-751a-4df3-b91a-08d7d4e537e4
x-ms-traffictypediagnostic: MW3PR15MB3995:
x-microsoft-antispam-prvs: <MW3PR15MB3995038D25A13D879AAA7820DDCB0@MW3PR15MB3995.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(136003)(396003)(346002)(39860400002)(376002)(2616005)(8936002)(8676002)(66446008)(81166006)(6512007)(33656002)(66476007)(71200400001)(76116006)(6486002)(81156014)(2906002)(64756008)(66556008)(66946007)(558084003)(6916009)(316002)(478600001)(5660300002)(3480700007)(86362001)(7116003)(6506007)(186003)(36756003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a/quQ9xsQCOcISjI9Lxws/U7LE58yb/9MBO/aO1rxBpdlMIIYBIykfheuvMduDqszQWVrCiEHSPuXWyJAwkLs2UY+DzpWhCv+JDhESWwOl42PHPFcGq+6BhjStR21SNvso6VsICX68AuBCRDhXHxzBPI6ZOugURQ8Q1j9efXM4P6d21lafkDjs0TlmSiKFbac6/mHCwxs1mwegklzeomF0ZA5yLZ3VMsKvcTfX2rdbVOsXNU9uNlVF2r2lJb9EVL/80gY34DQ088pw7jDtjJgH07yuDL8HJDr/MdpqsnijJvgPAoups6bikEodLVfGrY9Rcu9DE5eVlNgColubaQA9nmaFNvaIe9B8EjG4PRZ27EzPSmZRXFq4iP15Yi8Y4xbXrgadgMZQJJIpTD1STf8tspy/u5isHjWlblu26nphh1hToaEljMERUptUd0h/mx
x-ms-exchange-antispam-messagedata: qsFotbqahq29lbmOk5xAZ/2q68fII8C47ZAhrWQMkidAoyIljRTHpXSJn/ncMqL1+ty1d8Ywke9yL3p69LtJOgjG4Chiu8UTuD8AUxyv1NN0hQqtCQEf6WMFIR8Tv0Z+3YZCuDOaJajDlU7TqB7/UkPWqfA96O/eRw98+P+Yt7EPrLbLnBRMhhHdeugZGsWk
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_EED5BF914AE94B5ABE68BAE3D93C3704fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 97dc9dc5-751a-4df3-b91a-08d7d4e537e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 20:02:04.5106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v++LNTpTBwsU7ONKQTmUUZkoWncaM0URXyk7qc/mZWIeQJM8YCdWkl7zJHUUDo3OapcY/F7cmAiKBXS5eM2ZfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3995
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-30_07:2020-03-30,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 clxscore=1015 mlxlogscore=593 impostorscore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300170
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

--_000_EED5BF914AE94B5ABE68BAE3D93C3704fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXMgdGhlcmUgYW55IGltcGxlbWVudGF0aW9uIGZvciByZWFkaW5nIHNlbnNvciBoaXN0b3J5LiBQ
bGVhc2UgcG9pbnQgbWUgdG8gdGhlIHJlcG8gb3IgY29kZSBiYXNlLg0KDQpSZWdhcmRzDQotVmlq
YXkNCg==

--_000_EED5BF914AE94B5ABE68BAE3D93C3704fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <A2BE8CA82A33464E9FF55B0D572F07B7@namprd15.prod.outlook.com>
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
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPklzIHRoZXJlIGFueSBpbXBsZW1lbnRhdGlvbiBm
b3IgcmVhZGluZyBzZW5zb3IgaGlzdG9yeS4gUGxlYXNlIHBvaW50IG1lIHRvIHRoZSByZXBvIG9y
IGNvZGUgYmFzZS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJl
Z2FyZHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+LVZpamF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9k
aXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_EED5BF914AE94B5ABE68BAE3D93C3704fbcom_--
