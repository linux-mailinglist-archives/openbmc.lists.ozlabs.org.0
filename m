Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBB03105E9
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 08:33:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX6bj0hcmzDwnv
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 18:33:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.132;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320132.outbound.protection.outlook.com [40.107.132.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX6WD27TfzDqJS
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2021 18:29:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUWcNZQbV/xfx5CeQbAuS9c4Q0rz5H+Wpr4dFqAxq7/qBGMZ6CrNQhthWf54WmT42DHpQxlhPjAS4l98IjHTIQT3R1S/gqy1JftW18AYe/vOSv1b8oyROHBPlmzRRM9un4brjiSdQWarhamrIQQj1+EeGLXWlQqmljBeYry8C36nySmF/eM9rJpLrHzB1gIXvXdXMpr0cTWVq2r7QYcYHwJAVhRcICtSvbjOq0qBuJ2+9XWOsTS+JB/ci1r5Q6NdKMIZl7/17mO9+IU16wkEnLHBH32xbP+9GYxspKP40TeQWdoCQ8W2cJcGYAnpJYxyQUbrxvnYEiLv9o31f5VINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw9N3W1rwCBbDy2dabGI78+s2Nj0hiMik2dJ9WVyC/w=;
 b=Q9F4JSR35luW1yCo65FxA14kBgw19+B0tRdingY/d/++rYxG2p6epCD7hMEGxjc39WQqT4XGJTDjNHRNM38Q+mzBLeJPTSmKvdtB7nB9Z5+0vTbYQfnZs8ufDWrzQyohYXsKX8B9uJ/jtiFFPTmx2FuDa5iwNgYgKclfEtRA8aAlbWjzSrph/H2g9UXv/44tnVI+WTYRIzhgcjDYwVkZp3m7ilzYiFeoMZ2he635PIaFMO4RoE+ZPYQTrxPUN1wKQU8bkKr9tf7z6JUIkZWApxMJxDVPLeTQ1MKhGSLdy9DQRoJlkE7qjBFcyh9h8T45L7Jo/UTbiCaHssjicpFD5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from PS1PR06MB2600.apcprd06.prod.outlook.com (2603:1096:803:4d::19)
 by PS1PR0601MB3707.apcprd06.prod.outlook.com (2603:1096:300:85::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Fri, 5 Feb
 2021 07:29:35 +0000
Received: from PS1PR06MB2600.apcprd06.prod.outlook.com
 ([fe80::6031:184a:88fe:5667]) by PS1PR06MB2600.apcprd06.prod.outlook.com
 ([fe80::6031:184a:88fe:5667%7]) with mapi id 15.20.3825.021; Fri, 5 Feb 2021
 07:29:34 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: VINOTHKUMAR RK <vkrk.user@gmail.com>
Subject: RE: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
 large!'
Thread-Topic: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
 large!'
Thread-Index: AQHW+vFPViRLRAm5PEWwpC/TsH6us6pI1kzAgAAf8gCAABSm4A==
Date: Fri, 5 Feb 2021 07:29:34 +0000
Message-ID: <PS1PR06MB2600313E52EEEDB5DE51263C8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
References: <CAHf5csd1tt-VNS9Wfuwqito2Fy75bfhArAEhZP_d1LXeOz+YVA@mail.gmail.com>
 <PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <CAHf5csdnjHmMm6HFqevH=w=QLwZ1PzZ4UTDOq7sxYaoVn__8rg@mail.gmail.com>
In-Reply-To: <CAHf5csdnjHmMm6HFqevH=w=QLwZ1PzZ4UTDOq7sxYaoVn__8rg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [118.99.190.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47136cb7-ba19-4df3-4e64-08d8c9a7c97f
x-ms-traffictypediagnostic: PS1PR0601MB3707:
x-microsoft-antispam-prvs: <PS1PR0601MB370764DBABB5BE39C53952468AB29@PS1PR0601MB3707.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Wo68/Z9Nt6w2Jl3hTxL3dy+XppdOh2q5ZOFHl6TYsL7d4S+Min6NOyHjUcBxbwK6c1UnR1G+7GMO+E7sd3TPOekIoZmsGaKfFTQgMOd/j0d+fYkvMPDI9tFuis04ZW6eolUyzUk462J0JilhcnSY0Vb4zGU4MhKAMZq7SGNuxIPkAks8/R6ZDtKk5RhLSsgRKZzVeVgCXVinG5eVH96DnkW8HaRYXKc69XeThWpfZpfrB1kKJSMps+sTpXN69MMNYROBovtmD2C/AsXxhKnhPOWtUPxVTbqwYZpn8EI5Cb3oBuFQrhfjBNdadPmi4i1Q2f+l9UF8Q4PPzF8XtTe1C5EgV2opYVtYAhUUJ9aTfN7QcQSSO8DLGHNgUeSMpWbnhADxl0XeLxyOpCOg380JZwNI9R4J3FeqBGmtv2DyZIz/4ju1xeH6oGcSmW7RvQwvVkq1qg5RBi4ffPE1O25wpMRQHLHyNMZQPg+M/vAAhc2e5W8FFAR1uVbnlhJxxQfAg2wJHZyj/k0iy/L+B0RqOHH+ojJs2XE4PsZW7FKdpj+0fLEakPkVmEdkKnqp2JFsJKQNMvL167y39tlbFsYjpFKkvO5miyH2h/4BHEqwnk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PR06MB2600.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(39850400004)(376002)(366004)(4326008)(86362001)(52536014)(71200400001)(5660300002)(9686003)(64756008)(2906002)(76116006)(83380400001)(66476007)(66446008)(6916009)(66556008)(66946007)(55016002)(33656002)(966005)(8936002)(478600001)(6506007)(53546011)(8676002)(26005)(316002)(186003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NHNBUHVlbWRXbEQ4bklESHF0ZXVkdXk4dnZyWHlpK2NzQlRpMjJ2UkVWejk5?=
 =?utf-8?B?Nkdtb2hBSHl5R21abHkvLzZoNW8yTHJDTDdrejZXYTVvWGRkaDU1TEVoNkJN?=
 =?utf-8?B?b1ROaUx4VVA2K2o4RUVaTGxuMEZEanh1YTJ3ODl5TndDSTl2Zm5HUHQzTWtG?=
 =?utf-8?B?Ly9RRjRzZXB0RWd0elduZm94RXpjbWdDSWx5NEFDdWhibE1mYXo5UG5rRnJX?=
 =?utf-8?B?NVhBazNYZEFHTndPQ0o5ejJKdlhhUGcwRWN4dWYwUWxrNkZvT0ZuaU52TkZE?=
 =?utf-8?B?a3dsVEtxZVZHZ0pveU5sYkJiVzM5bGxZbExody9LdjMraWsraE50c0xUT0F1?=
 =?utf-8?B?aGNuL3BYNkxzMytHU0E0WHJTSG44TCtJNm4rUWJ2SjB3NmJZNzVwUzQ0ZWJT?=
 =?utf-8?B?bkc5NTJrWEZDb05abW10bVllQmtzdzFiT1R1ckNZdlozWEthWHBhTTF6Vno4?=
 =?utf-8?B?dENtYkN3NmE1M1FoRllxSU1yQmwyT2VpUGs5c2JJMnhVNHdRZmRUM2QwK0dM?=
 =?utf-8?B?dmhqcVViREFKTHBwWUpTcWlSVDg4eUtyS09taExGYzRpQ3dLdkhEanNHQm1U?=
 =?utf-8?B?VFRBWENJTmwwdzlaSXFPeFhEaDQ3b3Btck9XT2gwSDMvdklnUVJSdlNIL1lz?=
 =?utf-8?B?OFBYbEI2SFZFZkZhMjhMNm1CZVcxaFFDak5yMm5DNDk1RHcyd0VDYkMzNW9r?=
 =?utf-8?B?Vkk2WnBrVGhKQjE1dWpmUDU2RmlOdFFFOUJzUHJXL3c1VHNzODZka1ZPRnRy?=
 =?utf-8?B?MEhtdkthSU5QRHNLWHhVcUlQdElKTGRjY2YxWmcvbURrdE1JcUFXQWkrTmZj?=
 =?utf-8?B?TnhsZFU5WGR4WkxpNnhBbWdXZkd2MmNjWmN1VWp6QnlXQmgzb3IyVWtjRzFa?=
 =?utf-8?B?L29lVkJLRXM2UVJDWUFSd3gxakFZdjkzemUwR3ZKNk5MNy9ZR0U3eVh5bEdR?=
 =?utf-8?B?Y0RscDVOckpiL2pCTnZPcktHVHFpTHdPU0xNL0NXOW4vdWd3Q0x6SEJQUjRy?=
 =?utf-8?B?VVI5cnFEWDQyOEJFdUppbGhERGl3SHhKdy9MbWJJaTg0Q3hzeXc3NWMrVlBB?=
 =?utf-8?B?Z21aa2Y0ajRmbDlSOEdRVGMyWlZlaElIbDNGeTJxQW5UZWVmUzEyQklhQTdC?=
 =?utf-8?B?cDNVeXY4RVhVVGoreUdjRTFoSkFvcHBVcVh1KzVOSk4xYzdYdGJMeEFnNHJW?=
 =?utf-8?B?RFpTS1NidGdGN3RVRXFGSHlLZ3h2bHdlTzJ4Qy9iM3g3NkF1ck4rS21ydXM5?=
 =?utf-8?B?TnBFOHVnOWE2Z2FqSkR2RzJSYXFlWmhFRnp1NkdNd3VrTHJ0M2RoY3FNekpF?=
 =?utf-8?B?a1NPUmZLZWtDWjQvNnNyRzlsWkJNUW1TNXhiaFBLNTVXakVGSmd3Y25kTENv?=
 =?utf-8?B?eG0wb00zSTNtOEpYOXZXdU1Uejc5RlkxbXpZS1plWkNwRWhPdnVieDI0QklZ?=
 =?utf-8?B?NFV3dzZCN0VKV0tqTWJIMG1tOHRHRjhUVU1DTzBqYmZvSStIalMwd3NsSkVL?=
 =?utf-8?B?K1ZMRmk1ZVZhRCtNVDhCRWxrVzd6bVg0YTdYTlZKTklYNUlxSDdlZmZseVFh?=
 =?utf-8?B?T0ZlbE5ETHQ1SU1tQitqUG5yMkZMWXpXZEpuaEI1RWNDdW1KRG1EM092OUJZ?=
 =?utf-8?B?aEtoZU9pa1VTZ0ZjMWtGTzNqclIxblVTQWpzM0hwWTlnUmRSOUFCMy9EN2M2?=
 =?utf-8?B?QzBvZGw0TDZSeFI3ZXd4L0ViWWtxUjMrdlpLMXEvZk0yaVlqMUMrYTJYZ2tK?=
 =?utf-8?Q?PRdq5gr9atwvY07S8q6W5TJ5zquCadjzD7r1NHm?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR06MB2600.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47136cb7-ba19-4df3-4e64-08d8c9a7c97f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 07:29:34.8381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 80wlzVR3SPXE83e81ODDm97uBU8OllafuNuU0GgzyJtfiOXHkzsKyObC3ijUCWVLVKHY72zGmxLluhpsrcLz3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB3707
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

SGkgVmlub3Roa3VtYXIsDQoNCknigJltIG5vdCBzdXJlIHdoYXTigJlzIHdyb25nLiBCZXdhcmUg
dGhhdCB0aGUgUUVNVSB3aWxsIGRpcmVjdGx5IHdyaXRlIGludG8geW91ciBpbWFnZSBmaWxlLCBz
byB5b3UgbWlnaHQgd2FudCB0byBydW5uaW5nIGl0IG9uIGEgY29weSBvciB1c2UgLXNuYXBzaG90
IG9wdGlvbi4NCg0KSSBjb3VsZCBib290IGludG8gT1Mgd2l0aCB0aGUgZm9sbG93aW5nIHFlbXUg
Y29tbWFuZDoNCnFlbXUtc3lzdGVtLWFybSAtTSBhc3QyNjAwLWV2YiAtZHJpdmUgZmlsZT1pbWFn
ZS1ibWMsZm9ybWF0PXJhdyxpZj1tdGQgLW5vZ3JhcGhpYyAtbmljIHVzZXINCiANCk15IFFFTVUg
dmVyc2lvbjoNCnFlbXUtc3lzdGVtLWFybSAtLXZlcnNpb24NClFFTVUgZW11bGF0b3IgdmVyc2lv
biA1LjIuNTAgKHY1LjIuMC05OTEtZzQ1MjQwZWVkNGYpDQpDb3B5cmlnaHQgKGMpIDIwMDMtMjAy
MCBGYWJyaWNlIEJlbGxhcmQgYW5kIHRoZSBRRU1VIFByb2plY3QgZGV2ZWxvcGVycw0KDQpUaGFu
a3MsDQpUcm95IExlZQ0KDQpGcm9tOiBWSU5PVEhLVU1BUiBSSyA8dmtyay51c2VyQGdtYWlsLmNv
bT4gDQpTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDUsIDIwMjEgMTI6MTkgUE0NClRvOiBUcm95IExl
ZSA8dHJveV9sZWVAYXNwZWVkdGVjaC5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
DQpTdWJqZWN0OiBSZTogZXZiLWFzdDI2MDA6IEdldHRpbmcgc29tZSBidWlsZCBlcnJvcnMgLSAn
dS1ib290LmJpbicgaXMgdG9vIGxhcmdlIScNCg0KSGkgVHJveSwNCg0KVGhhbmtzIGZvciBzaGFy
aW5nIHRoZSBjaGFuZ2VzLCB3aXRoIHRoaXMgSSdtIGFibGUgdG8gZ2VuZXJhdGXCoG10ZCBpbWFn
ZS4gQnV0IHdoZW4gSSB0cnkgdG8gbG9hZCB0aGVtIHRocm91Z2ggUWVtdSzCoGl0J3MgZ2V0dGlu
ZyBzdHVjayB3aXRoIHRoZSBiZWxvdyBlcnJvci4gSXMgdGhlcmUgYW55IHdvcmthcm91bmQ/DQoN
CkVycm9yIGxvZzoNCi0tLS0tLS0tLS0tLQ0KZmR0X3Jvb3Q6IEZEVF9FUlJfQkFETUFHSUMNCkVS
Uk9SOiByb290IG5vZGUgc2V0dXAgZmFpbGVkDQrCoC0gbXVzdCBSRVNFVCB0aGUgYm9hcmQgdG8g
cmVjb3Zlci4NCg0KRkRUIGNyZWF0aW9uIGZhaWxlZCEgaGFuZ2luZy4uLiMjIyBFUlJPUiAjIyMg
UGxlYXNlIFJFU0VUIHRoZSBib2FyZCAjIyMNCg0KDQpRZW11IGNvbW1hbmQ6DQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KcWVtdS1zeXN0ZW0tYXJtIC1tIDFHIC1NIGFzdDI2MDAtZXZiIC1ub2dy
YXBoaWMgLWRyaXZlIGZpbGU9b2JtYy1waG9zcGhvci1pbWFnZS1ldmItYXN0MjYwMC0yMDIxMDIw
NTAzNDkwMS5zdGF0aWMubXRkLGZvcm1hdD1yYXcsaWY9bXRkIC1uZXQgbmljIC1uZXQgdXNlcixo
b3N0ZndkPToxMjcuMC4wLjE6MjIyMi06MjIsaG9zdGZ3ZD06MTI3LjAuMC4xOjI0NDMtOjQ0Myxo
b3N0bmFtZT1xZW11DQoNClFlbXUgbG9nOg0KLS0tLS0tLS0tLS0tLS0NClUtQm9vdCAyMDE5LjA0
IChGZWIgMDQgMjAyMSAtIDEwOjI3OjIxICswMDAwKQ0KDQpTT0M6IEFTVDI2MDAtQTDCoA0KZVNQ
SSBNb2RlOiBTSU86RW5hYmxlIDogU3VwZXJJTy0yZQ0KRXRoOiBNQUMwOiBSR01JSSwgTUFDMTog
UkdNSUksIE1BQzI6IFJHTUlJLCBNQUMzOiBSR01JSQ0KTW9kZWw6IEFTVDI2MDAgRVZCDQpEUkFN
OsKgIGFscmVhZHkgaW5pdGlhbGl6ZWQsIDI0MCBNaUIgKGNhcGFjaXR5OjI1NiBNaUIsIFZHQTo2
NCBNaUIpLCBFQ0Mgb2ZmDQpQQ0lFLTA6IExpbmsgZG93bg0KTU1DOsKgIMKgDQoNCnNkaGNpX3Ns
b3QwQDEwMDogMSwgc2RoY2lfc2xvdDFAMjAwOiAyLCBlbW1jX3Nsb3QwQDEwMDogMA0KTG9hZGlu
ZyBFbnZpcm9ubWVudCBmcm9tIFNQSSBGbGFzaC4uLiAqKiogV2FybmluZyAtIHNwaV9mbGFzaF9w
cm9iZV9idXNfY3MoKSBmYWlsZWQsIHVzaW5nIGRlZmF1bHQgZW52aXJvbm1lbnQNCg0KSW46wqAg
wqAgc2VyaWFsQDFlNzg0MDAwDQpPdXQ6wqAgwqBzZXJpYWxAMWU3ODQwMDANCkVycjrCoCDCoHNl
cmlhbEAxZTc4NDAwMA0KTW9kZWw6IEFTVDI2MDAgRVZCDQpOZXQ6wqAgwqANCldhcm5pbmc6IGZ0
Z21hY0AxZTY2MDAwMCAoZXRoMCkgdXNpbmcgcmFuZG9tIE1BQyBhZGRyZXNzIC0gNWU6MjM6MTY6
M2I6MDc6ZGINCmV0aDA6IGZ0Z21hY0AxZTY2MDAwMA0KV2FybmluZzogZnRnbWFjQDFlNjgwMDAw
IChldGgxKSB1c2luZyByYW5kb20gTUFDIGFkZHJlc3MgLSA5MjoyZDpiOTo0YjphNTo5Mw0KLCBl
dGgxOiBmdGdtYWNAMWU2ODAwMDANCldhcm5pbmc6IGZ0Z21hY0AxZTY3MDAwMCAoZXRoMikgdXNp
bmcgcmFuZG9tIE1BQyBhZGRyZXNzIC0gZjY6MTY6NjA6YzY6MGE6MmQNCiwgZXRoMjogZnRnbWFj
QDFlNjcwMDAwDQpXYXJuaW5nOiBmdGdtYWNAMWU2OTAwMDAgKGV0aDMpIHVzaW5nIHJhbmRvbSBN
QUMgYWRkcmVzcyAtIDAyOjQzOjMyOjE2OjQxOjZkDQosIGV0aDM6IGZ0Z21hY0AxZTY5MDAwMA0K
SGl0IGFueSBrZXkgdG8gc3RvcCBhdXRvYm9vdDrCoCAwwqANCiMjIExvYWRpbmcga2VybmVsIGZy
b20gRklUIEltYWdlIGF0IDIwMTAwMDAwIC4uLg0KwqAgwqBVc2luZyAnY29uZkBhc3BlZWQtYXN0
MjYwMC1ldmIuZHRiJyBjb25maWd1cmF0aW9uDQrCoCDCoFRyeWluZyAna2VybmVsQDEnIGtlcm5l
bCBzdWJpbWFnZQ0KwqAgwqAgwqBEZXNjcmlwdGlvbjrCoCBMaW51eCBrZXJuZWwNCsKgIMKgIMKg
VHlwZTrCoCDCoCDCoCDCoCDCoEtlcm5lbCBJbWFnZQ0KwqAgwqAgwqBDb21wcmVzc2lvbjrCoCB1
bmNvbXByZXNzZWQNCsKgIMKgIMKgRGF0YSBTdGFydDrCoCDCoDB4MjAxMDAxMmMNCsKgIMKgIMKg
RGF0YSBTaXplOsKgIMKgIDM1MjcxMTIgQnl0ZXMgPSAzLjQgTWlCDQrCoCDCoCDCoEFyY2hpdGVj
dHVyZTogQVJNDQrCoCDCoCDCoE9TOsKgIMKgIMKgIMKgIMKgIMKgTGludXgNCsKgIMKgIMKgTG9h
ZCBBZGRyZXNzOiAweDgwMDAxMDAwDQrCoCDCoCDCoEVudHJ5IFBvaW50OsKgIDB4ODAwMDEwMDAN
CsKgIMKgIMKgSGFzaCBhbGdvOsKgIMKgIHNoYTI1Ng0KwqAgwqAgwqBIYXNoIHZhbHVlOsKgIMKg
ZDNiZmRlNDQ1OWJhYjgyNzJjZGExMmYwNzQ3ZDQ3NzM1NTIxYzllZTRmNTc4NjI4M2NmZWE0Mzkz
OThjOTc2ZA0KwqAgwqBWZXJpZnlpbmcgSGFzaCBJbnRlZ3JpdHkgLi4uIHNoYTI1NisgT0sNCiMj
IExvYWRpbmcgcmFtZGlzayBmcm9tIEZJVCBJbWFnZSBhdCAyMDEwMDAwMCAuLi4NCsKgIMKgVXNp
bmcgJ2NvbmZAYXNwZWVkLWFzdDI2MDAtZXZiLmR0YicgY29uZmlndXJhdGlvbg0KwqAgwqBUcnlp
bmcgJ3JhbWRpc2tAMScgcmFtZGlzayBzdWJpbWFnZQ0KwqAgwqAgwqBEZXNjcmlwdGlvbjrCoCBv
Ym1jLXBob3NwaG9yLWluaXRyYW1mcw0KwqAgwqAgwqBUeXBlOsKgIMKgIMKgIMKgIMKgUkFNRGlz
ayBJbWFnZQ0KwqAgwqAgwqBDb21wcmVzc2lvbjrCoCB1bmNvbXByZXNzZWQNCsKgIMKgIMKgRGF0
YSBTdGFydDrCoCDCoDB4MjA0NjVjZjgNCsKgIMKgIMKgRGF0YSBTaXplOsKgIMKgIDEwODc2MDgg
Qnl0ZXMgPSAxIE1pQg0KwqAgwqAgwqBBcmNoaXRlY3R1cmU6IEFSTQ0KwqAgwqAgwqBPUzrCoCDC
oCDCoCDCoCDCoCDCoExpbnV4DQrCoCDCoCDCoExvYWQgQWRkcmVzczogdW5hdmFpbGFibGUNCsKg
IMKgIMKgRW50cnkgUG9pbnQ6wqAgdW5hdmFpbGFibGUNCsKgIMKgIMKgSGFzaCBhbGdvOsKgIMKg
IHNoYTI1Ng0KwqAgwqAgwqBIYXNoIHZhbHVlOsKgIMKgNDg4ZjQ0ZWIwYzk1NGVmODVlZGUwYzFk
ZGUzODAzNjk2YjM2MzdkNDE5OTZmYzJiZTk2MTBiYmRiNzU2YjFhOQ0KwqAgwqBWZXJpZnlpbmcg
SGFzaCBJbnRlZ3JpdHkgLi4uIHNoYTI1NisgT0sNCiMjIExvYWRpbmcgZmR0IGZyb20gRklUIElt
YWdlIGF0IDIwMTAwMDAwIC4uLg0KwqAgwqBVc2luZyAnY29uZkBhc3BlZWQtYXN0MjYwMC1ldmIu
ZHRiJyBjb25maWd1cmF0aW9uDQrCoCDCoFRyeWluZyAnZmR0QGFzcGVlZC1hc3QyNjAwLWV2Yi5k
dGInIGZkdCBzdWJpbWFnZQ0KwqAgwqAgwqBEZXNjcmlwdGlvbjrCoCBGbGF0dGVuZWQgRGV2aWNl
IFRyZWUgYmxvYg0KwqAgwqAgwqBUeXBlOsKgIMKgIMKgIMKgIMKgRmxhdCBEZXZpY2UgVHJlZQ0K
wqAgwqAgwqBDb21wcmVzc2lvbjrCoCB1bmNvbXByZXNzZWQNCsKgIMKgIMKgRGF0YSBTdGFydDrC
oCDCoDB4MjA0NWQ0MDgNCsKgIMKgIMKgRGF0YSBTaXplOsKgIMKgIDM0ODUyIEJ5dGVzID0gMzQg
S2lCDQrCoCDCoCDCoEFyY2hpdGVjdHVyZTogQVJNDQrCoCDCoCDCoEhhc2ggYWxnbzrCoCDCoCBz
aGEyNTYNCsKgIMKgIMKgSGFzaCB2YWx1ZTrCoCDCoGE5YmNmMmEzNGVhNzQ3N2QyYzVmODZlYzc5
M2I2NTllY2NlMDc1NTRkZWU1ODk3NDYwMTk4ZjUxM2VkZTRkMGINCsKgIMKgVmVyaWZ5aW5nIEhh
c2ggSW50ZWdyaXR5IC4uLiBzaGEyNTYrIE9LDQrCoCDCoEJvb3RpbmcgdXNpbmcgdGhlIGZkdCBi
bG9iIGF0IDB4MjA0NWQ0MDgNCsKgIMKgTG9hZGluZyBLZXJuZWwgSW1hZ2UgLi4uIE9LDQrCoCDC
oExvYWRpbmcgUmFtZGlzayB0byA4Y2U1NzAwMCwgZW5kIDhjZjYwODc4IC4uLiBPSw0KwqAgwqBM
b2FkaW5nIERldmljZSBUcmVlIHRvIDhjZTRiMDAwLCBlbmQgOGNlNTY4MjMgLi4uIE9LDQpmZHRf
cm9vdDogRkRUX0VSUl9CQURNQUdJQw0KRVJST1I6IHJvb3Qgbm9kZSBzZXR1cCBmYWlsZWQNCsKg
LSBtdXN0IFJFU0VUIHRoZSBib2FyZCB0byByZWNvdmVyLg0KDQpGRFQgY3JlYXRpb24gZmFpbGVk
ISBoYW5naW5nLi4uIyMjIEVSUk9SICMjIyBQbGVhc2UgUkVTRVQgdGhlIGJvYXJkICMjIw0KDQoN
Cg0KDQoNClJlZ2FyZHMsDQpWaW5vdGggS3VtYXIgUksNCg0KT24gRnJpLCA1IEZlYiAyMDIxIGF0
IDA3OjU3LCBUcm95IExlZSA8bWFpbHRvOnRyb3lfbGVlQGFzcGVlZHRlY2guY29tPiB3cm90ZToN
CkhpIFZpbm90aGt1bWFyLA0KwqANClBsZWFzZSByZWZlciB0byB0aGUgZm9sbG93aW5nIHR3byBj
aGFuZ2VzIGluIEdlcnJpdDoNCuKAoiBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6
L2Mvb3BlbmJtYy9tZXRhLXBob3NwaG9yLysvMzkzNDMNCuKAoiBodHRwczovL2dlcnJpdC5vcGVu
Ym1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9tZXRhLWFzcGVlZC8rLzM5MzQ0DQrCoA0KVGhhbmtz
LA0KVHJveSBMZWUNCsKgDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdHJveV9sZWU9
bWFpbHRvOmFzcGVlZHRlY2guY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBWSU5P
VEhLVU1BUiBSSw0KU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDQsIDIwMjEgODoyOCBQTQ0KVG86
IG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IGV2Yi1hc3QyNjAwOiBH
ZXR0aW5nIHNvbWUgYnVpbGQgZXJyb3JzIC0gJ3UtYm9vdC5iaW4nIGlzIHRvbyBsYXJnZSEnDQrC
oA0KSGksDQrCoA0KSSdtIHRyeWluZyB0byBidWlsZCBmb3IgZXZiLWFzdDI2MDAgcGxhdGZvcm0s
IGJ1dCBpdCBkb2Vzbid0IHN1Y2NlZWQuIFBsZWFzZSBoZWxwLg0KwqANCkJ1aWxkIGNvbW1hbmQ6
IChmcmVzaCBjaGVja291dCBhbmQgYnVpbGQpDQpURU1QTEFURUNPTkY9bWV0YS1ldmIvbWV0YS1l
dmItYXNwZWVkL21ldGEtZXZiLWFzdDI2MDAvY29uZiAuIG9wZW5ibWMtZW52DQpiaXRiYWtlIG9i
bWMtcGhvc3Bob3ItaW1hZ2UNCsKgDQpCcmFuY2ggZGV0YWlsczoNCmNvbW1pdCA3ZGMyZjdhMzhk
Y2NiM2Q4N2E5Yjc5ZDBhNjZiMjVkYTEwMjdhNzJmwqANCsKgDQrCoA0KRXJyb3IgTG9nOg0KTG9h
ZGluZyBjYWNoZTogMTAwJSB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgRVRBOiDCoC0tOi0t
Oi0tDQpMb2FkZWQgMCBlbnRyaWVzIGZyb20gZGVwZW5kZW5jeSBjYWNoZS4NClBhcnNpbmcgcmVj
aXBlczogMTAwJSB8IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjfCBUaW1lOiAwOjAwOjQ0DQpQYXJzaW5nIG9mIDI0MjQgLmJiIGZpbGVzIGNvbXBs
ZXRlICgwIGNhY2hlZCwgMjQyNCBwYXJzZWQpLiAzNjgzIHRhcmdldHMsIDM2MiBza2lwcGVkLCAw
IG1hc2tlZCwgMCBlcnJvcnMuDQpXQVJOSU5HOiBObyBiYiBmaWxlcyBpbiBkZWZhdWx0IG1hdGNo
ZWQgQkJGSUxFX1BBVFRFUk5fbWV0YS1ldmItYXN0MjYwMCAnXi9ob21lL3Zpbm90aC9wcm9qZWN0
L29wZW5ibWMvbWV0YS1ldmIvbWV0YS1ldmItYXNwZWVkL21ldGEtZXZiLWFzdDI2MDAvJw0KTk9U
RTogUmVzb2x2aW5nIGFueSBtaXNzaW5nIHRhc2sgcXVldWUgZGVwZW5kZW5jaWVzDQoNCkJ1aWxk
IENvbmZpZ3VyYXRpb246DQpCQl9WRVJTSU9OIMKgIMKgIMKgIMKgIMKgID0gIjEuNDkuMCINCkJV
SUxEX1NZUyDCoCDCoCDCoCDCoCDCoCDCoD0gIng4Nl82NC1saW51eCINCk5BVElWRUxTQlNUUklO
RyDCoCDCoCDCoD0gInVidW50dS0yMC4wNCINClRBUkdFVF9TWVMgwqAgwqAgwqAgwqAgwqAgPSAi
YXJtLW9wZW5ibWMtbGludXgtZ251ZWFiaSINCk1BQ0hJTkUgwqAgwqAgwqAgwqAgwqAgwqAgwqA9
ICJldmItYXN0MjYwMCINCkRJU1RSTyDCoCDCoCDCoCDCoCDCoCDCoCDCoCA9ICJvcGVuYm1jLXBo
b3NwaG9yIg0KRElTVFJPX1ZFUlNJT04gwqAgwqAgwqAgPSAiMC4xLjAiDQpUVU5FX0ZFQVRVUkVT
IMKgIMKgIMKgIMKgPSAiYXJtIGFybXY3YSB2ZnAgdmZwdjRkMTYgY2FsbGNvbnZlbnRpb24taGFy
ZCINClRBUkdFVF9GUFUgwqAgwqAgwqAgwqAgwqAgPSAiaGFyZCINCm1ldGEgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgDQptZXRhLXBva3kgwqAgwqAgwqAgwqAgwqAgwqANCm1ldGEtb2UgwqAgwqAg
wqAgwqAgwqAgwqAgwqANCm1ldGEtbmV0d29ya2luZyDCoCDCoCDCoA0KbWV0YS1weXRob24gwqAg
wqAgwqAgwqAgwqANCm1ldGEtcGhvc3Bob3IgwqAgwqAgwqAgwqANCm1ldGEtYXNwZWVkIMKgIMKg
IMKgIMKgIMKgDQptZXRhLWV2Yi1hc3QyNjAwIMKgIMKgID0gIm1hc3Rlcjo3ZGMyZjdhMzhkY2Ni
M2Q4N2E5Yjc5ZDBhNjZiMjVkYTEwMjdhNzJmIg0KDQpJbml0aWFsaXNpbmcgdGFza3M6IDEwMCUg
fCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjI3wgVGlt
ZTogMDowMDowMw0KU3N0YXRlIHN1bW1hcnk6IFdhbnRlZCAxMzc4IEZvdW5kIDkzOSBNaXNzZWQg
NDM5IEN1cnJlbnQgMCAoNjglIG1hdGNoLCAwJSBjb21wbGV0ZSkNCk5PVEU6IEV4ZWN1dGluZyBU
YXNrcw0KV0FSTklORzogbGludXgtYXNwZWVkLTUuOC4xNytnaXRBVVRPSU5DKzNjYzk1YWU0MDct
cjAgZG9fa2VybmVsX21ldGFkYXRhOiBGZWF0dXJlICdwaG9zcGhvci1ncGlvLWtleXMnIG5vdCBm
b3VuZCwgYnV0IEtFUk5FTF9EQU5HTElOR19GRUFUVVJFU19XQVJOX09OTFkgaXMgc2V0DQpXQVJO
SU5HOiBsaW51eC1hc3BlZWQtNS44LjE3K2dpdEFVVE9JTkMrM2NjOTVhZTQwNy1yMCBkb19rZXJu
ZWxfbWV0YWRhdGE6IFRoaXMgbWF5IGNhdXNlIHJ1bnRpbWUgaXNzdWVzLCBkcm9wcGluZyBmZWF0
dXJlIGFuZCBhbGxvd2luZyBjb25maWd1cmF0aW9uIHRvIGNvbnRpbnVlDQpXQVJOSU5HOiBsaW51
eC1hc3BlZWQtNS44LjE3K2dpdEFVVE9JTkMrM2NjOTVhZTQwNy1yMCBkb19rZXJuZWxfbWV0YWRh
dGE6IEZlYXR1cmUgJ3Bob3NwaG9yLXZsYW4nIG5vdCBmb3VuZCwgYnV0IEtFUk5FTF9EQU5HTElO
R19GRUFUVVJFU19XQVJOX09OTFkgaXMgc2V0DQpXQVJOSU5HOiBsaW51eC1hc3BlZWQtNS44LjE3
K2dpdEFVVE9JTkMrM2NjOTVhZTQwNy1yMCBkb19rZXJuZWxfbWV0YWRhdGE6IFRoaXMgbWF5IGNh
dXNlIHJ1bnRpbWUgaXNzdWVzLCBkcm9wcGluZyBmZWF0dXJlIGFuZCBhbGxvd2luZyBjb25maWd1
cmF0aW9uIHRvIGNvbnRpbnVlDQpXQVJOSU5HOiBsaW51eC1hc3BlZWQtNS44LjE3K2dpdEFVVE9J
TkMrM2NjOTVhZTQwNy1yMCBkb19rZXJuZWxfY29uZmlnbWU6IEZlYXR1cmUgJ3Bob3NwaG9yLWdw
aW8ta2V5cycgbm90IGZvdW5kLCBidXQgS0VSTkVMX0RBTkdMSU5HX0ZFQVRVUkVTX1dBUk5fT05M
WSBpcyBzZXQNCldBUk5JTkc6IGxpbnV4LWFzcGVlZC01LjguMTcrZ2l0QVVUT0lOQyszY2M5NWFl
NDA3LXIwIGRvX2tlcm5lbF9jb25maWdtZTogVGhpcyBtYXkgY2F1c2UgcnVudGltZSBpc3N1ZXMs
IGRyb3BwaW5nIGZlYXR1cmUgYW5kIGFsbG93aW5nIGNvbmZpZ3VyYXRpb24gdG8gY29udGludWUN
CldBUk5JTkc6IGxpbnV4LWFzcGVlZC01LjguMTcrZ2l0QVVUT0lOQyszY2M5NWFlNDA3LXIwIGRv
X2tlcm5lbF9jb25maWdtZTogRmVhdHVyZSAncGhvc3Bob3Itdmxhbicgbm90IGZvdW5kLCBidXQg
S0VSTkVMX0RBTkdMSU5HX0ZFQVRVUkVTX1dBUk5fT05MWSBpcyBzZXQNCldBUk5JTkc6IGxpbnV4
LWFzcGVlZC01LjguMTcrZ2l0QVVUT0lOQyszY2M5NWFlNDA3LXIwIGRvX2tlcm5lbF9jb25maWdt
ZTogVGhpcyBtYXkgY2F1c2UgcnVudGltZSBpc3N1ZXMsIGRyb3BwaW5nIGZlYXR1cmUgYW5kIGFs
bG93aW5nIGNvbmZpZ3VyYXRpb24gdG8gY29udGludWUNCldBUk5JTkc6IG9ibWMtcGhvc3Bob3It
c3lzZC0xLjAtcjEgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IG9ibWMtcGhvc3Bob3Itc3lzZDog
U1JDX1VSSSB1c2VzIFBOIG5vdCBCUE4gW3NyYy11cmktYmFkXQ0KRVJST1I6IG9ibWMtcGhvc3Bo
b3ItaW1hZ2UtMS4wLXIwIGRvX2dlbmVyYXRlX3N0YXRpYzogSW1hZ2UgJy9ob21lL3Zpbm90aC9w
cm9qZWN0L29wZW5ibWMvYnVpbGQvdG1wL2RlcGxveS9pbWFnZXMvZXZiLWFzdDI2MDAvdS1ib290
LmJpbicgaXMgdG9vIGxhcmdlIQ0KRVJST1I6IExvZ2ZpbGUgb2YgZmFpbHVyZSBzdG9yZWQgaW46
IC9ob21lL3Zpbm90aC9wcm9qZWN0L29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvZXZiX2FzdDI2MDAt
b3BlbmJtYy1saW51eC1nbnVlYWJpL29ibWMtcGhvc3Bob3ItaW1hZ2UvMS4wLXIwL3RlbXAvbG9n
LmRvX2dlbmVyYXRlX3N0YXRpYy4yMTc2Nzk2DQpFUlJPUjogVGFzayAoL2hvbWUvdmlub3RoL3By
b2plY3Qvb3BlbmJtYy9tZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhvc3Bob3IvaW1hZ2VzL29ibWMt
cGhvc3Bob3ItaW1hZ2UuYmI6ZG9fZ2VuZXJhdGVfc3RhdGljKSBmYWlsZWQgd2l0aCBleGl0IGNv
ZGUgJzEnDQpOT1RFOiBUYXNrcyBTdW1tYXJ5OiBBdHRlbXB0ZWQgNDA0MSB0YXNrcyBvZiB3aGlj
aCAyNjgwIGRpZG4ndCBuZWVkIHRvIGJlIHJlcnVuIGFuZCAxIGZhaWxlZC4NCg0KU3VtbWFyeTog
MSB0YXNrIGZhaWxlZDoNCsKgIC9ob21lL3Zpbm90aC9wcm9qZWN0L29wZW5ibWMvbWV0YS1waG9z
cGhvci9yZWNpcGVzLXBob3NwaG9yL2ltYWdlcy9vYm1jLXBob3NwaG9yLWltYWdlLmJiOmRvX2dl
bmVyYXRlX3N0YXRpYw0KU3VtbWFyeTogVGhlcmUgd2VyZSAxMCBXQVJOSU5HIG1lc3NhZ2VzIHNo
b3duLg0KU3VtbWFyeTogVGhlcmUgd2FzIDEgRVJST1IgbWVzc2FnZSBzaG93biwgcmV0dXJuaW5n
IGEgbm9uLXplcm8gZXhpdCBjb2RlLg0KwqANCsKgDQrCoA0KUmVnYXJkcywNClZJTk9USEtVTUFS
IFJLDQo=
