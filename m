Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7643C5F27EF
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 06:10:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgnRl1x9wz3bkh
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 15:10:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=2R+lE7VF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.117.123; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=dylan_hung@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=2R+lE7VF;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2123.outbound.protection.outlook.com [40.107.117.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgnRD1hwGz2xmw
	for <openbmc@lists.ozlabs.org>; Mon,  3 Oct 2022 15:09:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtVxEpz+9fXAToV+Qb792S4+956Vq7n0TiJhoGwLTMZYRDcXxInP3gaUPxF7KF+VFVtvquN/BkDpJ2gjpd+X0srGph4UJooScSWbvHO0CDiSXHlFwzQQQfq0Ae7hqpjYKHw+n4IZsmNQJCxrz8Ku7rVwFIOQiLk2cAE9lSmmWK12E80uJrhN48tndlLwA9xh80irK6GZj6Lj2O9PiXF3nj5u1j13fYqsNAzjq1DuqYJsTX9S6VAXBsEQiPY8w/CWtINvsr9ObkvMCASj4BRoEXTbvHqFdyVsA+F+Jw590thdC4SrgwMHDPUJBNrjrZrlCoZwT5xgGA1PxqzHt6plpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8P6ER8hkQgiT+/avR2+mPj/2xl7Notr7UDe4/l0ISE=;
 b=W1bojbdPxL3s/Lk9Nskaaj2kTvQjW/lawoPXor3X52CafhLnmLyT8Hbe4x9l5qziyC5SPoKd7uhVpvLxlxdrjKUO2mQe6tlaar/MC2yPvKNV+8Epw64Ot0kPhUntTeELo6Md/EtisBuG7a46Bsc7uevl/iZyTvwIqeE97dIjVN6ltSIPxzh7EZtWlb7oHL8zX8DS1yOi07lodXEROLubsorys4YKkMiEGful2Qk+26CT/C3WrTRSUhyy665DcW8a1dgmcb0PLP/UdZBi2P/nNwBV0pk7X5HCXyLeUhTj2304IDcDlk+U/qi4exIogSXgzuq5Wq22N0JqVYkHJJVd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8P6ER8hkQgiT+/avR2+mPj/2xl7Notr7UDe4/l0ISE=;
 b=2R+lE7VF3h4iBKmDV56igU60/7fjwcq0YtViMsaB6faRYvViZMqU6sLA6HrhjYWH/v5bjzxgo2nVaRhSlW4U3cB/ZX90am28eNS/5xYapHWCn7qAQoLaXyx+zPYvm0K4yMAyyNsOm7ZB0pUCxGLTFRJz5daicQ+3YqVOVoeR+PC611IqpdqoEO8MwcfSeTeFfRVnxrwNXfc2urN5+D+jMTeZoqzHodlprNCWiAQyu9xE0OGPtPVVNmnsKh0SUl1Jb30t5fGCRkqjIdmgz6nGhLmBhL2YgnKqWiqa1mJRE3DX8g9U2VgUrwxoQCd1tkEwhCnFDPIHxREuc239LrH/sw==
Received: from HK0PR06MB2834.apcprd06.prod.outlook.com (2603:1096:203:5c::20)
 by PUZPR06MB5474.apcprd06.prod.outlook.com (2603:1096:301:102::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 04:09:22 +0000
Received: from HK0PR06MB2834.apcprd06.prod.outlook.com
 ([fe80::7d28:9007:dcf1:1a30]) by HK0PR06MB2834.apcprd06.prod.outlook.com
 ([fe80::7d28:9007:dcf1:1a30%7]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 04:09:22 +0000
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: Zhang Jian <zhangjian.3032@bytedance.com>, Zev Weiss
	<zev@bewilderbeest.net>
Subject: RE: [Phishing Risk] [External] AST2500 u-boot breakage with
 CONFIG_RAM=y
Thread-Topic: [Phishing Risk] [External] AST2500 u-boot breakage with
 CONFIG_RAM=y
Thread-Index: AQHY1RDmsWzOOzOSqE2Us+TJXzrKZq3435kAgAMc1eA=
Date: Mon, 3 Oct 2022 04:09:22 +0000
Message-ID:  <HK0PR06MB2834AE1581020A5B7CE191839C5B9@HK0PR06MB2834.apcprd06.prod.outlook.com>
References: <Yzda9uALobTbT7B/@hatter.bewilderbeest.net>
 <CA+J-oUuhA_akVPbTp=ARqJOaaFp6j43QakSiyjMiNz8NGpVZYQ@mail.gmail.com>
In-Reply-To:  <CA+J-oUuhA_akVPbTp=ARqJOaaFp6j43QakSiyjMiNz8NGpVZYQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HK0PR06MB2834:EE_|PUZPR06MB5474:EE_
x-ms-office365-filtering-correlation-id: 6dfc4218-1f92-4a3d-061e-08daa4f50d5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /NFYB3QE5hXdBkr3A5LdKI74+uESV2ZBLtFBFPm7hoQ94OdfUK+hHZzMy6V+sl9VgQn7M8sd3mXvBnepnQQ0rn2HcIT5HDkyxzZLp5YtgqRhMj/G8X1LyQwezOp+FMgWG78NywkVd/lvuFMH5fL+YcqRi0SEU0AN8Ol8TX9hs8S+5I8UOCDoyWlFBQoM1RdOrVI4fHuiTDz8ww9+KIwlrwGbNfq3aJE6Ycr0zkkGN8Mk+oVqEDhnU5LvrbaUQm5rLeWBMBAX9sLwM/aWXyC05k0+hL2xDSK9pJFiAjU7yGBE2dNrIHWIjUZ3kree0bxP9dfdud7+lp7eVr1sRX+WJghKCfzkqK2+FfQu6AaU/tIWypA2DihsTl4IPX8Es2vx9wWGQeXQGdjFgQA/tnvVEmot4beZ9w3h/ijoxCeJfm6l4UlUHAq/s2P5FkNu9YiWKRohxK/Nch3ZiooIOowRk/j/EGnDK4LGg3w4NQAp+lVgmyy1bpFH4hxWrQqx6N+iAlrosM2Nq/8WMpm9k+3Edu6E5o9qf82xC/udDsL8wswDAkJhQhBU8LXNTnuCJ0dvRwN5PxLGQesQwanaCHgiqu6zAGJjdu0dgiQtoBKWF1Up55Jgu4oHUFVhbW+G4CpbJvTD3jy2smBMCkH9ttMf/z9lcwZqGDvRCWqH4chO2aIGgpsbxoXau0xAJEGsZWqBFzLq7f2YAatQNwxdvJ3JktDAyhwXXK1Kr0Z2MTVgEF5cJ1EPtDTJ0IrVX19DsVT5QP0tlbEHzYoNFmd7KiPLO8DMTjvVAkNeVZc7WsHt1+Q=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB2834.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(136003)(39840400004)(346002)(396003)(451199015)(9686003)(52536014)(6506007)(8936002)(26005)(5660300002)(64756008)(4326008)(7696005)(66476007)(66556008)(66946007)(66446008)(53546011)(41300700001)(83380400001)(33656002)(76116006)(38070700005)(38100700002)(186003)(122000001)(2906002)(478600001)(86362001)(71200400001)(55016003)(966005)(8676002)(110136005)(54906003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MFhoMkFodW5VY1FGRkN5cng3bmtManlhSUpsdGRXVkMrdlhqNFk0MzgxRVp4?=
 =?utf-8?B?cjRnY21IN2R1QUtURUo3NExQT09ueWVNb2d4S3RmeGVXRXFSbmliVlZPVUEr?=
 =?utf-8?B?L2xmaW56VUFFVUhXS3R6YmNGRVJvR1JqTml0WnkwMTk2K21Gc0pwZ2J6M0VS?=
 =?utf-8?B?K05BbDVvSHZBY1Zva3VSN2ZBWFVoVTJ6RklVQVNXeWJ5QWdMUWhsT2tEZVRJ?=
 =?utf-8?B?T0V4WldabEp2NHMrQU9KcENkcU1Tb1ZIMUp4U3NGamJHWlp2SDdmM2N6VGFH?=
 =?utf-8?B?ay9vNVo1QVQ3MGtWdzI5UjVqcXc0RER3eEdheGtHeEl2YU9XaFBMYmpqR2RM?=
 =?utf-8?B?RGtxM0VQeThxM2cxa1VabldXMk4wNnMrZnFPUkNsaFpNdDVRQzFBemhDMG9P?=
 =?utf-8?B?NXloVDFReXhnZ0Nrc2JVR1RuMUNPVEV6SFJCN0J2K3pmUUxKVjMxNktlQ1NU?=
 =?utf-8?B?ZEtxdmxzeTlVMm5uZFljTWxqZTl5MU5XWTFqWjQ1K1JiZnZVdjdoOHE0L0U0?=
 =?utf-8?B?MW0rVDdaRWl1NzFPOFZaMzFpcVdCN2Y5N3dkcU9wRUt4eHBXWCtRL2FoT1pD?=
 =?utf-8?B?dC95b2ZCbm8yYlRYTmU2RzJLaVoyZFZQREpLOGkrellZeFpidlV6YWJxY2V4?=
 =?utf-8?B?b3ZaUGhiWTZaRVF5TWxIeFQzckNQc0pzSEZkK3JIbmhpNWJZVmVKc3d2RmFw?=
 =?utf-8?B?dlFDL1BCQkpyRFpYSXBUS1YzSUYxUS9xbiswaFEyczl0NkRSTnFZQVEzNk5T?=
 =?utf-8?B?MVdMbHIvU3hPbG1zN2pxY0tSczRhcWJ5OUFhZTBXME5lZ0lKZ2E3cWh4TUUy?=
 =?utf-8?B?VGN4WFZ4NUZnR0txdTZhcjA3LzFnY2MzWlVyVzlqUnkyNFNCOThrdDZoaWVP?=
 =?utf-8?B?bWJ2K1VOY1VMeHZWdmlrZGE2RnhNeG9pcENyN1pSYVhNMEY2VlU3TDZ2OGRp?=
 =?utf-8?B?UlhOb0Zhb1pBOTIzbDJMeWFxSzdjV0lURWRFMjZwVFJ5dkFtR0x6RVdRVVl1?=
 =?utf-8?B?NTdBeEcwRkdoam9BMjJBd1RWckpKRGdoQ2x6VlY4elduUGhOTmFGSTlTcUgw?=
 =?utf-8?B?Qkl5L3hNNkwxMHNuTzFzcjJLc0dJMDY2SDJqUVZGaWJtQkljcnhKei9NRkF0?=
 =?utf-8?B?Sjc5K096TzBuQ3lxRUxvS1FLdSthTkVnanhxaWUvV0tYL0k4alg4dGhXWU84?=
 =?utf-8?B?TjM2YmorQUNJZXAwemJpcFliYnU2THlHeHRjWlNCcmJVV3BqUkl1anRLT0ls?=
 =?utf-8?B?bkZLMmg4T25kbWpRclpmdGZmSXlmUGpFSlB2dDk1V0g3M3kwODhZd3BhNUk1?=
 =?utf-8?B?VXUrNEFPTnhSZkljZmhSeUwxSmJqZUl6ZEd1bXZwanVBS2wxMHBNc1A5dkJY?=
 =?utf-8?B?dXFiL2RaNUluWWc0S282Tkx0NnhEcmNqUDduUnNPVTZDWVJ4alFyVGRxc20y?=
 =?utf-8?B?VHVTa0RBL0ZLRzJQTUEzRGVmejcrTTRZc0hqUlFWL25JOS96amFLREJlU2lk?=
 =?utf-8?B?TDJicVpZTnNVYTRUUmxVTzJ1UVl6dDY3VFZvckRGVVFUbVVKdnVKaURNV21h?=
 =?utf-8?B?OUJna0ZEYUJobEc2NTA3Y1VvRzVwYWl6T2hKeG5lWUlQeXRLd0gvdkgxbTZT?=
 =?utf-8?B?ZUo3VFI5cXR5R0VNNnpWZy9ndFRwU3BFMkN4STJtY0FVbFMzQ055akpFUGEw?=
 =?utf-8?B?YysxdkpYU3ZueGNlNHVxNnBkcHAwcDF4UE9vZWliOUpZbFZyTlNGOEYwVXZF?=
 =?utf-8?B?bytZYTh4dTAyYTVUZG9RcXhEK3dHQi9rcWRTMXVYRVE5ODZZdGxRZS8xQmcw?=
 =?utf-8?B?QUYvYmFCWjVZMkl6UWxvS1MrQ3FRRVdnZytkcENZUlhzYVo0a2ZLZW5taU1s?=
 =?utf-8?B?Vi8rU0d3OFRyNXdlajAwZWQ1aWhCYnEveUFyK25TRzg1ODdpTGJwbDdWU3Uz?=
 =?utf-8?B?YlVEc0VyNHMySnFYdVkvSWRvSGQxT3ZBZXdDOXJ4Y0hkdmF4OTVkOCtvdzg1?=
 =?utf-8?B?dVlraTcwNnpmZk5mMUxqNldJaUEzZEFQNFJ4dm1YTEJqRVh1YUdlZXVhN0Jz?=
 =?utf-8?B?OTFscjR4L1A0bmZoNlJtZ3FWRnc5SFEyRC9MckVubU5ZQnRpSkt2NUU0OGpT?=
 =?utf-8?B?SHBscXc1T0lQTGlpbTR1a2FhSFpWL1RGZ2JNWmJMRWlsS3ZGUzhKS1NrV3du?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2834.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfc4218-1f92-4a3d-061e-08daa4f50d5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 04:09:22.4020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HlXcJl1ugpLsmWziBEhX97WW5lA75FeOJKivC+VSgna2Nkh49C7fvAq9G6WUJ03WkMFLJU/uRDhLu1vLJ1prNVPxOdiAi1ESuUfmRX+EJKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5474
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
Cc: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ryan Chen <ryan_chen@aspeedtech.com>, ChiaWei Wang <chiawei_wang@aspeedtech.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgWmV2LCBaaGFuZywNCg0KQXNwZWVkIHJlY29tbWVuZHMgdXNpbmcgIkNPTkZJR19SQU09biIg
b24gQVNUMjUwMCBzaW5jZSBwbGF0Zm9ybS5TIGlzIGNyZWF0ZWQgYnkgQXNwZWVkLg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFpoYW5nIEppYW4gW21haWx0bzp6aGFu
Z2ppYW4uMzAzMkBieXRlZGFuY2UuY29tXQ0KPiBTZW50OiBTYXR1cmRheSwgT2N0b2JlciAxLCAy
MDIyIDExOjIxIEFNDQo+IFRvOiBaZXYgV2Vpc3MgPHpldkBiZXdpbGRlcmJlZXN0Lm5ldD4NCj4g
Q2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5p
ZC5hdT47IER5bGFuDQo+IEh1bmcgPGR5bGFuX2h1bmdAYXNwZWVkdGVjaC5jb20+OyBDaGlhV2Vp
IFdhbmcNCj4gPGNoaWF3ZWlfd2FuZ0Bhc3BlZWR0ZWNoLmNvbT47IFJ5YW4gQ2hlbg0KPiA8cnlh
bl9jaGVuQGFzcGVlZHRlY2guY29tPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4NCj4g
U3ViamVjdDogUmU6IFtQaGlzaGluZyBSaXNrXSBbRXh0ZXJuYWxdIEFTVDI1MDAgdS1ib290IGJy
ZWFrYWdlIHdpdGgNCj4gQ09ORklHX1JBTT15DQo+IA0KPiBIaSBaZXYsDQo+IA0KPiBJIGhhZCBz
b21lIHNpbWlsYXIgcXVlc3Rpb25zIGFib3V0IHRoaXMgLg0KPiANCj4gT24gU2F0LCBPY3QgMSwg
MjAyMiBhdCA1OjA5IEFNIFpldiBXZWlzcyA8emV2QGJld2lsZGVyYmVlc3QubmV0PiB3cm90ZToN
Cj4gPg0KPiA+IEhlbGxvIHUtYm9vdC9Bc3BlZWQgZm9sa3MsDQo+ID4NCj4gPiBJIHJlY2VudGx5
IHNldCBhYm91dCBnZXR0aW5nIGUzYzI0NmQ0aSBzd2l0Y2hlZCBvdmVyIHRvDQo+ID4gdS1ib290
LWFzcGVlZC1zZGsgZnJvbSB0aGUgb2xkIHUtYm9vdCBicmFuY2gsIGJ1dCBhZnRlciBidWlsZGlu
ZyBhbmQNCj4gPiBpbnN0YWxsaW5nIGl0IEkgcmFuIGludG8gc29tZSBvZGQgbWlzYmVoYXZpb3Iu
DQo+ID4NCj4gPiBJdCdzIG5vdCBlbnRpcmVseSBjb25zaXN0ZW50IC0tIHNvbWV0aW1lcyB0aGUg
a2VybmVsIGhhbmQtb2ZmIGdvZXMNCj4gPiBhbHJpZ2h0IGJ1dCB0aGVuIHRoZSBrZXJuZWwncyBi
b290IHNlcXVlbmNlIGhhbmdzIGEgZmV3IHNlY29uZHMgaW4sDQo+IExvYWQgdGhlIGtlcm5lbCBp
cyBzbG93LCB3aWxsIGNhdXNlIG15IDIyJ3Mgd2F0Y2hkb2cgdGltZW91dC4NCj4gPiBzb21ldGlt
ZXMgaXQgaGFuZ3MgYmVmb3JlIEkgZ2V0IGFueSBrZXJuZWwgY29uc29sZSBvdXRwdXQgYXQgYWxs
LCBhbmQNCj4gSSBkaXNhYmxlZCB0aGUgd2F0Y2hkb2csIGFuZCBhbHdheXMgaGFuZyBpbiB0aGUg
a2VybmVsLg0KPiBbICAgIDIuMzgyMDQ2XSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQ6IFJl
YWQgTUFDIGFkZHJlc3MNCj4gMmU6Mzg6OWU6MjQ6YjA6N2MgcA0KPiBbICAgIDIuMzg5OTY4XSBm
dGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQ6IFVzaW5nIE5DU0kgaW50ZXJmYWNlDQo+IFsgICAg
Mi4zOTc3MjFdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBpcnEgMjAsIG1hcHBl
ZCBhdA0KPiAocHRydmFsKQ0KPiBbICAgIDIuNDA1MjI0XSBmdGdtYWMxMDAgMWU2ODAwMDAuZXRo
ZXJuZXQ6IFJlYWQgTUFDIGFkZHJlc3MNCj4gZDI6OGE6ZDQ6Yjg6MjY6ZGENCj4gPiBzb21ldGlt
ZXMgSSBlbmQgdXAgd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yIG1lc3NhZ2UgZnJvbSB1LWJvb3Qg
YXMgaXQNCj4gPiBsb2FkcyB0aGUga2VybmVsIEZJVCBpbWFnZToNCj4gPg0KPiA+ICAgIGZkdF9m
aW5kX29yX2FkZF9zdWJub2RlOiBjaG9zZW46IEZEVF9FUlJfQkFEU1RSVUNUVVJFDQo+ID4gICAg
RVJST1I6IC9jaG9zZW4gbm9kZSBjcmVhdGUgZmFpbGVkDQo+ID4gICAgIC0gbXVzdCBSRVNFVCB0
aGUgYm9hcmQgdG8gcmVjb3Zlci4NCj4gPg0KPiA+ICAgIEZEVCBjcmVhdGlvbiBmYWlsZWQhIGhh
bmdpbmcuLi4jIyMgRVJST1IgIyMjIFBsZWFzZSBSRVNFVCB0aGUgYm9hcmQNCj4gPiAjIyMNCj4g
Pg0KPiA+IEFkZGl0aW9uYWxseSwgaWYgSSB0cnkgdG8gYm9vdCBhIEZJVCBpbWFnZSBsb2FkZWQg
dmlhIFRGVFAgSQ0KPiA+IGNvbnNpc3RlbnRseSBnZXQgY2hlY2tzdW0tbWlzbWF0Y2ggZXJyb3Jz
IG9uIHRoZSBrZXJuZWwgc3ViaW1hZ2UNCj4gPiBwb3J0aW9uICh0aG91Z2ggdGhlIGV4YWN0IHNh
bWUgRklUIGltYWdlIGxvYWRlZCBmcm9tIGZsYXNoIHBhc3NlcyB0aGF0DQo+IGNoZWNrKS4NCj4g
Pg0KPiA+IEkgd2Fzbid0IGFibGUgdG8gcmVwcm9kdWNlIGFueSBtaXNiZWhhdmlvciBpbiBxZW11
LCB1bmZvcnR1bmF0ZWx5Lg0KPiA+DQo+ID4gSSBoYWQgcHJldmlvdXNseSB0ZXN0ZWQgdGhlIDIw
MTkuMDQgdS1ib290IGJyYW5jaCBvbiB0aGlzIHBsYXRmb3JtIGFuZA0KPiA+IG5vdCBoaXQgYW55
IHByb2JsZW1zIGxpa2UgdGhpcywgc28gSSBzdGFydGVkIGJpc2VjdGluZyBiZXR3ZWVuIHRoZQ0K
PiA+IHZlcnNpb24gdGhhdCBoYWQgd29ya2VkIGJlZm9yZSBhbmQgdGhlIGN1cnJlbnQgdmVyc2lv
biwgd2hpY2ggbGFuZGVkDQo+ID4gbWUgb24gSm9lbCdzIHJlY2VudCBwYXRjaCBhZGRpbmcgQ09O
RklHX1JBTT15IHRvIHRoZSBldmItYXN0MjUwMA0KPiA+IGRlZmNvbmZpZyAoY29tbWl0IDA1NDVk
NzMyNWZmMGNiMWE3N2RjNmY4MDA3Zjc0ZjQxNTg0MGZkOTApLiAgSQ0KPiA+IGNvbmZpcm1lZCB0
aGF0IHNldHRpbmcgQ09ORklHX1JBTT1uIGdldHMgdGhpbmdzIHdvcmtpbmcgbm9ybWFsbHkgYWdh
aW4uDQo+ID4NCj4gTWUgdG9vLg0KPiANCj4gPiBMb29raW5nIGludG8gdGhlIGNvZGUgdGhhdCBD
T05GSUdfUkFNPXkgZW5hYmxlcywgSSBhZGRlZCBzb21lIGRlYnVnDQo+ID4gcHJpbnRzIHRvIGFy
Y2gvYXJtL21hY2gtYXNwZWVkL2FzdDI1MDAvYm9hcmRfY29tbW9uLmMgYW5kIHZlcmlmaWVkDQo+
ID4gdGhhdCB0aGUgZHJhbV9pbml0KCkgcm91dGluZSB3YXMgc2V0dGluZyBnZC0+cmFtX3NpemUg
dG8gdGhlIHNhbWUNCj4gPiB2YWx1ZSBpbiBib3RoIGNhc2VzLiAgSG93ZXZlciwgSSBub3RpY2Vk
IHRoZXJlJ3MgYWxzbyBvbmUgaW5zdHJ1Y3Rpb24NCj4gPiBpbiBwbGF0Zm9ybS5TIHRoYXQncyBp
bmNsdWRlZCB3aGVuIENPTkZJR19SQU0gaXMgZW5hYmxlZCBbMV0uICBNeQ0KPiA+IHJlY29sbGVj
dGlvbiBvZiBBUk0gYXNzZW1ibHkgaXMgZmFpcmx5IHJ1c3R5LCBidXQgSSBiZWxpZXZlIHRoYXQn
cw0KPiA+IGp1c3QgYW4gZWFybHkgcmV0dXJuIHNob3J0LWNpcmN1aXRpbmcgdGhlIHJlc3Qgb2Yg
dGhlIGluaXRpYWxpemF0aW9uDQo+ID4gY29kZSBpbiB0aGF0IHJvdXRpbmUsIHBlcmhhcHMgd2l0
aCB0aGUgaW50ZW50IHRoYXQgdGhhdCB3b3JrIHdpbGwgZ2V0DQo+ID4gdGFrZW4gY2FyZSBvZiBi
eSBDIGNvZGUgaW4gdGhlIEFzcGVlZCBSQU0gZHJpdmVyIGluc3RlYWQ/ICBJbiBhbnkNCg0KWWVz
LCB0aGF0IGluc3RydWN0aW9uIGlzIGludGVuZGVkIHRvIGJ5cGFzcyB0aGUgZHJhbSBpbml0aWFs
aXphdGlvbiBpbiBwbGF0Zm9ybS5TDQoNCj4gPiBjYXNlLCBJIGV4cGVyaW1lbnRlZCB3aXRoIGxl
YXZpbmcgQ09ORklHX1JBTT15IGJ1dCByZW1vdmluZyBqdXN0IHRoYXQNCj4gPiBpbnN0cnVjdGlv
biwgYW5kIGl0IHNlZW1zIHRvIHJlc29sdmUgdGhlIHByb2JsZW1zIEkgd2FzIHNlZWluZyAtLSBz
bw0KPiA+IGlmIG15IGludGVycHJldGF0aW9uIGRvZXMgbWF0Y2ggdGhlIGFjdHVhbCBpbnRlbnQs
IGl0IHNlZW1zIGxpa2UNCj4gPiB0aGVyZSdzIHNvbWUgZGlzY3JlcGFuY3kgYmV0d2VlbiB0aGUg
aW5pdGlhbGl6YXRpb24gZG9uZSBpbiB0aGUgQyBjb2RlDQo+ID4gYW5kIHRoZSBhc3NlbWJseSBj
b2RlLCB0aG91Z2ggSSdtIG5vdCBzdXJlIHdoYXQgaXQgbWlnaHQgYmUuICBGb3Igd2hhdA0KDQpU
aGUgQyBjb2RlIHdpbGwgZWFybHkgcmV0dXJuIGlmIGJpdDYgb2Ygc2N1LT52Z2FfaGFuZHNoYWtl
WzBdIGlzIHNldCwgd2hpY2gNCm1lYW5zIHRoZSBkcmFtIGluaXRpYWxpemF0aW9uIGlzIGFjdHVh
bGx5IGRvbmUgYnkgcGxhdGZvcm0uUywgbm90IHRoZSBDIGNvZGUuDQoNCmh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuYm1jL3UtYm9vdC9ibG9iLzhlODM0OTgzZDBhNmI5MjY1Y2VlMTY3NDU2NGIwMTY1
NjU2MzA4ODMvZHJpdmVycy9yYW0vYXNwZWVkL3NkcmFtX2FzdDI1MDAuYyNMNDIyLUw0MzANCmh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3UtYm9vdC9ibG9iLzhlODM0OTgzZDBhNmI5MjY1Y2Vl
MTY3NDU2NGIwMTY1NjU2MzA4ODMvZHJpdmVycy9yYW0vYXNwZWVkL3NkcmFtX2FzdDI1MDAuYyNM
NDYxDQoNCg0KPiA+IGl0J3Mgd29ydGgsIGl0IGRpZCBzZWVtIGxpa2UgdGhlIENPTkZJR19SQU09
biBidWlsZCByYW4gbm90aWNlYWJseSBmYXN0ZXIuDQo+ID4NCj4gPiBEb2VzIGFueW9uZSBoYXZl
IGFueSB0aG91Z2h0cyBhcyB0byB3aGF0IG1pZ2h0IGJlIGdvaW5nIG9uLCBvciB0aXBzIG9uDQo+
ID4gaG93IHRvIGdvIGFib3V0IGRlYnVnZ2luZyBmdXJ0aGVyPw0KPiA+DQo+ID4gVGhhbmtzLA0K
PiA+IFpldg0KPiA+DQo+ID4gWzFdDQo+ID4NCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
dS1ib290L2Jsb2IvOGU4MzQ5ODNkMGE2YjkyNjVjZWUxNjc0NTY0DQo+IGIwMTY1NjU2MzA4ODMv
YXJjaC9hcm0vbWFjaC1hc3BlZWQvYXN0MjUwMC9wbGF0Zm9ybS5TI0w2NjMtTDY2NQ0KPiA+DQoN
Cg0KLS0NCkR5bGFuDQo=
