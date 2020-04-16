Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A93E1AD318
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 01:16:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493FTX1PCSzF0QQ
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 09:16:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=137518329d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=VYD7XXOf; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=iHOGaDld; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493FSZ4L3YzDscG
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 09:15:25 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GN2Q8C014289; Thu, 16 Apr 2020 16:15:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=GwN0NLZk0nlwcXTqMv9TueJl8ON3yuCT+HPdykVfNJI=;
 b=VYD7XXOfgRP2+GrOG2Dnv+wBmsH4aaaYlRuviszgcE2QrUnE1WlJ2JcGrPXWQNYSCaaH
 Tlq4cX9eLIoSUmzLjz88ye8DZMGszUhjancIVzwjkBZicCpDB33e+iFwJxdrBh32kJeX
 IdBsPL/vFgFvTI/+VKG9bXv1mBg2cqVB8po= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30dn7qpj23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Apr 2020 16:15:18 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 16 Apr 2020 16:15:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnMm9PxSxLe7lpkgCWt3Da4EKBNQwCrQuXfu1COI+bJqNRdVsp+CHhss4ehWjor3cZJCYfZ4VN3WNaQimxd2NHr/8s6Y9gSMeUEcbqn+/AAz5YRPyjG/FKCy2nQ5g/oxtMxn3Ok72oZymbp1p1sDuOzUVi0MO7aKLedGci7d+wX5YkfToHgjniipvHslCCvX9shnWQS1JXPYy02EVL0pHRlp84wxvuJouksEjRandwT74wvBTKh9grUB0mbOIAAi5Di/yZBeyPTMwJdVpGKjKIqvcK6Op1z+f0Mnh+BxwOYTA/fryPjzuNaqDek5MdgytS5R+ua/T4fL5N58NPnszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwN0NLZk0nlwcXTqMv9TueJl8ON3yuCT+HPdykVfNJI=;
 b=kqKjWYpC61+Kv7MotjNnGAEmej/yLei2PvpLTSY0h5NGcKo4kO9Zui6k5VaeKJm40nMCdY5JOy1yaQMgH4hzEti+J4E5TZ+j7dGqT7MXxpWzNSvSkpQwsx4dvExncSiyVYk7LzaYjThij6jHEYVVQDuESLd+W6NuLVmiJE3ZXiG8Ll+VYDghcIqMcpnokpBahxSk1Urf+pyzue4D7fu4Ti3P6mzoR9Zv1RiittWXFORiXjysHEwiX1dPtLR3I8Gf3E7W/unkwH6osmEgrR5hS1FIrOBOkKVL7qCUmDws/Jd6t4XaHyfLVMh1dHEhLuDpQxhalXMuicyd1XUEM7CKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwN0NLZk0nlwcXTqMv9TueJl8ON3yuCT+HPdykVfNJI=;
 b=iHOGaDldPQEXWaN0o8fPSrN/fFdKYS3EywOv2r1qJ8IHz/F50LZlVT5uxXdDff141XLRo+fq19plY3h3XGFX4UP4+aXhLmCM/COGwHs1YKKJhBdFEyipAU55X5+9XRUnIBGLMayHQIIWbaMijQUFfEL2wXAJzBgbssHwyoS+Xx4=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2902.namprd15.prod.outlook.com (2603:10b6:a03:b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.18; Thu, 16 Apr
 2020 23:15:16 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.027; Thu, 16 Apr 2020
 23:15:16 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, Neeraj Ladkani <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>
Subject: Re: nvme sensors
Thread-Topic: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV76h5pxOAgADRXfD//5lHAIAAmM4QgABf84CAAOO4gA==
Date: Thu, 16 Apr 2020 23:15:16 +0000
Message-ID: <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
In-Reply-To: <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:457d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d78c4ee0-6c8b-4050-528b-08d7e25c063a
x-ms-traffictypediagnostic: BYAPR15MB2902:
x-microsoft-antispam-prvs: <BYAPR15MB2902F76BA29234B0AC7E1F7CDDD80@BYAPR15MB2902.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(396003)(136003)(346002)(376002)(366004)(3480700007)(8676002)(66446008)(33656002)(36756003)(81156014)(86362001)(8936002)(2906002)(316002)(4326008)(186003)(5660300002)(71200400001)(66476007)(7116003)(91956017)(110136005)(76116006)(66946007)(2616005)(478600001)(6506007)(6486002)(66556008)(64756008)(6512007)(4744005);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B9SVoJxe9tRKFSLvscTydGiDRNu3wygy6OcLsGX1TQPZKswmHn/FdqW9LCK5GdC7kzOMj+aEu4arCasVeqY4+WseB8Or3Ewvf8n3hbF3pi479CkF3v+Pasbql3Vf45/pLkJcRdKOhqcnNWp4w0KXnxaBd1Cf4WLbVoyr+ewnuqlVcVdg0ZkeY+nVUWoeAWYpZW5s+wiqVkmU4KnaL7htBFe21Wz/0TiFIJ6HeaBNdQLNJLLq6c5mMllnq2t6mmV19TxqH46HTqpWphkaIwc11qK3aAaP7BRG07jCm/n5EjObGrCkB8TjBAM6p/frr4I4PRj0wSGJRznf5yZ+woZEwiQ7h5nK/DGu9O42fyydHi20ofX20Aw38Xa64DRbnD3JnJUqTXF6iyxtONcyfUqDgrPmPC4GnQSuiGxg3kqqEh9BXbc/m5+xhabhS2NXfl3z
x-ms-exchange-antispam-messagedata: I8azCUfFFafsAV+mhCXdIK+sIFxPNEmNAh5Zs7hRTn5kCn6nmfFdFFF1JVVzXvtSt0jVsyW3eEBWg33AxxrW6U8JtwCvuLh/XvDjT350b1f7N2Y2GaN8c8oROQlpl3Lrolb1XLJw9nytM4LeZqu63DfrFHJjDz/+2ZF00vnbcJ+/dsfat7YUtt4bgUPW5COm
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <079FF78B33C75946A7594E8D50EC4D57@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d78c4ee0-6c8b-4050-528b-08d7e25c063a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 23:15:16.4159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDkoGX2EP/SaKVyoYhZpTjYSM8s2r6wRCmTmrIGwqw0EpqIuXbFHb56mRFZY2oqEzA3e+I+KfhvjuGlbQdDY4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2902
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_10:2020-04-14,
 2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=804 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160159
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

Q3VycmVudGx5LCBkYnVzLXNlbnNvcnMgc3VwcG9ydCByZWFkaW5nIE5WTUUgc2Vuc29ycyB2aWEg
bWN0cCBvbmx5LiBJdCB1c2VzDQpsaWJtY3RwIGFuZCBzb21lIG9mIHNtYnVzIHBhdGNoIGZyb20g
SW50ZWwuIEl0IGFsc28gdXNlcyBzbGF2ZSBtcXVldWUgbWN0cA0Ka2VybmVsIGRyaXZlciB3aGlj
aCBpcyBub3QgdXBzdHJlYW0uDQoNClNvIGN1cnJlbnRseSBpdCBpcyBub3QgbWF0dXJlZCBhbmQg
ZnVsbHkgdXBzdHJlYW1lZC4NCg0KSmFtZXMsIGhvdyBjYW4gd2UgdXNlIHRoaXMgd2l0aG91dCBt
Y3RwLiBJIGRvbid0IHNlZSBhbnkgbm9uIG1jdHAgc3VwcG9ydCBsaWtlDQpTZW5kaW5nIGRpcmVj
dCBzbWJ1cyBjb21tYW5kLCBwbGVhc2UgYWR2aXNlIGlmIEkgbWlzc2VkIGl0Lg0KDQpSZWdhcmRz
DQotVmlqYXkNCiAgICANCg0K
