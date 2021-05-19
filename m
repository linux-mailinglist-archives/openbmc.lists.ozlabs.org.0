Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0997C38998D
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 01:00:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlpHM6hkqz301p
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 09:00:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Dvq29lHa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Dvq29lHa; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlpGw6Hd1z2xg1;
 Thu, 20 May 2021 08:59:50 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id o27so14428700qkj.9;
 Wed, 19 May 2021 15:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FL4A84RnGL9eXsLReJXIYBVZb+CRyoUol9pEHr5O5qY=;
 b=Dvq29lHaaHrwBS8AFWZSoJCdqQsSj5w0bo8XghtBLAZTBjrQf4RXb+AY3jd8EtUP94
 KVMw8BwVB+j9N56QZ2bUXRwSkx94v24XrW5t9yTBPEk2Eg1E/sjej0T/YJ+UN8/hVyf2
 eZl8fwg+VCSsuIKKXAIvKGBmJaQlJRJsra5j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FL4A84RnGL9eXsLReJXIYBVZb+CRyoUol9pEHr5O5qY=;
 b=W0vdeyx0+BoRro5bzDD3yiankk6CpXqrkcaj5d+slEx3yWNXRjtFrW08eJQfL+7ohp
 fS0SWs4r4OK0upHOn1LeFH//uB7krW2Lp6dmXfeFucS96Taq9kH8yRYqeMa2EF3d2ZYA
 9fvDDycBLzqK7We7zR+nmJ5U4fXFvDtOK1XioAq5Pg+fN+yWo2Zz7jhQcIjy+K4rRm96
 R/Iw6JJC5LJu1W6AAwTAuL7Gt3m+UTrcGt7juNb0Mj+t+YiWPtoberfd3mPq9XDMxAC0
 FHhpJTrzlIu3wrRYlz1zgTSOIA9qeqlKUpbaV6v0Tc/qnxO3siE+aP5rBAKjynhGxJyk
 Sdkg==
X-Gm-Message-State: AOAM5335g1SZWgeVVo7bQLU/dHewOB4icM01OZaWvtDWyJpk6BT5Xq5D
 aZMMZKRyLW4AIys5XBlUXJGctQEqK/55fHLIjw4=
X-Google-Smtp-Source: ABdhPJySEJL2SSIhxhurMKhfYZmnqZskBqtE2XkdoVEbVmUuDFR04avlb3/LIVd+WzCgLE4Ok6LLOCaBZg/S+B/hSKw=
X-Received: by 2002:a37:424c:: with SMTP id p73mr1926220qka.465.1621465186642; 
 Wed, 19 May 2021 15:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-2-jamin_lin@aspeedtech.com>
In-Reply-To: <20210519080436.18975-2-jamin_lin@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 May 2021 22:59:34 +0000
Message-ID: <CACPK8XdNXiGMQZOtsfMMK+w_PSvO20XT8B9MG+rGhdjYoV4ZuQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of AST2600
To: Jamin Lin <jamin_lin@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Rayn Chen <rayn_chen@aspeedtech.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 steven_lee@aspeedtech.com, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 19 May 2021 at 08:05, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>
> The register definition between AST2600 A2 and A3 is different.
> This patch avoid new registers definition of AST2600 to use
> this driver. We will submit the path for the new registers
> definition of AST2600.

The AST2600 v9 datasheet says that bit 2 selects between old and new
register sets, and that the old register set is the default.

Has the default changed for the A3?, and the datasheet is incorrect?

Does the A3 still support the old register set?

>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 724bf30600d6..007309077d9f 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -19,14 +19,20 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>
> +/* I2C Global Registers */
> +/* 0x0c : I2CG Global Control Register (AST2500)  */
> +#define ASPEED_I2CG_GLOBAL_CTRL_REG                    0x0c
> +
>  /* I2C Register */
>  #define ASPEED_I2C_FUN_CTRL_REG                                0x00
>  #define ASPEED_I2C_AC_TIMING_REG1                      0x04
> @@ -973,6 +979,22 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>         struct resource *res;
>         int irq, ret;
>
> +       if (of_device_is_compatible(pdev->dev.of_node,
> +                                   "aspeed,ast2600-i2c-bus")) {
> +               u32 global_ctrl;
> +               struct regmap *gr_regmap;
> +
> +               gr_regmap = syscon_regmap_lookup_by_compatible("aspeed,ast2600-i2c-global");
> +
> +               if (IS_ERR(gr_regmap)) {
> +                       ret = PTR_ERR(gr_regmap);
> +               } else {
> +                       regmap_read(gr_regmap, ASPEED_I2CG_GLOBAL_CTRL_REG, &global_ctrl);
> +                       if (global_ctrl & BIT(2))
> +                               return -EIO;
> +               }
> +       }
> +
>         bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
>         if (!bus)
>                 return -ENOMEM;
> --
> 2.17.1
>
