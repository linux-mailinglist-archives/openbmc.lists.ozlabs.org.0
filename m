Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 582896EA167
	for <lists+openbmc@lfdr.de>; Fri, 21 Apr 2023 04:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2d894LvGz3fTg
	for <lists+openbmc@lfdr.de>; Fri, 21 Apr 2023 12:02:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=kNwevWVU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::72c; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=kNwevWVU;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2072c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2d7Q4DNJz3c9L;
	Fri, 21 Apr 2023 12:01:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6A8KCMkGH11NAYsP5+U6hU5DWHhUI9ubtw8AoHGgVUTlO5DF3X3MVwzocW69Wiq14dg/KEr+GuhdowlmDtoAJVzUue0+xTRYRzAsaAsImPsaNXm4YK3yco1OOeoUodHqmDDRciUTU8NlWG+NVtKgnycRrhutclUTY+Q7g+I5hnPwhekRpLZHp3tvdiGRzm6hFSNKxU9+PJQdNY6meyeDS/9thQO75LeStY+PJpSfHTz/qRLAy0xIlBtJT8IKT7ZnN+mmHYZB52VvwUrdsveOrRzkpUseCIEI5C1KpSlSAqfapHMBrJ+STTFPfE7T3TLyCWyFbZOMVugpTgcBAEt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qokowh5ltpHchEkbY+Ov8ojs2a0WTg3KFJLGarqidY4=;
 b=M4RUhqVc+NkosG9//b8PjoQ+fCcEdxzHDxPrcwhBBvdCGCKqgF+AtAByQd8FLsMPhmCeDjk4P4veOh37xWzCzX4OHSQjp0KN60BTNRsvmtmbn6QyvNr0QTWbrtEAwZeHPr6sm0xTl+AOO75MI5b4Qf46U4dHs8mxO1L6qr8i92vvZDypwOIZOO+JIXlICZl1M+Qx2WlKtPer2gT3iSDMUZETLH6mspg2Ee3lR6Jq0uryiUlViiuMmhzruDKAaGaoZ3Mwkqvoy3sBFT/JvNKwx58biD0ICVWZMWYU+Qqfl6WINAphKfkCq94i3Zvq//suWJXg93rRdJqu0+qg9Qfovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qokowh5ltpHchEkbY+Ov8ojs2a0WTg3KFJLGarqidY4=;
 b=kNwevWVUoU1gImhL3rHkEpSZltq2pA8+XHKN4CEECBwYbYBfgcmpRnZfU59HexZsok75z4F+DFi/EILlDjpNBik9N3T366Tbmezne6g65jAVzr6OTUkz6J9DNSSXmDuJ54BjeE4Cao9wevzaan6kn9/DF58+8m7waG83mLuSjLBM/zi7wJmKVFbPTkOACh0shedojIw1RXGMDmd032rEkA4Mey9sCUT7AAa5SONoyj3UpunlC3SrLsNbKnswWBBVdOceifJk7qpbqwVdrC/HPRVKShA5m61vNjAYhYpvGxMKRUElkg3/6NyJa9oS5oHwU0iNzJvml6MWJoggE1B6GA==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5632.apcprd06.prod.outlook.com (2603:1096:820:c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 02:01:28 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 02:01:28 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Subject: RE: [PATCH v10 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Topic: [PATCH v10 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Thread-Index: AQHZbzmqrA2zXnqjgUeJpYzEt+Ip7a8064OAgAANtPA=
Date: Fri, 21 Apr 2023 02:01:28 +0000
Message-ID:  <SEZPR06MB526997FBE2B216AD82986E0EF2609@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230415012848.1777768-1-ryan_chen@aspeedtech.com>
 <20230415012848.1777768-3-ryan_chen@aspeedtech.com>
 <20230421000529.6awtnawqgbk5orcp@intel.intel>
In-Reply-To: <20230421000529.6awtnawqgbk5orcp@intel.intel>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5632:EE_
x-ms-office365-filtering-correlation-id: f8c5478a-6402-470e-1249-08db420c51d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Q0bW2gKqtww/HL6qdvdswEPuNkKEaq8Q55HTQTOsw5kHbXY3lGHkHw60qsES/Y8voHT/TCbYgD90LaBeFZhk+aXkbwGuxlb59CvJLiQtf+IAzLAsDjjxyqpiYOdbS6tJDm0FSkIsWDwKf8EYKx+UfFmNHAVERgsR57AiX5z4NITfUPlf71x3GOK39l782bP0g8iBznj4s55vEBqBi7gyi78a2RR8UYNFE16J8sNX0T9U48FBsEayoiHihUXlH+KkEyHwwn+nxohW6Gvs78KDcEbaKl5yrtEjUWr1s+DTAY+NBkMqytAQ1Lk+5QfaaW9nlb68+YkneD1b4/eamINvQusUVnz6KSwC/So4DZuZmC9+9s3MTvZSR5UEn9Dd0xmI+O8hYr8Bu3NpuC2cfvvhI0Ki2X8lbfbweQo2zJ8GXUsUBQcV0DpnYqVsp54GpO3UTZSCqByhBpXvrJEHU4a5Awv8ulcIe9s3c4T0J4mNMC8VeWnDMKAGPzGG3z/mHliNwbWbkLhmkmWZJ4PhL4bcrelJih5wWTcw9HtJcpfp4UE40NgyYHE7M8Xv6bHoX3mhuVV5lNqD2PzsC0kBcj9npswRkljoZIKmveoACMRJVnQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(39850400004)(376002)(396003)(451199021)(83380400001)(966005)(9686003)(26005)(6506007)(41300700001)(122000001)(71200400001)(7696005)(186003)(478600001)(7416002)(316002)(6916009)(55016003)(66946007)(64756008)(66446008)(66476007)(66556008)(4326008)(76116006)(5660300002)(33656002)(54906003)(86362001)(2906002)(38070700005)(52536014)(8936002)(8676002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?wPUTFMXcdCN8pZBe19nKxeIAJfvmcNgTZv1NpGGghRmhDl4AirJGf20yUjBw?=
 =?us-ascii?Q?ZbxZ87MNbAFnBEjwOIvhfP/6v69GRvol6QSANbw4DnlBQknWTopI7livhYe9?=
 =?us-ascii?Q?NMmX41dfl1qlcJXfvFUAmo5cRc3WSpNDjt0RolSRLF1bclxToedNuggSSqgC?=
 =?us-ascii?Q?yc6EhqqV3A62MEHWOaLqBhmvZsaFtGBfuidJX3Pue53beLenG1mMjVBAMngG?=
 =?us-ascii?Q?ve4HjgCqIN979NkgQZmzf5O0CkBdUeqqLb+QRXBwRup6mxLz/cKQ3iPLr/3D?=
 =?us-ascii?Q?zNsJmcoMp8ZJed2uVVUVhC2nVZMubpQ4OvLa/Kc3h2vjnJ8j4+Nfsn1GIQul?=
 =?us-ascii?Q?3Ikcme4RL/H/ttHm2ENtOtN0E7d762KWLhUrdUPmNDvlPOIbz03FjIstUJcD?=
 =?us-ascii?Q?dkoyNoo7lZ+Jy4/ly/VVyW4Hd3R5c4DgDOJ93USWgVpHXrCEKuX4ODwq1uhS?=
 =?us-ascii?Q?KXV8t4kuKQPmCwBibp0Fdq4xqesJ9x/jvaB+1grv82bBaaLsKoYpfVbAYSw1?=
 =?us-ascii?Q?7BKZKgtMGzYdEmPav2KUszbsc5Mp+xOmUA+17qNj3cgqztmQEGSPhFRVUbh7?=
 =?us-ascii?Q?71wn9qrc3FVLDv6m7ZXsHP8KiyAk9YrB4+V5wjMLiA4MxFy0zzuNK7OTsHzr?=
 =?us-ascii?Q?xhTcv0GTS81JGVm7MrVqbmnOsCT4Lc5FLGkRB9U9v3WX59HI0161t/W+W3mj?=
 =?us-ascii?Q?bn2Xstl2MgFWuMSbbGr4EhBfdaYTo2rVcOm3Heqc3ce+CrttVKNTCuX7krfG?=
 =?us-ascii?Q?cd/Lkl+mmcHfTva4sQo6FBdmNNknw1BrFVae19PAXZ7IaZfNMjeJF6Qu444x?=
 =?us-ascii?Q?L9RQrQ18tgrssRK46p3LPwRTElTDebFn/H4rNC2iQbdsYmZGNKYWP/nZwOmw?=
 =?us-ascii?Q?01y7JfjdkSg1/qu0rOSRrYyye9dGZ+/pyPzzyJKWWIltaSSmML9mCFVkRsa5?=
 =?us-ascii?Q?hZJ/AJ+tFRk29SaAKACLrXRz6mOvrxCL7kLj6DxM653C+51UJnx3gpHijP5j?=
 =?us-ascii?Q?h0oG37cO1gGg/XLivSLrQwv2OmdyMkS9WNgfW90RSA0bd/PJ8rnIII7I0C9Y?=
 =?us-ascii?Q?m+6X8isaaS5o/0GyUepz/LO/MS11gzpoquN1DGANPh1fGFzHxw5qxc9stHQh?=
 =?us-ascii?Q?MBzGrU8BY2suycr01ltHQeR3vSUqQHTHYexTC7DnqBnwO/8XgKV0mPDPm7vf?=
 =?us-ascii?Q?4dX+aEOUS4eSB7OxkCVVTZwRFQFgvGsuA4qsK2RoS6qrOHb6CPYbrVMvhkmN?=
 =?us-ascii?Q?V6j2rKMmdi4wpiFJMYgzXGf6av6fSQbhkpJU9t5bGIPhpGgGn4NgzySJh7RN?=
 =?us-ascii?Q?FgpqXzuaIOY77BZOYK+tkptFsyNkQiuWeeCuNuI0JZ+zjuzrGc4ewMpR/T4O?=
 =?us-ascii?Q?JDA1k+gtgkj37kfyOG6cj2lVBT2ku9Vyf52DGiKAVf90qf1UzYFj3QE7glMJ?=
 =?us-ascii?Q?42iRrJKieKV2IOLGNOj1wamdRkurwQdGY1Nl5Ca/K5vFtK90ivF2hybQ2O0/?=
 =?us-ascii?Q?rF4bHcaDA3QbRlY8zHpbekbRVjfJ907jFbr0VLN5gIhPq/9Vl4AntilJvhTd?=
 =?us-ascii?Q?dVO8W3Gbos9LE4m04/tJOpenxKxH+/9cuxkU4/mR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c5478a-6402-470e-1249-08db420c51d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 02:01:28.2655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fhVhAVzVexs17+Kg2PoX44SFjr2EtQ1DVKbDGEaRVNwjHtkQIN1bKbiTfhWqg6me0NInPq+OezCpYiPKzl36dvlRHJ9z0rkCF6So3OtJiY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5632
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Brendan Higgins <brendan.higgins@linux.dev>, Conor Dooley <conor.dooley@microchip.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Jean Delvare <jdelvare@suse.de>, Phil Edworthy <phil.edworthy@renesas.com>, Florian Fainelli <f.fainelli@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, William Zhang <william.zhang@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Andrew Jeffery <andrew@aj.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>, Tyrone Ting <kfting
 @nuvoton.com>, Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Andi,
>=20
> On Sat, Apr 15, 2023 at 09:28:48AM +0800, Ryan Chen wrote:
> > Add i2c new register mode driver to support AST2600 i2c new register
> > mode. AST2600 i2c controller have legacy and new register mode. The
> > new register mode have global register support 4 base clock for scl
> > clock selection, and new clock divider mode. The i2c new register mode
> > have separate register set to control i2c master and slave.
>=20
> This commit message is a bit messy, could you please write it more clear?
>=20
> [...]
>=20
The more statement is in cover letter.
https://patchwork.ozlabs.org/project/linux-aspeed/cover/20230415012848.1777=
768-1-ryan_chen@aspeedtech.com/


> > +static int ast2600_i2c_probe(struct platform_device *pdev) {
> > +	struct device_node *np =3D pdev->dev.of_node;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct ast2600_i2c_bus *i2c_bus;
> > +	struct resource *res;
> > +	u32 global_ctrl;
> > +	int ret =3D 0;
> > +
> > +	i2c_bus =3D devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> > +	if (!i2c_bus)
> > +		return -ENOMEM;
>=20
> Let's use dev_err_probe whenever possible, at least we keep a coherent st=
yle.

Will modify dev_err_probe to next patch
>=20
> [...]
>=20
> > +	ret =3D devm_request_irq(dev, i2c_bus->irq, ast2600_i2c_bus_irq, 0,
> > +			       dev_name(dev), i2c_bus);
>=20
> isn't it better to use threaded irq? You have quite an elaborate irq hand=
ler, you
> may want to use a thread for it.

Thanks, but I would prefer to stick currently implement of the IRQ request.=
 Thank you for your input.

>=20
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "Unable to request irq %d\n",
> > +i2c_bus->irq);
> > +
> > +	if (of_property_read_bool(dev->of_node, "smbus-alert")) {
> > +		i2c_bus->alert_enable =3D 1;
>=20
> true;

>=20
> alert_enable is boolean, make it bool.

Will modify dev_err_probe to next patch

>=20
> > +		i2c_bus->ara =3D i2c_new_smbus_alert_device(&i2c_bus->adap,
> &i2c_bus->alert_data);
> > +		if (!i2c_bus->ara)
> > +			dev_warn(dev, "Failed to register ARA client\n");
> > +
> > +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER |
> AST2600_I2CM_SMBUS_ALT,
> > +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> > +	} else {
> > +		i2c_bus->alert_enable =3D 0;
>=20
> false;

Will modify dev_err_probe to next patch

>=20
> I'm not going to review any further, please send the patch after you have=
 run
> checkpatch.pl on it. Thanks!

Sure.=20

Thanks, your review.
Ryan Chen.
