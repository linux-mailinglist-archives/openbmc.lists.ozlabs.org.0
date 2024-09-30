Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F22C98B02C
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 00:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbjg0rt7z2yFL
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 08:44:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727735763;
	cv=none; b=NojEODjl0WmIJvoCSHQmckLuR1EUB0+w7chSPPIbqMBcAHXGx0OkZfVF7cI91HvQMzGT8OErhaBWsJnwZ1I9DG5ZarjAzSeEW2SFRdQP/hqWm006UB2gri2VheOap4cwrzOZi9ArslYDCGhfa/+/KBS8eXmp4AIONSuiwAL355GxgH64Z3kNokhDKKMzHZxidSCK5M+mt3j+atRh8cPx962EMC0P5yrl1nJn1K8g8NijqcOfOCZ/rnuBZlK2Li6uczOhrsra1jBaWMTPP/7z4rxWRyRp7dMKqU5nw80YmxJIA37J8zxWRINq9aKYo9V9kOhqgHF1CIpjLZrGhV90bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727735763; c=relaxed/relaxed;
	bh=Z3L3nWeMe3+RijiNbz53M3pYY4+h3uf0T5+ZslPRExg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cyNztWtjiLbZHkN1O5+dAvepKTREIBzJg0859u0rHmNd2RbbzPDDV4EY6aqz0ORYGK38k0fX0ZlYDBuh2OY1mWYcVhqFmJG8Zg8KpR7PzPdBZ6EkSe3Fla1P+n0dMcTp9fjxttl3x1ZQuYf6y4x7po9jM7oUi1ayjYkn9Md7JkH1Q3jFY7uaM/Vkgp3mUPP1X3lrxmC8XvYKw52Gauh2YSkxB/9XHLu0TZ4+CNJnE5j8uX6oxX9sBFtlXe0wLdESrsO2zdZxboO5iT3kX9ClxK7qqFQoPded1pC8IimdwDThbMV78Ax/i0L3uBGx4JXSfoF7YrFF0P3mZlb4lj7D8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hn3QvS1R; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hn3QvS1R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHbWk4l1Yz2xG5;
	Tue,  1 Oct 2024 08:36:00 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71c5df16b10so2872722b3a.0;
        Mon, 30 Sep 2024 15:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727735756; x=1728340556; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3L3nWeMe3+RijiNbz53M3pYY4+h3uf0T5+ZslPRExg=;
        b=Hn3QvS1R6tBmRQXrFV5BvlG8QtsMZPOL0YvDi0l9tVLJrIIptTaplbqsFOEqhAg6tD
         YKX0D5XGswczWwdv9+wzZ4mvQ2xf+6BcBVfai3kBzfBAET32NO1s82nV5q/2cXEAn7mJ
         LIT9Z660COT8EyEJqHOXzppURaiDyNCGAm9BDSaABxIQ8XNiQY8/YrbLHAGLFFjFkvP/
         svVqtyZ4KJxO8EYwHAWHTa0SgJ9JRrKEM+VcIHxjx+Js5sBKD3NJzNw9J7gAK286j4fO
         ttxZ1AYEPd4vzE2MAlVnO8z3n3xyKXgskSgOkKKQe0EBmiNGbktDAUbcGvtTimwRKLsO
         FJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727735756; x=1728340556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3L3nWeMe3+RijiNbz53M3pYY4+h3uf0T5+ZslPRExg=;
        b=GpLE33hxfDyrkrVNSoUA3C68/nZohDl7KYIZUABpKUi6rIgpFbAb3E9iWeKFwggO3S
         H/Dpqes8Uw74LrtEy8g/z1c3uhqQGxu5QvpvXhZVrUCMJ07c+ALbBAhYOE4czNlnAF/s
         z81toWddnJU56gjIC1IHTsMYhWPSbI7KgJla0l7w37VvofvQkncI7oQJUFGCkQZQ+vcf
         FJlpZE40xXBl4E63wJUoJPab9jEDEMuY2pOAvMlVTYbPwc/Zwc+DtMV4XgTT7zJkwCn7
         j5ODSky1gR1IEgCwXQCCk9JZfEoRnBHkDNbjn4F7k781T9NGlBC2kOLRvLbJnCYAofbr
         vBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpO/VowPHn0/Qz60vxf0WLxDaLz05x0YeT4UCK0pZ8G9KXR45Px6h0rPCIES+nPLHHbqz+bMm35A==@lists.ozlabs.org, AJvYcCX3pcdLt3D+6JCmimb9eDPx8vzYkMz7192Y2DyEnjNy74FhPaFq4GVrJ2AVBdidaY4yNNYqXkkjedYG8JE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyn59b6FvyB3K9AYLvZqIyEM2Cpxb6m3TWIe8aXLrftjYdUGn5D
	QD7xwqJS2UaSr2OTMeyjPkruM6Ce8CctDk9RmKGTtM+HP4B/s+0I
X-Google-Smtp-Source: AGHT+IEoL4nYNqX5qtZQktaHoWITTRIyh7vD+GwR9lIB8E7iQIIPlqoW8wL4dlrqM+fNOk7bXNTWSA==
X-Received: by 2002:a05:6a00:9a1:b0:70d:2a88:a483 with SMTP id d2e1a72fcca58-71b25daa507mr22800497b3a.0.1727735756096;
        Mon, 30 Sep 2024 15:35:56 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26524a8dsm7005158b3a.146.2024.09.30.15.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 15:35:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] ARN: dts: some dtc warning fixes
Date: Mon, 30 Sep 2024 15:35:48 -0700
Message-ID: <20240930223550.353882-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 01 Oct 2024 08:44:34 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Tomasz Maciej Nowak <tmn505@gmail.com>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jisheng Zhang <jszhang@kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Nicolas Chauvet <kwizart@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jernej Skrabec <jernej.skrabec@gmail.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>, Robert Eckelmann <longnoserob@gmail.com>, "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, Javier Martinez Canillas <javier@dowhile0.org>, "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, David Lechner <david@lechnology.com>, Arnd Bergmann <arnd@arndb.de>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "maintainer:SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT" <soc@kernel.org>, Rosen Penev <rosenp@gmail.com>, Lars Persson <lars.persson@axis.com>, Santosh Shilimkar <ssantosh@kernel.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>, Denis Burkov <hitechshell@mail.ru>, Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Antoine Tenart <atenart@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>, "open list:DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT" <kernel@dh-electronics.com>, Alexey Charkov <alchark@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Viresh Kumar <vireshk@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, "moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>, "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

dtc unfortunately outputs a lot of warnings when building ARM. These are
two basic fixes.

Rosen Penev (2):
  ARM: dts: replace gpio = with gpios =
  ARM: dts: assign reg to memory nodes

 .../boot/dts/allwinner/sun4i-a10-a1000.dts    |  2 +-
 .../dts/allwinner/sun4i-a10-ba10-tvbox.dts    |  2 +-
 .../allwinner/sun4i-a10-dserve-dsrv9703c.dts  |  2 +-
 .../dts/allwinner/sun4i-a10-hackberry.dts     |  4 +--
 .../dts/allwinner/sun4i-a10-hyundai-a7hd.dts  |  2 +-
 .../dts/allwinner/sun4i-a10-jesurun-q5.dts    |  2 +-
 .../boot/dts/allwinner/sun4i-a10-mk802.dts    |  2 +-
 .../allwinner/sun4i-a10-olinuxino-lime.dts    |  2 +-
 .../boot/dts/allwinner/sun4i-a10-pcduino2.dts |  2 +-
 .../dts/allwinner/sun4i-a10-topwise-a721.dts  |  2 +-
 .../dts/allwinner/sun5i-a10s-auxtek-t003.dts  |  4 +--
 .../dts/allwinner/sun5i-a10s-auxtek-t004.dts  |  4 +--
 .../boot/dts/allwinner/sun5i-a10s-mk802.dts   |  2 +-
 .../allwinner/sun5i-a10s-olinuxino-micro.dts  |  4 +--
 .../dts/allwinner/sun5i-a10s-r7-tv-dongle.dts |  2 +-
 .../boot/dts/allwinner/sun5i-a10s-wobo-i5.dts |  4 +--
 .../sun5i-a13-empire-electronix-d709.dts      |  2 +-
 .../boot/dts/allwinner/sun5i-a13-hsg-h702.dts |  2 +-
 .../dts/allwinner/sun5i-a13-licheepi-one.dts  |  2 +-
 .../allwinner/sun5i-a13-olinuxino-micro.dts   |  4 +--
 .../dts/allwinner/sun5i-a13-olinuxino.dts     |  4 +--
 .../sun5i-a13-pocketbook-614-plus.dts         |  6 ++---
 .../sun5i-a13-pocketbook-touch-lux-3.dts      |  8 +++---
 .../boot/dts/allwinner/sun5i-a13-utoo-p66.dts |  2 +-
 arch/arm/boot/dts/allwinner/sun5i-gr8-evb.dts |  2 +-
 arch/arm/boot/dts/allwinner/sun5i-r8-chip.dts |  2 +-
 .../sun5i-reference-design-tablet.dtsi        |  2 +-
 .../dts/allwinner/sun6i-a31-app4-evb1.dts     |  2 +-
 .../boot/dts/allwinner/sun6i-a31-colombus.dts |  2 +-
 .../dts/allwinner/sun6i-a31-hummingbird.dts   |  4 +--
 arch/arm/boot/dts/allwinner/sun6i-a31-i7.dts  |  2 +-
 arch/arm/boot/dts/allwinner/sun6i-a31-m9.dts  |  2 +-
 .../allwinner/sun6i-a31-mele-a1000g-quad.dts  |  2 +-
 .../allwinner/sun7i-a20-bananapi-m1-plus.dts  |  2 +-
 .../boot/dts/allwinner/sun7i-a20-bananapi.dts |  2 +-
 .../dts/allwinner/sun7i-a20-bananapro.dts     |  6 ++---
 .../dts/allwinner/sun7i-a20-cubietruck.dts    |  4 +--
 .../dts/allwinner/sun7i-a20-hummingbird.dts   |  8 +++---
 .../dts/allwinner/sun7i-a20-i12-tvbox.dts     |  6 ++---
 .../dts/allwinner/sun7i-a20-lamobo-r1.dts     |  6 ++---
 .../allwinner/sun7i-a20-olimex-som-evb.dts    |  2 +-
 .../allwinner/sun7i-a20-olimex-som204-evb.dts |  4 +--
 .../allwinner/sun7i-a20-olinuxino-lime.dts    |  2 +-
 .../allwinner/sun7i-a20-olinuxino-lime2.dts   |  4 +--
 .../dts/allwinner/sun7i-a20-orangepi-mini.dts |  6 ++---
 .../boot/dts/allwinner/sun7i-a20-orangepi.dts |  6 ++---
 .../dts/allwinner/sun7i-a20-pcduino3-nano.dts |  4 +--
 .../boot/dts/allwinner/sun7i-a20-pcduino3.dts |  2 +-
 .../sun8i-a83t-allwinner-h8homlet-v2.dts      |  4 +--
 .../dts/allwinner/sun8i-a83t-bananapi-m3.dts  |  4 +--
 .../allwinner/sun8i-a83t-cubietruck-plus.dts  |  4 +--
 .../dts/allwinner/sun8i-a83t-tbs-a711.dts     |  2 +-
 .../sun8i-h2-plus-bananapi-m2-zero.dts        |  4 +--
 .../allwinner/sun8i-h2-plus-orangepi-r1.dts   |  2 +-
 .../allwinner/sun8i-h2-plus-orangepi-zero.dts |  2 +-
 .../dts/allwinner/sun8i-h3-beelink-x2.dts     |  2 +-
 .../dts/allwinner/sun8i-h3-nanopi-duo2.dts    |  6 ++---
 .../dts/allwinner/sun8i-h3-nanopi-m1-plus.dts |  2 +-
 .../boot/dts/allwinner/sun8i-h3-nanopi-r1.dts |  4 +--
 .../dts/allwinner/sun8i-h3-orangepi-2.dts     |  2 +-
 .../dts/allwinner/sun8i-h3-orangepi-one.dts   |  2 +-
 .../dts/allwinner/sun8i-h3-orangepi-pc.dts    |  2 +-
 .../dts/allwinner/sun8i-h3-orangepi-plus.dts  |  4 +--
 .../allwinner/sun8i-h3-orangepi-plus2e.dts    |  2 +-
 .../boot/dts/allwinner/sun8i-h3-zeropi.dts    |  2 +-
 .../boot/dts/allwinner/sun8i-r16-parrot.dts   |  2 +-
 .../allwinner/sun8i-r40-bananapi-m2-ultra.dts |  2 +-
 .../boot/dts/allwinner/sun8i-s3-pinecube.dts  |  2 +-
 .../boot/dts/allwinner/sun8i-t3-cqa3t-bv3.dts |  2 +-
 .../allwinner/sun8i-v40-bananapi-m2-berry.dts |  2 +-
 .../boot/dts/allwinner/sun9i-a80-optimus.dts  |  4 +--
 .../dts/allwinner/sunxi-bananapi-m2-plus.dtsi |  4 +--
 .../allwinner/sunxi-common-regulators.dtsi    |  8 +++---
 .../allwinner/sunxi-h3-h5-emlid-neutis.dtsi   |  2 +-
 .../allwinner/sunxi-libretech-all-h3-cc.dtsi  |  8 +++---
 .../allwinner/sunxi-libretech-all-h3-it.dtsi  |  8 +++---
 .../dts/alphascale/alphascale-asm9260.dtsi    |  2 +-
 arch/arm/boot/dts/amazon/alpine.dtsi          |  2 +-
 arch/arm/boot/dts/amlogic/meson6-atv1200.dts  |  2 +-
 .../boot/dts/amlogic/meson8-minix-neo-x8.dts  |  2 +-
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts   |  6 ++---
 arch/arm/boot/dts/amlogic/meson8b-mxq.dts     |  2 +-
 .../arm/boot/dts/amlogic/meson8b-odroidc1.dts |  4 +--
 .../boot/dts/amlogic/meson8m2-mxiii-plus.dts  |  2 +-
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi    |  2 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts |  2 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts |  2 +-
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi   |  2 +-
 arch/arm/boot/dts/arm/integrator.dtsi         |  2 +-
 arch/arm/boot/dts/arm/versatile-ab.dts        |  2 +-
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 12 ++++-----
 .../dts/aspeed/aspeed-bmc-inspur-on5263m5.dts |  2 +-
 arch/arm/boot/dts/axis/artpec6-devboard.dts   |  2 +-
 .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |  4 +--
 .../boot/dts/broadcom/bcm2711-rpi-cm4.dtsi    |  2 +-
 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts   |  4 +--
 .../boot/dts/gemini/gemini-dlink-dir-685.dts  |  2 +-
 .../boot/dts/intel/axm/axm5516-amarillo.dts   |  2 +-
 .../dts/intel/pxa/pxa300-raumfeld-common.dtsi |  4 +--
 .../intel/pxa/pxa300-raumfeld-controller.dts  |  2 +-
 .../socfpga/socfpga_cyclone5_vining_fpga.dts  |  2 +-
 .../boot/dts/marvell/armada-370-c200-v2.dts   |  2 +-
 .../dts/marvell/armada-370-dlink-dns327l.dts  |  6 ++---
 .../marvell/armada-370-seagate-nas-4bay.dts   |  4 +--
 .../marvell/armada-370-seagate-nas-xbay.dtsi  |  4 +--
 ...armada-370-seagate-personal-cloud-2bay.dts |  2 +-
 .../armada-370-seagate-personal-cloud.dtsi    |  4 +--
 .../marvell/armada-370-synology-ds213j.dts    |  4 +--
 .../marvell/armada-381-netgear-gs110emx.dts   |  2 +-
 .../marvell/armada-382-rd-ac3x-48g4x2xl.dts   |  2 +-
 .../boot/dts/marvell/armada-385-atl-x530.dts  |  2 +-
 .../dts/marvell/armada-385-clearfog-gtr.dtsi  |  4 +--
 .../dts/marvell/armada-385-db-88f6820-amc.dts |  2 +-
 .../arm/boot/dts/marvell/armada-385-db-ap.dts |  4 +--
 .../dts/marvell/armada-385-linksys-rango.dts  |  2 +-
 .../boot/dts/marvell/armada-385-linksys.dtsi  |  4 +--
 .../dts/marvell/armada-385-synology-ds116.dts |  8 +++---
 .../dts/marvell/armada-385-turris-omnia.dts   |  2 +-
 arch/arm/boot/dts/marvell/armada-388-db.dts   |  2 +-
 arch/arm/boot/dts/marvell/armada-388-gp.dts   | 16 ++++++------
 .../boot/dts/marvell/armada-388-helios4.dts   |  4 +--
 arch/arm/boot/dts/marvell/armada-388-rd.dts   |  2 +-
 .../marvell/armada-38x-solidrun-microsom.dtsi |  2 +-
 arch/arm/boot/dts/marvell/armada-390-db.dts   |  2 +-
 arch/arm/boot/dts/marvell/armada-395-gp.dts   |  2 +-
 arch/arm/boot/dts/marvell/armada-398-db.dts   |  2 +-
 .../dts/marvell/armada-xp-crs305-1g-4s.dtsi   |  2 +-
 .../dts/marvell/armada-xp-crs326-24g-2s.dtsi  |  2 +-
 .../marvell/armada-xp-crs328-4c-20s-4s.dtsi   |  2 +-
 .../boot/dts/marvell/armada-xp-db-dxbc2.dts   |  2 +-
 .../dts/marvell/armada-xp-db-xc3-24g4xg.dts   |  2 +-
 .../dts/marvell/armada-xp-synology-ds414.dts  |  8 +++---
 arch/arm/boot/dts/marvell/dove-cm-a510.dtsi   |  4 +--
 arch/arm/boot/dts/marvell/dove-cubox.dts      |  4 +--
 arch/arm/boot/dts/marvell/dove-d2plug.dts     |  2 +-
 arch/arm/boot/dts/marvell/dove-d3plug.dts     |  4 +--
 arch/arm/boot/dts/marvell/dove-dove-db.dts    |  2 +-
 arch/arm/boot/dts/marvell/dove-sbc-a510.dts   |  4 +--
 .../boot/dts/marvell/kirkwood-4i-edge-200.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-b3.dts     |  2 +-
 .../marvell/kirkwood-blackarmor-nas220.dts    |  6 ++---
 .../boot/dts/marvell/kirkwood-cloudbox.dts    |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-d2net.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-db.dtsi    |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-dir665.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-dns320.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-dns325.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-dnskw.dtsi |  4 +--
 .../boot/dts/marvell/kirkwood-dockstar.dts    |  4 +--
 .../boot/dts/marvell/kirkwood-dreamplug.dts   |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds109.dts  |  2 +-
 .../boot/dts/marvell/kirkwood-ds110jv10.dts   |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds111.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds112.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds209.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds210.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds212j.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds409.dts  |  2 +-
 .../boot/dts/marvell/kirkwood-ds409slim.dts   |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds411.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds411j.dts |  2 +-
 .../boot/dts/marvell/kirkwood-ds411slim.dts   |  2 +-
 .../boot/dts/marvell/kirkwood-goflexnet.dts   |  4 +--
 .../marvell/kirkwood-guruplug-server-plus.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ib62x0.dts |  2 +-
 .../boot/dts/marvell/kirkwood-iconnect.dts    |  2 +-
 .../dts/marvell/kirkwood-iomega_ix2_200.dts   |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-is2.dts    |  2 +-
 .../boot/dts/marvell/kirkwood-km_fixedeth.dts |  2 +-
 .../boot/dts/marvell/kirkwood-km_kirkwood.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-l-50.dts   | 10 +++----
 arch/arm/boot/dts/marvell/kirkwood-laplug.dts |  8 +++---
 .../marvell/kirkwood-linkstation-6282.dtsi    |  4 +--
 .../kirkwood-linkstation-duo-6281.dtsi        |  6 ++---
 .../marvell/kirkwood-linkstation-lsqvl.dts    |  4 +--
 .../dts/marvell/kirkwood-linkstation-lsvl.dts |  2 +-
 .../marvell/kirkwood-linkstation-lswsxl.dts   |  2 +-
 .../marvell/kirkwood-linkstation-lswvl.dts    |  4 +--
 .../marvell/kirkwood-linkstation-lswxl.dts    |  2 +-
 .../dts/marvell/kirkwood-linksys-viper.dts    |  2 +-
 .../arm/boot/dts/marvell/kirkwood-lschlv2.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-lsxhl.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi  |  4 +--
 .../arm/boot/dts/marvell/kirkwood-mplcec4.dts |  2 +-
 .../dts/marvell/kirkwood-mv88f6281gtw-ge.dts  |  2 +-
 .../arm/boot/dts/marvell/kirkwood-nas2big.dts |  4 +--
 .../arm/boot/dts/marvell/kirkwood-net2big.dts |  4 +--
 .../arm/boot/dts/marvell/kirkwood-net5big.dts | 10 +++----
 .../kirkwood-netgear_readynas_duo_v2.dts      |  4 +--
 .../kirkwood-netgear_readynas_nv+_v2.dts      |  4 +--
 .../boot/dts/marvell/kirkwood-netxbig.dtsi    |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2.dts    |  2 +-
 .../arm/boot/dts/marvell/kirkwood-ns2lite.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2max.dts |  2 +-
 .../arm/boot/dts/marvell/kirkwood-ns2mini.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa310.dts |  2 +-
 .../arm/boot/dts/marvell/kirkwood-nsa310a.dts |  2 +-
 .../arm/boot/dts/marvell/kirkwood-nsa310s.dts |  6 ++---
 arch/arm/boot/dts/marvell/kirkwood-nsa320.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa325.dts |  4 +--
 .../dts/marvell/kirkwood-nsa3x0-common.dtsi   |  2 +-
 .../dts/marvell/kirkwood-openblocks_a6.dts    |  2 +-
 .../dts/marvell/kirkwood-openblocks_a7.dts    |  2 +-
 .../arm/boot/dts/marvell/kirkwood-openrd.dtsi |  2 +-
 .../boot/dts/marvell/kirkwood-pogo_e02.dts    |  4 +--
 .../marvell/kirkwood-pogoplug-series-4.dts    |  2 +-
 .../boot/dts/marvell/kirkwood-rd88f6192.dts   |  4 +--
 .../boot/dts/marvell/kirkwood-rd88f6281.dtsi  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-rs212.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-rs409.dts  |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-rs411.dts  |  2 +-
 .../marvell/kirkwood-sheevaplug-common.dtsi   |  4 +--
 .../boot/dts/marvell/kirkwood-synology.dtsi   | 26 +++++++++----------
 arch/arm/boot/dts/marvell/kirkwood-t5325.dts  |  4 +--
 .../arm/boot/dts/marvell/kirkwood-topkick.dts |  4 +--
 arch/arm/boot/dts/marvell/kirkwood-ts219.dtsi |  2 +-
 arch/arm/boot/dts/marvell/mmp2-brownstone.dts |  2 +-
 .../boot/dts/marvell/mmp2-olpc-xo-1-75.dts    |  2 +-
 .../boot/dts/marvell/orion5x-kuroboxpro.dts   |  2 +-
 .../dts/marvell/orion5x-lacie-d2-network.dts  |  6 ++---
 .../orion5x-lacie-ethernet-disk-mini-v2.dts   |  2 +-
 .../dts/marvell/orion5x-linkstation-lschl.dts |  2 +-
 .../dts/marvell/orion5x-linkstation-lsgl.dts  |  2 +-
 .../marvell/orion5x-linkstation-lswtgl.dts    |  2 +-
 arch/arm/boot/dts/marvell/orion5x-lswsgl.dts  |  8 +++---
 .../orion5x-maxtor-shared-storage-2.dts       |  2 +-
 .../dts/marvell/orion5x-netgear-wnr854t.dts   |  2 +-
 .../dts/marvell/orion5x-rd88f5182-nas.dts     |  2 +-
 arch/arm/boot/dts/marvell/pxa168-aspenite.dts |  2 +-
 arch/arm/boot/dts/marvell/pxa910-dkb.dts      |  2 +-
 arch/arm/boot/dts/mediatek/mt2701-evb.dts     |  4 +--
 arch/arm/boot/dts/mediatek/mt6580-evbp1.dts   |  2 +-
 .../mediatek/mt6582-prestigio-pmt5008-3g.dts  |  2 +-
 .../arm/boot/dts/mediatek/mt6589-aquaris5.dts |  2 +-
 arch/arm/boot/dts/mediatek/mt6592-evb.dts     |  2 +-
 arch/arm/boot/dts/mediatek/mt8127-moose.dts   |  2 +-
 arch/arm/boot/dts/mediatek/mt8135-evbp1.dts   |  2 +-
 .../boot/dts/microchip/at91-kizbox3-hs.dts    | 22 ++++++++--------
 arch/arm/boot/dts/microchip/at91-lmu5000.dts  |  2 +-
 arch/arm/boot/dts/microchip/at91-q5xr5.dts    |  2 +-
 .../boot/dts/microchip/at91-sama5d3_eds.dts   |  2 +-
 .../microchip/at91-sama5d3_ksz9477_evb.dts    |  2 +-
 .../dts/microchip/at91-sama5d3_xplained.dts   |  2 +-
 .../dts/microchip/at91-sama5d4_ma5d4.dtsi     |  2 +-
 .../dts/microchip/at91-sama5d4_ma5d4evk.dts   |  2 +-
 .../dts/microchip/at91-sama5d4_xplained.dts   |  2 +-
 arch/arm/boot/dts/moxa/moxart-uc7112lx.dts    |  2 +-
 arch/arm/boot/dts/nspire/nspire-classic.dtsi  |  2 +-
 arch/arm/boot/dts/nspire/nspire-cx.dts        |  2 +-
 .../boot/dts/nuvoton/nuvoton-npcm730-gbs.dts  |  2 +-
 .../boot/dts/nuvoton/nuvoton-npcm730-gsj.dts  |  2 +-
 .../boot/dts/nuvoton/nuvoton-npcm730-kudo.dts |  2 +-
 .../boot/dts/nuvoton/nuvoton-npcm750-evb.dts  |  2 +-
 .../nuvoton-npcm750-runbmc-olympus.dts        |  2 +-
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 20 +++++++-------
 arch/arm/boot/dts/nvidia/tegra114-dalmore.dts | 10 +++----
 arch/arm/boot/dts/nvidia/tegra114-roth.dts    | 10 +++----
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  4 +--
 .../boot/dts/nvidia/tegra124-apalis-eval.dts  |  4 +--
 .../dts/nvidia/tegra124-apalis-v1.2-eval.dts  |  4 +--
 .../boot/dts/nvidia/tegra124-apalis-v1.2.dtsi |  4 +--
 arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi |  4 +--
 .../boot/dts/nvidia/tegra124-jetson-tk1.dts   | 16 ++++++------
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   | 20 +++++++-------
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts | 18 ++++++-------
 .../dts/nvidia/tegra20-acer-a500-picasso.dts  |  2 +-
 .../boot/dts/nvidia/tegra20-asus-tf101.dts    |  6 ++---
 .../dts/nvidia/tegra20-colibri-eval-v3.dts    |  2 +-
 .../boot/dts/nvidia/tegra20-colibri-iris.dts  |  2 +-
 arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi |  2 +-
 arch/arm/boot/dts/nvidia/tegra20-harmony.dts  | 12 ++++-----
 arch/arm/boot/dts/nvidia/tegra20-paz00.dts    |  2 +-
 arch/arm/boot/dts/nvidia/tegra20-seaboard.dts | 12 ++++-----
 .../arm/boot/dts/nvidia/tegra20-tamonten.dtsi |  2 +-
 .../arm/boot/dts/nvidia/tegra20-trimslice.dts |  2 +-
 arch/arm/boot/dts/nvidia/tegra20-ventana.dts  |  8 +++---
 .../boot/dts/nvidia/tegra30-apalis-eval.dts   |  4 +--
 .../dts/nvidia/tegra30-apalis-v1.1-eval.dts   |  4 +--
 .../boot/dts/nvidia/tegra30-apalis-v1.1.dtsi  |  4 +--
 arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi  |  4 +--
 .../tegra30-asus-nexus7-grouper-common.dtsi   |  2 +-
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  4 +--
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |  2 +-
 .../boot/dts/nvidia/tegra30-asus-tf700t.dts   |  2 +-
 .../tegra30-asus-transformer-common.dtsi      | 16 ++++++------
 arch/arm/boot/dts/nvidia/tegra30-beaver.dts   | 14 +++++-----
 .../boot/dts/nvidia/tegra30-cardhu-a02.dts    | 12 ++++-----
 .../boot/dts/nvidia/tegra30-cardhu-a04.dts    | 14 +++++-----
 arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi  | 24 ++++++++---------
 .../dts/nvidia/tegra30-colibri-eval-v3.dts    |  2 +-
 arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi |  6 ++---
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts  |  2 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi   | 18 ++++++-------
 arch/arm/boot/dts/nvidia/tegra30-ouya.dts     | 16 ++++++------
 .../dts/nvidia/tegra30-pegatron-chagall.dts   | 12 ++++-----
 arch/arm/boot/dts/nxp/imx/e60k02.dtsi         |  2 +-
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi         |  2 +-
 ...25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts |  2 +-
 arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts |  2 +-
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts       |  4 +--
 .../imx/imx27-eukrea-mbimxsd27-baseboard.dts  |  2 +-
 .../dts/nxp/imx/imx27-phytec-phycore-rdk.dts  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts   |  2 +-
 .../imx/imx51-eukrea-mbimxsd51-baseboard.dts  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts    |  2 +-
 .../boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts  |  2 +-
 .../boot/dts/nxp/imx/imx51-zii-scu3-esb.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts    |  4 +--
 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx53-mba53.dts     |  2 +-
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts       |  6 ++---
 .../boot/dts/nxp/imx/imx53-qsb-common.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts  |  4 +--
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts |  4 +--
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts |  4 +--
 arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi     |  6 ++---
 .../dts/nxp/imx/imx53-voipac-dmm-668.dtsi     |  2 +-
 .../dts/nxp/imx/imx6-logicpd-baseboard.dtsi   | 20 +++++++-------
 .../boot/dts/nxp/imx/imx6-logicpd-som.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts   |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi |  8 +++---
 .../dts/nxp/imx/imx6dl-colibri-iris-v2.dts    |  2 +-
 .../dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts    | 18 ++++++-------
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts   |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts   |  2 +-
 .../arm/boot/dts/nxp/imx/imx6dl-riotboard.dts |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-sielaff.dts  |  4 +--
 .../boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi |  6 ++---
 .../dts/nxp/imx/imx6dl-yapp43-common.dtsi     |  4 +--
 .../dts/nxp/imx/imx6q-apalis-eval-v1.2.dts    |  8 +++---
 .../boot/dts/nxp/imx/imx6q-apalis-eval.dts    |  2 +-
 .../dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts   |  6 ++---
 arch/arm/boot/dts/nxp/imx/imx6q-arm2.dts      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi     |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi   |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts    |  6 ++---
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi |  4 +--
 .../boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts    |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-evi.dts       |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts      |  6 ++---
 arch/arm/boot/dts/nxp/imx/imx6q-kp.dtsi       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts   |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6q-marsboard.dts |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts    | 10 +++----
 arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts    |  2 +-
 .../dts/nxp/imx/imx6q-var-dt6customboard.dts  |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi |  6 ++---
 .../dts/nxp/imx/imx6qdl-aristainetos.dtsi     |  4 +--
 .../dts/nxp/imx/imx6qdl-aristainetos2.dtsi    |  4 +--
 .../arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi |  2 +-
 .../arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi |  4 +--
 .../dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi    |  2 +-
 .../boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi   |  6 ++---
 .../boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi  |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi |  6 ++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi |  2 +-
 .../dts/nxp/imx/imx6qdl-hummingboard.dtsi     |  6 ++---
 .../dts/nxp/imx/imx6qdl-hummingboard2.dtsi    | 10 +++----
 .../boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi   |  2 +-
 .../dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi   |  6 ++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi   |  2 +-
 .../boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   |  4 +--
 .../dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |  8 +++---
 .../dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi   |  8 +++---
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  |  8 +++---
 .../imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi  |  2 +-
 .../boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 10 +++----
 .../dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi    |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi   |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-prti6q.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi    |  4 +--
 .../boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   |  8 +++---
 .../boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   |  6 ++---
 .../arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi | 10 +++----
 .../boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  6 ++---
 .../boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi |  8 +++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi    | 12 ++++-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi   |  2 +-
 .../boot/dts/nxp/imx/imx6qdl-var-dart.dtsi    |  2 +-
 .../arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-vicut1.dtsi |  2 +-
 .../dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi  |  2 +-
 .../boot/dts/nxp/imx/imx6qdl-wandboard.dtsi   |  2 +-
 .../boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts      |  6 ++---
 .../boot/dts/nxp/imx/imx6sl-kobo-aura2.dts    |  2 +-
 .../dts/nxp/imx/imx6sl-tolino-shine2hd.dts    |  4 +--
 .../boot/dts/nxp/imx/imx6sl-tolino-vision.dts |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts     | 10 +++----
 .../boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts   |  8 +++---
 .../arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts |  8 +++---
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dts |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dts      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi     | 14 +++++-----
 .../nxp/imx/imx6sx-softing-vining-2000.dts    |  2 +-
 .../arm/boot/dts/nxp/imx/imx6sx-udoo-neo.dtsi |  8 +++---
 .../boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |  4 +--
 .../dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dts     |  2 +-
 .../nxp/imx/imx6ul-imx6ull-opos6uldev.dtsi    |  4 +--
 .../dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |  2 +-
 .../arm/boot/dts/nxp/imx/imx6ul-liteboard.dts |  2 +-
 .../imx/imx6ul-phytec-segin-peb-av-02.dtsi    |  2 +-
 .../imx/imx6ul-phytec-segin-peb-wlbt-05.dtsi  |  2 +-
 .../boot/dts/nxp/imx/imx6ul-phytec-segin.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico.dtsi    |  6 ++---
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi   | 10 +++----
 .../dts/nxp/imx/imx6ull-colibri-aster.dtsi    |  2 +-
 .../dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi  |  2 +-
 .../dts/nxp/imx/imx6ull-colibri-iris-v2.dtsi  |  2 +-
 .../dts/nxp/imx/imx6ull-colibri-iris.dtsi     |  2 +-
 .../boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-jozacp.dts  |  2 +-
 .../dts/nxp/imx/imx6ull-phytec-tauri.dtsi     |  6 ++---
 .../dts/nxp/imx/imx6ull-tarragon-master.dts   |  2 +-
 .../dts/nxp/imx/imx6ull-tarragon-slavext.dts  |  2 +-
 .../dts/nxp/imx/imx7-colibri-iris-v2.dtsi     |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi      | 16 ++++++------
 .../boot/dts/nxp/imx/imx7d-cl-som-imx7.dts    |  2 +-
 .../dts/nxp/imx/imx7d-flex-concentrator.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts |  4 +--
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts |  8 +++---
 arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi     |  6 ++---
 .../boot/dts/nxp/imx/imx7d-remarkable2.dts    |  6 ++---
 arch/arm/boot/dts/nxp/imx/imx7d-sdb-reva.dts  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts       | 14 +++++-----
 arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dts   | 10 +++----
 arch/arm/boot/dts/nxp/imx/imx7d-zii-rpu2.dts  |  4 +--
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts      |  4 +--
 arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts     |  4 +--
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi        |  6 ++---
 arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts |  6 ++---
 arch/arm/boot/dts/nxp/mxs/imx23-evk.dts       |  4 +--
 arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts     |  8 +++---
 .../boot/dts/nxp/mxs/imx23-stmp378x_devb.dts  |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts      |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts  |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts  |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts  |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts  |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts  |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts  |  2 +-
 .../dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi    |  6 ++---
 arch/arm/boot/dts/nxp/mxs/imx28-evk.dts       | 12 ++++-----
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts    |  6 ++---
 arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts    |  6 ++---
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts      |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-ts4600.dts    |  2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts      | 10 +++----
 arch/arm/boot/dts/nxp/mxs/imx28-xea.dts       |  4 +--
 .../boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev.dtsi   |  2 +-
 .../boot/dts/qcom/msm8226-motorola-falcon.dts |  2 +-
 .../dts/qcom/qcom-apq8026-asus-sparrow.dts    |  2 +-
 .../dts/qcom/qcom-apq8026-huawei-sturgeon.dts |  2 +-
 .../boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  2 +-
 .../qcom-apq8026-samsung-matisse-wifi.dts     |  2 +-
 .../qcom/qcom-apq8026-samsung-milletwifi.dts  |  6 ++---
 .../dts/qcom/qcom-apq8060-dragonboard.dts     |  2 +-
 .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |  2 +-
 .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |  2 +-
 .../dts/qcom/qcom-apq8074-dragonboard.dts     |  2 +-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi      |  2 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi |  2 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi |  2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi      |  2 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi      |  2 +-
 .../qcom-msm8226-samsung-matisse-common.dtsi  |  2 +-
 .../dts/qcom/qcom-msm8226-samsung-ms013g.dts  |  4 +--
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi      |  2 +-
 .../qcom/qcom-msm8926-motorola-peregrine.dts  |  2 +-
 .../qcom/qcom-msm8926-samsung-matisselte.dts  |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts   |  2 +-
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |  4 +--
 .../dts/qcom/qcom-msm8974-samsung-hlte.dts    |  2 +-
 .../qcom/qcom-msm8974-sony-xperia-rhine.dtsi  |  2 +-
 .../qcom/qcom-msm8974pro-fairphone-fp2.dts    |  2 +-
 .../boot/dts/qcom/qcom-msm8974pro-htc-m8.dts  |  2 +-
 .../qcom/qcom-msm8974pro-oneplus-bacon.dts    |  2 +-
 .../qcom-msm8974pro-samsung-klte-common.dtsi  |  4 +--
 ...-msm8974pro-sony-xperia-shinano-castor.dts |  2 +-
 ...msm8974pro-sony-xperia-shinano-common.dtsi |  6 ++---
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi        |  2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi        |  2 +-
 .../boot/dts/renesas/iwg20d-q7-common.dtsi    |  4 +--
 arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts |  2 +-
 .../dts/renesas/r8a7740-armadillo800eva.dts   |  2 +-
 .../boot/dts/renesas/r8a7742-iwg21d-q7.dts    |  4 +--
 .../dts/renesas/r8a7745-iwg22d-sodimm.dts     |  2 +-
 arch/arm/boot/dts/renesas/r8a7790-lager.dts   |  4 +--
 arch/arm/boot/dts/renesas/r8a7790-stout.dts   |  2 +-
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts |  6 ++---
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts |  2 +-
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts   |  2 +-
 arch/arm/boot/dts/renesas/r8a7793-gose.dts    |  6 ++---
 arch/arm/boot/dts/renesas/r8a7794-alt.dts     |  4 +--
 arch/arm/boot/dts/renesas/r8a7794-silk.dts    |  2 +-
 arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts    |  4 +--
 .../boot/dts/rockchip/rk3066a-bqcurie2.dts    |  2 +-
 .../boot/dts/rockchip/rk3066a-marsboard.dts   |  2 +-
 arch/arm/boot/dts/rockchip/rk3066a-mk808.dts  |  8 +++---
 .../boot/dts/rockchip/rk3066a-rayeager.dts    |  8 +++---
 arch/arm/boot/dts/rockchip/rk3128-evb.dts     |  4 +--
 .../arm/boot/dts/rockchip/rk3128-xpi-3128.dts |  4 +--
 .../boot/dts/rockchip/rk3188-bqedison2qc.dts  | 10 +++----
 .../boot/dts/rockchip/rk3188-radxarock.dts    |  6 ++---
 arch/arm/boot/dts/rockchip/rk3229-evb.dts     |  2 +-
 arch/arm/boot/dts/rockchip/rk3229-xms6.dts    |  2 +-
 .../boot/dts/rockchip/rk3288-evb-act8846.dts  |  4 +--
 arch/arm/boot/dts/rockchip/rk3288-evb.dtsi    |  6 ++---
 .../dts/rockchip/rk3288-firefly-reload.dts    | 14 +++++-----
 .../arm/boot/dts/rockchip/rk3288-firefly.dtsi |  8 +++---
 arch/arm/boot/dts/rockchip/rk3288-miqi.dts    |  4 +--
 .../boot/dts/rockchip/rk3288-phycore-rdk.dts  |  6 ++---
 .../boot/dts/rockchip/rk3288-phycore-som.dtsi |  2 +-
 .../arm/boot/dts/rockchip/rk3288-popmetal.dts |  4 +--
 arch/arm/boot/dts/rockchip/rk3288-r89.dts     |  6 ++---
 .../boot/dts/rockchip/rk3288-rock2-square.dts |  6 ++---
 arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi |  4 +--
 .../boot/dts/rockchip/rk3288-veyron-brain.dts |  4 +--
 .../rockchip/rk3288-veyron-chromebook.dtsi    |  4 +--
 .../boot/dts/rockchip/rk3288-veyron-edp.dtsi  |  6 ++---
 .../dts/rockchip/rk3288-veyron-fievel.dts     | 10 +++----
 .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  4 +--
 .../boot/dts/rockchip/rk3288-veyron-jerry.dts |  4 +--
 .../dts/rockchip/rk3288-veyron-mickey.dts     |  2 +-
 .../dts/rockchip/rk3288-veyron-minnie.dts     |  4 +--
 .../dts/rockchip/rk3288-veyron-speedy.dts     |  4 +--
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi |  2 +-
 .../boot/dts/rockchip/rk3288-vmarc-som.dtsi   |  4 +--
 arch/arm/boot/dts/rockchip/rk3288-vyasa.dts   |  8 +++---
 .../dts/rockchip/rv1126-edgeble-neu2.dtsi     |  2 +-
 arch/arm/boot/dts/samsung/exynos3250-monk.dts |  2 +-
 .../arm/boot/dts/samsung/exynos4210-i9100.dts | 12 ++++-----
 .../boot/dts/samsung/exynos4210-origen.dts    |  2 +-
 .../arm/boot/dts/samsung/exynos4210-trats.dts | 12 ++++-----
 .../dts/samsung/exynos4210-universal_c210.dts |  6 ++---
 .../arm/boot/dts/samsung/exynos4212-tab3.dtsi |  4 +--
 .../dts/samsung/exynos4412-galaxy-s3.dtsi     | 12 ++++-----
 .../boot/dts/samsung/exynos4412-midas.dtsi    |  8 +++---
 .../arm/boot/dts/samsung/exynos4412-n710x.dts |  8 +++---
 .../boot/dts/samsung/exynos4412-odroidu3.dts  |  2 +-
 .../boot/dts/samsung/exynos4412-odroidx.dts   |  2 +-
 .../boot/dts/samsung/exynos4412-origen.dts    |  2 +-
 .../dts/samsung/exynos5250-snow-common.dtsi   |  2 +-
 .../boot/dts/samsung/exynos5420-peach-pit.dts |  4 +--
 .../boot/dts/samsung/exynos5420-smdk5420.dts  |  4 +--
 .../dts/samsung/exynos5422-samsung-k3g.dts    |  2 +-
 .../boot/dts/samsung/exynos5800-peach-pi.dts  |  4 +--
 arch/arm/boot/dts/samsung/s5pv210-aquila.dts  |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi  |  6 ++---
 .../boot/dts/samsung/s5pv210-fascinate4g.dts  |  4 +--
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-goni.dts    |  4 +--
 .../sigmastar/mstar-infinity2m-ssd202d.dtsi   |  2 +-
 arch/arm/boot/dts/st/spear1310-evb.dts        |  2 +-
 arch/arm/boot/dts/st/spear1340-evb.dts        |  2 +-
 arch/arm/boot/dts/st/spear13xx.dtsi           |  2 +-
 arch/arm/boot/dts/st/spear300-evb.dts         |  2 +-
 arch/arm/boot/dts/st/spear310-evb.dts         |  2 +-
 arch/arm/boot/dts/st/spear320-evb.dts         |  2 +-
 arch/arm/boot/dts/st/spear320-hmi.dts         |  2 +-
 arch/arm/boot/dts/st/spear3xx.dtsi            |  2 +-
 arch/arm/boot/dts/st/spear600-evb.dts         |  2 +-
 arch/arm/boot/dts/st/spear600.dtsi            |  2 +-
 arch/arm/boot/dts/st/ste-href.dtsi            |  2 +-
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi |  2 +-
 arch/arm/boot/dts/st/ste-snowball.dts         |  4 +--
 .../dts/st/ste-ux500-samsung-codina-tmo.dts   |  4 +--
 .../boot/dts/st/ste-ux500-samsung-codina.dts  | 10 +++----
 .../boot/dts/st/ste-ux500-samsung-gavini.dts  | 12 ++++-----
 .../boot/dts/st/ste-ux500-samsung-golden.dts  |  8 +++---
 .../boot/dts/st/ste-ux500-samsung-janice.dts  | 16 ++++++------
 .../boot/dts/st/ste-ux500-samsung-kyle.dts    |  8 +++---
 .../boot/dts/st/ste-ux500-samsung-skomer.dts  |  4 +--
 arch/arm/boot/dts/st/stm32f429-disco.dts      |  2 +-
 arch/arm/boot/dts/st/stm32f469-disco.dts      |  2 +-
 arch/arm/boot/dts/st/stm32f746-disco.dts      |  2 +-
 arch/arm/boot/dts/st/stm32mp151a-prtt1c.dts   |  4 +--
 ...157a-microgea-stm32mp1-microdev2.0-of7.dts |  4 +--
 .../boot/dts/st/stm32mp157c-lxa-tac-gen1.dts  |  2 +-
 .../boot/dts/st/stm32mp157c-lxa-tac-gen2.dts  |  2 +-
 .../boot/dts/st/stm32mp15xx-dhcom-som.dtsi    |  2 +-
 .../dts/st/stm32mp15xx-dhcor-avenger96.dtsi   |  2 +-
 .../dts/st/stm32mp15xx-dhcor-drc-compact.dtsi |  2 +-
 .../dts/synaptics/berlin2q-marvell-dmp.dts    |  8 +++---
 arch/arm/boot/dts/ti/davinci/da850-evm.dts    |  2 +-
 .../boot/dts/ti/davinci/da850-lego-ev3.dts    |  4 +--
 .../boot/dts/ti/keystone/keystone-k2g-ice.dts |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi  |  2 +-
 .../dts/ti/omap/am335x-boneblack-wireless.dts |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts |  2 +-
 .../dts/ti/omap/am335x-bonegreen-wireless.dts |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts  |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-evm.dts      |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-evmsk.dts    |  4 +--
 arch/arm/boot/dts/ti/omap/am335x-icev2.dts    |  2 +-
 .../dts/ti/omap/am335x-moxa-uc-8100-me-t.dts  |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts   |  2 +-
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi     |  4 +--
 arch/arm/boot/dts/ti/omap/am437x-gp-evm.dts   |  4 +--
 arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts   |  2 +-
 .../dts/ti/omap/am57xx-beagle-x15-common.dtsi |  2 +-
 arch/arm/boot/dts/ti/omap/dm8148-t410.dts     |  2 +-
 arch/arm/boot/dts/ti/omap/dra7-evm.dts        |  6 ++---
 arch/arm/boot/dts/ti/omap/dra71-evm.dts       |  2 +-
 .../boot/dts/ti/omap/dra72-evm-common.dtsi    |  4 +--
 arch/arm/boot/dts/ti/omap/dra76-evm.dts       |  4 +--
 arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi |  2 +-
 .../ti/omap/logicpd-torpedo-37xx-devkit.dts   |  2 +-
 .../dts/ti/omap/motorola-mapphone-common.dtsi |  6 ++---
 .../dts/ti/omap/motorola-mapphone-xt8xx.dtsi  |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-beagle.dts    |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dts  |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts  |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dts  |  2 +-
 .../boot/dts/ti/omap/omap3-evm-common.dtsi    |  6 ++---
 arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts   |  2 +-
 .../dts/ti/omap/omap3-igep0020-common.dtsi    |  2 +-
 .../boot/dts/ti/omap/omap3-igep0020-rev-f.dts |  2 +-
 .../boot/dts/ti/omap/omap3-igep0030-rev-g.dts |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-n950-n9.dtsi  |  4 +--
 .../boot/dts/ti/omap/omap3-overo-base.dtsi    |  6 ++---
 .../dts/ti/omap/omap3-pandora-common.dtsi     |  6 ++---
 arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi   |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-tao3530.dtsi  |  4 +--
 arch/arm/boot/dts/ti/omap/omap3-zoom3.dts     |  2 +-
 arch/arm/boot/dts/ti/omap/omap4-duovero.dtsi  |  2 +-
 .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  |  2 +-
 .../boot/dts/ti/omap/omap4-panda-common.dtsi  |  4 +--
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts       |  4 +--
 .../dts/ti/omap/omap4-var-som-om44-wlan.dtsi  |  2 +-
 .../boot/dts/ti/omap/omap5-board-common.dtsi  |  2 +-
 arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts    |  4 +--
 arch/arm/boot/dts/vt8500/vt8500.dtsi          |  2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi          |  2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi          |  2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi          |  2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi          |  2 +-
 662 files changed, 1283 insertions(+), 1283 deletions(-)

-- 
2.46.2

