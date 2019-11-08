Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1549F5096
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2019 17:06:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478lWr05zQzF7Kd
	for <lists+openbmc@lfdr.de>; Sat,  9 Nov 2019 03:06:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=colin.king@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478lGp2zfgzF5SQ
 for <openbmc@lists.ozlabs.org>; Sat,  9 Nov 2019 02:55:30 +1100 (AEDT)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iT6bd-0003xV-0u; Fri, 08 Nov 2019 15:55:25 +0000
From: Colin King <colin.king@canonical.com>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org
Subject: [PATCH][next] reset: npcm: check for NULL return from
 syscon_regmap_lookup_by_compat
Date: Fri,  8 Nov 2019 15:55:24 +0000
Message-Id: <20191108155524.170566-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Colin Ian King <colin.king@canonical.com>

Function syscon_regmap_lookup_by_compat can return a NULL pointer, so
the IS_ERR check on the return is incorrect. Fix this by checking for
IS_ERR_OR_NULL and return -ENODEV if true.  This avoids a null pointer
dereference on gcr_regmap later on.

Addresses-Coverity: ("Dereference null return (stat)")
Fixes: b3f1d036f26d ("reset: npcm: add NPCM reset controller driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/reset/reset-npcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index 2ea4d3136e15..9febf8bed2f6 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -161,9 +161,9 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
 	of_match_device(dev->driver->of_match_table, dev)->data;
 
 	gcr_regmap = syscon_regmap_lookup_by_compatible(gcr_dt);
-	if (IS_ERR(gcr_regmap)) {
+	if (IS_ERR_OR_NULL(gcr_regmap)) {
 		dev_err(&pdev->dev, "Failed to find %s\n", gcr_dt);
-		return PTR_ERR(gcr_regmap);
+		return -ENODEV;
 	}
 
 	/* checking which USB device is enabled */
-- 
2.20.1

