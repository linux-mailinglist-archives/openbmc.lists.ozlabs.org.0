Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3354D7C9
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:06:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNlry6MMgz3bsH
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:06:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZPOehE24;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZPOehE24;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJhsY41wvz3bfC
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 21:37:35 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id d14so5252093eda.12
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 04:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J1CNdl+ymZcnr0JduH+O3ZZl1OmQJzKiy2APN/Y/4tY=;
        b=ZPOehE24p7HA8GozbKhBX4B0dXpVvSESLJQbjRxENkaMorwmJSWJhddKup/ZL/4FcH
         Q+a2kwaJQwYcnBrZck8DwN4bgRaVm/UQVuKC/PrvY0OA+ze0wWnLy+A+31n3OvRIw0YI
         C3GYaMJYgMcZ59oQ9OcU37Dg4HIJ/Tuzf81/7ImB6ej8SPSiNJlKTn39nTfXCBugG+S7
         BUDE2N2hZ2cEu9xbGaC7HtQenyGVrxyqPpIvnLJ5egUS/JB2YSHPOVIdmsRrLGyQ9nAa
         i6R4j0liXrhULHl5IIXNyPfPDpUesnyKUg6lA6yfCOPGoH3Tj8stbeFexqGuVWq97K/r
         fJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J1CNdl+ymZcnr0JduH+O3ZZl1OmQJzKiy2APN/Y/4tY=;
        b=zkonegnvbHdBQL1zM3GQmjYR9qDiB7xo/J65f64ctgUnsmv/S0wJU08cw0naxd8Per
         HwI/LYVaWFJSALoChdu6+tNp+jPzyJFXbAfZJLMJ9bpniAG4GTiTBwc4ktNWlj5vF6re
         YtJ3Nsmy6rLTUvIdy4CdLyXkRKQFkmyte5mT7FFGsOjOR79dYMC4m6+elSruxcMArWSs
         inu5D04lCr/oUfieBEiFr2042nEnMQt4c9aTtLLDuvBR5aQw/gE+ItvSUaV9g6tD7Zqn
         rYAoo/Jt1/Cbgw0CG98apMJFLJUlP4PPzZ4clZTCnXt0lYAHGqnJeGwATYoaTmvDwZo9
         iNbQ==
X-Gm-Message-State: AOAM531Bj/dQyiDcMYRKeM+/ZzHBFS2Mw4/IMlr+fJseh3T+4r+U75Bt
	nK+U7pfYqzbfimLR+rJM41LhFQ==
X-Google-Smtp-Source: ABdhPJxwgYj4U/MNzRpUxDWrzfalxL9xWZxoUyAPxO4orO+W3sXVehIyY/KLoqYQ6LfAApMWqNKTyg==
X-Received: by 2002:a05:6402:c0c:b0:42d:c7b8:dff5 with SMTP id co12-20020a0564020c0c00b0042dc7b8dff5mr45247705edb.251.1654774651304;
        Thu, 09 Jun 2022 04:37:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id yz17-20020a170906dc5100b0070b1ecdc12bsm9404038ejb.112.2022.06.09.04.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:37:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org
Subject: [PATCH v2 00/48] dt-bindings: input: gpio-keys: rework matching children
Date: Thu,  9 Jun 2022 13:37:21 +0200
Message-Id: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Wei Xu <xuwei5@hisilicon.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Khuong Dinh <khuong@os.amperecomputing.com>, Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Gregory Clement <gregory.clement@bootlin.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <
 zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Ray Jui <rjui@broadcom.com>, linux-rockchip@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Sascha Hauer <s.hauer@pengutronix.de>, linux-input@vger.kernel.org, openbmc@lists.ozlabs.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matth
 ias Brugger <matthias.bgg@gmail.com>, NXP Linux Team 

<linux-imx@nxp.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>, Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

Merging
=======
1. dt-bindings: rebased on top of Rob's:
   https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/

2. DTS patches are independent. They can be picked up directly by sub-arch
   maintainers, by Arnd or Olof, or eventually by me (if you wish).

Changes since v1
================
Patch 1: Extend gpio-keys nodes pattern to cover buttons, events and switches (Jeff).
Patch 2: Include input.yaml (Dmitry, Rob).
Patch 3: New patch.
New DTS patches.

Best regards,
Krzysztof

Krzysztof Kozlowski (48):
  dt-bindings: input: gpio-keys: enforce node names to match all
    properties
  dt-bindings: input: gpio-keys: reference input.yaml and document
    properties
  dt-bindings: input: gpio-keys: accept also interrupt-extended
  dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl: align key node name
  arm64: dts: allwinner: align gpio-key node names with dtschema
  ARM: dts: allwinner: align gpio-key node names with dtschema
  arm64: dts: amlogic: correct gpio-keys properties
  arm64: dts: amlogic: align gpio-key node names with dtschema
  arm64: dts: apm: correct gpio-keys properties
  arm64: dts: broadcom: align gpio-key node names with dtschema
  ARM: dts: broadcom: align gpio-key node names with dtschema
  ARM: dts: broadcom: correct gpio-keys properties
  arm64: dts: freescale: align gpio-key node names with dtschema
  arm64: dts: freescale: align led node names with dtschema
  arm64: dts: hisilicon: align gpio-key node names with dtschema
  arm64: dts: hisilicon: correct gpio-keys properties
  arm64: dts: marvell: align gpio-key node names with dtschema
  arm64: dts: marvell: armada-3720: align lednode names with dtschema
  ARM: dts: marvell: align gpio-key node names with dtschema
  ARM: dts: marvell: correct gpio-keys properties
  arm64: dts: mediatek: align gpio-key node names with dtschema
  arm64: dts: mediatek: mt7622-bananapi-bpi-r64: align led node names
    with dtschema
  arm64: dts: mediatek: mt7622-rfb1: correct gpio-keys properties
  ARM: dts: mediatek: align gpio-key node names with dtschema
  arm64: dts: tegra: align gpio-key node names with dtschema
  ARM: dts: tegra: align gpio-key node names with dtschema
  arm64: dts: qcom: align gpio-key node names with dtschema
  arm64: dts: qcom: correct gpio-keys properties
  arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from
    gpio-keys
  arm64: dts: qcom: align led node names with dtschema
  ARM: dts: qcom: align gpio-key node names with dtschema
  arm64: dts: rockchip: align gpio-key node names with dtschema
  ARM: dts: rockchip: align gpio-key node names with dtschema
  ARM: dts: rockchip: rk3288-tinker: correct gpio-keys properties
  arm64: dts: ti: align gpio-key node names with dtschema
  arm64: dts: xilinx: align gpio-key node names with dtschema
  ARM: dts: xilinx: align gpio-key node names with dtschema
  ARM: dts: omap: align gpio-key node names with dtschema
  ARM: dts: omap: correct gpio-keys properties
  ARM: dts: animeo: align gpio-key node names with dtschema
  ARM: dts: animeo: correct gpio-keys properties
  ARM: dts: aspeed: align gpio-key node names with dtschema
  ARM: dts: aspeed: correct gpio-keys properties
  ARM: dts: at91: align gpio-key node names with dtschema
  ARM: dts: at91: correct gpio-keys properties
  ARM: dts: at91: drop unneeded status from gpio-keys
  ARM: dts: exynos: align gpio-key node names with dtschema
  ARM: dts: s5pv210: align gpio-key node names with dtschema

 .../devicetree/bindings/input/gpio-keys.yaml  | 159 +++++++++---------
 .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      |   2 +-
 arch/arm/boot/dts/am335x-evm.dts              |   8 +-
 arch/arm/boot/dts/am335x-guardian.dts         |   2 -
 .../boot/dts/am335x-moxa-uc-2100-common.dtsi  |   4 +-
 .../boot/dts/am335x-moxa-uc-8100-common.dtsi  |   4 +-
 arch/arm/boot/dts/am335x-pcm-953.dtsi         |   4 +-
 arch/arm/boot/dts/am335x-pepper.dts           |   8 +-
 arch/arm/boot/dts/am335x-shc.dts              |   6 +-
 arch/arm/boot/dts/am3517-evm-ui.dtsi          |  20 +--
 arch/arm/boot/dts/am3517-evm.dts              |  18 +-
 arch/arm/boot/dts/am437x-idk-evm.dts          |   6 +-
 arch/arm/boot/dts/animeo_ip.dts               |  10 +-
 arch/arm/boot/dts/armada-370-c200-v2.dts      |   8 +-
 arch/arm/boot/dts/armada-370-rd.dts           |   2 -
 .../boot/dts/armada-370-seagate-nas-xbay.dtsi |   8 +-
 .../armada-370-seagate-personal-cloud.dtsi    |   8 +-
 .../boot/dts/armada-381-netgear-gs110emx.dts  |   2 +-
 .../arm/boot/dts/armada-385-clearfog-gtr.dtsi |   4 +-
 arch/arm/boot/dts/armada-385-linksys.dtsi     |   4 +-
 .../arm/boot/dts/armada-388-clearfog-base.dts |   2 +-
 arch/arm/boot/dts/armada-388-clearfog.dts     |   2 +-
 arch/arm/boot/dts/armada-xp-axpwifiap.dts     |   6 +-
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts |   8 +-
 .../boot/dts/armada-xp-openblocks-ax3-4.dts   |   6 +-
 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts |  30 ++--
 .../boot/dts/aspeed-bmc-bytedance-g220a.dts   |  48 +++---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  |  10 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |  14 +-
 .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |  22 +--
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts   |  23 +--
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts   |  20 +--
 arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts   |   2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |   2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |   2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts    |  30 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |  14 +-
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts   |   4 +-
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   |  16 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |   4 +-
 arch/arm/boot/dts/at91-foxg20.dts             |   4 +-
 arch/arm/boot/dts/at91-gatwick.dts            |   2 +-
 arch/arm/boot/dts/at91-kizbox.dts             |   8 +-
 arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  10 +-
 arch/arm/boot/dts/at91-kizbox3-hs.dts         |  12 +-
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi |   6 +-
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts   |   2 +-
 arch/arm/boot/dts/at91-qil_a9260.dts          |   4 +-
 arch/arm/boot/dts/at91-sam9x60ek.dts          |   5 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts   |   4 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts |   5 +-
 arch/arm/boot/dts/at91-sama5d2_icp.dts        |   5 +-
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts     |   4 +-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts   |   4 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts   |   4 +-
 arch/arm/boot/dts/at91-sama5d4_xplained.dts   |   4 +-
 arch/arm/boot/dts/at91-sama5d4ek.dts          |   4 +-
 arch/arm/boot/dts/at91-sama7g5ek.dts          |   4 +-
 arch/arm/boot/dts/at91-wb45n.dts              |   7 +-
 arch/arm/boot/dts/at91-wb50n.dts              |  10 +-
 arch/arm/boot/dts/at91sam9260ek.dts           |   6 +-
 arch/arm/boot/dts/at91sam9261ek.dts           |  10 +-
 arch/arm/boot/dts/at91sam9263ek.dts           |   6 +-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi   |   6 +-
 .../dts/at91sam9g25-gardena-smart-gateway.dts |   2 +-
 arch/arm/boot/dts/at91sam9m10g45ek.dts        |  16 +-
 arch/arm/boot/dts/at91sam9n12ek.dts           |   4 +-
 arch/arm/boot/dts/at91sam9rlek.dts            |   6 +-
 arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dts   |   6 +-
 arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dts   |   8 +-
 .../bcm4708-buffalo-wzr-1166dhp-common.dtsi   |  10 +-
 .../boot/dts/bcm4708-buffalo-wzr-1750dhp.dts  |  10 +-
 .../boot/dts/bcm4708-linksys-ea6300-v1.dts    |   4 +-
 .../boot/dts/bcm4708-linksys-ea6500-v2.dts    |   4 +-
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts  |   2 +-
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts  |   2 +-
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts   |   6 +-
 .../arm/boot/dts/bcm4708-netgear-r6300-v2.dts |   6 +-
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts |   6 +-
 arch/arm/boot/dts/bcm47081-asus-rt-n18u.dts   |   4 +-
 .../boot/dts/bcm47081-buffalo-wzr-600dhp2.dts |   8 +-
 .../boot/dts/bcm47081-buffalo-wzr-900dhp.dts  |   2 +-
 arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts |   2 +-
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts |   2 +-
 .../boot/dts/bcm47081-tplink-archer-c5-v2.dts |   4 +-
 arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dts   |   6 +-
 .../boot/dts/bcm4709-buffalo-wxr-1900dhp.dts  |  14 +-
 arch/arm/boot/dts/bcm4709-linksys-ea9200.dts  |   6 +-
 arch/arm/boot/dts/bcm4709-netgear-r7000.dts   |   8 +-
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts   |  10 +-
 .../boot/dts/bcm4709-tplink-archer-c9-v1.dts  |   6 +-
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts  |   8 +-
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts |   6 +-
 .../boot/dts/bcm47094-linksys-panamera.dts    |   6 +-
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts |   2 +-
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts |   2 +-
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts |   2 +-
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts |   4 +-
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts |   2 +-
 .../boot/dts/bcm47094-luxul-xwr-3150-v1.dts   |   2 +-
 arch/arm/boot/dts/bcm47094-netgear-r8500.dts  |   8 +-
 arch/arm/boot/dts/bcm47094-phicomm-k3.dts     |   2 +-
 arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts |   2 +-
 arch/arm/boot/dts/bcm47189-luxul-xap-810.dts  |   2 +-
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts      |   6 +-
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts    |   4 +-
 arch/arm/boot/dts/bcm911360_entphn.dts        |   4 +-
 arch/arm/boot/dts/bcm947189acdbmr.dts         |   4 +-
 arch/arm/boot/dts/bcm953012er.dts             |   4 +-
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi |   2 +-
 .../boot/dts/bcm958625-meraki-kingpin.dtsi    |   2 +-
 arch/arm/boot/dts/exynos4210-i9100.dts        |   8 +-
 arch/arm/boot/dts/exynos4210-origen.dts       |  10 +-
 arch/arm/boot/dts/exynos4412-itop-elite.dts   |  10 +-
 arch/arm/boot/dts/exynos5250-arndale.dts      |  12 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |   2 +-
 arch/arm/boot/dts/exynos5250-spring.dts       |   2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |   2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |   2 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |   2 +-
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts        |   4 +-
 arch/arm/boot/dts/mt7623a-rfb-nand.dts        |   4 +-
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |   4 +-
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |   4 +-
 arch/arm/boot/dts/mt7629-rfb.dts              |   4 +-
 .../boot/dts/qcom-apq8064-asus-nexus7-flo.dts |   4 +-
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |   8 +-
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi |   2 +-
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts     |   4 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi      |   6 +-
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |   4 +-
 .../dts/qcom-msm8974-sony-xperia-rhine.dtsi   |   8 +-
 .../dts/qcom-msm8974pro-fairphone-fp2.dts     |   6 +-
 .../boot/dts/qcom-msm8974pro-samsung-klte.dts |   6 +-
 ...-msm8974pro-sony-xperia-shinano-castor.dts |   8 +-
 arch/arm/boot/dts/rk3066a-bqcurie2.dts        |   4 +-
 arch/arm/boot/dts/rk3066a-rayeager.dts        |   2 +-
 arch/arm/boot/dts/rk3188-bqedison2qc.dts      |   4 +-
 arch/arm/boot/dts/rk3188-px3-evb.dts          |   2 +-
 arch/arm/boot/dts/rk3188-radxarock.dts        |   2 +-
 arch/arm/boot/dts/rk3229-evb.dts              |   2 +-
 arch/arm/boot/dts/rk3288-evb.dtsi             |   2 +-
 arch/arm/boot/dts/rk3288-firefly-reload.dts   |   2 +-
 arch/arm/boot/dts/rk3288-firefly.dtsi         |   2 +-
 arch/arm/boot/dts/rk3288-phycore-rdk.dts      |   4 +-
 arch/arm/boot/dts/rk3288-popmetal.dts         |   2 +-
 arch/arm/boot/dts/rk3288-r89.dts              |   2 +-
 arch/arm/boot/dts/rk3288-rock2-square.dts     |   2 +-
 arch/arm/boot/dts/rk3288-tinker.dtsi          |   4 +-
 .../boot/dts/rk3288-veyron-chromebook.dtsi    |   2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts    |   4 +-
 arch/arm/boot/dts/rk3288-veyron-pinky.dts     |   2 +-
 arch/arm/boot/dts/rk3288-veyron.dtsi          |   2 +-
 arch/arm/boot/dts/s5pv210-fascinate4g.dts     |   6 +-
 arch/arm/boot/dts/s5pv210-galaxys.dts         |   8 +-
 arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts  |  40 ++---
 arch/arm/boot/dts/sun4i-a10-pcduino.dts       |   6 +-
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts      |   6 +-
 .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    |   4 +-
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts     |   4 +-
 .../boot/dts/sun8i-h3-mapleboard-mp130.dts    |   6 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-duo2.dts    |   4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi        |   4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts     |   6 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts  |   4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts   |   4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts    |   4 +-
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi |   4 +-
 .../boot/dts/sunxi-libretech-all-h3-cc.dtsi   |   4 +-
 arch/arm/boot/dts/tegra114-asus-tf701t.dts    |   8 +-
 arch/arm/boot/dts/tegra114-dalmore.dts        |   8 +-
 arch/arm/boot/dts/tegra114-roth.dts           |   6 +-
 arch/arm/boot/dts/tegra114-tn7.dts            |   6 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts    |   2 +-
 .../boot/dts/tegra124-apalis-v1.2-eval.dts    |   2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     |   2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi          |   4 +-
 arch/arm/boot/dts/tegra124-venice2.dts        |   2 +-
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   8 +-
 arch/arm/boot/dts/tegra20-asus-tf101.dts      |   8 +-
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts |   2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts    |   2 +-
 arch/arm/boot/dts/tegra20-harmony.dts         |   2 +-
 arch/arm/boot/dts/tegra20-paz00.dts           |   2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts        |   4 +-
 arch/arm/boot/dts/tegra20-trimslice.dts       |   2 +-
 arch/arm/boot/dts/tegra20-ventana.dts         |   2 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts     |   2 +-
 .../arm/boot/dts/tegra30-apalis-v1.1-eval.dts |   2 +-
 .../tegra30-asus-nexus7-grouper-common.dtsi   |   8 +-
 .../dts/tegra30-asus-transformer-common.dtsi  |  10 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |   6 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts |   2 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |   2 +-
 .../arm/boot/dts/tegra30-pegatron-chagall.dts |  10 +-
 arch/arm/boot/dts/zynq-zc702.dts              |   4 +-
 arch/arm/boot/dts/zynq-zturn-common.dtsi      |   2 +-
 .../dts/allwinner/sun50i-a64-pinebook.dts     |   4 +-
 .../dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts |   4 +-
 .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   4 +-
 .../allwinner/sun50i-h5-orangepi-prime.dts    |   4 +-
 .../boot/dts/amlogic/meson-g12b-gsking-x.dts  |   2 -
 .../dts/amlogic/meson-g12b-gtking-pro.dts     |   2 -
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   |   2 -
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |   4 +-
 .../dts/amlogic/meson-gxbb-wetek-play2.dts    |   4 +-
 .../meson-gxl-s905d-mecool-kii-pro.dts        |   4 +-
 .../boot/dts/amlogic/meson-gxl-s905d-p230.dts |   4 +-
 .../amlogic/meson-gxl-s905d-vero4k-plus.dts   |   4 +-
 .../dts/amlogic/meson-gxm-mecool-kiii-pro.dts |   4 +-
 .../dts/amlogic/meson-gxm-minix-neo-u9h.dts   |   4 +-
 .../arm64/boot/dts/amlogic/meson-gxm-q200.dts |   4 +-
 .../dts/amlogic/meson-gxm-wetek-core2.dts     |   2 -
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  10 +-
 arch/arm64/boot/dts/apm/apm-merlin.dts        |   2 +-
 arch/arm64/boot/dts/apm/apm-mustang.dts       |   2 +-
 .../bcm4906-tplink-archer-c2300-v1.dts        |   8 +-
 .../bcm4908/bcm4908-asus-gt-ac5300.dts        |   8 +-
 .../boot/dts/freescale/fsl-ls1088a-ten64.dts  |  10 +-
 .../boot/dts/freescale/imx8mm-mx8menlo.dts    |   4 +-
 .../dts/freescale/imx8mm-var-som-symphony.dts |   6 +-
 .../dts/freescale/imx8mm-venice-gw700x.dtsi   |   8 +-
 .../dts/freescale/imx8mm-venice-gw7901.dts    |   8 +-
 .../dts/freescale/imx8mm-venice-gw7902.dts    |   8 +-
 .../dts/freescale/imx8mm-venice-gw7903.dts    |   6 +-
 .../boot/dts/freescale/imx8mm-verdin.dtsi     |   2 +-
 .../dts/freescale/imx8mn-var-som-symphony.dts |   6 +-
 .../dts/freescale/imx8mn-venice-gw7902.dts    |   8 +-
 .../boot/dts/freescale/imx8mp-verdin.dtsi     |   2 +-
 .../dts/freescale/imx8mq-librem5-devkit.dts   |   6 +-
 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   4 +-
 .../boot/dts/freescale/imx8mq-nitrogen.dts    |   2 +-
 .../freescale/imx8qxp-colibri-eval-v3.dtsi    |   2 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     |   6 +-
 .../boot/dts/hisilicon/hi3660-hikey960.dts    |   2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts   |   6 +-
 .../dts/marvell/armada-3720-turris-mox.dts    |   4 +-
 .../marvell/armada-8040-clearfog-gt-8k.dts    |   4 +-
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  11 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   5 +-
 .../dts/mediatek/mt8173-elm-hana-rev7.dts     |   6 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  10 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   4 +-
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |   2 +-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   2 +-
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   4 +-
 .../arm64/boot/dts/nvidia/tegra132-norrin.dts |   4 +-
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   |   6 +-
 .../nvidia/tegra186-p3509-0000+p3636-0001.dts |   6 +-
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |   4 +-
 .../boot/dts/nvidia/tegra194-p3509-0000.dtsi  |   4 +-
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   6 +-
 .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi |   2 +-
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  10 +-
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts |   6 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts      |   4 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts   |   6 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts |   2 +-
 .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts |   4 +-
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts |   2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |   2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts |   2 +-
 .../qcom/msm8916-samsung-a2015-common.dtsi    |   6 +-
 .../boot/dts/qcom/msm8916-samsung-j5.dts      |   4 +-
 .../dts/qcom/msm8916-samsung-serranove.dts    |   6 +-
 .../dts/qcom/msm8916-wingtech-wt88047.dts     |   2 +-
 .../boot/dts/qcom/msm8992-xiaomi-libra.dts    |   6 +-
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  |  10 +-
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    |  12 +-
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |   6 +-
 .../boot/dts/qcom/msm8998-fxtec-pro1.dts      |  26 ++-
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi |   6 +-
 .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi |   8 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |   2 +-
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     |  11 +-
 .../boot/dts/qcom/sdm632-fairphone-fp3.dts    |   2 +-
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  |   2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |   2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  10 +-
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |   4 +-
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    |   2 +-
 .../dts/qcom/sdm845-sony-xperia-tama.dtsi     |   2 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |   2 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |   4 +-
 .../qcom/sm6125-sony-xperia-seine-pdx201.dts  |   4 +-
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    |   2 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts       |   4 +-
 .../dts/qcom/sm8150-microsoft-surface-duo.dts |   4 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts       |   4 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi |   2 +-
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   |   2 +-
 arch/arm64/boot/dts/rockchip/rk3308-evb.dts   |   2 +-
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   |  32 ++--
 .../boot/dts/rockchip/rk3328-nanopi-r2s.dts   |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi  |   2 +-
 .../boot/dts/rockchip/rk3368-geekbox.dts      |   2 +-
 .../dts/rockchip/rk3368-orion-r68-meta.dts    |   2 +-
 .../boot/dts/rockchip/rk3368-px5-evb.dts      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts   |   2 +-
 .../boot/dts/rockchip/rk3399-firefly.dts      |   2 +-
 .../dts/rockchip/rk3399-gru-chromebook.dtsi   |   2 +-
 .../boot/dts/rockchip/rk3399-gru-kevin.dts    |   2 +-
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi |   2 +-
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi |   2 +-
 .../boot/dts/rockchip/rk3399-nanopi-r4s.dts   |   4 +-
 .../boot/dts/rockchip/rk3399-nanopi4.dtsi     |   2 +-
 .../boot/dts/rockchip/rk3399-orangepi.dts     |   2 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts |   4 +-
 .../boot/dts/rockchip/rk3399-roc-pc.dtsi      |   2 +-
 .../boot/dts/rockchip/rk3399-rockpro64.dtsi   |   2 +-
 .../boot/dts/rockchip/rk3399-sapphire.dtsi    |   2 +-
 .../boot/dts/rockchip/rk3566-pinenote.dtsi    |   2 +-
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |   4 +-
 .../dts/ti/k3-j721e-common-proc-board.dts     |   4 +-
 .../boot/dts/xilinx/zynqmp-sm-k26-revA.dts    |   2 +-
 .../boot/dts/xilinx/zynqmp-zcu100-revC.dts    |   2 +-
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    |   2 +-
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    |   2 +-
 .../boot/dts/xilinx/zynqmp-zcu111-revA.dts    |   2 +-
 321 files changed, 896 insertions(+), 997 deletions(-)

-- 
2.34.1

