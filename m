Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B23104DD2EE
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:13:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKSGl4Q3dz306m
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:13:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IiXoRZIH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe07::618;
 helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=qiangqing.zhang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=IiXoRZIH; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKR9J5xrFz2xtb
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 12:23:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oR+oqaDfP6NUX7KCL66Y81cTqrc6WsIGqsQ+zU/CCAINThFjwa0IH1bZgXm9lIoT4WH66dpj5BIzWZgt3l5wF8rlGVBNk2WUuF0Q3HeesWWbyjFblYaNfRJU+sqjV1Hugtx/uhBTp4LStjEsse0h+djHG51yxbbik4gLsg33TgnpLghQbctNfiU7o2Ti+sx5AJo15dbib+aQX9ghpYb9qwfBSFG1BTdYBrLIRVIjMSnB1euKVeiZdvbCgzHg20E3IW/iL63HLj6dUGQ0S5FpngCj+dffzzm1u5mvPk9Mqwd5Ey24dJJqbvInFFCXWcxkhkbaW6M3grnV2EEflCNreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1jI+5Mw58DhSsfr+vCw5dlHZy/NKdDHA7P60U9t34c=;
 b=C42H3+v/GTrRfB8EbwMaSHySbZEKJOUJkupPHLBpgMERfOmig6065vrEqw9rHzpZTHXd9Hm83ha1NJjm//hCOXtHJIktjs04lsRGL5hqod5zTmPnaGef2jx0yBGvegiGcN0woXXQ7EkaLMA0/5TyOHfhRSyQpvCpitZ9vEAUGpOk/QKeqp1dzj3fUs3mthuTPrioyugT6CIIH1WZTICzYChWb2Z2+sg94RaR2BB3zzS1HQ6+QSb4Hhb6Y2p3RQGsG6qKAwoz1JF9+O+JpVD9tgfPA+CIKF29tn52EenZ8g8X5cdV8FmzECH3POCKUQaz9/wgskzUGkbbkl1PIJHXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1jI+5Mw58DhSsfr+vCw5dlHZy/NKdDHA7P60U9t34c=;
 b=IiXoRZIHOYxzDMjYdTIukE56BAwA+yeAC+CBlZHXa/dQcOEibiThYw6f6bv/wrOnyCJwY05sx//aYPyG2G0h/yJS76lJMOtYJ4S9+mQLNfv6vifmuJN6vtjUyfE8XueETVWQm9GfFR9zAPy9xnb3H/yed51IQfb0N5rqA3TQ/Jc=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by VE1PR04MB6704.eurprd04.prod.outlook.com (2603:10a6:803:128::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 01:23:04 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::39e4:6b93:c424:5a40]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::39e4:6b93:c424:5a40%7]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 01:23:04 +0000
From: Joakim Zhang <qiangqing.zhang@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Thomas Gleixner
 <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Manivannan Sadhasivam
 <mani@kernel.org>, Linus Walleij <linusw@kernel.org>, Imre Kaloz
 <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Michael Walle
 <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer
 <daniel@thingy.jp>, =?utf-8?B?Sm9uYXRoYW4gTmV1c2Now6RmZXI=?=
 <j.neuschaefer@gmx.net>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>, Cristian
 Ciocaltea <cristian.ciocaltea@gmail.com>, Lucas Stach
 <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Birger Koblitz
 <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>, John Crispin
 <john@phrozen.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Sagar Kadam
 <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>, Lokesh Vutla
 <lokeshvutla@ti.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-actions@lists.infradead.org"
 <linux-actions@lists.infradead.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-oxnas@groups.io"
 <linux-oxnas@groups.io>
Subject: RE: [PATCH 05/18] dt-bindings: irqchip: fsl: include generic schema
Thread-Topic: [PATCH 05/18] dt-bindings: irqchip: fsl: include generic schema
Thread-Index: AQHYOfYwX8p7cze/l0ec1UhT8/Bjq6zEWU3w
Date: Fri, 18 Mar 2022 01:23:04 +0000
Message-ID: <DB8PR04MB6795EC617676A9393610D70EE6139@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220317115705.450427-4-krzysztof.kozlowski@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 526e756a-7920-4ad7-7d3c-08da087dd9f9
x-ms-traffictypediagnostic: VE1PR04MB6704:EE_
x-microsoft-antispam-prvs: <VE1PR04MB67049712861C44F92D9AF051E6139@VE1PR04MB6704.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jMifcG4n04kYA3rwJxJ7NOU/95SwPLonjCuPniiNc9iSvJmpIci20A/wUDuL7vhPUmqsIUB0CF1RtDTnhzKN5dVazBbr393btWiXhfrFQLVuWagFpkP87ytmi+lveD5TlE2rTf0XjPAFXii4K5UnXpl/Wo00/YQsRR/3eMKubW+msXqfJhpaKdK+7KWRVQ3oliqrOA3wpNGYB7tiIl6aRaF2jl5H4sPhkpbb43vo0kmNwm9XJexYbd9Fhjmd993SkUEDQv12p69j6T5LxBgye4GdC/5lVEbyKlqR9+HNlrUK0XAFF25Il3EsH30gxeTuznUM6IcNBtudwCkMnyKONBcc/QFxEIc2CaJj6xV66DftBZAs1RFoPszmH4hGcNsCmW5Jc8ak9HkuXP7I+OCUB9ec+u0HSoE/0kqPWjjISELr4smgtETBJKF8eeF0c7mNnv3LTyYW47jKaDFZJnZ2mW0zJLR4c56T5zGRZgVidsV7p/B0FTxvf8CZ5jME4c+KU8ZvLwmFfaElbC3k5GYM2BahV65ZX2EJoR1oDHwFSOGy050peAYrA9mpFuMQYwKuIuZQ9mngN/z/ueQdLsjqy42brCcYTa0HnyC7YGqLhHG8sA6ueq62/87DpYEqVmGAXh+I/gYSE31wXbK5DKVuffaa9zhhqobVFdGhiaLNNakUvf+Cf6HzlGZw+AKixqAZHXJf4/bOFd8rUoU7zcBCFqrhLTyW6eo410H1KCqzOWCATq6aXiJ3UQxGFwk2gy0C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB6795.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(7416002)(7406005)(8936002)(5660300002)(52536014)(110136005)(86362001)(2906002)(83380400001)(55016003)(508600001)(316002)(921005)(26005)(6506007)(7696005)(53546011)(9686003)(38070700005)(38100700002)(33656002)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(8676002)(186003)(122000001)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yk9yRDIwRnJTN3dEclZHN3JnK0d1d3pncjczemFFZ09BdkZQc2JhMHUzWHpq?=
 =?utf-8?B?aE0vSTBvTllIelZYSk9MQnExRmR6S2VWaHNiRHFjNHpEQWRocFR3Qm1CS2Np?=
 =?utf-8?B?am9VbllqVFd4YTlFOFdheThqUmhYL0dmLzRSZXB4OXh2Wis4c3FpQVhDVm41?=
 =?utf-8?B?bVYyYkVQdXlldkdOQ2J5OUpyQXdJR0dxMCtLZUhhRFkwdHZxOEhGNjh3M21D?=
 =?utf-8?B?WTlNNGdORmJwb05hWWNGV3p2N0p2eXFoK2paY3BnbXlnbmE4SHRTWGprLzRr?=
 =?utf-8?B?eVZRWUcxZ2xaWTkrZlZ5QWFXV2hxUERTdnRMVGxTdEJRdGZnVFdaK21rdDJu?=
 =?utf-8?B?c1pNZUxnQ0ZHeEpObjYxMkhxcngyajRmOFhBWnNzano0cTFNSjdsNktpVTJQ?=
 =?utf-8?B?c3RJbDVXcDFPb2JkYkNDQ3VmcU8yeHZNQkhwSnFLUHZQWFZtcEJjcnV5Lzgz?=
 =?utf-8?B?VnBpaXQzVFJzbm1hTDZDM2hWVWplUHdtWmJZY0hmeVZkR0ZGVVN0Wlp0QldT?=
 =?utf-8?B?WTNZZyt1a1UvYlNZRzZVOGdhZGQ0by9lWlR1SmFnL2RsOTUra0Z3bDJtc3RG?=
 =?utf-8?B?SFpaZzdPUmdxUWNnUW1NKzBYaW80c2trZERNM1JqblFNYW1CWjB6L1BJZjlo?=
 =?utf-8?B?SkVGaDJmck5TM25KMUNzYnFhNlBURngvREUvbE54ZER0c3lFSFB5WENxcExa?=
 =?utf-8?B?OVlvekQyK0Fib3ZYUXpSUTBSZ3F2cUNMSFBPMmVuL3lKTUpqMmFkc0dhbldF?=
 =?utf-8?B?TEhzeFphZDRSL1pJZXF4d2grdU1VdFZ2UVMzQ3QyY1ZjSTRTTXREUVZkOENP?=
 =?utf-8?B?QkpkeE5kYVZNMElZcGhUOVdISEFmczJLYnlVRi9SY0EwSVJKK1FsMFZFNE40?=
 =?utf-8?B?OGo0aFJJbkx3ZDZDSytIQmMyNkszWVIvUEsvSWdCRXFEbjV3UkVpYVpYTDBL?=
 =?utf-8?B?Uy9jRUNMMStHNEo0K3hhSnV4cXRYY0l0Y1FpdkZqVW5yS2tKKzR2WWtrbUJj?=
 =?utf-8?B?WHhxWFdnS1hpa1UwNHVzYS9renhaNjJDZlpwdWg4cFl1cm8xcmt1cHNRZEdG?=
 =?utf-8?B?RU5jRDlybXpGQkZOVURVeUVNajJVaDdsbDhTdTRmb1hTRmpwUldLbUNEbDM0?=
 =?utf-8?B?VzUzcDFsNzArT0MxekpPSUZmM01lWFhzZVFUOFdWYzI5UTlYUkpLdVAyZE82?=
 =?utf-8?B?aGc1ZlV2WUNLTFFLOGFBeGVHSXQwR2MxeE9mbGMzVDlHbDR2b0lFOCs1RTZC?=
 =?utf-8?B?bXFPbmZtVlByK1NyMXFKc1dLNUVKNEl0NWlmNFhQTFhMMmRPbno0MUh3bjY4?=
 =?utf-8?B?NUUxcUlLT2VxclFXVEtORk5KajRvVkk4VThYL2xBZHkzQXZ0ZTZNNWNBUWlr?=
 =?utf-8?B?SGZTM2dNeitMNnE5eHRxeHhMZkZXTStYdkUwU1kvanFYek5laW9nV3d3Qkt1?=
 =?utf-8?B?b2pHTWtBZHhvdlVSdVVLbytlMktITjFGOTZyeDM5MFkwNXVZdTJrQnR4cW9t?=
 =?utf-8?B?bTRIYVJmR05RaVlBbHNnczU5YWxlNmlUL25TZUNZTGIrU05XUzZ2dERuYm9V?=
 =?utf-8?B?ZFJ4OFdmbDdyN25PMUpyNEVVYzgrb1NZTTI2bklBdWNYcmJNU3o5QVJLZFBt?=
 =?utf-8?B?ZkxvUlpiRW1VWmllRStuRnU3REwwZEhvdEliblkrRE1HcHlqM2J0OUw0YjVD?=
 =?utf-8?B?TUFKY3pWSGNHY01EcXpodmVVYm5yL0Y3K3V1NzNkZG4rWVdYaDhxZWx2dnRO?=
 =?utf-8?B?YjJaU1p0ZWY5blBjSU0wRFltVzIzUUVIbURmdnFHYnl3Y25mWkpiYVBoQ2FV?=
 =?utf-8?B?czhMSy90ZUs2QWxVVC8xOFVLU0YwOG1BVGJDdENRcEtUNnJGZ3VXeHZidVhR?=
 =?utf-8?B?am80ZzY4THFVV1ZkUWdEY3daQ2crNG1pRUNvTTBlVnpRLzRMa1NlcVk3a1Yv?=
 =?utf-8?Q?UiVRK9yZZOdP8qxbX47lQTzBSkQHtH+T?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526e756a-7920-4ad7-7d3c-08da087dd9f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 01:23:04.4148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4vCrlo/KfsROscXP4knphFVSmW1j3T9OxTFxqR06gOpQ11LrAfjZKAEAw3Wp6tPpWnq1i7WukgYUPQ3v/5DI5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6704
X-Mailman-Approved-At: Fri, 18 Mar 2022 12:55:47 +1100
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCj4gU2VudDogMjAyMuW5tDPm
nIgxN+aXpSAxOTo1Nw0KPiBUbzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
OyBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPjsNCj4gUm9iIEhlcnJpbmcgPHJvYmgrZHRA
a2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyemsrZHRAa2VybmVsLm9yZz47
IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT47IE1hbml2YW5uYW4NCj4gU2FkaGFz
aXZhbSA8bWFuaUBrZXJuZWwub3JnPjsgTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+
OyBJbXJlDQo+IEthbG96IDxrYWxvekBvcGVud3J0Lm9yZz47IEtyenlzenRvZiBIYWxhc2EgPGto
YWxhc2FAcGlhcC5wbD47IE1pY2hhZWwNCj4gV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+OyBNYXJr
LVBLIFRzYWkgPG1hcmstcGsudHNhaUBtZWRpYXRlay5jb20+Ow0KPiBEYW5pZWwgUGFsbWVyIDxk
YW5pZWxAdGhpbmd5LmpwPjsgSm9uYXRoYW4gTmV1c2Now6RmZXINCj4gPGoubmV1c2NoYWVmZXJA
Z214Lm5ldD47IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+OyBQYXVsDQo+IFdh
bG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+OyBOaXNoYW50aCBNZW5vbiA8bm1AdGku
Y29tPjsNCj4gVGVybyBLcmlzdG8gPGtyaXN0b0BrZXJuZWwub3JnPjsgU2FudG9zaCBTaGlsaW1r
YXIgPHNzYW50b3NoQGtlcm5lbC5vcmc+Ow0KPiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20+OyBEaW5oIE5ndXllbg0KPiA8ZGluZ3V5ZW5Aa2VybmVsLm9yZz47IENyaXN0
aWFuIENpb2NhbHRlYSA8Y3Jpc3RpYW4uY2lvY2FsdGVhQGdtYWlsLmNvbT47DQo+IEpvYWtpbSBa
aGFuZyA8cWlhbmdxaW5nLnpoYW5nQG54cC5jb20+OyBMdWNhcyBTdGFjaA0KPiA8bC5zdGFjaEBw
ZW5ndXRyb25peC5kZT47IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PjsgSmlh
eHVuDQo+IFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPjsgQ2xhdWRpdSBCZXpuZWENCj4g
PGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+OyBKYXNvbiBDb29wZXIgPGphc29uQGxha2Vk
YWVtb24ubmV0PjsNCj4gUGF1bCBCdXJ0b24gPHBhdWxidXJ0b25Aa2VybmVsLm9yZz47IFRob21h
cyBCb2dlbmRvZXJmZXINCj4gPHRzYm9nZW5kQGFscGhhLmZyYW5rZW4uZGU+OyBCaXJnZXIgS29i
bGl0eiA8bWFpbEBiaXJnZXIta29ibGl0ei5kZT47IEJlcnQNCj4gVmVybWV1bGVuIDxiZXJ0QGJp
b3QuY29tPjsgSm9obiBDcmlzcGluIDxqb2huQHBocm96ZW4ub3JnPjsgR2VlcnQNCj4gVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IFNhZ2FyIEthZGFtDQo+IDxzYWdhci5r
YWRhbUBzaWZpdmUuY29tPjsgU3VtYW4gQW5uYSA8cy1hbm5hQHRpLmNvbT47IExva2VzaCBWdXRs
YQ0KPiA8bG9rZXNodnV0bGFAdGkuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsN
Cj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsNCj4gbGludXgtYWN0aW9uc0BsaXN0cy5pbmZyYWRlYWQub3JnOyBvcGVuYm1j
QGxpc3RzLm96bGFicy5vcmc7DQo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxp
bnV4LW94bmFzQGdyb3Vwcy5pbw0KPiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBjYW5vbmljYWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMDUvMThdIGR0LWJp
bmRpbmdzOiBpcnFjaGlwOiBmc2w6IGluY2x1ZGUgZ2VuZXJpYyBzY2hlbWENCj4gDQo+IEluY2x1
ZGUgZ2VuZXJpYyBpbnRlcnJ1cHQtY29udHJvbGxlci55YW1sIHNjaGVtYSwgd2hpY2ggZW5mb3Jj
ZXMgbm9kZQ0KPiBuYW1pbmcgYW5kIG90aGVyIGdlbmVyaWMgcHJvcGVydGllcy4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fu
b25pY2FsLmNvbT4NCj4gLS0tDQoNClJldmlld2VkLWJ5OiBKb2FraW0gWmhhbmcgPHFpYW5ncWlu
Zy56aGFuZ0BueHAuY29tPg0KDQpCZXN0IFJlZ2FyZHMsDQpKb2FraW0gWmhhbmcNCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2ZzbCxpbnRtdXgueWFtbCB8
IDUgKysrKy0NCj4gIC4uLi9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9mc2wsaXJxc3Rl
ZXIueWFtbCAgICAgICAgICB8IDUgKysrKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdA0KPiBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9mc2wsaW50bXV4Lnlh
bWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvZnNsLGludG11eC55YW1sDQo+IGluZGV4IDFkNmUwZjY0YTgwNy4uNWVhZDZiN2RjYjQy
IDEwMDY0NA0KPiAtLS0NCj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50
ZXJydXB0LWNvbnRyb2xsZXIvZnNsLGludG11eC55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9mc2wsaW50bXV4Lg0KPiAr
KysgeWFtbA0KPiBAQCAtOSw2ICs5LDkgQEAgdGl0bGU6IEZyZWVzY2FsZSBJTlRNVVggaW50ZXJy
dXB0IG11bHRpcGxleGVyDQo+ICBtYWludGFpbmVyczoNCj4gICAgLSBKb2FraW0gWmhhbmcgPHFp
YW5ncWluZy56aGFuZ0BueHAuY29tPg0KPiANCj4gK2FsbE9mOg0KPiArICAtICRyZWY6IC9zY2hl
bWFzL2ludGVycnVwdC1jb250cm9sbGVyLnlhbWwjDQo+ICsNCj4gIHByb3BlcnRpZXM6DQo+ICAg
IGNvbXBhdGlibGU6DQo+ICAgICAgY29uc3Q6IGZzbCxpbXgtaW50bXV4DQo+IEBAIC00NSw3ICs0
OCw3IEBAIHJlcXVpcmVkOg0KPiAgICAtIGNsb2Nrcw0KPiAgICAtIGNsb2NrLW5hbWVzDQo+IA0K
PiAtYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6
IGZhbHNlDQo+IA0KPiAgZXhhbXBsZXM6DQo+ICAgIC0gfA0KPiBkaWZmIC0tZ2l0DQo+IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2ZzbCxp
cnFzdGVlci55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2ZzbCxpcnFzdGVlci55YW1sDQo+IGluZGV4IGJjYjVlMjBmYTljYS4u
NGI1MDgwZjc1NGVhIDEwMDY0NA0KPiAtLS0NCj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvZnNsLGlycXN0ZWVyLnlhbWwNCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2Zz
bCxpcnFzdGVlDQo+ICsrKyByLnlhbWwNCj4gQEAgLTksNiArOSw5IEBAIHRpdGxlOiBGcmVlc2Nh
bGUgSVJRU1RFRVIgSW50ZXJydXB0IE11bHRpcGxleGVyDQo+ICBtYWludGFpbmVyczoNCj4gICAg
LSBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4NCj4gDQo+ICthbGxPZjoNCj4g
KyAgLSAkcmVmOiAvc2NoZW1hcy9pbnRlcnJ1cHQtY29udHJvbGxlci55YW1sIw0KPiArDQo+ICBw
cm9wZXJ0aWVzOg0KPiAgICBjb21wYXRpYmxlOg0KPiAgICAgIG9uZU9mOg0KPiBAQCAtNzAsNyAr
NzMsNyBAQCByZXF1aXJlZDoNCj4gICAgLSBmc2wsY2hhbm5lbA0KPiAgICAtIGZzbCxudW0taXJx
cw0KPiANCj4gLWFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArdW5ldmFsdWF0ZWRQcm9w
ZXJ0aWVzOiBmYWxzZQ0KPiANCj4gIGV4YW1wbGVzOg0KPiAgICAtIHwNCj4gLS0NCj4gMi4zMi4w
DQoNCg==
