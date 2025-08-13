Return-Path: <openbmc+bounces-442-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23066B257DB
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 01:53:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2QBK4XfGz3cYB;
	Thu, 14 Aug 2025 09:51:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.23.234
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755122248;
	cv=none; b=F2vIq9NscN0Dv3q6Ck6KFpk3D4bwOvyBWpXmvTavaQpSkakpAfGp+yVXbJ1abm10VhNM53woMxcIqdg8maVTXR3FrZvh5ViB3mXfhvOznY5Uzq6RTWjyKtVxaBmM4odBM/N8QSAEaB28t47vTIq2yapuyJyg3sakJqZCM6HGK5m0ma1GK9zDL4qIbMGgalbldHba9uRL9ZBeEfZLyqIctepwGRwV+EMaEr/tXmjlYpicmXYL96Ali6gZXtrYICKXck5qhW9ABj81Ksuzm9xY8I749WrvOuhXXNSTzVKPzdt7/gKfv1ZWvs3JiblFnc9wdFc68zjiwQ6oOoFkgB/Hkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755122248; c=relaxed/relaxed;
	bh=wWksHDBmgI3dIadKYWOJxAKOIZlW7syLhIJmTFxpaxA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ANCgwgUcsMOJczKE7w+E1ZCi3Gd1Kr3ZA8wdg5/y+l20XgN8MNr1alDFhDmVm4wmT/nGSPYykNfC94S2AooE6ZmlClybUITXCnLHmPJBlJtjiWi6Xco7Tjl8Q1PvV3H+1IS4KPgeI4i3Cor/HvmiC/6GuPL1Q8Up8bGobSW0/RACPLoZJ3V/0cFu+mU2X/sb0t9XJ7JeAbuJcnSML44E99Vvit2I4AZTeUzXBoSeyn0MOy0cPuwd/u7lYDxUDpvAClEzKRFmh03GHGCmyOp07HbiZIb419VHh6ka2pbdWKMm18dOYYEos2ZeGXZrIG0FXC2nZYolANDWD5biuj5ENw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=hwprcvhE; dkim-atps=neutral; spf=pass (client-ip=198.47.23.234; helo=lelvem-ot01.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=hwprcvhE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.23.234; helo=lelvem-ot01.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 921 seconds by postgrey-1.37 at boromir; Thu, 14 Aug 2025 07:57:27 AEST
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2Mfv5Rl9z2xK5
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 07:57:26 +1000 (AEST)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfeK01788737;
	Wed, 13 Aug 2025 16:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121301;
	bh=wWksHDBmgI3dIadKYWOJxAKOIZlW7syLhIJmTFxpaxA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hwprcvhEofD7vETt+EIe1r/OT111emuuxsiAP1mZzCEyDtFBHXdfEa8rVgei90vYb
	 E3ZMoDDXI+YxhUJm9Zlh4m848bhKcfFM0svNuie7XtNwopBm8LpT2HBhqlcCT8TKCl
	 fMFRLZqkmMx+0yUXmcI3ZYpkjtYHUdgqVNB/yknY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLfeTR678594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:40 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:40 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNG2611079;
	Wed, 13 Aug 2025 16:41:40 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 1/6] reset: ath79: Use devm_register_restart_handler()
Date: Wed, 13 Aug 2025 16:41:33 -0500
Message-ID: <20250813214138.477659-2-afd@ti.com>
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
 drivers/reset/reset-ath79.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/reset-ath79.c b/drivers/reset/reset-ath79.c
index b5d620132052d..4c4e69eb32bbc 100644
--- a/drivers/reset/reset-ath79.c
+++ b/drivers/reset/reset-ath79.c
@@ -15,7 +15,6 @@
 
 struct ath79_reset {
 	struct reset_controller_dev rcdev;
-	struct notifier_block restart_nb;
 	void __iomem *base;
 	spinlock_t lock;
 };
@@ -72,11 +71,9 @@ static const struct reset_control_ops ath79_reset_ops = {
 	.status = ath79_reset_status,
 };
 
-static int ath79_reset_restart_handler(struct notifier_block *nb,
-				unsigned long action, void *data)
+static int ath79_reset_restart_handler(struct sys_off_data *data)
 {
-	struct ath79_reset *ath79_reset =
-		container_of(nb, struct ath79_reset, restart_nb);
+	struct ath79_reset *ath79_reset = data->cb_data;
 
 	ath79_reset_assert(&ath79_reset->rcdev, FULL_CHIP_RESET);
 
@@ -108,10 +105,7 @@ static int ath79_reset_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	ath79_reset->restart_nb.notifier_call = ath79_reset_restart_handler;
-	ath79_reset->restart_nb.priority = 128;
-
-	err = register_restart_handler(&ath79_reset->restart_nb);
+	err = devm_register_restart_handler(&pdev->dev, ath79_reset_restart_handler, ath79_reset);
 	if (err)
 		dev_warn(&pdev->dev, "Failed to register restart handler\n");
 
-- 
2.39.2


