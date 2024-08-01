Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A34944EB3
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 17:02:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=scxUgm3h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZXJd0KmRz3dSW
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2024 01:02:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=scxUgm3h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZXJ60t6Rz3cRs
	for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2024 01:02:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65094628DA;
	Thu,  1 Aug 2024 15:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26245C4AF10;
	Thu,  1 Aug 2024 15:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722524546;
	bh=4zDqS5OGfFFYJ7C9t087uJrRGvSWNk5ATXWz1L8sLBQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=scxUgm3hOPMdfJQnybL/+gCjB3cKg7NWckuxyIpWbw2srC0aJ6hPEnj8oAdigwn5s
	 /9bk9+huMXFb8YopWt8tc2KxfzPbFeg5Y0touf6f6vyanvFi9d58mssV8C55aBg6xx
	 wyxeUGBgfgUvXM3PhHUHwqDN4lM2gcdoqTyF5lJwJ+3NzDuZAahZICDWybBPsRawKq
	 j8Fq7x8xexPGqVl0hbYU/ShAwgTAc4Vrf310wA9vT+LtRnWdiLKa9xXgkhZUDjMetP
	 b2vYkiHV99bFYrxsiESwqkIDriwORbUD5pms7EEWcoPmCT/tyljoRpP+ek4YboEdz+
	 2+zNnqX9KdnfA==
Message-ID: <e0b6ba00-f0bb-405b-b299-487e73a0c999@kernel.org>
Date: Thu, 1 Aug 2024 17:02:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
To: Stanley Chu <stanley.chuys@gmail.com>, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, linux-i3c@lists.infradead.org
References: <20240801071946.43266-1-yschu@nuvoton.com>
 <20240801071946.43266-3-yschu@nuvoton.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240801071946.43266-3-yschu@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, yschu@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, cpchiang1@nuvoton.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 01/08/2024 09:19, Stanley Chu wrote:
> Add support for the Nuvoton npcm845 i3c controller which
> implements I3C master functionality as defined in the MIPI
> Alliance Specification for I3C, Version 1.0.
> 
> The master role is supported in SDR mode only. IBI and Hot-join
> requsts are supported.
> 
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> Signed-off-by: James Chiang <cpchiang1@nuvoton.com>
> ---
>  MAINTAINERS                             |    7 +
>  drivers/i3c/master/Kconfig              |   14 +
>  drivers/i3c/master/Makefile             |    1 +
>  drivers/i3c/master/npcm845-i3c-master.c | 2364 +++++++++++++++++++++++
>  4 files changed, 2386 insertions(+)
>  create mode 100644 drivers/i3c/master/npcm845-i3c-master.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42decde38320..2d30b6e418d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2670,6 +2670,13 @@ F:	Documentation/userspace-api/media/drivers/npcm-video.rst
>  F:	drivers/media/platform/nuvoton/
>  F:	include/uapi/linux/npcm-video.h
>  
> +ARM/NUVOTON NPCM845 I3C MASTER DRIVER

Use proper terminology. Master is gone since 2021, right?

This applies everywhere.

> +M:	Stanley Chu <yschu@nuvoton.com>
> +M:	James Chiang <cpchiang1@nuvoton.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> +F:	drivers/i3c/master/npcm845-i3c-master.c
> +
>  ARM/NUVOTON WPCM450 ARCHITECTURE
>  M:	Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>  L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 90dee3ec5520..a71d504d4744 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -44,6 +44,20 @@ config SVC_I3C_MASTER
>  	help
>  	  Support for Silvaco I3C Dual-Role Master Controller.
>  
> +config NPCM845_I3C_MASTER
> +	tristate "Nuvoton NPCM845 I3C master driver"
> +	depends on I3C
> +	depends on HAS_IOMEM
> +	depends on ARCH_NPCM || COMPILE_TEST
> +	help
> +	  Support for Nuvoton NPCM845 I3C Master Controller.
> +
> +	  This hardware is an instance of the SVC I3C controller; this
> +	  driver adds platform specific support for NPCM845 hardware.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called npcm845-i3c-master.
> +
>  config MIPI_I3C_HCI
>  	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
>  	depends on I3C
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc..3ed55113190a 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -3,4 +3,5 @@ obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
>  obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>  obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
> +obj-$(CONFIG_NPCM845_I3C_MASTER)	+= npcm845-i3c-master.o
>  obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
> diff --git a/drivers/i3c/master/npcm845-i3c-master.c b/drivers/i3c/master/npcm845-i3c-master.c
> new file mode 100644
> index 000000000000..19672fdbe2b8
> --- /dev/null
> +++ b/drivers/i3c/master/npcm845-i3c-master.c
> @@ -0,0 +1,2364 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NPCM845 I3C master driver
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + * Based on the work from svc i3c master driver and add platform
> + * specific support for the NPCM845 hardware.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/debugfs.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/reset.h>
> +#include <linux/i3c/master.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +
> +/* Master Mode Registers */
> +#define NPCM_I3C_MCONFIG      0x000
> +#define   NPCM_I3C_MCONFIG_MASTER_EN BIT(0)
> +#define   NPCM_I3C_MCONFIG_DISTO(x) FIELD_PREP(BIT(3), (x))
> +#define   NPCM_I3C_MCONFIG_HKEEP(x) FIELD_PREP(GENMASK(5, 4), (x))
> +#define   NPCM_I3C_MCONFIG_ODSTOP(x) FIELD_PREP(BIT(6), (x))
> +#define   NPCM_I3C_MCONFIG_PPBAUD(x) FIELD_PREP(GENMASK(11, 8), (x))
> +#define   NPCM_I3C_MCONFIG_PPLOW(x) FIELD_PREP(GENMASK(15, 12), (x))
> +#define   NPCM_I3C_MCONFIG_ODBAUD(x) FIELD_PREP(GENMASK(23, 16), (x))
> +#define   NPCM_I3C_MCONFIG_ODHPP(x) FIELD_PREP(BIT(24), (x))
> +#define   NPCM_I3C_MCONFIG_SKEW(x) FIELD_PREP(GENMASK(27, 25), (x))
> +#define   NPCM_I3C_MCONFIG_SKEW_MASK GENMASK(27, 25)
> +#define   NPCM_I3C_MCONFIG_I2CBAUD(x) FIELD_PREP(GENMASK(31, 28), (x))
> +
> +#define NPCM_I3C_MCTRL        0x084
> +#define   NPCM_I3C_MCTRL_REQUEST_MASK GENMASK(2, 0)
> +#define   NPCM_I3C_MCTRL_REQUEST(x) FIELD_GET(GENMASK(2, 0), (x))
> +#define   NPCM_I3C_MCTRL_REQUEST_NONE 0
> +#define   NPCM_I3C_MCTRL_REQUEST_START_ADDR 1
> +#define   NPCM_I3C_MCTRL_REQUEST_STOP 2
> +#define   NPCM_I3C_MCTRL_REQUEST_IBI_ACKNACK 3
> +#define   NPCM_I3C_MCTRL_REQUEST_PROC_DAA 4
> +#define   NPCM_I3C_MCTRL_REQUEST_FORCE_EXIT 6
> +#define   NPCM_I3C_MCTRL_REQUEST_AUTO_IBI 7
> +#define   NPCM_I3C_MCTRL_TYPE_I3C 0
> +#define   NPCM_I3C_MCTRL_TYPE_I2C BIT(4)
> +#define   NPCM_I3C_MCTRL_IBIRESP_AUTO 0
> +#define   NPCM_I3C_MCTRL_IBIRESP_ACK_WITHOUT_BYTE 0
> +#define   NPCM_I3C_MCTRL_IBIRESP_ACK_WITH_BYTE BIT(7)
> +#define   NPCM_I3C_MCTRL_IBIRESP_NACK BIT(6)
> +#define   NPCM_I3C_MCTRL_IBIRESP_MANUAL GENMASK(7, 6)
> +#define   NPCM_I3C_MCTRL_DIR(x) FIELD_PREP(BIT(8), (x))
> +#define   NPCM_I3C_MCTRL_DIR_WRITE 0
> +#define   NPCM_I3C_MCTRL_DIR_READ 1
> +#define   NPCM_I3C_MCTRL_ADDR(x) FIELD_PREP(GENMASK(15, 9), (x))
> +#define   NPCM_I3C_MCTRL_RDTERM(x) FIELD_PREP(GENMASK(23, 16), (x))
> +
> +#define NPCM_I3C_MSTATUS      0x088
> +#define   NPCM_I3C_MSTATUS_STATE(x) FIELD_GET(GENMASK(2, 0), (x))
> +#define   NPCM_I3C_MSTATUS_STATE_DAA(x) (NPCM_I3C_MSTATUS_STATE(x) == 5)
> +#define   NPCM_I3C_MSTATUS_STATE_IDLE(x) (NPCM_I3C_MSTATUS_STATE(x) == 0)
> +#define   NPCM_I3C_MSTATUS_STATE_SLVREQ(x) (NPCM_I3C_MSTATUS_STATE(x) == 1)
> +#define   NPCM_I3C_MSTATUS_STATE_IBIACK(x) (NPCM_I3C_MSTATUS_STATE(x) == 6)
> +#define   NPCM_I3C_MSTATUS_BETWEEN(x) FIELD_GET(BIT(4), (x))
> +#define   NPCM_I3C_MSTATUS_NACKED(x) FIELD_GET(BIT(5), (x))
> +#define   NPCM_I3C_MSTATUS_IBITYPE(x) FIELD_GET(GENMASK(7, 6), (x))
> +#define   NPCM_I3C_MSTATUS_IBITYPE_IBI 1
> +#define   NPCM_I3C_MSTATUS_IBITYPE_MASTER_REQUEST 2
> +#define   NPCM_I3C_MSTATUS_IBITYPE_HOT_JOIN 3
> +#define   NPCM_I3C_MINT_SLVSTART BIT(8)
> +#define   NPCM_I3C_MINT_MCTRLDONE BIT(9)
> +#define   NPCM_I3C_MINT_COMPLETE BIT(10)
> +#define   NPCM_I3C_MINT_RXPEND BIT(11)
> +#define   NPCM_I3C_MINT_TXNOTFULL BIT(12)
> +#define   NPCM_I3C_MINT_IBIWON BIT(13)
> +#define   NPCM_I3C_MINT_ERRWARN BIT(15)
> +#define   NPCM_I3C_MSTATUS_SLVSTART(x) FIELD_GET(NPCM_I3C_MINT_SLVSTART, (x))
> +#define   NPCM_I3C_MSTATUS_MCTRLDONE(x) FIELD_GET(NPCM_I3C_MINT_MCTRLDONE, (x))
> +#define   NPCM_I3C_MSTATUS_COMPLETE(x) FIELD_GET(NPCM_I3C_MINT_COMPLETE, (x))
> +#define   NPCM_I3C_MSTATUS_RXPEND(x) FIELD_GET(NPCM_I3C_MINT_RXPEND, (x))
> +#define   NPCM_I3C_MSTATUS_TXNOTFULL(x) FIELD_GET(NPCM_I3C_MINT_TXNOTFULL, (x))
> +#define   NPCM_I3C_MSTATUS_IBIWON(x) FIELD_GET(NPCM_I3C_MINT_IBIWON, (x))
> +#define   NPCM_I3C_MSTATUS_ERRWARN(x) FIELD_GET(NPCM_I3C_MINT_ERRWARN, (x))
> +#define   NPCM_I3C_MSTATUS_IBIADDR(x) FIELD_GET(GENMASK(30, 24), (x))
> +
> +#define NPCM_I3C_IBIRULES     0x08C
> +#define   NPCM_I3C_IBIRULES_ADDR(slot, addr) FIELD_PREP(GENMASK(29, 0), \
> +						       ((addr) & 0x3F) << ((slot) * 6))
> +#define   NPCM_I3C_IBIRULES_ADDRS 5
> +#define   NPCM_I3C_IBIRULES_MSB0 BIT(30)
> +#define   NPCM_I3C_IBIRULES_NOBYTE BIT(31)
> +#define   NPCM_I3C_IBIRULES_MANDBYTE 0
> +#define NPCM_I3C_MINTSET      0x090
> +#define NPCM_I3C_MINTCLR      0x094
> +#define NPCM_I3C_MINTMASKED   0x098
> +#define NPCM_I3C_MERRWARN     0x09C
> +#define   NPCM_I3C_MERRWARN_NACK(x) FIELD_GET(BIT(2), (x))
> +#define   NPCM_I3C_MERRWARN_TIMEOUT BIT(20)
> +#define   NPCM_I3C_MERRWARN_HCRC(x) FIELD_GET(BIT(10), (x))
> +#define NPCM_I3C_MDMACTRL     0x0A0
> +#define   NPCM_I3C_MDMACTRL_DMAFB(x) FIELD_PREP(GENMASK(1, 0), (x))
> +#define   NPCM_I3C_MDMACTRL_DMATB(x) FIELD_PREP(GENMASK(3, 2), (x))
> +#define   NPCM_I3C_MDMACTRL_DMAWIDTH(x) FIELD_PREP(GENMASK(5, 4), (x))
> +#define NPCM_I3C_MDATACTRL    0x0AC
> +#define   NPCM_I3C_MDATACTRL_FLUSHTB BIT(0)
> +#define   NPCM_I3C_MDATACTRL_FLUSHRB BIT(1)
> +#define   NPCM_I3C_MDATACTRL_UNLOCK_TRIG BIT(3)
> +#define   NPCM_I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL GENMASK(5, 4)
> +#define   NPCM_I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY 0
> +#define   NPCM_I3C_MDATACTRL_RXCOUNT(x) FIELD_GET(GENMASK(28, 24), (x))
> +#define   NPCM_I3C_MDATACTRL_TXCOUNT(x) FIELD_GET(GENMASK(20, 16), (x))
> +#define   NPCM_I3C_MDATACTRL_TXFULL BIT(30)
> +#define   NPCM_I3C_MDATACTRL_RXEMPTY BIT(31)
> +
> +#define NPCM_I3C_MWDATAB      0x0B0
> +#define   NPCM_I3C_MWDATAB_END BIT(8)
> +
> +#define NPCM_I3C_MWDATABE     0x0B4
> +#define NPCM_I3C_MWDATAH      0x0B8
> +#define NPCM_I3C_MWDATAHE     0x0BC
> +#define NPCM_I3C_MRDATAB      0x0C0
> +#define NPCM_I3C_MRDATAH      0x0C8
> +
> +#define NPCM_I3C_MDYNADDR     0x0E4
> +#define   NPCM_MDYNADDR_VALID BIT(0)
> +#define   NPCM_MDYNADDR_ADDR(x) FIELD_PREP(GENMASK(7, 1), (x))
> +
> +#define NPCM_I3C_PARTNO       0x06C
> +#define NPCM_I3C_VENDORID     0x074
> +#define   NPCM_I3C_VENDORID_VID(x) FIELD_GET(GENMASK(14, 0), (x))
> +
> +#define NPCM_I3C_MAX_DEVS 32
> +#define NPCM_I3C_PM_TIMEOUT_MS 1000
> +
> +/* This parameter depends on the implementation and may be tuned */
> +#define NPCM_I3C_FIFO_SIZE 16
> +#define NPCM_I3C_MAX_IBI_PAYLOAD_SIZE 8
> +#define NPCM_I3C_MAX_RDTERM 255
> +#define NPCM_I3C_MAX_PPBAUD 15
> +#define NPCM_I3C_MAX_PPLOW 15
> +#define NPCM_I3C_MAX_ODBAUD 255
> +#define NPCM_I3C_MAX_I2CBAUD 15
> +#define I3C_SCL_PP_PERIOD_NS_MIN 40
> +#define I3C_SCL_OD_LOW_PERIOD_NS_MIN 200
> +
> +/* DMA definitions */
> +#define MAX_DMA_COUNT		1024
> +#define DMA_CH_TX		0
> +#define DMA_CH_RX		1
> +#define NPCM_GDMA_CTL(n)	(n * 0x20 + 0x00)
> +#define   NPCM_GDMA_CTL_GDMAMS(x) FIELD_PREP(GENMASK(3, 2), (x))
> +#define   NPCM_GDMA_CTL_TWS(x) FIELD_PREP(GENMASK(13, 12), (x))
> +#define   NPCM_GDMA_CTL_GDMAEN	BIT(0)
> +#define   NPCM_GDMA_CTL_DAFIX	BIT(6)
> +#define   NPCM_GDMA_CTL_SAFIX	BIT(7)
> +#define   NPCM_GDMA_CTL_SIEN	BIT(8)
> +#define   NPCM_GDMA_CTL_DM	BIT(15)
> +#define   NPCM_GDMA_CTL_TC	BIT(18)
> +#define NPCM_GDMA_SRCB(n)	(n * 0x20 + 0x04)
> +#define NPCM_GDMA_DSTB(n)	(n * 0x20 + 0x08)
> +#define NPCM_GDMA_TCNT(n)	(n * 0x20 + 0x0C)
> +#define NPCM_GDMA_CSRC(n)	(n * 0x20 + 0x10)
> +#define NPCM_GDMA_CDST(n)	(n * 0x20 + 0x14)
> +#define NPCM_GDMA_CTCNT(n)	(n * 0x20 + 0x18)
> +#define NPCM_GDMA_MUX(n)	(((n & 0xFFFF) >> 12) * 2 + 6)
> +#define GDMA_CH0_EN		GENMASK(6, 5)
> +#define GDMA_CH1_EN		GENMASK(22, 21)
> +
> +struct npcm_i3c_cmd {
> +	u8 addr;
> +	bool rnw;
> +	u8 *in;
> +	const void *out;
> +	unsigned int len;
> +	unsigned int read_len;
> +	bool continued;
> +	bool use_dma;
> +};
> +
> +struct npcm_i3c_xfer {
> +	struct list_head node;
> +	struct completion comp;
> +	int ret;
> +	unsigned int type;
> +	unsigned int ncmds;
> +	struct npcm_i3c_cmd cmds[];
> +};
> +
> +struct npcm_i3c_regs_save {
> +	u32 mconfig;
> +	u32 mdynaddr;
> +};
> +
> +struct npcm_dma_xfer_desc {
> +	const u8 *out;
> +	u8 *in;
> +	u32 len;
> +	bool rnw;
> +	bool end;
> +};
> +/**
> + * struct npcm_i3c_master - npcm845 I3C Master structure
> + * @base: I3C master controller
> + * @dev: Corresponding device
> + * @regs: Memory mapping
> + * @saved_regs: Volatile values for PM operations
> + * @free_slots: Bit array of available slots
> + * @addrs: Array containing the dynamic addresses of each attached device
> + * @descs: Array of descriptors, one per attached device
> + * @hj_work: Hot-join work
> + * @irq: Main interrupt
> + * @pclk: System clock
> + * @fclk: Fast clock (bus)
> + * @sclk: Slow clock (other events)
> + * @xferqueue: Transfer queue structure
> + * @xferqueue.list: List member
> + * @xferqueue.cur: Current ongoing transfer
> + * @xferqueue.lock: Queue lock
> + * @ibi: IBI structure
> + * @ibi.num_slots: Number of slots available in @ibi.slots
> + * @ibi.slots: Available IBI slots
> + * @ibi.tbq_slot: To be queued IBI slot
> + * @ibi.lock: IBI lock
> + * @lock: Transfer lock, prevent concurrent daa/priv_xfer/ccc
> + * @req_lock: protect between IBI isr and bus operation request
> + */
> +struct npcm_i3c_master {
> +	struct i3c_master_controller base;
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct npcm_i3c_regs_save saved_regs;
> +	u32 free_slots;
> +	u8 addrs[NPCM_I3C_MAX_DEVS];
> +	struct i3c_dev_desc *descs[NPCM_I3C_MAX_DEVS];
> +	struct work_struct hj_work;
> +	int irq;
> +	struct clk *pclk;
> +	struct clk *fclk;
> +	struct {
> +		u32 i3c_pp_hi;
> +		u32 i3c_pp_lo;
> +		u32 i3c_pp_sda_rd_skew;
> +		u32 i3c_pp_sda_wr_skew;
> +		u32 i3c_od_hi;
> +		u32 i3c_od_lo;
> +	} scl_timing;
> +	struct {
> +		struct list_head list;
> +		struct npcm_i3c_xfer *cur;
> +	} xferqueue;
> +	struct {
> +		unsigned int num_slots;
> +		struct i3c_dev_desc **slots;
> +		struct i3c_ibi_slot *tbq_slot;
> +		/* Prevent races within IBI handlers */
> +		spinlock_t lock;
> +	} ibi;
> +	spinlock_t req_lock;
> +	struct mutex lock;
> +	struct dentry *debugfs;
> +
> +	/* For DMA */
> +	void __iomem *dma_regs;
> +	void __iomem *dma_ctl_regs;
> +	bool use_dma;
> +	struct completion xfer_comp;
> +	char *dma_tx_buf;
> +	char *dma_rx_buf;
> +	dma_addr_t dma_tx_addr;
> +	dma_addr_t dma_rx_addr;
> +	struct npcm_dma_xfer_desc dma_xfer;
> +
> +	bool en_hj;
> +};
> +
> +/**
> + * struct npcm_i3c_i2c_dev_data - Device specific data
> + * @index: Index in the master tables corresponding to this device
> + * @ibi: IBI slot index in the master structure
> + * @ibi_pool: IBI pool associated to this device
> + */
> +struct npcm_i3c_i2c_dev_data {
> +	u8 index;
> +	int ibi;
> +	struct i3c_generic_ibi_pool *ibi_pool;
> +};
> +
> +static DEFINE_MUTEX(npcm_i3c_dma_lock);

Why this is outside driver private data - npcm_i3c_master?

> +
> +static int npcm_i3c_master_wait_for_complete(struct npcm_i3c_master *master);
> +static void npcm_i3c_master_stop_dma(struct npcm_i3c_master *master);
> +
> +static void npcm_i3c_master_dma_lock(void)
> +{
> +	mutex_lock(&npcm_i3c_dma_lock);
> +}
> +
> +static void npcm_i3c_master_dma_unlock(void)
> +{
> +	mutex_unlock(&npcm_i3c_dma_lock);
> +}


...


> +
> +static void npcm_i3c_init_debugfs(struct platform_device *pdev,
> +				 struct npcm_i3c_master *master)
> +{
> +	if (!npcm_i3c_debugfs_dir) {
> +		npcm_i3c_debugfs_dir = debugfs_create_dir("npcm_i3c", NULL);
> +		if (!npcm_i3c_debugfs_dir)
> +			return;
> +	}
> +
> +	master->debugfs = debugfs_create_dir(dev_name(&pdev->dev),
> +					     npcm_i3c_debugfs_dir);
> +	if (!master->debugfs)
> +		return;
> +
> +	debugfs_create_file("debug", 0444, master->debugfs, master, &debug_fops);
> +}
> +
> +static int npcm_i3c_setup_dma(struct platform_device *pdev, struct npcm_i3c_master *master)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 dma_conn, dma_ctl, reg_base;
> +
> +	if (!of_property_read_bool(dev->of_node, "use-dma"))
> +		return 0;
> +
> +	master->dma_regs = devm_platform_ioremap_resource_byname(pdev, "dma");
> +	if (IS_ERR(master->dma_regs))
> +		return 0;
> +
> +	master->dma_ctl_regs = devm_platform_ioremap_resource_byname(pdev, "dma_ctl");
> +	if (IS_ERR(master->dma_ctl_regs))


Hm? Why this is not a separate DMA controller?

> +		return 0;
> +
> +	/* DMA TX transfer width is 32 bits(MWDATAB width) for each byte sent to I3C bus */
> +	master->dma_tx_buf = dma_alloc_coherent(dev, MAX_DMA_COUNT * 4,
> +						&master->dma_tx_addr, GFP_KERNEL);
> +	if (!master->dma_tx_buf)
> +		return -ENOMEM;
> +
> +	master->dma_rx_buf = dma_alloc_coherent(dev, MAX_DMA_COUNT,
> +						&master->dma_rx_addr, GFP_KERNEL);
> +	if (!master->dma_rx_buf) {
> +		dma_free_coherent(master->dev, MAX_DMA_COUNT * 4, master->dma_tx_buf,
> +				  master->dma_tx_addr);
> +		return -ENOMEM;
> +	}
> +
> +	/*
> +	 * Set DMA channel connectivity
> +	 * channel 0: I3C TX, channel 1: I3C RX
> +	 */
> +	of_property_read_u32_index(dev->of_node, "reg", 0, &reg_base);
> +	dma_conn = NPCM_GDMA_MUX(reg_base);
> +	dma_ctl = GDMA_CH0_EN | GDMA_CH1_EN | (dma_conn + 1) << 16 | dma_conn;
> +	writel(dma_ctl, master->dma_ctl_regs);
> +	master->use_dma = true;
> +	dev_info(dev, "Using DMA (req_sel %d)\n", dma_conn);
> +
> +	/*
> +	 * Setup GDMA Channel for TX (Memory to I3C FIFO)
> +	 */
> +	writel(master->dma_tx_addr, master->dma_regs + NPCM_GDMA_SRCB(DMA_CH_TX));
> +	writel(reg_base + NPCM_I3C_MWDATAB, master->dma_regs +
> +	       NPCM_GDMA_DSTB(DMA_CH_TX));
> +	/*
> +	 * Setup GDMA Channel for RX (I3C FIFO to Memory)
> +	 */
> +	writel(reg_base + NPCM_I3C_MRDATAB, master->dma_regs +
> +	       NPCM_GDMA_SRCB(DMA_CH_RX));
> +	writel(master->dma_rx_addr, master->dma_regs + NPCM_GDMA_DSTB(DMA_CH_RX));
> +
> +	return 0;
> +}
> +
> +static int npcm_i3c_master_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct npcm_i3c_master *master;
> +	struct reset_control *reset;
> +	u32 val;
> +	int ret;
> +
> +	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> +	if (!master)
> +		return -ENOMEM;
> +
> +	master->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(master->regs))
> +		return PTR_ERR(master->regs);
> +
> +	master->pclk = devm_clk_get(dev, "pclk");
> +	if (IS_ERR(master->pclk))
> +		return PTR_ERR(master->pclk);
> +
> +	master->fclk = devm_clk_get(dev, "fast_clk");
> +	if (IS_ERR(master->fclk))
> +		return PTR_ERR(master->fclk);
> +
> +	master->irq = platform_get_irq(pdev, 0);
> +	if (master->irq < 0)
> +		return master->irq;
> +
> +	master->dev = dev;
> +
> +	ret = npcm_i3c_master_prepare_clks(master);
> +	if (ret)
> +		return ret;
> +
> +	reset = devm_reset_control_get(&pdev->dev, NULL);

Use dev consistently.

> +	if (!IS_ERR(reset)) {
> +		reset_control_assert(reset);
> +		udelay(5);
> +		reset_control_deassert(reset);
> +	}
> +	INIT_WORK(&master->hj_work, npcm_i3c_master_hj_work);
> +	ret = devm_request_irq(dev, master->irq, npcm_i3c_master_irq_handler,
> +			       IRQF_NO_SUSPEND, "npcm-i3c-irq", master);
> +	if (ret)
> +		goto err_disable_clks;
> +
> +	master->free_slots = GENMASK(NPCM_I3C_MAX_DEVS - 1, 0);
> +
> +	mutex_init(&master->lock);
> +	INIT_LIST_HEAD(&master->xferqueue.list);
> +
> +	spin_lock_init(&master->req_lock);
> +	spin_lock_init(&master->ibi.lock);
> +	master->ibi.num_slots = NPCM_I3C_MAX_DEVS;
> +	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,

Once allocation with dev, other with pdev->dev...

> +					 sizeof(*master->ibi.slots),
> +					 GFP_KERNEL);
> +	if (!master->ibi.slots) {
> +		ret = -ENOMEM;
> +		goto err_disable_clks;
> +	}
> +
> +	platform_set_drvdata(pdev, master);
> +
> +	npcm_i3c_master_reset(master);
> +
> +	if (of_property_read_bool(dev->of_node, "enable-hj"))


> +		master->en_hj = true;
> +	if (!of_property_read_u32(dev->of_node, "i3c-pp-scl-hi-period-ns", &val))
> +		master->scl_timing.i3c_pp_hi = val;
> +
> +	if (!of_property_read_u32(dev->of_node, "i3c-pp-scl-lo-period-ns", &val))
> +		master->scl_timing.i3c_pp_lo = val;
> +
> +	if (!of_property_read_u32(dev->of_node, "i3c-pp-sda-rd-skew", &val))
> +		master->scl_timing.i3c_pp_sda_rd_skew = val;
> +
> +	if (!of_property_read_u32(dev->of_node, "i3c-pp-sda-wr-skew", &val))
> +		master->scl_timing.i3c_pp_sda_wr_skew = val;
> +
> +	if (!of_property_read_u32(dev->of_node, "i3c-od-scl-hi-period-ns", &val))
> +		master->scl_timing.i3c_od_hi = val;
> +
> +	if (!of_property_read_u32(dev->of_node, "i3c-od-scl-lo-period-ns", &val))
> +		master->scl_timing.i3c_od_lo = val;
> +
> +	npcm_i3c_master_clear_merrwarn(master);
> +	npcm_i3c_master_flush_fifo(master);
> +
> +	ret = npcm_i3c_setup_dma(pdev, master);
> +	if (ret)
> +		goto err_disable_clks;
> +
> +	npcm_i3c_init_debugfs(pdev, master);
> +
> +	/* Register the master */
> +	ret = i3c_master_register(&master->base, &pdev->dev,
> +				  &npcm_i3c_master_ops, false);
> +	if (ret)
> +		goto err_disable_clks;
> +
> +	if (master->en_hj) {
> +		dev_info(master->dev, "enable hot-join\n");

Drop, not useful.


> +		npcm_i3c_master_enable_interrupts(master, NPCM_I3C_MINT_SLVSTART);
> +	}
> +	return 0;
> +
> +	debugfs_remove_recursive(master->debugfs);
> +
> +err_disable_clks:
> +	npcm_i3c_master_unprepare_clks(master);
> +
> +	return ret;
> +}
> +
> +static int npcm_i3c_master_remove(struct platform_device *pdev)
> +{
> +	struct npcm_i3c_master *master = platform_get_drvdata(pdev);
> +
> +	/* Avoid ibi events during driver unbinding */
> +	writel(NPCM_I3C_MINT_SLVSTART, master->regs + NPCM_I3C_MINTCLR);
> +
> +	debugfs_remove_recursive(master->debugfs);
> +
> +	i3c_master_unregister(&master->base);
> +
> +	if (master->use_dma) {
> +		dma_free_coherent(master->dev, MAX_DMA_COUNT * 4, master->dma_tx_buf,
> +				  master->dma_tx_addr);
> +		dma_free_coherent(master->dev, MAX_DMA_COUNT, master->dma_rx_buf,
> +				  master->dma_rx_addr);
> +	}
> +	return 0;
> +}
> +
> +static const struct of_device_id npcm_i3c_master_of_match_tbl[] = {
> +	{ .compatible = "nuvoton,npcm845-i3c" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, npcm_i3c_master_of_match_tbl);
> +
> +static struct platform_driver npcm_i3c_master = {
> +	.probe = npcm_i3c_master_probe,
> +	.remove = npcm_i3c_master_remove,
> +	.driver = {
> +		.name = "npcm845-i3c-master",
> +		.of_match_table = npcm_i3c_master_of_match_tbl,
> +	},
> +};
> +module_platform_driver(npcm_i3c_master);
> +
> +MODULE_AUTHOR("Stanley Chu <yschu@nuvoton.com>");
> +MODULE_AUTHOR("James Chiang <cpchiang1@nuvoton.com>");
> +MODULE_DESCRIPTION("Nuvoton NPCM845 I3C master driver");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof

