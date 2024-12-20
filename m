Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0A9A01C62
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:12:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRClD6l6jz3c8x
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:12:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734678439;
	cv=none; b=HcQs+0Ru8P24OnkLscp2aE54BakQ2WwPEZM+6C2FYoaCpjnjii402gw50hu6CBzFxc13g7YsXBudVaM7itX3GgzF/GWiI9GXYHYquU78ap0Q4L7EZMAshHcfIpO6FkoU82o2GoAH2pcElERo7tZACscqwo2zjGDty8IWn92PSqieRQQZGD9JhlTVQ9NsXD6dJConfI9LbfamtQn/eAcdG+9pWjK+7BTaVK+OycpCOkDvYN4i60nG+AN5D+dBXioXWALaiA4oeC7kJCA4bBFrrMCoC4DRxVMpqFTIn2JS3RU5ih0mPKv6CupDEmxeKoSuWpo9pexu9kNmYrR/+88imw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734678439; c=relaxed/relaxed;
	bh=PEMd+ZCcjVyKhgZ//d+9H5Qp01LfwOiW7F0h4s2qi1A=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=GDmeii+FtjJubr0V2bv4TmNB9Sb5aItnG3ohFqt5pKd6tmPom5AYnX5oTjpi/jmR534N8wV+6IABiXlJo7q2EWPUetbs3Y7MdfhIs2v/QvEi+EeYcNyiDNMGII0JCTDvOLIbzaG/jP7EcAuf3XxHpGrH/Y5Hsyd4V3klSsYsmfVr/RLDFbLqoKsGMKQ2xtazbbMTBk4459d5sUySUMJWmqeL92X0RWgGH79ySnwV/jqSn2kyYu0GpC4joE84QRjuwwrHqyrdaujOhcE/a0CRvLZfX/BrV4PysvapDqfBeSzaT+iA0DNlNf8fT9mB9c3IO0NHox5Hn8V03FUxIEql0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QqqdxRWV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QqqdxRWV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDz4j4krMz2xs7
	for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2024 18:07:15 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-725ee27e905so2036517b3a.2
        for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 23:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734678431; x=1735283231; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEMd+ZCcjVyKhgZ//d+9H5Qp01LfwOiW7F0h4s2qi1A=;
        b=QqqdxRWVAcHMIMoNsEHyl1azX48pnJOLLFNPxB9eH/wHfzgrarJFoHpfn0rFRefqmT
         nuzNZQa+3e/rV0u+cq1unSILfrg7xWLcld+87TfS5p7UcO8jydAcJ5UV0Dqz3gPPNOMO
         B/IZEeR5RTwNvVdzyWqEjAXMBr6PyHQ2bLd9mUdTrmE16u+pUv4/QkiSvPI9c/S6P0Ij
         /Bov5CCN0A6ysPDop0xpohKu7RLLWzD/dyLZ0YqnMEspeND0PxB/VnHbTZX8Hcz4JHVs
         JOFrWfLhHKWvAQNL7EoFzwMJlq+hEGivHPXOYcEMhd0fejKtlsMRgO19evTUbhLvj2CT
         qhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734678431; x=1735283231;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PEMd+ZCcjVyKhgZ//d+9H5Qp01LfwOiW7F0h4s2qi1A=;
        b=d5AztZ23zMXYCsmVrjzsh8BhtApQj6k/l3CZpGuqNkUmkVOoEvKv9rVF2tP7TawApi
         6NmaNLlFWTQ3JjNaX/nzyc1Q4m5s+ibgb24qpx2em6xcPaV7QH8eDqSRAQEF3n9l9l8j
         HTt3XQoVf39eGAKNKqkX3wT3EJ3oU1veuhsO4LQejI41F9JGKb51ihkDzJypuuxG/msj
         pz7Fg9i3TCyBGDXLg0aiPkIypznMmBi23Au7rFkrkHcqlrNXIsSz+ymJMcCGSmFNwnhp
         RyR5sxH2/PPTiSxdOZYzogxL2uzHt2KP4SFrindFmEDFg/FK63WmmnwrzWuMdkGFMjJK
         8Ewg==
X-Forwarded-Encrypted: i=1; AJvYcCVmCQ6q0M3AZkvuybBmndMpn2wEFp5jsQqq66bx+2FkbacI/RsmA0WFcBxBRxp6ijcDxRPFSZkU@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZ2sfvR0dNwU0Qr1eexEjfwrgmvkWZFM3n57ZS+2ZQYsYo2Hd1
	umVflF0pXnA6MAZB3jSblWaGA42twQWm/HiN9Urntja5+whKhr2y
X-Gm-Gg: ASbGncuYALXi20G2rDYbY+2QAZ7xJWr1g8FQddvZpJ6fHP84xNRLJl3wEtxBuF2rfYc
	Khi7ZmuCfWiF41sG8Dwz61t3LmNSZRzd4s/VS8M0yhFShd7Z/q0KFABw3vSyh50Ox5+CYwCl+Sh
	Q8QSSPb1pSdkL1x1mdQvZ9m3xXkx68RyaP7v1jz77CPAMPQyPnOmYOIU3R8yAMpCe+QYEwFO53k
	gNglFoUccF0MtVQyD0yb/h+mpyuZaJvYzGhqygPGVhW0mkuMsqy2NI87Ir2W6xbXeelAKz/npH9
	0qiKVHUTCqMfcViHaRDeJbUWGQF3R4Xcuoo=
X-Google-Smtp-Source: AGHT+IEaoCcbwPWwR8Ti3oa7l/Mq+jAqCRd0p58CA/VVjA6ygI8K1jwyLafu9oTcFKQj2PeOnzXDbg==
X-Received: by 2002:a05:6a21:350f:b0:1db:eff0:6ae7 with SMTP id adf61e73a8af0-1e5e0802290mr3304170637.33.1734678431417;
        Thu, 19 Dec 2024 23:07:11 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b821da75sm1896744a12.36.2024.12.19.23.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 23:07:11 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------RxXukmybidVLR5d4O2xu8iTv"
Message-ID: <216e7c97-e0b1-4833-b344-a71834020b15@gmail.com>
Date: Fri, 20 Dec 2024 15:07:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20241218114442.137884-1-a0987203069@gmail.com>
 <20241218114442.137884-4-a0987203069@gmail.com>
 <7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com>
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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
Cc: alexandre.torgue@foss.st.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, ychuang3@nuvoton.com, richardcochran@gmail.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------RxXukmybidVLR5d4O2xu8iTv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Przemek,

Thank you for your reply.

Przemek Kitszel 於 12/18/2024 9:26 PM 寫道:
> On 12/18/24 12:44, Joey Lu wrote:
>> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac 
>> driver.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>   .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
>>   3 files changed, 194 insertions(+)
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig 
>> b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> index 6658536a4e17..c8cbc0ec1311 100644
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
>> +
>>   config DWMAC_QCOM_ETHQOS
>>       tristate "Qualcomm ETHQOS support"
>>       default ARCH_QCOM
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile 
>> b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> index 2389fd261344..9812b824459f 100644
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
>> index 000000000000..c5b8933c1f44
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> @@ -0,0 +1,182 @@
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
>> +#define REG_SYS_GMAC0MISCR  0x108
>> +#define REG_SYS_GMAC1MISCR  0x10C
>> +
>> +#define MISCR_RMII          BIT(0)
>> +
>> +/* 2000ps is mapped to 0 ~ 0xF */
>> +#define PATH_DELAY_DEC      134
>
> would be great to previx your macros by NVT_
Got it.
>
> why 134 and not 125?

The interval is confirmed to be 134. The mapping is as follows:

|0000| = 0.00 ns
|0001| = 0.13 ns
|0010| = 0.27 ns
...
|1111| = 2.00 ns
>
>> +#define TX_DELAY_OFFSET     16
>
> please remove and replace the usage point by FIELD_PREP()
Got it.
>
>> +#define TX_DELAY_MASK       GENMASK(19, 16)
>> +#define RX_DELAY_OFFSET     20
>
> ditto
Got it.
>
>> +#define RX_DELAY_MASK       GENMASK(23, 20)
>> +
>> +struct nvt_priv_data {
>> +    struct platform_device *pdev;
>> +    struct regmap *regmap;
>> +};
>> +
>> +static struct nvt_priv_data *
>> +nuvoton_gmac_setup(struct platform_device *pdev, struct 
>> plat_stmmacenet_data *plat)
>
> please stick to one previx for all functions, structs, and defines,
> NVT/nvt looks good
> s/nuvoton/nvt/
Okay. I will use nvt as the prefix
>
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct nvt_priv_data *bsp_priv;
>> +    phy_interface_t phy_mode;
>> +    u32 tx_delay, rx_delay;
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
>> +        tx_delay = 0; /* Default value is 0 */
>
> please remove obvious comments
Got it.
>
>> +    } else {
>> +        if (arg <= 2000) {
>> +            tx_delay = (arg == 2000) ? 0xF : (arg / PATH_DELAY_DEC);
>> +            dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
>> +        } else {
>> +            dev_err(dev, "Invalid Tx path delay argument.\n");
>> +            return ERR_PTR(-EINVAL);
>> +        }
>> +    }
>> +    if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", 
>> &arg)) {
>> +        rx_delay = 0; /* Default value is 0 */
>> +    } else {
>> +        if (arg <= 2000) {
>> +            rx_delay = (arg == 2000) ? 0xF : (arg / PATH_DELAY_DEC);
>> +            dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay);
>> +        } else {
>> +            dev_err(dev, "Invalid Rx path delay argument.\n");
>> +            return ERR_PTR(-EINVAL);
>> +        }
>> +    }
>> +
>> +    regmap_read(bsp_priv->regmap,
>> +            macid == 0 ? REG_SYS_GMAC0MISCR : REG_SYS_GMAC1MISCR, 
>> &reg);
>> +    reg &= ~(TX_DELAY_MASK | RX_DELAY_MASK);
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
>> +        reg &= ~MISCR_RMII;
>> +        break;
>> +    case PHY_INTERFACE_MODE_RMII:
>> +        reg |= MISCR_RMII;
>> +        break;
>> +    default:
>> +        dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>> +    if (!(reg & MISCR_RMII)) {
>> +        reg |= tx_delay << TX_DELAY_OFFSET;
>> +        reg |= rx_delay << RX_DELAY_OFFSET;
>> +    }
>> +
>> +    regmap_write(bsp_priv->regmap,
>> +             macid == 0 ? REG_SYS_GMAC0MISCR : REG_SYS_GMAC1MISCR, 
>> reg);
>> +
>> +    bsp_priv->pdev = pdev;
>> +
>> +    return bsp_priv;
>> +}
>> +
>> +static int nuvoton_gmac_probe(struct platform_device *pdev)
>> +{
>> +    struct plat_stmmacenet_data *plat_dat;
>> +    struct stmmac_resources stmmac_res;
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
>> +    plat_dat->bsp_priv = nuvoton_gmac_setup(pdev, plat_dat);
>
> would be great to extend plat_stmmacenet_data allocation to allocate
> also the space for the priv data - but this is outside of the scope
> of this patchset

You're right, this is a misuse and will be corrected.

>
>> +    if (IS_ERR(plat_dat->bsp_priv)) {
>> +        ret = PTR_ERR(plat_dat->bsp_priv);
>> +        return ret;
>
> just return PTR_ERR(...)
Got it.
>
>> +    }
>> +
>> +    ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
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
>> +static const struct of_device_id nuvoton_dwmac_match[] = {
>> +    { .compatible = "nuvoton,ma35d1-dwmac"},
>> +    { }
>> +};
>> +MODULE_DEVICE_TABLE(of, nuvoton_dwmac_match);
>> +
>> +static struct platform_driver nuvoton_dwmac_driver = {
>> +    .probe  = nuvoton_gmac_probe,
>> +    .remove = stmmac_pltfr_remove,
>> +    .driver = {
>> +        .name           = "nuvoton-dwmac",
>> +        .pm        = &stmmac_pltfr_pm_ops,
>> +        .of_match_table = nuvoton_dwmac_match,
>> +    },
>> +};
>> +module_platform_driver(nuvoton_dwmac_driver);
>> +
>> +MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");
>> +MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
>> +MODULE_LICENSE("GPL v2");
>
Thanks!

BR,

Joey

--------------RxXukmybidVLR5d4O2xu8iTv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Dear Przemek,</p>
    <p>Thank you for your reply.<br>
    </p>
    <div class="moz-cite-prefix">Przemek Kitszel 於 12/18/2024 9:26 PM
      寫道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com">On
      12/18/24 12:44, Joey Lu wrote:
      <br>
      <blockquote type="cite">Add support for Gigabit Ethernet on
        Nuvoton MA35 series using dwmac driver.
        <br>
        <br>
        Signed-off-by: Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:a0987203069@gmail.com">&lt;a0987203069@gmail.com&gt;</a>
        <br>
        ---
        <br>
          drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
        <br>
          drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
        <br>
          .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182
        ++++++++++++++++++
        <br>
          3 files changed, 194 insertions(+)
        <br>
          create mode 100644
        drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
        <br>
        <br>
        diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig
        b/drivers/net/ethernet/stmicro/stmmac/Kconfig
        <br>
        index 6658536a4e17..c8cbc0ec1311 100644
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
        +
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
        index 2389fd261344..9812b824459f 100644
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
        index 000000000000..c5b8933c1f44
        <br>
        --- /dev/null
        <br>
        +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
        <br>
        @@ -0,0 +1,182 @@
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
        +#define REG_SYS_GMAC0MISCR  0x108
        <br>
        +#define REG_SYS_GMAC1MISCR  0x10C
        <br>
        +
        <br>
        +#define MISCR_RMII          BIT(0)
        <br>
        +
        <br>
        +/* 2000ps is mapped to 0 ~ 0xF */
        <br>
        +#define PATH_DELAY_DEC      134
        <br>
      </blockquote>
      <br>
      would be great to previx your macros by NVT_
      <br>
    </blockquote>
    Got it.<br>
    <blockquote type="cite"
      cite="mid:7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com">
      <br>
      why 134 and not 125?
      <br>
    </blockquote>
    <p>The interval is confirmed to be 134. The mapping is as follows:</p>
    <code>0000</code> = 0.00 ns<br>
    <code>0001</code> = 0.13 ns<br>
    <code>0010</code> = 0.27 ns<br>
    ...<br>
    <code>1111</code> = 2.00 ns
    <blockquote type="cite"
      cite="mid:7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com">
      <br>
      <blockquote type="cite">+#define TX_DELAY_OFFSET     16
        <br>
      </blockquote>
      <br>
      please remove and replace the usage point by FIELD_PREP()
      <br>
    </blockquote>
    Got it.<br>
    <blockquote type="cite"
      cite="mid:7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com">
      <br>
      <blockquote type="cite">+#define TX_DELAY_MASK       GENMASK(19,
        16)
        <br>
        +#define RX_DELAY_OFFSET     20
        <br>
      </blockquote>
      <br>
      ditto
      <br>
    </blockquote>
    Got it.<br>
    <blockquote type="cite"
      cite="mid:7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com">
      <br>
      <blockquote type="cite">+#define RX_DELAY_MASK       GENMASK(23,
        20)
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
        +nuvoton_gmac_setup(struct platform_device *pdev, struct
        plat_stmmacenet_data *plat)
        <br>
      </blockquote>
      <br>
      please stick to one previx for all functions, structs, and
      defines,
      <br>
      NVT/nvt looks good
      <br>
      s/nuvoton/nvt/
      <br>
    </blockquote>
    Okay. I will use nvt as the prefix
    <blockquote type="cite"
      cite="mid:7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com">
      <br>
      <blockquote type="cite">+{
        <br>
        +    struct device *dev = &amp;pdev-&gt;dev;
        <br>
        +    struct nvt_priv_data *bsp_priv;
        <br>
        +    phy_interface_t phy_mode;
        <br>
        +    u32 tx_delay, rx_delay;
        <br>
        +    u32 macid, arg, reg;
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
        +        tx_delay = 0; /* Default value is 0 */
        <br>
      </blockquote>
      <br>
      please remove obvious comments
      <br>
    </blockquote>
    Got it.<br>
    <blockquote type="cite"
      cite="mid:7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com">
      <br>
      <blockquote type="cite">+    } else {
        <br>
        +        if (arg &lt;= 2000) {
        <br>
        +            tx_delay = (arg == 2000) ? 0xF : (arg /
        PATH_DELAY_DEC);
        <br>
        +            dev_dbg(dev, "Set Tx path delay to 0x%x\n",
        tx_delay);
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
        +        rx_delay = 0; /* Default value is 0 */
        <br>
        +    } else {
        <br>
        +        if (arg &lt;= 2000) {
        <br>
        +            rx_delay = (arg == 2000) ? 0xF : (arg /
        PATH_DELAY_DEC);
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
        +            macid == 0 ? REG_SYS_GMAC0MISCR :
        REG_SYS_GMAC1MISCR, &amp;reg);
        <br>
        +    reg &amp;= ~(TX_DELAY_MASK | RX_DELAY_MASK);
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
        +        reg &amp;= ~MISCR_RMII;
        <br>
        +        break;
        <br>
        +    case PHY_INTERFACE_MODE_RMII:
        <br>
        +        reg |= MISCR_RMII;
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
        +    if (!(reg &amp; MISCR_RMII)) {
        <br>
        +        reg |= tx_delay &lt;&lt; TX_DELAY_OFFSET;
        <br>
        +        reg |= rx_delay &lt;&lt; RX_DELAY_OFFSET;
        <br>
        +    }
        <br>
        +
        <br>
        +    regmap_write(bsp_priv-&gt;regmap,
        <br>
        +             macid == 0 ? REG_SYS_GMAC0MISCR :
        REG_SYS_GMAC1MISCR, reg);
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
        +static int nuvoton_gmac_probe(struct platform_device *pdev)
        <br>
        +{
        <br>
        +    struct plat_stmmacenet_data *plat_dat;
        <br>
        +    struct stmmac_resources stmmac_res;
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
        +    plat_dat-&gt;bsp_priv = nuvoton_gmac_setup(pdev, plat_dat);
        <br>
      </blockquote>
      <br>
      would be great to extend plat_stmmacenet_data allocation to
      allocate
      <br>
      also the space for the priv data - but this is outside of the
      scope
      <br>
      of this patchset
      <br>
    </blockquote>
    <p>You're right, this is a misuse and will be corrected.</p>
    <blockquote type="cite"
      cite="mid:7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com">
      <br>
      <blockquote type="cite">+    if (IS_ERR(plat_dat-&gt;bsp_priv)) {
        <br>
        +        ret = PTR_ERR(plat_dat-&gt;bsp_priv);
        <br>
        +        return ret;
        <br>
      </blockquote>
      <br>
      just return PTR_ERR(...)
      <br>
    </blockquote>
    Got it.<br>
    <blockquote type="cite"
      cite="mid:7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com">
      <br>
      <blockquote type="cite">+    }
        <br>
        +
        <br>
        +    ret = stmmac_dvr_probe(&amp;pdev-&gt;dev, plat_dat,
        &amp;stmmac_res);
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
        +static const struct of_device_id nuvoton_dwmac_match[] = {
        <br>
        +    { .compatible = "nuvoton,ma35d1-dwmac"},
        <br>
        +    { }
        <br>
        +};
        <br>
        +MODULE_DEVICE_TABLE(of, nuvoton_dwmac_match);
        <br>
        +
        <br>
        +static struct platform_driver nuvoton_dwmac_driver = {
        <br>
        +    .probe  = nuvoton_gmac_probe,
        <br>
        +    .remove = stmmac_pltfr_remove,
        <br>
        +    .driver = {
        <br>
        +        .name           = "nuvoton-dwmac",
        <br>
        +        .pm        = &amp;stmmac_pltfr_pm_ops,
        <br>
        +        .of_match_table = nuvoton_dwmac_match,
        <br>
        +    },
        <br>
        +};
        <br>
        +module_platform_driver(nuvoton_dwmac_driver);
        <br>
        +
        <br>
        +MODULE_AUTHOR("Joey Lu <a class="moz-txt-link-rfc2396E" href="mailto:yclu4@nuvoton.com">&lt;yclu4@nuvoton.com&gt;</a>");
        <br>
        +MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
        <br>
        +MODULE_LICENSE("GPL v2");
        <br>
      </blockquote>
      <br>
    </blockquote>
    <p>Thanks!</p>
    <p>BR,</p>
    <p>Joey<br>
    </p>
  </body>
</html>

--------------RxXukmybidVLR5d4O2xu8iTv--
