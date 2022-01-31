Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3259A4A3DA3
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 07:29:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnJ7S0BT5z2xXW
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 17:29:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BXvBS5nH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BXvBS5nH; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnJ725G1rz2xtb
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 17:29:01 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id z1so9510398qto.3
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 22:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=REIlHJOZn0g6tgxFq0plQE2R1v5+feMrfJDLFW+n2Cs=;
 b=BXvBS5nHxMFVPlb687ST83NAygX8agAixDBUeFTs339FNJ0R8iLkMpjzW5LAJ6lN9L
 Hq9VH7d1CzWKbMsqzK4Qzwk/hG/90jEHYbRTEGEFCvHPzD5zC/B90nM+9xibGUBWoPv0
 9UEf1VF5JGduTvJuwfW7xtbzPidLNafW72lss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=REIlHJOZn0g6tgxFq0plQE2R1v5+feMrfJDLFW+n2Cs=;
 b=dtWTNT2iSLwdb7ucxGEovBVABgNDqIIY/GQt+SNSSFORWu7vGNTv+Xlm21bsi10lA1
 k39zUzRfmMHPCcrDmQ2bkKp92QD5B3u5+Pif0KifZqcA8uua9DClVRrACbV302nGdpYl
 S+nbAJa0WtBMXPmk90iiGxQLG7wQ0aJTD3gzx/VAzWCUUorYW7JhUoLajHrVELxXa0ut
 JQShbzlGeA01xo0c91Trj2MQqVD+0xDjtM5I9mSNVZtmV5tGwmaPY6nJo8tpV+KlMqvY
 Q49mVUtZc7gawpoda1VgbNJrTm2q7oaugavhrlWepl2kHU5Y34PR0fNcoqIm00Vc64zi
 MrfQ==
X-Gm-Message-State: AOAM5300FIgvG8aTdNhj1isJQYtbWICzo6/2IbM3D30P5Pdqw6NF2tTb
 C91Wpuf/j0oKozG5MY3KENLL3pqdLlXf5jRDN1M=
X-Google-Smtp-Source: ABdhPJzyVxBbZVNDS+ophUQL9qyN29p84IQbsT1xO2e5sS8u0g68DYpsozrNy1eJ4/Abm5r2bdJPZGGNTH9dbTkImRI=
X-Received: by 2002:ac8:7c4c:: with SMTP id o12mr13616012qtv.475.1643610538335; 
 Sun, 30 Jan 2022 22:28:58 -0800 (PST)
MIME-Version: 1.0
References: <20220129143316.2321460-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220129143316.2321460-1-j.neuschaefer@gmx.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jan 2022 06:28:46 +0000
Message-ID: <CACPK8XdE-29O0WWJJXxdxygXCAb95UfQRwHqz11B-+d86tcJ+A@mail.gmail.com>
Subject: Re: [PATCH] soc: nuvoton: Add SoC info driver for WPCM450
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Hector Martin <marcan@marcan.st>,
 Arnd Bergmann <arnd@arndb.de>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 29 Jan 2022 at 14:34, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
> information such as the SoC revision.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>
> The "nuvoton,wpcm450-gcr" compatible string is defined in:
>
>   [PATCH v5 1/9] dt-bindings: arm/npcm: Add binding for global control re=
gisters (GCR)
>   https://lore.kernel.org/lkml/20220129115228.2257310-2-j.neuschaefer@gmx=
.net/
> ---
>  drivers/soc/Kconfig               |  1 +
>  drivers/soc/Makefile              |  1 +
>  drivers/soc/nuvoton/Kconfig       | 11 ++++
>  drivers/soc/nuvoton/Makefile      |  2 +
>  drivers/soc/nuvoton/wpcm450-soc.c | 90 +++++++++++++++++++++++++++++++
>  5 files changed, 105 insertions(+)
>  create mode 100644 drivers/soc/nuvoton/Kconfig
>  create mode 100644 drivers/soc/nuvoton/Makefile
>  create mode 100644 drivers/soc/nuvoton/wpcm450-soc.c
>
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index a8562678c4370..310c7e3a17723 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -13,6 +13,7 @@ source "drivers/soc/imx/Kconfig"
>  source "drivers/soc/ixp4xx/Kconfig"
>  source "drivers/soc/litex/Kconfig"
>  source "drivers/soc/mediatek/Kconfig"
> +source "drivers/soc/nuvoton/Kconfig"
>  source "drivers/soc/qcom/Kconfig"
>  source "drivers/soc/renesas/Kconfig"
>  source "drivers/soc/rockchip/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index adb30c2d4feaa..f02c9b091a513 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -18,6 +18,7 @@ obj-y                         +=3D ixp4xx/
>  obj-$(CONFIG_SOC_XWAY)         +=3D lantiq/
>  obj-$(CONFIG_LITEX_SOC_CONTROLLER) +=3D litex/
>  obj-y                          +=3D mediatek/
> +obj-y                          +=3D nuvoton/
>  obj-y                          +=3D amlogic/
>  obj-y                          +=3D qcom/
>  obj-y                          +=3D renesas/
> diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
> new file mode 100644
> index 0000000000000..50166f37096b7
> --- /dev/null
> +++ b/drivers/soc/nuvoton/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0
> +menuconfig WPCM450_SOC
> +       bool "Nuvoton WPCM450 SoC driver"
> +       default y if ARCH_WPCM450
> +       select SOC_BUS
> +       help
> +         Say Y here to compile the SoC information driver for Nuvoton
> +         WPCM450 SoCs.
> +
> +         This driver provides information such as the SoC model and
> +         revision.
> diff --git a/drivers/soc/nuvoton/Makefile b/drivers/soc/nuvoton/Makefile
> new file mode 100644
> index 0000000000000..e30317b4e8290
> --- /dev/null
> +++ b/drivers/soc/nuvoton/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_WPCM450_SOC)      +=3D wpcm450-soc.o
> diff --git a/drivers/soc/nuvoton/wpcm450-soc.c b/drivers/soc/nuvoton/wpcm=
450-soc.c
> new file mode 100644
> index 0000000000000..e5723d6c933bc
> --- /dev/null
> +++ b/drivers/soc/nuvoton/wpcm450-soc.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton WPCM450 SoC Identification
> + *
> + * Copyright (C) 2021 Jonathan Neusch=C3=A4fer
> + */
> +
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/sys_soc.h>
> +#include <linux/slab.h>
> +
> +#define GCR_PDID       0
> +#define PDID_CHIP(x)   ((x) & 0x00ffffff)
> +#define CHIP_WPCM450   0x926450
> +#define PDID_REV(x)    ((x) >> 24)
> +
> +struct revision {
> +       u8 number;
> +       const char *name;
> +};
> +
> +const struct revision revisions[] __initconst =3D {
> +       { 0x00, "Z1" },
> +       { 0x03, "Z2" },
> +       { 0x04, "Z21" },
> +       { 0x08, "A1" },
> +       { 0x09, "A2" },
> +       { 0x0a, "A3" },
> +       {}
> +};
> +
> +static const char * __init get_revision(u8 rev)
> +{
> +       int i;
> +
> +       for (i =3D 0; revisions[i].name; i++)
> +               if (revisions[i].number =3D=3D rev)
> +                       return revisions[i].name;
> +       return NULL;
> +}
> +
> +static int __init wpcm450_soc_init(void)
> +{
> +       struct soc_device_attribute *attr;
> +       struct soc_device *soc;
> +       const char *revision;
> +       struct regmap *gcr;
> +       u32 pdid;
> +       int ret;
> +
> +       if (!of_machine_is_compatible("nuvoton,wpcm450"))
> +               return 0;
> +
> +       gcr =3D syscon_regmap_lookup_by_compatible("nuvoton,wpcm450-gcr")=
;
> +       if (IS_ERR(gcr))
> +               return PTR_ERR(gcr);
> +       ret =3D regmap_read(gcr, GCR_PDID, &pdid);
> +       if (ret)
> +               return ret;
> +
> +       if (PDID_CHIP(pdid) !=3D CHIP_WPCM450) {
> +               pr_warn("Unknown chip ID in GCR.PDID: 0x%06x\n", PDID_CHI=
P(pdid));
> +               return -ENODEV;
> +       }
> +
> +       revision =3D get_revision(PDID_REV(pdid));
> +       if (!revision) {
> +               pr_warn("Unknown chip revision in GCR.PDID: 0x%02x\n", PD=
ID_REV(pdid));
> +               return -ENODEV;
> +       }
> +
> +       attr =3D kzalloc(sizeof(*attr), GFP_KERNEL);
> +       if (!attr)
> +               return -ENOMEM;
> +
> +       attr->family =3D "Nuvoton NPCM";
> +       attr->soc_id =3D "WPCM450";
> +       attr->revision =3D revision;
> +       soc =3D soc_device_register(attr);
> +       if (IS_ERR(soc)) {
> +               kfree(attr);
> +               pr_warn("Could not register SoC device\n");
> +               return PTR_ERR(soc);
> +       }
> +
> +       return 0;
> +}
> +device_initcall(wpcm450_soc_init);
> --
> 2.34.1
>
