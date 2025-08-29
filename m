Return-Path: <openbmc+bounces-528-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF60B3B448
	for <lists+openbmc@lfdr.de>; Fri, 29 Aug 2025 09:30:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCqgX4YPvz2ymg;
	Fri, 29 Aug 2025 17:30:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756452648;
	cv=none; b=BCddLK7UKpMCUTmNNpb9P1TCOWNfek5KdvQSEsWbG3jQAsxFpqyf4vIfDCZBjXpDbpXIcoeCR1zmyE6CquYCO76pJyAaykCmVBHerY1m+dOoPxdDLgtB0/B6iJdfE1mSpKPDX+YrCHzzBozKPAehDQBqXFYFi/i9lKUw5jdQz1NpDe8fdgmKWQNut/H1SvM6nt74IHIdJTzRrih4lTkqf2UVWiLIbYqj/UHfi6hdZe4CparjKj+Vu0Yk7kyoqvNP+FQjTyHWqtuLndMvc+TX5gVMrPvXpWgM0LQkjWvm4hJx8fFQRFKYnX4LvRwuAC10/doVrbScMAZ5WnNFuvADVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756452648; c=relaxed/relaxed;
	bh=h2OPmLu+bFfrNtITooklVRnecpSML6NoYP68hYffNFc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UphF4cnbuxuMtNAKp1HlAMq5WSQUzuVxYNyCaFAZHppBWdsl25hz3AiE2KtpKjFCM2tmVLE72Iq7/dfP35Q6BLn8Hg+VXGKM1t3Zyc736n6S944F76gXn3oOSC5a16ZjaqHmByVkXc0U/A4ZyqwJXvFWi1KblBocOmyjrnHlccgsUf1XoWkBB1gYm5OOM0Dk3eJH3nOWEEGwILY2quQf01Zmkb1/6Ynvqo6OkbL15u9bWDM4ybjZrYUQT+TMOSbyS5HaQzmwbacN8Vb9uYkDed9HWz2LAcW028Hm3ZIvS5XLaxvEtEjHYdpTzu7iReUt793VA2XwbUgw9PO2H1BEwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCqgV6v8Gz2xlQ;
	Fri, 29 Aug 2025 17:30:46 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 29 Aug
 2025 15:30:30 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 29 Aug 2025 15:30:30 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v1 0/4] Add pinctrl support for AST2700 SoC
Date: Fri, 29 Aug 2025 15:30:26 +0800
Message-ID: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
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

Billy Tsai (4):
  dt-bindings: mfd: aspeed,ast2x00-scu: Support ast2700 pinctrl
  dt-bindings: pinctrl: aspeed: Add support for AST27xx
  pinctrl: aspeed: Add AST2700 pinmux support
  arm64: dts: add AST27xx pinctrl configuration nodes

 .../bindings/mfd/aspeed,ast2x00-scu.yaml      |    2 +
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  |  135 +
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  |  452 +++
 .../boot/dts/aspeed/aspeed-g7-pinctrl.dtsi    | 1359 +++++++++
 drivers/pinctrl/aspeed/Kconfig                |    8 +
 drivers/pinctrl/aspeed/Makefile               |    1 +
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c   |  503 ++++
 .../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c   | 2523 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       |   47 +
 drivers/pinctrl/aspeed/pinctrl-aspeed.h       |   11 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |   35 +-
 11 files changed, 5071 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/aspeed/aspeed-g7-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c

-- 
2.25.1


