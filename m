Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A44DD2A7
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 02:56:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKRvW13QDz3bNB
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 12:56:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=YZbm3vVQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=YZbm3vVQ; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5FR6NRLz2xsb
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:55:54 +1100 (AEDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 99D7B3F602
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518147;
 bh=FcFbQHcGNFkpGdda+W/UDbbdrtmD52pzfetu6Zdta/c=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=YZbm3vVQ5reIqHrD1wDGRrwe2UaTeuW2u/cuxT1NCrAqf5Qh1AgPwhikB1ksPwYO+
 PBlU9Or+mWV/avsWVAvB2cGO46wyyrPJlYdZVuRa9OdFtAc8RDV/XT8x6Npt2jn+lz
 Z5UlkzAlfWa9hjcP53b8pJUfRUmoXPmHdJdaYsYN0JmNI4PLphHznVs87zGNFJn/Ue
 atJSFJnE7P7wts6qJoYD13LwslAr0Ng86jpe4PJ8v4g2pMgiMSo5mgDmG4KOlH7PWT
 86/nV5ar7/ALyIRlYPXoZogYfrT8JYkjnYTQvx9x8o/iUnnXIPj7enFPWjtv47HPbi
 tdRlfXPm0DdSw==
Received: by mail-wm1-f72.google.com with SMTP id
 a26-20020a7bc1da000000b003857205ec7cso2024869wmj.2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FcFbQHcGNFkpGdda+W/UDbbdrtmD52pzfetu6Zdta/c=;
 b=6q/2vPUYPqn1wHcdpD73h9pgA7TCNsugjOWDjaHC5SNsXOYHk1cVhdC+RADMzLHS2E
 kmKx6i0iSQDtwpDY1znyujhP62sBqWWqxHzxFIeaa90x9weJFhPVHEpoJSZWz3o0ccAb
 mpZQFce3FBQgUoiZALgJ5mnfu9jFXUh1x4xe2/sbCDttR5lSJ5B8EMw0mN1/YFdOhbtR
 SmZUpKXO6o//6Bd6hAzRWc1Y//+zE10BB2sCp3JYqfFxWUNoQ5z/uUX86QDknZaWriTq
 Z63wlJtHjFAgL5YqhZbcSOLm/UXmZCb9+RIFCMuuHTFz/WWz1KpNWor+C0uEB6RLllyR
 Igjg==
X-Gm-Message-State: AOAM533kIKV4qYnN69ilQbu7nFaGNs9Bnlxtcdo8diM3KaemZXAUsnM6
 sFWQqEfkGh91TRFJJUSWTUp7QzMvBsNUhkuo6KcfCZltEyZMRxxyj/JzMq/M5OX70TwX3e2BBbT
 pWuPIWTG+dNST/r2RQqNiKQkWqLtW7+dKFZjN
X-Received: by 2002:adf:ebc3:0:b0:203:da35:a9c1 with SMTP id
 v3-20020adfebc3000000b00203da35a9c1mr3846119wrn.610.1647518147110; 
 Thu, 17 Mar 2022 04:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo+9tYsHqgUbTsMitSzq8mwjoiBGte5RGn6KnSHAj4SsmoojLzUqarbdnwawIw9oRk9oUklg==
X-Received: by 2002:adf:ebc3:0:b0:203:da35:a9c1 with SMTP id
 v3-20020adfebc3000000b00203da35a9c1mr3846069wrn.610.1647518146894; 
 Thu, 17 Mar 2022 04:55:46 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm11462862wms.9.2022.03.17.04.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:55:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Subject: [PATCH 00/18] dt-bindings: irqchip: include generic schema
Date: Thu, 17 Mar 2022 12:55:24 +0100
Message-Id: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 18 Mar 2022 12:55:47 +1100
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

The DTS patches can be picked up independently.

Best regards,
Krzysztof

Krzysztof Kozlowski (18):
  ARM: dts: nspire: use lower case hex addresses in node unit addresses
  ARM: dts: ox820: align interrupt controller node name with dtschema
  ARM: dts: socfpga: align interrupt controller node name with dtschema
  dt-bindings: irqchip: actions,owl-sirq: include generic schema
  dt-bindings: irqchip: fsl: include generic schema
  dt-bindings: irqchip: ingenic: include generic schema
  dt-bindings: irqchip: intel,ixp4xx: include generic schema
  dt-bindings: irqchip: kontron,sl28cpld: include generic schema
  dt-bindings: irqchip: loongson: include generic schema
  dt-bindings: irqchip: microchip,eic: include generic schema
  dt-bindings: irqchip: mrvl,intc: include generic schema
  dt-bindings: irqchip: mstar,mst-intc: include generic schema
  dt-bindings: irqchip: mti,gic: include generic schema
  dt-bindings: irqchip: nuvoton,wpcm450-aic: include generic schema
  dt-bindings: irqchip: realtek,rtl-intc: include generic schema
  dt-bindings: irqchip: renesas: include generic schema
  dt-bindings: irqchip: sifive: include generic schema
  dt-bindings: irqchip: ti: include generic schema

 .../actions,owl-sirq.yaml                     |  5 +-
 .../interrupt-controller/fsl,intmux.yaml      |  5 +-
 .../interrupt-controller/fsl,irqsteer.yaml    |  5 +-
 .../interrupt-controller/ingenic,intc.yaml    |  5 +-
 .../intel,ixp4xx-interrupt.yaml               |  5 +-
 .../kontron,sl28cpld-intc.yaml                |  5 +-
 .../interrupt-controller/loongson,htvec.yaml  |  5 +-
 .../loongson,pch-msi.yaml                     |  5 +-
 .../loongson,pch-pic.yaml                     |  5 +-
 .../interrupt-controller/microchip,eic.yaml   |  5 +-
 .../interrupt-controller/mrvl,intc.yaml       |  3 +-
 .../interrupt-controller/mstar,mst-intc.yaml  |  5 +-
 .../interrupt-controller/mti,gic.yaml         |  5 +-
 .../nuvoton,wpcm450-aic.yaml                  |  7 ++-
 .../realtek,rtl-intc.yaml                     |  5 +-
 .../renesas,intc-irqpin.yaml                  | 28 +++++----
 .../interrupt-controller/renesas,irqc.yaml    |  5 +-
 .../sifive,plic-1.0.0.yaml                    |  5 +-
 .../interrupt-controller/ti,pruss-intc.yaml   |  5 +-
 .../interrupt-controller/ti,sci-inta.yaml     |  1 +
 .../interrupt-controller/ti,sci-intr.yaml     |  3 +-
 arch/arm/boot/dts/nspire-classic.dtsi         | 10 ++--
 arch/arm/boot/dts/nspire-cx.dts               |  4 +-
 arch/arm/boot/dts/nspire.dtsi                 | 60 +++++++++----------
 arch/arm/boot/dts/ox820.dtsi                  |  2 +-
 arch/arm/boot/dts/socfpga.dtsi                |  2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi        |  2 +-
 27 files changed, 129 insertions(+), 73 deletions(-)

-- 
2.32.0

