Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DAD61775D
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 08:12:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2w1t4LM5z3cHZ
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 18:12:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JFFZgnhj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JFFZgnhj;
	dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2w0X2c9nz3cF0
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 18:11:23 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id x21so1105689ljg.10
        for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2022 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbwe7mRmEc0IICjEtCiWf5KXhVSnPQbj9lS4IvvBTuw=;
        b=JFFZgnhjHouLTyfuza5wfxzwGlfCYEVN7rjNOd6ZoFTjiRp/FgJZBa4AbBKWQms1de
         Uy79qciVd2BhrAD3o/fbOgA4iGAcgdY+zXejuoAca01/TRJN8pk3tEfChiaqA7NuDj0j
         b6l6o70A2JYL6D7GSSzeDMgSCJnigCEkza8uhHDshrPQK3EXo1t1ccCI/Y510aAZVspH
         1HYkaejIC/v42RcLSi+DWT60bSsZ3TExVYLP8DWb+hzIRgwMoAaxVdzH3y9R2Np39cKq
         ElyMfxpwUe25RHs3mI26SYh76bwuUn2qO71iR/ROSjYFVj4TKlo2X9itroQ8eQXshHB3
         4B+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbwe7mRmEc0IICjEtCiWf5KXhVSnPQbj9lS4IvvBTuw=;
        b=ksTugIRzpaPff8Y62b1O7bJtgpSbcGKl70icHhaYIPPx4+7rYZrGwQK7i+NKSMGNMi
         dpoZmopkO9e+9YVlRA3OLvsbDOBCJQaXcY4VDNeHlAoHO7czL8Z16PX9SNR1kyB6B6wc
         GLmbBsxR6ZKJ+hfBQNk94j0R7K/9eZnFMujXEBsuA39NTTLTQ0Rp085+hH2lraCSBaQO
         6ZsV8Ra7W37IkVfaJmbmQf11/wGIv/ImDTjcqb1mKdgg/GhfchyN3Au3rrrKtyENZjXf
         fEinKrro3BZIcdJDrlaOxHGCWGHZ+Y5SN3yrrODOjnvi+f/NCcuMHbwTOJFp7Vq2nGhy
         gxCA==
X-Gm-Message-State: ACrzQf1mWtaBGZWa33A30ZAEbWOn2gjivSM9HBZNAPrE38F5yaqEA6hg
	5mB+XFc7lTNKXqYzKhRXT8J7SahQjhwoTGyfRWg=
X-Google-Smtp-Source: AMsMyM4xn2uAofS0THbsX48hOPVp3zqwlN7+OaswZbmWZj4O2NaZoftQ4Tb4W7KC3f5FOw+hPaYYR3HrpmK6qrV1nXk=
X-Received: by 2002:a05:651c:54b:b0:277:2f02:8da8 with SMTP id
 q11-20020a05651c054b00b002772f028da8mr11437603ljp.73.1667459479937; Thu, 03
 Nov 2022 00:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221031223926.241641-1-j.neuschaefer@gmx.net> <CACPK8Xfa=SPaYogqfUpCG61J7U-Z8pE2Oycicd_D=4vJsZcaSw@mail.gmail.com>
In-Reply-To: <CACPK8Xfa=SPaYogqfUpCG61J7U-Z8pE2Oycicd_D=4vJsZcaSw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 3 Nov 2022 09:11:08 +0200
Message-ID: <CAP6Zq1iHOm1sQTHshmVobzy9yX_REt6OL5qyFz+R77vYw=7yBg@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND] soc: nuvoton: Add SoC info driver for WPCM450
To: Joel Stanley <joel@jms.id.au>
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Paul Menzel <pmenzel@molgen.mpg.de>, Brian Norris <briannorris@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, openbmc@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Conor Dooley <conor.dooley@microchip.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

Thanks for your patch.

On Thu, 3 Nov 2022 at 01:09, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 31 Oct 2022 at 22:40, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx=
.net> wrote:
> >
> > Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
> > information such as the SoC revision.
> >
> > Usage example:
> >
> >   # grep . /sys/devices/soc0/*
> >   /sys/devices/soc0/family:Nuvoton NPCM
> >   /sys/devices/soc0/revision:A3
> >   /sys/devices/soc0/soc_id:WPCM450
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > ---
> > v5:
> > - Change Kconfig option from bool to tristate
> >
> > v4:
> > - rebase on 5.19-rc1
> >
> > v3:
> > - Declare revisions array as static
> > - Change get_revision parameter to `unsigned int`
> > - Add Paul's R-b tag
> > - Add usage example
> > - Sort includes
> >
> > v2:
> > - https://lore.kernel.org/lkml/20220409173319.2491196-1-j.neuschaefer@g=
mx.net/
> > - Add R-b tag
> > - rebase on 5.18-rc1
> >
> > v1:
> > - https://lore.kernel.org/lkml/20220129143316.2321460-1-j.neuschaefer@g=
mx.net/
> > ---
> >  drivers/soc/Kconfig               |   1 +
> >  drivers/soc/Makefile              |   1 +
> >  drivers/soc/nuvoton/Kconfig       |  11 +++
> >  drivers/soc/nuvoton/Makefile      |   2 +
> >  drivers/soc/nuvoton/wpcm450-soc.c | 109 ++++++++++++++++++++++++++++++
> >  5 files changed, 124 insertions(+)
> >  create mode 100644 drivers/soc/nuvoton/Kconfig
> >  create mode 100644 drivers/soc/nuvoton/Makefile
> >  create mode 100644 drivers/soc/nuvoton/wpcm450-soc.c
> >
> > diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> > index 86ccf5970bc1b..cca3dfa5c6aea 100644
> > --- a/drivers/soc/Kconfig
> > +++ b/drivers/soc/Kconfig
> > @@ -14,6 +14,7 @@ source "drivers/soc/ixp4xx/Kconfig"
> >  source "drivers/soc/litex/Kconfig"
> >  source "drivers/soc/mediatek/Kconfig"
> >  source "drivers/soc/microchip/Kconfig"
> > +source "drivers/soc/nuvoton/Kconfig"
> >  source "drivers/soc/pxa/Kconfig"
> >  source "drivers/soc/qcom/Kconfig"
> >  source "drivers/soc/renesas/Kconfig"
> > diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> > index 919716e0e7001..b9eb3c75e551a 100644
> > --- a/drivers/soc/Makefile
> > +++ b/drivers/soc/Makefile
> > @@ -19,6 +19,7 @@ obj-$(CONFIG_SOC_XWAY)                +=3D lantiq/
> >  obj-$(CONFIG_LITEX_SOC_CONTROLLER) +=3D litex/
> >  obj-y                          +=3D mediatek/
> >  obj-y                          +=3D microchip/
> > +obj-y                          +=3D nuvoton/
> >  obj-y                          +=3D pxa/
> >  obj-y                          +=3D amlogic/
> >  obj-y                          +=3D qcom/
> > diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
> > new file mode 100644
> > index 0000000000000..df46182088ec2
> > --- /dev/null
> > +++ b/drivers/soc/nuvoton/Kconfig
> > @@ -0,0 +1,11 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +menuconfig WPCM450_SOC
> > +       tristate "Nuvoton WPCM450 SoC driver"
> > +       default y if ARCH_WPCM450
> > +       select SOC_BUS
>
> Sorry for not noticing this earlier. This is a bit confusing. If we
> have a menu option, the soc driver should appear under it. Or we could
> do without the menu all together, as there's only one driver so far.
>
> We also should select REGMAP, as you're using it, and hide the option
> behind ARCH_WPCM450 || COMPILE_TEST.
>
> How about this:
>
> if ARCH_WPCM450 || COMPILE_TEST
These days we working on LPC BPC driver for NPCM7xx and NPCM8xx that
will be placed in nuvoton soc folder.
we will use:

if ARCH_NPCM || COMPILE_TEST

menu "NPCM SoC drivers"

Maybe you should remove
if ARCH_WPCM450 || COMPILE_TEST

and add ARCH_WPCM450 dependency in the WPCM450_SOCINFO driver configuration=
.

>
> config WPCM450_SOCINFO
>         tristate "Nuvoton WPCM450 SoC driver"
>         default y if ARCH_WPCM450
>         select SOC_BUS
>         select REGMAP
>         help
>           Say Y here to compile the SoC information driver for Nuvoton
>           WPCM450 SoCs.
>
>           This driver provides information such as the SoC model and
>           revision.
>
> endif
>
>
>
>
> > +       help
> > +         Say Y here to compile the SoC information driver for Nuvoton
> > +         WPCM450 SoCs.
> > +
> > +         This driver provides information such as the SoC model and
> > +         revision.
> > diff --git a/drivers/soc/nuvoton/Makefile b/drivers/soc/nuvoton/Makefil=
e
> > new file mode 100644
> > index 0000000000000..e30317b4e8290
> > --- /dev/null
> > +++ b/drivers/soc/nuvoton/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_WPCM450_SOC)      +=3D wpcm450-soc.o
> > diff --git a/drivers/soc/nuvoton/wpcm450-soc.c b/drivers/soc/nuvoton/wp=
cm450-soc.c
> > new file mode 100644
> > index 0000000000000..c5e0d11c383b1
> > --- /dev/null
> > +++ b/drivers/soc/nuvoton/wpcm450-soc.c
> > @@ -0,0 +1,109 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton WPCM450 SoC Identification
> > + *
> > + * Copyright (C) 2022 Jonathan Neusch=C3=A4fer
> > + */
> > +
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/sys_soc.h>
> > +
> > +#define GCR_PDID       0
> > +#define PDID_CHIP(x)   ((x) & 0x00ffffff)
> > +#define CHIP_WPCM450   0x926450
> > +#define PDID_REV(x)    ((x) >> 24)
> > +
> > +struct revision {
> > +       u8 number;
> > +       const char *name;
> > +};
> > +
> > +static const struct revision revisions[] __initconst =3D {
> > +       { 0x00, "Z1" },
> > +       { 0x03, "Z2" },
> > +       { 0x04, "Z21" },
> > +       { 0x08, "A1" },
> > +       { 0x09, "A2" },
> > +       { 0x0a, "A3" },
> > +       {}
> > +};
> > +
> > +static const char * __init get_revision(unsigned int rev)
> > +{
> > +       int i;
> > +
> > +       for (i =3D 0; revisions[i].name; i++)
> > +               if (revisions[i].number =3D=3D rev)
> > +                       return revisions[i].name;
> > +       return NULL;
> > +}
> > +
> > +static struct soc_device_attribute *wpcm450_attr;
> > +static struct soc_device *wpcm450_soc;
> > +
> > +static int __init wpcm450_soc_init(void)
> > +{
> > +       struct soc_device_attribute *attr;
> > +       struct soc_device *soc;
> > +       const char *revision;
> > +       struct regmap *gcr;
> > +       u32 pdid;
> > +       int ret;
> > +
> > +       if (!of_machine_is_compatible("nuvoton,wpcm450"))
> > +               return 0;
> > +
> > +       gcr =3D syscon_regmap_lookup_by_compatible("nuvoton,wpcm450-gcr=
");
> > +       if (IS_ERR(gcr))
> > +               return PTR_ERR(gcr);
> > +       ret =3D regmap_read(gcr, GCR_PDID, &pdid);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (PDID_CHIP(pdid) !=3D CHIP_WPCM450) {
> > +               pr_warn("Unknown chip ID in GCR.PDID: 0x%06x\n", PDID_C=
HIP(pdid));
> > +               return -ENODEV;
> > +       }
> > +
> > +       revision =3D get_revision(PDID_REV(pdid));
> > +       if (!revision) {
> > +               pr_warn("Unknown chip revision in GCR.PDID: 0x%02x\n", =
PDID_REV(pdid));
> > +               return -ENODEV;
> > +       }
> > +
> > +       attr =3D kzalloc(sizeof(*attr), GFP_KERNEL);
> > +       if (!attr)
> > +               return -ENOMEM;
> > +
> > +       attr->family =3D "Nuvoton NPCM";
> > +       attr->soc_id =3D "WPCM450";
> > +       attr->revision =3D revision;
> > +       soc =3D soc_device_register(attr);
> > +       if (IS_ERR(soc)) {
> > +               kfree(attr);
> > +               pr_warn("Could not register SoC device\n");
> > +               return PTR_ERR(soc);
> > +       }
> > +
> > +       wpcm450_soc =3D soc;
> > +       wpcm450_attr =3D attr;
> > +       return 0;
> > +}
> > +module_init(wpcm450_soc_init);
> > +
> > +static void __exit wpcm450_soc_exit(void)
> > +{
> > +       if (wpcm450_soc) {
> > +               soc_device_unregister(wpcm450_soc);
> > +               wpcm450_soc =3D NULL;
> > +               kfree(wpcm450_attr);
> > +       }
> > +}
> > +module_exit(wpcm450_soc_exit);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Jonathan Neusch=C3=A4fer");
> > +MODULE_DESCRIPTION("Nuvoton WPCM450 SoC Identification driver");
> > --
> > 2.35.1
> >

Thanks,

Tomer
