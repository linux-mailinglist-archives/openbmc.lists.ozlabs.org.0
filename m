Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3976587991
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 11:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxpx34fsPz3bxC
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 19:05:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=kgZxMAxc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.215.124; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=kgZxMAxc;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2124.outbound.protection.outlook.com [40.107.215.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxpwP1qzSz2xtw;
	Tue,  2 Aug 2022 19:04:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpEDvjtkKuin1/2Sk0t6LFXDv8UBSPZoktuoLS581uoryzmYVjCAgS/ELhJV3dV5sjDd3shwUwobzMfwRpYkmvLXm5EhzxThEasmF3g7jFGXJiyDbeWIehlHmjP2mkhdDirD4BOAacMxxn4/QaJExUIz8By2TtGcFQJQJLYbgNiYpkg/qIGfdkGmat6pODJrHTAeF5I6YYHTuyjWeQnk7dEjJX1Kaw9/6u5F+ce6Rwoqg0swK2R0MwehOF/fxugRbtBcO7f+hjYscNMC08o3JKYCaeVYuzrrgVc1jlRxtwKXjD11o6TJgh0D/TYvnbGcXYnczczgRrU6qty4ryHgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMhsyJ7gCTZngUaVsZBd+GazMW6PZoEium2hq4Onnns=;
 b=K5iwtJxFg6lzVDUTwJ1G/i9Yo0zyHuUOHICiCv45bQtOzLU/NhnKSWCKK2fSJPXRCQyGILiwvlOSK9+IGcHiULQIlOZXdQdDvR+Lsqn4eX4PMK0HyOWkQYHasi+KtdYPWE5egaKNrcmz6U6fH/El3GcEVXElBv8/hHBjVfv+dJ03roLYuFLR9Z5WiAh1z/rFtfoNBUDGzM+7ugFDzJKmee8p5OxvrcUmDyPWRYm8NRH3oqda8PIxIvvhkDCjI2K1m+6rb2P1U9+Va0dFPp6frQGhwfZgun1fYdVkT4DOv3BN7FOc3T/bQCFnB2wwFS13YNR620VaABTToOIFiZmT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMhsyJ7gCTZngUaVsZBd+GazMW6PZoEium2hq4Onnns=;
 b=kgZxMAxcX5LXxvPwt7W0JRcyBVTwr/beNk7Om965Poh+I71OaLEJqP00dpLp3NzPX2t/PU/wygbU46iXRecQ61eWaAHOZMlwfhImKM3M78AmD2nByjGZ3hCTrvcLcBXJz3aWUyT1TDMLdAi+Hz5kImewZzMHwBtBpzgmdnmAzU0e+gRuE6S6eQhm2z52xe2I1NOI+AoFa05+sFTBNk9InL1NCMcx38j/ID76NqigTsVCXMIRlcfJF2nanhGPXSEWqIzqFwi9GtlxAcpWMf8kmxxthALSuUUdQYakrg3HyJd9wjiW84slLztOsN341F6hqjpqXOxXqyLKnJpba9Nlmg==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4753.apcprd06.prod.outlook.com (2603:1096:820:92::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 09:04:33 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::80c3:a65e:1caf:2b32]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::80c3:a65e:1caf:2b32%6]) with mapi id 15.20.5482.015; Tue, 2 Aug 2022
 09:04:33 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Philipp
 Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for AST2600
 i2C driver
Thread-Topic: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for
 AST2600 i2C driver
Thread-Index: AQHYaPENO2grG+HzSECGUwldbn2ojq2VE+oAgAAINMCAAARRAIAGqoig
Date: Tue, 2 Aug 2022 09:04:33 +0000
Message-ID:  <SEZPR06MB52695BDBE90ECE00DB2D9684F29D9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
 <20220516064900.30517-3-ryan_chen@aspeedtech.com>
 <5d863bc1-4f27-48b6-89ab-c3f02bc09057@www.fastmail.com>
 <SEZPR06MB5269DFE2CF762B62846D315EF2999@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <4c4462a6-e950-48cb-b9ba-822909a86867@www.fastmail.com>
In-Reply-To: <4c4462a6-e950-48cb-b9ba-822909a86867@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58229106-a142-42d5-02c1-08da7466047d
x-ms-traffictypediagnostic: KL1PR0601MB4753:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  atxAz6tl8HEjOPMSAmH8cQJU2o7sKFbUskbCsD4z1RRXCQCy+IMTZiCw4gLavuVuoLAjvTc2UNA8csRRrHLougDjrRTDMnzVTMeF8VNsn8PV0irx0dThwkGIZg/lf4iZTrhlQBKSlbiBK34oB9W8/xHNzbuM17ONsJ/AdTvNbggNsaNXMwpLVch4E74MlckW0VtmS3l89YopMb4PX8wN9Rt6URj0rIo1SXuA30q1ZHtAv1Ec7iMclCX6gjic8+wnW32rchavR7B0CwPlI1bTI1SZHVJ1FbG6fKmGNJKsIoxMnkTFxvai3gjuCjhsTGVqMt1TbS2L8BDVl+ojfDBgDjUKcF0EeaRnG2pQ2nkYBMrOgrkw7hUY1NbOC+O6JXQjN6aWA2luXMmzwf4lBYRg6zQcXc6ZWN/SFTR4FKqO01NpfZpaLLKN/vH6S01EqeprabyoY4Ykm4D6WQE4sMvyYuWmcCLlKoFTi8W+im+DMYrUHE5PfBNQaznEWTogBtZ1FMwPcMW/opEVkr9K2NQXiwyj/Yd0zzEJO88uyuQ9pHR5uBY343whzUdZkWxWHlcdY8Jgn1cZ2av6/xZ8y8Y4b773qiKADrBtsJzDGrLZR1p+Ro07TKEYFwd7tAZ+ECnD74ZOAyeOnO29ifhDX6m7gfBwo5Y/KLc75+n7eBOlMuIlas3TCcFQXHaLzO2vSRyGFkB0sRQVUvX8Yc8E3clOE/QMdPZoGWi7aUYLBOw2v/5GfIK+Ls/2Ocith72fXLr/2EFQU/y0yO6BOdf5PNFZX46IWikao5lvtEZTZPiPWWW5NKtgqmZ/xatBDVsvWKOfESQhyHRe1GDTGlp7annJqsSBMgBnQLR6brTz5Ityn10EeUM98p1D5U7UD78dp3ms
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(396003)(346002)(136003)(366004)(376002)(41300700001)(6506007)(7696005)(53546011)(9686003)(26005)(316002)(55016003)(110136005)(86362001)(478600001)(966005)(71200400001)(38070700005)(122000001)(38100700002)(107886003)(83380400001)(186003)(4326008)(2906002)(66946007)(76116006)(33656002)(66556008)(8676002)(66446008)(52536014)(64756008)(66476007)(8936002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?MmF2sgFlugOsr+OXkV1VTLNjnmdePr5lWBWUuUUWCFNcDm3thxBh9k8YSsrG?=
 =?us-ascii?Q?sPvU+fbsL7eIPR6pQb7uC2w4720L520BFORwd1ArK/yWwULQRgTJygKjWLlc?=
 =?us-ascii?Q?b1wsVSQU0pXGOqpDwuQ4OofelXdgd3hwqu8epeQWXPtc5k546GIwYi0DMJ04?=
 =?us-ascii?Q?I9yh6w25zwuXU5k2BpLOUUtvYrtkoVV9KBKty39R3jkzX48ruv+0umT4c/kS?=
 =?us-ascii?Q?GFap4ZNUpQ7VqsdITOy+GFSVTm+grIdTA9bea/nqiK7L+1pMU9HvFwW5A9xL?=
 =?us-ascii?Q?YXzAjfCxmzwzmh7C0T/xAS9WGRKE4lTBINKv4LY6N3vCRuo/ntQXh7IXaJIa?=
 =?us-ascii?Q?fYBh5ctO7THjkvt/2hT8SctZdfKzs8ri0I+0PmiLg4i+zo7nHe61WTa/pmTD?=
 =?us-ascii?Q?GGR9ovpieBOZ+IWXcvmJZIBXY/p6cr2O/nqzofEZiu23ambV5EvIciS4pAWV?=
 =?us-ascii?Q?KKV+Gk3MS51RU60B/hqlwk7A0zf/TJP0kZx0KQdef7svCtg6m3dbhV+0Vb2E?=
 =?us-ascii?Q?Ho1DV0qHC9Zh7gQt4/7Y9KIEINTGc3HMSyNkBCR/cOL+xWdVSA0h81I2WokH?=
 =?us-ascii?Q?Hou+90X5IQnWroLzelZkH4jCkz5pMLxneNReyRLpiiG4tptNUx5ioNz4M6Ob?=
 =?us-ascii?Q?L9o0mXoKxa/rBmYgncbxl/vVUW9L6c8MsijcKfCGEYGqs+qG/wbn88pfdcbe?=
 =?us-ascii?Q?CQ7+R2aACxGzSfmDFjdhBzWFkmbi1ObSLMTEBxJkIHhDQTnCatdVNIsNsS4q?=
 =?us-ascii?Q?c99mZ3nw56RMBimZd7BzG8eA4cj81E6semk5oQE7hjN2ZFj65gXGwdIe9ZqK?=
 =?us-ascii?Q?CVyQBvoVV7kcpJCIbiSsyVUQwdiZLzuY5f8NHLR7P8oJI7O0Q40vj1r4fyis?=
 =?us-ascii?Q?Q9EfR315EB68iuXHN3issTrFaqFf6Krgeshq9YLVo+uZBm7zeBxp6HqNOyPR?=
 =?us-ascii?Q?hq8ZQsyZ/sT1RhcU9lLTc40y0WaF4YFhmdp36Dlt6Ni0FciEwPs+o2ph7RGz?=
 =?us-ascii?Q?Wkz8OmQwdiNexAyPW16T7j7+tXb3jm7I5biPkKBLFVrFP5zk3vyyk+t3Yb30?=
 =?us-ascii?Q?rbMmeE2+4MNgm+TzO9aF1cb4a9A22ve7SjIsm6VcIpyzrYb4AW3KCB4Tku1+?=
 =?us-ascii?Q?+/71Sz4Er25iOrE0q86v0/pLbyr+00H12kX9emD9EJfUGcv7U1CONn2vxbvr?=
 =?us-ascii?Q?YcY7gOaBNTxa1Q11Stkn/aHidi8uMIWsRDoTYjlCQEBEOGGbDk1aCg8RZBj0?=
 =?us-ascii?Q?XCjAgpwsJ0I27OmE7X4IDJs90f8jTfkogj/tU7YqcvzK2saHvAL53RlL0nIS?=
 =?us-ascii?Q?J0ZQVM8PB09F7/Oh28DayNc4wmXyZCUo62/1g6/BsyIi9J4z0vbnSfO/9WD/?=
 =?us-ascii?Q?XLan/pST1PE1NDjemA1otVTY8y8buOPM92HcKjfyGWdqY7FHidx2NttuG5GU?=
 =?us-ascii?Q?ciol0lHTtm7su4RArgCKr7quKH8OR/1XJ6CrGh45G1qlXz7I/8CeUR1g/0/l?=
 =?us-ascii?Q?TgiaZrwi5zJJLhJEe78Kt6W0esDTIhkt4wieaQMpqRiSbdPrlI/wlZab/rBH?=
 =?us-ascii?Q?xHZjQlxEt4TqMprLsKECPknjlesQTzzGT8USsl+f?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58229106-a142-42d5-02c1-08da7466047d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 09:04:33.6822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rIFJyorrLgzvw3wDff04x4qrIjI9rbqEDFbVPsgxwv6jlp+3OLbyOpZieMt7jCwgjHpYNKuZYYPZpx/BqvbbUFw+At0wp0WK2sDqqFyIsFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4753
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

Hello,

> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Friday, July 29, 2022 11:13 AM
> To: Ryan Chen <ryan_chen@aspeedtech.com>; Joel Stanley <joel@jms.id.au>;
> Philipp Zabel <p.zabel@pengutronix.de>; linux-arm-kernel@lists.infradead.=
org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> openbmc@lists.ozlabs.org
> Cc: BMC-SW <BMC-SW@aspeedtech.com>
> Subject: Re: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for AS=
T2600
> i2C driver
>=20
>=20
>=20
> On Fri, 29 Jul 2022, at 12:33, Ryan Chen wrote:
> > Hello Andrew,
> >
> >> -----Original Message-----
> >> From: Andrew Jeffery <andrew@aj.id.au>
> >> Sent: Friday, July 29, 2022 10:29 AM
> >> To: Ryan Chen <ryan_chen@aspeedtech.com>; Joel Stanley
> >> <joel@jms.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
> >> linux-arm-kernel@lists.infradead.org;
> >> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> >> openbmc@lists.ozlabs.org
> >> Cc: BMC-SW <BMC-SW@aspeedtech.com>
> >> Subject: Re: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings
> >> for AST2600 i2C driver
> >>
> >> Hi Ryan,
> >>
> >> On Mon, 16 May 2022, at 16:18, ryan_chen wrote:
> >> > AST2600 support new register set for I2C controller, add bindings
> >> > document to support driver of i2c new register mode controller
> >> >
> >> > Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>
> >> > ---
> >> >  .../bindings/i2c/aspeed,i2c-ast2600.ymal      | 78
> >> +++++++++++++++++++
> >> >  1 file changed, 78 insertions(+)
> >> >  create mode 100644
> >> > Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
> >> >
> >> > diff --git
> >> > a/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
> >> > b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
> >> > new file mode 100644
> >> > index 000000000000..7c75f5bac24f
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
> >> > @@ -0,0 +1,78 @@
> >> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> >> > +1.2
> >> > +---
> >> > +$id: http://devicetree.org/schemas/i2c/aspeed,i2c-ast2600.yaml#
> >> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> > +
> >> > +title: AST2600 I2C Controller on the AST26XX SoCs Device Tree
> >> > +Bindings
> >> > +
> >> > +maintainers:
> >> > +  - Ryan Chen <ryan_chen@aspeedtech.com>
> >> > +
> >> > +allOf:
> >> > +  - $ref: /schemas/i2c/i2c-controller.yaml#
> >> > +
> >> > +properties:
> >> > +  compatible:
> >> > +    enum:
> >> > +      - aspeed,ast2600-i2c
> >>
> >> The original driver uses e.g. aspeed,ast2500-i2c-bus for the
> >> subordinate controllers. While the register layout changes, I'd
> >> prefer we try to use the existing compatibles rather than introducing
> >> a new set and causing some confusion.
> >>
> >> Further, what you're proposing here is effectively being used to
> >> select the driver implementation, which isn't the purpose of the devic=
etree.
> >>
> >> My preference would be to reuse the existing compatibles and instead
> >> select the driver implementation via Kconfig. Or, if we can figure
> >> out some way to do so, support both register interfaces in the one
> >> driver implementation and fall back to the old register interface
> >> where the new one isn't available (I don't think this is feasible thou=
gh).
> >>
> > Yes, that the reason go for another driver ast2600 to implement.
> > Like others SOC driver implement different generation have diff driver
> > in Kconfig and Makefile.
> > Example :
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/Makef
> > ile#L82-L84
> >
> >
> >> > +
> >> > +  reg:
> >> > +    minItems: 1
> >> > +    items:
> >> > +      - description: address offset and range of bus
> >> > +      - description: address offset and range of bus buffer
> >> > +
> >> > +  interrupts:
> >> > +    maxItems: 1
> >> > +
> >> > +  clocks:
> >> > +    maxItems: 1
> >> > +    description:
> >> > +      root clock of bus, should reference the APB
> >> > +      clock in the second cell
> >> > +
> >> > +  resets:
> >> > +    maxItems: 1
> >> > +
> >> > +  bus-frequency:
> >> > +    minimum: 500
> >> > +    maximum: 2000000
> >> > +    default: 100000
> >> > +    description: frequency of the bus clock in Hz defaults to 100
> >> > + kHz
> >> > when not
> >> > +      specified
> >> > +
> >> > +  multi-master:
> >> > +    type: boolean
> >> > +    description:
> >> > +      states that there is another master active on this bus
> >> > +
> >> > +required:
> >> > +  - reg
> >> > +  - compatible
> >> > +  - clocks
> >> > +  - resets
> >> > +
> >> > +unevaluatedProperties: false
> >> > +
> >> > +examples:
> >> > +  - |
> >> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> > +    #include <dt-bindings/clock/ast2600-clock.h>
> >> > +
> >> > +    i2c_gr: i2c-global-regs@0 {
> >> > +      compatible =3D "aspeed,ast2600-i2c-global", "syscon";
> >> > +      reg =3D <0x0 0x20>;
> >> > +      resets =3D <&syscon ASPEED_RESET_I2C>;
> >> > +    };
> >> > +
> >> > +    i2c0: i2c-bus@80 {
> >> > +      #address-cells =3D <1>;
> >> > +      #size-cells =3D <0>;
> >> > +      #interrupt-cells =3D <1>;
> >> > +      compatible =3D "aspeed,ast2600-i2c-bus";
> >>
> >> This isn't quite right with respect to your binding description above
> >> :)
> > Yes, the compatible need to be " aspeed,ast2600-i2c" is that your point=
 ?
>=20
> Yes, but only if we agree that we should have different compatibles for t=
he
> different drivers. I'm not convinced about that yet.
>=20
> I think it's enough to have different Kconfig symbols, and select the old=
 driver
> in aspeed_g4_defconfig, and the new driver in aspeed_g5_defconfig. Won't
> that gives us the right outcome without requiring a new set of compatible=
s?
>=20
The new driver in aspeed_g5_defconfig. And different compatible string clai=
m will
Load the new or legacy driver, it should ok like the different generation S=
OC. Have=20
different design.
Am I right?

> Andrew
