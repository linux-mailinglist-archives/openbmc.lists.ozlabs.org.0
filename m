Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14D6976D90
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 17:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4Lgv2M1lz3c91
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 01:19:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726154342;
	cv=none; b=Y/Oucs+4O5RZ/t6MNvdj61H662sf9JH6+dXRl6hhuiy7i5mt0su7VJe1fmIXZIdJlfyg/khDSh4VMcWhwwMhrRa3fAEbYHm8v51TQ3n/81U94iZ8+YFJmBP6tsC8vg1/KD5Zddmhz+RB9BwOYOzp5d80WNibk0peZ07pbxJ24+LToCzblMVBioEuORMyaqYZtIQvwzBgn266IPQpyVRbQ8BWkMJBjQNv1ZDMqlXSnAtl8zhpue8d8JuI773lEkNcEre2OxESQ4Q9dEATrK+ngw4s/AltpGxR9q2bZ2dJKo2wRLinNzz5GUIUNZHqfARLdOPzi4ychpQkciw5UVcB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726154342; c=relaxed/relaxed;
	bh=cVEM73HfDbIHYFBMPamu7S6LxLhRM8O1/F4I5NZLmis=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cOogQOyIQDVH5UjS0NelU2W/ff7bv1wB25b/dGU8BecfKVfkYBt/BPFDYERUFg/s7LuDjy5wyu1oCbzLDxgoIlKrRw3EPp0c9vEJXemUQEPp9PPzp1PSJlRxoL2CCO3zUY7Jm9YD9Jtvk2G99kiEHeLDqiB3Sca6cuhOcXniXUdolW3P/BUW96sTtSQQArl7GOXd+oTcnS3ZRhg91sI42opL79dKO/m7m5rVeIhapS1HgoARU9kzp2jAQ/LmBRT6NOGvlxA65z69lINMuBwMdfJW9zMykh9BVRn8R1CBviGv1ZInVYqv9vmd9ZVtPoXiHt9o2yu/bAH+BBDXHNeQTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4Lgn2Cfnz2yGL
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 01:18:59 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1solae-0001q5-UB; Thu, 12 Sep 2024 17:18:36 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1solad-007PUI-AE; Thu, 12 Sep 2024 17:18:35 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1solad-000BWk-0l;
	Thu, 12 Sep 2024 17:18:35 +0200
Message-ID: <d003cb854f9aea30c7d26b4d2b7f50cf467bf225.camel@pengutronix.de>
Subject: Re: [PATCH RESEND v27 2/3] reset: npcm: register npcm8xx clock
 auxiliary bus device
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tomer Maimon <tmaimon77@gmail.com>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
 yuenn@google.com,  benjaminfair@google.com
Date: Thu, 12 Sep 2024 17:18:35 +0200
In-Reply-To: <20240815150255.3996258-3-tmaimon77@gmail.com>
References: <20240815150255.3996258-1-tmaimon77@gmail.com>
	 <20240815150255.3996258-3-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Do, 2024-08-15 at 18:02 +0300, Tomer Maimon wrote:
> Add NPCM8xx clock controller auxiliary bus device registration.
>=20
> The NPCM8xx clock controller is registered as an aux device because the
> reset and the clock controller share the same register region.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Benjamin Fair <benjaminfair@google.com>
> ---
>  drivers/reset/Kconfig               |  1 +
>  drivers/reset/reset-npcm.c          | 74 ++++++++++++++++++++++++++++-
>  include/soc/nuvoton/clock-npcm8xx.h | 16 +++++++
>  3 files changed, 90 insertions(+), 1 deletion(-)
>  create mode 100755 include/soc/nuvoton/clock-npcm8xx.h
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 67bce340a87e..c6bf5275cca2 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -157,6 +157,7 @@ config RESET_MESON_AUDIO_ARB
>  config RESET_NPCM
>  	bool "NPCM BMC Reset Driver" if COMPILE_TEST
>  	default ARCH_NPCM
> +	select AUXILIARY_BUS
>  	help
>  	  This enables the reset controller driver for Nuvoton NPCM
>  	  BMC SoCs.
> diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
> index 8935ef95a2d1..aa68b947226a 100644
> --- a/drivers/reset/reset-npcm.c
> +++ b/drivers/reset/reset-npcm.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2019 Nuvoton Technology corporation.
> =20
> +#include <linux/auxiliary_bus.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> @@ -10,11 +11,14 @@
>  #include <linux/property.h>
>  #include <linux/reboot.h>
>  #include <linux/reset-controller.h>
> +#include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/of_address.h>
> =20
> +#include <soc/nuvoton/clock-npcm8xx.h>
> +
>  /* NPCM7xx GCR registers */
>  #define NPCM_MDLR_OFFSET	0x7C
>  #define NPCM7XX_MDLR_USBD0	BIT(9)
> @@ -89,6 +93,7 @@ struct npcm_rc_data {
>  	const struct npcm_reset_info *info;
>  	struct regmap *gcr_regmap;
>  	u32 sw_reset_number;
> +	struct device *dev;
>  	void __iomem *base;
>  	spinlock_t lock;
>  };
> @@ -372,6 +377,67 @@ static const struct reset_control_ops npcm_rc_ops =
=3D {
>  	.status		=3D npcm_rc_status,
>  };
> =20
> +static void npcm_clock_unregister_adev(void *_adev)
> +{
> +	struct auxiliary_device *adev =3D _adev;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static void npcm_clock_adev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> +	struct npcm_clock_adev *rdev =3D to_npcm_clock_adev(adev);
> +
> +	kfree(rdev);
> +}
> +
> +static struct auxiliary_device *npcm_clock_adev_alloc(struct npcm_rc_dat=
a *rst_data, char *clk_name)
> +{
> +	struct npcm_clock_adev *rdev;
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	rdev =3D kzalloc(sizeof(*rdev), GFP_KERNEL);
> +	if (!rdev)
> +		return ERR_PTR(-ENOMEM);
> +
> +	rdev->base =3D rst_data->base;
> +
> +	adev =3D &rdev->adev;
> +	adev->name =3D clk_name;
> +	adev->dev.parent =3D rst_data->dev;
> +	adev->dev.release =3D npcm_clock_adev_release;
> +	adev->id =3D 555u;
> +
> +	ret =3D auxiliary_device_init(adev);
> +	if (ret) {
> +		kfree(rdev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return adev;
> +}
> +
> +static int npcm8xx_clock_controller_register(struct npcm_rc_data *rst_da=
ta, char *clk_name)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev =3D npcm_clock_adev_alloc(rst_data, clk_name);
> +	if (IS_ERR(adev))
> +		return PTR_ERR(adev);
> +
> +	ret =3D auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(rst_data->dev, npcm_clock_unregister_ad=
ev, adev);
> +}
> +
>  static int npcm_rc_probe(struct platform_device *pdev)
>  {
>  	struct npcm_rc_data *rc;
> @@ -392,6 +458,7 @@ static int npcm_rc_probe(struct platform_device *pdev=
)
>  	rc->rcdev.of_node =3D pdev->dev.of_node;
>  	rc->rcdev.of_reset_n_cells =3D 2;
>  	rc->rcdev.of_xlate =3D npcm_reset_xlate;
> +	rc->dev =3D &pdev->dev;
> =20
>  	ret =3D devm_reset_controller_register(&pdev->dev, &rc->rcdev);
>  	if (ret) {
> @@ -413,7 +480,12 @@ static int npcm_rc_probe(struct platform_device *pde=
v)
>  		}
>  	}
> =20
> -	return ret;
> +	switch (rc->info->bmc_id) {
> +	case BMC_NPCM8XX:

Here ret is ignored, which may be the return value from
register_restart_handler() above.

> +		return npcm8xx_clock_controller_register(rc, "clk-npcm8xx");
> +	default:
> +		return ret;
> +	}
>  }
> =20
>  static struct platform_driver npcm_rc_driver =3D {
> diff --git a/include/soc/nuvoton/clock-npcm8xx.h b/include/soc/nuvoton/cl=
ock-npcm8xx.h
> new file mode 100755
> index 000000000000..139130e98c51
> --- /dev/null
> +++ b/include/soc/nuvoton/clock-npcm8xx.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __SOC_NPCM8XX_CLOCK_H
> +#define __SOC_NPCM8XX_CLOCK_H
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +
> +struct npcm_clock_adev {
> +	void __iomem *base;
> +	struct auxiliary_device adev;
> +};
> +
> +#define to_npcm_clock_adev(_adev) \
> +	container_of((_adev), struct npcm_clock_adev, adev)

Could you make this an inline function instead?

With those two issues addressed,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
