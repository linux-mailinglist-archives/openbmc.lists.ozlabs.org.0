Return-Path: <openbmc+bounces-796-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B53A9C05524
	for <lists+openbmc@lfdr.de>; Fri, 24 Oct 2025 11:27:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctHby1NPpz301K;
	Fri, 24 Oct 2025 20:27:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761298030;
	cv=none; b=JWQ3kLdcz6OUNwPNYeJ3xHYJf+CIOZRGuSZJewfguFLUaHfkUsrZ9vMsahyvhwtIlpgcjsXTzhK2N149s5BMzSF6TRTb1MqmezyOuMvFbc221y1loZ3PUktPnSNS02QLLpYYiayfv4z+m1QfWPhivV9c/TmpG4WAn93F4K7CBE1eOK/DMgx467TtebjcxWY+e8WIQAIAMKeedEM6FfrnRX0lYa6hyf0DwZ94xWMzLmRf6CDx1C5Svvu4UWQLD0f6Ei9cw9D7zYL/xQdsw6Ti70sIEgPYo2DwGkXOUeGNLQRV+YjSy2d1+ZRZEsCj6aiFcFhwwFjjng6Yz458lVNXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761298030; c=relaxed/relaxed;
	bh=bIyxP0TYfp4A45/plCn1xInJnk4gtNxQyfEmeDDGaCE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OwFuBxaL8qS2JFNm8dkwoE2vogtVb/nRqNxHaZTq97eq6m5vV0HP47u5qq2cbEK/ToQl3V+hTvvuhNSbvScrow5aBUi7nQFC7pnfEw+0ax89+zqP3bvnwvODsYpWaoKWca28Xw9ccVsIDhu9BqnV2xqtDsydUBheBfWa5bkYSwH3mT4TGBvOe07tFlyHSE1edgdPXxgzSYbD9vjhgM8apF0MhycTAz5DIeSuPeJUSZK9MvC+6xaZWFieaTIGmMMbSGenCim0CJgfmJWlFS4oNdATp0y9bdnJAnRp/cnp/WF5rR5lGkRHV5+Q8gmzqSmWcxFitshZ+NKx6FP6BaXJ+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 987 seconds by postgrey-1.37 at boromir; Fri, 24 Oct 2025 20:27:08 AEDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctHbw5BDyz2yl2
	for <openbmc@lists.ozlabs.org>; Fri, 24 Oct 2025 20:27:08 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vCDoK-0000c4-OH; Fri, 24 Oct 2025 11:10:12 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vCDoH-005CZo-1j;
	Fri, 24 Oct 2025 11:10:09 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vCDoH-000000004Sc-1vMT;
	Fri, 24 Oct 2025 11:10:09 +0200
Message-ID: <c8dda20e51a04367586308d1e8581a76aed9e944.camel@pengutronix.de>
Subject: Re: [PATCH v20 3/4] i2c: ast2600: Add controller driver for new
 register layout
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org, 
	joel@jms.id.au, andi.shyti@kernel.org, jk@codeconstruct.com.au,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew@codeconstruct.com.au, 	andriy.shevchenko@linux.intel.com,
 naresh.solanki@9elements.com, 	linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 24 Oct 2025 11:10:09 +0200
In-Reply-To: <20251021013548.2375190-4-ryan_chen@aspeedtech.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-4-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Di, 2025-10-21 at 09:35 +0800, Ryan Chen wrote:
> Add i2c-ast2600 new register mode driver to support AST2600
> i2c new register mode. This i2c-ast2600 new driver and the
> legacy i2c-aspeed driver both match the same compatible string
> "aspeed,ast2600-i2c-bus" because they target the same I2C
> controller IP on AST2600. However, AST2600 SoCs may configure
> the controller instances to operate either in the legacy
> register layout or the new layout (via global register).
> The new register mode support following.
>=20
> - Add new clock divider option for more flexible and accurate
>  clock rate generation
> - Add tCKHighMin timing to guarantee SCL high pulse width.
> - Add support dual pool buffer mode, split 32 bytes pool buffer
>  of each device into 2 x 16 bytes for Tx and Rx individually.
> - Increase DMA buffer size to 4096 bytes and support byte alignment.
> - Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
> - Re-define registers for separating controller and target
>  mode control.
> - Support 4 individual DMA buffers for controller Tx and Rx,
>  target Tx and Rx.
>=20
> And following is new register set for package transfer sequence.
> - New Master operation mode:
>   S -> Aw -> P
>   S -> Aw -> TxD -> P
>   S -> Ar -> RxD -> P
>   S -> Aw -> TxD -> Sr -> Ar -> RxD -> P
> - Bus SDA lock auto-release capability for new controller DMA
>  command mode.
> - Bus auto timeout for new controller/target DMA mode.
>=20
> Since the register layout is selected via a global register at
> runtime and both drivers bind to the same compatible string,
> this patch defines the driver selection at build-time using
> Kconfig, ensuring that only one driver is compiled into the
> kernel. This approach avoids ambiguity and ensures consistent
> behavior for each platform configuration.
>=20
> The following is two versus register layout.
> Old register mode:
> {I2CD00}: Function Control Register
> {I2CD04}: Clock and AC Timing Control Register
> {I2CD08}: Clock and AC Timing Control Register
> {I2CD0C}: Interrupt Control Register
> {I2CD10}: Interrupt Status Register
> {I2CD14}: Command/Status Register
> {I2CD18}: Slave Device Address Register
> {I2CD1C}: Pool Buffer Control Register
> {I2CD20}: Transmit/Receive Byte Buffer Register
> {I2CD24}: DMA Mode Buffer Address Register
> {I2CD28}: DMA Transfer Length Register
> {I2CD2C}: Original DMA Mode Buffer Address Setting
> {I2CD30}: Original DMA Transfer Length Setting and Final Status
>=20
> New Register mode
> {I2CC00}: Master/Slave Function Control Register
> {I2CC04}: Master/Slave Clock and AC Timing Control Register
> {I2CC08}: Master/Slave Transmit/Receive Byte Buffer Register
> {I2CC0C}: Master/Slave Pool Buffer Control Register
> {I2CM10}: Master Interrupt Control Register
> {I2CM14}: Master Interrupt Status Register
> {I2CM18}: Master Command/Status Register
> {I2CM1C}: Master DMA Buffer Length Register
> {I2CS20}: Slave~ Interrupt Control Register
> {I2CS24}: Slave~ Interrupt Status Register
> {I2CS28}: Slave~ Command/Status Register
> {I2CS2C}: Slave~ DMA Buffer Length Register
> {I2CM30}: Master DMA Mode Tx Buffer Base Address
> {I2CM34}: Master DMA Mode Rx Buffer Base Address
> {I2CS38}: Slave~ DMA Mode Tx Buffer Base Address
> {I2CS3C}: Slave~ DMA Mode Rx Buffer Base Address
> {I2CS40}: Slave Device Address Register
> {I2CM48}: Master DMA Length Status Register
> {I2CS4C}: Slave  DMA Length Status Register
> {I2CC50}: Current DMA Operating Address Status
> {I2CC54}: Current DMA Operating Length  Status
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/i2c/busses/Kconfig       |   23 +-
>  drivers/i2c/busses/Makefile      |    1 +
>  drivers/i2c/busses/i2c-ast2600.c | 1033 ++++++++++++++++++++++++++++++
>  3 files changed, 1049 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/i2c/busses/i2c-ast2600.c
>=20
[...]
> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> new file mode 100644
> index 000000000000..885b451030ac
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -0,0 +1,1033 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ASPEED AST2600 new register set I2C controller driver
> + *
> + * Copyright (C) ASPEED Technology Inc.
> + */
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/i2c-smbus.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/minmax.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +#include <linux/string_helpers.h>
> +#include <linux/unaligned.h>
> +
> +#define AST2600_I2CG_ISR			0x00
> +#define AST2600_I2CG_SLAVE_ISR		0x04
> +#define AST2600_I2CG_OWNER		0x08
> +#define AST2600_I2CG_CTRL		0x0C
> +#define AST2600_I2CG_CLK_DIV_CTRL	0x10
> +
> +#define AST2600_I2CG_SLAVE_PKT_NAK	BIT(4)
> +#define AST2600_I2CG_M_S_SEPARATE_INTR	BIT(3)
> +#define AST2600_I2CG_CTRL_NEW_REG	BIT(2)
> +#define AST2600_I2CG_CTRL_NEW_CLK_DIV	BIT(1)
> +#define AST2600_GLOBAL_INIT	\
> +	(AST2600_I2CG_CTRL_NEW_REG | AST2600_I2CG_CTRL_NEW_CLK_DIV)
> +/*
> + * APB clk : 100Mhz
> + * div	: scl		: baseclk [APB/((div/2) + 1)] : tBuf [1/bclk * 16]
> + * I2CG10[31:24] base clk4 for i2c auto recovery timeout counter (0xC6)
> + * I2CG10[23:16] base clk3 for Standard-mode (100Khz) min tBuf 4.7us
> + * 0x3c : 100.8Khz	: 3.225Mhz					  : 4.96us
> + * 0x3d : 99.2Khz	: 3.174Mhz					  : 5.04us
> + * 0x3e : 97.65Khz	: 3.125Mhz					  : 5.12us
> + * 0x40 : 97.75Khz	: 3.03Mhz					  : 5.28us
> + * 0x41 : 99.5Khz	: 2.98Mhz					  : 5.36us (default)
> + * I2CG10[15:8] base clk2 for Fast-mode (400Khz) min tBuf 1.3us
> + * 0x12 : 400Khz	: 10Mhz						  : 1.6us
> + * I2CG10[7:0] base clk1 for Fast-mode Plus (1Mhz) min tBuf 0.5us
> + * 0x08 : 1Mhz		: 20Mhz						  : 0.8us
> + */
> +#define I2CCG_DIV_CTRL 0xC6411208
> +
> +/* 0x00 : I2CC Controller/Target Function Control Register  */
> +#define AST2600_I2CC_FUN_CTRL		0x00
> +#define AST2600_I2CC_SLAVE_ADDR_RX_EN		BIT(20)
> +#define AST2600_I2CC_MASTER_RETRY_MASK		GENMASK(19, 18)
> +#define AST2600_I2CC_MASTER_RETRY(x)		(((x) & GENMASK(1, 0)) << 18)
> +#define AST2600_I2CC_BUS_AUTO_RELEASE		BIT(17)
> +#define AST2600_I2CC_M_SDA_LOCK_EN			BIT(16)
> +#define AST2600_I2CC_MULTI_MASTER_DIS		BIT(15)
> +#define AST2600_I2CC_M_SCL_DRIVE_EN			BIT(14)
> +#define AST2600_I2CC_MSB_STS				BIT(9)
> +#define AST2600_I2CC_SDA_DRIVE_1T_EN		BIT(8)
> +#define AST2600_I2CC_M_SDA_DRIVE_1T_EN		BIT(7)
> +#define AST2600_I2CC_M_HIGH_SPEED_EN		BIT(6)
> +/* reserver 5 : 2 */
> +#define AST2600_I2CC_SLAVE_EN			BIT(1)
> +#define AST2600_I2CC_MASTER_EN			BIT(0)
> +
> +/* 0x04 : I2CC Controller/Target Clock and AC Timing Control Register #1=
 */
> +#define AST2600_I2CC_AC_TIMING		0x04
> +#define AST2600_I2CC_TTIMEOUT(x)			(((x) & GENMASK(4, 0)) << 24)
> +#define AST2600_I2CC_TCKHIGHMIN(x)			(((x) & GENMASK(3, 0)) << 20)
> +#define AST2600_I2CC_TCKHIGH(x)			(((x) & GENMASK(3, 0)) << 16)
> +#define AST2600_I2CC_TCKLOW(x)			(((x) & GENMASK(3, 0)) << 12)
> +#define AST2600_I2CC_THDDAT(x)			(((x) & GENMASK(1, 0)) << 10)
> +#define AST2600_I2CC_TOUTBASECLK(x)			(((x) & GENMASK(1, 0)) << 8)
> +#define AST2600_I2CC_TBASECLK(x)			((x) & GENMASK(3, 0))
> +
> +/* 0x08 : I2CC Controller/Target Transmit/Receive Byte Buffer Register *=
/
> +#define AST2600_I2CC_STS_AND_BUFF		0x08
> +#define AST2600_I2CC_TX_DIR_MASK			GENMASK(31, 29)
> +#define AST2600_I2CC_SDA_OE				BIT(28)
> +#define AST2600_I2CC_SDA_O				BIT(27)
> +#define AST2600_I2CC_SCL_OE				BIT(26)
> +#define AST2600_I2CC_SCL_O				BIT(25)
> +
> +#define AST2600_I2CC_SCL_LINE_STS			BIT(18)
> +#define AST2600_I2CC_SDA_LINE_STS			BIT(17)
> +#define AST2600_I2CC_BUS_BUSY_STS			BIT(16)
> +
> +#define AST2600_I2CC_GET_RX_BUFF(x)			(((x) >> 8) & GENMASK(7, 0))
> +
> +/* 0x0C : I2CC Controller/Target Pool Buffer Control Register  */
> +#define AST2600_I2CC_BUFF_CTRL		0x0C
> +#define AST2600_I2CC_GET_RX_BUF_LEN(x)      (((x) & GENMASK(29, 24)) >> =
24)
> +#define AST2600_I2CC_SET_RX_BUF_LEN(x)		(((((x) - 1) & GENMASK(4, 0)) <<=
 16) | BIT(0))
> +#define AST2600_I2CC_SET_TX_BUF_LEN(x)		(((((x) - 1) & GENMASK(4, 0)) <<=
 8) | BIT(0))
> +#define AST2600_I2CC_GET_TX_BUF_LEN(x)      ((((x) & GENMASK(12, 8)) >> =
8) + 1)
> +
> +/* 0x10 : I2CM Controller Interrupt Control Register */
> +#define AST2600_I2CM_IER			0x10
> +/* 0x14 : I2CM Controller Interrupt Status Register   : WC */
> +#define AST2600_I2CM_ISR			0x14
> +
> +#define AST2600_I2CM_PKT_TIMEOUT			BIT(18)
> +#define AST2600_I2CM_PKT_ERROR			BIT(17)
> +#define AST2600_I2CM_PKT_DONE			BIT(16)
> +
> +#define AST2600_I2CM_BUS_RECOVER_FAIL		BIT(15)
> +#define AST2600_I2CM_SDA_DL_TO			BIT(14)
> +#define AST2600_I2CM_BUS_RECOVER			BIT(13)
> +#define AST2600_I2CM_SMBUS_ALT			BIT(12)
> +
> +#define AST2600_I2CM_SCL_LOW_TO			BIT(6)
> +#define AST2600_I2CM_ABNORMAL			BIT(5)
> +#define AST2600_I2CM_NORMAL_STOP			BIT(4)
> +#define AST2600_I2CM_ARBIT_LOSS			BIT(3)
> +#define AST2600_I2CM_RX_DONE			BIT(2)
> +#define AST2600_I2CM_TX_NAK				BIT(1)
> +#define AST2600_I2CM_TX_ACK				BIT(0)
> +
> +/* 0x18 : I2CM Controller Command/Status Register   */
> +#define AST2600_I2CM_CMD_STS		0x18
> +#define AST2600_I2CM_PKT_ADDR(x)			(((x) & GENMASK(6, 0)) << 24)
> +#define AST2600_I2CM_PKT_EN				BIT(16)
> +#define AST2600_I2CM_SDA_OE_OUT_DIR			BIT(15)
> +#define AST2600_I2CM_SDA_O_OUT_DIR			BIT(14)
> +#define AST2600_I2CM_SCL_OE_OUT_DIR			BIT(13)
> +#define AST2600_I2CM_SCL_O_OUT_DIR			BIT(12)
> +#define AST2600_I2CM_RECOVER_CMD_EN			BIT(11)
> +
> +#define AST2600_I2CM_RX_DMA_EN			BIT(9)
> +#define AST2600_I2CM_TX_DMA_EN			BIT(8)
> +/* Command Bit */
> +#define AST2600_I2CM_RX_BUFF_EN			BIT(7)
> +#define AST2600_I2CM_TX_BUFF_EN			BIT(6)
> +#define AST2600_I2CM_STOP_CMD			BIT(5)
> +#define AST2600_I2CM_RX_CMD_LAST			BIT(4)
> +#define AST2600_I2CM_RX_CMD				BIT(3)
> +
> +#define AST2600_I2CM_TX_CMD				BIT(1)
> +#define AST2600_I2CM_START_CMD			BIT(0)
> +
> +/* 0x1C : I2CM Controller DMA Transfer Length Register	 */
> +#define AST2600_I2CM_DMA_LEN		0x1C
> +/* Tx Rx support length 1 ~ 4096 */
> +#define AST2600_I2CM_SET_RX_DMA_LEN(x)	((((x) & GENMASK(11, 0)) << 16) |=
 BIT(31))
> +#define AST2600_I2CM_SET_TX_DMA_LEN(x)	(((x) & GENMASK(11, 0)) | BIT(15)=
)
> +
> +/* 0x20 : I2CS Target Interrupt Control Register   */
> +#define AST2600_I2CS_IER			0x20
> +/* 0x24 : I2CS Target Interrupt Status Register	 */
> +#define AST2600_I2CS_ISR			0x24
> +
> +#define AST2600_I2CS_ADDR_INDICATE_MASK	GENMASK(31, 30)
> +#define AST2600_I2CS_SLAVE_PENDING			BIT(29)
> +
> +#define AST2600_I2CS_WAIT_TX_DMA			BIT(25)
> +#define AST2600_I2CS_WAIT_RX_DMA			BIT(24)
> +
> +#define AST2600_I2CS_ADDR3_NAK			BIT(22)
> +#define AST2600_I2CS_ADDR2_NAK			BIT(21)
> +#define AST2600_I2CS_ADDR1_NAK			BIT(20)
> +
> +#define AST2600_I2CS_ADDR_MASK			GENMASK(19, 18)
> +#define AST2600_I2CS_PKT_ERROR			BIT(17)
> +#define AST2600_I2CS_PKT_DONE			BIT(16)
> +#define AST2600_I2CS_INACTIVE_TO			BIT(15)
> +
> +#define AST2600_I2CS_SLAVE_MATCH			BIT(7)
> +#define AST2600_I2CS_ABNOR_STOP			BIT(5)
> +#define AST2600_I2CS_STOP				BIT(4)
> +#define AST2600_I2CS_RX_DONE_NAK			BIT(3)
> +#define AST2600_I2CS_RX_DONE			BIT(2)
> +#define AST2600_I2CS_TX_NAK				BIT(1)
> +#define AST2600_I2CS_TX_ACK				BIT(0)
> +
> +/* 0x28 : I2CS Target CMD/Status Register   */
> +#define AST2600_I2CS_CMD_STS		0x28
> +#define AST2600_I2CS_ACTIVE_ALL			GENMASK(18, 17)
> +#define AST2600_I2CS_PKT_MODE_EN			BIT(16)
> +#define AST2600_I2CS_AUTO_NAK_NOADDR		BIT(15)
> +#define AST2600_I2CS_AUTO_NAK_EN			BIT(14)
> +
> +#define AST2600_I2CS_ALT_EN				BIT(10)
> +#define AST2600_I2CS_RX_DMA_EN			BIT(9)
> +#define AST2600_I2CS_TX_DMA_EN			BIT(8)
> +#define AST2600_I2CS_RX_BUFF_EN			BIT(7)
> +#define AST2600_I2CS_TX_BUFF_EN			BIT(6)
> +#define AST2600_I2CS_RX_CMD_LAST			BIT(4)
> +
> +#define AST2600_I2CS_TX_CMD				BIT(2)
> +
> +#define AST2600_I2CS_DMA_LEN		0x2C
> +#define AST2600_I2CS_SET_RX_DMA_LEN(x)	(((((x) - 1) & GENMASK(11, 0)) <<=
 16) | BIT(31))
> +#define AST2600_I2CS_SET_TX_DMA_LEN(x)	((((x) - 1) & GENMASK(11, 0)) | B=
IT(15))
> +
> +/* I2CM Controller DMA Tx Buffer Register   */
> +#define AST2600_I2CM_TX_DMA			0x30
> +/* I2CM Controller DMA Rx Buffer Register	*/
> +#define AST2600_I2CM_RX_DMA			0x34
> +/* I2CS Target DMA Tx Buffer Register   */
> +#define AST2600_I2CS_TX_DMA			0x38
> +/* I2CS Target DMA Rx Buffer Register   */
> +#define AST2600_I2CS_RX_DMA			0x3C
> +
> +#define AST2600_I2CS_ADDR_CTRL		0x40
> +
> +#define	AST2600_I2CS_ADDR3_MASK		GENMASK(22, 16)
> +#define	AST2600_I2CS_ADDR2_MASK		GENMASK(14, 8)
> +#define	AST2600_I2CS_ADDR1_MASK		GENMASK(6, 0)
> +
> +#define AST2600_I2CM_DMA_LEN_STS		0x48
> +#define AST2600_I2CS_DMA_LEN_STS		0x4C
> +
> +#define AST2600_I2C_GET_TX_DMA_LEN(x)		((x) & GENMASK(12, 0))
> +#define AST2600_I2C_GET_RX_DMA_LEN(x)        (((x) & GENMASK(28, 16)) >>=
 16)
> +
> +/* 0x40 : Target Device Address Register */
> +#define AST2600_I2CS_ADDR3_ENABLE			BIT(23)
> +#define AST2600_I2CS_ADDR3(x)			((x) << 16)
> +#define AST2600_I2CS_ADDR2_ENABLE			BIT(15)
> +#define AST2600_I2CS_ADDR2(x)			((x) << 8)
> +#define AST2600_I2CS_ADDR1_ENABLE			BIT(7)
> +#define AST2600_I2CS_ADDR1(x)			(x)
> +
> +#define I2C_TARGET_MSG_BUF_SIZE		256
> +
> +#define AST2600_I2C_DMA_SIZE		4096
> +
> +#define CONTROLLER_TRIGGER_LAST_STOP	(AST2600_I2CM_RX_CMD_LAST | AST2600=
_I2CM_STOP_CMD)
> +#define TARGET_TRIGGER_CMD	(AST2600_I2CS_ACTIVE_ALL | AST2600_I2CS_PKT_M=
ODE_EN)
> +
> +#define AST_I2C_TIMEOUT_CLK		0x1
> +
> +enum xfer_mode {
> +	BYTE_MODE,
> +	BUFF_MODE,
> +	DMA_MODE,
> +};
> +
> +struct ast2600_i2c_bus {
> +	struct i2c_adapter	adap;
> +	struct device		*dev;
> +	void __iomem		*reg_base;
> +	struct regmap		*global_regs;
> +	struct reset_control	*rst;

Will this reset control be used by the driver at some point, e.g. for
suspend/resume support? As of now this could just be a local variable
in ast2600_i2c_probe().

regards
Philipp

