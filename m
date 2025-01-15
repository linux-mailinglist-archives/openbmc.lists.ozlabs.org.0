Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B87D6A12F57
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2025 00:43:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYMxz256Kz3dVv
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2025 10:43:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736931828;
	cv=none; b=KzmmI+/gifG035HZSaVzHqeq8WRz2FmYJlUzghzwhpdJj5Erse0gJylXIvThIzHRUlbxSoS31Tjg4CptElfULSBiXYKXBJjSIh/Kt2PUVChmRoaEJA575xnqbg0BGyqd2tqj705t6yKtoE+VZZAGsn0ao6CbCtI6tQCAOQ1vvxVuknlQ5KDf04BHVNHfbeYpdenuKWdyZLzCUBPh5yR2vv20u3apg+Yo4iR4193RaDd41jHA0d4/Ep1ZgsmMACjUeyzWdm0yEtR6Tkxv/43XgI/ookuCoBB2DwIQ27yyBE+W0Dso2AtDPfeTJpmA301G15kIjrgCEKS/3oWa+nQbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736931828; c=relaxed/relaxed;
	bh=2gnKJ/IRPg5yMfg6Xc95tVLUMpA1UWlt9ktoqUqOGXg=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=lQ6u95W9hJJDnEfWpZmPAtcvFRqQ7zOnAQnKaZ+NO51v17TYyiH10CPeSKKdDcM85Gh8hf9AeH7Mndug8+ileS6aitXDsKAdhQIskLkkw66WxTX89gOA9L4NH9dkaz5VgUJ66p6MV7UQbEXlpcYSL1kCsPrGT8I7ClTbgfhF+LXUA6JmLAQqDLLoDsatOLxyuV+5ZqMNsscFGrv6kxlzHlV6feprTXMwQaNDw8TTMfybH2WSZBbSxekaphSjCU+eVdADwiYO8a8dmq222L3/VIpFTM6/Isgjiv3GwnoeUgr/FZZVtwhN2x+JeyHQsPTDT9Mr0Aezzs1iRM9aOSHSNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E8MJx00e; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E8MJx00e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY0R61d12z30MM
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2025 20:03:45 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21644aca3a0so142010775ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2025 01:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736931823; x=1737536623; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gnKJ/IRPg5yMfg6Xc95tVLUMpA1UWlt9ktoqUqOGXg=;
        b=E8MJx00erLwNPOykK9/1jEOoYJd4rBs2kvh5B3jWrYxltvmwppQ1GdXAo+utP6QNQz
         e/O6OY7t0ruEJhDXLFdEdtHsqOuuh7+HrEzTTG3SSEzl84QzokUvMhh3dfalGWulRZmp
         O5ShglN3xAcMWxMmK05TgrCTsI6uK3AIfIzhaSyJLq34/GwMgLT8iPczElhgrIwr+RZ2
         CzKHjyNovFYxqD+OXExrpZx+KsaYCWoxhGIwmP2LX0fmybBziCWbwOReA67MB1nVNJAG
         1J9i/MRKTk7qEx2zxw6FKOPedU3S88xnf+rHFhdCC1Vvpy6p5vFM7sV8+wtr0McAFOIz
         JeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736931823; x=1737536623;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2gnKJ/IRPg5yMfg6Xc95tVLUMpA1UWlt9ktoqUqOGXg=;
        b=RxxhCzeLc4iNm4B377cRMo06QC20TF9L2Yu53aULHIUSOTK4eFp1vqRlZsBOqwEyjj
         W5eoesI/AUJW0F6O2Pp7Yy1H/aQhL6uQ9f+SYOnb3Rj5y9b9EHgIu27JLZUPpSvBGeHy
         1Vaycj68IH5yp51aqfFkaG6jpBwFlCEh7SK6b6uUNYIic2ZTi7HCKRSGXKSyhgI773A7
         7TKNAJ0lYnmqSDF5tgpn0aVjl2N+NSYsdibUyozBqvByC8OxSIdK69H4JOm/PVrot0EJ
         iQ7jWW9P6cNcxgSNDCeM4OadofkqfCHZIBXMt+bpUeRfHc92sjKXsvNgy1JuOYJeVeV8
         0q2w==
X-Forwarded-Encrypted: i=1; AJvYcCXUmhmRFZNEN3f1j3cfHac3sVHU5t+kDHOrT2B/E5zeWsxHkB/NQ/UBojtPbl+l5Qadszv554Qe@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjHTCShE50wy7QrzUJpGbZr6RGU4L2QPXKSQXaTtijsDTtWM6K
	m8mAfVXtb+ZOiEgc7rEJR62F2UWca5fHQw0cw0Vxg0rhMpDVqt45
X-Gm-Gg: ASbGncs+VWPMiCTj79YfH37Q2/MvjUCBhZWbmZpHw/haza5xEF2xciJbfj3S9pDA/In
	e0iA6Cqu3SJV3j4s/kva7OBGK/xIXKarHZ0d1+IJGxmv2dAgQLcrP9NeEb8TDAXaT6guwoKk6UO
	1zqzrDTdSk2Sbuaobo9/8xdeJkFd2GuorAsB1DWbk9GTUtQbJkLhYo9PYjwq5VPePO1AhMStkgg
	/dMdBEfD650xtPdzuLeAYUNnerifV2nCHCAzzlZ7FgS1it6/GevH9G5bjIeGrcJEFWjAuaq03n+
	l7CeRdNiLJFghO8rVPcqpmo3D74JO/Jml90=
X-Google-Smtp-Source: AGHT+IFjqIE1vwbrJK/BnyyO6i4GnWP44sgGD/Ph55b3t6p+K1HP1Exhd6MLIxSweOWiZ2LUWBvi2Q==
X-Received: by 2002:a05:6a00:6c83:b0:72a:a7a4:b641 with SMTP id d2e1a72fcca58-72d22017a37mr42621885b3a.18.1736931822428;
        Wed, 15 Jan 2025 01:03:42 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056a632sm8966780b3a.59.2025.01.15.01.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 01:03:42 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------NR0wsB0jZ96eGW8vCIdGJCSj"
Message-ID: <2cf758f2-529e-4ccd-9dc1-18fc29ad5ac0@gmail.com>
Date: Wed, 15 Jan 2025 17:03:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 16 Jan 2025 10:43:15 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, alexandre.torgue@foss.st.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------NR0wsB0jZ96eGW8vCIdGJCSj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Paul,

Thank you for the reply!

Paul Menzel 於 1/14/2025 9:49 AM 寫道:
> Dear Joey,
>
>
> Thank you for your patch.
>
> Am 13.01.25 um 00:54 schrieb Joey Lu:
>> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac 
>> driver.
>
> It’d be great if you added the datasheet name and revision to the 
> commit message.

I will update the commit message in the next patch.

For reference, the datasheet is *MA35D1 Series Datasheet*.

>
> Also, please document how tested the driver. Maybe even paste new log 
> messages.

These are the kernel configurations for testing the MA35D1 GMAC driver: 
ARCH_MA35, STMMAC_PLATFORM, DWMAC_NUVOTON.

I'm not sure if this information is sufficient, so please provide some 
guidance on what else I should include to meet your requirements.

I will include the log messages at the end of the email.

>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>
> As you use your company email address in the AUTHOR line below, please 
> also add that email address to the commit message (and maybe even as 
> the author).
>
I will update the AUTHOR to use my personal email address instead of the 
company email.
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>   .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
>>   3 files changed, 191 insertions(+)
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig 
>> b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> index 4cc85a36a1ab..2b424544cf6f 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> @@ -121,6 +121,17 @@ config DWMAC_MESON
>>         the stmmac device driver. This driver is used for Meson6,
>>         Meson8, Meson8b and GXBB SoCs.
>>   +config DWMAC_NUVOTON
>> +    tristate "Nuvoton MA35 dwmac support"
>> +    default ARCH_MA35
>> +    depends on OF && (ARCH_MA35 || COMPILE_TEST)
>> +    select MFD_SYSCON
>> +    help
>> +      Support for Ethernet controller on Nuvoton MA35 series SoC.
>> +
>> +      This selects the Nuvoton MA35 series SoC glue layer support
>> +      for the stmmac device driver.
>
> Also mention the module name `dwmac-nuvoton`?
>
Got it!
>> +
>>   config DWMAC_QCOM_ETHQOS
>>       tristate "Qualcomm ETHQOS support"
>>       default ARCH_QCOM
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile 
>> b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> index b26f0e79c2b3..48e25b85ea06 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> @@ -19,6 +19,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)    += dwmac-ipq806x.o
>>   obj-$(CONFIG_DWMAC_LPC18XX)    += dwmac-lpc18xx.o
>>   obj-$(CONFIG_DWMAC_MEDIATEK)    += dwmac-mediatek.o
>>   obj-$(CONFIG_DWMAC_MESON)    += dwmac-meson.o dwmac-meson8b.o
>> +obj-$(CONFIG_DWMAC_NUVOTON)    += dwmac-nuvoton.o
>>   obj-$(CONFIG_DWMAC_QCOM_ETHQOS)    += dwmac-qcom-ethqos.o
>>   obj-$(CONFIG_DWMAC_ROCKCHIP)    += dwmac-rk.o
>>   obj-$(CONFIG_DWMAC_RZN1)    += dwmac-rzn1.o
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c 
>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> new file mode 100644
>> index 000000000000..edf1b88ce1cd
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> @@ -0,0 +1,179 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Nuvoton DWMAC specific glue layer
>> + *
>> + * Copyright (C) 2024 Nuvoton Technology Corp.
>> + *
>> + * Author: Joey Lu <yclu4@nuvoton.com>
>> + */
>> +
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_net.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/stmmac.h>
>> +
>> +#include "stmmac.h"
>> +#include "stmmac_platform.h"
>> +
>> +#define NVT_REG_SYS_GMAC0MISCR  0x108
>> +#define NVT_REG_SYS_GMAC1MISCR  0x10C
>> +
>> +#define NVT_MISCR_RMII          BIT(0)
>> +
>> +/* 2000ps is mapped to 0x0 ~ 0xF */
>
> Excuse my ignorance: What is ps?
>
Sorry for the confusion. I will include a complete and clear description 
in the next patch.
>> +#define NVT_PATH_DELAY_DEC      134
>> +#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
>> +#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
>> +
>> +struct nvt_priv_data {
>> +    struct platform_device *pdev;
>> +    struct regmap *regmap;
>> +};
>> +
>> +static struct nvt_priv_data *
>> +nvt_gmac_setup(struct platform_device *pdev, struct 
>> plat_stmmacenet_data *plat)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct nvt_priv_data *bsp_priv;
>> +    phy_interface_t phy_mode;
>> +    u32 tx_delay, rx_delay;
>
> Please append the unit to the variable name.
>
Got it!
>> +    u32 macid, arg, reg;
>> +
>> +    bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
>> +    if (!bsp_priv)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    bsp_priv->regmap =
>> +        syscon_regmap_lookup_by_phandle_args(dev->of_node, 
>> "nuvoton,sys", 1, &macid);
>> +    if (IS_ERR(bsp_priv->regmap)) {
>> +        dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get 
>> sys register\n");
>> +        return ERR_PTR(-ENODEV);
>> +    }
>> +    if (macid > 1) {
>> +        dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>> +    if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", 
>> &arg)) {
>> +        tx_delay = 0;
>> +    } else {
>> +        if (arg <= 2000) {
>> +            tx_delay = (arg == 2000) ? 0xF : (arg / 
>> NVT_PATH_DELAY_DEC);
>
> Write hexcharacters lowercase?
>
Got it!
>> +            dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
>> +        } else {
>> +            dev_err(dev, "Invalid Tx path delay argument.\n");
>> +            return ERR_PTR(-EINVAL);
>> +        }
>> +    }
>> +    if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", 
>> &arg)) {
>> +        rx_delay = 0;
>> +    } else {
>> +        if (arg <= 2000) {
>> +            rx_delay = (arg == 2000) ? 0xF : (arg / 
>> NVT_PATH_DELAY_DEC);
>> +            dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay);
>> +        } else {
>> +            dev_err(dev, "Invalid Rx path delay argument.\n");
>> +            return ERR_PTR(-EINVAL);
>> +        }
>> +    }
>> +
>> +    regmap_read(bsp_priv->regmap,
>> +            macid == 0 ? NVT_REG_SYS_GMAC0MISCR : 
>> NVT_REG_SYS_GMAC1MISCR, &reg);
>> +    reg &= ~(NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK);
>> +
>> +    if (of_get_phy_mode(pdev->dev.of_node, &phy_mode)) {
>> +        dev_err(dev, "missing phy mode property\n");
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>> +    switch (phy_mode) {
>> +    case PHY_INTERFACE_MODE_RGMII:
>> +    case PHY_INTERFACE_MODE_RGMII_ID:
>> +    case PHY_INTERFACE_MODE_RGMII_RXID:
>> +    case PHY_INTERFACE_MODE_RGMII_TXID:
>> +        reg &= ~NVT_MISCR_RMII;
>> +        break;
>> +    case PHY_INTERFACE_MODE_RMII:
>> +        reg |= NVT_MISCR_RMII;
>> +        break;
>> +    default:
>> +        dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>> +    if (!(reg & NVT_MISCR_RMII)) {
>> +        reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay);
>> +        reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay);
>> +    }
>> +
>> +    regmap_write(bsp_priv->regmap,
>> +             macid == 0 ? NVT_REG_SYS_GMAC0MISCR : 
>> NVT_REG_SYS_GMAC1MISCR, reg);
>> +
>> +    bsp_priv->pdev = pdev;
>> +
>> +    return bsp_priv;
>> +}
>> +
>> +static int nvt_gmac_probe(struct platform_device *pdev)
>> +{
>> +    struct plat_stmmacenet_data *plat_dat;
>> +    struct stmmac_resources stmmac_res;
>> +    struct nvt_priv_data *priv_data;
>> +    int ret;
>> +
>> +    ret = stmmac_get_platform_resources(pdev, &stmmac_res);
>> +    if (ret)
>> +        return ret;
>> +
>> +    plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>> +    if (IS_ERR(plat_dat))
>> +        return PTR_ERR(plat_dat);
>> +
>> +    /* Nuvoton DWMAC configs */
>> +    plat_dat->has_gmac = 1;
>> +    plat_dat->tx_fifo_size = 2048;
>> +    plat_dat->rx_fifo_size = 4096;
>> +    plat_dat->multicast_filter_bins = 0;
>> +    plat_dat->unicast_filter_entries = 8;
>> +    plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
>> +
>> +    priv_data = nvt_gmac_setup(pdev, plat_dat);
>> +    if (IS_ERR(priv_data))
>> +        return PTR_ERR(priv_data);
>> +
>> +    ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* The PMT flag is determined by the RWK property.
>> +     * However, our hardware is configured to support only MGK.
>> +     * This is an override on PMT to enable WoL capability.
>> +     */
>> +    plat_dat->pmt = 1;
>> +    device_set_wakeup_capable(&pdev->dev, 1);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct of_device_id nvt_dwmac_match[] = {
>> +    { .compatible = "nuvoton,ma35d1-dwmac"},
>> +    { }
>> +};
>> +MODULE_DEVICE_TABLE(of, nvt_dwmac_match);
>> +
>> +static struct platform_driver nvt_dwmac_driver = {
>> +    .probe  = nvt_gmac_probe,
>> +    .remove = stmmac_pltfr_remove,
>> +    .driver = {
>> +        .name           = "nuvoton-dwmac",
>> +        .pm        = &stmmac_pltfr_pm_ops,
>> +        .of_match_table = nvt_dwmac_match,
>> +    },
>> +};
>> +module_platform_driver(nvt_dwmac_driver);
>> +
>> +MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");
>
> Maybe Nuvoton can set up a generic address?
>
I will switch to using my personal email instead.🙂
>> +MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
>> +MODULE_LICENSE("GPL v2");
>
>
> Kind regards,
>
> Paul

BR,

Joey


log:

[    T0] Booting Linux on physical CPU 0x0000000000 [0x411fd040]
[    T0] Linux version 6.13.0-rc7 (joeylu@ubuntu) 
(aarch64-nuvoton-linux-gnu-gcc.br_real (Buildroot 2021.02.6) 9.4.0, GNU 
ld (GNU Binutils) 2.35.2)
[    T0] Machine model: Nuvoton MA35D1-SOM
[    T0] Memory limited to 248MB
...

[    T1] nuvoton-dwmac 40120000.ethernet: IRQ eth_wake_irq not found
[    T1] nuvoton-dwmac 40120000.ethernet: IRQ eth_lpi not found
[    T1] nuvoton-dwmac 40120000.ethernet: IRQ sfty not found
[    T1] nuvoton-dwmac 40120000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    T1] nuvoton-dwmac 40120000.ethernet:       DWMAC1000
[    T1] nuvoton-dwmac 40120000.ethernet: DMA HW capability register 
supported
[    T1] nuvoton-dwmac 40120000.ethernet: RX Checksum Offload Engine 
supported
[    T1] nuvoton-dwmac 40120000.ethernet: COE Type 2
[    T1] nuvoton-dwmac 40120000.ethernet: TX Checksum insertion supported
[    T1] nuvoton-dwmac 40120000.ethernet: Enhanced/Alternate descriptors
[    T1] nuvoton-dwmac 40120000.ethernet: Enabled extended descriptors
[    T1] nuvoton-dwmac 40120000.ethernet: Ring mode enabled
[    T1] nuvoton-dwmac 40120000.ethernet: Enable RX Mitigation via HW 
Watchdog Timer
[    T1] nuvoton-dwmac 40130000.ethernet: IRQ eth_wake_irq not found
[    T1] nuvoton-dwmac 40130000.ethernet: IRQ eth_lpi not found
[    T1] nuvoton-dwmac 40130000.ethernet: IRQ sfty not found
[    T1] nuvoton-dwmac 40130000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    T1] nuvoton-dwmac 40130000.ethernet:       DWMAC1000
[    T1] nuvoton-dwmac 40130000.ethernet: DMA HW capability register 
supported
[    T1] nuvoton-dwmac 40130000.ethernet: RX Checksum Offload Engine 
supported
[    T1] nuvoton-dwmac 40130000.ethernet: COE Type 2
[    T1] nuvoton-dwmac 40130000.ethernet: TX Checksum insertion supported
[    T1] nuvoton-dwmac 40130000.ethernet: Enhanced/Alternate descriptors
[    T1] nuvoton-dwmac 40130000.ethernet: Enabled extended descriptors
[    T1] nuvoton-dwmac 40130000.ethernet: Ring mode enabled
[    T1] nuvoton-dwmac 40130000.ethernet: Enable RX Mitigation via HW 
Watchdog Timer
...

# udhcpc -i eth0
udhcpc: started, v1.33.1
[   T93] nuvoton-dwmac 40120000.ethernet eth0: Register 
MEM_TYPE_PAGE_POOL RxQ-0
[   T93] nuvoton-dwmac 40120000.ethernet eth0: PHY [stmmac-0:00] driver 
[Generic PHY] (irq=POLL)
[   T93] nuvoton-dwmac 40120000.ethernet eth0: No Safety Features 
support found
[   T93] nuvoton-dwmac 40120000.ethernet eth0: No MAC Management 
Counters available
[   T93] nuvoton-dwmac 40120000.ethernet eth0: IEEE 1588-2008 Advanced 
Timestamp supported
[   T93] nuvoton-dwmac 40120000.ethernet eth0: registered PTP clock
[   T93] nuvoton-dwmac 40120000.ethernet eth0: configuring for 
phy/rgmii-id link mode
udhcpc: sending discover
udhcpc: sending discover
[   T33] nuvoton-dwmac 40120000.ethernet eth0: Link is Up - 1Gbps/Full - 
flow control rx/tx
udhcpc: sending discover
udhcpc: sending select for 192.168.0.103
udhcpc: lease of 192.168.0.103 obtained, lease time 86400
deleting routers
adding dns 192.168.0.1

--------------NR0wsB0jZ96eGW8vCIdGJCSj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Dear Paul,</p>
    <p>Thank you for the reply!<br>
    </p>
    <div class="moz-cite-prefix">Paul Menzel 於 1/14/2025 9:49 AM 寫道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de">Dear
      Joey,
      <br>
      <br>
      <br>
      Thank you for your patch.
      <br>
      <br>
      Am 13.01.25 um 00:54 schrieb Joey Lu:
      <br>
      <blockquote type="cite">Add support for Gigabit Ethernet on
        Nuvoton MA35 series using dwmac driver.
        <br>
      </blockquote>
      <br>
      It’d be great if you added the datasheet name and revision to the
      commit message.
      <br>
    </blockquote>
    <br>
    <p>I will update the commit message in the next patch.</p>
    <p>For reference, the datasheet is <strong>MA35D1 Series Datasheet</strong>.</p>
    <blockquote type="cite"
      cite="mid:a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de">
      <br>
      Also, please document how tested the driver. Maybe even paste new
      log messages.
      <br>
    </blockquote>
    <p>These are the kernel configurations for testing the MA35D1 GMAC
      driver: ARCH_MA35, STMMAC_PLATFORM, DWMAC_NUVOTON.<br>
    </p>
    <p>I'm not sure if this information is sufficient, so please provide
      some guidance on what else I should include to meet your
      requirements.</p>
    <p>I will include the log messages at the end of the email.</p>
    <blockquote type="cite"
      cite="mid:a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de">
      <br>
      <blockquote type="cite">Reviewed-by: Andrew Lunn
        <a class="moz-txt-link-rfc2396E" href="mailto:andrew@lunn.ch">&lt;andrew@lunn.ch&gt;</a>
        <br>
        Signed-off-by: Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:a0987203069@gmail.com">&lt;a0987203069@gmail.com&gt;</a>
        <br>
      </blockquote>
      <br>
      As you use your company email address in the AUTHOR line below,
      please also add that email address to the commit message (and
      maybe even as the author).
      <br>
      <br>
    </blockquote>
    I will update the AUTHOR to use my personal email address instead of
    the company email.
    <blockquote type="cite"
      cite="mid:a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de">
      <blockquote type="cite">---
        <br>
          drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
        <br>
          drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
        <br>
          .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179
        ++++++++++++++++++
        <br>
          3 files changed, 191 insertions(+)
        <br>
          create mode 100644
        drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
        <br>
        <br>
        diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig
        b/drivers/net/ethernet/stmicro/stmmac/Kconfig
        <br>
        index 4cc85a36a1ab..2b424544cf6f 100644
        <br>
        --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
        <br>
        +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
        <br>
        @@ -121,6 +121,17 @@ config DWMAC_MESON
        <br>
                the stmmac device driver. This driver is used for
        Meson6,
        <br>
                Meson8, Meson8b and GXBB SoCs.
        <br>
          +config DWMAC_NUVOTON
        <br>
        +    tristate "Nuvoton MA35 dwmac support"
        <br>
        +    default ARCH_MA35
        <br>
        +    depends on OF &amp;&amp; (ARCH_MA35 || COMPILE_TEST)
        <br>
        +    select MFD_SYSCON
        <br>
        +    help
        <br>
        +      Support for Ethernet controller on Nuvoton MA35 series
        SoC.
        <br>
        +
        <br>
        +      This selects the Nuvoton MA35 series SoC glue layer
        support
        <br>
        +      for the stmmac device driver.
        <br>
      </blockquote>
      <br>
      Also mention the module name `dwmac-nuvoton`?
      <br>
      <br>
    </blockquote>
    Got it!<br>
    <blockquote type="cite"
      cite="mid:a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de">
      <blockquote type="cite">+
        <br>
          config DWMAC_QCOM_ETHQOS
        <br>
              tristate "Qualcomm ETHQOS support"
        <br>
              default ARCH_QCOM
        <br>
        diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile
        b/drivers/net/ethernet/stmicro/stmmac/Makefile
        <br>
        index b26f0e79c2b3..48e25b85ea06 100644
        <br>
        --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
        <br>
        +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
        <br>
        @@ -19,6 +19,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)    +=
        dwmac-ipq806x.o
        <br>
          obj-$(CONFIG_DWMAC_LPC18XX)    += dwmac-lpc18xx.o
        <br>
          obj-$(CONFIG_DWMAC_MEDIATEK)    += dwmac-mediatek.o
        <br>
          obj-$(CONFIG_DWMAC_MESON)    += dwmac-meson.o dwmac-meson8b.o
        <br>
        +obj-$(CONFIG_DWMAC_NUVOTON)    += dwmac-nuvoton.o
        <br>
          obj-$(CONFIG_DWMAC_QCOM_ETHQOS)    += dwmac-qcom-ethqos.o
        <br>
          obj-$(CONFIG_DWMAC_ROCKCHIP)    += dwmac-rk.o
        <br>
          obj-$(CONFIG_DWMAC_RZN1)    += dwmac-rzn1.o
        <br>
        diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
        b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
        <br>
        new file mode 100644
        <br>
        index 000000000000..edf1b88ce1cd
        <br>
        --- /dev/null
        <br>
        +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
        <br>
        @@ -0,0 +1,179 @@
        <br>
        +// SPDX-License-Identifier: GPL-2.0-only
        <br>
        +/*
        <br>
        + * Nuvoton DWMAC specific glue layer
        <br>
        + *
        <br>
        + * Copyright (C) 2024 Nuvoton Technology Corp.
        <br>
        + *
        <br>
        + * Author: Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:yclu4@nuvoton.com">&lt;yclu4@nuvoton.com&gt;</a>
        <br>
        + */
        <br>
        +
        <br>
        +#include &lt;linux/mfd/syscon.h&gt;
        <br>
        +#include &lt;linux/of_device.h&gt;
        <br>
        +#include &lt;linux/of_net.h&gt;
        <br>
        +#include &lt;linux/platform_device.h&gt;
        <br>
        +#include &lt;linux/regmap.h&gt;
        <br>
        +#include &lt;linux/stmmac.h&gt;
        <br>
        +
        <br>
        +#include "stmmac.h"
        <br>
        +#include "stmmac_platform.h"
        <br>
        +
        <br>
        +#define NVT_REG_SYS_GMAC0MISCR  0x108
        <br>
        +#define NVT_REG_SYS_GMAC1MISCR  0x10C
        <br>
        +
        <br>
        +#define NVT_MISCR_RMII          BIT(0)
        <br>
        +
        <br>
        +/* 2000ps is mapped to 0x0 ~ 0xF */
        <br>
      </blockquote>
      <br>
      Excuse my ignorance: What is ps?
      <br>
      <br>
    </blockquote>
    Sorry for the confusion. I will include a complete and clear
    description in the next patch.
    <blockquote type="cite"
      cite="mid:a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de">
      <blockquote type="cite">+#define NVT_PATH_DELAY_DEC      134
        <br>
        +#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
        <br>
        +#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
        <br>
        +
        <br>
        +struct nvt_priv_data {
        <br>
        +    struct platform_device *pdev;
        <br>
        +    struct regmap *regmap;
        <br>
        +};
        <br>
        +
        <br>
        +static struct nvt_priv_data *
        <br>
        +nvt_gmac_setup(struct platform_device *pdev, struct
        plat_stmmacenet_data *plat)
        <br>
        +{
        <br>
        +    struct device *dev = &amp;pdev-&gt;dev;
        <br>
        +    struct nvt_priv_data *bsp_priv;
        <br>
        +    phy_interface_t phy_mode;
        <br>
        +    u32 tx_delay, rx_delay;
        <br>
      </blockquote>
      <br>
      Please append the unit to the variable name.
      <br>
      <br>
    </blockquote>
    Got it!<br>
    <blockquote type="cite"
      cite="mid:a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de">
      <blockquote type="cite">+    u32 macid, arg, reg;
        <br>
        +
        <br>
        +    bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv),
        GFP_KERNEL);
        <br>
        +    if (!bsp_priv)
        <br>
        +        return ERR_PTR(-ENOMEM);
        <br>
        +
        <br>
        +    bsp_priv-&gt;regmap =
        <br>
        +        syscon_regmap_lookup_by_phandle_args(dev-&gt;of_node,
        "nuvoton,sys", 1, &amp;macid);
        <br>
        +    if (IS_ERR(bsp_priv-&gt;regmap)) {
        <br>
        +        dev_err_probe(dev, PTR_ERR(bsp_priv-&gt;regmap),
        "Failed to get sys register\n");
        <br>
        +        return ERR_PTR(-ENODEV);
        <br>
        +    }
        <br>
        +    if (macid &gt; 1) {
        <br>
        +        dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
        <br>
        +        return ERR_PTR(-EINVAL);
        <br>
        +    }
        <br>
        +
        <br>
        +    if (of_property_read_u32(dev-&gt;of_node,
        "tx-internal-delay-ps", &amp;arg)) {
        <br>
        +        tx_delay = 0;
        <br>
        +    } else {
        <br>
        +        if (arg &lt;= 2000) {
        <br>
        +            tx_delay = (arg == 2000) ? 0xF : (arg /
        NVT_PATH_DELAY_DEC);
        <br>
      </blockquote>
      <br>
      Write hexcharacters lowercase?
      <br>
      <br>
    </blockquote>
    Got it!<br>
    <blockquote type="cite"
      cite="mid:a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de">
      <blockquote type="cite">+            dev_dbg(dev, "Set Tx path
        delay to 0x%x\n", tx_delay);
        <br>
        +        } else {
        <br>
        +            dev_err(dev, "Invalid Tx path delay argument.\n");
        <br>
        +            return ERR_PTR(-EINVAL);
        <br>
        +        }
        <br>
        +    }
        <br>
        +    if (of_property_read_u32(dev-&gt;of_node,
        "rx-internal-delay-ps", &amp;arg)) {
        <br>
        +        rx_delay = 0;
        <br>
        +    } else {
        <br>
        +        if (arg &lt;= 2000) {
        <br>
        +            rx_delay = (arg == 2000) ? 0xF : (arg /
        NVT_PATH_DELAY_DEC);
        <br>
        +            dev_dbg(dev, "Set Rx path delay to 0x%x\n",
        rx_delay);
        <br>
        +        } else {
        <br>
        +            dev_err(dev, "Invalid Rx path delay argument.\n");
        <br>
        +            return ERR_PTR(-EINVAL);
        <br>
        +        }
        <br>
        +    }
        <br>
        +
        <br>
        +    regmap_read(bsp_priv-&gt;regmap,
        <br>
        +            macid == 0 ? NVT_REG_SYS_GMAC0MISCR :
        NVT_REG_SYS_GMAC1MISCR, &amp;reg);
        <br>
        +    reg &amp;= ~(NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK);
        <br>
        +
        <br>
        +    if (of_get_phy_mode(pdev-&gt;dev.of_node, &amp;phy_mode)) {
        <br>
        +        dev_err(dev, "missing phy mode property\n");
        <br>
        +        return ERR_PTR(-EINVAL);
        <br>
        +    }
        <br>
        +
        <br>
        +    switch (phy_mode) {
        <br>
        +    case PHY_INTERFACE_MODE_RGMII:
        <br>
        +    case PHY_INTERFACE_MODE_RGMII_ID:
        <br>
        +    case PHY_INTERFACE_MODE_RGMII_RXID:
        <br>
        +    case PHY_INTERFACE_MODE_RGMII_TXID:
        <br>
        +        reg &amp;= ~NVT_MISCR_RMII;
        <br>
        +        break;
        <br>
        +    case PHY_INTERFACE_MODE_RMII:
        <br>
        +        reg |= NVT_MISCR_RMII;
        <br>
        +        break;
        <br>
        +    default:
        <br>
        +        dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
        <br>
        +        return ERR_PTR(-EINVAL);
        <br>
        +    }
        <br>
        +
        <br>
        +    if (!(reg &amp; NVT_MISCR_RMII)) {
        <br>
        +        reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay);
        <br>
        +        reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay);
        <br>
        +    }
        <br>
        +
        <br>
        +    regmap_write(bsp_priv-&gt;regmap,
        <br>
        +             macid == 0 ? NVT_REG_SYS_GMAC0MISCR :
        NVT_REG_SYS_GMAC1MISCR, reg);
        <br>
        +
        <br>
        +    bsp_priv-&gt;pdev = pdev;
        <br>
        +
        <br>
        +    return bsp_priv;
        <br>
        +}
        <br>
        +
        <br>
        +static int nvt_gmac_probe(struct platform_device *pdev)
        <br>
        +{
        <br>
        +    struct plat_stmmacenet_data *plat_dat;
        <br>
        +    struct stmmac_resources stmmac_res;
        <br>
        +    struct nvt_priv_data *priv_data;
        <br>
        +    int ret;
        <br>
        +
        <br>
        +    ret = stmmac_get_platform_resources(pdev, &amp;stmmac_res);
        <br>
        +    if (ret)
        <br>
        +        return ret;
        <br>
        +
        <br>
        +    plat_dat = devm_stmmac_probe_config_dt(pdev,
        stmmac_res.mac);
        <br>
        +    if (IS_ERR(plat_dat))
        <br>
        +        return PTR_ERR(plat_dat);
        <br>
        +
        <br>
        +    /* Nuvoton DWMAC configs */
        <br>
        +    plat_dat-&gt;has_gmac = 1;
        <br>
        +    plat_dat-&gt;tx_fifo_size = 2048;
        <br>
        +    plat_dat-&gt;rx_fifo_size = 4096;
        <br>
        +    plat_dat-&gt;multicast_filter_bins = 0;
        <br>
        +    plat_dat-&gt;unicast_filter_entries = 8;
        <br>
        +    plat_dat-&gt;flags &amp;= ~STMMAC_FLAG_USE_PHY_WOL;
        <br>
        +
        <br>
        +    priv_data = nvt_gmac_setup(pdev, plat_dat);
        <br>
        +    if (IS_ERR(priv_data))
        <br>
        +        return PTR_ERR(priv_data);
        <br>
        +
        <br>
        +    ret = stmmac_pltfr_probe(pdev, plat_dat, &amp;stmmac_res);
        <br>
        +    if (ret)
        <br>
        +        return ret;
        <br>
        +
        <br>
        +    /* The PMT flag is determined by the RWK property.
        <br>
        +     * However, our hardware is configured to support only MGK.
        <br>
        +     * This is an override on PMT to enable WoL capability.
        <br>
        +     */
        <br>
        +    plat_dat-&gt;pmt = 1;
        <br>
        +    device_set_wakeup_capable(&amp;pdev-&gt;dev, 1);
        <br>
        +
        <br>
        +    return 0;
        <br>
        +}
        <br>
        +
        <br>
        +static const struct of_device_id nvt_dwmac_match[] = {
        <br>
        +    { .compatible = "nuvoton,ma35d1-dwmac"},
        <br>
        +    { }
        <br>
        +};
        <br>
        +MODULE_DEVICE_TABLE(of, nvt_dwmac_match);
        <br>
        +
        <br>
        +static struct platform_driver nvt_dwmac_driver = {
        <br>
        +    .probe  = nvt_gmac_probe,
        <br>
        +    .remove = stmmac_pltfr_remove,
        <br>
        +    .driver = {
        <br>
        +        .name           = "nuvoton-dwmac",
        <br>
        +        .pm        = &amp;stmmac_pltfr_pm_ops,
        <br>
        +        .of_match_table = nvt_dwmac_match,
        <br>
        +    },
        <br>
        +};
        <br>
        +module_platform_driver(nvt_dwmac_driver);
        <br>
        +
        <br>
        +MODULE_AUTHOR("Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:yclu4@nuvoton.com">&lt;yclu4@nuvoton.com&gt;</a>");
        <br>
      </blockquote>
      <br>
      Maybe Nuvoton can set up a generic address?
      <br>
      <br>
    </blockquote>
    I will switch to using my personal email instead.🙂
    <blockquote type="cite"
      cite="mid:a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de">
      <blockquote type="cite">+MODULE_DESCRIPTION("Nuvoton DWMAC
        specific glue layer");
        <br>
        +MODULE_LICENSE("GPL v2");
        <br>
      </blockquote>
      <br>
      <br>
      Kind regards,
      <br>
      <br>
      Paul
      <br>
    </blockquote>
    <p>BR,</p>
    <p>Joey</p>
    <p><br>
    </p>
    <p>log:<br>
    </p>
    <p>[    T0] Booting Linux on physical CPU 0x0000000000 [0x411fd040]<br>
      [    T0] Linux version 6.13.0-rc7 (joeylu@ubuntu)
      (aarch64-nuvoton-linux-gnu-gcc.br_real (Buildroot 2021.02.6)
      9.4.0, GNU ld (GNU Binutils) 2.35.2)<br>
      [    T0] Machine model: Nuvoton MA35D1-SOM<br>
      [    T0] Memory limited to 248MB<br>
      ...</p>
    <p>[    T1] nuvoton-dwmac 40120000.ethernet: IRQ eth_wake_irq not
      found<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: IRQ eth_lpi not found<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: IRQ sfty not found<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: User ID: 0x10, Synopsys
      ID: 0x37<br>
      [    T1] nuvoton-dwmac 40120000.ethernet:       DWMAC1000<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: DMA HW capability
      register supported<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: RX Checksum Offload
      Engine supported<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: COE Type 2<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: TX Checksum insertion
      supported<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: Enhanced/Alternate
      descriptors<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: Enabled extended
      descriptors<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: Ring mode enabled<br>
      [    T1] nuvoton-dwmac 40120000.ethernet: Enable RX Mitigation via
      HW Watchdog Timer<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: IRQ eth_wake_irq not
      found<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: IRQ eth_lpi not found<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: IRQ sfty not found<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: User ID: 0x10, Synopsys
      ID: 0x37<br>
      [    T1] nuvoton-dwmac 40130000.ethernet:       DWMAC1000<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: DMA HW capability
      register supported<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: RX Checksum Offload
      Engine supported<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: COE Type 2<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: TX Checksum insertion
      supported<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: Enhanced/Alternate
      descriptors<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: Enabled extended
      descriptors<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: Ring mode enabled<br>
      [    T1] nuvoton-dwmac 40130000.ethernet: Enable RX Mitigation via
      HW Watchdog Timer<br>
      ...<br>
      <br>
      # udhcpc -i eth0<br>
      udhcpc: started, v1.33.1<br>
      [   T93] nuvoton-dwmac 40120000.ethernet eth0: Register
      MEM_TYPE_PAGE_POOL RxQ-0<br>
      [   T93] nuvoton-dwmac 40120000.ethernet eth0: PHY [stmmac-0:00]
      driver [Generic PHY] (irq=POLL)<br>
      [   T93] nuvoton-dwmac 40120000.ethernet eth0: No Safety Features
      support found<br>
      [   T93] nuvoton-dwmac 40120000.ethernet eth0: No MAC Management
      Counters available<br>
      [   T93] nuvoton-dwmac 40120000.ethernet eth0: IEEE 1588-2008
      Advanced Timestamp supported<br>
      [   T93] nuvoton-dwmac 40120000.ethernet eth0: registered PTP
      clock<br>
      [   T93] nuvoton-dwmac 40120000.ethernet eth0: configuring for
      phy/rgmii-id link mode<br>
      udhcpc: sending discover<br>
      udhcpc: sending discover<br>
      [   T33] nuvoton-dwmac 40120000.ethernet eth0: Link is Up -
      1Gbps/Full - flow control rx/tx<br>
      udhcpc: sending discover<br>
      udhcpc: sending select for 192.168.0.103<br>
      udhcpc: lease of 192.168.0.103 obtained, lease time 86400<br>
      deleting routers<br>
      adding dns 192.168.0.1<br>
      <br>
    </p>
  </body>
</html>

--------------NR0wsB0jZ96eGW8vCIdGJCSj--
