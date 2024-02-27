Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89277869A44
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 16:24:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R1UiJtV3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkh9Q2QtHz3dTt
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 02:24:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R1UiJtV3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkh8s4Fqxz3bsd
	for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2024 02:23:57 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-42a9c21f9ecso16799551cf.0
        for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 07:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709047434; x=1709652234; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XFZm/dQSg9/X/SHxcG6EeAuyboOmUCrzOisf7px9NRM=;
        b=R1UiJtV3b2qiAzZfKH+Rtb738ZqXAmb1DCOBqqJC7n/oIoALg+LU0R3pDlyp3cbSw6
         2EsBMD6PKGY36PrjrgtWGuFEDH3QhsgTjsgF3WmmuYGEoO8p73F2b6l65LJpAgfA11mT
         HT/1TsQb20XtdFXu2NkZ52dbqmwpPcPtYE8t7KmN7P+rdN83HdSj4IFSh2DUrxJxPwjk
         XDVx7egBKfkoYv+Kh2/kc3VLzxRWPZlB9L3KFgl5dzBNCiTjjQk8kJYnjRmGrzj+kek7
         aCtulUh82RCpZKRFTmuORxvBHjREZdfikhZRzJCyb5+urckdmVXMR90StYv2urBZrvNj
         vL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709047434; x=1709652234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFZm/dQSg9/X/SHxcG6EeAuyboOmUCrzOisf7px9NRM=;
        b=jWJhfegB6ZagUe7qh2ntlT5+UUQC6K0pEtGfg4XR+r+m45/9JtEYQtXeSKGTl0Uhff
         eoMG6xQJncKI0/Pd6Q2VsrgBZ8GKJ/NqAC6fdH4SfkaSddTi+TpN3/aiBYrmbNp8NDhn
         Strri5W0hZuoe/OnQ/GONADL5pBs7ez/04Va/I8yaZHvJJAywWwxMDjtBAyEJL04KziL
         yij6rIvtHkXhxAFnjBOjgfO5rKwxTyncyeb2UmHEJ/GPhtN2Vh/R0CUk8BVub+WRUQiG
         juYKDPMVlVCMsOmskvA8SX7tKouVHSB9Bs4lnf2FLmSKzi1sAVvhukgpwxfUC/B+umv/
         nQqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvkDNgGhwznNzozLMHS3Zh1lODLT7w/18XgwbGAOvWmElEl3xuUOhVEz3yW55MvE9m+ya6LYugwjvTJrcF5hmtmxsG/uy8Tew=
X-Gm-Message-State: AOJu0Ywvdb9lf7paTYaRycSjr1HD/ZkafxtAmg8lkMfGyq//yu4VMSrR
	XzRVbbdGitundM7Sxhx5NE9CWiFb+BO03/GwfM5cjtISEB42Lk8ZVeGptNM4+V8beEyyAjrezQs
	m0YcTOFrXSSmtHehEJdNjPnV8H1E4GnFyBRdGG37tswHy6OltYu8=
X-Google-Smtp-Source: AGHT+IFXRkh4i/Gr+X+CNCwM+eiQfh5vWcQsfkjYhIrr0Xb0TkLC7JjlBRtlrrUjA+ojEUJ9UftFZVpafbLrXYMOvoU=
X-Received: by 2002:a25:824e:0:b0:dca:c369:fac2 with SMTP id
 d14-20020a25824e000000b00dcac369fac2mr2406508ybn.3.1709047014409; Tue, 27 Feb
 2024 07:16:54 -0800 (PST)
MIME-Version: 1.0
References: <20240221-b4-mmc-hi3798mv200-v6-0-bc41bf6a9769@outlook.com> <20240221-b4-mmc-hi3798mv200-v6-3-bc41bf6a9769@outlook.com>
In-Reply-To: <20240221-b4-mmc-hi3798mv200-v6-3-bc41bf6a9769@outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Feb 2024 16:16:18 +0100
Message-ID: <CAPDyKFosUX7giCYbFJpKRjSDHKEyO6FATna5VnDg7tHEzagWBg@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] mmc: dw_mmc: add support for hi3798mv200
To: forbidden405@outlook.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-mmc@vger.kernel.org, openbmc@lists.ozlabs.org, Igor Opaniuk <igor.opaniuk@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, tianshuliang <tianshuliang@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, David Yang <mmyangfl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 21 Feb 2024 at 13:45, Yang Xiwen via B4 Relay
<devnull+forbidden405.outlook.com@kernel.org> wrote:
>
> From: Yang Xiwen <forbidden405@outlook.com>
>
> Add support for Hi3798MV200 specific extension.
>
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
> ---
>  drivers/mmc/host/Kconfig              |   9 ++
>  drivers/mmc/host/Makefile             |   1 +
>  drivers/mmc/host/dw_mmc-hi3798mv200.c | 239 ++++++++++++++++++++++++++++++++++
>  3 files changed, 249 insertions(+)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 81f2c4e05287..aebc587f77a7 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -798,6 +798,15 @@ config MMC_DW_HI3798CV200
>           Synopsys DesignWare Memory Card Interface driver. Select this option
>           for platforms based on HiSilicon Hi3798CV200 SoC.
>
> +config MMC_DW_HI3798MV200
> +       tristate "Hi3798MV200 specific extensions for Synopsys DW Memory Card Interface"
> +       depends on MMC_DW
> +       select MMC_DW_PLTFM
> +       help
> +         This selects support for HiSilicon Hi3798MV200 SoC specific extensions to the
> +         Synopsys DesignWare Memory Card Interface driver. Select this option
> +         for platforms based on HiSilicon Hi3798MV200 SoC.
> +
>  config MMC_DW_K3
>         tristate "K3 specific extensions for Synopsys DW Memory Card Interface"
>         depends on MMC_DW
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index d0be4465f3ec..f53f86d200ac 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_MMC_DW_PLTFM)    += dw_mmc-pltfm.o
>  obj-$(CONFIG_MMC_DW_BLUEFIELD) += dw_mmc-bluefield.o
>  obj-$(CONFIG_MMC_DW_EXYNOS)    += dw_mmc-exynos.o
>  obj-$(CONFIG_MMC_DW_HI3798CV200) += dw_mmc-hi3798cv200.o
> +obj-$(CONFIG_MMC_DW_HI3798MV200) += dw_mmc-hi3798mv200.o
>  obj-$(CONFIG_MMC_DW_K3)                += dw_mmc-k3.o
>  obj-$(CONFIG_MMC_DW_PCI)       += dw_mmc-pci.o
>  obj-$(CONFIG_MMC_DW_ROCKCHIP)  += dw_mmc-rockchip.o
> diff --git a/drivers/mmc/host/dw_mmc-hi3798mv200.c b/drivers/mmc/host/dw_mmc-hi3798mv200.c
> new file mode 100644
> index 000000000000..73aaa21040ea
> --- /dev/null
> +++ b/drivers/mmc/host/dw_mmc-hi3798mv200.c
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Modified from dw_mmc-hi3798cv200.c
> + *
> + * Copyright (c) 2024 Yang Xiwen <forbidden405@outlook.com>
> + * Copyright (c) 2018 HiSilicon Technologies Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mmc/host.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "dw_mmc.h"
> +#include "dw_mmc-pltfm.h"
> +
> +#define SDMMC_TUNING_CTRL      0x118
> +#define SDMMC_TUNING_FIND_EDGE BIT(5)
> +
> +#define ALL_INT_CLR            0x1ffff
> +
> +/* DLL ctrl reg */
> +#define SAP_DLL_CTRL_DLLMODE   BIT(16)
> +
> +struct dw_mci_hi3798mv200_priv {
> +       struct clk *sample_clk;
> +       struct clk *drive_clk;
> +       struct regmap *crg_reg;
> +       u32 sap_dll_offset;
> +       struct mmc_clk_phase_map phase_map;
> +};
> +
> +static void dw_mci_hi3798mv200_set_ios(struct dw_mci *host, struct mmc_ios *ios)
> +{
> +       struct dw_mci_hi3798mv200_priv *priv = host->priv;
> +       struct mmc_clk_phase phase = priv->phase_map.phase[ios->timing];
> +       u32 val;
> +
> +       val = mci_readl(host, ENABLE_SHIFT);
> +       if (ios->timing == MMC_TIMING_MMC_DDR52
> +           || ios->timing == MMC_TIMING_UHS_DDR50)
> +               val |= SDMMC_ENABLE_PHASE;
> +       else
> +               val &= ~SDMMC_ENABLE_PHASE;
> +       mci_writel(host, ENABLE_SHIFT, val);
> +
> +       val = mci_readl(host, DDR_REG);
> +       if (ios->timing == MMC_TIMING_MMC_HS400)
> +               val |= SDMMC_DDR_HS400;
> +       else
> +               val &= ~SDMMC_DDR_HS400;
> +       mci_writel(host, DDR_REG, val);
> +
> +       if (clk_set_rate(host->ciu_clk, ios->clock))
> +               dev_warn(host->dev, "Failed to set rate to %u\n", ios->clock);
> +       else
> +               // CLK_MUX_ROUND_NEAREST is enabled for this clock
> +               // The actual clock rate is not what we setted, but a rounded value
> +               // so we should get the rate once again

Please use proper comments sections (/* .... */) and not "//".

> +               host->bus_hz = clk_get_rate(host->ciu_clk);
> +
> +       if (phase.valid) {
> +               clk_set_phase(priv->drive_clk, phase.out_deg);
> +               clk_set_phase(priv->sample_clk, phase.in_deg);
> +       } else {
> +               dev_warn(host->dev,
> +                        "The phase entry for timing mode %d is missing in device tree.\n",
> +                        ios->timing);
> +       }
> +}
> +
> +static inline int dw_mci_hi3798mv200_enable_tuning(struct dw_mci_slot *slot)
> +{
> +       struct dw_mci_hi3798mv200_priv *priv = slot->host->priv;
> +
> +       return regmap_clear_bits(priv->crg_reg, priv->sap_dll_offset, SAP_DLL_CTRL_DLLMODE);
> +}
> +
> +static inline int dw_mci_hi3798mv200_disable_tuning(struct dw_mci_slot *slot)
> +{
> +       struct dw_mci_hi3798mv200_priv *priv = slot->host->priv;
> +
> +       return regmap_set_bits(priv->crg_reg, priv->sap_dll_offset, SAP_DLL_CTRL_DLLMODE);
> +}
> +
> +static int dw_mci_hi3798mv200_execute_tuning_mix_mode(struct dw_mci_slot *slot,
> +                                            u32 opcode)
> +{
> +       static const int degrees[] = { 0, 45, 90, 135, 180, 225, 270, 315 };
> +       struct dw_mci *host = slot->host;
> +       struct dw_mci_hi3798mv200_priv *priv = host->priv;
> +       int raise_point = -1, fall_point = -1;
> +       int err, prev_err = -1;
> +       int found = 0;
> +       int regval;
> +       int i;
> +       int ret;
> +
> +       // enable tuning

Looks like a redundant comment, please drop it.

> +       ret = dw_mci_hi3798mv200_enable_tuning(slot);
> +       if (ret < 0)
> +               return ret;

A newline here would improve the readability I think.

> +       for (i = 0; i < ARRAY_SIZE(degrees); i++) {
> +               clk_set_phase(priv->sample_clk, degrees[i]);
> +               mci_writel(host, RINTSTS, ALL_INT_CLR);
> +
> +               err = mmc_send_tuning(slot->mmc, opcode, NULL);
> +               if (!err) {
> +                       regval = mci_readl(host, TUNING_CTRL);
> +                       if (regval & SDMMC_TUNING_FIND_EDGE)
> +                               err = 1;
> +                       else
> +                               found = 1;
> +               };
> +
> +               if (i > 0) {
> +                       if (err && !prev_err)
> +                               fall_point = i - 1;
> +                       if (!err && prev_err)
> +                               raise_point = i;
> +               }
> +
> +               if (raise_point != -1 && fall_point != -1)
> +                       goto tuning_out;
> +
> +               prev_err = err;
> +               err = 0;
> +       }
> +
> +tuning_out:
> +       ret = dw_mci_hi3798mv200_disable_tuning(slot);
> +       if (ret < 0)
> +               return ret;
> +       if (found) {
> +               if (raise_point == -1)
> +                       raise_point = 0;
> +               if (fall_point == -1)
> +                       fall_point = ARRAY_SIZE(degrees) - 1;
> +               if (fall_point < raise_point) {
> +                       if ((raise_point + fall_point) >
> +                           (ARRAY_SIZE(degrees) - 1))
> +                               i = fall_point / 2;
> +                       else
> +                               i = (raise_point + ARRAY_SIZE(degrees) - 1) / 2;
> +               } else {
> +                       i = (raise_point + fall_point) / 2;
> +               }
> +
> +               // use the same phase table for both HS200 and HS400

Don't use "//" for comments.

> +               priv->phase_map.phase[MMC_TIMING_MMC_HS200].in_deg = degrees[i];
> +               priv->phase_map.phase[MMC_TIMING_MMC_HS400].in_deg = degrees[i];
> +
> +               clk_set_phase(priv->sample_clk, degrees[i]);
> +               dev_dbg(host->dev, "Tuning clk_sample[%d, %d], set[%d]\n",
> +                       raise_point, fall_point, degrees[i]);
> +               err = 0;
> +       } else {
> +               dev_err(host->dev, "No valid clk_sample shift! use default\n");
> +               err = -EINVAL;
> +       }
> +
> +       mci_writel(host, RINTSTS, ALL_INT_CLR);
> +       return err;

The entire code in dw_mci_hi3798mv200_execute_tuning_mix_mode() looks
rather messy to me. A lot of variables are being used, set and reset
from everywhere.

Would you mind having a closer look and try to improve it a bit, so it
becomes easier to follow what is going on?

> +}
> +
> +static int dw_mci_hi3798mv200_init(struct dw_mci *host)
> +{
> +       struct dw_mci_hi3798mv200_priv *priv;
> +       struct device_node *np = host->dev->of_node;
> +       int ret;
> +
> +       priv = devm_kzalloc(host->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       mmc_of_parse_clk_phase(host->dev, &priv->phase_map);
> +
> +       priv->sample_clk = devm_clk_get_enabled(host->dev, "ciu-sample");
> +       if (IS_ERR(priv->sample_clk))
> +               return dev_err_probe(host->dev, PTR_ERR(priv->sample_clk),
> +                                    "failed to get enabled ciu-sample clock\n");
> +
> +       priv->drive_clk = devm_clk_get_enabled(host->dev, "ciu-drive");
> +       if (IS_ERR(priv->drive_clk))
> +               return dev_err_probe(host->dev, PTR_ERR(priv->drive_clk),
> +                                    "failed to get enabled ciu-drive clock\n");
> +
> +       priv->crg_reg = syscon_regmap_lookup_by_phandle(np, "hisilicon,sap-dll-reg");
> +       if (IS_ERR(priv->crg_reg))
> +               return dev_err_probe(host->dev, PTR_ERR(priv->crg_reg),
> +                                    "failed to get CRG reg\n");
> +
> +       ret = of_property_read_u32_index(np, "hisilicon,sap-dll-reg", 1, &priv->sap_dll_offset);
> +       if (ret)
> +               return dev_err_probe(host->dev, ret, "failed to get sample DLL register offset\n");
> +
> +       host->priv = priv;
> +       return 0;
> +}
> +
> +static const struct dw_mci_drv_data hi3798mv200_data = {
> +       .common_caps = MMC_CAP_CMD23,
> +       .init = dw_mci_hi3798mv200_init,
> +       .set_ios = dw_mci_hi3798mv200_set_ios,
> +       .execute_tuning = dw_mci_hi3798mv200_execute_tuning_mix_mode,
> +};
> +
> +static const struct of_device_id dw_mci_hi3798mv200_match[] = {
> +       { .compatible = "hisilicon,hi3798mv200-dw-mshc" },
> +       {},
> +};
> +
> +static int dw_mci_hi3798mv200_probe(struct platform_device *pdev)
> +{
> +       return dw_mci_pltfm_register(pdev, &hi3798mv200_data);
> +}
> +
> +static void dw_mci_hi3798mv200_remove(struct platform_device *pdev)
> +{
> +       dw_mci_pltfm_remove(pdev);
> +}
> +
> +MODULE_DEVICE_TABLE(of, dw_mci_hi3798mv200_match);
> +static struct platform_driver dw_mci_hi3798mv200_driver = {
> +       .probe = dw_mci_hi3798mv200_probe,
> +       .remove_new = dw_mci_hi3798mv200_remove,
> +       .driver = {
> +               .name = "dwmmc_hi3798mv200",
> +               .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +               .of_match_table = dw_mci_hi3798mv200_match,
> +       },
> +};
> +module_platform_driver(dw_mci_hi3798mv200_driver);
> +
> +MODULE_DESCRIPTION("HiSilicon Hi3798MV200 Specific DW-MSHC Driver Extension");
> +MODULE_LICENSE("GPL");
>

Kind regards
Uffe
