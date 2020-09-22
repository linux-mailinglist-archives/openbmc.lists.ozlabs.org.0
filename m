Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C67274A68
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 22:53:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwtn35bkVzDqWf
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 06:53:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=6534d30414=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=HVljOsz+; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Iaq+q/Y+; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwtmJ02NnzDqQR
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 06:52:30 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08MKnTRg027690; Tue, 22 Sep 2020 13:52:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=zPyGiWX3YWYu/CLa244Pl5TKymNaFxBYHF13biUilQs=;
 b=HVljOsz+F7De1vufKBPOldEespyrcdFIiDL/HQXK9m0ioSymfE4ENlfx2+0rnnnHZEOQ
 5uqIl0kSKpavFG9tezzYB1acVjogGIe1qkc4AfItYjBifCSw6QPQVWI1DrqKEcSVYZ9K
 lJGldNiQxrK+/7b0HSEoU/xnUYy904XozZY= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 33nfth00sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Sep 2020 13:52:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 22 Sep 2020 13:52:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chjDnl2paQg0nqE3bB054vYpNUvLYsX3tkeEN9HEA6ckpDRoqLSYI40RSxm+qhfC4dCllJh+7P9Wb4p4tzvq6NQTGDTSESNeoxLJwp0MiPBMgcl0t6uwNTwC/TT2DyTVQ9ukGEo99QhXUTdMsKvx8Nlsbo6nV+95HovUntmJC/Neff42mJHx3qTB6+y0SxFsQXKvjhlklYlkRVG6pwNhJUvTTVTLdi1pWfKLDw4fDrp0TeIbeZQ/fCav9Qta9lwmsLL/DohAU2wwDUbd9U+qSniEeziGIrsTjO7S9mA1lTSjgOTTEUmzI7WZnmlWthtnsV3PcV0UU3X2M1u0lhNezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPyGiWX3YWYu/CLa244Pl5TKymNaFxBYHF13biUilQs=;
 b=Co5+4CwJBx8pSuk3BBlLsI6/Bz5oCEA1+0YYfH8QOd6CBKCSerJYmEy+ODJAmbxl1uO79GIwZ6X2dny73KU6u/9iGds6l3Dm70eZq6Kk0ockDVNWFmTTNULx6bv+ZENMBjvxPNeHNlXB1LNZrOwua8H3+St0CUdzapMNJWrHP8vlyWuvC2NGPSQ2Gl4fVYdraElgpqS6mi6iqokJOipY9JQFvILcu/wjWdLrslOEWh/KuF12jwlsJ4oJh7WyHcpXndlOnNnCC/I1A5OgfDJMYZ0JgtKUSMs9Oh1osDR3lgtrT/ugnqfUFZa2f5n6zMzq+jiNu+AJz7L4YVwQCIPS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPyGiWX3YWYu/CLa244Pl5TKymNaFxBYHF13biUilQs=;
 b=Iaq+q/Y+yLBu0fTfQtso2anj+hMUUG8XVMGo52pt3/tXqAWQ+iMjt1epsYe5glEenk7hKdHiqkD6kemvJ5ozUjhd9fti5I3xy7qJGLZFDvWwlXlBTxq58b/OLQj9cABQMxeTBoSFKp7VbmOvh5HmiMqWyG+An5n4o9u98hbJcY4=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BY5PR15MB3572.namprd15.prod.outlook.com (2603:10b6:a03:1b2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 20:52:19 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 20:52:19 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jayashree D <jayashree-d@hcl.com>, Patrick Williams <patrick@stwcx.xyz>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Read Firmware Versions
Thread-Topic: Read Firmware Versions
Thread-Index: AdaQIMU5ljsiRzlYTUW3d3oi6MD/gwACmf2AAC39YUAAARzKAA==
Date: Tue, 22 Sep 2020 20:52:18 +0000
Message-ID: <6C7993CE-CBBC-4A75-A84D-F4AD9FAADB4C@fb.com>
References: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200921152337.GJ6152@heinlein>
 <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hcl.com; dkim=none (message not signed)
 header.d=none;hcl.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:a5f3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83c7d551-be79-429d-5d33-08d85f396558
x-ms-traffictypediagnostic: BY5PR15MB3572:
x-microsoft-antispam-prvs: <BY5PR15MB3572038EB17284C97CE74D68DD3B0@BY5PR15MB3572.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CV8qSt6GDfPD/2ao+ba2iPKEFTrehWTSuaf5Bh83zk5RassBi1jihmItJsGKrIpqfCs/ChfBHW8ZY3kWnksMoXBPi7PtkU6Xn4VMtU4iWoymX4dsxYRMgQvNUUce92vZoKI1yu/W8Qr0BkTQl13zF+Ehs54vp5uHkthNYQ4Jlq31FWWpNijrb5XUDc9nccn5Q3yG5wOR5XHgL/c/u7X6ktEnwoZE1Nk6fEBimPZVtl8dI8/NY8ANgzQEU5JRydwLD/BrN4ZpJKtxEqsI39KZRxc+zKEoSbuupssBUzXBhGJ0OG5z5pKTTRt6fnVOG/bh+h+xbopVFbdRWxJ7C1u7B+GCpKp0kjMM5WGgcaXZH6AeuDbV1inoSk4leyPTzgqVz2hvnnUnVSdaey/sdZkZLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(376002)(346002)(366004)(8936002)(66946007)(5660300002)(66556008)(83380400001)(66476007)(76116006)(316002)(6512007)(91956017)(66446008)(8676002)(2906002)(64756008)(33656002)(3480700007)(110136005)(7116003)(53546011)(36756003)(6506007)(186003)(2616005)(4326008)(86362001)(6486002)(966005)(478600001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FUI01k8VZxTcpUtExtkpBKw2SzjDAwZTbjQ4Ai5+3kE+0lKHDX4HnnGKKMyOn+YLR5wahGq2jLy0Q3i8hA2Fe9aiNp7bU9/1DgeW2qjYfj2xWrJ7pXhReXH4DEUmkkzcEyXQC6lpQm120qUVWog9s7vtPAWzXhru53m4a4wJEeigwpyW+ZZErRGWEOFZGUNI4DSSkjv1/QQh5zp2Oo/mF7vcy6tvbh2O+Ar9kbYT86f2wNTPg3762Y/rws1A6cqCVkWUDuym9nNObz9Vd2vqm5wNFAfiPX43dWU1bc+Zxoe0PRs6fVUCpdUSe0tAseIMwX1HAselgnRRs36mjtZA36aRpmfp6nHU6VM6WaBjBG+AhaupTM3Y2Ltvj1lXYJFX3BLgydBHy2Cqn0BiLNoDyET2GQns/DIPwt1RSaXoHujstW7wMbdKV7OhOFjt3KtisROWJ0+VSfgD5t6diMZrId9OJsQZ9sn0OqY2StjhhBWwoBgvndUvu+3sW8AXNcNmi5ccdkDY4I/X1hM2lO8gSMGK4NdkUlZWdhxLaS5u6m9I4BVMZFZZodsvDZ3p75xDabw4JoMiJfuZVYkhKv3Jnhtr3jVS52TT6BFfWwD8JU02XBIBi/2VXAchTtpuJ2gfjSDEnrThFBOAvtnzhlrIra8vKP+SwTFhKBa1DnSf8yNHL+BeYexujZ0fxmWswZom
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D8E01E2F380044FB04C5462FCBA4F4A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c7d551-be79-429d-5d33-08d85f396558
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 20:52:18.9700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3dz36d5QDyUE+7YWKLKPjbqiRLQkZcA8G+4LAOYMLJ3+Wgt/Lq3d3jlxJ795gxdYlptBUfoJj32I8/3MIhrng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3572
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_18:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220163
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMjIvMjAsIDY6MzcgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBKYXlhc2hy
ZWUgRCIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9y
ZyBvbiBiZWhhbGYgb2YgamF5YXNocmVlLWRAaGNsLmNvbT4gd3JvdGU6DQoNCiAgICBDbGFzc2lm
aWNhdGlvbjogSENMIEludGVybmFsDQoNCiAgICBUaGFua3MgUGF0cmljayBmb3IgeW91ciByZXNw
b25zZS4NCg0KICAgIEluIHBob3NwaG9yLWJtYy1jb2RlLW1nbXQsIEkgYW0gc2VlaW5nIHRoZSBz
b2Z0d2FyZSBpbWFnZSBpcyB1cGdyYWRlZCBhbmQgYmFzZWQgb24gdGhlIGltYWdlIHVwZGF0ZSwg
dmVyc2lvbiBpcyB1cGRhdGVkLg0KICAgIEJ1dCBpbiBteSBwbGF0Zm9ybSwgSSBoYXZlIHRvIHJl
YWQgZmlybXdhcmUgdmVyc2lvbnMgdXNpbmcgb2VtIGNvbW1hbmRzIGFuZCB0aGF0IHZlcnNpb24g
c2hvdWxkIGJlIGRpc3BsYXllZCB1bmRlciBkYnVzIG9iamVjdHMuDQoNClRob3NlIG9lbSBjb21t
YW5kIG5lZWRzIHRvIHJlYWQgZmlybXdhcmUgdmVyc2lvbiBmcm9tIGRidXMgaW50ZXJmYWNlIGlm
IHRoZXJlIGFyZSBhbnkgZXhwb3NlZC4gSSBhbSBub3Qgc3VyZSBob3cgbXVjaCAgd2UgYXJlIGV4
cG9zaW5nIGZpcm13YXJlIHZlcnNpb24gY3VycmVudGx5Lg0KDQogICAgV2hldGhlciBwaG9zcGhv
ci1ibWMtY29kZS1tZ210IHJlcG8gd2lsbCBiZSBzdWl0YWJsZSB0byBkaXNwbGF5IHRoZSBmaXJt
d2FyZSB2ZXJzaW9uIHVzaW5nIGRidXMgb2JqZWN0cz8NCg0KICAgIFJlZ2FyZHMsDQogICAgSmF5
YXNocmVlDQoNCiAgICAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KICAgIEZyb206IFBhdHJp
Y2sgV2lsbGlhbXMgPHBhdHJpY2tAc3R3Y3gueHl6Pg0KICAgIFNlbnQ6IE1vbmRheSwgU2VwdGVt
YmVyIDIxLCAyMDIwIDg6NTQgUE0NCiAgICBUbzogSmF5YXNocmVlIEQgPGpheWFzaHJlZS1kQGhj
bC5jb20+DQogICAgQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgVmVsdW1hbmkgVC1FUlMs
SENMVGVjaCA8dmVsdW1hbml0QGhjbC5jb20+DQogICAgU3ViamVjdDogUmU6IFJlYWQgRmlybXdh
cmUgVmVyc2lvbnMNCg0KICAgIE9uIE1vbiwgU2VwIDIxLCAyMDIwIGF0IDAyOjEyOjU1UE0gKzAw
MDAsIEpheWFzaHJlZSBEIHdyb3RlOg0KICAgID4gV2UgYXJlIHdvcmtpbmcgb24gYSBwbGF0Zm9y
bSB3aGljaCBoYXMgbXVsdGkgaG9zdCBhbmQgZWFjaCBob3N0IGhhdmUgZmlybXdhcmUgdmVyc2lv
bnMgc3VjaCBhcyBDUExELCBNRSwgQklPUywgQnJpZGdlIElDIGFuZCBWUi4NCiAgICA+IFdlIGhh
dmUgdG8gZGlzcGxheSBpdCBpbiBkYnVzIG9iamVjdHMuDQogICAgPiBDYW4geW91IHBsZWFzZSBw
cm92aWRlIHlvdXIgY29tbWVudHMgb24gd2hpY2ggZGJ1cyBvYmplY3RzIGl0IHdpbGwgYmUgc3Vp
dGFibGUgdG8gc3RvcmUgYWxsIGZpcm13YXJlIHZlcnNpb25zLg0KICAgID4NCiAgICA+IEFsc28g
aW4gcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzLCBJIGFtIHNlZWluZyAiU3lzdGVtLmludGVyZmFj
ZS55YW1sIiBpbiAveHl6L29wZW5ibWNfcHJvamVjdC9JbnZlbnRvcnkvSXRlbS8uDQogICAgPiBX
aGV0aGVyIGl0IHdpbGwgYmUgc3VpdGFibGUgdG8gc3RvcmUgYWxsIHRoZSBmaXJtd2FyZSB2ZXJz
aW9ucyAoL3h5ei9vcGVuYm1jX3Byb2plY3QvSW52ZW50b3J5L0l0ZW0vU3lzdGVtL0hvc3ROKS4N
Cg0KICAgIEFsbCBzb2Z0d2FyZSB2ZXJzaW9ucyBzaG91bGQgYmUgbW9kZWxsZWQgcGVyIFsxXS4g
IFRoZSBzdWItc2VjdGlvbiBbMl0gdGVsbHMgaG93IHRvIGFzc29jaWF0ZSBhbiBpbnZlbnRvcnkg
b2JqZWN0IHRvIGEgc29mdHdhcmUgdmVyc2lvbiAodG8gc2hvdyB3aGljaCBCSU9TIHZlcnNpb24g
YSBzcGVjaWZpYyBob3N0IGNhcmQgaXMgcnVubmluZyBmb3IgZXhhbXBsZSkuDQoNCiAgICBJIGRv
bid0IHRoaW5rICdJbnZlbnRvcnkuSXRlbS5TeXN0ZW0nIGlzIGludGVuZGVkIHRvIHJlcHJlc2Vu
dCBhIHNpbmdsZSBob3N0IGluIGEgbXVsdGktaG9zdCBzeXN0ZW07ICdTeXN0ZW0nIHdvdWxkIHJl
cHJlc2VudCB0aGUgZW50aXJlIGNoYXNzaXMuICBZb3UgbWF5IHdhbnQgdG8gdXNlICdDaGFzc2lz
JyBvciAnQm9hcmQnIHRvIG1vZGVsIGEgc3ViLWFzc2VtYmx5Lg0KDQoNCiAgICAxLiBodHRwczov
L2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1kYnVzLWludGVyZmFjZXMvdHJlZS9tYXN0ZXIv
eHl6L29wZW5ibWNfcHJvamVjdC9Tb2Z0d2FyZQ0KICAgIDIuIGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuYm1jL3Bob3NwaG9yLWRidXMtaW50ZXJmYWNlcy90cmVlL21hc3Rlci94eXovb3BlbmJtY19w
cm9qZWN0L1NvZnR3YXJlI2ZpbmQtYWxsLXNvZnR3YXJlLXZlcnNpb25zLW9uLWEtbWFuYWdlZC1l
bGVtZW50DQoNCiAgICAtLQ0KICAgIFBhdHJpY2sgV2lsbGlhbXMNCiAgICA6OkRJU0NMQUlNRVI6
Og0KICAgIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQogICAgVGhlIGNvbnRlbnRz
IG9mIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudChzKSBhcmUgY29uZmlkZW50aWFsIGFu
ZCBpbnRlbmRlZCBmb3IgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBvbmx5LiBFLW1haWwgdHJhbnNt
aXNzaW9uIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvci1mcmVlIGFzIGlu
Zm9ybWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLCBjb3JydXB0ZWQsIGxvc3QsIGRlc3Ryb3ll
ZCwgYXJyaXZlIGxhdGUgb3IgaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4gdmlydXNlcyBpbiB0
cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0aCBvciB3aXRob3V0
IHJlZmVycmVkIGVycm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55IGxpYWJpbGl0
eSBvbiB0aGUgb3JpZ2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIFZpZXdzIG9yIG9w
aW5pb25zLCBpZiBhbnksIHByZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xlbHkgdGhvc2Ug
b2YgdGhlIGF1dGhvciBhbmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0IHRoZSB2aWV3cyBv
ciBvcGluaW9ucyBvZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3JtIG9mIHJlcHJvZHVj
dGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwgbW9kaWZpY2F0aW9uLCBk
aXN0cmlidXRpb24gYW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdlIHdpdGhvdXQg
dGhlIHByaW9yIHdyaXR0ZW4gY29uc2VudCBvZiBhdXRob3JpemVkIHJlcHJlc2VudGF0aXZlIG9m
IEhDTCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVt
YWlsIGluIGVycm9yIHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVk
aWF0ZWx5LiBCZWZvcmUgb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0dGFjaG1lbnRzLCBwbGVh
c2UgY2hlY2sgdGhlbSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0cy4NCiAgICBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KDQo=
