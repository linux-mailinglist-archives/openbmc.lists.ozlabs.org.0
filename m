Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E08AD2AE91A
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 07:35:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWFNj3fBvzDqWm
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 17:35:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8584dba45b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=mKcZhFVG; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=QOO4Her1; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWFMs6xL7zDqTY
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 17:35:00 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AB6TkVw018299; Tue, 10 Nov 2020 22:34:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=9LKAUdROH2twEfs+ZeuSAtzyxpknhPODYamr3Slh5Ng=;
 b=mKcZhFVG8wapFTLLTzxer+uym1H9BUhxGYUT4+Mu1XOW/q2nSzuRN4EFHtwSadqbaTqH
 J7CzWztpKuZTzXlxPx6iE+xjCgH7jFjE6tgsMimHqskTuabahCjuotJtfAiwTwNxcVYg
 iWlJtKMCBLvCYYhsjunTEkM7yI0SHVaMVUE= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34pcqsfp3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Nov 2020 22:34:54 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 10 Nov 2020 22:34:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtcbzCMGEANVsBQv9td4UTP401m5LfhEzE6Y9r1kvkak5nuB2Ih4y3kcdINgGtGL8O73kPOjmnvcH48JRzM4duGfZcNPc36pqp87T1pcaIFVz2ZEW0xKSn0JUcYKIzWOYUfYlCJsKOg0tLqqT1r8nwXah0Kx7pFNbKpbxTpTtRlXDu7ZauroYGd3/ZNeZSgNCBpTyw/qduPLeV9xjxZHoazXh/nfTzIR6WS25lAp5ToP5Wa7sRYzr5qS0bicolJQSi61TIoCf2wsuITjnz+bTnpfs17qaubV+BH+i6+rv++7HNArQzxA9McgaZCDUjtM1jFMjIxRwBhWzf+xGO2x7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G54Cw1pO05qOfz04fnDdx3vv3GcfjBP9t9iLlrZ6Rs4=;
 b=ERzLdjncFQIIoGf2Hd1JCva6KpXdw2Ah+iaL9JwH125npiTzfolwnP019taBzwHx/pGBSwlBK1lwlcyGSXuYQsIUoEmld3fl0gZQ4QK9mCtWqWApCQLx26MzZMI9rtF1GGrUPCrQ/DaFgzrRi/VkVgd89BFN4peFhXyoG1uxWDbcxNmQgSUHWgXHUZp8qrxxJ4qk8LyrIergjwXiWQO9bZ1nD4RBjaSze6bw4sG+o1qoHRcP4vxD/NJqsIAZYZ5o+dFKXf5AzwpmPaVr9ez9opkUjssRRZI5Zv7v/4o7R5MSy9QQi6KtK34lDH/8I7fHKNjoEJsPJkxYFisuj5vsJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G54Cw1pO05qOfz04fnDdx3vv3GcfjBP9t9iLlrZ6Rs4=;
 b=QOO4Her1Nz5MFeKm4iRGmKpdHCEhcUgm39Liz9K5Z4lbx76WH2/n/H1b+AuNLTTycvPFQdeFLLx5fwkAHgwPAaeQCNDTAn75INHD5Kd+QG/1OALXDfaXjgQVgqUQca1KwtvP1JEYPeaTnaqAMjihrPgmVMyz8f3kLsVbz/V71S8=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by SJ0PR15MB4169.namprd15.prod.outlook.com (2603:10b6:a03:2c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 11 Nov
 2020 06:34:39 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::35ef:5d5d:6617:e58a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::35ef:5d5d:6617:e58a%6]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 06:34:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Sui Chen <suichen@google.com>, Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Request to create repository google-ipmi-bmc-health
Thread-Topic: Request to create repository google-ipmi-bmc-health
Thread-Index: AQHWlz6Q/XqpUMkh00OhuoNUmWav8qmCp84AgADnEgCAAMmpAIAG4RwAgAAuWgCALweUgIAHxUeA
Date: Wed, 11 Nov 2020 06:34:38 +0000
Message-ID: <BC4115A9-0587-4135-981E-38C086DDD3F9@fb.com>
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
 <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
 <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
 <20201007014324.GG6152@heinlein>
 <CAJOps0tKN4ACB46hoNu1EeX4uaSZ_UeArzcZ=ehGA2sz0oT+aQ@mail.gmail.com>
In-Reply-To: <CAJOps0tKN4ACB46hoNu1EeX4uaSZ_UeArzcZ=ehGA2sz0oT+aQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:3bcb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8f6cc97-07f5-497a-0914-08d8860bdd6c
x-ms-traffictypediagnostic: SJ0PR15MB4169:
x-microsoft-antispam-prvs: <SJ0PR15MB416940192574052A4953D23EDDE80@SJ0PR15MB4169.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pc4w2Czn2X6eHR2Uz/qfBk7czpOwMqxPCEPOqYQEfsfc/28nhoCdBBTb0kLZwy+rklf8chFO4yM/M6kFT+c6MuqYfSh01pwqBRJnVuvWpQQN7svD4t2JbvTchlBqHLpG80c91P0F0MswoU8YfiVhgjvHzhCTn1ZH8MtZmTSYXr4j9V3Gy34mjcRaAMNmRnZW0Tpml/9fcRXFu/a6SyGV19DizN4nIz/J73RJXkkFGhuu1Y/HHTgKUh6hOsNBD0FjnIX4p4XPEynnOwhtf6zebLqzMPY/Jf3pIZGbginY5QX466XkIRLaSzhkzHlY++pUBqNshaB3Tkie0hu/z3YvgzmQTrjKgFTS43pX3VIj2Qd+K3qWrtS4a5/m+SwF4FWgD74zFNTtfpisdd8c6oc7+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(376002)(396003)(136003)(346002)(86362001)(66446008)(110136005)(36756003)(33656002)(8676002)(2616005)(966005)(8936002)(83380400001)(5660300002)(66476007)(478600001)(4326008)(6486002)(53546011)(6506007)(76116006)(91956017)(6512007)(71200400001)(186003)(66946007)(2906002)(316002)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: klXpjVEN292bXrQO/XNBsKGfTKkhLaXWG40Vqy9Dg9Pqqj3V80NnIFgLdm+UZwAhNpuXf1uzzPWvZVezSWB3duZsV9NpQgMz7LwiILhPvOwYiQVm3IHOkDkkd67OXVlCEhHnukMKcHsJC7L2VYB+cFaS6LJc7KJ4Jul2zQ44gNZJJO3XtzQ5tCTfXqzlQwzlJyMUQHTRyMqoIFexiPfRCtMx6M//SfnFo26WRnGdDmCZLfMzBPHe6Gv6VGTYw0UxblMpHrBSqE2pQYSXtKVdNhb5opGV07o2Kr35tXeP9Kt/LXLJh/GN/31PJYAmV4E3JYkGglwBtaETRJfyYdFvxc9Xbl9QSwmxmsTZ7hQ/EIYHUj8hrQ/VVgrkjf+DSdzqHrV9+o0j3bv8oCeVRZT8S8MOameJlcSuw+62nW9/DrCYkyW2NVbq1XVZZbSdVMauZL6aBuJtKICiU8HOA6I2KeZRHfS/LH1UY5HOPffdxibGdoRmghjzsE9jbpEigUfYbjfIfnIT6CCUIR6qSVxgZ3Nn/qAl5CY1iPPdyidYHF2tpsEXFZF6UhzsCHm7wQNPdWZ5pc0ZVFsWnUamjDk8hjGeCR4cJ28KaNQRv8SuMZl4HSlbq/jtH8Oke1xOsB/r0V+wAhen2eH5QgO86X6p/8qFKfZK4PNRfXr6SLIuNE4bXQVOuHQQNKofY67XW+JZ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2C7EC25576B9746BC25375D7F940994@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f6cc97-07f5-497a-0914-08d8860bdd6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 06:34:38.5465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmI0Vf3dkMOOpARgodT8SAGR/dlen2xq/kpQ6JA6KnibBnzznZQhAOaKZljXvrJSY6h/3HHjG5+EzywgZUaiBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4169
X-OriginatorOrg: fb.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 3 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_02:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110034
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDExLzUvMjAsIDM6NTUgUE0sICJTdWkgQ2hlbiIgPHN1aWNoZW5AZ29vZ2xlLmNv
bT4gd3JvdGU6DQoNCiAgICBPbiBUdWUsIE9jdCA2LCAyMDIwIGF0IDY6NDMgUE0gUGF0cmljayBX
aWxsaWFtcyA8cGF0cmlja0BzdHdjeC54eXo+IHdyb3RlOg0KICAgID4NCiAgICA+IE9uIFR1ZSwg
T2N0IDA2LCAyMDIwIGF0IDAzOjU3OjMwUE0gLTA3MDAsIFN1aSBDaGVuIHdyb3RlOg0KICAgID4g
PiBPbiBGcmksIE9jdCAyLCAyMDIwIGF0IDE6NTQgUE0gVmlqYXkgS2hlbWthIDx2aWpheWtoZW1r
YUBmYi5jb20+IHdyb3RlOg0KICAgID4gPiA+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHBy
b3RvY29sIGJ1ZmZlciB3aWxsIGJlIHVzZWQgYnkgZGFlbW9uIHdobw0KICAgID4gPiA+IElzIHJl
c3BvbmRpbmcgdG8gdGhlIElQTUkgcmVxdWVzdCBhbmQgY29ubmVjdGluZyB0byB0aGlzIGRhZW1v
biB2aWENCiAgICA+ID4gPiBsaWJyYXJ5IGNhbGwsIHRoZW4gaXQgaXMgY29tcGxldGVseSByZXN0
cmljdGVkIGZvciB0aGUgdXNlIG9mIHByb3RvY29sIGJ1ZmZlci4NCiAgICA+ID4gPiBJZiB5b3Ug
YXJlIHBhc3NpbmcgcHJvdG9jb2wgYnVmZmVyIHRvIHRoaXMgZGFlbW9uIHRoZW4gd2UgaGF2ZSB0
byBkZWZpbmUNCiAgICA+ID4gPiBzb21lIHBvbGljeSBoZXJlLg0KICAgID4gPg0KICAgID4gPiBU
aGUgUHJvdG9jb2wgYnVmZmVyIGlzIG9ubHkgZm9yIHNlcmlhbGl6aW5nIHRoZSBkYXRhIHRvIGJl
IHNlbnQNCiAgICA+ID4gb3V0c2lkZSBvZiB0aGUgQk1DLiBJdCBpcyBub3QgdXNlZCBmb3IgY29t
bXVuaWNhdGlvbiBpbnNpZGUNCiAgICA+ID4gcGhvc3Bob3ItaGVhbHRoLW1vbml0b3IgYW5kIHdp
bGwgbm90IGJlIHBhc3NlZCB0byB0aGUgZGFlbW9uLg0KICAgID4NCiAgICA+IFdoeSBpc24ndCB0
aGlzIHBhcnQgZG9uZSBmcm9tIHdpdGhpbiBhbiBleGlzdGluZyBJUE1JIHByb3ZpZGVyIChpZGVh
bGx5DQogICAgPiB0byBtZSBhIGdvb2dsZS1pcG1pLSogcmVwb3NpdG9yeSBhdCB0aGlzIHRpbWUp
PyAgSSdtIG5vdCBlc3BlY2lhbGx5IGtlZW4NCiAgICA+IG9uIHRoZXNlIGRldGFpbHMgbGVha2lu
ZyBvdXQgaW50byBvdGhlciBub24tSVBNSSByZXBvc2l0b3JpZXMuDQogICAgPg0KICAgID4gPiA+
DQogICAgPiA+ID4gICAgIE90aGVyIHRoYW4gdGhlc2UgdHdvIHRoaW5ncyBJIHRoaW5rIGFkZGlu
ZyBuZXcgbWV0cmljcyB0bw0KICAgID4gPiA+ICAgICBwaG9zcGhvci1oZWFsdGgtbW9uaXRvciBz
aG91bGQgYmUgbWFuYWdlYWJsZS4gSSBjYW4gc3RhcnQgYnkgdHJ5aW5nIHRvDQogICAgPiA+ID4g
ICAgIGFkZCB0aGUgSVBNSSBibG9iIGhhbmRsZXIgdG8gcGhvc3Bob3ItaGVhbHRoLW1vbml0b3I7
IG15IGZpcnN0IGF0dGVtcHQNCiAgICA+ID4gPiAgICAgbWlnaHQgbm90IGxvb2sgdmVyeSBlbGVn
YW50LCBidXQgaWYgd2UgZmluZCBhbnN3ZXJzIHRvIHRoZSB0d28NCiAgICA+ID4gPiAgICAgcXVl
c3Rpb25zIGFib3ZlLCB0aGUgbWVyZ2VkIHJlc3VsdCB3aWxsIGxvb2sgYSBsb3QgYmV0dGVyLiBI
b3BlZnVsbHkNCiAgICA+ID4gPiAgICAgd2UgY2FuIGZpbmQgYSBzb2x1dGlvbiB0aGF0IHdvcmtz
IHdlbGwgZm9yIGV2ZXJ5b25lLg0KICAgID4gPiA+DQogICAgPiA+ID4gSSBhbSBsb29raW5nIGZv
cndhcmQgdG8geW91ciBwYXRjaGVzDQogICAgPiA+DQogICAgPiA+IFBsZWFzZSBjaGVjayBvdXQg
dGhpcyBXSVA6DQogICAgPiA+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9v
cGVuYm1jL3Bob3NwaG9yLWhlYWx0aC1tb25pdG9yLysvMzcwOTIgDQogICAgPiA+DQogICAgPiA+
IFRoaXMgV0lQIGN1cnJlbnRseSBqdXN0IGFkZHMgdGhlIElQTUkgYmxvYi1iYXNlZCBjb2RlIHRv
DQogICAgPiA+IHBob3NwaG9yLWhlYWx0aC1tb25pdG9yIGFsbW9zdCBhcy1pcy4NCiAgICA+ID4g
SXQgYWxzbyBzaG93cyB3aGF0IHdlIGFscmVhZHkgaGF2ZSBub3cuDQogICAgPiA+DQogICAgPiA+
IFRoZXJlIHdpbGwgYmUgc29tZSB3b3JrIHRvIG1lcmdlIHRoZSBkYWVtb24gYW5kIHRoZSBibG9i
IGhhbmRsZXIgaW4gYW4NCiAgICA+ID4gb3JnYW5pYyB3YXksIGFuZCBJIGFtIG9wZW4gdG8gZGlz
Y3Vzc2lvbiB3aXRoIHlvdSBob3cgdG8gZG8gdGhhdC4gVGhlDQogICAgPiA+IGZpcnN0IHN0ZXAg
SSB0aGluayBJIGNhbiBkbyBpcyB0byBwdXQgdGhlIGNvZGUgZm9yIGV4dHJhY3RpbmcgdGhlDQog
ICAgPiA+IG1ldHJpY3MgKG1ldHJpY3MuY3BwLCBibG9iL21ldHJpYy5jcHApIGludG8gYSBzaW5n
bGUgZmlsZSBhbmQgc2hhcmUNCiAgICA+ID4gdGhhdCBiZXR3ZWVuIHRoZSBkYWVtb24gYW5kIHRo
ZSBJUE1JIGJsb2IgaGFuZGxlci4NCiAgICA+ID4NCiAgICA+ID4gQW5vdGhlciBpc3N1ZSBJIGZv
dW5kIGlzIEkgYW0gbm90IHVzaW5nIHRoZSBsYXRlc3Qgc2RidXNwbHVzIHNvIEkgaGF2ZQ0KICAg
ID4gPiB0byBjb21tZW50IG91dCB0aGUgdXNhZ2Ugb2YgVmFsdWVJZmFjZTo6VW5pdDo6UGVyY2Vu
dCBmb3Igbm93Lg0KICAgID4gPg0KICAgID4gPiBUbyBidWlsZCB0aGlzIHJlcXVpcmVzIDEpIGFk
ZGluZyBhIHBrZ2NvbmZpZyBmaWxlIHRvDQogICAgPiA+IHBob3NwaG9yLWlwbWktYmxvYnMgKGJl
Zm9yZQ0KICAgID4gPiBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJt
Yy9waG9zcGhvci1pcG1pLWJsb2JzLysvMzcxMzMgDQogICAgPiA+IGdldHMgbWVyZ2VkKSBhbmQg
MikgYWRkaW5nIHBob3NwaG9yLWlwbWktYmxvYnMgYW5kIHByb3RvYnVmIHRvIERFUEVORFMNCiAg
ICA+ID4gaW4gcGhvc3Bob3ItaGVhbHRoLW1vbml0b3IncyBCaXRiYWtlIHJlY2lwZS4NCiAgICA+
ID4NCiAgICA+ID4gSG9wZSB0aGlzIFdJUCBjaGFuZ2UgaWxsdXN0cmF0ZXMgb3VyIGludGVudGlv
biBjbGVhcmx5Lg0KICAgID4gPg0KICAgID4gPiBUaGFua3MhDQogICAgPg0KICAgID4gLS0NCiAg
ICA+IFBhdHJpY2sgV2lsbGlhbXMNCg0KDQogICAgSGVsbG8gUGF0cmljayBhbmQgVmlqYXksDQoN
CiAgICBBcyBmYXIgYXMgSSBrbm93LCB0aGUgb25seSB0d28gImdvb2dsZS1pcG1pLSoiIHJlcG9z
aXRvcmllcyBhcmUgMSkNCiAgICBnb29nbGUtaXBtaS1zeXMgYW5kIDIpIGdvb2dsZS1pcG1pLWky
YywgYW5kIG5laXRoZXIgc2VlbSB0byBiZSByZWxhdGVkDQogICAgdG8gdGhlIGhlYWx0aCBtb25p
dG9yaW5nIHRhc2sgd2UncmUgZG9pbmcgcmlnaHQgbm93Lg0KICAgIEluIG15IHVuZGVyc3RhbmRp
bmcgb25lIHNpbWlsYXIgbGlicmFyeSBpcyBwaG9zcGhvci1waWQtY29udHJvbDsgaXRzDQogICAg
SVBNSSBoYW5kbGVyIGlzIGFsc28gaW4gdGhlIHJlcG9zaXRvcnkgcmF0aGVyIHRoYW4gaW4gYSBz
ZXBhcmF0ZQ0KICAgIHJlcG9zaXRvcnkuDQoNCiAgICBUaGUgImhlYWx0aCBtb25pdG9yaW5nIElQ
TUkgQmxvYiBIYW5kbGVyIiAodGhhdCB0aGUgcmVxdWVzdCBpbiB0aGUNCiAgICBmaXJzdCBlbWFp
bCBpbiB0aGlzIHRocmVhZCB3YXMgaW5kZW5kZWQgZm9yKSB3YXMgYSBtb25vbGl0aGljIElQTUkN
CiAgICBibG9iIGhhbmRsZXI7IGl0IHVzZWQgdG8gYm90aCBnZW5lcmF0ZSBtZXRyaWNzIGFuZCBo
YW5kbGUgSVBNSQ0KICAgIHJlcXVlc3RzLg0KICAgIEluIHRoZSBsYXN0IG1vbnRoLCBJIGhhZCBk
ZS1jb3VwbGVkIHRoZXNlIHR3byBmdW5jdGlvbnMgc28gdGhlIElQTUkNCiAgICBibG9iIGhhbmRs
ZXIgZG9lcyBub3QgZ2VuZXJhdGUgbWV0cmljcyBidXQgcmVhZHMgbWV0cmljcyBmcm9tIHRoZQ0K
ICAgIGRhZW1vbiBpbiBwaG9zcGhvci1oZWFsdGgtbW9uaXRvciB2aWEgREJ1cy4gSW4gb3RoZXIg
d29yZHMsIHRoZSAibW9ub2xpdGhpYyINCiAgICBoYW5kbGVyIGhhcyBub3cgYmVjb21lIGEgdGhp
biBsYXllci4gT24gdGhlIG90aGVyIGhhbmQsDQogICAgcGhvc3Bob3ItaGVhbHRoLW1vbml0b3Ig
d2lsbCBoYXZlIHRvIGJlIHNpZ25pZmljYW50bHkgbW9kaWZpZWQgdG8NCiAgICBnZW5lcmF0ZSB0
aGUgbWV0cmljcyB0aGF0IGFyZSBpbiBhIGRpZmZlcmVudCBmb3JtYXQgZnJvbSB3aGF0IGl0J3MN
CiAgICBnZW5lcmF0aW5nIHJpZ2h0IG5vdywgYW5kIFZpamF5IGFuZCBJIGFyZSB3b3JraW5nIG9u
IHRoYXQuIEkgaGFkIGNyZWF0ZSBhIGNoYWluDQogICAgb2YgY2hhbmdlcyBodHRwczovL2dlcnJp
dC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9waG9zcGhvci1oZWFsdGgtbW9uaXRvci8r
LzM3NjU5IA0KICAgIHRvIGlsbHVzdHJhdGUgd2hhdCBJIGludGVuZCB0byBkby4NCiAgICBBcyBh
IHJlc3VsdCwgdGhlcmUgY29tZXMgdGhlIHF1ZXN0aW9uIG9mIHdoZXJlIHRoZSBJUE1JIGJsb2Ig
aGFuZGxlcg0KICAgIHNob3VsZCBsaXZlLCBhbmQgaXQgYXBwZWFycyBJIGhhdmUgdGhlIGZvbGxv
d2luZyBjaG9pY2VzOg0KICAgIDEuIGluIHBob3NwaG9yLWhlYWx0aC1tb25pdG9yLCBvcg0KICAg
IDIuIHNvbWUgY2VudHJhbGl6ZWQgbG9jYXRpb24sIGFsb25nIHdpdGggbWFueSBvdGhlciBJUE1J
IGJsb2IgaGFuZGxlcnMsIG9yDQogICAgMy4gYXMgYSBzZXBhcmF0ZSwgbmV3IHJlcG9zaXRvcnks
IG9yDQogICAgNC4gc29tZXRoaW5nIGVsc2U/DQoNCiAgICBJIGFtIGZhY2luZyBhIGNvbmZ1c2lu
ZyBzaXR1YXRpb24gYXMgdG8gd2hlcmUgSSBzaG91bGQgcHV0IHRoZSBJUE1JDQogICAgYmxvYiBo
YW5kbGVyLCBkdWUgdG8gY29uZmxpY3Rpbmcgb3BpbmlvbnM6DQogICAgMS4gVGhlIG1haW50YWlu
ZXJzIG9mIHBob3NwaG9yLWlwbWktYmxvYnMgdG9sZCBtZSBpdCdzIG5vdCBkZXNpcmFibGUNCiAg
ICB0byBwdXQgYWxsIElQTUkgYmxvYiBoYW5kbGVycyBpbnRvIHRoZSBzYW1lIHBsYWNlLg0KICAg
IDIuIEJ5IHJlYWRpbmcgdGhpcyBlbWFpbCB0aHJlYWQsIEkgaGFkIHRoZSBpbXByZXNzaW9uIHRo
YXQgaXQncyBub3QgYQ0KICAgIGdvb2QgaWRlYSB0byBjcmVhdGUgdG9vIG1hbnkgcmVwb3NpdG9y
aWVzIGVpdGhlci4NCiAgICAzLiBCZWNhdXNlIG9mICMxIGFuZCAjMiwgSSBmZWx0IHdlIHNob3Vs
ZCBwdXQgdGhlIElQTUkgYmxvYiBoYW5kbGVyDQogICAgaW50byBwaG9zcGhvci1oZWFsdGgtbW9u
aXRvciBpdHNlbGYsIGp1c3QgbGlrZSBwaG9zcGhvci1waWQtY29udHJvbA0KICAgIGRvZXMuDQog
ICAgNC4gSW4gdGhlIGxhc3QgcmVwbHkgZnJvbSBQYXRyaWNrIGl0IHNvdW5kcyBpdCdzIGEgYmFk
IGlkZWEgdG8gcHV0IHRoZQ0KICAgIElQTUkgYmxvYiBoYW5kbGVyIGludG8gcGhvc3Bob3ItaGVh
bHRoLW1vbml0b3IgYmVjYXVzZSBvZiBJUE1JIGRldGFpbHMNCiAgICBsZWFraW5nIG91dCBpbnRv
IG5vbi1JUE1JIHJlcG9zaXRvcmllcy4NCiAgICA1LiBWaWpheSBzZWVtZWQgdG8gcHJlZmVyIHRv
IGhhdmUgYWxsIElQTUkgYmxvYiBoYW5kbGVycyBpbiBvbmUgcGxhY2UNCiAgICBiYXNlZCBvbiBv
dXIgZGlzY3Vzc2lvbiBvbiBJUkMuIEhvd2V2ZXIsIGFjY29yZGluZyB0byAjMSB0aGlzIGlzIGdv
aW5nDQogICAgdG8gZmFjZSBwdXNoYmFjay4gQXMgc3VjaCwgSSBjcmVhdGVkIGFsbCBteSBjaGFu
Z2VzIGluDQogICAgcGhvc3Bob3ItaGVhbHRoLW1vbml0b3IgZm9yIHJldmlldyBhbmQgZm9yIHNo
b3dpbmcgbXkgaW50ZW50IG9uIGhvdw0KICAgIHRoZSBJUE1JIGltcGxlbWVudGF0aW9uIGlzIGRv
bmUuDQogICAgNi4gQmVjYXVzZSBvZiAjNCBhbmQgIzUsIGl0IHNvdW5kcyBsaWtlIEkgY2FuJ3Qg
cHV0IHRoZSBJUE1JIGJsb2IgaGFuZGxlciBpbnRvDQogICAgcGhvc3Bob3ItaGVhbHRoLW1vbml0
b3IgZWl0aGVyLg0KICAgIFNvIG5vdywgdGhlcmUgaXMgbm8gcGxhY2UgSSBjYW4gcGxhY2UgdGhp
cyBoYW5kbGVyLCBhbmQgSSBhbSBub3cgYXQgYSBkZWFkIGVuZC4NCg0KSSBzdGlsbCBmZWVsIHRo
YXQgdGhpcyBzaG91bGQgZ28gdG8gcGhvc3Bob3ItaXBtaS1ibG9icywgeW91IGNhbiBjcmVhdGUg
YSBzZXBhcmF0ZQ0KZGlyZWN0b3J5IChoYW5kbGVyKSB1bmRlciB0aGUgc2FtZSByZXBvIGFuZCBp
dCBjYW4gYmVjb21lIGhvbWUgZm9yIGFsbCB0aGUNCmZ1dHVyZXMgYmxvYiBoYW5kbGVyIGFzIHRo
ZXNlIGFyZSBnb2luZyB0byBpbnRlcmFjdCB3aXRoIGlwbWkgYmxvYnMgYW55d2F5Lg0KDQogICAg
SSBuZWVkIHRvIGZpbmQgYSB3YXkgb3V0IGFuZCB3b3VsZCBncmVhdGx5IGFwcHJlY2lhdGUgaXQg
aWYgd2UgY2FuDQogICAgcmVhY2ggYSBjb25zZW5zdXMgaGVyZSBzbyB0aGF0IEJNQyBoZWFsdGgg
bW9uaXRvcmluZyBjYW4gbW92ZSBmb3J3YXJkLg0KDQogICAgVGhhbmtzIQ0KDQo=
