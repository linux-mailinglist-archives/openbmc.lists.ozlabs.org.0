Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE86879BC
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 11:04:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6vXN2Cc7z3f3k
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 21:04:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=fhGJS9Ur;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::72e; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=fhGJS9Ur;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6vWf0ld5z3000;
	Thu,  2 Feb 2023 21:03:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmv/qX9GXOoEDAoDiEpHi+d/zjU0tNV8aUlRN1he8gIs/7yOBJHAqhRRQpga/vX9XQRRQWsA8cN3Hm2400YBSPVnabpfSVEqfjGrsZols31JuH3ZJd5qWbST/un+uO74tuMGxuP4+l/XYRL66wSi+YYmUCxHIP+kYmYgrJo0RrOvcLAcBmJmXWczk6Nrg43m2uNOk4dg4x/78jDwxGptLE04RYDSAIuj9X4pk/F+kPt513WTniQAX0fU3mcVnqtgUpPLqLJRuf4DfxJ/ZxWPHnCWcL5NwDvtnDSRqISzIfReJdA6qrrF1Pmxbcfiu3e8GMRjJ+jBo6PeWDAoBfdIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHXYyAzskFC/DibK4wllIMTWBBBo54mWHuUNhY0PVQc=;
 b=JZuaJYXZDsF6OcPUzXVoLbadYP8i9OEWteDjVl0Xav/U+0cZ9/gBUP8CSOFIYZ1+gMj2gKIw9ESSyGX7/NCyxZ5Y9eNjmAlFq8gfaacSmPq5hX5vqcOO1HqfnrgkVAyXJzgtif6VqDu13zb5y33b57L8Sh8dm6GZyAuZ6B8rc5QEUTjl3hv08a7bj/jc90cKNbc9Q+5Kr55Nqy1/ilOWgwkvZ0DJLAVipq/2vkoaLxTtUh8uRrp6+R7FYClz79uiEM7RboQGGU0HcsMVSHIBm9wBDbfwIwj+FjIoOvfhUDpZtOmV6lVPXLE/4P44NEfWJvgrt+2FIr6xguhn565p9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHXYyAzskFC/DibK4wllIMTWBBBo54mWHuUNhY0PVQc=;
 b=fhGJS9UriaC7eJPNHEiYaTp49Jw4MyFDfMK/Wf48wI7liibag0QWujC/dCMUNuKm8+6HQ/ye3v6ermQsD8jt3KaJGgCz0WrXKbG7EE59Ygy9Z9+E50Y3PFZ0XjUADWJJqkxI0/Tb8A079i7baIsh6Ty1AHWBEeM3AuKcOt9EhtxbWfOV1IfL8fm5zdcCEgfWuajQmkrKfZYeXHAhRI/BdzoXPrzqnTki+r81g8bMSWjeHpHD9kQuXg+T3jLkLEh/fUYlDuBP/8vefIv3r+4IgGi+GUmIFZKbqULlDxsu8QTQV/cukeZBCnAttXkYsl76MVbxf8+03Hvn5Nra670aXg==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5629.apcprd06.prod.outlook.com (2603:1096:820:c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Thu, 2 Feb
 2023 10:03:32 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 10:03:32 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jeremy Kerr
	<jk@ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] i2c: aspeed: support ast2600 i2c new register mode
 driver
Thread-Topic: [PATCH v4 3/3] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index: AQHZNii3gD5v2vNmBkaMPcn6K0RsGq67LCOAgAAkr4CAABWagIAAB/ow
Date: Thu, 2 Feb 2023 10:03:32 +0000
Message-ID:  <SEZPR06MB526951F24B841965C0DD6B84F2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230201103359.1742140-1-ryan_chen@aspeedtech.com>
 <20230201103359.1742140-4-ryan_chen@aspeedtech.com>
 <30c7cbbf57abbdfb5f974d6ee17b2218d124c7e8.camel@ozlabs.org>
 <SEZPR06MB526941A3DDB25529F0671112F2D69@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <5239ea2f-284a-dcf5-6dd4-be3b13b319e6@linaro.org>
In-Reply-To: <5239ea2f-284a-dcf5-6dd4-be3b13b319e6@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5629:EE_
x-ms-office365-filtering-correlation-id: 4d89716a-fdf4-4902-1051-08db0504bdb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  C3jlk+vLmGnC75GHd75Y8sk/JU4ZoP162TLhIoyd5n5QpWjBH6ZkqeT+ud/Y9OtjNDhESX6mKGUHu8JN/KcI5R00u8vRol29KZFWDghMIKAAE8yxuy5TQjLMNlVI4rLZx+TWehawORG0bGnhrADULToLyixlBymZJ6BIWI4tyUtqDBALz+CLBATnHyhAADDQ9jwAngv1vBTLjF10kWtYY6OTT5BjJbJjr+3GgGMmzEJXhJOJ2PttmunE7dTVPmjtt2DJw3/+7f3RS5X/JrK+B8VO1DonQe+jt2WTowTYmxGd90hzs67YZVzvjWiJKwTL/ESjxZrdObuT+kc98corjtpMDyrt0Yjel0+cq5VxK9lBAoiNihkWEQSA7x2WhfX99NQ95CtkWdeqzLrDB+jUbuQtIdqUT0t+6/g8rlY/dLsK2W4rYCmvwq3k/dOyOCJVqJ3owAlIzXpgdRmbZVsmkiXmXPk/3o/CZLsySa+RHHZ8bAxaxlfV1kqmflCw8+emEhKyXqLHX6OzuW7Y4g8cp/jjA36p38gsSuTgbENVgp4M5fXMKes/jeKlu3oKaua+a19dGg2nt/js8BZ5bUw5GrMf9kDZMiXuQII3b8IvSmLju8EPhgsg7UaCjGV2+395pEVWiVcWO0XOC68etFFqcpvOZmFV37CK3BuEi3ut3fg4q8pbB1alilR4uLV8hcXGy/iQmh5mswHvWlQ3DQTDABwkkEZg1nE03xffGizcUrs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(346002)(376002)(39850400004)(366004)(451199018)(7416002)(83380400001)(478600001)(33656002)(55016003)(6506007)(921005)(53546011)(86362001)(41300700001)(8936002)(186003)(26005)(316002)(9686003)(38070700005)(52536014)(122000001)(38100700002)(110136005)(5660300002)(8676002)(71200400001)(7696005)(2906002)(76116006)(64756008)(66446008)(66946007)(66556008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M2hXVHpNRXYwNHRQNGg3dlJTUytyb2pzZzBBQjRvTTJjZ1U5cFFHMjZyOGJT?=
 =?utf-8?B?b1YyZ0p6NnNURzhmaWlVMStZbW5LYjJvTWh3T3YzWDBXbUZQdzNMY214NEJK?=
 =?utf-8?B?cG43NC9ZVXczUHF0MHN2d3YzOElDUUQ0VXVtNWdZL0NTUTBwRitFcTR1eHJq?=
 =?utf-8?B?d0tqdC9MT0F3Vkk3WURDNm4ydnNhbXlhMm5PWENOM3ZlRjNYdHJya21kMHRF?=
 =?utf-8?B?ZTBsc09DWUNmYSs0NU9CNENoR0VlWGlZT1ZKcDF5Mys5RHJvK2w0MktleWlY?=
 =?utf-8?B?TFoyRFN2eEwrdnZvUm1GNmFOaFFiNVRrTjF4dXpVSkRFQ0hTOThITWpVaTd4?=
 =?utf-8?B?c3VYY2J0MkdpbUpyUEJoMTBkVHBqZTl3c3hVaEdZbTVydTB2UHVsZDZXNFpo?=
 =?utf-8?B?cWRDSGFYTXNTY2VqZzhtYlJGelY1WUhHQXA3NlkrRlp0WnJLWnpRRkQ2SmhI?=
 =?utf-8?B?N3BnOTFoQlZSc0JFU0lBSDJYZkt3UkEwWkRROWJjZkJkYWNzVE9RSzZVK1Bs?=
 =?utf-8?B?ZUFGQmdYREN2ektZQXpTeGk4RWhCRlNxeU1icXlCVXIzMWRvTElVSVlLcm1t?=
 =?utf-8?B?VEtWdnY3S3V4b0pKSGEvVTZRUVRFZkVjd2FpUG42WXVYMTM0b2RFQkNJL0Nj?=
 =?utf-8?B?WWpYZzVqdHJzQXNOUW9uTXR3NG9xWitYYnZ6eDc0b3ExbmVwSXQvRVNUM2Y5?=
 =?utf-8?B?RDFHVHZqaVlSaWxQVGFMSi9RZklPZ3pzd0hQQkZ1czNQdkNGUkZhS1NIMUhU?=
 =?utf-8?B?OGNwMGlJYWxhSnE3WUd5THZjSUQwR0VETjBaTEdIMGZBMGlud1pVdXUwOXdR?=
 =?utf-8?B?UHkzR3N5U0FTOXhEQkZOUW9SWWVBTlR5NW9wVUZ6MncxVE1aZUY0VGNoTWhp?=
 =?utf-8?B?MUY3Q3Izd1Z6OC8xY1QwbEtzTnNTOXl6TWVEYjI1VjcwNGNLT2xJZG8xeWNP?=
 =?utf-8?B?Skl3Ny85ZHBtWDVxK3Z6MW5UNDFmZnhUd3hJbnFpQmIzZEQ5SlpIZVhTdmpS?=
 =?utf-8?B?TElnb09iMEpYVzZncUNCY0s5Qk5UNTNrSmZOODYwbU9MYmcyNHNOSHB6R2dM?=
 =?utf-8?B?Nkl1aXZudERhNFE4QVl6Ui9odk9aczFuS3M4NTY0c3FNWFlHVkdTRFlKSFZH?=
 =?utf-8?B?RzlQLy9CeDF0QnVPYkpwWCs2UDJ2dnAxbE9SaFhsQXBpbFExdWlhb3dNSi9C?=
 =?utf-8?B?V1NTNEJ2Rm5DenY0UU95bGRrSWl2cnREZXB0c1h2Rk1CQkZQcG1ha09BYXZz?=
 =?utf-8?B?dUZxeGxLZ1JneDBaQkpnbk5WTlQ2Z1IrajZRQzFNZ2lMeFlGRkF0Zi9haldL?=
 =?utf-8?B?YVdHUXVDZTN5QW9FV1ZmZzI1eFdqNkQwWHVqaGFaSDV1UzhSNkJVckN3UUJ2?=
 =?utf-8?B?M1JQMlE0OThoUGQ0ZDkvWGlIVllWMW9YWjcvMVc5K0NuRUJ3UmZTSURCY2Q4?=
 =?utf-8?B?UzEzcUNtQVZVa0dQWjBJZGRyWUQwMGdYOVhvVjROcXlZb3NmK29qM2hBTTRM?=
 =?utf-8?B?VDErTDBYbTdkdjNLNU12OVgwVDhtRVUrSWJMT3l2WExDNlk4TzZxdXY2NjVM?=
 =?utf-8?B?b3RNS3pzV0szSlpsTkxhZ2pQeWFFU284WGVEVWhNREd1Z2ZCM0ZrM2FSR0NM?=
 =?utf-8?B?aEpkYUFYYzlsTmxCaTJuWWdZMk1lQ3Bub2JIT045dGpQYW9mYnZkck1Ud016?=
 =?utf-8?B?a1l5VDAyTFJXaTQ4cjJ5YXNBOGZsTEdvbi9Rd25aQW5VdkhBdWV6SzFDUndq?=
 =?utf-8?B?SEtQRmgydFhCNU1jQnRYVXh6ZWtMOFo3NU51WVJweDVMM2luR1RDYjlxSCtG?=
 =?utf-8?B?YlZoMERGd1Q3OUtCdE1QMThocnBiaVBoaFBmUndTaGlVRzZWYUcyQmk5aWFM?=
 =?utf-8?B?cGpCSHNybzR0aVJCZVRrN2hrWjVpSHhzVFpaVG9SaTVVOVpOWERNMEp1WWx5?=
 =?utf-8?B?cWgzc1FQNGdZZkdkMFBubnYvN2twb3lNNEJIeEF1YUd5Z1VHVTBqVEtjeU1C?=
 =?utf-8?B?WWZ6Vk8xSmEzaldLNVhtMXRHZnVXcGo4Qkk0elN2Y0ZDNmtKbjFkMldKZWg0?=
 =?utf-8?B?QmxaSWRQcWpDejRIZDA2a3kyaFFHeGRWbDQ4OG9KZVFaT3VpNUpJK3dMSUdH?=
 =?utf-8?B?RU1IV3JXeW9kWHJhRUo1ZklYVXdxdjZpQXAyLzJvelFnZmJDVTBKNXVBVzM0?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d89716a-fdf4-4902-1051-08db0504bdb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 10:03:32.3291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dQtnuJfB5BZiR4+r4zrfbrybJkVX23rjZvfHjmOt82oKAF0/rTeMTJpbS151lj55Wg0Kvz2ZQTJETsIYqBbco3Ieo1LUdwW/Ly0Coua7z+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5629
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

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IE9uIDAyLzAyLzIwMjMgMTA6MTYsIFJ5YW4gQ2hlbiB3cm90
ZToNCj4gPj4+PiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgYXN0MjYwMF9pMmNfZ2xv
YmFsX2RyaXZlciA9IHsNCj4gPj4+ICvCoMKgwqDCoMKgwqDCoC5wcm9iZcKgID0gYXN0MjYwMF9p
MmNfZ2xvYmFsX3Byb2JlLA0KPiA+Pj4gK8KgwqDCoMKgwqDCoMKgLmRyaXZlciA9IHsNCj4gPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAubmFtZSA9IEtCVUlMRF9NT0ROQU1FLA0K
PiA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5vZl9tYXRjaF90YWJsZSA9IGFz
dDI2MDBfaTJjX2dsb2JhbF9vZl9tYXRjaCwNCj4gPj4+ICvCoMKgwqDCoMKgwqDCoH0sDQo+ID4+
PiArfTsNCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMgaW50IF9faW5pdCBhc3QyNjAwX2kyY19nbG9i
YWxfaW5pdCh2b2lkKSB7DQo+ID4+PiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcGxhdGZvcm1fZHJp
dmVyX3JlZ2lzdGVyKCZhc3QyNjAwX2kyY19nbG9iYWxfZHJpdmVyKTsNCj4gPj4+ICt9DQo+ID4+
PiArZGV2aWNlX2luaXRjYWxsKGFzdDI2MDBfaTJjX2dsb2JhbF9pbml0KTsNCj4gPj4NCj4gPj4g
TWF5YmUgbW9kdWxlX3BsYXRmb3JtX2RyaXZlcigpIGluc3RlYWQ/DQo+ID4NCj4gPiBEdWUgdG8g
aTJjIGdsb2JhbCBpcyB0b3Agb2YgYWxsIGkyYyBidXMgbGlrZSB0aGUgc2N1LCBpdCBtYWtlIHN1
cmUgdGhlIGRyaXZlciBpcw0KPiBiZWZvcmUgdGhlIGkyYyBidXMgZHJpdmVyIHByb2JlLg0KPiA+
IEl0IGlzIG5lZWRlZCB1c2UgZGV2aWNlX2luaXRjYWwgZnVuY3Rpb24uDQo+IA0KPiBObywgd2Ug
ZG8gbm90IGRvIHN1Y2ggb3JkZXJpbmcuIGRldmljZSBsaW5rcyBhbmQgcHJvcGVyIHJlc291cmNl
IHNoYXJpbmcNCj4gaGFuZGxlIHRoZSBvcmRlci4gVGhpcyBtdXN0IGJlIG1vZHVsZV9wbGF0Zm9y
bV9kcml2ZXIoKSAoYXNzdW1pbmcgd2UgZG8gbm90DQo+IGRyb3AgZW50aXJlIHN1Ym1pc3Npb24p
Lg0KDQoNCklmIGdsb2JhbCBkcml2ZXIgdXNlIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIsIGRvZXMg
aTJjIGRyaXZlciB3aWxsIGxhdHRlciB0aGUgZ2xvYmFsIGRyaXZlciBwcm9iZT8NCklmIHllcywg
SSB0aGluayBpdCB3aWxsIHdvcmthYmxlLg0KPiANCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+
IEtyenlzenRvZg0KDQo=
