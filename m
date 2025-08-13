Return-Path: <openbmc+bounces-437-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C3B257D3
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 01:52:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2QBG40jkz30Vq;
	Thu, 14 Aug 2025 09:51:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.19.245
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755121599;
	cv=none; b=eH4Fmd37Rk8tJP+Se9y9SntGK6UV6vgAEq4fF22BU9UauBAAtygaMvMmgXOEiQyVqsyt7LXvOvKvIHU/n3VyLqWdHGdqEhc7ivqCBaPg9B9KbkCoYFIsfLVOOjUa00aVX/HYwgHj5laDLP37p8swThzCgFDf+Ij9i4LAMSEIhTZXmLstFy+gtf7oj3G4f0tefNiokl2VO3KyckgURYyZFpsm2Ld+m15m4g+TquXNsCp4aU/gkmLbVPV8gRXYugV4Dly6xRvKiRyqI+svxuJVXpN2yhMLXl9014kTTX41Yk4lyFKGTeAPMkbtboafkwo51ySRyIUhAOjulc+zHdrtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755121599; c=relaxed/relaxed;
	bh=MOqrt+X1MgrX06YG0uRc9BpYNXl9q+Neu4iKdp93TPs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Me1jmQTeT+S278Y1sfbK8cmS14+x6bzWk14YdlI4i7BCY/q6+qVEN9oWWEvXBpeT+QaqHFI7hXTmEKXErIim9KXms+MrkxzhgQsSf5FkY2B6GF5V561Zcb3nL0LoaHdq6b/4nSW7nYIU0GQsszGX1kbtOha23zZy8TwWbOCT1b2rTA4kqKPiG5K7g3NWRkE941RBUrBzvckyf8WBaDIZjf1GxZoIhwhOf2mRvZuQ3slHNulDrgojScmKBX2dU4EB8AWoE9rAxcq8SDUzyLzvSASi/C/184ZMrG723G6Rdu1TLhsi1qRpzkPaCF93kLwaDO38cTwruZtpMMKv4Pe5XA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=ovbl1XAW; dkim-atps=neutral; spf=pass (client-ip=198.47.19.245; helo=fllvem-ot03.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=ovbl1XAW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.245; helo=fllvem-ot03.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2MQR2R8wz2xK5
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 07:46:39 +1000 (AEST)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfgo61737102;
	Wed, 13 Aug 2025 16:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121302;
	bh=MOqrt+X1MgrX06YG0uRc9BpYNXl9q+Neu4iKdp93TPs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ovbl1XAW3oxAOCnxOLJJawfik+Re7PN5hgQVSC5cPx8urcpiiNm9OENX5sPkqshwq
	 a+Kqi4Wr6+KhqlPHiV0kMFyve/SFkLiDxVH/mgVr796BqxITnt+uERDw41y3gQGH41
	 JTlDJaAc8q9O2fuR66Dm1HUxrWhNgvAfkA8wlLIs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLfgut1253257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:41 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNK2611079;
	Wed, 13 Aug 2025 16:41:41 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 5/6] reset: npcm: Use devm_register_sys_off_handler()
Date: Wed, 13 Aug 2025 16:41:37 -0500
Message-ID: <20250813214138.477659-6-afd@ti.com>
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
 drivers/reset/reset-npcm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index e5b6127783a76..6939bb3eb1507 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -89,7 +89,6 @@ static const struct npcm_reset_info npxm8xx_reset_info[] = {
 
 struct npcm_rc_data {
 	struct reset_controller_dev rcdev;
-	struct notifier_block restart_nb;
 	const struct npcm_reset_info *info;
 	struct regmap *gcr_regmap;
 	u32 sw_reset_number;
@@ -100,11 +99,9 @@ struct npcm_rc_data {
 
 #define to_rc_data(p) container_of(p, struct npcm_rc_data, rcdev)
 
-static int npcm_rc_restart(struct notifier_block *nb, unsigned long mode,
-			   void *cmd)
+static int npcm_rc_restart(struct sys_off_data *data)
 {
-	struct npcm_rc_data *rc = container_of(nb, struct npcm_rc_data,
-					       restart_nb);
+	struct npcm_rc_data *rc = data->cb_data;
 
 	writel(NPCM_SWRST << rc->sw_reset_number, rc->base + NPCM_SWRSTR);
 	mdelay(1000);
@@ -472,9 +469,8 @@ static int npcm_rc_probe(struct platform_device *pdev)
 	if (!of_property_read_u32(pdev->dev.of_node, "nuvoton,sw-reset-number",
 				  &rc->sw_reset_number)) {
 		if (rc->sw_reset_number && rc->sw_reset_number < 5) {
-			rc->restart_nb.priority = 192;
-			rc->restart_nb.notifier_call = npcm_rc_restart;
-			ret = register_restart_handler(&rc->restart_nb);
+			ret = devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART, 192,
+							    npcm_rc_restart, rc);
 			if (ret) {
 				dev_warn(&pdev->dev, "failed to register restart handler\n");
 				return ret;
-- 
2.39.2


