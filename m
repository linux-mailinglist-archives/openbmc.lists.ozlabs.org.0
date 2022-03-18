Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B681B4DD4FD
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 08:02:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKZhs4TPRz30Nj
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 18:02:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=2F8ha+Hv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::71c;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=2F8ha+Hv; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKZhF08MTz308B;
 Fri, 18 Mar 2022 18:02:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azETypeWP0nVhZINOLpizaje1uRSapex00XtfV6M1blXgxDn0zJKA121PPgDJN73E54pR+/Z/E4lpARB4ssRUEk6NvqTFX1dF0OWMTkq6us7BsT8DVIFKyG/rkCIHGfOtw1IFoa19/t4SNxT/knzKe50YdoYE+RcOmwmhlhdobeu6In3dcLero6+yXfWKds2AxHxyhN61dc/AmGdvl0HpmVQIfcbrNxTBgJYo2Yx6q8PxABVllOztfKXpgMUNbTTvmAHCeLvDjSHmKYl1V1nrq0alqoa5YiuI29PJRSiUPXbVlrQ2lYfGV6PeXMwf0EbWFZhjQBpu4lMl92/uRNQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge46lNRDmh9DiKR38x0Z3qnQFuevqDhhV/WGAL8CYww=;
 b=LM73SP2hKpPsIGqKkz0ruPTV0t3DAz4gw+VLgUDHbQ5hmKdQXMn6yQ3AtcUewqbFgHKYk0F6YotZtCyd0vNkGWvzP2UHI6sBeTzBm+dkMxgfHHJzPfqVgsl2SGRxp4KfYWxOU4gGh8cpKjik4mOCTYdW1CzrxlyPJpSZmFm/kdZ0/PMRNdjbhsRhUgQ9VnZWItD7l+Mww+8WJ0z1gJIkOV6xmxV5jAm8bBJjv0EI4qBZ7zo6lECz8sCcBW5zCsH42U6pGJ8CkU/MAdTwVHP6BKJ25l2zslsKLlF6xmY8u6USraVtkEWORfg4NEb+KMEC6p8I8XwjfpX0rFRmEiZ40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ge46lNRDmh9DiKR38x0Z3qnQFuevqDhhV/WGAL8CYww=;
 b=2F8ha+HvvLniyY1eTpzYJtuwzVtQKbbjv9pX8AxKlA7jda/naeW5N29Ae9f1RK26YpMbdz5MTR5COiPEx5uPbyuC5imar+oiSdE7TxSSk7qMDM56THA9bFlWgsP7cILo2tsxBqkwM7e0MYga7I5jQxy5x8kLNwpuCGdHz5tKVoqe0U8+kjZQ38ptLOwqc6TbIVJWt1h8ZMXXtb8Tr1aGwEEnrGZNc31HXva4HqhN/1gKAdbcrT9h34dcXFJzDQ/qFuZks84WuZjBduBh51wE+bcUvUPZX6VPLrBKRjqL7ZIyzpctik3SgxANhoRT34UCI57Wvn4khhg6ZSxJyDjycg==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by PU1PR06MB2085.apcprd06.prod.outlook.com (2603:1096:803:34::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 06:45:55 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::5c26:40da:6031:916b]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::5c26:40da:6031:916b%7]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 06:45:55 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Yong Li <yong.b.li@linux.intel.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "cyrilbur@gmail.com" <cyrilbur@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH v2 0/2] aspeed: Add LPC mailbox support
Thread-Topic: [PATCH v2 0/2] aspeed: Add LPC mailbox support
Thread-Index: AQHXkxQL6OoMmEqnE0OlhY/vRCAoIKyq4fMAgBse1OA=
Date: Fri, 18 Mar 2022 06:45:55 +0000
Message-ID: <HK0PR06MB3779B539AB32EAF7A87BA5A391139@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210817025848.19914-1-chiawei_wang@aspeedtech.com>
 <000501d82d04$0ffa9870$2fefc950$@linux.intel.com>
In-Reply-To: <000501d82d04$0ffa9870$2fefc950$@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db8a4ec2-cb03-43e1-0a9f-08da08aaf401
x-ms-traffictypediagnostic: PU1PR06MB2085:EE_
x-microsoft-antispam-prvs: <PU1PR06MB2085B6DDE34734E4D799E6D591139@PU1PR06MB2085.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3thJt3wzWMrF8jlw0uG1zhW9cKyknxCskk5wmohnCbJXky4QVK0YCcTFBEdXrl1METGPkkCTiIvEvyOhjBHiGhnn+JNLDBnDPOhFL2+sgz80Ifunj4FdkVtPJHQbMCD18s0juUlU9t8vKJuplZMsd/7Xucb/AGeAJP9cNkNhkd7VSmq/LYUAtGZ8ytqHR0/WPH8bHqKW3pv1Ok1A6W8OFJh45s/NVU+63v+kZi2Y2qOmG4DYpJogK5Ul1dgAvP0XoWEflmBglcslC7b74yhKBeTm82lGwqM1LaPhVitMQNwXg0pbQPqF+8n/GMFbMQSSI9U30gM63823pWo2gF4XAorh/lh0QYCVlTNI0pmkl6NZ1jtZ9zObFX3l8ocno3UQgmnHkeTuraQKWmHza3Dg6PFrdhxhcn5xTSlZJmI4Fl85HQfy6n6zS2B995GBGyTLeSMC3uzddoiIjVGTBRXTPRTYqnw1OKzOUl2wgaxFusUkcWprdxeMDKlSIIY9kZ7/NA08NejnDliKRecFSPz4UZipWP7bL70xuF9DNDVisQqBEi2xD4Ig2L+7N+Ibw2FbhuHtrRX9qFW4qh0EiEPkN7r7pO3RNg8x1O09UDxWK4fpBh263z8pDSO/rJxcug5OatRquFyogRJSfZMPzpclWZSLpXloweFPtCYEOnI1rMAucPWgSCYYe4VYECUVWl9nQ/NZiCH8S8jnowW1t8/rQPG/AJgZ+3nJpaYWGnXLVE0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39850400004)(366004)(376002)(396003)(136003)(346002)(9686003)(110136005)(8936002)(53546011)(316002)(122000001)(508600001)(6506007)(7696005)(86362001)(186003)(8676002)(26005)(83380400001)(38070700005)(66946007)(71200400001)(76116006)(66446008)(4326008)(7416002)(66556008)(66476007)(64756008)(38100700002)(15650500001)(921005)(5660300002)(55016003)(33656002)(52536014)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEVJVTBKRUYvaUN3NGxrU25nckxuRjJJeHdmYkNKUUI4UU1KYUUvaElxdE9z?=
 =?utf-8?B?alVHWmdnNUpYcXlRVWNCZ3FBMmN3RTlwZFhqZm1xc3dCcFlQYTlpRzYvWUJP?=
 =?utf-8?B?ZXFKd3gvRVdjQTVHYklBck1IU3BVK1RDendyK3cxUHU4cDRNR0ZxSXZRM21B?=
 =?utf-8?B?SExMRkc5V2NOY0ZPQUN4dUV0NEFZL1FnNDlXeVhtdEhqaGNkbEpjSVBTOXlF?=
 =?utf-8?B?RFl0bXMxNUFxVGY1OGtHSmJiV29mbTJ5U2t6UGRPVEw0TzZtM0hTQmJiS0dw?=
 =?utf-8?B?d2lrSkZqcnh4Sjl6ajVDazFBcTBjSXZOdjBPb2twVmNWWXJIS1VIcmRrRTBB?=
 =?utf-8?B?MGx1SXJsQjZpcEExQWtKOTQremQvQTJYb3FXTUpTTXkrTk9oSklUZjJqbitD?=
 =?utf-8?B?aXpEbWxOVWlLZTBuL2pXU2lXM0p4ZDVrS3lGV2NZWC9pV0Jkb1JHeEgrU2xp?=
 =?utf-8?B?OGFLLzRJZlJpN29KWTI1UkJKS1RFaHFxQUcwU1E4cGtZeUVoUk9XVnVyZ05u?=
 =?utf-8?B?V0FDV3YwYUVLN2YrSHd3em9VVFVrblVldisrMW1VRFVjYTAvYU92cG5LTDU2?=
 =?utf-8?B?NTdhTjU3RmFReFdSTVJpTWpuYkVKVlVZZUR0NVFMdHhTNUpoMmgvWC9scE9k?=
 =?utf-8?B?WWRBWjJOY2JIb2ZjamhzYWYxQTFkdjFBRjE5MVJwWmsyWjVZMXVCaXV0T25j?=
 =?utf-8?B?c2pHWGZPNFdvZXE2b2h0NDl0Mlk4MFQ1SEJCSk9LTkpLRTN6RXlZaTArdTJz?=
 =?utf-8?B?aldrc1pwRGJhdkVOay9NclN3dTdyV1lnSVZRR3ZvaFhnRnZrWjh4L3VFMkRU?=
 =?utf-8?B?aWsvVm95WVh5QWNENVFBbElqT1NDTy9DWlRNWnU3Z0pGWXBEa203Ym5JN1ZC?=
 =?utf-8?B?MHMwWUxTbTVST2c2blN5Q1FuYmlYWEtSRmE2eVEzMStGeFUyWWRmeHdGaXhQ?=
 =?utf-8?B?aFdhMkZTZ0w2ZG52T2ViS3Q2dVJGS1NSYzFScTQ4cW95dmpsMXhERkxDTGZH?=
 =?utf-8?B?eG16eTdpNVQxbExYc21tZlpqcVVhTnpmaG1NZzJUYzh3SE9IRENoRHk2V0lq?=
 =?utf-8?B?NzVrVVNvdzYzNkYvYTdEMDJ6U3RySm1NWmF3NkY5Uno5VkN6aFh3NW8vS1p3?=
 =?utf-8?B?TTRWNkVNY3hNWUxmTytyaDZLYzA4ekJFSzd5c3lvbUZHQzVQU29meTNDd0Nh?=
 =?utf-8?B?QjMrRkdmQzdvSnQxQTlaL2g2MW12eUlrK0RTajh5RUczRjFoMnkvY01pbkhh?=
 =?utf-8?B?NytkVjFhZUZyN0lZTGtiNDB5MFVwK1UvNnZaajNiS3J6RFU0T2hnS2JwNlBF?=
 =?utf-8?B?clJ4Ynk3RDNSUUwrempKM2d5aUtITVFlVVFjS2kxSU1LcWYrMEdjN0gzR2w2?=
 =?utf-8?B?K2VQem55RWtIUTJBeXBHTHpjeW9LdHhEWFpXSVplTzZNSU5KMk1hQU9ZYk5p?=
 =?utf-8?B?WWxlUnN1RnQvbHpsZHpDY21TQkNSZ2hxalpWRUVocG1JaUlmUkpjbGNJUC9w?=
 =?utf-8?B?eFROVUZaZDRocy9tSU9jL0kxVFdpckpVV1BRRWlxS3NBZi9ZMGxJRlJIU3d2?=
 =?utf-8?B?V1l5d1J5UWUySlZ1RGI5encybWpnTzdrbG9neU95OE1RYmI1ZFZiNk96SDhK?=
 =?utf-8?B?dGZLMVhRV0xRSXM1UmE4QklEazdFV20yVEtpbXIwSFY0dXBkMHVteTErTGkr?=
 =?utf-8?B?TFBjTEdBY1BRSDZTSDZ3WGoraEh0M3hjdWhWRUlLNFQrMmxUMm9BZHhUa2Yw?=
 =?utf-8?B?OCtxRFdQOHlWb1VkMk95emZvWDhqM0M0aC9mQncrQVRkQzlaSkMrTkI0RlJ4?=
 =?utf-8?B?aWxBZnpwdnhKZlhDdUEyVTNjd3Zlb0FzMHovamRYZnVld3BOVCtPeEV2RFlm?=
 =?utf-8?B?cHl0NGRYeTZqVHpPUWcxZTNVZVFzMHc4MFpkVWJFRW1FUzFJcFVuZm1UU0dI?=
 =?utf-8?B?SWpZWnN0Qk1kNW9GUUNncHYyS2xsQU4ydUhVTlEyZ2JyRDZyaXJ1VG9GVm5N?=
 =?utf-8?B?ZXNSS2ZGS3NBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8a4ec2-cb03-43e1-0a9f-08da08aaf401
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 06:45:55.5018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EKMecTTgbNTqUcIVpB0O5Unce5o89m/H+DqL52UJfZa+jfSaKOzy8tAiYx39ERL9GilquIOrJtdYGeXFiNYogNM/SGzkIJD7sWZCySIUqC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2085
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
Cc: "Li, Yong B" <yong.b.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQWxsLA0KDQpEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiB0byByZXZpc2UgdGhpcyBwYXRj
aCBzZXJpZXM/DQpJdCBoYXMgYmVlbiB2ZXJpZmllZCB3aXRoIEFTVDI1MDAgYW5kIEFTVDI2MDAg
QTMgRVZCcy4NCg0KVGhhbmtzLA0KQ2hpYXdlaQ0KDQo+IEZyb206IFlvbmcgTGkgPHlvbmcuYi5s
aUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDEsIDIwMjIgODozNCBB
TQ0KPiANCj4gQGFuZHJld0Bhai5pZC5hdSBAQ2hpYS1XZWkgV2FuZyBAam9lbEBqbXMuaWQuYXUN
Cj4gDQo+IEp1c3Qgd2FudCB0byBjaGVjayB0aGUgbGF0ZXN0IHN0YXR1cyBhYm91dCB0aGlzIG1h
aWxib3ggZHJpdmVyLiBJIHdvdWxkIGxpa2UgdG8gZ2V0DQo+IHRoaXMgZHJpdmVyIHVwc3RyZWFt
ZWQgdG9vLg0KPiANCj4gVGhhbmtzLA0KPiBZb25nDQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBvcGVuYm1jDQo+IDxvcGVuYm1jLWJvdW5jZXMreW9uZy5iLmxpPWxp
bnV4LmludGVsLmNvbUBsaXN0cy5vemxhYnMub3JnPg0KPiBPbiBCZWhhbGYgT2YgQ2hpYS1XZWkg
V2FuZw0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMTcsIDIwMjEgMTA6NTkgQU0NCj4gVG86IHJv
YmgrZHRAa2VybmVsLm9yZzsgam9lbEBqbXMuaWQuYXU7IGFuZHJld0Bhai5pZC5hdTsNCj4gY3ly
aWxidXJAZ21haWwuY29tOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJz
Lm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAwLzJdIGFzcGVlZDogQWRkIExQQyBtYWlsYm94
IHN1cHBvcnQNCj4gDQo+IEFkZCBkcml2ZXIgc3VwcG9ydCBmb3IgdGhlIExQQyBtYWlsYm94IGNv
bnRyb2xsZXIgb2YgQVNQRUVEIFNvQ3MuDQo+IA0KPiB2MjoNCj4gIC0gRml4IGVycm9yIGhhbmRs
aW5nIGZvciBjb3B5X3RvX3VzZXINCj4gIC0gRml4IGluY29ycmVjdCB0eXBlIGluIHRoZSAucG9s
bCBpbml0aWFsaXplcg0KPiANCj4gQ2hpYS1XZWkgV2FuZyAoMik6DQo+ICAgc29jOiBhc3BlZWQ6
IEFkZCBMUEMgbWFpbGJveCBzdXBwb3J0DQo+ICAgQVJNOiBkdHM6IGFzcGVlZDogQWRkIG1haWxi
b3ggdG8gZGV2aWNlIHRyZWUNCj4gDQo+ICBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRz
aSAgICAgfCAgIDcgKw0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kgICAgIHwg
ICA4ICstDQo+ICBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaSAgICAgfCAgIDcgKw0K
PiAgZHJpdmVycy9zb2MvYXNwZWVkL0tjb25maWcgICAgICAgICAgIHwgIDEwICsNCj4gIGRyaXZl
cnMvc29jL2FzcGVlZC9NYWtlZmlsZSAgICAgICAgICB8ICAgOSArLQ0KPiAgZHJpdmVycy9zb2Mv
YXNwZWVkL2FzcGVlZC1scGMtbWJveC5jIHwgNDE4DQo+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA0NTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBkcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWxwYy1t
Ym94LmMNCj4gDQo+IC0tDQo+IDIuMTcuMQ0KDQo=
