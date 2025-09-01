Return-Path: <openbmc+bounces-544-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C4AB3D944
	for <lists+openbmc@lfdr.de>; Mon,  1 Sep 2025 08:00:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFdW21BL2z303B;
	Mon,  1 Sep 2025 15:59:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756706382;
	cv=none; b=n0lQMckOYq+fXcL0eF+I8+Q6lO+ngRfgsvu2A9cnetEqT+46MRia3o39roswekIKAJKgPxSs8vfJioNRMbc9Px/76ZDUID+dAAijJeaEFwLCWEaQqdiIKyPloJkPJj48o/GoWT2+qMKRwI5+erhe0+AhdFaXPuonNBRweotg07JYFL8paMgNImNpAuTkk+cVJ7YbyVYh30dZHLiAYztalMq2k9HSYB33Q9KR3wFCoXvIjuD3sEJ8xijQfi3FUOVXkcq9Xe+S/QcIG6jgiLKWqSZmvEBGP1iA97Uixx46eNL9/1sDHiCj0RQAMk4WQYV8oAVTUtDmtMTqWtISs6bjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756706382; c=relaxed/relaxed;
	bh=xGdTP2H148U/01WvfN8g0M5sMKU/TtA0yuOGlAf0LZg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b5poQgHxFqylY3nQA/ZSDrluSaGmZkWYrJWjP1LJY3EtkMEnyOav3nkna+Dp0aHDxNDqfH9FntPZegIPa9XWopCDRFdQQ+eLrwkTMPtlocJ6aldR3eZD2tJhddVBqNSspL1eiT9+BybXerd4Xjn4J8ybCrGB4WYh33p5UXwOXSE3wR2GHqz99xemTByKIbvWaMyVUG+ROBUWFz+vQtuMYNh+POI6617aBoKGTr1EYc9KlOVfP9edri+Bu0OVbYo6OQcHr/jIsIOytJPlxFF4vTiwRLq3fJbElfWJ3CKE6C69GHgt27/mTPyUtdfEi2nhkO64pS61F1+66qP9z/NeQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFdW14bVsz301n;
	Mon,  1 Sep 2025 15:59:41 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Sep
 2025 13:59:23 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Sep 2025 13:59:23 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bhelgaas@google.com>,
	<lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v3 04/10] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST# group
Date: Mon, 1 Sep 2025 13:59:16 +0800
Message-ID: <20250901055922.1553550-5-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
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

Add PCIe PERST# group to support for PCIe RC.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 80974c46f3ef..af8979af9b45 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -141,6 +141,7 @@ additionalProperties:
         - NRTS3
         - NRTS4
         - OSCCLK
+        - PCIERC1
         - PEWAKE
         - PWM0
         - PWM1
@@ -369,6 +370,7 @@ additionalProperties:
         - NRTS3
         - NRTS4
         - OSCCLK
+        - PCIERC1
         - PEWAKE
         - PWM0
         - PWM1
-- 
2.43.0


