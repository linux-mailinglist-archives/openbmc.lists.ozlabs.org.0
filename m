Return-Path: <openbmc+bounces-438-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F00EB257D6
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 01:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2QBH2MSgz3blg;
	Thu, 14 Aug 2025 09:51:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.19.245
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755121598;
	cv=none; b=BReWMi/rEL2+sh70lnKQH3i68uGN9PFMgB+7/P4MtBDxEdp2vHZcUAnDmbAAiMj9qUG9g8zD165qhpywuNyKes4+I/4sc9Ldgu3az4ucp5642vKpbrpKk+nbf+CRMzFly5Zk67KFbFA01GkxXlgHykr1uiFbSG7ziCUUwB4+2Cpz7c6QRoliFh6W4mab7ZgCRfD3SBmKUGhV9gDDJdMTd5gVsrOUJ+eyMygMiKIWZV94DWOedZ80FC6IX49zLnZmqpfeK9ydIMCBAdkzm38BAn7gUyRa9ckB1KTqoAK3yH+U+7HDgzDlK5EEYnBHBH8uMNZIG27SuvJUUV7zws4J7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755121598; c=relaxed/relaxed;
	bh=ZQcBjCnOuHYG+l1tmZJq0ANml4aVyybZgww+09zyHFo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g3eV+xbjClWykJgfSgGMa5riJFYiyuSpdNqFZrzUB7kyeIAWw/yXfGceOtr9LigklXnbvt751zJgV4ou6PuZ8B1//8kwAAZJKVFy2K71YpePuokzHtalnm/2rStastFlZ2Wd5ismbUjJYtQxjc11N/WuCX88pA2K5lulxQObNOPkQC+FWIs83hj1a7ohvNM/EuAKrANzaUl1x9ql/j+nYKxWqtUAZrIL1iEzVScmNnJIrnrpFR94yJ6uSg0kyR5K6Oqj37zhK+RLckEvNadjjjrwE0Cg1uuXeK/fRCr+J9/8L6biPH2xRtg4EfO5dMDqfgEgkiMhqWKNR+I4R51b8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=k2jaOzW0; dkim-atps=neutral; spf=pass (client-ip=198.47.19.245; helo=fllvem-ot03.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=k2jaOzW0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.245; helo=fllvem-ot03.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 266 seconds by postgrey-1.37 at boromir; Thu, 14 Aug 2025 07:46:36 AEST
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2MQN1xKNz2xK5
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 07:46:35 +1000 (AEST)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfgZ81737106;
	Wed, 13 Aug 2025 16:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121302;
	bh=ZQcBjCnOuHYG+l1tmZJq0ANml4aVyybZgww+09zyHFo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=k2jaOzW0eX1Q9Lh1Jg+5ql5U2GDt6e1QDt+kaPPCTFvdR2o1jyNv9UVaqVKwWQmXQ
	 JGyZJOUhqG10nwoarENrF8+Nzk50CZ6WxRHAAyRinTmsaJv90JgCJJ2X/Phfv/Uw6B
	 4Teq74wPC4KX2n3lIDF8cWQAIOQCHTgr4YrUsr4s=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLfgum1253263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:42 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:42 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNL2611079;
	Wed, 13 Aug 2025 16:41:41 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 6/6] reset: sunplus: Use devm_register_sys_off_handler()
Date: Wed, 13 Aug 2025 16:41:38 -0500
Message-ID: <20250813214138.477659-7-afd@ti.com>
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
 drivers/reset/reset-sunplus.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-sunplus.c b/drivers/reset/reset-sunplus.c
index df58decab64da..58b0874337598 100644
--- a/drivers/reset/reset-sunplus.c
+++ b/drivers/reset/reset-sunplus.c
@@ -100,7 +100,6 @@ static const u32 sp_resets[] = {
 
 struct sp_reset {
 	struct reset_controller_dev rcdev;
-	struct notifier_block notifier;
 	void __iomem *base;
 };
 
@@ -154,10 +153,9 @@ static const struct reset_control_ops sp_reset_ops = {
 	.status   = sp_reset_status,
 };
 
-static int sp_restart(struct notifier_block *nb, unsigned long mode,
-		      void *cmd)
+static int sp_restart(struct sys_off_data *data)
 {
-	struct sp_reset *reset = container_of(nb, struct sp_reset, notifier);
+	struct sp_reset *reset = data->cb_data;
 
 	sp_reset_assert(&reset->rcdev, 0);
 	sp_reset_deassert(&reset->rcdev, 0);
@@ -189,10 +187,8 @@ static int sp_reset_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	reset->notifier.notifier_call = sp_restart;
-	reset->notifier.priority = 192;
-
-	return register_restart_handler(&reset->notifier);
+	return devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART,
+					     192, sp_restart, reset);
 }
 
 static const struct of_device_id sp_reset_dt_ids[] = {
-- 
2.39.2


