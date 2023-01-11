Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB59665EE1
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 16:17:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsWW01MDlz307T
	for <lists+openbmc@lfdr.de>; Thu, 12 Jan 2023 02:17:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Jooh+fDN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.21.42; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Jooh+fDN;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsWVL4nPJz307T
	for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2023 02:16:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRnPs9tHuHTjpNSFY563+pdY6tS1jsAFen8AGXNgYpEdvsTCX6lCFdTokayf3daYKTWu9FU3ybrl36WcC18ezejo7fl/7rmdqMS90np46R+aDCZtv2ZAnu5uhFJyMCIT/vcKkRu6x8LyrBcHSQjeSdpZ7DAe/UAa2ZzjVkU+bzF3zI8Dhe0TWvj8tjMVPhxS9roTSBnu7E836QoeS04iyXd7el6+NY0AbBeKqZrdCjmHkFLv/hM2m+EQq3TDT0RJjNxR1mubRktBFE7cd22Kpr7WPF6vVeMvg1k2e0lBaqjO2yQt4rEx29EEWEnK3/vRtnne2m8pluLgeSp82ao8JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tB93liz9RnFxTGcBapsO6NEwR98hhtBcsTfYrUJ35Y=;
 b=Qp+d5BAtSBel6ioTVgbMTjqV9o4lZwSxnVj1PIalIDRE4T3+EG1f1hC1/w1c6SVIMvgAAYmeqKcAPtshBQSi7O5H3BLIPd6LGrcJH/7y3ZQcqxbZyjVFw2wmwIXqUyhG5gRdTdm9nOHeocqlkdcaaiL2H5AiN1Tq7PYECEb8KRDHB2FpYYnqZvNWdqXV74tay+BAX4KWUdXgk1WzXJ8Z/OQxXJBrHamw5qF8DOYbcarsFTLMAqbuzzKXINfO2DPCIy8UpHhwaJmdZoohm3vNWHGBnHQe2dtQ1H6wDA2NJWiTdqbfeRBo+Bpl88a3HAGqZ9hwvY1hOjZ4Zaek3difpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tB93liz9RnFxTGcBapsO6NEwR98hhtBcsTfYrUJ35Y=;
 b=Jooh+fDNdyCxH2I2nU2gauT2DbLYhA7/VGWBw7PE6/FBcEfqxZ9gactjct6oaeXQG3GybJuYQ57Nsetha1Mi3LE4OQgMeqgdxbGgqUWQT0uq5MOCvco/9Uw93DPSku/i0+qjA8hEHKnjwZZo3Xh9u/JVy6bp/W0dYYKtCdK9a2o=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by PR3PR04MB7306.eurprd04.prod.outlook.com (2603:10a6:102:81::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 15:16:05 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 15:16:05 +0000
From: Frank Li <frank.li@nxp.com>
To: Chanh Nguyen <chanh@os.amperecomputing.com>, OpenBMC Maillist
	<openbmc@lists.ozlabs.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Dan Vacura
	<w36195@motorola.com>, Jakob Koschel <jakobkoschel@gmail.com>, Alan Stern
	<stern@rowland.harvard.edu>, Vijayavardhan Vennapusa
	<vvreddy@codeaurora.org>, Rondreis <linhaoguo86@gmail.com>, Andrzej
 Pietrasiewicz <andrzej.p@collabora.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Open Source Submission
	<patches@amperecomputing.com>
Subject: RE: [EXT] [PATCH v3] USB: gadget: Add ID numbers to configfs-gadget
 driver names
Thread-Topic: [EXT] [PATCH v3] USB: gadget: Add ID numbers to configfs-gadget
 driver names
Thread-Index: AQHZJYksvH6c0HvTAEK5rLNkYqGpX66ZVArg
Date: Wed, 11 Jan 2023 15:16:05 +0000
Message-ID:  <HE1PR0401MB2331CC8AE82C4DD96A1D398E88FC9@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20230111065105.29205-1-chanh@os.amperecomputing.com>
In-Reply-To: <20230111065105.29205-1-chanh@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|PR3PR04MB7306:EE_
x-ms-office365-filtering-correlation-id: 12b89057-80b6-4bd2-84c8-08daf3e6c26a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EPKF0DPof2eYi6U3SzEsVjaLda2upYjs/6DOGqWHWNdcDyVUc4tFvMd7ldoOfLJHUYTEPew0GGs7tV7VRp2T1tTsYTRxMTrTI5rBTHTcmyX/EmrSDaSQkWBTrx7olK1+BWogastJt7ERrLQWi1fKe2o97m1JN40Kob4OJTbPqZktaecwWZt7/1CIn2pTDUuk6vEVB+RKt5NZe/cPnf0/xd8WXmYIPU1H93RdVqpZ2K72xlk9U8SZ9kNLMMmjzqmVmCJ3ZEN9vwSvilJ86zcsfK2JMl+DKdzaWniwmkYIwwLaku3HhsN/zzME821Dqd/W2XXlqM8LwHpKStQD6oC1mJdG/BmvaYgfRATUGzlfDQWoIqgU/pK4iZ1Mg3JwWNnYRzzRoTsr4C1RKszZS3NJAC6qaewZuJGLW++JSgdK3P2jKY//1UoKkM4Rye7e7QdL/rlJm30Eeq2W/GwLlVJz0s8oLFCsB2fdeRYdvwUciYY0P1yXtKuy5Y1iIgoo7yxrOXBKuHsMWiTmkIec5jJrqc6nwBDlad2NzDjuNvqTNvFYi7n+cI7VuNpP8lsOGlGtTvOzTAnYLu/2aDQbaK39DO1C44ECLr+qMajrprLgxeyfwwR2+29u+RrcQWCf1TOiBAK+XtLuPafGRetuLGn2r5WzejAZBy4TLJoYYugMQ4Hx74Bq6gqmXN4YhSHAZCGJKoagYpWtVuQXPCWpIpcCqEqiutWNaiSU/b0+BohJdRM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199015)(6506007)(38100700002)(122000001)(55236004)(53546011)(921005)(2906002)(478600001)(7416002)(33656002)(26005)(7696005)(186003)(44832011)(5660300002)(71200400001)(316002)(9686003)(38070700005)(8936002)(83380400001)(52536014)(55016003)(86362001)(41300700001)(64756008)(8676002)(110136005)(76116006)(66556008)(66946007)(66476007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?9zzRXAISxYUAhbk88zELLhjR4oU5hDM1uk5kAyi8Xa3pSyR4DrcQph+U9Hya?=
 =?us-ascii?Q?5GosXC795ZYBWV1gjBXk9tkrMzsV0PHQG8Lz0jyDFWZdIivhjuNqo8w8cTYj?=
 =?us-ascii?Q?JtVRcYSUgwIOn/FYWZEuVNglxOF7ce9LoF8vuGhcwSkzIQVjnI5wEeix1RC3?=
 =?us-ascii?Q?7G6Jp67XxXmYGAaWYhgJ80s0Bwx+5jKmTQhg9Od2XGQGwg7qnTmcN283Y3IT?=
 =?us-ascii?Q?DXVU41uQNI1QQrFFPk5FERV/syAHUTxQYfNdFbOR7+V29utHCslIlxgG/IZ1?=
 =?us-ascii?Q?bQMWakyU8w/mOjFctyIbgIgb5W6EMVvGveg17NAmGsRg+iqzfg3YbKBacgZi?=
 =?us-ascii?Q?V1Owt+vrJRsD6W7NIxNmbhRmWbDnwYEfvHc1hvu0OY86U1EvHQ725H1ybROV?=
 =?us-ascii?Q?Jq8IlhfuRmAr75nC036kQKJKt+fPgoCdjGWp9Ux9P1F7KipDXLtR4bMGZ7br?=
 =?us-ascii?Q?C/1XvSngSQlqoybgDF24irpQq4wqmXGnXNFNhcr/2yqkP2mrLbyNE/ILcVM/?=
 =?us-ascii?Q?cpMA15XmNdt8g/RZ45vCEo2J5RUyCc/s03+uSNylWfk1c/Xc+VIO6OZGbsjq?=
 =?us-ascii?Q?oKueDNwulk9S/Llg5AOctUALrEvEktsLZulaAyY03XmcM5qVx34oxEZk8yFk?=
 =?us-ascii?Q?1LL47r6kjy7v86Vx7Rz3ruA6ryGvSM9cERdcxme+gP57X6Ol3ZPu+HkYgNzV?=
 =?us-ascii?Q?oMuDIZoE9VjZuVOYIhHLJeRjVn7Dp57ZeSup0GkOqMScViRQhl6MLICorFpm?=
 =?us-ascii?Q?BfwRZEkSQ7G4SjS+ZLW7dwuTLwkSXnnIJHYCloYegpJQC3St+y6NWmVioCQO?=
 =?us-ascii?Q?qTI3R3adlxfIYRlMjEVCuJGKqXS6Qv3PtG7IMSZrKtmd8XY6ZBOwmKIMMQLx?=
 =?us-ascii?Q?g9VcHP9z3SnDYN6KBu7zM+W0m+RRuSaFU9j6J8I2wEMZbjMwH1ejw6Ji42VP?=
 =?us-ascii?Q?y0yeu2ZBKldsGUsfR/HKOgLw+1FiFOK4bwvccqon+s8bsbXQdhX0Uy4elJjs?=
 =?us-ascii?Q?WdGSz58pxXGbLgj+aqBRDZrHnb8K1Qu3vgJRiDbnDZzFk9lyyGz7B8HbTvNX?=
 =?us-ascii?Q?N6Mgckq2C49yfWyVA3P6XznIqMsm1zJqBveDJSj5TnNg1qeg8IOA4WFmooHN?=
 =?us-ascii?Q?qSqPsJzN/tjsGrX5y49swu7nxw2zCZpNBNoPNNfcb2L8fH7/3jBCD2x0BksK?=
 =?us-ascii?Q?DkpP4nYlhyS66L+0CvrtxAo+tMi810EIr/VQZjGQfrZ3VVm0Dj4wIsvo1hbZ?=
 =?us-ascii?Q?LRNNNTvqyZ7BVYBGmVVqtkZfK6OrDXMGDMRHnsWMhxOiwnSsfghSsJ6PygQT?=
 =?us-ascii?Q?x1nYSa3+cqDa5JhOAE60mIo1RtJhCyLDP31G48enTY4gxFIHdMVt7KDbHaq7?=
 =?us-ascii?Q?Ujr9qYA77jpFz3ZbsDZ23lP0jDdt18TEhs+3N36eYEY1BLTEh8aj8A5yCMpy?=
 =?us-ascii?Q?cyvqmiK0+XMxU6ShzPSIyNkgDHxwgIKuAtebBxUTUyAqnt9vrHwYRuotms1Z?=
 =?us-ascii?Q?ZILCOmMKQglzgTaeTEs3hDpy4TfmFQo8D5EDq9tvGHMH9Zn1DxxUVMO4TAjJ?=
 =?us-ascii?Q?g/lP/SXsOLVJZAFWQU0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b89057-80b6-4bd2-84c8-08daf3e6c26a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 15:16:05.5735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQ/qpRxjV9wPu2Jo+CChvGH6sn6LA7n0xRp2BpY3ftuC2EzqeXzUsHchLMuSh3272/O4uOTK2CLK5AupGN9HtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7306
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



> -----Original Message-----
> From: Chanh Nguyen <chanh@os.amperecomputing.com>
> Sent: Wednesday, January 11, 2023 12:51 AM
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Frank Li <frank.li@nxp.com>; Christophe
> JAILLET <christophe.jaillet@wanadoo.fr>; Dan Vacura
> <w36195@motorola.com>; Jakob Koschel <jakobkoschel@gmail.com>; Alan
> Stern <stern@rowland.harvard.edu>; Vijayavardhan Vennapusa
> <vvreddy@codeaurora.org>; Rondreis <linhaoguo86@gmail.com>; Andrzej
> Pietrasiewicz <andrzej.p@collabora.com>; Heikki Krogerus
> <heikki.krogerus@linux.intel.com>; linux-usb@vger.kernel.org; linux-
> kernel@vger.kernel.org; Open Source Submission
> <patches@amperecomputing.com>
> Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
> Subject: [EXT] [PATCH v3] USB: gadget: Add ID numbers to configfs-gadget
> driver names
>=20
> Caution: EXT Email
>=20
> It is unable to use configfs to attach more than one gadget. When
> attaching the second gadget, it always fails and the kernel message
> prints out:
>=20
> Error: Driver 'configfs-gadget' is already registered, aborting...
> UDC core: g1: driver registration failed: -16
>=20
> This commit fixes the problem by using the gadget name as a suffix
> to each configfs_gadget's driver name, thus making the names
> distinct.
>=20
> Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>

Reviewed-by: Frank Li <frank.li@nxp.com>

>=20
> ---
> Changes in v3:
>   - Use the gadget name as a unique suffix instead     [Andrzej]
>   - Remove the driver.name allocation by template        [Chanh]
>   - Update commit message                                [Chanh]
>=20
> Changes in v2:
>   - Replace scnprintf() by kasprintf() to simplify the code [CJ]
>   - Move the clean up code from gadgets_drop() to
>     gadget_info_attr_release()                        [Frank Li]
>   - Correct the resource free up in gadges_make()   [Alan Stern]
>   - Remove the unnecessary variable in gadgets_make()    [Chanh]
>   - Fixes minor grammar issue in commit message          [Chanh]
> ---
>  drivers/usb/gadget/configfs.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.=
c
> index 96121d1c8df4..0853536cbf2e 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -393,6 +393,7 @@ static void gadget_info_attr_release(struct
> config_item *item)
>         WARN_ON(!list_empty(&gi->string_list));
>         WARN_ON(!list_empty(&gi->available_func));
>         kfree(gi->composite.gadget_driver.function);
> +       kfree(gi->composite.gadget_driver.driver.name);
>         kfree(gi);
>  }
>=20
> @@ -1572,7 +1573,6 @@ static const struct usb_gadget_driver
> configfs_driver_template =3D {
>         .max_speed      =3D USB_SPEED_SUPER_PLUS,
>         .driver =3D {
>                 .owner          =3D THIS_MODULE,
> -               .name           =3D "configfs-gadget",
>         },
>         .match_existing_only =3D 1,
>  };
> @@ -1623,13 +1623,21 @@ static struct config_group *gadgets_make(
>=20
>         gi->composite.gadget_driver =3D configfs_driver_template;
>=20
> +       gi->composite.gadget_driver.driver.name =3D kasprintf(GFP_KERNEL,
> +                                                           "configfs-gad=
get.%s", name);
> +       if (!gi->composite.gadget_driver.driver.name)
> +               goto err;
> +
>         gi->composite.gadget_driver.function =3D kstrdup(name, GFP_KERNEL=
);
>         gi->composite.name =3D gi->composite.gadget_driver.function;
>=20
>         if (!gi->composite.gadget_driver.function)
> -               goto err;
> +               goto out_free_driver_name;
>=20
>         return &gi->group;
> +
> +out_free_driver_name:
> +       kfree(gi->composite.gadget_driver.driver.name);
>  err:
>         kfree(gi);
>         return ERR_PTR(-ENOMEM);
> --
> 2.17.1

