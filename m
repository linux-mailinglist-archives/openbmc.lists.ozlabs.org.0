Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5F76EEF87
	for <lists+openbmc@lfdr.de>; Wed, 26 Apr 2023 09:44:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5rV042kvz3cLf
	for <lists+openbmc@lfdr.de>; Wed, 26 Apr 2023 17:44:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=pza@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5rTd3Jrhz3cBp
	for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2023 17:43:46 +1000 (AEST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1prZoO-0001la-DI; Wed, 26 Apr 2023 09:43:36 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1prZoM-0001fM-I9; Wed, 26 Apr 2023 09:43:34 +0200
Date: Wed, 26 Apr 2023 09:43:34 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v7 2/2] clk: wpcm450: Add Nuvoton WPCM450 clock/reset
 controller driver
Message-ID: <20230426074334.GC4724@pengutronix.de>
References: <20230422220240.322572-1-j.neuschaefer@gmx.net>
 <20230422220240.322572-3-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230422220240.322572-3-j.neuschaefer@gmx.net>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Benjamin Fair <benjaminfair@google.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

On Sun, Apr 23, 2023 at 12:02:40AM +0200, Jonathan Neuschäfer wrote:
> This driver implements the following features w.r.t. the clock and reset
> controller in the WPCM450 SoC:
> 
> - It calculates the rates for all clocks managed by the clock controller
> - It leaves the clock tree mostly unchanged, except that it enables/
>   disables clock gates based on usage.
> - It exposes the reset lines managed by the controller using the
>   Generic Reset Controller subsystem
> 
> NOTE: If the driver and the corresponding devicetree node are present,
>       the driver will disable "unused" clocks. This is problem until
>       the clock relations are properly declared in the devicetree (in a
>       later patch). Until then, the clk_ignore_unused kernel parameter
>       can be used as a workaround.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
[...]
> diff --git a/drivers/clk/clk-wpcm450.c b/drivers/clk/clk-wpcm450.c
> new file mode 100644
> index 0000000000000..6f6d8a1ea3484
> --- /dev/null
> +++ b/drivers/clk/clk-wpcm450.c
> @@ -0,0 +1,374 @@
[...]
> +static void __init wpcm450_clk_init(struct device_node *clk_np)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	static struct clk_hw **hws;
> +	static struct clk_hw *hw;
> +	void __iomem *clk_base;
> +	int i, ret;
> +	struct reset_simple_data *reset;
[...]
> +	// Reset controller
> +	reset = kzalloc(sizeof(*reset), GFP_KERNEL);
> +	if (!reset)
> +		return;
> +	reset->rcdev.owner = THIS_MODULE;
> +	reset->rcdev.nr_resets = WPCM450_NUM_RESETS;
> +	reset->rcdev.ops = &reset_simple_ops;
> +	reset->rcdev.of_node = clk_np;
> +	reset->membase = clk_base + REG_IPSRST;
> +	ret = reset_controller_register(&reset->rcdev);
> +	if (ret)
> +		pr_err("Failed to register reset controller: %d\n", ret);

You could use %pe for consistency.

regards
Philipp
