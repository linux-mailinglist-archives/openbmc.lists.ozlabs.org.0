Return-Path: <openbmc+bounces-443-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C509B257DF
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 01:53:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2QBN59lDz3cYb;
	Thu, 14 Aug 2025 09:51:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.23.234
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755122249;
	cv=none; b=W3i7zDLJl97Wf5B7VrMswaNz9I6jpnXvDnBBNoiu7Zr+znFxlpUc3L2BWW0chSyNEb3AtApXbeW+VMjsbA4XuD1zT8vCgOdCC/DXKz19quUkerk9GCg3r0LghwwzweLYMxUBygTvb+2muyIpEZIZZyjnQs+lTEYmsqbo1pZ1qtXtIFE+NnVMdvvhTQWuo3H8re0N+6qZK2kZMMRpq8+ZzwpdpaVmBZoyTkqe1rz+umXYyH1rRCdgbDb6n1tXsEzlnFgFLx6j9fx7rPWZPZYepiBJhCsuPfqH757YiekzkAWb0BNY0gL6bKjzvncJsW5RxCkHGtqoo/TcubK7CzXhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755122249; c=relaxed/relaxed;
	bh=kTbVVjSoROXPn4Xu4layLkxNIqGNzrm2kx+jdejNJ9M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YHQAKoVAI+y9lVlx0ebzyZPvGOJ25FUtXR+Ckbi5go5gcIXYcqu2O3IR079VTvWUvuwvqqnsu8RyUzw9iqQVLnbAdKc/x2cuMmNma+dW3looTt85XaaO2hucm1INGWt4u387oPmXMNKIIPPcpndEjbU5uqP1yle2+kA15gBQBBynH0D0rKn8VSe2L0RAK75PMUhiOeEEDWm3WfJdfsnQqb/xqwRn1tfCZY+xX6Por6pQD5Vgura0ZHz21EuBPUJXnVhLSzp4ea1vbGung0N8sRrMnkFJrMdDF/QKr+Z2zujWLBNzQvZI90jY5Q9OV/A5shPBpQe27BfUZ1xQ9rjOjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=Iiehth8m; dkim-atps=neutral; spf=pass (client-ip=198.47.23.234; helo=lelvem-ot01.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=Iiehth8m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.23.234; helo=lelvem-ot01.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2Mfx27dyz2xK5
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 07:57:29 +1000 (AEST)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfffA1788741;
	Wed, 13 Aug 2025 16:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121301;
	bh=kTbVVjSoROXPn4Xu4layLkxNIqGNzrm2kx+jdejNJ9M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Iiehth8m/X0TJpR/V3cdN0vn47nZSceK3Zt2k0G4Vhn197OGr7C2z/57+h70aDR3j
	 gjhm3U9XtutYStd4Bk2asboJJIrjXKB/mWQvtsmP758rpPl0O8O9GwkbIxu2pGiy6/
	 yHIOpcKyNKcyXcwP3UAMToeKET/YGjXIfh/UX/pY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLffcl1253252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:41 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:40 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNH2611079;
	Wed, 13 Aug 2025 16:41:40 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 2/6] reset: intel: Use devm_register_restart_handler()
Date: Wed, 13 Aug 2025 16:41:34 -0500
Message-ID: <20250813214138.477659-3-afd@ti.com>
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
 drivers/reset/reset-intel-gw.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-intel-gw.c b/drivers/reset/reset-intel-gw.c
index a5a01388ae7fa..97671b99f565a 100644
--- a/drivers/reset/reset-intel-gw.c
+++ b/drivers/reset/reset-intel-gw.c
@@ -28,7 +28,6 @@ struct intel_reset_soc {
 
 struct intel_reset_data {
 	struct reset_controller_dev rcdev;
-	struct notifier_block restart_nb;
 	const struct intel_reset_soc *soc_data;
 	struct regmap *regmap;
 	struct device *dev;
@@ -154,12 +153,10 @@ static int intel_reset_xlate(struct reset_controller_dev *rcdev,
 	return id;
 }
 
-static int intel_reset_restart_handler(struct notifier_block *nb,
-				       unsigned long action, void *data)
+static int intel_reset_restart_handler(struct sys_off_data *data)
 {
-	struct intel_reset_data *reset_data;
+	struct intel_reset_data *reset_data = data->cb_data;
 
-	reset_data = container_of(nb, struct intel_reset_data, restart_nb);
 	intel_assert_device(&reset_data->rcdev, reset_data->reboot_id);
 
 	return NOTIFY_DONE;
@@ -216,9 +213,7 @@ static int intel_reset_probe(struct platform_device *pdev)
 	if (data->soc_data->legacy)
 		data->reboot_id |= FIELD_PREP(STAT_BIT_OFFSET_MASK, rb_id[2]);
 
-	data->restart_nb.notifier_call =	intel_reset_restart_handler;
-	data->restart_nb.priority =		128;
-	register_restart_handler(&data->restart_nb);
+	devm_register_restart_handler(&pdev->dev, intel_reset_restart_handler, data);
 
 	return 0;
 }
-- 
2.39.2


