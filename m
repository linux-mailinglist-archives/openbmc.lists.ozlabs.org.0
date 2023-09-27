Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 562467B0913
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 17:43:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=g4sLXxsh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwgr212Bwz3cNN
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 01:43:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=g4sLXxsh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwgqN6SgNz3c8r
	for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2023 01:42:55 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-692d2e8c003so5719713b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695829370; x=1696434170; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+KczYJ63iTfnuMsHD4IMClJxOV5m4dNcMyA1mqDD9g=;
        b=g4sLXxshYIcvDFVXgVFI65z8Fny+3aeUxj/t48w742pvpvRd5o+u7gkzSIxYd5yl7+
         IwuT7Gh8DsRHE+sVsdBo59iWQTgmhYN3tbPchWCc6ugKS+zQv41BzxxPCwh2saYZ4kYZ
         XV213pnF1T/on1dtOu2hV0MIDE6tLuPwGqRsk4lK1UtglRcjCEq2/FK2oCbf6EyTNDiB
         NeyN82kjrbJZ4EDZO8y9lWgDKGpzMfcSJX/JHcuSgOgZ7d8EnmbPaPZ+BIs9O6yfuGjW
         3d0tiIgZQywx1rsDl+YDS9sXpgN77f48ijXyOfboShS+m7/XGBlCbmp3GNijaml06EoW
         LRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695829370; x=1696434170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+KczYJ63iTfnuMsHD4IMClJxOV5m4dNcMyA1mqDD9g=;
        b=cYQEjfoupY8UsuEcNo0fA8kyVTLLBMqa6Gv7VFiFYWOn2fWOtNmNK99pgNor/+4Zw1
         rKeD2puLfQz16sfjptLk++kK/iYBo+27vWX6oOPuSqMyxcQur7+Lmoc8meNwA/j0qhXI
         JDi8mdCxcaggvFYQaXCV5Fd7ORyPWb+DNaBEf5aJEKVOF2901f6dAocrYQDbsuScFOG0
         5NVT8FiYuTbyfOJeyDKAz5XEpaQd77AB2gWJi7FB05dX44nGmuNwbOH5iOgNfuMfJL/8
         DNRZQf1BzX+2+YgUA1Ovx9BrQZt7R3pfhOj5hwBI0khjzuohYRHD47AWs7CMeNg0iGkN
         g1SQ==
X-Gm-Message-State: AOJu0YxIxSkBNeMa7KNC6iQ1ldH/tzu3e4ZJ13Z+K7D9Z+5DXf/oOQI6
	i5ZquNZI9HXKDU3lHXwlhcfipA==
X-Google-Smtp-Source: AGHT+IFRfQ/0KX1bSuu5UuM2JxSiQwHD4x642i16XMLdBILDBkTo7GJS+ledc4uHjgaqOgLCqUIbcg==
X-Received: by 2002:a05:6a21:9983:b0:15d:1646:285a with SMTP id ve3-20020a056a21998300b0015d1646285amr3860484pzb.21.1695829370365;
        Wed, 27 Sep 2023 08:42:50 -0700 (PDT)
Received: from localhost ([49.7.199.230])
        by smtp.gmail.com with ESMTPSA id v3-20020a655c43000000b005782ad723casm10120152pgr.27.2023.09.27.08.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 08:42:50 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: brendan.higgins@linux.dev,
	benh@kernel.crashing.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
Date: Wed, 27 Sep 2023 23:42:43 +0800
Message-Id: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Andi Shyti <andi.shyti@kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, Tommy Huang <tommy_huang@aspeedtech.com>, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
as a slave, a situation arises where the master sends a START signal
without the accompanying STOP signal. This action results in a
persistent I2C bus timeout. The core issue stems from the fact that
the i2c controller remains in a slave read state without a timeout
mechanism. As a consequence, the bus perpetually experiences timeouts.

In this case, the i2c bus will be reset, but the slave_state reset is
missing.

Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout occurs")
Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 5a416b39b818..18f618625472 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -933,6 +933,7 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	/* If slave has already been registered, re-enable it. */
 	if (bus->slave)
 		__aspeed_i2c_reg_slave(bus, bus->slave->addr);
+	bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
 #endif /* CONFIG_I2C_SLAVE */

 	/* Set interrupt generation of I2C controller */
--
2.30.2

