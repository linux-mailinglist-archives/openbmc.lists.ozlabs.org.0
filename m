Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6111E5B61
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 11:03:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XhYw5Rl6zDqNg
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 19:03:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-hk2-obe.outbound.protection.outlook.com
 (client-ip=2a01:111:f400:febc::61b;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=kwliu@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=bpdk1Vpz; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XhYH3X5ZzDqNg
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 19:02:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXheKLElfJ6xn/F8p0/KlRoPjHo3i6rZBWrM9KNxxJY9pNDjDApGKjiANNPhkvcv6JjbcacDM/OX6qlFRxywt/OdhxLluip3lpf7XTx6ZuzVQ2vBThGSIEToKe8RM/VM4ASR9HNi602xmJ8QlCtWL2Ojk+SGalyYTAQ/ZLojsPkxjo4j3qeoAdt1WHpXbwBcU8f4isXHHdGnX8MxgC7ruf/M/DLzQykTmwVi4YWjlHSJNnvwlJzba22FQ3l8P5HOghvSmn/qUJ9F56w4cfmtJms0pNHMXZHRlO98iPMmPWezmIaaBID/s+wGYP4VFOqYY1WGWiKQyIC8fLa+yZyQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfTUhHkIcB0TJb7VhoJzsoegbujfYdVxO3nmZPepkiM=;
 b=ZEqYQHOCizrjpTaDNeqhkw6MwtSGKQnKGomwJLgh7fMbHlOlLToWWBQYBbjNJN7/aO9ATzF2yWltwRall3m6zEZLdjTbMfbRi/wJcfIwi6pLq57eP7Ew9aVUW5CzNuL93Z4jDyP/vUD5uvdE6EaRiiPtjJwK2Ad6Wy54ozU9a9UdsZ5lX4O3EE8fbG63L6jIyQNhQBdbkV4AEfrAw7PGt+M82rpu9+dBccIKOCy7qRqmA6c+C2Di6ypU4SZw0i/zKGTsRznlPFGqQYm26sD3KqZUUt4wC2K5nYWIqfafAvw2pFcyeUL210BRmEtX45JJXIVHsDQrAKHoC6h3mIqwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfTUhHkIcB0TJb7VhoJzsoegbujfYdVxO3nmZPepkiM=;
 b=bpdk1VpzfQqX1KznCCngd5o6MJP+l2IEEJxtieiGxMoQt0n8EJiENmqcQiG87Ulh60d6Ch7C555tc3iFzT/uvHP1rMjcAU3bG4bw1rRftSJO8bP7N0uEgawwCQ+mdVX4dZcvMKonQpz3WcfDF6ueLqcE3/OK+7umXfaXKjcbKu8=
Received: from HK2PR03MB4371.apcprd03.prod.outlook.com (2603:1096:202:1d::20)
 by HK2PR03MB4258.apcprd03.prod.outlook.com (2603:1096:202:29::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.7; Thu, 28 May
 2020 09:02:34 +0000
Received: from HK2PR03MB4371.apcprd03.prod.outlook.com
 ([fe80::f90e:35fa:737e:d13c]) by HK2PR03MB4371.apcprd03.prod.outlook.com
 ([fe80::f90e:35fa:737e:d13c%7]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 09:02:34 +0000
From: CS20 KWLiu <KWLIU@nuvoton.com>
To: =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>, "Wang, Kuiying"
 <kuiying.wang@intel.com>
Subject: RE: [External] RE: Adding usb-ctrl from intel-bmc into phosphor-misc
Thread-Topic: [External] RE: Adding usb-ctrl from intel-bmc into phosphor-misc
Thread-Index: AdY0AiK+WA8N7ixgSz2EVdAfHSxXfQAB+1wAAAXymgAAIHr/gAAKNWCw
Date: Thu, 28 May 2020 09:02:34 +0000
Message-ID: <HK2PR03MB4371B6DB3601AB751B32F9F0AE8E0@HK2PR03MB4371.apcprd03.prod.outlook.com>
References: <2ea02fe94323438fbc4cec4e62c242c4@intel.com>
 <CAGm54UEYbzqONDMDweanD_T9fsuWXQ9czFB0=1GjsmGANJ1wKA@mail.gmail.com>
 <c3ab98b048824b50859560d747d07f84@intel.com>
 <CAGm54UG4peETHnXjaGoAV2vCxxiKOKfTbhHmZUiinjMPf6wHGQ@mail.gmail.com>
In-Reply-To: <CAGm54UG4peETHnXjaGoAV2vCxxiKOKfTbhHmZUiinjMPf6wHGQ@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none header.from=nuvoton.com;
x-originating-ip: [2401:e180:88a0:f0f5:39f3:9062:d843:a36d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a41547fd-10ae-41ca-72c9-08d802e5dc88
x-ms-traffictypediagnostic: HK2PR03MB4258:
x-microsoft-antispam-prvs: <HK2PR03MB42586CB6B918B5B332ACC63AAE8E0@HK2PR03MB4258.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:565;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yC+0dnAZ9OZGs4nCY3wSGlRaNlOhYSXMVc/VWGz7hLTwVqqcXTtCUPSYNmQIy8Y/MUndfdhcFgeWlQejfCPHFSyvil6axQ6UihgRdKaICd/UIMGsOU25TJn57ixE2C9S+afDLOsNbeXneeeWFc6bsSxVwO7lyaWSvvoHAb5AQClXdEiIyvfyzjqDuEufktpuGuatvBKmOm2vxEclxCY8b5Qz0eb6SMUn+X5GgleNvZPGDUuQzEtK/o9H0EG4s/RzpM7VqrZp2HfH5akXqg/WsG7dunG3qu/7n4bxfuOmjNPn0hlDIxOmYpcsV86LL1aF/V9ZsIA0zXPFgQMAleXW2VCcYnhqiQrlIoeeR74r/1SCU+viPfyOXGIV/CWWEK9m7xnL1vcTARjkaEReUxvqBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR03MB4371.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(346002)(39850400004)(396003)(136003)(71200400001)(478600001)(110136005)(66476007)(66556008)(66446008)(76116006)(52536014)(66946007)(5660300002)(64756008)(6506007)(8676002)(53546011)(186003)(83380400001)(7696005)(33656002)(4326008)(966005)(86362001)(2906002)(55016002)(8936002)(9686003)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 0QBHmaHkJ4QCTBFxABF4CVEXUouiRWu163MzfnnNyehNMD2zpLfNhXrx6kAPSwq3FtZgEiX5N733qHyvu+yKNcy0MfDAdUnMFwu6gNGeKQbgC42lmIIcBA9Vv8feyjYUlEDLxGO/qzAsfMjwjOUF7MR0sPYPNNZlmivLt3p7RGHtkUs6kfsu+kwVMIo6WOtiN/4l8a8L7QTAEnNZwWfXJkhxI0miuZPhpHJMRU7h+cWLr/1V/5oxMayDt/oSjWuJ1xtdMm0ql/QZ7st6xsMXPRvSopB+9XcrP3G+Nxua2IG6+oyplLYAc8K9IcnauJ4Zxiufr3BglVE8KRXMtWIFQ0ktIBW8QcL1Gf/4uqL2sEZixLc/6fJxPuFNth03t21Er/qs4EOVepkFkRGHr+AW3FeohmSedN39METPqMC80mlNFIgcKDQlWi2D9ircAbR0K/97Ici0fGG8ZvL37ld6vYETwuDh14oKnNsY+A8hnXYu7DUYQernaLu4wD+F3Qlo0QIbMtdU9biD5R/tTl33IOldh+fN/wYSDs2rdqVHA3mAbr4STyJpMvwHjck0ayRg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41547fd-10ae-41ca-72c9-08d802e5dc88
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 09:02:34.2152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WfynqGg/W2l+55Fp/9m+1mQsfw8CeV5q7yiJXnlkPraUr1MJgl8Ce5ZkMTr71Vyc4FhDZpa0iEbITAvagKIFag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4258
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

SGksDQoNCkZvciBpbi1iYW5kIHVzYiBuZXR3b3JrIGNvbW11bmljYXRpb24sIEkgcmVjb21tZW5k
IHRoYXQgeW91IGNhbiB1c2Ugcm5kaXMuDQpUaGVyZSBpcyBhIHVzYiBuZXR3b3JrIHJlY2lwZSBs
b2NhdGVzIGluIHF1YW50YSdzIGxheWVyLCB5b3UgY2FuIHRha2UgaXQgYXMgcmVmZXJlbmNlLg0K
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy90cmVlL21hc3Rlci9tZXRhLXF1YW50
YS9tZXRhLWNvbW1vbi9uZXR3b3JrDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1j
L2Jsb2IvbWFzdGVyL21ldGEtcXVhbnRhL21ldGEtZ3NqL3JlY2lwZXMta2VybmVsL2xpbnV4L2xp
bnV4LW51dm90b24vZ3NqLmNmZyNMNDANCg0KVGhhbmtzLA0KS1cNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMra3dsaXU9bnV2b3Rvbi5j
b21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIOmDgembtw0KU2VudDogVGh1cnNkYXks
IE1heSAyOCwgMjAyMCAxMTo1NSBBTQ0KVG86IFdhbmcsIEt1aXlpbmcgPGt1aXlpbmcud2FuZ0Bp
bnRlbC5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogW0V4
dGVybmFsXSBSRTogQWRkaW5nIHVzYi1jdHJsIGZyb20gaW50ZWwtYm1jIGludG8gcGhvc3Bob3It
bWlzYw0KDQpPbiBXZWQsIE1heSAyNywgMjAyMCBhdCA4OjI1IFBNIFdhbmcsIEt1aXlpbmcgPGt1
aXlpbmcud2FuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPg0KPiBPaywgaXQgaXMgYSB3b3JraW5nIHdh
eSwgd2UgY291bGQgZGlzY3VzcyBtb3JlIGRldGFpbCBvbiB5b3VyIHBhdGNoIHJldmlldy4NCj4N
Cg0KU3VyZS4NClRoZSBwYXRjaGVzIGFyZSBwdXNoZWQgdG8gYmVsb3cgc2VyaWVzOg0KaHR0cHM6
Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19nZXJyaXQub3Bl
bmJtYy0yRHByb2plY3QueHl6X2Nfb3BlbmJtY19waG9zcGhvci0yRG1pc2NfLTJCXzMyODc3JmQ9
RHdJQmFRJmM9dWU4bU84emdDNFZaNHFfYU5WS3Q4RzlNQzAxVUZEbWlzdk1SMWstRW9ETSZyPTdn
MkQxWERjMUVUM0NuWTF5U25hV1FYUHhQeGZwTHd3MU1pRGJMVzR2OFEmbT1Od2tTU3ZYREwtVkxO
ZDd5UDdoRXBrbzh2X2J6SmZsMnF6WlVtV1Rtd2dzJnM9a1dpTW1YOTVqS3hYd0tjcHhrbkpjSWxa
bHN2eEUxMnNHVk5vdzBHUHhxZyZlPQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQogVGhlIHByaXZpbGVnZWQgY29uZmlk
ZW50aWFsIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGVtYWlsIGlzIGludGVuZGVkIGZv
ciB1c2Ugb25seSBieSB0aGUgYWRkcmVzc2VlcyBhcyBpbmRpY2F0ZWQgYnkgdGhlIG9yaWdpbmFs
IHNlbmRlciBvZiB0aGlzIGVtYWlsLiBJZiB5b3UgYXJlIG5vdCB0aGUgYWRkcmVzc2VlIGluZGlj
YXRlZCBpbiB0aGlzIGVtYWlsIG9yIGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJ5IG9m
IHRoZSBlbWFpbCB0byBzdWNoIGEgcGVyc29uLCBwbGVhc2Uga2luZGx5IHJlcGx5IHRvIHRoZSBz
ZW5kZXIgaW5kaWNhdGluZyB0aGlzIGZhY3QgYW5kIGRlbGV0ZSBhbGwgY29waWVzIG9mIGl0IGZy
b20geW91ciBjb21wdXRlciBhbmQgbmV0d29yayBzZXJ2ZXIgaW1tZWRpYXRlbHkuIFlvdXIgY29v
cGVyYXRpb24gaXMgaGlnaGx5IGFwcHJlY2lhdGVkLiBJdCBpcyBhZHZpc2VkIHRoYXQgYW55IHVu
YXV0aG9yaXplZCB1c2Ugb2YgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIG9mIE51dm90b24gaXMg
c3RyaWN0bHkgcHJvaGliaXRlZDsgYW5kIGFueSBpbmZvcm1hdGlvbiBpbiB0aGlzIGVtYWlsIGly
cmVsZXZhbnQgdG8gdGhlIG9mZmljaWFsIGJ1c2luZXNzIG9mIE51dm90b24gc2hhbGwgYmUgZGVl
bWVkIGFzIG5laXRoZXIgZ2l2ZW4gbm9yIGVuZG9yc2VkIGJ5IE51dm90b24uDQo=
