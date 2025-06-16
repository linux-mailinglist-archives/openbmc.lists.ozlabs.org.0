Return-Path: <openbmc+bounces-230-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 526BEADB239
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 15:39:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLWMb08tdz30T8;
	Mon, 16 Jun 2025 23:39:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750081194;
	cv=none; b=UA+7e+is6VuDLK6XeJNiFm/h48VDryWz/aWk02Ux/4FfxF+cktTybYwFcAzlylNLjd4C4MObTP3RenqtxHtrKkCcg1bTefPv0ycDQ9lbxmlSO04WZ/IFH596Yr+8pY7xJ4OuOIMs5C90YrfA+HP0wiElC/+4NMW+TtC4kKdPSXxfxm3lzB30iAWMxzCEz0qTQLRX1fO3bahFjwBDSOcpZgK0ihiilJ3Ap0EpFu7HrIT/c+JXWV316jLl4luiYHPbYufWI6hAMRUvCGNBY1Mz8HcfnIA0NxrWS8rr/i8pIa/FdLA2ycx2uYLKLb2NV27NtHYegZMvbYV+TfEJpMQj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750081194; c=relaxed/relaxed;
	bh=duYGcmi4EnfLmnSVWEuzIDTi/3dvghq/BtjYskrpPhY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D0F98tD7gNUZwOVAetWWVSplNKd28VuV4/RDocR2CWJxtaRSc3aH3O3ISEJTJoOOrGtjLe6GP3YKVII+DBT9+Ev1x6UIp8PRyd8lCpnPh23GA6TdRDjFKfaMOHpL3WEKhMXte43tx1oLMzDCcWe8JeAhIfVIyPtuOzL23cxw94TRlCeTBsbfx4hHRGO9dGl+4p8I1fXwRL7NUHxdA8RbCmvHaThtaW4MCML9Wq94wBqbs2IMjY9fwr3LuiV3yRd6cm79z+yJj6E+zrtJWtndhqQTJaQaNkYQOdGfQq7LxQoAmmJuvCvQhjL/uXErpGtCS3qXy+DxiL5BWjN14coB9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1032 seconds by postgrey-1.37 at boromir; Mon, 16 Jun 2025 23:39:54 AEST
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bLWMZ3PbDz30P3
	for <openbmc@lists.ozlabs.org>; Mon, 16 Jun 2025 23:39:54 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uR9n5-0003xV-Cd; Mon, 16 Jun 2025 15:22:23 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uR9n4-003oWd-0b;
	Mon, 16 Jun 2025 15:22:22 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uR9n4-000VBo-0L;
	Mon, 16 Jun 2025 15:22:22 +0200
Message-ID: <6aeab5e5b616b1e690c2622d6599c5228a391e69.camel@pengutronix.de>
Subject: Re: [PATCH 1/8] mmc: sdhci-of-aspeed: Fix sdhci software reset
 can't be cleared issue.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Cool Lee <cool_lee@aspeedtech.com>, andrew@codeconstruct.com.au, 
	adrian.hunter@intel.com, ulf.hansson@linaro.org, joel@jms.id.au, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 16 Jun 2025 15:22:21 +0200
In-Reply-To: <20250615035803.3752235-2-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-2-cool_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On So, 2025-06-15 at 11:57 +0800, Cool Lee wrote:
> Replace sdhci software reset by scu reset from top.
>=20
> Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 55 +++++++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-=
of-aspeed.c
> index d6de010551b9..01bc574272eb 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/spinlock.h>
> =20
>  #include "sdhci-pltfm.h"
> @@ -39,6 +40,7 @@
>  struct aspeed_sdc {
>  	struct clk *clk;
>  	struct resource *res;
> +	struct reset_control *rst;
> =20
>  	spinlock_t lock;
>  	void __iomem *regs;
> @@ -328,13 +330,58 @@ static u32 aspeed_sdhci_readl(struct sdhci_host *ho=
st, int reg)
>  	return val;
>  }
> =20
> +static void aspeed_sdhci_reset(struct sdhci_host *host, u8 mask)
> +{
> +	struct sdhci_pltfm_host *pltfm_priv;
> +	struct aspeed_sdhci *aspeed_sdhci;
> +	struct aspeed_sdc *aspeed_sdc;
> +	u32 save_array[7];
> +	u32 reg_array[] =3D {SDHCI_DMA_ADDRESS,
> +			SDHCI_BLOCK_SIZE,
> +			SDHCI_ARGUMENT,
> +			SDHCI_HOST_CONTROL,
> +			SDHCI_CLOCK_CONTROL,
> +			SDHCI_INT_ENABLE,
> +			SDHCI_SIGNAL_ENABLE};
> +	int i;
> +	u16 tran_mode;
> +	u32 mmc8_mode;
> +
> +	pltfm_priv =3D sdhci_priv(host);
> +	aspeed_sdhci =3D sdhci_pltfm_priv(pltfm_priv);
> +	aspeed_sdc =3D aspeed_sdhci->parent;
> +
> +	if (!IS_ERR(aspeed_sdc->rst)) {
> +		for (i =3D 0; i < ARRAY_SIZE(reg_array); i++)
> +			save_array[i] =3D sdhci_readl(host, reg_array[i]);
> +
> +		tran_mode =3D sdhci_readw(host, SDHCI_TRANSFER_MODE);
> +		mmc8_mode =3D readl(aspeed_sdc->regs);
> +
> +		reset_control_assert(aspeed_sdc->rst);
> +		mdelay(1);
> +		reset_control_deassert(aspeed_sdc->rst);
> +		mdelay(1);

Why are there delays here ...

[...]
> @@ -535,6 +582,12 @@ static int aspeed_sdc_probe(struct platform_device *=
pdev)
> =20
>  	spin_lock_init(&sdc->lock);
> =20
> +	sdc->rst =3D devm_reset_control_get(&pdev->dev, NULL);
> +	if (!IS_ERR(sdc->rst)) {
> +		reset_control_assert(sdc->rst);
> +		reset_control_deassert(sdc->rst);

... but not here?

regards
Philipp

