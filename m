Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5D98B02D
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 00:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbjr38l7z3c71
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 08:44:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727735767;
	cv=none; b=Zh+mxNslqEb/zACN/IultExYZfzbGkLVWzaaJIvck2pIWvb75alhyFGHd5h2hUwdeygBD3dIQKru1ToLnAO+i5CPxymYe4G/5IJYUqXOwaY8iQv88le7TDq21UoNwTT7ISILws848wXXR3XojNHB0qIpsaXhAgT0rK16qAlDSfJrVjqMvQhsyKyU1fdOR4MNFOC2XdwlMTGWPFwJ0I+cxckyI4jxBNWnrkBF0Y8ZZyRR7uljM7Gk+vvGObYXC04WDkC8fisw8T9TEk2Vh8UKsgZmjyzCWO1HOhELqF+ut8fF7m/yW4pdkLsNzSNZLHGtHZKT43BBiDpXi9mfV5x7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727735767; c=relaxed/relaxed;
	bh=BqdI4W4uh9+d5LkFepC6MZxxQiXa8tHBpbUd/r4IbVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASWaT7fK+x9/VCD+scZhH3gcMwfdgAqwkLhkA/ivnzStIwAWDBXB1Y+GZvcmw66EMBYIxBzCCSCiZu5Vr/3Mcx82xyjI+jqCMFrDv76Y+15KRSldYkFblyzpdA/zUQuov/p6hSKI2yszWomMWlHhpclidz4SraVjTsZB7+jHnCbILxdsvX+PSbWfHWnOfsg3tO2QUyI0FNkvQX7bwvEu1cMgxxg/okjIfRY2ZTWgik/p4xN8iQyQSrqU1mB4EQPWvDG59iQ8QKidF4c5bOr68Hh+FmRMX1zpa+GRb5r2hREy3efMXatxts85SGCN1Cl5kb79loyucOXNBizQnnGLTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HZVu2bWY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HZVu2bWY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHbWp18vyz2xk7;
	Tue,  1 Oct 2024 08:36:06 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so4103842b3a.1;
        Mon, 30 Sep 2024 15:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727735763; x=1728340563; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqdI4W4uh9+d5LkFepC6MZxxQiXa8tHBpbUd/r4IbVc=;
        b=HZVu2bWYFRh51WOxKq0ACf+1dnY65E3wIDBy0JhHMzQsBrNLvPFBu5CJEmp9Rdb0H7
         k9JmHzheVL4MSQo5Rob6lKPs+LpEuOOSke/vczuVoZHqWOllzG1TyM1GkgeiGhwq56si
         ZLLJgj8G+b/wu2TQJAt2Yv6K2wW1XqkiR8iRzHuu/GvzVRNWqmzrwCOn6hpk4Lu44Qa+
         FoGJctG+L4rSG9Lw/NFjOuJexzVeKBvq/dgejSZj/BsY24swho0ue4tn2QgOkR0vCpEU
         Ieqlbjq7m6SfuSqLE3SLwsY4tjSgmUSKPRF/Cn3Dz4/Nh+uzuJEC7EK0auXZwG1tv+hc
         MsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727735763; x=1728340563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqdI4W4uh9+d5LkFepC6MZxxQiXa8tHBpbUd/r4IbVc=;
        b=FMMq2wEcS84Azw4cYNJl4wx4zwhPpOdPAubTKzZNTyHNdBMmaplLWhr84n0xVOKkip
         itSewaN+WCWjdKpza2u8p4bmNUQ9fhjFcX+I4+xtsZh59gEc7MDIZE9h7UsNTXULozqa
         kP/HQDgEWSECnSVwAXlh5BYZLX6GUvPxBjJkdGe7XsZOFk5djl7CaCdWqsXBhDYftTw/
         Eehks1uXcNa7DcWUeW4jAsLd8ACaFRzHk+us9DOvAj3UVnDduzAW3403s26m92NvPKml
         7fkejgJwfn58lv7A9ZGaWdOwk2tTM5lariAFF44KZ/j1Kv7Xc0MQnNW8j24chIgkuLMQ
         KaQA==
X-Forwarded-Encrypted: i=1; AJvYcCUB67KY6UXNtuuRkuaw1ia+Z3Z8GdZg/WA4tHX3522wueeFCcaJjzS+mXJxC6mu3rCNnplumVSkHQ==@lists.ozlabs.org, AJvYcCUDf2hvhB8uf/OeJyuxSP+G9fh4NvIGnUfba3P0pfdd5eCuSmr95DmdHEuabKJAOlJ6VStDcaCEe62NHIM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyiMKc6oyD3VuAiOjG2hV5ngZUgSR4MfebMqon6dqskSE4Ogyil
	0Jj0vtpM0FQJW1Xlkme3uMNJmlfPbOQW77U7hO43qN4isMchw8Y2
X-Google-Smtp-Source: AGHT+IF/YpTQo6qikp5YZUq6+i7lNDsnk1J1q6TlODvolRlRzKk8JfDP2IjvJxo/zYbcaSpM09QPIA==
X-Received: by 2002:a05:6a21:680d:b0:1cf:4ed:ffc0 with SMTP id adf61e73a8af0-1d52d0c3a45mr1341405637.4.1727735762459;
        Mon, 30 Sep 2024 15:36:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26524a8dsm7005158b3a.146.2024.09.30.15.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 15:36:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: dts: replace gpio = with gpios =
Date: Mon, 30 Sep 2024 15:35:49 -0700
Message-ID: <20240930223550.353882-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930223550.353882-1-rosenp@gmail.com>
References: <20240930223550.353882-1-rosenp@gmail.com>
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

Found with dtc:

Warning (deprecated_gpio_property): '[*-]gpio' is deprecated, use
'[*-]gpios' instead

Transformation performed with

find -name "*.dts" -exec sed -i 's/\tgpio = </\tgpios = </g' '{}' \
find -name "*.dtsi" -exec sed -i 's/\tgpio = </\tgpios = </g' '{}' \

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts   |  4 +--
 .../arm/boot/dts/amlogic/meson8b-odroidc1.dts |  2 +-
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 12 ++++-----
 .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |  4 +--
 .../boot/dts/broadcom/bcm2711-rpi-cm4.dtsi    |  2 +-
 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts   |  4 +--
 .../boot/dts/gemini/gemini-dlink-dir-685.dts  |  2 +-
 .../dts/intel/pxa/pxa300-raumfeld-common.dtsi |  2 +-
 .../intel/pxa/pxa300-raumfeld-controller.dts  |  2 +-
 .../socfpga/socfpga_cyclone5_vining_fpga.dts  |  2 +-
 .../dts/marvell/armada-370-dlink-dns327l.dts  |  6 ++---
 .../marvell/armada-370-seagate-nas-4bay.dts   |  4 +--
 .../marvell/armada-370-seagate-nas-xbay.dtsi  |  4 +--
 ...armada-370-seagate-personal-cloud-2bay.dts |  2 +-
 .../armada-370-seagate-personal-cloud.dtsi    |  4 +--
 .../marvell/armada-370-synology-ds213j.dts    |  4 +--
 .../dts/marvell/armada-385-clearfog-gtr.dtsi  |  2 +-
 .../arm/boot/dts/marvell/armada-385-db-ap.dts |  2 +-
 .../dts/marvell/armada-385-linksys-rango.dts  |  2 +-
 .../boot/dts/marvell/armada-385-linksys.dtsi  |  2 +-
 .../dts/marvell/armada-385-synology-ds116.dts |  6 ++---
 arch/arm/boot/dts/marvell/armada-388-gp.dts   | 14 +++++-----
 .../boot/dts/marvell/armada-388-helios4.dts   |  2 +-
 .../dts/marvell/armada-xp-synology-ds414.dts  |  8 +++---
 arch/arm/boot/dts/marvell/dove-cm-a510.dtsi   |  2 +-
 arch/arm/boot/dts/marvell/dove-cubox.dts      |  2 +-
 arch/arm/boot/dts/marvell/dove-d3plug.dts     |  2 +-
 arch/arm/boot/dts/marvell/dove-sbc-a510.dts   |  4 +--
 .../marvell/kirkwood-blackarmor-nas220.dts    |  4 +--
 arch/arm/boot/dts/marvell/kirkwood-dnskw.dtsi |  4 +--
 .../boot/dts/marvell/kirkwood-dockstar.dts    |  2 +-
 .../boot/dts/marvell/kirkwood-goflexnet.dts   |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-l-50.dts   |  8 +++---
 arch/arm/boot/dts/marvell/kirkwood-laplug.dts |  6 ++---
 .../marvell/kirkwood-linkstation-6282.dtsi    |  4 +--
 .../kirkwood-linkstation-duo-6281.dtsi        |  6 ++---
 .../marvell/kirkwood-linkstation-lsqvl.dts    |  2 +-
 .../marvell/kirkwood-linkstation-lswvl.dts    |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi  |  4 +--
 .../arm/boot/dts/marvell/kirkwood-nas2big.dts |  2 +-
 .../arm/boot/dts/marvell/kirkwood-net2big.dts |  2 +-
 .../arm/boot/dts/marvell/kirkwood-net5big.dts |  8 +++---
 .../kirkwood-netgear_readynas_duo_v2.dts      |  2 +-
 .../kirkwood-netgear_readynas_nv+_v2.dts      |  2 +-
 .../boot/dts/marvell/kirkwood-netxbig.dtsi    |  2 +-
 .../arm/boot/dts/marvell/kirkwood-nsa310s.dts |  4 +--
 arch/arm/boot/dts/marvell/kirkwood-nsa325.dts |  2 +-
 .../dts/marvell/kirkwood-nsa3x0-common.dtsi   |  2 +-
 .../boot/dts/marvell/kirkwood-pogo_e02.dts    |  2 +-
 .../boot/dts/marvell/kirkwood-rd88f6192.dts   |  2 +-
 .../marvell/kirkwood-sheevaplug-common.dtsi   |  2 +-
 .../boot/dts/marvell/kirkwood-synology.dtsi   | 26 +++++++++----------
 arch/arm/boot/dts/marvell/kirkwood-t5325.dts  |  2 +-
 .../arm/boot/dts/marvell/kirkwood-topkick.dts |  2 +-
 .../boot/dts/marvell/mmp2-olpc-xo-1-75.dts    |  2 +-
 .../dts/marvell/orion5x-lacie-d2-network.dts  |  4 +--
 arch/arm/boot/dts/marvell/orion5x-lswsgl.dts  |  6 ++---
 arch/arm/boot/dts/mediatek/mt2701-evb.dts     |  2 +-
 .../boot/dts/microchip/at91-kizbox3-hs.dts    | 22 ++++++++--------
 .../boot/dts/microchip/at91-sama5d3_eds.dts   |  2 +-
 .../microchip/at91-sama5d3_ksz9477_evb.dts    |  2 +-
 .../dts/microchip/at91-sama5d3_xplained.dts   |  2 +-
 .../dts/microchip/at91-sama5d4_ma5d4.dtsi     |  2 +-
 .../dts/microchip/at91-sama5d4_ma5d4evk.dts   |  2 +-
 .../dts/microchip/at91-sama5d4_xplained.dts   |  2 +-
 arch/arm/boot/dts/nspire/nspire-classic.dtsi  |  2 +-
 arch/arm/boot/dts/nspire/nspire-cx.dts        |  2 +-
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 20 +++++++-------
 arch/arm/boot/dts/nvidia/tegra114-dalmore.dts | 10 +++----
 arch/arm/boot/dts/nvidia/tegra114-roth.dts    | 10 +++----
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     |  4 +--
 .../boot/dts/nvidia/tegra124-apalis-eval.dts  |  4 +--
 .../dts/nvidia/tegra124-apalis-v1.2-eval.dts  |  4 +--
 .../boot/dts/nvidia/tegra124-apalis-v1.2.dtsi |  4 +--
 arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi |  4 +--
 .../boot/dts/nvidia/tegra124-jetson-tk1.dts   | 16 ++++++------
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   | 18 ++++++-------
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
 .../qcom-msm8226-samsung-matisse-common.dtsi  |  2 +-
 .../dts/qcom/qcom-msm8226-samsung-ms013g.dts  |  4 +--
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
 .../arm/boot/dts/rockchip/rk3288-popmetal.dts |  4 +--
 arch/arm/boot/dts/rockchip/rk3288-r89.dts     |  6 ++---
 .../boot/dts/rockchip/rk3288-rock2-square.dts |  6 ++---
 arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi |  2 +-
 .../boot/dts/rockchip/rk3288-veyron-brain.dts |  4 +--
 .../rockchip/rk3288-veyron-chromebook.dtsi    |  4 +--
 .../boot/dts/rockchip/rk3288-veyron-edp.dtsi  |  6 ++---
 .../dts/rockchip/rk3288-veyron-fievel.dts     | 10 +++----
 .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  4 +--
 .../boot/dts/rockchip/rk3288-veyron-jerry.dts |  4 +--
 .../dts/rockchip/rk3288-veyron-mickey.dts     |  2 +-
 .../dts/rockchip/rk3288-veyron-minnie.dts     |  4 +--
 .../dts/rockchip/rk3288-veyron-speedy.dts     |  4 +--
 .../boot/dts/rockchip/rk3288-vmarc-som.dtsi   |  4 +--
 arch/arm/boot/dts/rockchip/rk3288-vyasa.dts   |  6 ++---
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
 arch/arm/boot/dts/st/ste-snowball.dts         |  2 +-
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
 arch/arm/boot/dts/ti/omap/am3517-som.dtsi     |  4 +--
 arch/arm/boot/dts/ti/omap/am437x-gp-evm.dts   |  4 +--
 arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts   |  2 +-
 .../dts/ti/omap/am57xx-beagle-x15-common.dtsi |  2 +-
 arch/arm/boot/dts/ti/omap/dm8148-t410.dts     |  2 +-
 arch/arm/boot/dts/ti/omap/dra7-evm.dts        |  6 ++---
 .../boot/dts/ti/omap/dra72-evm-common.dtsi    |  4 +--
 arch/arm/boot/dts/ti/omap/dra76-evm.dts       |  4 +--
 arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi |  2 +-
 .../ti/omap/logicpd-torpedo-37xx-devkit.dts   |  2 +-
 .../dts/ti/omap/motorola-mapphone-common.dtsi |  4 +--
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
 519 files changed, 1101 insertions(+), 1101 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-a1000.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-a1000.dts
index 20f9ed244851..97281e4c64ae 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-a1000.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-a1000.dts
@@ -93,7 +93,7 @@ reg_emac_3v3: emac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <20000>;
 		enable-active-high;
-		gpio = <&pio 7 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 7 15 GPIO_ACTIVE_HIGH>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-ba10-tvbox.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-ba10-tvbox.dts
index 816d534ac093..f6781253735a 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-ba10-tvbox.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-ba10-tvbox.dts
@@ -128,7 +128,7 @@ &reg_usb1_vbus {
 };
 
 &reg_usb2_vbus {
-	gpio = <&pio 7 12 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 7 12 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
index 63e77c05bfda..fa27484d48ee 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
@@ -82,7 +82,7 @@ reg_motor: reg-motor {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		enable-active-high;
-		gpio = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
+		gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
 	};
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-hackberry.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-hackberry.dts
index 47dea0922501..8ed62cc821e9 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-hackberry.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-hackberry.dts
@@ -67,7 +67,7 @@ reg_emac_3v3: emac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <20000>;
 		enable-active-high;
-		gpio = <&pio 7 19 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 7 19 GPIO_ACTIVE_HIGH>;
 	};
 };
 
@@ -123,7 +123,7 @@ &reg_usb1_vbus {
 };
 
 &reg_usb2_vbus {
-	gpio = <&pio 7 12 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 7 12 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-hyundai-a7hd.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-hyundai-a7hd.dts
index bf2044bac42f..1f654c3cf248 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-hyundai-a7hd.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-hyundai-a7hd.dts
@@ -91,7 +91,7 @@ &reg_usb0_vbus {
 };
 
 &reg_usb2_vbus {
-	gpio = <&pio 7 6 GPIO_ACTIVE_HIGH>; /* PH6 */
+	gpios = <&pio 7 6 GPIO_ACTIVE_HIGH>; /* PH6 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-jesurun-q5.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-jesurun-q5.dts
index 1aeb0bd5519e..3242701bc863 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-jesurun-q5.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-jesurun-q5.dts
@@ -77,7 +77,7 @@ reg_emac_3v3: emac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <20000>;
 		enable-active-high;
-		gpio = <&pio 7 19 GPIO_ACTIVE_HIGH>;   /* PH19 */
+		gpios = <&pio 7 19 GPIO_ACTIVE_HIGH>;   /* PH19 */
 	};
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-mk802.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-mk802.dts
index 059fe9c5d024..7686a30359fb 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-mk802.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-mk802.dts
@@ -119,7 +119,7 @@ &reg_usb1_vbus {
 };
 
 &reg_usb2_vbus {
-	gpio = <&pio 7 12 GPIO_ACTIVE_HIGH>; /* PH12 */
+	gpios = <&pio 7 12 GPIO_ACTIVE_HIGH>; /* PH12 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
index 83d283cf6633..dfbe0e280c70 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-olinuxino-lime.dts
@@ -188,7 +188,7 @@ led_pins_olinuxinolime: led-pin {
 };
 
 &reg_ahci_5v {
-	gpio = <&pio 2 3 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-pcduino2.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-pcduino2.dts
index bc4f128965ed..2d6c346afdcb 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-pcduino2.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-pcduino2.dts
@@ -56,7 +56,7 @@ / {
 };
 
 &reg_usb2_vbus {
-	gpio = <&pio 3 2 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 3 2 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-topwise-a721.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-topwise-a721.dts
index 3628f12d2521..f06f6f2f384d 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-topwise-a721.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-topwise-a721.dts
@@ -48,7 +48,7 @@ panel_input: endpoint {
 	reg_lcd_power: reg-lcd-power {
 		compatible = "regulator-fixed";
 		regulator-name = "reg-lcd-power";
-		gpio = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+		gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a10s-auxtek-t003.dts b/arch/arm/boot/dts/allwinner/sun5i-a10s-auxtek-t003.dts
index 04b0e6d28769..8694ea4583d5 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a10s-auxtek-t003.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a10s-auxtek-t003.dts
@@ -110,12 +110,12 @@ led_pins_t003: led-pin {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
+	gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
 	status = "okay";
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 1 10 GPIO_ACTIVE_HIGH>; /* PB10 */
+	gpios = <&pio 1 10 GPIO_ACTIVE_HIGH>; /* PB10 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a10s-auxtek-t004.dts b/arch/arm/boot/dts/allwinner/sun5i-a10s-auxtek-t004.dts
index 667bc2dc1ea9..ebfbffa0f51a 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a10s-auxtek-t004.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a10s-auxtek-t004.dts
@@ -75,7 +75,7 @@ reg_vmmc1: vmmc1 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&pio 1 18 GPIO_ACTIVE_HIGH>; /* PB18 */
+		gpios = <&pio 1 18 GPIO_ACTIVE_HIGH>; /* PB18 */
 	};
 };
 
@@ -127,7 +127,7 @@ led_pins_t004: led-pin {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
+	gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a10s-mk802.dts b/arch/arm/boot/dts/allwinner/sun5i-a10s-mk802.dts
index d0219404c231..ebbb96f80717 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a10s-mk802.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a10s-mk802.dts
@@ -106,7 +106,7 @@ &otg_sram {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 1 10 GPIO_ACTIVE_HIGH>; /* PB10 */
+	gpios = <&pio 1 10 GPIO_ACTIVE_HIGH>; /* PB10 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a10s-olinuxino-micro.dts b/arch/arm/boot/dts/allwinner/sun5i-a10s-olinuxino-micro.dts
index 5832bb31fc51..6ac858d1c63e 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a10s-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a10s-olinuxino-micro.dts
@@ -221,12 +221,12 @@ led_pins_olinuxino: led-pin {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
+	gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
 	status = "okay";
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 1 10 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 1 10 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a10s-r7-tv-dongle.dts b/arch/arm/boot/dts/allwinner/sun5i-a10s-r7-tv-dongle.dts
index 964360f0610a..398e12f84f1c 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a10s-r7-tv-dongle.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a10s-r7-tv-dongle.dts
@@ -102,7 +102,7 @@ led_pins_r7: led-pin {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 6 13 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a10s-wobo-i5.dts b/arch/arm/boot/dts/allwinner/sun5i-a10s-wobo-i5.dts
index ef8baa992687..ef96fec00030 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a10s-wobo-i5.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a10s-wobo-i5.dts
@@ -76,7 +76,7 @@ reg_emac_3v3: emac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <20000>;
 		enable-active-high;
-		gpio = <&pio 0 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 0 2 GPIO_ACTIVE_HIGH>;
 	};
 };
 
@@ -174,7 +174,7 @@ &reg_ldo4 {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 6 12 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a13-empire-electronix-d709.dts b/arch/arm/boot/dts/allwinner/sun5i-a13-empire-electronix-d709.dts
index d059388d7252..25ff0a6ff2d2 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a13-empire-electronix-d709.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a13-empire-electronix-d709.dts
@@ -166,7 +166,7 @@ &reg_ldo3 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+	gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a13-hsg-h702.dts b/arch/arm/boot/dts/allwinner/sun5i-a13-hsg-h702.dts
index 9b9f2a574851..9a451c76bb01 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a13-hsg-h702.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a13-hsg-h702.dts
@@ -158,7 +158,7 @@ &reg_ldo3 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+	gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a13-licheepi-one.dts b/arch/arm/boot/dts/allwinner/sun5i-a13-licheepi-one.dts
index 3a6c4bd0a44f..29065687b15e 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a13-licheepi-one.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a13-licheepi-one.dts
@@ -190,7 +190,7 @@ &reg_ldo4 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 2 12 GPIO_ACTIVE_HIGH>; /* PC12 */
+	gpios = <&pio 2 12 GPIO_ACTIVE_HIGH>; /* PC12 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a13-olinuxino-micro.dts b/arch/arm/boot/dts/allwinner/sun5i-a13-olinuxino-micro.dts
index bfe1075e62cc..8b888e984b0b 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a13-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a13-olinuxino-micro.dts
@@ -112,12 +112,12 @@ led_pins_olinuxinom: led-pin {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 6 12 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 6 11 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a13-olinuxino.dts b/arch/arm/boot/dts/allwinner/sun5i-a13-olinuxino.dts
index fadeae3cd8bb..c324a3910b3b 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a13-olinuxino.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a13-olinuxino.dts
@@ -206,11 +206,11 @@ led_pins_olinuxino: led-pin {
 
 &reg_usb0_vbus {
 	status = "okay";
-	gpio = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+	gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 6 11 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a13-pocketbook-614-plus.dts b/arch/arm/boot/dts/allwinner/sun5i-a13-pocketbook-614-plus.dts
index ab8d138dc11d..7473f34b4b54 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a13-pocketbook-614-plus.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a13-pocketbook-614-plus.dts
@@ -56,7 +56,7 @@ reg_3v3_mmc0: regulator-mmc0 {
 		regulator-name = "vdd-mmc0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&pio 4 4 GPIO_ACTIVE_LOW>; /* PE4 */
+		gpios = <&pio 4 4 GPIO_ACTIVE_LOW>; /* PE4 */
 		vin-supply = <&reg_vcc3v3>;
 	};
 };
@@ -182,11 +182,11 @@ &reg_ldo2 {
 
 &reg_usb0_vbus {
 	status = "okay";
-	gpio = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+	gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
+	gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a13-pocketbook-touch-lux-3.dts b/arch/arm/boot/dts/allwinner/sun5i-a13-pocketbook-touch-lux-3.dts
index d60407772e5d..68a37d24d6c6 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a13-pocketbook-touch-lux-3.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a13-pocketbook-touch-lux-3.dts
@@ -67,7 +67,7 @@ reg_1v8: regulator-1v8 {
 		regulator-name = "vdd-1v8-nor-ctp";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&pio 2 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 2 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -76,7 +76,7 @@ reg_1v8_nor: regulator-nor {
 		regulator-name = "vdd-nor";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&pio 2 14 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 2 14 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_1v8>;
 		regulator-always-on;
@@ -87,7 +87,7 @@ reg_1v8_ctp: regulator-ctp {
 		regulator-name = "vdd-ctp";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&pio 2 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 2 13 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_1v8>;
 	};
@@ -97,7 +97,7 @@ reg_3v3_mmc0: regulator-mmc0 {
 		regulator-name = "vdd-mmc0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&pio 4 4 GPIO_ACTIVE_LOW>; /* PE4 */
+		gpios = <&pio 4 4 GPIO_ACTIVE_LOW>; /* PE4 */
 		vin-supply = <&reg_vcc3v3>;
 	};
 };
diff --git a/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts b/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts
index be486d28d04f..c782f6fb2af4 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts
@@ -93,7 +93,7 @@ mmccard: mmccard@0 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
+	gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
 };
 
 &touchscreen {
diff --git a/arch/arm/boot/dts/allwinner/sun5i-gr8-evb.dts b/arch/arm/boot/dts/allwinner/sun5i-gr8-evb.dts
index f4fe258ef06d..0156f2364c0d 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-gr8-evb.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-gr8-evb.dts
@@ -280,7 +280,7 @@ &reg_ldo2 {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 6 13 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-r8-chip.dts b/arch/arm/boot/dts/allwinner/sun5i-r8-chip.dts
index 8c784a2c086e..88c5550e0839 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-r8-chip.dts
+++ b/arch/arm/boot/dts/allwinner/sun5i-r8-chip.dts
@@ -226,7 +226,7 @@ &reg_ldo5 {
 
 &reg_usb0_vbus {
 	vin-supply = <&reg_vcc5v0>;
-	gpio = <&pio 1 10 GPIO_ACTIVE_HIGH>; /* PB10 */
+	gpios = <&pio 1 10 GPIO_ACTIVE_HIGH>; /* PB10 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun5i-reference-design-tablet.dtsi b/arch/arm/boot/dts/allwinner/sun5i-reference-design-tablet.dtsi
index 6847f66699ac..cc6bea6e1969 100644
--- a/arch/arm/boot/dts/allwinner/sun5i-reference-design-tablet.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun5i-reference-design-tablet.dtsi
@@ -165,7 +165,7 @@ &reg_ldo3 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+	gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-app4-evb1.dts b/arch/arm/boot/dts/allwinner/sun6i-a31-app4-evb1.dts
index 32d22025ac99..cfbc4f2de35c 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31-app4-evb1.dts
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31-app4-evb1.dts
@@ -66,7 +66,7 @@ &ehci0 {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 7 27 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 7 27 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-colombus.dts b/arch/arm/boot/dts/allwinner/sun6i-a31-colombus.dts
index 93a15eaaa8cb..7fde64986bc4 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31-colombus.dts
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31-colombus.dts
@@ -114,7 +114,7 @@ &mmc0 {
 };
 
 &reg_usb2_vbus {
-	gpio = <&pio 7 24 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 7 24 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
index 5bce7a32651e..98056ab99016 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
@@ -116,7 +116,7 @@ reg_vga_3v3: vga-3v3-regulator {
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pio 7 25 GPIO_ACTIVE_HIGH>; /* PH25 */
+		gpios = <&pio 7 25 GPIO_ACTIVE_HIGH>; /* PH25 */
 	};
 
 	wifi_pwrseq: pwrseq {
@@ -297,7 +297,7 @@ &reg_drivevbus {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 7 24 GPIO_ACTIVE_HIGH>; /* PH24 */
+	gpios = <&pio 7 24 GPIO_ACTIVE_HIGH>; /* PH24 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-i7.dts b/arch/arm/boot/dts/allwinner/sun6i-a31-i7.dts
index 744723d956f0..879ad6593a67 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31-i7.dts
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31-i7.dts
@@ -152,7 +152,7 @@ &mmc0 {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 2 27 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 2 27 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-m9.dts b/arch/arm/boot/dts/allwinner/sun6i-a31-m9.dts
index 7d2eaaf5c33e..bf28d000818f 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31-m9.dts
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31-m9.dts
@@ -195,7 +195,7 @@ &reg_dldo4 {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 2 27 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 2 27 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-mele-a1000g-quad.dts b/arch/arm/boot/dts/allwinner/sun6i-a31-mele-a1000g-quad.dts
index 83611434270c..9d5f05bc1872 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31-mele-a1000g-quad.dts
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31-mele-a1000g-quad.dts
@@ -195,7 +195,7 @@ &reg_dldo4 {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 2 27 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 2 27 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi-m1-plus.dts
index f2d7fab9978d..e6d68fb43a43 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi-m1-plus.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi-m1-plus.dts
@@ -98,7 +98,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 7 23 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
index 46ecf9db2324..82c04783e807 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
@@ -90,7 +90,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 7 23 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapro.dts
index e22f0e8bb17a..eee883c21633 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapro.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapro.dts
@@ -86,7 +86,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 7 23 GPIO_ACTIVE_HIGH>;
 	};
 };
 
@@ -177,12 +177,12 @@ &ohci1 {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 7 0 GPIO_ACTIVE_HIGH>; /* PH0 */
+	gpios = <&pio 7 0 GPIO_ACTIVE_HIGH>; /* PH0 */
 	status = "okay";
 };
 
 &reg_usb2_vbus {
-	gpio = <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
+	gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-cubietruck.dts
index be9b31d0f4b5..386122f6e053 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-cubietruck.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-cubietruck.dts
@@ -244,7 +244,7 @@ &pwm {
 };
 
 &reg_ahci_5v {
-	gpio = <&pio 7 12 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 7 12 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
@@ -284,7 +284,7 @@ &reg_ldo2 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 7 17 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 7 17 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-hummingbird.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-hummingbird.dts
index f1e26b75cd90..b9e5a43254ad 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-hummingbird.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-hummingbird.dts
@@ -71,7 +71,7 @@ reg_mmc3_vdd: regulator-mmc3-vdd {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		enable-active-high;
-		gpio = <&pio 7 9 GPIO_ACTIVE_HIGH>; /* PH9 */
+		gpios = <&pio 7 9 GPIO_ACTIVE_HIGH>; /* PH9 */
 	};
 
 	reg_gmac_vdd: regulator-gmac-vdd {
@@ -80,7 +80,7 @@ reg_gmac_vdd: regulator-gmac-vdd {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		enable-active-high;
-		gpio = <&pio 7 16 GPIO_ACTIVE_HIGH>; /* PH16 */
+		gpios = <&pio 7 16 GPIO_ACTIVE_HIGH>; /* PH16 */
 	};
 };
 
@@ -176,12 +176,12 @@ &pwm {
 };
 
 &reg_ahci_5v {
-	gpio = <&pio 7 15 GPIO_ACTIVE_HIGH>; /* PH15 */
+	gpios = <&pio 7 15 GPIO_ACTIVE_HIGH>; /* PH15 */
 	status = "okay";
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
+	gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-i12-tvbox.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-i12-tvbox.dts
index b21ddd0ec1c2..4d8a62aec0b6 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-i12-tvbox.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-i12-tvbox.dts
@@ -79,7 +79,7 @@ reg_vmmc3: vmmc3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&pio 7 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_vmmc3_io: vmmc3-io {
@@ -90,7 +90,7 @@ reg_vmmc3_io: vmmc3-io {
 		/* This controls VCC-PI, must be always on! */
 		regulator-always-on;
 		enable-active-high;
-		gpio = <&pio 7 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 7 12 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_gmac_3v3: gmac-3v3 {
@@ -100,7 +100,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <50000>;
 		enable-active-high;
-		gpio = <&pio 7 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 7 21 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-lamobo-r1.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-lamobo-r1.dts
index 97518afe4658..868680776562 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-lamobo-r1.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-lamobo-r1.dts
@@ -88,7 +88,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
+		gpios = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
 	};
 };
 
@@ -238,7 +238,7 @@ &battery_power_supply {
 };
 
 &reg_ahci_5v {
-	gpio = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
+	gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>; /* PB3 */
 	status = "okay";
 };
 
@@ -272,7 +272,7 @@ &reg_usb0_vbus {
 };
 
 &reg_usb2_vbus {
-	gpio = <&pio 7 12 GPIO_ACTIVE_HIGH>; /* PH12 */
+	gpios = <&pio 7 12 GPIO_ACTIVE_HIGH>; /* PH12 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-olimex-som-evb.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-olimex-som-evb.dts
index f05ee32bc9cb..7bf39b551afb 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-olimex-som-evb.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-olimex-som-evb.dts
@@ -239,7 +239,7 @@ led_pins_olimex_som_evb: led-pins {
 };
 
 &reg_ahci_5v {
-	gpio = <&pio 2 3 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-olimex-som204-evb.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-olimex-som204-evb.dts
index a55406657449..225e045f9e34 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-olimex-som204-evb.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-olimex-som204-evb.dts
@@ -212,7 +212,7 @@ &battery_power_supply {
 };
 
 &reg_ahci_5v {
-	gpio = <&pio 2 3 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
@@ -251,7 +251,7 @@ &reg_ldo4 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 2 17 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 2 17 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-lime.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-lime.dts
index 92938d022295..9c6e8953c9e7 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-lime.dts
@@ -179,7 +179,7 @@ led_pins_olinuxinolime: led-pins {
 };
 
 &reg_ahci_5v {
-	gpio = <&pio 2 3 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-lime2.dts
index 435a189332e8..266d679ce92b 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-lime2.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-lime2.dts
@@ -190,7 +190,7 @@ led_pins_olinuxinolime: led-pins {
 };
 
 &reg_ahci_5v {
-	gpio = <&pio 2 3 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
@@ -247,7 +247,7 @@ &reg_ldo4 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 2 17 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 2 17 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-orangepi-mini.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-orangepi-mini.dts
index 84efa01e7cba..fe35ca267e5a 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-orangepi-mini.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-orangepi-mini.dts
@@ -93,7 +93,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
+		gpios = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
 	};
 };
 
@@ -208,12 +208,12 @@ &reg_usb0_vbus {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 7 26 GPIO_ACTIVE_HIGH>; /* PH26 */
+	gpios = <&pio 7 26 GPIO_ACTIVE_HIGH>; /* PH26 */
 	status = "okay";
 };
 
 &reg_usb2_vbus {
-	gpio = <&pio 7 22 GPIO_ACTIVE_HIGH>; /* PH22 */
+	gpios = <&pio 7 22 GPIO_ACTIVE_HIGH>; /* PH22 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-orangepi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-orangepi.dts
index 5d77f1d9818f..fe6110f14e32 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-orangepi.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-orangepi.dts
@@ -77,7 +77,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
+		gpios = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
 	};
 };
 
@@ -167,12 +167,12 @@ &reg_usb0_vbus {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 7 26 GPIO_ACTIVE_HIGH>; /* PH26 */
+	gpios = <&pio 7 26 GPIO_ACTIVE_HIGH>; /* PH26 */
 	status = "okay";
 };
 
 &reg_usb2_vbus {
-	gpio = <&pio 7 22 GPIO_ACTIVE_HIGH>; /* PH22 */
+	gpios = <&pio 7 22 GPIO_ACTIVE_HIGH>; /* PH22 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-pcduino3-nano.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-pcduino3-nano.dts
index e40ecb48d726..174c3bb6598e 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-pcduino3-nano.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-pcduino3-nano.dts
@@ -169,7 +169,7 @@ &otg_sram {
 };
 
 &reg_ahci_5v {
-	gpio = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
+	gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
 	status = "okay";
 };
 
@@ -202,7 +202,7 @@ &reg_ldo2 {
 
 /* A single regulator (U24) powers both USB host ports. */
 &reg_usb1_vbus {
-	gpio = <&pio 3 2 GPIO_ACTIVE_HIGH>; /* PD2 */
+	gpios = <&pio 3 2 GPIO_ACTIVE_HIGH>; /* PD2 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-pcduino3.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-pcduino3.dts
index 928b86a95f34..1251157519f3 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-pcduino3.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-pcduino3.dts
@@ -171,7 +171,7 @@ &otg_sram {
 };
 
 &reg_ahci_5v {
-	gpio = <&pio 7 2 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-allwinner-h8homlet-v2.dts b/arch/arm/boot/dts/allwinner/sun8i-a83t-allwinner-h8homlet-v2.dts
index c31c97d16024..793b00430646 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-a83t-allwinner-h8homlet-v2.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-allwinner-h8homlet-v2.dts
@@ -65,7 +65,7 @@ reg_usb0_vbus: reg-usb0-vbus {
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
+		gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
 	};
 
 	reg_usb1_vbus: reg-usb1-vbus {
@@ -75,7 +75,7 @@ reg_usb1_vbus: reg-usb1-vbus {
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
 	};
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3.dts
index 32e811fa23e2..b661c80a1aa2 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3.dts
@@ -92,7 +92,7 @@ reg_usb1_vbus: reg-usb1-vbus {
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
+		gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
 	};
 
 	wifi_pwrseq: pwrseq {
@@ -118,7 +118,7 @@ regulator-sata-disk-pwr {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		enable-active-high;
-		gpio = <&pio 3 25 GPIO_ACTIVE_HIGH>; /* PD25 */
+		gpios = <&pio 3 25 GPIO_ACTIVE_HIGH>; /* PD25 */
 	};
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-cubietruck-plus.dts b/arch/arm/boot/dts/allwinner/sun8i-a83t-cubietruck-plus.dts
index d5e6ddaffbce..d70ff729f3aa 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-a83t-cubietruck-plus.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-cubietruck-plus.dts
@@ -113,7 +113,7 @@ reg_usb1_vbus: reg-usb1-vbus {
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pio 3 29 GPIO_ACTIVE_HIGH>; /* PD29 */
+		gpios = <&pio 3 29 GPIO_ACTIVE_HIGH>; /* PD29 */
 	};
 
 	reg_usb2_vbus: reg-usb2-vbus {
@@ -123,7 +123,7 @@ reg_usb2_vbus: reg-usb2-vbus {
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/allwinner/sun8i-a83t-tbs-a711.dts
index 43982b106a4d..6575d110fb13 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-a83t-tbs-a711.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-tbs-a711.dts
@@ -118,7 +118,7 @@ reg_vmain: reg-vmain {
 		regulator-name = "vmain";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&r_pio 0 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_vbat>;
 	};
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-m2-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-m2-zero.dts
index d3a7c9fa23e4..02ff39b56034 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-m2-zero.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-m2-zero.dts
@@ -82,7 +82,7 @@ reg_vcc_dram: vcc-dram {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
+		gpios = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
 		vin-supply = <&reg_vcc5v0>;
 	};
 
@@ -94,7 +94,7 @@ reg_vcc1v2: vcc1v2 {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
+		gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
 		vin-supply = <&reg_vcc5v0>;
 	};
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-r1.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-r1.dts
index 79b03b31c5eb..e779e21d96b5 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-r1.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-r1.dts
@@ -61,7 +61,7 @@ reg_vcc_usb_eth: reg-vcc-usb-ethernet {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "vcc-usb-ethernet";
 		enable-active-high;
-		gpio = <&pio 0 20 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 0 20 GPIO_ACTIVE_HIGH>;
 	};
 
 	aliases {
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
index 1b001f2ad0ef..6447fe4a8722 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
@@ -86,7 +86,7 @@ reg_vcc_wifi: reg-vcc-wifi {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "vcc-wifi";
 		enable-active-high;
-		gpio = <&pio 0 20 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 0 20 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_vdd_cpux: vdd-cpux-regulator {
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-beelink-x2.dts
index 5b77300307de..3a15dc573f23 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-beelink-x2.dts
@@ -209,7 +209,7 @@ &ohci1 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
+	gpios = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
index 2b0566d4b386..b674463fe494 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
@@ -71,7 +71,7 @@ reg_vcc_dram: vcc-dram {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
+		gpios = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
 		vin-supply = <&reg_vcc5v0>;
         };
 
@@ -83,7 +83,7 @@ reg_vdd_sys: vdd-sys {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
+		gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
 		vin-supply = <&reg_vcc5v0>;
         };
 
@@ -133,7 +133,7 @@ &ohci0 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
+	gpios = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-m1-plus.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-m1-plus.dts
index 59bd0746acf8..17fa7b3f94bf 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-m1-plus.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-m1-plus.dts
@@ -59,7 +59,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>;
 	};
 
 	wifi_pwrseq: pwrseq {
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-r1.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-r1.dts
index 870649760f70..52d1655f3f42 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-r1.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-r1.dts
@@ -25,7 +25,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
+		gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
 	};
 
 	reg_vdd_cpux: gpio-regulator {
@@ -129,7 +129,7 @@ &ohci2 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
+	gpios = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-2.dts
index d2ae47b074bf..aff6cba05eb2 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-2.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-2.dts
@@ -175,7 +175,7 @@ rtl8189: wifi@1 {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 6 13 GPIO_ACTIVE_HIGH>;
+	gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-one.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-one.dts
index 59f6f6d5e7ca..b70dcb456c45 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-one.dts
@@ -162,7 +162,7 @@ &ohci1 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
+	gpios = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-pc.dts
index b96e015f54ee..9f208e4d8aa8 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-pc.dts
@@ -201,7 +201,7 @@ reg_vdd_cpux: regulator@65 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
+	gpios = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* PL2 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-plus.dts
index d05fa679dcd3..beeb3f4b3154 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-plus.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-plus.dts
@@ -58,7 +58,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_usb3_vbus: usb3-vbus {
@@ -68,7 +68,7 @@ reg_usb3_vbus: usb3-vbus {
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pio 6 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-plus2e.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-plus2e.dts
index b6ca45d18e51..cc1fef82b334 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-plus2e.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-orangepi-plus2e.dts
@@ -58,7 +58,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
+		gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
 	};
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-zeropi.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-zeropi.dts
index 7d3e7323b661..fbc3f713d831 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-zeropi.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-zeropi.dts
@@ -57,7 +57,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
+		gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
 	};
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-r16-parrot.dts b/arch/arm/boot/dts/allwinner/sun8i-r16-parrot.dts
index 75067522ff59..76baf61ab9de 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r16-parrot.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-r16-parrot.dts
@@ -281,7 +281,7 @@ &reg_eldo3 {
 };
 
 &reg_usb1_vbus {
-	gpio = <&pio 3 12 GPIO_ACTIVE_HIGH>; /* PD12 */
+	gpios = <&pio 3 12 GPIO_ACTIVE_HIGH>; /* PD12 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
index cd2351acc32f..737ffc2470f6 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
@@ -96,7 +96,7 @@ reg_vcc5v0: vcc5v0 {
 		regulator-name = "vcc5v0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
+		gpios = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/allwinner/sun8i-s3-pinecube.dts b/arch/arm/boot/dts/allwinner/sun8i-s3-pinecube.dts
index e0d4404b5957..80c0271b6e81 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-s3-pinecube.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-s3-pinecube.dts
@@ -46,7 +46,7 @@ reg_vcc_wifi: vcc-wifi {
 		regulator-name = "vcc-wifi";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&pio 1 2 GPIO_ACTIVE_LOW>; /* PB2 WIFI-EN */
+		gpios = <&pio 1 2 GPIO_ACTIVE_LOW>; /* PB2 WIFI-EN */
 		vin-supply = <&reg_dcdc3>;
 		startup-delay-us = <200000>;
 	};
diff --git a/arch/arm/boot/dts/allwinner/sun8i-t3-cqa3t-bv3.dts b/arch/arm/boot/dts/allwinner/sun8i-t3-cqa3t-bv3.dts
index 9f472521f4a4..d8cbad257083 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t3-cqa3t-bv3.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-t3-cqa3t-bv3.dts
@@ -78,7 +78,7 @@ reg_vcc5v0: vcc5v0 {
 		regulator-name = "vcc5v0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
+		gpios = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/allwinner/sun8i-v40-bananapi-m2-berry.dts
index 6575ef274453..59fb9ce57cc9 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v40-bananapi-m2-berry.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-v40-bananapi-m2-berry.dts
@@ -90,7 +90,7 @@ reg_vcc5v0: vcc5v0 {
 		regulator-name = "vcc5v0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
+		gpios = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80-optimus.dts b/arch/arm/boot/dts/allwinner/sun9i-a80-optimus.dts
index 5c3580d712e4..784e0eef7d1b 100644
--- a/arch/arm/boot/dts/allwinner/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/allwinner/sun9i-a80-optimus.dts
@@ -86,7 +86,7 @@ reg_usb1_vbus: usb1-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+		gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
 	};
 
 	reg_usb3_vbus: usb3-vbus {
@@ -95,7 +95,7 @@ reg_usb3_vbus: usb3-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+		gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
 	};
 
 	wifi_pwrseq: wifi-pwrseq {
diff --git a/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus.dtsi b/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus.dtsi
index 873817ddb4ea..f8f083622bfe 100644
--- a/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus.dtsi
+++ b/arch/arm/boot/dts/allwinner/sunxi-bananapi-m2-plus.dtsi
@@ -95,7 +95,7 @@ reg_gmac_3v3: gmac-3v3 {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100000>;
 		enable-active-high;
-		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>;
 	};
 
 	wifi_pwrseq: pwrseq {
@@ -202,7 +202,7 @@ &ohci2 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&pio 3 11 GPIO_ACTIVE_HIGH>; /* PD11 */
+	gpios = <&pio 3 11 GPIO_ACTIVE_HIGH>; /* PD11 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sunxi-common-regulators.dtsi b/arch/arm/boot/dts/allwinner/sunxi-common-regulators.dtsi
index d8e5826fb3de..0c61252a7008 100644
--- a/arch/arm/boot/dts/allwinner/sunxi-common-regulators.dtsi
+++ b/arch/arm/boot/dts/allwinner/sunxi-common-regulators.dtsi
@@ -52,7 +52,7 @@ reg_ahci_5v: ahci-5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pio 1 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 1 8 GPIO_ACTIVE_HIGH>;
 		status = "disabled";
 	};
 
@@ -62,7 +62,7 @@ reg_usb0_vbus: usb0-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&pio 1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 1 9 GPIO_ACTIVE_HIGH>;
 		status = "disabled";
 	};
 
@@ -73,7 +73,7 @@ reg_usb1_vbus: usb1-vbus {
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pio 7 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 7 6 GPIO_ACTIVE_HIGH>;
 		status = "disabled";
 	};
 
@@ -84,7 +84,7 @@ reg_usb2_vbus: usb2-vbus {
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pio 7 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 7 3 GPIO_ACTIVE_HIGH>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/allwinner/sunxi-h3-h5-emlid-neutis.dtsi b/arch/arm/boot/dts/allwinner/sunxi-h3-h5-emlid-neutis.dtsi
index be5f5528a118..41a5a7496639 100644
--- a/arch/arm/boot/dts/allwinner/sunxi-h3-h5-emlid-neutis.dtsi
+++ b/arch/arm/boot/dts/allwinner/sunxi-h3-h5-emlid-neutis.dtsi
@@ -32,7 +32,7 @@ &cpu0 {
 };
 
 &reg_usb0_vbus {
-	gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>;   /* PL9 */
+	gpios = <&r_pio 0 9 GPIO_ACTIVE_HIGH>;   /* PL9 */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/allwinner/sunxi-libretech-all-h3-cc.dtsi b/arch/arm/boot/dts/allwinner/sunxi-libretech-all-h3-cc.dtsi
index 89731bb34c6b..640d5f9ae47e 100644
--- a/arch/arm/boot/dts/allwinner/sunxi-libretech-all-h3-cc.dtsi
+++ b/arch/arm/boot/dts/allwinner/sunxi-libretech-all-h3-cc.dtsi
@@ -61,7 +61,7 @@ reg_vcc1v2: vcc1v2 {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&reg_vcc5v0>;
-		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
+		gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
 		enable-active-high;
 	};
 
@@ -89,7 +89,7 @@ reg_vcc_dram: vcc-dram {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&reg_vcc5v0>;
-		gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
+		gpios = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
 		enable-active-high;
 	};
 
@@ -101,7 +101,7 @@ reg_vcc_io: vcc-io {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&reg_vcc3v3>;
-		gpio = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL5 */
+		gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL5 */
 	};
 
 	reg_vdd_cpux: vdd-cpux {
@@ -112,7 +112,7 @@ reg_vdd_cpux: vdd-cpux {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&reg_vcc5v0>;
-		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
+		gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/allwinner/sunxi-libretech-all-h3-it.dtsi b/arch/arm/boot/dts/allwinner/sunxi-libretech-all-h3-it.dtsi
index 50d328c2a84d..8f82f8990e7d 100644
--- a/arch/arm/boot/dts/allwinner/sunxi-libretech-all-h3-it.dtsi
+++ b/arch/arm/boot/dts/allwinner/sunxi-libretech-all-h3-it.dtsi
@@ -62,7 +62,7 @@ reg_vcc_dram: vcc-dram {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&reg_vcc5v0>;
-		gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
+		gpios = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
 		enable-active-high;
 	};
 
@@ -73,7 +73,7 @@ reg_vcc_io: vcc-io {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&reg_vcc3v3>;
-		gpio = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL5 */
+		gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL5 */
 	};
 
 	reg_vcc_usbwifi: vcc-usbwifi {
@@ -82,7 +82,7 @@ reg_vcc_usbwifi: vcc-usbwifi {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&reg_vcc5v0>;
-		gpio = <&pio 6 4 GPIO_ACTIVE_HIGH>; /* PG4 */
+		gpios = <&pio 6 4 GPIO_ACTIVE_HIGH>; /* PG4 */
 		enable-active-high;
 	};
 
@@ -94,7 +94,7 @@ reg_vdd_cpux: vdd-cpux {
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&reg_vcc5v0>;
-		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
+		gpios = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
index 49890eb12781..77a9a3dfaa69 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
@@ -136,7 +136,7 @@ usb_vbus: regulator-usb-vbus {
 		/*
 		 * signal name from the schematics: USB_PWR_EN
 		 */
-		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -155,7 +155,7 @@ vcc_5v: regulator-vcc5v {
 		/*
 		 * signal name from the schematics: 3V3_5V_EN
 		 */
-		gpio = <&gpio GPIODV_29 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio GPIODV_29 GPIO_ACTIVE_LOW>;
 
 		regulator-boot-on;
 		regulator-always-on;
diff --git a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
index 941682844faf..926a9063c8a3 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
@@ -62,7 +62,7 @@ tflash_vdd: regulator-tflash_vdd {
 
 		vin-supply = <&vcc_3v3>;
 
-		gpio = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 5be0e8fd2633..90f569f41e16 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -232,7 +232,7 @@ vbus_sled1: vbus_sled1 {
 		regulator-name = "vbus_sled1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&sled1_ioexp 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&sled1_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -241,7 +241,7 @@ vbus_sled2: vbus_sled2 {
 		regulator-name = "vbus_sled2";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&sled2_ioexp 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&sled2_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -250,7 +250,7 @@ vbus_sled3: vbus_sled3 {
 		regulator-name = "vbus_sled3";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&sled3_ioexp 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&sled3_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -259,7 +259,7 @@ vbus_sled4: vbus_sled4 {
 		regulator-name = "vbus_sled4";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&sled4_ioexp 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&sled4_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -268,7 +268,7 @@ vbus_sled5: vbus_sled5 {
 		regulator-name = "vbus_sled5";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&sled5_ioexp 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&sled5_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -277,7 +277,7 @@ vbus_sled6: vbus_sled6 {
 		regulator-name = "vbus_sled6";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&sled6_ioexp 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&sled6_ioexp 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index 353bb50ce542..a8a4bc6b155f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -20,7 +20,7 @@ cam1_reg: regulator-cam1 {
 		compatible = "regulator-fixed";
 		regulator-name = "cam1-reg";
 		enable-active-high;
-		gpio = <&expgpio 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&expgpio 5 GPIO_ACTIVE_HIGH>;
 	};
 
 	sd_io_1v8_reg: regulator-sd-io-1v8 {
@@ -44,7 +44,7 @@ sd_vcc_reg: regulator-sd-vcc {
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&expgpio 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&expgpio 6 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4.dtsi
index 48e63ab7848c..07e1f9c31a20 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4.dtsi
@@ -33,7 +33,7 @@ sd_vcc_reg: regulator-sd-vcc {
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&expgpio 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&expgpio 6 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts b/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts
index 808cd5778e27..2db8e03b99d5 100644
--- a/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts
+++ b/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts
@@ -59,7 +59,7 @@ lcddc: lcddc {
 		regulator-name = "BACKLIGHT ENABLE";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&portd 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&portd 1 GPIO_ACTIVE_HIGH>;
 	};
 
 	blen: blen {
@@ -67,7 +67,7 @@ blen: blen {
 		regulator-name = "BACKLIGHT ENABLE";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&portd 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&portd 3 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dts b/arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dts
index b4dbcf8f168e..df12f7eb68ea 100644
--- a/arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dts
+++ b/arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dts
@@ -51,7 +51,7 @@ vdisp: regulator {
 		regulator-min-microvolt = <3600000>;
 		regulator-max-microvolt = <3600000>;
 		/* Collides with LCD E */
-		gpio = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-common.dtsi b/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-common.dtsi
index 147c99191dc2..f9bc3b56c4b9 100644
--- a/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-common.dtsi
+++ b/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-common.dtsi
@@ -40,7 +40,7 @@ reg_va_5v0: regulator-va-5v0 {
 		regulator-name = "va-5v0-fixed-supply";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio 124 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio 124 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts b/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts
index 12b15945ac6d..b2a2c6d42b03 100644
--- a/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts
+++ b/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts
@@ -21,7 +21,7 @@ lcd_supply: regulator-va-tft {
 		regulator-name = "va-tft-fixed-supply";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio 33 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio 33 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
index 84f39dec3c42..83fe39337146 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_vining_fpga.dts
@@ -70,7 +70,7 @@ regulator-usb-nrst {
 		regulator-name = "usb_nrst";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&portb 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&portb 5 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 		regulator-always-on;
diff --git a/arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dts b/arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dts
index d4c4efabd254..3667dd6baa3e 100644
--- a/arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dts
+++ b/arch/arm/boot/dts/marvell/armada-370-dlink-dns327l.dts
@@ -115,7 +115,7 @@ usb_power: regulator-1 {
 		enable-active-high;
 		regulator-boot-on;
 		regulator-always-on;
-		gpio = <&gpio0 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 13 GPIO_ACTIVE_HIGH>;
 	};
 
 	sata_r_power: regulator-2 {
@@ -129,7 +129,7 @@ sata_r_power: regulator-2 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 22 GPIO_ACTIVE_HIGH>;
 	};
 
 	sata_l_power: regulator-3 {
@@ -143,7 +143,7 @@ sata_l_power: regulator-3 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 24 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 24 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dts b/arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dts
index 3011578a3124..1d8629ab8d93 100644
--- a/arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dts
+++ b/arch/arm/boot/dts/marvell/armada-370-seagate-nas-4bay.dts
@@ -54,7 +54,7 @@ regulator-3 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pca9554 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pca9554 6 GPIO_ACTIVE_HIGH>;
 	};
 
 	regulator-4 {
@@ -65,7 +65,7 @@ regulator-4 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pca9554 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&pca9554 7 GPIO_ACTIVE_HIGH>;
 	};
 
 	gpio-leds {
diff --git a/arch/arm/boot/dts/marvell/armada-370-seagate-nas-xbay.dtsi b/arch/arm/boot/dts/marvell/armada-370-seagate-nas-xbay.dtsi
index ffb3179033e7..78f308e58d6e 100644
--- a/arch/arm/boot/dts/marvell/armada-370-seagate-nas-xbay.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-370-seagate-nas-xbay.dtsi
@@ -78,7 +78,7 @@ regulator-1 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
 	};
 
 	regulator-2 {
@@ -89,7 +89,7 @@ regulator-2 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 22 GPIO_ACTIVE_HIGH>;
 	};
 
 	gpio-fan {
diff --git a/arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dts b/arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dts
index 45d8ec5dfeb7..4e60177198a9 100644
--- a/arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dts
+++ b/arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud-2bay.dts
@@ -40,6 +40,6 @@ regulator-2 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 22 GPIO_ACTIVE_HIGH>;
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtsi b/arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtsi
index 054124857235..0b250930f41e 100644
--- a/arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-370-seagate-personal-cloud.dtsi
@@ -60,7 +60,7 @@ regulator-0 {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 27 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 27 GPIO_ACTIVE_LOW>;
 	};
 
 	regulator-1 {
@@ -71,7 +71,7 @@ regulator-1 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dts b/arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dts
index 02599a3e9816..3fd09e6745f8 100644
--- a/arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dts
+++ b/arch/arm/boot/dts/marvell/armada-370-synology-ds213j.dts
@@ -151,7 +151,7 @@ sata1_regulator: sata1-regulator-1 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&sata1_pwr_pin>;
 		pinctrl-names = "default";
 	};
@@ -165,7 +165,7 @@ sata2_regulator: sata2-regulator-2 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 30 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&sata2_pwr_pin>;
 		pinctrl-names = "default";
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
index 8208c6a9627a..323786853203 100644
--- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
@@ -104,7 +104,7 @@ reg_5p0v: regulator-5p0v {
 
 	v_usb3_con: regulator-v-usb3-con {
 		compatible = "regulator-fixed";
-		gpio = <&gpio0 22 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio0 22 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cf_gtr_usb3_con_vbus>;
 		regulator-max-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/marvell/armada-385-db-ap.dts b/arch/arm/boot/dts/marvell/armada-385-db-ap.dts
index 332f8fce77dc..112a4b35b81f 100644
--- a/arch/arm/boot/dts/marvell/armada-385-db-ap.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-db-ap.dts
@@ -183,7 +183,7 @@ reg_xhci0_vbus: xhci0-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..3b226b182d3f 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -168,7 +168,7 @@ &sdhci {
 };
 
 &usb3_1_vbus {
-	gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
 };
 
 &usb3_1_vbus_pins {
diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys.dtsi b/arch/arm/boot/dts/marvell/armada-385-linksys.dtsi
index 4116ed60f709..b98c4da01cea 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys.dtsi
@@ -45,7 +45,7 @@ usb3_1_vbus: usb3_1-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
 	};
 
 	gpio_keys: gpio-keys {
diff --git a/arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts b/arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts
index 6caa5c50175a..752e92fc8d25 100644
--- a/arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts
@@ -177,7 +177,7 @@ reg_usb3_0_vbus: usb3-vbus0 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_usb3_1_vbus: usb3-vbus1 {
@@ -188,7 +188,7 @@ reg_usb3_1_vbus: usb3-vbus1 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_sata0: pwr-sata0 {
@@ -198,7 +198,7 @@ reg_sata0: pwr-sata0 {
 		regulator-max-microvolt = <12000000>;
 		enable-active-high;
 		regulator-boot-on;
-		gpio = <&gpio0 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 15 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_5v_sata0: v5-sata0 {
diff --git a/arch/arm/boot/dts/marvell/armada-388-gp.dts b/arch/arm/boot/dts/marvell/armada-388-gp.dts
index 1de0a172aa5f..5155ab40d6a3 100644
--- a/arch/arm/boot/dts/marvell/armada-388-gp.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-gp.dts
@@ -260,7 +260,7 @@ reg_usb3_vbus: usb3-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&expander1 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander1 15 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_usb2_0_vbus: v5-vbus0 {
@@ -270,7 +270,7 @@ reg_usb2_0_vbus: v5-vbus0 {
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 		regulator-always-on;
-		gpio = <&expander1 14 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander1 14 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_usb2_1_vbus: v5-vbus1 {
@@ -279,7 +279,7 @@ reg_usb2_1_vbus: v5-vbus1 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&expander0 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander0 4 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_sata0: pwr-sata0 {
@@ -289,7 +289,7 @@ reg_sata0: pwr-sata0 {
 		regulator-max-microvolt = <12000000>;
 		enable-active-high;
 		regulator-boot-on;
-		gpio = <&expander0 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander0 2 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_5v_sata0: v5-sata0 {
@@ -315,7 +315,7 @@ reg_sata1: pwr-sata1 {
 		regulator-max-microvolt = <12000000>;
 		enable-active-high;
 		regulator-boot-on;
-		gpio = <&expander0 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander0 3 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_5v_sata1: v5-sata1 {
@@ -339,7 +339,7 @@ reg_sata2: pwr-sata2 {
 		regulator-name = "pwr_en_sata2";
 		enable-active-high;
 		regulator-boot-on;
-		gpio = <&expander0 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander0 11 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_5v_sata2: v5-sata2 {
@@ -363,7 +363,7 @@ reg_sata3: pwr-sata3 {
 		regulator-name = "pwr_en_sata3";
 		enable-active-high;
 		regulator-boot-on;
-		gpio = <&expander0 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander0 12 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_5v_sata3: v5-sata3 {
diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index ec134e22bae3..d26235d6843c 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -64,7 +64,7 @@ reg_5p0v_usb: regulator-5v-usb {
 		regulator-boot-on;
 		regulator-always-on;
 		enable-active-high;
-		gpio = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander0 6 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_12v>;
 	};
 
diff --git a/arch/arm/boot/dts/marvell/armada-xp-synology-ds414.dts b/arch/arm/boot/dts/marvell/armada-xp-synology-ds414.dts
index 1b65059794bf..1c7c22dc680d 100644
--- a/arch/arm/boot/dts/marvell/armada-xp-synology-ds414.dts
+++ b/arch/arm/boot/dts/marvell/armada-xp-synology-ds414.dts
@@ -118,7 +118,7 @@ sata1_regulator: sata1-regulator-1 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&sata1_pwr_pin>;
 		pinctrl-names = "default";
 	};
@@ -132,7 +132,7 @@ sata2_regulator: sata2-regulator-2 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&sata2_pwr_pin>;
 		pinctrl-names = "default";
 	};
@@ -146,7 +146,7 @@ sata3_regulator: sata3-regulator-3 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&sata3_pwr_pin>;
 		pinctrl-names = "default";
 	};
@@ -160,7 +160,7 @@ sata4_regulator: sata4-regulator-4 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&sata4_pwr_pin>;
 		pinctrl-names = "default";
 	};
diff --git a/arch/arm/boot/dts/marvell/dove-cm-a510.dtsi b/arch/arm/boot/dts/marvell/dove-cm-a510.dtsi
index 621cb145a8f6..f2119efc1e6f 100644
--- a/arch/arm/boot/dts/marvell/dove-cm-a510.dtsi
+++ b/arch/arm/boot/dts/marvell/dove-cm-a510.dtsi
@@ -113,7 +113,7 @@ wifi_power: regulator-1 {
 		regulator-name = "WiFi Power";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/marvell/dove-cubox.dts b/arch/arm/boot/dts/marvell/dove-cubox.dts
index bcaaf8320c45..ff2470c95fb9 100644
--- a/arch/arm/boot/dts/marvell/dove-cubox.dts
+++ b/arch/arm/boot/dts/marvell/dove-cubox.dts
@@ -36,7 +36,7 @@ usb_power: regulator-1 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio0 1 0>;
+		gpios = <&gpio0 1 0>;
 		pinctrl-0 = <&pmx_gpio_1>;
 		pinctrl-names = "default";
 	};
diff --git a/arch/arm/boot/dts/marvell/dove-d3plug.dts b/arch/arm/boot/dts/marvell/dove-d3plug.dts
index a451fd576990..7c119a977a60 100644
--- a/arch/arm/boot/dts/marvell/dove-d3plug.dts
+++ b/arch/arm/boot/dts/marvell/dove-d3plug.dts
@@ -45,7 +45,7 @@ usb_power: regulator-1 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio0 8 0>;
+		gpios = <&gpio0 8 0>;
 		pinctrl-0 = <&pmx_gpio_8>;
 		pinctrl-names = "default";
 	};
diff --git a/arch/arm/boot/dts/marvell/dove-sbc-a510.dts b/arch/arm/boot/dts/marvell/dove-sbc-a510.dts
index 8585ee5533bf..87515d644943 100644
--- a/arch/arm/boot/dts/marvell/dove-sbc-a510.dts
+++ b/arch/arm/boot/dts/marvell/dove-sbc-a510.dts
@@ -81,7 +81,7 @@ usb0_power: regulator-2 {
 		regulator-name = "USB Power";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio_ext 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio_ext 0 GPIO_ACTIVE_HIGH>;
 	};
 
 	mmc_power: regulator-3 {
@@ -89,7 +89,7 @@ mmc_power: regulator-3 {
 		regulator-name = "MMC Power";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio_ext 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio_ext 13 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dts b/arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dts
index 36b90c632fd6..96978e8a4cc1 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dts
@@ -74,7 +74,7 @@ sata0_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 24 GPIO_ACTIVE_LOW>;
+			gpios = <&gpio0 24 GPIO_ACTIVE_LOW>;
 		};
 
 		sata1_power: regulator@2 {
@@ -86,7 +86,7 @@ sata1_power: regulator@2 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 28 GPIO_ACTIVE_LOW>;
+			gpios = <&gpio0 28 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-dnskw.dtsi b/arch/arm/boot/dts/marvell/kirkwood-dnskw.dtsi
index 20bcd031f3f5..9863919f9637 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-dnskw.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-dnskw.dtsi
@@ -165,7 +165,7 @@ sata0_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio1 7 0>;
+			gpios = <&gpio1 7 0>;
 		};
 		sata1_power: regulator@2 {
 			compatible = "regulator-fixed";
@@ -176,7 +176,7 @@ sata1_power: regulator@2 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio1 8 0>;
+			gpios = <&gpio1 8 0>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-dockstar.dts b/arch/arm/boot/dts/marvell/kirkwood-dockstar.dts
index 090f1e2e5bb6..f5af8822d57a 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-dockstar.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-dockstar.dts
@@ -68,7 +68,7 @@ usb_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 29 0>;
+			gpios = <&gpio0 29 0>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-goflexnet.dts b/arch/arm/boot/dts/marvell/kirkwood-goflexnet.dts
index d5ac4e3974da..c68fca9e77c7 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-goflexnet.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-goflexnet.dts
@@ -143,7 +143,7 @@ usb_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 29 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-l-50.dts b/arch/arm/boot/dts/marvell/kirkwood-l-50.dts
index 974bc9de4702..abe432277dac 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-l-50.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-l-50.dts
@@ -154,7 +154,7 @@ usb2_pwr {
 
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 3 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 3 GPIO_ACTIVE_LOW>;
 		regulator-always-on;
 	};
 
@@ -164,7 +164,7 @@ usb1_pwr {
 
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 4 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
 		regulator-always-on;
 	};
 
@@ -174,7 +174,7 @@ mpcie_pwr {
 
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -185,7 +185,7 @@ express_card_pwr {
 
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-laplug.dts b/arch/arm/boot/dts/marvell/kirkwood-laplug.dts
index 90ea6cdee8e0..dff87be3afa6 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-laplug.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-laplug.dts
@@ -93,7 +93,7 @@ usb_power_back1: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 15 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 15 GPIO_ACTIVE_HIGH>;
 		};
 
 		usb_power_back2: regulator@2 {
@@ -105,7 +105,7 @@ usb_power_back2: regulator@2 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 28 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 28 GPIO_ACTIVE_HIGH>;
 		};
 
 		usb_power_front: regulator@3 {
@@ -117,7 +117,7 @@ usb_power_front: regulator@3 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-linkstation-6282.dtsi b/arch/arm/boot/dts/marvell/kirkwood-linkstation-6282.dtsi
index dfac2045a1eb..164e50bad9ae 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-linkstation-6282.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-linkstation-6282.dtsi
@@ -129,11 +129,11 @@ gpio_fan {
 
 	regulators {
 		usb_power: regulator@1 {
-			gpio = <&gpio0 12 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
 		};
 
 		hdd_power0: regulator@2 {
-			gpio = <&gpio0 8 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-linkstation-duo-6281.dtsi b/arch/arm/boot/dts/marvell/kirkwood-linkstation-duo-6281.dtsi
index ba629e02ba31..60ae04ca9e4a 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-linkstation-duo-6281.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-linkstation-duo-6281.dtsi
@@ -110,11 +110,11 @@ regulators {
 		pinctrl-0 = <&pmx_power_hdd0 &pmx_power_hdd1 &pmx_usb_vbus>;
 
 		usb_power: regulator@1 {
-			gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		};
 
 		hdd_power0: regulator@2 {
-			gpio = <&gpio0 28 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 28 GPIO_ACTIVE_HIGH>;
 		};
 
 		hdd_power1: regulator@3 {
@@ -126,7 +126,7 @@ hdd_power1: regulator@3 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 29 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dts b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dts
index 8bb381088910..2807942d39f1 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dts
@@ -92,7 +92,7 @@ hdd_power1: regulator@3 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dts b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dts
index e0f62adc0d5d..0969619549f6 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dts
@@ -69,7 +69,7 @@ hdd_power1: regulator@3 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi b/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
index 5e0b139dd4fb..d1b154eb3135 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi
@@ -198,7 +198,7 @@ usb_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 11 0>;
+			gpios = <&gpio0 11 0>;
 		};
 		hdd_power: regulator@2 {
 			compatible = "regulator-fixed";
@@ -209,7 +209,7 @@ hdd_power: regulator@2 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 10 0>;
+			gpios = <&gpio0 10 0>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nas2big.dts b/arch/arm/boot/dts/marvell/kirkwood-nas2big.dts
index 0b0a15093146..b8c594ca9a29 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nas2big.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nas2big.dts
@@ -65,7 +65,7 @@ regulator@2 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 17 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
 		};
 		clocks {
 			g762_clk: g762-oscillator {
diff --git a/arch/arm/boot/dts/marvell/kirkwood-net2big.dts b/arch/arm/boot/dts/marvell/kirkwood-net2big.dts
index d5f6bb50ba11..06d80cb1187b 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-net2big.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-net2big.dts
@@ -42,7 +42,7 @@ regulator@2 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio0 17 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
 	};
 
 	clocks {
diff --git a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
index 2497ad26b5b6..0d36528af27a 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
@@ -38,7 +38,7 @@ regulator@2 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio0 17 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
 	};
 
 	regulator@3 {
@@ -50,7 +50,7 @@ regulator@3 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 	};
 
 	regulator@4 {
@@ -62,7 +62,7 @@ regulator@4 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
 	};
 
 	regulator@5 {
@@ -74,7 +74,7 @@ regulator@5 {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
 	};
 
 	clocks {
diff --git a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
index cb564c3bcdc4..94249336d7ed 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
@@ -188,7 +188,7 @@ usb3_regulator: usb3-regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dts b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dts
index 6cf76430cfab..e1f7952e0ee3 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dts
@@ -212,7 +212,7 @@ usb3_regulator: usb3-regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
index d4edf2727388..e06da354e692 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
@@ -99,7 +99,7 @@ regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa310s.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa310s.dts
index 47deb93c90a5..8db7198741e2 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa310s.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa310s.dts
@@ -116,7 +116,7 @@ usb0_power: regulator@1 {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio0 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
 	};
 
 	sata1_power: regulator@2 {
@@ -127,7 +127,7 @@ sata1_power: regulator@2 {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	};
 
 	thermal-zones {
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa325.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa325.dts
index f0786a5f2ce6..a6f8a4a72eb8 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa325.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa325.dts
@@ -149,7 +149,7 @@ sata1_power: regulator@2 {
 			regulator-always-on;
 			regulator-boot-on;
 			enable-active-high;
-			gpio = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa3x0-common.dtsi b/arch/arm/boot/dts/marvell/kirkwood-nsa3x0-common.dtsi
index e9bd9c551af5..b97b79827b16 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa3x0-common.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa3x0-common.dtsi
@@ -99,7 +99,7 @@ usb0_power: regulator@1 {
 			regulator-max-microvolt = <5000000>;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 21 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dts b/arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dts
index 39a5345332da..e37df043d98a 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dts
@@ -60,7 +60,7 @@ usb_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 29 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dts b/arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dts
index f00325ffde07..40610e1db167 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dts
@@ -77,7 +77,7 @@ usb_power: regulator@0 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 10 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-sheevaplug-common.dtsi b/arch/arm/boot/dts/marvell/kirkwood-sheevaplug-common.dtsi
index 0a698d3b7393..76e4d97491c7 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-sheevaplug-common.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-sheevaplug-common.dtsi
@@ -64,7 +64,7 @@ usb_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 29 0>;
+			gpios = <&gpio0 29 0>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi b/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
index 6b7c5218b1fb..e7179fca80db 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-synology.dtsi
@@ -614,7 +614,7 @@ regulator@1 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 29 GPIO_ACTIVE_HIGH>;
 		};
 
 		regulator@2 {
@@ -627,7 +627,7 @@ regulator@2 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio0 31 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 31 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
@@ -649,7 +649,7 @@ regulator@1 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio0 30 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 30 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
@@ -671,7 +671,7 @@ regulator@1 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio0 30 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 30 GPIO_ACTIVE_HIGH>;
 		};
 
 		regulator@2 {
@@ -684,7 +684,7 @@ regulator@2 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
@@ -707,7 +707,7 @@ regulator@1 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio0 30 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 30 GPIO_ACTIVE_HIGH>;
 		};
 
 		regulator@2 {
@@ -720,7 +720,7 @@ regulator@2 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		};
 
 		regulator@3 {
@@ -733,7 +733,7 @@ regulator@3 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
 		};
 
 		regulator@4 {
@@ -746,7 +746,7 @@ regulator@4 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
@@ -768,7 +768,7 @@ regulator@1 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio0 31 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 31 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
@@ -791,7 +791,7 @@ regulator@2 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		};
 
 		regulator@3 {
@@ -804,7 +804,7 @@ regulator@3 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
 		};
 
 		regulator@4 {
@@ -817,7 +817,7 @@ regulator@4 {
 			regulator-always-on;
 			regulator-boot-on;
 			startup-delay-us = <5000000>;
-			gpio = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/kirkwood-t5325.dts b/arch/arm/boot/dts/marvell/kirkwood-t5325.dts
index a6e77a487d00..7163fc819675 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-t5325.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-t5325.dts
@@ -150,7 +150,7 @@ usb_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/marvell/kirkwood-topkick.dts b/arch/arm/boot/dts/marvell/kirkwood-topkick.dts
index a5b51e29f63e..024a792c42c1 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-topkick.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-topkick.dts
@@ -166,7 +166,7 @@ sata0_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio1 4 0>;
+			gpios = <&gpio1 4 0>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts b/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
index 55ea87870af3..83a4e9403be5 100644
--- a/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
+++ b/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
@@ -95,7 +95,7 @@ wlan_reg: fixedregulator0 {
 		regulator-name = "wlan";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio 34 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio 34 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
index 12a4aac2633e..3024ef765a4c 100644
--- a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
@@ -73,7 +73,7 @@ sata0_power: regulator@0 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 3 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
 		};
 
 		sata1_power: regulator@1 {
@@ -85,7 +85,7 @@ sata1_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 12 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 12 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/orion5x-lswsgl.dts b/arch/arm/boot/dts/marvell/orion5x-lswsgl.dts
index e0da406c430f..938360157f44 100644
--- a/arch/arm/boot/dts/marvell/orion5x-lswsgl.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-lswsgl.dts
@@ -144,7 +144,7 @@ sata0_power: regulator@0 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
 		};
 
 		sata1_power: regulator@1 {
@@ -156,7 +156,7 @@ sata1_power: regulator@1 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 19 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
 		};
 
 		usb_power: regulator@2 {
@@ -168,7 +168,7 @@ usb_power: regulator@2 {
 			enable-active-high;
 			regulator-always-on;
 			regulator-boot-on;
-			gpio = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/mediatek/mt2701-evb.dts b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
index 4c76366aa938..d1a4d2e3825d 100644
--- a/arch/arm/boot/dts/mediatek/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
@@ -68,7 +68,7 @@ usb_vbus: regulator@0 {
 		regulator-name = "usb_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&pio 45 GPIO_ACTIVE_HIGH>;
+		gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
index fec7269088d1..5f183f4c7839 100644
--- a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
+++ b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
@@ -110,75 +110,75 @@ gpios {
 
 		rf_on {
 			label = "rf on";
-			gpio = <&pioA PIN_PC19 GPIO_ACTIVE_HIGH>;
+			gpios = <&pioA PIN_PC19 GPIO_ACTIVE_HIGH>;
 			output;
 			init-low;
 		};
 
 		wifi_on {
 			label = "wifi on";
-			gpio = <&pioA PIN_PC20 GPIO_ACTIVE_HIGH>;
+			gpios = <&pioA PIN_PC20 GPIO_ACTIVE_HIGH>;
 			output;
 			init-low;
 		};
 
 		zbe_test_radio {
 			label = "zbe test radio";
-			gpio = <&pioA PIN_PB21 GPIO_ACTIVE_HIGH>;
+			gpios = <&pioA PIN_PB21 GPIO_ACTIVE_HIGH>;
 			output;
 			init-low;
 		};
 
 		zbe_rst {
 			label = "zbe rst";
-			gpio = <&pioA PIN_PB25 GPIO_ACTIVE_HIGH>;
+			gpios = <&pioA PIN_PB25 GPIO_ACTIVE_HIGH>;
 			output;
 			init-low;
 		};
 
 		io_reset {
 			label = "io reset";
-			gpio = <&pioA PIN_PB30 GPIO_ACTIVE_HIGH>;
+			gpios = <&pioA PIN_PB30 GPIO_ACTIVE_HIGH>;
 			output;
 			init-low;
 		};
 
 		io_test_radio {
 			label = "io test radio";
-			gpio = <&pioA PIN_PC9 GPIO_ACTIVE_HIGH>;
+			gpios = <&pioA PIN_PC9 GPIO_ACTIVE_HIGH>;
 			output;
 			init-low;
 		};
 
 		io_boot_0 {
 			label = "io boot 0";
-			gpio = <&pioA PIN_PC11 GPIO_ACTIVE_HIGH>;
+			gpios = <&pioA PIN_PC11 GPIO_ACTIVE_HIGH>;
 			output;
 			init-low;
 		};
 
 		io_boot_1 {
 			label = "io boot 1";
-			gpio = <&pioA PIN_PC17 GPIO_ACTIVE_HIGH>;
+			gpios = <&pioA PIN_PC17 GPIO_ACTIVE_HIGH>;
 			output;
 			init-low;
 		};
 
 		verbose_bootloader {
 			label = "verbose bootloader";
-			gpio = <&pioA PIN_PB11 GPIO_ACTIVE_HIGH>;
+			gpios = <&pioA PIN_PB11 GPIO_ACTIVE_HIGH>;
 			input;
 		};
 
 		 nail_bed_detection  {
 			label = "nail bed detection";
-			gpio = <&pioA PIN_PB12 GPIO_ACTIVE_HIGH>;
+			gpios = <&pioA PIN_PB12 GPIO_ACTIVE_HIGH>;
 			input;
 		};
 
 		 id_usba {
 			label = "id usba";
-			gpio = <&pioA PIN_PC0 GPIO_ACTIVE_LOW>;
+			gpios = <&pioA PIN_PC0 GPIO_ACTIVE_LOW>;
 			input;
 		};
 	};
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d3_eds.dts b/arch/arm/boot/dts/microchip/at91-sama5d3_eds.dts
index c287b03d768b..03ba2e724b83 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d3_eds.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d3_eds.dts
@@ -79,7 +79,7 @@ vcc_mmc0_reg: regulator-5 {
 		regulator-always-on;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_vcc_mmc0_reg_gpio>;
-		gpio = <&pioE 2 GPIO_ACTIVE_LOW>;
+		gpios = <&pioE 2 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dts b/arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dts
index b66570080894..17a9f77666b8 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d3_ksz9477_evb.dts
@@ -28,7 +28,7 @@ reg_vcc_mmc0: regulator-mmc0 {
 		regulator-name = "mmc0-vcc";
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
-		gpio = <&pioE 2 GPIO_ACTIVE_LOW>;
+		gpios = <&pioE 2 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts
index 820033727088..35b8c973ede3 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts
@@ -365,7 +365,7 @@ vcc_mmc0_reg: fixedregulator_mmc0 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_vcc_mmc0_reg_gpio>;
-		gpio = <&pioE 2 GPIO_ACTIVE_LOW>;
+		gpios = <&pioE 2 GPIO_ACTIVE_LOW>;
 		regulator-name = "mmc0-card-supply";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4.dtsi
index fd1086f52b40..0ff9ce658369 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4.dtsi
@@ -126,7 +126,7 @@ vcc_3v3_reg: fixedregulator_3v3 {
 
 	vcc_mmc0_reg: fixedregulator_mmc0 {
 		compatible = "regulator-fixed";
-		gpio = <&pioE 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&pioE 15 GPIO_ACTIVE_HIGH>;
 		regulator-name = "RST_n MCI0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts b/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts
index 8adf567f2f0f..20f0dd0774cc 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts
@@ -155,7 +155,7 @@ panel_input: endpoint@0 {
 
 	vcc_mmc1_reg: fixedregulator_mmc1 {
 		compatible = "regulator-fixed";
-		gpio = <&pioE 17 GPIO_ACTIVE_LOW>;
+		gpios = <&pioE 17 GPIO_ACTIVE_LOW>;
 		regulator-name = "VDD MCI1";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dts b/arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dts
index 95d701d13fef..e207e75d85de 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dts
@@ -288,7 +288,7 @@ vcc_mmc1_reg: fixedregulator_mmc1 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_vcc_mmc1_reg>;
-		gpio = <&pioE 4 GPIO_ACTIVE_LOW>;
+		gpios = <&pioE 4 GPIO_ACTIVE_LOW>;
 		regulator-name = "VDD MCI1";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/nspire/nspire-classic.dtsi b/arch/arm/boot/dts/nspire/nspire-classic.dtsi
index 0ee53d3ecd54..fc1a42af082d 100644
--- a/arch/arm/boot/dts/nspire/nspire-classic.dtsi
+++ b/arch/arm/boot/dts/nspire/nspire-classic.dtsi
@@ -51,7 +51,7 @@ &ahb_clk {
 
 
 &vbus_reg {
-	gpio = <&gpio 5 0>;
+	gpios = <&gpio 5 0>;
 };
 
 / {
diff --git a/arch/arm/boot/dts/nspire/nspire-cx.dts b/arch/arm/boot/dts/nspire/nspire-cx.dts
index debeff0ec010..aea761adf8f6 100644
--- a/arch/arm/boot/dts/nspire/nspire-cx.dts
+++ b/arch/arm/boot/dts/nspire/nspire-cx.dts
@@ -115,7 +115,7 @@ MATRIX_KEY(7, 10, 0x33)
 };
 
 &vbus_reg {
-	gpio = <&gpio 2 0>;
+	gpios = <&gpio 2 0>;
 };
 
 / {
diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index f02e2cf65fe8..905709fcf8fe 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1858,7 +1858,7 @@ dvdd_1v8_lcd: regulator-vdd-lcd {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-boot-on;
-		gpio = <&palmas_gpio 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&palmas_gpio 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_1v8_vio>;
 	};
@@ -1869,7 +1869,7 @@ vdd_3v7_bl: regulator-bl-en {
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
@@ -1880,7 +1880,7 @@ hdmi_5v0_sys: regulator-hdmi {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_smps10_out2>;
 	};
@@ -1891,7 +1891,7 @@ vdd_2v9_usd: regulator-vdd-usd {
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vcore_emmc>;
 	};
@@ -1902,7 +1902,7 @@ vdd_1v8_cam: regulator-cam-vio {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-boot-on;
-		gpio = <&palmas_gpio 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&palmas_gpio 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_1v8_vio>;
 	};
@@ -1913,7 +1913,7 @@ vdd_1v2_xusb: regulator-xusb-vio {
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
 		regulator-boot-on;
-		gpio = <&palmas_gpio 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&palmas_gpio 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -1923,7 +1923,7 @@ vdd_3v3_xusb: regulator-xusb-vdd {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-		gpio = <&palmas_gpio 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&palmas_gpio 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -1934,7 +1934,7 @@ vdd_3v3_com: regulator-com {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -1945,7 +1945,7 @@ vdd_3v3_touch: regulator-touch-pwr {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -1956,7 +1956,7 @@ vdd_1v8_touch: regulator-touch-vio {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(H, 4) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts b/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts
index c06b52fe330a..3814a3a64c2c 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts
@@ -1203,7 +1203,7 @@ dvdd_ts_reg: regulator-ts {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
 	};
 
 	usb1_vbus_reg: regulator-usb1 {
@@ -1212,7 +1212,7 @@ usb1_vbus_reg: regulator-usb1 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
 		gpio-open-drain;
 		vin-supply = <&tps65090_dcdc1_reg>;
 	};
@@ -1223,7 +1223,7 @@ usb3_vbus_reg: regulator-usb3 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
 		gpio-open-drain;
 		vin-supply = <&tps65090_dcdc1_reg>;
 	};
@@ -1242,7 +1242,7 @@ vdd_cam_1v8_reg: regulator-cam {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		enable-active-high;
-		gpio = <&palmas_gpio 6 0>;
+		gpios = <&palmas_gpio 6 0>;
 	};
 
 	vdd_5v0_hdmi: regulator-hdmicon {
@@ -1250,7 +1250,7 @@ vdd_5v0_hdmi: regulator-hdmicon {
 		regulator-name = "VDD_5V0_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&tps65090_dcdc1_reg>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra114-roth.dts b/arch/arm/boot/dts/nvidia/tegra114-roth.dts
index a89b16573b42..e66181cedf3d 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-roth.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-roth.dts
@@ -1062,7 +1062,7 @@ vdd_lcd: regulator-lcd {
 		regulator-max-microvolt = <1800000>;
 		vin-supply = <&vdd_1v8>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
 		regulator-boot-on;
 	};
 
@@ -1071,7 +1071,7 @@ regulator-1v8ts {
 		regulator-name = "vdd_1v8_ts";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_LOW>;
+		gpios = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
 	};
 
@@ -1081,7 +1081,7 @@ regulator-3v3ts {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(H, 5) GPIO_ACTIVE_HIGH>;
 		regulator-boot-on;
 	};
 
@@ -1092,7 +1092,7 @@ regulator-1v8com {
 		regulator-max-microvolt = <1800000>;
 		vin-supply = <&vdd_1v8>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
 		regulator-boot-on;
 	};
 
@@ -1103,7 +1103,7 @@ regulator-3v3com {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vdd_3v3_sys>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_HIGH>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
index bfbdb345575a..a83964b7cbcf 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
@@ -319,7 +319,7 @@ lcd_bl_en: regulator-lcden {
 		regulator-name = "VDD_LCD_BL";
 		regulator-min-microvolt = <16500000>;
 		regulator-max-microvolt = <16500000>;
-		gpio = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vs_sys>;
 		regulator-boot-on;
@@ -330,7 +330,7 @@ vdd_lcd: regulator-lcd {
 		regulator-name = "VD_LCD_1V8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&palmas_gpio 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&palmas_gpio 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_1v8>;
 		regulator-boot-on;
diff --git a/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts b/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts
index 0f3debeb294b..6b6b00e281e2 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts
@@ -239,7 +239,7 @@ reg_usbo1_vbus: regulator-usbo1-vbus {
 		regulator-name = "VCC_USBO1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_5v0>;
 	};
@@ -250,7 +250,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USBH(2A|2C|2D|3|4)";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_5v0>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts
index d13b8d25ca6a..45767a1df2c9 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts
@@ -241,7 +241,7 @@ reg_usbo1_vbus: regulator-usbo1-vbus {
 		regulator-name = "VCC_USBO1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_5v0>;
 	};
@@ -252,7 +252,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USBH(2A|2C|2D|3|4)";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(T, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(T, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_5v0>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2.dtsi
index 54b7da4b6920..3dee1a2ad1a5 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-apalis-v1.2.dtsi
@@ -1981,7 +1981,7 @@ reg_1v05_avdd_hdmi_pll: regulator-1v05-avdd-hdmi-pll {
 		regulator-name = "+V1.05_AVDD_HDMI_PLL";
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
-		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		gpios = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 		vin-supply = <&reg_1v05_vdd>;
 	};
 
@@ -2010,7 +2010,7 @@ reg_module_3v3: regulator-module-3v3 {
 		regulator-always-on;
 		regulator-boot-on;
 		/* PWR_EN_+V3.3 */
-		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_3v3_mxm>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi b/arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi
index c5a0d6aebaec..76d0566d0565 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi
@@ -1973,7 +1973,7 @@ reg_1v05_avdd_hdmi_pll: regulator-1v05-avdd-hdmi-pll {
 		regulator-name = "+V1.05_AVDD_HDMI_PLL";
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
-		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		gpios = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 		vin-supply = <&reg_1v05_vdd>;
 	};
 
@@ -2002,7 +2002,7 @@ reg_module_3v3: regulator-module-3v3 {
 		regulator-always-on;
 		regulator-boot-on;
 		/* PWR_EN_+V3.3 */
-		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_3v3_mxm>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts
index f09109be1152..81bfeeff2904 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-jetson-tk1.dts
@@ -1935,7 +1935,7 @@ vdd_3v3_run: regulator-3v3run {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -1953,7 +1953,7 @@ vdd_usb1_vbus: regulator-usb1 {
 		regulator-name = "+USB0_VBUS_SW";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_sys>;
@@ -1964,7 +1964,7 @@ vdd_usb3_vbus: regulator-usb3 {
 		regulator-name = "+5V_USB_HS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_sys>;
@@ -1977,7 +1977,7 @@ vdd_3v3_lp0: regulator-lp0 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -1987,7 +1987,7 @@ vdd_hdmi_pll: regulator-hdmipll {
 		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
-		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		gpios = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 		vin-supply = <&vdd_1v05_run>;
 	};
 
@@ -1996,7 +1996,7 @@ vdd_5v0_hdmi: regulator-hdmicon {
 		regulator-name = "+5V_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
@@ -2007,7 +2007,7 @@ vdd_5v0_sata: regulator-5v0sata {
 		regulator-name = "+5V_SATA";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(EE, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(EE, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
@@ -2017,7 +2017,7 @@ vdd_12v0_sata: regulator-12v0sata {
 		regulator-name = "+12V_SATA";
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
-		gpio = <&gpio TEGRA_GPIO(EE, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(EE, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_mux>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
index 8125c1b3e8d7..587b71ed29d9 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
@@ -679,7 +679,7 @@ vdd_3v3_run: regulator-3v3run {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -695,7 +695,7 @@ vdd_3v3_hdmi: regulator-3v3hdmi {
 	vdd_led: regulator-led {
 		compatible = "regulator-fixed";
 		regulator-name = "+VDD_LED";
-		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_mux>;
 	};
@@ -706,7 +706,7 @@ vdd_5v0_ts: regulator-ts {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
@@ -716,7 +716,7 @@ vdd_usb1_vbus: regulator-usb1 {
 		regulator-name = "+5V_USB_HS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_sys>;
@@ -727,7 +727,7 @@ vdd_usb3_vbus: regulator-usb3 {
 		regulator-name = "+5V_USB_SS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_sys>;
@@ -738,7 +738,7 @@ vdd_3v3_panel: regulator-panel {
 		regulator-name = "+3.3V_PANEL";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&pmic 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_run>;
 	};
@@ -753,7 +753,7 @@ vdd_3v3_lp0: regulator-lp0 {
 		 * controllers so that it can be enabled on demand.
 		 */
 		regulator-always-on;
-		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -763,7 +763,7 @@ vdd_hdmi_pll: regulator-hdmipll {
 		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
-		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		gpios = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 		vin-supply = <&vdd_1v05_run>;
 	};
 
@@ -772,7 +772,7 @@ vdd_5v0_hdmi: regulator-hdmicon {
 		regulator-name = "+5V_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
index df98dc2a67b8..58147f1b70c9 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
@@ -1127,7 +1127,7 @@ vdd_3v3_run: regulator-3v3run {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -1145,7 +1145,7 @@ vdd_led: regulator-led {
 		regulator-name = "+VDD_LED";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_mux>;
 	};
@@ -1156,7 +1156,7 @@ vdd_5v0_ts: regulator-ts {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
@@ -1166,7 +1166,7 @@ vdd_usb1_vbus: regulator-usb1 {
 		regulator-name = "+5V_USB_HS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_sys>;
@@ -1177,7 +1177,7 @@ vdd_usb3_vbus: regulator-usb3 {
 		regulator-name = "+5V_USB_SS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_sys>;
@@ -1188,7 +1188,7 @@ vdd_3v3_panel: regulator-panel {
 		regulator-name = "+3.3V_PANEL";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&pmic 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_run>;
 	};
@@ -1203,7 +1203,7 @@ vdd_3v3_lp0: regulator-lp0 {
 		 * controllers so that it can be enabled on demand.
 		 */
 		regulator-always-on;
-		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -1213,7 +1213,7 @@ vdd_hdmi_pll: regulator-hdmipll {
 		regulator-name = "+1.05V_RUN_AVDD_HDMI_PLL";
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
-		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		gpios = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 		vin-supply = <&vdd_1v05_run>;
 	};
 
@@ -1222,7 +1222,7 @@ vdd_5v0_hdmi: regulator-hdmicon {
 		regulator-name = "+5V_HDMI_CON";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
index a619ea83ed3b..87ddb3d2fd1a 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts
@@ -1402,7 +1402,7 @@ vdd_pnl: regulator-panel {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-enable-ramp-delay = <300000>;
-		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
index e118809dc6d9..49a2351df03a 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts
@@ -1143,7 +1143,7 @@ regulator-pcie {
 		regulator-name = "pcie_vdd";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 		regulator-always-on;
 	};
 
@@ -1152,7 +1152,7 @@ vdd_pnl_reg: regulator-panel {
 		regulator-name = "vdd_pnl";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -1172,7 +1172,7 @@ vdd_hdmi_en: regulator-hdmi {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		vin-supply = <&vdd_5v0_sys>;
-		gpio = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-colibri-eval-v3.dts b/arch/arm/boot/dts/nvidia/tegra20-colibri-eval-v3.dts
index be2ead4147f2..8ffae82596da 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-colibri-eval-v3.dts
@@ -258,7 +258,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USB[1-4]";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
 		vin-supply = <&reg_5v0>;
 	};
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra20-colibri-iris.dts b/arch/arm/boot/dts/nvidia/tegra20-colibri-iris.dts
index 1da202ad1ded..e61144f3086d 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-colibri-iris.dts
@@ -240,7 +240,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USB1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
 		vin-supply = <&reg_5v0>;
 	};
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi b/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi
index 2ff7be8f1382..f4da5408db3e 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20-colibri.dtsi
@@ -748,7 +748,7 @@ reg_lan_v_bus: regulator-lan-v-bus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(BB, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(BB, 1) GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_module_3v3: regulator-module-3v3 {
diff --git a/arch/arm/boot/dts/nvidia/tegra20-harmony.dts b/arch/arm/boot/dts/nvidia/tegra20-harmony.dts
index 5c31a6c8dabe..79a4370cfc7d 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-harmony.dts
@@ -680,7 +680,7 @@ regulator-1v5 {
 		regulator-name = "vdd_1v5";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 	};
 
 	regulator-1v2 {
@@ -688,7 +688,7 @@ regulator-1v2 {
 		regulator-name = "vdd_1v2";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -697,7 +697,7 @@ pci_vdd_reg: regulator-1v05 {
 		regulator-name = "vdd_1v05";
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
-		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -706,7 +706,7 @@ vdd_pnl_reg: regulator-pn1 {
 		regulator-name = "vdd_pnl";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -715,7 +715,7 @@ vdd_bl_reg: regulator-bl {
 		regulator-name = "vdd_bl";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -724,7 +724,7 @@ vdd_5v0_hdmi: regulator-hdmi {
 		regulator-name = "VDDIO_HDMI";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(T, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(T, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_reg>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
index 1408e1e00759..d6005de85189 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
@@ -702,7 +702,7 @@ vdd_pnl_reg: regulator-3v0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(A, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(A, 4) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra20-seaboard.dts b/arch/arm/boot/dts/nvidia/tegra20-seaboard.dts
index e944ae9b86c2..3943ec37bd51 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-seaboard.dts
@@ -842,7 +842,7 @@ regulator-1v5 {
 		regulator-name = "vdd_1v5";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 	};
 
 	regulator-1v2 {
@@ -850,7 +850,7 @@ regulator-1v2 {
 		regulator-name = "vdd_1v2";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -860,7 +860,7 @@ vbus_reg: regulator-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(D, 0) 0>;
+		gpios = <&gpio TEGRA_GPIO(D, 0) 0>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
@@ -870,7 +870,7 @@ vdd_pnl_reg: regulator-pnl {
 		regulator-name = "vdd_pnl";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -879,7 +879,7 @@ vdd_bl_reg: regulator-bl {
 		regulator-name = "vdd_bl";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -888,7 +888,7 @@ vdd_hdmi: regulator-hdmi {
 		regulator-name = "VDDIO_HDMI";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(V, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_reg>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra20-tamonten.dtsi b/arch/arm/boot/dts/nvidia/tegra20-tamonten.dtsi
index 5c214dd060bb..b443fbd2e971 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-tamonten.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20-tamonten.dtsi
@@ -516,7 +516,7 @@ pci_vdd_reg: regulator-1v05 {
 		regulator-name = "vdd_1v05";
 		regulator-min-microvolt = <1050000>;
 		regulator-max-microvolt = <1050000>;
-		gpio = <&pmic 2 0>;
+		gpios = <&pmic 2 0>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts b/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts
index 4caeeb9f1e1d..9438f05310c4 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-trimslice.dts
@@ -455,7 +455,7 @@ vbus_reg: regulator-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(V, 2) 0>;
+		gpios = <&gpio TEGRA_GPIO(V, 2) 0>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra20-ventana.dts b/arch/arm/boot/dts/nvidia/tegra20-ventana.dts
index f3273941437c..ff627c6781e5 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-ventana.dts
@@ -661,7 +661,7 @@ regulator-1v5 {
 		regulator-name = "vdd_1v5";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 	};
 
 	regulator-1v2 {
@@ -669,7 +669,7 @@ regulator-1v2 {
 		regulator-name = "vdd_1v2";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -678,7 +678,7 @@ vdd_pnl_reg: regulator-pnl {
 		regulator-name = "vdd_pnl";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -687,7 +687,7 @@ vdd_bl_reg: regulator-bl {
 		regulator-name = "vdd_bl";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts b/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts
index fc284155cd76..447c047071c8 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts
@@ -232,7 +232,7 @@ reg_usbo1_vbus: regulator-usbo1-vbus {
 		regulator-name = "VCC_USBO1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_5v0>;
 	};
@@ -243,7 +243,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USBH(2A|2C|2D|3|4)";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_5v0>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts
index 9d08e2b094b4..c1300cfe7853 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts
@@ -233,7 +233,7 @@ reg_usbo1_vbus: regulator-usbo1-vbus {
 		regulator-name = "VCC_USBO1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_5v0>;
 	};
@@ -244,7 +244,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USBH(2A|2C|2D|3|4)";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_5v0>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi
index ff0d684622f7..041475011174 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi
@@ -1142,7 +1142,7 @@ reg_1v8_avdd_hdmi_pll: regulator-1v8-avdd-hdmi-pll {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_1v8_vio>;
 	};
 
@@ -1152,7 +1152,7 @@ reg_3v3_avdd_hdmi: regulator-3v3-avdd-hdmi {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_module_3v3>;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi b/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi
index d38f1dd38a90..ac4fc3d0c82c 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi
@@ -1125,7 +1125,7 @@ reg_1v8_avdd_hdmi_pll: regulator-1v8-avdd-hdmi-pll {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_1v8_vio>;
 	};
 
@@ -1135,7 +1135,7 @@ reg_3v3_avdd_hdmi: regulator-3v3-avdd-hdmi {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_module_3v3>;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
index 15f53babdc21..cfec282b30db 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1188,7 +1188,7 @@ vdd_pnl: regulator-panel {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-enable-ramp-delay = <300000>;
-		gpio = <&gpio TEGRA_GPIO(W, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(W, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
index 694c7fe37eb8..f71563451688 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
@@ -167,7 +167,7 @@ ldo8 {
 	};
 
 	vdd_3v3_sys: regulator-3v3 {
-		gpio = <&pmic 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -178,7 +178,7 @@ regulator-usb {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-ti-pmic.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
index ee4a3f482769..a5b359522488 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
@@ -144,7 +144,7 @@ vdd_core: core-regulator@60 {
 	};
 
 	vdd_3v3_sys: regulator-3v3 {
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts
index 9c480fde2e76..73d6716947a4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts
@@ -816,7 +816,7 @@ vdd_1v2_mipi: regulator-mipi {
 		regulator-max-microvolt = <1200000>;
 		regulator-enable-ramp-delay = <10000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(BB, 3) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index ead95306840f..b76a3f5d7ad8 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -1588,7 +1588,7 @@ vdd_5v0_cp: regulator-sby {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_bat>;
 	};
@@ -1600,7 +1600,7 @@ vdd_5v0_sys: regulator-5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pmic 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_bat>;
 	};
@@ -1612,7 +1612,7 @@ vdd_1v5_ddr: regulator-ddr {
 		regulator-max-microvolt = <1500000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_bat>;
 	};
@@ -1624,7 +1624,7 @@ vdd_3v3_sys: regulator-3v {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_bat>;
 	};
@@ -1635,7 +1635,7 @@ vdd_pnl: regulator-panel {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-enable-ramp-delay = <20000>;
-		gpio = <&gpio TEGRA_GPIO(W, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(W, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -1646,7 +1646,7 @@ vdd_3v3_com: regulator-com {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
-		gpio = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -1657,7 +1657,7 @@ vdd_5v0_bl: regulator-bl {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_bat>;
 	};
@@ -1667,7 +1667,7 @@ hdmi_5v0_sys: regulator-hdmi {
 		regulator-name = "hdmi_5v0_sys";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra30-beaver.dts b/arch/arm/boot/dts/nvidia/tegra30-beaver.dts
index 1d74179dde79..d80a69750d2b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-beaver.dts
@@ -2027,7 +2027,7 @@ chargepump_5v_reg: regulator-chargepump {
 		regulator-boot-on;
 		regulator-always-on;
 		enable-active-high;
-		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 	};
 
 	ddr_reg: regulator-ddr {
@@ -2038,7 +2038,7 @@ ddr_reg: regulator-ddr {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 7 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&vdd_5v_in_reg>;
 	};
 
@@ -2050,7 +2050,7 @@ vdd_5v_sata_reg: regulator-sata {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&vdd_5v_in_reg>;
 	};
 
@@ -2060,7 +2060,7 @@ usb1_vbus_reg: regulator-usb1 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(DD, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 6) GPIO_ACTIVE_HIGH>;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v_in_reg>;
 	};
@@ -2071,7 +2071,7 @@ usb3_vbus_reg: regulator-usb3 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v_in_reg>;
 	};
@@ -2084,7 +2084,7 @@ sys_3v3_reg: regulator-3v3 {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&vdd_5v_in_reg>;
 	};
 
@@ -2096,7 +2096,7 @@ sys_3v3_pexs_reg: regulator-pexs {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dts b/arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dts
index 247185314f46..fb47ed49cac3 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-cardhu-a02.dts
@@ -24,7 +24,7 @@ ddr_reg: regulator-ddr {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 	};
 
 	sys_3v3_reg: regulator-3v3 {
@@ -35,7 +35,7 @@ sys_3v3_reg: regulator-3v3 {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 7 GPIO_ACTIVE_HIGH>;
 	};
 
 	usb1_vbus_reg: regulator-usb1 {
@@ -44,7 +44,7 @@ usb1_vbus_reg: regulator-usb1 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(I, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(I, 4) GPIO_ACTIVE_HIGH>;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_reg>;
 	};
@@ -55,7 +55,7 @@ usb3_vbus_reg: regulator-usb3 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_reg>;
 	};
@@ -66,7 +66,7 @@ vdd_5v0_reg: regulator-5v0 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&pmic 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 2 GPIO_ACTIVE_HIGH>;
 	};
 
 	vdd_bl_reg: regulator-bl {
@@ -77,7 +77,7 @@ vdd_bl_reg: regulator-bl {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dts b/arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dts
index 2911f08863a0..c724152bf377 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-cardhu-a04.dts
@@ -24,7 +24,7 @@ ddr_reg: regulator-ddr {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 7 GPIO_ACTIVE_HIGH>;
 	};
 
 	sys_3v3_reg: regulator-3v3 {
@@ -35,7 +35,7 @@ sys_3v3_reg: regulator-3v3 {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 	};
 
 	usb1_vbus_reg: regulator-usb1 {
@@ -44,7 +44,7 @@ usb1_vbus_reg: regulator-usb1 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(DD, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 6) GPIO_ACTIVE_HIGH>;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_reg>;
 	};
@@ -55,7 +55,7 @@ usb3_vbus_reg: regulator-usb3 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_reg>;
 	};
@@ -66,7 +66,7 @@ vdd_5v0_reg: regulator-5v0 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&pmic 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 8 GPIO_ACTIVE_HIGH>;
 	};
 
 	vdd_bl_reg: regulator-bl {
@@ -77,7 +77,7 @@ vdd_bl_reg: regulator-bl {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(DD, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 2) GPIO_ACTIVE_HIGH>;
 	};
 
 	vdd_bl2_reg: regulator-bl2 {
@@ -88,6 +88,6 @@ vdd_bl2_reg: regulator-bl2 {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
 	};
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi b/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi
index 0120859d6d72..c6b9c2982ae3 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-cardhu.dtsi
@@ -522,7 +522,7 @@ cam_1v8_reg: regulator-cam {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(BB, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(BB, 4) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&vio_reg>;
 	};
 
@@ -534,7 +534,7 @@ cp_5v_reg: regulator-5v0cp {
 		regulator-boot-on;
 		regulator-always-on;
 		enable-active-high;
-		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 	};
 
 	emmc_3v3_reg: regulator-emmc {
@@ -545,7 +545,7 @@ emmc_3v3_reg: regulator-emmc {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 	};
 
@@ -555,7 +555,7 @@ modem_3v3_reg: regulator-modem {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
 	};
 
 	pex_hvdd_3v3_reg: regulator-pex {
@@ -564,7 +564,7 @@ pex_hvdd_3v3_reg: regulator-pex {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(L, 7) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 	};
 
@@ -574,7 +574,7 @@ vdd_cam1_ldo_reg: regulator-cam1 {
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 	};
 
@@ -584,7 +584,7 @@ vdd_cam2_ldo_reg: regulator-cam2 {
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 	};
 
@@ -594,7 +594,7 @@ vdd_cam3_ldo_reg: regulator-cam3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 	};
 
@@ -606,7 +606,7 @@ vdd_com_reg: regulator-com {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 	};
 
@@ -616,7 +616,7 @@ vdd_fuse_3v3_reg: regulator-fuse {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(L, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(L, 6) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 	};
 
@@ -628,7 +628,7 @@ vdd_pnl1_reg: regulator-pnl1 {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 	};
 
@@ -638,7 +638,7 @@ vdd_vid_reg: regulator-vid {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(T, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(T, 0) GPIO_ACTIVE_HIGH>;
 		gpio-open-drain;
 		vin-supply = <&vdd_5v0_reg>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dts
index 1990bf8e122d..2a3797e00014 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-colibri-eval-v3.dts
@@ -194,7 +194,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USB[1-4]";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		gpios = <&gpio TEGRA_GPIO(W, 2) GPIO_ACTIVE_LOW>;
 		vin-supply = <&reg_5v0>;
 	};
 };
diff --git a/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi b/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi
index 81c8a5fd92cc..a12adad63c2d 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi
@@ -994,7 +994,7 @@ reg_1v8_avdd_hdmi_pll: regulator-1v8-avdd-hdmi-pll {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_1v8_vio>;
 	};
 
@@ -1004,7 +1004,7 @@ reg_3v3_avdd_hdmi: regulator-3v3-avdd-hdmi {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&reg_module_3v3>;
 	};
 
@@ -1022,7 +1022,7 @@ reg_lan_v_bus: regulator-lan-v-bus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(DD, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 2) GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_module_3v3: regulator-module-3v3 {
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index e32fafc7f5e0..61bc44d9c4f4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -482,7 +482,7 @@ led-power {
 	};
 
 	regulator-lcd3v {
-		gpio = <&gpio TEGRA_GPIO(BB, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(BB, 0) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 909260a5d0fb..23915a5c32d9 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1590,7 +1590,7 @@ vdd_3v0_sen: regulator-sen3v {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_vbat>;
 	};
@@ -1601,7 +1601,7 @@ vdd_3v0_proxi: regulator-proxi {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(X, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_vbat>;
 	};
@@ -1612,7 +1612,7 @@ vdd_1v8_sen: regulator-sen1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(D, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(D, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_vbat>;
 	};
@@ -1632,7 +1632,7 @@ iovcc_1v8_lcd: regulator-lcd1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(Y, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(Y, 0) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_vbat>;
 	};
@@ -1643,7 +1643,7 @@ vio_1v8_mhl: regulator-mhl1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_vbat>;
 	};
@@ -1654,7 +1654,7 @@ vdd_3v0_touch: regulator-touchpwr {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(Q, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(Q, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_vbat>;
 	};
@@ -1665,7 +1665,7 @@ vdd_1v8_touch: regulator-touchvio {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_vbat>;
 	};
@@ -1676,7 +1676,7 @@ vcc_1v8_gps: regulator-gps {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(Y, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(Y, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_vbat>;
 	};
@@ -1686,7 +1686,7 @@ vio_1v8_front: regulator-frontvio {
 		regulator-name = "vt_1v8_cam_vio";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio TEGRA_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_vbat>;
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra30-ouya.dts b/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
index 7e3de26ca960..8c0f9f66d438 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-ouya.dts
@@ -4674,7 +4674,7 @@ sdmmc_3v3_reg: regulator-sdmmc-3v3 {
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		regulator-always-on;
-		gpio = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 	};
 
@@ -4684,7 +4684,7 @@ vdd_fuse_3v3_reg: regulator-vdd-fuse-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(L, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(L, 6) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&sys_3v3_reg>;
 		regulator-always-on;
 	};
@@ -4695,7 +4695,7 @@ vdd_vid_reg: regulator-vdd-vid {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(T, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(T, 0) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&vdd_5v0_reg>;
 		regulator-boot-on;
 	};
@@ -4707,7 +4707,7 @@ ddr_reg: regulator-ddr {
 		regulator-max-microvolt = <1500000>;
 		regulator-always-on;
 		enable-active-high;
-		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 7 GPIO_ACTIVE_HIGH>;
 		regulator-boot-on;
 		vin-supply = <&vdd_12v_in>;
 	};
@@ -4718,7 +4718,7 @@ sys_3v3_reg: regulator-sys-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&vdd_12v_in>;
@@ -4730,7 +4730,7 @@ vdd_5v0_reg: regulator-vdd-5v0 {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&vdd_12v_in>;
@@ -4740,7 +4740,7 @@ vdd_smsc: regulator-vdd-smsc {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_smsc";
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(DD, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 5) GPIO_ACTIVE_HIGH>;
 	};
 
 	usb3_vbus_reg: regulator-usb3-vbus {
@@ -4749,7 +4749,7 @@ usb3_vbus_reg: regulator-usb3-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 4) GPIO_ACTIVE_HIGH>;
 		vin-supply = <&vdd_5v0_reg>;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
index 4012f9c799a8..dd6deb0e86df 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
@@ -1454,7 +1454,7 @@ vdd_pnl: regulator-panel {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-enable-ramp-delay = <300000>;
-		gpio = <&gpio TEGRA_GPIO(W, 1) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(W, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -1464,7 +1464,7 @@ vdd_3v3_sen: regulator-sensors {
 		regulator-name = "sen_3v3_en";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_3v3_sys>;
 	};
@@ -1475,7 +1475,7 @@ vdd_5v0_bl: regulator-bl {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
@@ -1485,7 +1485,7 @@ hdmi_5v0_sys: regulator-hdmi {
 		regulator-name = "hdmi_5v0_sys";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
@@ -1495,7 +1495,7 @@ vdd_vbus_usb1: regulator-usb1 {
 		regulator-name = "vdd_vbus_micro_usb";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(DD, 3) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(DD, 3) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
@@ -1505,7 +1505,7 @@ vdd_vbus_usb3: regulator-usb3 {
 		regulator-name = "vdd_vbus_typea_usb";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio TEGRA_GPIO(CC, 6) GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio TEGRA_GPIO(CC, 6) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&vdd_5v0_sys>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
index 0029c12f16c8..d601826737a2 100644
--- a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
@@ -62,7 +62,7 @@ reg_wifi: regulator-wifi {
 		regulator-name = "SD3_SPWR";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
index dcc3c9d488a8..f5d9578cdb4c 100644
--- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
@@ -74,7 +74,7 @@ reg_wifi: regulator-wifi {
 		regulator-name = "SD3_SPWR";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
index 6cddb2cc36fe..3562ed4e9091 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts
@@ -37,7 +37,7 @@ reg_lcd_3v3: regulator-0 {
 		regulator-name = "lcd-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts b/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
index 458b94d3d4ed..00607a17fffc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
@@ -19,7 +19,7 @@ reg_fec_phy: regulator-0 {
 		regulator-name = "fec-phy";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 9 0>;
+		gpios = <&gpio4 9 0>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts b/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
index dd176fb54e58..8b55306cdbfb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
@@ -21,7 +21,7 @@ reg_fec_3v3: regulator-0 {
 		regulator-name = "fec-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 3 0>;
+		gpios = <&gpio2 3 0>;
 		enable-active-high;
 	};
 
@@ -44,7 +44,7 @@ reg_can_3v3: regulator-3 {
 		regulator-name = "can-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 6 0>;
+		gpios = <&gpio4 6 0>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
index d78793601306..02fe4de256f8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
@@ -61,7 +61,7 @@ reg_lcd: regulator-0 {
 		regulator-name = "LCD";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 25 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
index b8048e12e3d9..c739f2d16205 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts
@@ -44,7 +44,7 @@ regulator-2 {
 		regulator-name = "CSI_EN";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
 		regulator-always-on;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts b/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
index f4a47e8348b2..86f929f4da77 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
@@ -180,7 +180,7 @@ reg_hub_reset: regulator-hub-reset {
 		regulator-name = "hub_reset";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dts
index aff380e999c7..10c1bb0bf102 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dts
@@ -50,7 +50,7 @@ reg_can: regulator-can {
 		regulator-name = "CAN_RST";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <20000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
index 079bd3d14999..3ea72aa678c4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
@@ -39,7 +39,7 @@ backlight_reg: regulator-backlight {
 		regulator-name = "enable_lcd_reg";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
index 625f9ac671ae..0d702d9c7348 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts
@@ -30,7 +30,7 @@ usb_vbus: regulator-usb-vbus {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usb_mmc_reset>;
-		gpio = <&gpio3 13 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <150000>;
 		regulator-name = "usb_vbus";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
index 19a3b142c964..5859c6451c94 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-scu3-esb.dts
@@ -30,7 +30,7 @@ usb_vbus: regulator-usb-vbus {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usb_mmc_reset>;
-		gpio = <&gpio4 19 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <150000>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts b/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts
index 0814f5665a59..19498bd09527 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts
@@ -125,7 +125,7 @@ reg_usb_vbus: regulator-vbus {
 		regulator-name = "usb_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio7 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts b/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts
index ba0c62994f75..87117f190ddb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts
@@ -70,7 +70,7 @@ reg_usbh1_vbus: regulator-usbh1-vbus {
 		regulator-name = "vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 2 0>;
+		gpios = <&gpio1 2 0>;
 	};
 
 	reg_usb_otg_vbus: regulator-usb-otg-vbus {
@@ -78,7 +78,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 4 0>;
+		gpios = <&gpio1 4 0>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
index 558751e730f3..7f7fd3e9e217 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
@@ -103,7 +103,7 @@ reg_usbh1_vbus: regulator-usbh1-vbus {
 		regulator-name = "vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 2 0>;
+		gpios = <&gpio1 2 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
index 0d336cbdb451..08bcba19d628 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
@@ -41,7 +41,7 @@ display1_in: endpoint {
 	reg_backlight: regulator-backlight {
 		compatible = "regulator-fixed";
 		regulator-name = "lcd-supply";
-		gpio = <&gpio2 5 0>;
+		gpios = <&gpio2 5 0>;
 		startup-delay-us = <5000>;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts b/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
index e939acc1c88b..e2347e29c9d3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-ppd.dts
@@ -104,7 +104,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		pinctrl-0 = <&pinctrl_usb_otg_vbus>;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -123,7 +123,7 @@ reg_usbh2_vbus: regulator-usbh2-vbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbh2_vbus>;
-		gpio = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -134,7 +134,7 @@ reg_usbh3_vbus: regulator-usbh3-vbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbh3_vbus>;
-		gpio = <&gpio5 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
index 05d7a462ea25..d213c110d761 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
@@ -112,7 +112,7 @@ reg_usb_vbus: regulator-usb-vbus {
 		regulator-name = "usb_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio7 8 0>;
+		gpios = <&gpio7 8 0>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
index 1a00d290092a..15c2c8dd6732 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
@@ -34,7 +34,7 @@ reg_usb1_vbus: regulator-usb-vbus {
 		regulator-name = "usb_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -43,7 +43,7 @@ reg_usb_otg_vbus: regulator-otg-vbus {
 		regulator-name = "usb_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio2 24 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts b/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts
index a02d77bb5672..88aa541e675c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts
@@ -206,7 +206,7 @@ reg_lcd_pwr: regulator-lcd-pwr {
 		regulator-name = "LCD POWER";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 	};
@@ -216,7 +216,7 @@ reg_lcd_reset: regulator-lcd-reset {
 		regulator-name = "LCD RESET";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts b/arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts
index e10c179dbdb3..9610d733f115 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts
@@ -104,7 +104,7 @@ reg_lcd_pwr0: regulator-lvds0-pwr {
 		regulator-name = "LVDS0 POWER";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 	};
@@ -114,7 +114,7 @@ reg_lcd_pwr1: regulator-lvds1-pwr {
 		regulator-name = "LVDS1 POWER";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi
index a439a47fb65a..fbd9264b4f93 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi
@@ -122,7 +122,7 @@ reg_can_xcvr: regulator-can-xcvr {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_can_xcvr>;
-		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 21 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_usbh1_vbus: regulator-usbh1-vbus {
@@ -132,7 +132,7 @@ reg_usbh1_vbus: regulator-usbh1-vbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbh1_vbus>;
-		gpio = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -143,7 +143,7 @@ reg_usbotg_vbus: regulator-usbotg-vbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbotg_vbus>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
index c0622cf7188c..53628f70f6cf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi
@@ -28,7 +28,7 @@ reg_usb_vbus: regulator-usb-vbus {
 		regulator-name = "usb_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 31 0>; /* PEN */
+		gpios = <&gpio3 31 0>; /* PEN */
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
index d477a937b47a..034c325f9770 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
@@ -76,7 +76,7 @@ reg_usb_otg_vbus: regulator-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -87,7 +87,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
@@ -99,7 +99,7 @@ reg_3v3: regulator-3v3 {
 		regulator-name = "reg_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 		regulator-always-on;
@@ -112,7 +112,7 @@ reg_enet: regulator-ethernet {
 		regulator-name = "ethernet-supply";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 		vin-supply = <&sw4_reg>;
@@ -125,7 +125,7 @@ reg_audio: regulator-audio {
 		regulator-name = "3v3_aud";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_3v3>;
 	};
@@ -137,7 +137,7 @@ reg_hdmi: regulator-hdmi {
 		regulator-name = "hdmi-supply";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 20 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_3v3>;
 	};
@@ -147,7 +147,7 @@ reg_uart3: regulator-uart3 {
 		pinctrl-0 = <&pinctrl_reg_uart3>;
 		compatible = "regulator-fixed";
 		regulator-name = "uart3-supply";
-		gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 		vin-supply = <&reg_3v3>;
@@ -158,7 +158,7 @@ reg_1v8: regulator-1v8 {
 		pinctrl-0 = <&pinctrl_reg_1v8>;
 		compatible = "regulator-fixed";
 		regulator-name = "1v8-supply";
-		gpio = <&gpio3 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 30 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 		vin-supply = <&reg_3v3>;
@@ -171,7 +171,7 @@ reg_pcie: regulator-pcie {
 		regulator-name = "mpcie_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -182,7 +182,7 @@ reg_mipi: regulator-mipi {
 		regulator-name = "mipi_pwr_en";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpio3 19 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
index 547fb141ec0c..2eec0ac5e9e8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
@@ -20,7 +20,7 @@ reg_wl18xx_vmmc: regulator-wl18xx {
 		regulator-name = "vwl1837";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio7 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts
index 4989e8d069a1..0a782052926a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts
@@ -119,7 +119,7 @@ reg_h1_vbus: regulator-h1-vbus {
 		regulator-name = "h1-vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -128,7 +128,7 @@ reg_otg_vbus: regulator-otg-vbus {
 		regulator-name = "otg-vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi
index 9f1655540cb9..799065b6e3b8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi
@@ -80,7 +80,7 @@ reg_5v0_audio: regulator-5v0-audio {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&reg_5v>;
-		gpio = <&tca6424a 16 GPIO_ACTIVE_HIGH>;
+		gpios = <&tca6424a 16 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		/*
 		 * This must be always-on for da7212, which has some not
@@ -99,7 +99,7 @@ reg_3v3_audio: regulator-3v3-audio {
 		vin-supply = <&reg_3v3>;
 		pinctrl-0 = <&pinctrl_q7_hda_reset>;
 		pinctrl-names = "default";
-		gpio = <&gpio6 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -121,7 +121,7 @@ reg_wlan: regulator-wlan {
 		vin-supply = <&reg_3v3>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_q7_sdio_power>;
-		gpio = <&gpio4 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		startup-delay-us = <70000>;
 	};
@@ -134,7 +134,7 @@ reg_bl: regulator-backlight {
 		vin-supply = <&reg_syspwr>;
 		pinctrl-0 = <&pinctrl_q7_lcd_power>;
 		pinctrl-names = "default";
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-iris-v2.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-iris-v2.dts
index 3a6d3889760d..3d44ffe9413d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-iris-v2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-iris-v2.dts
@@ -19,7 +19,7 @@ reg_3v3_vmmc: regulator-3v3-vmmc {
 		regulator-name = "3v3_vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <100>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
index 33825b5a8f26..d9e35270c695 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
@@ -38,7 +38,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts
index 7c62db91173b..9ff275acc1dd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts
@@ -85,7 +85,7 @@ reg_otg_vbus: regulator-otg-vbus {
 		regulator-name = "otg-vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
index 72ee236d2f5e..8a4a71ad2f3b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
@@ -71,7 +71,7 @@ reg_lcd_3v3: regulator-lcd-dvdd {
 		regulator-name = "lcd-dvdd";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 1 0>;
+		gpios = <&gpio3 1 0>;
 		enable-active-high;
 		startup-delay-us = <21000>;
 	};
@@ -81,7 +81,7 @@ reg_lcd_power: regulator-lcd-power {
 		regulator-name = "lcd-enable";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 6 0>;
+		gpios = <&gpio3 6 0>;
 		enable-active-high;
 		vin-supply = <&reg_lcd_3v3>;
 	};
@@ -91,7 +91,7 @@ reg_lcd_vgl: regulator-lcd-vgl {
 		regulator-name = "lcd-vgl";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <6000>;
 		enable-active-high;
 		vin-supply = <&reg_lcd_power>;
@@ -102,7 +102,7 @@ reg_lcd_vgh: regulator-lcd-vgh {
 		regulator-name = "lcd-vgh";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <6000>;
 		enable-active-high;
 		vin-supply = <&reg_lcd_avdd>;
@@ -113,7 +113,7 @@ reg_lcd_vcom: regulator-lcd-vcom {
 		regulator-name = "lcd-vcom";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 14 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 14 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <11000>;
 		enable-active-high;
 		vin-supply = <&reg_lcd_vgh>;
@@ -124,7 +124,7 @@ reg_lcd_lr: regulator-lcd-lr {
 		regulator-name = "lcd-lr";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_lcd_vcom>;
 	};
@@ -134,7 +134,7 @@ reg_lcd_avdd: regulator-lcd-avdd {
 		regulator-name = "lcd-avdd";
 		regulator-min-microvolt = <10280000>;
 		regulator-max-microvolt = <10280000>;
-		gpio = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <6000>;
 		enable-active-high;
 		vin-supply = <&reg_lcd_vgl>;
@@ -147,7 +147,7 @@ reg_usb_host: regulator-usb-vbus {
 		pinctrl-0 = <&pinctrl_usbhost>;
 		regulator-min-microvolt = <50000000>;
 		regulator-max-microvolt = <50000000>;
-		gpio = <&gpio6 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -158,7 +158,7 @@ reg_wl18xx_vmmc:  regulator-wl18xx-vmcc {
 		pinctrl-0 = <&pinctrl_wlan>;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio6 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 21 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
index 773a84a5739d..be20bbbc440f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
@@ -215,7 +215,7 @@ reg_h1_vbus: regulator-h1-vbus {
 		regulator-name = "h1-vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -224,7 +224,7 @@ reg_otg_vbus: regulator-otg-vbus {
 		regulator-name = "otg-vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
index 568e98cb62aa..f5fed2e2914c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
@@ -196,7 +196,7 @@ reg_bl_12v0: regulator-bl-12v0 {
 		regulator-name = "bl-12v0";
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts
index 114739d10447..f293d75ec415 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts
@@ -71,7 +71,7 @@ reg_usb_otg_vbus: regulator-usbotgvbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-sielaff.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-sielaff.dts
index 7de8d5f26518..fbb3d6a3bfe6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-sielaff.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-sielaff.dts
@@ -117,7 +117,7 @@ reg_backlight: regulator-backlight {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_backlight>;
 		enable-active-high;
-		gpio = <&gpio1 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
 		regulator-name = "backlight";
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
@@ -128,7 +128,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_usbotg_vbus>;
 		enable-active-high;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
index c32ea040fecd..680841adb12f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
@@ -72,7 +72,7 @@ reg_pcie: regulator-pcie {
 		regulator-name = "MPCIE_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 19 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		status = "disabled";
 	};
@@ -84,7 +84,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		status = "disabled";
 	};
@@ -96,7 +96,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
index bcf4d9c870ec..8ebf1603cf69 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi
@@ -86,7 +86,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		status = "disabled";
 	};
@@ -98,7 +98,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dts
index 15d4a98ee976..fbca21fea5dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dts
@@ -15,7 +15,7 @@ / {
 	reg_3v3_mmc: regulator-3v3-mmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 0 GPIO_ACTIVE_HIGH>;
 		off-on-delay-us = <100000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_enable_3v3_mmc>;
@@ -28,7 +28,7 @@ reg_3v3_mmc: regulator-3v3-mmc {
 	reg_3v3_sd: regulator-3v3-sd {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
 		off-on-delay-us = <100000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_enable_3v3_sd>;
@@ -41,7 +41,7 @@ reg_3v3_sd: regulator-3v3-sd {
 	reg_can1: regulator-can1 {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_enable_can1_power>;
 		regulator-name = "5V_SW_CAN1";
@@ -51,7 +51,7 @@ reg_can1: regulator-can1 {
 	reg_can2: regulator-can2 {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_enable_can2_power>;
 		regulator-name = "5V_SW_CAN2";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts
index e1077e2da5f4..a06de8d064e5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts
@@ -17,7 +17,7 @@ / {
 	reg_pcie_switch: regulator-pcie-switch {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		regulator-max-microvolt = <1800000>;
 		regulator-min-microvolt = <1800000>;
 		regulator-name = "pcie_switch";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a4501620..a664d787ea61 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -60,7 +60,7 @@ led5-red {
 	reg_3v3_vmmc: regulator-3v3-vmmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_enable_3v3_vmmc>;
 		regulator-max-microvolt = <3300000>;
@@ -72,7 +72,7 @@ reg_3v3_vmmc: regulator-3v3-vmmc {
 	reg_can1_supply: regulator-can1-supply {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_enable_can1_power>;
 		regulator-name = "can1_supply";
@@ -82,7 +82,7 @@ reg_can1_supply: regulator-can1-supply {
 	reg_can2_supply: regulator-can2-supply {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_enable_can2_power>;
 		regulator-name = "can2_supply";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-arm2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-arm2.dts
index 631d6d690959..6de1e1be735c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-arm2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-arm2.dts
@@ -30,7 +30,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 0>;
+		gpios = <&gpio3 22 0>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
index 09d9ca0cb332..1351c5de3893 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi
@@ -108,7 +108,7 @@ reg_lvds: regulator-lvds {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -125,7 +125,7 @@ reg_usb_otg_vbus: regulator-usbotgvbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		pinctrl-0 = <&pinctrl_usbotg_vbus>;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts b/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
index d3f14b4d3b51..5a335319fe39 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
@@ -196,7 +196,7 @@ reg_lcd: regulator-lcd {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_lcd_enable>;
-		gpio = <&gpio3 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index c1ae7c47b442..8d9c59934f32 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -60,7 +60,7 @@ reg_wl18xx_vmmc: regulator-wl18xx {
 		regulator-name = "vwl1807";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&pca9539 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&pca9539 3 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
@@ -72,7 +72,7 @@ reg_wlan: regulator-wlan {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio6 14 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
index 299106fbe51c..b4854a0f01ce 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
@@ -78,7 +78,7 @@ reg_pcie_power_on_gpio: regulator-pcie-power-on-gpio {
 		regulator-name = "regulator-pcie-power-on-gpio";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 24 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_usb_h1_vbus: usb_h1_vbus {
@@ -86,7 +86,7 @@ reg_usb_h1_vbus: usb_h1_vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio7 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -95,7 +95,7 @@ reg_usb_otg_vbus: usb_otg_vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
index 4ab31f2217cd..ca0dca6344ac 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi
@@ -96,13 +96,13 @@ reg_lvds: regulator-lvds {
 		regulator-always-on;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_lvds>;
-		gpio = <&gpio5 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 13 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
 	reg_usbh1_vbus: usb-h1-vbus {
 		compatible = "regulator-fixed";
-		gpio = <&gpio3 31 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbh1_vbus>;
 		regulator-name = "usb_h1_vbus";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
index 9f7ac7158c46..14cc35d185b6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts
@@ -41,7 +41,7 @@ reg_usb_otg_switch: regulator-usb-otg-switch {
 		regulator-name = "usb_otg_switch";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio7 12 0>;
+		gpios = <&gpio7 12 0>;
 		regulator-boot-on;
 		regulator-always-on;
 	};
@@ -51,7 +51,7 @@ reg_usb_host1: regulator-usb-host1 {
 		regulator-name = "usb_host1_en";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 31 0>;
+		gpios = <&gpio3 31 0>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts b/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts
index d2d0a82ea178..08810a21efab 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts
@@ -16,7 +16,7 @@ reg_usb_otg_vbus: regulator-usbotgvbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbotgvbus>;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts b/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
index 78d941fef5df..d91d2b0598c8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-evi.dts
@@ -64,7 +64,7 @@ reg_usbh1_vbus: regulator-usbhubreset {
 		startup-delay-us = <2>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbh1_hubreset>;
-		gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;
 	};
 
 	reg_usb_otg_vbus: regulator-usbotgvbus {
@@ -74,7 +74,7 @@ reg_usb_otg_vbus: regulator-usbotgvbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbotgvbus>;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
index c5c144879fa6..a4b666c08418 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
@@ -96,7 +96,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts b/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
index a603562ea49a..ce952d32daed 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
@@ -107,7 +107,7 @@ reg_hdmi: regulator-hdmi {
 		pinctrl-0 = <&pinctrl_h100_reg_hdmi>;
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
 		regulator-name = "V_HDMI";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -117,7 +117,7 @@ reg_hdmi: regulator-hdmi {
 	reg_usbh1_vbus: regulator-usb-h1-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_h100_usbh1_vbus>;
 		regulator-name = "USB_H1_VBUS";
@@ -128,7 +128,7 @@ reg_usbh1_vbus: regulator-usb-h1-vbus {
 	reg_usbotg_vbus: regulator-usb-otg-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_h100_usbotg_vbus>;
 		regulator-name = "USB_OTG_VBUS";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kp.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kp.dtsi
index c425d427663d..586498a59c8f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-kp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-kp.dtsi
@@ -92,7 +92,7 @@ reg_3p3v: regulator-3p3v {
 	reg_audio: regulator-audio {
 		compatible = "regulator-fixed";
 		regulator-name = "sgtl5000-supply";
-		gpio = <&gpio6 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts b/arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts
index 46a4ddedb423..2096cca5a24d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts
@@ -38,7 +38,7 @@ reg_lcd: regulator-lcd {
 		regulator-name = "lcd_panel_pwr";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 17 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_3v3>;
 		startup-delay-us = <500000>;
@@ -51,7 +51,7 @@ reg_lcd_reset: regulator-lcd-reset {
 		regulator-name = "nLCD_RESET";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_lcd>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-marsboard.dts b/arch/arm/boot/dts/nxp/imx/imx6q-marsboard.dts
index 2c9961333b0a..b4e3fed18095 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-marsboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-marsboard.dts
@@ -64,7 +64,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts b/arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts
index f08b37010291..caaf1f93fd71 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts
@@ -63,7 +63,7 @@ reg_lvds: regulator-lvds {
 		regulator-boot-on;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_lvds>;
-		gpio = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index d392b5bd2eea..d362e95cf5d8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -134,7 +134,7 @@ reg_audio_codec: regulator-audio-codec {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		startup-delay-us = <400000>;
-		gpio = <&gpio5 17 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -144,7 +144,7 @@ reg_display: regulator-display {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <200000>;
-		gpio = <&gpio5 28 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 28 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -153,7 +153,7 @@ reg_lvds_lcd: regulator-lvds-lcd {
 		regulator-name = "lcd-lvds-power";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -162,7 +162,7 @@ reg_pcie: regulator-pcie {
 		regulator-name = "pcie-bus-power";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -173,7 +173,7 @@ reg_sata: regulator-sata {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <10000>;
-		gpio = <&gpio3 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 30 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts b/arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts
index 56b77cc0af2b..20226b9b7790 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts
@@ -80,7 +80,7 @@ wlan_en_reg: regulator-wlan_en {
 		regulator-name = "wlan-en-regulator";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio2 24 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
@@ -90,7 +90,7 @@ reg_usb_otg_vbus: regulator-usb_vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&swbst_reg>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts b/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts
index 8d2b608e0b90..7c3c66c31032 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts
@@ -77,7 +77,7 @@ reg_wifi: regulator-wifi {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_wifi_npd>;
 		enable-active-high;
-		gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
 		regulator-max-microvolt = <1800000>;
 		regulator-min-microvolt = <1800000>;
 		regulator-name = "regulator-WL12xx";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts b/arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts
index 0225a621ec7a..eb1eb01ac479 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-var-dt6customboard.dts
@@ -102,7 +102,7 @@ reg_usb_h1_vbus: regulator-usbh1vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -111,7 +111,7 @@ reg_usb_otg_vbus: regulator-usbotgvbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index edf55760a5c1..cf464b142ff0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -147,7 +147,7 @@ reg_ov5640_2v8_a_vdd: regulator-ov5640-2v8-a-vdd {
 	reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_regulator_usbotg_pwr>;
 		regulator-max-microvolt = <5000000>;
@@ -160,7 +160,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 	reg_usb_host_vbus_hub: regulator-usb-host-vbus-hub {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 28 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 28 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_regulator_usbhub_pwr>;
 		regulator-max-microvolt = <5000000>;
@@ -173,7 +173,7 @@ reg_usb_host_vbus_hub: regulator-usb-host-vbus-hub {
 	reg_usb_host_vbus: regulator-usb-host-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_regulator_usbh_pwr>;
 		regulator-max-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos.dtsi
index baa197c90060..ae595b398436 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos.dtsi
@@ -28,7 +28,7 @@ reg_3p3v: regulator-3p3v {
 	reg_usbh1_vbus: regulator-usbh1-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_aristainetos_usbh1_vbus>;
 		regulator-name = "usb_h1_vbus";
@@ -39,7 +39,7 @@ reg_usbh1_vbus: regulator-usbh1-vbus {
 	reg_usbotg_vbus: regulator-usbotg-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_aristainetos_usbotg_vbus>;
 		regulator-name = "usb_otg_vbus";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
index f7fac86f0a6b..7eecfe67d16c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
@@ -71,7 +71,7 @@ reg_3p3v: regulator-3p3v {
 	reg_usbh1_vbus: regulator-usbh1-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_aristainetos2_usbh1_vbus>;
 		regulator-name = "usb_h1_vbus";
@@ -82,7 +82,7 @@ reg_usbh1_vbus: regulator-usbh1-vbus {
 	reg_usbotg_vbus: regulator-usbotg-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_aristainetos2_usbotg_vbus>;
 		regulator-name = "usb_otg_vbus";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index b01670cdd52c..33457edab3e1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -119,7 +119,7 @@ reg_module_3v3_audio: regulator-module-3v3-audio {
 
 	reg_usb_host_vbus: regulator-usb-host-vbus {
 		compatible = "regulator-fixed";
-		gpio = <&gpio3 31 GPIO_ACTIVE_LOW>; /* SODIMM 129 / USBH_PEN */
+		gpios = <&gpio3 31 GPIO_ACTIVE_LOW>; /* SODIMM 129 / USBH_PEN */
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_regulator_usbh_pwr>;
 		regulator-max-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi
index bd66430c1d78..3407456f250a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi
@@ -79,7 +79,7 @@ v_5v0: regulator-v-5v0 {
 	v_usb2: regulator-v-usb2 {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_cubox_i_usbh1_vbus>;
 		regulator-max-microvolt = <5000000>;
@@ -91,7 +91,7 @@ v_usb2: regulator-v-usb2 {
 	v_usb1: regulator-v-usb1 {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_cubox_i_usbotg_vbus>;
 		regulator-max-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi
index 0a6c3a092b34..73bf8cbab4a9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi
@@ -12,7 +12,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 0>;
+		gpios = <&gpio3 22 0>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
index eaa87b333164..3842df202adb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
@@ -42,7 +42,7 @@ reg_3p3v: regulator-3P3V {
 
 	reg_eth_vio: regulator-eth-vio {
 		compatible = "regulator-fixed";
-		gpio = <&gpio1 7 0>;
+		gpios = <&gpio1 7 0>;
 		pinctrl-0 = <&pinctrl_enet_vio>;
 		pinctrl-names = "default";
 		regulator-always-on;
@@ -56,7 +56,7 @@ reg_eth_vio: regulator-eth-vio {
 	/* OE pin of the latch is low active */
 	reg_latch_oe_on: regulator-latch-oe-on {
 		compatible = "regulator-fixed";
-		gpio = <&gpio3 22 0>;
+		gpios = <&gpio3 22 0>;
 		regulator-always-on;
 		regulator-name = "latch_oe_on";
 	};
@@ -64,7 +64,7 @@ reg_latch_oe_on: regulator-latch-oe-on {
 	reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 31 0>;
+		gpios = <&gpio3 31 0>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "usb_h1_vbus";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi
index 5587069b6052..1828b874b72d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi
@@ -47,7 +47,7 @@ reg_usb_otg: reg-otgvbus {
 		regulator-name = "OTG_VBUS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
 		regulator-always-on;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
index a308a3584b62..d4d82245865b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
@@ -127,7 +127,7 @@ reg_parallel_disp: reg-parallel-display {
 		regulator-name = "LCD-Supply";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio7 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -136,7 +136,7 @@ reg_lvds_disp: reg-lvds-display {
 		regulator-name = "LVDS-Supply";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio7 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 10 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
index e75e1a5364b8..d091df6c327b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
@@ -119,7 +119,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
index b57f4073f881..d29b70eba428 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
@@ -142,7 +142,7 @@ reg_can1_stby: regulator-can1-stby {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_can1>;
 		regulator-name = "can1_stby";
-		gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
@@ -152,7 +152,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
index 090c0057d117..07c7deed3b78 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
@@ -134,7 +134,7 @@ reg_can1_stby: regulator-can1-stby {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_can1>;
 		regulator-name = "can1_stby";
-		gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
@@ -152,7 +152,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
index 0ed6d25024a2..be8ca8967bbb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
@@ -135,7 +135,7 @@ reg_can1_stby: regulator-can1-stby {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_can1>;
 		regulator-name = "can1_stby";
-		gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
@@ -153,7 +153,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
index c6e231de674a..b41ad4939d1a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
@@ -153,7 +153,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
index d0f648938cae..5b1c6d31bd30 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
@@ -200,7 +200,7 @@ reg_12p0v: regulator-12p0v {
 		regulator-name = "12P0V";
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
-		gpio = <&gpio4 25 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -225,7 +225,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi
index 71911df881cc..388cd2cea9c6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi
@@ -164,7 +164,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 30 0>;
+		gpios = <&gpio3 30 0>;
 		enable-active-high;
 	};
 
@@ -173,7 +173,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -182,7 +182,7 @@ reg_12p0: regulator-12p0v {
 		regulator-name = "12P0V";
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
index 716c324a7458..aa283317d671 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
@@ -186,7 +186,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
index 955a51226eda..c96950e1e0d7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
@@ -119,7 +119,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
index 453dee4d9227..9746e5df3d21 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
@@ -123,7 +123,7 @@ reg_wl: regulator-wl {
 		pinctrl-0 = <&pinctrl_reg_wl>;
 		compatible = "regulator-fixed";
 		regulator-name = "wl";
-		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <100>;
 		enable-active-high;
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
index d1ad65ab6b72..1dc42f2e5da9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
@@ -82,7 +82,7 @@ v_5v0: regulator-v-5v0 {
 
 	v_sd: regulator-v-sd {
 		compatible = "regulator-fixed";
-		gpio = <&gpio4 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard_vmmc>;
 		regulator-boot-on;
@@ -96,7 +96,7 @@ v_sd: regulator-v-sd {
 	v_usb2: regulator-v-usb2 {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard_usbh1_vbus>;
 		regulator-max-microvolt = <5000000>;
@@ -108,7 +108,7 @@ v_usb2: regulator-v-usb2 {
 	v_usb1: regulator-v-usb1 {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard_usbotg_vbus>;
 		regulator-max-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
index e6017f9bf640..3f6732ccbd2c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
@@ -91,7 +91,7 @@ vcc_1p8: regulator-vcc-1p8 {
 
 	v_sd: regulator-v-sd {
 		compatible = "regulator-fixed";
-		gpio = <&gpio4 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard2_vmmc>;
 		regulator-boot-on;
@@ -105,7 +105,7 @@ v_sd: regulator-v-sd {
 	v_usb1: regulator-v-usb1 {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard2_usbotg_vbus>;
 		regulator-always-on;
@@ -119,7 +119,7 @@ v_usb2: regulator-v-usb2 {
 		/* USB hub port 1 */
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard2_usbh1_vbus>;
 		regulator-always-on;
@@ -133,7 +133,7 @@ v_usb3: regulator-v-usb3 {
 		/* USB hub port 3 */
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard2_usbh2_vbus>;
 		regulator-always-on;
@@ -147,7 +147,7 @@ v_usb4: regulator-v-usb4 {
 		/* USB hub port 4 */
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio7 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 10 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_hummingboard2_usbh3_vbus>;
 		regulator-always-on;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
index dff184a119f3..d707e8442c9c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
@@ -46,7 +46,7 @@ reg_sd3_vmmc: regulator-sd3-vmmc {
 		regulator-name = "P3V3_SD3_SWITCHED";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 4 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
index 99b5e78458aa..457736aa2898 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
@@ -68,7 +68,7 @@ reg_sdio: regulator-sdio {
 		regulator-name = "V_3V3_SD";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		off-on-delay-us = <20000>;
 	};
@@ -80,7 +80,7 @@ reg_smarc_lcdbklt: regulator-smarc-lcdbklt {
 		regulator-name = "LCD_BKLT_EN";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio1 16 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 16 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -91,7 +91,7 @@ reg_smarc_lcdvdd: regulator-smarc-lcdvdd {
 		regulator-name = "LCD_VDD_EN";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
index 60aa1e947f62..be82c723fc5d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
@@ -92,7 +92,7 @@ reg_pcie: regulator-pcie {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		/* PCIE.PWR_EN */
-		gpio = <&gpio2 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 		vin-supply = <&reg_mba6_3p3v>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
index a30cf0d06206..9753ddbe8dba 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi
@@ -36,7 +36,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -47,7 +47,7 @@ reg_wlan_vmmc: regulator-wlan-vmmc {
 		regulator-name = "reg_wlan_vmmc";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio6 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
index 33174febf410..063f2a9dec17 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
@@ -44,7 +44,7 @@ reg_usb_otg_vbus: regulator-usb-otg {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -55,7 +55,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -66,7 +66,7 @@ reg_wlan_vmmc: regulator-wlan-vmmc {
 		regulator-name = "reg_wlan_vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio6 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 15 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
@@ -78,7 +78,7 @@ reg_can_xcvr: regulator-can-xcvr {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_can_xcvr>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
index 8e64314fa8b2..c69fa85135ff 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
@@ -175,7 +175,7 @@ reg_can_xcvr: regulator-can-xcvr {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_can_xcvr>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_usb_h1_vbus: regulator-usb-h1-vbus {
@@ -185,7 +185,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -195,7 +195,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -206,7 +206,7 @@ reg_wlan_vmmc: regulator-wlan-vmmc {
 		regulator-name = "reg_wlan_vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio6 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 15 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi
index 121177273dd0..e73b4ab4fbd1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi
@@ -38,7 +38,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 0>;
+		gpios = <&gpio3 22 0>;
 		enable-active-high;
 	};
 
@@ -49,7 +49,7 @@ reg_can_xcvr: regulator-can-xcvr {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_can_xcvr>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_wlan_vmmc: regulator-wlan-vmmc {
@@ -59,7 +59,7 @@ reg_wlan_vmmc: regulator-wlan-vmmc {
 		regulator-name = "reg_wlan_vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio6 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 15 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
@@ -71,7 +71,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi
index 84f884d6e55b..46243ff88953 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi
@@ -15,7 +15,7 @@ reg_wl_en: regulator-wl-en {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_wl>;
-		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		startup-delay-us = <100>;
 		status = "disabled";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index 0b4c09b09c03..b817740c97dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -58,7 +58,7 @@ reg_en_switch: regulator-en-switch {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&gpio3 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>;
 		regulator-always-on;
 	};
 
@@ -69,7 +69,7 @@ reg_flexcan1: regulator-flexcan1 {
 		regulator-name = "flexcan1-reg";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -88,7 +88,7 @@ reg_pcie: regulator-pcie {
 		regulator-name = "mPCIe_1V5";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&gpio3 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -99,7 +99,7 @@ reg_usb_h1_vbus: usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio2 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 18 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -110,7 +110,7 @@ reg_usbotg_vbus: usbotg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
index c0c47adc5866..d916e7cee6be 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
@@ -19,7 +19,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 15 0>;
+		gpios = <&gpio4 15 0>;
 		enable-active-high;
 	};
 
@@ -30,7 +30,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 0 0>;
+		gpios = <&gpio1 0 0>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
index c39a9ebdaba1..bffa2312f656 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
@@ -60,7 +60,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
 	};
 
 	codec_osc: clock {
@@ -97,7 +97,7 @@ reg_lcd_3v3: regulator-lcd-3v3 {
 		regulator-name = "lcd-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-prti6q.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-prti6q.dtsi
index 36f84f4da6b0..3ef4fa9936d1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-prti6q.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-prti6q.dtsi
@@ -30,7 +30,7 @@ reg_usb_otg_vbus: regulator-otg-vbus {
 		regulator-name = "otg-vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi
index eba698d04243..d226f32887ea 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi
@@ -27,7 +27,7 @@ reg_usbh1_vbus: regulator-usbh1-vbus {
 		regulator-name = "usbh1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -37,7 +37,7 @@ reg_usb_otg_vbus: regulator-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
index 35b6bec7a3fa..0945fc0313af 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
@@ -89,7 +89,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&max7310_b 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&max7310_b 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -98,7 +98,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&max7310_c 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&max7310_c 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -107,7 +107,7 @@ reg_can_en: regulator-can-en {
 		regulator-name = "can-en";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&max7310_b 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&max7310_b 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -116,7 +116,7 @@ reg_can_stby: regulator-can-stby {
 		regulator-name = "can-stby";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&max7310_b 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&max7310_b 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_can_en>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
index 9c502bf77d0b..a180598a4b8a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
@@ -45,7 +45,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 0>;
+		gpios = <&gpio3 22 0>;
 		enable-active-high;
 	};
 
@@ -56,7 +56,7 @@ reg_can_xcvr: regulator-can-xcvr {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_can_xcvr>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_1p5v: regulator-1p5v {
@@ -90,7 +90,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index 8f4f5fba68cc..3204c82aa564 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -22,7 +22,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&swbst_reg>;
 	};
@@ -32,7 +32,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 		regulator-name = "usb_h1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&swbst_reg>;
 	};
@@ -40,7 +40,7 @@ reg_usb_h1_vbus: regulator-usb-h1-vbus {
 	reg_audio: regulator-audio {
 		compatible = "regulator-fixed";
 		regulator-name = "wm8962-supply";
-		gpio = <&gpio4 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 10 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -51,7 +51,7 @@ reg_pcie: regulator-pcie {
 		regulator-name = "MPCIE_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 19 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -62,7 +62,7 @@ reg_sensors: regulator-sensors {
 		regulator-name = "sensors-supply";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
index 6ab71a729fd8..e83d4818990a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
@@ -141,7 +141,7 @@ reg_can1_stby: regulator-can1-stby {
 		regulator-name = "can1-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 31 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_can2_stby: regulator-can2-stby {
@@ -151,7 +151,7 @@ reg_can2_stby: regulator-can2-stby {
 		regulator-name = "can2-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 11 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_tft_vcom: regulator-tft-vcom {
@@ -174,7 +174,7 @@ reg_vcc_mmc: regulator-vcc-mmc {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio7 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		startup-delay-us = <100>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi
index b55af61dfeca..722df7aab344 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi
@@ -51,7 +51,7 @@ clk_brcm: brcm-clock {
 	reg_brcm: brcm-reg {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 19 0>;
+		gpios = <&gpio3 19 0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_microsom_brcm_reg>;
 		regulator-name = "brcm_reg";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi
index f88da757edda..f0d5aff6816b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi
@@ -77,7 +77,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi
index e2db875b61c4..d72462898ec9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi
@@ -100,7 +100,7 @@ reg_can1_3v3: reg_can1_3v3 {
 		regulator-name = "reg_can1_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -109,7 +109,7 @@ reg_can2_3v3: en-reg_can2_3v3 {
 		regulator-name = "reg_can2_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio6 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -118,7 +118,7 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -127,7 +127,7 @@ reg_wlan_vmmc: regulator_wlan_vmmc {
 		regulator-name = "wlan_vmmc";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio8 14 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio8 14 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
index 5a194f4c0cb9..2ae8a18b9de7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
@@ -108,7 +108,7 @@ reg_3v3_etn: regulator-3v3-etn {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_etnphy_power>;
-		gpio = <&gpio3 20 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -135,7 +135,7 @@ reg_can_xcvr: regulator-can-xcvr {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flexcan_xcvr>;
-		gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_lcd0_pwr: regulator-lcd0-pwr {
@@ -145,7 +145,7 @@ reg_lcd0_pwr: regulator-lcd0-pwr {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_lcd0_pwr>;
-		gpio = <&gpio3 29 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 29 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		status = "disabled";
 	};
@@ -157,7 +157,7 @@ reg_lcd1_pwr: regulator-lcd1-pwr {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_lcd1_pwr>;
-		gpio = <&gpio2 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		status = "disabled";
 	};
@@ -169,7 +169,7 @@ reg_usbh1_vbus: regulator-usbh1-vbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbh1_vbus>;
-		gpio = <&gpio3 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -180,7 +180,7 @@ reg_usbotg_vbus: regulator-usbotg-vbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbotg_vbus>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi
index 14272b42f9a1..50e6040de6c2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi
@@ -63,7 +63,7 @@ reg_panel: regulator-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "lcd_panel";
 		enable-active-high;
-		gpio = <&gpio1 2 0>;
+		gpios = <&gpio1 2 0>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
index d8283eade43e..b1c1a14bfe5a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
@@ -28,7 +28,7 @@ reg_wl18xx_vmmc: regulator-wl18xx {
 		regulator-name = "vwl1807";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio7 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		startup-delay-us = <70000>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
index 59833e8d11d8..6b83108f87c6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
@@ -64,7 +64,7 @@ reg_wl18xx_vmmc: regulator-wl18xx {
 		regulator-name = "vwl1807";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio7 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		startup-delay-us = <70000>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-vicut1.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-vicut1.dtsi
index 96e4f4b0b248..051faf8b5661 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-vicut1.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-vicut1.dtsi
@@ -133,7 +133,7 @@ reg_otg_vbus: regulator-otg-vbus {
 		regulator-name = "otg-vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi
index 9b8c9c23ab54..1ada447457d2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi
@@ -12,7 +12,7 @@ reg_eth_phy: regulator-eth-phy {
 		regulator-name = "ETH_PHY";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio7 13 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio7 13 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
index 7130b9c3b3aa..d90308c49d9b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
@@ -85,7 +85,7 @@ reg_usb_otg_vbus: regulator-usbotgvbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbotgvbus>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
index 9ff183e4e069..2b01e46d69df 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
@@ -86,7 +86,7 @@ reg_3p3v_sd: regulator-3p3v-sd {
 		regulator-name = "3V3_SD";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio7 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <1000>;
 		enable-active-high;
 		regulator-always-on;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
index ae00d538a4df..8d7fbae4f2dd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts
@@ -103,7 +103,7 @@ reg_otg_vbus: regulator-otg-vbus {
 		regulator-name = "otg-vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
index 7c899291ab0d..76315b932592 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
@@ -45,7 +45,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&swbst_reg>;
 	};
@@ -55,7 +55,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&swbst_reg>;
 	};
@@ -81,7 +81,7 @@ reg_lcd_3v3: regulator-lcd-3v3 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_lcd_3v3>;
 		regulator-name = "lcd-3v3";
-		gpio = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
index 657d0f1b6115..7a0f35469f48 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
@@ -74,7 +74,7 @@ reg_wifi: regulator-wifi {
 		regulator-name = "SD3_SPWR";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	};
 
 	wifi_pwrseq: wifi-pwrseq {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
index 03d6965f0149..b2ec2ffb9183 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
@@ -29,7 +29,7 @@ backlight_regulator: regulator-backlight {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_backlight_power>;
 		regulator-name = "backlight";
-		gpio = <&gpio2 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -100,7 +100,7 @@ reg_wifi: regulator-wifi {
 		regulator-name = "SD3_SPWR";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	};
 
 	wifi_pwrseq: wifi_pwrseq {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision.dts
index 2694fe18a91b..1b28fb3365b4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision.dts
@@ -35,7 +35,7 @@ backlight_regulator: regulator-backlight {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_backlight_power>;
 		regulator-name = "backlight";
-		gpio = <&gpio2 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -104,7 +104,7 @@ reg_wifi: regulator-wifi {
 		regulator-name = "SD3_SPWR";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	};
 
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
index febc2dd9967d..5edb48135861 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
@@ -51,7 +51,7 @@ reg_usb_otg1_vbus: regulator-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -62,7 +62,7 @@ reg_usb_otg2_vbus: regulator-otg2-vbus {
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -87,7 +87,7 @@ reg_lcd_3v3: regulator-lcd-3v3 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_reg_lcd_3v3>;
 		regulator-name = "lcd-3v3";
-		gpio = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -105,7 +105,7 @@ reg_sd1_vmmc: regulator-sd1-vmmc {
 		regulator-name = "SD1_SPWR";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio3 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 30 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -124,7 +124,7 @@ reg_sd3_vmmc: regulator-sd3-vmmc {
 		regulator-name = "SD3_WIFI";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio4 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
index 1c1515a854c8..db7cf0ad3c93 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
@@ -45,7 +45,7 @@ reg_can1_3v3: regulator-can1-3v3 {
 		regulator-name = "can1-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 27 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio4 27 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_can2_3v3: regulator-can2-3v3 {
@@ -53,7 +53,7 @@ reg_can2_3v3: regulator-can2-3v3 {
 		regulator-name = "can2-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 24 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio4 24 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
@@ -63,7 +63,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -76,7 +76,7 @@ reg_wlan: regulator-wlan {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <70000>;
-		gpio = <&gpio7 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts
index dfbfb8119bf3..69709d016b22 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts
@@ -34,7 +34,7 @@ vcc_sd3: regulator-vcc-sd3 {
 		regulator-name = "VCC_SD3";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -43,7 +43,7 @@ reg_can_wake: regulator-can-wake {
 		regulator-name = "can-wake";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&max7310_b 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&max7310_b 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -52,7 +52,7 @@ reg_can_en: regulator-can-en {
 		regulator-name = "can-en";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&max7310_b 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&max7310_b 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_can_wake>;
 	};
@@ -62,7 +62,7 @@ reg_can_stby: regulator-can-stby {
 		regulator-name = "can-stby";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&max7310_b 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&max7310_b 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&reg_can_en>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dts
index 48f19dede467..84db419745c5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dts
@@ -146,12 +146,12 @@ flash1: flash@2 {
 
 &reg_can_en {
 	/* Transceiver EN/STBY is active high on RevA board */
-	gpio = <&gpio4 25 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
 	enable-active-high;
 };
 
 &reg_can_stby {
-	gpio = <&gpio4 27 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio4 27 GPIO_ACTIVE_HIGH>;
 	enable-active-high;
 	vin-supply = <&reg_can_en>;
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dts
index e05a1be5553c..db96d64344db 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dts
@@ -147,7 +147,7 @@ &reg_vdd2p5 {
 
 &reg_can_stby {
 	/* Transceiver EN/STBY is active low on RevB board */
-	gpio = <&gpio4 27 GPIO_ACTIVE_LOW>;
+	gpios = <&gpio4 27 GPIO_ACTIVE_LOW>;
 };
 
 &snvs_pwrkey {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 277a6e039045..e3e0e870a6d1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -55,7 +55,7 @@ vcc_sd3: regulator-vcc-sd3 {
 		regulator-name = "VCC_SD3";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -66,7 +66,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -77,7 +77,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -91,7 +91,7 @@ reg_psu_5v: regulator-psu-5v {
 	reg_lcd_3v3: regulator-lcd-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "lcd-3v3";
-		gpio = <&gpio3 27 0>;
+		gpios = <&gpio3 27 0>;
 		enable-active-high;
 	};
 
@@ -102,7 +102,7 @@ reg_peri_3v3: regulator-peri-3v3 {
 		regulator-name = "peri_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 16 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -114,7 +114,7 @@ reg_enet_3v3: regulator-enet-3v3 {
 		regulator-name = "enet_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 6 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
 		regulator-boot-on;
 		regulator-always-on;
 	};
@@ -126,7 +126,7 @@ reg_pcie_gpio: regulator-pcie-gpio {
 		regulator-name = "MPCIE_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
index f999eb244373..bd86699ba739 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
@@ -29,7 +29,7 @@ reg_usb_otg1_vbus: regulator-usb_otg1_vbus {
 		pinctrl-0 = <&pinctrl_usb_otg1>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo.dtsi
index bbf792ac4896..0c302a9ad53f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo.dtsi
@@ -31,7 +31,7 @@ led-orange {
 
 	reg_sdio_pwr: regulator-sdio-pwr {
 		compatible = "regulator-fixed";
-		gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-name = "SDIO_PWR";
 		regulator-min-microvolt = <3300000>;
@@ -46,7 +46,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -57,7 +57,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -66,7 +66,7 @@ reg_wlan: regulator-wlan {
 		regulator-name = "wlan-en-regulator";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio2 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
index b74ee8948a78..a4da10e096eb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
@@ -28,7 +28,7 @@ reg_sd1_vmmc: regulator-sd1-vmmc {
 		regulator-name = "VSD_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -39,7 +39,7 @@ reg_peri_3v3: regulator-peri-3v3 {
 		regulator-name = "VPERI_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
 		/*
 		 * If you want to want to make this dynamic please
 		 * check schematics and test all affected peripherals:
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dts
index 8aea8c99e2af..0959e0987993 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dts
@@ -41,7 +41,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1 {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-opos6uldev.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-opos6uldev.dtsi
index be3cacb4fa7a..1a086b04959d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-opos6uldev.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-opos6uldev.dtsi
@@ -74,7 +74,7 @@ reg_usbotg1_vbus: regulator-usbotg1vbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbotg1_vbus>;
-		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -85,7 +85,7 @@ reg_usbotg2_vbus: regulator-usbotg2vbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbotg2_vbus>;
-		gpio = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
index 29d2f86d5e34..b242681abcc6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi
@@ -57,7 +57,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
index 5e62272acfba..828d819a11c4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts
@@ -61,7 +61,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio2 8 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin-peb-av-02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin-peb-av-02.dtsi
index ec042648bd98..a29041a0e430 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin-peb-av-02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin-peb-av-02.dtsi
@@ -34,7 +34,7 @@ reg_backlight_en: regulator-backlight-en {
 		regulator-name = "backlight-lcd";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin-peb-wlbt-05.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin-peb-wlbt-05.dtsi
index 4a45fb784ff7..65d33e9d0947 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin-peb-wlbt-05.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin-peb-wlbt-05.dtsi
@@ -15,7 +15,7 @@ reg_wl_en: regulator-wl-en {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_wl>;
-		gpio = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		startup-delay-us = <100>;
 		status = "disabled";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin.dtsi
index bef5eb38a90d..bb48f35d4680 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin.dtsi
@@ -36,7 +36,7 @@ reg_can1_en: regulator-can1 {
 		regulator-name = "Can";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		status = "disabled";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-pico.dtsi
index fe307f49b9e5..c188eef36f59 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-pico.dtsi
@@ -47,7 +47,7 @@ reg_sd1_vmmc: regulator-sd1-vmmc {
 		regulator-name = "VSD_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -58,13 +58,13 @@ reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 6 0>;
+		gpios = <&gpio1 6 0>;
 	};
 
 	reg_brcm: regulator-brcm {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio4 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_brcm_reg>;
 		regulator-name = "brcm_reg";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
index 278120404d31..e0afc929903c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
@@ -145,7 +145,7 @@ reg_3v3_etn: regulator-3v3etn {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_etnphy_power>;
-		gpio = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -172,7 +172,7 @@ reg_can_xcvr: regulator-canxcvr {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flexcan_xcvr>;
-		gpio = <&gpio3 5 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_lcd_pwr: regulator-lcdpwr {
@@ -182,7 +182,7 @@ reg_lcd_pwr: regulator-lcdpwr {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_lcd_pwr>;
-		gpio = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 		regulator-always-on;
@@ -195,7 +195,7 @@ reg_usbh1_vbus: regulator-usbh1vbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbh1_vbus &pinctrl_usbh1_oc>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -206,7 +206,7 @@ reg_usbotg_vbus: regulator-usbotgvbus {
 		regulator-max-microvolt = <5000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbotg_vbus &pinctrl_usbotg_oc>;
-		gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtsi
index de4dc7c1a03a..4c88f9bbeed1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-aster.dtsi
@@ -43,7 +43,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USB[1-4]";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
 		vin-supply = <&reg_5v0>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi
index 692ef26fbab3..20bd4021b2fb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-eval-v3.dtsi
@@ -36,7 +36,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USB[1-4]";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
 		vin-supply = <&reg_5v0>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris-v2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris-v2.dtsi
index 93649cad0cc0..fdb9927b87fd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris-v2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris-v2.dtsi
@@ -11,7 +11,7 @@ reg_3v3_vmmc: regulator-3v3-vmmc {
 		regulator-name = "3v3_vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <100>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
index f52f8b5ad8a6..abb22c48f8f2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi
@@ -43,7 +43,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USB[1-4]";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
 		vin-supply = <&reg_5v0>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi
index a74f5273f9b3..5529fced46b0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi
@@ -45,7 +45,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 
 	reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		compatible = "regulator-fixed";
-		gpio = <&gpio1 5 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
 		regulator-max-microvolt = <5000000>;
 		regulator-min-microvolt = <5000000>;
 		regulator-name = "usb-otg2-vbus";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-jozacp.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-jozacp.dts
index a152eeb78e88..9edae2efa8c1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-jozacp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-jozacp.dts
@@ -100,7 +100,7 @@ reg_vbus: regulator-vbus {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&reg_5v0>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi
index d12fb44aeb14..74081658a282 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi
@@ -41,7 +41,7 @@ reg_s25fl064_hold: regulator-s25fl064-hold {
 		regulator-name = "s25fl064_hold";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 17 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -53,7 +53,7 @@ reg_usb_hub_vbus: regulator-hub-otg1-vbus {
 		regulator-name = "usb_hub_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -65,7 +65,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 28 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-master.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-master.dts
index f9bbd589b66d..09a19dbef021 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-master.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-master.dts
@@ -25,7 +25,7 @@ reg_fan: regulator {
 		pinctrl-0 = <&pinctrl_fan_enable>;
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
-		gpio = <&gpio3 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts
index 83db65bf630f..d2050a98cd69 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts
@@ -25,7 +25,7 @@ reg_fan: regulator {
 		pinctrl-0 = <&pinctrl_fan_enable>;
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
-		gpio = <&gpio3 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi
index b687727f956a..8ab1ebeaebb2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi
@@ -7,7 +7,7 @@ / {
 	reg_3v3_vmmc: regulator-3v3-vmmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio5 16 GPIO_ACTIVE_HIGH>; /* SODIMM 100 */
+		gpios = <&gpio5 16 GPIO_ACTIVE_HIGH>; /* SODIMM 100 */
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "3v3_vmmc";
diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 62e41edcaf1d..7a40e4be36e3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -106,7 +106,7 @@ reg_module_3v3_eth: regulator-module-3v3-eth {
 
 	reg_usbh_vbus: regulator-usbh-vbus {
 		compatible = "regulator-fixed";
-		gpio = <&gpio4 7 GPIO_ACTIVE_LOW>; /* SODIMM 129 / USBH_PEN */
+		gpios = <&gpio4 7 GPIO_ACTIVE_LOW>; /* SODIMM 129 / USBH_PEN */
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbh_reg>;
 		regulator-max-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index e1c401f468e1..15dee63e9211 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -101,7 +101,7 @@ reg_fec1_pwdn: regulator-fec1-pwdn {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -111,7 +111,7 @@ reg_fec2_pwdn: regulator-fec2-pwdn {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
-		gpio = <&gpio2 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -120,7 +120,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "VBUS_USBOTG1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -129,7 +129,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		regulator-name = "VBUS_USBOTG2";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -138,7 +138,7 @@ reg_mpcie_1v5: regulator-mpcie-1v5 {
 		regulator-name = "VCC1V5_MPCIE";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&pca9555 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&pca9555 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -148,7 +148,7 @@ reg_mpcie_3v3: regulator-mpcie-3v3 {
 		regulator-name = "VCC3V3_MPCIE";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&pca9555 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&pca9555 10 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -158,7 +158,7 @@ reg_mba_12v0: regulator-mba-12v0 {
 		regulator-name = "VCC12V0_MBA7";
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
-		gpio = <&pca9555 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&pca9555 11 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -167,7 +167,7 @@ reg_lvds_transmitter: regulator-lvds-transmitter {
 		regulator-name = "#SHTDN_LVDS";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&pca9555 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&pca9555 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts
index 713483c39c9d..83b6783a808f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-cl-som-imx7.dts
@@ -28,7 +28,7 @@ reg_usb_otg1_vbus: regulator-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts b/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts
index 9984b343cdf0..fe3a50746640 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-flex-concentrator.dts
@@ -28,7 +28,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		regulator-name = "VBUS_USBOTG2";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts b/arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts
index f0fda15f3020..c27124d7c3e5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts
@@ -28,7 +28,7 @@ reg_wlreg_on: regulator-wlreg-on {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <100>;
-		gpio = <&gpio6 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -53,7 +53,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts
index 7ee66be8bccb..867b7fbe975d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts
@@ -48,7 +48,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -57,7 +57,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		regulator-name = "usb_otg2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -66,7 +66,7 @@ reg_can2_3v3: regulator-can2-3v3 {
 		regulator-name = "can2-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 14 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_vref_1v8: regulator-vref-1v8 {
@@ -89,7 +89,7 @@ reg_wlan: regulator-wlan {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "reg_wlan";
 		startup-delay-us = <70000>;
-		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
index a1574ccec89c..ecc89c760477 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi
@@ -39,7 +39,7 @@ reg_lcd_3v3: regulator-lcd-3v3 {
 		regulator-name = "lcd-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -50,7 +50,7 @@ reg_wlreg_on: regulator-wlreg_on {
 		regulator-name = "wlreg_on";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio4 16 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -77,7 +77,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 5 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio4 5 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
index eec526a96311..5a9f79e5a6d2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
@@ -52,7 +52,7 @@ reg_brcm: regulator-brcm {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_brcm_reg>;
-		gpio = <&gpio6 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		startup-delay-us = <150>;
 	};
@@ -65,7 +65,7 @@ reg_digitizer: regulator-digitizer {
 		pinctrl-names = "default", "sleep";
 		pinctrl-0 = <&pinctrl_digitizer_reg>;
 		pinctrl-1 = <&pinctrl_digitizer_reg>;
-		gpio = <&gpio1 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		startup-delay-us = <100000>; /* 100 ms */
 	};
@@ -77,7 +77,7 @@ reg_touch: regulator-touch {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch_reg>;
-		gpio = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb-reva.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb-reva.dts
index 40156cd9195f..df2169be0df7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb-reva.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb-reva.dts
@@ -12,7 +12,7 @@ / {
 
 	reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		pinctrl-0 = <&pinctrl_usb_otg2_vbus_reg_reva>;
-		gpio = <&gpio4 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
index f712537fca16..c60ef286fb63 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
@@ -70,7 +70,7 @@ reg_sd1_vmmc: regulator-sd1-vmmc {
 		regulator-name = "VDD_SD1";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		startup-delay-us = <200000>;
 		off-on-delay-us = <20000>;
@@ -81,7 +81,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -92,7 +92,7 @@ reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
 		pinctrl-0 = <&pinctrl_usb_otg2_vbus_reg>;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -105,7 +105,7 @@ reg_vref_1v8: regulator-vref-1v8 {
 
 	reg_brcm: regulator-brcm {
 		compatible = "regulator-fixed";
-		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-name = "brcm_reg";
 		pinctrl-names = "default";
@@ -120,7 +120,7 @@ reg_lcd_3v3: regulator-lcd-3v3 {
 		regulator-name = "lcd-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&extended_io 7 GPIO_ACTIVE_LOW>;
+		gpios = <&extended_io 7 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_can2_3v3: regulator-can2-3v3 {
@@ -130,7 +130,7 @@ reg_can2_3v3: regulator-can2-3v3 {
 		pinctrl-0 = <&pinctrl_flexcan2_reg>;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 14 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
 	};
 
 	reg_fec2_3v3: regulator-fec2-3v3 {
@@ -140,7 +140,7 @@ reg_fec2_3v3: regulator-fec2-3v3 {
 		pinctrl-0 = <&pinctrl_enet2_reg>;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 4 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	};
 
 	backlight: backlight {
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dts b/arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dts
index 7ed27c7ad726..07f039fde96c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-smegw01.dts
@@ -38,7 +38,7 @@ reg_lte_on: regulator-lte-on {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "lte_on";
-		gpio = <&gpio7 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -50,14 +50,14 @@ reg_lte_nreset: regulator-lte-nreset {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "LTE_nReset";
-		gpio = <&gpio6 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
 
 	reg_wifi: regulator-wifi {
 		compatible = "regulator-fixed";
-		gpio = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_wifi>;
@@ -73,7 +73,7 @@ reg_wlan_rfkill: regulator-wlan-rfkill {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "wlan_rfkill";
-		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -85,7 +85,7 @@ reg_usbotg_vbus: regulator-usbotg-vbus {
 		regulator-name = "usb_otg_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 05 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 05 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-zii-rpu2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-zii-rpu2.dts
index decc19af3b83..7b27c0868a3e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-zii-rpu2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-zii-rpu2.dts
@@ -56,7 +56,7 @@ reg_can1_stby: regulator-can1-stby {
 		regulator-name = "can1-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -67,7 +67,7 @@ reg_can2_stby: regulator-can2-stby {
 		regulator-name = "can2-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
index af4acc311572..b1e6f8e3e53e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -34,7 +34,7 @@ back {
 	reg_brcm: regulator-brcm {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio5 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_brcm_reg>;
 		regulator-name = "brcm_reg";
@@ -48,7 +48,7 @@ reg_bt: regulator-bt {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_bt_reg>;
 		enable-active-high;
-		gpio = <&gpio5 17 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
 		regulator-name = "bt_reg";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts b/arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts
index eff51e113db4..d840646dcc94 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts
@@ -37,7 +37,7 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
 		regulator-name = "usb_otg1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio_ptc 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio_ptc 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -48,7 +48,7 @@ reg_vsd_3v3: regulator-vsd-3v3 {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usdhc0_rst>;
-		gpio = <&gpio_ptd 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio_ptd 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index 941d9860218e..688ba8a0c18c 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -84,7 +84,7 @@ led2 {
 	reg_lcd_pwr: regulator-lcd-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "lcd-pwr";
-		gpio = <&expander_out0 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander_out0 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		status = "disabled";
 	};
@@ -110,7 +110,7 @@ reg_mpcie: regulator-mpcie-3v3 {
 		regulator-name = "mpcie-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&expander_out0 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander_out0 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 		startup-delay-us = <500000>;
@@ -119,7 +119,7 @@ reg_mpcie: regulator-mpcie-3v3 {
 
 	reg_otg2vbus_5v0: regulator-otg2-vbus-5v0 {
 		compatible = "regulator-fixed";
-		gpio = <&expander_out1 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&expander_out1 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-name = "otg2-vbus-supply-5v0";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
index 21a6d0bca1e8..eb24a32ed66d 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
@@ -48,7 +48,7 @@ reg_backlight: regulator-backlight {
 		regulator-name = "backlight";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio 5 4 0>;
+		gpios = <&gpio 5 4 0>;
 		enable-active-high;
 		regulator-boot-on;
 	};
@@ -58,7 +58,7 @@ reg_lcd: regulator-lcd {
 		regulator-name = "lcd";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio 5 0 0>;
+		gpios = <&gpio 5 0 0>;
 		enable-active-high;
 		regulator-boot-on;
 	};
@@ -68,7 +68,7 @@ reg_sd: regulator-sd {
 		regulator-name = "sd";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio 5 5 0>;
+		gpios = <&gpio 5 5 0>;
 		enable-active-high;
 		regulator-boot-on;
 	};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-evk.dts b/arch/arm/boot/dts/nxp/mxs/imx23-evk.dts
index 33b36af1656f..89a1dd093b05 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-evk.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-evk.dts
@@ -19,7 +19,7 @@ reg_vddio_sd0: regulator-vddio-sd0 {
 		regulator-name = "vddio-sd0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 29 0>;
+		gpios = <&gpio1 29 0>;
 	};
 
 	reg_lcd_3v3: regulator-lcd-3v3 {
@@ -27,7 +27,7 @@ reg_lcd_3v3: regulator-lcd-3v3 {
 		regulator-name = "lcd-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 18 0>;
+		gpios = <&gpio1 18 0>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts b/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts
index e372e9327a47..4be0a6b885f1 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts
@@ -108,7 +108,7 @@ reg_usb0_vbus: regulator-0 {
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 		startup-delay-us = <300>; /* LAN9215 requires a POR of 200us minimum */
-		gpio = <&gpio0 17 0>;
+		gpios = <&gpio0 17 0>;
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts b/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
index cb661bf2d157..5d942da12505 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts
@@ -135,7 +135,7 @@ reg_vddio_sd0: regulator-vddio-sd0 {
 		regulator-name = "vddio-sd0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio0 8 0>;
+		gpios = <&gpio0 8 0>;
 	};
 
 	reg_vddio_sd1: regulator-vddio-sd1 {
@@ -143,7 +143,7 @@ reg_vddio_sd1: regulator-vddio-sd1 {
 		regulator-name = "vddio-sd1";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 29 0>;
+		gpios = <&gpio1 29 0>;
 	};
 
 	reg_vdd_touchpad: regulator-vdd-touchpad0 {
@@ -151,7 +151,7 @@ reg_vdd_touchpad: regulator-vdd-touchpad0 {
 		regulator-name = "vdd-touchpad0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio0 26 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
 		regulator-always-on;
 	};
 
@@ -160,7 +160,7 @@ reg_vdd_tuner: regulator-vdd-tuner0 {
 		regulator-name = "vdd-tuner0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio0 29 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio0 29 GPIO_ACTIVE_LOW>;
 		regulator-always-on;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-stmp378x_devb.dts b/arch/arm/boot/dts/nxp/mxs/imx23-stmp378x_devb.dts
index b2b6f8514999..267dc86e95dd 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-stmp378x_devb.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-stmp378x_devb.dts
@@ -64,6 +64,6 @@ reg_vddio_sd0: regulator-0 {
 		regulator-name = "vddio-sd0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 29 0>;
+		gpios = <&gpio1 29 0>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts b/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
index 0b088c8ab6b6..198932cb75ff 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts
@@ -148,7 +148,7 @@ reg_vddio_sd0: regulator-vddio-sd0 {
 		regulator-name = "vddio-sd0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio0 7 0>;
+		gpios = <&gpio0 7 0>;
 	};
 
 	backlight {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts b/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts
index 6c87266eb135..6c75e9a46df6 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts
@@ -15,7 +15,7 @@ reg_usb0_vbus: regulator-0 {
 		regulator-name = "usb0_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 23 1>;
+		gpios = <&gpio1 23 1>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
index d004b1cbb4ae..a5bb7c84ae79 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts
@@ -34,7 +34,7 @@ reg_vddio_sd0: vddio-sd0 {
 		regulator-name = "vddio-sd0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 28 0>;
+		gpios = <&gpio3 28 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts
index fd177daa6385..0ecd2f8e586b 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts
@@ -71,6 +71,6 @@ reg_usb1_vbus: regulator-0 {
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio0 7 1>;
+		gpios = <&gpio0 7 1>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts
index f0ce897b9d5c..99872b44fdd1 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts
@@ -85,7 +85,7 @@ reg_usb1_vbus: regulator-0 {
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio0 7 1>;
+		gpios = <&gpio0 7 1>;
 	};
 
 	spi-2 {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts
index 5875c3d7ba97..a6f5e3680a91 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10057.dts
@@ -21,7 +21,7 @@ reg_usb1_vbus: regulator-0 {
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio0 7 1>;
+		gpios = <&gpio0 7 1>;
 	};
 
 	backlight {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts
index b414e67ef379..86e9b345ac54 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-cfa10058.dts
@@ -21,7 +21,7 @@ reg_usb1_vbus: regulator-0 {
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio0 7 1>;
+		gpios = <&gpio0 7 1>;
 	};
 
 	backlight {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi
index 652fc9e57a55..47829b8e7ed9 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-eukrea-mbmx28lc.dtsi
@@ -84,7 +84,7 @@ reg_lcd_3v3: regulator-1 {
 		regulator-name = "lcd-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 30 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -95,7 +95,7 @@ reg_usb0_vbus: regulator-2 {
 		regulator-name = "usb0_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -106,7 +106,7 @@ reg_usb1_vbus: regulator-3 {
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-evk.dts b/arch/arm/boot/dts/nxp/mxs/imx28-evk.dts
index 330d3aff6b6c..0af6070bbd1f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-evk.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-evk.dts
@@ -28,7 +28,7 @@ reg_vddio_sd0: regulator-vddio-sd0 {
 		regulator-name = "vddio-sd0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 28 0>;
+		gpios = <&gpio3 28 0>;
 	};
 
 	reg_fec_3v3: regulator-fec-3v3 {
@@ -36,7 +36,7 @@ reg_fec_3v3: regulator-fec-3v3 {
 		regulator-name = "fec-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 15 0>;
+		gpios = <&gpio2 15 0>;
 	};
 
 	reg_usb0_vbus: regulator-usb0-vbus {
@@ -44,7 +44,7 @@ reg_usb0_vbus: regulator-usb0-vbus {
 		regulator-name = "usb0_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 9 0>;
+		gpios = <&gpio3 9 0>;
 		enable-active-high;
 	};
 
@@ -53,7 +53,7 @@ reg_usb1_vbus: regulator-usb1-vbus {
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 8 0>;
+		gpios = <&gpio3 8 0>;
 		enable-active-high;
 	};
 
@@ -62,7 +62,7 @@ reg_lcd_3v3: regulator-lcd-3v3 {
 		regulator-name = "lcd-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 30 0>;
+		gpios = <&gpio3 30 0>;
 		enable-active-high;
 	};
 
@@ -71,7 +71,7 @@ reg_can_3v3: regulator-can-3v3 {
 		regulator-name = "can-3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 13 0>;
+		gpios = <&gpio2 13 0>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts b/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
index 34b4d3246db1..83649529aeb2 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
@@ -53,7 +53,7 @@ reg_vddio_sd0: regulator-1 {
 		regulator-name = "vddio-sd0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 29 0>;
+		gpios = <&gpio3 29 0>;
 	};
 
 	reg_vddio_sd1: regulator-2 {
@@ -61,7 +61,7 @@ reg_vddio_sd1: regulator-2 {
 		regulator-name = "vddio-sd1";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 0>;
+		gpios = <&gpio2 19 0>;
 	};
 
 	reg_usb1_vbus: regulator-3 {
@@ -69,7 +69,7 @@ reg_usb1_vbus: regulator-3 {
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 8 0>;
+		gpios = <&gpio3 8 0>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts b/arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts
index 13070ca08cff..a7642d080d2b 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-m28evk.dts
@@ -23,7 +23,7 @@ reg_vddio_sd0: regulator-1 {
 		regulator-name = "vddio-sd0";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 28 0>;
+		gpios = <&gpio3 28 0>;
 	};
 
 	reg_usb0_vbus: regulator-2 {
@@ -31,7 +31,7 @@ reg_usb0_vbus: regulator-2 {
 		regulator-name = "usb0_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 12 0>;
+		gpios = <&gpio3 12 0>;
 	};
 
 	reg_usb1_vbus: regulator-3 {
@@ -39,7 +39,7 @@ reg_usb1_vbus: regulator-3 {
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 13 0>;
+		gpios = <&gpio3 13 0>;
 	};
 
 	sound {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts b/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
index 0f01dded4e3d..009fbe0415c9 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts
@@ -20,7 +20,7 @@ reg_usb0_vbus: regulator-0 {
 		regulator-name = "usb0_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 9 0>;
+		gpios = <&gpio3 9 0>;
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-ts4600.dts b/arch/arm/boot/dts/nxp/mxs/imx28-ts4600.dts
index ae6ed5c41be3..830f808398b7 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-ts4600.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-ts4600.dts
@@ -24,7 +24,7 @@ reg_vddio_sd0: regulator-vddio-sd0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-		gpio = <&gpio3 28 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
 	};
 
 };
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
index 9290635352f1..f85289ca83af 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
@@ -45,7 +45,7 @@ reg_usb0_vbus: regulator-usb0-vbus {
 		regulator-name = "usb0_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -54,7 +54,7 @@ reg_usb1_vbus: regulator-usb1-vbus {
 		regulator-name = "usb1_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -79,7 +79,7 @@ reg_can_xcvr: regulator-can-xcvr {
 		regulator-name = "CAN XCVR";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tx28_flexcan_xcvr_pins>;
 	};
@@ -89,7 +89,7 @@ reg_lcd: regulator-lcd-power {
 		regulator-name = "LCD POWER";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -98,7 +98,7 @@ reg_lcd_reset: regulator-lcd-reset {
 		regulator-name = "LCD RESET";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 30 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <300000>;
 		enable-active-high;
 		regulator-always-on;
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
index 6c5e6856648a..6633c0998f0c 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
@@ -83,11 +83,11 @@ MX28_PAD_GPMI_D07__GPIO_0_7
 };
 
 &reg_fec_3v3 {
-	gpio = <&gpio0 0 0>;
+	gpios = <&gpio0 0 0>;
 };
 
 &reg_usb_5v {
-	gpio = <&gpio0 2 0>;
+	gpios = <&gpio0 2 0>;
 };
 
 &spi2_pins_a {
diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi
index 5a19da9313ae..bb5be154be28 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi
@@ -46,7 +46,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "VCC_USB[1-4]";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>; /* USBH_PEN resp. USBH_P_EN */
+		gpios = <&gpio2 19 GPIO_ACTIVE_LOW>; /* USBH_PEN resp. USBH_P_EN */
 		vin-supply = <&reg_5v0>;
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev.dtsi b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev.dtsi
index ce5e52896b19..acae7a5f5b4d 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev.dtsi
@@ -82,7 +82,7 @@ usb0_vbus: regulator-usb0-vbus {
 		enable-active-high;
 		regulator-always-on;
 		regulator-boot-on;
-		gpio = <&gpio0 6 0>;
+		gpios = <&gpio0 6 0>;
 	};
 
 	supply-voltage-monitor {
diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
index 5dbca83f2230..8e7b04c20779 100644
--- a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
@@ -56,7 +56,7 @@ key-volume-up {
 	vddio_disp_vreg: regulator-vddio-disp {
 		compatible = "regulator-fixed";
 		regulator-name = "vddio_disp";
-		gpio = <&tlmm 34 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 34 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&pm8226_l8>;
 		startup-delay-us = <300>;
 		enable-active-high;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
index a2ca456012f1..8740562ec416 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
@@ -51,7 +51,7 @@ vreg_wlan: wlan-regulator {
 		regulator-min-microvolt = <2950000>;
 		regulator-max-microvolt = <2950000>;
 
-		gpio = <&tlmm 35 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
index ac228965a485..cb3f148a4491 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
@@ -57,7 +57,7 @@ vreg_wlan: wlan-regulator {
 		regulator-min-microvolt = <2950000>;
 		regulator-max-microvolt = <2950000>;
 
-		gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
index a70de21bf139..66758d076954 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
@@ -51,7 +51,7 @@ vreg_wlan: wlan-regulator {
 		regulator-min-microvolt = <2950000>;
 		regulator-max-microvolt = <2950000>;
 
-		gpio = <&tlmm 46 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 46 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
index da3be658e822..0ef99c0ad78d 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
@@ -18,7 +18,7 @@ reg_tsp_3p3v: regulator-tsp-3p3v {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 73 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
index 7d519156d91d..5c5d4adf0d92 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
@@ -140,7 +140,7 @@ reg_backlight_vddio: regulator-backlight-vddio {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 
-		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 74 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&backlight_vddio_default_state>;
@@ -153,7 +153,7 @@ reg_tsp_1p8v: regulator-tsp-1p8v {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 
-		gpio = <&tlmm 114 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 114 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&tsp_en1_default_state>;
@@ -166,7 +166,7 @@ reg_tsp_3p3v: regulator-tsp-3p3v {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&tlmm 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&tsp_en_default_state>;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index 009afd8212c2..5b1e9672c1a8 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -36,7 +36,7 @@ dragon_veth: xc622a331mrg {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vph>;
-		gpio = <&pm8058_gpio 40 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8058_gpio 40 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dragon_veth_gpios>;
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index 947183992850..29b78ac6d22a 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -41,7 +41,7 @@ ext_3p3v: regulator-ext-3p3v {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "ext_3p3v";
 		startup-delay-us = <0>;
-		gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index b3ff8010b149..b033bc3e9f9e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -62,7 +62,7 @@ ext_3p3v: regulator-ext-3p3v {
 		regulator-max-microvolt = <3300000>;
 		regulator-name = "ext_3p3v";
 		startup-delay-us = <0>;
-		gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
index 6fce0112361f..69dabd59c865 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
@@ -60,7 +60,7 @@ vreg_boost: vreg-boost {
 		regulator-always-on;
 		regulator-boot-on;
 
-		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
index a15a44fc0181..1d13e6dbdc2d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
@@ -128,7 +128,7 @@ reg_tsp_1p8v: regulator-tsp-1p8v {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 
-		gpio = <&tlmm 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
index 2ecc5983d365..57cf7f0073c4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
@@ -72,7 +72,7 @@ reg_motor_vdd: regulator-motor-vdd {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&tlmm 111 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 111 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&motor_en_default>;
@@ -85,7 +85,7 @@ reg_vdd_tsp_a: regulator-vdd-tsp-a {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&tlmm 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&tsp_en_default>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
index 376a33125941..4ed71c58c2f4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
@@ -58,7 +58,7 @@ key-volume-up {
 	vddio_disp_vreg: regulator-vddio-disp {
 		compatible = "regulator-fixed";
 		regulator-name = "vddio_disp";
-		gpio = <&tlmm 34 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 34 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <300>;
 		enable-active-high;
 		regulator-boot-on;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
index d0e1bc39f8ef..2f0f11b1bd45 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts
@@ -19,7 +19,7 @@ reg_tsp_3p3v: regulator-tsp-3p3v {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&tlmm 32 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 36f4c997b0b3..c0f6841779de 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -19,7 +19,7 @@ chosen {
 	ext_l2: gpio-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "ext_l2";
-		gpio = <&msmgpio 91 0>;
+		gpios = <&msmgpio 91 0>;
 		startup-delay-us = <10000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index fdb6e22986cf..60521c4f5d02 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -70,7 +70,7 @@ vreg_boost: vreg-boost {
 		regulator-always-on;
 		regulator-boot-on;
 
-		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -94,7 +94,7 @@ vreg_wlan: wlan-regulator {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 26 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
index 903bb4d12513..d0194bd60cc1 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
@@ -54,7 +54,7 @@ touch_ldo: regulator-touch {
 		compatible = "regulator-fixed";
 		regulator-name = "touch-ldo";
 
-		gpio = <&pm8941_gpios 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8941_gpios 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-boot-on;
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index d34659ebac22..320c7ad238c5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -76,7 +76,7 @@ vreg_boost: vreg-boost {
 		regulator-always-on;
 		regulator-boot-on;
 
-		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
index fe227fd3f908..c84fb224b874 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
@@ -68,7 +68,7 @@ vreg_boost: vreg-boost {
 		regulator-always-on;
 		regulator-boot-on;
 
-		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index b896cc1ad6f7..876b31fe8101 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -46,7 +46,7 @@ vreg_boost: vreg-boost {
 		regulator-always-on;
 		regulator-boot-on;
 
-		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&boost_bypass_n_pin>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 4c8edadea0ac..29107a8eecd9 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -62,7 +62,7 @@ vreg_boost: vreg-boost {
 		regulator-always-on;
 		regulator-boot-on;
 
-		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
index d3959741d2ea..8f3d8dc8a92a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte-common.dtsi
@@ -133,7 +133,7 @@ vreg_wlan: wlan-regulator {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio_expander 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio_expander 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -147,7 +147,7 @@ vreg_panel: panel-regulator {
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
 
-		gpio = <&pma8084_gpios 14 GPIO_ACTIVE_HIGH>;
+		gpios = <&pma8084_gpios 14 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 409d1798de34..fc77b9f3d5fa 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -12,7 +12,7 @@ vreg_bl_vddio: lcd-backlight-vddio {
 		regulator-min-microvolt = <3150000>;
 		regulator-max-microvolt = <3150000>;
 
-		gpio = <&tlmm 69 0>;
+		gpios = <&tlmm 69 0>;
 		enable-active-high;
 
 		vin-supply = <&pm8941_s3>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
index 6af7c71c7158..5205314a45be 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi
@@ -45,7 +45,7 @@ vreg_vsp: lcd-dcdc-regulator {
 		regulator-min-microvolt = <5600000>;
 		regulator-max-microvolt = <5600000>;
 
-		gpio = <&pm8941_gpios 20 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8941_gpios 20 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&lcd_dcdc_en_pin_a>;
@@ -62,7 +62,7 @@ vreg_boost: vreg-boost {
 		regulator-always-on;
 		regulator-boot-on;
 
-		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -86,7 +86,7 @@ vreg_wlan: wlan-regulator {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&pm8941_gpios 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&pm8941_gpios 18 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-0 = <&wlan_regulator_pin>;
diff --git a/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
index 4351c5a02fa5..a5f7e0973c88 100644
--- a/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
@@ -122,7 +122,7 @@ vcc_3v3_tft1: regulator-panel {
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		startup-delay-us = <500>;
-		gpio = <&gpio7 25 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 25 GPIO_ACTIVE_HIGH>;
 	};
 
 	vcc_sdhi1: regulator-vcc-sdhi1 {
@@ -132,7 +132,7 @@ vcc_sdhi1: regulator-vcc-sdhi1 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio1 16 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
 	};
 
 	vccq_sdhi1: regulator-vccq-sdhi1 {
diff --git a/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
index 3d02f065f71c..3f3d905bc5ba 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
@@ -48,7 +48,7 @@ vcc_sdhi0: regulator-sdhi0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&pfc 76 GPIO_ACTIVE_HIGH>;
+		gpios = <&pfc 76 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index e1ac2c161e73..8c2329ad35da 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -46,7 +46,7 @@ vcc_sdhi0: regulator-vcc-sdhi0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&pfc 75 GPIO_ACTIVE_HIGH>;
+		gpios = <&pfc 75 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
index 64102b664055..c8760d6169c9 100644
--- a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
@@ -139,7 +139,7 @@ vcc_3v3_tft1: regulator-panel {
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		startup-delay-us = <500>;
-		gpio = <&gpio5 28 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 28 GPIO_ACTIVE_HIGH>;
 	};
 
 	vcc_sdhi2: regulator-vcc-sdhi2 {
@@ -149,7 +149,7 @@ vcc_sdhi2: regulator-vcc-sdhi2 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio1 27 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 27 GPIO_ACTIVE_LOW>;
 	};
 
 	vccq_sdhi2: regulator-vccq-sdhi2 {
diff --git a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
index 24411044ef6c..cf67b0b0ac17 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
@@ -77,7 +77,7 @@ vccq_panel: regulator-vccq-panel {
 		regulator-name = "Panel VccQ";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 13 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 13 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 8590981245a6..7a15bc686432 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -147,7 +147,7 @@ vcc_sdhi0: regulator-vcc-sdhi0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio5 24 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 24 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -170,7 +170,7 @@ vcc_sdhi2: regulator-vcc-sdhi2 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio5 25 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 25 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index 683f7395fab0..f21477e3fb28 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -69,7 +69,7 @@ vcc_sdhi0: regulator-vcc-sdhi0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio5 24 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 24 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 0efd9f98c75a..7dca5c5b3636 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -199,7 +199,7 @@ vcc_sdhi0: regulator-vcc-sdhi0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio7 17 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -222,7 +222,7 @@ vcc_sdhi1: regulator-vcc-sdhi1 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio7 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 18 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -245,7 +245,7 @@ vcc_sdhi2: regulator-vcc-sdhi2 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio7 19 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
index 540a9ad28f28..70f81a57c04f 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
@@ -177,7 +177,7 @@ vcc_sdhi0: regulator-vcc-sdhi0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio11 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio11 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
index 000f21a2a863..4854e4d78bba 100644
--- a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
@@ -73,7 +73,7 @@ vcc_sdhi0: regulator-vcc-sdhi0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio11 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio11 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
index 1ea6c757893b..f3f7890fab28 100644
--- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
+++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
@@ -190,7 +190,7 @@ vcc_sdhi0: regulator-vcc-sdhi0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio7 17 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 17 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -213,7 +213,7 @@ vcc_sdhi1: regulator-vcc-sdhi1 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio7 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 18 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -236,7 +236,7 @@ vcc_sdhi2: regulator-vcc-sdhi2 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio7 19 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
index b5ecafbb2e4d..c31228074098 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
@@ -51,7 +51,7 @@ vcc_sdhi0: regulator-vcc-sdhi0 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -74,7 +74,7 @@ vcc_sdhi1: regulator-vcc-sdhi1 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio4 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
index 595e074085eb..4aae7e95ab45 100644
--- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
+++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
@@ -127,7 +127,7 @@ vcc_sdhi1: regulator-vcc-sdhi1 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio4 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
index 98897f710063..efb1794e3fe5 100644
--- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
@@ -65,7 +65,7 @@ vmmc_sdhi0: regulator-vmmc-sdhi0 {
 		regulator-name = "SDHI0 Vcc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&pfc 15 GPIO_ACTIVE_HIGH>;
+		gpios = <&pfc 15 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -74,7 +74,7 @@ vmmc_sdhi2: regulator-vmmc-sdhi2 {
 		regulator-name = "SDHI2 Vcc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&pfc 14 GPIO_ACTIVE_HIGH>;
+		gpios = <&pfc 14 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts b/arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts
index f924d4d64c3d..030558bdd33a 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts
+++ b/arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts
@@ -39,7 +39,7 @@ vcc_sd0: fixed-regulator {
 		regulator-name = "sdmmc-supply";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio3 RK_PA7 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <100000>;
 		vin-supply = <&vcc_io>;
 	};
diff --git a/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts b/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
index f6e8d49a02ef..b3a78cd56a54 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
+++ b/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
@@ -36,7 +36,7 @@ vcc_sd0: sdmmc-regulator {
 		regulator-name = "sdmmc-supply";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio3 RK_PA7 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <100000>;
 		vin-supply = <&vcc_io>;
 	};
diff --git a/arch/arm/boot/dts/rockchip/rk3066a-mk808.dts b/arch/arm/boot/dts/rockchip/rk3066a-mk808.dts
index 4de9a45c4883..8a28c7cb15df 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a-mk808.dts
+++ b/arch/arm/boot/dts/rockchip/rk3066a-mk808.dts
@@ -78,7 +78,7 @@ vcc_io: vcc-io {
 	vcc_host: usb-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&host_drv>;
 		pinctrl-names = "default";
 		regulator-always-on;
@@ -92,7 +92,7 @@ vcc_host: usb-host-regulator {
 	vcc_otg: usb-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&otg_drv>;
 		pinctrl-names = "default";
 		regulator-always-on;
@@ -105,7 +105,7 @@ vcc_otg: usb-otg-regulator {
 
 	vcc_sd: sdmmc-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio3 RK_PA7 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_LOW>;
 		pinctrl-0 = <&sdmmc_pwr>;
 		pinctrl-names = "default";
 		regulator-name = "vcc_sd";
@@ -118,7 +118,7 @@ vcc_sd: sdmmc-regulator {
 	vcc_wifi: sdio-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 RK_PD0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 RK_PD0 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&wifi_pwr>;
 		pinctrl-names = "default";
 		regulator-name = "vcc_wifi";
diff --git a/arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts b/arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts
index 29d8e5bf88f5..704485174ef3 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts
+++ b/arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts
@@ -84,7 +84,7 @@ vcc_emmc: emmc-regulator {
 	vcc_sata: sata-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sata_pwr>;
 		regulator-name = "usb_5v";
@@ -96,7 +96,7 @@ vcc_sata: sata-regulator {
 
 	vcc_sd: sdmmc-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio3 RK_PA7 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwr>;
 		regulator-name = "vcc_sd";
@@ -109,7 +109,7 @@ vcc_sd: sdmmc-regulator {
 	vcc_host: usb-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_drv>;
 		regulator-name = "host-pwr";
@@ -122,7 +122,7 @@ vcc_host: usb-host-regulator {
 	vcc_otg: usb-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&otg_drv>;
 		regulator-name = "vcc_otg";
diff --git a/arch/arm/boot/dts/rockchip/rk3128-evb.dts b/arch/arm/boot/dts/rockchip/rk3128-evb.dts
index c7ab7fcdb436..d60c05693343 100644
--- a/arch/arm/boot/dts/rockchip/rk3128-evb.dts
+++ b/arch/arm/boot/dts/rockchip/rk3128-evb.dts
@@ -26,7 +26,7 @@ memory@60000000 {
 
 	vcc5v0_otg: vcc5v0-otg-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio0 26 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 26 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&otg_vbus_drv>;
 		regulator-name = "vcc5v0_otg";
@@ -36,7 +36,7 @@ vcc5v0_otg: vcc5v0-otg-regulator {
 
 	vcc5v0_host: vcc5v0-host-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio2 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "vcc5v0_host";
diff --git a/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts b/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
index 21c1678f4e91..321d8464c107 100644
--- a/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
+++ b/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
@@ -64,7 +64,7 @@ hdmi_connector_in: endpoint {
 	 */
 	host_pwr_5v: host-pwr-5v-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <1500>;
 		regulator-name = "HOST_PWR_5V";
 		regulator-min-microvolt = <5000000>;
@@ -153,7 +153,7 @@ vcc_lan: vcc-lan-regulator {
 
 	vcc_sd: vcc-sd-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio1 RK_PB6 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 RK_PB6 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <500>;
 		regulator-name = "VCC_SD";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts b/arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts
index 9312be362a7a..378e78761319 100644
--- a/arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts
+++ b/arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts
@@ -135,7 +135,7 @@ avdd_cif: cif-avdd-regulator {
 		regulator-name = "avdd-cif";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpio1 RK_PA6 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio1 RK_PA6 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cif_avdd_en>;
 		startup-delay-us = <100000>;
@@ -148,7 +148,7 @@ vcc_5v: vcc-5v-regulator {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio0 RK_PA3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PA3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&v5_drv>;
 		vin-supply = <&vsys>;
@@ -157,7 +157,7 @@ vcc_5v: vcc-5v-regulator {
 	vcc_lcd: lcd-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc-lcd";
-		gpio = <&gpio0 RK_PB0 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio0 RK_PB0 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_en>;
 		startup-delay-us = <50000>;
@@ -170,7 +170,7 @@ vcc_otg: usb-otg-regulator {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		enable-active-high;
-		gpio = <&gpio3 RK_PB1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 RK_PB1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&otg_drv>;
 		startup-delay-us = <100000>;
@@ -182,7 +182,7 @@ vcc_sd: sdmmc-regulator {
 		regulator-name = "vcc-sd";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 RK_PA1 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 RK_PA1 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwr>;
 		startup-delay-us = <100000>;
diff --git a/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts b/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts
index 118deacd38c4..a24d58ee7687 100644
--- a/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rockchip/rk3188-radxarock.dts
@@ -81,7 +81,7 @@ ir_recv: ir-receiver {
 	vcc_otg: usb-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 RK_PD7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 RK_PD7 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&otg_vbus_drv>;
 		regulator-name = "otg-vbus";
@@ -96,7 +96,7 @@ vcc_sd0: sdmmc-regulator {
 		regulator-name = "sdmmc-supply";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 RK_PA1 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio3 RK_PA1 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwr>;
 		startup-delay-us = <100000>;
@@ -106,7 +106,7 @@ vcc_sd0: sdmmc-regulator {
 	vcc_host: usb-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PA3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PA3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "host-pwr";
diff --git a/arch/arm/boot/dts/rockchip/rk3229-evb.dts b/arch/arm/boot/dts/rockchip/rk3229-evb.dts
index 5c3d08e3eea3..718882e7ef21 100644
--- a/arch/arm/boot/dts/rockchip/rk3229-evb.dts
+++ b/arch/arm/boot/dts/rockchip/rk3229-evb.dts
@@ -37,7 +37,7 @@ ext_gmac: ext_gmac {
 	vcc_host: vcc-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "vcc_host";
diff --git a/arch/arm/boot/dts/rockchip/rk3229-xms6.dts b/arch/arm/boot/dts/rockchip/rk3229-xms6.dts
index 7bfbfd11fb55..7e588eb3add7 100644
--- a/arch/arm/boot/dts/rockchip/rk3229-xms6.dts
+++ b/arch/arm/boot/dts/rockchip/rk3229-xms6.dts
@@ -54,7 +54,7 @@ sdio_pwrseq: sdio-pwrseq {
 	vcc_host: vcc-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 RK_PC4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "vcc_host";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts b/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts
index 8a635c243127..e8d69c88ed3f 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-evb-act8846.dts
@@ -10,7 +10,7 @@ / {
 	vcc_lcd: vcc-lcd {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio7 RK_PA3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 RK_PA3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_en>;
 		regulator-name = "vcc_lcd";
@@ -20,7 +20,7 @@ vcc_lcd: vcc-lcd {
 	vcc_wl: vcc-wl {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio7 RK_PB1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 RK_PB1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wifi_pwr>;
 		regulator-name = "vcc_wl";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi b/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi
index 382d2839cf47..505f7350f36e 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-evb.dtsi
@@ -132,7 +132,7 @@ key-power {
 	vcc_host: vcc-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "vcc_host";
@@ -143,7 +143,7 @@ vcc_host: vcc-host-regulator {
 	vcc_phy: vcc-phy-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&eth_phy_pwr>;
 		regulator-name = "vcc_phy";
@@ -169,7 +169,7 @@ vcc_sys: vsys-regulator {
 	 */
 	vcc_sd: sdmmc-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwr>;
 		regulator-name = "vcc_sd";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts b/arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts
index a5a0826341e6..c665530d8481 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts
@@ -88,7 +88,7 @@ spdif_out: spdif-out {
 	vcc_host_5v: usb-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "vcc_host_5v";
@@ -109,7 +109,7 @@ vcc_5v: vcc_sys: vsys-regulator {
 
 	vcc_sd: sdmmc-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwr>;
 		regulator-name = "vcc_sd";
@@ -122,7 +122,7 @@ vcc_sd: sdmmc-regulator {
 	vcc_otg_5v: usb-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&otg_vbus_drv>;
 		regulator-name = "vcc_otg_5v";
@@ -135,7 +135,7 @@ vcc_otg_5v: usb-otg-regulator {
 	dovdd_1v8: dovdd-1v8-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dvp_pwr>;
 		regulator-name = "dovdd_1v8";
@@ -147,7 +147,7 @@ dovdd_1v8: dovdd-1v8-regulator {
 	vcc28_dvp: vcc28-dvp-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dvp_pwr>;
 		regulator-name = "vcc28_dvp";
@@ -159,7 +159,7 @@ vcc28_dvp: vcc28-dvp-regulator {
 	af_28: af_28-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dvp_pwr>;
 		regulator-name = "af_28";
@@ -171,7 +171,7 @@ af_28: af_28-regulator {
 	dvdd_1v2: af_28-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio7 RK_PB4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 RK_PB4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cif_pwr>;
 		regulator-name = "dvdd_1v2";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi b/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi
index 3836c61cfb76..724a21d29fe1 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi
@@ -90,7 +90,7 @@ vbat_wl: vcc_sys: vsys-regulator {
 
 	vcc_sd: sdmmc-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwr>;
 		regulator-name = "vcc_sd";
@@ -121,7 +121,7 @@ vcc_5v: usb-regulator {
 	vcc_host_5v: usb-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "vcc_host_5v";
@@ -134,7 +134,7 @@ vcc_host_5v: usb-host-regulator {
 	vcc_otg_5v: usb-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&otg_vbus_drv>;
 		regulator-name = "vcc_otg_5v";
@@ -151,7 +151,7 @@ vcc_otg_5v: usb-otg-regulator {
 	vcc28_dvp: vcc28-dvp-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dvp_pwr>;
 		regulator-name = "vcc28_dvp";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-miqi.dts b/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
index db1eb648e0e1..f3b5f66cecab 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-miqi.dts
@@ -48,7 +48,7 @@ vcc_flash: flash-regulator {
 	vcc_host: usb-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "vcc_host";
@@ -60,7 +60,7 @@ vcc_host: usb-host-regulator {
 
 	vcc_sd: sdmmc-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwr>;
 		regulator-name = "vcc_sd";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts b/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
index 1a5156951492..bb6231151800 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts
@@ -37,7 +37,7 @@ button-1 {
 
 	vcc_host0_5v: usb-host0-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio2 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host0_vbus_drv>;
 		regulator-name = "vcc_host0_5v";
@@ -49,7 +49,7 @@ vcc_host0_5v: usb-host0-regulator {
 
 	vcc_host1_5v: usb-host1-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio2 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host1_vbus_drv>;
 		regulator-name = "vcc_host1_5v";
@@ -61,7 +61,7 @@ vcc_host1_5v: usb-host1-regulator {
 
 	vcc_otg_5v: usb-otg-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio2 12 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&otg_vbus_drv>;
 		regulator-name = "vcc_otg_5v";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-popmetal.dts b/arch/arm/boot/dts/rockchip/rk3288-popmetal.dts
index fd90f3b8fc32..bcfa6d818c8d 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-popmetal.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-popmetal.dts
@@ -57,7 +57,7 @@ vcc_flash: flash-regulator {
 
 	vcc_sd: sdmmc-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwr>;
 		regulator-name = "vcc_sd";
@@ -91,7 +91,7 @@ vcc18_dvp: vcc18-dvp-regulator {
 	vcc28_dvp: vcc28-dvp-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PC1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PC1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dvp_pwr>;
 		regulator-name = "vcc28_dvp";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-r89.dts b/arch/arm/boot/dts/rockchip/rk3288-r89.dts
index 633e5a032463..a63c01c37517 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-r89.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-r89.dts
@@ -51,7 +51,7 @@ ir: ir-receiver {
 	vcc_host: vcc-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "vcc_host";
@@ -62,7 +62,7 @@ vcc_host: vcc-host-regulator {
 	vcc_otg: vcc-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&otg_vbus_drv>;
 		regulator-name = "vcc_otg";
@@ -75,7 +75,7 @@ vcc_sdmmc: sdmmc-regulator {
 		regulator-name = "sdmmc-supply";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <100000>;
 		vin-supply = <&vcc_io>;
 	};
diff --git a/arch/arm/boot/dts/rockchip/rk3288-rock2-square.dts b/arch/arm/boot/dts/rockchip/rk3288-rock2-square.dts
index 13cfdaa95cc7..9d38056f2352 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-rock2-square.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-rock2-square.dts
@@ -73,7 +73,7 @@ simple-audio-card,dai-link@1 {  /* S/PDIF - S/PDIF */
 	sata_pwr: sata-prw-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 13 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sata_pwr_en>;
 		/* Always turn on the 5V sata power connector */
@@ -111,7 +111,7 @@ sdio_pwrseq: sdio-pwrseq {
 	vcc_usb_host: vcc-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "vcc_host";
@@ -119,7 +119,7 @@ vcc_usb_host: vcc-host-regulator {
 
 	vcc_sd: sdmmc-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio7 RK_PB3 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwr>;
 		regulator-name = "vcc_sd";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi b/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
index 09618bb7d872..e6bc55e73fb0 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
@@ -96,7 +96,7 @@ vcc_sys: vsys-regulator {
 
 	vcc_sd: sdmmc-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpio7 11 GPIO_ACTIVE_LOW>;
+		gpios = <&gpio7 11 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdmmc_pwr>;
 		regulator-name = "vcc_sd";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts
index aa33d09184ad..a048575bd874 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts
@@ -31,7 +31,7 @@ vcc33_io: vcc33_io {
 	vcc5_host2: vcc5-host2-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb2_pwr_en>;
 		regulator-name = "vcc5_host2";
@@ -105,7 +105,7 @@ vcc18_hdmi: SWITCH_REG2 {
 
 &vcc50_hdmi {
 	enable-active-high;
-	gpio = <&gpio7 RK_PA2 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio7 RK_PA2 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&vcc50_hdmi_en>;
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-chromebook.dtsi b/arch/arm/boot/dts/rockchip/rk3288-veyron-chromebook.dtsi
index 092316be67f7..c8a907682410 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-chromebook.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-chromebook.dtsi
@@ -62,7 +62,7 @@ vcc_5v: vcc-5v {
 	vcc5_host1: vcc5-host1-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host1_pwr_en>;
 		regulator-name = "vcc5_host1";
@@ -74,7 +74,7 @@ vcc5_host1: vcc5-host1-regulator {
 	vcc5v_otg: vcc5v-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usbotg_pwren_h>;
 		regulator-name = "vcc5_host2";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-edp.dtsi b/arch/arm/boot/dts/rockchip/rk3288-veyron-edp.dtsi
index 32c0f10765dd..3126db32c898 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-edp.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-edp.dtsi
@@ -9,7 +9,7 @@ / {
 	backlight_regulator: backlight-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&bl_pwr_en>;
 		regulator-name = "backlight_regulator";
@@ -20,7 +20,7 @@ backlight_regulator: backlight-regulator {
 	panel_regulator: panel-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio7 RK_PB6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 RK_PB6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_enable_h>;
 		regulator-name = "panel_regulator";
@@ -30,7 +30,7 @@ panel_regulator: panel-regulator {
 	vcc18_lcd: vcc18-lcd {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&avdd_1v8_disp_en>;
 		regulator-name = "vcc18_lcd";
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
index 309b122b4d0d..635a139b8a4b 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts
@@ -39,7 +39,7 @@ vcc33_io: vcc33-io {
 	vcc5_host1: vcc5-host1-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio5 RK_PC2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 RK_PC2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hub_usb1_pwr_en>;
 		regulator-name = "vcc5_host1";
@@ -50,7 +50,7 @@ vcc5_host1: vcc5-host1-regulator {
 	vcc5_host2: vcc5-host2-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio5 RK_PB6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 RK_PB6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hub_usb2_pwr_en>;
 		regulator-name = "vcc5_host2";
@@ -61,7 +61,7 @@ vcc5_host2: vcc5-host2-regulator {
 	vcc5v_otg: vcc5v-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb_otg_pwr_en>;
 		regulator-name = "vcc5_otg";
@@ -190,14 +190,14 @@ btmrvl: btmrvl@2 {
 
 &vcc50_hdmi {
 	enable-active-high;
-	gpio = <&gpio5 RK_PC3 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio5 RK_PC3 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&vcc50_hdmi_en>;
 };
 
 &vcc_5v {
 	enable-active-high;
-	gpio = <&gpio7 RK_PC5 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio7 RK_PC5 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&drv_5v>;
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts
index 0d4c50e05558..01f564cb3ab7 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts
@@ -68,14 +68,14 @@ &sdmmc {
 
 &vcc_5v {
 	enable-active-high;
-	gpio = <&gpio7 RK_PC5 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio7 RK_PC5 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&drv_5v>;
 };
 
 &vcc50_hdmi {
 	enable-active-high;
-	gpio = <&gpio5 RK_PC3 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio5 RK_PC3 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&vcc50_hdmi_en>;
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts
index 6894763979f0..9a0853f76966 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts
@@ -198,14 +198,14 @@ &sdmmc {
 
 &vcc_5v {
 	enable-active-high;
-	gpio = <&gpio7 RK_PC5 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio7 RK_PC5 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&drv_5v>;
 };
 
 &vcc50_hdmi {
 	enable-active-high;
-	gpio = <&gpio5 RK_PC3 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio5 RK_PC3 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&vcc50_hdmi_en>;
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts
index ffd1121d19be..f711604e5fbd 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts
@@ -447,7 +447,7 @@ &usb_host1 {
 
 &vcc50_hdmi {
 	enable-active-high;
-	gpio = <&gpio7 RK_PB3 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio7 RK_PB3 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&power_hdmi_on>;
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dts
index dcdcc55c4098..a02ab9f12a58 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dts
@@ -120,14 +120,14 @@ &sdmmc {
 
 &vcc_5v {
 	enable-active-high;
-	gpio = <&gpio7 RK_PC5 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio7 RK_PC5 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&drv_5v>;
 };
 
 &vcc50_hdmi {
 	enable-active-high;
-	gpio = <&gpio5 RK_PC3 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio5 RK_PC3 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&vcc50_hdmi_en>;
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dts b/arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dts
index 336cd2be5265..50d2b3f62571 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dts
@@ -60,14 +60,14 @@ &sdmmc {
 
 &vcc_5v {
 	enable-active-high;
-	gpio = <&gpio7 RK_PC5 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio7 RK_PC5 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&drv_5v>;
 };
 
 &vcc50_hdmi {
 	enable-active-high;
-	gpio = <&gpio5 RK_PC3 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpio5 RK_PC3 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&vcc50_hdmi_en>;
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3288-vmarc-som.dtsi b/arch/arm/boot/dts/rockchip/rk3288-vmarc-som.dtsi
index 793951655b73..7836c897f371 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-vmarc-som.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-vmarc-som.dtsi
@@ -352,10 +352,10 @@ &usb_otg {
 
 &vbus_host {
 	enable-active-high;
-	gpio = <&gpio0 RK_PC1 GPIO_ACTIVE_HIGH>; /* USB1_EN_OC# */
+	gpios = <&gpio0 RK_PC1 GPIO_ACTIVE_HIGH>; /* USB1_EN_OC# */
 };
 
 &vbus_typec {
 	enable-active-high;
-	gpio = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>; /* USB0_EN_OC# */
+	gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>; /* USB0_EN_OC# */
 };
diff --git a/arch/arm/boot/dts/rockchip/rk3288-vyasa.dts b/arch/arm/boot/dts/rockchip/rk3288-vyasa.dts
index b156a83eb7d7..ee702d24f010 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-vyasa.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-vyasa.dts
@@ -82,7 +82,7 @@ vcc50_hdmi: vcc50-hdmi {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc50_hdmi";
 		enable-active-high;
-		gpio = <&gpio7 RK_PB4 GPIO_ACTIVE_HIGH>; /* HDMI_EN */
+		gpios = <&gpio7 RK_PB4 GPIO_ACTIVE_HIGH>; /* HDMI_EN */
 		pinctrl-names = "default";
 		pinctrl-0 = <&vcc50_hdmi_en>;
 		regulator-always-on;
@@ -94,7 +94,7 @@ vusb1_5v: vusb1-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "vusb1_5v";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>; /* OTG_VBUS_DRV */
+		gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>; /* OTG_VBUS_DRV */
 		pinctrl-names = "default";
 		pinctrl-0 = <&otg_vbus_drv>;
 		regulator-min-microvolt = <5000000>;
@@ -106,7 +106,7 @@ vusb2_5v: vusb2-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "vusb2_5v";
 		enable-active-high;
-		gpio = <&gpio8 RK_PB1 GPIO_ACTIVE_HIGH>; /* USB2_PWR_EN */
+		gpios = <&gpio8 RK_PB1 GPIO_ACTIVE_HIGH>; /* USB2_PWR_EN */
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb2_pwr_en>;
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2.dtsi b/arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2.dtsi
index 7ea8d7d16f5f..496636a06e60 100644
--- a/arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2.dtsi
@@ -14,7 +14,7 @@ aliases {
 	vccio_flash: vccio-flash-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&flash_vol_sel>;
 		regulator-name = "vccio_flash";
diff --git a/arch/arm/boot/dts/samsung/exynos3250-monk.dts b/arch/arm/boot/dts/samsung/exynos3250-monk.dts
index 2de877d4ccc5..dfae751bbf83 100644
--- a/arch/arm/boot/dts/samsung/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/samsung/exynos3250-monk.dts
@@ -52,7 +52,7 @@ vemmc_reg: voltage-regulator-0 {
 		regulator-name = "V_EMMC_2.8V-fixed";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpk0 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpk0 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 0d8495792a70..f12f427650bc 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -40,7 +40,7 @@ vemmc_reg: regulator-0 {
 		regulator-name = "VMEM_VDD_2.8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpk0 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpk0 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -49,7 +49,7 @@ tsp_reg: regulator-1 {
 		regulator-name = "TSP_FIXED_VOLTAGES";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpl0 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpl0 3 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 		regulator-boot-on;
@@ -61,7 +61,7 @@ cam_af_28v_reg: regulator-2 {
 		regulator-name = "8M_AF_2.8V_EN";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpk1 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpk1 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -70,7 +70,7 @@ cam_io_en_reg: regulator-3 {
 		regulator-name = "CAM_IO_EN";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpe2 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpe2 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -79,7 +79,7 @@ cam_io_12v_reg: regulator-4 {
 		regulator-name = "8M_1.2V_EN";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		gpio = <&gpe2 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpe2 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -88,7 +88,7 @@ vt_core_15v_reg: regulator-5 {
 		regulator-name = "VT_CORE_1.5V";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&gpe2 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpe2 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4210-origen.dts b/arch/arm/boot/dts/samsung/exynos4210-origen.dts
index f1927ca15e08..5a550ac4b899 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-origen.dts
@@ -45,7 +45,7 @@ mmc_reg: voltage-regulator {
 		regulator-name = "VMEM_VDD_2.8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpx1 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4210-trats.dts b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
index 95e0e01b6ff6..aad31baaf146 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
@@ -42,7 +42,7 @@ vemmc_reg: regulator-0 {
 		regulator-name = "VMEM_VDD_2.8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpk0 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpk0 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -51,7 +51,7 @@ tsp_reg: regulator-1 {
 		regulator-name = "TSP_FIXED_VOLTAGES";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpl0 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpl0 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -60,7 +60,7 @@ cam_af_28v_reg: regulator-2 {
 		regulator-name = "8M_AF_2.8V_EN";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpk1 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpk1 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -69,7 +69,7 @@ cam_io_en_reg: regulator-3 {
 		regulator-name = "CAM_IO_EN";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpe2 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpe2 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -78,7 +78,7 @@ cam_io_12v_reg: regulator-4 {
 		regulator-name = "8M_1.2V_EN";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		gpio = <&gpe2 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpe2 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -87,7 +87,7 @@ vt_core_15v_reg: regulator-5 {
 		regulator-name = "VT_CORE_1.5V";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&gpe2 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpe2 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
index bdc30f8cf748..1c86d68a58c0 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
@@ -60,7 +60,7 @@ vemmc_reg: voltage-regulator {
 		regulator-name = "VMEM_VDD_2_8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpe1 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpe1 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -122,7 +122,7 @@ tsp_reg: voltage-regulator {
 		regulator-name = "TSP_2_8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpe2 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpe2 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -177,7 +177,7 @@ hdmi_en: voltage-regulator-hdmi-5v {
 		regulator-name = "HDMI_5V";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpe0 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpe0 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 9bc05961577d..09c8b085e89e 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -271,7 +271,7 @@ backlight_reset_supply: voltage-regulator-2 {
 		regulator-name = "BACKLIGHT_ENVDDIO";
 		pinctrl-names = "default";
 		pinctrl-0 = <&backlight_reset>;
-		gpio = <&gpm0 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpm0 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -282,7 +282,7 @@ display_3v3_supply: voltage-regulator-3 {
 		regulator-max-microvolt = <3300000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_en>;
-		gpio = <&gpc0 1 GPIO_ACTIVE_HIGH>; /* LCD_EN */
+		gpios = <&gpc0 1 GPIO_ACTIVE_HIGH>; /* LCD_EN */
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
index 54e1a57ae886..f3d804409ce5 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
@@ -40,7 +40,7 @@ lcd_vdd3_reg: voltage-regulator-10 {
 		regulator-name = "LCD_VDD_2.2V";
 		regulator-min-microvolt = <2200000>;
 		regulator-max-microvolt = <2200000>;
-		gpio = <&gpc0 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpc0 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -49,7 +49,7 @@ ps_als_reg: voltage-regulator-11 {
 		regulator-name = "LED_A_3.0V";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpj0 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpj0 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -91,12 +91,12 @@ &buck9_reg {
 };
 
 &cam_af_reg {
-	gpio = <&gpm0 4 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpm0 4 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
 &cam_io_reg {
-	gpio = <&gpm0 2 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpm0 2 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
@@ -205,11 +205,11 @@ &sound {
 };
 
 &submic_bias_reg {
-	gpio = <&gpf2 0 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpf2 0 GPIO_ACTIVE_HIGH>;
 	enable-active-high;
 };
 
 &touchkey_reg {
-	gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpm0 0 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 3d5aace668dc..6e01fdc0a893 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -74,7 +74,7 @@ vsil12: voltage-regulator-3 {
 		regulator-name = "VSIL_1.2V";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpl0 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		vin-supply = <&buck7_reg>;
 	};
@@ -84,7 +84,7 @@ vcc33mhl: voltage-regulator-4 {
 		regulator-name = "VCC_3.3_MHL";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpl0 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -93,7 +93,7 @@ vcc18mhl: voltage-regulator-5 {
 		regulator-name = "VCC_1.8_MHL";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpl0 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -119,7 +119,7 @@ mic_bias_reg: voltage-regulator-8 {
 		regulator-name = "MICBIAS_LDO_2.8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpf1 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpf1 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-n710x.dts b/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
index eee1000dea92..d1fb7eb6322f 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
@@ -19,7 +19,7 @@ cam_vdda_reg: voltage-regulator-10 {
 		regulator-name = "CAM_SENSOR_CORE_1.2V";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		gpio = <&gpm4 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpm4 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
@@ -29,12 +29,12 @@ &buck9_reg {
 };
 
 &cam_af_reg {
-	gpio = <&gpm1 1 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpm1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
 &cam_io_reg {
-	gpio = <&gpm0 7 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpm0 7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
@@ -110,6 +110,6 @@ &submic_bias_reg {
 };
 
 &touchkey_reg {
-	gpio = <&gpm0 5 GPIO_ACTIVE_HIGH>;
+	gpios = <&gpm0 5 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu3.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu3.dts
index b1b0916b1505..81a5a2b67361 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu3.dts
@@ -31,7 +31,7 @@ vbus_otg_reg: regulator-1 {
 		regulator-name = "VBUS_VDD_5.0V";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpl2 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpl2 0 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidx.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidx.dts
index 0eb8a2680a20..4048de82dad1 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidx.dts
@@ -48,7 +48,7 @@ regulator-1 {
 		regulator-name = "p3v3_en";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpa1 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpa1 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
diff --git a/arch/arm/boot/dts/samsung/exynos4412-origen.dts b/arch/arm/boot/dts/samsung/exynos4412-origen.dts
index 10ab7bc90f50..9317191d5da6 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-origen.dts
@@ -44,7 +44,7 @@ mmc_reg: regulator-0 {
 		regulator-name = "VMEM_VDD_2.8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpx1 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
index 65b000df176e..7b77177e6d52 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
@@ -180,7 +180,7 @@ usb3_vbus_reg: regulator-usb3 {
 		regulator-name = "P5.0V_USB3CON";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpx2 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpx2 7 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb3_vbus_en>;
 		enable-active-high;
diff --git a/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts b/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
index 3759742d38ca..47ee2ef914e3 100644
--- a/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
@@ -106,7 +106,7 @@ usb300_vbus_reg: regulator-usb300 {
 		regulator-name = "P5.0V_USB3CON0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gph0 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gph0 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb300_vbus_en>;
 		enable-active-high;
@@ -117,7 +117,7 @@ usb301_vbus_reg: regulator-usb301 {
 		regulator-name = "P5.0V_USB3CON1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gph0 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gph0 1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb301_vbus_en>;
 		enable-active-high;
diff --git a/arch/arm/boot/dts/samsung/exynos5420-smdk5420.dts b/arch/arm/boot/dts/samsung/exynos5420-smdk5420.dts
index e299344e427a..4927ba98588c 100644
--- a/arch/arm/boot/dts/samsung/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/samsung/exynos5420-smdk5420.dts
@@ -67,7 +67,7 @@ usb300_vbus_reg: regulator-3 {
 		regulator-name = "VBUS0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpg0 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpg0 5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb300_vbus_en>;
 		enable-active-high;
@@ -78,7 +78,7 @@ usb301_vbus_reg: regulator-4 {
 		regulator-name = "VBUS1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpg1 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpg1 4 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb301_vbus_en>;
 		enable-active-high;
diff --git a/arch/arm/boot/dts/samsung/exynos5422-samsung-k3g.dts b/arch/arm/boot/dts/samsung/exynos5422-samsung-k3g.dts
index c35261a338ff..ba3a62ceef58 100644
--- a/arch/arm/boot/dts/samsung/exynos5422-samsung-k3g.dts
+++ b/arch/arm/boot/dts/samsung/exynos5422-samsung-k3g.dts
@@ -45,7 +45,7 @@ tsp_vdd: regulator-tsp-vdd-en {
 		regulator-name = "tsp_vdd_en";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpy3 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpy3 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
index bb019868b996..6cae9a4a331b 100644
--- a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
@@ -106,7 +106,7 @@ usb300_vbus_reg: regulator-usb300 {
 		regulator-name = "P5.0V_USB3CON0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gph0 0 GPIO_ACTIVE_HIGH>;
+		gpios = <&gph0 0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb300_vbus_en>;
 		enable-active-high;
@@ -117,7 +117,7 @@ usb301_vbus_reg: regulator-usb301 {
 		regulator-name = "P5.0V_USB3CON1";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gph0 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gph0 1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb301_vbus_en>;
 		enable-active-high;
diff --git a/arch/arm/boot/dts/samsung/s5pv210-aquila.dts b/arch/arm/boot/dts/samsung/s5pv210-aquila.dts
index 0f5c6cd0f3a1..2e31bb875475 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aquila.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-aquila.dts
@@ -44,7 +44,7 @@ vtf_reg: regulator-0 {
 		regulator-name = "V_TF_2.8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&mp05 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&mp05 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
index f628d3660493..54c950009563 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
@@ -63,7 +63,7 @@ vibrator_pwr: regulator-fixed-0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vibrator-en";
 		enable-active-high;
-		gpio = <&gpj1 1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&vibrator_ena>;
@@ -75,7 +75,7 @@ touchkey_vdd: regulator-fixed-1 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&gpj3 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpj3 2 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&touchkey_vdd_ena>;
@@ -85,7 +85,7 @@ gp2a_vled: regulator-fixed-2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VLED";
 		enable-active-high;
-		gpio = <&gpj1 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpj1 4 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
 
diff --git a/arch/arm/boot/dts/samsung/s5pv210-fascinate4g.dts b/arch/arm/boot/dts/samsung/s5pv210-fascinate4g.dts
index 149e488f8e74..4990b7197f2c 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-fascinate4g.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-fascinate4g.dts
@@ -40,7 +40,7 @@ key-vol-up {
 	headset_micbias_reg: regulator-fixed-3 {
 		compatible = "regulator-fixed";
 		regulator-name = "Headset_Micbias";
-		gpio = <&gpj2 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpj2 5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -50,7 +50,7 @@ headset_micbias_reg: regulator-fixed-3 {
 	main_micbias_reg: regulator-fixed-4 {
 		compatible = "regulator-fixed";
 		regulator-name = "Main_Micbias";
-		gpio = <&gpj4 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpj4 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts b/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
index 879294412381..8dbc873678ab 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
@@ -77,7 +77,7 @@ fmradio@10 {
 	micbias_reg: regulator-fixed-3 {
 		compatible = "regulator-fixed";
 		regulator-name = "MICBIAS";
-		gpio = <&gpj4 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpj4 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/samsung/s5pv210-goni.dts b/arch/arm/boot/dts/samsung/s5pv210-goni.dts
index d32f42dd1bf5..c9e785e9f3c3 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-goni.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-goni.dts
@@ -47,7 +47,7 @@ vtf_reg: regulator-0 {
 		regulator-name = "V_TF_2.8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&mp05 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&mp05 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -70,7 +70,7 @@ tsp_reg: regulator-3 {
 		regulator-name = "TSP_VDD";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
-		gpio = <&gpj1 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpj1 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 1322abfc7acf..2d9f1128f555 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -54,7 +54,7 @@ en_3v3_reg: en_3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		/* AB8500 GPIOs start from 1 - offset 25 is GPIO26. */
-		gpio = <&ab8500_gpio 25 0x4>;
+		gpios = <&ab8500_gpio 25 0x4>;
 		startup-delay-us = <5000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
index c623cc35c5ea..3b0a399dff7f 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts
@@ -108,7 +108,7 @@ lcd_3v0_reg: regulator-gpio-lcd-3v0 {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		/* GPIO219 controls this regulator */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pwr_en_default_mode>;
@@ -131,7 +131,7 @@ wl_reg: regulator-gpio-wlan {
 		regulator-max-microvolt = <3000000>;
 		startup-delay-us = <100000>;
 		/* GPIO215 (WLAN_RST_N to WL_REG_ON) */
-		gpio = <&gpio6 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 23 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_ldo_en_default>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index 2355ca6e9ad6..a3149a381b58 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -122,7 +122,7 @@ ldo_tsp_3v3_reg: regulator-gpio-tsp-ldo-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		/* GPIO94 controls this regulator */
-		gpio = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
 		/* 70 ms power-on delay */
 		startup-delay-us = <70000>;
 		enable-active-high;
@@ -136,7 +136,7 @@ ldo_tsp_1v8_reg: regulator-gpio-tsp-ldo-1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO94 controls this regulator */
-		gpio = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
 		/* 70 ms power-on delay */
 		startup-delay-us = <70000>;
 		enable-active-high;
@@ -155,7 +155,7 @@ lcd_3v0_reg: regulator-gpio-lcd-3v0 {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		/* GPIO219 controls this regulator */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pwr_en_default_mode>;
@@ -167,7 +167,7 @@ lcd_1v8_reg: regulator-gpio-lcd-1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO219 controls this regulator too */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pwr_en_default_mode>;
@@ -190,7 +190,7 @@ wl_reg: regulator-gpio-wlan {
 		regulator-max-microvolt = <3000000>;
 		startup-delay-us = <100000>;
 		/* GPIO215 (WLAN_RST_N to WL_REG_ON) */
-		gpio = <&gpio6 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 23 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_ldo_en_default>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
index ad9a20ccaaeb..8f4e80bf35fc 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dts
@@ -76,7 +76,7 @@ ldo_3v3_reg: regulator-gpio-ldo-3v3 {
 		regulator-name = "VMEM_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio0 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <5000>; // FIXME
 		enable-active-high;
 		pinctrl-names = "default";
@@ -95,7 +95,7 @@ ldo_tsp_3v3_reg: regulator-gpio-tsp-ldo-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		/* GPIO94 controls this regulator */
-		gpio = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
 		/* 70 ms power-on delay */
 		startup-delay-us = <70000>;
 		enable-active-high;
@@ -109,7 +109,7 @@ ldo_tsp_1v8_reg: regulator-gpio-tsp-ldo-1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO94 controls this regulator */
-		gpio = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
 		/* 70 ms power-on delay */
 		startup-delay-us = <70000>;
 		enable-active-high;
@@ -128,7 +128,7 @@ lcd_3v0_reg: regulator-gpio-lcd-3v0 {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		/* GPIO219 controls this regulator */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pwr_en_default_mode>;
@@ -140,7 +140,7 @@ lcd_1v8_reg: regulator-gpio-lcd-1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO219 controls this regulator too */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pwr_en_default_mode>;
@@ -163,7 +163,7 @@ wl_reg: regulator-gpio-wlan {
 		regulator-max-microvolt = <3000000>;
 		startup-delay-us = <100000>;
 		/* GPIO215 (WLAN_RST_N to WL_REG_ON) */
-		gpio = <&gpio6 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 23 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_ldo_en_default>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
index f736888474e7..8da5222c57b9 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-golden.dts
@@ -459,7 +459,7 @@ vmem_3v3: regulator-vmem {
 		startup-delay-us = <200>;
 
 		/* GPIO223 (MEM_LDO_EN) */
-		gpio = <&gpio6 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 31 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -499,7 +499,7 @@ wl_reg_on: regulator-wl-reg-on {
 		startup-delay-us = <100000>;
 
 		/* GPIO215 (WLAN_EN) */
-		gpio = <&gpio6 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 23 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -514,7 +514,7 @@ panel_reg_1v8: regulator-panel-1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO219 */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 
 		startup-delay-us = <200>;
 		enable-active-high;
@@ -531,7 +531,7 @@ panel_reg_3v0: regulator-panel-3v0 {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		/* GPIO219 */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 
 		startup-delay-us = <200>;
 		enable-active-high;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 229f7c32103c..10b2c1ae9c6b 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -57,7 +57,7 @@ ldo_3v3_reg: regulator-gpio-ldo-3v3 {
 		regulator-name = "VMEM_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio0 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <5000>; // FIXME
 		enable-active-high;
 		pinctrl-names = "default";
@@ -76,7 +76,7 @@ ldo_tsp_3v3_reg: regulator-gpio-tsp-ldo-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		/* GPIO94 controls this regulator */
-		gpio = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
 		/* 70 ms power-on delay */
 		startup-delay-us = <70000>;
 		enable-active-high;
@@ -90,7 +90,7 @@ ldo_tsp_1v8_reg: regulator-gpio-tsp-ldo-1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO94 controls this regulator */
-		gpio = <&gpio2 30 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 30 GPIO_ACTIVE_HIGH>;
 		/* 70 ms power-on delay */
 		startup-delay-us = <70000>;
 		enable-active-high;
@@ -111,7 +111,7 @@ ldo_kled_3v3_reg: regulator-gpio-vreg-kled-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		/* GPIO68 controls this regulator */
-		gpio = <&gpio2 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 4 GPIO_ACTIVE_HIGH>;
 		/* 70 ms power-on delay */
 		startup-delay-us = <70000>;
 		enable-active-high;
@@ -125,7 +125,7 @@ ldo_touchkey_1v8_reg: regulator-gpio-vreg-touchkey-1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO89 controls this regulator */
-		gpio = <&gpio2 25 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
 		/* 70 ms power-on delay */
 		startup-delay-us = <70000>;
 		enable-active-high;
@@ -145,7 +145,7 @@ lcd_3v0_reg: regulator-gpio-lcd-3v0 {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		/* GPIO219 controls this regulator */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pwr_en_default_mode>;
@@ -157,7 +157,7 @@ lcd_1v8_reg: regulator-gpio-lcd-1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO219 controls this regulator */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pwr_en_default_mode>;
@@ -180,7 +180,7 @@ wl_reg: regulator-gpio-wlan {
 		regulator-max-microvolt = <3000000>;
 		startup-delay-us = <100000>;
 		/* GPIO215 (WLAN_RST_N to WL_REG_ON) */
-		gpio = <&gpio6 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 23 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_ldo_en_default>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index cdb147dcc1db..e2f2003b1dd8 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -79,7 +79,7 @@ ldo_3v3_reg: regulator-gpio-ldo-3v3 {
 		regulator-name = "en-3v3-fixed-supply";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio6 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 31 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <5000>;
 		enable-active-high;
 		pinctrl-names = "default";
@@ -97,7 +97,7 @@ lcd_3v0_reg: regulator-gpio-lcd-3v0 {
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
 		/* GPIO219 controls this regulator */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pwr_en_default_mode>;
@@ -109,7 +109,7 @@ lcd_1v8_reg: regulator-gpio-lcd-1v8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		/* GPIO219 controls this regulator too */
-		gpio = <&gpio6 27 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 27 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&lcd_pwr_en_default_mode>;
@@ -122,7 +122,7 @@ wlan_en: regulator-gpio-wlan-en {
 		regulator-max-microvolt = <3000000>;
 		startup-delay-us = <200000>;
 		/* GPIO215 WLAN_EN */
-		gpio = <&gpio6 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 23 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_en_default_mode>;
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index 064d6fee8821..392a24f1e1e2 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -75,7 +75,7 @@ ldo_3v3_reg: regulator-gpio-ldo-3v3 {
 		regulator-name = "en-3v3-fixed-supply";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio6 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 31 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <5000>;
 		enable-active-high;
 		pinctrl-names = "default";
@@ -89,7 +89,7 @@ wlan_en: regulator-gpio-wlan-en {
 		regulator-max-microvolt = <3000000>;
 		startup-delay-us = <200000>;
 		/* GPIO215 WLAN_EN */
-		gpio = <&gpio6 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 23 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_en_default_mode>;
diff --git a/arch/arm/boot/dts/st/stm32f429-disco.dts b/arch/arm/boot/dts/st/stm32f429-disco.dts
index a3cb4aabdd5a..28dfb65b194d 100644
--- a/arch/arm/boot/dts/st/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f429-disco.dts
@@ -94,7 +94,7 @@ button-0 {
 	/* This turns on vbus for otg for host mode (dwc2) */
 	vcc5v_otg: vcc5v-otg-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpioc 4 0>;
+		gpios = <&gpioc 4 0>;
 		regulator-name = "vcc5_host1";
 		regulator-always-on;
 	};
diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
index 8a4f8ddd083d..fb30ccfa810f 100644
--- a/arch/arm/boot/dts/st/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
@@ -111,7 +111,7 @@ button-0 {
 	vcc5v_otg: vcc5v-otg-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpiob 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpiob 2 GPIO_ACTIVE_HIGH>;
 		regulator-name = "vcc5_host1";
 		regulator-always-on;
 	};
diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index 087de6f09629..b64eb9f14eea 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -88,7 +88,7 @@ usbotg_hs_phy: usb-phy {
 	/* This turns on vbus for otg fs for host mode (dwc2) */
 	vcc5v_otg_fs: vcc5v-otg-fs-regulator {
 		compatible = "regulator-fixed";
-		gpio = <&gpiod 5 0>;
+		gpios = <&gpiod 5 0>;
 		regulator-name = "vcc5_host1";
 		regulator-always-on;
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp151a-prtt1c.dts b/arch/arm/boot/dts/st/stm32mp151a-prtt1c.dts
index 3b33b7093b68..8ef5d6c1d5d4 100644
--- a/arch/arm/boot/dts/st/stm32mp151a-prtt1c.dts
+++ b/arch/arm/boot/dts/st/stm32mp151a-prtt1c.dts
@@ -49,7 +49,7 @@ reg_t1l1: regulator-pse-t1l1 {
 		regulator-name = "pse-t1l1";
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
-		gpio = <&gpiog 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpiog 13 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -58,7 +58,7 @@ reg_t1l2: regulator-pse-t1l2 {
 		regulator-name = "pse-t1l2";
 		regulator-min-microvolt = <12000000>;
 		regulator-max-microvolt = <12000000>;
-		gpio = <&gpiog 14 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpiog 14 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
index 5116a7785201..65f36a7ed056 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
@@ -37,7 +37,7 @@ lcd_3v3: regulator-lcd-3v3 {
 		regulator-name = "lcd_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpiof 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpiof 10 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 		power-supply = <&panel_pwr>;
@@ -48,7 +48,7 @@ panel_pwr: regulator-panel-pwr {
 		regulator-name = "panel_pwr";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpiob 10 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpiob 10 GPIO_ACTIVE_HIGH>;
 		regulator-always-on;
 	};
 
diff --git a/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts b/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts
index 81f254fb88b0..4636a248920d 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dts
@@ -27,7 +27,7 @@ reg_iobus_12v: regulator-iobus-12v {
 		compatible = "regulator-fixed";
 		vin-supply = <&reg_12v>;
 
-		gpio = <&gpioh 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpioh 13 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-max-microvolt = <12000000>;
 		regulator-min-microvolt = <12000000>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts b/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts
index 4cc177031661..8fc518cd6e80 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dts
@@ -26,7 +26,7 @@ backlight: backlight {
 	reg_iobus_12v: regulator-iobus-12v {
 		compatible = "regulator-fixed";
 		vin-supply = <&reg_12v>;
-		gpio = <&gpioh 13 GPIO_ACTIVE_LOW>;
+		gpios = <&gpioh 13 GPIO_ACTIVE_LOW>;
 		regulator-max-microvolt = <12000000>;
 		regulator-min-microvolt = <12000000>;
 		regulator-name = "12V_IOBUS";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
index 74a11ccc5333..ea97efc06e14 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
@@ -68,7 +68,7 @@ ethernet_vio: vioregulator {
 		regulator-name = "vio";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpiog 3 GPIO_ACTIVE_LOW>;
+		gpios = <&gpiog 3 GPIO_ACTIVE_LOW>;
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&vdd>;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
index 343a4613dfca..56eb9a84990d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
@@ -99,7 +99,7 @@ wlan_pwr: regulator-wlan {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpioz 3 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpioz 3 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi
index bc4ddcbdd5cf..4cd2949078f5 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-drc-compact.dtsi
@@ -41,7 +41,7 @@ ethernet_vio: vioregulator {
 		regulator-name = "vio";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpioh 2 GPIO_ACTIVE_LOW>;
+		gpios = <&gpioh 2 GPIO_ACTIVE_LOW>;
 		regulator-always-on;
 		regulator-boot-on;
 		vin-supply = <&vdd>;
diff --git a/arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dts b/arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dts
index c162f98cb8e8..e43e53ebcc7a 100644
--- a/arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dts
+++ b/arch/arm/boot/dts/synaptics/berlin2q-marvell-dmp.dts
@@ -32,7 +32,7 @@ reg_usb0_vbus: regulator_usb0 {
 			regulator-name = "usb0_vbus";
 			regulator-min-microvolt = <5000000>;
 			regulator-max-microvolt = <5000000>;
-			gpio = <&portb 8 GPIO_ACTIVE_HIGH>;
+			gpios = <&portb 8 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -41,7 +41,7 @@ reg_usb1_vbus: regulator_usb1 {
 			regulator-name = "usb1_vbus";
 			regulator-min-microvolt = <5000000>;
 			regulator-max-microvolt = <5000000>;
-			gpio = <&portb 10 GPIO_ACTIVE_HIGH>;
+			gpios = <&portb 10 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -50,7 +50,7 @@ reg_usb2_vbus: regulator_usb2 {
 			regulator-name = "usb2_vbus";
 			regulator-min-microvolt = <5000000>;
 			regulator-max-microvolt = <5000000>;
-			gpio = <&portb 12 GPIO_ACTIVE_HIGH>;
+			gpios = <&portb 12 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
 
@@ -61,7 +61,7 @@ reg_sdio1_vmmc: regulator_sdio1_vmmc {
 			regulator-name = "sdio1_vmmc";
 			enable-active-high;
 			regulator-boot-on;
-			gpio = <&portb 21 GPIO_ACTIVE_HIGH>;
+			gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
 		};
 
 		reg_sdio1_vqmmc: regulator_sido1_vqmmc {
diff --git a/arch/arm/boot/dts/ti/davinci/da850-evm.dts b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
index 1f5cd35f8b74..7105e70ea34c 100644
--- a/arch/arm/boot/dts/ti/davinci/da850-evm.dts
+++ b/arch/arm/boot/dts/ti/davinci/da850-evm.dts
@@ -118,7 +118,7 @@ backlight_lcd: backlight-regulator {
 		regulator-name = "lcd_backlight_pwr";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio 47 GPIO_ACTIVE_HIGH>; /* lcd_backlight_pwr */
+		gpios = <&gpio 47 GPIO_ACTIVE_HIGH>; /* lcd_backlight_pwr */
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts b/arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts
index 4df10379ff22..84bf63f5121d 100644
--- a/arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts
+++ b/arch/arm/boot/dts/ti/davinci/da850-lego-ev3.dts
@@ -140,7 +140,7 @@ vcc5v: regulator1 {
 		regulator-name = "vcc5v";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio 101 0>;
+		gpios = <&gpio 101 0>;
 		over-current-gpios = <&gpio 99 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 		regulator-boot-on;
@@ -165,7 +165,7 @@ adc_ref: regulator2 {
 	amp: regulator3 {
 		compatible = "regulator-fixed";
 		regulator-name = "amp";
-		gpio = <&gpio 111 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio 111 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dts b/arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dts
index 264e1e0d23c8..e058f8bee584 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dts
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dts
@@ -116,7 +116,7 @@ vddb: fixedregulator-vddb {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio1 53 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 53 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
index a4beb718559c..5f0c5910cc28 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
@@ -41,7 +41,7 @@ wl12xx_vmmc: fixedregulator2 {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 8 0>;
+		gpios = <&gpio3 8 0>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
index b4b4b80df08c..caef1c23e433 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
@@ -22,7 +22,7 @@ wlan_en_reg: fixedregulator@2 {
 		startup-delay-us = <70000>;
 
 		/* WL_EN */
-		gpio = <&gpio3 9 0>;
+		gpios = <&gpio3 9 0>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
index 8878da773d67..a5eae0ce3b07 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
@@ -109,7 +109,7 @@ wlan_en_reg: fixedregulator@2 {
 		startup-delay-us = <70000>;
 
 		/* WL_EN */
-		gpio = <&gpio3 9 0>;
+		gpios = <&gpio3 9 0>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
index a4f5b5262645..c86079b40bb0 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
@@ -21,7 +21,7 @@ wlan_en_reg: fixedregulator@2 {
 		startup-delay-us = <70000>;
 
 		/* WL_EN */
-		gpio = <&gpio0 26 0>;
+		gpios = <&gpio0 26 0>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts b/arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts
index 06767ea164b5..0bf973bee02a 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts
@@ -42,7 +42,7 @@ vmmc_fixed: fixedregulator0 {
 	vwlan_fixed: fixedregulator2 {
 		compatible = "regulator-fixed";
 		regulator-name = "vwlan_fixed";
-		gpio = <&gpio0 20 GPIO_ACTIVE_HIGH>; /* gpio0_20 */
+		gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>; /* gpio0_20 */
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/am335x-evm.dts b/arch/arm/boot/dts/ti/omap/am335x-evm.dts
index 61bf8bcd4c4e..61f6ba68e473 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-evm.dts
@@ -47,7 +47,7 @@ wlan_en_reg: fixedregulator2 {
 		regulator-max-microvolt = <1800000>;
 
 		/* WLAN_EN GPIO for this board - Bank1, pin16 */
-		gpio = <&gpio1 16 0>;
+		gpios = <&gpio1 16 0>;
 
 		/* WLAN card specific delay */
 		startup-delay-us = <70000>;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-evmsk.dts b/arch/arm/boot/dts/ti/omap/am335x-evmsk.dts
index eba888dcd60e..cb79c5845556 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-evmsk.dts
@@ -54,7 +54,7 @@ wl12xx_vmmc: fixedregulator2 {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio1 29 0>;
+		gpios = <&gpio1 29 0>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
@@ -64,7 +64,7 @@ vtt_fixed: fixedregulator3 {
 		regulator-name = "vtt";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-icev2.dts b/arch/arm/boot/dts/ti/omap/am335x-icev2.dts
index 6f0f4fba043b..8e9d4b3cf859 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-icev2.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-icev2.dts
@@ -38,7 +38,7 @@ vtt_fixed: fixedregulator1 {
 		regulator-name = "vtt";
 		regulator-min-microvolt = <1500000>;
 		regulator-max-microvolt = <1500000>;
-		gpio = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
diff --git a/arch/arm/boot/dts/ti/omap/am3517-som.dtsi b/arch/arm/boot/dts/ti/omap/am3517-som.dtsi
index bd0a6c95afa1..e5c72b1ed929 100644
--- a/arch/arm/boot/dts/ti/omap/am3517-som.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am3517-som.dtsi
@@ -19,7 +19,7 @@ wl12xx_buffer: wl12xx_buf {
 		regulator-max-microvolt = <1800000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wl12xx_buffer_pins>;
-		gpio = <&gpio5 1 GPIO_ACTIVE_LOW>; /* gpio 129 */
+		gpios = <&gpio5 1 GPIO_ACTIVE_LOW>; /* gpio 129 */
 		regulator-always-on;
 		vin-supply = <&vdd_1v8_reg>;
 	};
@@ -31,7 +31,7 @@ wl12xx_vmmc2: wl12xx_vmmc2 {
 		regulator-max-microvolt = <1800000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&wl12xx_wkup_pins>;
-		gpio = <&gpio1 3 GPIO_ACTIVE_HIGH >; /* gpio 3 */
+		gpios = <&gpio1 3 GPIO_ACTIVE_HIGH >; /* gpio 3 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 		regulator-always-on;
diff --git a/arch/arm/boot/dts/ti/omap/am437x-gp-evm.dts b/arch/arm/boot/dts/ti/omap/am437x-gp-evm.dts
index f7aad0323d19..87a51e10da8b 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am437x-gp-evm.dts
@@ -40,7 +40,7 @@ vtt_fixed: fixedregulator-vtt {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
 	};
 
 	vmmcwl_fixed: fixedregulator-mmcwl {
@@ -48,7 +48,7 @@ vmmcwl_fixed: fixedregulator-mmcwl {
 		regulator-name = "vmmcwl_fixed";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio1 20 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 20 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts b/arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts
index 9c97006ffd5b..a6e2146f1f7a 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts
@@ -153,7 +153,7 @@ vmmcwl_fixed: fixedregulator-mmcwl {
 		regulator-name = "vmmcwl_fixed";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio4 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi
index 994e69ab38d7..99628a4be5c6 100644
--- a/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi
@@ -111,7 +111,7 @@ vtt_fixed: fixedregulator-vtt {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio7 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 11 GPIO_ACTIVE_HIGH>;
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/ti/omap/dm8148-t410.dts b/arch/arm/boot/dts/ti/omap/dm8148-t410.dts
index f3e2ecf6d723..032c4ad410f8 100644
--- a/arch/arm/boot/dts/ti/omap/dm8148-t410.dts
+++ b/arch/arm/boot/dts/ti/omap/dm8148-t410.dts
@@ -18,7 +18,7 @@ usb_power: regulator@9 {
 		regulator-name = "usb_power";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/dra7-evm.dts b/arch/arm/boot/dts/ti/omap/dra7-evm.dts
index 46efbaa67a8e..340417780025 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dra7-evm.dts
@@ -75,7 +75,7 @@ evm_3v3_sd: fixedregulator-sd {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
-		gpio = <&pcf_gpio_21 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&pcf_gpio_21 5 GPIO_ACTIVE_HIGH>;
 	};
 
 	evm_3v3_sw: fixedregulator-evm_3v3_sw {
@@ -132,7 +132,7 @@ vmmcwl_fixed: fixedregulator-mmcwl {
 		regulator-name = "vmmcwl_fixed";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio5 8 0>;
+		gpios = <&gpio5 8 0>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
@@ -146,7 +146,7 @@ vtt_fixed: fixedregulator-vtt {
 		regulator-boot-on;
 		enable-active-high;
 		vin-supply = <&sysen2>;
-		gpio = <&gpio7 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio7 11 GPIO_ACTIVE_HIGH>;
 	};
 
 };
diff --git a/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi b/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
index f8151c61488e..e6d9da119d6d 100644
--- a/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
@@ -91,7 +91,7 @@ evm_3v3_sd: fixedregulator-sd {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&evm_3v3_sw>;
 		enable-active-high;
-		gpio = <&pcf_gpio_21 5 GPIO_ACTIVE_HIGH>;
+		gpios = <&pcf_gpio_21 5 GPIO_ACTIVE_HIGH>;
 	};
 
 	extcon_usb1: extcon_usb1 {
@@ -185,7 +185,7 @@ vmmcwl_fixed: fixedregulator-mmcwl {
 		regulator-name = "vmmcwl_fixed";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio5 8 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio5 8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/dra76-evm.dts b/arch/arm/boot/dts/ti/omap/dra76-evm.dts
index cf9c3d35b049..60bc1c09142b 100644
--- a/arch/arm/boot/dts/ti/omap/dra76-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dra76-evm.dts
@@ -118,7 +118,7 @@ vio_3v3_sd: fixedregulator-sd {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vio_3v3>;
 		enable-active-high;
-		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 21 GPIO_ACTIVE_HIGH>;
 	};
 
 	vio_1v8: fixedregulator-vio_1v8 {
@@ -134,7 +134,7 @@ vmmcwl_fixed: fixedregulator-mmcwl {
 		regulator-name = "vmmcwl_fixed";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio5 8 0>;	/* gpio5_8 */
+		gpios = <&gpio5 8 0>;	/* gpio5_8 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi b/arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi
index c0e6b73fa472..a4f5907e990f 100644
--- a/arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi
+++ b/arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi
@@ -19,7 +19,7 @@ wl12xx_vmmc: wl12xx_vmmc {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio1 3 0>;   /* gpio_3 */
+		gpios = <&gpio1 3 0>;   /* gpio_3 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 		vin-supply = <&vaux3>;
diff --git a/arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dts b/arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dts
index fbff15a0a0fe..91a83f5b5ad4 100644
--- a/arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dts
+++ b/arch/arm/boot/dts/ti/omap/logicpd-torpedo-37xx-devkit.dts
@@ -16,7 +16,7 @@ wl12xx_vmmc: wl12xx_vmmc {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio5 29 0>;   /* gpio157 */
+		gpios = <&gpio5 29 0>;   /* gpio157 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 		vin-supply = <&vmmc2>;
diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
index a0c53d9c2625..128a158e7ec9 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
@@ -49,7 +49,7 @@ hdmi_regulator: regulator-hdmi {
 		regulator-name = "hdmi";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio2 27 GPIO_ACTIVE_HIGH>;	/* gpio59 */
+		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>;	/* gpio59 */
 		enable-active-high;
 		regulator-always-on;
 	};
@@ -60,7 +60,7 @@ wl12xx_vmmc: regulator-wl12xx {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <1650000>;
 		regulator-max-microvolt = <1650000>;
-		gpio = <&gpio3 30 GPIO_ACTIVE_HIGH>;	/* gpio94 */
+		gpios = <&gpio3 30 GPIO_ACTIVE_HIGH>;	/* gpio94 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi
index 8b8de92b5424..90f5f454a767 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi
@@ -18,7 +18,7 @@ lcd_regulator: regulator-lcd {
 		regulator-name = "lcd";
 		regulator-min-microvolt = <5050000>;
 		regulator-max-microvolt = <5050000>;
-		gpio = <&gpio4 0 GPIO_ACTIVE_HIGH>;	/* gpio96 */
+		gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;	/* gpio96 */
 		enable-active-high;
 		vin-supply = <&sw5>;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts b/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts
index 08ee0f8ea68f..48e81421e083 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts
@@ -85,7 +85,7 @@ hsusb2_power: hsusb2_power_reg {
 		regulator-name = "hsusb2_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&twl_gpio 18 GPIO_ACTIVE_HIGH>;	/* GPIO LEDA */
+		gpios = <&twl_gpio 18 GPIO_ACTIVE_HIGH>;	/* GPIO LEDA */
 		startup-delay-us = <70000>;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/omap3-beagle.dts b/arch/arm/boot/dts/ti/omap/omap3-beagle.dts
index 4d9a8eab6abf..9c359f4a8bd8 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-beagle.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-beagle.dts
@@ -52,7 +52,7 @@ hsusb2_power: hsusb2_power_reg {
 		regulator-name = "hsusb2_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&twl_gpio 18 GPIO_ACTIVE_HIGH>;	/* GPIO LEDA */
+		gpios = <&twl_gpio 18 GPIO_ACTIVE_HIGH>;	/* GPIO LEDA */
 		startup-delay-us = <70000>;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dts b/arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dts
index f776e0527049..618ca6597589 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-cm-t3517.dts
@@ -28,7 +28,7 @@ &wl12xx_core_pins
 			    >;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio1 6 GPIO_ACTIVE_HIGH >; /* gpio6 */
+		gpios = <&gpio1 6 GPIO_ACTIVE_HIGH >; /* gpio6 */
 		startup-delay-us = <20000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts b/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts
index 0c6f14963e5e..46919b860187 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts
@@ -17,7 +17,7 @@ mmc2_sdio_reset: regulator-mmc2-sdio-reset {
 		regulator-name = "regulator-mmc2-sdio-reset";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&twl_gpio 2 GPIO_ACTIVE_HIGH>;
+		gpios = <&twl_gpio 2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dts b/arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dts
index f1a8f0fd7a83..129ae7a20db9 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-cm-t3730.dts
@@ -18,7 +18,7 @@ wl12xx_vmmc2: wl12xx_vmmc2 {
 		pinctrl-0 = <&wl12xx_gpio>;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio3 9 GPIO_ACTIVE_HIGH>;   /* gpio73 */
+		gpios = <&gpio3 9 GPIO_ACTIVE_HIGH>;   /* gpio73 */
 		startup-delay-us = <20000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap3-evm-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-evm-common.dtsi
index 1b6023c4cdf3..5b4bcf2d0386 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-evm-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-evm-common.dtsi
@@ -19,7 +19,7 @@ hsusb2_power: hsusb2_power_reg {
 		regulator-name = "hsusb2_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 22 GPIO_ACTIVE_HIGH>; /* gpio_22 */
+		gpios = <&gpio1 22 GPIO_ACTIVE_HIGH>; /* gpio_22 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
@@ -46,7 +46,7 @@ wl12xx_vmmc: wl12xx_vmmc {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio5 22 GPIO_ACTIVE_HIGH>;	/* gpio150 */
+		gpios = <&gpio5 22 GPIO_ACTIVE_HIGH>;	/* gpio150 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 		vin-supply = <&vmmc2>;
@@ -95,7 +95,7 @@ tvp5146@5c {
 };
 
 &lcd_3v3 {
-	gpio = <&gpio5 25 GPIO_ACTIVE_LOW>;	/* gpio153 */
+	gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;	/* gpio153 */
 };
 
 &lcd0 {
diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts b/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts
index 8bd6b4b1f30b..6049926adf7a 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-gta04a5.dts
@@ -20,7 +20,7 @@ wlan_en: wlan_en_regulator {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 
-		gpio = <&gpio5 10 GPIO_ACTIVE_HIGH>;	/* GPIO_138 */
+		gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;	/* GPIO_138 */
 
 		startup-delay-us = <70000>;
 		enable-active-high;
diff --git a/arch/arm/boot/dts/ti/omap/omap3-igep0020-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-igep0020-common.dtsi
index 13f434625407..6422509d0982 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-igep0020-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-igep0020-common.dtsi
@@ -46,7 +46,7 @@ hsusb1_power: hsusb1_power_reg {
 		regulator-name = "hsusb1_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&twl_gpio 18 GPIO_ACTIVE_LOW>;	/* GPIO LEDA */
+		gpios = <&twl_gpio 18 GPIO_ACTIVE_LOW>;	/* GPIO LEDA */
 		startup-delay-us = <70000>;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dts b/arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dts
index 316e8e6b39cd..cb3e7bae8ed1 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dts
@@ -18,7 +18,7 @@ lbep5clwmc_wlen: regulator-lbep5clwmc-wlen {
 		regulator-name = "regulator-lbep5clwmc-wlen";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 11 GPIO_ACTIVE_HIGH>;		/* gpio_139 - WL_EN */
+		gpios = <&gpio5 11 GPIO_ACTIVE_HIGH>;		/* gpio_139 - WL_EN */
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dts b/arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dts
index fddd7c86fec4..37192dea3d10 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dts
@@ -18,7 +18,7 @@ lbep5clwmc_wlen: regulator-lbep5clwmc-wlen {
 		regulator-name = "regulator-lbep5clwmc-wlen";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio5 11 GPIO_ACTIVE_HIGH>;		/* gpio_139 - WL_EN */
+		gpios = <&gpio5 11 GPIO_ACTIVE_HIGH>;		/* gpio_139 - WL_EN */
 		enable-active-high;
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/omap3-n950-n9.dtsi b/arch/arm/boot/dts/ti/omap/omap3-n950-n9.dtsi
index aa4fcdbedd8f..edc4e90d1b13 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n950-n9.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-n950-n9.dtsi
@@ -24,7 +24,7 @@ vemmc: fixedregulator0 {
 		regulator-name = "VEMMC";
 		regulator-min-microvolt = <2900000>;
 		regulator-max-microvolt = <2900000>;
-		gpio = <&gpio5 29 GPIO_ACTIVE_HIGH>; /* gpio line 157 */
+		gpios = <&gpio5 29 GPIO_ACTIVE_HIGH>; /* gpio line 157 */
 		startup-delay-us = <150>;
 		enable-active-high;
 	};
@@ -32,7 +32,7 @@ vemmc: fixedregulator0 {
 	vwlan_fixed: fixedregulator2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VWLAN";
-		gpio = <&gpio2 3 GPIO_ACTIVE_HIGH>; /* gpio 35 */
+		gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>; /* gpio 35 */
 		enable-active-high;
 	};
 
diff --git a/arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi b/arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi
index cc57626ea607..dcb770f8affb 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-overo-base.dtsi
@@ -38,7 +38,7 @@ hsusb2_power: hsusb2_power_reg {
 		regulator-name = "hsusb2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio6 8 GPIO_ACTIVE_HIGH>;		/* gpio_168: vbus enable */
+		gpios = <&gpio6 8 GPIO_ACTIVE_HIGH>;		/* gpio_168: vbus enable */
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
@@ -57,7 +57,7 @@ w3cbw003c_npoweron: regulator-w3cbw003c-npoweron {
 		regulator-name = "regulator-w3cbw003c-npoweron";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 22 GPIO_ACTIVE_HIGH>;		/* gpio_54: nPoweron */
+		gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;		/* gpio_54: nPoweron */
 		enable-active-high;
 	};
 
@@ -69,7 +69,7 @@ w3cbw003c_wifi_nreset: regulator-w3cbw003c-wifi-nreset {
 		regulator-name = "regulator-w3cbw003c-wifi-nreset";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 16 GPIO_ACTIVE_HIGH>;		/* gpio_16: WiFi nReset */
+		gpios = <&gpio1 16 GPIO_ACTIVE_HIGH>;		/* gpio_16: WiFi nReset */
 		startup-delay-us = <10000>;
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
index 06c5b2358999..7a0a2ab9c2a6 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
@@ -223,7 +223,7 @@ usb_host_5v: fixed-regulator-usb_host_5v {
 		regulator-always-on;
 		regulator-boot-on;
 		enable-active-high;
-		gpio = <&gpio6 4 GPIO_ACTIVE_HIGH>;	/* GPIO_164 */
+		gpios = <&gpio6 4 GPIO_ACTIVE_HIGH>;	/* GPIO_164 */
 	};
 
 	/* wl1251 wifi+bt module */
@@ -234,7 +234,7 @@ wlan_en: fixed-regulator-wg7210_en {
 		regulator-max-microvolt = <1800000>;
 		startup-delay-us = <50000>;
 		enable-active-high;
-		gpio = <&gpio1 23 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 23 GPIO_ACTIVE_HIGH>;
 	};
 
 	/* wg7210 (wifi+bt module) 32k clock buffer */
@@ -245,7 +245,7 @@ wg7210_32k: fixed-regulator-wg7210_32k {
 		regulator-max-microvolt = <1800000>;
 		regulator-always-on;
 		enable-active-high;
-		gpio = <&twl_gpio 13 GPIO_ACTIVE_HIGH>;
+		gpios = <&twl_gpio 13 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi b/arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi
index 6730c749d5ea..636b0e046667 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi
@@ -50,7 +50,7 @@ audio_amp: audio_amp {
 		regulator-name = "audio_amp";
 		pinctrl-names = "default";
 		pinctrl-0 = <&sb_t35_audio_amp>;
-		gpio = <&gpio2 29 GPIO_ACTIVE_LOW>;   /* gpio_61 */
+		gpios = <&gpio2 29 GPIO_ACTIVE_LOW>;   /* gpio_61 */
 		regulator-always-on;
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/omap3-tao3530.dtsi b/arch/arm/boot/dts/ti/omap/omap3-tao3530.dtsi
index 92a5846048bd..49e5eddae096 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-tao3530.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-tao3530.dtsi
@@ -38,7 +38,7 @@ hsusb2_power: hsusb2_power_reg {
 		regulator-name = "hsusb2_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&twl_gpio 18 GPIO_ACTIVE_HIGH>;	/* GPIO LEDA */
+		gpios = <&twl_gpio 18 GPIO_ACTIVE_HIGH>;	/* GPIO LEDA */
 		startup-delay-us = <70000>;
 	};
 
@@ -64,7 +64,7 @@ mmc2_sdio_poweron: regulator-mmc2-sdio-poweron {
 		regulator-name = "regulator-mmc2-sdio-poweron";
 		regulator-min-microvolt = <3150000>;
 		regulator-max-microvolt = <3150000>;
-		gpio = <&gpio5 29 GPIO_ACTIVE_LOW>;		/* gpio_157 */
+		gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;		/* gpio_157 */
 		startup-delay-us = <10000>;
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/omap3-zoom3.dts b/arch/arm/boot/dts/ti/omap/omap3-zoom3.dts
index 9f1e125fd77b..d75eea6b4dee 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-zoom3.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-zoom3.dts
@@ -41,7 +41,7 @@ wl12xx_vmmc: wl12xx_vmmc {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
+		gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap4-duovero.dtsi b/arch/arm/boot/dts/ti/omap/omap4-duovero.dtsi
index b8af455b411a..814405fa1a98 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-duovero.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-duovero.dtsi
@@ -59,7 +59,7 @@ w2cbw0015_vmmc: w2cbw0015_vmmc {
 		regulator-name = "w2cbw0015";
 		regulator-min-microvolt = <3000000>;
 		regulator-max-microvolt = <3000000>;
-		gpio = <&gpio2 11 GPIO_ACTIVE_LOW>;		/* gpio_43 */
+		gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;		/* gpio_43 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 		regulator-boot-on;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
index 339e52ba3614..ce42d25a7fba 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -65,7 +65,7 @@ wl12xx_vmmc: wl12xx-vmmc {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio1 24 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio1 24 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
index 97706d6296a6..38b421008a5c 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi
@@ -107,7 +107,7 @@ hsusb1_power: hsusb1_power_reg {
 		regulator-name = "hsusb1_vbus";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio1 1 GPIO_ACTIVE_HIGH>;	/* gpio_1 */
+		gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;	/* gpio_1 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 		/*
@@ -138,7 +138,7 @@ wl12xx_vmmc: wl12xx_vmmc {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap4-sdp.dts b/arch/arm/boot/dts/ti/omap/omap4-sdp.dts
index b535d24c6140..d0ec40d521af 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-sdp.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-sdp.dts
@@ -31,7 +31,7 @@ vdd_eth: fixedregulator-vdd-eth {
 		regulator-name = "VDD_ETH";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 16 GPIO_ACTIVE_HIGH>;  /* gpio line 48 */
+		gpios = <&gpio2 16 GPIO_ACTIVE_HIGH>;  /* gpio line 48 */
 		enable-active-high;
 		regulator-boot-on;
 		startup-delay-us = <25000>;
@@ -159,7 +159,7 @@ wl12xx_vmmc: wl12xx_vmmc {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap4-var-som-om44-wlan.dtsi b/arch/arm/boot/dts/ti/omap/omap4-var-som-om44-wlan.dtsi
index de779d2d7c3e..162cb8f818ef 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-var-som-om44-wlan.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-var-som-om44-wlan.dtsi
@@ -12,7 +12,7 @@ wl12xx_vmmc: wl12xx_vmmc {
 		regulator-name = "vwl1271";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;	/* gpio 43 */
+		gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;	/* gpio 43 */
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi b/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi
index 8946b5580cd9..9851547f984b 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-board-common.dtsi
@@ -48,7 +48,7 @@ vmmcsdio_fixed: fixedregulator-mmcsdio {
 		regulator-name = "vmmcsdio_fixed";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
-		gpio = <&gpio5 12 GPIO_ACTIVE_HIGH>;	/* gpio140 WLAN_EN */
+		gpios = <&gpio5 12 GPIO_ACTIVE_HIGH>;	/* gpio140 WLAN_EN */
 		enable-active-high;
 		startup-delay-us = <70000>;
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts b/arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts
index 6767382996ab..2e356336f192 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts
+++ b/arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts
@@ -36,7 +36,7 @@ vwlan_pdn_fixed: fixed-regulator-vwlan-pdn {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&ldo2_reg>;
-		gpio = <&gpio4 13 GPIO_ACTIVE_HIGH>;   /* gpio4_109 */
+		gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;   /* gpio4_109 */
 		startup-delay-us = <1000>;
 		enable-active-high;
 	};
@@ -47,7 +47,7 @@ vwlan_fixed: fixed-regulator-vwlan {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vwlan_pdn_fixed>;
-		gpio = <&gpio4 14 GPIO_ACTIVE_HIGH>;   /* gpio4_110 */
+		gpios = <&gpio4 14 GPIO_ACTIVE_HIGH>;   /* gpio4_110 */
 		startup-delay-us = <1000>;
 		enable-active-high;
 	};
-- 
2.46.2

