Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7457898B02F
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 00:45:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbk15GtDz3d9G
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 08:44:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727735770;
	cv=none; b=hS0OAm2KBa61zJnPiVD0aJj2qvl8t98ttvB2tiz0NbmwqTi024gZNfTabLwyRT0dJZ7ZDsn9Lm0BKjeOqu6lgggsinvI2MONR5PEGVOZPvmj4ed9WEg4HKCsIJDJPMkkvjfhd6VSKG3IAbIf5qM1nR8NPjimJkR8xJP1ZW+0Yu/ygIFPxw6BTIQn8IFfQ9qBcXjhJet0xeN+f0Kw9GspVVKTbOi4iMD8iiyRK7M1CNLVmIPfTGL/G28oQaam01YvhT5vuzXjUAp2l65Ioq9YmOWmYQ6+hZCQVO2CVII7KirTLlu3eP/LOMLbmI7lsrwLwc5rE/RUF9MrHs+E4agqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727735770; c=relaxed/relaxed;
	bh=+SowxZSaJFTWBastBxZqLftReFBAcoHPBtAcQgRL6a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJiqEiTcq2qoMH+17moFkaS7Aj/P1Owc2mQAxX2f2Le6pfbKEgRJUdlZgYUHV0UuoqvJMRutMIYSY4/0rMFNZWcsnTSv9mvQ/dV4v8bOyYWXs8nErkUSXNuTBU5TPKXoqnYoau59N9K7Fv3WENjXHEmjlDe+hUhMvbMPvlw3bBNk7XRV+o7M46WyrnXh0iTm5x0pRXzO7MkhR57mfsAuisi2cXqzuPZ4qtfPtAoujp4nfwjDrJP8Ld0yG/cW6FY5w1ucfsi615Bqshj2NSiLhgUTFh5EfAKYmLkJ+vMWUyiFJbRCaFt2s3jNNmBE/ehPAmoVAL7mVSwExvVIq0VueQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CzkD+tGa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CzkD+tGa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHbWt028hz2xps;
	Tue,  1 Oct 2024 08:36:09 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-718d606726cso3482634b3a.3;
        Mon, 30 Sep 2024 15:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727735768; x=1728340568; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SowxZSaJFTWBastBxZqLftReFBAcoHPBtAcQgRL6a0=;
        b=CzkD+tGaNxcrizkm7s03EisnsF5URvM+ZvYaJLqoALrYygFxA6JWNBB87QsiPPplrs
         bzBW7z2tXbrxeuSQdaSvNfXDr3fdS8H3CSxb3+6yvjpQw7AOw/rzZDGtiqJlntkupvAj
         IzWuOL+shPStYGg3RkeguOaB62daJGYrHHtAq+wTRnx7a8wtgHmpvOKr8/uELM/xNS/d
         jI/2HOc5XGh9ZQ92DYBlgqniS1WmZp9rRiU7ORC1YT2R+FbYM1m6LT4I0oKrYFEzJsOH
         U2OhjfaMTkxoSRbwHSZQfPpyFjN9ntxgWCPfo3zXAVo3ePpPhu/0JnXD5FfJ3AkgTSk5
         /Jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727735768; x=1728340568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SowxZSaJFTWBastBxZqLftReFBAcoHPBtAcQgRL6a0=;
        b=gWbat3jaiIui/+cRGqQPK4BR1AerdMPJwR0myMpKY3RfEYGC91fwXtutjRLMyJzK90
         uE2NyachbbMqu129NgCnxq/+3PDURLYMvWgSm2UEbtLELwS167DFFyqoYcT1UVfviPWD
         u8lfyFKLos7+Clos8a9WrWvKJdvgspoyLs4dMWELZdqCEBdtbN+MinivJc5OqX79C30w
         ET8MXyrCOyuQ9lM4Pzv1wsgFX9iDzepqECY9qQqIow7jPpFPauBSd/W34jN85MjR4fGq
         ssUYIhZqzg1VrPqhOOaOGxeC67Ru6GCwBYJ5sw1u/XLYhb8puroQC5G6CATzX1KG0WCi
         I9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWNlOVlXNzlwLkRn6SJKQF3MKjukF8OaMTmdvp8m+zMkfjAoCrjH7QCer+UvViUWY70etEssLVq6CJQPb8=@lists.ozlabs.org, AJvYcCWlsGnKoVySZw/8NJvHlLaGrWaqa+hACxuIDtQo3ioz8mCPCbTOInHnOdzDPlXsctyu7f56pUQfBw==@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuKYxwJaJ0rWC9zJzOubtxFYgAJl8v9JB/zKbhUHiKzGalhb32
	6tDItdDHCtz7WOvIVmJN/gd7uamjLxUM/CTCRIGDQnxyyxmnECZ1
X-Google-Smtp-Source: AGHT+IEfKcElwY6JneUP3y/HM1k7JSVfcPY9UygNjGyYl+fF00srIIkWUWiRKp/umgsR4jpedQ+1CA==
X-Received: by 2002:a05:6a00:2e23:b0:718:db99:28db with SMTP id d2e1a72fcca58-71b2604d389mr20972969b3a.22.1727735767674;
        Mon, 30 Sep 2024 15:36:07 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26524a8dsm7005158b3a.146.2024.09.30.15.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 15:36:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: assign reg to memory nodes
Date: Mon, 30 Sep 2024 15:35:50 -0700
Message-ID: <20240930223550.353882-3-rosenp@gmail.com>
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

Fixes dtc warnings:

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/alphascale/alphascale-asm9260.dtsi            | 2 +-
 arch/arm/boot/dts/amazon/alpine.dtsi                            | 2 +-
 arch/arm/boot/dts/amlogic/meson6-atv1200.dts                    | 2 +-
 arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts               | 2 +-
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts                     | 2 +-
 arch/arm/boot/dts/amlogic/meson8b-mxq.dts                       | 2 +-
 arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts                  | 2 +-
 arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts               | 2 +-
 arch/arm/boot/dts/arm/arm-realview-eb.dtsi                      | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts                   | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts                   | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pbx.dtsi                     | 2 +-
 arch/arm/boot/dts/arm/integrator.dtsi                           | 2 +-
 arch/arm/boot/dts/arm/versatile-ab.dts                          | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts         | 2 +-
 arch/arm/boot/dts/axis/artpec6-devboard.dts                     | 2 +-
 arch/arm/boot/dts/intel/axm/axm5516-amarillo.dts                | 2 +-
 arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-common.dtsi         | 2 +-
 arch/arm/boot/dts/marvell/armada-370-c200-v2.dts                | 2 +-
 arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dts       | 2 +-
 arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dts       | 2 +-
 arch/arm/boot/dts/marvell/armada-385-atl-x530.dts               | 2 +-
 arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi          | 2 +-
 arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dts         | 2 +-
 arch/arm/boot/dts/marvell/armada-385-db-ap.dts                  | 2 +-
 arch/arm/boot/dts/marvell/armada-385-linksys.dtsi               | 2 +-
 arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts         | 2 +-
 arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts           | 2 +-
 arch/arm/boot/dts/marvell/armada-388-db.dts                     | 2 +-
 arch/arm/boot/dts/marvell/armada-388-gp.dts                     | 2 +-
 arch/arm/boot/dts/marvell/armada-388-helios4.dts                | 2 +-
 arch/arm/boot/dts/marvell/armada-388-rd.dts                     | 2 +-
 arch/arm/boot/dts/marvell/armada-38x-solidrun-microsom.dtsi     | 2 +-
 arch/arm/boot/dts/marvell/armada-390-db.dts                     | 2 +-
 arch/arm/boot/dts/marvell/armada-395-gp.dts                     | 2 +-
 arch/arm/boot/dts/marvell/armada-398-db.dts                     | 2 +-
 arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtsi           | 2 +-
 arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtsi          | 2 +-
 arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtsi       | 2 +-
 arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dts                | 2 +-
 arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dts           | 2 +-
 arch/arm/boot/dts/marvell/dove-cm-a510.dtsi                     | 2 +-
 arch/arm/boot/dts/marvell/dove-cubox.dts                        | 2 +-
 arch/arm/boot/dts/marvell/dove-d2plug.dts                       | 2 +-
 arch/arm/boot/dts/marvell/dove-d3plug.dts                       | 2 +-
 arch/arm/boot/dts/marvell/dove-dove-db.dts                      | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dts              | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-b3.dts                       | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dts        | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-cloudbox.dts                 | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-d2net.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-db.dtsi                      | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-dir665.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-dns320.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-dns325.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-dockstar.dts                 | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-dreamplug.dts                | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds109.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dts                | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds111.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds112.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds209.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds210.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds212j.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds409.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds409slim.dts                | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds411.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds411j.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ds411slim.dts                | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-goflexnet.dts                | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts     | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ib62x0.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-iconnect.dts                 | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dts           | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-is2.dts                      | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dts              | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dts              | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-l-50.dts                     | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-laplug.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dts        | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dts         | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dts       | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dts        | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dts        | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dts            | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-lschlv2.dts                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-lsxhl.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-mplcec4.dts                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts          | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-nas2big.dts                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-net2big.dts                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-net5big.dts                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dts  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2.dts                      | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2lite.dts                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2max.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2mini.dts                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa310.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa310a.dts                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa310s.dts                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa320.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa325.dts                   | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts            | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts            | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dts                 | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dts        | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dts                | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-rd88f6281.dtsi               | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-rs212.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-rs409.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-rs411.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-sheevaplug-common.dtsi       | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-t5325.dts                    | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-topkick.dts                  | 2 +-
 arch/arm/boot/dts/marvell/kirkwood-ts219.dtsi                   | 2 +-
 arch/arm/boot/dts/marvell/mmp2-brownstone.dts                   | 2 +-
 arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dts                | 2 +-
 arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts          | 2 +-
 .../boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dts    | 2 +-
 arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dts         | 2 +-
 arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dts          | 2 +-
 arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dts        | 2 +-
 arch/arm/boot/dts/marvell/orion5x-lswsgl.dts                    | 2 +-
 arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts   | 2 +-
 arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dts           | 2 +-
 arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts             | 2 +-
 arch/arm/boot/dts/marvell/pxa168-aspenite.dts                   | 2 +-
 arch/arm/boot/dts/marvell/pxa910-dkb.dts                        | 2 +-
 arch/arm/boot/dts/mediatek/mt2701-evb.dts                       | 2 +-
 arch/arm/boot/dts/mediatek/mt6580-evbp1.dts                     | 2 +-
 arch/arm/boot/dts/mediatek/mt6582-prestigio-pmt5008-3g.dts      | 2 +-
 arch/arm/boot/dts/mediatek/mt6589-aquaris5.dts                  | 2 +-
 arch/arm/boot/dts/mediatek/mt6592-evb.dts                       | 2 +-
 arch/arm/boot/dts/mediatek/mt8127-moose.dts                     | 2 +-
 arch/arm/boot/dts/mediatek/mt8135-evbp1.dts                     | 2 +-
 arch/arm/boot/dts/microchip/at91-lmu5000.dts                    | 2 +-
 arch/arm/boot/dts/microchip/at91-q5xr5.dts                      | 2 +-
 arch/arm/boot/dts/moxa/moxart-uc7112lx.dts                      | 2 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts               | 2 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts               | 2 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts              | 2 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts               | 2 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts    | 2 +-
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi                     | 2 +-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi                        | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi              | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi              | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi                        | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi                        | 2 +-
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi                        | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi                          | 2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi                          | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi              | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi                   | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi                   | 2 +-
 arch/arm/boot/dts/rockchip/rk3288-vyasa.dts                     | 2 +-
 arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d.dtsi       | 2 +-
 arch/arm/boot/dts/st/spear1310-evb.dts                          | 2 +-
 arch/arm/boot/dts/st/spear1340-evb.dts                          | 2 +-
 arch/arm/boot/dts/st/spear13xx.dtsi                             | 2 +-
 arch/arm/boot/dts/st/spear300-evb.dts                           | 2 +-
 arch/arm/boot/dts/st/spear310-evb.dts                           | 2 +-
 arch/arm/boot/dts/st/spear320-evb.dts                           | 2 +-
 arch/arm/boot/dts/st/spear320-hmi.dts                           | 2 +-
 arch/arm/boot/dts/st/spear3xx.dtsi                              | 2 +-
 arch/arm/boot/dts/st/spear600-evb.dts                           | 2 +-
 arch/arm/boot/dts/st/spear600.dtsi                              | 2 +-
 arch/arm/boot/dts/st/ste-href.dtsi                              | 2 +-
 arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi                   | 2 +-
 arch/arm/boot/dts/st/ste-snowball.dts                           | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dts          | 2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts                     | 2 +-
 arch/arm/boot/dts/ti/omap/dra71-evm.dts                         | 2 +-
 arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi         | 2 +-
 arch/arm/boot/dts/vt8500/vt8500.dtsi                            | 2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi                            | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi                            | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi                            | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi                            | 2 +-
 182 files changed, 182 insertions(+), 182 deletions(-)

diff --git a/arch/arm/boot/dts/alphascale/alphascale-asm9260.dtsi b/arch/arm/boot/dts/alphascale/alphascale-asm9260.dtsi
index 2ce6038536fd..18e89541637a 100644
--- a/arch/arm/boot/dts/alphascale/alphascale-asm9260.dtsi
+++ b/arch/arm/boot/dts/alphascale/alphascale-asm9260.dtsi
@@ -11,7 +11,7 @@ / {
 	#size-cells = <1>;
 	interrupt-parent = <&icoll>;
 
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x2000000>;
 	};
diff --git a/arch/arm/boot/dts/amazon/alpine.dtsi b/arch/arm/boot/dts/amazon/alpine.dtsi
index 90bd12feac01..048ae360ad50 100644
--- a/arch/arm/boot/dts/amazon/alpine.dtsi
+++ b/arch/arm/boot/dts/amazon/alpine.dtsi
@@ -32,7 +32,7 @@ / {
 	/* SOC compatibility */
 	compatible = "al,alpine";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0 0 0>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson6-atv1200.dts b/arch/arm/boot/dts/amlogic/meson6-atv1200.dts
index 98e1c94c0261..735bd977c5a5 100644
--- a/arch/arm/boot/dts/amlogic/meson6-atv1200.dts
+++ b/arch/arm/boot/dts/amlogic/meson6-atv1200.dts
@@ -18,7 +18,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
index c6d1c5a8a3bf..b97531000d55 100644
--- a/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
+++ b/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
@@ -19,7 +19,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
index 77a9a3dfaa69..e508fc1e5eb4 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8b-mxq.dts b/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
index 7adedd3258c3..fb28cb330f17 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
index 926a9063c8a3..397ac7ec3a41 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
index aa4d4bf70629..08aa661e17ad 100644
--- a/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
@@ -26,7 +26,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
index 16f784da5a55..c2e6c47b2555 100644
--- a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
@@ -38,7 +38,7 @@ aliases {
 		i2c0 = &i2c;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		/* 128 MiB memory @ 0x0 */
 		reg = <0x00000000 0x08000000>;
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
index b9b10cbd65aa..8cd0cde2e946 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
@@ -40,7 +40,7 @@ aliases {
 		serial4 = &fpga_serial;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		/* 128 MiB memory @ 0x0 */
 		reg = <0x00000000 0x08000000>;
diff --git a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
index db1b6793cd2c..647dd5cdb2ed 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
@@ -39,7 +39,7 @@ aliases {
 		serial3 = &pb11mp_serial3;
 	};
 
-	memory {
+	memory@70000000 {
 		device_type = "memory";
 		/*
 		 * The PB11MPCore has 512 MiB memory @ 0x70000000
diff --git a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
index e625403a9456..4966cf408ea9 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
+++ b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
@@ -39,7 +39,7 @@ aliases {
 		i2c1 = &i2c1;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		/* 128 MiB memory @ 0x0 */
 		reg = <0x00000000 0x08000000>;
diff --git a/arch/arm/boot/dts/arm/integrator.dtsi b/arch/arm/boot/dts/arm/integrator.dtsi
index 7f1c8ee9dd8a..a4e394be34e7 100644
--- a/arch/arm/boot/dts/arm/integrator.dtsi
+++ b/arch/arm/boot/dts/arm/integrator.dtsi
@@ -7,7 +7,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0>;
 	};
diff --git a/arch/arm/boot/dts/arm/versatile-ab.dts b/arch/arm/boot/dts/arm/versatile-ab.dts
index 635ab9268899..0ece75ad9bf7 100644
--- a/arch/arm/boot/dts/arm/versatile-ab.dts
+++ b/arch/arm/boot/dts/arm/versatile-ab.dts
@@ -19,7 +19,7 @@ chosen {
 		stdout-path = &uart0;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts
index 7a78c34cff40..22e19584fff9 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts
@@ -14,7 +14,7 @@ chosen {
 		bootargs = "earlycon";
 	};
 
-	memory {
+	memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
 
diff --git a/arch/arm/boot/dts/axis/artpec6-devboard.dts b/arch/arm/boot/dts/axis/artpec6-devboard.dts
index 042a9cc920c6..4c9a63cef3fb 100644
--- a/arch/arm/boot/dts/axis/artpec6-devboard.dts
+++ b/arch/arm/boot/dts/axis/artpec6-devboard.dts
@@ -19,7 +19,7 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/intel/axm/axm5516-amarillo.dts b/arch/arm/boot/dts/intel/axm/axm5516-amarillo.dts
index 2e2ad3c7ee77..49f42169cc2e 100644
--- a/arch/arm/boot/dts/intel/axm/axm5516-amarillo.dts
+++ b/arch/arm/boot/dts/intel/axm/axm5516-amarillo.dts
@@ -16,7 +16,7 @@ / {
 	model = "Amarillo AXM5516";
 	compatible = "lsi,axm5516-amarillo", "lsi,axm5516";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x00000000 0x02 0x00000000>;
 	};
diff --git a/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-common.dtsi b/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-common.dtsi
index f9bc3b56c4b9..41d99cd6874e 100644
--- a/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-common.dtsi
+++ b/arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-common.dtsi
@@ -14,7 +14,7 @@ chosen {
 		stdout-path = &ffuart;
 	};
 
-	memory {
+	memory@a0000000 {
 		device_type = "memory";
 		reg = <0xa0000000 0x8000000>;	/* 128 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-370-c200-v2.dts b/arch/arm/boot/dts/marvell/armada-370-c200-v2.dts
index 84d40e1d70ef..53b231d1657c 100644
--- a/arch/arm/boot/dts/marvell/armada-370-c200-v2.dts
+++ b/arch/arm/boot/dts/marvell/armada-370-c200-v2.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x40000000>; /* 1024 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dts b/arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dts
index 5baf83e5253d..66482f015c6f 100644
--- a/arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dts
+++ b/arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dts
@@ -31,7 +31,7 @@ key-factory-default {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x08000000>; /* 128 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dts b/arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dts
index 6ab65d21861a..cd59a0d96cdf 100644
--- a/arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dts
+++ b/arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dts
@@ -24,7 +24,7 @@ aliases {
 		ethernet0 = &eth1;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>; /* 512MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-385-atl-x530.dts b/arch/arm/boot/dts/marvell/armada-385-atl-x530.dts
index 2fb7304039be..49c14a1fb7f6 100644
--- a/arch/arm/boot/dts/marvell/armada-385-atl-x530.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-atl-x530.dts
@@ -19,7 +19,7 @@ chosen {
 		stdout-path = "serial1:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x40000000>; /* 1GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
index 323786853203..2060d370d964 100644
--- a/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi
@@ -81,7 +81,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>; /* 256 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dts b/arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dts
index 389d9c75d546..4cb7d59b40a8 100644
--- a/arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dts
@@ -25,7 +25,7 @@ aliases {
 		spi1 = &spi1;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000>; /* 2GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-385-db-ap.dts b/arch/arm/boot/dts/marvell/armada-385-db-ap.dts
index 112a4b35b81f..1c09f81d5aa1 100644
--- a/arch/arm/boot/dts/marvell/armada-385-db-ap.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-db-ap.dts
@@ -21,7 +21,7 @@ chosen {
 		stdout-path = "serial1:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000>; /* 2GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys.dtsi b/arch/arm/boot/dts/marvell/armada-385-linksys.dtsi
index b98c4da01cea..829a9048ddb5 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys.dtsi
@@ -18,7 +18,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>; /* 512 MiB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts b/arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts
index 752e92fc8d25..1df071cf00df 100644
--- a/arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts
@@ -17,7 +17,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x40000000>; /* 1 GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
index 43202890c959..3a3ccfe46b10 100644
--- a/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts
@@ -29,7 +29,7 @@ aliases {
 		ethernet2 = &eth2;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x40000000>; /* 1024 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-388-db.dts b/arch/arm/boot/dts/marvell/armada-388-db.dts
index 45cc784659fd..bff3643457c5 100644
--- a/arch/arm/boot/dts/marvell/armada-388-db.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-db.dts
@@ -20,7 +20,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>; /* 256 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-388-gp.dts b/arch/arm/boot/dts/marvell/armada-388-gp.dts
index 5155ab40d6a3..48f4c3a75ac2 100644
--- a/arch/arm/boot/dts/marvell/armada-388-gp.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-gp.dts
@@ -20,7 +20,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000>; /* 2 GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index d26235d6843c..edd8a512e870 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -16,7 +16,7 @@ / {
 	compatible = "kobol,helios4", "marvell,armada388",
 		"marvell,armada385", "marvell,armada380";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000>; /* 2 GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-388-rd.dts b/arch/arm/boot/dts/marvell/armada-388-rd.dts
index c0efafd45b33..6ad975ede53b 100644
--- a/arch/arm/boot/dts/marvell/armada-388-rd.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-rd.dts
@@ -21,7 +21,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>; /* 256 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-38x-solidrun-microsom.dtsi b/arch/arm/boot/dts/marvell/armada-38x-solidrun-microsom.dtsi
index 2c64bc6e5a17..51d0b7952976 100644
--- a/arch/arm/boot/dts/marvell/armada-38x-solidrun-microsom.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-38x-solidrun-microsom.dtsi
@@ -8,7 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>; /* 256 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-390-db.dts b/arch/arm/boot/dts/marvell/armada-390-db.dts
index 20f518dbac97..92b96d4d94ae 100644
--- a/arch/arm/boot/dts/marvell/armada-390-db.dts
+++ b/arch/arm/boot/dts/marvell/armada-390-db.dts
@@ -19,7 +19,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000>; /* 2 GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-395-gp.dts b/arch/arm/boot/dts/marvell/armada-395-gp.dts
index 6dd9e9077f84..853f90003f85 100644
--- a/arch/arm/boot/dts/marvell/armada-395-gp.dts
+++ b/arch/arm/boot/dts/marvell/armada-395-gp.dts
@@ -19,7 +19,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x40000000>; /* 1 GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-398-db.dts b/arch/arm/boot/dts/marvell/armada-398-db.dts
index ec6cdbeedde7..6ed1d6ee73ce 100644
--- a/arch/arm/boot/dts/marvell/armada-398-db.dts
+++ b/arch/arm/boot/dts/marvell/armada-398-db.dts
@@ -18,7 +18,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000>; /* 2 GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtsi b/arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtsi
index 47b003a81bd4..fee603e04048 100644
--- a/arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-xp-crs305-1g-4s.dtsi
@@ -28,7 +28,7 @@ chosen {
 		bootargs = "console=ttyS0,115200 earlyprintk";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x00000000 0 0x20000000>; /* 512 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtsi b/arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtsi
index cab99d8e2911..453581b66bcd 100644
--- a/arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-xp-crs326-24g-2s.dtsi
@@ -28,7 +28,7 @@ chosen {
 		bootargs = "console=ttyS0,115200 earlyprintk";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x00000000 0 0x20000000>; /* 512 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtsi b/arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtsi
index 7028482ce4b2..ce37a8532f5d 100644
--- a/arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-xp-crs328-4c-20s-4s.dtsi
@@ -28,7 +28,7 @@ chosen {
 		bootargs = "console=ttyS0,115200 earlyprintk";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x00000000 0 0x20000000>; /* 512 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dts b/arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dts
index 02bef8dc4270..33db8c58cb6e 100644
--- a/arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dts
+++ b/arch/arm/boot/dts/marvell/armada-xp-db-dxbc2.dts
@@ -27,7 +27,7 @@ chosen {
 		bootargs = "console=ttyS0,115200 earlyprintk";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x00000000 0 0x20000000>; /* 512 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dts b/arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dts
index d1b61dad0c46..89d54dfb3a44 100644
--- a/arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dts
+++ b/arch/arm/boot/dts/marvell/armada-xp-db-xc3-24g4xg.dts
@@ -27,7 +27,7 @@ chosen {
 		bootargs = "console=ttyS0,115200 earlyprintk";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x00000000 0 0x40000000>; /* 1 GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/dove-cm-a510.dtsi b/arch/arm/boot/dts/marvell/dove-cm-a510.dtsi
index f2119efc1e6f..a2fc30d1b6e1 100644
--- a/arch/arm/boot/dts/marvell/dove-cm-a510.dtsi
+++ b/arch/arm/boot/dts/marvell/dove-cm-a510.dtsi
@@ -90,7 +90,7 @@ / {
 	 * Set the minimum memory size here and let the
 	 * bootloader set the real size.
 	 */
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/dove-cubox.dts b/arch/arm/boot/dts/marvell/dove-cubox.dts
index ff2470c95fb9..86e0f9a9cad5 100644
--- a/arch/arm/boot/dts/marvell/dove-cubox.dts
+++ b/arch/arm/boot/dts/marvell/dove-cubox.dts
@@ -7,7 +7,7 @@ / {
 	model = "SolidRun CuBox";
 	compatible = "solidrun,cubox", "marvell,dove";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/dove-d2plug.dts b/arch/arm/boot/dts/marvell/dove-d2plug.dts
index 79ee2b32409d..7ee5e6cfdb5b 100644
--- a/arch/arm/boot/dts/marvell/dove-d2plug.dts
+++ b/arch/arm/boot/dts/marvell/dove-d2plug.dts
@@ -7,7 +7,7 @@ / {
 	model = "Globalscale D2Plug";
 	compatible = "globalscale,d2plug", "marvell,dove";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/dove-d3plug.dts b/arch/arm/boot/dts/marvell/dove-d3plug.dts
index 7c119a977a60..2bd0bd06ffdb 100644
--- a/arch/arm/boot/dts/marvell/dove-d3plug.dts
+++ b/arch/arm/boot/dts/marvell/dove-d3plug.dts
@@ -7,7 +7,7 @@ / {
 	model = "Globalscale D3Plug";
 	compatible = "globalscale,d3plug", "marvell,dove";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/dove-dove-db.dts b/arch/arm/boot/dts/marvell/dove-dove-db.dts
index c1912dc6bfc3..906c1ac5a58c 100644
--- a/arch/arm/boot/dts/marvell/dove-dove-db.dts
+++ b/arch/arm/boot/dts/marvell/dove-dove-db.dts
@@ -7,7 +7,7 @@ / {
 	model = "Marvell DB-MV88AP510-BP Development Board";
 	compatible = "marvell,dove-db", "marvell,dove";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dts b/arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dts
index b1749d3f60b7..db5da7718f48 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-4i-edge-200.dts
@@ -15,7 +15,7 @@ / {
 	model = "Endian 4i Edge 200";
 	compatible = "endian,4i-edge-200", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-b3.dts b/arch/arm/boot/dts/marvell/kirkwood-b3.dts
index 681343c1357a..80f081019a4e 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-b3.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-b3.dts
@@ -20,7 +20,7 @@
 / {
 	model = "Excito B3";
 	compatible = "excito,b3", "marvell,kirkwood-88f6281", "marvell,kirkwood";
-	memory { /* 512 MB */
+	memory@0 { /* 512 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dts b/arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dts
index 96978e8a4cc1..9506a6c6d64e 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-blackarmor-nas220.dts
@@ -17,7 +17,7 @@ / {
 	compatible = "seagate,blackarmor-nas220","marvell,kirkwood-88f6192",
 		     "marvell,kirkwood";
 
-	memory { /* 128 MB */
+	memory@0 { /* 128 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-cloudbox.dts b/arch/arm/boot/dts/marvell/kirkwood-cloudbox.dts
index 151edcd140a0..6adceea3add6 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-cloudbox.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-cloudbox.dts
@@ -8,7 +8,7 @@ / {
 	model = "LaCie CloudBox";
 	compatible = "lacie,cloudbox", "marvell,kirkwood-88f6702", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-d2net.dts b/arch/arm/boot/dts/marvell/kirkwood-d2net.dts
index fcce8730d3e3..7b6106558440 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-d2net.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-d2net.dts
@@ -15,7 +15,7 @@ / {
 	model = "LaCie d2 Network v2";
 	compatible = "lacie,d2net_v2", "lacie,netxbig", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-db.dtsi b/arch/arm/boot/dts/marvell/kirkwood-db.dtsi
index 6fe2e31534af..b716183b7823 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-db.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-db.dtsi
@@ -12,7 +12,7 @@
 #include "kirkwood.dtsi"
 
 / {
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>; /* 512 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-dir665.dts b/arch/arm/boot/dts/marvell/kirkwood-dir665.dts
index 2f6793f794cd..d58c804c99c4 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-dir665.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-dir665.dts
@@ -13,7 +13,7 @@ / {
 	model = "D-Link DIR-665";
 	compatible = "dlink,dir-665", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>; /* 128 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-dns320.dts b/arch/arm/boot/dts/marvell/kirkwood-dns320.dts
index d8279e0c4c4f..f97ed11b2ea7 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-dns320.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-dns320.dts
@@ -7,7 +7,7 @@ / {
 	model = "D-Link DNS-320 NAS (Rev A1)";
 	compatible = "dlink,dns-320-a1", "dlink,dns-320", "dlink,dns-kirkwood", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-dns325.dts b/arch/arm/boot/dts/marvell/kirkwood-dns325.dts
index 7f396195e977..a81f57a0ed29 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-dns325.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-dns325.dts
@@ -7,7 +7,7 @@ / {
 	model = "D-Link DNS-325 NAS (Rev A1)";
 	compatible = "dlink,dns-325-a1", "dlink,dns-325", "dlink,dns-kirkwood", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-dockstar.dts b/arch/arm/boot/dts/marvell/kirkwood-dockstar.dts
index f5af8822d57a..e8c2485ad0fe 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-dockstar.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-dockstar.dts
@@ -8,7 +8,7 @@ / {
 	model = "Seagate FreeAgent Dockstar";
 	compatible = "seagate,dockstar", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-dreamplug.dts b/arch/arm/boot/dts/marvell/kirkwood-dreamplug.dts
index 590bee3c561c..f38ae13aa474 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-dreamplug.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-dreamplug.dts
@@ -8,7 +8,7 @@ / {
 	model = "Globalscale Technologies Dreamplug";
 	compatible = "globalscale,dreamplug-003-ds2001", "globalscale,dreamplug", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds109.dts b/arch/arm/boot/dts/marvell/kirkwood-ds109.dts
index 29982e7acb7f..a2c7e56de4d1 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds109.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds109.dts
@@ -16,7 +16,7 @@ / {
 	compatible = "synology,ds109", "synology,ds110jv20",
 		     "synology,ds110", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dts b/arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dts
index d68c616e9309..c6611ae6075d 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds110jv10.dts
@@ -16,7 +16,7 @@ / {
 	compatible = "synology,ds110jv10", "synology,ds110jv30",
 		     "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds111.dts b/arch/arm/boot/dts/marvell/kirkwood-ds111.dts
index e1420cbcd7e4..c9a1270a442c 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds111.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds111.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology DS111";
 	compatible = "synology,ds111", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds112.dts b/arch/arm/boot/dts/marvell/kirkwood-ds112.dts
index 3912f1b525b6..aea52285da8c 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds112.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds112.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology DS112";
 	compatible = "synology,ds111", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds209.dts b/arch/arm/boot/dts/marvell/kirkwood-ds209.dts
index f41fe95e055f..c327cd56c2c3 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds209.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds209.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology DS209";
 	compatible = "synology,ds209", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds210.dts b/arch/arm/boot/dts/marvell/kirkwood-ds210.dts
index 729f959a7838..fa312e9cda66 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds210.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds210.dts
@@ -17,7 +17,7 @@ / {
 		     "synology,ds210jv30", "synology,ds211j",
 		     "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
index 416bab50d170..0e90d74a048e 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
@@ -18,7 +18,7 @@ / {
 		     "synology,ds213airv10", "synology,ds213v10",
 		     "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds212j.dts b/arch/arm/boot/dts/marvell/kirkwood-ds212j.dts
index 14cf4d8afaf3..dd31c0614a2c 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds212j.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds212j.dts
@@ -16,7 +16,7 @@ / {
 	compatible = "synology,ds212jv10", "synology,ds212jv20",
 		     "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds409.dts b/arch/arm/boot/dts/marvell/kirkwood-ds409.dts
index a8650f9e3eb7..bb0bcc6a36e0 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds409.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds409.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology DS409, DS410j";
 	compatible = "synology,ds409", "synology,ds410j", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds409slim.dts b/arch/arm/boot/dts/marvell/kirkwood-ds409slim.dts
index 27a1d840bd15..01d1e23a0baa 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds409slim.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds409slim.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology 409slim";
 	compatible = "synology,ds409slim", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds411.dts b/arch/arm/boot/dts/marvell/kirkwood-ds411.dts
index 1d4256ef325d..e027b710af21 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds411.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds411.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology DS411, DS413jv10";
 	compatible = "synology,ds411", "synology,ds413jv10", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds411j.dts b/arch/arm/boot/dts/marvell/kirkwood-ds411j.dts
index bb3200daea1e..c6c26a0842d2 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds411j.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds411j.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology DS411j";
 	compatible = "synology,ds411j", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds411slim.dts b/arch/arm/boot/dts/marvell/kirkwood-ds411slim.dts
index 9c5364a4e0a8..28b619ff9caa 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds411slim.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds411slim.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology DS411slim";
 	compatible = "synology,ds411slim", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-goflexnet.dts b/arch/arm/boot/dts/marvell/kirkwood-goflexnet.dts
index c68fca9e77c7..b51b557bdf2b 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-goflexnet.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-goflexnet.dts
@@ -8,7 +8,7 @@ / {
 	model = "Seagate GoFlex Net";
 	compatible = "seagate,goflexnet", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts b/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
index d5aa8b505cc0..ddbb5c4e265e 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-guruplug-server-plus.dts
@@ -8,7 +8,7 @@ / {
 	model = "Globalscale Technologies Guruplug Server Plus";
 	compatible = "globalscale,guruplug-server-plus", "globalscale,guruplug", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ib62x0.dts b/arch/arm/boot/dts/marvell/kirkwood-ib62x0.dts
index 018c6b8f3e8a..5133b3f73d3e 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ib62x0.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ib62x0.dts
@@ -8,7 +8,7 @@ / {
 	model = "RaidSonic ICY BOX IB-NAS62x0 (Rev B)";
 	compatible = "raidsonic,ib-nas6210-b", "raidsonic,ib-nas6220-b", "raidsonic,ib-nas6210", "raidsonic,ib-nas6220", "raidsonic,ib-nas62x0", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-iconnect.dts b/arch/arm/boot/dts/marvell/kirkwood-iconnect.dts
index 91b46e77e0b6..76468d71e8bf 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-iconnect.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-iconnect.dts
@@ -8,7 +8,7 @@ / {
 	model = "Iomega Iconnect";
 	compatible = "iom,iconnect-1.1", "iom,iconnect", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dts b/arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dts
index 039362152650..b0b955b968f1 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-iomega_ix2_200.dts
@@ -8,7 +8,7 @@ / {
 	model = "Iomega StorCenter ix2-200";
 	compatible = "iom,ix2-200", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-is2.dts b/arch/arm/boot/dts/marvell/kirkwood-is2.dts
index 1bc16a5cdbaa..0160befaa177 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-is2.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-is2.dts
@@ -8,7 +8,7 @@ / {
 	model = "LaCie Internet Space v2";
 	compatible = "lacie,inetspace_v2", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dts b/arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dts
index 515be7bccc0a..0e2eceb8d2d8 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-km_fixedeth.dts
@@ -9,7 +9,7 @@ / {
 	model = "Keymile Kirkwood Fixed Eth";
 	compatible = "keymile,km_fixedeth", "marvell,kirkwood-98DX4122", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dts b/arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dts
index f035eff1c111..b906344ea406 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-km_kirkwood.dts
@@ -9,7 +9,7 @@ / {
 	model = "Keymile Kirkwood Reference Design";
 	compatible = "keymile,km_kirkwood", "marvell,kirkwood-98DX4122", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-l-50.dts b/arch/arm/boot/dts/marvell/kirkwood-l-50.dts
index abe432277dac..f7b5f7aa2ee2 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-l-50.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-l-50.dts
@@ -13,7 +13,7 @@ / {
 	model = "Check Point L-50";
 	compatible = "checkpoint,l-50", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-laplug.dts b/arch/arm/boot/dts/marvell/kirkwood-laplug.dts
index dff87be3afa6..6c27502f876e 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-laplug.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-laplug.dts
@@ -15,7 +15,7 @@ / {
 	model = "LaCie LaPlug";
 	compatible = "lacie,laplug", "marvell,kirkwood-88f6192", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>; /* 128 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dts b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dts
index 2807942d39f1..d14df0538422 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsqvl.dts
@@ -16,7 +16,7 @@ / {
 	model = "Buffalo Linkstation LS-QVL";
 	compatible = "buffalo,lsqvl", "marvell,kirkwood-88f6282", "marvell,kirkwood";
 
-	memory { /* 256 MB */
+	memory@0 { /* 256 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dts b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dts
index 3f2a0bfe03ed..7eab7a8501f2 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lsvl.dts
@@ -13,7 +13,7 @@ / {
 	model = "Buffalo Linkstation LS-VL";
 	compatible = "buffalo,lsvl", "marvell,kirkwood-88f6282", "marvell,kirkwood";
 
-	memory { /* 256 MB */
+	memory@0 { /* 256 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dts b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dts
index c42d0da38fe7..e37c05cfd974 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswsxl.dts
@@ -13,7 +13,7 @@ / {
 	model = "Buffalo Linkstation LS-WSXL";
 	compatible = "buffalo,lswsxl", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory { /* 128 MB */
+	memory@0 { /* 128 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dts b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dts
index 0969619549f6..57e022b6932c 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswvl.dts
@@ -13,7 +13,7 @@ / {
 	model = "Buffalo Linkstation LS-WVL";
 	compatible = "buffalo,lswvl","marvell,kirkwood-88f6282", "marvell,kirkwood";
 
-	memory { /* 256 MB */
+	memory@0 { /* 256 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dts b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dts
index 0425df8cb91c..6f9fd3fdc389 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-linkstation-lswxl.dts
@@ -13,7 +13,7 @@ / {
 	model = "Buffalo Linkstation LS-WXL";
 	compatible = "buffalo,lswxl", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory { /* 128 MB */
+	memory@0 { /* 128 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dts b/arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dts
index 8a1c38ab6111..230b1a7461e8 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-linksys-viper.dts
@@ -18,7 +18,7 @@ / {
 	model = "Linksys Viper (E4200v2 / EA4500)";
 	compatible = "linksys,viper", "marvell,kirkwood-88f6282", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-lschlv2.dts b/arch/arm/boot/dts/marvell/kirkwood-lschlv2.dts
index 1d737d903f5f..f024ea374206 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-lschlv2.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-lschlv2.dts
@@ -7,7 +7,7 @@ / {
 	model = "Buffalo Linkstation LS-CHLv2";
 	compatible = "buffalo,lschlv2", "buffalo,lsxl", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x4000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-lsxhl.dts b/arch/arm/boot/dts/marvell/kirkwood-lsxhl.dts
index a56e0d797778..483a06d248ba 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-lsxhl.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-lsxhl.dts
@@ -7,7 +7,7 @@ / {
 	model = "Buffalo Linkstation LS-XHL";
 	compatible = "buffalo,lsxhl", "buffalo,lsxl", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-mplcec4.dts b/arch/arm/boot/dts/marvell/kirkwood-mplcec4.dts
index 6533b49a15b2..fb269d909acb 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-mplcec4.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-mplcec4.dts
@@ -8,7 +8,7 @@ / {
 	model = "MPL CEC4";
 	compatible = "mpl,cec4-10", "mpl,cec4", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts b/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts
index e3b41784c876..033eb310730b 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts
@@ -18,7 +18,7 @@ / {
 	model = "Marvell 88F6281 GTW GE Board";
 	compatible = "marvell,mv88f6281gtw-ge", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>; /* 512 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nas2big.dts b/arch/arm/boot/dts/marvell/kirkwood-nas2big.dts
index b8c594ca9a29..8ea4bcd7f9f4 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nas2big.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nas2big.dts
@@ -16,7 +16,7 @@ / {
 	model = "LaCie 2Big NAS";
 	compatible = "lacie,nas2big", "lacie,netxbig", "marvell,kirkwood-88f6282", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-net2big.dts b/arch/arm/boot/dts/marvell/kirkwood-net2big.dts
index 06d80cb1187b..8adeba7fd744 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-net2big.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-net2big.dts
@@ -21,7 +21,7 @@ / {
 	model = "LaCie 2Big Network v2";
 	compatible = "lacie,net2big_v2", "lacie,netxbig", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
index 0d36528af27a..59c7ccb3a785 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
@@ -21,7 +21,7 @@ / {
 	model = "LaCie 5Big Network v2";
 	compatible = "lacie,net5big_v2", "lacie,netxbig", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
index 94249336d7ed..f0957c7ea15c 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_duo_v2.dts
@@ -14,7 +14,7 @@ / {
 	model = "NETGEAR ReadyNAS Duo v2";
 	compatible = "netgear,readynas-duo-v2", "netgear,readynas", "marvell,kirkwood-88f6282", "marvell,kirkwood";
 
-	memory { /* 256 MB */
+	memory@0 { /* 256 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dts b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dts
index e1f7952e0ee3..6bada0ef96cc 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-netgear_readynas_nv+_v2.dts
@@ -14,7 +14,7 @@ / {
 	model = "NETGEAR ReadyNAS NV+ v2";
 	compatible = "netgear,readynas-nv+-v2", "netgear,readynas", "marvell,kirkwood-88f6282", "marvell,kirkwood";
 
-	memory { /* 256 MB */
+	memory@0 { /* 256 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ns2.dts b/arch/arm/boot/dts/marvell/kirkwood-ns2.dts
index 7b67083e1ec0..fc7dcbafa4a0 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ns2.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ns2.dts
@@ -8,7 +8,7 @@ / {
 	model = "LaCie Network Space v2";
 	compatible = "lacie,netspace_v2", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ns2lite.dts b/arch/arm/boot/dts/marvell/kirkwood-ns2lite.dts
index 686bcd6f0f3c..bec1fd56a5b3 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ns2lite.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ns2lite.dts
@@ -7,7 +7,7 @@ / {
 	model = "LaCie Network Space Lite v2";
 	compatible = "lacie,netspace_lite_v2", "marvell,kirkwood-88f6192", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ns2max.dts b/arch/arm/boot/dts/marvell/kirkwood-ns2max.dts
index 044958bc55da..710cc1ed7dc6 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ns2max.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ns2max.dts
@@ -8,7 +8,7 @@ / {
 	model = "LaCie Network Space Max v2";
 	compatible = "lacie,netspace_max_v2", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ns2mini.dts b/arch/arm/boot/dts/marvell/kirkwood-ns2mini.dts
index 3fbe008f9141..c613795d8e42 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ns2mini.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ns2mini.dts
@@ -9,7 +9,7 @@ / {
 	model = "LaCie Network Space Mini v2";
 	compatible = "lacie,netspace_mini_v2", "marvell,kirkwood-88f6192", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa310.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa310.dts
index 3555ac1c3b15..3b20b81bb0a6 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa310.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa310.dts
@@ -6,7 +6,7 @@
 / {
 	compatible = "zyxel,nsa310", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa310a.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa310a.dts
index ddf84092aade..7e89abeb5be4 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa310a.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa310a.dts
@@ -11,7 +11,7 @@
 / {
 	compatible = "zyxel,nsa310a", "zyxel,nsa310", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa310s.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa310s.dts
index 8db7198741e2..36cbda2fe271 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa310s.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa310s.dts
@@ -16,7 +16,7 @@ / {
 	model = "ZyXEL NSA310S";
 	compatible = "zyxel,nsa310s", "marvell,kirkwood-88f6702", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
index dd5c8ffc8781..7c4b2e786c52 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
@@ -14,7 +14,7 @@ / {
 	model = "Zyxel NSA320";
 	compatible = "zyxel,nsa320", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa325.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa325.dts
index a6f8a4a72eb8..6516af249eea 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-nsa325.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-nsa325.dts
@@ -15,7 +15,7 @@ / {
 	model = "ZyXEL NSA325";
 	compatible = "zyxel,nsa325", "marvell,kirkwood-88f6282", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
index 20c6290d2037..ed37514dfe76 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a6.dts
@@ -8,7 +8,7 @@ / {
 	model = "Plat'Home OpenBlocksA6";
 	compatible = "plathome,openblocks-a6", "marvell,kirkwood-88f6283", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
index 9c438f10f737..f8260e7d15e1 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
@@ -17,7 +17,7 @@ / {
 	model = "Plat'Home OpenBlocksA7";
 	compatible = "plathome,openblocks-a7", "marvell,kirkwood-88f6283", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x40000000>; /* 1 GB */
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi b/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi
index 47f03c69c55a..16b75963d3b7 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-openrd.dtsi
@@ -12,7 +12,7 @@
 #include "kirkwood-6281.dtsi"
 
 / {
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dts b/arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dts
index e37df043d98a..635a77d2d4aa 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dts
@@ -20,7 +20,7 @@ / {
 	compatible = "cloudengines,pogoe02", "marvell,kirkwood-88f6281",
 		     "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dts b/arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dts
index 0e9c4cf79822..eb6f714e6ef1 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-pogoplug-series-4.dts
@@ -18,7 +18,7 @@ / {
 	compatible = "cloudengines,pogoplugv4", "marvell,kirkwood-88f6192",
 		     "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dts b/arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dts
index 40610e1db167..837b1a139b3f 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-rd88f6192.dts
@@ -16,7 +16,7 @@ / {
 	model = "Marvell RD88F6192 reference design";
 	compatible = "marvell,rd88f6192", "marvell,kirkwood-88f6192", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-rd88f6281.dtsi b/arch/arm/boot/dts/marvell/kirkwood-rd88f6281.dtsi
index 9d62f910cddf..4a96f40bbd8f 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-rd88f6281.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-rd88f6281.dtsi
@@ -12,7 +12,7 @@
 #include "kirkwood-6281.dtsi"
 
 / {
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-rs212.dts b/arch/arm/boot/dts/marvell/kirkwood-rs212.dts
index 4ad412115a24..42f06080a2bc 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-rs212.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-rs212.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology RS212";
 	compatible = "synology,rs212", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-rs409.dts b/arch/arm/boot/dts/marvell/kirkwood-rs409.dts
index 43673b03cb35..bb00d909cf9d 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-rs409.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-rs409.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology RS409";
 	compatible = "synology,rs409", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-rs411.dts b/arch/arm/boot/dts/marvell/kirkwood-rs411.dts
index 41fa63cec839..553419bf2c4a 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-rs411.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-rs411.dts
@@ -15,7 +15,7 @@ / {
 	model = "Synology RS411 RS812";
 	compatible = "synology,rs411", "synology,rs812", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-sheevaplug-common.dtsi b/arch/arm/boot/dts/marvell/kirkwood-sheevaplug-common.dtsi
index 76e4d97491c7..865919dadd25 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-sheevaplug-common.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-sheevaplug-common.dtsi
@@ -9,7 +9,7 @@
 #include "kirkwood-6281.dtsi"
 
 / {
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-t5325.dts b/arch/arm/boot/dts/marvell/kirkwood-t5325.dts
index 7163fc819675..05618a38189c 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-t5325.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-t5325.dts
@@ -18,7 +18,7 @@ / {
 	model = "HP t5325 Thin Client";
 	compatible = "hp,t5325", "marvell,kirkwood-88f6281", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-topkick.dts b/arch/arm/boot/dts/marvell/kirkwood-topkick.dts
index 024a792c42c1..1fbbed7d2f0a 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-topkick.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-topkick.dts
@@ -8,7 +8,7 @@ / {
 	model = "Universal Scientific Industrial Co. Topkick-1281P2";
 	compatible = "usi,topkick-1281P2", "usi,topkick", "marvell,kirkwood-88f6282", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/kirkwood-ts219.dtsi b/arch/arm/boot/dts/marvell/kirkwood-ts219.dtsi
index 1939462a5f48..dd7cc8acb6c2 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ts219.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-ts219.dtsi
@@ -3,7 +3,7 @@ / {
 	model = "QNAP TS219 family";
 	compatible = "qnap,ts219", "marvell,kirkwood";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/mmp2-brownstone.dts b/arch/arm/boot/dts/marvell/mmp2-brownstone.dts
index bc64348b8218..54e24d04bf42 100644
--- a/arch/arm/boot/dts/marvell/mmp2-brownstone.dts
+++ b/arch/arm/boot/dts/marvell/mmp2-brownstone.dts
@@ -15,7 +15,7 @@ chosen {
 		bootargs = "console=ttyS2,38400 root=/dev/nfs nfsroot=192.168.1.100:/nfsroot/ ip=192.168.1.101:192.168.1.100::255.255.255.0::eth0:on";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dts b/arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dts
index e28b568e741a..e5f4f37cbeca 100644
--- a/arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-kuroboxpro.dts
@@ -62,7 +62,7 @@ soc {
 				 <MBUS_ID(0x01, 0x1e) 0 0xfc000000 0x1000000>;
 	};
 
-	memory { /* 128 MB */
+	memory@0 { /* 128 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
index 3024ef765a4c..195677394f3f 100644
--- a/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-lacie-d2-network.dts
@@ -15,7 +15,7 @@ / {
 	model = "LaCie d2 Network";
 	compatible = "lacie,d2-network", "marvell,orion5x-88f5182", "marvell,orion5x";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x4000000>; /* 64 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dts b/arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dts
index f81acb9b7223..135c5c622c3a 100644
--- a/arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-lacie-ethernet-disk-mini-v2.dts
@@ -19,7 +19,7 @@ / {
 	model = "LaCie Ethernet Disk mini V2";
 	compatible = "lacie,ethernet-disk-mini-v2", "marvell,orion5x-88f5182", "marvell,orion5x";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x4000000>; /* 64 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dts b/arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dts
index 79fee048c900..913448cf79e1 100644
--- a/arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-linkstation-lschl.dts
@@ -55,7 +55,7 @@ / {
 	model = "Buffalo Linkstation LiveV3 (LS-CHL)";
 	compatible = "buffalo,lschl", "marvell,orion5x-88f5182", "marvell,orion5x";
 
-	memory { /* 128 MB */
+	memory@0 { /* 128 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dts b/arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dts
index 9f6fedd39170..f874f0182d12 100644
--- a/arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-linkstation-lsgl.dts
@@ -56,7 +56,7 @@ / {
 	model = "Buffalo Linkstation Pro/Live";
 	compatible = "buffalo,lsgl", "marvell,orion5x-88f5182", "marvell,orion5x";
 
-	memory { /* 128 MB */
+	memory@0 { /* 128 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dts b/arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dts
index 7f77ce8cc1fc..3d69b21f51e5 100644
--- a/arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-linkstation-lswtgl.dts
@@ -54,7 +54,7 @@ / {
 	model = "Buffalo Linkstation LS-WTGL";
 	compatible = "buffalo,lswtgl", "marvell,orion5x-88f5182", "marvell,orion5x";
 
-	memory { /* 64 MB */
+	memory@0 { /* 64 MB */
 		device_type = "memory";
 		reg = <0x00000000 0x4000000>;
 	};
diff --git a/arch/arm/boot/dts/marvell/orion5x-lswsgl.dts b/arch/arm/boot/dts/marvell/orion5x-lswsgl.dts
index 938360157f44..fdc5a3132020 100644
--- a/arch/arm/boot/dts/marvell/orion5x-lswsgl.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-lswsgl.dts
@@ -54,7 +54,7 @@ / {
 	model = "Buffalo Linkstation Mini (LS-WSGL)";
 	compatible = "buffalo,lswsgl", "marvell,orion5x-88f5182", "marvell,orion5x";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x8000000>; /* 128 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts b/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
index cb1bd24b7ae3..4cfabd4fa628 100644
--- a/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-maxtor-shared-storage-2.dts
@@ -15,7 +15,7 @@ / {
 	model = "Maxtor Shared Storage II";
 	compatible = "maxtor,shared-storage-2", "marvell,orion5x-88f5182", "marvell,orion5x";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x4000000>; /* 64 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dts b/arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dts
index d63ea15539aa..cf66436d8e00 100644
--- a/arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-netgear-wnr854t.dts
@@ -15,7 +15,7 @@ aliases {
 		serial0 = &uart0;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x2000000>; /* 32 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts b/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
index 75ab913b21e5..1b8b14fcc0fc 100644
--- a/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
+++ b/arch/arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts
@@ -10,7 +10,7 @@ / {
 	model = "Marvell Reference Design 88F5182 NAS";
 	compatible = "marvell,rd-88f5182-nas", "marvell,orion5x-88f5182", "marvell,orion5x";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x4000000>; /* 64 MB */
 	};
diff --git a/arch/arm/boot/dts/marvell/pxa168-aspenite.dts b/arch/arm/boot/dts/marvell/pxa168-aspenite.dts
index 8bade6bf395b..080d1600ac02 100644
--- a/arch/arm/boot/dts/marvell/pxa168-aspenite.dts
+++ b/arch/arm/boot/dts/marvell/pxa168-aspenite.dts
@@ -15,7 +15,7 @@ chosen {
 		bootargs = "console=ttyS0,115200 root=/dev/nfs nfsroot=192.168.1.100:/nfsroot/ ip=192.168.1.101:192.168.1.100::255.255.255.0::eth0:on";
 	};
 
-	memory {
+	memory@0 {
 		reg = <0x00000000 0x04000000>;
 	};
 };
diff --git a/arch/arm/boot/dts/marvell/pxa910-dkb.dts b/arch/arm/boot/dts/marvell/pxa910-dkb.dts
index ce76158867c7..11d1fdfa40f7 100644
--- a/arch/arm/boot/dts/marvell/pxa910-dkb.dts
+++ b/arch/arm/boot/dts/marvell/pxa910-dkb.dts
@@ -15,7 +15,7 @@ chosen {
 		bootargs = "console=ttyS0,115200 root=/dev/nfs nfsroot=192.168.1.100:/nfsroot/ ip=192.168.1.101:192.168.1.100::255.255.255.0::eth0:on";
 	};
 
-	memory {
+	memory@0 {
 		reg = <0x00000000 0x10000000>;
 	};
 };
diff --git a/arch/arm/boot/dts/mediatek/mt2701-evb.dts b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
index d1a4d2e3825d..796a475b1e5b 100644
--- a/arch/arm/boot/dts/mediatek/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
@@ -13,7 +13,7 @@ / {
 	model = "MediaTek MT2701 evaluation board";
 	compatible = "mediatek,mt2701-evb", "mediatek,mt2701";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x80000000 0 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/mediatek/mt6580-evbp1.dts b/arch/arm/boot/dts/mediatek/mt6580-evbp1.dts
index 755a0774a8ee..39a1f54117b5 100644
--- a/arch/arm/boot/dts/mediatek/mt6580-evbp1.dts
+++ b/arch/arm/boot/dts/mediatek/mt6580-evbp1.dts
@@ -21,7 +21,7 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/mediatek/mt6582-prestigio-pmt5008-3g.dts b/arch/arm/boot/dts/mediatek/mt6582-prestigio-pmt5008-3g.dts
index b057e037f940..6bb3976e1500 100644
--- a/arch/arm/boot/dts/mediatek/mt6582-prestigio-pmt5008-3g.dts
+++ b/arch/arm/boot/dts/mediatek/mt6582-prestigio-pmt5008-3g.dts
@@ -20,7 +20,7 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/mediatek/mt6589-aquaris5.dts b/arch/arm/boot/dts/mediatek/mt6589-aquaris5.dts
index 1e7079a3b449..ebd06752750a 100644
--- a/arch/arm/boot/dts/mediatek/mt6589-aquaris5.dts
+++ b/arch/arm/boot/dts/mediatek/mt6589-aquaris5.dts
@@ -17,7 +17,7 @@ chosen {
 		stdout-path = &uart0;
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/mediatek/mt6592-evb.dts b/arch/arm/boot/dts/mediatek/mt6592-evb.dts
index 5e00c1cca2d1..745723d6f838 100644
--- a/arch/arm/boot/dts/mediatek/mt6592-evb.dts
+++ b/arch/arm/boot/dts/mediatek/mt6592-evb.dts
@@ -12,7 +12,7 @@ / {
 	model = "mt6592 evb";
 	compatible = "mediatek,mt6592-evb", "mediatek,mt6592";
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/mediatek/mt8127-moose.dts b/arch/arm/boot/dts/mediatek/mt8127-moose.dts
index 560687af87dc..c44d5e94aa7a 100644
--- a/arch/arm/boot/dts/mediatek/mt8127-moose.dts
+++ b/arch/arm/boot/dts/mediatek/mt8127-moose.dts
@@ -12,7 +12,7 @@ / {
 	model = "MediaTek MT8127 Moose Board";
 	compatible = "mediatek,mt8127-moose", "mediatek,mt8127";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x80000000 0 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/mediatek/mt8135-evbp1.dts b/arch/arm/boot/dts/mediatek/mt8135-evbp1.dts
index f6147fe62f41..d117074f8c66 100644
--- a/arch/arm/boot/dts/mediatek/mt8135-evbp1.dts
+++ b/arch/arm/boot/dts/mediatek/mt8135-evbp1.dts
@@ -12,7 +12,7 @@ / {
 	model = "MediaTek MT8135 evaluation board";
 	compatible = "mediatek,mt8135-evbp1", "mediatek,mt8135";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x80000000 0 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/microchip/at91-lmu5000.dts b/arch/arm/boot/dts/microchip/at91-lmu5000.dts
index f8863d7c0798..aba6c590c3a9 100644
--- a/arch/arm/boot/dts/microchip/at91-lmu5000.dts
+++ b/arch/arm/boot/dts/microchip/at91-lmu5000.dts
@@ -16,7 +16,7 @@ chosen {
 		bootargs = "mem=64M console=ttyS0,115200 rootfstype=jffs2";
 	};
 
-	memory {
+	memory@20000000 {
 		reg = <0x20000000 0x4000000>;
 	};
 
diff --git a/arch/arm/boot/dts/microchip/at91-q5xr5.dts b/arch/arm/boot/dts/microchip/at91-q5xr5.dts
index 9cf60b6f695c..09deae9e2b25 100644
--- a/arch/arm/boot/dts/microchip/at91-q5xr5.dts
+++ b/arch/arm/boot/dts/microchip/at91-q5xr5.dts
@@ -16,7 +16,7 @@ chosen {
 		bootargs = "console=ttyS0,115200 rootfstype=squashfs,jffs2";
 	};
 
-	memory {
+	memory@20000000 {
 		reg = <0x20000000 0x0>;
 	};
 
diff --git a/arch/arm/boot/dts/moxa/moxart-uc7112lx.dts b/arch/arm/boot/dts/moxa/moxart-uc7112lx.dts
index e07b807b4cec..e747fb418f24 100644
--- a/arch/arm/boot/dts/moxa/moxart-uc7112lx.dts
+++ b/arch/arm/boot/dts/moxa/moxart-uc7112lx.dts
@@ -11,7 +11,7 @@ / {
 	model = "MOXA UC-7112-LX";
 	compatible = "moxa,moxart-uc-7112-lx", "moxa,moxart";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x2000000>;
 	};
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
index 9f64c85e1c20..696bb9a04118 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
@@ -71,7 +71,7 @@ chosen {
 		stdout-path = &serial0;
 	};
 
-	memory {
+	memory@0 {
 		reg = <0 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts
index cd7843339c24..e5596e13287f 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dts
@@ -31,7 +31,7 @@ chosen {
 		stdout-path = &serial3;
 	};
 
-	memory {
+	memory@0 {
 		reg = <0 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
index 886a87dfcd0d..dc130a6ab9df 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-kudo.dts
@@ -41,7 +41,7 @@ chosen {
 		stdout-path = &serial3;
 	};
 
-	memory {
+	memory@0 {
 		reg = <0 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
index bcdcb30c7bf6..954d16830aa4 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dts
@@ -45,7 +45,7 @@ chosen {
 		stdout-path = &serial3;
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
index 087f4ac43187..c362ca47c941 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
@@ -43,7 +43,7 @@ chosen {
 		stdout-path = &serial3;
 	};
 
-	memory {
+	memory@0 {
 		reg = <0 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
index 587b71ed29d9..04f873a41988 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
@@ -26,7 +26,7 @@ chosen {
 	 *
 	 * The name of this node is effectively ABI and must not be changed.
 	 */
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
index 014e6c5ee889..c0d8747d0b81 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
@@ -89,7 +89,7 @@ CPU_SPC: cpu-spc {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0>;
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
index 91e296d2ea82..c433f44e5eb1 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
@@ -17,7 +17,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>; /* 256MB */
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
index cc88cf5f0d9b..adb79f66a4af 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
@@ -8,7 +8,7 @@
 / {
 	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK07.1";
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x20000000>; /* 512MB */
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 56415ab34083..2b14b2c93f72 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -129,7 +129,7 @@ opp-716000000 {
  		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0>;
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index 759a59c2bdbc..a3432a31f27f 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -271,7 +271,7 @@ cpu-hot {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0>;
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index a66c474cd1aa..1c7080e9e2ac 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -40,7 +40,7 @@ L2: l2-cache {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0>;
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index 68fa5859d263..4bc38667c777 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -20,7 +20,7 @@ / {
 	qcom,msm-id = <357 0x10000>, <368 0x10000>, <418 0x10000>;
 	interrupt-parent = <&intc>;
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0>;
 	};
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
index a949454212e9..b9014af215c0 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx65.dtsi
@@ -20,7 +20,7 @@ / {
 	qcom,msm-id = <458 0x10000>, <483 0x10000>, <509 0x10000>;
 	interrupt-parent = <&intc>;
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0>;
 	};
diff --git a/arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi b/arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi
index e43887c9635f..deef421c8699 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi
@@ -16,7 +16,7 @@ / {
 	 * Set the minimum memory size here and
 	 * let the bootloader set the real size.
 	 */
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi b/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
index e6bc55e73fb0..3ffec299d212 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
@@ -12,7 +12,7 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		reg = <0x0 0x0 0x0 0x80000000>;
 		device_type = "memory";
 	};
diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
index d838bf0d5d9a..22ea830efe07 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
@@ -22,7 +22,7 @@ chosen {
 	 * The default coreboot on veyron devices ignores memory@0 nodes
 	 * and would instead create another memory node.
 	 */
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/rockchip/rk3288-vyasa.dts b/arch/arm/boot/dts/rockchip/rk3288-vyasa.dts
index ee702d24f010..1edd7dc28ee3 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-vyasa.dts
+++ b/arch/arm/boot/dts/rockchip/rk3288-vyasa.dts
@@ -14,7 +14,7 @@ chosen {
 		stdout-path = &uart2;
 	};
 
-	memory {
+	memory@0 {
 		reg = <0x0 0x0 0x0 0x80000000>;
 		device_type = "memory";
 	};
diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d.dtsi
index 176e10a29896..74621a7628b2 100644
--- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d.dtsi
+++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d.dtsi
@@ -7,7 +7,7 @@
 #include "mstar-infinity2m-ssd20xd.dtsi"
 
 / {
-	memory {
+	memory@20000000 {
 		device_type = "memory";
 		reg = <0x20000000 0x8000000>;
 	};
diff --git a/arch/arm/boot/dts/st/spear1310-evb.dts b/arch/arm/boot/dts/st/spear1310-evb.dts
index 18191a87f07c..a84c66b02b5c 100644
--- a/arch/arm/boot/dts/st/spear1310-evb.dts
+++ b/arch/arm/boot/dts/st/spear1310-evb.dts
@@ -14,7 +14,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		reg = <0 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index cea624fc745c..b3456235a801 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -14,7 +14,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		reg = <0 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 3b6897084e26..7e0563c2c8b6 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -50,7 +50,7 @@ L2: cache-controller {
 		    cache-level = <2>;
 	};
 
-	memory {
+	memory@0 {
 		name = "memory";
 		device_type = "memory";
 		reg = <0 0x40000000>;
diff --git a/arch/arm/boot/dts/st/spear300-evb.dts b/arch/arm/boot/dts/st/spear300-evb.dts
index 303ef29fb805..d730bddad981 100644
--- a/arch/arm/boot/dts/st/spear300-evb.dts
+++ b/arch/arm/boot/dts/st/spear300-evb.dts
@@ -14,7 +14,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		reg = <0 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/st/spear310-evb.dts b/arch/arm/boot/dts/st/spear310-evb.dts
index ea0b53036f7b..f584b0833c38 100644
--- a/arch/arm/boot/dts/st/spear310-evb.dts
+++ b/arch/arm/boot/dts/st/spear310-evb.dts
@@ -14,7 +14,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		reg = <0 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/st/spear320-evb.dts b/arch/arm/boot/dts/st/spear320-evb.dts
index 3c026d021c92..76ff6508af7e 100644
--- a/arch/arm/boot/dts/st/spear320-evb.dts
+++ b/arch/arm/boot/dts/st/spear320-evb.dts
@@ -14,7 +14,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		reg = <0 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/st/spear320-hmi.dts b/arch/arm/boot/dts/st/spear320-hmi.dts
index 721e5ee7b680..4e21b0cc911e 100644
--- a/arch/arm/boot/dts/st/spear320-hmi.dts
+++ b/arch/arm/boot/dts/st/spear320-hmi.dts
@@ -14,7 +14,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		reg = <0 0x40000000>;
 	};
 
diff --git a/arch/arm/boot/dts/st/spear3xx.dtsi b/arch/arm/boot/dts/st/spear3xx.dtsi
index cc88ebe7a60c..647c922f93b4 100644
--- a/arch/arm/boot/dts/st/spear3xx.dtsi
+++ b/arch/arm/boot/dts/st/spear3xx.dtsi
@@ -20,7 +20,7 @@ cpu {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/st/spear600-evb.dts b/arch/arm/boot/dts/st/spear600-evb.dts
index a25b86d149ad..1d8a2ed0369b 100644
--- a/arch/arm/boot/dts/st/spear600-evb.dts
+++ b/arch/arm/boot/dts/st/spear600-evb.dts
@@ -12,7 +12,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x10000000>;
 	};
diff --git a/arch/arm/boot/dts/st/spear600.dtsi b/arch/arm/boot/dts/st/spear600.dtsi
index 6b67c0ceaed9..ead1b75db09d 100644
--- a/arch/arm/boot/dts/st/spear600.dtsi
+++ b/arch/arm/boot/dts/st/spear600.dtsi
@@ -18,7 +18,7 @@ cpu {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/st/ste-href.dtsi b/arch/arm/boot/dts/st/ste-href.dtsi
index fbf0309e108f..750925c4ef1f 100644
--- a/arch/arm/boot/dts/st/ste-href.dtsi
+++ b/arch/arm/boot/dts/st/ste-href.dtsi
@@ -8,7 +8,7 @@
 #include "ste-href-family-pinctrl.dtsi"
 
 / {
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
index 4d37c5fb553c..b90c15352c13 100644
--- a/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi
@@ -9,7 +9,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x04000000>,
 		    <0x08000000 0x04000000>;
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 2d9f1128f555..38013c66fc68 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -12,7 +12,7 @@ / {
 	model = "Calao Systems Snowball platform with device tree";
 	compatible = "calaosystems,snowball-a9500", "st-ericsson,u9500";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x20000000>;
 	};
diff --git a/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dts b/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dts
index 0c7949d21bd9..4565c32c0077 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dts
@@ -12,7 +12,7 @@ / {
 	model = "Moxa UC-8100-ME-T";
 	compatible = "moxa,uc-8100-me-t", "ti,am33xx";
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x20000000>; /* 512 MB */
 	};
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
index 17574d0d0525..10f8eea5a746 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
@@ -30,7 +30,7 @@ cpu@0 {
 		};
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>; /* 256 MB */
 	};
diff --git a/arch/arm/boot/dts/ti/omap/dra71-evm.dts b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
index f747ac56eb92..3b6bcdb58af6 100644
--- a/arch/arm/boot/dts/ti/omap/dra71-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
@@ -12,7 +12,7 @@ / {
 	compatible = "ti,dra718-evm", "ti,dra718", "ti,dra722", "ti,dra72", "ti,dra7";
 	model = "TI DRA718 EVM";
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>; /* 2GB */
 	};
diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
index 128a158e7ec9..e096d8f46249 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
@@ -10,7 +10,7 @@ / {
 	 * We seem to have only 1021 MB accessible, 1021 - 1022 is locked,
 	 * then 1023 - 1024 seems to contain mbm.
 	 */
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x3fd00000>;	/* 1021 MB */
 	};
diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index f23cb5ee11ae..fa4e4eef09f7 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -20,7 +20,7 @@ cpu {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0>;
 	};
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index d9e1280372c5..58341fc5641c 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -20,7 +20,7 @@ cpu {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0>;
 	};
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 35d12d77efc0..9a54100754b0 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -20,7 +20,7 @@ cpu {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0>;
 	};
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index b292f85d4e69..1f7bc1417027 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -20,7 +20,7 @@ cpu {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0>;
 	};
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index c61717ebb4f1..003e59fc4da3 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -21,7 +21,7 @@ cpu@0 {
 		};
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0>;
 	};
-- 
2.46.2

