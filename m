Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9E8199C5D
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 19:00:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sFvr5nzPzDr0m
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 04:00:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=135935d244=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=b5pm4Gjd; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=blABbcs+; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sFpD4yq1zDqVQ
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 03:55:55 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VGmgm0009560; Tue, 31 Mar 2020 09:55:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=cdqfUv9o4SiEoN3tLBeca4QS5BuW6GGCgPRbkfVmM+o=;
 b=b5pm4Gjd2Wh+70jHFYsRkk09VaX2LxoniztpnMu9R7HsKs8X6wV4ji9c5kKbPC9XsdkP
 gX9d9GF0ZSiE6QFOYCpBHrekZfta6h852Ck2BfO9VyYfB3vmkfbVOLhvvrid2wOjbev0
 IwpRafQKGKxQg/Zy5nGaPPl26qI1AX2aQJQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3024dgu5w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Mar 2020 09:55:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 31 Mar 2020 09:55:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nt95FFe9k/q4wMwYlhlS1O6TukUIMPEhz9jpN0CyZlO3dBmu8l2OczPNnjm+KLQKj6w2dcTcV7nMDcZRHrKgL1sGcf+oT3izm52tdcLi7q1WC2g22blEEVoGwBsYvPPNdFd1bKuKsH/9TOHrFqYgQ5pOr6hUKebOOtGQEa5QlmPCKakeQs9keS5Cr9CICGDtpT+eqeD4MLx/PKg1qfOm3EV2GQyMMVLMpf5QcGN+QjkbJBHcA8Dc5wSBbgrI5L12FuXIOURqfMkCn/FIDeP6N1lZgoja9WKd+/nsEAid3Ev0CXqPGz0zR57EPXap9xEo0unkzK7bt8HnXjEmBBO5bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdqfUv9o4SiEoN3tLBeca4QS5BuW6GGCgPRbkfVmM+o=;
 b=ilaqyDV+80PY19f7uebH8O6y41S/H4lwyh1Nj5nXJ5LORF8/6otoGnKkqlk2e0+ZbsjGlyqcZIN5JkUDkIefenhqL8srZfV9KKYsLC3u5aHmOIwkRtrshMs2vmPGeR6MI4WOA2i9vHciWpUQkLy9ox5xxl5azwberjThr8P7YEKz0wX41rzZ5+e55u3ki+1FIrnA6rCb/cpqY1bcHvrAnKu1ww9cAWboPp6DW++heWb/aLZKR49FSfFgodGjomDPQLyvEp9fAkGjv+amKK8eTTvrF5BvdmSKx3Gk/RSMYMmzMoFLMx7xD4EBO7xPvTO5CeQOqUpXLc674qHfNg6HbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdqfUv9o4SiEoN3tLBeca4QS5BuW6GGCgPRbkfVmM+o=;
 b=blABbcs+yIAE3nb+TwPFjU6FKo+5iTPRAhUk7BS/pO4GO4oDrv12p31VPfy6Skq6VVitqXyMFE5jYtJO1RpwMxuKXNyG0IHfT8O7tKW/dwobjOXXuElGw9iCmkKvUAxYGXA7+uwVd/oXUPzAlxGeObSVC75GUKYYk8Dx07aYh40=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3788.namprd15.prod.outlook.com (2603:10b6:303:4e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 16:55:49 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 16:55:49 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, James Feist
 <james.feist@linux.intel.com>
Subject: Re: Chassis sled cycle
Thread-Topic: Chassis sled cycle
Thread-Index: AQHWBs3CzC9IpdImME+X8ulcZoCifahhwPgAgAC2hoA=
Date: Tue, 31 Mar 2020 16:55:48 +0000
Message-ID: <0A9DB8ED-BF12-4F0F-AEF0-8CFB9AA410EC@fb.com>
References: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
 <478597bb-e9f9-d71c-bbf8-84ad79fd8821@linux.intel.com>
In-Reply-To: <478597bb-e9f9-d71c-bbf8-84ad79fd8821@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:51f6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87479c65-bc50-49e8-4e1d-08d7d5945d3c
x-ms-traffictypediagnostic: MW3PR15MB3788:
x-microsoft-antispam-prvs: <MW3PR15MB3788AE6C500EDEC08C7942C6DDC80@MW3PR15MB3788.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(39860400002)(346002)(136003)(366004)(376002)(53546011)(66446008)(81156014)(8676002)(81166006)(6512007)(36756003)(478600001)(64756008)(66946007)(316002)(33656002)(110136005)(8936002)(66556008)(66476007)(2906002)(2616005)(6486002)(76116006)(3480700007)(7116003)(86362001)(71200400001)(4744005)(4326008)(186003)(5660300002)(6506007);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fwL1GRyUmXsC5oWyUQJTLBoFoH+MaXJzCcyuvlAidKPJGSao3Tk8TuaWRJXTlYqCJguK2AZYWBBt2MCWkSGJ8idhQGhbMw/FdaCTK6fapNLBliZH77NfMngeE1pCdAZ2wvI/s4cpIhQ/Xmr2NMSzZ/dfeQuANrL4O1ZSy3aPdlyBpnQxngHXZA5sjCnYoGlam3jhzPcvj9q/4pdd/hetILqATlnBHobujxpS4bf9AX9x14D2T+SQubyJiYOy80v0q0Xu2zCFjjZVylMg9NLYNPNR22IHAMkUNqWmiy309BDaQPow436lJKwJd/aFiE8qv+uDetMStnYdLKzbZe8eR8UkLPgWvo6Mh73EQioTjobw+l6TsHQdSF+17AnY1azIe90VhPaaB6A1IjVABA0nUD1HLpUOdOtu407VtA1ycVyWQ4Zu1ttqunmH6IXNDk/o
x-ms-exchange-antispam-messagedata: z/pJYIMiE2tTDRq7tiobPaTsNQnwAEBRCvVFXcqFuacIM7SqDN7ZBCL/YneCZOajsrP2DZFeZ2TdNJ1xTGE2z1JDB4QfA5mdZThlLKnUbp08u+VdjXonsGAy5+lFPeTZj+t1zdZKu8r7a6fZuZLYAU6e/cX4qUSR7TumHEzmcQYotHn+/14cV2qpaF9dR7TN
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7D80449185AC94987701ADD5BCA2045@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87479c65-bc50-49e8-4e1d-08d7d5945d3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 16:55:48.9963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u8DXQ0Ao8l5EAOX9oe3muk4JDFnP4fRZPpcjoUKFe9XpEdRiO1bVnJZEbC25PrLNp0+rAPznX4fhXLl4HACvdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3788
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310147
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

VGhhbmtzIEphbWVzLA0KSSB3aWxsIGltcGxlbWVudCB0aGlzIGZlYXR1cmUgaW4geDg2IHBvd2Vy
IGNvbnRyb2wuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrvu79PbiAzLzMwLzIwLCA0OjAyIFBNLCAi
QmlsbHMsIEphc29uIE0iIDxqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoN
CiAgICBIaSBWaWpheSwNCiAgICANCiAgICBPbiAzLzMwLzIwMjAgMTI6NTkgUE0sIFZpamF5IEto
ZW1rYSB3cm90ZToNCiAgICA+IEhpIEphc29uLA0KICAgID4gDQogICAgPiBXZSBoYXZlIGEgcmVx
dWlyZW1lbnQgb2YgQ2hhc3NpcyBzbGVkIGN5Y2xlIGFuZCBpdCBjYW4gYmUgYWNoaWV2ZWQgYnkg
DQogICAgPiBzZW5kaW5nIGFuIGkyYyBjb21tYW5kIHRvIGhvdHN3YXAgY29udHJvbGxlci4gSXMg
dGhlcmUgYW55IHBsYW4gdG8gYWRkIA0KICAgID4gdGhpcyBmZWF0dXJlIGluIHg4Ni1wb3dlci1j
b250cm9sLiBJdCBzaG91bGQgdGFrZSBpMmMgYnVzIGFkZHJlc3MgZnJvbSANCiAgICA+IGNvbmZp
Z3VyYXRpb24gZmlsZS4NCiAgICBXZSBkb24ndCBoYXZlIGFueSBwbGF0Zm9ybXMgd2l0aCB0aGlz
IGNhcGFiaWxpdHksIHNvIHRoZXJlIGFyZSBubyBwbGFucyANCiAgICB0byBhZGQgdGhpcyBmZWF0
dXJlIHRvIHg4Ni1wb3dlci1jb250cm9sLg0KICAgIA0KICAgID4gDQogICAgPiBSZWdhcmRzDQog
ICAgPiANCiAgICA+IC1WaWpheQ0KICAgID4gDQogICAgDQoNCg==
