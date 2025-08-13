Return-Path: <openbmc+bounces-440-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD837B257D8
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 01:52:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2QBJ447Hz3bqP;
	Thu, 14 Aug 2025 09:51:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.23.235
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755123490;
	cv=none; b=DMecY8zwTMsJzDr+Z3IlizOC/UnRVEqK2XgLY3V3E971LlIIni4cwoG5JCmRYG7CSlOzl3am8kLXac1xJRDWjJmk3JrrjIVjF7a/0LDFIhgLi8QIyRqPvdwtKg4MnmMePffQ/CHOgSG5J6AOQKBrusFRPEp865WcyKnYD2dnrtKacyLey5o/Tl2DXIGEYVhLkgVpZRImTrMyuviKzmO234FHNONcEvC35aYOAtoold26/85rWdhbO4RPVK+E1bkus7feb8SniNUxOxtpz6AzrjzOpTT3nOjyPuj9ULMietuV2DInXsBm/XyBi0DF9XjWSEUGVuL+jCbMC/1WeMZFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755123490; c=relaxed/relaxed;
	bh=N10erRoEBXTD6NQIqVCoyKFPIunTNnzn74wpSpfIUKs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WWlwS5TDxHExL9jqacbyO9TlSshaNPJpvSSnqbB9dLmGEld+vgK8RF34H1x0JvAH+7I34+QmtVyjAtLJpZiFov2dt2C+k9OFotnnv1OxuZvUczWlPNKJAflZg6OersEYZouu5bdeIree/+tezn/fYiPBHh62mMH1mWcgndvU7oOJQWBv5GXuoiu6UW7Jgrn0CrSLYWmjK7ICOCB+vqukrixLsC8Ykp0cU2qHoCb31+BJ7YLWURFHOX95DG4HDXbr3Z0QZUIoBGaQf7DNSYCMLmRTP63jwslFv77LWueiHSOxIY8TD3Fmx3GNdU/ar2G/mlIwHYqJ0drZDAFLXFF7eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=qQ9pX/BV; dkim-atps=neutral; spf=pass (client-ip=198.47.23.235; helo=lelvem-ot02.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=qQ9pX/BV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.23.235; helo=lelvem-ot02.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2N6n6DPCz2xHp
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 08:18:09 +1000 (AEST)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfgrP2238055;
	Wed, 13 Aug 2025 16:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121302;
	bh=N10erRoEBXTD6NQIqVCoyKFPIunTNnzn74wpSpfIUKs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qQ9pX/BVJfCp4RKnoYAUwMmgmWjPB6GtCU4fqgI2IfJ5hOq0hRoklLxUPRjM8Amn7
	 d3Lok2q4SfnGwM70ycFfAmmIZn07qv7nTVyxebkEJPIa9m3wcWaEgBYhabyNUEVZWa
	 BaLYMaTvsYVtmn46fF8vG/nzKYw1COtmxmwyZd4o=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLfgIg354028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:41 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNJ2611079;
	Wed, 13 Aug 2025 16:41:41 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 4/6] reset: ma35d1: Use devm_register_sys_off_handler()
Date: Wed, 13 Aug 2025 16:41:36 -0500
Message-ID: <20250813214138.477659-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
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
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Function register_restart_handler() is deprecated. Using this new API
removes our need to keep and manage a struct notifier_block and to
later unregister the handler.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/reset/reset-ma35d1.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-ma35d1.c b/drivers/reset/reset-ma35d1.c
index 54e53863c98aa..4ee901f001326 100644
--- a/drivers/reset/reset-ma35d1.c
+++ b/drivers/reset/reset-ma35d1.c
@@ -19,7 +19,6 @@
 
 struct ma35d1_reset_data {
 	struct reset_controller_dev rcdev;
-	struct notifier_block restart_handler;
 	void __iomem *base;
 	/* protect registers against concurrent read-modify-write */
 	spinlock_t lock;
@@ -125,10 +124,9 @@ static const struct {
 	[MA35D1_RESET_SSPCC] =   {0x2C, 31}
 };
 
-static int ma35d1_restart_handler(struct notifier_block *this, unsigned long mode, void *cmd)
+static int ma35d1_restart_handler(struct sys_off_data *sys_off_data)
 {
-	struct ma35d1_reset_data *data =
-				 container_of(this, struct ma35d1_reset_data, restart_handler);
+	struct ma35d1_reset_data *data = sys_off_data->cb_data;
 	u32 id = MA35D1_RESET_CHIP;
 
 	writel_relaxed(BIT(ma35d1_reset_map[id].bit),
@@ -213,11 +211,10 @@ static int ma35d1_reset_probe(struct platform_device *pdev)
 	reset_data->rcdev.nr_resets = MA35D1_RESET_COUNT;
 	reset_data->rcdev.ops = &ma35d1_reset_ops;
 	reset_data->rcdev.of_node = dev->of_node;
-	reset_data->restart_handler.notifier_call = ma35d1_restart_handler;
-	reset_data->restart_handler.priority = 192;
 	spin_lock_init(&reset_data->lock);
 
-	err = register_restart_handler(&reset_data->restart_handler);
+	err = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART, 192,
+					    ma35d1_restart_handler, reset_data);
 	if (err)
 		dev_warn(&pdev->dev, "failed to register restart handler\n");
 
-- 
2.39.2


