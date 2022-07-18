Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1080D577E16
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:57:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbSV00Rjz3c2x
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:57:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mYYjMzL8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mYYjMzL8;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmbQk3gjSz2xKw
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:55:42 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id j12so8433223plj.8
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9IvPq+vzg2IttRaK2bQl7hyUjCEsf/3i9d9Ngi7pYU4=;
        b=mYYjMzL8agkVK4nZ6T3xKc2+i0Ur+eKSLXcSuwNcY1d1YrGdR+ml6X2qxYoEG1cA34
         lfc5rEuxwBQVg5MUnlyFcCPpfQ+7SmcIzF+ijqXGaGO1N4kSr5pNL5eEkiDBaAM2qRq1
         +eFvSWyRXNv358X5Xk9CfFwvNrY04MQZvA5ew48DFFI7daxTsDMOFfs1Y50IeUT2H2o3
         xvc8YE1sD/z50b5yJfKZZqH/XyFlLEvEDveQVs6u+Gg07Tj+dsKpC5C2AN5iNbEYCkBK
         gghxnlEyRj9CfTuU6Ks1xJWlGj55VQU59eaJXbif2A8ugR1HLcOYrbg+qsn9zBQxbBe5
         I2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9IvPq+vzg2IttRaK2bQl7hyUjCEsf/3i9d9Ngi7pYU4=;
        b=sCtud2oIV3qakQ9hvJUXI8TiEMusAQ86R7VI+/KroUfvFTmtZmL6ZJjMnbVWRI7CMk
         torukshJAH8NyZL7aAMD8C5h/9IodY2pf9/VHY0u6yWfQ4C4Mc8BPOG9TXcu2wBU7NnB
         RH1EIncXeqUxnYuktqlE3bI5qhKuu8zKVvmgCo8WLltWNDA8QP+K+TYq9fNPiixUNKME
         Bpl0X6rCBCf8XXarF/a88b4cPc4gA1arWXiC0kJ6c5hRetgKpl9LxFy2BCNIkkOON5dF
         CBKwZKWcrNAOYfNKoKuF1TGQC9OBR0CAOtg87XiY8cK8KA/LCcrba8WDmXZ9dWAe9oE+
         w0yA==
X-Gm-Message-State: AJIora9Q8kkfDcy25KFTMq/jGTCTRqvH6NkrEitSjIWu144R0NhbvoFx
	JfvIvhodxvXV9xqnoIzzfx8mCNIMOXo=
X-Google-Smtp-Source: AGRyM1u7NXEVFFwKkf8SUOJkgLjJ0uT9oDqBFfTUMHvqk7DeGc6HvDE3NoEqj3YIllr+BIxpb4FtlA==
X-Received: by 2002:a17:902:7294:b0:16c:a8d0:e827 with SMTP id d20-20020a170902729400b0016ca8d0e827mr23356673pll.101.1658134539461;
        Mon, 18 Jul 2022 01:55:39 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id r11-20020a170903410b00b0016c5306917fsm8750575pld.53.2022.07.18.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:55:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] i2c/aspeed: Use new mode only when driver is enabled
Date: Mon, 18 Jul 2022 18:25:23 +0930
Message-Id: <20220718085523.1140566-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220718085523.1140566-1-joel@jms.id.au>
References: <20220718085523.1140566-1-joel@jms.id.au>
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
Cc: Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Don't attempt to switch to the AST2600 "new" register mode if the driver
is not compiled in.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/aspeed_i2c_global.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/aspeed_i2c_global.c b/drivers/i2c/aspeed_i2c_global.c
index c76c29821083..86ed8f746d56 100644
--- a/drivers/i2c/aspeed_i2c_global.c
+++ b/drivers/i2c/aspeed_i2c_global.c
@@ -60,7 +60,8 @@ static int aspeed_i2c_global_probe(struct udevice *dev)
 
 	reset_deassert(&i2c_global->reset);
 
-	if (i2c_global->version == AST2600_I2C_GLOBAL) {
+	if (IS_ENABLED(SYS_I2C_AST2600) &&
+	    i2c_global->version == AST2600_I2C_GLOBAL) {
 		writel(AST2600_GLOBAL_INIT, i2c_global->regs +
 			AST2600_I2CG_CTRL);
 		writel(I2CCG_DIV_CTRL, i2c_global->regs +
-- 
2.35.1

