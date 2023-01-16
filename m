Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349DD66B62E
	for <lists+openbmc@lfdr.de>; Mon, 16 Jan 2023 04:34:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwHgv02W8z3c65
	for <lists+openbmc@lfdr.de>; Mon, 16 Jan 2023 14:34:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=1WktJb1j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.215.136; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=1WktJb1j;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2136.outbound.protection.outlook.com [40.107.215.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwHg81NPxz3bZj;
	Mon, 16 Jan 2023 14:33:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alIXrtXndYpERYLpO/tI4Ek/96YbKboqGLyPgqFMChnXGckaSKdHiyr1zyJop2UdSBrQ1KXXxaG8mf60bG1UOrvLU56m3Dz9iJybacnfqNuSnW2Iq4+nV7Yf7+Asy+7dyUqBv9W61nYJIOc1sO3wGnLezXVtTgeUX+Ii7oYBam+PAjhafrRj73s3DldcBqyOIiBzBSpbuKph0EzpKGkOtPIL47TYg8o51x2kwTNhnN8X9wpMM01tvdIDGk+yAe2ow2t5ayZ3l5c9QpzCC8spjy357gumLMvBzrVoAHkAprE7+mvzwe4d/w4VOrv5uOsv6syfdQcJEEfUlO0qazCWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI1ZVlHaPP6Az/tvvtzd0FRT+l1SO4BQnq6Fi5e1x9M=;
 b=SIEWxcO+7r06oNkfENshaWzg1Wt2h9DPIPIhCItpbDo/MvcWKO4NUZSgXGd+AtY9l9G+oFUFQrjPtIv4ZGA0oS02PnorQmrKPRke4rhwj/T1WpG3F43C6wZgYUQvbc02+c7r+Mha6hGL4sWEZg4qenv20bCGagZDulp43vMMqt2xvtg/dDzgeXOa8AGin6g+Qmc08u738XR3H7R67ovGDkFocPja7XhXxL4Whs2pvc3fCducPxnESnd+vtwoMegzH29hXCfSeG3blKg23HUbGsUhKIkNxgg12Ow58lUYLwAX/QEHsm6q2MLdrobpS5J95Scl0SKdwRrbgjvK//HX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI1ZVlHaPP6Az/tvvtzd0FRT+l1SO4BQnq6Fi5e1x9M=;
 b=1WktJb1jOZo1KjY/dpyLxAqwBaA2Hj60TjkSuQG813F+QVDgy9gzADpeI0YgZp1T5DNEkLEuduB7PisyhjFHJY5LomKQAWpQleX3irAfb9EJLoTvIz+A5wx57xUrPsf3gpasEhQ0YTBKcJ9LEW/CJq6wHSqwwRgT3IWNRtCdpPXI7J7qjZL+hSxnkBBTe/JmGYfuRDQUHly3pMmyKxfCifmPEnZXD/uUYLXeblmWJBNmeZlwQicKVXGt4a9Bfp9BbcRPSpB4QbJjJS3LBi3vydgQWUyHsxBOT18MS2EX8eRWqhzvBPN7CYXb6ahGWh5SG4ysCKelfcEXIdRoLvWjKw==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB5944.apcprd06.prod.outlook.com (2603:1096:820:db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.10; Mon, 16 Jan
 2023 03:33:16 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Mon, 16 Jan 2023
 03:33:16 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH 0/2] Add ASPEED AST2600 miss pinctrl
Thread-Topic: [PATCH 0/2] Add ASPEED AST2600 miss pinctrl
Thread-Index: AQHZH1b1LTqsdnfNSkKXmN3Th9Enf66gd64Q
Date: Mon, 16 Jan 2023 03:33:16 +0000
Message-ID:  <SEZPR06MB5269DA226076831F4B36135DF2C19@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230103093702.2613574-1-ryan_chen@aspeedtech.com>
In-Reply-To: <20230103093702.2613574-1-ryan_chen@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|KL1PR06MB5944:EE_
x-ms-office365-filtering-correlation-id: 95502ce2-0561-46ba-5cae-08daf7726796
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /l/QzNCwY+vzKfYLYzTgkl+BzeO1EOOQzYZfjhxM9Wl2auL42WkKGE0cHfZbXjwTZib8Mxa06BlKKW0sKk9ZmuV+anjHJPE3+7y3EORHkbaxe3NehRBWjPYojXS3NeoZtiLGLwU4WUwvGc10aPy7ukSDOouvSzPVyX/E7ZwCxpECVCqs4hG0lzQRTWN5uHRxguuh1wMyC56RnhTB4p9PFvB/UhdtnKgMg/nlqDnUm35B3H4GyQ14EZOZx7TMdjGXy5RPoT3ynwC8ThBguaXRyeU0a4YHF5F/1PPAqmyEyC/ZUVdUJpc2CJ7xwGYXTpYId8q8Ljdkt9o11zjIdNwDDV1HRgERjHpK7kRISvRrokaYXmF7uZesRW4tUiNa0t9QSvlwwdetNrGf49jLCUwP5cW7eYCQWVG03fBAK51hslN/TIvW9Y1m2Oe7XBsHL8xOv+6TTR1IxOBW307LAhV7CXDKmEEfTWgqvswbElNMxMRiPWBCEMnLUrNf+KA8lFJc9bBcRrClD93MYxAzz1ZdC0ua94KSm9TB8432b14SKXUQ1ueJzPTbQM3Q9Ai7MnTh6Tm06oZN41DvVrQYjZ+8yC9Ya9OTvMDavW5BluPoKROozvO/fRcivaMgSJNi9sVWV5CnxudAt6bbO5GLknQDTreXL9nrBEwFI4/ASuIsK/jxEYYAm5+yc0T76g1eY/bqonct595Dxv8Ga1lqB1iX8g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(396003)(136003)(39840400004)(451199015)(53546011)(122000001)(38100700002)(5660300002)(6506007)(107886003)(76116006)(66476007)(66556008)(66446008)(64756008)(8676002)(66946007)(4326008)(478600001)(2906002)(26005)(38070700005)(186003)(9686003)(71200400001)(7696005)(4744005)(33656002)(316002)(52536014)(8936002)(86362001)(110136005)(41300700001)(83380400001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?1R9z6bQE4zilphITBII8y5mfiDgBPscaRgdQzHfmLdChYWX26CdvNbYXx0t5?=
 =?us-ascii?Q?q8+yMphGSFPHpu1gXxqxsgP5Ltb8N0c3hElKWvO/PFSrplWe0pPSwNHAhsDk?=
 =?us-ascii?Q?uti0oGJqEWyzYQ7fjXNFG97QNZDD/+nvwIVb/k0kvvQ9qg49sWT7ouC0FxwU?=
 =?us-ascii?Q?muMB1Rz6NY9ldUTUF9oRjznxkupp2Xsgw61vjQ+f7EuhXvY+UtK679AJG9qi?=
 =?us-ascii?Q?RAKuv3dV6Vxv1korMlNxtsQeypNIcWLaVdKw5p5gdaScwwrwo79aHnK/fN7o?=
 =?us-ascii?Q?YzQxTV/gnyxFfy3+Vi2LLziJgw7w3fr9+JqityoON1RRx0Cs/MTIoj9lZleo?=
 =?us-ascii?Q?2G1qVg7E25jo/1osvYa/zcDOS9zd6kDW7hx9c99iwjIrhTyOJKxTSAXiba+O?=
 =?us-ascii?Q?DB1CNG6HXrjf1iA3JCLTgNa5ebfxapE9dlJYT61avE0VplROKU6t11SdcoZA?=
 =?us-ascii?Q?7m3WeQEe+10lJc5RUva0h+b1tI1Qsywdn6Wq3JXP8vUC7VklpcCsARD9fj43?=
 =?us-ascii?Q?U6uhWH5R9kCMspHy2GfpoxP13UMqnK+3bCp7wOiC271Z4CSDA9sHj0l2aqrm?=
 =?us-ascii?Q?v1xk/q4d5FJLYTRDyQ10bawfFE52ttjdmmb9cwlFssXUjFK6h/20PdwXFWyx?=
 =?us-ascii?Q?01VCBe1l+M3KcBGak0EZwYIxauxinc07VdISm8l32x3U33xSMba2/42Egqwm?=
 =?us-ascii?Q?q5H+PQwZYlb0PC+OsnSasQ7AYz4xlpUnmi8orFKXWpNGQJq/2tDTeYNIZgEt?=
 =?us-ascii?Q?PWcNwBIpbhL7fQcjH74I+u6nDXyYs+kfCo4WWusd3yHsnL9dmnSIgfJAKzSO?=
 =?us-ascii?Q?Q7K2YWXsfo9yPHR2wH2bZK8OXuE8oiAvuZZBTdUwWtYxJl+otbjpuTsX8rM6?=
 =?us-ascii?Q?k37Uk3c/COIJ+0FtDy7vyo56hejkX0ooUIQXmceWOlFp8qnBkhMxeK5m6zlt?=
 =?us-ascii?Q?FvqoEb1hEcY6nOGx7fh5cqBmHClAFsFYsWn/+mcNTrc8jlpcmpZUcewWh5CM?=
 =?us-ascii?Q?JQOqsxhjI4kRMx6DDR5LqzAVfETpOY6+GycBYOOhWYgKpxBZ9uqgLQ0ynPw2?=
 =?us-ascii?Q?0ncIShXxZGdH8l+Fri/8MPDYWyb1JSVyJBssUa9VFbebT1jZWCq9KrvxfsE0?=
 =?us-ascii?Q?WbalOBNznSdpVXwwfv15XJWXJayWq6KbhiJ2bLsuLIQrGU9JpkFtZvaEtuSY?=
 =?us-ascii?Q?FgGiwOR5nWVRxDKTmb4jE24CkP8hVAFlbBf++qUMJdK8ob733FCi7pXks2er?=
 =?us-ascii?Q?JLI4y9GzPyP+qmK58LL3A66UdsFgzgiqpenlmaNlAT5FGgaLQmEYPOc7vJfG?=
 =?us-ascii?Q?AnO9RnesaB08Tk9XdJpIDbNNoLDrUVYxGgiEdoZESvFeaeECx5x8s7jEikhv?=
 =?us-ascii?Q?/44DB7P9z9AgRek73r4kke0SEY2ex9mbiSJhE6zj8agKs2vC4pAC0gzY1EgO?=
 =?us-ascii?Q?UI67oymqnhAPgfpFEiUTUkS6cHedFfJLm36xxiAkLAjspHpRVG0uAbqAoYa8?=
 =?us-ascii?Q?TLoBgBdsojRAJJ/QwrW8abu+QNoqHBVrqX+i1YvEX9VKSFe7IRQK6cizgv/+?=
 =?us-ascii?Q?rASugB1pby8nqV/qidPS5DQpASMhFNAl5EPbBcOO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95502ce2-0561-46ba-5cae-08daf7726796
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 03:33:16.1961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fU2sq3MNeYpHAL3qiUnCAl9hQ/Ka0mQOEdpOhawLZJFkz3r7NmRjAylfUGRd8vdt6uYWTP0BIKJ1gJmNpExUIgFBwo7ywKXuqPc4X7PcNRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5944
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Andrew,
	Could you help review this series patch?

Ryan Chen

> -----Original Message-----
> From: Ryan Chen <ryan_chen@aspeedtech.com>
> Sent: Tuesday, January 3, 2023 5:37 PM
> To: openbmc@lists.ozlabs.org; Ryan Chen <ryan_chen@aspeedtech.com>; Rob
> Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andre=
w
> Jeffery <andrew@aj.id.au>; Linus Walleij <linus.walleij@linaro.org>;
> linux-aspeed@lists.ozlabs.org
> Subject: [PATCH 0/2] Add ASPEED AST2600 miss pinctrl
>=20
> This series add AST2600 pinctrl miss parts.
> And also update AST2600 pinctrl dtsi.
>=20
> ryan_chen (2):
>   pinctrl:aspeed: add miss pin and function
>   dtsi:aspeed: add miss pinctrl in pinctrl dtsi
>=20
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   | 216 +++++++++++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 341 +++++++++++++++------
>  2 files changed, 455 insertions(+), 102 deletions(-)
>=20
> --
> 2.34.1

