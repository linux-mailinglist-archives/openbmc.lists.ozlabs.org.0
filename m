Return-Path: <openbmc+bounces-880-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C30C5660E
	for <lists+openbmc@lfdr.de>; Thu, 13 Nov 2025 09:54:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6YwH2nbzz302b;
	Thu, 13 Nov 2025 19:53:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763024031;
	cv=none; b=jtml27vXksMxKAtsDjKZn12JLDxokKjA8V+855AbEQgZ4jZGIUtpxZbEMtkZ6lRZ7aRSPMzaYgwqCqtLNMY03buFxMdHrVcA6Htf9dQOnel0A8m4Z91M8/AUUyDSbFisvUN6k5mBSkUqPZlY0f7wbvKIaLPPNOWJdu1uhUbwEYONVbh2+ZiQfwKYdBux708cQ64K4LrCLef9vkCkbUN7+LNVCFzEj6wiHsbRhWBI3eYgw3nj1Wl0kZfpbeqaY8QiaHgEI1uzDWKCZ/KVKRuz4B1FPrN7WiZJw3KGBWuopEbd64a6HO3WFE0qLQseVJRqtdc0sQbySgFEqa1CQbRZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763024031; c=relaxed/relaxed;
	bh=4ylbLSERFdxpjK3Ks4mKb0k24yEBmAexwJL7z+SYv0M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oArpMlpP5kp94JNLKVm11tsVJF/jod/i1Cawe+/dBmDiB5JfRUocyfvhAaJhqOt2GYd0p7ietas64dZzZlT4yMr2CY5E73WP7332CtXQGBuy0VtphIivVRZLGdMmGOhLk2UwgIJJkvntTpT50h7DpoTxT52h01wcO7SaFvMV3QtkxG/D1Vb5RT25Q+H1pVOGjcAH6ObD52oPArZ+35ZT8DpxdERPMjqgIdpTnYQ3po2YT5v3Tv43UxQ2fVFeP1wm/+fHkXxdjvDPqJkpLGQydYTlpnAP9qt6oDHyECKscHethBGLOQE5RJl4Akslx7s8t+NWuKIHcbM7++zc37AiSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6YwG66rkz2yx7;
	Thu, 13 Nov 2025 19:53:50 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 13 Nov
 2025 16:53:33 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 13 Nov 2025 16:53:33 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 1/4] dt-bindings: spi: aspeed,ast2600-fmc: Add AST2700 SoC support
Date: Thu, 13 Nov 2025 16:53:29 +0800
Message-ID: <20251113085332.89688-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113085332.89688-1-chin-ting_kuo@aspeedtech.com>
References: <20251113085332.89688-1-chin-ting_kuo@aspeedtech.com>
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

Add AST2700 to the list of supported SoCs in the ASPEED FMC/SPI bindings.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
index 57d932af4506..80e542624cc6 100644
--- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
+++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 description: |
   This binding describes the Aspeed Static Memory Controllers (FMC and
-  SPI) of the AST2400, AST2500 and AST2600 SOCs.
+  SPI) of the AST2400, AST2500, AST2600 and AST2700 SOCs.
 
 allOf:
   - $ref: spi-controller.yaml#
@@ -20,6 +20,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - aspeed,ast2700-fmc
+      - aspeed,ast2700-spi
       - aspeed,ast2600-fmc
       - aspeed,ast2600-spi
       - aspeed,ast2500-fmc
-- 
2.34.1


