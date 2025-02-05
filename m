Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E7BA280A4
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2025 02:14:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ynj1z63vPz3bfc
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2025 12:14:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200f::72b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738718064;
	cv=pass; b=ODug9kjsesTwFiw0oFXq13Zi7HJALpkoewAZgKclylhyGTZGBcIkCYvuzB/hqfygI6JGBAUH/HndOLilCIaoBNN7+arJWCvCNIurYnCgV4DDfw15YNZc8PKNhCLrj5Fk2m3Bo9uzsFxmVkKkC7gN5tRXeBC/QGwlmucrmgU1s72HtJc64k0YTajO9jUD629RIIWW8TJ7alcdNlpiY9XgEU9w8dfHkg57/YoUkSayC69pp7wmOlxA/S/D2HYQEIw9SBsYX1MPuG3A/5r1uGiJDraWhHz+zXLzen9UC5q6Fms2IdAAHrgwxC4CdDZciWCPigZwhR++xKFrGkmYwYJyqg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738718064; c=relaxed/relaxed;
	bh=531eewIykQUfivLb0yL8U+VbUKxOsCGpM3ZFt08bGco=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tw/63hHAenQU0dcJiNtug+ooBTBg2ilTtlJdlJJIaRM56HFTstZMfIk/5/EBb8nf/KCI9AOx6dBvHxkxa8Uwdm9UGjYkf/bjfiEIjzU2HxBkccBtvq52g/s7sZ18wSiUHMdz8Hr0icebdYMl/2EywKDaXPBpKcY59qWKnFoFF+qLl+qkXY2CldLoa3wNKZKFq0teTjoSjyO+0rdiQiqjpN5HLZlr28OKimBKtPoxj8QqfANG0DMmhKruwCt85HxcUHC2GbxC715HTWiOlg5w0ICLecO8JKoJ9we3W4spVgm14x4yV0qb/SPL1M9siuLlOXBKC29umPAT73A4MGqKew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:200f::72b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:200f::72b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2072b.outbound.protection.outlook.com [IPv6:2a01:111:f403:200f::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ynj1b4v8Cz2yGF;
	Wed,  5 Feb 2025 12:13:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOCs+kDgsWrSR6EjV9OI9d8X/KhsNwptdCZyUe8XKYzt/yT/K5y4w3jgZ65xjk4gWME4wVSHDZKNuunp4R7jsuR/NylE8Q3tIrqGrDqdhgYQr+OvZMh/QufOP8JZF1WfCRsRJ2KFTHFn2WfSUtpM8zmpgzYrYs6Hki6CMqA7hyWAomnW2zG58LfocaMMf0UMAU/bzEbFy0LMKgIrBJ/IhWxKA7aGuDI1Kjfj2ZgQCPT2mbgQ5i+dQ9QC7jDmkKuvVerT+jozi45hT4KLBbfwv/Oc8OTwltf9joxmEOuDecoSiocFug/rtOi7owPkNDhqvtLCH4CdQvpDwObhn1oJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=531eewIykQUfivLb0yL8U+VbUKxOsCGpM3ZFt08bGco=;
 b=v+LhRUmehhuqORiaSLOIAApeqVajk1O2GnJ8IkX/bUHPQ3qNNPnOSsUwsJrPUy3lijFmaX+yOS1AkZQSpxZjJdK66tqqZDtutXU5Fi6ZB44VFqpNAqr347xK4MDpI20bjCQ3YECc3LcEDpiwfSb6OVqERpvVdJOZz6qANcCvhvp9tAFpZKEN/1yMO8BVBn22fSr8zNA8OEnu3wel76AuxwPjbH9g8Rmb9lZYzyLwfG+M1p1NdEDyxiczCHljAb7mHN4qN8a3n1OaML9FN+9+ow2wxzoMp1TGkfAn0Ki8MVK5t8COfnROxIXSvl5nbROKvyi4Yz9M4w82XWFh+SixUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=531eewIykQUfivLb0yL8U+VbUKxOsCGpM3ZFt08bGco=;
 b=Y+8OuRjmdrAv+m7ERkHmof7H1lRJy7/i2JICcy93FswWZ88WFNlBz86zA0JCQXkr06jfRj7pKtD7/8uJbEHhANqt+8hJ2FlvrNBeQa84AtSwD7l0qJLulKtlLBEdVXkkh3RQBdTOKWuzl/SCgfna0iMD3FQaZGSFrzBaZP3Okm4Mi4fZROkDIkkKLCXmzeuibe8ZohNzjyZeRLxLsdUWMKfF3D48KyQ++dNAVzIR5YhX7ApRWXygAH5dA8anwZQ2nRzhixuNlSRXPwc+JdKyITF6AIBvrTUKXRsLMjICCW5pJ4d1H17Lell98mDyLjOpPRzVQzvNpomyhH/38H5W7w==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by TYZPR06MB5483.apcprd06.prod.outlook.com (2603:1096:400:288::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 01:13:31 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%7]) with mapi id 15.20.8422.008; Wed, 5 Feb 2025
 01:13:31 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "eajames@linux.ibm.com"
	<eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Thread-Topic: [PATCH v2] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Thread-Index: AQHbdvIcpN89Y9FlH0+W/fgiURP0s7M3452g
Date: Wed, 5 Feb 2025 01:13:31 +0000
Message-ID:  <TYZPR06MB656885B87A6300425F5C4D2CF1F72@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250204085041.3724290-1-jammy_huang@aspeedtech.com>
 <d705e66d-8a5c-490b-b277-f29429c207dd@kernel.org>
In-Reply-To: <d705e66d-8a5c-490b-b277-f29429c207dd@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|TYZPR06MB5483:EE_
x-ms-office365-filtering-correlation-id: 8a219154-2946-4cf5-ef6d-08dd45824e18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?N7ACKJqOJw7QzAzlPbe4bqtfEv6i3PieprRNPeIx20bYgWM4HUNdzZpuq9Qn?=
 =?us-ascii?Q?z5dS6jneA+/+GGMTOgXhgMnF+nGMEGwr+MyBs1cljE1oZ1wIrnM8dDW/ipim?=
 =?us-ascii?Q?O0LaiLr7CBKEGdhtf/WToKdaAeSZYqtSw56xt2VxJjE8q8Y/L8JilB02kxcj?=
 =?us-ascii?Q?ay79++jmIM1J2ka4saFC//z5LJIPz7KvDi8lxN+yxbfBgZeUhflJ/h3BlK47?=
 =?us-ascii?Q?oPX3O2KbLA4BXGgntsOIQQ7fa96+0Yzf6uoSm+2mwausRC4hjn0iJJ0flgCL?=
 =?us-ascii?Q?76IRaK0KKzcYuKjMLiWtf5/TirpbR1VVJf2UZ0lr8hJ6SEg8Ex/Whi2wtbch?=
 =?us-ascii?Q?fZs+9EKFSojETlpACYoCTLzeENU/IH1ANdn6Y8zzjj1a69dnPr5nrJY1RxbK?=
 =?us-ascii?Q?VM8AbETpY2L3YUvtv5VQE4dJN0jT4DrOvBqprbBoYo0WltFr/n2zYZy4S/ks?=
 =?us-ascii?Q?ZvSLjjgvnLe7k1ApsE9btMPX/15HUSKurGuSiCltW8NTrpCd2JyzSPFGCN0f?=
 =?us-ascii?Q?PZVLuNZczIo0yjVpA2zzwcGh/PriaU96C+Xzo7CG2A+OKQ8Z+2oiLp2XPVBI?=
 =?us-ascii?Q?0+v7/B/mUCAPq+Ye1eGLQzetFurjtvownX8hB1ro4f/MueJ7yR1+/rTHNN/c?=
 =?us-ascii?Q?s62/QVXRRoRzsczSrl47HEBO7xDBx2YpIwOdzmcUqA5t68PCnhlv6L4WGkp4?=
 =?us-ascii?Q?T5FAnMuzhYkJNktj/CdBn/O949eh5sXpgfI/0sKebhaUIq0tjuhh1ZNRHvqi?=
 =?us-ascii?Q?vyBDqB0gcTldziifRGB5kQmskU2Em5+xWOdkSnm4Ts/6gDXZmD6QlQc+6BFb?=
 =?us-ascii?Q?BlcH5RPnlpCwFkB9VFmJdG3dX8x3CBJfL548O9hFd7MPGbNdn1Uttd3JRYw0?=
 =?us-ascii?Q?Pk8Huo2ZILI2HivA+2sY5FY6CACRp1Tw1Wdkeh8YGPjux1TBD2p+s4RG077w?=
 =?us-ascii?Q?uakoWTVukudeaE/ZRjcEpBK6G2hV0NdAcb3FkTGARgWQvJktF9lnYHiFD2Qh?=
 =?us-ascii?Q?cWqQModWoTlthoduOLctjmGGEzam/2T6/tQ0m4ry8iAMfl/1C8l2lhVkdWVU?=
 =?us-ascii?Q?WQLmzWTBmuwAPFPWaUt0eBiRE3YEJxK6fTTtgFgl11uy2Gc8Oi+qHR8REcGu?=
 =?us-ascii?Q?eHnnSk12QrdQV9tl2wE9w36lZQ37Hkm1AjD8WPYOp9/jniZjYjY/yNrMcayA?=
 =?us-ascii?Q?cvNRG8Iacnd4ssP6APutY4idbyScAMX6uxnufT9/9/Q0LW8puLzsFTlszefT?=
 =?us-ascii?Q?cFNe8l+E5GOLNNmR2whuGpqA5tVp9mqwXieZSxmfYf6d1XkzgIY44oV19As+?=
 =?us-ascii?Q?kfNCp19xKvDkCK9JDgN2DVottO0G+cEZtVXYucHj0oYqtBipq3CiBT5fxTXX?=
 =?us-ascii?Q?kU0OpSKFhp8DZuk+00e2QJGlE5PJRBKaffsX75b5iy6IvepLFfonvTKQR8L1?=
 =?us-ascii?Q?g8BJTl79mOxKVVyv18vmd0HOWDI+3VXNz5xQ7cBXHtY9DGwDwTRXiQ=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?p6t+Ijm506RmTDda15RyGryXwVEDftWICDtDn4k1eihbTI3hCGlP1fIGI3QM?=
 =?us-ascii?Q?xAOvnZGvzGGShnCh6cugDA8lhndivQHsruFoonbluVhUxhcvfc9UK8hCO14Y?=
 =?us-ascii?Q?hSPF/kZLj+uEQGOAqNery+wcCN1aG0YHi+iOAe4q82Ikq7NAqph0XYzfDmCf?=
 =?us-ascii?Q?tXOfCMHu1L8+jPBXQbxISNC8aOayq21/Bs6aDQKbWOkhAK8DQ7Pabg1x9bMh?=
 =?us-ascii?Q?MHpxhaL6uf2JQZ+eU8UwsjdBieERzXz4tGC3Si4423wrH9Rwdoztw6DNVZzG?=
 =?us-ascii?Q?zavSGvoH/oM8fo7jN0FE/AbVOiNmZ+HbetX5vUTIAGFOjVyiix73mT5GxlFq?=
 =?us-ascii?Q?2FLBGG/WZ3i90ADmV66YLWYpwXsRG/jJRn54SmiA4a7cLglLWUXg8mjAMXaU?=
 =?us-ascii?Q?7wWRtt3FYaiXcem61vwxZwzX2v/0XgSYMi9whfjNQJQSvC2JYWGVbT38rVnh?=
 =?us-ascii?Q?6is+8hxV5bsG8ZaZaUsvaKFxKEaRgEAgDiAjUZp0IyEFGtOxFxvnIScBfl2G?=
 =?us-ascii?Q?dNXpr+F92qDrjH/mR8U7qVcocxrTCQ20J/Fi5NxOv77b6kl+6VaM6OsmOutc?=
 =?us-ascii?Q?beAtxv7HNfFZsq6quJc10oLVeVbHeUfCm5eeSHoJnCy+OHtoWU0KqizpxSNp?=
 =?us-ascii?Q?FQWqL3ghLE28oZn7wJjJdXDzMwVEY/EXmmDmqSlNf3GcR5lk+5XG35iueulG?=
 =?us-ascii?Q?HwgPLVxRFNjiM53lGiWLI2hifXYHnGMXaS4i3la65DqTlNskhPYHuVSj7isT?=
 =?us-ascii?Q?bO/KV0YvVqkQwYsYmLqMgNzeWvpJK6eOSpbzRZax77modd/p2ea98Zf58ku9?=
 =?us-ascii?Q?PfeJaDLrkRHj1nkXaa+6wJ1kA/JCa8mFipu7U2td9QNak0SX52OdndvO8J56?=
 =?us-ascii?Q?YDBti1fa0rCmu7xNYHEf8jloCKnNXQImMX/6k1c0mwx+UqThHCxV/xPMlbcF?=
 =?us-ascii?Q?3EQpbt9IO3NJy0N2GVx8FJPqnFLUB8pc0BHObh6XQHd9SWZXUkKLNnJubB5X?=
 =?us-ascii?Q?KJ9lvhMKcXaodlEBSoEOw01R/0Y/au6IKT/R88vyocQ6tYS6oHAtLtUY2Y/+?=
 =?us-ascii?Q?C03s8YTb4vGpDOondfI2GIOhTgeg8sJeVMj285uAGcp6Mka9s8OS6rGXBQM9?=
 =?us-ascii?Q?oDIpTM8pi6UmBIX5Pi+bm5SCSgjzKuK1+sV2kOyYIjkNwnwBbqT3ox1KxCOz?=
 =?us-ascii?Q?2XwdujrvquR0DOw851+gXG80fqKYmJZOhtQlc35SpFNLB3IO05siilScD071?=
 =?us-ascii?Q?GrSyGlZRvUFz254meQBkhQEXue9jHfaXmQZPplpsRXn1VuEwIju1eKQpWbzA?=
 =?us-ascii?Q?idsAVvAyFuWpEB9hHRZvmbhyMNDBx7SuQlZlan+8lNys7o0cBsBmgqG6K6Kx?=
 =?us-ascii?Q?AFXjwZLsW4i8hFcyEWZGSPoLUXHp7NAgfya5ok99/V7XeP6IfYKq5g9GeBS7?=
 =?us-ascii?Q?7S+zrzrKHFuxQCxoPgI8Yvn22U1h/WK58kkij5D+2EijObZh2EgiHY+/+qnQ?=
 =?us-ascii?Q?cEHRk2CHk8IqGnbGQoauu/VX/o0bGx9XJj4idGYCeqmuKNouh036XLfcRGKP?=
 =?us-ascii?Q?SGxOl4d/ZV0fN9MQQxPPhUDJUGhg+Tvt710rx+5MasFqjazKmGa4FqtP5T6A?=
 =?us-ascii?Q?Lg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a219154-2946-4cf5-ef6d-08dd45824e18
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 01:13:31.4273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RUzrXjvZ7/8vBTBkPE4VliAsEAxN4qFAIo4C63BhOMUh+5KHWj65B9p4RJuft24gVw9dpt8/ogKPsitg9tBfDGyxrDubsy9uKONEgn/XpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5483
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Hi Krzysztof,

Thanks for your feedback.=20

> On 04/02/2025 09:50, Jammy Huang wrote:
> > Convert aspeed-video.txt to yaml format.
> > Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> >
> > NOTE: The following checkpatch warning is generated since we do
> > include the header in the example, but this is a false positive warning=
.
> > WARNING: DT binding docs and includes should be a separate patch. See:
> > Documentation/devicetree/bindings/submitting-patches.rst
>=20
> This does not belong to commit message, it's irrelevant. You can mention =
in
> the changelog, though, but IMO, that's really not important for this patc=
h.
>=20
> >
> > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > ---
> >  v2:
> >   - Update commit subject
> >   - Add NOTE for false positive warning
> > ---
>=20
> ...
>=20
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +    description: |
> > +      Phandle to the reserved memory nodes to be associated with the
> > +      VE. VE will acquires memory space for 3 purposes:
> > +        1. JPEG header
> > +        2. Compressed result
> > +        3. Temporary transformed image data
> > +
> > +  aspeed,scu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
>=20
> Do not need '|' unless you need to preserve formatting.
OK.

>=20
> > +      Specifies the scu node that is needed if video wants to capture
> > +      from sources other than Host VGA.
> > +
> > +  aspeed,gfx:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
>=20
> None of these two properties were in original binding with *justification=
*. You
> must describe any changes done during conversion, otherwise you could add
> here whatever property you wish, right?
Sure, I will add information for these properties in later patch.

>=20
> > +    description: |
> > +      Specifies the Soc Display(gfx) node that needs to be queried to =
get
> > +      related information if video wants to use gfx as capture source.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/ast2600-clock.h>
> > +
> > +    video@1e700000 {
>=20
> Looks rather like: isp@
Do you prefer other node-name??

>=20
> > +      compatible =3D "aspeed,ast2600-video-engine";
> > +      reg =3D <0x1e700000 0x1000>;
> > +      clocks =3D <&syscon ASPEED_CLK_GATE_VCLK>,
> > +               <&syscon ASPEED_CLK_GATE_ECLK>;
> > +      clock-names =3D "vclk", "eclk";
> > +      interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +      aspeed,scu =3D <&syscon>;
> > +      aspeed,gfx =3D <&gfx>;
>=20
>=20
>=20
> Best regards,
> Krzysztof

Best regards,
Jammy
