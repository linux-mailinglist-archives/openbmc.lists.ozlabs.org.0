Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 731955003DF
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 03:55:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kf2c63d2Nz3bXG
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 11:55:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f4QxCowR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=f4QxCowR; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kf2bd4k6Xz2xnN
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 11:55:23 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id x33so6675194lfu.1
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 18:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3CrGv+n/k1zvrmI/rhCQJPnr9zD2FbbSX8R9O7KUr2k=;
 b=f4QxCowRP2tmoVmWK9hztYtDhkXnKfbbDyNME9tXeFd0vmUMUIO3VL+k2ehPxkzmIW
 MB79H2BnoR2LWTtLpvKQdTyZpHQHQ72/TIE14K5W28jGATqFqtBQo2ehqJSMNqbnSkrD
 IoTjf0QMDwCGgvAm4wMeLxzihVV7F0b5s3Somy3tztqxD1MKNziBUbiWlia/TPJlwfwU
 mBdYnlB5v1UkPC+7oe2u97ldYkZKp4Xdy/wP1nMb2b75trdLO+VDl+ZjZPCZ/rgUH3Ze
 x2JwzGYCJMNxnEOVxf7SBKnk5JNWBXAB+OL1VQeTKRz1vs+WGCb7DVdWdq3lnEL3Fc1o
 HNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3CrGv+n/k1zvrmI/rhCQJPnr9zD2FbbSX8R9O7KUr2k=;
 b=NOTDK56+0z8CXWgSkJve+cgsRCgp3E32gN30WsNQG9w6QE46tr+eP78vyyc2OtZgLX
 vopcGFDWkWOY3Z4NN10VNgi1LYlgCgWOOtic0BSPesjLdZY9YfHXDFJCRlcZpEA49kSv
 3z+HYQF9kouxR5uV5nCfBgASwopDEPlC6sFe3z4sotzpxB2UswhMCB/M+0xU2KsJqU3+
 QhiMkESaw6uM0xQBX7HBkNp4Kky8HiKU0Poyl5NWPNH1jrUcKNoM9OpKsWpISY9ju4QD
 QB3m4fp+p7GPWLYGYZuF/Nm8g3/7V+SugP4IqJ+zuyksN+1q9FEIUQcUJ/bK59O7eTBv
 MK6g==
X-Gm-Message-State: AOAM530Jzv4LmTDXwDquyedsBShAqIhK3ngrNHDFW+2YeR1tsCsG+ixx
 zSl1FHExz/9wkhk/JVcoZtDaWbYcwX9mTUcvJnI=
X-Google-Smtp-Source: ABdhPJwcR/Pnj/2njjXWPQeeRn4MU1ZWr3KuwsSbEBbOxXjpPHQTT7L6mEMPeRCt7AhdX0RId37JsfKOS9j8/8WYgQM=
X-Received: by 2002:a05:6512:3191:b0:45d:cb50:f575 with SMTP id
 i17-20020a056512319100b0045dcb50f575mr391273lfe.48.1649901317591; Wed, 13 Apr
 2022 18:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-4-ctcchien@nuvoton.com>
 <a06441fc-85cf-9386-e362-4a90e855aa19@molgen.mpg.de>
In-Reply-To: <a06441fc-85cf-9386-e362-4a90e855aa19@molgen.mpg.de>
From: Medad Young <medadyoung@gmail.com>
Date: Thu, 14 Apr 2022 09:55:05 +0800
Message-ID: <CAHpyw9fQVbS1Cpv0ULQc2=vK8LsG6n7tgP+J9AboUupDAPT27Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] EDAC: nuvoton: Add NPCM memory controller driver
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,



Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2022=E5=B9=B44=E6=9C=889=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=883:08=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Medad,
>
>
> Am 22.03.22 um 04:01 schrieb Medad CChien:
> > Add support for Nuvoton NPCM SoC.
>
> Please also mention *memory controller* here.
>
> Please also mention the datasheet name, revision, and section here.
>
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
>
> [=E2=80=A6]
>
> Hmm, you add new code here, right? Is that report for an earlier patch
> version? Please make that more clear.

OK

>
> [=E2=80=A6]
>
> On what device did you test it? Maybe paste the new log messages, and
> also give an example how to force an ECC error, so it=E2=80=99s easy to t=
est, if
> the driver works.

OK, I  will provide an example and paste the result log

>
> > ---
> >   drivers/edac/Kconfig     |   9 +
> >   drivers/edac/Makefile    |   1 +
> >   drivers/edac/npcm_edac.c | 706 ++++++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 716 insertions(+)
> >   create mode 100644 drivers/edac/npcm_edac.c
> >
> > diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> > index 58ab63642e72..bdca55fa6022 100644
> > --- a/drivers/edac/Kconfig
> > +++ b/drivers/edac/Kconfig
> > @@ -539,4 +539,13 @@ config EDAC_DMC520
> >         Support for error detection and correction on the
> >         SoCs with ARM DMC-520 DRAM controller.
> >
> > +config EDAC_NPCM
> > +     tristate "Nuvoton NPCM DDR Memory Controller"
> > +     depends on (ARCH_NPCM || COMPILE_TEST)
> > +     help
> > +       Support for error detection and correction on the
> > +       Nuvoton NPCM DDR memory controller.
>
> Some words fit on the line above.
>
> > +       First, ECC must be configured in the BootBlock header. Then, th=
is driver
>
> Again, *bootblock* does not seem to be a common term in the Linux
> kernel. Did you meant bootloader?

bootblock is a spcial bootloader before u-boot on Nuvoton's BMC platform.

>
> > +       will expose error counters via the EDAC kernel framework.
> > +
> >   endif # EDAC
> > diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
> > index 2d1641a27a28..db3c59d3ad84 100644
> > --- a/drivers/edac/Makefile
> > +++ b/drivers/edac/Makefile
> > @@ -84,3 +84,4 @@ obj-$(CONFIG_EDAC_QCOM)                     +=3D qcom=
_edac.o
> >   obj-$(CONFIG_EDAC_ASPEED)           +=3D aspeed_edac.o
> >   obj-$(CONFIG_EDAC_BLUEFIELD)                +=3D bluefield_edac.o
> >   obj-$(CONFIG_EDAC_DMC520)           +=3D dmc520_edac.o
> > +obj-$(CONFIG_EDAC_NPCM)                      +=3D npcm_edac.o
> > diff --git a/drivers/edac/npcm_edac.c b/drivers/edac/npcm_edac.c
> > new file mode 100644
> > index 000000000000..9dd05bec0b7f
> > --- /dev/null
> > +++ b/drivers/edac/npcm_edac.c
> > @@ -0,0 +1,706 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2022 Nuvoton Technology corporation.
>
> Dot/period at the end not needed.

OK

>
> > +
> > +#include <linux/delay.h>
> > +#include <linux/of_device.h>
> > +
> > +#include "edac_module.h"
> > +
> > +#define NPCM_EDAC_MOD_NAME "npcm-edac"
> > +#define FORCED_ECC_ERR_EVENT_SUPPORT BIT(1)
> > +#define EDAC_MSG_SIZE                  256
> > +/* Granularity of reported error in bytes */
> > +#define NPCM_EDAC_ERR_GRAIN          1
> > +
> > +#define MEM_TYPE_DDR4                        0xA
> > +
> > +#define NPCM8XX_CHIP                 0x800
> > +#define NPCM7XX_CHIP                 0x700
>
> Sort other way around?

OK, I will reorder these two lines


>
> > +
> > +/* Control register width definitions */
> > +#define WDTH_16                              (2)
> > +#define WDTH_32                              (1)
> > +#define WDTH_64                              (0)
> > +#define CTL_MEM_MAX_WIDTH_MASK               GENMASK(4, 0)
> > +#define CTL_REG_WIDTH_SHIFT          (32)
> > +#define XOR_CHECK_BIT_SPLIT_WIDTH            (16)
> > +#define CTL_CONTROLLER_BUSY_FLAG     BIT(0)
> > +#define NPCM_ECC_CTL_FORCE_WC                BIT(8)
> > +#define NPCM_ECC_CTL_AUTO_WRITEBACK_EN       BIT(24)
> > +#define NPCM_ECC_CTL_XOR_BITS_MASK           GENMASK(23, 16)
> > +#define NPCM_ECC_CTL_MTYPE_MASK                      GENMASK(11, 8)
> > +#define NPCM_ECC_CTL_GLOBAL_INT_DISABLE      BIT(31)
> > +
> > +#ifdef CONFIG_EDAC_DEBUG
>
> Instead of doing this in the preprocessor, can you always define the
> values, and in the code, do all the checks in C code?
>
>      if IS_ENABLED(CONFIG_EDAC_DEBUG)
>
> > +
> > +/* Syndrome values */
> > +#define ECC_DOUBLE_MULTI_ERR_SYND    0x03
> > +
> > +static char data_synd[] =3D {
> > +                     0xf4, 0xf1, 0xec, 0xea, 0xe9, 0xe6, 0xe5, 0xe3,
> > +                     0xdc, 0xda, 0xd9, 0xd6, 0xd5, 0xd3, 0xce, 0xcb,
> > +                     0xb5, 0xb0, 0xad, 0xab, 0xa8, 0xa7, 0xa4, 0xa2,
> > +                     0x9d, 0x9b, 0x98, 0x97, 0x94, 0x92, 0x8f, 0x8a,
> > +                     0x75, 0x70, 0x6d, 0x6b, 0x68, 0x67, 0x64, 0x62,
> > +                     0x5e, 0x5b, 0x58, 0x57, 0x54, 0x52, 0x4f, 0x4a,
> > +                     0x34, 0x31, 0x2c, 0x2a, 0x29, 0x26, 0x25, 0x23,
> > +                     0x1c, 0x1a, 0x19, 0x16, 0x15, 0x13, 0x0e, 0x0b
> > +               };
> > +
> > +static char check_synd[] =3D {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40=
, 0x80};
> > +#endif
> > +
> > +struct npcm_edac_platform_data {
> > +     /* force ECC event */
> > +     u32 ip_features;
> > +     u32 ddr_ctl_controller_busy_reg;
> > +     u32 ecc_ctl_xor_check_bits_reg;
> > +
> > +     u32 chip;
> > +
> > +     /* DDR4 Controller Registers */
> > +     u32 ddr_ctl_mem_type_reg;
> > +     u32 ddr_ctl_mem_width_reg;
> > +
> > +     u32 ecc_ctl_en_reg;
> > +     u32 ecc_ctl_int_mask;
> > +     u32 ecc_ctl_int_status;
> > +     u32 ecc_ctl_int_ack;
> > +     u32 ecc_ctl_int_mask_master;
> > +     u32 ecc_ctl_int_mask_ecc;
> > +
> > +     u32 ecc_sig_ecc_c_addr_l;
> > +     u32 ecc_sig_ecc_c_addr_h;
> > +     u32 ecc_sig_ecc_c_data_l;
> > +     u32 ecc_sig_ecc_c_data_h;
> > +     u32 ecc_sig_ecc_c_id;
> > +     u32 ecc_sig_ecc_c_synd;
> > +
> > +     u32 ecc_sig_ecc_u_addr_l;
> > +     u32 ecc_sig_ecc_u_addr_h;
> > +     u32 ecc_sig_ecc_u_data_l;
> > +     u32 ecc_sig_ecc_u_data_h;
> > +     u32 ecc_sig_ecc_u_id;
> > +     u32 ecc_sig_ecc_u_synd;
> > +
> > +     /* MASK */
> > +     u32 ecc_ctl_ecc_enable_mask;
> > +     u32 ecc_ctl_en_int_master_mask;
> > +     u32 ecc_ctl_en_int_ecc_mask;
> > +
> > +     /* ECC IRQ Macros */
> > +     u32 ecc_int_ce_event;
> > +     u32 ecc_int_second_ce_event;
> > +     u32 ecc_int_ue_event;
> > +     u32 ecc_int_second_ue_event;
> > +     u32 ecc_int_ce_ue_mask;
> > +     u32 ecc_ce_intr_mask;
> > +     u32 ecc_ue_intr_mask;
> > +
> > +     /* ECC Signature Macros */
> > +     u32 ecc_sig_ecc_c_id_shift;
> > +     u32 ecc_sig_ecc_c_synd_shift;
> > +     u32 ecc_sig_ecc_c_addr_h_mask;
> > +     u32 ecc_sig_ecc_c_id_mask;
> > +     u32 ecc_sig_ecc_c_synd_mask;
> > +
> > +     u32 ecc_sig_ecc_u_id_shift;
> > +     u32 ecc_sig_ecc_u_synd_shift;
> > +     u32 ecc_sig_ecc_u_addr_h_mask;
> > +     u32 ecc_sig_ecc_u_id_mask;
> > +     u32 ecc_sig_ecc_u_synd_mask;
> > +};
> > +
> > +struct priv_data {
> > +     void __iomem *reg;
> > +     u32 ce_cnt;
> > +     u32 ue_cnt;
> > +     char message[EDAC_MSG_SIZE];
> > +     const struct npcm_edac_platform_data *npcm_chip;
> > +};
> > +
> > +#ifdef CONFIG_EDAC_DEBUG
> > +static void init_mem_layout(struct mem_ctl_info *mci)
> > +{
> > +     struct priv_data *priv =3D mci->pvt_info;
> > +     const struct npcm_edac_platform_data *npcm_chip =3D priv->npcm_ch=
ip;
> > +     struct csrow_info *csi;
> > +     struct dimm_info *dimm;
> > +     struct sysinfo inf;
>
> Maybe name it at least info, so it can=E2=80=99t be confused with infinit=
y.

OK

>
> > +     enum mem_type mtype;
> > +     u32 val, width;
> > +     u32 size, row;
>
> Please use native types, for example `unsigned long` for `size`.

OK

>
> > +     u8 j;
>
> Ditto. For smaller data types than the native type, the compiler
> actually needs to create more instructions.

OK

>
> > +
> > +     dimm =3D edac_get_dimm(mci, 0, 0, 0);
> > +     if (!dimm) {
> > +             si_meminfo(&inf);
> > +             for (row =3D 0; row < mci->nr_csrows; row++) {
> > +                     csi =3D mci->csrows[row];
> > +                     size =3D inf.totalram * inf.mem_unit;
>
> Can be moved outside the loop?

Yes

>
> > +
> > +                     for (j =3D 0; j < csi->nr_channels; j++) {
> > +                             dimm            =3D csi->channels[j]->dim=
m;
> > +                             dimm->edac_mode =3D EDAC_FLAG_SECDED;
> > +                             /* Get memory type by reading hw register=
s*/
> > +                             val =3D readl(priv->reg + npcm_chip->ddr_=
ctl_mem_type_reg);
> > +                             mtype =3D val & NPCM_ECC_CTL_MTYPE_MASK;
> > +
> > +                             if (mtype =3D=3D MEM_TYPE_DDR4)
> > +                                     dimm->mtype =3D MEM_DDR4;
> > +                             else
> > +                                     dimm->mtype =3D MEM_EMPTY;
>
> Use ternary operator?
>
>      dimm-mtype =3D (mtype =3D=3D MEM_TYPE_DDR4) ? MEM_DDR4 : MEM_EMPTY;

OK,thanks

>
> > +
> > +                             /*Get EDAC devtype width for the current =
mc*/
> > +                             width =3D readl(priv->reg + npcm_chip->dd=
r_ctl_mem_width_reg)
> > +                                           & CTL_MEM_MAX_WIDTH_MASK;
> > +                             switch (width) {
> > +                             case WDTH_16:
> > +                                     dimm->dtype  =3D DEV_X2;
>
> Just one space before =3D.

OK

>
> > +                                     break;
> > +                             case WDTH_32:
> > +                                     dimm->dtype  =3D DEV_X4;
> > +                                     break;
> > +                             case WDTH_64:
> > +                                     dimm->dtype  =3D DEV_X8;
> > +                                     break;
> > +                             default:
> > +                                     dimm->dtype =3D DEV_UNKNOWN;
> > +                             }
> > +
> > +                             dimm->nr_pages  =3D (size >> PAGE_SHIFT) =
/
> > +                                     csi->nr_channels;
> > +                             dimm->grain     =3D NPCM_EDAC_ERR_GRAIN;
> > +                     }
> > +             }
> > +     }
> > +}
> > +#endif
> > +
> > +static void handle_ce(struct mem_ctl_info *mci)
>
> The function is not called often, so use `handle_correctable_error()`?
>
> > +{
> > +     struct priv_data *priv =3D mci->pvt_info;
> > +     const struct npcm_edac_platform_data *npcm_chip =3D priv->npcm_ch=
ip;
> > +     u64 err_c_addr =3D 0x0;
>
> size_t

OK

>
> > +     u64 err_c_data =3D 0x0;
> > +     u32 err_c_synd, err_c_id;
> > +     u32 sig_val_l, sig_val_h;
> > +
> > +     sig_val_l =3D readl(priv->reg + npcm_chip->ecc_sig_ecc_c_addr_l);
> > +
> > +     if (npcm_chip->chip =3D=3D NPCM8XX_CHIP)
> > +             sig_val_h =3D (readl(priv->reg + npcm_chip->ecc_sig_ecc_c=
_addr_h) &
> > +                             npcm_chip->ecc_sig_ecc_c_addr_h_mask);
> > +     else
> > +             sig_val_h =3D 0x0;
> > +
> > +     err_c_addr =3D (((err_c_addr | sig_val_h) <<
> > +                             CTL_REG_WIDTH_SHIFT) | sig_val_l);
> > +
> > +     sig_val_l =3D readl(priv->reg + npcm_chip->ecc_sig_ecc_c_data_l);
> > +
> > +     if (npcm_chip->chip =3D=3D NPCM8XX_CHIP)
> > +             sig_val_h =3D readl(priv->reg + npcm_chip->ecc_sig_ecc_c_=
data_h);
> > +     else
> > +             sig_val_h =3D 0x0;
> > +
> > +     err_c_data =3D (((err_c_data | sig_val_h) <<
> > +                             CTL_REG_WIDTH_SHIFT) | sig_val_l);
> > +
> > +     err_c_id =3D ((readl(priv->reg + npcm_chip->ecc_sig_ecc_c_id) &
> > +                             npcm_chip->ecc_sig_ecc_c_id_mask) >>
> > +                             npcm_chip->ecc_sig_ecc_c_id_shift);
> > +
> > +     err_c_synd =3D ((readl(priv->reg + npcm_chip->ecc_sig_ecc_c_synd)=
 &
> > +                             npcm_chip->ecc_sig_ecc_c_synd_mask) >>
> > +                             npcm_chip->ecc_sig_ecc_c_synd_shift);
> > +
> > +     priv->ce_cnt =3D priv->ce_cnt + 1;
>
> Ditto.
>
> > +
> > +     snprintf(priv->message,
> > +              EDAC_MSG_SIZE, "DDR ECC %s: data=3D0x%llx source_id=3D%#=
08x",
> > +              mci->ctl_name, err_c_data, err_c_id);
> > +
> > +     edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
> > +                          1,
> > +                          err_c_addr >> PAGE_SHIFT,
> > +                          err_c_addr & ~PAGE_MASK,
> > +                          err_c_synd, 0, 0, -1,
> > +                          priv->message, "");
> > +}
> > +
> > +static void handle_ue(struct mem_ctl_info *mci)
> > +{
> > +     struct priv_data *priv =3D mci->pvt_info;
> > +     const struct npcm_edac_platform_data *npcm_chip =3D priv->npcm_ch=
ip;
> > +     u64 err_u_addr =3D 0x0;
>
> Why not size_t? No initialization needed?

I will change to size_t
>
> > +     u64 err_u_data =3D 0x0;
> > +     u32 err_u_synd, err_u_id;
> > +     u32 sig_val_l, sig_val_h;
> > +
> > +     sig_val_l =3D readl(priv->reg + npcm_chip->ecc_sig_ecc_u_addr_l);
> > +
> > +     if (npcm_chip->chip =3D=3D NPCM8XX_CHIP)
> > +             sig_val_h =3D (readl(priv->reg + npcm_chip->ecc_sig_ecc_u=
_addr_h) &
> > +                             npcm_chip->ecc_sig_ecc_u_addr_h_mask);
> > +     else
> > +             sig_val_h =3D 0x0;
> > +
> > +     err_u_addr =3D (((err_u_addr | sig_val_h) <<
> > +                             CTL_REG_WIDTH_SHIFT) | sig_val_l);
> > +
> > +     sig_val_l =3D readl(priv->reg + npcm_chip->ecc_sig_ecc_u_data_l);
> > +
> > +     if (npcm_chip->chip =3D=3D NPCM8XX_CHIP)
> > +             sig_val_h =3D readl(priv->reg + npcm_chip->ecc_sig_ecc_u_=
data_h);
> > +     else
> > +             sig_val_h =3D 0x0;
> > +
> > +     err_u_data =3D (((err_u_data | sig_val_h) <<
> > +                             CTL_REG_WIDTH_SHIFT) | sig_val_l);
> > +
> > +     err_u_id =3D ((readl(priv->reg + npcm_chip->ecc_sig_ecc_u_id) &
> > +                             npcm_chip->ecc_sig_ecc_u_id_mask) >>
> > +                     npcm_chip->ecc_sig_ecc_u_id_shift);
> > +
> > +     err_u_synd =3D ((readl(priv->reg + npcm_chip->ecc_sig_ecc_u_synd)=
 &
> > +                             npcm_chip->ecc_sig_ecc_u_synd_mask) >>
> > +                     npcm_chip->ecc_sig_ecc_u_synd_shift);
> > +     priv->ue_cnt =3D priv->ue_cnt + 1;
>
> priv->ue_cnt +=3D 1

OK

>
> > +
> > +     snprintf(priv->message, EDAC_MSG_SIZE,
> > +              "DDR ECC %s: addr=3D0x%llx data=3D0x%llx source_id=3D%#0=
8x",
> > +              mci->ctl_name, err_u_addr, err_u_data, err_u_id);
> > +
> > +     edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
> > +                          1,
> > +                          err_u_addr >> PAGE_SHIFT,
> > +                          err_u_addr & ~PAGE_MASK,
> > +                          err_u_synd, 0, 0, -1,
> > +                          priv->message, "");
> > +}
> > +
> > +static irqreturn_t edac_ecc_isr(int irq, void *dev_id)
> > +{
> > +     struct mem_ctl_info *mci =3D dev_id;
> > +     struct priv_data *priv =3D mci->pvt_info;
> > +     const struct npcm_edac_platform_data *npcm_chip =3D priv->npcm_ch=
ip;
> > +     u32 intr_status;
> > +     u32 val;
> > +
> > +     /* Check the intr status and confirm ECC error intr */
> > +     intr_status =3D readl(priv->reg + npcm_chip->ecc_ctl_int_status);
> > +
> > +     edac_dbg(3, "InterruptStatus : 0x%x\n", intr_status);
>
> Remove the space before the colon? Maybe use:
>
> "Interrupt status (intr_status): 0x%x\n"

OK

>
> > +     val =3D intr_status & npcm_chip->ecc_int_ce_ue_mask;
> > +     if (!((val & npcm_chip->ecc_ce_intr_mask) || (val & npcm_chip->ec=
c_ue_intr_mask)))
> > +             return IRQ_NONE;
> > +
> > +     if (val & npcm_chip->ecc_ce_intr_mask) {
> > +             handle_ce(mci);
> > +
> > +             /* Clear the interrupt source */
> > +             if (val & npcm_chip->ecc_int_ce_event)
> > +                     writel(npcm_chip->ecc_int_ce_event, priv->reg + n=
pcm_chip->ecc_ctl_int_ack);
> > +             else if (val & npcm_chip->ecc_int_second_ce_event)
> > +                     writel(npcm_chip->ecc_int_second_ce_event,
> > +                            priv->reg + npcm_chip->ecc_ctl_int_ack);
> > +             else
> > +                     edac_printk(KERN_ERR, NPCM_EDAC_MOD_NAME, "Failed=
 to clear IRQ\n");
>
> Mention the interrupt too?

OK

>
> > +     }
> > +
> > +     if (val & npcm_chip->ecc_ue_intr_mask) {
> > +             handle_ue(mci);
> > +
> > +             /* Clear the interrupt source */
> > +             if (val & npcm_chip->ecc_int_ue_event)
> > +                     writel(npcm_chip->ecc_int_ue_event, priv->reg + n=
pcm_chip->ecc_ctl_int_ack);
> > +             else if (val & npcm_chip->ecc_int_second_ue_event)
> > +                     writel(npcm_chip->ecc_int_second_ue_event,
> > +                            priv->reg + npcm_chip->ecc_ctl_int_ack);
> > +             else
> > +                     edac_printk(KERN_ERR, NPCM_EDAC_MOD_NAME, "Failed=
 to clear IRQ\n");
> > +     }
> > +
> > +     edac_dbg(3, "Total error count CE %d UE %d\n",
> > +              priv->ce_cnt, priv->ue_cnt);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +#ifdef CONFIG_EDAC_DEBUG
> > +
> > +static ssize_t forced_ecc_error_show(struct device *dev,
> > +                                  struct device_attribute *mattr,
> > +                                  char *data)
> > +{
> > +     return sprintf(data, "CDNS-DDR4 Force Injection Help:\n"
> > +                    "CE: Corrected\n"
> > +                    "checkcode/data:source\n"
> > +                    "bit [0-63] for data [0-7] for checkcode:bit numbe=
r\n"
> > +                    "-------------------------------------------------=
-\n"
> > +                    "UE: Uncorrected\n");
> > +}
> > +
> > +static ssize_t forced_ecc_error_store(struct device *dev,
> > +                                   struct device_attribute *mattr,
> > +                                   const char *data, size_t count)
> > +{
> > +     struct mem_ctl_info *mci =3D to_mci(dev);
> > +     struct priv_data *priv =3D mci->pvt_info;
> > +     const struct npcm_edac_platform_data *npcm_chip =3D priv->npcm_ch=
ip;
> > +     int     args_cnt;
>
> unsigned int?

from https://elixir.bootlin.com/linux/latest/source/lib/argv_split.c
args_cnt for argv_split should be int

>
> > +     int     ret;
> > +     char    **args;
> > +     u32     regval;
> > +     u8      bit_no;
>
> Please use native types.

OK

>
> > +
> > +     /* Split string buffer into separate parameters */
> > +     args =3D argv_split(GFP_KERNEL, data, &args_cnt);
> > +
> > +     /* Check ecc enabled */
> > +     if (!(readl(priv->reg + npcm_chip->ecc_ctl_en_reg) & npcm_chip->e=
cc_ctl_ecc_enable_mask))
> > +             return count;
> > +
> > +     /* Check no write operation pending to controller*/
>
> Missing space before the comment terminator `*/`. Also in several other
> places.

OK

>
> > +     while (readl(priv->reg + npcm_chip->ddr_ctl_controller_busy_reg) =
&
> > +                     CTL_CONTROLLER_BUSY_FLAG) {
> > +             usleep_range(1000, 10000);
> > +     }
> > +
> > +     /* Write appropriate syndrome to xor_check_bit*/
> > +     if (!strcmp(args[0], "CE") && args_cnt =3D=3D 3) {
> > +             ret =3D kstrtou8(args[2], 0, &bit_no);
> > +             if (ret)
> > +                     return ret;
> > +             if (!strcmp(args[1], "checkcode")) {
> > +                     if (bit_no > 7) {
> > +                             edac_printk(KERN_INFO, NPCM_EDAC_MOD_NAME=
, "bit_no for checkcode must be 0~7\n");
> > +                             return count;
> > +                     }
> > +                     regval =3D readl(priv->reg + npcm_chip->ecc_ctl_x=
or_check_bits_reg);
> > +                     regval =3D (regval & ~(NPCM_ECC_CTL_XOR_BITS_MASK=
)) |
> > +                             (check_synd[bit_no] << XOR_CHECK_BIT_SPLI=
T_WIDTH);
> > +                     writel(regval, priv->reg + npcm_chip->ecc_ctl_xor=
_check_bits_reg);
> > +             } else if (!strcmp(args[1], "data")) {
> > +                     if (bit_no > 63) {
> > +                             edac_printk(KERN_INFO, NPCM_EDAC_MOD_NAME=
, "bit_no for data must be 0~63\n");
> > +                             return count;
> > +                     }
> > +                     regval =3D readl(priv->reg + npcm_chip->ecc_ctl_x=
or_check_bits_reg);
> > +                     regval =3D (regval & ~(NPCM_ECC_CTL_XOR_BITS_MASK=
)) |
> > +                                      (data_synd[bit_no] << XOR_CHECK_=
BIT_SPLIT_WIDTH);
> > +                     writel(regval, priv->reg + npcm_chip->ecc_ctl_xor=
_check_bits_reg);
> > +             }
> > +             /* Enable the ECC writeback_en for corrected error */
> > +             regval =3D readl(priv->reg + npcm_chip->ecc_ctl_xor_check=
_bits_reg);
> > +             writel((regval | NPCM_ECC_CTL_AUTO_WRITEBACK_EN),
> > +                    priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg)=
;
> > +     } else if (!strcmp(args[0], "UE")) {
> > +             regval =3D readl(priv->reg + npcm_chip->ecc_ctl_xor_check=
_bits_reg);
> > +             regval =3D (regval & ~(NPCM_ECC_CTL_XOR_BITS_MASK)) |
> > +                              (ECC_DOUBLE_MULTI_ERR_SYND << XOR_CHECK_=
BIT_SPLIT_WIDTH);
> > +             writel(regval, priv->reg + npcm_chip->ecc_ctl_xor_check_b=
its_reg);
> > +     }
> > +
> > +     /* Assert fwc */
> > +     writel((NPCM_ECC_CTL_FORCE_WC | readl(priv->reg + npcm_chip->ecc_=
ctl_xor_check_bits_reg)),
> > +            priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
> > +
> > +     return count;
> > +}
> > +
> > +static DEVICE_ATTR_RW(forced_ecc_error);
> > +static int create_sysfs_attributes(struct mem_ctl_info *mci)
> > +{
> > +     int rc;
> > +
> > +     rc =3D device_create_file(&mci->dev, &dev_attr_forced_ecc_error);
> > +     if (rc < 0)
> > +             return rc;
> > +     return 0;
> > +}
> > +
> > +static void remove_sysfs_attributes(struct mem_ctl_info *mci)
> > +{
> > +     device_remove_file(&mci->dev, &dev_attr_forced_ecc_error);
> > +}
> > +
> > +#endif
> > +
> > +static const struct npcm_edac_platform_data npcm7xx_edac =3D {
> > +     .chip =3D NPCM7XX_CHIP,
> > +
> > +     /* CDNS DDR4 Controller Registers */
> > +     .ecc_ctl_en_reg =3D 0x174,
> > +     .ecc_ctl_int_status =3D 0x1D0,
> > +     .ecc_ctl_int_ack =3D 0x1D4,
> > +     .ecc_ctl_int_mask_master =3D 0x1D8,
> > +
> > +     .ecc_sig_ecc_c_addr_l =3D 0x188,
> > +     .ecc_sig_ecc_c_data_l =3D 0x190,
> > +     .ecc_sig_ecc_c_id =3D 0x194,
> > +     .ecc_sig_ecc_c_synd =3D 0x18C,
> > +
> > +     .ecc_sig_ecc_u_addr_l =3D 0x17C,
> > +     .ecc_sig_ecc_u_data_l =3D 0x184,
> > +     .ecc_sig_ecc_u_id =3D 0x194,
> > +     .ecc_sig_ecc_u_synd =3D 0x180,
> > +
> > +     /* MASK */
> > +     .ecc_ctl_ecc_enable_mask =3D BIT(24),
> > +     .ecc_ctl_en_int_master_mask =3D GENMASK(30, 7) | GENMASK(2, 0),
> > +
> > +     /* ECC IRQ Macros */
> > +     .ecc_int_ce_event =3D BIT(3),
> > +     .ecc_int_second_ce_event =3D BIT(4),
> > +     .ecc_int_ue_event =3D BIT(5),
> > +     .ecc_int_second_ue_event =3D BIT(6),
> > +     .ecc_int_ce_ue_mask =3D GENMASK(6, 3),
> > +     .ecc_ce_intr_mask =3D GENMASK(4, 3),
> > +     .ecc_ue_intr_mask =3D GENMASK(6, 5),
> > +
> > +     /* ECC Signature Macros */
> > +     .ecc_sig_ecc_c_id_shift =3D 16,
> > +     .ecc_sig_ecc_c_synd_shift =3D 0,
> > +
> > +     .ecc_sig_ecc_c_id_mask =3D GENMASK(29, 16),
> > +     .ecc_sig_ecc_c_synd_mask =3D GENMASK(6, 0),
> > +
> > +     .ecc_sig_ecc_u_id_shift =3D 0,
> > +     .ecc_sig_ecc_u_synd_shift =3D 0,
> > +
> > +     .ecc_sig_ecc_u_id_mask =3D GENMASK(13, 0),
> > +     .ecc_sig_ecc_u_synd_mask =3D GENMASK(6, 0),
> > +};
> > +
> > +static const struct npcm_edac_platform_data npcm8xx_edac =3D {
> > +#ifdef CONFIG_EDAC_DEBUG
> > +     .ip_features =3D FORCED_ECC_ERR_EVENT_SUPPORT,
> > +     .ddr_ctl_controller_busy_reg =3D 0x20C,
> > +     .ecc_ctl_xor_check_bits_reg =3D 0x174,
> > +#endif
> > +
> > +     .chip =3D NPCM8XX_CHIP,
> > +
> > +     /* CDNS DDR4 Controller Registers */
> > +     .ddr_ctl_mem_type_reg =3D 0x000,
> > +     .ddr_ctl_mem_width_reg =3D 0x00c,
> > +
> > +     .ecc_ctl_en_reg =3D 0x16C,
> > +     .ecc_ctl_int_status =3D 0x228,
> > +     .ecc_ctl_int_ack =3D 0x244,
> > +     .ecc_ctl_int_mask_master =3D 0x220,
> > +     .ecc_ctl_int_mask_ecc =3D 0x260,
> > +
> > +     .ecc_sig_ecc_c_addr_l =3D 0x18C,
> > +     .ecc_sig_ecc_c_addr_h =3D 0x190,
> > +     .ecc_sig_ecc_c_data_l =3D 0x194,
> > +     .ecc_sig_ecc_c_data_h =3D 0x198,
> > +     .ecc_sig_ecc_c_id =3D 0x19C,
> > +     .ecc_sig_ecc_c_synd =3D 0x190,
> > +
> > +     .ecc_sig_ecc_u_addr_l =3D 0x17C,
> > +     .ecc_sig_ecc_u_addr_h =3D 0x180,
> > +     .ecc_sig_ecc_u_data_l =3D 0x184,
> > +     .ecc_sig_ecc_u_data_h =3D 0x188,
> > +     .ecc_sig_ecc_u_id =3D 0x19C,
> > +     .ecc_sig_ecc_u_synd =3D 0x180,
> > +
> > +     /* MASK */
> > +     .ecc_ctl_ecc_enable_mask =3D GENMASK(17, 16),
> > +     .ecc_ctl_en_int_master_mask =3D GENMASK(30, 3) | GENMASK(1, 0),
> > +     .ecc_ctl_en_int_ecc_mask =3D GENMASK(8, 4),
> > +
> > +     /* ECC IRQ Macros */
> > +     .ecc_int_ce_event =3D BIT(0),
> > +     .ecc_int_second_ce_event =3D BIT(1),
> > +     .ecc_int_ue_event =3D BIT(2),
> > +     .ecc_int_second_ue_event =3D BIT(3),
> > +     .ecc_int_ce_ue_mask =3D GENMASK(3, 0),
> > +     .ecc_ce_intr_mask =3D GENMASK(1, 0),
> > +     .ecc_ue_intr_mask =3D GENMASK(3, 2),
> > +
> > +     /* ECC Signature Macros */
> > +     .ecc_sig_ecc_c_id_shift =3D 8,
> > +     .ecc_sig_ecc_c_synd_shift =3D 8,
> > +     .ecc_sig_ecc_c_addr_h_mask =3D GENMASK(1, 0),
> > +     .ecc_sig_ecc_c_id_mask =3D GENMASK(29, 16),
> > +     .ecc_sig_ecc_c_synd_mask =3D GENMASK(15, 8),
> > +
> > +     .ecc_sig_ecc_u_id_shift =3D 0,
> > +     .ecc_sig_ecc_u_synd_shift =3D 8,
> > +     .ecc_sig_ecc_u_addr_h_mask =3D GENMASK(1, 0),
> > +     .ecc_sig_ecc_u_id_mask =3D GENMASK(13, 0),
> > +     .ecc_sig_ecc_u_synd_mask =3D GENMASK(15, 8),
> > +};
> > +
> > +static const struct of_device_id npcm_edac_of_match[] =3D {
> > +     { .compatible =3D "nuvoton,npcm845-memory-controller", .data =3D =
&npcm8xx_edac },
> > +     { .compatible =3D "nuvoton,npcm750-memory-controller", .data =3D =
&npcm7xx_edac },
>
> Sort this the other way?

OK

>
> > +     {},
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, npcm_edac_of_match);
> > +
> > +static int npcm_edac_mc_probe(struct platform_device *pdev)
> > +{
> > +     const struct npcm_edac_platform_data *npcm_chip;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct edac_mc_layer layers[1];
> > +     const struct of_device_id *id;
> > +     struct priv_data *priv_data;
> > +     struct mem_ctl_info *mci;
> > +     struct resource *res;
> > +     void __iomem *reg;
> > +     int ret =3D -ENODEV;
> > +     int irq;
> > +     u32 ecc_en;
> > +
> > +     id =3D of_match_device(npcm_edac_of_match, &pdev->dev);
> > +
> > +     npcm_chip =3D of_device_get_match_data(&pdev->dev);
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     reg =3D devm_ioremap_resource(dev, res);
> > +     if (IS_ERR(reg)) {
> > +             edac_printk(KERN_ERR, NPCM_EDAC_MOD_NAME,
> > +                         "cdns DDR4 mc regs are not defined\n");
> > +             return PTR_ERR(reg);
> > +     }
> > +
> > +     ecc_en =3D readl(reg + npcm_chip->ecc_ctl_en_reg);
> > +
> > +     if ((ecc_en & npcm_chip->ecc_ctl_ecc_enable_mask) =3D=3D npcm_chi=
p->ecc_ctl_ecc_enable_mask) {
> > +             edac_printk(KERN_INFO, NPCM_EDAC_MOD_NAME, "ECC reporting=
 and correcting on. ");
> > +     } else {
> > +             edac_printk(KERN_INFO, NPCM_EDAC_MOD_NAME, "ECC disabled\=
n");
> > +             return -ENXIO;
> > +     }
> > +
> > +     edac_printk(KERN_INFO, NPCM_EDAC_MOD_NAME,
> > +                 "IO mapped reg addr: %p\n", reg);
>
> Fits on the line above? Also in several other places.

Ok

>
> > +     layers[0].type =3D EDAC_MC_LAYER_ALL_MEM;
> > +     layers[0].size =3D 1;
> > +
> > +     mci =3D edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
> > +                         sizeof(struct priv_data));
> > +     if (!mci) {
> > +             edac_printk(KERN_ERR, NPCM_EDAC_MOD_NAME,
> > +                         "Failed memory allocation for mc instance\n")=
;
> > +             return -ENOMEM;
> > +     }
> > +     mci->pdev =3D &pdev->dev;
> > +     priv_data =3D mci->pvt_info;
> > +     priv_data->reg =3D reg;
> > +     priv_data->npcm_chip =3D npcm_chip;
> > +     priv_data->ce_cnt =3D 0;
> > +     priv_data->ue_cnt =3D 0;
> > +     platform_set_drvdata(pdev, mci);
> > +
> > +     /* Initialize controller capabilities */
> > +     mci->mtype_cap =3D MEM_FLAG_DDR4;
> > +     mci->edac_ctl_cap =3D EDAC_FLAG_SECDED;
> > +     mci->scrub_cap =3D SCRUB_FLAG_HW_SRC;
> > +     mci->scrub_mode =3D SCRUB_HW_SRC;
> > +     mci->edac_cap =3D EDAC_FLAG_SECDED;
> > +     mci->ctl_name =3D id->compatible;
> > +     mci->dev_name =3D dev_name(&pdev->dev);
> > +     mci->mod_name =3D NPCM_EDAC_MOD_NAME;
> > +     mci->ctl_page_to_phys =3D NULL;
> > +
> > +     /* Interrupt feature is supported by cadence mc */
> > +     edac_op_state =3D EDAC_OPSTATE_INT;
> > +#ifdef CONFIG_EDAC_DEBUG
> > +     init_mem_layout(mci);
> > +#endif
> > +     /* Setup Interrupt handler for ECC */
>
> Set up

OK

>
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (!irq) {
> > +             edac_printk(KERN_ERR, NPCM_EDAC_MOD_NAME,
> > +                         "irq number not defined for ECC.\n");
> > +             goto err;
>
> According to the documentation in `drivers/base/platform.c` you should
> check for `irq < 0`?
>

yes, negative error number on failure.

> > +     }
> > +     ret =3D devm_request_irq(dev, irq, edac_ecc_isr, 0,
> > +                            "cdns-edac-mc-ecc-irq", mci);
> > +     if (ret) {
> > +             edac_printk(KERN_ERR, NPCM_EDAC_MOD_NAME,
> > +                         "request_irq fail for NPCM_EDAC irq\n");
> > +             goto err;
> > +     }
> > +     ret =3D edac_mc_add_mc(mci);
> > +     if (ret) {
> > +             edac_printk(KERN_ERR, NPCM_EDAC_MOD_NAME,
> > +                         "Failed to register with EDAC core\n");
> > +             goto err;
> > +     }
> > +
> > +#ifdef CONFIG_EDAC_DEBUG
> > +     if ((npcm_chip->ip_features & FORCED_ECC_ERR_EVENT_SUPPORT) &&
> > +         npcm_chip->chip =3D=3D NPCM8XX_CHIP) {
> > +             if (create_sysfs_attributes(mci)) {
> > +                     edac_printk(KERN_ERR, NPCM_EDAC_MOD_NAME,
> > +                                 "Failed to create sysfs entries\n");
> > +                     goto err1;
> > +             }
> > +     }
> > +#endif
> > +
> > +     /* Only enable MC interrupts with ECC - clear global int mask bit=
 and ecc bit */
> > +     writel(npcm_chip->ecc_ctl_en_int_master_mask,
> > +            priv_data->reg + npcm_chip->ecc_ctl_int_mask_master);
> > +
> > +     if (npcm_chip->chip =3D=3D NPCM8XX_CHIP) {
> > +             /* clear single and multi for ce and ue */
> > +             writel(npcm_chip->ecc_ctl_en_int_ecc_mask,
> > +                    priv_data->reg + npcm_chip->ecc_ctl_int_mask_ecc);
> > +     }
> > +
> > +     return 0;
> > +
> > +#ifdef CONFIG_EDAC_DEBUG
> > +err1:
> > +#endif
> > +
> > +     edac_mc_del_mc(&pdev->dev);
> > +
> > +err:
> > +     edac_mc_free(mci);
> > +     return ret;
> > +}
> > +
> > +static int npcm_edac_mc_remove(struct platform_device *pdev)
> > +{
> > +     struct mem_ctl_info *mci =3D platform_get_drvdata(pdev);
> > +     struct priv_data *priv =3D mci->pvt_info;
> > +     const struct npcm_edac_platform_data *npcm_chip =3D priv->npcm_ch=
ip;
> > +
> > +     writel(NPCM_ECC_CTL_GLOBAL_INT_DISABLE, priv->reg + npcm_chip->ec=
c_ctl_int_mask_master);
> > +
> > +     /* Disable ecc feature before removing driver by writing 0 */
> > +     writel((unsigned int)(~(npcm_chip->ecc_ctl_ecc_enable_mask)),
> > +            priv->reg + npcm_chip->ecc_ctl_en_reg);
> > +
> > +#ifdef CONFIG_EDAC_DEBUG
> > +     remove_sysfs_attributes(mci);
> > +#endif
> > +     edac_mc_del_mc(&pdev->dev);
> > +     edac_mc_free(mci);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver npcm_edac_mc_driver =3D {
> > +     .driver =3D {
> > +                .name =3D "npcm-edac",
> > +                .of_match_table =3D npcm_edac_of_match,
> > +     },
> > +     .probe =3D npcm_edac_mc_probe,
> > +     .remove =3D npcm_edac_mc_remove,
> > +};
> > +
> > +module_platform_driver(npcm_edac_mc_driver);
> > +
> > +MODULE_AUTHOR("Medad <ctcchien@nuvoton.com>");
> > +MODULE_DESCRIPTION("Nuvoton NPCM EDAC Driver");
> > +MODULE_LICENSE("GPL v2");
>
>
> Kind regards,
>
> Paul

B.R.
Medad
