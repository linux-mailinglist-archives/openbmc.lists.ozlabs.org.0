Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C2680774
	for <lists+openbmc@lfdr.de>; Mon, 30 Jan 2023 09:32:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P51dM4VnXz3cFD
	for <lists+openbmc@lfdr.de>; Mon, 30 Jan 2023 19:32:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=1b02klID;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::725; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=1b02klID;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20725.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P51cZ75Twz2xrD;
	Mon, 30 Jan 2023 19:31:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJngJbE+eQ4h3qTWpmtQWS93JH1Zqj4DghDGpOy9d/fg6cDXMTeBvYRq5nufa9csj/Sz10B8X7nRxiVBscIfrTksi4W0oACbeCkds+fCcqCbgUtCEAQWLOPZvCl+nSQ6RU5YoxqdyP09fVfj+RU30WVuq0nL+94iGX96V37ClMV4FqwRzHROQciuh4msY+wTckB9o0b97gS5eussJwlczb8vxipjpmm3bX8Q4gaEJxSGcJtMH91rsp/47bq6sX88MwBWuE2BlfvuyDb42zsTBeBFz63d/l4kYUPRdexjD2YzVgAYOvUhdsHcbrZySGUgcmROQutDvbuXcFeVSUTAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fH24OVZOQEfnIsywCTOZsF5TMREkgSNpc68cUOEA88=;
 b=KktAQzuqyXRrxO/sajtygqgX8Ah2NuA9nqd8Ui8zmFn0JjEWcaQPk/ebabSauyWwBENQJ8JZcnJ/kqieW33cXkGM9KL+P4/YvqDp+Vfkr8/ZTP8QMWwmD+ZVu3AejgP3si4UwWvaAQMQCXaZPu2rdeBR3jhva7VYv4MqN+npLskcB8jpgac5yoW00M6J2lnHVqV57dG7B7GG1hcKbaDHtkDoCJl60s0FMr07lTqtYMI4H38M2srWp+vgHZOspL9kBiB7aRziyODWM87fJAgkMCTBx/HBWatNYeXNYN7dlFgyzVeclKROTa+R+eZ22wh1/4kymJ5GsfpfvlUS+nM4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fH24OVZOQEfnIsywCTOZsF5TMREkgSNpc68cUOEA88=;
 b=1b02klIDf3ZqN8I7OeHrAGDccz9olht9NDkXNMH8mY1tFCuTP0ZfIHQGVnSM9Q2BuI+7PVD9lCn22C2LCNf1CWEdmmzVSn4xPNf8ZGQ/0DddbEO4mM6NGVBiFKP8Inms/DuI1+AI92cFB7aNgrhnaBBO8vy27UupxNoUUmZD9ebVFBdJljPCCSQuKbG398xeU1b/S1UBH/7dEit1p5kdYs/Vn8QTDCDNQ8gjrsMNhq2Ma8Buip/abRlGcotmUkMUhI8OcoV4WbHISX/JAnLHCPAYoQTBoGWJn4QvZfPv5EG0RanJtJkNHATErVxXF+Cx+KZBh6fairI7J+Vo0Sp8Nw==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5976.apcprd06.prod.outlook.com (2603:1096:400:33b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.19; Mon, 30 Jan
 2023 08:31:19 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%4]) with mapi id 15.20.6064.019; Mon, 30 Jan 2023
 08:31:19 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>,
	Linus Walleij <linus.walleij@linaro.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>
Subject: RE: [PATCH 2/2] dtsi:aspeed: add miss pinctrl in pinctrl dtsi
Thread-Topic: [PATCH 2/2] dtsi:aspeed: add miss pinctrl in pinctrl dtsi
Thread-Index: AQHZH1b12r7SaazhT0KK7vMjO8K8466rVp0AgAt0+5A=
Date: Mon, 30 Jan 2023 08:31:19 +0000
Message-ID:  <SEZPR06MB5269F48124B49BE5D4599391F2D39@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230103093702.2613574-1-ryan_chen@aspeedtech.com>
 <20230103093702.2613574-3-ryan_chen@aspeedtech.com>
 <3b11d987-180d-4b99-949a-b854b1d6d39b@app.fastmail.com>
In-Reply-To: <3b11d987-180d-4b99-949a-b854b1d6d39b@app.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|TYZPR06MB5976:EE_
x-ms-office365-filtering-correlation-id: ae8eb308-25f2-4c27-cd12-08db029c5c84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  aQn/1RxE5AQE29xosDC5P5qEWt5sCgCrHkxAkh71J/AdMphSOHLnQAaSkxHztBHR17VohdXdv+eX7rwaAlyAeqFQvtpc+UPHaK1JapsZa6XRW23wO8YIEU+VA06hkQ7YsrzDx5luzz0lRs76lbOOYjXHRtwxcRQvthNk+i8Lz/uSyLduRe25g2Vx6022ggGeQcKMpu9c8uM3GkPDQVN6Rrx1d6410u8dnvo5Z8e6mWyiTdZ/C4p1oHbzO3TDIwZETvskYKquGktZCO/ih6aOtlE5rCPNHgf1GCuDyF81yPL+LcxgfcF2V8WC7iw8WcFAapG6Sbvtq5EI0vXsX2sxjqV90hggCE8I89SFVJVIBVAbtvQFthPb4doVIjT6fbWsqb5W2yGMqQpQ8cJRjKRvQRnwM9H6bKrhYyKe0L9N8qpAGQkTCN5ueO9MHK5I4HAc+uPHpezAP56THdxDab2WIwG4su+pFPfYT9urjKz5Ku5IzBmZ9Q1/imrhjp1YeuQlw/tgNGRkkD+RrIoeuN7HLjwe2FiWSjiUGQ41sbMtqMdZzjUkYibpkNPVpf39o/quy3TXZ65jVM94NNpFqLgR1ayVe9nw7PItXSkjclrIX7Vg/kWCk0RdopnqYXopMMLVKSLsol47eVSVmUUf1p+8yYaF0EBbEo8ueQblu0MZH0jWlsHfYdY9gFEwv9RNyvyYw9A/8/Lw9/QNXVrN4xYXwA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39840400004)(366004)(346002)(376002)(136003)(451199018)(6506007)(53546011)(71200400001)(7696005)(9686003)(26005)(186003)(478600001)(83380400001)(110136005)(316002)(52536014)(41300700001)(38100700002)(122000001)(64756008)(66446008)(66476007)(66556008)(5660300002)(76116006)(8936002)(8676002)(66946007)(4744005)(2906002)(86362001)(38070700005)(55016003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?LRKrwVDkUDmdLJcJe9SQVlN8ZTmq5jRUP3OxDtj9NVy/Q/dU2BntkJMDqPSE?=
 =?us-ascii?Q?sBqd/uYCi6Y2ZhJ3V8o1PTOnBxTQzHwBFejHBtnECifU7FpH8lp5hD1O0zV9?=
 =?us-ascii?Q?bLGMAtpevCsPYYSiv5/Lbrk1u9GB9tXrBOv836JEaUtsQ64tXHkngjFUJpIc?=
 =?us-ascii?Q?IOV+K5nG4sjn4KYJbB9vHsoCVXLxMta9UAmLV/rimNPWKTQfziozLJ0gEO5D?=
 =?us-ascii?Q?J+OSDtFC2jJypqBZ69tbLwTsowolT/YYZFPw2+7e2OR5ZLjGzHw+fnhzpJpP?=
 =?us-ascii?Q?x8qgLMH0KzKCbk7rH2Ymw9Zp1Uf5C8RltSM6SQR07aZUUWfXhQhn3WP69KeH?=
 =?us-ascii?Q?WRiRyyqG7hoaT2AxWbCDKG9MbrK7CRpnoYz50sfV27HJ4xi6jj0qFapWnUHV?=
 =?us-ascii?Q?fURam7YlzCEPhOeqOh750gz/9i31QfapMoh9rzMpemTA4WfvlHzedQVK+NSH?=
 =?us-ascii?Q?YqdDxsQie4pknGdPmj9dovDuyLNopiZKej/9KGkNN/NL8l5yn1Thp/KMZL95?=
 =?us-ascii?Q?1h/oOnczygDSr/MCrDXa+2Un9uaRvqzm8M26pDO7B3801lZiPOnFC5ro/+I5?=
 =?us-ascii?Q?rD2VJ+KRvjJ2gKBDpWGXKSiPiXFltNOHilLSXYqzU5vauc2aEOZ/zXhb/NAI?=
 =?us-ascii?Q?LZewB/EAUEkbYoi5yQxYTKkKOn8rGBT2PJydaM/hZ0wTwX4RRVlPvINAeewh?=
 =?us-ascii?Q?Az0owSeJ0atkzi6mpQR0FMHGlhYZZD1xFRGGUHH/vYM4xjgDQ80KCyrrGsfN?=
 =?us-ascii?Q?4aaXn8KPeKG6YBhIMHc3SKW+cHCpisCJZaW8EQUyezOSPgAODryBVJh+AlK/?=
 =?us-ascii?Q?E2HmsMvg8srC9WpANx2DykfD4VOkeQqF85sbYSQMR+tJgKYhorn8ev9r41SP?=
 =?us-ascii?Q?cFOQvojoI437z/WWR6egCnd7e0FHmrYYYdk2hGcDg0CogcQMIxt4Jf3aRY4I?=
 =?us-ascii?Q?212RBoXfKZQiXVXa7ws5yUbBFoj7ubMLZEkKCl+FD6aiJB1KijLAKekrGXGK?=
 =?us-ascii?Q?r0MG84xlZfRsi6wNj6IaOcDboRkY8UOcLcVU73hJ9bIF2keDfbDcV80AGuW7?=
 =?us-ascii?Q?unPX7TzG/Lv+YBcfGUhRFUe9Tu+A5MJd5Ci8MLQ+hN7JKVtRecJJ1NzGYhom?=
 =?us-ascii?Q?BYuwl7NpnpAm/Ra5l0BT7aXU1ohnwUHDULd43xdoDFqNUkQPEEgJF94+QNpe?=
 =?us-ascii?Q?VU6xeYT615hb97J9BRXaOFhsbsu4JkbBW3XTLGCJPvGc0U+9aURP+NzyIa3i?=
 =?us-ascii?Q?12VPLA+cgB1w7JUIY6KI/PirwCPvwqjoZn+8+d9OAXfVMqZFr6Oa15tIOek9?=
 =?us-ascii?Q?y/b3Tsp/6BP+7CZrgaqdFyBnlk/bERjhQvX4hAnqj3j8uARDvjFgfZB3Xlas?=
 =?us-ascii?Q?9RgCDfrN/w2sPKTxBlwGgH+VUz8DWjkTH/Bm3eApE15tVQd540FHoTHH6Ibd?=
 =?us-ascii?Q?9k8d7HLay+GMrGe6yQxuJ7GKgpD0aZ1lJCQdYziWT8p5uWllNMfvdVjyXft1?=
 =?us-ascii?Q?HFTsEIJztzjuRwDiGGtiPI9MQTMZ5S3CfK5P+hWiPK4Z25R7wMVMshSWm+5Y?=
 =?us-ascii?Q?e80prl7tsZJU4rlbTbxeF+gIAE+CY2XFQjfsz26Y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8eb308-25f2-4c27-cd12-08db029c5c84
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 08:31:19.2949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5sHrlp8Spp5y8iHH4qkQJmmYjCO3MKdupgKPu+8MSjR6L9eDHJ1MRyxo0oEXdI8JjYaaCeaLl3vkFvLrD0rFJ/wX77oX8Nulyi6eula2Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5976
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

Hello Andrew,
	Thanks your review. I will separate the patch to submit.

Ryan Chen

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Monday, January 23, 2023 9:33 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>; openbmc@lists.ozlabs.org; Rob
> Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Linus
> Walleij <linus.walleij@linaro.org>; linux-aspeed@lists.ozlabs.org
> Subject: Re: [PATCH 2/2] dtsi:aspeed: add miss pinctrl in pinctrl dtsi
>=20
> Hi Ryan,
>=20
> On Tue, 3 Jan 2023, at 20:07, ryan_chen wrote:
> > add miss pcie rc, secure i2c, i3c, 8bit emmc, uart ncts..
>=20
> Please make sure that any new functions and groups are documented in the
> devicetree bindings. Also, updates to the binding documentation should be=
 in
> their own patch, separate to the changes to the devicetree itself.
>=20
> Cheers,
>=20
> Andrew
