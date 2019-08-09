Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71716881F0
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 20:03:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464tQH1lnlzDrKW
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 04:03:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="g0oi6CqA"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464tPJ4YZFzDrDr
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 04:02:26 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id k18so3766949otr.3
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 11:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h3dChRxMujcpJS/h7Gf+sQx61G+5xszBXdmMOQDhv1M=;
 b=g0oi6CqAAQxe2E6hp6nt7KSkDFm/q5DlK3KWqaUDx6Bp0jlufJsAcurxcrSyGlwFP2
 /RvA7urrh9enhpMtOOy/nX6Q6Nb8J/WUBwxwkD3+jIj1jYJviniewjKimZ2SWDjOWgkK
 t2I3EqHIx3HfrGq5cYMAnQEZNHMbh/yj2Oj6aLUDFVshLVlrQ5pZ5Iixy6jtu6UlCCLk
 mK2BUh9Ej1bBgWNpVnYOkIqMZkgZHrdq3SzqqYOGhSesMtH+jnz66eF9Sn/9zNUflxvY
 uHSBQZR9hH/rkmItuY2ZrKAhrKqwepUsMzNTpxStB/a3f9YNWMUmm9lV/jEq/XOHMDKa
 6bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h3dChRxMujcpJS/h7Gf+sQx61G+5xszBXdmMOQDhv1M=;
 b=W5GMattAI0rm3fWxy14BoMJT+os2CYIJysF5wF9X4QB3vVeZhV6Y+YeXwoxtdRp3j3
 oXCsBRHwL+QBeI0ByDaLLbxuAAsT5D/BHxZUDsmU9utyfV4u//BAcYz9rnO+CLxseMGc
 Ec62Mhy3KcXMcSboS+m3mLVW3A6uHfXgLiRuaxrH/3wxUgPCQvNWvvDrVQZoASJGCZPU
 eF7etooS9jErFPHDTPm4JUovelb0sAZzCTiDb4hjmeSfGclMLND+MewFZGRuVaaMYa+u
 QSl7RM2m5MBL5NIbsT+10ccJHM63TP/2A23GMyICntU7ykWAbhV40sbF90g3TUvgs8iA
 4sqg==
X-Gm-Message-State: APjAAAUyksTCVT/uv2/CmXy/Lwj9Czus9cbHst4YLDkDn00bQhYlVA2u
 odlBYQdPyqSFCeINurCMNO4nnH38T3ml3L7SNQX+FA==
X-Google-Smtp-Source: APXvYqwngz2wfrTAed/STUVSr9QbRWy6iKBS9zVgrC7Uk6kr8Y+1SQ8Vs8OmXHwxhxvEjUHT63ji+6Ak8gxXO+Hl8aQ=
X-Received: by 2002:a6b:f718:: with SMTP id k24mr11226585iog.126.1565373742130; 
 Fri, 09 Aug 2019 11:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-3-tmaimon77@gmail.com>
In-Reply-To: <20190808131448.349161-3-tmaimon77@gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 9 Aug 2019 11:01:44 -0700
Message-ID: <CADKL2t4=k=73uDMwdg3OJch1ZhRcv6Z5pRFoAbHvPxmSzvJczg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 bbrezillon@kernel.org, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Tali Perry <tali.perry1@gmail.com>, broonie@kernel.org,
 linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 8, 2019 at 6:15 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Nuvoton NPCM BMC Flash Interface Unit(FIU) SPI master
> controller driver using SPI-MEM interface.
>
> The FIU supports single, dual or quad communication interface.
>
> the FIU controller can operate in following modes:
> - User Mode Access(UMA): provides flash access by using an
>   indirect address/data mechanism.
> - direct rd/wr mode: maps the flash memory into the core
>   address space.
> - SPI-X mode: used for an expansion bus to an ASIC or CPLD.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/spi/Kconfig        |  10 +
>  drivers/spi/Makefile       |   1 +
>  drivers/spi/spi-npcm-fiu.c | 761 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 772 insertions(+)
>  create mode 100644 drivers/spi/spi-npcm-fiu.c
>
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 3a1d8f1170de..6ee514fd0920 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -433,6 +433,16 @@ config SPI_MT7621
>         help
>           This selects a driver for the MediaTek MT7621 SPI Controller.
>
> +config SPI_NPCM_FIU
> +       tristate "Nuvoton NPCM FLASH Interface Unit"
> +       depends on ARCH_NPCM || COMPILE_TEST
> +       depends on OF && HAS_IOMEM
> +       help
> +         This enables support for the Flash Interface Unit SPI controller
> +         in master mode.
> +         This driver does not support generic SPI. The implementation only
> +         supports spi-mem interface.
> +
>  config SPI_NPCM_PSPI
>         tristate "Nuvoton NPCM PSPI Controller"
>         depends on ARCH_NPCM || COMPILE_TEST
> diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
> index 63dcab552bcb..adbebee93a75 100644
> --- a/drivers/spi/Makefile
> +++ b/drivers/spi/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_SPI_MT65XX)                += spi-mt65xx.o
>  obj-$(CONFIG_SPI_MT7621)               += spi-mt7621.o
>  obj-$(CONFIG_SPI_MXIC)                 += spi-mxic.o
>  obj-$(CONFIG_SPI_MXS)                  += spi-mxs.o
> +obj-$(CONFIG_SPI_NPCM_FIU)             += spi-npcm-fiu.o
>  obj-$(CONFIG_SPI_NPCM_PSPI)            += spi-npcm-pspi.o
>  obj-$(CONFIG_SPI_NUC900)               += spi-nuc900.o
>  obj-$(CONFIG_SPI_NXP_FLEXSPI)          += spi-nxp-fspi.o
> diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
> new file mode 100644
> index 000000000000..2d8c281e8fa9
> --- /dev/null
> +++ b/drivers/spi/spi-npcm-fiu.c
> @@ -0,0 +1,761 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Nuvoton Technology corporation.
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/ioport.h>
> +#include <linux/clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/vmalloc.h>
> +#include <linux/regmap.h>
> +#include <linux/of_device.h>
> +#include <linux/spi/spi-mem.h>
> +#include <linux/mfd/syscon.h>
> +
> +/* NPCM7xx GCR module */
> +#define NPCM7XX_INTCR3_OFFSET          0x9C
> +#define NPCM7XX_INTCR3_FIU_FIX         BIT(6)
> +
> +/* Flash Interface Unit (FIU) Registers */
> +#define NPCM_FIU_DRD_CFG               0x00
> +#define NPCM_FIU_DWR_CFG               0x04
> +#define NPCM_FIU_UMA_CFG               0x08
> +#define NPCM_FIU_UMA_CTS               0x0C
> +#define NPCM_FIU_UMA_CMD               0x10
> +#define NPCM_FIU_UMA_ADDR              0x14
> +#define NPCM_FIU_PRT_CFG               0x18
> +#define NPCM_FIU_UMA_DW0               0x20
> +#define NPCM_FIU_UMA_DW1               0x24
> +#define NPCM_FIU_UMA_DW2               0x28
> +#define NPCM_FIU_UMA_DW3               0x2C
> +#define NPCM_FIU_UMA_DR0               0x30
> +#define NPCM_FIU_UMA_DR1               0x34
> +#define NPCM_FIU_UMA_DR2               0x38
> +#define NPCM_FIU_UMA_DR3               0x3C
> +#define NPCM_FIU_MAX_REG_LIMIT         0x80
> +
> +/* FIU Direct Read Configuration Register */
> +#define NPCM_FIU_DRD_CFG_LCK           BIT(31)
> +#define NPCM_FIU_DRD_CFG_R_BURST       GENMASK(25, 24)
> +#define NPCM_FIU_DRD_CFG_ADDSIZ                GENMASK(17, 16)
> +#define NPCM_FIU_DRD_CFG_DBW           GENMASK(13, 12)
> +#define NPCM_FIU_DRD_CFG_ACCTYPE       GENMASK(9, 8)
> +#define NPCM_FIU_DRD_CFG_RDCMD         GENMASK(7, 0)
> +#define NPCM_FIU_DRD_ADDSIZ_SHIFT      16
> +#define NPCM_FIU_DRD_DBW_SHIFT         12
> +#define NPCM_FIU_DRD_ACCTYPE_SHIFT     8
> +
> +/* FIU Direct Write Configuration Register */
> +#define NPCM_FIU_DWR_CFG_LCK           BIT(31)
> +#define NPCM_FIU_DWR_CFG_W_BURST       GENMASK(25, 24)
> +#define NPCM_FIU_DWR_CFG_ADDSIZ                GENMASK(17, 16)
> +#define NPCM_FIU_DWR_CFG_ABPCK         GENMASK(11, 10)
> +#define NPCM_FIU_DWR_CFG_DBPCK         GENMASK(9, 8)
> +#define NPCM_FIU_DWR_CFG_WRCMD         GENMASK(7, 0)
> +#define NPCM_FIU_DWR_ADDSIZ_SHIFT      16
> +#define NPCM_FIU_DWR_ABPCK_SHIFT       10
> +#define NPCM_FIU_DWR_DBPCK_SHIFT       8
> +
> +/* FIU UMA Configuration Register */
> +#define NPCM_FIU_UMA_CFG_LCK           BIT(31)
> +#define NPCM_FIU_UMA_CFG_CMMLCK                BIT(30)
> +#define NPCM_FIU_UMA_CFG_RDATSIZ       GENMASK(28, 24)
> +#define NPCM_FIU_UMA_CFG_DBSIZ         GENMASK(23, 21)
> +#define NPCM_FIU_UMA_CFG_WDATSIZ       GENMASK(20, 16)
> +#define NPCM_FIU_UMA_CFG_ADDSIZ                GENMASK(13, 11)
> +#define NPCM_FIU_UMA_CFG_CMDSIZ                BIT(10)
> +#define NPCM_FIU_UMA_CFG_RDBPCK                GENMASK(9, 8)
> +#define NPCM_FIU_UMA_CFG_DBPCK         GENMASK(7, 6)
> +#define NPCM_FIU_UMA_CFG_WDBPCK                GENMASK(5, 4)
> +#define NPCM_FIU_UMA_CFG_ADBPCK                GENMASK(3, 2)
> +#define NPCM_FIU_UMA_CFG_CMBPCK                GENMASK(1, 0)
> +#define NPCM_FIU_UMA_CFG_ADBPCK_SHIFT  2
> +#define NPCM_FIU_UMA_CFG_WDBPCK_SHIFT  4
> +#define NPCM_FIU_UMA_CFG_DBPCK_SHIFT   6
> +#define NPCM_FIU_UMA_CFG_RDBPCK_SHIFT  8
> +#define NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT  11
> +#define NPCM_FIU_UMA_CFG_WDATSIZ_SHIFT 16
> +#define NPCM_FIU_UMA_CFG_DBSIZ_SHIFT   21
> +#define NPCM_FIU_UMA_CFG_RDATSIZ_SHIFT 24
> +
> +/* FIU UMA Control and Status Register */
> +#define NPCM_FIU_UMA_CTS_RDYIE         BIT(25)
> +#define NPCM_FIU_UMA_CTS_RDYST         BIT(24)
> +#define NPCM_FIU_UMA_CTS_SW_CS         BIT(16)
> +#define NPCM_FIU_UMA_CTS_DEV_NUM       GENMASK(9, 8)
> +#define NPCM_FIU_UMA_CTS_EXEC_DONE     BIT(0)
> +#define NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT 8
> +
> +/* FIU UMA Command Register */
> +#define NPCM_FIU_UMA_CMD_DUM3          GENMASK(31, 24)
> +#define NPCM_FIU_UMA_CMD_DUM2          GENMASK(23, 16)
> +#define NPCM_FIU_UMA_CMD_DUM1          GENMASK(15, 8)
> +#define NPCM_FIU_UMA_CMD_CMD           GENMASK(7, 0)
> +
> +/* FIU UMA Address Register */
> +#define NPCM_FIU_UMA_ADDR_UMA_ADDR     GENMASK(31, 0)
> +#define NPCM_FIU_UMA_ADDR_AB3          GENMASK(31, 24)
> +#define NPCM_FIU_UMA_ADDR_AB2          GENMASK(23, 16)
> +#define NPCM_FIU_UMA_ADDR_AB1          GENMASK(15, 8)
> +#define NPCM_FIU_UMA_ADDR_AB0          GENMASK(7, 0)
> +
> +/* FIU UMA Write Data Bytes 0-3 Register */
> +#define NPCM_FIU_UMA_DW0_WB3           GENMASK(31, 24)
> +#define NPCM_FIU_UMA_DW0_WB2           GENMASK(23, 16)
> +#define NPCM_FIU_UMA_DW0_WB1           GENMASK(15, 8)
> +#define NPCM_FIU_UMA_DW0_WB0           GENMASK(7, 0)
> +
> +/* FIU UMA Write Data Bytes 4-7 Register */
> +#define NPCM_FIU_UMA_DW1_WB7           GENMASK(31, 24)
> +#define NPCM_FIU_UMA_DW1_WB6           GENMASK(23, 16)
> +#define NPCM_FIU_UMA_DW1_WB5           GENMASK(15, 8)
> +#define NPCM_FIU_UMA_DW1_WB4           GENMASK(7, 0)
> +
> +/* FIU UMA Write Data Bytes 8-11 Register */
> +#define NPCM_FIU_UMA_DW2_WB11          GENMASK(31, 24)
> +#define NPCM_FIU_UMA_DW2_WB10          GENMASK(23, 16)
> +#define NPCM_FIU_UMA_DW2_WB9           GENMASK(15, 8)
> +#define NPCM_FIU_UMA_DW2_WB8           GENMASK(7, 0)
> +
> +/* FIU UMA Write Data Bytes 12-15 Register */
> +#define NPCM_FIU_UMA_DW3_WB15          GENMASK(31, 24)
> +#define NPCM_FIU_UMA_DW3_WB14          GENMASK(23, 16)
> +#define NPCM_FIU_UMA_DW3_WB13          GENMASK(15, 8)
> +#define NPCM_FIU_UMA_DW3_WB12          GENMASK(7, 0)
> +
> +/* FIU UMA Read Data Bytes 0-3 Register */
> +#define NPCM_FIU_UMA_DR0_RB3           GENMASK(31, 24)
> +#define NPCM_FIU_UMA_DR0_RB2           GENMASK(23, 16)
> +#define NPCM_FIU_UMA_DR0_RB1           GENMASK(15, 8)
> +#define NPCM_FIU_UMA_DR0_RB0           GENMASK(7, 0)
> +
> +/* FIU UMA Read Data Bytes 4-7 Register */
> +#define NPCM_FIU_UMA_DR1_RB15          GENMASK(31, 24)
> +#define NPCM_FIU_UMA_DR1_RB14          GENMASK(23, 16)
> +#define NPCM_FIU_UMA_DR1_RB13          GENMASK(15, 8)
> +#define NPCM_FIU_UMA_DR1_RB12          GENMASK(7, 0)
> +
> +/* FIU UMA Read Data Bytes 8-11 Register */
> +#define NPCM_FIU_UMA_DR2_RB15          GENMASK(31, 24)
> +#define NPCM_FIU_UMA_DR2_RB14          GENMASK(23, 16)
> +#define NPCM_FIU_UMA_DR2_RB13          GENMASK(15, 8)
> +#define NPCM_FIU_UMA_DR2_RB12          GENMASK(7, 0)
> +
> +/* FIU UMA Read Data Bytes 12-15 Register */
> +#define NPCM_FIU_UMA_DR3_RB15          GENMASK(31, 24)
> +#define NPCM_FIU_UMA_DR3_RB14          GENMASK(23, 16)
> +#define NPCM_FIU_UMA_DR3_RB13          GENMASK(15, 8)
> +#define NPCM_FIU_UMA_DR3_RB12          GENMASK(7, 0)
> +
> +/* FIU Read Mode */
> +enum {
> +       DRD_SINGLE_WIRE_MODE    = 0,
> +       DRD_DUAL_IO_MODE        = 1,
> +       DRD_QUAD_IO_MODE        = 2,
> +       DRD_SPI_X_MODE          = 3,
> +};
> +
> +enum {
> +       DWR_ABPCK_BIT_PER_CLK   = 0,
> +       DWR_ABPCK_2_BIT_PER_CLK = 1,
> +       DWR_ABPCK_4_BIT_PER_CLK = 2,
> +};
> +
> +enum {
> +       DWR_DBPCK_BIT_PER_CLK   = 0,
> +       DWR_DBPCK_2_BIT_PER_CLK = 1,
> +       DWR_DBPCK_4_BIT_PER_CLK = 2,
> +};
> +
> +#define NPCM_FIU_DRD_16_BYTE_BURST     0x3000000
> +#define NPCM_FIU_DWR_16_BYTE_BURST     0x3000000
> +
> +#define MAP_SIZE_128MB                 0x8000000
> +#define MAP_SIZE_16MB                  0x1000000
> +#define MAP_SIZE_8MB                   0x800000
> +
> +#define NUM_BITS_IN_BYTE               8
> +#define FIU_DRD_MAX_DUMMY_NUMBER       3
> +#define NPCM_MAX_CHIP_NUM              4
> +#define CHUNK_SIZE                     16
> +#define UMA_MICRO_SEC_TIMEOUT          150
> +
> +enum {
> +       FIU0 = 0,
> +       FIU3,
> +       FIUX,
> +};
> +
> +struct npcm_fiu_info {
> +       char *name;
> +       u32 fiu_id;
> +       u32 max_map_size;
> +       u32 max_cs;
> +};
> +
> +struct fiu_data {
> +       const struct npcm_fiu_info *npcm_fiu_data_info;
> +       int fiu_max;
> +};
> +
> +static const struct npcm_fiu_info npxm7xx_fiu_info[] = {
> +       {.name = "FIU0", .fiu_id = FIU0,
> +               .max_map_size = MAP_SIZE_128MB, .max_cs = 2},
> +       {.name = "FIU3", .fiu_id = FIU3,
> +               .max_map_size = MAP_SIZE_128MB, .max_cs = 4},
> +       {.name = "FIUX", .fiu_id = FIUX,
> +               .max_map_size = MAP_SIZE_16MB, .max_cs = 2} };
> +
> +static const struct fiu_data npxm7xx_fiu_data = {
> +       .npcm_fiu_data_info = npxm7xx_fiu_info,
> +       .fiu_max = 3,
> +};
> +
> +struct npcm_fiu_spi;
> +
> +struct npcm_fiu_chip {
> +       void __iomem *flash_region_mapped_ptr;
> +       struct npcm_fiu_spi *fiu;
> +       unsigned long clkrate;
> +       u32 chipselect;
> +};
> +
> +struct npcm_fiu_spi {
> +       struct npcm_fiu_chip chip[NPCM_MAX_CHIP_NUM];
> +       const struct npcm_fiu_info *info;
> +       struct spi_mem_op drd_op;
> +       struct resource *res_mem;
> +       struct regmap *regmap;
> +       unsigned long clkrate;
> +       struct device *dev;
> +       struct clk *clk;
> +       bool spix_mode;
> +};
> +
> +static const struct regmap_config npcm_mtd_regmap_config = {
> +       .reg_bits = 32,
> +       .val_bits = 32,
> +       .reg_stride = 4,
> +       .max_register = NPCM_FIU_MAX_REG_LIMIT,
> +};
> +
> +static void npcm_fiu_set_drd(struct npcm_fiu_spi *fiu,
> +                            const struct spi_mem_op *op)
> +{
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> +                          NPCM_FIU_DRD_CFG_ACCTYPE,
> +                          ilog2(op->addr.buswidth) <<
> +                          NPCM_FIU_DRD_ACCTYPE_SHIFT);
> +       fiu->drd_op.addr.buswidth = op->addr.buswidth;
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> +                          NPCM_FIU_DRD_CFG_DBW,
> +                          ((op->dummy.nbytes * ilog2(op->addr.buswidth))
> +                           / NUM_BITS_IN_BYTE) << NPCM_FIU_DRD_DBW_SHIFT);
> +       fiu->drd_op.dummy.nbytes = op->dummy.nbytes;
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> +                          NPCM_FIU_DRD_CFG_RDCMD, op->cmd.opcode);
> +       fiu->drd_op.cmd.opcode = op->cmd.opcode;
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> +                          NPCM_FIU_DRD_CFG_ADDSIZ,
> +                          (op->addr.nbytes - 3) << NPCM_FIU_DRD_ADDSIZ_SHIFT);
> +       fiu->drd_op.addr.nbytes = op->addr.nbytes;
> +}
> +
> +static ssize_t npcm_fiu_direct_read(struct spi_mem_dirmap_desc *desc,
> +                                   u64 offs, size_t len, void *buf)
> +{
> +       struct npcm_fiu_spi *fiu =
> +               spi_controller_get_devdata(desc->mem->spi->master);
> +       struct npcm_fiu_chip *chip = &fiu->chip[desc->mem->spi->chip_select];
> +       void __iomem *src = (void __iomem *)(chip->flash_region_mapped_ptr +
> +                                            offs);
> +       u8 *buf_rx = buf;
> +       u32 i;
> +
> +       if (fiu->spix_mode) {
> +               for (i = 0 ; i < len ; i++)
> +                       *(buf_rx + i) = ioread8(src + i);
> +       } else {
> +               if (desc->info.op_tmpl.addr.buswidth != fiu->drd_op.addr.buswidth ||
> +                   desc->info.op_tmpl.dummy.nbytes != fiu->drd_op.dummy.nbytes ||
> +                   desc->info.op_tmpl.cmd.opcode != fiu->drd_op.cmd.opcode ||
> +                   desc->info.op_tmpl.addr.nbytes != fiu->drd_op.addr.nbytes)
> +                       npcm_fiu_set_drd(fiu, &desc->info.op_tmpl);
> +
> +               memcpy_fromio(buf_rx, src, len);

Does this need to make sure the memcpy is aligned, or is that handled
at a higher layer?

> +       }
> +
> +       return len;
> +}
> +
> +static ssize_t npcm_fiu_direct_write(struct spi_mem_dirmap_desc *desc,
> +                                    u64 offs, size_t len, const void *buf)
> +{
> +       struct npcm_fiu_spi *fiu =
> +               spi_controller_get_devdata(desc->mem->spi->master);
> +       struct npcm_fiu_chip *chip = &fiu->chip[desc->mem->spi->chip_select];
> +       void __iomem *dst = (void __iomem *)(chip->flash_region_mapped_ptr +
> +                                            offs);
> +       const u8 *buf_tx = buf;
> +       u32 i;
> +
> +       if (fiu->spix_mode)
> +               for (i = 0 ; i < len ; i++)
> +                       iowrite8(*(buf_tx + i), dst + i);
> +       else
> +               memcpy_toio(dst, buf_tx, len);
> +
> +       return len;
> +}
> +
> +static int npcm_fiu_uma_read(struct spi_mem *mem,
> +                            const struct spi_mem_op *op, u32 addr,
> +                             bool is_address_size, u8 *data, u32 data_size)
> +{
> +       struct npcm_fiu_spi *fiu =
> +               spi_controller_get_devdata(mem->spi->master);
> +       u32 uma_cfg = BIT(10);
> +       u32 data_reg[4];
> +       int ret;
> +       u32 val;
> +       u32 i;
> +
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> +                          NPCM_FIU_UMA_CTS_DEV_NUM,
> +                          (mem->spi->chip_select <<
> +                           NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CMD,
> +                          NPCM_FIU_UMA_CMD_CMD, op->cmd.opcode);
> +
> +       if (is_address_size) {
> +               uma_cfg |= ilog2(op->cmd.buswidth);
> +               uma_cfg |= ilog2(op->addr.buswidth)
> +                       << NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
> +               uma_cfg |= ilog2(op->dummy.buswidth)
> +                       << NPCM_FIU_UMA_CFG_DBPCK_SHIFT;
> +               uma_cfg |= ilog2(op->data.buswidth)
> +                       << NPCM_FIU_UMA_CFG_RDBPCK_SHIFT;
> +               uma_cfg |= op->dummy.nbytes << NPCM_FIU_UMA_CFG_DBSIZ_SHIFT;
> +               uma_cfg |= op->addr.nbytes << NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
> +               regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, addr);
> +       } else {
> +               regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, 0x0);
> +       }
> +
> +       uma_cfg |= data_size << NPCM_FIU_UMA_CFG_RDATSIZ_SHIFT;
> +       regmap_write(fiu->regmap, NPCM_FIU_UMA_CFG, uma_cfg);
> +       regmap_write_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> +                         NPCM_FIU_UMA_CTS_EXEC_DONE,
> +                         NPCM_FIU_UMA_CTS_EXEC_DONE);
> +       ret = regmap_read_poll_timeout(fiu->regmap, NPCM_FIU_UMA_CTS, val,
> +                                      (!(val & NPCM_FIU_UMA_CTS_EXEC_DONE)), 0,
> +                                      UMA_MICRO_SEC_TIMEOUT);
> +       if (ret)
> +               return ret;
> +
> +       if (data_size) {
> +               for (i = 0; i < DIV_ROUND_UP(data_size, 4); i++)
> +                       regmap_read(fiu->regmap, NPCM_FIU_UMA_DR0 + (i * 4),
> +                                   &data_reg[i]);
> +               memcpy(data, data_reg, data_size);
> +       }
> +
> +       return 0;
> +}
> +
> +static int npcm_fiu_uma_write(struct spi_mem *mem,
> +                             const struct spi_mem_op *op, u8 cmd,
> +                             bool is_address_size, u8 *data, u32 data_size)
> +{
> +       struct npcm_fiu_spi *fiu =
> +               spi_controller_get_devdata(mem->spi->master);
> +       u32 uma_cfg = BIT(10);
> +       u32 data_reg[4] = {0};
> +       u32 val;
> +       u32 i;
> +
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> +                          NPCM_FIU_UMA_CTS_DEV_NUM,
> +                          (mem->spi->chip_select <<
> +                           NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
> +
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CMD,
> +                          NPCM_FIU_UMA_CMD_CMD, cmd);
> +
> +       if (data_size) {
> +               memcpy(data_reg, data, data_size);
> +               for (i = 0; i < DIV_ROUND_UP(data_size, 4); i++)
> +                       regmap_write(fiu->regmap, NPCM_FIU_UMA_DW0 + (i * 4),
> +                                    data_reg[i]);
> +       }
> +
> +       if (is_address_size) {
> +               uma_cfg |= ilog2(op->cmd.buswidth);
> +               uma_cfg |= ilog2(op->addr.buswidth) <<
> +                       NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
> +               uma_cfg |= ilog2(op->data.buswidth) <<
> +                       NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
> +               uma_cfg |= op->addr.nbytes << NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
> +               regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, op->addr.val);
> +       } else {
> +               regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, 0x0);
> +       }
> +
> +       uma_cfg |= (data_size << NPCM_FIU_UMA_CFG_WDATSIZ_SHIFT);
> +       regmap_write(fiu->regmap, NPCM_FIU_UMA_CFG, uma_cfg);
> +
> +       regmap_write_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> +                         NPCM_FIU_UMA_CTS_EXEC_DONE,
> +                         NPCM_FIU_UMA_CTS_EXEC_DONE);
> +
> +       return regmap_read_poll_timeout(fiu->regmap, NPCM_FIU_UMA_CTS, val,
> +                                      (!(val & NPCM_FIU_UMA_CTS_EXEC_DONE)), 0,
> +                                       UMA_MICRO_SEC_TIMEOUT);
> +}
> +
> +static int npcm_fiu_manualwrite(struct spi_mem *mem,
> +                               const struct spi_mem_op *op)
> +{
> +       struct npcm_fiu_spi *fiu =
> +               spi_controller_get_devdata(mem->spi->master);
> +       u8 *data = (u8 *)op->data.buf.out;
> +       u32 num_data_chunks;
> +       u32 remain_data;
> +       u32 idx = 0;
> +       int ret;
> +
> +       num_data_chunks  = op->data.nbytes / CHUNK_SIZE;
> +       remain_data  = op->data.nbytes % CHUNK_SIZE;
> +
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> +                          NPCM_FIU_UMA_CTS_DEV_NUM,
> +                          (mem->spi->chip_select <<
> +                           NPCM_FIU_UMA_CTS_DEV_NUM_SHIFT));
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> +                          NPCM_FIU_UMA_CTS_SW_CS, 0);
> +
> +       ret = npcm_fiu_uma_write(mem, op, op->cmd.opcode, true, NULL, 0);
> +       if (ret)
> +               return ret;
> +
> +       /* Starting the data writing loop in multiples of 8 */
> +       for (idx = 0; idx < num_data_chunks; ++idx) {
> +               ret = npcm_fiu_uma_write(mem, op, data[0], false,
> +                                        &data[1], CHUNK_SIZE - 1);
> +               if (ret)
> +                       return ret;
> +
> +               data += CHUNK_SIZE;
> +       }
> +
> +       /* Handling chunk remains */
> +       if (remain_data > 0) {
> +               ret = npcm_fiu_uma_write(mem, op, data[0], false,
> +                                        &data[1], remain_data - 1);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
> +                          NPCM_FIU_UMA_CTS_SW_CS, NPCM_FIU_UMA_CTS_SW_CS);
> +
> +       return 0;
> +}
> +
> +static int npcm_fiu_read(struct spi_mem *mem, const struct spi_mem_op *op)
> +{
> +       u8 *data = op->data.buf.in;
> +       int i, readlen, currlen;
> +       size_t retlen = 0;
> +       u8 *buf_ptr;
> +       u32 addr;
> +       int ret;
> +
> +       i = 0;
> +       currlen = op->data.nbytes;
> +
> +       do {
> +               addr = ((u32)op->addr.val + i);
> +               if (currlen < 16)
> +                       readlen = currlen;
> +               else
> +                       readlen = 16;
> +
> +               buf_ptr = data + i;
> +               ret = npcm_fiu_uma_read(mem, op, addr, true, buf_ptr,
> +                                       readlen);
> +               if (ret)
> +                       return ret;
> +
> +               i += readlen;
> +               currlen -= 16;
> +       } while (currlen > 0);
> +
> +       retlen = i;
> +
> +       return 0;
> +}
> +
> +static void npcm_fiux_set_direct_wr(struct npcm_fiu_spi *fiu)
> +{
> +       regmap_write(fiu->regmap, NPCM_FIU_DWR_CFG,
> +                    NPCM_FIU_DWR_16_BYTE_BURST);
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_DWR_CFG,
> +                          NPCM_FIU_DWR_CFG_ABPCK,
> +                          DWR_ABPCK_4_BIT_PER_CLK << NPCM_FIU_DWR_ABPCK_SHIFT);
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_DWR_CFG,
> +                          NPCM_FIU_DWR_CFG_DBPCK,
> +                          DWR_DBPCK_4_BIT_PER_CLK << NPCM_FIU_DWR_DBPCK_SHIFT);
> +}
> +
> +static void npcm_fiux_set_direct_rd(struct npcm_fiu_spi *fiu)
> +{
> +       u32 rx_dummy = 0;
> +
> +       regmap_write(fiu->regmap, NPCM_FIU_DRD_CFG,
> +                    NPCM_FIU_DRD_16_BYTE_BURST);
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> +                          NPCM_FIU_DRD_CFG_ACCTYPE,
> +                          DRD_SPI_X_MODE << NPCM_FIU_DRD_ACCTYPE_SHIFT);
> +       regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> +                          NPCM_FIU_DRD_CFG_DBW,
> +                          rx_dummy << NPCM_FIU_DRD_DBW_SHIFT);
> +}
> +
> +static int npcm_fiu_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> +{
> +       struct npcm_fiu_spi *fiu =
> +               spi_controller_get_devdata(mem->spi->master);
> +       struct npcm_fiu_chip *chip = &fiu->chip[mem->spi->chip_select];
> +       int ret = 0;
> +       u8 *buf;
> +
> +       dev_dbg(fiu->dev, "cmd:%#x mode:%d.%d.%d.%d addr:%#llx len:%#x\n",
> +               op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> +               op->dummy.buswidth, op->data.buswidth, op->addr.val,
> +               op->data.nbytes);
> +
> +       if (fiu->spix_mode)
> +               return -ENOTSUPP;
> +
> +       if (fiu->clkrate != chip->clkrate) {
> +               ret = clk_set_rate(fiu->clk, chip->clkrate);
> +               if (ret < 0)
> +                       dev_warn(fiu->dev, "Failed setting %lu frequancy, stay at %lu frequancy\n", chip->clkrate, fiu->clkrate);
> +               else
> +                       fiu->clkrate = chip->clkrate;
> +       }
> +
> +       if (op->data.dir == SPI_MEM_DATA_IN) {
> +               if (!op->addr.nbytes) {
> +                       buf = op->data.buf.in;
> +                       ret = npcm_fiu_uma_read(mem, op, op->addr.val, false,
> +                                               buf, op->data.nbytes);
> +               } else {
> +                       ret = npcm_fiu_read(mem, op);
> +               }
> +       } else  {
> +               if (!op->addr.nbytes || !op->data.nbytes) {
> +                       if (op->data.nbytes)
> +                               buf = (u8 *)op->data.buf.out;
> +                       else
> +                               buf = NULL;
> +                       ret = npcm_fiu_uma_write(mem, op, op->cmd.opcode, false,
> +                                                buf, op->data.nbytes);
> +               } else {
> +                       ret = npcm_fiu_manualwrite(mem, op);
> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +static int npcm_fiu_dirmap_create(struct spi_mem_dirmap_desc *desc)
> +{
> +       struct npcm_fiu_spi *fiu =
> +               spi_controller_get_devdata(desc->mem->spi->master);
> +       struct npcm_fiu_chip *chip = &fiu->chip[desc->mem->spi->chip_select];
> +       struct regmap *gcr_regmap;
> +
> +       if (!fiu->res_mem) {
> +               dev_warn(fiu->dev, "Reserved memory not defined, direct read disabled\n");
> +               desc->nodirmap = true;
> +               return 0;
> +       }
> +
> +       if (!fiu->spix_mode &&
> +           desc->info.op_tmpl.data.dir == SPI_MEM_DATA_OUT) {
> +               desc->nodirmap = true;
> +               return 0;
> +       }
> +
> +       if (!chip->flash_region_mapped_ptr) {
> +               chip->flash_region_mapped_ptr =
> +                       devm_ioremap_nocache(fiu->dev, (fiu->res_mem->start +
> +                                                  (fiu->info->max_map_size *
> +                                                   desc->mem->spi->chip_select)),
> +                                            (u32)desc->info.length);
> +               if (!chip->flash_region_mapped_ptr) {
> +                       dev_warn(fiu->dev, "Error mapping memory region, direct read disabled\n");
> +                       desc->nodirmap = true;
> +                       return 0;
> +               }
> +       }
> +
> +       if (of_device_is_compatible(fiu->dev->of_node, "nuvoton,npcm750-fiu")) {
> +               gcr_regmap =
> +                       syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
> +               if (IS_ERR(gcr_regmap)) {
> +                       dev_warn(fiu->dev, "Didn't find nuvoton,npcm750-gcr, direct read disabled\n");
> +                       desc->nodirmap = true;
> +                       return 0;
> +               }
> +               regmap_update_bits(gcr_regmap, NPCM7XX_INTCR3_OFFSET,
> +                                  NPCM7XX_INTCR3_FIU_FIX,
> +                                  NPCM7XX_INTCR3_FIU_FIX);
> +       }
> +
> +       if (desc->info.op_tmpl.data.dir == SPI_MEM_DATA_IN) {
> +               if (!fiu->spix_mode)
> +                       npcm_fiu_set_drd(fiu, &desc->info.op_tmpl);
> +               else
> +                       npcm_fiux_set_direct_rd(fiu);
> +
> +       } else {
> +               npcm_fiux_set_direct_wr(fiu);
> +       }
> +
> +       return 0;
> +}
> +
> +static int npcm_fiu_setup(struct spi_device *spi)
> +{
> +       struct spi_controller *ctrl = spi->master;
> +       struct npcm_fiu_spi *fiu = spi_controller_get_devdata(ctrl);
> +       struct npcm_fiu_chip *chip;
> +
> +       chip = &fiu->chip[spi->chip_select];
> +       chip->fiu = fiu;
> +       chip->chipselect = spi->chip_select;
> +       chip->clkrate = spi->max_speed_hz;
> +
> +       fiu->clkrate = clk_get_rate(fiu->clk);
> +
> +       return 0;
> +}
> +
> +static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
> +       .exec_op = npcm_fiu_exec_op,
> +       .dirmap_create = npcm_fiu_dirmap_create,
> +       .dirmap_read = npcm_fiu_direct_read,
> +       .dirmap_write = npcm_fiu_direct_write,
> +};
> +
> +static const struct of_device_id npcm_fiu_dt_ids[] = {
> +       { .compatible = "nuvoton,npcm750-fiu", .data = &npxm7xx_fiu_data  },
> +       { /* sentinel */ }
> +};
> +
> +static int npcm_fiu_probe(struct platform_device *pdev)
> +{
> +       const struct fiu_data *fiu_data_match;
> +       const struct of_device_id *match;
> +       struct device *dev = &pdev->dev;
> +       struct spi_controller *ctrl;
> +       struct npcm_fiu_spi *fiu;
> +       void __iomem *regbase;
> +       struct resource *res;
> +       int ret;
> +       int id;
> +
> +       ctrl = spi_alloc_master(dev, sizeof(*fiu));
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       fiu = spi_controller_get_devdata(ctrl);
> +
> +       match = of_match_device(npcm_fiu_dt_ids, dev);
> +       if (!match || !match->data) {
> +               dev_err(dev, "No compatible OF match\n");
> +               return -ENODEV;
> +       }
> +
> +       fiu_data_match = match->data;
> +       id = of_alias_get_id(dev->of_node, "fiu");
> +       if (id < 0 || id >= fiu_data_match->fiu_max) {
> +               dev_err(dev, "Invalid platform device id: %d\n", id);
> +               return -EINVAL;
> +       }
> +
> +       fiu->info = &fiu_data_match->npcm_fiu_data_info[id];
> +
> +       platform_set_drvdata(pdev, fiu);
> +       fiu->dev = dev;
> +
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "control");
> +       regbase = devm_ioremap_resource(dev, res);
> +       if (IS_ERR(regbase))
> +               return PTR_ERR(regbase);
> +
> +       fiu->regmap = devm_regmap_init_mmio(dev, regbase,
> +                                           &npcm_mtd_regmap_config);
> +       if (IS_ERR(fiu->regmap)) {
> +               dev_err(dev, "Failed to create regmap\n");
> +               return PTR_ERR(fiu->regmap);
> +       }
> +
> +       fiu->res_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +                                                   "memory");
> +       fiu->clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(fiu->clk))
> +               return PTR_ERR(fiu->clk);
> +
> +       fiu->spix_mode = of_property_read_bool(dev->of_node, "spix-mode");
> +
> +       platform_set_drvdata(pdev, fiu);
> +       clk_prepare_enable(fiu->clk);
> +
> +       ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD
> +               | SPI_TX_DUAL | SPI_TX_QUAD;
> +       ctrl->setup = npcm_fiu_setup;
> +       ctrl->bus_num = -1;
> +       ctrl->mem_ops = &npcm_fiu_mem_ops;
> +       ctrl->num_chipselect = fiu->info->max_cs;
> +       ctrl->dev.of_node = dev->of_node;
> +
> +       ret = devm_spi_register_master(dev, ctrl);
> +       if (ret)
> +               return ret;
> +
> +       dev_info(dev, "NPCM %s probe succeed\n", fiu->info->name);
> +
> +       return 0;
> +}
> +
> +static int npcm_fiu_remove(struct platform_device *pdev)
> +{
> +       struct npcm_fiu_spi *fiu = platform_get_drvdata(pdev);
> +
> +       clk_disable_unprepare(fiu->clk);
> +       return 0;
> +}
> +
> +MODULE_DEVICE_TABLE(of, npcm_fiu_dt_ids);
> +
> +static struct platform_driver npcm_fiu_driver = {
> +       .driver = {
> +               .name   = "NPCM-FIU",
> +               .bus    = &platform_bus_type,
> +               .of_match_table = npcm_fiu_dt_ids,
> +       },
> +       .probe      = npcm_fiu_probe,
> +       .remove     = npcm_fiu_remove,
> +};
> +module_platform_driver(npcm_fiu_driver);
> +
> +MODULE_DESCRIPTION("Nuvoton FLASH Interface Unit SPI Controller Driver");
> +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.18.0
>
