Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DA076295D
	for <lists+openbmc@lfdr.de>; Wed, 26 Jul 2023 05:39:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=kbOQEuSl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9flw5mxnz30Ql
	for <lists+openbmc@lfdr.de>; Wed, 26 Jul 2023 13:39:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=kbOQEuSl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::70f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2070f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9fl86vc4z2yV0;
	Wed, 26 Jul 2023 13:38:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdsPVNYvAOj4JjSp+DSpxpG9y9BGcApfYGSfvlE0v7U9OE8MAIjxhqv/Qx+FCXg0QBur7JBT2FkL6Z/iWL3qexbfnomh4U47ebz0N07NJ2fb6rZATGcyyHEwxpo8PTawYV4IBPbQ6vnA9z/qwUdWOv2UdNhMTa7BrUZRtQ4yfVzL79/DehcIYDzvJfMYo5bvMwf0YEItxZ5kCIxka4jlT3M2jz3KiC70wicD7iYnqNAAubfHw87qK5J2PGHieiHi/o6hN7yS6Rca7eZjGnTt5jZj02UNJXOtqMpFTBnIqZA1tK/QDeHXdzOctBjCeljDe9NVGQFgU6PkLqzipVg6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acpEq3ToWnavwyJ0UC+lBt1GbMVQIvf0O3m72aWxpzQ=;
 b=e5Z9rpFIeEmNS6oLWYBFFGJIY67YxOABls0/McA1/CZcHqJqSwhEjTTTdt0FurLU8i+MvfsIoTIvjQlVA81LzjpdeZNgZFXgT8L34qLBvGkRLaHdHzybwF0TZ4HfGn7OSdWLyHciVox7A9T0rRXbpBq03/VmpBKhTJArfp+Vcljum5eN0IJYmEkHRacEvCI8enTK0lyUwfgjQAFdRdyGeFs792NE/TVsyCqi5gsFeUjODYLJZM5NMD4wMxmGBxTuGJgVXubF7dEjoG3DayxnqH83wzBHrXM+jp/+2ij+xn8m+uYor1D8vaPfN4xkV8MEfeOTlmxzGoX+6x0wprNa4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acpEq3ToWnavwyJ0UC+lBt1GbMVQIvf0O3m72aWxpzQ=;
 b=kbOQEuSlSCR2DitaUErZbutXs9tVXW3g6qnd6dVDV55nGCvrVmvEZ6xYCluIwJZTleRjmopv4s7pyIaWjPuccfkFWhOqQEO1oabSh7e3QVfYd3EQ5umCczTVcJjbk1grP4eMcaq3QNzjg8K+LyaQBIiE2eAWQdfwtehWu2xP4EdwnTZw9xEcW+u+pf7wiyrU7QXZMY0P1uIIgaOlVR+CeH3WcFj+nP7pE9iXIDaAtBe+/V3xLaRARjyA5EPodpuf3eP+ETQon2yetiih97+oM0/OhaYGYqvHhSXsDYjHUJpOaqhKKnlUVYwYQRVoFDY0WBeSb1PA7cgVLdKiR9KSEg==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5254.apcprd06.prod.outlook.com (2603:1096:101:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 03:38:15 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 03:38:14 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "jk@codeconstruct.com.au"
	<jk@codeconstruct.com.au>, Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley
	<joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Jean
 Delvare <jdelvare@suse.de>, William Zhang <william.zhang@broadcom.com>,
	Tyrone Ting <kfting@nuvoton.com>, Tharun Kumar P
	<tharunkumar.pasumarthi@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Phil Edworthy <phil.edworthy@renesas.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "=linux-kernel@vger.kernel.org"
	<=linux-kernel@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Topic: [PATCH v12 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index: AQHZtics0zDPons9tEqiPxizT4zKAq+45uuAgAAA8zCAAA5kgIAAB7jAgBJ5TdA=
Date: Wed, 26 Jul 2023 03:38:14 +0000
Message-ID:  <SEZPR06MB5269B31B3ADC4EDEA113BA99F200A@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230714074522.23827-1-ryan_chen@aspeedtech.com>
 <20230714074522.23827-3-ryan_chen@aspeedtech.com>
 <eda7789d-a603-d565-c9da-edfe9493a05d@linaro.org>
 <SEZPR06MB5269EB586319B3333CD96010F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <674fed6f-36d6-bacb-d075-97bc355177a3@linaro.org>
 <SEZPR06MB5269568451406598F0D824F6F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
In-Reply-To:  <SEZPR06MB5269568451406598F0D824F6F234A@SEZPR06MB5269.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SEYPR06MB5254:EE_
x-ms-office365-filtering-correlation-id: 2d38525f-225e-430a-e323-08db8d89be6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0jFBgFMe0aaVf/nCxMXrpdI6mxzfhX8E3V9ZMfHVna8KHZpfh/BzwLa3GNw8wq07qspoLQ/tNOx4dESsxntSwCqfAkNitKCAoFrUfqjixjZYq5pI2p5p6/kuttVnsQiEPvtOu6kkb8wGzsbQ25nD1ZP0haZNZFmegj9FRyQBU3Q7D7JQiSSeRDNJYgpvC2/a/uiB5gjVRbcQ6MLDX5tf+PRmTnvq11jJVim/704K+vr8U1yDA+8k+R61I+sB1DGUSIDsfP9IHJ3IPDHF70ics1YmMAff6lrM12hJCPq7CZb0obeKLVfLr0ijEB48P7s6yrw9zFxEfMSfRZLXFfXq5TNWyVPsC/d3mlpIj0ZuS2BA6cgXEK8YaROm1o1EUKvT9NG3UKXRs9QILa9kXbLPdXNw8VUp7D1vV/zjEwT9MnoEAaCmCkJ7WVQa0OiDar8Jof8L1Qr5tPwtc4H6n8u7nC2q/acyYGvqj5fkwbO4iTR+aNmdsugHdFu2Ck5O42FTiAreFgKjBGKSOeWUu0MquVGkKyJw7QfjpMKOpXYIK4+eiIezYTpeb/RtnjnM3gVXgmviAuM6CXd1sa8/Oqz33a9dOXuTSUiOFkWu+aTIUitnFfZ6UkMQNLEtNQw3DoJU
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39850400004)(451199021)(478600001)(110136005)(921005)(86362001)(38100700002)(66476007)(66556008)(66946007)(76116006)(316002)(122000001)(66446008)(64756008)(71200400001)(6506007)(38070700005)(26005)(186003)(7696005)(966005)(9686003)(53546011)(5660300002)(52536014)(8676002)(7416002)(8936002)(33656002)(41300700001)(2906002)(55016003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cGtXWkFIa0V4bWgwYWRSY3l6YWNpaWhJVHJHTGJUcmdOWER6SWEycHN3Q0tN?=
 =?utf-8?B?dVJtcnU5S2pGRHFHd2JCVTRHUUthREpoZ0FrRGFNMHhrcGpuR0JiQm5Bamla?=
 =?utf-8?B?ZmRPUzlxcE0rbHhGUlB0OHZDNy9HcCtTMDdWOGVJdGlBOTYvZkZzbTVVTmEy?=
 =?utf-8?B?dmN3dVlCbmhxRFlJNHJqVHhvY3p6MFBGdlhSN29ZcmpZRjZMM0NGZHpYSXVR?=
 =?utf-8?B?VDMrQXlrM2p6Sm9FSm1tWEdPVCswUjJOWU9EcmdZSTB2UTBkdXpMNGtHQzQ1?=
 =?utf-8?B?MjRLNmM2SnBYWjczTHpBWmRqeTBtNEgzY1VjdTRNUjdpcElyQUo1WlljZW13?=
 =?utf-8?B?cHV0T2tlTlNNVjdpOFJwbHhwRGNGcmgycDZTZlpkMjNacWtHTUhUdmJkWHNQ?=
 =?utf-8?B?ZnNvY1hzOVYrZG56M2VaVnUrVDFmZmx3OGpGRTNIbHFCM2hyM3pvYkJHbHkw?=
 =?utf-8?B?UjFFRnk4SUdhQTh4ZmxmcFVHajNNUHNtV0JPZlhBT1VsTVh0RkI1dGh4OTI2?=
 =?utf-8?B?WW9vYk91eDFzSHA2OUk5cy9GNGl4ZDE0dEJCR29zdnk1ekZBRlJ1QVFhT1Q5?=
 =?utf-8?B?VzhUTXZtU2NrOGxYdG8za1U3Z0YrQk5tR2RMek4zZ0xrZlVXRXJLekxkTjhJ?=
 =?utf-8?B?MjJkZUd3VjdLUWdUVzcxbjdxelFGVHQrUEZBSDBpb0c4YWJON05hdXprdlNw?=
 =?utf-8?B?dDVWMS90V0xTNkViR2xuMkE1WmozSFVmZFhZZllBRUJSbnFjVzVhd21lelNl?=
 =?utf-8?B?RVFaS1VaYlg0WU5DZ2E5L2R0QkZTUW5haGo1RXg5YytXeEdpcWFKZzJhcHVv?=
 =?utf-8?B?eW9YNmFLUXlSUnduQjJ6bm4yMVpReFFhK0tXVk84MnYyK3pqdUlSUmFtSmRz?=
 =?utf-8?B?S2xrU09nYnFuNE56ZEpuWFllRmZBNmxXY2FSNjVGRWZpK2FLTnd2VW42NGU5?=
 =?utf-8?B?YW9Nekw5T0xOdkpkYUxiN25TQXhDSUl0K0JBdWpsbnpZajJIT1p2QWYxRThw?=
 =?utf-8?B?a3ZPR21EUEIrNzQwVGVRc3Y1OHBKazJUTmVkbjcyM0I5REwwWlBTRlo2UnpD?=
 =?utf-8?B?MG1tdWVnRFNmVlFKelkzbnlFMUJPQi9hdG12VnllS3M3bG9WQStlMnQ1eWN1?=
 =?utf-8?B?ZGR3WmNaNGZsYUxSYk9YMjFwdlhlcXdFaXVzcVR2U3BVU2VPRmliSDlmUk9n?=
 =?utf-8?B?aXAxQkU5bjBxT0puN3VMbTl0dmxmamc3YUQ1RmlFNzNwNndmbndpUEF4RHhB?=
 =?utf-8?B?d1FYMVp0N2dwajlyLzhXTDNBT0dVc1dlYzBITzMyOWdyb3NpaDljNVFrQ0dY?=
 =?utf-8?B?U0RRQ0I4SmdVWDlOT0lHc1hyNFVRWEYwQUtXaksvanA0WEI1TE5HVzhLL1VR?=
 =?utf-8?B?aWhwc0pqNlFKZGpxelk1V1FrbmFPaWRBSVg5bkd1SDQyTmZiMUZsZEVCaC9q?=
 =?utf-8?B?NXY3UUJEZ1BXTGg2aTlRT2s4ZzUyUnFPYTEwblh4YXN2ZVFpWUE0SzFVcEpE?=
 =?utf-8?B?T1puK1EyZE5XUUFQWG1WOTlsdkRpRXByb1B4Uk1JZFBoam5NbXRXcnhDYjZy?=
 =?utf-8?B?Q3UwbkdqVEsyYWcxZDZhVmdXK3RzaUlYZEh6Z1drWWdoR2VkMW8rRTRNT2p3?=
 =?utf-8?B?VUoxazNvTHRnemRCajVHV2l4cjVudURwWm1qOERmYVNoY1ZONWtNc3VKSnZn?=
 =?utf-8?B?aHBGci9DM2VTTDgxeHhRcmEzUlZzL091MGNWbkN0bHNSdzJZcGtOeURDdGwx?=
 =?utf-8?B?ZnBMdFI3SkM5Z0x2UlBTNjdhY3FLTG8xdHN1U2FVVlRnWVhTY1hmdlNDTk1w?=
 =?utf-8?B?UmlaSG1mNEloWVVJbjVWSjNFVTBZSW51ZjlvalRjQ1VwVmtFOWZWRGRNSXpk?=
 =?utf-8?B?T3RvTEgwL0lnZ0ZJTWNORkxtclpVZWNnQWhZUmpTUnN3QUIyL1BHQVRSZVBO?=
 =?utf-8?B?OGd4MmVKVm9xS05DWS8wbjA4dU5tSmpZNk1BaTFnRk50Y1JGcWtYN2V6U2hO?=
 =?utf-8?B?elR1Q0plaFl6UXlmdGFSVHJ1Z3E2RVN3b2FwZ3pKcnB1SnlFRXFySWhNcDZt?=
 =?utf-8?B?SU5nYkt3U0ZMVzhPTDJqazArczRvZERjNU9BK0V6UzV1NmN3WmZoMkJYbjB3?=
 =?utf-8?Q?7vM1Evz5W1qm3ziBCS34SBfn9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d38525f-225e-430a-e323-08db8d89be6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 03:38:14.7504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZgBaTcqRa2A9sHQ6yPzhmKZE5ng1MF0XCwtQWsPMlj95fLgYBhngJ3KGubelx21y0LRVX7ou3IDnFTvZ7Tvlazx+OTsRdmaD0Gv5qsfeUJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5254
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

SGVsbG8sDQo+IA0KPiBPbiAxNC8wNy8yMDIzIDA5OjQ1LCBSeWFuIENoZW4gd3JvdGU6DQo+PiBB
ZGQgaTJjIG5ldyByZWdpc3RlciBtb2RlIGRyaXZlciB0byBzdXBwb3J0IEFTVDI2MDAgaTJjIG5l
dyByZWdpc3RlciANCj4+IG1vZGUuIEFTVDI2MDAgaTJjIGNvbnRyb2xsZXIgaGF2ZSBsZWdhY3kg
YW5kIG5ldyByZWdpc3RlciBtb2RlLiBUaGUgDQo+PiBuZXcgcmVnaXN0ZXIgbW9kZSBoYXZlIGds
b2JhbCByZWdpc3RlciBzdXBwb3J0IDQgYmFzZSBjbG9jayBmb3Igc2NsIA0KPj4gY2xvY2sgc2Vs
ZWN0aW9uLCBhbmQgbmV3IGNsb2NrIGRpdmlkZXIgbW9kZS4gVGhlIGkyYyBuZXcgcmVnaXN0ZXIg
DQo+PiBtb2RlIGhhdmUgc2VwYXJhdGUgcmVnaXN0ZXIgc2V0IHRvIGNvbnRyb2wgaTJjIG1hc3Rl
ciBhbmQgc2xhdmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUnlhbiBDaGVuIDxyeWFuX2NoZW5A
YXNwZWVkdGVjaC5jb20+DQo+PiAtLS0NCj4gDQo+IC4uLg0KPiANCj4+ICsJcmV0ID0gZGV2bV9p
MmNfYWRkX2FkYXB0ZXIoZGV2LCAmaTJjX2J1cy0+YWRhcCk7DQo+PiArCWlmIChyZXQpDQo+PiAr
CQlyZXR1cm4gcmV0Ow0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiArc3Rh
dGljIGludCBhc3QyNjAwX2kyY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikg
ew0KPj4gKwlzdHJ1Y3QgYXN0MjYwMF9pMmNfYnVzICppMmNfYnVzID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7DQo+PiArDQo+PiArCS8qIERpc2FibGUgZXZlcnl0aGluZy4gKi8NCj4+ICsJ
d3JpdGVsKDAsIGkyY19idXMtPnJlZ19iYXNlICsgQVNUMjYwMF9JMkNDX0ZVTl9DVFJMKTsNCj4+
ICsJd3JpdGVsKDAsIGkyY19idXMtPnJlZ19iYXNlICsgQVNUMjYwMF9JMkNNX0lFUik7DQo+PiAr
DQo+PiArCWkyY19kZWxfYWRhcHRlcigmaTJjX2J1cy0+YWRhcCk7DQo+IA0KPj4gSSBoYXZlIGRv
dWJ0cyB0aGF0IHlvdSB0ZXN0ZWQgdGhpcy4gSSB0aGluayB5b3UgaGF2ZSBoZXJlIGRvdWJsZSBm
cmVlL2RlbCBvZiB0aGUgYWRhcHRlci4NCj4gU29ycnksIGkgY2FuJ3QgY2F0Y2ggeW91ciBwb2lu
dCBmb3IgZG91YmxlIGZyZWUgdGhlIGFkYXB0ZXIuDQo+IEl0IHNob3VsZCB1c2UgaTJjX2RlbF9h
ZGFwdGVyIGluIGRyaXZlciByZW1vdmUgZnVuY3Rpb24uDQo+IEFsbCB0aGUgZHJpdmVyIGRvaW5n
IHRoaXMNCj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtbg0KPiBwY203eHguYyNMMjM3Mw0KPiBodHRwczovL2dpdGh1
Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1h
DQo+IGx0ZXJhLmMjTDQ3Mw0KPiANCj4gRG8geW91IG1lYW4gaXQgaXMgbm90IG5lY2Vzc2FyeT8g
DQoNCj5JbnN0ZWFkIG9mIGdpdmluZyB5b3UgdGhlIGZpc2gsIEkgdGhpbmsgbXVjaCBtb3JlIGxl
YXJuaW5nIGV4cGVyaWVuY2UgaXMgdG8gdGVhY2ggeW91IGhvdyB0byBmaXNoLiBQbGVhc2UgdW5i
aW5kIHlvdXIgZHJpdmVyIChlY2hvIHRoZSBkZXZpY2UgbmFtZSB0byBwcm9wZXIgdW5iaW5kIGZp
bGUgaW4gc3lzZnMpLiBUaGUgYmVzdCBpZiB5b3UgYnVpbGQgeW91ciBrZXJuZWwgd2l0aCBLQVNB
Ti4NCg0KPlRoYW5rcywgd2lsbCBkbyB0aGlzIHRlc3Qgd2l0aCB1bmJpbmQgdG8gdW5kZXJzdGFu
ZCB5b3VyIHBvaW50LiANCkkgZG8gbXkgdGhlIHRlc3Qgd2l0aCBlbmFibGUga2VybmVsIGNvbmZp
ZyBLQVNBTi4NCkkgZG9uJ3Qgc2VlIGFueSBlcnJvciBkdW1wLiBZb3UgY2FuIHNlZSB0aGUgZm9s
bG93aW5nLiBJdCB1c2UgaTJjLTAgYmluZC91bmJpbmQuDQpEaWQgSSBtaXNzIHNvbWUgdGVzdCA/
Pw0KDQpyb290QGFzdDI2MDAtZGVmYXVsdDovc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL2kyY19h
c3QyNjAwIyBpMmNkZXRlY3QgLWwNCmkyYy0wICAgaTJjICAgICAgICAgICAgIDFlNzhhMDgwLmky
Yy1idXMgICAgICAgICAgICAgICAgICAgICAgICBJMkMgYWRhcHRlcg0KaTJjLTEgICBpMmMgICAg
ICAgICAgICAgMWU3OGExMDAuaTJjLWJ1cyAgICAgICAgICAgICAgICAgICAgICAgIEkyQyBhZGFw
dGVyDQppMmMtMiAgIGkyYyAgICAgICAgICAgICAxZTc4YTE4MC5pMmMtYnVzICAgICAgICAgICAg
ICAgICAgICAgICAgSTJDIGFkYXB0ZXINCmkyYy0zICAgaTJjICAgICAgICAgICAgIDFlNzhhMjAw
LmkyYy1idXMgICAgICAgICAgICAgICAgICAgICAgICBJMkMgYWRhcHRlcg0KaTJjLTQgICBpMmMg
ICAgICAgICAgICAgMWU3OGEyODAuaTJjLWJ1cyAgICAgICAgICAgICAgICAgICAgICAgIEkyQyBh
ZGFwdGVyDQppMmMtNSAgIGkyYyAgICAgICAgICAgICAxZTc4YTMwMC5pMmMtYnVzICAgICAgICAg
ICAgICAgICAgICAgICAgSTJDIGFkYXB0ZXINCmkyYy02ICAgaTJjICAgICAgICAgICAgIDFlNzhh
MzgwLmkyYy1idXMgICAgICAgICAgICAgICAgICAgICAgICBJMkMgYWRhcHRlcg0KaTJjLTcgICBp
MmMgICAgICAgICAgICAgMWU3OGE0MDAuaTJjLWJ1cyAgICAgICAgICAgICAgICAgICAgICAgIEky
QyBhZGFwdGVyDQppMmMtOCAgIGkyYyAgICAgICAgICAgICAxZTc4YTQ4MC5pMmMtYnVzICAgICAg
ICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0ZXINCmkyYy05ICAgaTJjICAgICAgICAgICAgIDFl
NzhhNTAwLmkyYy1idXMgICAgICAgICAgICAgICAgICAgICAgICBJMkMgYWRhcHRlcg0KaTJjLTEy
ICBpMmMgICAgICAgICAgICAgMWU3OGE2ODAuaTJjLWJ1cyAgICAgICAgICAgICAgICAgICAgICAg
IEkyQyBhZGFwdGVyDQppMmMtMTMgIGkyYyAgICAgICAgICAgICAxZTc4YTcwMC5pMmMtYnVzICAg
ICAgICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0ZXINCmkyYy0xNCAgaTJjICAgICAgICAgICAg
IDFlNzhhNzgwLmkyYy1idXMgICAgICAgICAgICAgICAgICAgICAgICBJMkMgYWRhcHRlcg0KaTJj
LTE1ICBpMmMgICAgICAgICAgICAgMWU3OGE4MDAuaTJjLWJ1cyAgICAgICAgICAgICAgICAgICAg
ICAgIEkyQyBhZGFwdGVyDQpyb290QGFzdDI2MDAtZGVmYXVsdDovc3lzL2J1cy9wbGF0Zm9ybS9k
cml2ZXJzL2kyY19hc3QyNjAwIyBlY2hvIDFlNzhhMDgwLmkyYy1idXMgPiB1bmJpbmQNCnJvb3RA
YXN0MjYwMC1kZWZhdWx0Oi9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvaTJjX2FzdDI2MDAjIGky
Y2RldGVjdCAtbA0KaTJjLTEgICBpMmMgICAgICAgICAgICAgMWU3OGExMDAuaTJjLWJ1cyAgICAg
ICAgICAgICAgICAgICAgICAgIEkyQyBhZGFwdGVyDQppMmMtMiAgIGkyYyAgICAgICAgICAgICAx
ZTc4YTE4MC5pMmMtYnVzICAgICAgICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0ZXINCmkyYy0z
ICAgaTJjICAgICAgICAgICAgIDFlNzhhMjAwLmkyYy1idXMgICAgICAgICAgICAgICAgICAgICAg
ICBJMkMgYWRhcHRlcg0KaTJjLTQgICBpMmMgICAgICAgICAgICAgMWU3OGEyODAuaTJjLWJ1cyAg
ICAgICAgICAgICAgICAgICAgICAgIEkyQyBhZGFwdGVyDQppMmMtNSAgIGkyYyAgICAgICAgICAg
ICAxZTc4YTMwMC5pMmMtYnVzICAgICAgICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0ZXINCmky
Yy02ICAgaTJjICAgICAgICAgICAgIDFlNzhhMzgwLmkyYy1idXMgICAgICAgICAgICAgICAgICAg
ICAgICBJMkMgYWRhcHRlcg0KaTJjLTcgICBpMmMgICAgICAgICAgICAgMWU3OGE0MDAuaTJjLWJ1
cyAgICAgICAgICAgICAgICAgICAgICAgIEkyQyBhZGFwdGVyDQppMmMtOCAgIGkyYyAgICAgICAg
ICAgICAxZTc4YTQ4MC5pMmMtYnVzICAgICAgICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0ZXIN
CmkyYy05ICAgaTJjICAgICAgICAgICAgIDFlNzhhNTAwLmkyYy1idXMgICAgICAgICAgICAgICAg
ICAgICAgICBJMkMgYWRhcHRlcg0KaTJjLTEyICBpMmMgICAgICAgICAgICAgMWU3OGE2ODAuaTJj
LWJ1cyAgICAgICAgICAgICAgICAgICAgICAgIEkyQyBhZGFwdGVyDQppMmMtMTMgIGkyYyAgICAg
ICAgICAgICAxZTc4YTcwMC5pMmMtYnVzICAgICAgICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0
ZXINCmkyYy0xNCAgaTJjICAgICAgICAgICAgIDFlNzhhNzgwLmkyYy1idXMgICAgICAgICAgICAg
ICAgICAgICAgICBJMkMgYWRhcHRlcg0KaTJjLTE1ICBpMmMgICAgICAgICAgICAgMWU3OGE4MDAu
aTJjLWJ1cyAgICAgICAgICAgICAgICAgICAgICAgIEkyQyBhZGFwdGVyDQpyb290QGFzdDI2MDAt
ZGVmYXVsdDovc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL2kyY19hc3QyNjAwIyBlY2hvIDFlNzhh
MDgwLmkyYy1idXMgPiBiaW5kDQpbICAzODguMTc3NDEzXSBpMmNfYXN0MjYwMCAxZTc4YTA4MC5p
MmMtYnVzOiBpMmMtYnVzIFswXTogYWRhcHRlciBbMTAwIGtoel0gbW9kZSBbMF0NCnJvb3RAYXN0
MjYwMC1kZWZhdWx0Oi9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvaTJjX2FzdDI2MDAjIGkyY2Rl
dGVjdCAtbA0KaTJjLTAgICBpMmMgICAgICAgICAgICAgMWU3OGEwODAuaTJjLWJ1cyAgICAgICAg
ICAgICAgICAgICAgICAgIEkyQyBhZGFwdGVyDQppMmMtMSAgIGkyYyAgICAgICAgICAgICAxZTc4
YTEwMC5pMmMtYnVzICAgICAgICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0ZXINCmkyYy0yICAg
aTJjICAgICAgICAgICAgIDFlNzhhMTgwLmkyYy1idXMgICAgICAgICAgICAgICAgICAgICAgICBJ
MkMgYWRhcHRlcg0KaTJjLTMgICBpMmMgICAgICAgICAgICAgMWU3OGEyMDAuaTJjLWJ1cyAgICAg
ICAgICAgICAgICAgICAgICAgIEkyQyBhZGFwdGVyDQppMmMtNCAgIGkyYyAgICAgICAgICAgICAx
ZTc4YTI4MC5pMmMtYnVzICAgICAgICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0ZXINCmkyYy01
ICAgaTJjICAgICAgICAgICAgIDFlNzhhMzAwLmkyYy1idXMgICAgICAgICAgICAgICAgICAgICAg
ICBJMkMgYWRhcHRlcg0KaTJjLTYgICBpMmMgICAgICAgICAgICAgMWU3OGEzODAuaTJjLWJ1cyAg
ICAgICAgICAgICAgICAgICAgICAgIEkyQyBhZGFwdGVyDQppMmMtNyAgIGkyYyAgICAgICAgICAg
ICAxZTc4YTQwMC5pMmMtYnVzICAgICAgICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0ZXINCmky
Yy04ICAgaTJjICAgICAgICAgICAgIDFlNzhhNDgwLmkyYy1idXMgICAgICAgICAgICAgICAgICAg
ICAgICBJMkMgYWRhcHRlcg0KaTJjLTkgICBpMmMgICAgICAgICAgICAgMWU3OGE1MDAuaTJjLWJ1
cyAgICAgICAgICAgICAgICAgICAgICAgIEkyQyBhZGFwdGVyDQppMmMtMTIgIGkyYyAgICAgICAg
ICAgICAxZTc4YTY4MC5pMmMtYnVzICAgICAgICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0ZXIN
CmkyYy0xMyAgaTJjICAgICAgICAgICAgIDFlNzhhNzAwLmkyYy1idXMgICAgICAgICAgICAgICAg
ICAgICAgICBJMkMgYWRhcHRlcg0KaTJjLTE0ICBpMmMgICAgICAgICAgICAgMWU3OGE3ODAuaTJj
LWJ1cyAgICAgICAgICAgICAgICAgICAgICAgIEkyQyBhZGFwdGVyDQppMmMtMTUgIGkyYyAgICAg
ICAgICAgICAxZTc4YTgwMC5pMmMtYnVzICAgICAgICAgICAgICAgICAgICAgICAgSTJDIGFkYXB0
ZXINCg==
