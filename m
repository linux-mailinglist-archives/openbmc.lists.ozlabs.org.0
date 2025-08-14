Return-Path: <openbmc+bounces-453-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDADB26302
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 12:43:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2hfP1bjNz3cZ4;
	Thu, 14 Aug 2025 20:43:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755168189;
	cv=none; b=lCrDLB5x38LVCORf3RQOKpqXTfxMqJmd4aSsjZJU+hLv4RpalrPXttrXz6wuMHJjRp9Xzr6PNaPU6z+zdXheo9Wu/v8Zlmmrgo05nODFh1lgtbH2E6pbAbdChU8q1RTiVTHmCJesLnOmTR0WPnTsIcF+M8ITVVkRr44d26q3549C6o3as+AWPiWWRONJFJaX4ArXC/4ZkUxN7zayMSfCHlzF8mUFbk3dazkhHYUMnz2p8QHCvXJU1ceSEJ9+pXPfh05t3ZLTuU6TMRYxXrPl2c0VoGIkk2EoyvsX/lsEttWdlDs6GLfwps7r5JCITnjVJqvZmIFo4BZk+DrpRg3UcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755168189; c=relaxed/relaxed;
	bh=si9CbDdbSkrtahoEM2agGz+twUDM2oOQDkB8gFVKoJ0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M4pRn48TLfUXz0z71qGcX4M32xBsC6a0sDfhBQPa3GKfQPVLHDQF9dGAeMG6GCu4JP3GP+1s/73UeCYABTzlUIvADrho1KAZ8W6+1uvBoDNoJzdrbkH7CSarOdgY01A41PMa4NlU8dXd+Nr/evjWFsNhdJGVL+lOJrXkbvGz8C190LWZB8QHNdNSCr9jrQqy/DQWjCL+6xq2o6oNDMmn5/ud7aCO08gr0+CaMOaM1HcDKEd+wTxdqGapK+YqGDKvPkQ3+dXo89/LkcGC0LXDbDTqXIKCabuRjGsGMOiNYnJyauFhWsH0Z91cPAda5KzeOUAxYtq5kzLhYxb6ZJq31A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2hfM6dHrz3cYk
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 20:43:06 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVPp-0008Iy-NQ; Thu, 14 Aug 2025 12:42:37 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVPl-000EwX-2f;
	Thu, 14 Aug 2025 12:42:33 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1umVPl-000GxG-2N;
	Thu, 14 Aug 2025 12:42:33 +0200
Message-ID: <bf5a4aa0fc1a324a17c25e8ed5acbfd94d240251.camel@pengutronix.de>
Subject: Re: [PATCH v17 2/3] i2c: ast2600: Add controller driver for new
 register layout
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org, 
 joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
  conor+dt@kernel.org, andrew@codeconstruct.com.au, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Thu, 14 Aug 2025 12:42:33 +0200
In-Reply-To: <20250814084156.1650432-3-ryan_chen@aspeedtech.com>
References: <20250814084156.1650432-1-ryan_chen@aspeedtech.com>
	 <20250814084156.1650432-3-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Do, 2025-08-14 at 16:41 +0800, Ryan Chen wrote:
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
>  drivers/i2c/busses/i2c-ast2600.c | 1038 ++++++++++++++++++++++++++++++
>  3 files changed, 1054 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/i2c/busses/i2c-ast2600.c
>=20
[...]
> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> new file mode 100644
> index 000000000000..15e600ff50ec
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -0,0 +1,1038 @@
[...]
> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
>=20
[...]
> +	i2c_bus->rst =3D devm_reset_control_get_shared(dev, NULL);
> +	if (IS_ERR(i2c_bus->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst), "Missing reset ctrl\n=
");

What ...

> +	i2c_bus->rst =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> +	if (IS_ERR(i2c_bus->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst), "Missing reset ctrl\n=
");

... is this?

Choose one. If you use 1), call reset_control_deassert() somewhere. If
you use 2), remove reset_control_assert() below.

[...]
> +static void ast2600_i2c_remove(struct platform_device *pdev)
> +{
> +	struct ast2600_i2c_bus *i2c_bus =3D platform_get_drvdata(pdev);
> +
> +	/* Disable everything. */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
> +	reset_control_assert(i2c_bus->rst);

Drop if using devm_reset_control_get_shared_deasserted()

regards
Philipp

