Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F8D33E7E
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 07:39:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J12v4ymFzDqRW
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 15:39:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ei74BmaD"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J12W56xlzDqNx
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 15:39:31 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id u12so12398366qth.3
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 22:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O8S7L3kmY9leRF6SoI08pfzZx/c+8uA/Lrf1ogneWDQ=;
 b=ei74BmaDraAwOCfCog6GTZGVnd8/HbO6sneU3xJCqI8ojtoqaxPj5Qj5iin2XWuspu
 pkvD2zHoR39eaDo3cuzDGzkfEjI70uF3+1T/7yhP3+DjjgtDNv3woiwNCbk7Nl/rRew6
 Sj3/8m+XBxW2Yu9PnSh5uqU7ZDebUX64No72Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O8S7L3kmY9leRF6SoI08pfzZx/c+8uA/Lrf1ogneWDQ=;
 b=no0LK9X4oygwmGNq2a+UCIOwnmNeRYZ3BIxbDWEVVZz3MBMUY0ukWi3LgyqO/SkIm1
 G7NSn2VMAjOJuNYWTrSHvXryxOGWACxHZnfMwikN+SiA63a9tIMADUm3bSB7nUG9yvkp
 iR0XU07T+/UJ6nytaIh8f7Te/R6Vw5KVDprEBkteblgiD6Z3AqD2P5EEFqb1Z4SF+hYv
 fuSFyOC0DoMtWjS9ArJzhdTVrO+ubtzPn8flHIF8m8mUDrE2pgeVYXIqihtW3xLThuM8
 cYUosBTNfb6EcIJSkvdhYd7RF50lpa5m+J7dBYBNu5UAV+hHM/DNTIw5GyplwgMrunjB
 /E9Q==
X-Gm-Message-State: APjAAAUdpBUQ8S5a/VR2G+4vnqY2JWaljjsFKaFRJ7SAyt6liLG/hqM2
 c8GMfENFHzbA9tIsEssL9puj4UNI0dYOMNxYvqcsJE5Z
X-Google-Smtp-Source: APXvYqwLV/VW9f8vKZQRE2AxAmV3sqdpFxM8pe5iIm54GTHbJG2qIIelj3eqAnQWfAdVIUgBNuhpp9AKKzA4OVZe2xI=
X-Received: by 2002:ac8:7545:: with SMTP id b5mr18167042qtr.234.1559626769218; 
 Mon, 03 Jun 2019 22:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190523105448.26300-1-ghung.quanta@gmail.com>
In-Reply-To: <20190523105448.26300-1-ghung.quanta@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Jun 2019 05:39:18 +0000
Message-ID: <CACPK8XfMYOZkrfRcMgnwQ_JMLpqMRh-2har+=wrrL893+6qG=Q@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v1 1/2] edac: npcm: Add Nuvoton NPCM7xx EDAC driver
To: George Hung <ghung.quanta@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tomer Maimon <tomer.maimon@nuvoton.com>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George,

On Thu, 23 May 2019 at 11:00, George Hung <ghung.quanta@gmail.com> wrote:
>
> From: George Hung <george.hung@quantatw.com>
>
> Add support for the Nuvoton NPCM7xx SoC EDAC driver

I would like an ack or review from someone familiar with the Nuvoton
system. I can then include it in dev-5.1.

Please send this one for mainline inclusion too.

Cheers,

Joel

>
> NPCM7xx ECC datasheet from nuvoton.israel-Poleg:
> "Cadence DDR Controller User=E2=80=99s Manual For DDR3 & DDR4 Memories"
>
> Tested: Forcing an ECC error event
>
> Write a value to the xor_check_bits parameter that will trigger
> an ECC event once that word is read
>
> For example, to force a single-bit correctable error on bit 0 of
> the user-word space shown, write 0x75 into that byte of the
> xor_check_bits parameter and then assert fwc (force write check)
> bit to 'b1' (mem base: 0xf0824000, xor_check_bits reg addr: 0x178)
>
> $ devmem 0xf0824178 32 0x7501
>
> To force a double-bit un-correctable error for the user-word space,
> write 0x03 into that byte of the xor_check_bits parameter
>
> $ devmem 0xf0824178 32 0x301
>
> Signed-off-by: George Hung <george.hung@quantatw.com>
> ---
>  MAINTAINERS                 |   6 +
>  drivers/edac/Kconfig        |   7 +
>  drivers/edac/Makefile       |   1 +
>  drivers/edac/npcm7xx_edac.c | 424 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 438 insertions(+)
>  create mode 100644 drivers/edac/npcm7xx_edac.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c54dbc8f406..0a6ac3f00ed5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5658,6 +5658,12 @@ L:       linux-edac@vger.kernel.org
>  S:     Maintained
>  F:     drivers/edac/mpc85xx_edac.[ch]
>
> +EDAC-NPCM7XX
> +M:     George Hung <george.hung@quantatw.com>
> +S:     Maintained
> +F:     drivers/edac/npcm7xx_edac.c
> +F:     Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> +
>  EDAC-PASEMI
>  M:     Egor Martovetsky <egor@pasemi.com>
>  L:     linux-edac@vger.kernel.org
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index 47eb4d13ed5f..7d666ad7f88b 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -504,4 +504,11 @@ config EDAC_ASPEED
>           First, ECC must be configured in the bootloader. Then, this dri=
ver
>           will expose error counters via the EDAC kernel framework.
>
> +config EDAC_NPCM7XX
> +       tristate "Nuvoton NPCM7xx DDR Memory Controller"
> +       depends on ARCH_NPCM7XX
> +       help
> +         Support for error detection and correction on the
> +         Nuvoton NPCM7xx DDR memory controller.
> +
>  endif # EDAC
> diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
> index 89ad4a84a0f6..d7780ce035b8 100644
> --- a/drivers/edac/Makefile
> +++ b/drivers/edac/Makefile
> @@ -84,3 +84,4 @@ obj-$(CONFIG_EDAC_XGENE)              +=3D xgene_edac.o
>  obj-$(CONFIG_EDAC_TI)                  +=3D ti_edac.o
>  obj-$(CONFIG_EDAC_QCOM)                        +=3D qcom_edac.o
>  obj-$(CONFIG_EDAC_ASPEED)              +=3D aspeed_edac.o
> +obj-$(CONFIG_EDAC_NPCM7XX)              +=3D npcm7xx_edac.o
> diff --git a/drivers/edac/npcm7xx_edac.c b/drivers/edac/npcm7xx_edac.c
> new file mode 100644
> index 000000000000..2d2deb81e49c
> --- /dev/null
> +++ b/drivers/edac/npcm7xx_edac.c
> @@ -0,0 +1,424 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 Quanta Computer lnc.
> + */
> +
> +#include <linux/edac.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +
> +#include "edac_module.h"
> +
> +#define ECC_ENABLE                     BIT(24)
> +#define ECC_EN_INT_MASK                0x7fffff87
> +
> +#define INT_STATUS_ADDR                116
> +#define INT_ACK_ADDR                   117
> +#define INT_MASK_ADDR                  118
> +
> +#define ECC_EN_ADDR                    93
> +#define ECC_C_ADDR_ADDR                98
> +#define ECC_C_DATA_ADDR                100
> +#define ECC_C_ID_ADDR                  101
> +#define ECC_C_SYND_ADDR                99
> +#define ECC_U_ADDR_ADDR                95
> +#define ECC_U_DATA_ADDR                97
> +#define ECC_U_ID_ADDR                  101
> +#define ECC_U_SYND_ADDR                96
> +
> +#define ECC_ERROR                      -1
> +#define EDAC_MSG_SIZE                  256
> +#define EDAC_MOD_NAME                  "npcm7xx-edac"
> +
> +struct ecc_error_signature_info {
> +       u32 ecc_addr;
> +       u32 ecc_data;
> +       u32 ecc_id;
> +       u32 ecc_synd;
> +};
> +
> +struct npcm7xx_ecc_int_status {
> +       u32 int_mask;
> +       u32 int_status;
> +       u32 int_ack;
> +       u32 ce_cnt;
> +       u32 ue_cnt;
> +       struct ecc_error_signature_info ceinfo;
> +       struct ecc_error_signature_info ueinfo;
> +};
> +
> +struct npcm7xx_edac_priv {
> +       void __iomem *baseaddr;
> +       char message[EDAC_MSG_SIZE];
> +       struct npcm7xx_ecc_int_status stat;
> +};
> +
> +/**
> + * npcm7xx_edac_get_ecc_syndrom - Get the current ecc error info
> + * @base:      Pointer to the base address of the ddr memory controller
> + * @p:         Pointer to the Nuvoton ecc status structure
> + *
> + * Determines there is any ecc error or not
> + *
> + * Return: ECC detection status
> + */
> +static int npcm7xx_edac_get_ecc_syndrom(void __iomem *base,
> +                                       struct npcm7xx_ecc_int_status *p)
> +{
> +       int status =3D 0;
> +       u32 int_status =3D 0;
> +
> +       int_status =3D readl(base + 4*INT_STATUS_ADDR);
> +       writel(int_status, base + 4*INT_ACK_ADDR);
> +       edac_dbg(3, "int_status: %#08x\n", int_status);
> +
> +       if ((int_status & (1 << 6)) =3D=3D (1 << 6)) {
> +               edac_dbg(3, "6-Mult uncorrectable detected.\n");
> +               p->ue_cnt++;
> +               status =3D ECC_ERROR;
> +       }
> +
> +       if ((int_status & (1 << 5)) =3D=3D (1 << 5)) {
> +               edac_dbg(3, "5-An uncorrectable detected\n");
> +               p->ue_cnt++;
> +               status =3D ECC_ERROR;
> +       }
> +
> +       if ((int_status & (1 << 4)) =3D=3D (1 << 4)) {
> +               edac_dbg(3, "4-mult correctable detected.\n");
> +               p->ce_cnt++;
> +               status =3D ECC_ERROR;
> +       }
> +
> +       if ((int_status & (1 << 3)) =3D=3D (1 << 3)) {
> +               edac_dbg(3, "3-A correctable detected.\n");
> +               p->ce_cnt++;
> +               status =3D ECC_ERROR;
> +       }
> +
> +       if (status =3D=3D ECC_ERROR) {
> +               u32 ecc_id;
> +
> +               p->ceinfo.ecc_addr =3D readl(base + 4*ECC_C_ADDR_ADDR);
> +               p->ceinfo.ecc_data =3D readl(base + 4*ECC_C_DATA_ADDR);
> +               p->ceinfo.ecc_synd =3D readl(base + 4*ECC_C_SYND_ADDR);
> +
> +               p->ueinfo.ecc_addr =3D readl(base + 4*ECC_U_ADDR_ADDR);
> +               p->ueinfo.ecc_data =3D readl(base + 4*ECC_U_DATA_ADDR);
> +               p->ueinfo.ecc_synd =3D readl(base + 4*ECC_U_SYND_ADDR);
> +
> +               /* ECC_C_ID_ADDR has same value as ECC_U_ID_ADDR */
> +               ecc_id =3D readl(base + 4*ECC_C_ID_ADDR);
> +               p->ueinfo.ecc_id =3D ecc_id & 0xffff;
> +               p->ceinfo.ecc_id =3D ecc_id >> 16;
> +       }
> +
> +       return status;
> +}
> +
> +/**
> + * npcm7xx_edac_handle_error - Handle controller error types CE and UE
> + * @mci:       Pointer to the edac memory controller instance
> + * @p:         Pointer to the Nuvoton ecc status structure
> + *
> + * Handles the controller ECC correctable and un correctable error.
> + */
> +static void npcm7xx_edac_handle_error(struct mem_ctl_info *mci,
> +                                   struct npcm7xx_ecc_int_status *p)
> +{
> +       struct npcm7xx_edac_priv *priv =3D mci->pvt_info;
> +       u32 page, offset;
> +
> +       if (p->ce_cnt) {
> +               snprintf(priv->message, EDAC_MSG_SIZE,
> +                       "DDR ECC: synd=3D%#08x addr=3D%#08x data=3D%#08x =
source_id=3D%#08x ",
> +                       p->ceinfo.ecc_synd, p->ceinfo.ecc_addr,
> +                       p->ceinfo.ecc_data, p->ceinfo.ecc_id);
> +
> +               page =3D p->ceinfo.ecc_addr >> PAGE_SHIFT;
> +               offset =3D p->ceinfo.ecc_addr & ~PAGE_MASK;
> +               edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
> +                                    p->ce_cnt, page, offset,
> +                                    p->ceinfo.ecc_synd,
> +                                    0, 0, -1,
> +                                    priv->message, "");
> +       }
> +
> +       if (p->ue_cnt) {
> +               snprintf(priv->message, EDAC_MSG_SIZE,
> +                       "DDR ECC: synd=3D%#08x addr=3D%#08x data=3D%#08x =
source_id=3D%#08x ",
> +                       p->ueinfo.ecc_synd, p->ueinfo.ecc_addr,
> +                       p->ueinfo.ecc_data, p->ueinfo.ecc_id);
> +
> +               page =3D p->ueinfo.ecc_addr >> PAGE_SHIFT;
> +               offset =3D p->ueinfo.ecc_addr & ~PAGE_MASK;
> +               edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
> +                                    p->ue_cnt, page, offset,
> +                                    p->ueinfo.ecc_synd,
> +                                    0, 0, -1,
> +                                    priv->message, "");
> +       }
> +
> +       memset(p, 0, sizeof(*p));
> +}
> +
> +/**
> + * npcm7xx_edac_check - Check controller for ECC errors
> + * @mci:       Pointer to the edac memory controller instance
> + *
> + * This routine is used to check and post ECC errors and is called by
> + * this driver's CE and UE interrupt handler.
> + */
> +static void npcm7xx_edac_check(struct mem_ctl_info *mci)
> +{
> +       struct npcm7xx_edac_priv *priv =3D mci->pvt_info;
> +       int status =3D 0;
> +
> +       status =3D npcm7xx_edac_get_ecc_syndrom(priv->baseaddr, &priv->st=
at);
> +       if (status !=3D ECC_ERROR)
> +               return;
> +
> +       npcm7xx_edac_handle_error(mci, &priv->stat);
> +}
> +
> +/**
> + * npcm7xx_edac_isr - CE/UE interrupt service routine
> + * @irq:    The virtual interrupt number being serviced.
> + * @dev_id: A pointer to the EDAC memory controller instance
> + *          associated with the interrupt being handled.
> + *
> + * This routine implements the interrupt handler for both correctable
> + * (CE) and uncorrectable (UE) ECC errors for the Nuvoton Cadence DDR
> + * controller. It simply calls through to the routine used to check,
> + * report and clear the ECC status.
> + *
> + * Unconditionally returns IRQ_HANDLED.
> + */
> +static irqreturn_t npcm7xx_edac_isr(int irq, void *dev_id)
> +{
> +       struct mem_ctl_info *mci =3D dev_id;
> +       int npcm_edac_report =3D 0;
> +
> +       npcm_edac_report =3D edac_get_report_status();
> +       if (npcm_edac_report !=3D EDAC_REPORTING_DISABLED)
> +               npcm7xx_edac_check(mci);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int npcm7xx_edac_register_irq(struct mem_ctl_info *mci,
> +                                       struct platform_device *pdev)
> +{
> +       int status =3D 0;
> +       int mc_irq;
> +       struct npcm7xx_edac_priv *priv =3D mci->pvt_info;
> +
> +       /* Only enable MC interrupts with ECC - clear int_mask[6:3] */
> +       writel(ECC_EN_INT_MASK, priv->baseaddr + 4*INT_MASK_ADDR);
> +
> +       mc_irq =3D platform_get_irq(pdev, 0);
> +
> +       if (!mc_irq) {
> +               edac_printk(KERN_ERR, EDAC_MC, "Unable to map interrupts.=
\n");
> +               status =3D -ENODEV;
> +               goto fail;
> +       }
> +
> +       status =3D devm_request_irq(&pdev->dev, mc_irq, npcm7xx_edac_isr,=
 0,
> +                              "npcm-memory-controller", mci);
> +
> +       if (status < 0) {
> +               edac_printk(KERN_ERR, EDAC_MC,
> +                                     "Unable to request irq %d for ECC",
> +                                     mc_irq);
> +               status =3D -ENODEV;
> +               goto fail;
> +       }
> +
> +       return 0;
> +
> +fail:
> +       return status;
> +}
> +
> +static const struct of_device_id npcm7xx_edac_of_match[] =3D {
> +       { .compatible =3D "nuvoton,npcm7xx-sdram-edac"},
> +       { /* end of table */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, npcm7xx_edac_of_match);
> +
> +/**
> + * npcm7xx_edac_mc_init - Initialize driver instance
> + * @mci:       Pointer to the edac memory controller instance
> + * @pdev:      Pointer to the platform_device struct
> + *
> + * Performs initialization of the EDAC memory controller instance and
> + * related driver-private data associated with the memory controller the
> + * instance is bound to.
> + *
> + * Returns 0 if OK; otherwise, < 0 on error.
> + */
> +static int npcm7xx_edac_mc_init(struct mem_ctl_info *mci,
> +                                struct platform_device *pdev)
> +{
> +       const struct of_device_id *id;
> +
> +       id =3D of_match_device(npcm7xx_edac_of_match, &pdev->dev);
> +       if (!id)
> +               return -ENODEV;
> +
> +       /* Initialize controller capabilities and configuration */
> +       mci->mtype_cap =3D MEM_FLAG_DDR4;
> +       mci->edac_ctl_cap =3D EDAC_FLAG_SECDED;
> +       mci->edac_cap =3D EDAC_FLAG_SECDED;
> +       mci->scrub_cap =3D SCRUB_FLAG_HW_SRC;
> +       mci->scrub_mode =3D SCRUB_HW_SRC;
> +       mci->ctl_name =3D id->compatible;
> +       mci->dev_name =3D dev_name(&pdev->dev);
> +       mci->mod_name =3D EDAC_MOD_NAME;
> +
> +       edac_op_state =3D EDAC_OPSTATE_INT;
> +
> +       return 0;
> +}
> +
> +/**
> + * npcm7xx_edac_get_eccstate - Return the controller ecc enable/disable =
status
> + * @base:      Pointer to the ddr memory controller base address
> + *
> + * Get the ECC enable/disable status for the controller
> + *
> + * Return: a ecc status boolean i.e true/false - enabled/disabled.
> + */
> +static bool npcm7xx_edac_get_eccstate(void __iomem *base)
> +{
> +       u32 ecc_en;
> +       bool state =3D false;
> +
> +       ecc_en =3D readl(base + 4*ECC_EN_ADDR);
> +       if (ecc_en & ECC_ENABLE) {
> +               edac_printk(KERN_INFO, EDAC_MC, "ECC reporting and correc=
ting on. ");
> +               state =3D true;
> +       }
> +
> +       return state;
> +}
> +
> +/**
> + * npcm7xx_edac_mc_probe - Check controller and bind driver
> + * @pdev:      Pointer to the platform_device struct
> + *
> + * Probes a specific controller instance for binding with the driver.
> + *
> + * Return: 0 if the controller instance was successfully bound to the
> + * driver; otherwise, < 0 on error.
> + */
> +static int npcm7xx_edac_mc_probe(struct platform_device *pdev)
> +{
> +       struct mem_ctl_info *mci;
> +       struct edac_mc_layer layers[1];
> +       struct npcm7xx_edac_priv *priv;
> +       struct resource *res;
> +       void __iomem *baseaddr;
> +       int rc;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       baseaddr =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(baseaddr)) {
> +               edac_printk(KERN_ERR, EDAC_MOD_NAME,
> +                           "DDR controller regs not defined\n");
> +               return PTR_ERR(baseaddr);
> +       }
> +
> +       /*
> +        * Check if ECC is enabled.
> +        * If not, there is no useful monitoring that can be done
> +        * for this controller.
> +        */
> +       if (!npcm7xx_edac_get_eccstate(baseaddr)) {
> +               edac_printk(KERN_INFO, EDAC_MC, "ECC disabled\n");
> +               return -ENXIO;
> +       }
> +
> +       /*
> +        * Allocate an EDA controller instance and perform the appropriat=
e
> +        * initialization.
> +        */
> +       layers[0].type =3D EDAC_MC_LAYER_ALL_MEM;
> +       layers[0].size =3D 1;
> +
> +       mci =3D edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
> +                           sizeof(struct npcm7xx_edac_priv));
> +       if (!mci) {
> +               edac_printk(KERN_ERR, EDAC_MC,
> +                           "Failed memory allocation for mc instance\n")=
;
> +               return -ENOMEM;
> +       }
> +
> +       mci->pdev =3D &pdev->dev;
> +       priv =3D mci->pvt_info;
> +       priv->baseaddr =3D baseaddr;
> +       platform_set_drvdata(pdev, mci);
> +
> +       rc =3D npcm7xx_edac_mc_init(mci, pdev);
> +       if (rc) {
> +               edac_printk(KERN_ERR, EDAC_MC,
> +                           "Failed to initialize instance\n");
> +               goto free_edac_mc;
> +       }
> +
> +       /* Attempt to register it with the EDAC subsystem */
> +       rc =3D edac_mc_add_mc(mci);
> +       if (rc) {
> +               edac_printk(KERN_ERR, EDAC_MC,
> +                           "Failed to register with EDAC core\n");
> +               goto free_edac_mc;
> +       }
> +
> +       /* Register interrupts */
> +       rc =3D npcm7xx_edac_register_irq(mci, pdev);
> +       if (rc)
> +               goto free_edac_mc;
> +
> +       return 0;
> +
> +free_edac_mc:
> +       edac_mc_free(mci);
> +
> +       return rc;
> +}
> +
> +/**
> + * npcm7xx_edac_mc_remove - Unbind driver from controller
> + * @pdev:      Pointer to the platform_device struct
> + *
> + * Return: Unconditionally 0
> + */
> +static int npcm7xx_edac_mc_remove(struct platform_device *pdev)
> +{
> +       struct mem_ctl_info *mci =3D platform_get_drvdata(pdev);
> +
> +       edac_mc_del_mc(&pdev->dev);
> +       edac_mc_free(mci);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver npcm7xx_edac_driver =3D {
> +       .probe =3D npcm7xx_edac_mc_probe,
> +       .remove =3D npcm7xx_edac_mc_remove,
> +       .driver =3D {
> +                  .name =3D EDAC_MOD_NAME,
> +                  .of_match_table =3D npcm7xx_edac_of_match,
> +       },
> +};
> +
> +module_platform_driver(npcm7xx_edac_driver);
> +
> +MODULE_AUTHOR("Quanta Computer Inc.");
> +MODULE_DESCRIPTION("Nuvoton NPCM7xx EDAC Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.21.0
>
