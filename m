Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1D50DC28
	for <lists+openbmc@lfdr.de>; Mon, 25 Apr 2022 11:14:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmzqK27THz3bcg
	for <lists+openbmc@lfdr.de>; Mon, 25 Apr 2022 19:14:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L9/rhY2e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L9/rhY2e; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kmzps4Z5Tz3bVc;
 Mon, 25 Apr 2022 19:14:13 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id r8so3395257qvx.10;
 Mon, 25 Apr 2022 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=91flSxJRmaGK0ryyqZaGiTUm7eWeBTNwUgCLD8/8Uro=;
 b=L9/rhY2ePaHSSwjdh2A33AILDVsApMM7Ctenn2VhSyYRJ3fiISwNKGfVzE1HyIKKhV
 HyCydbVX1/3CrF8ivT3BVWT9cmWfwSNUoXZoY5BLtqHij5fLwx+4eVpFSRQCSQtG3mY4
 RbijpuYanTqiJdu+31HKaT+e46zNROKwvThGkl2H6sn84brODGHnJV8l8p7b8DqSSPuW
 dvtxQOcdxn4pPmxemgCMc/sZHYpJfYDV2yK6LKjneC9DjEMAKmoTe6oDyPyr/stSzmo1
 eE2/oq9Dede1dFJokr+53OQRxjgMPn0TUkTqWRU84P7/EhUBDwjnjpSmgMECiYHJJpxB
 kDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=91flSxJRmaGK0ryyqZaGiTUm7eWeBTNwUgCLD8/8Uro=;
 b=C9fwfg1HGBCpF3f6Qfh9GaTIsBA+DOjWVjOF9hVwPnudjQnRmdg3k8gSvzERj7HzqW
 YawEW5BvZK/paSFxujgvgoOk/aRUPeZPdffvPF0Spn0hBJ+52taMmNrcv7vg8mYddmpA
 sbO1E5VRBbVA9QkMzX9zvV05ucGsnplOXLUNLkn0D/ml8WlYOo10Z0MpdmbqmIC4SyT9
 bdawbvJER6dJwjO03Ndlc6Y1xx7TFAaog9sPbN+Bo73V+waOVVqrsmMTo8AFOgBxKatH
 wSwbzsJBIulq0fD78LoDu6gGUkEXtoWfoxoQ44NSxsXY1ba+YcE+oTuexrBLCApwcbpi
 LBzQ==
X-Gm-Message-State: AOAM532FT7bn+pPxZM+JIcg1Q8yfwN0mYPHWgqXOCXSk1sx06PLVM+Fh
 B0tAMBf08n23Meo+KLHHFeA=
X-Google-Smtp-Source: ABdhPJyY45oyFv7a9F5kcWk6B4Z5OsbslNhlS7WGnw+lfI2L+vnaW/SdJypqKXT6ac8e4TFniW3m9w==
X-Received: by 2002:ad4:5b81:0:b0:456:2c7f:97ab with SMTP id
 1-20020ad45b81000000b004562c7f97abmr6640486qvp.71.1650878049672; 
 Mon, 25 Apr 2022 02:14:09 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a37b202000000b0069c7ad47221sm4701011qkf.38.2022.04.25.02.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 02:14:09 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: benh@kernel.crashing.org,
	joel@jms.id.au
Subject: [PATCH] drm/msm/dsi: fix error check return value of
 irq_of_parse_and_map()
Date: Mon, 25 Apr 2022 09:14:02 +0000
Message-Id: <20220425091402.3499657-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, maz@kernel.org,
 openbmc@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, tglx@linutronix.de, Lv Ruyi <lv.ruyi@zte.com.cn>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

The irq_of_parse_and_map() function returns 0 on failure, and does not
return a negative value anyhow, so never enter this conditional branch.

Fixes: bf94ec093d0 ("drm/msm/dsi: do not enable irq handler before powering up the host")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d51e70fab93d..29199e6e15ee 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1873,10 +1873,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	}
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (msm_host->irq < 0) {
-		ret = msm_host->irq;
-		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
-		return ret;
+	if (!msm_host->irq) {
+		dev_err(&pdev->dev, "failed to get irq\n");
+		return -EINVAL;
 	}
 
 	/* do not autoenable, will be enabled later */
-- 
2.25.1

