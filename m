Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 163471ED76C
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 22:32:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cgZF28lBzDqdr
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 06:32:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0423c1b355=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 3271 seconds by postgrey-1.36 at bilbo;
 Thu, 04 Jun 2020 06:31:36 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cgYN2X3hzDqPg
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 06:31:33 +1000 (AEST)
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 053JUsCd032044; Wed, 3 Jun 2020 19:36:57 GMT
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
 by mx0b-002e3701.pphosted.com with ESMTP id 31ehr9060g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 19:36:57 +0000
Received: from G2W6311.americas.hpqcorp.net (g2w6311.austin.hp.com
 [16.197.64.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5008.houston.hpe.com (Postfix) with ESMTPS id D0D8C62;
 Wed,  3 Jun 2020 19:36:56 +0000 (UTC)
Received: from G9W8675.americas.hpqcorp.net (16.220.49.22) by
 G2W6311.americas.hpqcorp.net (16.197.64.53) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 3 Jun 2020 19:36:56 +0000
Received: from G4W10205.americas.hpqcorp.net (2002:10cf:520f::10cf:520f) by
 G9W8675.americas.hpqcorp.net (2002:10dc:3116::10dc:3116) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 3 Jun 2020 19:36:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.241.52.13) by
 G4W10205.americas.hpqcorp.net (16.207.82.15) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 3 Jun 2020 19:36:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fph+L7tKqI1Fw/yGbX78xVYQRx9rp3Fv8usGIU40Hvl3KpZSZmKSh+wNk6tHqWLAp7r+RNmE2zroSQGDbllg6ZRcMLu/GImpL6bU+Rn9o92c6DopgVqNI2qERbhPdkw91+nmvxiismerYXe4AFXuUTfewHy643rbWBWIUUbM48fNY5OmWXZYsTBPsLq3Np4deYB+Gl56pL85j8PiIWjtcId2q9dsxktMnMZcg+l4mSCiL5zcVsPnDNwyFEvbLLPeZF6nzv89tP4ELNSA0tcX6htBvTfsQ8K6TOUNgENMhQTXyWznsMd5TbPsrutIQVzRO3KKGYbtMbd84DYcRFgFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRSU5FEFfVoXwpzbsH2NAgdkmkOsrx9urQumHluWsSA=;
 b=nvl3mj9ZR9P3c4PuZTRrHtuVuAmZcRJMGF9pIHCvgn/00mx6+L/DUdaTk2wQuanSnDPVUbxhTlZhykAmgEdFmmjRRuFkgHupn08r049xm8BZevjqyQSMFfDdcdVc5lqj0rbqu7T5FIDQgrqpGIxiGH1FJ28adriAshmkle/ZCWJMfjjnUB23L5qfUfo7ShsoM73S9MXHOcYcrX3ptmalQgbm7yYeQhHACAg3wSrQQm9OAPBhK78dKymytpn5d0imBIWHIsxf3ngkuaYHpm4RD284FFribVhre5/CzNAt+bVUBqETBH/Bvy5c8TzLhbiTmn+/bKK1jhJA1n3+Xy1oJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7611::7) by DF4PR8401MB0905.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Wed, 3 Jun
 2020 19:36:53 +0000
Received: from DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::c9b0:9343:ffef:e6a8]) by DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::c9b0:9343:ffef:e6a8%10]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 19:36:53 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Hello to OpenBMC Team
Thread-Topic: Hello to OpenBMC Team
Thread-Index: AdY5H1rW6HuPnkiDQLa/gQ+ggEN4bwAvS7cAAABBDeA=
Date: Wed, 3 Jun 2020 19:36:53 +0000
Message-ID: <DF4PR8401MB1145F2F1E0F66E7DA633D85F8F880@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB11451AC66E463D2EC408D2CA8F8B0@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
 <511713b5b1f66805a79ffadde5ba09a70db4c6fc.camel@fuzziesquirrel.com>
In-Reply-To: <511713b5b1f66805a79ffadde5ba09a70db4c6fc.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none; fuzziesquirrel.com; dmarc=none action=none header.from=hpe.com; 
x-originating-ip: [73.76.19.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e288e6f0-a5cd-43b2-cf88-08d807f577d4
x-ms-traffictypediagnostic: DF4PR8401MB0905:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DF4PR8401MB0905277DC1FDBAC31821B14B8F880@DF4PR8401MB0905.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Uhy6iSBodjoUx/3R1LuqcCAIqBfO7V3KU3lleD0N8khPR+Wwuflb36fG0s9odmBnOiDlwGkb+ZrkaOS9Uslty2Z7sZDWRWMmgSbulUlZOrw31lMy2sS6UJZnhkEPVgzxrxAMIMTpFZz11b7+hFqhhSI0qUXagz/hjxnUFSC3HmwNw2OZyl50mBDwglTXsKwbdlUFE0N5Kciru3v6HaqcNGGL7m+cNMOpSVnT2QrjoSfvD373jooVmXUZOqqWzwCowEl2nmIDPAZNXSS8yX0wvNNNNuB6S43AeeEzIy9GfNBS3IOkibz8/BO9mIx24ZbTdklVqME3kx0iPDQ9FcdJcvBOETqA3rUWJbo9RxZp39sBwVprn3PC0Lkj6TKR9LJkZ5gS45oVBvXGcsOYvK1xA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(136003)(39860400002)(346002)(366004)(376002)(66556008)(55016002)(86362001)(2906002)(6506007)(26005)(53546011)(9686003)(478600001)(4326008)(52536014)(33656002)(66446008)(5660300002)(54906003)(3480700007)(71200400001)(186003)(316002)(76116006)(110136005)(966005)(66476007)(7696005)(64756008)(8676002)(66946007)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: rIPEYz4U09JdT3AIkLJp2aQU2avu6IUBpi/klwi9SU+klJPfjmZ+MN+uQkJ0YSHB0qECS1UQ+Vjdc5cX7uUAqu77ZctVVI7Nktl2d9iCUtxPgmC1rljZjuQNUq8BBQ/bfD6wNvIMDbZ0FMbjP0OfFPCuNWbGSnx2j48mkNcbNErPxfJV8Ab71/jChg6KowbIwWgxz4vx6oMJhW6tK4/d6JH/JZNhIy2ohq/84DmEtKpbSKd71GOeaMcZpWVuCNaDHiOK5MB+TVaY0qV4fWbHkkhNXmTzsHCh4Yrb7hSBYQxilrCY0RFJaZIKiJOD/H76BS/bOSO7LIBuUu2mpODMxRhxL5cEw12361EiVYgkeHnJAbTAjkK+iFCJso+N85bek3etN7vpMWgi2lPsmd1YDnlM49EICLQ04KmzDmiP5NrnW01kYJ4SkxH4yW5dOIxeNltVmVrAy5VC6mlSZGWXujoE7Bly5JNZuZo4QW2fNKg=
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-Network-Message-Id: e288e6f0-a5cd-43b2-cf88-08d807f577d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 19:36:53.0363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x8n+M3Vmni4Sln8uyg7odCITZK7kM6ZIgydCaak2hHEs2RTPFv49QnW0/l1g7cnEKuUaKtxhB2xGu4L3bNcljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0905
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 cotscore=-2147483648
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030149
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
Cc: "Shaffer, Scott" <scott.shaffer@hpe.com>, "Verdun,
 Jean-Marie" <jean-marie.verdun@hpe.com>, "Cisneros,
 Jorge \(George\)" <jorge.cisneros@hpe.com>, "Rodgers,
 Renee" <renee.rodgers@hpe.com>, "Chung, 
 John \(TWN iLO\)" <john.chung@hpe.com>, "Chen, Gilbert" <gilbert.chen@hpe.com>,
 "Newman, Edward \(iLO Firmware\)" <edward.newman@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQnJhZCwNCg0KT3VyIHRoaW5raW5nIGlzIHRvIHNldCB1cCBwdWJsaWMgZm9ya3MgImNsb3Nl
IHRvIGhvbWUiIHRoYXQgd2UgY2FuIHdvcmsgcmFwaWRseSBpbiBhbmQgc2ltdWx0YW5lb3VzbHkg
d29yayB0byB1cHN0cmVhbSBwYXRjaGVzIGZvciBVLWJvb3QsIExpbnV4LCBhbmQgT3BlbkJNQyB0
byB0aGUgbWFpbiByZXBvcy4gIFRoZSBmb3JrcyBhcmUgY3VycmVudGx5IHVubW9kaWZpZWQgYnV0
IHRoYXQgd2lsbCBjaGFuZ2Ugc29vbiBhcyB3ZSBzdGFydCBtb3Zpbmcgb3VyIG1vZHMgb3V0IG9m
IG91ciBwcml2YXRlIHJlcG9zLg0KDQpJIHNob3VsZCBiZSBjbGVhciB0aGF0IHRoZSBETDM2MHMg
d2UgYXJlIHVzaW5nIGFyZSBtb2RpZmllZCBmcm9tIHRoZSBvZmYtdGhlLXNlbGYgSFBFIEdlbjEw
IHNlcnZlcnMgYmVjYXVzZSBvZiBvdXIgc2lsaWNvbiByb290IG9mIHRydXN0IHRlY2hub2xvZ3ku
ICBUaGUgQ0kgc3lzdGVtIHRoYXQgSmVhbi1NYXJpZSBoYXMgc2V0IHVwIGlzIG9uZSBvZiB0aGVz
ZSBtb2RpZmllZCBzeXN0ZW1zLg0KDQpUaGFua3MsDQoNCk1pa2UNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IEJyYWQgQmlzaG9wIFttYWlsdG86YnJhZGxleWJAZnV6emllc3F1
aXJyZWwuY29tXSANClNlbnQ6IFdlZG5lc2RheSwgSnVuZSAzLCAyMDIwIDI6MjQgUE0NClRvOiBH
YXJyZXR0LCBNaWtlIChIUEUgU2VydmVyIEZpcm13YXJlKSA8bWlrZS5nYXJyZXR0QGhwZS5jb20+
OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCkNjOiBTaGFmZmVyLCBTY290dCA8c2NvdHQuc2hh
ZmZlckBocGUuY29tPjsgVmVyZHVuLCBKZWFuLU1hcmllIDxqZWFuLW1hcmllLnZlcmR1bkBocGUu
Y29tPjsgQ2lzbmVyb3MsIEpvcmdlIChHZW9yZ2UpIDxqb3JnZS5jaXNuZXJvc0BocGUuY29tPjsg
Um9kZ2VycywgUmVuZWUgPHJlbmVlLnJvZGdlcnNAaHBlLmNvbT47IENodW5nLCBKb2huIChUV04g
aUxPKSA8am9obi5jaHVuZ0BocGUuY29tPjsgQ2hlbiwgR2lsYmVydCA8Z2lsYmVydC5jaGVuQGhw
ZS5jb20+OyBOZXdtYW4sIEVkd2FyZCAoaUxPIEZpcm13YXJlKSA8ZWR3YXJkLm5ld21hbkBocGUu
Y29tPg0KU3ViamVjdDogUmU6IEhlbGxvIHRvIE9wZW5CTUMgVGVhbQ0KDQpPbiBUdWUsIDIwMjAt
MDYtMDIgYXQgMjA6NTYgKzAwMDAsIEdhcnJldHQsIE1pa2UgKEhQRSBTZXJ2ZXIgRmlybXdhcmUp
DQp3cm90ZToNCj4gSGVsbG8gT3BlbkJNQyB0ZWFtLA0KPiANCj4gTXkgbmFtZSBpcyBNaWtlIEdh
cnJldHQgYW5kIEkgd29yayB3aXRoIGEgdGVhbSBhdCBIZXdsZXR0IFBhY2thcmQNCg0KV2VsY29t
ZSBNaWtlIGFuZCBIUEUuDQoNCg0KPiBFbnRlcnByaXNlIGNyZWF0aW5nIGEgcG9ydCBvZiBPcGVu
Qk1DIG9uIG91ciBzZXJ2ZXIgaGFyZHdhcmUuICBXZSBoYXZlIA0KPiBqdXN0IHNpZ25lZCB0aGUg
Q0NMQSAoYXR0YWNoZWQpIGFuZCB1cGxvYWRlZCBpdC4gIFdlIGxvb2sgZm9yd2FyZCB0byANCj4g
d29ya2luZyB3aXRoIHRoZSBPcGVuQk1DIGNvbW11bml0eS4NCg0KTGlrZXdpc2UhDQoNCj4gDQo+
IFRvIGludHJvZHVjZSBteXNlbGYsIEkgYW0gYSBmaXJtd2FyZSBhcmNoaXRlY3QgaW4gSFBFJ3Mg
Y29tcHV0ZSBncm91cCANCj4gd2l0aCBhIGJhY2tncm91bmQgaW4gQklPUyBhbmQgQk1DIGZpcm13
YXJlLiAgVGhlcmUgd2lsbCBiZSBhIGZldyBvdGhlciANCj4gZm9sa3Mgb24gb3VyIHRlYW0gd29y
a2luZyB3aXRoIG1lLCBhbGwgd2l0aCBCTUMgZGV2ZWxvcG1lbnQgDQo+IGV4cGVyaWVuY2UuDQo+
IA0KPiBUaGUgdGVhbSBoYXMgY3JlYXRlZCBhIHBvcnQgb2YgT3BlbkJNQyBmb3Igb3VyIERMMzYw
IDItc29ja2V0IDFVIHJhY2sgDQo+IHNlcnZlciB0aGF0IHJ1bnMgaW4gcGxhY2Ugb2Ygb3VyIGlM
TyA1IGZpcm13YXJlLg0KDQpJcyB0aGlzIGh0dHBzOi8vZ2l0aHViLmNvbS9IZXdsZXR0UGFja2Fy
ZC9vcGVuYm1jPyAgVGhhbmtzIGZvciBsZWF2aW5nIHRoZSBhdHRyaWJ1dGlvbiB0byB0aGUgdXBz
dHJlYW0gcHJvamVjdCAoImZvcmtlZCBmcm9tIG9wZW5ibWMvb3BlbmJtYyIpLg0KDQo+IFRoaXMg
aGFzIGJlZW4gc2hvd24gYXMgYSBwcm9vZiBvZiBjb25jZXB0IGF0IGEgZmV3IHZlbnVlcyBpbmNs
dWRpbmcgDQo+IG1vc3QgcmVjZW50bHkgdGhlIE9DUCBWaXJ0dWFsIFN1bW1pdCBhIGNvdXBsZSBv
ZiB3ZWVrcyBhZ28uICBKZWFuLSANCj4gTWFyaWUgVmVyZHVuIGhhcyB1c2VkIHRoaXMgcHJvb2Yg
b2YgY29uY2VwdCBhcyB0aGUgdW5kZXJseWluZyBoYXJkd2FyZSANCj4gZm9yIGFuIE9wZW4gU291
cmNlIEZpcm13YXJlIENJIHN5c3RlbS4gIFdlIGhvcGUgdG8gdGhlIHVwc3RyZWFtIHRoZSANCj4g
T3BlbkJNQyB3b3JrIHNvb24uDQoNCkF3ZXNvbWUhDQoNCj4gDQo+IEkgYmVsaWV2ZSB0aGUgbmV4
dCByZXF1ZXN0IGlzIHRvIGFzayBmb3IgdGVhbSBtZW1iZXJzIHRvIGJlIGFkZGVkIHRvIA0KPiB0
aGUgZ2Vycml0IHN5c3RlbT8NCg0KQWxsIHlvdSBuZWVkIHRvIGxvZyBpbiB0byBHZXJyaXQgYW5k
IHN1Ym1pdCBjb2RlIGlzIGEgZ2l0aHViIGFjY291bnQuDQoNClRvIGhhdmUgeW91ciBjb2RlIGF1
dG9tYXRpY2FsbHkgdGVzdGVkIGJ5IHRoZSBDSSBzeXN0ZW0sIHlvdSBkbyBuZWVkIHRvIGJlIG9u
IGFuIEFDTCAtIEknbGwgc2V0IHRoYXQgdXAgYXMgc29vbiBhcyB5b3UgbG9nIGludG8gZ2Vycml0
Lg0KDQp0aHggLSBicmFkDQo=
