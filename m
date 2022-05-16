Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 852D2527C08
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 04:36:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1k0B3F1Cz3brb
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 12:36:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZihCwqrl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZihCwqrl; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1jzq437tz3bdy
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 12:36:06 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id 16so16471085lju.13
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 19:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pbnTlSg+9lkzJZgvRMdLa+9B8pVRxX5+A47ByjDRmu8=;
 b=ZihCwqrl9PpeLm5+Am/uEriWZHH63ZwRI8vnxF3gIuEyRDQXqDuvh/FoZPifsun4aE
 7Gq3Fnkn2ruUfRnNo54tKViEbwdechsO70HNeCFP7LEnmmyi/Y8JfVm28r9ujbTvs3PC
 J4BKygK5jDTRjyOuPrg0dQWjdoj/mW+A2TGUYuhgqQvE+1CRRu318gOJcZwn9vWdgBGX
 SBgZq1O622dabZMlssWzYRb+l1DXRbKg0HGdvSH9gUZtB4dSJyeAy2Ae9m2X6f3BgPlw
 MQHWarm53k6ajCNzb3jmf+LiIey2bQZFaZTfvP9xE6+igCeU7bL/AYKSkzFFEh6PuUXa
 iTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pbnTlSg+9lkzJZgvRMdLa+9B8pVRxX5+A47ByjDRmu8=;
 b=ayaAqjYMj3fTGgDIfdLfWR4vIm/kienrDH2Hr3SsYpy+0SmyhKf7tzu6On8WD3UY7i
 y9mRupLPDgm9/SntQj8Q6hmwDwLtrhDMAb2S6qBatAzKwV1vitOQOxRXOWn1jr/LhEWC
 o6cZjT4wi9VEsMACq6Q/RqY8BHW+cn9WqDaAPt2tcrktLWgPD6ACq7BOtXOcDONDRKO3
 v1Cqob3Xbnc1xKEmKKvsBc14hJgx4yMimFzkSVL7D4d8WTvqyIKWf1pU/CYy6lClgCxQ
 e6oW/WKZ2NGHdfYH5xEnYlsgAK9U9TIULvocjnEmiyva5VxrpfbMa6HSeCupCoIa9ssH
 N/6w==
X-Gm-Message-State: AOAM5318Cxr60j95k8eMSZB6ttQiEFFmZ8gEcrND7pyfRQ03XZCrnTL/
 8Lt0vxraK0KhZv2R/eWrwnd3O9974QINJCN81A8=
X-Google-Smtp-Source: ABdhPJzzYv3UBxnxwNzl6OP7ju5c/5Mj2ZPE3GhdhiqDnR8gYF2Zyfq+Q3Pn4xGVcRozD8KllIWTw+lQmu8rolCRhKk=
X-Received: by 2002:a2e:a801:0:b0:24a:ff0b:ae7a with SMTP id
 l1-20020a2ea801000000b0024aff0bae7amr9560575ljq.287.1652668561873; Sun, 15
 May 2022 19:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-4-ctcchien@nuvoton.com>
 <0a46ba6f-9eac-7138-c675-99df86750c83@molgen.mpg.de>
In-Reply-To: <0a46ba6f-9eac-7138-c675-99df86750c83@molgen.mpg.de>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 16 May 2022 10:35:50 +0800
Message-ID: <CAHpyw9epvs9E=DxHRD5oV3wzpiq7spogp+TZcuyNhD4Nk3exZg@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] EDAC: nuvoton: Add NPCM memory controller driver
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

thanks for your comments.

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2022=E5=B9=B45=E6=9C=8810=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Medad,
>
>
> Am 10.05.22 um 05:10 schrieb Medad CChien:
> > Add memory controller support for Nuvoton NPCM SoC.
>
> It=E2=80=99d be great if you added the datasheet name, revision and secti=
on used
> to implement this.
>

OK, I will add those information.

> > Note:
> >     you can force an ecc event by writing a string to edac sysfs node
> >     and remember to define CONFIG_EDAC_DEBUG to enable this feature
> >     example: force a correctable event on checkcode bit 0
> >     echo "CE checkcode 0" > /sys/devices/system/edac/mc/mc0/forced_ecc_=
error
> >
> > Fix the following warnings and error:
> > error:
> >     error: macro "edac_printk" requires 4 arguments, but only 2 given i=
n
> >     driver/edac/npcm_edac.c
> >     edac_printk(KERN_INFO, "bit_no for checkcode must be 0~7\n");
> >
> > warnings:
> >     performing pointer arithmetic on a null pointer has undefined behav=
ior.
> >     logical not is only applied to the left hand side of this bitwise
> >     operator.
> >     mixing declarations and code is a C99 extension.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
>
> I find this line confusing as the kernel test robot did not report that
> the memory controller driver is missing.
>

Sorry, I did not get your point.
but I add these due to kernel test robot reported some errors and warnings.

> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > ---
> >   drivers/edac/Kconfig     |  10 +
> >   drivers/edac/Makefile    |   1 +
> >   drivers/edac/npcm_edac.c | 680 ++++++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 691 insertions(+)
> >   create mode 100644 drivers/edac/npcm_edac.c
> >
> > diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> > index 58ab63642e72..9c83202cbf65 100644
> > --- a/drivers/edac/Kconfig
> > +++ b/drivers/edac/Kconfig
> > @@ -539,4 +539,14 @@ config EDAC_DMC520
> >         Support for error detection and correction on the
> >         SoCs with ARM DMC-520 DRAM controller.
> >
> > +config EDAC_NPCM
> > +     tristate "Nuvoton NPCM DDR Memory Controller"
> > +     depends on (ARCH_NPCM || COMPILE_TEST)
> > +     help
> > +       Support for error detection and correction on the Nuvoton NPCM =
DDR
> > +       memory controller.
>
> Maybe add the information from the devicetree documentation:
>
> The Nuvoton BMC SoC supports DDR4 memory with and without ECC (error
> correction check).
>
> The memory controller supports single bit error correction, double bit
> error detection (in-line ECC in which a section (1/8th) of the memory
> device used to store data is used for ECC storage).
>

OK, I will add that information.

> > +
> > +       First, ECC must be configured in the BootBlock header. Then, th=
is driver
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
> > index 000000000000..5552dab242b1
> > --- /dev/null
> > +++ b/drivers/edac/npcm_edac.c
> > @@ -0,0 +1,680 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2022 Nuvoton Technology corporation.
>
> No dot/period is needed at the end, as corporation is not abbreviated.
> Maybe also capitalize Corporation as done on the Web site.

OK

>
> > +
> > +#include <linux/delay.h>
> > +#include <linux/of_device.h>
> > +
> > +#include "edac_module.h"
> > +
> > +#define NPCM_EDAC_MOD_NAME "npcm-edac"
> > +#define FORCED_ECC_ERR_EVENT_SUPPORT         BIT(1)
> > +#define EDAC_MSG_SIZE                                                2=
56
> > +/* Granularity of reported error in bytes */
> > +#define NPCM_EDAC_ERR_GRAIN                          1
> > +
> > +#define MEM_TYPE_DDR4                                                0=
xA
> > +
> > +#define NPCM7XX_CHIP                                         0x700
> > +#define NPCM8XX_CHIP                                         0x800
> > +
> > +/* Control register width definitions */
> > +#define WDTH_16                                                       =
       (2)
> > +#define WDTH_32                                                       =
       (1)
> > +#define WDTH_64                                                       =
       (0)
> > +#define CTL_MEM_MAX_WIDTH_MASK                       GENMASK(4, 0)
> > +#define CTL_REG_WIDTH_SHIFT                                  (32)
> > +#define XOR_CHECK_BIT_SPLIT_WIDTH                    (16)
> > +#define CTL_CONTROLLER_BUSY_FLAG                     BIT(0)
> > +#define NPCM_ECC_CTL_FORCE_WC                                BIT(8)
> > +#define NPCM_ECC_CTL_AUTO_WRITEBACK_EN       BIT(24)
> > +#define NPCM_ECC_CTL_XOR_BITS_MASK                   GENMASK(23, 16)
> > +#define NPCM_ECC_CTL_MTYPE_MASK                      GENMASK(11, 8)
> > +#define NPCM_ECC_CTL_GLOBAL_INT_DISABLE              BIT(31)
> > +
> > +/* Syndrome values */
> > +#define ECC_DOUBLE_MULTI_ERR_SYND                    0x03
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
>
> This does not look correctly indented. At least the } should be at the
> beginning. The values can just be indented by one tab I believe. (At
> least that is what `indent --linux-style` does (GNU indent 2.2.12).
>

OK

> > +
> > +static char check_synd[] =3D {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40=
, 0x80};
>
> At least `indent --linux-style` add a space after { and before }.
>

OK

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
> > +     u32 ecc_sig_c_addr_l;
> > +     u32 ecc_sig_c_addr_h;
> > +     u32 ecc_sig_c_data_l;
> > +     u32 ecc_sig_c_data_h;
> > +     u32 ecc_sig_c_id;
> > +     u32 ecc_sig_c_synd;
> > +
> > +     u32 ecc_sig_u_addr_l;
> > +     u32 ecc_sig_u_addr_h;
> > +     u32 ecc_sig_u_data_l;
> > +     u32 ecc_sig_u_data_h;
> > +     u32 ecc_sig_u_id;
> > +     u32 ecc_sig_u_synd;
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
> > +     u32 ecc_sig_c_id_shift;
> > +     u32 ecc_sig_c_synd_shift;
> > +     u32 ecc_sig_c_addr_h_mask;
> > +     u32 ecc_sig_c_id_mask;
> > +     u32 ecc_sig_c_synd_mask;
> > +
> > +     u32 ecc_sig_u_id_shift;
> > +     u32 ecc_sig_u_synd_shift;
> > +     u32 ecc_sig_u_addr_h_mask;
> > +     u32 ecc_sig_u_id_mask;
> > +     u32 ecc_sig_u_synd_mask;
> > +};
> > +
> > +struct priv_data {
> > +     void __iomem *reg;
> > +     u32 ce_cnt;
> > +     u32 ue_cnt; > + char message[EDAC_MSG_SIZE];
> > +     const struct npcm_edac_platform_data *npcm_chip;
> > +};
> > +
> > +
> > +static void init_mem_layout(struct mem_ctl_info *mci)
> > +{
> > +     struct priv_data *priv =3D mci->pvt_info;
> > +     const struct npcm_edac_platform_data *npcm_chip =3D priv->npcm_ch=
ip;
> > +     struct csrow_info *csi;
> > +     struct dimm_info *dimm;
> > +     struct sysinfo info;
> > +     enum mem_type mtype;
> > +     u32 val, width;
> > +     u32 size, row;
> > +     u8 j;
>
> At least for loop variables, the default size integers should be used [1]=
.
>

OK

> [=E2=80=A6]
>
>
> Kind regards,
>
> Paul
>
>
> [1]: https://notabs.org/coding/smallIntsBigPenalty.htm
