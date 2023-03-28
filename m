Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7463F6CC050
	for <lists+openbmc@lfdr.de>; Tue, 28 Mar 2023 15:13:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm98x1zdgz3cJM
	for <lists+openbmc@lfdr.de>; Wed, 29 Mar 2023 00:13:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DM0XoB3K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DM0XoB3K;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm98C37dPz3cFY;
	Wed, 29 Mar 2023 00:12:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 85E56B81A99;
	Tue, 28 Mar 2023 13:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87623C433EF;
	Tue, 28 Mar 2023 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680009142;
	bh=syclwcK/oT0pSom8NZFtmAdR8n43l8GNIE7YH56c9w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DM0XoB3KQaJfPLp3jiKz+cfjQWvr72eRkBryHiXwIgMq9QAObJ8b5ZBrKxdsPYopW
	 7NId+xloccQjYxKmgd2LZLICdSoPCHrWRVKgBgcjBe1sYjK4nFzbgTzRJIfRRfRdPu
	 Iw1gej7xeMbyfGvBkptrrrCBcSJMqwMNhIL1ViYiLt8GrxNhru3ZhN8MxMZt9Sbma+
	 A6WeUDFduyIx8+RPIJwQ9KG3s1gOAdKNXsXl4T7HF/5fIfnGRwm1LBAx/sNeJ4RNC8
	 kXt+ZhOfDFM+rP++NYfpkhcaXCo7QRT42dNgQY+nxVXle2Y0FczHBsoQOi30Ix7mcB
	 Q+kEcdj9JdCBQ==
Date: Tue, 28 Mar 2023 15:12:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v7 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <20230328131219.khfd2jz3z4es5bzy@intel.intel>
References: <20230327092524.3916389-1-ryan_chen@aspeedtech.com>
 <20230327092524.3916389-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327092524.3916389-3-ryan_chen@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, jk@codeconstruct.com.au, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ryan,

[...]

> +	ret = of_property_read_u32(dev->of_node,
> +							"i2c-scl-clk-low-timeout-us",
> +							&i2c_bus->timeout);

in your v6 patch this was a boolean value. If you need to keep it
boolean you have the "i2c-scl-has-clk-low-timeout".

> +	if (ret < 0) {
> +		i2c_bus->timeout = 0;
> +	} else {
> +		/* i2c timeout counter: use base clk4 1Mhz
> +		 * per unit: 1/(1000/4096) = 4096us
> +		 */
> +		i2c_bus->timeout /= 4096;
> +	}

Can you please run checkpatch.pl before sending the patch?

[...]

> +	dev_info(dev, "%s [%d]: adapter [%d khz] mode [%d]\n",
> +		 dev->of_node->name, i2c_bus->adap.nr, i2c_bus->bus_frequency / 1000,
> +		 i2c_bus->mode);
> +
> +	return 0;
> +
> +	return ret;

can you also please do some cleanups before sending the patch?

Thanks,
Andi
