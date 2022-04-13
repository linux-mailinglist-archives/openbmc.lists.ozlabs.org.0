Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBE84FEC09
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 03:05:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdPWv5spWz3bYF
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 11:04:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pfAmzAgd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pfAmzAgd; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdPWS2qnzz2xnW;
 Wed, 13 Apr 2022 11:04:35 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id a21so573737pfv.10;
 Tue, 12 Apr 2022 18:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nY/di/ysNrXys5hLZLAzfqtetv16NHy5HD+OIKSD450=;
 b=pfAmzAgd+3XvYXMaijTNmoTdKLKheabhIAus+/1HOCL9K/aGGRWf0wIqFioAi75BsT
 03EegT91x09xqKjy+NphmLlDhLtcT9fqKPcmucw3I4hUbrCKwckux01A/LIntSY4do7R
 hVp/6fdoa3DfedqIR5+4FtFVZuAeJcs/xSBDQgT5Gm0fav19AHvD4/LSX5tkdVl0L07t
 QDK+gddHbdRjcclAJb5QzvveGx9bwYh4h1QS2NtaENHYmsR/IBqhpnD7MMmgrKfw1cr7
 /IgFOIB6QsNwWXRBbbatKWXAbVdhihw9PvV+8NpYcmWTFP5dnHaCKS1IWKAoxTKBodYM
 SBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nY/di/ysNrXys5hLZLAzfqtetv16NHy5HD+OIKSD450=;
 b=K9f90DS0fA0qAjuldf+FK4FtsygtW6dv8Y2cIxZ8I2EhH23b5BJRLSLZsaFkykJg/1
 0RF50xO1Liou2q1od0argtfbgKjdIb5amysuh2E6hlXvzO0VQ7aQeq1bzdrAtQ2liInG
 S3113kBjHCaoJ1e+fb128xxV6Et41Nt7ya1sDH5wlwiB+/jOkbIumoiUrh31YH0/vVb1
 0DlxMgkVkw8Fr8XFIziHOnTNLvXNFdc1BU+all0MUM0jYcuXlxzoypC1vc7xJvJlp5PZ
 T/n3BY5SJEtGMY3+lgasHTyLs4fteHtBdeakbr+a9cIIRiQRgAd5OB+0MqvDg1MJ8IXf
 w0Jw==
X-Gm-Message-State: AOAM533+de3LL9GjwOK9QDEBCLULnkr/ud8BQ0T3AxNz1RHVP5gNznBx
 rdJ9o3QVj0SoRFz+KtxbpFM=
X-Google-Smtp-Source: ABdhPJzO2HhOlpHu6E6g/YKT6WPznRIK8MTuigx0kAa2cPRadPTgCsRINF7fdUU8ekY6oAQzyooYSg==
X-Received: by 2002:a63:5219:0:b0:39d:7212:4b3f with SMTP id
 g25-20020a635219000000b0039d72124b3fmr7907489pgb.255.1649811870927; 
 Tue, 12 Apr 2022 18:04:30 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a17090a058f00b001cd50a6ec5csm251107pji.16.2022.04.12.18.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 18:04:30 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: iwona.winiarska@intel.com
Subject: [PATCH v2] peci: aspeed: fix error check return value of
 platform_get_irq()
Date: Wed, 13 Apr 2022 01:04:25 +0000
Message-Id: <20220413010425.2534887-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d09484f7cda13de3f156bd1bcba8c2671495dcd1.camel@intel.com>
References: <d09484f7cda13de3f156bd1bcba8c2671495dcd1.camel@intel.com>
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
Cc: jae.hyun.yoo@linux.intel.com, linux-aspeed@lists.ozlabs.org,
 andrew@aj.id.au, cgel.zte@gmail.com, lv.ruyi@zte.com.cn,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, joel@jms.id.au, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

platform_get_irq() return negative value on failure, so null check of
priv->irq is incorrect. Fix it by comparing whether it is less than zero.

Fixes: a85e4c52086c ("peci: Add peci-aspeed controller driver")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
v2: prefix the subject with "peci: aspeed:"
---
 drivers/peci/controller/peci-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
index 1925ddc13f00..731c5d8f75c6 100644
--- a/drivers/peci/controller/peci-aspeed.c
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -523,7 +523,7 @@ static int aspeed_peci_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->base);
 
 	priv->irq = platform_get_irq(pdev, 0);
-	if (!priv->irq)
+	if (priv->irq < 0)
 		return priv->irq;
 
 	ret = devm_request_irq(&pdev->dev, priv->irq, aspeed_peci_irq_handler,
-- 
2.25.1

