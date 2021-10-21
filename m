Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDCF435B41
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 09:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZdfB4qDhz2yPS
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 18:00:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=QoDMcIou;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.123;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=QoDMcIou; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320123.outbound.protection.outlook.com [40.107.132.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZddg3HQgz2xsq;
 Thu, 21 Oct 2021 17:59:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx9uqPag0iJwQxTz5pMlpJ90wtq+3yfFz/Tgv0gnrTuoyk0M/gY4D1wMbYXZNXFMgQTz+8Wn6Z1Gd9+d534KJ3R59FQ9peBoTHflo3tJ2m4h47NmGR6P+2sO9fsOZziN2nw+7zLG5PBJxOmX1WFyLo6kphBv1j/apWxrDqxhY5MWd5npCgMWS02d8jjBTbiBy22HdY9chTnJ8GBxvPrROHm56Q/wRirqPgDsnfeo1iISkQYfBtXKphUL9GKZbDHPIlzoGHkA7ojo+PDu7k4h+N1qWFurT2cJullPerQ6lvrjmJ+tbMiVla3a3kPYuZ4X6ePgmt7gRgS48eTRvDbNaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1DmDhXNzz4IVm+QtfOj1//opbJD8lBt7q7X5BO/FDk=;
 b=LNzWOmedZDuWzW5EDd93h+VkCpWA9ulm/I9TeFVXIHo7Qr2pKXMwKZ5OkII/JU07TlVY6f0HKwSA5SrJSPdlKayFOdXjBwAvxXyxVzulnimoXlIIpwO27fHWWuDtLgPz2K2LsyC0QAD3k9+XqMe7gfxSmQ2iCnlmJaBD35DIn8oiJPdShQb5uzfJVMuLXjbuMOJkhMnJOyPsSsQypfwTTgE4RfE5AFG1Nk7/Hu2Gc2UlV5cte1+Pn/cHZO8u5bhZ22jkr8UMSNxa4Ta4r/oj800WlSPF6bAYqnauLrbpR4kSJ07T+5pXNV3yHGdcQ3CrSTCUcN3Xnd8jDr0GIFlPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1DmDhXNzz4IVm+QtfOj1//opbJD8lBt7q7X5BO/FDk=;
 b=QoDMcIounRNgSaWKOFX9zWVF7qI9xSqKIVwW+wt4jAeWScFXxRixelEyDWnYY/amOX6uinuq/OrWXcZwmfc7AgTWZ1YLZ6EFCCvJ6+3877q7a40e6lOIlhVzjgVlWNaEbCzf7cVFHFe1ABOmzOduBAik1REWO4mR19Hi+panXAE2HgseUzFGxdW2CE+jr7w9xO6imsBe+JNfXgu1abdalfy9KSSWnHCKViHIOBXmpHL+5zxwx/KzOiGgMj58tD2zkWCFBFiaBE23JllpnBO+ruZkVx5vleIUZu1lTmPakl+z+MDcVcM0VQat6gYX4fniu+mWToSkoAOShXPKT66BTQ==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2898.apcprd06.prod.outlook.com (2603:1096:203:6a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Thu, 21 Oct
 2021 06:59:31 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::f4aa:d005:b469:2a71]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::f4aa:d005:b469:2a71%6]) with mapi id 15.20.4608.020; Thu, 21 Oct 2021
 06:59:31 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH v7 1/5] ARM: dts: aspeed: Drop reg-io-width from LPC nodes
Thread-Topic: [PATCH v7 1/5] ARM: dts: aspeed: Drop reg-io-width from LPC nodes
Thread-Index: AQHXs0fecSd6yr6yx06EH3I+ZmYC4KvIlUqAgBSN/wCAAADfYIAABKQAgAABnQCAAADTAA==
Date: Thu, 21 Oct 2021 06:59:31 +0000
Message-ID: <HK0PR06MB3779FDCD93A4BB2D6A56F1F491BF9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
 <20210927023053.6728-2-chiawei_wang@aspeedtech.com>
 <CACPK8Xc+9yFJn_pO1sAVQJu_FWkA1U9XnbB+TLYgfdbHi1TyaQ@mail.gmail.com>
 <CACPK8Xfj=wJBCX5ogyf02pLJsLrooVWBJ92GJ1E+jxQW5wiFEw@mail.gmail.com>
 <HK0PR06MB3779F430883E60E7E47849BE91BF9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8Xc2wzx1dthFYC_0vm4mj9e1BbL+Kwkqc_PvPFj4sqjOJg@mail.gmail.com>
 <CACPK8Xfc+vuqbnw8xuXGtGwKRLnb7EwYZYE0Z-+g3fUM28yc6w@mail.gmail.com>
In-Reply-To: <CACPK8Xfc+vuqbnw8xuXGtGwKRLnb7EwYZYE0Z-+g3fUM28yc6w@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fd4f7a7-b9ce-44b6-c5d2-08d994605519
x-ms-traffictypediagnostic: HK0PR06MB2898:
x-microsoft-antispam-prvs: <HK0PR06MB2898079954B945C51666B1F591BF9@HK0PR06MB2898.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dpXLkXLJfOCRveOKCPzIgZku4X2oabdHspMq6lPAir2yv5mQmmZUSr75P2WqOP3kCf65QxcVP+YtWRl5kCsUh+Qa7JdhNdFA1Fmf22ISDxdc8DTVz1H6Cv8gNZjjq3zZvRsJpNwPVPf54eKzhR3DNidZqKTlcwfNIoacwpChxgo//V7wtdtBNVvUNKauE60Zc2c0fi6PPqR+zKHZgb+EXuHXz6EZJm6GvpVSO4Kvjb5hYW2+MgDDx4178Fb96QBpiNPSLQNqjvoSU79YN2LaCQhkUXkm+0YdViYCNfypNJck4OPg9BnVtWhKUFpXK0LG/p3IDc/FBdem4WdXg0sL+zKvFRLz8jR3pMcJr1VEq4GlRoC6EIf2o94vvpf8jPYpjU0HqHGHvyRs6UeVxCh4jCtv5MzawxwwwjuHBp87g/82hNmHdp1rw8CCTsepshJ8UbohPSgr6nZQxRt2ohgL9cLgqELV408M3uS1BkQlpbxILhU8xv5N7SW3jdjnobOGNPeEFB15DN6iohMFqqOEjkfoZkeHqlO3s/v6uT/8xrrO2K6jAGzoyHMkM6Ximb47yC5HZUQzWKE5D+heF4Cvg0RhRf9lP7yKwubosNWhcN9P9GfkFpRSv3H1gZBSA0yiLlbNq53fCF0G0RZrLcJnuQ6h2001qYZ1aWhLVfaA5Qpkjv7tcTtOtVK6y/G+ebRy/up71E2KpNllKhuigKjEOw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39840400004)(396003)(366004)(346002)(86362001)(71200400001)(66556008)(66446008)(33656002)(122000001)(55016002)(5660300002)(26005)(186003)(52536014)(66946007)(76116006)(38100700002)(8676002)(4326008)(8936002)(38070700005)(2906002)(508600001)(64756008)(9686003)(66476007)(6506007)(316002)(7696005)(6916009)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmRVWWx0RWVHRWg4azNTRjNZMnMydUR1MkRvaitYeUsvUlJKRk1EL2hNMXBl?=
 =?utf-8?B?V1dPcjExeDF2MklPcTJXZXFmcDFGL3NtTWhNZ1dMRnZMWTFhZ2NVYitTOHZO?=
 =?utf-8?B?bHQ2QkN1L1RmVGRBVVowRitHQWFsd1RzYnRINXEySlJOZkdjSnBzdEVxVFhC?=
 =?utf-8?B?UjF2TmxlZmNxMURBSVBpclNVZXZYWFFIUXNZQmczNTN0dVNFQVZwa1pVemlF?=
 =?utf-8?B?elZsNU90bVlDZzQ2TjI0MmlRVkhTOW81ZVM4cmRGa1FlY3FDenVNRkxLQmZt?=
 =?utf-8?B?MEZuaVd5Uzg0OGZja0VzVXJQREJLV2xDZVJOSkw2RVM4a2sxZ3R5eUJTZWla?=
 =?utf-8?B?dEQvaXRPc3VjL2FRaER3bE9vajdiZERIKzJUdFpsK3NDMGpWQ1lpd0x0d2hB?=
 =?utf-8?B?Z1dSZk5LckR0T3RRNFlKMnBuRThkZTBPODBlQ2FoWThUV1c4KzkxanNuQ0s0?=
 =?utf-8?B?amgzS0N3OXVFSGRWTFJTRFJGY0JNdURNMkJ4cHhVTVpJQjhxZFRWOEZHL0Z0?=
 =?utf-8?B?emF4L1lrVUoray9ObkdpM3g3WGxnMEpkTzZ0OXdFdDZ3NllvSnAzYkJXVkl3?=
 =?utf-8?B?VmN2MmJxZVljcEpacENnUnhhR2dzRDhIbGRzRVdEUFZOejRPNUZtemM1T0Rx?=
 =?utf-8?B?dE5hNytjWW8vMVcrenpRZWRzdlV2dW5iMHcvVHJ5REVHRXUzS2RHUDg0cnpZ?=
 =?utf-8?B?OUttUnI0WHFLa1NUVWhYaExTRjFzenRWeXgzbjlaZlI0SXF0eHVuQVdyd3Fv?=
 =?utf-8?B?bGdydmxldk5tdTBkalc4Tk5nSGZYN2oveUVQUmV0Wjl0bk1yZ1NTKzVmVisz?=
 =?utf-8?B?VkJoSDRXbStRSGhyUnJjNmZlYlBnUTlHbVAwYmlNa1ZXZExQM204OERjR0lt?=
 =?utf-8?B?SWhHelhoRTJhNGdkUXFNVGhLd1N1VjNWS3dtOFl3Y3J5R09kU3JCenlKOHls?=
 =?utf-8?B?ejdHc1lDMmZjUFZZSDg3VklPM2pmZ2M3aUEvbHpqRmswOHZkTzNIdEdXeDRs?=
 =?utf-8?B?emJkU2g0Q0lqQ1FKTHJtVWJyaHhsbjlMTHc4RGw3VDQyWkIxRFk0Nlo1QjhX?=
 =?utf-8?B?SU5MWERjTE0wTVQxV1ptVGJ4YmJDRnZkWGFpTzVERHVIenV0bitMQXVVMWVk?=
 =?utf-8?B?TEMxb2RXcEQrWFRvQ2hIUGxSUG9Wd3hwUjYvTHlNSEVEanpXaWlKOTZQUGNR?=
 =?utf-8?B?Z0dSYUpQbHFVOVhZRWwrOTZKbWRWd1RYVEx5cmRrcm5uaXZWelFNSUNxME9z?=
 =?utf-8?B?YWZkSVZPVk9oVmFuWnAvMnNsMFhCR0JuVVBudGRFVUlVb21SRE54MnlPc2tX?=
 =?utf-8?B?THJKbGNObE5QWmg5WUhKMkJHcm1lUXIzUUJlNmR3b3BEM1JQSlpSdEhWbjlv?=
 =?utf-8?B?UkZUZnpuaTMvVmZ2SnVZL0hlNWtzNXVSM3FYcE1NSTJlZ0pjcFBrRm9ZMUJv?=
 =?utf-8?B?VnNRZXpEcEJZdm02dE1seVg5aVdmMWlLZEtBVzBtNTRlOE9mWElwSE5IeXk3?=
 =?utf-8?B?ZTFkLzFPVWUzSWpzQVIwdE9NcTZ6VCtzbjhYVU5IUWd6SHlhWDJBVmFwS3Zw?=
 =?utf-8?B?eDhwaTlqRmIvSVd1SC9GQzdBUEZRQTgrcWE4M1ZkbUlESTUwaW5hTFVnN0R3?=
 =?utf-8?B?VlRFd2JtV0F1MG1CK1pBK0JERzNDOWx0Mkt4OTE4T01wZG13bUF5bHllK2Nx?=
 =?utf-8?B?dXhYajNXUWZyRzlGTXU0RXd1b3JQK0NvQXRDc09yeWVPSVNwM1I0YXdQMEk3?=
 =?utf-8?B?WUlJd0JUOUtEN21Rby81SklMdVVpQysvamtTL08vcEJlb25mMVlkZWZGTFNu?=
 =?utf-8?B?WTFhU0xvK0x4RmNSRTd2blBjbU9TRmI5Q2M3U3VDQVF5cEZlOWNsZHNKRWln?=
 =?utf-8?B?VjBOL1FMVlRpZ08za3draG4rTERuOGtnTkwveWpCTDdxajBwSnl5ZUlMU3NO?=
 =?utf-8?Q?8O0ZTl/DIriQo+OI2bXzlhJWs2kL8sfc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd4f7a7-b9ce-44b6-c5d2-08d994605519
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 06:59:31.4020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chiawei_wang@aspeedtech.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2898
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiBTZW50OiBUaHVyc2RheSwg
T2N0b2JlciAyMSwgMjAyMSAyOjU0IFBNDQo+IA0KPiBPbiBUaHUsIDIxIE9jdCAyMDIxIGF0IDA2
OjQ4LCBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PiB3cm90ZToNCj4gPg0KPiA+IE9uIFRo
dSwgMjEgT2N0IDIwMjEgYXQgMDY6MzcsIENoaWFXZWkgV2FuZw0KPiA8Y2hpYXdlaV93YW5nQGFz
cGVlZHRlY2guY29tPiB3cm90ZToNCj4gPiA+IEhvd2V2ZXIsIGxpa2UgUm9iIG1lbnRpb25lZCwg
d2hlbiBkb2luZyAnbWFrZSBkdGJzX2NoZWNrJywgdGhlcmUgaXMgYQ0KPiB3YXJuaW5nOg0KPiA+
ID4NCj4gPiA+DQo+IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1kdC1yZXZpZXcvYXJjaC9hcm0v
Ym9vdC9kdHMvYXNwZWVkLWFzdDI1MDAtZXZiLmR0LnkNCj4gYW1sOg0KPiA+ID4gbHBjQDFlNzg5
MDAwOiAnaWJ0QDE0MCcsICdrY3NAMTE0JywgJ2tjc0AyNCcsICdrY3NAMjgnLCAna2NzQDJjJywN
Cj4gJ2xoY0BhMCcsICdyZWctaW8td2lkdGgnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4
ZXM6DQo+ID4gPiAnXmxwYy1jdHJsQFswLTlhLWZdKyQnLCAnXmxwYy1zbm9vcEBbMC05YS1mXSsk
JywNCj4gJ15yZXNldC1jb250cm9sbGVyQFswLTlhLWZdKyQnLCAncGluY3RybC1bMC05XSsnDQo+
ID4gPiBGcm9tIHNjaGVtYToNCj4gPiA+IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1kdC1yZXZp
ZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzDQo+ID4gPiAvbWZkL2FzcGVlZC1s
cGMueWFtbA0KPiA+ID4NCj4gPiA+IEFzIHBhcnQgb2YgdGhpcyBzZXJpZXMgaGFzIGJlZW4gYXBw
bGllZCwgbWF5YmUgd2UgY2FuIGZpeCB0aGlzIGxhdGVyPw0KPiANCj4gRldJVywgdGhpcyBmaXhl
cyB0aGUgd2FybmluZ3MgZm9yIG1lOw0KPiANCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9hc3BlZWQtbHBjLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hc3BlZWQtbHBjLnlhbWwNCj4gQEAgLTU2LDYgKzU2LDkg
QEAgcHJvcGVydGllczoNCj4gDQo+ICAgIHJhbmdlczogdHJ1ZQ0KPiANCj4gKyAgcmVnLWlvLXdp
ZHRoOg0KPiArICAgIGNvbnN0OiA0DQo+ICsNCj4gIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiAgICAi
XmxwYy1jdHJsQFswLTlhLWZdKyQiOg0KPiAgICAgIHR5cGU6IG9iamVjdA0KPiBAQCAtMTQ0LDYg
KzE0Nyw5IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiAgICAgICAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzItYXJyYXkNCj4gICAgICAgICAgZGVzY3JpcHRp
b246IFRoZSBMUEMgSS9PIHBvcnRzIHRvIHNub29wDQo+IA0KPiArICAgICAgY2xvY2tzOg0KPiAr
ICAgICAgICBtYXhJdGVtczogMQ0KPiArDQo+ICAgICAgcmVxdWlyZWQ6DQo+ICAgICAgICAtIGNv
bXBhdGlibGUNCj4gICAgICAgIC0gaW50ZXJydXB0cw0KPiANCj4gbWFrZSBBUkNIPWFybSBDUk9T
U19DT01QSUxFPSJhcm0tbGludXgtZ251ZWFiaS0iIGR0YnNfY2hlY2sNCj4gRFRfU0NIRU1BX0ZJ
TEVTPURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXNwZWVkLWxwYy55YW1s
DQo+IA0KPiBJZiB5b3UgYXJlIGFibGUgdG8gdGVzdCB0aGlzIGFuZCBzZW5kIGEgcGF0Y2ggdGhh
dCB3b3VsZCBiZSBhcHByZWNpYXRlZC4NCg0KU3VyZS4gSSB3aWxsIHRlc3QgaXQgYW5kIHNlbmQg
YSBzdGFuZGFsb25lIHBhdGNoIHRvIGZpeCB0aGUgd2FybmluZy4NClRoYW5rcyENCg0KUmVnYXJk
cywNCkNoaWF3ZWkNCg==
