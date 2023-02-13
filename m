Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC58693BD8
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 02:46:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFRyK6V2Dz3c5D
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 12:46:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=VdAkvuHG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::731; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=VdAkvuHG;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20731.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFRxV6cX7z3bg5;
	Mon, 13 Feb 2023 12:45:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2sz2nMxMaMWysBj4fBxeFhUvPV5tFIiJPT+1h2Z83hVR+HWfxH3wARJoLty1PtPG4Kse/jB5IVrTjvRSnXg3jI4jBIKcgHMyL72z6S3ryTvyCt6Uv3u31BTP2Wf9FMhHEiOF2bsv1rmrVy0mN8KdSwDcaFOtoVhffyizqzvdGUsrBvSIljL48vupNvUTL0wGCvRL7PuRTbOBa/ixZe4rp1typqQax2qAHNvYK7OfOQlNDsFxwafjoydZYqGDKbdMflw91bhOTdUiVS4Bv56LEMFykXFKmLw4GXqm6RKRVAKkNmF9hRAFIIdvj2fE1t5glQl5iyzs7vBxAWu1vrxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaeYP8KParJdlf1dBMQnib32qQAf89vsuzEhz/eQ3E4=;
 b=Gp+7dP40xl3eCvYfVYDSU60aufPm+TAVppz/50XuOPGVmWi7FGUWzbnma8vmbqkT0iBazA5IqaOu52a/83SCdsyXUp60Fp8XzwISxKJLKzyRhYJlNgcRPWz3lFTIR2Cwj+PESn7IEu2mdfjEZXStNMlCBGEIHq+jLXzNwDeFk1zSAELYvjLG45kLHqYbgZ7gcFPFNtV1h96XBi6B1t9TrQuVESG+k/mEpu4SZ/SvR2iHxZrPeAURs9KpDGogJwzxFv4cIVxQdCshz3dDsiXG6/Kfu8qH+LsD6NLpq5ymON5QRUTCkwJcRYdcKsWYDTXaO4Bd4XN3OFi87k8hmoaBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaeYP8KParJdlf1dBMQnib32qQAf89vsuzEhz/eQ3E4=;
 b=VdAkvuHGb6eFtjTsdBOa/CdLkL0YfiylLp5g0XKmNH7HTzhbQsixYbmw/23ijaMlhk3xcJZ9sDVmkmaU7a3uGBuDWEF8Te9FlwQcOLydhNUU5n6I01Oupc9MShU3gysgxxrR6Ipjapte5g7UeI0EWMaTH6WKbgL3LLehAsowG1vxMsbtJbi6q0okn1Kb0sbCltJh8o6JcdgsBmY5gATpibgrMxdEFaEB6sRbHi/yVHxznu1wR1J7f9uz7Vc2ATleOU3ZvDHA/EzHAkC8I7R1iMvhXTvg1ftPzO54vQLHcbIIkkUpGLnJguLkcB6yOprVdBhmmdIqhTpwkgfMSjhsvg==
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 (2603:1096:820:11::14) by TYZPR06MB6141.apcprd06.prod.outlook.com
 (2603:1096:400:343::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.9; Mon, 13 Feb
 2023 01:45:06 +0000
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa]) by KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa%4]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 01:45:06 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
Subject: RE: [PATCH 3/4] serial: 8250: Add Aspeed UART driver
Thread-Topic: [PATCH 3/4] serial: 8250: Add Aspeed UART driver
Thread-Index: AQHZPSGHc2FuUfvkK0yq1ehxne+sqq7IM3KAgAPqpgA=
Date: Mon, 13 Feb 2023 01:45:05 +0000
Message-ID:  <KL1PR0601MB378160E42842A0A55947BF7191DD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
 <20230210072643.2772-4-chiawei_wang@aspeedtech.com>
 <2d389fc9-0d5-42a1-b6d7-695c70dcf0fe@linux.intel.com>
In-Reply-To: <2d389fc9-0d5-42a1-b6d7-695c70dcf0fe@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB3781:EE_|TYZPR06MB6141:EE_
x-ms-office365-filtering-correlation-id: 387de25e-406f-45c8-aab5-08db0d63eeaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  x/GrUbWf3guZgs1jmHd8lqsSlUaaYjf8vfgAaINbVgRM7WwUalsJsdAa754MXvE+e45pYdx2hi+A7Xk1HbG3Z0KAW+A+XT2p/OFO6nIoBn7xUbUfzwmVgnDeugmv0u30Nzdqg9tn5AULoyYZCUcGg/EwLoZQAvNTl1zs5J6+O14NuMEj7UkXYnl+PNo6a9YX3QAD/OX/ohnO+l3dtvz7CBYcYOk4nWxhK9HV4MiQaa8Lq02iAX8r7Op4C0HawABrysWJrYjlTUUYDkbZ9gXoEaH/JSXnAVcOiecjFrZ16M4LV9J9Hn5JdE3PONy64QptbQ+ZtbLl+QCgIM3o7FIMcFHbzYLFGt7uC9tEN9q2YuGXu3etULQKCz5FU6IzCoRm/0Qdhg4Zr6EEwnZqWYwYsoHjdYm4ox9zBP/vzjaNYnYc1VfVG2dekOb/8l2Ls0ttfgaUzpgHagqLiTBLS8FS4ZbqZoMRWiEwoK1Vims4i9nqOQjwC8coSVV/M2wAbZVQqnHhQQRb5npzaxfZXIHd9AWZbTWE2j6JHSKXIm2pI/j54opnJA8n6dCajnrvlGUy3+Im8NJu961GXAhfi4NorOmLM5xXS2pUmMjuaP9dj4YmvbR/qFdcwBjlrYC6hJvNHcGPvBd2PllDjXxc1vHP/HOMoteEyKTkUj3Lv/cV+3ppfsRssBbhQlm3Fj33r1QUP9IqMI66Q6WEYxu9GHwvWw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB3781.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(136003)(346002)(396003)(39830400003)(451199018)(71200400001)(7696005)(186003)(26005)(54906003)(6506007)(9686003)(478600001)(8936002)(41300700001)(52536014)(2906002)(7416002)(5660300002)(316002)(8676002)(76116006)(66556008)(66476007)(38100700002)(64756008)(66946007)(4326008)(66446008)(122000001)(55016003)(86362001)(38070700005)(33656002)(6916009)(66574015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OWZNWkVYbW9CdkU1YWhmaXBkUFVHZnRPcksrc3ZGVXpGRENEZkplU3JaUTBQ?=
 =?utf-8?B?SHdaTXR2Q01waWVVZVNuQlUvR0VwUHpWQVVmRUh1dUxwQUpuUGVPa2Y5S1BI?=
 =?utf-8?B?QVErV2VsUmFmZVV3MjY0TVVqTG5idWFmK1BuS00yZ0hNODJEUys0UjNQWHky?=
 =?utf-8?B?VjVEWFB5aE1qcEQyQXhpVytKem5HSnRsd3RsNGhYeFhkUmduTFZ2WVYwd2dZ?=
 =?utf-8?B?NExrNjErN3I1VEJPQjJtVWlqenZ3dkphVnNuSTNkSlhVUERPT3ZCanRyempC?=
 =?utf-8?B?UVIzanl2VzQ2aGg3d01rZVVLVkZMY1ZPdFlBMytER29tRGtJWUZMS2VpeVh4?=
 =?utf-8?B?NElwSTdULzhWeG9oWVZXTjl0ZkRzbDBxWlVjTlZwQU5RUEt1elZwTUJ5YkpF?=
 =?utf-8?B?N3MxWXN3Wno0c0FBcks0N3dMcCtWSDRvNUpSeExEVEFnM1V0SUlHZ1JJL1dY?=
 =?utf-8?B?a1l2aHNXUUZlOHQ2RTBqa3AvcStrOHFZMWN1bE1EbDJaUFZsUGM3WHZEam90?=
 =?utf-8?B?dVI2N0x2dWNLbjBxTTlXcWtRY2szMm1UUHZUY2J4TGtGZEpTU0MwQWd4Rkk2?=
 =?utf-8?B?eFJYL0tyNmI1UnZiaHUzUlNtSjg1emV3eDR6NHUzdEtUWUlvcmhyVEhVdERH?=
 =?utf-8?B?cUo1a3d3RVVaZHdnRzkvMzRxRDlJNjhlOTZmNUc4b0E2ZUZYVyszSnlMZXlp?=
 =?utf-8?B?c21wRXBnZ0ovRnFpUWF5TW1vM2pYcDB2ZjB2Qk1JRFgvV3VLYnZxdjhMWFp4?=
 =?utf-8?B?Q3l1WEUrL01Fd2RSRm83OVJoVS8xQ244b3hidUtlaU9WYnN0aUM0aHIxNGY4?=
 =?utf-8?B?WEsxeU1rRVJwTWp0enZtRGV6NXZwZjRlS20vZHZOTVdDdk05cVlVd3BXeEJW?=
 =?utf-8?B?WXhPanUvRDZxZ0VHdk9Bc1pQZUl6ZW4rbHVTK3BOdGRLMVoyWUpzVG1QdkpI?=
 =?utf-8?B?TGtsdGoxK3hpbXJEcWp2bWhVSHJNNDlsdy81MUxhTEFEZmJhY0VZK0JudHph?=
 =?utf-8?B?Y3FDTGhWWDlNTjJna0tVTFR5VjhiYWhyMUgxYmtMV0ZIOHgyQzBaWDI3TTFh?=
 =?utf-8?B?S1Z0bVBWRFJjQndKQ0ZpcDJZWVVZNHFvWVRIOU53U0Y3dkNWU1hxZHhVWmFM?=
 =?utf-8?B?WmRlUithcXZDQVRUNStURzZ5ckxYYktaalRhYTlVWGNvdzNZMkNNS2ZlWEdM?=
 =?utf-8?B?RGh1Q0cwb3lzdjZqdmVPSnBBSkV3UUVZaDQvaS9sWTY3TG5MamNmZUMzbXkv?=
 =?utf-8?B?RWVsaXNpM3RqTjJIRE9rOXc0ajhZc0J4WUEyS2tYWTY4NHZMeHFOU1h1L3ZP?=
 =?utf-8?B?VlRqcTZaZFk4K21xVGlHWjQrdm9IZEVCNUh6aHJqcFBhM09hRWVDUUJkZjdu?=
 =?utf-8?B?T1JRMi9MK3lMMENmVlQreXNtQVdOakloYUdqcEl6QUIxRXNNS296cWtKYzkw?=
 =?utf-8?B?TXdYL0tmOUxYWC9PTXRPZGpjSEhabDNoQzM5dTYwWWJINEprT2xKMnBKNTlB?=
 =?utf-8?B?Ym9QcTRRV3p5S241cTZLLzNoQklGVTBzd0I0dS9pM0hxQmZrejBDWFJMOEYy?=
 =?utf-8?B?dWw4NmxGbE5EdDNSajh5UWhSb2xPdmVZOTJQWE5VeFJjd3lUcTVnSEFQT0FN?=
 =?utf-8?B?NzZYd2x1UEM0NGozTGhHTk9nSjZtRGVLYm5xWjRHajh4cmdUV1ZSQkMvVWEw?=
 =?utf-8?B?NndINUJJcHhSS0xERGdNeEUrd041MHdkTW9Pd0NwSDNXS3czZGF4b2dHampE?=
 =?utf-8?B?UzJNempEMnJvWjhXdkZWVGlROWY4RFJCczlaQzJXMjdCMmRHd2xFUGxuQWxP?=
 =?utf-8?B?aFZvakREZEE2aktSdmdrRWQ4ODhBNnJpOUFTU3hYcWl5WFhodzQzK21wWWJ6?=
 =?utf-8?B?RS9QSTZCR2wreEhiVzlQSHBSSVZiekFGUW8wL2xtb3ZvcTFhWTkrR0ZRZlYz?=
 =?utf-8?B?TkZRaVNEeVdkc0YvL1hEaFhDd3RJUXErdlFjcHVNU2EvWUVlc3E4ZDN6QTkw?=
 =?utf-8?B?bEFkOUxpdkNKUWo2NU85MnVNajlQbVpzbXZwMm1EbVdaN3ZmMHA4YVltS1ZV?=
 =?utf-8?B?TDF2NDN3aGZSYjA3QWxJb0F3NHlKbzRrNGpBSkRXaGF1UXNsL0Vock5RK20x?=
 =?utf-8?B?eDIwR0xXWWwzK0JoakE1RFVHWEtyVE9waDNSY0RUOFRlSm5XRTZuckJPbWJl?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB3781.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387de25e-406f-45c8-aab5-08db0d63eeaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 01:45:05.9845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrbd0tkDgE/pa+3bUPcSYqczoyTCJcMHaB2LB/2wLHr+TQBCLMXpOLN3ufmr5oXiPCSFovpEJk4ePTkQ8aTEVYUrDuGulRc1JYx3LVekuTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6141
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-serial <linux-serial@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, Jiri Slaby <jirislaby@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+
IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTAsIDIwMjMgOTo1MiBQTQ0KPiANCj4gT24gRnJpLCAx
MCBGZWIgMjAyMywgQ2hpYS1XZWkgV2FuZyB3cm90ZToNCj4gDQo+ID4gQWRkIHRoZSBkcml2ZXIg
Zm9yIEFzcGVlZCBVQVJUL1ZVQVJUIGRldmljZXMsIHdoaWNoIGFyZSAxNjU1MEENCj4gPiBjb21w
YXRpYmxlLiBJdCBpcyBhbiB3cmFwcGVyIHRvIGNvdmVyIHRoZSBnZW5lcmljIDE2NTUwQSBvcGVy
YXRpb24NCj4gPiB3aGlsZSBleGV0ZW5kaW5nIERNQSBmZWF0dXJlIGZvciB0aGUgZGV2aWNlcy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoaWEtV2VpIFdhbmcgPGNoaWF3ZWlfd2FuZ0Bhc3Bl
ZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9h
c3BlZWQuYyB8IDUwMg0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJz
L3R0eS9zZXJpYWwvODI1MC9LY29uZmlnICAgICAgIHwgICA4ICsNCj4gPiAgZHJpdmVycy90dHkv
c2VyaWFsLzgyNTAvTWFrZWZpbGUgICAgICB8ICAgMSArDQo+IA0KPiBIaSwNCj4gDQo+IEJlZm9y
ZSBJIGxvb2sgYW55IGZ1cnRoZXIgaW50byB0aGlzLCBjb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4g
d2h5IHRoaXMgaXMgbWFkZSB0bw0KPiBiZSBlbnRpcmVseSBzZXBhcmF0ZSBmcm9tIHdoYXQgd2Ug
aGF2ZSBpbg0KPiAgIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfYXNwZWVkX3Z1YXJ0LmMN
Cj4gPw0KPiANCj4gSSBxdWlja2x5IHdlbnQgdGhyb3VnaCBzb21lIGZ1bmN0aW9ucyBhbmQgdGhl
eSd2ZSBzaWduaWZpY2FudCBwYXJ0cyBpbiBjb21tb24NCj4gd2l0aCBubyB2YXJpYXRpb25zIGF0
IGFsbCBpbiBtYW55IGZ1bmN0aW9ucyBhbmQgeW91J3JlIGRlZmluZXMgYXJlIDE6MSB0b28NCj4g
KGV4Y2VwdCBmb3IgdGhlIERNQSBidWYgc2l6ZXMpLiBJdCB3b3VsZCBzZWVtIG11Y2ggYmV0dGVy
IHRvIGFkZCB0aGUgbWlzc2luZw0KPiBmdW5jdGlvbmFsaXR5IGludG8gODI1MF9hc3BlZWRfdnVh
cnQuYyByYXRoZXIgdGhhbiBjcmVhdGluZyBzb21ldGhpbmcgZnJvbQ0KPiBzY3JhdGNoIHdpdGgg
bGFyZ2Ugb3ZlcmxhcCB3aXRoIGV4aXN0aW5nIGNvZGUuDQo+IA0KPiBJZiB5b3UgaW50ZW5kIHRv
IGtlZXAgaXQgYXMgYSBzZXBhcmF0ZSBvbmUsIHlvdSBzaG91bGQgaGF2ZSBhIHJhdGhlciBnb29k
DQo+IGp1c3RpZmljYXRpb24gZm9yIGl0Lg0KDQpZZXMsIHRoZSBtYWluIGRpZmZlcmVuY2UgaXMg
dGhlIFVBUlQgRE1BIHN1cHBvcnQuDQpIb3dldmVyLCBkdWUgdG8gdGhlIFVETUEgZGVzaWduIGlz
IG5vdCBxdWl0ZSBmaXQgdG8gdGhlIERNQUVuZ2luZSwgdGhlIGltcGxlbWVudGF0aW9uIGlzIGtp
bmQgb2YgaGFja2luZy4NCldlIHRob3VnaHQgbGVhdmluZyB0aGUgb3JpZ2luYWwgVlVBUlQgZHJp
dmVyIHVuaW1wYWN0ZWQgd291bGQgYmUgYmV0dGVyLg0KVGhlIFVETUEgY292ZXJzIGJvdGggVUFS
VCBhbmQgVlVBUlQgRE1BIHN1cHBvcnQsIGFuZCBzbyBkbyB0aGUgbmV3IDgyNTBfYXNwZWVkLmMu
DQoNClJlZ2FyZHMsDQpDaGlhd2VpDQo=
