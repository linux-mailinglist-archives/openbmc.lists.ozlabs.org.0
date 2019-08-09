Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8223885B5
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 00:15:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46501W1c4TzDrNY
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 08:15:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LuPn2J+b"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46500q4hNNzDqnw
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 08:15:07 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id k18so6253029otr.3
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 15:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSmnuYdasbW5xf+Aa5aFNbJZpKQ7Mia+1BmFa9zt0ZU=;
 b=LuPn2J+bXuwEuNV0sfHiBr3uPbossPRY81vzBvQreFjQBDE7VCM+YEP73g200Kt617
 57VeACgBnRSWE2ulCKYomgor8MYhxT3Y1jk1rhwGj3h9c/s8x5rzyxd3tLW6mOhqs2Vc
 uXHTse5cjbDz8XLkxKX2w/yq4CbC6trQaCfp0Ur3ro5MVdzNzs9OefrpkwX0l7CDhNJq
 ZKHxWhbUN2+3bQwUPrHl/deajBTtYoE5+q6sfC0NLJl494FaqiCSn+yj29dTrxbKurg8
 82y1Sg/MTMAJGiMj36A+HRwhpHBSE/+qjyPXNZHTY1ySqdH72I6d8Ge1H9iM5dSc/eEl
 38FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSmnuYdasbW5xf+Aa5aFNbJZpKQ7Mia+1BmFa9zt0ZU=;
 b=cP8VtoooQczd2Qgvc0z/seHbnz4ZYTrwHwHn3cRTgvDAUausMfeGrodF5H6jB75An8
 6zQMcHmuB7ODkf+iwCSizo9RNlKs5CiNyTr9QNIX+Q3J6Rg+c6TrZDHsAow4FzdSctw+
 uGj1Ki92TU3eIYkHqcbMXTAMESPMt0iMpF8AqlI8W1T9EOJqDO4B/pumKv8FKMxKuNuj
 uevcK27PB1Z4anXmZ1VRaazNf1PgBg2kweTn6Cw0ZmSRGbwjERBE1IEi07hn7zMKbOUL
 956rB6PcqRdr7cb0qIdcDvHmuqOOv2khut0Nj92QJkAeb9rf0iVQ9jKSLxWX7lEUTjzb
 k1hw==
X-Gm-Message-State: APjAAAXc+jsBZm40m8PYUcofn6B6aYt/f3W1piKqUtGgONqE6Xe27plW
 UF/r0MDzaOTd+PL37jGo1vrFOCEMUSjhvRlQgsE=
X-Google-Smtp-Source: APXvYqwWLluk5yDlLtn/CM3caqQyurtijN7yHnmr+fzw2ExjHoSwbGXifTWGMxIh+cKswid2LHMNstKaOnXO9lIGtXc=
X-Received: by 2002:aca:dd0b:: with SMTP id u11mr8041109oig.162.1565388903864; 
 Fri, 09 Aug 2019 15:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-3-tmaimon77@gmail.com>
 <CADKL2t4=k=73uDMwdg3OJch1ZhRcv6Z5pRFoAbHvPxmSzvJczg@mail.gmail.com>
In-Reply-To: <CADKL2t4=k=73uDMwdg3OJch1ZhRcv6Z5pRFoAbHvPxmSzvJczg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sat, 10 Aug 2019 01:23:18 +0300
Message-ID: <CAP6Zq1iS+Kuecp_a8KyW-0YnU6f1UaGD6sf-M0jwoJwoAt5PBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
To: Benjamin Fair <benjaminfair@google.com>
Content-Type: multipart/alternative; boundary="0000000000008ce146058fb6810f"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008ce146058fb6810f
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Aug 2019 at 21:02, Benjamin Fair <benjaminfair@google.com> wrote:

> On Thu, Aug 8, 2019 at 6:15 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Add Nuvoton NPCM BMC Flash Interface Unit(FIU) SPI master
> > controller driver using SPI-MEM interface.
> >
> > The FIU supports single, dual or quad communication interface.
> >
> > the FIU controller can operate in following modes:
> > - User Mode Access(UMA): provides flash access by using an
> >   indirect address/data mechanism.
> > - direct rd/wr mode: maps the flash memory into the core
> >   address space.
> > - SPI-X mode: used for an expansion bus to an ASIC or CPLD.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/spi/Kconfig        |  10 +
> >  drivers/spi/Makefile       |   1 +
> >  drivers/spi/spi-npcm-fiu.c | 761 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 772 insertions(+)
> >  create mode 100644 drivers/spi/spi-npcm-fiu.c
> >
> > diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> > index 3a1d8f1170de..6ee514fd0920 100644
> > --- a/drivers/spi/Kconfig
> > +++ b/drivers/spi/Kconfig
> > @@ -433,6 +433,16 @@ config SPI_MT7621
> >         help
> >           This selects a driver for the MediaTek MT7621 SPI Controller.
> >
> > +config SPI_NPCM_FIU
> > +       tristate "Nuvoton NPCM FLASH Interface Unit"
> > +       depends on ARCH_NPCM || COMPILE_TEST
> > +       depends on OF && HAS_IOMEM
> > +       help
> > +         This enables support for the Flash Interface Unit SPI
> controller
> > +         in master mode.
> > +         This driver does not support generic SPI. The implementation
> only
> > +         supports spi-mem interface.
> > +
> >  config SPI_NPCM_PSPI
> >         tristate "Nuvoton NPCM PSPI Controller"
> >         depends on ARCH_NPCM || COMPILE_TEST
> > diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
> > index 63dcab552bcb..adbebee93a75 100644
> > --- a/drivers/spi/Makefile
> > +++ b/drivers/spi/Makefile
> > @@ -63,6 +63,7 @@ obj-$(CONFIG_SPI_MT65XX)                += spi-mt65xx.o
> >  obj-$(CONFIG_SPI_MT7621)               += spi-mt7621.o
> >  obj-$(CONFIG_SPI_MXIC)                 += spi-mxic.o
> >  obj-$(CONFIG_SPI_MXS)                  += spi-mxs.o
> > +obj-$(CONFIG_SPI_NPCM_FIU)             += spi-npcm-fiu.o
> >  obj-$(CONFIG_SPI_NPCM_PSPI)            += spi-npcm-pspi.o
> >  obj-$(CONFIG_SPI_NUC900)               += spi-nuc900.o
> >  obj-$(CONFIG_SPI_NXP_FLEXSPI)          += spi-nxp-fspi.o
> > diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
> > new file mode 100644
> > index 000000000000..2d8c281e8fa9
> > --- /dev/null
> > +++ b/drivers/spi/spi-npcm-fiu.c
> > @@ -0,0 +1,761 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2019 Nuvoton Technology corporation.
> > +
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/ioport.h>
> > +#include <linux/clk.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/io.h>
> > +#include <linux/vmalloc.h>
> > +#include <linux/regmap.h>
> > +#include <linux/of_device.h>
> > +#include <linux/spi/spi-mem.h>
> > +#include <linux/mfd/syscon.h>
> > +
> > +/* NPCM7xx GCR module */
> > +#define NPCM7XX_INTCR3_OFFSET          0x9C
> > +#define NPCM7XX_INTCR3_FIU_FIX         BIT(6)
> > +
> > +/* Flash Interface Unit (FIU) Registers */
> > +#define NPCM_FIU_DRD_CFG               0x00
> > +#define NPCM_FIU_DWR_CFG               0x04
> > +#define NPCM_FIU_UMA_CFG               0x08
> > +#define NPCM_FIU_UMA_CTS               0x0C
> > +#define NPCM_FIU_UMA_CMD               0x10
> > +#define NPCM_FIU_UMA_ADDR              0x14
> > +#define NPCM_FIU_PRT_CFG               0x18
> > +#define NPCM_FIU_UMA_DW0               0x20
> > +#define NPCM_FIU_UMA_DW1               0x24
> > +#define NPCM_FIU_UMA_DW2               0x28
> > +#define NPCM_FIU_UMA_DW3               0x2C
> > +#define NPCM_FIU_UMA_DR0               0x30
> > +#define NPCM_FIU_UMA_DR1               0x34
> > +#define NPCM_FIU_UMA_DR2               0x38
> > +#define NPCM_FIU_UMA_DR3               0x3C
> > +#define NPCM_FIU_MAX_REG_LIMIT         0x80
> > +
> > +/* FIU Direct Read Configuration Register */
> > +#define NPCM_FIU_DRD_CFG_LCK           BIT(31)
> > +#define NPCM_FIU_DRD_CFG_R_BURST       GENMASK(25, 24)
> > +#define NPCM_FIU_DRD_CFG_ADDSIZ                GENMASK(17, 16)
> > +#define NPCM_FIU_DRD_CFG_DBW           GENMASK(13, 12)
> > +#define NPCM_FIU_DRD_CFG_ACCTYPE       GENMASK(9, 8)
> > +#define NPCM_FIU_DRD_CFG_RDCMD         GENMASK(7, 0)
> > +#define NPCM_FIU_DRD_ADDSIZ_SHIFT      16
> > +#define NPCM_FIU_DRD_DBW_SHIFT         12
> > +#define NPCM_FIU_DRD_ACCTYPE_SHIFT     8
> > +
> > +/* FIU Direct Write Configuration Register */
> > +#define NPCM_FIU_DWR_CFG_LCK           BIT(31)
> > +#define NPCM_FIU_DWR_CFG_W_BURST       GENMASK(25, 24)
> > +#define NPCM_FIU_DWR_CFG_ADDSIZ                GENMASK(17, 16)
> > +#define NPCM_FIU_DWR_CFG_ABPCK         GENMASK(11, 10)
> > +#define NPCM_FIU_DWR_CFG_DBPCK         GENMASK(9, 8)
> > +#define NPCM_FIU_DWR_CFG_WRCMD         GENMASK(7, 0)
> > +#define NPCM_FIU_DWR_ADDSIZ_SHIFT      16
> > +#define NPCM_FIU_DWR_ABPCK_SHIFT       10
> > +#define NPCM_FIU_DWR_DBPCK_SHIFT       8
> > +
> > +/* FIU UMA Configuration Register */
> > +#define NPCM_FIU_UMA_CFG_LCK           BIT(31)
> > +#define NPCM_FIU_UMA_CFG_CMMLCK                BIT(30)
> > +#define NPCM_FIU_UMA_CFG_RDATSIZ       GENMASK(28, 24)
> > +#define NPCM_FIU_UMA_CFG_DBSIZ         GENMASK(23, 21)
> > +#define NPCM_FIU_UMA_CFG_WDATSIZ       GENMASK(20, 16)
> > +#define NPCM_FIU_UMA_CFG_ADDSIZ                GENMASK(13, 11)
> > +#define NPCM_FIU_UMA_CFG_CMDSIZ                BIT(10)
> > +#define NPCM_FIU_UMA_CFG_RDBPCK                GENMASK(9, 8)
> > +#define NPCM_FIU_UMA_CFG_DBPCK         GENMASK(7, 6)
> > +#define NPCM_FIU_UMA_CFG_WDBPCK                GENMASK(5, 4)
> > +#define NPCM_FIU_UMA_CFG_ADBPCK                GENMASK(3, 2)
> > +#define NPCM_FIU_UMA_CFG_CMBPCK                GENMASK(1, 0)
> > +#define NPCM_FIU_UMA_CFG_ADBPCK_SHIFT  2
> > +#define NPCM_FIU_UMA_CFG_WDBPCK_SHIFT  4
> > +#define NPCM_FIU_UMA_CFG_DBPCK_SHIFT   6
> > +#define NPCM_FIU_UMA_CFG_RDBPCK_SHIFT  8
> > +#define NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT  11
> > +#define NPCM_FIU_UMA_CFG_WDATSIZ_SHIFT 16
> > +#define NPCM_FIU_UMA_CFG_DBSIZ_SHIFT   21
> > +#define NPCM_FIU_UMA_CFG_RDATSIZ_SHIFT 24
> > +
> > +/* FIU UMA Control and Status Register */
> > +#define NPCM_FIU_UMA_CTS_RDYIE         BIT(25)
> > +#define NPCM_FIU_UMA_CTS_RDYST         BIT(24)
> > +#define NPCM_FIU_UMA_CTS_SW_CS         BIT(16)
> > +#define NPCM_FIU_UMA_CTS_DEV_NUM       GENMASK(9, 8)
> > +#define NPCM_FIU_UMA_CTS_EXEC_DONE     BIT(0)
> > +#define NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT 8
> > +
> > +/* FIU UMA Command Register */
> > +#define NPCM_FIU_UMA_CMD_DUM3          GENMASK(31, 24)
> > +#define NPCM_FIU_UMA_CMD_DUM2          GENMASK(23, 16)
> > +#define NPCM_FIU_UMA_CMD_DUM1          GENMASK(15, 8)
> > +#define NPCM_FIU_UMA_CMD_CMD           GENMASK(7, 0)
> > +
> > +/* FIU UMA Address Register */
> > +#define NPCM_FIU_UMA_ADDR_UMA_ADDR     GENMASK(31, 0)
> > +#define NPCM_FIU_UMA_ADDR_AB3          GENMASK(31, 24)
> > +#define NPCM_FIU_UMA_ADDR_AB2          GENMASK(23, 16)
> > +#define NPCM_FIU_UMA_ADDR_AB1          GENMASK(15, 8)
> > +#define NPCM_FIU_UMA_ADDR_AB0          GENMASK(7, 0)
> > +
> > +/* FIU UMA Write Data Bytes 0-3 Register */
> > +#define NPCM_FIU_UMA_DW0_WB3           GENMASK(31, 24)
> > +#define NPCM_FIU_UMA_DW0_WB2           GENMASK(23, 16)
> > +#define NPCM_FIU_UMA_DW0_WB1           GENMASK(15, 8)
> > +#define NPCM_FIU_UMA_DW0_WB0           GENMASK(7, 0)
> > +
> > +/* FIU UMA Write Data Bytes 4-7 Register */
> > +#define NPCM_FIU_UMA_DW1_WB7           GENMASK(31, 24)
> > +#define NPCM_FIU_UMA_DW1_WB6           GENMASK(23, 16)
> > +#define NPCM_FIU_UMA_DW1_WB5           GENMASK(15, 8)
> > +#define NPCM_FIU_UMA_DW1_WB4           GENMASK(7, 0)
> > +
> > +/* FIU UMA Write Data Bytes 8-11 Register */
> > +#define NPCM_FIU_UMA_DW2_WB11          GENMASK(31, 24)
> > +#define NPCM_FIU_UMA_DW2_WB10          GENMASK(23, 16)
> > +#define NPCM_FIU_UMA_DW2_WB9           GENMASK(15, 8)
> > +#define NPCM_FIU_UMA_DW2_WB8           GENMASK(7, 0)
> > +
> > +/* FIU UMA Write Data Bytes 12-15 Register */
> > +#define NPCM_FIU_UMA_DW3_WB15          GENMASK(31, 24)
> > +#define NPCM_FIU_UMA_DW3_WB14          GENMASK(23, 16)
> > +#define NPCM_FIU_UMA_DW3_WB13          GENMASK(15, 8)
> > +#define NPCM_FIU_UMA_DW3_WB12          GENMASK(7, 0)
> > +
> > +/* FIU UMA Read Data Bytes 0-3 Register */
> > +#define NPCM_FIU_UMA_DR0_RB3           GENMASK(31, 24)
> > +#define NPCM_FIU_UMA_DR0_RB2           GENMASK(23, 16)
> > +#define NPCM_FIU_UMA_DR0_RB1           GENMASK(15, 8)
> > +#define NPCM_FIU_UMA_DR0_RB0           GENMASK(7, 0)
> > +
> > +/* FIU UMA Read Data Bytes 4-7 Register */
> > +#define NPCM_FIU_UMA_DR1_RB15          GENMASK(31, 24)
> > +#define NPCM_FIU_UMA_DR1_RB14          GENMASK(23, 16)
> > +#define NPCM_FIU_UMA_DR1_RB13          GENMASK(15, 8)
> > +#define NPCM_FIU_UMA_DR1_RB12          GENMASK(7, 0)
> > +
> > +/* FIU UMA Read Data Bytes 8-11 Register */
> > +#define NPCM_FIU_UMA_DR2_RB15          GENMASK(31, 24)
> > +#define NPCM_FIU_UMA_DR2_RB14          GENMASK(23, 16)
> > +#define NPCM_FIU_UMA_DR2_RB13          GENMASK(15, 8)
> > +#define NPCM_FIU_UMA_DR2_RB12          GENMASK(7, 0)
> > +
> > +/* FIU UMA Read Data Bytes 12-15 Register */
> > +#define NPCM_FIU_UMA_DR3_RB15          GENMASK(31, 24)
> > +#define NPCM_FIU_UMA_DR3_RB14          GENMASK(23, 16)
> > +#define NPCM_FIU_UMA_DR3_RB13          GENMASK(15, 8)
> > +#define NPCM_FIU_UMA_DR3_RB12          GENMASK(7, 0)
> > +
> > +/* FIU Read Mode */
> > +enum {
> > +       DRD_SINGLE_WIRE_MODE    = 0,
> > +       DRD_DUAL_IO_MODE        = 1,
> > +       DRD_QUAD_IO_MODE        = 2,
> > +       DRD_SPI_X_MODE          = 3,
> > +};
> > +
> > +enum {
> > +       DWR_ABPCK_BIT_PER_CLK   = 0,
> > +       DWR_ABPCK_2_BIT_PER_CLK = 1,
> > +       DWR_ABPCK_4_BIT_PER_CLK = 2,
> > +};
> > +
> > +enum {
> > +       DWR_DBPCK_BIT_PER_CLK   = 0,
> > +       DWR_DBPCK_2_BIT_PER_CLK = 1,
> > +       DWR_DBPCK_4_BIT_PER_CLK = 2,
> > +};
> > +
> > +#define NPCM_FIU_DRD_16_BYTE_BURST     0x3000000
> > +#define NPCM_FIU_DWR_16_BYTE_BURST     0x3000000
> > +
> > +#define MAP_SIZE_128MB                 0x8000000
> > +#define MAP_SIZE_16MB                  0x1000000
> > +#define MAP_SIZE_8MB                   0x800000
> > +
> > +#define NUM_BITS_IN_BYTE               8
> > +#define FIU_DRD_MAX_DUMMY_NUMBER       3
> > +#define NPCM_MAX_CHIP_NUM              4
> > +#define CHUNK_SIZE                     16
> > +#define UMA_MICRO_SEC_TIMEOUT          150
> > +
> > +enum {
> > +       FIU0 = 0,
> > +       FIU3,
> > +       FIUX,
> > +};
> > +
> > +struct npcm_fiu_info {
> > +       char *name;
> > +       u32 fiu_id;
> > +       u32 max_map_size;
> > +       u32 max_cs;
> > +};
> > +
> > +struct fiu_data {
> > +       const struct npcm_fiu_info *npcm_fiu_data_info;
> > +       int fiu_max;
> > +};
> > +
> > +static const struct npcm_fiu_info npxm7xx_fiu_info[] = {
> > +       {.name = "FIU0", .fiu_id = FIU0,
> > +               .max_map_size = MAP_SIZE_128MB, .max_cs = 2},
> > +       {.name = "FIU3", .fiu_id = FIU3,
> > +               .max_map_size = MAP_SIZE_128MB, .max_cs = 4},
> > +       {.name = "FIUX", .fiu_id = FIUX,
> > +               .max_map_size = MAP_SIZE_16MB, .max_cs = 2} };
> > +
> > +static const struct fiu_data npxm7xx_fiu_data = {
> > +       .npcm_fiu_data_info = npxm7xx_fiu_info,
> > +       .fiu_max = 3,
> > +};
> > +
> > +struct npcm_fiu_spi;
> > +
> > +struct npcm_fiu_chip {
> > +       void __iomem *flash_region_mapped_ptr;
> > +       struct npcm_fiu_spi *fiu;
> > +       unsigned long clkrate;
> > +       u32 chipselect;
> > +};
> > +
> > +struct npcm_fiu_spi {
> > +       struct npcm_fiu_chip chip[NPCM_MAX_CHIP_NUM];
> > +       const struct npcm_fiu_info *info;
> > +       struct spi_mem_op drd_op;
> > +       struct resource *res_mem;
> > +       struct regmap *regmap;
> > +       unsigned long clkrate;
> > +       struct device *dev;
> > +       struct clk *clk;
> > +       bool spix_mode;
> > +};
> > +
> > +static const struct regmap_config npcm_mtd_regmap_config = {
> > +       .reg_bits = 32,
> > +       .val_bits = 32,
> > +       .reg_stride = 4,
> > +       .max_register = NPCM_FIU_MAX_REG_LIMIT,
> > +};
> > +
> > +static void npcm_fiu_set_drd(struct npcm_fiu_spi *fiu,
> > +                            const struct spi_mem_op *op)
> > +{
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> > +                          NPCM_FIU_DRD_CFG_ACCTYPE,
> > +                          ilog2(op->addr.buswidth) <<
> > +                          NPCM_FIU_DRD_ACCTYPE_SHIFT);
> > +       fiu->drd_op.addr.buswidth = op->addr.buswidth;
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> > +                          NPCM_FIU_DRD_CFG_DBW,
> > +                          ((op->dummy.nbytes * ilog2(op->addr.buswidth))
> > +                           / NUM_BITS_IN_BYTE) <<
> NPCM_FIU_DRD_DBW_SHIFT);
> > +       fiu->drd_op.dummy.nbytes = op->dummy.nbytes;
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> > +                          NPCM_FIU_DRD_CFG_RDCMD, op->cmd.opcode);
> > +       fiu->drd_op.cmd.opcode = op->cmd.opcode;
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> > +                          NPCM_FIU_DRD_CFG_ADDSIZ,
> > +                          (op->addr.nbytes - 3) <<
> NPCM_FIU_DRD_ADDSIZ_SHIFT);
> > +       fiu->drd_op.addr.nbytes = op->addr.nbytes;
> > +}
> > +
> > +static ssize_t npcm_fiu_direct_read(struct spi_mem_dirmap_desc *desc,
> > +                                   u64 offs, size_t len, void *buf)
> > +{
> > +       struct npcm_fiu_spi *fiu =
> > +               spi_controller_get_devdata(desc->mem->spi->master);
> > +       struct npcm_fiu_chip *chip =
> &fiu->chip[desc->mem->spi->chip_select];
> > +       void __iomem *src = (void __iomem
> *)(chip->flash_region_mapped_ptr +
> > +                                            offs);
> > +       u8 *buf_rx = buf;
> > +       u32 i;
> > +
> > +       if (fiu->spix_mode) {
> > +               for (i = 0 ; i < len ; i++)
> > +                       *(buf_rx + i) = ioread8(src + i);
> > +       } else {
> > +               if (desc->info.op_tmpl.addr.buswidth !=
> fiu->drd_op.addr.buswidth ||
> > +                   desc->info.op_tmpl.dummy.nbytes !=
> fiu->drd_op.dummy.nbytes ||
> > +                   desc->info.op_tmpl.cmd.opcode !=
> fiu->drd_op.cmd.opcode ||
> > +                   desc->info.op_tmpl.addr.nbytes !=
> fiu->drd_op.addr.nbytes)
> > +                       npcm_fiu_set_drd(fiu, &desc->info.op_tmpl);
> > +
> > +               memcpy_fromio(buf_rx, src, len);
>
> Does this need to make sure the memcpy is aligned, or is that handled
> at a higher layer?
>

The memcpy_fromio use in the direct functions can deal with unaligned
address, we have stress test it for some time
and it working well, I have sent Kun the test stress scripts.


> > +       }
> > +
> > +       return len;
> > +}
> > +
> > +static ssize_t npcm_fiu_direct_write(struct spi_mem_dirmap_desc *desc,
> > +                                    u64 offs, size_t len, const void
> *buf)
> > +{
> > +       struct npcm_fiu_spi *fiu =
> > +               spi_controller_get_devdata(desc->mem->spi->master);
> > +       struct npcm_fiu_chip *chip =
> &fiu->chip[desc->mem->spi->chip_select];
> > +       void __iomem *dst = (void __iomem
> *)(chip->flash_region_mapped_ptr +
> > +                                            offs);
> > +       const u8 *buf_tx = buf;
> > +       u32 i;
> > +
> > +       if (fiu->spix_mode)
> > +               for (i = 0 ; i < len ; i++)
> > +                       iowrite8(*(buf_tx + i), dst + i);
> > +       else
> > +               memcpy_toio(dst, buf_tx, len);
> > +
> > +       return len;
> > +}
> > +
> > +static int npcm_fiu_uma_read(struct spi_mem *mem,
> > +                            const struct spi_mem_op *op, u32 addr,
> > +                             bool is_address_size, u8 *data, u32
> data_size)
> > +{
> > +       struct npcm_fiu_spi *fiu =
> > +               spi_controller_get_devdata(mem->spi->master);
> > +       u32 uma_cfg = BIT(10);
> > +       u32 data_reg[4];
> > +       int ret;
> > +       u32 val;
> > +       u32 i;
> > +
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> > +                          NPCM_FIU_UMA_CTS_DEV_NUM,
> > +                          (mem->spi->chip_select <<
> > +                           NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CMD,
> > +                          NPCM_FIU_UMA_CMD_CMD, op->cmd.opcode);
> > +
> > +       if (is_address_size) {
> > +               uma_cfg |= ilog2(op->cmd.buswidth);
> > +               uma_cfg |= ilog2(op->addr.buswidth)
> > +                       << NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
> > +               uma_cfg |= ilog2(op->dummy.buswidth)
> > +                       << NPCM_FIU_UMA_CFG_DBPCK_SHIFT;
> > +               uma_cfg |= ilog2(op->data.buswidth)
> > +                       << NPCM_FIU_UMA_CFG_RDBPCK_SHIFT;
> > +               uma_cfg |= op->dummy.nbytes <<
> NPCM_FIU_UMA_CFG_DBSIZ_SHIFT;
> > +               uma_cfg |= op->addr.nbytes <<
> NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
> > +               regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, addr);
> > +       } else {
> > +               regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, 0x0);
> > +       }
> > +
> > +       uma_cfg |= data_size << NPCM_FIU_UMA_CFG_RDATSIZ_SHIFT;
> > +       regmap_write(fiu->regmap, NPCM_FIU_UMA_CFG, uma_cfg);
> > +       regmap_write_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> > +                         NPCM_FIU_UMA_CTS_EXEC_DONE,
> > +                         NPCM_FIU_UMA_CTS_EXEC_DONE);
> > +       ret = regmap_read_poll_timeout(fiu->regmap, NPCM_FIU_UMA_CTS,
> val,
> > +                                      (!(val &
> NPCM_FIU_UMA_CTS_EXEC_DONE)), 0,
> > +                                      UMA_MICRO_SEC_TIMEOUT);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (data_size) {
> > +               for (i = 0; i < DIV_ROUND_UP(data_size, 4); i++)
> > +                       regmap_read(fiu->regmap, NPCM_FIU_UMA_DR0 + (i *
> 4),
> > +                                   &data_reg[i]);
> > +               memcpy(data, data_reg, data_size);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int npcm_fiu_uma_write(struct spi_mem *mem,
> > +                             const struct spi_mem_op *op, u8 cmd,
> > +                             bool is_address_size, u8 *data, u32
> data_size)
> > +{
> > +       struct npcm_fiu_spi *fiu =
> > +               spi_controller_get_devdata(mem->spi->master);
> > +       u32 uma_cfg = BIT(10);
> > +       u32 data_reg[4] = {0};
> > +       u32 val;
> > +       u32 i;
> > +
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> > +                          NPCM_FIU_UMA_CTS_DEV_NUM,
> > +                          (mem->spi->chip_select <<
> > +                           NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
> > +
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CMD,
> > +                          NPCM_FIU_UMA_CMD_CMD, cmd);
> > +
> > +       if (data_size) {
> > +               memcpy(data_reg, data, data_size);
> > +               for (i = 0; i < DIV_ROUND_UP(data_size, 4); i++)
> > +                       regmap_write(fiu->regmap, NPCM_FIU_UMA_DW0 + (i
> * 4),
> > +                                    data_reg[i]);
> > +       }
> > +
> > +       if (is_address_size) {
> > +               uma_cfg |= ilog2(op->cmd.buswidth);
> > +               uma_cfg |= ilog2(op->addr.buswidth) <<
> > +                       NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
> > +               uma_cfg |= ilog2(op->data.buswidth) <<
> > +                       NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
> > +               uma_cfg |= op->addr.nbytes <<
> NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
> > +               regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR,
> op->addr.val);
> > +       } else {
> > +               regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, 0x0);
> > +       }
> > +
> > +       uma_cfg |= (data_size << NPCM_FIU_UMA_CFG_WDATSIZ_SHIFT);
> > +       regmap_write(fiu->regmap, NPCM_FIU_UMA_CFG, uma_cfg);
> > +
> > +       regmap_write_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> > +                         NPCM_FIU_UMA_CTS_EXEC_DONE,
> > +                         NPCM_FIU_UMA_CTS_EXEC_DONE);
> > +
> > +       return regmap_read_poll_timeout(fiu->regmap, NPCM_FIU_UMA_CTS,
> val,
> > +                                      (!(val &
> NPCM_FIU_UMA_CTS_EXEC_DONE)), 0,
> > +                                       UMA_MICRO_SEC_TIMEOUT);
> > +}
> > +
> > +static int npcm_fiu_manualwrite(struct spi_mem *mem,
> > +                               const struct spi_mem_op *op)
> > +{
> > +       struct npcm_fiu_spi *fiu =
> > +               spi_controller_get_devdata(mem->spi->master);
> > +       u8 *data = (u8 *)op->data.buf.out;
> > +       u32 num_data_chunks;
> > +       u32 remain_data;
> > +       u32 idx = 0;
> > +       int ret;
> > +
> > +       num_data_chunks  = op->data.nbytes / CHUNK_SIZE;
> > +       remain_data  = op->data.nbytes % CHUNK_SIZE;
> > +
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> > +                          NPCM_FIU_UMA_CTS_DEV_NUM,
> > +                          (mem->spi->chip_select <<
> > +                           NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> > +                          NPCM_FIU_UMA_CTS_SW_CS, 0);
> > +
> > +       ret = npcm_fiu_uma_write(mem, op, op->cmd.opcode, true, NULL, 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Starting the data writing loop in multiples of 8 */
> > +       for (idx = 0; idx < num_data_chunks; ++idx) {
> > +               ret = npcm_fiu_uma_write(mem, op, data[0], false,
> > +                                        &data[1], CHUNK_SIZE - 1);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               data += CHUNK_SIZE;
> > +       }
> > +
> > +       /* Handling chunk remains */
> > +       if (remain_data > 0) {
> > +               ret = npcm_fiu_uma_write(mem, op, data[0], false,
> > +                                        &data[1], remain_data - 1);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> > +                          NPCM_FIU_UMA_CTS_SW_CS,
> NPCM_FIU_UMA_CTS_SW_CS);
> > +
> > +       return 0;
> > +}
> > +
> > +static int npcm_fiu_read(struct spi_mem *mem, const struct spi_mem_op
> *op)
> > +{
> > +       u8 *data = op->data.buf.in;
> > +       int i, readlen, currlen;
> > +       size_t retlen = 0;
> > +       u8 *buf_ptr;
> > +       u32 addr;
> > +       int ret;
> > +
> > +       i = 0;
> > +       currlen = op->data.nbytes;
> > +
> > +       do {
> > +               addr = ((u32)op->addr.val + i);
> > +               if (currlen < 16)
> > +                       readlen = currlen;
> > +               else
> > +                       readlen = 16;
> > +
> > +               buf_ptr = data + i;
> > +               ret = npcm_fiu_uma_read(mem, op, addr, true, buf_ptr,
> > +                                       readlen);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               i += readlen;
> > +               currlen -= 16;
> > +       } while (currlen > 0);
> > +
> > +       retlen = i;
> > +
> > +       return 0;
> > +}
> > +
> > +static void npcm_fiux_set_direct_wr(struct npcm_fiu_spi *fiu)
> > +{
> > +       regmap_write(fiu->regmap, NPCM_FIU_DWR_CFG,
> > +                    NPCM_FIU_DWR_16_BYTE_BURST);
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_DWR_CFG,
> > +                          NPCM_FIU_DWR_CFG_ABPCK,
> > +                          DWR_ABPCK_4_BIT_PER_CLK <<
> NPCM_FIU_DWR_ABPCK_SHIFT);
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_DWR_CFG,
> > +                          NPCM_FIU_DWR_CFG_DBPCK,
> > +                          DWR_DBPCK_4_BIT_PER_CLK <<
> NPCM_FIU_DWR_DBPCK_SHIFT);
> > +}
> > +
> > +static void npcm_fiux_set_direct_rd(struct npcm_fiu_spi *fiu)
> > +{
> > +       u32 rx_dummy = 0;
> > +
> > +       regmap_write(fiu->regmap, NPCM_FIU_DRD_CFG,
> > +                    NPCM_FIU_DRD_16_BYTE_BURST);
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> > +                          NPCM_FIU_DRD_CFG_ACCTYPE,
> > +                          DRD_SPI_X_MODE << NPCM_FIU_DRD_ACCTYPE_SHIFT);
> > +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> > +                          NPCM_FIU_DRD_CFG_DBW,
> > +                          rx_dummy << NPCM_FIU_DRD_DBW_SHIFT);
> > +}
> > +
> > +static int npcm_fiu_exec_op(struct spi_mem *mem, const struct
> spi_mem_op *op)
> > +{
> > +       struct npcm_fiu_spi *fiu =
> > +               spi_controller_get_devdata(mem->spi->master);
> > +       struct npcm_fiu_chip *chip = &fiu->chip[mem->spi->chip_select];
> > +       int ret = 0;
> > +       u8 *buf;
> > +
> > +       dev_dbg(fiu->dev, "cmd:%#x mode:%d.%d.%d.%d addr:%#llx
> len:%#x\n",
> > +               op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> > +               op->dummy.buswidth, op->data.buswidth, op->addr.val,
> > +               op->data.nbytes);
> > +
> > +       if (fiu->spix_mode)
> > +               return -ENOTSUPP;
> > +
> > +       if (fiu->clkrate != chip->clkrate) {
> > +               ret = clk_set_rate(fiu->clk, chip->clkrate);
> > +               if (ret < 0)
> > +                       dev_warn(fiu->dev, "Failed setting %lu
> frequancy, stay at %lu frequancy\n", chip->clkrate, fiu->clkrate);
> > +               else
> > +                       fiu->clkrate = chip->clkrate;
> > +       }
> > +
> > +       if (op->data.dir == SPI_MEM_DATA_IN) {
> > +               if (!op->addr.nbytes) {
> > +                       buf = op->data.buf.in;
> > +                       ret = npcm_fiu_uma_read(mem, op, op->addr.val,
> false,
> > +                                               buf, op->data.nbytes);
> > +               } else {
> > +                       ret = npcm_fiu_read(mem, op);
> > +               }
> > +       } else  {
> > +               if (!op->addr.nbytes || !op->data.nbytes) {
> > +                       if (op->data.nbytes)
> > +                               buf = (u8 *)op->data.buf.out;
> > +                       else
> > +                               buf = NULL;
> > +                       ret = npcm_fiu_uma_write(mem, op,
> op->cmd.opcode, false,
> > +                                                buf, op->data.nbytes);
> > +               } else {
> > +                       ret = npcm_fiu_manualwrite(mem, op);
> > +               }
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> > +static int npcm_fiu_dirmap_create(struct spi_mem_dirmap_desc *desc)
> > +{
> > +       struct npcm_fiu_spi *fiu =
> > +               spi_controller_get_devdata(desc->mem->spi->master);
> > +       struct npcm_fiu_chip *chip =
> &fiu->chip[desc->mem->spi->chip_select];
> > +       struct regmap *gcr_regmap;
> > +
> > +       if (!fiu->res_mem) {
> > +               dev_warn(fiu->dev, "Reserved memory not defined, direct
> read disabled\n");
> > +               desc->nodirmap = true;
> > +               return 0;
> > +       }
> > +
> > +       if (!fiu->spix_mode &&
> > +           desc->info.op_tmpl.data.dir == SPI_MEM_DATA_OUT) {
> > +               desc->nodirmap = true;
> > +               return 0;
> > +       }
> > +
> > +       if (!chip->flash_region_mapped_ptr) {
> > +               chip->flash_region_mapped_ptr =
> > +                       devm_ioremap_nocache(fiu->dev,
> (fiu->res_mem->start +
> > +
> (fiu->info->max_map_size *
> > +
>  desc->mem->spi->chip_select)),
> > +                                            (u32)desc->info.length);
> > +               if (!chip->flash_region_mapped_ptr) {
> > +                       dev_warn(fiu->dev, "Error mapping memory region,
> direct read disabled\n");
> > +                       desc->nodirmap = true;
> > +                       return 0;
> > +               }
> > +       }
> > +
> > +       if (of_device_is_compatible(fiu->dev->of_node,
> "nuvoton,npcm750-fiu")) {
> > +               gcr_regmap =
> > +
>  syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
> > +               if (IS_ERR(gcr_regmap)) {
> > +                       dev_warn(fiu->dev, "Didn't find
> nuvoton,npcm750-gcr, direct read disabled\n");
> > +                       desc->nodirmap = true;
> > +                       return 0;
> > +               }
> > +               regmap_update_bits(gcr_regmap, NPCM7XX_INTCR3_OFFSET,
> > +                                  NPCM7XX_INTCR3_FIU_FIX,
> > +                                  NPCM7XX_INTCR3_FIU_FIX);
> > +       }
> > +
> > +       if (desc->info.op_tmpl.data.dir == SPI_MEM_DATA_IN) {
> > +               if (!fiu->spix_mode)
> > +                       npcm_fiu_set_drd(fiu, &desc->info.op_tmpl);
> > +               else
> > +                       npcm_fiux_set_direct_rd(fiu);
> > +
> > +       } else {
> > +               npcm_fiux_set_direct_wr(fiu);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int npcm_fiu_setup(struct spi_device *spi)
> > +{
> > +       struct spi_controller *ctrl = spi->master;
> > +       struct npcm_fiu_spi *fiu = spi_controller_get_devdata(ctrl);
> > +       struct npcm_fiu_chip *chip;
> > +
> > +       chip = &fiu->chip[spi->chip_select];
> > +       chip->fiu = fiu;
> > +       chip->chipselect = spi->chip_select;
> > +       chip->clkrate = spi->max_speed_hz;
> > +
> > +       fiu->clkrate = clk_get_rate(fiu->clk);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
> > +       .exec_op = npcm_fiu_exec_op,
> > +       .dirmap_create = npcm_fiu_dirmap_create,
> > +       .dirmap_read = npcm_fiu_direct_read,
> > +       .dirmap_write = npcm_fiu_direct_write,
> > +};
> > +
> > +static const struct of_device_id npcm_fiu_dt_ids[] = {
> > +       { .compatible = "nuvoton,npcm750-fiu", .data =
> &npxm7xx_fiu_data  },
> > +       { /* sentinel */ }
> > +};
> > +
> > +static int npcm_fiu_probe(struct platform_device *pdev)
> > +{
> > +       const struct fiu_data *fiu_data_match;
> > +       const struct of_device_id *match;
> > +       struct device *dev = &pdev->dev;
> > +       struct spi_controller *ctrl;
> > +       struct npcm_fiu_spi *fiu;
> > +       void __iomem *regbase;
> > +       struct resource *res;
> > +       int ret;
> > +       int id;
> > +
> > +       ctrl = spi_alloc_master(dev, sizeof(*fiu));
> > +       if (!ctrl)
> > +               return -ENOMEM;
> > +
> > +       fiu = spi_controller_get_devdata(ctrl);
> > +
> > +       match = of_match_device(npcm_fiu_dt_ids, dev);
> > +       if (!match || !match->data) {
> > +               dev_err(dev, "No compatible OF match\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       fiu_data_match = match->data;
> > +       id = of_alias_get_id(dev->of_node, "fiu");
> > +       if (id < 0 || id >= fiu_data_match->fiu_max) {
> > +               dev_err(dev, "Invalid platform device id: %d\n", id);
> > +               return -EINVAL;
> > +       }
> > +
> > +       fiu->info = &fiu_data_match->npcm_fiu_data_info[id];
> > +
> > +       platform_set_drvdata(pdev, fiu);
> > +       fiu->dev = dev;
> > +
> > +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "control");
> > +       regbase = devm_ioremap_resource(dev, res);
> > +       if (IS_ERR(regbase))
> > +               return PTR_ERR(regbase);
> > +
> > +       fiu->regmap = devm_regmap_init_mmio(dev, regbase,
> > +                                           &npcm_mtd_regmap_config);
> > +       if (IS_ERR(fiu->regmap)) {
> > +               dev_err(dev, "Failed to create regmap\n");
> > +               return PTR_ERR(fiu->regmap);
> > +       }
> > +
> > +       fiu->res_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > +                                                   "memory");
> > +       fiu->clk = devm_clk_get(dev, NULL);
> > +       if (IS_ERR(fiu->clk))
> > +               return PTR_ERR(fiu->clk);
> > +
> > +       fiu->spix_mode = of_property_read_bool(dev->of_node,
> "spix-mode");
> > +
> > +       platform_set_drvdata(pdev, fiu);
> > +       clk_prepare_enable(fiu->clk);
> > +
> > +       ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD
> > +               | SPI_TX_DUAL | SPI_TX_QUAD;
> > +       ctrl->setup = npcm_fiu_setup;
> > +       ctrl->bus_num = -1;
> > +       ctrl->mem_ops = &npcm_fiu_mem_ops;
> > +       ctrl->num_chipselect = fiu->info->max_cs;
> > +       ctrl->dev.of_node = dev->of_node;
> > +
> > +       ret = devm_spi_register_master(dev, ctrl);
> > +       if (ret)
> > +               return ret;
> > +
> > +       dev_info(dev, "NPCM %s probe succeed\n", fiu->info->name);
> > +
> > +       return 0;
> > +}
> > +
> > +static int npcm_fiu_remove(struct platform_device *pdev)
> > +{
> > +       struct npcm_fiu_spi *fiu = platform_get_drvdata(pdev);
> > +
> > +       clk_disable_unprepare(fiu->clk);
> > +       return 0;
> > +}
> > +
> > +MODULE_DEVICE_TABLE(of, npcm_fiu_dt_ids);
> > +
> > +static struct platform_driver npcm_fiu_driver = {
> > +       .driver = {
> > +               .name   = "NPCM-FIU",
> > +               .bus    = &platform_bus_type,
> > +               .of_match_table = npcm_fiu_dt_ids,
> > +       },
> > +       .probe      = npcm_fiu_probe,
> > +       .remove     = npcm_fiu_remove,
> > +};
> > +module_platform_driver(npcm_fiu_driver);
> > +
> > +MODULE_DESCRIPTION("Nuvoton FLASH Interface Unit SPI Controller
> Driver");
> > +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.18.0
> >
>

--0000000000008ce146058fb6810f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 9 Aug 2019 at 21:02, Benjamin=
 Fair &lt;<a href=3D"mailto:benjaminfair@google.com">benjaminfair@google.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Thu, Aug 8, 2019 at 6:15 AM Tomer Maimon &lt;<a href=3D"mailto:tmaimon7=
7@gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add Nuvoton NPCM BMC Flash Interface Unit(FIU) SPI master<br>
&gt; controller driver using SPI-MEM interface.<br>
&gt;<br>
&gt; The FIU supports single, dual or quad communication interface.<br>
&gt;<br>
&gt; the FIU controller can operate in following modes:<br>
&gt; - User Mode Access(UMA): provides flash access by using an<br>
&gt;=C2=A0 =C2=A0indirect address/data mechanism.<br>
&gt; - direct rd/wr mode: maps the flash memory into the core<br>
&gt;=C2=A0 =C2=A0address space.<br>
&gt; - SPI-X mode: used for an expansion bus to an ASIC or CPLD.<br>
&gt;<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/spi/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br>
&gt;=C2=A0 drivers/spi/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +=
<br>
&gt;=C2=A0 drivers/spi/spi-npcm-fiu.c | 761 +++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 3 files changed, 772 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/spi/spi-npcm-fiu.c<br>
&gt;<br>
&gt; diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig<br>
&gt; index 3a1d8f1170de..6ee514fd0920 100644<br>
&gt; --- a/drivers/spi/Kconfig<br>
&gt; +++ b/drivers/spi/Kconfig<br>
&gt; @@ -433,6 +433,16 @@ config SPI_MT7621<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This selects a driver for the =
MediaTek MT7621 SPI Controller.<br>
&gt;<br>
&gt; +config SPI_NPCM_FIU<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Nuvoton NPCM FLASH Interfac=
e Unit&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_NPCM || COMPILE_TEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on OF &amp;&amp; HAS_IOMEM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This enables support for the Flash =
Interface Unit SPI controller<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in master mode.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver does not support generi=
c SPI. The implementation only<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0supports spi-mem interface.<br>
&gt; +<br>
&gt;=C2=A0 config SPI_NPCM_PSPI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Nuvoton NPCM PSPI Cont=
roller&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_NPCM || COMPILE_TEST<=
br>
&gt; diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile<br>
&gt; index 63dcab552bcb..adbebee93a75 100644<br>
&gt; --- a/drivers/spi/Makefile<br>
&gt; +++ b/drivers/spi/Makefile<br>
&gt; @@ -63,6 +63,7 @@ obj-$(CONFIG_SPI_MT65XX)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D spi-mt65xx.o<br>
&gt;=C2=A0 obj-$(CONFIG_SPI_MT7621)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0+=3D spi-mt7621.o<br>
&gt;=C2=A0 obj-$(CONFIG_SPI_MXIC)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0+=3D spi-mxic.o<br>
&gt;=C2=A0 obj-$(CONFIG_SPI_MXS)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 +=3D spi-mxs.o<br>
&gt; +obj-$(CONFIG_SPI_NPCM_FIU)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0+=3D spi-npcm-fiu.o<br>
&gt;=C2=A0 obj-$(CONFIG_SPI_NPCM_PSPI)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 +=3D spi-npcm-pspi.o<br>
&gt;=C2=A0 obj-$(CONFIG_SPI_NUC900)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0+=3D spi-nuc900.o<br>
&gt;=C2=A0 obj-$(CONFIG_SPI_NXP_FLEXSPI)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
+=3D spi-nxp-fspi.o<br>
&gt; diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000000..2d8c281e8fa9<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/spi/spi-npcm-fiu.c<br>
&gt; @@ -0,0 +1,761 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +// Copyright (c) 2019 Nuvoton Technology corporation.<br>
&gt; +<br>
&gt; +#include &lt;linux/init.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/ioport.h&gt;<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/vmalloc.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/spi/spi-mem.h&gt;<br>
&gt; +#include &lt;linux/mfd/syscon.h&gt;<br>
&gt; +<br>
&gt; +/* NPCM7xx GCR module */<br>
&gt; +#define NPCM7XX_INTCR3_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x9C<=
br>
&gt; +#define NPCM7XX_INTCR3_FIU_FIX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(6=
)<br>
&gt; +<br>
&gt; +/* Flash Interface Unit (FIU) Registers */<br>
&gt; +#define NPCM_FIU_DRD_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x00<br>
&gt; +#define NPCM_FIU_DWR_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x04<br>
&gt; +#define NPCM_FIU_UMA_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x08<br>
&gt; +#define NPCM_FIU_UMA_CTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x0C<br>
&gt; +#define NPCM_FIU_UMA_CMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x10<br>
&gt; +#define NPCM_FIU_UMA_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x14<br>
&gt; +#define NPCM_FIU_PRT_CFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x18<br>
&gt; +#define NPCM_FIU_UMA_DW0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x20<br>
&gt; +#define NPCM_FIU_UMA_DW1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x24<br>
&gt; +#define NPCM_FIU_UMA_DW2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x28<br>
&gt; +#define NPCM_FIU_UMA_DW3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x2C<br>
&gt; +#define NPCM_FIU_UMA_DR0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x30<br>
&gt; +#define NPCM_FIU_UMA_DR1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x34<br>
&gt; +#define NPCM_FIU_UMA_DR2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x38<br>
&gt; +#define NPCM_FIU_UMA_DR3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x3C<br>
&gt; +#define NPCM_FIU_MAX_REG_LIMIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x80<=
br>
&gt; +<br>
&gt; +/* FIU Direct Read Configuration Register */<br>
&gt; +#define NPCM_FIU_DRD_CFG_LCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
BIT(31)<br>
&gt; +#define NPCM_FIU_DRD_CFG_R_BURST=C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(25=
, 24)<br>
&gt; +#define NPCM_FIU_DRD_CFG_ADDSIZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GENMASK(17, 16)<br>
&gt; +#define NPCM_FIU_DRD_CFG_DBW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(13, 12)<br>
&gt; +#define NPCM_FIU_DRD_CFG_ACCTYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(9,=
 8)<br>
&gt; +#define NPCM_FIU_DRD_CFG_RDCMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMA=
SK(7, 0)<br>
&gt; +#define NPCM_FIU_DRD_ADDSIZ_SHIFT=C2=A0 =C2=A0 =C2=A0 16<br>
&gt; +#define NPCM_FIU_DRD_DBW_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012<br=
>
&gt; +#define NPCM_FIU_DRD_ACCTYPE_SHIFT=C2=A0 =C2=A0 =C2=A08<br>
&gt; +<br>
&gt; +/* FIU Direct Write Configuration Register */<br>
&gt; +#define NPCM_FIU_DWR_CFG_LCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
BIT(31)<br>
&gt; +#define NPCM_FIU_DWR_CFG_W_BURST=C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(25=
, 24)<br>
&gt; +#define NPCM_FIU_DWR_CFG_ADDSIZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GENMASK(17, 16)<br>
&gt; +#define NPCM_FIU_DWR_CFG_ABPCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMA=
SK(11, 10)<br>
&gt; +#define NPCM_FIU_DWR_CFG_DBPCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMA=
SK(9, 8)<br>
&gt; +#define NPCM_FIU_DWR_CFG_WRCMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMA=
SK(7, 0)<br>
&gt; +#define NPCM_FIU_DWR_ADDSIZ_SHIFT=C2=A0 =C2=A0 =C2=A0 16<br>
&gt; +#define NPCM_FIU_DWR_ABPCK_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A010<br>
&gt; +#define NPCM_FIU_DWR_DBPCK_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
&gt; +<br>
&gt; +/* FIU UMA Configuration Register */<br>
&gt; +#define NPCM_FIU_UMA_CFG_LCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
BIT(31)<br>
&gt; +#define NPCM_FIU_UMA_CFG_CMMLCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(30)<br>
&gt; +#define NPCM_FIU_UMA_CFG_RDATSIZ=C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(28=
, 24)<br>
&gt; +#define NPCM_FIU_UMA_CFG_DBSIZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMA=
SK(23, 21)<br>
&gt; +#define NPCM_FIU_UMA_CFG_WDATSIZ=C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(20=
, 16)<br>
&gt; +#define NPCM_FIU_UMA_CFG_ADDSIZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GENMASK(13, 11)<br>
&gt; +#define NPCM_FIU_UMA_CFG_CMDSIZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(10)<br>
&gt; +#define NPCM_FIU_UMA_CFG_RDBPCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GENMASK(9, 8)<br>
&gt; +#define NPCM_FIU_UMA_CFG_DBPCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GENMA=
SK(7, 6)<br>
&gt; +#define NPCM_FIU_UMA_CFG_WDBPCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GENMASK(5, 4)<br>
&gt; +#define NPCM_FIU_UMA_CFG_ADBPCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GENMASK(3, 2)<br>
&gt; +#define NPCM_FIU_UMA_CFG_CMBPCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GENMASK(1, 0)<br>
&gt; +#define NPCM_FIU_UMA_CFG_ADBPCK_SHIFT=C2=A0 2<br>
&gt; +#define NPCM_FIU_UMA_CFG_WDBPCK_SHIFT=C2=A0 4<br>
&gt; +#define NPCM_FIU_UMA_CFG_DBPCK_SHIFT=C2=A0 =C2=A06<br>
&gt; +#define NPCM_FIU_UMA_CFG_RDBPCK_SHIFT=C2=A0 8<br>
&gt; +#define NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT=C2=A0 11<br>
&gt; +#define NPCM_FIU_UMA_CFG_WDATSIZ_SHIFT 16<br>
&gt; +#define NPCM_FIU_UMA_CFG_DBSIZ_SHIFT=C2=A0 =C2=A021<br>
&gt; +#define NPCM_FIU_UMA_CFG_RDATSIZ_SHIFT 24<br>
&gt; +<br>
&gt; +/* FIU UMA Control and Status Register */<br>
&gt; +#define NPCM_FIU_UMA_CTS_RDYIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(2=
5)<br>
&gt; +#define NPCM_FIU_UMA_CTS_RDYST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(2=
4)<br>
&gt; +#define NPCM_FIU_UMA_CTS_SW_CS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(1=
6)<br>
&gt; +#define NPCM_FIU_UMA_CTS_DEV_NUM=C2=A0 =C2=A0 =C2=A0 =C2=A0GENMASK(9,=
 8)<br>
&gt; +#define NPCM_FIU_UMA_CTS_EXEC_DONE=C2=A0 =C2=A0 =C2=A0BIT(0)<br>
&gt; +#define NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT 8<br>
&gt; +<br>
&gt; +/* FIU UMA Command Register */<br>
&gt; +#define NPCM_FIU_UMA_CMD_DUM3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(31, 24)<br>
&gt; +#define NPCM_FIU_UMA_CMD_DUM2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(23, 16)<br>
&gt; +#define NPCM_FIU_UMA_CMD_DUM1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(15, 8)<br>
&gt; +#define NPCM_FIU_UMA_CMD_CMD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(7, 0)<br>
&gt; +<br>
&gt; +/* FIU UMA Address Register */<br>
&gt; +#define NPCM_FIU_UMA_ADDR_UMA_ADDR=C2=A0 =C2=A0 =C2=A0GENMASK(31, 0)<=
br>
&gt; +#define NPCM_FIU_UMA_ADDR_AB3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(31, 24)<br>
&gt; +#define NPCM_FIU_UMA_ADDR_AB2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(23, 16)<br>
&gt; +#define NPCM_FIU_UMA_ADDR_AB1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(15, 8)<br>
&gt; +#define NPCM_FIU_UMA_ADDR_AB0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(7, 0)<br>
&gt; +<br>
&gt; +/* FIU UMA Write Data Bytes 0-3 Register */<br>
&gt; +#define NPCM_FIU_UMA_DW0_WB3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(31, 24)<br>
&gt; +#define NPCM_FIU_UMA_DW0_WB2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(23, 16)<br>
&gt; +#define NPCM_FIU_UMA_DW0_WB1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(15, 8)<br>
&gt; +#define NPCM_FIU_UMA_DW0_WB0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(7, 0)<br>
&gt; +<br>
&gt; +/* FIU UMA Write Data Bytes 4-7 Register */<br>
&gt; +#define NPCM_FIU_UMA_DW1_WB7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(31, 24)<br>
&gt; +#define NPCM_FIU_UMA_DW1_WB6=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(23, 16)<br>
&gt; +#define NPCM_FIU_UMA_DW1_WB5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(15, 8)<br>
&gt; +#define NPCM_FIU_UMA_DW1_WB4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(7, 0)<br>
&gt; +<br>
&gt; +/* FIU UMA Write Data Bytes 8-11 Register */<br>
&gt; +#define NPCM_FIU_UMA_DW2_WB11=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(31, 24)<br>
&gt; +#define NPCM_FIU_UMA_DW2_WB10=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(23, 16)<br>
&gt; +#define NPCM_FIU_UMA_DW2_WB9=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(15, 8)<br>
&gt; +#define NPCM_FIU_UMA_DW2_WB8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(7, 0)<br>
&gt; +<br>
&gt; +/* FIU UMA Write Data Bytes 12-15 Register */<br>
&gt; +#define NPCM_FIU_UMA_DW3_WB15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(31, 24)<br>
&gt; +#define NPCM_FIU_UMA_DW3_WB14=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(23, 16)<br>
&gt; +#define NPCM_FIU_UMA_DW3_WB13=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(15, 8)<br>
&gt; +#define NPCM_FIU_UMA_DW3_WB12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(7, 0)<br>
&gt; +<br>
&gt; +/* FIU UMA Read Data Bytes 0-3 Register */<br>
&gt; +#define NPCM_FIU_UMA_DR0_RB3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(31, 24)<br>
&gt; +#define NPCM_FIU_UMA_DR0_RB2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(23, 16)<br>
&gt; +#define NPCM_FIU_UMA_DR0_RB1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(15, 8)<br>
&gt; +#define NPCM_FIU_UMA_DR0_RB0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GENMASK(7, 0)<br>
&gt; +<br>
&gt; +/* FIU UMA Read Data Bytes 4-7 Register */<br>
&gt; +#define NPCM_FIU_UMA_DR1_RB15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(31, 24)<br>
&gt; +#define NPCM_FIU_UMA_DR1_RB14=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(23, 16)<br>
&gt; +#define NPCM_FIU_UMA_DR1_RB13=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(15, 8)<br>
&gt; +#define NPCM_FIU_UMA_DR1_RB12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(7, 0)<br>
&gt; +<br>
&gt; +/* FIU UMA Read Data Bytes 8-11 Register */<br>
&gt; +#define NPCM_FIU_UMA_DR2_RB15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(31, 24)<br>
&gt; +#define NPCM_FIU_UMA_DR2_RB14=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(23, 16)<br>
&gt; +#define NPCM_FIU_UMA_DR2_RB13=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(15, 8)<br>
&gt; +#define NPCM_FIU_UMA_DR2_RB12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(7, 0)<br>
&gt; +<br>
&gt; +/* FIU UMA Read Data Bytes 12-15 Register */<br>
&gt; +#define NPCM_FIU_UMA_DR3_RB15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(31, 24)<br>
&gt; +#define NPCM_FIU_UMA_DR3_RB14=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(23, 16)<br>
&gt; +#define NPCM_FIU_UMA_DR3_RB13=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(15, 8)<br>
&gt; +#define NPCM_FIU_UMA_DR3_RB12=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GENMA=
SK(7, 0)<br>
&gt; +<br>
&gt; +/* FIU Read Mode */<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRD_SINGLE_WIRE_MODE=C2=A0 =C2=A0 =3D 0,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRD_DUAL_IO_MODE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRD_QUAD_IO_MODE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRD_SPI_X_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D 3,<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DWR_ABPCK_BIT_PER_CLK=C2=A0 =C2=A0=3D 0,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DWR_ABPCK_2_BIT_PER_CLK =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DWR_ABPCK_4_BIT_PER_CLK =3D 2,<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DWR_DBPCK_BIT_PER_CLK=C2=A0 =C2=A0=3D 0,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DWR_DBPCK_2_BIT_PER_CLK =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DWR_DBPCK_4_BIT_PER_CLK =3D 2,<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define NPCM_FIU_DRD_16_BYTE_BURST=C2=A0 =C2=A0 =C2=A00x3000000<br>
&gt; +#define NPCM_FIU_DWR_16_BYTE_BURST=C2=A0 =C2=A0 =C2=A00x3000000<br>
&gt; +<br>
&gt; +#define MAP_SIZE_128MB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x8000000<br>
&gt; +#define MAP_SIZE_16MB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x1000000<br>
&gt; +#define MAP_SIZE_8MB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x800000<br>
&gt; +<br>
&gt; +#define NUM_BITS_IN_BYTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A08<br>
&gt; +#define FIU_DRD_MAX_DUMMY_NUMBER=C2=A0 =C2=A0 =C2=A0 =C2=A03<br>
&gt; +#define NPCM_MAX_CHIP_NUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 4<br>
&gt; +#define CHUNK_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A016<br>
&gt; +#define UMA_MICRO_SEC_TIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 150<b=
r>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FIU0 =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FIU3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FIUX,<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct npcm_fiu_info {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 fiu_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 max_map_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 max_cs;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct fiu_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct npcm_fiu_info *npcm_fiu_data_=
info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int fiu_max;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct npcm_fiu_info npxm7xx_fiu_info[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{.name =3D &quot;FIU0&quot;, .fiu_id =3D F=
IU0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_map_size =
=3D MAP_SIZE_128MB, .max_cs =3D 2},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{.name =3D &quot;FIU3&quot;, .fiu_id =3D F=
IU3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_map_size =
=3D MAP_SIZE_128MB, .max_cs =3D 4},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{.name =3D &quot;FIUX&quot;, .fiu_id =3D F=
IUX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_map_size =
=3D MAP_SIZE_16MB, .max_cs =3D 2} };<br>
&gt; +<br>
&gt; +static const struct fiu_data npxm7xx_fiu_data =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.npcm_fiu_data_info =3D npxm7xx_fiu_info,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.fiu_max =3D 3,<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct npcm_fiu_spi;<br>
&gt; +<br>
&gt; +struct npcm_fiu_chip {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *flash_region_mapped_ptr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long clkrate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 chipselect;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct npcm_fiu_spi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_chip chip[NPCM_MAX_CHIP_NU=
M];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct npcm_fiu_info *info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spi_mem_op drd_op;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res_mem;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regmap *regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long clkrate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool spix_mode;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct regmap_config npcm_mtd_regmap_config =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_bits =3D 32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.val_bits =3D 32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_stride =3D 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.max_register =3D NPCM_FIU_MAX_REG_LIMIT,<=
br>
&gt; +};<br>
&gt; +<br>
&gt; +static void npcm_fiu_set_drd(struct npcm_fiu_spi *fiu,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct spi_mem_op *op)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_DRD_CFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_CFG_ACCTYPE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ilog2(op-&gt;addr.buswidth) &lt;&lt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_ACCTYPE_SHIFT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;drd_op.addr.buswidth =3D op-&gt;ad=
dr.buswidth;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_DRD_CFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_CFG_DBW,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ((op-&gt;dummy.nbytes * ilog2(op-&gt;addr.buswidth))<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ NUM_BITS_IN_BYTE) &lt;&lt; NPCM_FIU_DRD_DBW_S=
HIFT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;drd_op.dummy.nbytes =3D op-&gt;dum=
my.nbytes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_DRD_CFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_CFG_RDCMD, op-&gt;cmd.opcode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;drd_op.cmd.opcode =3D op-&gt;cmd.o=
pcode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_DRD_CFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_CFG_ADDSIZ,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (op-&gt;addr.nbytes - 3) &lt;&lt; NPCM_FIU_DRD_ADDSIZ=
_SHIFT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;drd_op.addr.nbytes =3D op-&gt;addr=
.nbytes;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t npcm_fiu_direct_read(struct spi_mem_dirmap_desc *desc,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 offs, size_t le=
n, void *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi_controller=
_get_devdata(desc-&gt;mem-&gt;spi-&gt;master);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_chip *chip =3D &amp;fiu-&g=
t;chip[desc-&gt;mem-&gt;spi-&gt;chip_select];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *src =3D (void __iomem *)(chi=
p-&gt;flash_region_mapped_ptr +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 offs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *buf_rx =3D buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fiu-&gt;spix_mode) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0 ;=
 i &lt; len ; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0*(buf_rx + i) =3D ioread8(src + i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc-&gt;i=
nfo.op_tmpl.addr.buswidth !=3D fiu-&gt;drd_op.addr.buswidth ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
desc-&gt;info.op_tmpl.dummy.nbytes !=3D fiu-&gt;drd_op.dummy.nbytes ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
desc-&gt;info.op_tmpl.cmd.opcode !=3D fiu-&gt;drd_op.cmd.opcode ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
desc-&gt;info.op_tmpl.addr.nbytes !=3D fiu-&gt;drd_op.addr.nbytes)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0npcm_fiu_set_drd(fiu, &amp;desc-&gt;info.op_tmpl);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy_fromio(=
buf_rx, src, len);<br>
<br>
Does this need to make sure the memcpy is aligned, or is that handled<br>
at a higher layer?<br></blockquote><div>=C2=A0</div><div>The memcpy_fromio =
use in the direct functions can deal with unaligned address, we have stress=
 test it for some time<br></div><div>and it working well, I have sent Kun t=
he test stress scripts.</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t npcm_fiu_direct_write(struct spi_mem_dirmap_desc *desc=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 offs, size_t l=
en, const void *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi_controller=
_get_devdata(desc-&gt;mem-&gt;spi-&gt;master);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_chip *chip =3D &amp;fiu-&g=
t;chip[desc-&gt;mem-&gt;spi-&gt;chip_select];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *dst =3D (void __iomem *)(chi=
p-&gt;flash_region_mapped_ptr +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 offs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const u8 *buf_tx =3D buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fiu-&gt;spix_mode)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0 ;=
 i &lt; len ; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0iowrite8(*(buf_tx + i), dst + i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy_toio(ds=
t, buf_tx, len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_fiu_uma_read(struct spi_mem *mem,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct spi_mem_op *op, u32 addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_address_size, u8 *data, u32 data=
_size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi_controller=
_get_devdata(mem-&gt;spi-&gt;master);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 uma_cfg =3D BIT(10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 data_reg[4];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_UMA_CTS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_UMA_CTS_DEV_NUM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (mem-&gt;spi-&gt;chip_select &lt;&lt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_UMA_CMD,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_UMA_CMD_CMD, op-&gt;cmd.opcode);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_address_size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D i=
log2(op-&gt;cmd.buswidth);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D i=
log2(op-&gt;addr.buswidth)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&lt;&lt; NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D i=
log2(op-&gt;dummy.buswidth)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&lt;&lt; NPCM_FIU_UMA_CFG_DBPCK_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D i=
log2(op-&gt;data.buswidth)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&lt;&lt; NPCM_FIU_UMA_CFG_RDBPCK_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D o=
p-&gt;dummy.nbytes &lt;&lt; NPCM_FIU_UMA_CFG_DBSIZ_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D o=
p-&gt;addr.nbytes &lt;&lt; NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(f=
iu-&gt;regmap, NPCM_FIU_UMA_ADDR, addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(f=
iu-&gt;regmap, NPCM_FIU_UMA_ADDR, 0x0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D data_size &lt;&lt; NPCM_FIU_U=
MA_CFG_RDATSIZ_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(fiu-&gt;regmap, NPCM_FIU_UMA_=
CFG, uma_cfg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write_bits(fiu-&gt;regmap, NPCM_FIU=
_UMA_CTS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CTS_EXEC_DONE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CTS_EXEC_DONE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D regmap_read_poll_timeout(fiu-&gt;r=
egmap, NPCM_FIU_UMA_CTS, val,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (!(val &amp=
; NPCM_FIU_UMA_CTS_EXEC_DONE)), 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UMA_MICRO_S=
EC_TIMEOUT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data_size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; =
i &lt; DIV_ROUND_UP(data_size, 4); i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0regmap_read(fiu-&gt;regmap, NPCM_FIU_UMA_DR0 + (i * 4),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;data_reg[i]);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(data, d=
ata_reg, data_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_fiu_uma_write(struct spi_mem *mem,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct spi_mem_op *op, u8 cmd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_address_size, u8 *data, u32 data=
_size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi_controller=
_get_devdata(mem-&gt;spi-&gt;master);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 uma_cfg =3D BIT(10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 data_reg[4] =3D {0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_UMA_CTS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_UMA_CTS_DEV_NUM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (mem-&gt;spi-&gt;chip_select &lt;&lt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_UMA_CMD,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_UMA_CMD_CMD, cmd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data_size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(data_re=
g, data, data_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; =
i &lt; DIV_ROUND_UP(data_size, 4); i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0regmap_write(fiu-&gt;regmap, NPCM_FIU_UMA_DW0 + (i * 4),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data_reg[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_address_size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D i=
log2(op-&gt;cmd.buswidth);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D i=
log2(op-&gt;addr.buswidth) &lt;&lt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D i=
log2(op-&gt;data.buswidth) &lt;&lt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D o=
p-&gt;addr.nbytes &lt;&lt; NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(f=
iu-&gt;regmap, NPCM_FIU_UMA_ADDR, op-&gt;addr.val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(f=
iu-&gt;regmap, NPCM_FIU_UMA_ADDR, 0x0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uma_cfg |=3D (data_size &lt;&lt; NPCM_FIU_=
UMA_CFG_WDATSIZ_SHIFT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(fiu-&gt;regmap, NPCM_FIU_UMA_=
CFG, uma_cfg);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write_bits(fiu-&gt;regmap, NPCM_FIU=
_UMA_CTS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CTS_EXEC_DONE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CTS_EXEC_DONE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return regmap_read_poll_timeout(fiu-&gt;re=
gmap, NPCM_FIU_UMA_CTS, val,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (!(val &amp=
; NPCM_FIU_UMA_CTS_EXEC_DONE)), 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UMA_M=
ICRO_SEC_TIMEOUT);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_fiu_manualwrite(struct spi_mem *mem,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct spi_mem_op *op)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi_controller=
_get_devdata(mem-&gt;spi-&gt;master);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *data =3D (u8 *)op-&gt;data.buf.out;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 num_data_chunks;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 remain_data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 idx =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0num_data_chunks=C2=A0 =3D op-&gt;data.nbyt=
es / CHUNK_SIZE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0remain_data=C2=A0 =3D op-&gt;data.nbytes %=
 CHUNK_SIZE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_UMA_CTS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_UMA_CTS_DEV_NUM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (mem-&gt;spi-&gt;chip_select &lt;&lt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_UMA_CTS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_UMA_CTS_SW_CS, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D npcm_fiu_uma_write(mem, op, op-&gt=
;cmd.opcode, true, NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Starting the data writing loop in multi=
ples of 8 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (idx =3D 0; idx &lt; num_data_chunks; =
++idx) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D npcm_f=
iu_uma_write(mem, op, data[0], false,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;data[1], CHUNK_SIZE - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data +=3D CHUN=
K_SIZE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Handling chunk remains */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (remain_data &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D npcm_f=
iu_uma_write(mem, op, data[0], false,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;data[1], remain_data - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_UMA_CTS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_UMA_CTS_SW_CS, NPCM_FIU_UMA_CTS_SW_CS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_fiu_read(struct spi_mem *mem, const struct spi_mem_op=
 *op)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *data =3D op-&gt;<a href=3D"http://data=
.buf.in" rel=3D"noreferrer" target=3D"_blank">data.buf.in</a>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, readlen, currlen;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t retlen =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *buf_ptr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0currlen =3D op-&gt;data.nbytes;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D ((u32=
)op-&gt;addr.val + i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (currlen &l=
t; 16)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0readlen =3D currlen;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0readlen =3D 16;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf_ptr =3D da=
ta + i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D npcm_f=
iu_uma_read(mem, op, addr, true, buf_ptr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl=
en);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i +=3D readlen=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0currlen -=3D 1=
6;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (currlen &gt; 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0retlen =3D i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm_fiux_set_direct_wr(struct npcm_fiu_spi *fiu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(fiu-&gt;regmap, NPCM_FIU_DWR_=
CFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 NPCM_FIU_DWR_16_BYTE_BURST);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_DWR_CFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DWR_CFG_ABPCK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 DWR_ABPCK_4_BIT_PER_CLK &lt;&lt; NPCM_FIU_DWR_ABPCK_S=
HIFT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_DWR_CFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DWR_CFG_DBPCK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 DWR_DBPCK_4_BIT_PER_CLK &lt;&lt; NPCM_FIU_DWR_DBPCK_S=
HIFT);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm_fiux_set_direct_rd(struct npcm_fiu_spi *fiu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rx_dummy =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(fiu-&gt;regmap, NPCM_FIU_DRD_=
CFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 NPCM_FIU_DRD_16_BYTE_BURST);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_DRD_CFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_CFG_ACCTYPE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 DRD_SPI_X_MODE &lt;&lt; NPCM_FIU_DRD_ACCTYPE_SHIFT);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NPCM_FI=
U_DRD_CFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_CFG_DBW,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 rx_dummy &lt;&lt; NPCM_FIU_DRD_DBW_SHIFT);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_fiu_exec_op(struct spi_mem *mem, const struct spi_mem=
_op *op)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi_controller=
_get_devdata(mem-&gt;spi-&gt;master);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_chip *chip =3D &amp;fiu-&g=
t;chip[mem-&gt;spi-&gt;chip_select];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(fiu-&gt;dev, &quot;cmd:%#x mode:%d=
.%d.%d.%d addr:%#llx len:%#x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0op-&gt;cmd.opc=
ode, op-&gt;cmd.buswidth, op-&gt;addr.buswidth,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0op-&gt;dummy.b=
uswidth, op-&gt;data.buswidth, op-&gt;addr.val,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0op-&gt;data.nb=
ytes);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fiu-&gt;spix_mode)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSU=
PP;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fiu-&gt;clkrate !=3D chip-&gt;clkrate)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_se=
t_rate(fiu-&gt;clk, chip-&gt;clkrate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dev_warn(fiu-&gt;dev, &quot;Failed setting %lu frequancy, sta=
y at %lu frequancy\n&quot;, chip-&gt;clkrate, fiu-&gt;clkrate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0fiu-&gt;clkrate =3D chip-&gt;clkrate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (op-&gt;data.dir =3D=3D SPI_MEM_DATA_IN=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!op-&gt;ad=
dr.nbytes) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0buf =3D op-&gt;<a href=3D"http://data.buf.in" rel=3D"noreferr=
er" target=3D"_blank">data.buf.in</a>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D npcm_fiu_uma_read(mem, op, op-&gt;addr.val, false,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0buf, op-&gt;data.nbytes);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D npcm_fiu_read(mem, op);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!op-&gt;ad=
dr.nbytes || !op-&gt;data.nbytes) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (op-&gt;data.nbytes)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D (u8 *)op-&gt;data.buf.out=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D npcm_fiu_uma_write(mem, op, op-&gt;cmd.opcode, false,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 buf, op-&gt;data.nbytes);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D npcm_fiu_manualwrite(mem, op);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_fiu_dirmap_create(struct spi_mem_dirmap_desc *desc)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi_controller=
_get_devdata(desc-&gt;mem-&gt;spi-&gt;master);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_chip *chip =3D &amp;fiu-&g=
t;chip[desc-&gt;mem-&gt;spi-&gt;chip_select];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regmap *gcr_regmap;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fiu-&gt;res_mem) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(fiu-&=
gt;dev, &quot;Reserved memory not defined, direct read disabled\n&quot;);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;nodir=
map =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fiu-&gt;spix_mode &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;info.op_tmpl.data.d=
ir =3D=3D SPI_MEM_DATA_OUT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;nodir=
map =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!chip-&gt;flash_region_mapped_ptr) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;flash=
_region_mapped_ptr =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0devm_ioremap_nocache(fiu-&gt;dev, (fiu-&gt;res_mem-&gt;start =
+<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (fiu-&gt;info-&gt;max_map_size *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc-&gt;mem-&gt;spi-&gt;chip_select)=
),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (u32)desc-&gt;info.length);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!chip-&gt;=
flash_region_mapped_ptr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dev_warn(fiu-&gt;dev, &quot;Error mapping memory region, dire=
ct read disabled\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0desc-&gt;nodirmap =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_device_is_compatible(fiu-&gt;dev-&g=
t;of_node, &quot;nuvoton,npcm750-fiu&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcr_regmap =3D=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0syscon_regmap_lookup_by_compatible(&quot;nuvoton,npcm750-gcr&=
quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(gcr=
_regmap)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dev_warn(fiu-&gt;dev, &quot;Didn&#39;t find nuvoton,npcm750-g=
cr, direct read disabled\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0desc-&gt;nodirmap =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_=
bits(gcr_regmap, NPCM7XX_INTCR3_OFFSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_INTCR3_FIU_FIX,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_INTCR3_FIU_FIX);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc-&gt;info.op_tmpl.data.dir =3D=3D =
SPI_MEM_DATA_IN) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fiu-&gt;s=
pix_mode)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0npcm_fiu_set_drd(fiu, &amp;desc-&gt;info.op_tmpl);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0npcm_fiux_set_direct_rd(fiu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm_fiux_set_=
direct_wr(fiu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_fiu_setup(struct spi_device *spi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spi_controller *ctrl =3D spi-&gt;ma=
ster;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu =3D spi_controlle=
r_get_devdata(ctrl);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_chip *chip;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip =3D &amp;fiu-&gt;chip[spi-&gt;chip_se=
lect];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;fiu =3D fiu;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;chipselect =3D spi-&gt;chip_selec=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;clkrate =3D spi-&gt;max_speed_hz;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;clkrate =3D clk_get_rate(fiu-&gt;c=
lk);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct spi_controller_mem_ops npcm_fiu_mem_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.exec_op =3D npcm_fiu_exec_op,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.dirmap_create =3D npcm_fiu_dirmap_create,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.dirmap_read =3D npcm_fiu_direct_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.dirmap_write =3D npcm_fiu_direct_write,<b=
r>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct of_device_id npcm_fiu_dt_ids[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,npcm750-fi=
u&quot;, .data =3D &amp;npxm7xx_fiu_data=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ /* sentinel */ }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int npcm_fiu_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct fiu_data *fiu_data_match;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct of_device_id *match;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spi_controller *ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *regbase;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int id;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl =3D spi_alloc_master(dev, sizeof(*fiu=
));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctrl)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu =3D spi_controller_get_devdata(ctrl);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0match =3D of_match_device(npcm_fiu_dt_ids,=
 dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!match || !match-&gt;data) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &=
quot;No compatible OF match\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu_data_match =3D match-&gt;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D of_alias_get_id(dev-&gt;of_node, &q=
uot;fiu&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (id &lt; 0 || id &gt;=3D fiu_data_match=
-&gt;fiu_max) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &=
quot;Invalid platform device id: %d\n&quot;, id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;info =3D &amp;fiu_data_match-&gt;n=
pcm_fiu_data_info[id];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, fiu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;dev =3D dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev,=
 IORESOURCE_MEM, &quot;control&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0regbase =3D devm_ioremap_resource(dev, res=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(regbase))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(regbase);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;regmap =3D devm_regmap_init_mmio(d=
ev, regbase,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;npcm_mtd_regmap_config);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(fiu-&gt;regmap)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &=
quot;Failed to create regmap\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(fiu-&gt;regmap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;res_mem =3D platform_get_resource_=
byname(pdev, IORESOURCE_MEM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;memory&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;clk =3D devm_clk_get(dev, NULL);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(fiu-&gt;clk))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(fiu-&gt;clk);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fiu-&gt;spix_mode =3D of_property_read_boo=
l(dev-&gt;of_node, &quot;spix-mode&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, fiu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_prepare_enable(fiu-&gt;clk);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl-&gt;mode_bits =3D SPI_RX_DUAL | SPI_R=
X_QUAD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| SPI_TX_DUAL =
| SPI_TX_QUAD;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl-&gt;setup =3D npcm_fiu_setup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl-&gt;bus_num =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl-&gt;mem_ops =3D &amp;npcm_fiu_mem_ops=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl-&gt;num_chipselect =3D fiu-&gt;info-&=
gt;max_cs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl-&gt;dev.of_node =3D dev-&gt;of_node;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_spi_register_master(dev, ctrl=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(dev, &quot;NPCM %s probe succeed\=
n&quot;, fiu-&gt;info-&gt;name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_fiu_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_fiu_spi *fiu =3D platform_get_=
drvdata(pdev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(fiu-&gt;clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +MODULE_DEVICE_TABLE(of, npcm_fiu_dt_ids);<br>
&gt; +<br>
&gt; +static struct platform_driver npcm_fiu_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =
=C2=A0=3D &quot;NPCM-FIU&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.bus=C2=A0 =C2=
=A0 =3D &amp;platform_bus_type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_tabl=
e =3D npcm_fiu_dt_ids,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =3D npcm_fiu_pr=
obe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0=3D npcm_fiu_re=
move,<br>
&gt; +};<br>
&gt; +module_platform_driver(npcm_fiu_driver);<br>
&gt; +<br>
&gt; +MODULE_DESCRIPTION(&quot;Nuvoton FLASH Interface Unit SPI Controller =
Driver&quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Tomer Maimon &lt;<a href=3D"mailto:tomer.maimon@n=
uvoton.com" target=3D"_blank">tomer.maimon@nuvoton.com</a>&gt;&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; --<br>
&gt; 2.18.0<br>
&gt;<br>
</blockquote></div></div>

--0000000000008ce146058fb6810f--
