Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B313226EE
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 09:12:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlBcc50Kdz3cGd
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 19:12:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=yf7GWgqR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=6811cc6c5=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=yf7GWgqR; 
 dkim-atps=neutral
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DlBcL6hz7z30Ml
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 19:12:33 +1100 (AEDT)
IronPort-SDR: YG+/vbf+OJztmaUtdpJ49ysGpQX1O+Uo/pRDBGuriQnj7E7AekkwWwSf/M/poHRlaG8HFCfWyO
 bheZGBl4j0IA==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 23 Feb 2021 16:12:32 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 23 Feb
 2021 16:12:24 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.56)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Tue, 23 Feb 2021 16:12:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORJGrouAETF2/Pq60OOIygR9+dpsc1W7zy8FCoA6xm6TIbTIAX+IuHgrsrwwDxDXM5EkD7fVqvhHuHhTUU+c+OnfGS9s+LzGbQGPoDdL9gSUh4L5XRVpbxC+sH9uet8I/N+JrqqeQ0jZw5RlJmzZkwhx9m6wgj1mPsibd4+VhgCwdpWNYXd1XQfvOiQ8uO8qqZIfA8GPZRfSWHKWSQW1lpyd/fyvp3zMFL4gFCsh/hPgwY5Uh4DPfQsWUvYj4K6y+r+wcbJ4XKwn4s7mWucT9FNPb+od+nu8jrbCWFEFC+QuozYsjVNY3Nu0fjTb00EElMAxOtRGk4lgTw1vJJrXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ2NO8Uv9gRWcMEhvftpZi84TZdw/Bp2+TKAc8GQvPA=;
 b=R8kvhkK3s6wsFe6dlhPHOR7GFkdvf32fAsADANE5NXyavZDQmXvC6mKP7H/sbmwfNTSrQ5earLf8KnWww/tmOckBxuNKOMKq9yTrdgNWFwvvPWqm+JiPPov2cGXziQd/XXgJEkArTxOBgAptVM3/Pu8kSWoqW3nzQry7FaysFk1PnlNUThU3Z+HVmvFBDq0IcwyalPz7lSxXR4Mz3Rb8o3Tp9/MYzeYbnrrto0HvPr5G6j6l2PZy98QPwm/ghyjqIUh+FD4GZ9X950PzI9ahx52UXOwLoINAfYWjHdt+aU2/590L4IDQ/3fb6TZzuvbZwyKe1k8cjivTCKvlWKILEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ2NO8Uv9gRWcMEhvftpZi84TZdw/Bp2+TKAc8GQvPA=;
 b=yf7GWgqR+tonjJvdtf1tyDts/O56bQbyjlWtoIqJXJ7hbTgNSnJDHojjSXCrdhuDP1GiApCESN5/mLMc6BZJAdHqorhzRlusAx3oA3ibZhX1hI0XWVVzMZTZGpK4+9s8B9+8nsShOePMfvfeI6FJMMJ+z31ruaQEfNlWi5NPafw=
Received: from HK0PR04MB2737.apcprd04.prod.outlook.com (2603:1096:203:5b::20)
 by HK2PR04MB3684.apcprd04.prod.outlook.com (2603:1096:202:30::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Tue, 23 Feb
 2021 08:12:29 +0000
Received: from HK0PR04MB2737.apcprd04.prod.outlook.com
 ([fe80::69e8:9f69:4230:d8b4]) by HK0PR04MB2737.apcprd04.prod.outlook.com
 ([fe80::69e8:9f69:4230:d8b4%6]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 08:12:28 +0000
From: =?utf-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>, Michael Richardson
 <mcr@sandelman.ca>, "jk@ozlabs.org" <jk@ozlabs.org>
Subject: RE: ANSI Escape sequence unexpected output
Thread-Topic: ANSI Escape sequence unexpected output
Thread-Index: AdcFxEtS+fFreU74QjqE13t2aq5KQgAU1HAAAAFKD4AABK/+AADi5ctg
Date: Tue, 23 Feb 2021 08:12:28 +0000
Message-ID: <HK0PR04MB2737BDC541BD24AF0678383EC9809@HK0PR04MB2737.apcprd04.prod.outlook.com>
References: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
 <47e7db9c-f07d-0b27-5e38-328fb6ba3d53@intel.com> <17303.1613669867@localhost>
 <f01d2a0f-7889-0cbf-30c2-6ea411668ea2@intel.com>
In-Reply-To: <f01d2a0f-7889-0cbf-30c2-6ea411668ea2@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09d5fb23-ad42-479f-3993-08d8d7d2c314
x-ms-traffictypediagnostic: HK2PR04MB3684:
x-microsoft-antispam-prvs: <HK2PR04MB3684A1DC7EC2F7756A42FC90C9809@HK2PR04MB3684.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4GpW/Sehoa0Jj0WhRmMkC66+buczf/BZwv1fno+mG/xMMDwhRQcswfusmIlmBsn5djFEdWuRy+LdCGR2ZJfmeiBQZxeJ83udNpiN6+ar/ERWxKsyPn+H9M8vTJVxMnQkb4aZ6/dz+AGTMJtHlh1FzO+mmi7HKOd1F+tiO/r5xM5pVbusTsZLUGtp9eEjpIbbOyosRH5hKamR0/MQpuaeZ5zSpSnPPgY3kZt+Vg1B92Ok0xpxr+rStiobpx9UwwIlhnxcywzdW12vP2cxLWsL9U3SeJf8f/d57kepHIvREx1cTUQcrjsfnx5AZ/jkuAePaVb4ft6RABPLl2hjTdy+wBzLswK+eyiqb52VRIxYUCdjSFG+eyfMWvVCh9pzrVSbDxXyN3dGyu+8360yLnXU/OS5R+7A2mw+JEjyx4vNDAlAhv+3XDZ0hag8NKu6IQna0XfyCwLqf/KJx3WMxEKwEJClkBTjRz74yfairuoj/gVR0j4DYLrMP+NWoRUyEGObRl36Njbo9AzxTCQHQGl2ErNmW7ZEexzNPD4KiWuTeLByKXnagZUDuEn/tfHIFoxFA24naZ0ktrPUN0vFHCmo5mSwUAnelDX7zmXIKnBupRQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2737.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(186003)(478600001)(8936002)(83380400001)(7696005)(26005)(33656002)(66476007)(71200400001)(55016002)(86362001)(85182001)(8676002)(66556008)(5660300002)(110136005)(64756008)(66946007)(2906002)(9686003)(4326008)(76116006)(66446008)(52536014)(966005)(316002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZEJUUXdSK3RiVTNBMTNDZnFxUmcrQnlleW4rMUhmVXNrNFlCK3RVbGw2TENv?=
 =?utf-8?B?MkplOFYxU281eEszb0wvNStvNDFzWk9zdW9vQnY5T1J3dm9HN3ZjRDRzQ1hy?=
 =?utf-8?B?ZzhIOUVvMnpDamJIallKZTl3RFB5UVlxcm5kc044WTNpMFMxbitZc1pWSVJn?=
 =?utf-8?B?N1dlZjVKaVlnb3NNL2p0bWMrQVdLQmtPRTNkYzUwWm14SXVKaXBGSFJGSE8x?=
 =?utf-8?B?aWJTWnhaVUowbzFFREhHWUU5cTVoMGtYVktGRWlkRGtkK2ZpeUhmNmxZeWhp?=
 =?utf-8?B?d2ZkTGFuakVtbG50eGVrYzc2eW4rb0tNUUU1SmpteHdHRHlRZFhsVFJ4Vmts?=
 =?utf-8?B?RG83T3RCS2k5bmpqazVjRjFCdzZmZ0M1cW5JK3J4SDcwUmtjZmlLUkIvOThw?=
 =?utf-8?B?UEJsYkJySDZPRkJhTHNuVkFheDFDZ3NtcUd4NjBOR0VKNS9TczR2S1FWalNs?=
 =?utf-8?B?cUppTnJYcFJRR2JLNVJ6VXp0K0p2NVY1Q2RuOXNncFFjZmNNcFVFSlJaNzkz?=
 =?utf-8?B?dUkwOFE1V2ZNWmxyVFRIYTdJUUhqYlEvMEJQcFQ2Qnd5TmJtVlAzN0FJT1hY?=
 =?utf-8?B?S3pPa09pbk5YaFBJQmkyT1dqeks4Zzc3Y1ZNeEpaL0dCaTNsYTE1SEk2QS9m?=
 =?utf-8?B?OGdIVlpVYTNZR0tTaWRoeEVGWWFKZzZWVkVKNVNNdTZXNytUUzNGNFFaTWNI?=
 =?utf-8?B?RVIyWnM2bnE4dlRERUtRWFdzNkZDYjVrRVVjOHdmZmNLNkJWdHFlczF0R3Zo?=
 =?utf-8?B?WE5EQm5DR1hUZEYraGJMVEZtbUk2T0JOUDRteUNvbDVxd0grbFd4VzBDK09p?=
 =?utf-8?B?MmpOc0x6S2c5K3JQc3FxRUZHQTJ3MkVraUtZQncrRUcrNEZKb3JIWElSYjdo?=
 =?utf-8?B?VHNFSHF3NEJYVEVRUXRlS28wcEFQMTRtc0t0SUxsMDU1YnY2bTFzY2Q2blVP?=
 =?utf-8?B?K2dRRUpHKzQ5c1E3b29ndHRkSVh3Z1h3KzZhRnpLYk9zTGdHSFJiWU5mTks1?=
 =?utf-8?B?MjRISFZVUy85dmFTeHp1QTk1ODBzUUVuZjc3dExYZ1grTkNmdVp3OUNmUnlN?=
 =?utf-8?B?cE0vbWk2QmIrNEF6dkdvTmVwT0xuTVV5TlI3MmFmWXFzSUM1VGZPYnR2N2tR?=
 =?utf-8?B?OG5LcnZxV1RvS3J4V2VVUWE2dU5ndFZ5U1JqR2RUK09LTFdOUlFLVXFzRVpJ?=
 =?utf-8?B?bk1neXdrcFVPRnBCNENFamxnTW5KNEg2SDBTT0k0akx3NFVEdDBpY1Rpck0y?=
 =?utf-8?B?Z1luY3c0NHNmMU5KU2xJZG8yYWZiYW5ad3BVRzZYaWdrOEluSnE4bWhVbENP?=
 =?utf-8?B?YS92ZU93ODJuazI0UDJHZndOZUltVFVxb0MyR1hVQ0JKQTRMT2xVd2h5WG9I?=
 =?utf-8?B?ZFlIUXY3aEU1SGNqOUNaYnplWWdIaVh6dXgzUDRlS3h0Uk5lVlRFTG5rN1RK?=
 =?utf-8?B?T2lab05TbVhhMXpaRm1INzBvMjg0OXBwYWFXdmNab2NvM0dTWGVvVXRHVDJy?=
 =?utf-8?B?dE56RzB0Y3NNN0VnWXNIWDRaTVY0MXRuMTJab0JVOVpQYTNxdHlDWWpmRDNi?=
 =?utf-8?B?WkdmNEozeVZQNWJuV2dBUWpJV21YeTl1VnNEbk5ncGdub2lHYlFaR09Ka0JE?=
 =?utf-8?B?a0dGdlJUS1VuQlZybEsvN04rcEZUcnc4SjVrWnA5cmc0Wm5iQ1pZdC9xU1BQ?=
 =?utf-8?B?OTZyakYrQXBQZWI3ZW9GY01pSy9mR0tTc08vNmErYjQ4aGVlOGdRNzNzMEI0?=
 =?utf-8?Q?0laNBOAIqbuSTwWOuQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2737.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d5fb23-ad42-479f-3993-08d8d7d2c314
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 08:12:28.8152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: et08X20ynayH6fdRek71J0vDIpyfzD85Ar/YksTyQB8kk32NY1pJWgEGjcLMuji91pcNKOz+1ZeiYLUqJbXmHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3684
X-OriginatorOrg: quantatw.com
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

SSBkb24ndCB0aGluayB0aGlzIGlzIGEgcHJvYmxlbSBvZiBkcm9wcGluZyBjaGFyZWN0ZXJzLg0K
VGhlIGVycm9yIHNlZW1zIHRvIG9jY3VyIG9ubHkgYXQgdGhlIGZpcnN0IHRpbWUgYWZ0ZXIgYm9v
dC4NCg0KPiBUaGlzIG1vdGl2YXRlZCBtZSB0byBtZXNzIHdpdGggdGhpcyBhZ2Fpbi4NCj4gRldJ
VywgVGhlIERTUiBjb21tYW5kIGlzIHByZXNlbnQgd2hlbiBJIHJ1biBLZXJtaXQgZnJvbSB3aXRo
aW4gYSBUTXV4IGZyYW1lLg0KPiBUaGlzIGNvZGUsIFtbNDA7MTYyUiwgaXMgcHJlc2VudCB3aGVu
IEkgcnVuIHdpdGhvdXQgVE11eCwgYW5kIGp1c3QgdXNlIA0KPiBLb25zb2xlLg0KPiBCb3RoIHNl
cXVlbmNlcyBhcmUgZW1pdHRlZCBBRlRFUiB0aGUgcGFzc3dvcmQgaGFzIGJlZW4gaW5wdXQsIGFu
ZCBhY2NlcHRlZC4NCg0KPiBQYXNzd29yZDoNCj4gTGFzdCBsb2dpbjogVGh1IEZlYiAxOCAxOTo0
NToyOCBVVEMgMjAyMSBvbiB0dHlTNA0KPiBeW1szOTs4MVJyb290IGF0IGludGVsLW9ibWMNCg0K
PiBVc2luZyAic2V0IHRlcm1pbmFsIHR5cGUgZHVtYiIgZGlkIG5vdCBpbXBhY3QgdGhlIGVtaXNz
aW9uIG9mIHRoZSBFU0MgDQo+IHNlcXVlbmNlLg0KPiBJIGhhdmVuJ3QgZm91bmQgdGhlICJ0dXJu
IHJlc3BvbmRpbmcgb2ZmIiBjb250cm9sIHlldC4NCg0KSSB0aGluayB0aGlzIGlzIG5vdCBsaWtl
IGEgdGVybWluYWwgcHJvYmxlbSwgYnV0IHRoZSBlc2NhcGUgY2hhcmVjdGVyIGlzIG5vdCByZWFk
IGNvcnJlY3RseSBhbmQgdGhlIHJlbWFpbmluZyBzdHJpbmcgaXMgb3V0cHV0IHRvIHN0ZG91dC4g
UGxlYXNlIGNvcnJlY3QgbWUgaWYgdGhlcmUgaXMgYW4gZXJyb3IuDQpJIGhhdmUgZm91bmQgc2lt
aWxhciBjb2RlcyB1bmRlciBsaW51eDoNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2xpbnV4
L2Jsb2IvNTk5ZDdmOTk3OTMwODI5ZjEzZTA1ZDMzMmUzZTdmY2NkODlkMzQwZC9kcml2ZXJzL3R0
eS92dC92dC5jI0wxODI5DQpCdXQgSSB0cmllZCB0byBpbnNlcnQgdGhlIGRlYnVnIGNvZGUgdG8g
dmVyaWZ5IGJ1dCBmb3VuZCB0aGF0IHRoZXkgZG9u4oCZdCBzZWVtIHRvIGJlIHRoZSBjdWxwcml0
Lg0K
