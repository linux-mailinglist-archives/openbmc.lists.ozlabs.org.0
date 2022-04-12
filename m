Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E72FF4FD329
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 11:02:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd0986Ttpz30BN
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 19:02:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gTDuuZ9+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gTDuuZ9+; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd08j6WBdz2yRK;
 Tue, 12 Apr 2022 19:01:56 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id 12so4430986pll.12;
 Tue, 12 Apr 2022 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NJIUPTIwlW1yqo+bBjjNQ6hCNCU4mnU6YG9EAezP6EA=;
 b=gTDuuZ9+FGdPsqHBdpPR3b+DkmcyZk8Vjr9z3ud96fdzFLo4BQnD440lWFnCGd1Zg3
 cZvysxJ2g/DGs5Xc0jhErEkcpCGDEv1hMuTXr3nJRHW/IqZ5dg+lp2E0mDHQ+mA7l28r
 sogpemINd9OotgPA7TJ6dt+aJV6aKYaJpwZOACgli7we52A0S7lBYo5hSkRi3oVCwpZ7
 nRZ2Ic0QdBdshwR6uBkf/Z6I9krNxFghnIHsCnZUe6omlAGuoqpm+0bgozQk+qG4d1oi
 H/JWBqCQ7WuWU5kJZfE9s453SwHGHyLYF3FGgPphmmCYqIBCR4vUxBz/rjZ5ny2P/y0t
 SWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NJIUPTIwlW1yqo+bBjjNQ6hCNCU4mnU6YG9EAezP6EA=;
 b=0qeWmput7MHOgyib5avaT/U2TRHKlt99q74QWgqzhNdGqwFESx/4wN5JuZ2ErpK6rC
 4ICpJJhie7ud8+UUM/H/nAwp9FEKV/Yol3y9h/OR84yfBJP1bAXDsw1WHPDEbDPGaLqB
 T8LKJYZ5QALnzI8M7PG9wiPdX/R14JU4ktaAnrvE7mBgagaX8zpHPtNeooyWEE9P5ruk
 HO8cTpfRLDG74pEaNgWIFTGoiFCUHdi8/KLQk3RF2oTYgYmtJW1i/meDS01Dq9EZcasd
 Kj3QkQ9BQi2jdMe8nZykL9ZlTLg5Ld/+VXDFCFpeo7hHRbajVXGZByZnWEaVa1lHIUvC
 yswg==
X-Gm-Message-State: AOAM533p87rzXuKyXtJ3IoSJ0RmPyWFHtZz/w0oVlETSPe0XahpKkoec
 jnAw8Od418hzJv/37LMF3j8=
X-Google-Smtp-Source: ABdhPJyCiaAvpOVYpOy4NCFANstY3YgAIY18ez5RlUm3CicYx95FyB64nqoJrt47QujVjaFtEWPb/A==
X-Received: by 2002:a17:90a:5983:b0:1c9:ee11:76df with SMTP id
 l3-20020a17090a598300b001c9ee1176dfmr3824811pji.95.1649754114164; 
 Tue, 12 Apr 2022 02:01:54 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 j63-20020a636e42000000b003987df110edsm2172423pgc.42.2022.04.12.02.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 02:01:53 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: iwona.winiarska@intel.com,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH] peci: fix error check return value of platform_get_irq()
Date: Tue, 12 Apr 2022 09:01:47 +0000
Message-Id: <20220412090148.2533219-1-lv.ruyi@zte.com.cn>
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
Cc: jae.hyun.yoo@linux.intel.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 Lv Ruyi <lv.ruyi@zte.com.cn>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

platform_get_irq() return negative value on failure, so null check of
priv->irq is incorrect. Fix it by comparing whether it is less than zero.

Fixes: a85e4c52086c ("peci: Add peci-aspeed controller driver")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
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

