Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7617E276164
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 21:51:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxTMq09HGzDqdq
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 05:51:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=65350707bb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=gTEEi6Yb; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Lg/NUXUu; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxTKV1kdjzDqgV
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 05:49:48 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08NJn2ir008190; Wed, 23 Sep 2020 12:49:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=bCcP/0+SQcRWdrKvcts8Qohg35UboqUaEL2kaxxXQ7o=;
 b=gTEEi6YbqNHF5p1h4ykG73CjWMXinx3uJsdHUvYKzMnlzweaPf5jylBxikK1Of2gu9ZP
 f40dJT66a437uEpqZQJFlnCA8n9QDf/qbWWQlnBuPaq2EvEPWk2yzhMd3GTxLlLjUaKB
 ZVbw58SjX6sqp12jvzPUcQjwVar6lrsDUXA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33qsp4wmrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Sep 2020 12:49:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 23 Sep 2020 12:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KztLW6kz9MNIwq2OxBbhX/ds7c9HaiZZf72ONol3lPM2mFAZ26NDu0JCUnBjPrwbhLNEa+WzYe7tFYu9+S/pYaHZiv/BfNzdahTQWnJUvpxkj1odjLr8IYL+r0bhrmY6sSH6iY7lZZMsuV+YZZsdYUuOX3Ce3Ly5xCDkRGxMu6IzKVO48XL5BqektcogsPdxDst6M/nsVhJ5fT0KkikAQCE2bt/6QqsvYz5JTxhifsKiLo1ImZ0g/BhUoKOeFuYxMTNrBlCA0ANegcf9/QOvjxneLR2ZTdsKE9Vj2glau2xsuiRL4p1DUedlzO/lpFUky/et8A693deA5c7Vedstkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCcP/0+SQcRWdrKvcts8Qohg35UboqUaEL2kaxxXQ7o=;
 b=VrvFRIj0Y9g+GpZvvROLmJmrYnEbDBq0UXpCgZpZWcxVT2vESdeMEv27ZGcdIT+zvQKuCF9v4OUuMSct2DGFFbFuOOasmxFhyiJGRm3zoX+aUJiEhPESod8xmgKnxq6k2v21gklkHBmPZLsUKLEd3MnCQqOPvWcwpkiN5XQLy3AeZWVwxYXBHr1au5L2Yb6cGJwi49aWKTcWa3jkJcCC7PtOXYikDaQ1c01nup7bQ6hH17TnatQXasLVRW/eOmeqxcYcri6maFScMIoE/tcHNmBiplFHDdgV7Q6K14NVt00q2lIuCrv0WrE9j2fWlJZVDdLWWmpJo1chAMLWDpUwAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCcP/0+SQcRWdrKvcts8Qohg35UboqUaEL2kaxxXQ7o=;
 b=Lg/NUXUuejmrSg0wciOTVjcdEsr8QXLCEV87yw79sSBn2GJA7Hd3SaV9deAIY7QTOGOfK4DPVRACrVBYfbMFllhQmPPsogccaBi+9/URI0VdScSwcCPFDt6xwkJFv0+FUJ4YFl46qfY9kv0kC7mI9EHmHphgT2lk8ds/pzV7OP8=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Wed, 23 Sep
 2020 19:49:41 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Wed, 23 Sep 2020
 19:49:41 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: interest in a minimal image recipe
Thread-Topic: interest in a minimal image recipe
Thread-Index: AQHWi58zEOwKc47hCUe0SSUl2C7L4altUs8AgAXC9gCAADGrAIAAIUGAgAFL4ICAAfiWAP//i5sA
Date: Wed, 23 Sep 2020 19:49:41 +0000
Message-ID: <FA54875C-7BCA-458F-82F2-A09B9F6BAD79@fb.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
 <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
 <20200921175227.zmdjbmixbwvstd4m@thinkpad.fuzziesquirrel.com>
 <DB1605BB-81F4-4297-9BC0-BC1B054BAAEB@fb.com>
 <CACWQX82ARgwPo1LCWF3fYZtzXtj4p=ty43xN21qX9GOZdzLKhQ@mail.gmail.com>
In-Reply-To: <CACWQX82ARgwPo1LCWF3fYZtzXtj4p=ty43xN21qX9GOZdzLKhQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:4282]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8571ada-5091-4ea3-89ca-08d85ff9cfea
x-ms-traffictypediagnostic: BY5PR15MB3667:
x-microsoft-antispam-prvs: <BY5PR15MB3667100A2803A7BF4DFADA15DD380@BY5PR15MB3667.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: loE0PRSMgowx6YMTYPGF5tgcp4NH99vlkJ80llNCuj74/fm9fh6udr3vfaMN3AEpvG4/9TL/wJS5fZyGqe5dxmbbBPUFiE6ayr3u7FgxU+eoU1cZORPVQOyomwG6y4OlUi3F9brRbTaPAPn8M1VLZGwBlrL1VcdgTfJesBQVfDaTx1OenjwxvXIFKTDke4qU2mvGFvhjYVtRkbCo4yF2gcuZYC8nu3GNpEyQTn9u+rS1cvIPH1alWYGX6ztIFiMKJK6rghrEMzx+A1W4OVOXdhJG34r32uZ04z8b0ulFOAvs2tnJNsfwZ9BvTdxZKDjzhEtlmKbqFj0cO1VMIJ014w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(136003)(39860400002)(376002)(346002)(5660300002)(53546011)(2616005)(6486002)(66446008)(64756008)(83380400001)(76116006)(91956017)(2906002)(86362001)(66476007)(66556008)(478600001)(6512007)(4326008)(33656002)(186003)(316002)(54906003)(36756003)(66946007)(8676002)(8936002)(6506007)(71200400001)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YH5gABEEFBdnCEg9QEYjHy1vMiJ3pZd8Ps5TxEqhfbEqE7LDyDfvQ6cJwO/upOKfriuWvuLb95jqsQEllGt1BLlJwfn9sEdvEvqJRFkRIWRN0eYtIEDGVNLMkpHSr5eAZA2J5rXU1oiWdp6nbuk+ntvJXDZ08xMHObp2lhWgAtkQAwG+jmB0h1ii9DruSm6Hy/F0+8NQUfTB7dSlFUK6fZevfIdPaNjzLNAT9otgr8c/o3yR1JIqCRNSbweQ6f4u+TMak2paEfZ9l1IIUl0LqYjkxrcJqpVAy9WEW4JyFkULEIOej7u0CMt2jQ1DgBn7Odetjtfl1S0CLkorxEqXyEcpqHrzaz58gqaS5YeJOzBXQZMPVVu5Z0TbVloqol5z8j3g+a+gCMDQEBu+/OCjSVmjnBu1B+U7MKR7NmxrImPYIGSdNlpa47ABpNv9SbGoPha4oEc1hHr9ZB4kNnIRVfR7QgdnRzbi1Su9WgZQFw7pztRHW1fPzjhCFAL4PwcUhuhYN9j8J8G8k8Pl3rjnM+QO9hx1nr8axEw6qHd8Ms/YsI0M9v0QdwNGLF+dm3SfYnU0Min5Jt+aQY4MKL8x/JSS5118DY+ZZLFD31kZwcDTXSJKfCsxEh70iydYyc4lprvZQRoBDBt3zUqYlIF8q2zTb/l9K44akuWZ8P77I9+iaiUPvaMeTZfneI5C8X8z
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9219BFBADA395A418C62DD9EE7592B90@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8571ada-5091-4ea3-89ca-08d85ff9cfea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 19:49:41.1745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VpOBo97WRzBCTfRCKLThUtjt4q1IoTc2qa1CuIwY/0jAlsIx5TCgcmkUXSnzEZkbBJ97lcUoXx9LsSDk1e/O+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3667
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_16:2020-09-23,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230148
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMjMvMjAsIDEyOjQ2IFBNLCAiRWQgVGFub3VzIiA8ZWRAdGFub3VzLm5ldD4g
d3JvdGU6DQoNCiAgICBPbiBUdWUsIFNlcCAyMiwgMjAyMCBhdCAxOjQwIFBNIFZpamF5IEtoZW1r
YSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+
IE9uIDkvMjEvMjAsIDEwOjU3IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQnJhZCBCaXNob3Ai
IDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24g
YmVoYWxmIG9mIGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4gd3JvdGU6DQogICAgPg0KICAg
ID4gICAgIE9uIE1vbiwgU2VwIDIxLCAyMDIwIGF0IDA4OjUzOjI2QU0gLTA3MDAsIEVkIFRhbm91
cyB3cm90ZToNCiAgICA+ICAgICA+T24gTW9uLCBTZXAgMjEsIDIwMjAgYXQgNTo1NSBBTSBCcmFk
IEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPiB3cm90ZToNCiAgICA+ICAgICA+
Pg0KICAgID4gICAgID4+IEluIHdoYXQgd2F5IGRvZXMgRU0gcmVxdWlyZSBpbnRlbC1pcG1pLW9l
bT8gIEkgYW0gdXNpbmcgRU0gd2l0aG91dA0KICAgID4gICAgID4+IGludGVsLWlwbWktb2VtIHdp
dGhvdXQgKEkgdGhvdWdodCBhbnl3YXkpIGlzc3VlLg0KICAgID4gICAgID4NCiAgICA+ICAgICA+
WW91J3JlIHJ1bm5pbmcgRW50aXR5IE1hbmFnZXIsIHdpdGhvdXQgaW50ZWwtaXBtaS1vZW0sIGFu
ZCB5b3UgY2FuIHJ1bg0KICAgID4gICAgID5hIHN1Y2Nlc3NmdWwgImlwbWl0b29sIHNlbnNvciBs
aXN0IiBvciAiaXBtaXRvb2wgZnJ1IHByaW50IiBjb21tYW5kLA0KICAgID4gICAgID5hbmQgaGF2
ZSBpdCByZXR1cm4gdGhlIGVudGl0eSBtYW5hZ2VyL2RidXMtc2Vuc29ycy9GcnVEZXZpY2UgcmVz
dWx0cz8NCiAgICA+DQogICAgPiAgICAgQWgsIG5vdyBJIHVuZGVyc3RhbmQuICBObywgSSBjYW4n
dCBkbyB0aGF0LiAgQnV0IEkgZG9uJ3QgbmVlZCB0byBiZWNhdXNlDQogICAgPiAgICAgdGhlIGRl
ZmF1bHQgSVBNSSBoYW5kbGVyIGltcGxlbWVudGF0aW9ucyBpbiBwaG9zcGhvci1ob3N0LWlwbWlk
IHdvcmsgZm9yDQogICAgPiAgICAgbWUgKHRoZSBZQU1MIGJhc2VkIG9uZXMpLCBhbmQgdGhvc2Ug
ZG9uJ3QgbmVlZCBlbnRpdHktbWFuYWdlci4gIEknbQ0KICAgID4gICAgIHVzaW5nIGVudGl0eS1t
YW5hZ2VyIGZvciBvdGhlciByZWFzb25zLg0KICAgID4NCiAgICA+ICAgICBBcyBhbiBhc2lkZSAt
IEkgdGhpbmsgYSBtYWpvcml0eSBhcmUgdXNpbmcgdGhlIGludGVsLWlwbWktb2VtIGhhbmRsZXJz
DQogICAgPiAgICAgbm93IHNvIEknZCBzdXBwb3J0IG1vdmluZyB0aG9zZSBpbnRvIHBob3NwaG9y
LWhvc3QtaXBtaWQgYW5kIHVzaW5nIHRoZW0NCiAgICA+ICAgICBhcyB0aGUgZGVmYXVsdHMuICBC
dXQgdGhhdCBtdXN0IG5vdCBiZSBlYXN5LCBvdGhlcndpc2UgSW50ZWwgd291bGQgaGF2ZQ0KICAg
ID4gICAgIGp1c3QgZG9uZSB0aGF0IHJhdGhlciB0aGFuIGZvcmtpbmcgdGhlIGhhbmRsZXJzIGlu
IGludGVsLWlwbWktb2VtIGluIHRoZQ0KICAgID4gICAgIGZpcnN0IHBsYWNlLg0KICAgID4gSSBz
dXBwb3J0IG1vdmluZyBtYW55IHN0YW5kYXJkIGNvbW1hbmRzIGZyb20gaW50ZWwtaXBtaS1vZW0g
dG8NCiAgICA+IHBob3NwaG9yLWhvc3QtaXBtaWQuICBFbnRpdHkgbWFuYWdlciBpcyByZXF1aXJl
ZCBvbmx5IGZvciBmcnUgYW5kDQogICAgPiBzZW5zb3IgU0RSIGlwbWkgY29tbWFuZCBidXQgdGhl
cmUgYXJlIG1hbnkgb3RoZXIgY29tbWFuZHMNCiAgICA+IHdoaWNoIGFyZSB1c2VmdWwgYW5kIGNh
biBiZSBtb3ZlZC4NCiAgICA+DQogICAgPiAgICAgQnV0IGluIGFueSBjYXNlLCBpbnRlbC1pcG1p
LW9lbSByZXF1aXJlcyBlbnRpdHktbWFuYWdlciwgbm90IHRoZSBvdGhlcg0KICAgID4gICAgIHdh
eSBhcm91bmQgcmlnaHQ/ICBUaGUgImZlYXR1cmUiIGJlaW5nIHNlbGVjdGVkIGhlcmUgaXMgdGhl
IEludGVsIElQTUkNCiAgICA+ICAgICBoYW5kbGVyIGZvcmtzLCBhbmQgdGhhdCB3b3VsZCBzaW1w
bHkgZGVwZW5kIG9uIGVudGl0eS1tYW5hZ2VyLiAgQQ0KICAgID4gICAgIHN0cmF3bWFuOg0KICAg
ID4NCiAgICA+ICAgICBvYm1jLXBob3NwaG9yLWltYWdlLmJiY2xhc3M6DQogICAgPiAgICAgRkVB
VFVSRV9QQUNLQUdFU19pbnRlbC1pcG1pLWhhbmRsZXItZm9ya3MgPSAicGFja2FnZWdyb3VwLWlu
dGVsLWlwbWktaGFuZGxlci1mb3JrcyINCiAgICA+DQogICAgPiAgICAgcGFja2FnZWdyb3VwLW9i
bWMtYXBwcy5iYjoNCiAgICA+ICAgICBSREVQRU5EU19wYWNrYWdlZ3JvdXAtb2JtYy1hcHBzLWlu
dGVsLWlwbWktaGFuZGxlci1mb3JrcyA9ICJpbnRlbC1pcG1pLW9lbSINCiAgICA+DQogICAgPiAg
ICAgaW50ZWwtaXBtaS1vZW0uYmI6DQogICAgPiAgICAgUkRFUEVORFNfJHtQTn0gPSAiZW50aXR5
LW1hbmFnZXIiDQogICAgPg0KICAgID4gICAgIE9uZSBwcmVyZXF1aXNpdGUgdG8gdGhpcyBpcyB0
aGF0IHRoZSBpbnRlbC1pcG1pLW9lbSByZWNpcGUgd291bGQgbmVlZCB0bw0KICAgID4gICAgIG1v
dmUgdG8gbWV0YS1waG9zcGhvci4gIFBlcmhhcHMgaXRzIHRpbWUgZm9yIHRoZSByZXBvIHRvIGJl
IHJlbmFtZWQgaW50bw0KICAgID4gICAgIHNvbWV0aGluZyBlbHNlLg0KICAgID4gV2UgbWF5IGhh
dmUgdG8gc3BsaXQgYW5kIGxvb2sgZm9yIHdoYXQgd2UgbmVlZCBmcm9tIGludGVsLWlwbWktb2Vt
LiBUaGVyZQ0KICAgID4gYXJlIGxvdHMgb2YgaW50ZWwgb2VtIHNwZWNpZmljIGNvbW1hbmQgaW4g
dGhpcyB3aGljaCBhcmUgbm90IHVzZWZ1bCBmb3INCiAgICA+IG1hbnkgb3RoZXIgcGxhdGZvcm1z
IGFuZCBhcmUgb3ZlcnJpZGRlbiBieSB0aGVpciBvd24geHgtaXBtaS1vZW0uDQogICAgPg0KICAg
ID4gV2Ugc2hvdWxkIHNpbXBseSBwb3J0IHN0YW5kYXJkIGlwbWkgY29tbWFuZCBmcm9tIGludGVs
LWlwbWktb2VtIHRvDQogICAgPiBQaG9zcGhvci1ob3N0LWlwbWlkLg0KDQogICAgKzENCg0KICAg
ID4NCiAgICA+ICAgICA+SW4gbXkgdW5kZXJzdGFuZGluZywgdGhpcyBzaG91bGRuJ3Qgd29yaywg
YW5kIHdlJ3ZlIGhhZCBtYW55IHJlcG9ydHMNCiAgICA+ICAgICA+b2YgIkkgZW5hYmxlZCBlbnRp
dHkgbWFuYWdlciwgYW5kIG15IHNlbnNvcnMgZG9uJ3Qgc2hvdyB1cCBpbiBJUE1JIi4NCiAgICA+
ICAgICBJIGRvbid0IHRoaW5rIHRoZSBhbnN3ZXIgdG8gImhvdyBkbyBJIGVuYWJsZSBJUE1JIHNl
bnNvcnMiIHdhcyBldmVyDQogICAgPiAgICAgImVuYWJsZSBlbnRpdHkgbWFuYWdlciIgd2FzIGl0
PyAgVG8gZW5hYmxlIElQTUksIHlvdSBoYXZlIGFsd2F5cyBuZWVkZWQNCiAgICA+ICAgICB0byBl
bmFibGUgZWl0aGVyIHRoZSBvcmlnaW5hbCBZQU1MIGJhc2VkIGhhbmRsZXJzIG9yIHRoZSBpbnRl
bC1pcG1pLW9lbQ0KICAgID4gICAgIGZvcmtzLg0KICAgID4NCiAgICA+IFdlIHNob3VsZCBmaXgg
dGhpcyBpbiBob3N0LWlwbWlkLCBhcyBhbGwgc2Vuc29ycyBhcmUgYWRkZWQgdG8gc3RhbmRhcmQg
ZGJ1cw0KICAgID4gSW50ZXJmYWNlIGFuZCBpZiBpdCBpcyBub3QgZGlzY292ZXJhYmxlIGJ5IG1h
cHBlciBvciBvYmplY3QgbWFuYWdlciB0aGVuIHdlDQogICAgPiBzaG91bGQgZml4IGl0IHNvIHRo
YXQgYW4gU0RSIGNhbiBiZSBidWlsdCBpbmRlcGVuZGVudCBvZiBzZW5zb3IgaW1wbGVtZW50YXRp
b24uDQogICAgPg0KDQogICAgSSBhZ3JlZSB3aXRoIGFsbCB0aGUgYWJvdmUuICBEbyB5b3UgdGhp
bmsgeW91IGNvdWxkIGdldCB0aGUgcGF0Y2hlcw0KICAgIHB1c2hlZCB0byBzdGFydCB0aGlzIGRp
c2N1c3Npb24gaW4gZ2Vycml0Pw0KDQpZZXMgc3VyZS4gb25jZSBJIGZpbmlzaCBteSBjdXJyZW50
IHRhc2tzLCBJIHdpbGwgc2NoZWR1bGUgdGhpcy4NCg0K
