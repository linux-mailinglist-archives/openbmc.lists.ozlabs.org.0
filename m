Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DA6EA06B
	for <lists+openbmc@lfdr.de>; Fri, 21 Apr 2023 02:06:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2ZYr2LqCz3fBf
	for <lists+openbmc@lfdr.de>; Fri, 21 Apr 2023 10:06:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E3qhRfsB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E3qhRfsB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2ZYF5PJhz3c9L;
	Fri, 21 Apr 2023 10:05:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C63F2643EA;
	Fri, 21 Apr 2023 00:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EDBC433EF;
	Fri, 21 Apr 2023 00:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682035533;
	bh=jGitmSHw4NxdxcoypkFgSqd6l/1pd1LyamKSK3L2PXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3qhRfsBiNGwLIGcnGvJi811FkDv7eNitDCTV/DGS9OldX3T+j7dEx26snweMWvCe
	 gSA5I5QkAF1jkDufJu4HujIbpJS2X+d7TjYm02O1hbhxfTEETG/2M1kkZBesVbUYTE
	 0d90qBOXy09uJ6p60Rl/KLvftVNiaKpmNrRS5ksgxv0t+2t6DpAWQYYPn9EOA2p2sD
	 xDx+b+ndwBfVo3A2ZcqeUVw8uch7fZwFRk743XCnGIvXbwcAgojn3JJm0HkYSLuPNF
	 9AIWCzkrl8lbeQykMtOrA8ZXfQsEHpb9zfq5ddI2g770ENwht7JO8FcTsBm0xBxLx0
	 hKW8hEuXxV5IA==
Date: Fri, 21 Apr 2023 02:05:29 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v10 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <20230421000529.6awtnawqgbk5orcp@intel.intel>
References: <20230415012848.1777768-1-ryan_chen@aspeedtech.com>
 <20230415012848.1777768-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415012848.1777768-3-ryan_chen@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Brendan Higgins <brendan.higgins@linux.dev>, Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, jk@codeconstruct.com.au, Jean Delvare <jdelvare@suse.de>, Phil Edworthy <phil.edworthy@renesas.com>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, William Zhang <william.zhang@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Tyrone Ting <kfting@nuvoton.com>, Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ryan,

On Sat, Apr 15, 2023 at 09:28:48AM +0800, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The i2c new register mode have separate register
> set to control i2c master and slave.

This commit message is a bit messy, could you please write it
more clear?

[...]

> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	struct ast2600_i2c_bus *i2c_bus;
> +	struct resource *res;
> +	u32 global_ctrl;
> +	int ret = 0;
> +
> +	i2c_bus = devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> +	if (!i2c_bus)
> +		return -ENOMEM;

Let's use dev_err_probe whenever possible, at least we keep a
coherent style.

[...]

> +	ret = devm_request_irq(dev, i2c_bus->irq, ast2600_i2c_bus_irq, 0,
> +			       dev_name(dev), i2c_bus);

isn't it better to use threaded irq? You have quite an elaborate
irq handler, you may want to use a thread for it.

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Unable to request irq %d\n", i2c_bus->irq);
> +
> +	if (of_property_read_bool(dev->of_node, "smbus-alert")) {
> +		i2c_bus->alert_enable = 1;

true;

alert_enable is boolean, make it bool.

> +		i2c_bus->ara = i2c_new_smbus_alert_device(&i2c_bus->adap, &i2c_bus->alert_data);
> +		if (!i2c_bus->ara)
> +			dev_warn(dev, "Failed to register ARA client\n");
> +
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER | AST2600_I2CM_SMBUS_ALT,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> +	} else {
> +		i2c_bus->alert_enable = 0;

false;

I'm not going to review any further, please send the patch after
you have run checkpatch.pl on it. Thanks!

Andi
