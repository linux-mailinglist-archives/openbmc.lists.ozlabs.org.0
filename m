Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 638523F931F
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 05:53:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwm5L1SzDz2ynM
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 13:52:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=fb6u1fl0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.134;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=fb6u1fl0; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320134.outbound.protection.outlook.com [40.107.132.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gwm4n5SJ6z2yJf;
 Fri, 27 Aug 2021 13:52:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juVw9hKneOo+GvVol2quOkbbvt1qV3OJxPKgW7r0n7hUzSyFa5oE1c0mK2+UoIzkMwnZta99vYo+ymjB4LSmsMzt9wpO36kKqSdQbBu122sNnhKvGpvSE/lQSFBEbCP3LTQzRSjjf8Zfz0FW7r8cUktYD+XMsVmjWpDMnYAetssHHY8HrN+8N3L5DMcApPlKVbjTg82lhL1T4NxiwD9p6E9cFNtfU8FDBzP52Jkdgi3fhWDicjbIbVb2B+lRLCI62PND3Gl2mrVyxjoz2wqa85zIgWiqHWUBGZBa+Uz7xpP0pHaIm7xuebGpRErMxaR69hjvXriCG2XnVzmzJwYbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33KnKNTN6+QYy4L2GF53JZkNpH5SfV0omvitYZ9dSLA=;
 b=iKcgh4Uo4Nd2Mw9DbAi9cnp2VzKB7Baigj9PVEu2T3egIiBRIk6lD7lVWVQKHmjlMliWQ8AC7xGhkgciIcceh2anTKzKx4eUUVzSn3e42cuOgdrKqzpi0XwZ4LU8kVMb3tMn5IglekhOPA9/VZLsLlErHDq5IOcpyns7MQc6rSvXBIonat75Wnq6h/M1v+6AN7UQoYbYBQnhJ9NQvvhB9dOwhWwK1qS5MX8pWhcKCgouwCKxZgc+yLGZm0huUS2dRrvS6hBW53sSYtST6BFcG/C2uV5sF2fIhAi6lWYEvc+pzVMdsyFjdvK4MGaLOmLRgRuSgUEF56ireNnbOSzpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33KnKNTN6+QYy4L2GF53JZkNpH5SfV0omvitYZ9dSLA=;
 b=fb6u1fl0Y7He9TMYroDgIeNwBOk55RhPTa+MenS2IkTnJ3m9oUUWKASE6oRcHGH2shTlpyi81PyhE1kIzFfv5ZdjbOcgHbx7ZGMzOfrtSZTC7lSS8YBHY0+IzLvq3gjLUprZ+E3PlxT584wBuakA9TgLtlX81RLtKbsXasgDkfPYNqXwkSiceRrknxn0iX3BNOF2A28oZtXuwcuSvXYAmqA59rJWabfkb/DrAA/TraJnb0//uQObXzYuJpebd2Yeu9eTAV6JN1yZoslqbjd8rY8mgpVElt+qrKXJEBFcDmzGjFaTugxcPrLKI393CHCmi7T+9RzstCscrbpR/fdIDw==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3555.apcprd06.prod.outlook.com (2603:1096:202:3f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 03:52:03 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4436.025; Fri, 27 Aug 2021
 03:52:03 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: kernel test robot <lkp@intel.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 3/4] soc: aspeed: Add eSPI driver
Thread-Topic: [PATCH v3 3/4] soc: aspeed: Add eSPI driver
Thread-Index: AQHXmkI+4Lhg3IxgrEO2OY2fsCr5kauGcBUAgABIZaA=
Date: Fri, 27 Aug 2021 03:52:03 +0000
Message-ID: <HK0PR06MB377927BDCA9CC79B598251B291C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210826061623.6352-4-chiawei_wang@aspeedtech.com>
 <202108270732.OvBQ4K3D-lkp@intel.com>
In-Reply-To: <202108270732.OvBQ4K3D-lkp@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5032b78b-c5e1-454d-d4b9-08d9690e0819
x-ms-traffictypediagnostic: HK2PR06MB3555:
x-microsoft-antispam-prvs: <HK2PR06MB3555FEEFA7A50AB0E2C4541D91C89@HK2PR06MB3555.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZtamstZRW1qxOKSNlk5t/znM0wvuLZUfJLjpary1D36C4p73BJlQ/Vftk94EX1fer8NqTusvciHHva0RcXSIb3qdJdNwAtoIM7JGIgnSH6YPvLaU4AuT8QDM/wtC6aG24TPcNQtptcErG2S9nU8VRJxR+Gs6vh9RbyKFEszGaqxERzMMlm4UKnp7LSSZjPoSZ/il8j5lhNFF7W6+IxBef+VGv6dWZDLVZkv4PK0N+bLQpMl6QhSlqe2QXKYlbZ0JjK7B0nzcOwX/+6aXPqrKcJXSGoifWj2SoHU4rJgDrh5mhJzE96YDXks1j/xkyvYl207HCH5JDbvuV3NkTLkOLFYBf+EeX2hyhACW4iyzlnEQBc0QJjiQyGEpeLZF1vPjxGE3ivxynrLa06Rgy4JK/55VqJEjHw70dWdIYcRODZaJ+NLlsugM2p1WlJFGS1zQ/oI3JUUeTeby1KUTvHb1sdFEb4aYyOzq23IC1AdVi11skQjzPr2a9s1UdXlmRYl6ydxHBr5XYDL7i/CHwCNamkxEDQcl03xVa8VfF12RsvAMrHaJ5chA1IG42QKdE11DC+9zpdfCu6gOIOvU7QIYf668aIMhYEebD6GaxP9lqY15zY6+WN2k4ErbPBvlXyuNAw9GngVyVAP9REGJT/SQBra6ALRPUl8rmSDAOJkvHTvTf4jqDZ5OuK2uvlvQLpsnXWAReHAaM+6ez4Jx4MZx/4q7y0XtgKSNMWFrMo9XuzauzAIMP1GxL/GqgtSqp+8dxOd+5NNCJO1JrM2xQo6Un0kVnRf6aiPOWNCHhMzlmd0rPRYfpb6Vs9O5kawKhH5OCqZiAUlc1weCtqW2k5e0hA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39840400004)(136003)(376002)(366004)(5660300002)(26005)(966005)(9686003)(55016002)(86362001)(8936002)(71200400001)(7696005)(52536014)(316002)(110136005)(508600001)(76116006)(66946007)(6506007)(122000001)(33656002)(4326008)(38100700002)(66476007)(2906002)(38070700005)(7416002)(186003)(83380400001)(66556008)(66446008)(64756008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gpftFQL3qkhB1eWYVLLoSEFgRUnEdVB5fgNOauqvo3H97RTtyNXUUenRrixE?=
 =?us-ascii?Q?i+RYPoC/YAJgEgFAeNcVkE84NuIcyOORqNO6DNiJJrFYSkfgLhbrFuijKxN6?=
 =?us-ascii?Q?Q69eZPyfxQQ4sWEjLX6NaNzWnyKQyM+edip0MBU4Wm3Rv1r7mCVNrAwUKCh0?=
 =?us-ascii?Q?kYeDUklj8xGcPC/K2F/juki37T8LaL0h6l5iApjZqE9Kdc4vhQVMDfD+82Wo?=
 =?us-ascii?Q?8G6jPi5Qn46KIbTWyAwHASXEr9GfBaw7fN4t4ysOM8sUrAKJvwsw3YLPs1+u?=
 =?us-ascii?Q?enjjCMNhJ/hYvXLkSD8Ulb+OzRlgdoPCn5TYaM77QBWuuuJhH3O1AqWkdjnw?=
 =?us-ascii?Q?FSBPsj99lnHBdqTouTVG814aOOltv4etaVJ/jWK1gZvAxqBPusWv/kiA+yVE?=
 =?us-ascii?Q?IJBQIKnHO7qU+i5gADxNqfB60MxFHuKdEvvMuVUsmcynihDsGBH3PEJGENAR?=
 =?us-ascii?Q?FQm/379nnDFoVlvED/8CMrD9OpevARYFAcKOk+Ed17ylTwrNzYz3jt/0pjAD?=
 =?us-ascii?Q?aaU2ANRxS/PQWiQD2ZOnaDR7hLsdVw6UU8rNtTcSczLVEf1YdeLe9Js8alWw?=
 =?us-ascii?Q?ed6jD/WooiTj4o0rRt94zDOXj8D+Fomp0MWUKwcDgU2Lbjn0fIj4rq5JZGMq?=
 =?us-ascii?Q?GXmFb439y8llVE+Y0jyA4f399jQhiFGrz+JYtM42T6xSdV+Bci6HH1C/BUgk?=
 =?us-ascii?Q?EJKCDBQbRPhOaljEt24tX3vgWqbQZ5orKJCfbawm0tgd6bHZ3KWkojnX2MnH?=
 =?us-ascii?Q?mSU9E5M0FvujCMiAnxwhWQ+dGl1Ti6G31D1loupdIUNO/6OmNnTCJVNATj+g?=
 =?us-ascii?Q?QAxfMGkg6hjx99mfE6OH1tNIdRq4Lw3Q4lbSTY0OevvQeuZl+RxqBjv6i8qq?=
 =?us-ascii?Q?uspPT7/gvjrNRrsJhuU0hbWWOLK2YOLMyLg3DYsysADhxDRcdBdHLqm/l2AJ?=
 =?us-ascii?Q?LMaHGBxVzDHuyph4p0P0gLC1d9rtMb2s7bNr4kB8b8qU/iYvFV4e4PdF0tmX?=
 =?us-ascii?Q?l62k7ISEq9+xKTnVGOr5CfRjhBgrVCdDBlX90lwkcJKQht5quhy2ZMOjyadP?=
 =?us-ascii?Q?37uog8GCn2Jo9YHTtdciSRvRAQkbYU+tQ7Lhgqn/ZBBA6t8MMRDpEH65CNK+?=
 =?us-ascii?Q?sSW9Vv1Y2G+ybRzsixHfNe6qg53kPydSc3Mf9bGpEHhrHhBv7n7sk2mp6lfd?=
 =?us-ascii?Q?5LsdZDph0EGY9IywuENjmFH4hH1jg+AFM7DgsyMFJa8KtcgEoTWrNrVncpJi?=
 =?us-ascii?Q?PBxNXFX4DK0HsZ9KGa0s5fcXGQ+dxKssnCnIt2T4le6BJGiLKbqsp9AWiAGq?=
 =?us-ascii?Q?4aUBc4yCFSxk+/aCAMOQKnIz?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5032b78b-c5e1-454d-d4b9-08d9690e0819
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 03:52:03.4545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8kP5oJLj6fVT97Cuawwp6o4R5TtQx4ktvrkPYjTFci6TMLOaVbnhXkCr33iZgJMmq+hzfAZuY2++k6qgnY4hoS+sPRcGtq13L612e+KFofg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3555
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Aspeed 5th and 6th generation SoCs are based on the ARM 32-bits architectur=
e.
Should we follow the report to make the driver 64-bits compatible?
Or revise the driver to use more specific data types?

Thanks.

Chiawei

> From: kernel test robot <lkp@intel.com>
> Sent: Friday, August 27, 2021 7:30 AM
>=20
> Hi Chia-Wei,
>=20
> I love your patch! Yet something to improve:
>=20
> [auto build test ERROR on robh/for-next] [also build test ERROR on
> arm/for-next keystone/next soc/for-next rockchip/for-next
> arm64/for-next/core linus/master joel-aspeed/for-next v5.14-rc7
> next-20210826] [cannot apply to xlnx/master] [If your patch is applied to=
 the
> wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:
> https://github.com/0day-ci/linux/commits/Chia-Wei-Wang/arm-aspeed-Add-e
> SPI-support/20210826-141737
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git fo=
r-next
> config: arm64-randconfig-r002-20210826 (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 11.2.0 reproduce (this is a W=3D1 build=
):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =
-O
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         #
> https://github.com/0day-ci/linux/commit/2980a1777c50754fe145f2e73ded873
> 9931c0712
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review
> Chia-Wei-Wang/arm-aspeed-Add-eSPI-support/20210826-141737
>         git checkout 2980a1777c50754fe145f2e73ded8739931c0712
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0
> make.cross ARCH=3Darm64
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from drivers/soc/aspeed/aspeed-espi-ctrl.c:22:
>    drivers/soc/aspeed/aspeed-espi-perif.h: In function
> 'aspeed_espi_perif_alloc':
> >> drivers/soc/aspeed/aspeed-espi-perif.h:446:43: error: passing
> >> argument 3 of 'of_property_read_u32' from incompatible pointer type
> >> [-Werror=3Dincompatible-pointer-types]
>      446 |
> &espi_perif->mcyc_saddr);
>          |
> ^~~~~~~~~~~~~~~~~~~~~~~
>          |                                           |
>          |                                           phys_addr_t
> * {aka long long unsigned int *}
>    In file included from include/linux/of_device.h:9,
>                     from drivers/soc/aspeed/aspeed-espi-ctrl.c:9:
>    include/linux/of.h:1249:45: note: expected 'u32 *' {aka 'unsigned int =
*'} but
> argument is of type 'phys_addr_t *' {aka 'long long unsigned int *'}
>     1249 |                                        u32 *out_value)
>          |                                        ~~~~~^~~~~~~~~
>    drivers/soc/aspeed/aspeed-espi-ctrl.c: In function
> 'aspeed_espi_ctrl_probe':
>    drivers/soc/aspeed/aspeed-espi-ctrl.c:98:30: warning: cast from pointe=
r to
> integer of different size [-Wpointer-to-int-cast]
>       98 |         espi_ctrl->version =3D
> (uint32_t)of_device_get_match_data(dev);
>          |                              ^
>    cc1: some warnings being treated as errors
>=20
>=20
> vim +/of_property_read_u32 +446 drivers/soc/aspeed/aspeed-espi-perif.h
>=20
>    422
>    423	static void *aspeed_espi_perif_alloc(struct device *dev, struct
> aspeed_espi_ctrl *espi_ctrl)
>    424	{
>    425		int rc;
>    426		struct aspeed_espi_perif *espi_perif;
>    427		struct aspeed_espi_perif_dma *dma;
>    428
>    429		espi_perif =3D devm_kzalloc(dev, sizeof(*espi_perif),
> GFP_KERNEL);
>    430		if (!espi_perif)
>    431			return ERR_PTR(-ENOMEM);
>    432
>    433		espi_perif->ctrl =3D espi_ctrl;
>    434
>    435		init_waitqueue_head(&espi_perif->wq);
>    436
>    437		spin_lock_init(&espi_perif->lock);
>    438
>    439		mutex_init(&espi_perif->pc_rx_mtx);
>    440		mutex_init(&espi_perif->pc_tx_mtx);
>    441		mutex_init(&espi_perif->np_tx_mtx);
>    442
>    443		espi_perif->mcyc_enable =3D
> of_property_read_bool(dev->of_node, "perif,memcyc-enable");
>    444		if (espi_perif->mcyc_enable) {
>    445			rc =3D of_property_read_u32(dev->of_node,
> "perif,memcyc-src-addr",
>  > 446						  &espi_perif->mcyc_saddr);
>    447			if (rc) {
>    448				dev_err(dev, "cannot get Host source address for
> memory cycle\n");
>    449				return ERR_PTR(-ENODEV);
>    450			}
>    451
>    452			rc =3D of_property_read_u32(dev->of_node,
> "perif,memcyc-size",
>    453						  &espi_perif->mcyc_size);
>    454			if (rc) {
>    455				dev_err(dev, "cannot get size for memory cycle\n");
>    456				return ERR_PTR(-ENODEV);
>    457			}
>    458
>    459			if (espi_perif->mcyc_size < PERIF_MEMCYC_SIZE_MIN)
>    460				espi_perif->mcyc_size =3D PERIF_MEMCYC_SIZE_MIN;
>    461			else
>    462				espi_perif->mcyc_size =3D
> roundup_pow_of_two(espi_perif->mcyc_size);
>    463
>    464			espi_perif->mcyc_mask =3D ~(espi_perif->mcyc_size - 1);
>    465			espi_perif->mcyc_virt =3D dma_alloc_coherent(dev,
> espi_perif->mcyc_size,
>    466								   &espi_perif->mcyc_taddr,
> GFP_KERNEL);
>    467			if (!espi_perif->mcyc_virt) {
>    468				dev_err(dev, "cannot allocate memory cycle
> region\n");
>    469				return ERR_PTR(-ENOMEM);
>    470			}
>    471		}
>    472
>    473		if (of_property_read_bool(dev->of_node, "perif,dma-mode")) {
>    474			dma =3D &espi_perif->dma;
>    475
>    476			dma->pc_tx_virt =3D dma_alloc_coherent(dev, PAGE_SIZE,
>    477							     &dma->pc_tx_addr,
> GFP_KERNEL);
>    478			if (!dma->pc_tx_virt) {
>    479				dev_err(dev, "cannot allocate posted TX DMA
> buffer\n");
>    480				return ERR_PTR(-ENOMEM);
>    481			}
>    482
>    483			dma->pc_rx_virt =3D dma_alloc_coherent(dev, PAGE_SIZE,
>    484							     &dma->pc_rx_addr,
> GFP_KERNEL);
>    485			if (!dma->pc_rx_virt) {
>    486				dev_err(dev, "cannot allocate posted RX DMA
> buffer\n");
>    487				return ERR_PTR(-ENOMEM);
>    488			}
>    489
>    490			dma->np_tx_virt =3D dma_alloc_coherent(dev, PAGE_SIZE,
>    491					&dma->np_tx_addr, GFP_KERNEL);
>    492			if (!dma->np_tx_virt) {
>    493				dev_err(dev, "cannot allocate non-posted TX DMA
> buffer\n");
>    494				return ERR_PTR(-ENOMEM);
>    495			}
>    496
>    497			espi_perif->dma_mode =3D 1;
>    498		}
>    499
>    500		espi_perif->mdev.parent =3D dev;
>    501		espi_perif->mdev.minor =3D MISC_DYNAMIC_MINOR;
>    502		espi_perif->mdev.name =3D devm_kasprintf(dev, GFP_KERNEL,
> "%s", PERIF_MDEV_NAME);
>    503		espi_perif->mdev.fops =3D &aspeed_espi_perif_fops;
>    504		rc =3D misc_register(&espi_perif->mdev);
>    505		if (rc) {
>    506			dev_err(dev, "cannot register device\n");
>    507			return ERR_PTR(rc);
>    508		}
>    509
>    510		aspeed_espi_perif_enable(espi_perif);
>    511
>    512		return espi_perif;
>    513	}
>    514
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
