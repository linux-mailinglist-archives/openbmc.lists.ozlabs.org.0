Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1ED19A024
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 22:49:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sLz74YkpzDqZp
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 07:49:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=135935d244=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=K/Wtz6/p; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=K7A+81Rc; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sLxZ2fSBzDqY1
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 07:47:44 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VK00pk023623; Tue, 31 Mar 2020 13:07:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=YOBlSP8fM3T4bEb4nmgxAIiMqwYsXFPl4tWgkSa6Sck=;
 b=K/Wtz6/pIxC5pgsmht5jl/0jdfaWaJ/OKXS1+gyUQAj9Mt5maa4uTff3PxwZtvzemWcQ
 jKfO/FIJgT3OLLbLPb3C2aBppSLd9hZqoUhfEH112kCey/y26U+oicg/a5o6+lBtt/mk
 74hXxe2qx3IPjhlBO1DNuo+Gm0XAfu/GhjM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 302pqwhd4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Mar 2020 13:07:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 31 Mar 2020 13:07:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0lG8oK2nOGlnyOyZC9BC1mta5SMcUly7MDRE2N0Sz5FQ9qvuqVKvRNJ5To1JS2jwqC0HYdNQ7l33H1JYnPUznfQg1okffMobOPkC2gcqn3Smzv1UC44uGDspf00Et0foIXO7VC3oatKXG0LYcntfTy0ud7llhbec/68RhqGV6hZM8kx7ypQQCUWeqCIFkVGJJRN53192XEi7O4zB/kU7UEVpX/MY6/To/DoB15Bcs79poFNo7y+8jnxMsskTkc0rV13ljK3WU1pyTYcpQM/Cp3wKflt59vbjwG8AXeNic1tin6879ObHLkJPondA3bY0nNGPfhq459S0kFyzuZ6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOBlSP8fM3T4bEb4nmgxAIiMqwYsXFPl4tWgkSa6Sck=;
 b=DDNiutMesGv4yysq+5OqK5JbxjNh3lp4IpqVMAS/H98QIFTzjf3HwV1oa1u9gVX1zt7R0HLEN9EU/8/lFxcDMPkXy3APFlyLrZ39HVjad4PJXSXL4QWMUhc1yOjuWeCBHDSxl6O1VzT5tAXmuVJc/nCpN9/pmTUiZeK0H+IFV4LmTrfozvBxmoFPS/1Jj5mk/TFTPoP4rzpzhiDzLe1X/pwZYzGaS+0xu1BGJDyhTd99CCG2WuYk1qLYqP0MWdus5arq9pDOIAgjf8TiBFACHjAzHFYlyd3/iaHs22Qe5T2OloidUWZV9AHqyQ65yVs/JHuJxxaFeV6/fjDuKbdAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOBlSP8fM3T4bEb4nmgxAIiMqwYsXFPl4tWgkSa6Sck=;
 b=K7A+81Rc/Gf2zXgc3fpGbKdwS4V3Jlkgm6D6o+/ckgqGdQjDmoTA1VVb52yLMGWNX9fdMym9Cxce6dHr4YZvGM5mqNDbFk63wdAMWZQGaarmVxkq1xgDZ7Xa4ncYwmApUorR6Mc5XkXa5JGajsoONt0RKuRpjJNK/KWbk64rPtk=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3865.namprd15.prod.outlook.com (2603:10b6:303:42::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Tue, 31 Mar
 2020 20:07:39 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 20:07:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Benjamin Fair <benjaminfair@google.com>
Subject: Re: Chassis sled cycle
Thread-Topic: Chassis sled cycle
Thread-Index: AQHWBs3CzC9IpdImME+X8ulcZoCifahi/JoA//+wf4A=
Date: Tue, 31 Mar 2020 20:07:39 +0000
Message-ID: <40F2216B-79C3-409E-BBBA-C10D5347DCFC@fb.com>
References: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
 <CADKL2t6nach67q57ca==uqHHEVCf=+F3PBOcQ1v0ZAazk6Yr+Q@mail.gmail.com>
In-Reply-To: <CADKL2t6nach67q57ca==uqHHEVCf=+F3PBOcQ1v0ZAazk6Yr+Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:51f6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a81df7ae-2dc0-47dc-f46b-08d7d5af2a1e
x-ms-traffictypediagnostic: MW3PR15MB3865:
x-microsoft-antispam-prvs: <MW3PR15MB3865F250938D3F821AC34689DDC80@MW3PR15MB3865.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(396003)(39860400002)(366004)(136003)(376002)(76116006)(316002)(66476007)(66446008)(6512007)(86362001)(8936002)(81156014)(71200400001)(4326008)(7116003)(66946007)(3480700007)(66556008)(6916009)(6486002)(64756008)(478600001)(8676002)(6506007)(54906003)(186003)(966005)(81166006)(2906002)(2616005)(36756003)(33656002)(5660300002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i56NIJtujdQoVT/yaUNNn1DLGPv3HTMMbIMm/sy0bfyvgPH6mp3MTAIXuHQkZ1hNwmKjSOV0A5tpqCIT6EyPSRItJ7u4kgsvli8oNOgPEUDSlcosQz9sQcwSsdAae5BQas+V1bFapOl4ChUMT+d0ZQMEIaU87OL3Ny/z78xoX3ouIDn0YMSZPu+0Zld+s9OBdqHVvlrlipt5SOXFdIMXvQz09SFBJ5ocGQaEEeizB7crK0Lez943NOyPDQrOn/9sVgJgYKGQuv6eOk2ijNKOLUcpX+MnSTOFbOS8WFXxNtZunCa/L4/HNRInlku2T7MaJ275yMjpBA3CqtX98p8ICaTTceHgJoRLlH7ls5CTZFcCHnqPEYndYmlPOeAs4HD4+V9e7gmaxGVXYQvDWGq+gsXFB7SHMX+iNmNm8QDyLmDbmMalmgy9/jacFGZv13m6rLRAfiqoFE15P2/WNsLO3FNKqt/ZUy2vZcDhEj28pVLKcmAdyTyoUD8Q4yoVe1mXkLwTAjAU5EhdZj3PNp4Uwg==
x-ms-exchange-antispam-messagedata: EOKJxnkhh27g93luw18X61GyIHSUVMuN+J8qbx128unbPLrx6bMwrgq82Hg6tH89ymhR782sNVZTfELJkD7Bw0/1DVywiT0PoOFz7x1jsmftXiuI0LzikenoEWEl29kXv7J8sZI0BEqDmeZ8tvnNxJPT2fInV5v24cKL4L/DqXhcBDNRkR5EjEe/Qv/iYX7d
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFBE9E1CC2295444B4E07698C0064A7F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a81df7ae-2dc0-47dc-f46b-08d7d5af2a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 20:07:39.7515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nB1ojvko4hYEebqlyDraVDYWlI5JViU+09fL803Hc8ejVv1ktX9m4vGoYotS2mtE2LHNtEkRhBCPudf8zq/zXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3865
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 clxscore=1011 suspectscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310166
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
Cc: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDMvMzEvMjAsIDEwOjUzIEFNLCAiQmVuamFtaW4gRmFpciIgPGJlbmphbWluZmFp
ckBnb29nbGUuY29tPiB3cm90ZToNCg0KICAgIE9uIE1vbiwgMzAgTWFyIDIwMjAgYXQgMTM6MDAs
IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBI
aSBKYXNvbiwNCiAgICA+DQogICAgPiBXZSBoYXZlIGEgcmVxdWlyZW1lbnQgb2YgQ2hhc3NpcyBz
bGVkIGN5Y2xlIGFuZCBpdCBjYW4gYmUgYWNoaWV2ZWQgYnkgc2VuZGluZyBhbiBpMmMgY29tbWFu
ZCB0byBob3Rzd2FwIGNvbnRyb2xsZXIuIElzIHRoZXJlIGFueSBwbGFuIHRvIGFkZCB0aGlzIGZl
YXR1cmUgaW4geDg2LXBvd2VyLWNvbnRyb2wuIEl0IHNob3VsZCB0YWtlIGkyYyBidXMgYWRkcmVz
cyBmcm9tIGNvbmZpZ3VyYXRpb24gZmlsZS4NCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+IFJl
Z2FyZHMNCiAgICA+DQogICAgPiAtVmlqYXkNCiAgICANCiAgICBUaGlzIGZlYXR1cmUgaXMgaW1w
bGVtZW50ZWQgb24gc29tZSBzeXN0ZW1zIHVzaW5nIGFuIElQTUkgT0VNIGNvbW1hbmQ6DQogICAg
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZ29vZ2xlLWlwbWktc3lzI2RlbGF5ZWRoYXJkcmVz
ZXQtLS1zdWJjb21tYW5kLTB4MDMNCiAgICANCiAgICBJdCBjdXJyZW50bHkganVzdCBhY3RpdmF0
ZXMgdGhlIHN5c3RlbWQgdGFyZ2V0DQogICAgZ2JtYy1wc3UtaGFyZHJlc2V0LnRhcmdldCBhbmQg
bGV0cyB5b3UgcmVnaXN0ZXIgc2VydmljZXMgdG8gZG8gdGhlDQogICAgYWN0dWFsIGhvdHN3YXAg
cmVzZXQgKHVzdWFsbHkgYnkgdG9nZ2xpbmcgYSBHUElPKS4gSGF2aW5nIGEgdW5pZmllZA0KICAg
IHNvbHV0aW9uIGluIHg4Ni1wb3dlci1jb250cm9sIGZvciB0aGlzIHdvdWxkIGJlIGdyZWF0IQ0K
DQpCZW4sIHBsZWFzZSBjbGFyaWZ5IGlmIHRoaXMgaXMgc2FtZSBhcyBwb3dlciByZXNldCBvciBk
aWZmZXJlbnQgZnJvbSBwb3dlciByZXNldC4gQXMgSFNDIHJlc2V0DQppcyBiZWluZyB0cmlnZ2Vy
ZWQgYnkgaTJjIGNvbW1hbmQgbm90IHRocm91Z2ggR1BJTyBhdCBsZWFzdCBpbiBvdXIgc3lzdGVt
LiBQb3dlciByZXNldCBpcyANCiBiZWluZyB0cmlnZ2VyZWQgdGhvdWdoIFBPV0VSX1JFU0VUIGdw
aW8gcGluIGFuZCBpdCBpcyBzdXBwb3J0ZWQgYnkgeDg2LXBvd2VyLWNvbnRyb2wuDQoNClJlZ2Fy
ZHMNCi1WaWpheSAgIA0KDQo=
