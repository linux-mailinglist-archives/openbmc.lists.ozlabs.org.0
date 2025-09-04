Return-Path: <openbmc+bounces-589-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D28ACB438C7
	for <lists+openbmc@lfdr.de>; Thu,  4 Sep 2025 12:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHbSY299vz2yrZ;
	Thu,  4 Sep 2025 20:34:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756982061;
	cv=none; b=TEWLmuUNV0f+0WLuu6adJSPn+SFBJUpeHjeJPeILXYtC7TUyNsKwlbziWDMYwuA5lJPVVyPKzzCVZJn1jwf77Ji/OAQLc/BBkaoCKncrW5hTYHJf180JlnylYj+qMswE/WizLe2OpojQxEC7+vHVl3KUj7UO6FGn17SSgLIe/VkgZQ21DwvdAybujL1wNoAvMboOZYulsP4DLa9dNNLc+nEnr3u1rKMaMDGUjF+PSexDzj7nxbLKaSkmYuVzIjN7Q4lwmwjpq1bBQxLaDp/0XBVifwPaI3AaEJhU4jpEUae6vBcSdE9JoaUhE+O9wxFN4NEd3haCFXIG7jCkmoZdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756982061; c=relaxed/relaxed;
	bh=ihXqDf6rFoe4ZyEA7NFzt+D6bf9oIyLTCI2gHHd30lc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OB6bMocMnxvAEtHS/7hvJU8VjO9TD09kwuQ96NWyM3MzPze1z81nMLamtVqjkg6msIlzVjAcMWC/GqDeiZlpQ1+ikgZviYefNOI8c55uAglT+XQQFqM1YXe2Y2/A/scp+tQJPMbr/pfLFaJSXHVa8UShS6h2+GqQC1h1OeRqSzfc9Ol0sTD3g+fjjJUqEIfoxKO27C7EVfKktLyPFuvgCg7DVW2xl00QgoqBWzUnjJP5aZREKIbYNQYL0AD6eaAUYe40LtJ+753twU5mGrfggknpkDyj2N5jOYdwiY6GzESwaU7eo0rJkIMgWNuWCo4MV2ol05b+NOw2zA6lJHjHPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHbSX1zRbz2xd6;
	Thu,  4 Sep 2025 20:34:19 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 4 Sep
 2025 18:34:01 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 4 Sep 2025 18:34:01 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2 0/4] Add pinctrl support for AST2700 SoC
Date: Thu, 4 Sep 2025 18:33:57 +0800
Message-ID: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Document and add the pinctrl driver for AST2700 SoC.

Changes since v1:
- Update pinctrl aspeed binding files.
- Update the commit message for pinctrl binding patch.

Billy Tsai (4):
  dt-bindings: mfd: aspeed,ast2x00-scu: Support ast2700 pinctrl
  dt-bindings: pinctrl: aspeed: Add support for AST27xx
  pinctrl: aspeed: Add AST2700 pinmux support
  arm64: dts: add AST27xx pinctrl configuration nodes

 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |    2 +
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  |  115 +
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  |  435 +++
 .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++
 drivers/pinctrl/aspeed/Kconfig                |    8 +
 drivers/pinctrl/aspeed/Makefile               |    1 +
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c   |  503 ++++
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c   | 2523 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       |   47 +
 drivers/pinctrl/aspeed/pinctrl-aspeed.h       |   11 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |   35 +-
 11 files changed, 5034 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c

-- 
2.25.1


