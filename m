Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B837055B8B6
	for <lists+openbmc@lfdr.de>; Mon, 27 Jun 2022 10:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWhDt0phxz3cd8
	for <lists+openbmc@lfdr.de>; Mon, 27 Jun 2022 18:47:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sntech.de (client-ip=185.11.138.130; helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=<UNKNOWN>)
X-Greylist: delayed 1579 seconds by postgrey-1.36 at boromir; Thu, 23 Jun 2022 06:14:22 AEST
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSvjp6VNbz3bq7;
	Thu, 23 Jun 2022 06:14:20 +1000 (AEST)
Received: from [46.183.103.8] (helo=phil.sntech)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o46KG-0004LY-G0; Wed, 22 Jun 2022 21:47:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: (subset) [PATCH v3 00/40] dt-bindings: input: gpio-keys: rework matching children
Date: Wed, 22 Jun 2022 21:47:36 +0200
Message-Id: <165592714968.3933570.9891201783444800337.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 27 Jun 2022 18:47:13 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, linux-aspeed@lists.ozlabs.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, Khuong Dinh <khuong@os.amperecomputing.com>, Gregory Clement <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Wei Xu <xuwei5@hisilicon.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-input@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jonathan Hunter <
 jonathanh@nvidia.com>, devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jun 2022 17:52:24 -0700, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

Applied, thanks!

[26/40] arm64: dts: rockchip: align gpio-key node names with dtschema
        commit: 517ed0ffd3cc691bef747288d51d01d2705b2251

        In the pinenote dts the original patch changed "cover" to
        switch, so to keep the cover information intact, I changed
        the node to "switch-cover" ... similar to other "switch-lid"
        instances in some other Rockchip devicetrees.

[27/40] ARM: dts: rockchip: align gpio-key node names with dtschema
        commit: 271e2c92285075a890c58cba9ad5979a8959f6ff
[28/40] ARM: dts: rockchip: rk3288-tinker: correct gpio-keys properties
        commit: e5a3cbe8b45b0a436a39cc969b7bcc8353248018

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
