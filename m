Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA03FE7A1
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 04:26:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0PtP4Ghcz2yJ4
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 12:26:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=YC6JJDt0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.103;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=YC6JJDt0; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310103.outbound.protection.outlook.com [40.107.131.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0Psk5vl9z2xX7;
 Thu,  2 Sep 2021 12:25:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dj8hT6M+HFQRAStM1fUozTiaB5Re8BWTGPV/chNJhZO8hTH4GKoJPgGgq012syvXDEtOWmk2e2wU00zstKFY+hGoboYyi8pBEIvW7Ky541LWsz0uRPBS3JfdMUDR0f/mU+LnTb2UPEJL2/e+X7I6E7WzthJeeGOc4dFIwZDCUd1UMBRQBEZQ59Glw1r4nsLJPBHxMPbKpLmkm+eCB0KaaxwEahkBDz4c15IwsiL7ZAyDExTlteasqsD6Bj6ehPKJxSN33fcK/90r6YeJ+DEMNcjoAyHnjWlWXy5i3OUv0huIhC09gDJ2U+Qdjtecc0JW30Wi+tk/5Awi243DNnj5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=HHs4PepDLMVdW9L5lS+i5UVGPXakz0+6w0cOoLDk3cE=;
 b=ki1aRFPjHx6lL7fpv2YMapkowCYlWO4UXpQDvGyWCzW/2S8ue2neuMNwMJ+/VK17yUxn56RvxglNVDvB7VOXv48LDZjO0T6b/gImXOFEqmXrqWTKF8iivqhWCthksqFMnsxe3IanlWeShnqMCZTjXumO1URvUbAHfUd6OfC8H2c6Swi5hCY9A+erIXg7cI8li9MJ3+oYjhZ9XTrGZHDvhD5L/8/T53Klw1a/tWYd7KkHcFfEajwfbGK9wzl5j6O697hWZMBIZHPHc0/gW5zvsYvxMdeM6V+R/84oZRp3SaIlF+bFSoeW1aHnyOS/8Aq8lyOc7rkyPL1m8/vIvREpcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHs4PepDLMVdW9L5lS+i5UVGPXakz0+6w0cOoLDk3cE=;
 b=YC6JJDt0AUEBtypQBGWDntvvIQFAf1luJZz9z4w0zrjOqkrgVCtMixyRkFLzdcVnuQkJVsBuXKgOAaSiyMNTTpRn/IEG84g3ffl7Me+MaZocP4m3c+ES++pB1GhyqlKNCaX0axVQ9eqkuxKueUJPbLaQulf/eSUZG1M0FIqG36CTiCtISM0YL4kBSeQSRSP9YfBK76DnDB+9Te9yXmE/Q7aMPAV9POBu821pGcJc/qfedJwI+89MzsF417vo0C8cdQcnLm1yCnqHaBc+cdvyllJVVBtq5Dk9TnVIwuIXjWdkn6Qh2GQNSV1PsjJ3sThIH8C3TFoJHE+8z0zHal3E3g==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB2209.apcprd06.prod.outlook.com (2603:1096:203:47::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 02:25:09 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4457.026; Thu, 2 Sep 2021
 02:25:09 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "osk@google.com" <osk@google.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH v2 2/3] soc: aspeed: Add LPC UART routing support
Thread-Topic: [PATCH v2 2/3] soc: aspeed: Add LPC UART routing support
Thread-Index: AQHXn6FiokQbHhuXPU6nMVl+m7L79quQA6OA
Date: Thu, 2 Sep 2021 02:25:09 +0000
Message-ID: <HK0PR06MB3779B45B2C380E2FCC30D56B91CE9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
 <20210902021817.17506-3-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210902021817.17506-3-chiawei_wang@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aspeedtech.com; dkim=none (message not signed)
 header.d=none;aspeedtech.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbe69903-ff99-4b09-8694-08d96db8e2e3
x-ms-traffictypediagnostic: HK0PR06MB2209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2209556F5F24F2D98B53276A91CE9@HK0PR06MB2209.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eP3JMrn+IaEcOMz+iet7P7GE9uTlK9bk8dcnE6xO1KVWq0Lbf0JiYvKbugMUIdUhKUMdAB4twsFOb8NaE1/8ycukb+WtkTUXg95Yqc1QWSJ8Zrty1B8rIjjlYcJq1qFmJA4woHSbu8HfafZF/RmyJ2Qvfv7sXWBvQBU4ditA/1Qlh6vzJp3Tqi2tJydzUL/XLbey3x3Cx7is0o4Ycuk/5KzEb2JDypG9cBinAge+ZTFJZkNKYhlgTVwBgEfWWDlJgxupxjsqh/YIzoUc528vvHXKZpmnWGQm/1hjlUZZQsLfwcI0sa5qhqhchINO8FU/2dtFwXLfvmcCNDY8gwaCLtiLY6IE5qLe88BWiDFrw95gMxN5TSUSRPQjMioTd5IwoiA3opVTa5KUjSioOktLC8EuJUYRt1bYNiUp7f7i9NEYEHQFjArD8w70EKqNZtL2bKQ2CI0sUUd/Yh2BJEzBUtJX05SjCSExuSZ8v6Dy9CQzI7uG14xbUuejMH3SrDrx8FVlF1EKdd5KwqzOTtnde2hEw5yOMcp5CXLvN/z2myP5oxTyZLrZ48KmieqxdOLYzbOUjw+C4bsuBGunf4ycqBJQ46Oe+VU4iP09XVbFln+Uh2ulniiNRulBMSFKAd1R/PbtrDEOrp9G9RDscWVS77tNff+5FU/3RA3nLews6fBy9fl1R19KeEr9nlKZLpJ3rSB5D2qW6VNaacxbK9uy0Au4htrVQ8mQ00caM3863bc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(39850400004)(136003)(396003)(346002)(66446008)(316002)(64756008)(7696005)(6506007)(71200400001)(86362001)(55016002)(186003)(76116006)(478600001)(110136005)(9686003)(26005)(122000001)(38100700002)(2906002)(33656002)(8676002)(30864003)(66556008)(7416002)(52536014)(66946007)(8936002)(66476007)(83380400001)(921005)(5660300002)(38070700005)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IVG1oxQyzNoTKqMbf1Vqe9WZpfuaGJOyfZtowjq/S0xXFw646rZzkbJfWYrI?=
 =?us-ascii?Q?G2mUziaDRBEGXCQ2j+RT7h3eTVK6Ql4EIuRios+k7acytKtk3kRp1krZ1MvB?=
 =?us-ascii?Q?mlA9bBn1JSfmVwBmAnVdWniHXzN7NoF4wVdLEMwjHxfqWrTHHMVbLzAxRfX9?=
 =?us-ascii?Q?L7CJKLT97svgSoKCCqAj0MESHxcPehEzvKjXlFPY9gmEVV0ksMvZbRo2t6eJ?=
 =?us-ascii?Q?ukGA1VvIBA8p5kNf9j3/OSl8OS1E8UNhvE6UGTGiz0sQAlasYhWHQT2tT/Ti?=
 =?us-ascii?Q?iP5+EI7YNqNhJ3JycF9kBZqmxfMcvZ6rPsLPYU6Q6Bv5PqGYr6PsMQ9uv+Ql?=
 =?us-ascii?Q?4NrpcY7Y3tmFWplqFlxtrqlJmuiBmaupHL68i28OF3GrZIv/l+8ABW48iPfh?=
 =?us-ascii?Q?HiO2Oq5GreVoqk50SFKkbTJZpgUrp52a+HlMGzqRRhkQx8lFSkv2Fyw+euP5?=
 =?us-ascii?Q?29TdkR8E15RgHVoAniCP8QCIRB58JN9oBjKNyn3UMDZleeFBmex14ze3mROD?=
 =?us-ascii?Q?LR3fbpVcLV6p63cJ8KtHFg4kjZHu6ScuxUB6xjy4TwD6ou8A3kwnAGsyPT3g?=
 =?us-ascii?Q?e6Up86CgfZWZ8+Eshdw0rBCkucp5vdfcVbSRxaQfX+yGTA7Pejib9y1xu2ju?=
 =?us-ascii?Q?fF0MzFsgnw0zWeAeXxN0i3fFu9SYRiyeeRGnczZE8sopSvs6yMdW8lPpJ6dN?=
 =?us-ascii?Q?/IIx4a0CcnrT3G9BkGqbbjNi/acc+Ff+qjMtGlykjxyX8wK/hycGZhJ11e79?=
 =?us-ascii?Q?IdKqAY7a+9ApwKzpT//oEpE5l7k1jPTvJkABEU9zNvtKeejfFj3vZMpSBSxY?=
 =?us-ascii?Q?w+7PwxioimKBzJ7y3ueCOmkp9tuN/Xk1tE5PeXKX93L1jpiQ9QdK9jTtCCoD?=
 =?us-ascii?Q?vJbd+H4Xy1CtsyWGu9JWnGtb0F9qN5q9iV6OIfbwzQD/wcEpfjbrWAoygt0B?=
 =?us-ascii?Q?L2s6Ro32S2FP6VMHkVYIaOvTbi9KZUy3rZ7gTjCeL1TUXm4QB8ENn1PZF6fb?=
 =?us-ascii?Q?tUaghF+0lqCOYx5spZbPL7dn6dUSLcKmdcI3hUPX+XAbdCKuaam/tn6baeEU?=
 =?us-ascii?Q?zgyY8gKhVhiGh/O1Bn0Ony+YDGRYiaHnP3v9rIz+w0L3H/evGyIzTIGk9ogX?=
 =?us-ascii?Q?qDc/ZOIgntFywF4hbmX+Le0OF3OwbXzoWwaZwRLL3prVc0O8L/aWTTa3Ol3n?=
 =?us-ascii?Q?n20SW/tiquVsKJrpIUjH48zQRHb7fIJj+J71SFjDmv4CNhZrJXAPV8ZqEOds?=
 =?us-ascii?Q?uycrWj8gLJ+Ygd5UO0ZQsARzSk8cDeqvVa/3uh/xo9aM3uFbUIASU3ixuurM?=
 =?us-ascii?Q?AdtWp8zqwauOsmpoJQooMn5s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe69903-ff99-4b09-8694-08d96db8e2e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 02:25:09.4519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s9OCQNQ359JpMtyIqWddV5Zkh6YQw5DJbCGhcNef81wt1gx9jG02/WngTYhYSsb0Nn5gqwqCLi377d0uvj/T3ovamY7MqqiIqSDSa8VmdSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2209
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

This email was mistakenly sent.
Please ignore this one and check "[PATCH v2 2/3] soc: aspeed: Add UART rout=
ing support" instead.
Thanks.

Chiawei

> From: openbmc
> Sent: Thursday, September 2, 2021 10:18 AM
>=20
> Add driver support for the LPC UART routing control. Users can perform
> runtime configuration of the RX muxes among the UART controllers and the
> UART IO pins.
>=20
> A sysfs interface is also exported for the convenience of routing paths c=
heck
> and configuration.
>=20
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../testing/sysfs-driver-aspeed-uart-routing  |  15 +
>  drivers/soc/aspeed/Kconfig                    |  10 +
>  drivers/soc/aspeed/Makefile                   |   9 +-
>  drivers/soc/aspeed/aspeed-uart-routing.c      | 601 ++++++++++++++++++
>  4 files changed, 631 insertions(+), 4 deletions(-)  create mode 100644
> Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
>  create mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
> b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
> new file mode 100644
> index 000000000000..65f899f1f055
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
> @@ -0,0 +1,15 @@
> +What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/uart*
> +Date:		September 2021
> +Contact:	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> +Description:	Selects the RX source of the UARTx device. The current
> +		selection will be marked with the '[]' brackets.
> +Users:		OpenBMC.  Proposed changes should be mailed to
> +		openbmc@lists.ozlabs.org
> +
> +What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/io*
> +Date:		September 2021
> +Contact:	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> +Description:	Selects the RX source of IOx pins. The current selection
> +		will be marked with the '[]' brackets.
> +Users:		OpenBMC.  Proposed changes should be mailed to
> +		openbmc@lists.ozlabs.org
> diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig inde=
x
> 243ca196e6ad..f579ee0b5afa 100644
> --- a/drivers/soc/aspeed/Kconfig
> +++ b/drivers/soc/aspeed/Kconfig
> @@ -24,6 +24,16 @@ config ASPEED_LPC_SNOOP
>  	  allows the BMC to listen on and save the data written by
>  	  the host to an arbitrary LPC I/O port.
>=20
> +config ASPEED_UART_ROUTING
> +	tristate "ASPEED uart routing control"
> +	select REGMAP
> +	select MFD_SYSCON
> +	default ARCH_ASPEED
> +	help
> +	  Provides a driver to control the UART routing paths, allowing
> +	  users to perform runtime configuration of the RX muxes among
> +	  the UART controllers and I/O pins.
> +
>  config ASPEED_P2A_CTRL
>  	tristate "ASPEED P2A (VGA MMIO to BMC) bridge control"
>  	select REGMAP
> diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile in=
dex
> fcab7192e1a4..b35d74592964 100644
> --- a/drivers/soc/aspeed/Makefile
> +++ b/drivers/soc/aspeed/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_ASPEED_LPC_CTRL)	+=3D aspeed-lpc-ctrl.o
> -obj-$(CONFIG_ASPEED_LPC_SNOOP)	+=3D aspeed-lpc-snoop.o
> -obj-$(CONFIG_ASPEED_P2A_CTRL)	+=3D aspeed-p2a-ctrl.o
> -obj-$(CONFIG_ASPEED_SOCINFO)	+=3D aspeed-socinfo.o
> +obj-$(CONFIG_ASPEED_LPC_CTRL)		+=3D aspeed-lpc-ctrl.o
> +obj-$(CONFIG_ASPEED_LPC_SNOOP)		+=3D aspeed-lpc-snoop.o
> +obj-$(CONFIG_ASPEED_UART_ROUTING)	+=3D aspeed-uart-routing.o
> +obj-$(CONFIG_ASPEED_P2A_CTRL)		+=3D aspeed-p2a-ctrl.o
> +obj-$(CONFIG_ASPEED_SOCINFO)		+=3D aspeed-socinfo.o
> diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c
> b/drivers/soc/aspeed/aspeed-uart-routing.c
> new file mode 100644
> index 000000000000..eba6dfebb54f
> --- /dev/null
> +++ b/drivers/soc/aspeed/aspeed-uart-routing.c
> @@ -0,0 +1,601 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2018 Google LLC
> + * Copyright (c) 2021 Aspeed Technology Inc.
> + */
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/platform_device.h>
> +
> +/* register offsets */
> +#define HICR9	0x98
> +#define HICRA	0x9c
> +
> +/* attributes options */
> +#define UART_ROUTING_IO1	"io1"
> +#define UART_ROUTING_IO2	"io2"
> +#define UART_ROUTING_IO3	"io3"
> +#define UART_ROUTING_IO4	"io4"
> +#define UART_ROUTING_IO5	"io5"
> +#define UART_ROUTING_IO6	"io6"
> +#define UART_ROUTING_IO10	"io10"
> +#define UART_ROUTING_UART1	"uart1"
> +#define UART_ROUTING_UART2	"uart2"
> +#define UART_ROUTING_UART3	"uart3"
> +#define UART_ROUTING_UART4	"uart4"
> +#define UART_ROUTING_UART5	"uart5"
> +#define UART_ROUTING_UART6	"uart6"
> +#define UART_ROUTING_UART10	"uart10"
> +#define UART_ROUTING_RES	"reserved"
> +
> +struct aspeed_uart_routing {
> +	struct regmap *map;
> +	struct attribute_group const *attr_grp; };
> +
> +struct aspeed_uart_routing_selector {
> +	struct device_attribute	dev_attr;
> +	uint8_t reg;
> +	uint8_t mask;
> +	uint8_t shift;
> +	const char *const options[];
> +};
> +
> +#define to_routing_selector(_dev_attr)					\
> +	container_of(_dev_attr, struct aspeed_uart_routing_selector, dev_attr)
> +
> +static ssize_t aspeed_uart_routing_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf);
> +
> +static ssize_t aspeed_uart_routing_store(struct device *dev,
> +					 struct device_attribute *attr,
> +					 const char *buf, size_t count);
> +
> +#define ROUTING_ATTR(_name) {					\
> +	.attr =3D {.name =3D _name,					\
> +		 .mode =3D VERIFY_OCTAL_PERMISSIONS(0644) },	\
> +	.show =3D aspeed_uart_routing_show,			\
> +	.store =3D aspeed_uart_routing_store,			\
> +}
> +
> +/* routing selector for AST25xx */
> +static struct aspeed_uart_routing_selector ast2500_io6_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO6),
> +	.reg =3D HICR9,
> +	.shift =3D 8,
> +	.mask =3D 0xf,
> +	.options =3D {
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART5,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO5,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2500_uart5_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_UART5),
> +	.reg =3D HICRA,
> +	.shift =3D 28,
> +	.mask =3D 0xf,
> +	.options =3D {
> +		    UART_ROUTING_IO5,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_IO6,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2500_uart4_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_UART4),
> +	.reg =3D HICRA,
> +	.shift =3D 25,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_IO6,
> +		    NULL,
> +	},
> +};
> +
> +static struct aspeed_uart_routing_selector ast2500_uart3_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_UART3),
> +	.reg =3D HICRA,
> +	.shift =3D 22,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_IO6,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2500_uart2_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_UART2),
> +	.reg =3D HICRA,
> +	.shift =3D 19,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_IO6,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2500_uart1_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_UART1),
> +	.reg =3D HICRA,
> +	.shift =3D 16,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_IO6,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2500_io5_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO5),
> +	.reg =3D HICRA,
> +	.shift =3D 12,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_UART5,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO6,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2500_io4_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO4),
> +	.reg =3D HICRA,
> +	.shift =3D 9,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART5,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO6,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2500_io3_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO3),
> +	.reg =3D HICRA,
> +	.shift =3D 6,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART5,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO6,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2500_io2_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO2),
> +	.reg =3D HICRA,
> +	.shift =3D 3,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART5,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO6,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2500_io1_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO1),
> +	.reg =3D HICRA,
> +	.shift =3D 0,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART5,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO6,
> +		    NULL,
> +		    },
> +};
> +
> +static struct attribute *ast2500_uart_routing_attrs[] =3D {
> +	&ast2500_io6_sel.dev_attr.attr,
> +	&ast2500_uart5_sel.dev_attr.attr,
> +	&ast2500_uart4_sel.dev_attr.attr,
> +	&ast2500_uart3_sel.dev_attr.attr,
> +	&ast2500_uart2_sel.dev_attr.attr,
> +	&ast2500_uart1_sel.dev_attr.attr,
> +	&ast2500_io5_sel.dev_attr.attr,
> +	&ast2500_io4_sel.dev_attr.attr,
> +	&ast2500_io3_sel.dev_attr.attr,
> +	&ast2500_io2_sel.dev_attr.attr,
> +	&ast2500_io1_sel.dev_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group ast2500_uart_routing_attr_group =3D =
{
> +	.attrs =3D ast2500_uart_routing_attrs,
> +};
> +
> +/* routing selector for AST26xx */
> +static struct aspeed_uart_routing_selector ast2600_uart10_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_UART10),
> +	.reg =3D HICR9,
> +	.shift =3D 12,
> +	.mask =3D 0xf,
> +	.options =3D {
> +		    UART_ROUTING_IO10,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +			UART_ROUTING_RES,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2600_io10_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO10),
> +	.reg =3D HICR9,
> +	.shift =3D 8,
> +	.mask =3D 0xf,
> +	.options =3D {
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +			UART_ROUTING_RES,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +			UART_ROUTING_RES,
> +		    UART_ROUTING_UART10,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2600_uart4_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_UART4),
> +	.reg =3D HICRA,
> +	.shift =3D 25,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_IO10,
> +		    NULL,
> +	},
> +};
> +
> +static struct aspeed_uart_routing_selector ast2600_uart3_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_UART3),
> +	.reg =3D HICRA,
> +	.shift =3D 22,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_IO10,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2600_uart2_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_UART2),
> +	.reg =3D HICRA,
> +	.shift =3D 19,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_IO10,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2600_uart1_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_UART1),
> +	.reg =3D HICRA,
> +	.shift =3D 16,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_IO10,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2600_io4_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO4),
> +	.reg =3D HICRA,
> +	.shift =3D 9,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART10,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO10,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2600_io3_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO3),
> +	.reg =3D HICRA,
> +	.shift =3D 6,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART10,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_IO1,
> +		    UART_ROUTING_IO2,
> +		    UART_ROUTING_IO10,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2600_io2_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO2),
> +	.reg =3D HICRA,
> +	.shift =3D 3,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART10,
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO10,
> +		    NULL,
> +		    },
> +};
> +
> +static struct aspeed_uart_routing_selector ast2600_io1_sel =3D {
> +	.dev_attr =3D ROUTING_ATTR(UART_ROUTING_IO1),
> +	.reg =3D HICRA,
> +	.shift =3D 0,
> +	.mask =3D 0x7,
> +	.options =3D {
> +		    UART_ROUTING_UART1,
> +		    UART_ROUTING_UART2,
> +		    UART_ROUTING_UART3,
> +		    UART_ROUTING_UART4,
> +		    UART_ROUTING_UART10,
> +		    UART_ROUTING_IO3,
> +		    UART_ROUTING_IO4,
> +		    UART_ROUTING_IO10,
> +		    NULL,
> +		    },
> +};
> +
> +static struct attribute *ast2600_uart_routing_attrs[] =3D {
> +	&ast2600_uart10_sel.dev_attr.attr,
> +	&ast2600_io10_sel.dev_attr.attr,
> +	&ast2600_uart4_sel.dev_attr.attr,
> +	&ast2600_uart3_sel.dev_attr.attr,
> +	&ast2600_uart2_sel.dev_attr.attr,
> +	&ast2600_uart1_sel.dev_attr.attr,
> +	&ast2600_io4_sel.dev_attr.attr,
> +	&ast2600_io3_sel.dev_attr.attr,
> +	&ast2600_io2_sel.dev_attr.attr,
> +	&ast2600_io1_sel.dev_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group ast2600_uart_routing_attr_group =3D =
{
> +	.attrs =3D ast2600_uart_routing_attrs,
> +};
> +
> +static ssize_t aspeed_uart_routing_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct aspeed_uart_routing *uart_routing =3D dev_get_drvdata(dev);
> +	struct aspeed_uart_routing_selector *sel =3D to_routing_selector(attr);
> +	int val, pos, len;
> +
> +	regmap_read(uart_routing->map, sel->reg, &val);
> +	val =3D (val >> sel->shift) & sel->mask;
> +
> +	len =3D 0;
> +	for (pos =3D 0; sel->options[pos] !=3D NULL; ++pos) {
> +		if (pos =3D=3D val)
> +			len +=3D sysfs_emit_at(buf, len, "[%s] ", sel->options[pos]);
> +		else
> +			len +=3D sysfs_emit_at(buf, len, "%s ", sel->options[pos]);
> +	}
> +
> +	if (val >=3D pos)
> +		len +=3D sysfs_emit_at(buf, len, "[unknown(%d)]", val);
> +
> +	len +=3D sysfs_emit_at(buf, len, "\n");
> +
> +	return len;
> +}
> +
> +static ssize_t aspeed_uart_routing_store(struct device *dev,
> +					 struct device_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct aspeed_uart_routing *uart_routing =3D dev_get_drvdata(dev);
> +	struct aspeed_uart_routing_selector *sel =3D to_routing_selector(attr);
> +	int val;
> +
> +	val =3D match_string(sel->options, -1, buf);
> +	if (val < 0) {
> +		dev_err(dev, "invalid value \"%s\"\n", buf);
> +		return -EINVAL;
> +	}
> +
> +	regmap_update_bits(uart_routing->map, sel->reg,
> +			(sel->mask << sel->shift),
> +			(val & sel->mask) << sel->shift);
> +
> +	return count;
> +}
> +
> +static int aspeed_uart_routing_probe(struct platform_device *pdev) {
> +	int rc;
> +	struct device *dev =3D &pdev->dev;
> +	struct aspeed_uart_routing *uart_routing;
> +
> +	uart_routing =3D devm_kzalloc(&pdev->dev, sizeof(*uart_routing),
> GFP_KERNEL);
> +	if (!uart_routing)
> +		return -ENOMEM;
> +
> +	uart_routing->map =3D syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(uart_routing->map)) {
> +		dev_err(dev, "cannot get regmap\n");
> +		return PTR_ERR(uart_routing->map);
> +	}
> +
> +	uart_routing->attr_grp =3D of_device_get_match_data(dev);
> +
> +	rc =3D sysfs_create_group(&dev->kobj, uart_routing->attr_grp);
> +	if (rc < 0)
> +		return rc;
> +
> +	dev_set_drvdata(dev, uart_routing);
> +
> +	dev_info(dev, "module loaded\n");
> +
> +	return 0;
> +}
> +
> +static int aspeed_uart_routing_remove(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct aspeed_uart_routing *uart_routing =3D platform_get_drvdata(pdev)=
;
> +
> +	sysfs_remove_group(&dev->kobj, uart_routing->attr_grp);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id aspeed_uart_routing_table[] =3D {
> +	{ .compatible =3D "aspeed,ast2500-uart-routing",
> +	  .data =3D &ast2500_uart_routing_attr_group },
> +	{ .compatible =3D "aspeed,ast2600-uart-routing",
> +	  .data =3D &ast2600_uart_routing_attr_group },
> +	{ },
> +};
> +
> +static struct platform_driver aspeed_uart_routing_driver =3D {
> +	.driver =3D {
> +		.name =3D "aspeed-uart-routing",
> +		.of_match_table =3D aspeed_uart_routing_table,
> +	},
> +	.probe =3D aspeed_uart_routing_probe,
> +	.remove =3D aspeed_uart_routing_remove,
> +};
> +
> +module_platform_driver(aspeed_uart_routing_driver);
> +
> +MODULE_AUTHOR("Oskar Senft <osk@google.com>");
> MODULE_AUTHOR("Chia-Wei
> +Wang <chiawei_wang@aspeedtech.com>"); MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Driver to configure Aspeed UART routing");
> --
> 2.17.1

