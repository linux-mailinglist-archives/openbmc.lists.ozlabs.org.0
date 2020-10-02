Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B010281D3E
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 22:59:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C32RL29KCzDqRR
	for <lists+openbmc@lfdr.de>; Sat,  3 Oct 2020 06:59:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=754452c4f9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=TNLCDWAA; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=VjrFk3ZH; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C32QT6fJ7zDqKN;
 Sat,  3 Oct 2020 06:58:24 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 092KsOiY031961;
 Fri, 2 Oct 2020 13:58:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=l4hVhJ9uTdteYDdct3orQg+Bq77QKoQIIz9PUF26nMg=;
 b=TNLCDWAAs/3Os0QlJNhUAurxBlR5YcWP+LB4Ncp6l5jG0076crcDlT2oJRF1EnVxrI02
 xPS26l717ogBQ3m2j4Yy/MyijKWIK4Zh/3m1aomzBoiqIDVqxe3T3k88tC6fMQb3DuHg
 mYAI5Blh4QBJNbsKVPydz88KuYMDC403JQI= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 33w01tcbu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 02 Oct 2020 13:58:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 2 Oct 2020 13:58:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzOpHZulkbzHMV0A95cuNOVa+7QLi+84mo6c9+8agYFTTKiWJL7ZXHlGvxx5kIDw9dsCcYVwvOsnUPc8c/5w6B3xcCDR//thRwJvkJeqRkf9HIwdIs3O0N4nAU1o6PsOO1QXY50LD6oahnB0x4fLUepsuZYJ8xbsdjpm+mjthStTm07ltcJG0rVlmFZG5AyjFcTg7SGkGyslIMjxjybQlE2WlvRRvOvx7F3WBF4R+PA1nazTzH7GjYymB7UikUmlqPdcIep4kuz5J+tDXGRpNYNdQWZsozp7R1lRbAyvYuZoP30V0mkovmwHN+3v4E0ZMMoxg7CgtF55HXqrzci67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4hVhJ9uTdteYDdct3orQg+Bq77QKoQIIz9PUF26nMg=;
 b=ZxjvH0DcedfgpeVtnPWSmlfB8QHDGhbGbHYe+HVx11JAfMaohl7lL/KbgCQQvNh/9XHijsc5UFmSdJITycQbvm0UDQB5NC2KqpEYUr537yRO6yZaUFps34CYDr9IsQ36ZBGxqG7lqB+HTJHcakRhWGVD/1EXzy+viTLjX1Bj+8pY/XHlIz/se0+J9oSusi7mKSQUQT5iktEL9eB7OCsKBxtQQQ1GL8OqlCgD10kFd6EQ8yqiLQmrbMq2pvad9s90rYnNFU8uLbaS/new68I7SBPui2QUW0+l67UNlL0ACAVJm1EFJFN+aeaTVASgvyVDdgTPA7r2KijKyfgK2FU8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4hVhJ9uTdteYDdct3orQg+Bq77QKoQIIz9PUF26nMg=;
 b=VjrFk3ZHjg86EVc4PXvbUkO9CC1wq05EtpcwCyt6Bnc5m/pyWxysVnBkOFK4pwuKwqxa9aBub05BJibM8DwKso9cPUIE/o8RyVWPRa/JkbaJ88LrM+mAZPWTHDTLa/ud0HoV7KLcSgeGjHML9ayStgIvaRO+esEEvUtTdDwycKE=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2454.namprd15.prod.outlook.com (2603:10b6:a02:89::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Fri, 2 Oct
 2020 20:58:14 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 20:58:14 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jayashree D <jayashree-d@hcl.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Read Firmware Versions
Thread-Topic: Read Firmware Versions
Thread-Index: AdaQIMU5ljsiRzlYTUW3d3oi6MD/gwACmf2AAC39YUAANv8YAAAJ2/UA///kioCAAIVoAP/97TAQ//Ih+HCAHUHrgA==
Date: Fri, 2 Oct 2020 20:58:14 +0000
Message-ID: <1E720961-55BD-4CC2-8F8F-E6324F900149@fb.com>
References: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200921152337.GJ6152@heinlein>
 <SG2PR04MB3093A25A217B7E1FFD65D8A8E13B0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200923153510.GP6152@heinlein>
 <974e9c2abdf54c96038585730403d5b9@linux.vnet.ibm.com>
 <5FEF272B-706E-4C48-978D-1C3CEB137CFD@fb.com>
 <CAGm54UHW=ZdCOAVskjt8PiAn7FRcpAM7dL3J4UvB8g0bP+Qbaw@mail.gmail.com>
 <SL2PR04MB3097964C3083440779871FC9E1360@SL2PR04MB3097.apcprd04.prod.outlook.com>
 <SG2PR04MB30936F1769ABD503C232E6BEE1300@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30936F1769ABD503C232E6BEE1300@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hcl.com; dkim=none (message not signed)
 header.d=none;hcl.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:80d8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50e77bbc-3c08-41d9-c917-08d86715e13e
x-ms-traffictypediagnostic: BYAPR15MB2454:
x-microsoft-antispam-prvs: <BYAPR15MB2454B73A13A3F431F65EEAE9DD310@BYAPR15MB2454.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lrpACz0+YfHZEHG/Jj1vtuXnbT5XnFqUp6RwmtJNUKJC8NlKG1O82LJaA0Bdk8HHrklKQ2lfw50KWNOxXVPqctPy1GK9NphcPeUGAxkQyd3RjUTNJlLIRZmjuZuqiz7mQBY3gcWY55iAELXn0xrFu1cZreaV2WdxF1+Ds+XU3hRHRNAPYcGllvmc0V33lVcm6iqVAJyfUMVuM45VdRyx8hBcyQOxUeRh2W1IUA7CKgih/gF9T8Fl3m7szYf7Ju+qTEkk3Mg6A/7Q1PZ1CinhatWZ/f4QPEtuXQbvEsgo+1EwDFQ2ouUtNlup2ZoHmUzLHUGBbBU9jH5zJwQa302ElQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(136003)(39860400002)(366004)(6486002)(2906002)(36756003)(6506007)(2616005)(7116003)(6512007)(71200400001)(66556008)(66946007)(4744005)(3480700007)(5660300002)(64756008)(66446008)(8676002)(76116006)(86362001)(478600001)(33656002)(83380400001)(91956017)(4326008)(316002)(66476007)(110136005)(54906003)(186003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 3PbSIMQsxey/BJQVIi7GwnS3HmZlw8FoW9P1wQG5l9gS6VEcOye/cjXezBgIdmZ1zdKye4rlokmZ8oqLIzZTT+bWzKS0rmH9c6gjI21oFydEgXPjCOb+6ULr/8yWlC5he1GqBdG/B3LpKcDvzb/2SXrJY0zgepWhUyme4/7oO7iu/pcsoBc8jZx6V9R8dPYOLDaHRzCow8+uH650tKh56UUFp2yzbEXn4MZD+l0aNVWfbt0kFO3mRVKeAe1RH7i4gTDxTO+dSy1vdG3tWZCWS6i8F3hHwpLA9qWQjHXnBE4DQwoIoq1+RcDiPg3JrHnfvz0nfJwXEVusys8u7zTOQDmXWSPUlZT1tFz/JQXD5yqeB6qhMGcUQ+uvLMDEfoNPN6fS60wRM5Qy8D+n5GVJoRtU5IA68s743A0TJ0uqys5Bb5Ry1rxf1NFgyrcfK9xMv8yq1YB1bLIEqQlKtZ9DkGISM1C8BWSZTMyv1KmCrDvZYvmDjBeER51SUXSjOCDDXHk2uOaTEASN9E+5q74/nlHX9VYYq7++FUR1rUvJ3Lm++sNqWfeEys/0RHvQG3nVRFSS4KLUsA7LtIpbvcpdbGaJxG5fTRCSidk0Di90AtUvCrhufYvjkSmR5XN9TOYVHzT+xFf3lyZ4ir+Xlkw+lB+gFdS+jQoR46aqnTseyNVuynmV/p/1HgtraXs76B+Y
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBAD0E1AE43FCF499FB4BD47D0D265CE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e77bbc-3c08-41d9-c917-08d86715e13e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2020 20:58:14.3507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QE5azTUmDlIEFvqQWkh4RJ6iuXFZMeUubGLA4CXc8+25vLO1B4HjJ0WEPs8X9KS52KP17/MRBtJjzVdn5ThQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2454
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_14:2020-10-02,
 2020-10-02 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010020154
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
Cc: Lei Yu <yulei.sh@bytedance.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDEwLzEvMjAsIDg6MTkgQU0sICJKYXlhc2hyZWUgRCIgPGpheWFzaHJlZS1kQGhj
bC5jb20+IHdyb3RlOg0KDQogICAgQ2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5hbA0KDQogICAg
SGkgVGVhbSwNCg0KICAgIEN1cnJlbnRseSB0aGVyZSBpcyBubyBwbGFjZSBob2xkZXIgdG8gaGF2
ZSBhbGwgcHJvZ3JhbW1hYmxlIGVsZW1lbnRzIHZlcnNpb25zLiBXaGV0aGVyIGFueSBuZXcgcmVw
byBjYW4gYmUgY3JlYXRlZCB0byBtYWludGFpbiBhbGwgdGhlIHByb2dyYW1tYWJsZSB2ZXJzaW9u
cyBpbiBvcGVuYm1jLg0KICAgIEtpbmRseSBwcm92aWRlIHlvdXIgc3VnZ2VzdGlvbnMgdG8gcmVh
ZCBhbGwgdGhlIGZpcm13YXJlIHZlcnNpb25zIHVzaW5nIE9FTSBjb21tYW5kcy4NCg0KV2hhdGV2
ZXIgZGFlbW9uIGlzIHJlYWRpbmcgb3IgY29sbGVjdGluZyBmaXJtd2FyZSB2ZXJzaW9uIGNhbiBj
cmVhdGUgYSBQREkNCiB2ZXJzaW9uIGludGVyZmFjZSBhbmQgYWRkIHZlcnNpb24gdGhlcmUgc28g
aXQgY2FuIGJlIGFjY2Vzc2VkIGJ5IGFueW9uZSB3aG8NCm5lZWRzIGl0LiBFdmVyeSB2ZXJzaW9u
IHNob3VsZCBiZSB1bmRlciBQREkgdmVyc2lvbiBpbnRlcmZhY2UsIGl0IG1ha2VzIGVhc2llcg0K
dG8gbWFrZSBtYXBwZXIgY2FsbC4NCg0KICAgIFJlZ2FyZHMsDQogICAgSmF5YXNocmVlDQoNCg0K
