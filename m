Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A216BFF04
	for <lists+openbmc@lfdr.de>; Sun, 19 Mar 2023 03:06:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PfLpN5GZMz3cd6
	for <lists+openbmc@lfdr.de>; Sun, 19 Mar 2023 13:06:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=nOXjJYsd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::712; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=nOXjJYsd;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20712.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PfLnb4gFKz2xVr;
	Sun, 19 Mar 2023 13:06:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKJMRy1LvZT48yj7aPh3tEYEMUPOJFbKUL1UouLhaGCZPsugLMF88TL6LJGDtbEKyiUBQunZ9uY61C5QsrKQom1q52gy9vdxHzAynonAzoHK48DJHnpl6d9cBP6pFv+WoaWMFw+r4g8up2daUsvqerYkhJB+eYjzbuYwQUgXvBV5msKFaUvJkroy3wh0x1eGm//mLEZe2HXJ6zDMWb0UHDfzgJefAH5201quTu5r4ckwbN16dllhBShZcEuf65AW2Cn3s4/uYxirYcbmizgHL0oZVpOCP/Fcdre/bA0RDSApa9ZqlwdBZGzar9WroZPNm2RUHKAU/FYhPskX3U8ghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgeYUi5G7qA7xn5pUDagPqaBoyBKxVV4cjhAZE4pJJo=;
 b=MQVX2RSrAsd/x8KSayLpUe4yRb7ymPuinhq1m+a1UtmsI3utgb0uNzOUVFRI69xeh8WaWoW5CqezbxatlmGUCMawqOvAfdRU8atmPQOjgQQT75218iR3LUwWITFBMSLcveGE13ion8lS0DkRmBL36+EwU1LMeaJwFQUAs+UeTRqbD75ZMhUJXBLssVEWAEjwUASLgYRAapfQPquup82saU/BJVjGVkgsyGUxxhBpYHS9g9wMbnV0EKdXawrStrc32Xo/Y9HMye5OM4ArvsOsVNi+vqWO+D5Wo8iinGn6SVM/wFvMkzVsbEPyaqPUcdwAs5rxx4PTZQWWoKmwmX407Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgeYUi5G7qA7xn5pUDagPqaBoyBKxVV4cjhAZE4pJJo=;
 b=nOXjJYsdtLEo7a9xrfRslrXraxj7MD9aHNlL3TNtV5/dnxmglR2P7Of8xqqtjVdXHaoCmkArSancIHaXE5Y/I/YhhqNcP8GVGW9xkWZoni12CRsyFjF9SaUs+J5L09D7NXu3Tq9xxVQEk0TWdq3XIcfqWlAf3JPdUBG4RLKVR/6eBoK6CfMcfr/KahC1MK9Jm2chNqi1M7AJQV+/B44DRGrRARRkkdTCum6jNH4zzRFR1pXactQn8/jdJC/FWfojH10cD8DBR772J+r8gj5lzXg/B/rrKQWdlH7YkHB/SGkHp5jPnnlHMph9Odml74g5iBqyrgqAseW0wCTE3qRrcw==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3880.apcprd06.prod.outlook.com (2603:1096:301:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Sun, 19 Mar
 2023 02:05:47 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Sun, 19 Mar 2023
 02:05:47 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHZSZBNCqcj9BIMLU6U/5WV2MINja8AX5gAgAEbpFA=
Date: Sun, 19 Mar 2023 02:05:46 +0000
Message-ID:  <SEZPR06MB5269DB6BE01C48BBFA17876DF2839@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <20230318090936.qvqozqfskpe5lja7@intel.intel>
In-Reply-To: <20230318090936.qvqozqfskpe5lja7@intel.intel>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|PSAPR06MB3880:EE_
x-ms-office365-filtering-correlation-id: b0fc9060-6cf0-4710-bf4e-08db281e745c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  kLPzArKaEjZSDotKtUNqY6IRyUvjKkjyW+vwWxbXkiL8pmsw7hb+KWhWHmF5xT5P1nFt4+vu4oJZ6YXwe3Q20r8XwIC5ZX5xDHP1hOLZHhodL4ayVNrRr+kbtF0kgHa0lRk7UVEmTtdEf4Tp4VeNqjaZpr2pADOBUupatPetZFXbT7UtUWKi84jHxCl0AWVmJvlg89wEiuJ7rbx+qfUrCnU0Z3rGnuLwM0L0MRirBl/2jmYdOaDGXeHt1ROGHx9Ao0xcTbSpi6lcRPy/BjzAIpIiRc/QJC02GkRA+XZl1OLi3qKBwePSOx+bUW5KLvE8ux1gIo602kqfTGx2ZpgaovOustWHGLESaDNNqr5MjZaOy2cBbvgAo9hKUuGT2YdW0t2i5d1GAhrvNmGn4RBPkUOQMA1+QhjdejlcyTafSmwVghGsfOkf68RGCoHSB1I57tyNNcAcZ+olXoKoXh/Sb6DJ5j5goQE6VYbvEv/LQQN5n+2OkJfLVIMQ71CSt7gmiLkP5Ug0A+hNqaaPHcL2wgzMlTXLrDbLhp1adVIE6dFfSrmrgUCWEnufNEQDQ8l6XZdByQtspXXqixMi0MalEtn1k8BIJfeEMAL34MGUJmqjJjFsqgM21ORZoi8FzKmqnWP0kHOFOKR14aSLIUdosGcdG7vlwwf3qF75N4+a9rSgQleoXdYM382rV3qU98kNuHmty1b/7PHWsALSEtuRdw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39830400003)(396003)(366004)(376002)(136003)(346002)(451199018)(83380400001)(38100700002)(86362001)(38070700005)(55016003)(122000001)(6916009)(4326008)(41300700001)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(52536014)(2906002)(8936002)(7416002)(5660300002)(33656002)(26005)(186003)(9686003)(53546011)(6506007)(316002)(478600001)(54906003)(71200400001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?pPZqomkhpgB9brMyNS4TkOp/R+Z0SQTPVrUlnHXIFvXvxzj3zuRV2Q7URwwT?=
 =?us-ascii?Q?pAj5JqlQfIBkUZrZx+kPylWGFT0mgWp3FzWgP1/Wtf5VCxwBlxlznBEuV+tW?=
 =?us-ascii?Q?yQBFK+fYFkWd8fnLEmxgV4AZw+cX94Sgw8i0uZ3WHAAm0s1QfWdJMc9RwR67?=
 =?us-ascii?Q?lLD/xAt9xrrfRD9usN4zWcC6ECEkKaMQah/wQDlHInBjxU3ZEMbTSFo3Bwq9?=
 =?us-ascii?Q?ezmDldmlqVcodQVXq8nr37wFfOR2a8vtCcviyqu09aiesgaE36nnes2dut7p?=
 =?us-ascii?Q?QkaJoqFA/pZN0o9Rr5DJz47PMY++T2IJP45BfPmUe+SGYxAYWdH5UIN5GrcJ?=
 =?us-ascii?Q?7QNH7pJ7vbqjldLzuhOA+2G2gELO6RVZ1bQaNPQe4whfTcmTq0tgks6ZYVps?=
 =?us-ascii?Q?oRu3/fvFMIQggy3YkOMOoDbp2g9bBKmN7NH8HpxXUNL3oQ+Ub9JcokhSyGcW?=
 =?us-ascii?Q?xicI8kYoCw64SfLXZZKdDDO9TkvIZhXDmC0VFypJfwNElt534NE9iUwvfZot?=
 =?us-ascii?Q?DepVE5LdL0MCnaSoFw/H8ZdMwQZ95Y57mYBXzB8E/CjW34WFt+QKQZqyvCW9?=
 =?us-ascii?Q?AwZ8cZX3MI8QlpDsebqqUZ30hMNRoHz0RVXo1ZhtpIVv2nqAPxxGKByNQKVx?=
 =?us-ascii?Q?Zjs9U3yr21qCgYXe4N1Pu5OA8zXAATruTt/NV5mLDho6SgA3AfAK67YEmxQi?=
 =?us-ascii?Q?ejum5l7/e3uIngEL6h4aA6SqVzcjU4EUNaaznDlxZXOCNP9ttCuKKJBElIsL?=
 =?us-ascii?Q?H/xV50Zmd8vTt/6cJuuMNAaucXZnH5uMp69s46S1/3+s+B8Ezgtme7bOrOCB?=
 =?us-ascii?Q?PoZ2zmgXKo6NGTwhGEDH1c6mm9b8p7McIS/shRmw/ySn1sFcCKLK1BJq158Y?=
 =?us-ascii?Q?sRv0UOZmA5dYuly2rFoI8WncioBUZwfmMK0XuNh1fnBDalSJXkdIDDMHyj7J?=
 =?us-ascii?Q?Kmq5X0/VqpK8wrK/SsRtVpNfM7BhU7FxbqJbFidiMh67ByhXHH2diC1kw5gx?=
 =?us-ascii?Q?U1h1YOMlHXgrT3Dd/aoDVg5vNwp4av94XKA1w9FdoPmW6/IL+4XSxlkEKhaS?=
 =?us-ascii?Q?5f+UJhrfR+yUQG247+fFqiRWc8WCYxiSwbHCn9nomkGW0cL1iTRUryRZ1Sib?=
 =?us-ascii?Q?Q7KPw/iuwph0yTdBcK45hi263VBDRXBzKq/WMCPt6sTIjbIOYBSepddJtVfG?=
 =?us-ascii?Q?DU0/EULdiA8Ri9J4bTs5fkWN2+0eFDo8i2PSSt5xFaIEQDzCP7GOG71Z0HZL?=
 =?us-ascii?Q?x7VPAibyvYn3XEhdTxdXy0+zanmuNG5zahlpzUDBv/bT5FWBxcnOapmfeQdX?=
 =?us-ascii?Q?fxskDDpbD9m1hDgTx0rQWwaKouG/0jPKMm90dgWDeflJ6hWG980c7rGtmrJc?=
 =?us-ascii?Q?LcfclJSAoWdNzKx8zjMXPF6Csywi281o+wVn43Fdz4pOcCqYE6+4p+72MONv?=
 =?us-ascii?Q?J/dg269XLxX+70+lJF0AU8Zat77fcRNdpEv70ypNYYie/13No13go9UoXDxl?=
 =?us-ascii?Q?/LgM7YnBolrPb7k8ZnTO8wQSk8u4K+yXHinRUntySH8aC0A6UVS/4XPnDCd8?=
 =?us-ascii?Q?gb1UHMlUTc4mAxHen9XEjfBptIxuxz7E7L8MMXy8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fc9060-6cf0-4710-bf4e-08db281e745c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2023 02:05:46.9266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VAqrP2bi1f0b8sAYEJ2btSjFjPCRHISkWcaFXbRlIisfSW18jdEYbNcnT7fxiXvzL37r32drISBZnD5ryjNxJrOZ5SZLtq+YX+LGpzoKqys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3880
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Saturday, March 18, 2023 5:10 PM
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>; Brendan Higgins
> <brendan.higgins@linux.dev>; Benjamin Herrenschmidt
> <benh@kernel.crashing.org>; Joel Stanley <joel@jms.id.au>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Philipp Zabel
> <p.zabel@pengutronix.de>; linux-i2c@vger.kernel.org;
> openbmc@lists.ozlabs.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
> AST2600-i2cv2
>=20
> Hi Ryan,
>=20
> On Sun, Feb 26, 2023 at 11:13:20AM +0800, Ryan Chen wrote:
> > Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,timeout
> > aspeed,xfer-mode description for ast2600-i2cv2.
> >
> > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > ---
> >  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44
> +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > index f597f73ccd87..75de3ce41cf5 100644
> > --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> > @@ -49,6 +49,25 @@ properties:
> >      description:
> >        states that there is another master active on this bus
> >
> > +  aspeed,timeout:
> > +    type: boolean
> > +    description: I2C bus timeout enable for master/slave mode
>=20
> Finally you can proceed with this. Please remove "aspeed,timeout"
> and use "i2c-scl-has-clk-low-timeout" instead.

Thanks a lot, I will start progress this.=20

Best Regards
Ryan
