Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C226AD02
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 21:08:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrXn84NzfzDqVP
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 05:08:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=652724fd9d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=iSi46dyD; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Ptp+ZEO7; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrXm90j71zDqPW
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 05:07:16 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FJ5qX4010137; Tue, 15 Sep 2020 12:07:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=yrw5vBnTBmUA4xVGuxSLEWVxgz57kvh1M0pmARKwvgo=;
 b=iSi46dyD8l3RIoEdIYXHBp/h0EKFkP9C/B7TSb69Rt8Zg1Xoe05kOek5dllHXpibiujm
 OYUXa6+K0nAWQ2S2OQQk+EP1dqqqFVAg5hyNjRvFgC6QIvjlpYUs/tkVeYl/x8l8IHht
 kLWwzy5UDpKAiggmbaKqAtihOY9pxR9rq/A= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 33gv2phbyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Sep 2020 12:07:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 15 Sep 2020 12:07:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAenedn6PGqFgOJ6RzH2tDp/jeIT7k8reRXu8bGZIIxtHj1eHD6BmsYWBlLBXa3pc0r4Hf9rtSa6HPNLW6H4xNoaRn2yD+yWnVtfRH+XVt5YlGBba515o53NnQhblnOZrU+ZkvunSy2zAzC8WaudT4Kl5es4PvhS2tXck53rGLbmRglwznlFPRkszI5TrvLL1q2swGrDLCVEBHUbe572LJFrEmRGmrwGw23T0zVDVEJaU8gjZG3AJz9tKluajAJM1RYMzzjHz8zL3JlSlFzPhAOw0Ff+a/M84hUC6ivWP6Sgx/SG2kLqwtpMXnrNnuN8RNhcGserj4uxOy9IP/3+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrw5vBnTBmUA4xVGuxSLEWVxgz57kvh1M0pmARKwvgo=;
 b=TNjIj80ix2KrXHNqXws6Fx31XLPJTbFpCMoVotUWOOKKkme1sUf58soKj1aP7bMtUEDyYG6AwiZTO7zQH6gp+OcbKByPPmhpXBI7egdP6iX5KxVD3pOHwRoqh2LORLPvDg1AdX7INqZk1YdITA29frrm6QHh9Iz7LOkNt2KRaJyW5lygtDrRgvjmo+EP30eDIxU4LdFL6ZCdFSlUnEnlNwToUEOsHPBvVvJ4ykHhfa6lJIrw2hZrtA1J84UCj5JQlZ1dKjCjUr2WHOaq1bjjp6x9LjCYN1V0678tnAGGPUQ1qxp4+ri8POVq6dn44gH6cMQLofeExJorpZnBm2ImIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrw5vBnTBmUA4xVGuxSLEWVxgz57kvh1M0pmARKwvgo=;
 b=Ptp+ZEO7K7xxUTbAys51H8AZ6DBVg+Z9KKxs5KsM1FtLmeXGwkG5vUOHLhDndbTrIstrw/ejVGbKjf6L5BNKm+5aoNoA4Ul1c5UbgDMtFWy6vfdWcaskk9q3cj3sN7VkaCaVvjbU+uL5WTI/AKiPAOHZOE/89AvxGHKfTleACKc=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB4118.namprd15.prod.outlook.com (2603:10b6:a02:bf::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 19:07:10 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::4d8e:7b5d:455b:3a97]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::4d8e:7b5d:455b:3a97%6]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 19:07:10 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>, Neil Bradley
 <Neil_Bradley@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQCA72kAAA7UvEAAALC0EP//pIUA//+ESKCAAIvbAP/+FToQgASWKQD//4oO4AAPAmyA//83aBD//mTOgP/mwW7Q/8yCMAD/mIeqQP8wEaiA/mAhSYD8uz7p0Pl1RXGA
Date: Tue, 15 Sep 2020 19:07:10 +0000
Message-ID: <DC9E73F0-163B-4518-BAD2-AC16B87DBFAD@fb.com>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
 <5F804DFD-B91D-4293-A410-62ED737423A7@fb.com>
 <6bc3d9da57d44f55ad66179e74a51bd1@SCL-EXCHMB-13.phoenix.com>
 <a5e34d90e0c34849a672189f8adf9cd7@SCL-EXCHMB-13.phoenix.com>
 <AA3AD0B7-CC74-4B6C-927D-101A3E721004@fb.com>
 <b62681c4a4c148b58cdd9ff1e614d400@SCL-EXCHMB-13.phoenix.com>
 <22D145E2-1328-428F-9AAF-54E138797994@fb.com>
 <ba0c0f989f1045f98a5186a57917c4b6@SCL-EXCHMB-13.phoenix.com>
 <E2ECF617-0F2B-4526-A2F9-20F343F317A3@fb.com>
 <b6891a4662b04509ae5ed0f8c54777ce@SCL-EXCHMB-13.phoenix.com>
 <868F639F-7878-4B90-8CAE-7C95EB57B26E@fb.com>
 <9b4d083d50ad4feba14f5c8848540ade@SCL-EXCHMB-13.phoenix.com>
 <37DC42F0-56AD-477E-A5E0-29F8FB466D63@fb.com>
 <0e51a98472f34f5d8626a54dd2107479@SCL-EXCHMB-13.phoenix.com>
 <F30B4C21-5AF7-4E59-8353-944BD1C9F39B@fb.com>
 <e7456a8f3f004855829dfa746cd70780@SCL-EXCHMB-13.phoenix.com>
 <DDCDB096-458F-4AC6-BFE8-C1670ADC12C8@fb.com>
 <22A8A752-CE83-4E7E-9C0A-24828D6FDBFA@fb.com>
 <b7acd0b0fff646f4b6804fb0d6d020d0@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <b7acd0b0fff646f4b6804fb0d6d020d0@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:88de]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4100a2a-fa6c-4723-3953-08d859aa8c0d
x-ms-traffictypediagnostic: BYAPR15MB4118:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB41183F44052356590BB43688DD200@BYAPR15MB4118.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0434zYMGHaPyVkJdrKy0OL63DgRh8yc8r+pD/pJyVmZDXdwkaWeJQpzjrnDRCRz7iCDJHN0DNHCaghDWH0e7Ob8m4QChyGSHJ0q2P497KntGOg25mWakCXezz21l/1n+kZ75rJZWD6UaMS22zi7/u0kM/tKmQuqOOblPHCQK/z3vID3xOorjHNY1rrEi8d66zfHdyNwrQxnfZfLq3AqvXS4mmtkFHZWdDJsIND42b9PAaaD63W4Pd/hJ1ZxWs5anYpm9HEmZRL42592PKzJWuTFyJHk7LnUY6JacMTfbFsyUIErGoW0sf4JE4nQ7fmJ2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(346002)(376002)(39860400002)(366004)(316002)(8936002)(6506007)(6486002)(6512007)(7116003)(478600001)(33656002)(186003)(2906002)(83380400001)(36756003)(5660300002)(2616005)(86362001)(4744005)(4326008)(8676002)(110136005)(71200400001)(66446008)(64756008)(66476007)(66946007)(76116006)(66556008)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: m9loNbN7kcmIpdDeDwYJr2BGua7dR6zHLdhN8HmiIrE1TTqXoge2heLPTxGisjSufFVROQbV6l3X9J19azhmBsJfCzS+fCtfVWt6j4TEgfD1kApDfq1oeffMaCzk7zp6AdVMdFQAHY/Mhfr8vvCN+cGXAcFpsRp3uZM70BDWercDSqatNoePgWLXUEppuV/Ym1zf47c/ehMCG6BjUB27N6tsxk8CQQol5ojO3AS/LS5Z5ekoUqotI/1HM8R4wMdp16pKJYpW/CLr/+kF490403AFUtvtNYzc5ka7Bk9iff6BZHY2NLcH8IDT7DfHj+o7Dj+VM+y/nZxbF1P7ZPt0Qz+08vAWQZdD4eY5KUkgTK424/OvLPfsy748mVlmmnklS6WdL2f6csg5khM/OUqgfD4uglCx0DoF6iHoPdvv83fxfDOE/OhxNeG/X2Zbjl00jN01y8iNu18XvbawCuJm2Jwktp1z3FqYPYVKp85nSiglkK94kE5INe7k+p9q3lCJIB6qoyDt1ZshtHh+ykl0uqkekghqnjVe0iqTY/TkFjBK62+WGD2DHpF4+OizHmL+yzvl6TZhLY17dFd1WR5GpKtkUkz8QWY3B+1gUHFSYYVDevuGLyuHOBkcIsgLEduTZcBXrAJR3Cl2n+6lKq4S02/mHaP0B3GCXth1zUdkeAZe5B3QbVwQj7Jhi12dT5Vn
Content-Type: text/plain; charset="utf-8"
Content-ID: <8372916E494FE948BA33372AFD6DD472@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4100a2a-fa6c-4723-3953-08d859aa8c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 19:07:10.0655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ggNKpoJukLPextiTX38o3EjlA3dsx/0ja5J9+qhRV+xVZFQlBuwDtlicCvgtXSjaAn6hs2ofS+Scfc229xcHkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB4118
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_13:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150150
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
Cc: Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SG9uZXN0bHksIEkgYW0gbm90IHVuZGVyc3RhbmRpbmcgaG93IHlvdSB3YW50IHRvIGNvbnRyb2wg
aG9zdCBwb3dlciB3aGVuIGJtYyBib290ZWQgdG8gdS1ib290IG9ubHkuIA0KUGxlYXNlIGV4cGxh
aW4gd2hhdCBpcyB5b3VyIHJlcXVpcmVtZW50LCBkbyB5b3Ugd2FudCB0byBjaGFuZ2UgdS1ib290
IGNvZGU/DQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrvu79PbiA5LzE0LzIwLCAxMDozMCBBTSwgIlBh
dHJpY2sgVm9lbGtlciIgPFBhdHJpY2tfVm9lbGtlckBwaG9lbml4LmNvbT4gd3JvdGU6DQoNCiAg
ICBXaGF0IHdvdWxkIGFuIGFwcGxpY2F0aW9uIG5lZWQgdG8gZG8gdG8gY29udHJvbCBwb3dlciBm
b3IgdGhlIGhvc3Q/ICBQb3dlciBjb250cm9sIHdoaWxlIGluIHUtYm9vdCBfc2hvdWxkXyBiZSBh
cyBzaW1wbGUgYXMgZW5hYmxpbmcgdGhlIHBvd2VyIGJ1dHRvbiBwYXNzdGhyb3VnaC4NCg0KICAg
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCiAgICA+IEZyb206IFZpamF5IEtoZW1rYSBb
bWFpbHRvOnZpamF5a2hlbWthQGZiLmNvbV0NCiAgICA+IFN1YmplY3Q6IFJlOiBUaW9nYSBQYXNz
IE9wZW5CTUMgMi44DQogICAgPiANCiAgICA+IFNvIGlmIEJNQyBpcyBub3QgcnVubmluZyB0aGVu
IHlvdSBjYW4gY29udHJvbCBwb3dlciBtYW51YWxseSBieSBwb3dlcg0KICAgID4gYnV0dG9uIG9y
IHJlc2V0IGJ1dHRvbi4gQXMgZmFyIGFzIEkga25vdyBUaGVyZSBpcyBubyBhcHBsaWNhdGlvbiBp
biB1Ym9vdA0KICAgID4gd2hpY2ggY2FuIGNvbnRyb2wgcG93ZXIgZm9yIGhvc3QsIEl0IGlzIGRv
bmUgdGhyb3VnaCBCTUMgd2hlbiBpdCBpcyBib290ZWQNCiAgICA+IHRvIGxpbnV4IGFuZCBwb3dl
ciBjb250cm9sIGlzIHJ1bm5pbmcuDQogICAgPiANCiAgICA+IFBsZWFzZSBsZXQgbWUga25vdyBp
ZiBJIGFtIG1pc3NpbmcgYW55dGhpbmcgaGVyZS4NCiAgICA+IA0KICAgID4gUmVnYXJkcw0KICAg
ID4gLVZpamF5DQoNCg==
