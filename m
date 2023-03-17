Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B699B6BF369
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 22:01:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pdc4P4lgBz3chb
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 08:01:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.170; helo=mail-il1-f170.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pdc413sY2z2yV5;
	Sat, 18 Mar 2023 08:01:05 +1100 (AEDT)
Received: by mail-il1-f170.google.com with SMTP id l15so1853885ilv.4;
        Fri, 17 Mar 2023 14:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679086863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9EiAA4lskfU5fZwDEEjXMLNpA6IiIed6Ih+9/z1fuw=;
        b=cspWpuegp30BG+nrLAVKvqXp/+ETLMeDLHyoJjgvtnVrW4xaRGlZSFv4iU6M3WRhSP
         CW+PjZKxIg75B4mEH2f5vxAuvF5Pc7D58cex3lXtE9TwZ5HlZaFLuYFg3B4uxP3O0guZ
         isew3NqcPAZpd4Kq0jqhvqkMPDWEVBn5yvhd5423grc6wzvxdE2zJyYbnkGJt58LqMCb
         L5n1J0yw3/YkmMJy99HI8y4n2X+ZhXo633uGmWOBRb8W59FDelyGI+GsYbI/l7K8S9bG
         PrqkWeGF2IVyHofZ/lgfAd0E3x4HcjgSb+o5MXJ2U/mslOhz9nA8vMRL0exSAJLDPCW7
         XYjg==
X-Gm-Message-State: AO0yUKUVAzd7Rcsr5mNSTHIMaREkSEx+9QQXn7A9rSEFpsk3u+vvW5wn
	qVW2duWpZ+4i1IdfnrkEvw==
X-Google-Smtp-Source: AK7set+Toby4I08PfKs5Vv4ur/RProzX9zB/qL38RB1Lpcl0LMr7CHYESvkyeKXSl8neA8xDhSDJCg==
X-Received: by 2002:a92:c9d2:0:b0:317:9818:ea49 with SMTP id k18-20020a92c9d2000000b003179818ea49mr35659ilq.2.1679086863038;
        Fri, 17 Mar 2023 14:01:03 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id s20-20020a056e0210d400b003170014ee5bsm881484ilj.21.2023.03.17.14.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:00:57 -0700 (PDT)
Received: (nullmailer pid 2794739 invoked by uid 1000);
	Fri, 17 Mar 2023 21:00:54 -0000
Date: Fri, 17 Mar 2023 16:00:54 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v2 3/5] dmaengine: aspeed: Add AST2600 UART DMA driver
Message-ID: <20230317210054.GA2790192-robh@kernel.org>
References: <20230314021817.30446-1-chiawei_wang@aspeedtech.com>
 <20230314021817.30446-4-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314021817.30446-4-chiawei_wang@aspeedtech.com>
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
Cc: pmenzel@molgen.mpg.de, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org, ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 14, 2023 at 10:18:15AM +0800, Chia-Wei Wang wrote:
> Aspeed AST2600 UART DMA (UDMA) includes 14 channels for the
> DMA transmission and recevie of each UART devices.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  drivers/dma/Kconfig        |   9 +
>  drivers/dma/Makefile       |   1 +
>  drivers/dma/ast2600-udma.c | 528 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 538 insertions(+)
>  create mode 100644 drivers/dma/ast2600-udma.c
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index fb7073fc034f..c35f87dbafd9 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -748,6 +748,15 @@ config XILINX_ZYNQMP_DPDMA
>  	  driver provides the dmaengine required by the DisplayPort subsystem
>  	  display driver.
>  
> +config ASPEED_AST2600_UDMA
> +	bool "Aspeed AST2600 UDMA support"
> +	depends on ARCH_ASPEED

|| COMPILE_TEST

> +	help
> +	  Enable support for Aspeed AST2600 UART DMA. Select this option if you
> +	  have a AST2600 SoC integrated system. The driver provides the UART DMA
> +	  support with the dmaengine subsystem, which can be leveraged by generic
> +	  8250 serial drivers.
> +
>  # driver files
>  source "drivers/dma/bestcomm/Kconfig"
>  
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index a4fd1ce29510..6cbacebcdcab 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -81,6 +81,7 @@ obj-$(CONFIG_XGENE_DMA) += xgene-dma.o
>  obj-$(CONFIG_ST_FDMA) += st_fdma.o
>  obj-$(CONFIG_FSL_DPAA2_QDMA) += fsl-dpaa2-qdma/
>  obj-$(CONFIG_INTEL_LDMA) += lgm/
> +obj-$(CONFIG_ASPEED_AST2600_UDMA) += ast2600-udma.o
>  
>  obj-y += mediatek/
>  obj-y += qcom/
> diff --git a/drivers/dma/ast2600-udma.c b/drivers/dma/ast2600-udma.c
> new file mode 100644
> index 000000000000..ff678724f9d9
> --- /dev/null
> +++ b/drivers/dma/ast2600-udma.c
> @@ -0,0 +1,528 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) ASPEED Technology Inc.
> + */
> +#include <linux/delay.h>
> +#include <linux/bitfield.h>
> +#include <linux/interrupt.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>

> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>

You probably don't need these as you should use platform APIs instead.
