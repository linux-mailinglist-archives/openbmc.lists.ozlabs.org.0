Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA81BECF2
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 02:23:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CGMY0zHTzDr9B
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 10:23:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=2a01:111:f400:7e8a::722;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=fegQgE8L; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20722.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::722])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CGLv2GMDzDr8R
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 10:23:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qep/hzuhnKYNVT9Y7l+XQa+UQc1aosL58Co3zOaZZ837GqWrvJk/icUJsmlKWqabW1Jtqvn97CU2CfRvgcEXkzUuygp/GkeA1Jywx1bJz95VlRK2Z+toxRxD30OFXlOYma3m8BCcPtMZU7b4beqn5CQRFA1Sg+JKwztqmiUlIDGs8U4vg0N8KBx8lZBdQ7oN1dRDNgl965NcrDkI+O2FXpGwR8Y3Knu2QkJwiFM9usF6VlTJGLvmenx1wzDf3ixg7YErRZ0QIzRl/M2SiIHVEWTRitXCvqb7tEOl/MLThIX5Lt0zhaMqp7xl2s2LoxqoefuVsjkZQb42qg6vkB56Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjV9S7fatlRsyiOPypg8TL/qre5sz3RaYCNK3I6Ooc4=;
 b=jvYM5Fzp9nc/Sk7+r3dB/PUc+FBFB2fTJvjxnktQ8N5t4EeX00q/mZu0EzcanSD16rjCr7yT2i8kj584fO1OLUsUOWMrzqfjsxkQ8SmXbQwkzEHp5aCxdzFKGWTqzwZDOmn7DUaprjAo6u3qxoty9oY4oylXOhxDXK47qFiRHBLkdGGG0vkE+t60gSsdkarxJkhQ1O07LbizXQzxe0oCpvbMD6sLb+MPw8SOjFz48eiB5mOooND029S3zM/BQVpsxixljLRobIZpbM2/sZGcRxSFrevFMzcDm1+jfdYFO3R6J2kq3F262T52J8gaQVrX2Bh4BSDxo/TZ5MBReqzJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjV9S7fatlRsyiOPypg8TL/qre5sz3RaYCNK3I6Ooc4=;
 b=fegQgE8L/32qG1F2Zh3jtUsk6ic4apNYDw2r6zKXgPz0Oc4K9lac1CZjQRH2msVRKkaG6TBywwZGKqCT6waoDLtbm+qKuT/0IsZhPf7gXCl8n82gZyMkhuu67W17feDmU4RCW/JdvxUwT4mi7ThokNjg8HtIERNSMT+NzMPiKYw=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (2603:10b6:610:8e::7)
 by CH2PR21MB1510.namprd21.prod.outlook.com (2603:10b6:610:8e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.4; Thu, 30 Apr
 2020 00:23:11 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a%9]) with mapi id 15.20.2979.013; Thu, 30 Apr 2020
 00:23:11 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Nancy Yuen <yuenn@google.com>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Multiple BMCs in a system: IPMB? Redfish? MCTP?
Thread-Topic: Multiple BMCs in a system: IPMB? Redfish? MCTP?
Thread-Index: AQHWHoSXxEFUZLAQBke9FiFx2H7bIqiQzEFw
Date: Thu, 30 Apr 2020 00:23:11 +0000
Message-ID: <CH2PR21MB151047A95F646DD65268E902C8AA0@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
 <59A41CBD-05E4-4CE5-BFDB-19CA52FC8460@fb.com>
In-Reply-To: <59A41CBD-05E4-4CE5-BFDB-19CA52FC8460@fb.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fb.com; dkim=none (message not signed)
 header.d=none;fb.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [50.47.130.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 04c4bc0a-c9d0-49fb-2050-08d7ec9caa4b
x-ms-traffictypediagnostic: CH2PR21MB1510:
x-microsoft-antispam-prvs: <CH2PR21MB15100361C1F8E2D414767F90C8AA0@CH2PR21MB1510.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0389EDA07F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sV8s2Cz1JObwFs5ySzEaf+1uR1uD/XbpV+WXzWFlNAhEnMwp1u3sm41IkfKpkuQ1lHeqq2BrAg0R50wVwbXoe5ALPFfD1IfDAjc+Z+0Lz0P2bA1h2lIMvuJE8Nbq7V7CUXCnPGpcoTdQ0nP9xze676bfZrb+2Sg9QZNf8V22X3udebb4P5KC46WeJtsoWwUXNY6ElT9blz898ypG9iT7IvAYsxjyXyi8pYY9c3Q3giR+AFspA0CEJCUtYgUqII40gqwO4DNIpWB58pYU5UhviCj61J/Af0vh8sCZ/dfrUuQjeLaCFmGV+4K9xmLZJ2hFHT5P3O37kSk3uyLJKVm8gGWBnjutSdfANe4nbgRUG0uidVu+QKpVAUG/gT5sXrQYbYHlUTENspvI+OBJCXzJXC94/H5btMi+19bI3f0RfsF3E1mw4iCRKagu13XfyUzt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR21MB1510.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(10290500003)(5660300002)(316002)(186003)(8990500004)(478600001)(82960400001)(82950400001)(86362001)(71200400001)(9686003)(66556008)(33656002)(7696005)(110136005)(76116006)(6506007)(66946007)(55016002)(64756008)(8676002)(53546011)(66446008)(66476007)(26005)(2906002)(8936002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /oYJ8gskYm+Km5L2LA6PS4aisZDTT/NMkO9gMhm6TU/Cd3kwVWQ33i5oihxj3QB6df8zc+PiUCXzQjzpv04aaymO21epNO0ua15EykjRC1FSx8/EhEifeURGrq8Hk2Hd6Od4+txSk/VHHA+U9QVfh49EfhkB4mMJP33PQwjrx6ntyxctdcR3pmndfr2QE0EynDJhOKo4nQSvnB+7ApPVXSPvTJokbDaBSwFwojasGT+Pq9/cTU3E5mY6sZtrMFRWFZoQNADSyWsTcukFoInxvTArt2CMHMCoq1R2gfq8xEd4vNnE8m6sjbEtZZJVxMJJo6qrmoB7754fy9FdHhRpizR+KjW7A8Bxd04tFWRed7e85LHJYDet5UQPMbwSkp1YGUTHVpKRbQyVakm70B6E/+l4LdtodENqE1vUpHxZoxZ1S/fjFVIq4kf23672wfKdMtbVwMrpKntk01ES/M1fAyiZbrzWpItuyMZB+cnxlETl/N9eHMDGwHV7yPhr+GL4sGW6K8fWgd6RXu5IS6YK38owr+IDNuRQwezITPMm480D++bolXHjJ8PV2bp1vcMSmBj2k83I2MRi88HfziIf5MkMyz892snk3IpWd9AoaiDw1MuW3/8tLmGlU36i3qKOBbguD4b5YrqbvB+vNhRXlJ0H/Pjkq4RyMEwkWwcxf72UafPnsGpg1VybE4Gnf2wBWTVapYAsmbIMZoaYL5d9P6d9Cl6JfjqhflWNQdSTONdP1jTrI1CnASTRwJllvCMmiV2Lqu3fJufFRIbDThFFRMVUvd54sidXATfj/XbYTRI=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CH2PR21MB151047A95F646DD65268E902C8AA0CH2PR21MB1510namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c4bc0a-c9d0-49fb-2050-08d7ec9caa4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 00:23:11.1153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5F6qZn+5sbDuSYSuSeX0AmiBL0X0cHU+NNkRaan8ol7e6GIPcb1wjW3TYkmYYRFabxuLhPl6FaBG2+DWWzPXlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1510
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_CH2PR21MB151047A95F646DD65268E902C8AA0CH2PR21MB1510namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmVkZmlzaCBkZWZpbmVzIGNvbXB1dGVyIHN5c3RlbSB0byBiZSBtdWx0aXBsZSBjaGFzc2lzIG9y
IG11bHRpcGxlIGJsYWRlcyB3aXRoaW4gYSBjaGFzc2lzLiAgSXQgd291bGQgYmUgZ29vZCB0byBj
bGFyaWZ5IGlmIHlvdSBhcmUgcmVmZXJyaW5nIHRvIOKAnFN5c3RlbeKAnSBhczoNCg0KDQogICog
ICBNdWx0aXBsZSBjaGFzc2lzIHdpdGggdGhlaXIgb3duIEJNQ3MgKCBTdG9yYWdlLCBDb21wdXRl
LCBHUFUgZXRjICkNCiAgKiAgIE11bHRpcGxlIEJsYWRlcyB3aXRoIHRoZWlyIG93biBCTUMgd2l0
aGluIGEgY2hhc3Npcy4NCg0KTmVlcmFqDQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNl
cytuZWxhZGs9bWljcm9zb2Z0LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgVmlq
YXkgS2hlbWthDQpTZW50OiBXZWRuZXNkYXksIEFwcmlsIDI5LCAyMDIwIDU6MTYgUE0NClRvOiBO
YW5jeSBZdWVuIDx5dWVubkBnb29nbGUuY29tPjsgT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogW0VYVEVSTkFMXSBSZTogTXVsdGlwbGUgQk1DcyBp
biBhIHN5c3RlbTogSVBNQj8gUmVkZmlzaD8gTUNUUD8NCg0KSGkgTmFuY3ksDQpXZSBhcmUgY3Vy
cmVudGx5IHVzaW5nICgxKSBpbiBvdXIgY3VycmVudCBtdWx0aSBob3N0IGRlc2lnbi4gT3B0aW9u
ICgzKSBhbHNvIGxvb2tzIGdvb2QuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQpGcm9tOiBvcGVuYm1j
IDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmc8bWFp
bHRvOm9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZz4+
IG9uIGJlaGFsZiBvZiBOYW5jeSBZdWVuIDx5dWVubkBnb29nbGUuY29tPG1haWx0bzp5dWVubkBn
b29nbGUuY29tPj4NCkRhdGU6IFdlZG5lc2RheSwgQXByaWwgMjksIDIwMjAgYXQgMzo1MyBQTQ0K
VG86IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzxtYWlsdG86b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnPj4NClN1YmplY3Q6IE11bHRpcGxlIEJNQ3MgaW4gYSBzeXN0
ZW06IElQTUI/IFJlZGZpc2g/IE1DVFA/DQoNCkkndmUgdGFsa2VkIHdpdGggc29tZSBwZW9wbGUg
YSB3aGlsZSBiYWNrIChsb25nIHdoaWxlIGJhY2spIGFib3V0IG11bHRpcGxlIEJNQ3MgaW4gYSBz
eXN0ZW0uICBFaXRoZXIgZm9yIHJlZHVuZGFuY3kgb3IgbWFuYWdpbmcgc2VwYXJhdGUgcGFydHMg
b2YgYSBzeXN0ZW0uICAgSSdtIHdvbmRlcmluZyB3aGF0IG90aGVyIHBlb3BsZSBhcmUgdGhpbmtp
bmcgaW4gdGhpcyBhcmVhIGlmIGF0IGFsbC4NCg0KV2UgYXJlIGNvbnNpZGVyaW5nIHNpbWlsYXIg
ZGVzaWducyBhbmQgSSdtIGxvb2tpbmcgaW50byBvcHRpb25zIGZvciBCTUMtQk1DIGNvbW11bmlj
YXRpb25zLiAgU29tZSBCTUNzIG1heSBub3QgYmUgZXh0ZXJuYWxseSBhY2Nlc3NpYmxlLiBIZXJl
IGFyZSBzb21lIG9wdGlvbnMgdGhhdCB3ZSd2ZSBsb29rZWQgYXQ6DQoNCiAgMS4gIGkyYy9JUE1C
DQogIDIuICB1c2JuZXQvUmVkZmlzaA0KICAzLiAgaTJjL01DVFAvUExETSBvciBzb21ldGhpbmcg
ZWxzZT8NCiAgNC4gIGludGVybmFsIG5ldHdvcmsgdmlhIHN3aXRjaCBjaGlwL1JlZGZpc2ggb3Ig
TUNUUA0KIEknZCBsaWtlIHRvIHJlZHVjZSBvdXIgdXNlIG9mIElQTUkgc28gSSB3YW50IHRvIGF2
b2lkICgxKS4NCg0KLS0tLS0tLS0tLQ0KTmFuY3kNCg==

--_000_CH2PR21MB151047A95F646DD65268E902C8AA0CH2PR21MB1510namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
V2luZ2RpbmdzOw0KCXBhbm9zZS0xOjUgMCAwIDAgMCAwIDAgMCAwIDA7fQ0KQGZvbnQtZmFjZQ0K
CXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMg
MiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1
IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWws
IGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0
b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixz
YW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lk1zb0xpc3RQYXJhZ3JhcGgsIGxpLk1zb0xpc3RQYXJhZ3JhcGgsIGRpdi5Nc29MaXN0UGFyYWdy
YXBoDQoJe21zby1zdHlsZS1wcmlvcml0eTozNDsNCgltYXJnaW4tdG9wOjBpbjsNCgltYXJnaW4t
cmlnaHQ6MGluOw0KCW1hcmdpbi1ib3R0b206MGluOw0KCW1hcmdpbi1sZWZ0Oi41aW47DQoJbWFy
Z2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhw
b3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6
ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5X
b3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLyogTGlzdCBEZWZpbml0aW9ucyAq
Lw0KQGxpc3QgbDANCgl7bXNvLWxpc3QtaWQ6NzcwMTI2NTQ3Ow0KCW1zby1saXN0LXR5cGU6aHli
cmlkOw0KCW1zby1saXN0LXRlbXBsYXRlLWlkczo0NjE5MjE5NiAtODc4MTUwMTAwIDY3Njk4Njkx
IDY3Njk4NjkzIDY3Njk4Njg5IDY3Njk4NjkxIDY3Njk4NjkzIDY3Njk4Njg5IDY3Njk4NjkxIDY3
Njk4NjkzO30NCkBsaXN0IGwwOmxldmVsMQ0KCXttc28tbGV2ZWwtc3RhcnQtYXQ6MjA4MDsNCglt
c28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpidWxsZXQ7DQoJbXNvLWxldmVsLXRleHQ6LTsNCgltc28t
bGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJ
dGV4dC1pbmRlbnQ6LS4yNWluOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0K
CW1zby1mYXJlYXN0LWZvbnQtZmFtaWx5OkNhbGlicmk7fQ0KQGxpc3QgbDA6bGV2ZWwyDQoJe21z
by1sZXZlbC1udW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2ZWwtdGV4dDpvOw0KCW1zby1s
ZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0
ZXh0LWluZGVudDotLjI1aW47DQoJZm9udC1mYW1pbHk6IkNvdXJpZXIgTmV3Ijt9DQpAbGlzdCBs
MDpsZXZlbDMNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YnVsbGV0Ow0KCW1zby1sZXZlbC10
ZXh0Ou+CpzsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBv
c2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluOw0KCWZvbnQtZmFtaWx5OldpbmdkaW5n
czsNCgltc28tYmlkaS1mb250LWZhbWlseTpXaW5nZGluZ3M7fQ0KQGxpc3QgbDA6bGV2ZWw0DQoJ
e21zby1sZXZlbC1udW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2ZWwtdGV4dDrvgrc7DQoJ
bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0
Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjsNCglmb250LWZhbWlseTpTeW1ib2w7DQoJbXNvLWJpZGkt
Zm9udC1mYW1pbHk6U3ltYm9sO30NCkBsaXN0IGwwOmxldmVsNQ0KCXttc28tbGV2ZWwtbnVtYmVy
LWZvcm1hdDpidWxsZXQ7DQoJbXNvLWxldmVsLXRleHQ6bzsNCgltc28tbGV2ZWwtdGFiLXN0b3A6
bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4y
NWluOw0KCWZvbnQtZmFtaWx5OiJDb3VyaWVyIE5ldyI7fQ0KQGxpc3QgbDA6bGV2ZWw2DQoJe21z
by1sZXZlbC1udW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2ZWwtdGV4dDrvgqc7DQoJbXNv
LWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0K
CXRleHQtaW5kZW50Oi0uMjVpbjsNCglmb250LWZhbWlseTpXaW5nZGluZ3M7DQoJbXNvLWJpZGkt
Zm9udC1mYW1pbHk6V2luZ2RpbmdzO30NCkBsaXN0IGwwOmxldmVsNw0KCXttc28tbGV2ZWwtbnVt
YmVyLWZvcm1hdDpidWxsZXQ7DQoJbXNvLWxldmVsLXRleHQ674K3Ow0KCW1zby1sZXZlbC10YWIt
c3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVu
dDotLjI1aW47DQoJZm9udC1mYW1pbHk6U3ltYm9sOw0KCW1zby1iaWRpLWZvbnQtZmFtaWx5OlN5
bWJvbDt9DQpAbGlzdCBsMDpsZXZlbDgNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YnVsbGV0
Ow0KCW1zby1sZXZlbC10ZXh0Om87DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxl
dmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjsNCglmb250LWZh
bWlseToiQ291cmllciBOZXciO30NCkBsaXN0IGwwOmxldmVsOQ0KCXttc28tbGV2ZWwtbnVtYmVy
LWZvcm1hdDpidWxsZXQ7DQoJbXNvLWxldmVsLXRleHQ674KnOw0KCW1zby1sZXZlbC10YWItc3Rv
cDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDot
LjI1aW47DQoJZm9udC1mYW1pbHk6V2luZ2RpbmdzOw0KCW1zby1iaWRpLWZvbnQtZmFtaWx5Oldp
bmdkaW5nczt9DQpAbGlzdCBsMQ0KCXttc28tbGlzdC1pZDo3NzI3NTEyMDQ7DQoJbXNvLWxpc3Qt
dGVtcGxhdGUtaWRzOjEyOTM1NjUxOTI7fQ0KQGxpc3QgbDINCgl7bXNvLWxpc3QtaWQ6MjEzNjY3
NjEzOTsNCgltc28tbGlzdC10ZW1wbGF0ZS1pZHM6LTM4NDE2MTU4Mjt9DQpAbGlzdCBsMjpsZXZl
bDENCgl7bXNvLWxldmVsLXRhYi1zdG9wOi41aW47DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlv
bjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMjpsZXZlbDINCgl7bXNvLWxl
dmVsLXRhYi1zdG9wOjEuMGluOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0
ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDI6bGV2ZWwzDQoJe21zby1sZXZlbC10YWItc3Rv
cDoxLjVpbjsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6
LS4yNWluO30NCkBsaXN0IGwyOmxldmVsNA0KCXttc28tbGV2ZWwtdGFiLXN0b3A6Mi4waW47DQoJ
bXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpA
bGlzdCBsMjpsZXZlbDUNCgl7bXNvLWxldmVsLXRhYi1zdG9wOjIuNWluOw0KCW1zby1sZXZlbC1u
dW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDI6bGV2
ZWw2DQoJe21zby1sZXZlbC10YWItc3RvcDozLjBpbjsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0
aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwyOmxldmVsNw0KCXttc28t
bGV2ZWwtdGFiLXN0b3A6My41aW47DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0K
CXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMjpsZXZlbDgNCgl7bXNvLWxldmVsLXRhYi1z
dG9wOjQuMGluOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVu
dDotLjI1aW47fQ0KQGxpc3QgbDI6bGV2ZWw5DQoJe21zby1sZXZlbC10YWItc3RvcDo0LjVpbjsN
Cgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30N
Cm9sDQoJe21hcmdpbi1ib3R0b206MGluO30NCnVsDQoJe21hcmdpbi1ib3R0b206MGluO30NCi0t
Pjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0
PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUg
bXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4
dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4N
CjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3
MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+UmVk
ZmlzaCBkZWZpbmVzIGNvbXB1dGVyIHN5c3RlbSB0byBiZSBtdWx0aXBsZSBjaGFzc2lzIG9yIG11
bHRpcGxlIGJsYWRlcyB3aXRoaW4gYSBjaGFzc2lzLiZuYnNwOyBJdCB3b3VsZCBiZSBnb29kIHRv
IGNsYXJpZnkgaWYgeW91IGFyZSByZWZlcnJpbmcgdG8g4oCcU3lzdGVt4oCdIGFzOjxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8dWwg
c3R5bGU9Im1hcmdpbi10b3A6MGluIiB0eXBlPSJkaXNjIj4NCjxsaSBjbGFzcz0iTXNvTGlzdFBh
cmFncmFwaCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjBpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvNCI+
TXVsdGlwbGUgY2hhc3NpcyB3aXRoIHRoZWlyIG93biBCTUNzICggU3RvcmFnZSwgQ29tcHV0ZSwg
R1BVIGV0YyApDQo8bzpwPjwvbzpwPjwvbGk+PGxpIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoIiBz
dHlsZT0ibWFyZ2luLWxlZnQ6MGluO21zby1saXN0OmwwIGxldmVsMSBsZm80Ij5NdWx0aXBsZSBC
bGFkZXMgd2l0aCB0aGVpciBvd24gQk1DIHdpdGhpbiBhIGNoYXNzaXMuDQo8bzpwPjwvbzpwPjwv
bGk+PC91bD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+TmVlcmFqPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9u
ZTtib3JkZXItdG9wOnNvbGlkICNFMUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBp
biI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj5Gcm9tOjwvYj4gb3BlbmJtYyAmbHQ7b3BlbmJt
Yy1ib3VuY2VzJiM0MztuZWxhZGs9bWljcm9zb2Z0LmNvbUBsaXN0cy5vemxhYnMub3JnJmd0Ow0K
PGI+T24gQmVoYWxmIE9mIDwvYj5WaWpheSBLaGVta2E8YnI+DQo8Yj5TZW50OjwvYj4gV2VkbmVz
ZGF5LCBBcHJpbCAyOSwgMjAyMCA1OjE2IFBNPGJyPg0KPGI+VG86PC9iPiBOYW5jeSBZdWVuICZs
dDt5dWVubkBnb29nbGUuY29tJmd0OzsgT3BlbkJNQyBNYWlsbGlzdCAmbHQ7b3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBbRVhURVJOQUxdIFJlOiBNdWx0
aXBsZSBCTUNzIGluIGEgc3lzdGVtOiBJUE1CPyBSZWRmaXNoPyBNQ1RQPzxvOnA+PC9vOnA+PC9w
Pg0KPC9kaXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgTmFuY3ksPG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5XZSBhcmUgY3VycmVudGx5IHVzaW5nICgxKSBpbiBvdXIgY3VycmVu
dCBtdWx0aSBob3N0IGRlc2lnbi4gT3B0aW9uICgzKSBhbHNvIGxvb2tzIGdvb2QuPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPlJlZ2FyZHM8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPi1WaWpheTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJz
cDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNC
NUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+RnJvbTog
PC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+b3Bl
bmJtYyAmbHQ7PGEgaHJlZj0ibWFpbHRvOm9wZW5ibWMtYm91bmNlcyYjNDM7dmlqYXlraGVta2E9
ZmIuY29tQGxpc3RzLm96bGFicy5vcmciPm9wZW5ibWMtYm91bmNlcyYjNDM7dmlqYXlraGVta2E9
ZmIuY29tQGxpc3RzLm96bGFicy5vcmc8L2E+Jmd0Ow0KIG9uIGJlaGFsZiBvZiBOYW5jeSBZdWVu
ICZsdDs8YSBocmVmPSJtYWlsdG86eXVlbm5AZ29vZ2xlLmNvbSI+eXVlbm5AZ29vZ2xlLmNvbTwv
YT4mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPldlZG5lc2RheSwgQXByaWwgMjksIDIwMjAgYXQgMzo1
MyBQTTxicj4NCjxiPlRvOiA8L2I+T3BlbkJNQyBNYWlsbGlzdCAmbHQ7PGEgaHJlZj0ibWFpbHRv
Om9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyI+b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPC9hPiZn
dDs8YnI+DQo8Yj5TdWJqZWN0OiA8L2I+TXVsdGlwbGUgQk1DcyBpbiBhIHN5c3RlbTogSVBNQj8g
UmVkZmlzaD8gTUNUUD88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxk
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5JJ3ZlIHRhbGtlZCB3aXRoIHNvbWUgcGVvcGxlIGEg
d2hpbGUgYmFjayAobG9uZyB3aGlsZSBiYWNrKSBhYm91dCBtdWx0aXBsZSBCTUNzIGluIGEgc3lz
dGVtLiZuYnNwOyBFaXRoZXIgZm9yIHJlZHVuZGFuY3kgb3IgbWFuYWdpbmcgc2VwYXJhdGUgcGFy
dHMgb2YgYSBzeXN0ZW0uJm5ic3A7Jm5ic3A7IEknbSB3b25kZXJpbmcgd2hhdCBvdGhlciBwZW9w
bGUgYXJlIHRoaW5raW5nIGluIHRoaXMgYXJlYSBpZiBhdCBhbGwuPG86cD48L286cD48L3A+DQo8
L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4N
CjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPldlIGFyZSBjb25zaWRlcmluZyBz
aW1pbGFyIGRlc2lnbnMgYW5kIEknbSBsb29raW5nIGludG8gb3B0aW9ucyBmb3IgQk1DLUJNQyBj
b21tdW5pY2F0aW9ucy4mbmJzcDsgU29tZSBCTUNzIG1heSBub3QgYmUgZXh0ZXJuYWxseSBhY2Nl
c3NpYmxlLiZuYnNwO0hlcmUgYXJlIHNvbWUgb3B0aW9ucyB0aGF0IHdlJ3ZlIGxvb2tlZCBhdDo8
bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxvbCBzdGFydD0iMSIgdHlwZT0iMSI+DQo8
bGkgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1t
YXJnaW4tYm90dG9tLWFsdDphdXRvO21zby1saXN0OmwyIGxldmVsMSBsZm8zIj4NCmkyYy9JUE1C
PG86cD48L286cD48L2xpPjxsaSBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10
b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87bXNvLWxpc3Q6bDIgbGV2ZWwx
IGxmbzMiPg0KdXNibmV0L1JlZGZpc2g8bzpwPjwvbzpwPjwvbGk+PGxpIGNsYXNzPSJNc29Ob3Jt
YWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6
YXV0bzttc28tbGlzdDpsMiBsZXZlbDEgbGZvMyI+DQppMmMvTUNUUC9QTERNIG9yIHNvbWV0aGlu
ZyBlbHNlPzxvOnA+PC9vOnA+PC9saT48bGkgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1t
YXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvO21zby1saXN0Omwy
IGxldmVsMSBsZm8zIj4NCmludGVybmFsIG5ldHdvcmsgdmlhIHN3aXRjaCBjaGlwL1JlZGZpc2gg
b3IgTUNUUDxvOnA+PC9vOnA+PC9saT48L29sPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+Jm5ic3A7SSdkIGxpa2UgdG8gcmVkdWNlIG91ciB1c2Ugb2YgSVBNSSBzbyBJIHdh
bnQgdG8gYXZvaWQgKDEpLjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj4tLS0tLS0tLS0tPGJyPg0KTmFuY3k8bzpwPjwvbzpwPjwvcD4NCjwvZGl2
Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_CH2PR21MB151047A95F646DD65268E902C8AA0CH2PR21MB1510namp_--
