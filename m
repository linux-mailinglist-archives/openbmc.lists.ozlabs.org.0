Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7C69AC81D
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2024 12:44:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYQfQ5GPZz3c4P
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2024 21:44:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729680283;
	cv=none; b=gBou27x7GEetT85ZfkeO35n9v/yPh08x38w2BYg1oCic1asZ6gHX/+ahcnbl2W2DHXhktAm2Sw+7jHU41cn7sQjSPD72nq+udjEnAVgRqOBqYN3hIJ1Y4VI/P+y2dG5SqXCtkFBvgBgAEzzLFvHXaSZoaeUeiXjyt/5yBsDLOZfiK1z4rBykNXG776okzencOjG+Epuz/50iUJHQQh8qPkJysRm0oZX/JF1oUs1PaLRqWDr/vZb45Xhak+Ub+zjGPlwhRNFjfYwStwZgdwYgR5wJNaJhq35at11C+OotVced8qEDS3jHDeOOk+dghU6s+DZr8lUs7udhMV1IFqq/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729680283; c=relaxed/relaxed;
	bh=Z3XhHKPkoxwCFa+QumSpvkYZ5brNAJybuSuf1JsI9+A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aB2e/cMdLNi5CG+OAPWajwvB0S57JDCoo/j8HQtJL7++oDe9lkWMfxL623pZMRd7Fo1TuJjcD5tOQwa9HTNEtub/oOmgQkTBdnPWRrJwP5WP1aHYrPVovFx5AEKqEptVNJWgM1iOn1x9bJC4gQdL6TMupzt4u8HDTvFpTgcmB+UP6PmZdobRPeVPQcusht94hNNO2w7NV6HFBnQTJrZQNdLEAUkUGyDU1AvtVdgQAziNkyqcnRzt7JPcPRuoKMpUyQYBiczkY2GJw1vs0q2eRWpZCgG2iGGej/M9FvgOCUcf+BkIakudczdOHUjJJTmMNcdDJ96ojdUYMhASSPiYkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYQfL06gpz2yF6;
	Wed, 23 Oct 2024 21:44:31 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 23 Oct
 2024 18:44:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 23 Oct 2024 18:44:06 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <linus.walleij@linaro.org>,
	<joel@jms.id.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] pinctrl: aspeed-g6: Support drive-strength for GPIOF/G
Date: Wed, 23 Oct 2024 18:44:06 +0800
Message-ID: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add drive strength configuration support for GPIO F and G groups.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 6ecc656abc44..5a7cd0a88687 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2607,6 +2607,10 @@ static struct aspeed_pin_config aspeed_g6_configs[] = {
 	{ PIN_CONFIG_DRIVE_STRENGTH, { AB8, AB8 }, SCU454, GENMASK(27, 26)},
 	/* LAD0 */
 	{ PIN_CONFIG_DRIVE_STRENGTH, { AB7, AB7 }, SCU454, GENMASK(25, 24)},
+	/* GPIOF */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { D22, A23 }, SCU458, GENMASK(9, 8)},
+	/* GPIOG */
+	{ PIN_CONFIG_DRIVE_STRENGTH, { E21, B21 }, SCU458, GENMASK(11, 10)},
 
 	/* MAC3 */
 	{ PIN_CONFIG_POWER_SOURCE,   { H24, E26 }, SCU458, BIT_MASK(4)},
-- 
2.25.1

