Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C512B25BC
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 21:45:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXr7p5Sk8zDr2j
	for <lists+openbmc@lfdr.de>; Sat, 14 Nov 2020 07:45:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8586433373=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=FHiGqkgV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Zr7Da7DP; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXr6p0CYFzDr1V
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2020 07:44:13 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADKd8ET029523
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 12:44:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=9MJj62qvLFd5NgK1S0kZNDEZaSgedRRy9v94B0jql08=;
 b=FHiGqkgVONIMjDAuhaW/kVX1IL0ZFSHxKjBp9u5CwNdQREr74En7JA9s1Wzq0bw5ojNK
 Nw++WcL1vVCaPSyn4L1NgeafqA+YBEG27HmCSfjEBQ81p72gAuBCRtRQxTqmS4vuLxOQ
 cXiwD/mvqFR0Wj90TjH9Yzp1z+MAfhXK4AA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 34sdenwqt6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 12:44:10 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 13 Nov 2020 12:44:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beZnYLQPY/H0R6Cq7RoBB3AL4Z+IctMS1EHd0cOab71i+W1xJ4ycREw+5BrgN2n/I1cUmrraWYlEKL8h7eTkJfhmKqgYDCinrxBQKHcrdvS6QALnLQdPzP/zoARDaRxVQ15rGL2KMr4X/ElBwr+L601v4KInfyF2C3lXs8KObshzX/k+qAO+rTIm0takzi/fFlluInGbrakZIreUcT3i1kYLWkjt0KaXmJtJzc2p9eW+nZ/R/5dDLvNwGlZgkOYK/0fIUTVTZbE4PElEEUlIMGUJbUp76zwpvDyExTB1RCMQjLwtSrBaRExv414BS1pNs8glJjnnV16c8AW22aLPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MJj62qvLFd5NgK1S0kZNDEZaSgedRRy9v94B0jql08=;
 b=OoDgqIG/NcVftRz94HYZgr4VB3Oc8Y4AZaUnEebNhBBRdbC6BmNGnO+Jsn/EKMHex/NVekFI9R7zIy2FqbGICAJF6FSngwg70VY761SA9Jld/CwGvpMfFhW5pMz66wbeK4yX1YpaMW/Hu/DyTNr8ogKMg+G1FhT4La+/q12R7zT41Swok+qvk0/csmRMkqPZAlIq0i1PQZWV2cd/erwGlkZm+0jM4s+mGqdtXjtDWjbVCnNDhx0ThylNHaYqUQ5MlVKXZnK8jS9f3kXEwAt9RtPSTgO8PMNbOMdn2TP9IzJ9lVfvpuTaClV+vjhRFUZT49DWLi4DuFVKVwnds/UtyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MJj62qvLFd5NgK1S0kZNDEZaSgedRRy9v94B0jql08=;
 b=Zr7Da7DPYxZShMYwc7C/u3Ym05t2wtNyXJxOG1Ez1zVsWrEAZkgR15eNBnCj4hwcljsNs7a1pMe6E7JiAuRLbHJm/m4//SC2tpmSYbd6l0wNHVqhOACXNqGc+q+3cqFsJ4PBSN4Fnm29P/mwhBpWPI7LcSDPlXIPw6TeJ9t2mYo=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB2902.namprd15.prod.outlook.com (2603:10b6:a03:b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Fri, 13 Nov
 2020 20:44:07 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::35ef:5d5d:6617:e58a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::35ef:5d5d:6617:e58a%6]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 20:44:07 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: My new contact
Thread-Topic: My new contact
Thread-Index: AQHWuf27D/BMVSUTNkyXTEqtIIeTew==
Date: Fri, 13 Nov 2020 20:44:07 +0000
Message-ID: <77963EB4-8B07-4580-84C6-FD2930505E30@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:4755]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a5542d8-4bfc-40e5-42ad-08d88814ddef
x-ms-traffictypediagnostic: BYAPR15MB2902:
x-microsoft-antispam-prvs: <BYAPR15MB2902D085307B5601C1C0A813DDE60@BYAPR15MB2902.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p/j4WUIuvnZmll3sYeNWO++3lgETw4jWMrhHPvVSe6soHbv3PL9xFGaMsL/AumpJNKkblxJAYX5MRudbA4x2Ct4N0XfX/ogKRKlk7fom7/ufiWNjUCSpD7vflTZMzsoyAVaVh4DeWLbtAmjnI6J/OMHRYtxcyGFVF+vt4hJz8LUK23ci6MwDWej0XEXk9y+PdLk0KYLm1TiFewgH3TPuccgSFCVF5iWU057SiaNY1XI7QQazcVVXmy1doQIXcHbcBeJqDc4LsRtExwhpszUxdIGuI1uWjGklLFkuDpJ76C4gD4g/DKIwip9gvpaGHTUdAiCi86Ki/KpXrX2if5ACQij0jmu+YHBww/4VcQUeYbsGJaBZzgTtOUnQ0DL8YMWN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(396003)(136003)(346002)(478600001)(2906002)(64756008)(66476007)(66556008)(71200400001)(76116006)(8936002)(3480700007)(86362001)(2616005)(316002)(91956017)(6486002)(8676002)(6512007)(5660300002)(7116003)(4270600006)(66946007)(6916009)(186003)(66446008)(6506007)(33656002)(558084003)(36756003)(416564005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: au2Dabugdf8um8APxQ4l1aqQvU1phpCNAcupUEXX+XVfPDkRxW7tUk1PdQVWJzSJ5JS9xfslI/B7JWW4xtD05Ky/gEHlfvE6HB/SQKF3sOwypXBFOEMnoblqVMw1BFJrwg+47t5nsn8ju47uL4QK77AsZCWMnTc2awQ6FS6zmvshDdxGE1HwctSIkV7eEYOrbhu30O2Ta5AsDP94RmfI1p/1azv4UDpxudhIem0jKxz+06Ujc42p85YoG4auKBcVXm7EkHkfFC6sG7ZWdeL/vnoVf2dvFEjQmYxdxEKRTI+rIXGaiZ5GOCzfIioAlRPaM9MfskybgzxF8htWPFUgNkaTrLfOCvesGWvw8odqT9U9WD4e0xrNNxGS0aV2q6yHRvHNx84lea5JzXxYAllnEtjOSA4EEYOWEZtQ+e/U6QFPRNO4z12MTyKKwlPFigE1wrkwRVDG9ikLw5JWWcxXRi1n+DfQR0p+vhvNDdGfvvj4AKHjSyA1BY/CXmpY2nKkEuNYvhMM7XlPNNLCA+5fdWfawyaxIp1ZJ63ctFnXm/7UwW5kEntwkRXjSvfhoh64SUYLcSLUGeqziA755szTDQyngjjhHbILRc24VbM5+T1vhD/7Vc+x+Hp3nrtnhw83uJ28IAxkiddazRYvUaG3+GzTmsmZtxNPpqVPi2/bM1CCXmZZ/lVsEbGAeWci/xrc
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_77963EB48B07458084C6FD2930505E30fbcom_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5542d8-4bfc-40e5-42ad-08d88814ddef
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 20:44:07.6244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4tuuSQGhtK5xQQ3rnNm5OqY1FoMbjF2pKNTnuT0xsbPOQ2mGL6Z1ygGeTuVt1RZiHKrtmoyWNyoVw4qoxhng2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2902
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-13_19:2020-11-13,
 2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=574
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130132
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

--_000_77963EB48B07458084C6FD2930505E30fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGxlYXNlIG5vdGUgbXkgbmV3IGVtYWlsIGFkZHJlc3MgYXMNCnZpamF5a2hlbWthbGludXhAZ21h
aWwuY29tPG1haWx0bzp2aWpheWtoZW1rYWxpbnV4QGdtYWlsLmNvbT4NCg0K

--_000_77963EB48B07458084C6FD2930505E30fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <FA0FCD763ABB59489238880DF9936232@namprd15.prod.outlook.com>
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
ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBz
cGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjND
MTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21z
by1zdHlsZS10eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNh
bnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5
bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJD
YWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDEx
LjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9u
MQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFu
Zz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIiBzdHlsZT0id29yZC13cmFw
OmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5QbGVhc2Ugbm90ZSBteSBuZXcg
ZW1haWwgYWRkcmVzcyBhcw0KPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxhIGhyZWY9Im1haWx0bzp2aWph
eWtoZW1rYWxpbnV4QGdtYWlsLmNvbSI+dmlqYXlraGVta2FsaW51eEBnbWFpbC5jb208L2E+PG86
cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9i
b2R5Pg0KPC9odG1sPg0K

--_000_77963EB48B07458084C6FD2930505E30fbcom_--
