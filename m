Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD675210BA
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 11:21:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyCGd2hj3z3bwT
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 19:21:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LPaoDLd4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LPaoDLd4; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyCBp4KYhz3brn
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 19:18:26 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id e24so15367919pjt.2
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qdZcbphejbuJUyI8ZEVHLXuIfaV6dJq4J7NvpDgtTDg=;
 b=LPaoDLd4Ikgrg7XEbyCAALxooHVmKiLlzVexFnqt53TrM98BzkpR73oa/V2hJLohvU
 B1aJUHEDRTEHt8gvAFtOjpgdjP87bI3esyPGDSSuNm9MF9vpQ7o1SEpnOI4JtE1DU6AD
 GLMeEtcI+D69rMS6wNyyQeYV1z/f3YgugfpeMudoHY1U0UfUCwbolO8KUVVvM0HjE5lP
 2MCCPrctSV7sLbEIT0dc9WQZcmgrzuFmbxN0oRm1z97czaM4mFaKYq8mGiEsWenYlBFY
 mLneOPu/puWKkmKFiuaoy69NV86xj1vRVoFn5DJ+gd9VqZWv8Vo0ykwY4sL2YwYGZh/3
 eQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qdZcbphejbuJUyI8ZEVHLXuIfaV6dJq4J7NvpDgtTDg=;
 b=2RZRfLJ4zW3QaW5sEYrHOHW7MSH1KIioarFC9s63YwoStdkiJm+YOLJxkjqd7Sby0q
 7lnbJtO2ZBu7oRZQd0GmUWPRUm5r/LPzYNe+kfoCCdTHz/vwsqjTFmeyUGIgARMaixzU
 pSk2vEaQEf/JQuvEJGRyHfldsSkm7yzNcyUJgutGfjbeOF6eLkivWXTjKlgEb2/L26BE
 zI+USwDcg0J04QrVUMbLQf9+GSKu23S+BTE21MKJrruIhITFP9AW67juCwwJD64UAQQp
 b8fWFX/csEMSboCaLkPc4mLRaInFxZ9ji4UxsrdS7g1LvG8R/ZL2mPyMLKhcQfWu4b3s
 nLyQ==
X-Gm-Message-State: AOAM532TxlOpyDmrm3RzwuSW+/bJMgjKO88+AI7BdPTSuXRYmHy+BiIn
 zXeex8B9DZhsF4o1YhpgSA==
X-Google-Smtp-Source: ABdhPJwK15ScNG0MQ6kvstR93vQS+YXUeN1JFJINlUwVpN3CbMW5fFJpYiqTuWGQCQuQWMqdliwEgA==
X-Received: by 2002:a17:902:e549:b0:15e:aa63:6fd8 with SMTP id
 n9-20020a170902e54900b0015eaa636fd8mr20036042plf.152.1652174304396; 
 Tue, 10 May 2022 02:18:24 -0700 (PDT)
Received: from localhost
 (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net.
 [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a622f03000000b0050e0a43712esm10166345pfv.63.2022.05.10.02.18.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 May 2022 02:18:24 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
 jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v4 6/9] i2c: npcm: Correct register access width
Date: Tue, 10 May 2022 17:16:51 +0800
Message-Id: <20220510091654.8498-7-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

The SMBnCTL3 register is 8-bit wide and the 32-bit access was always
incorrect, but simply didn't cause a visible error on the 32-bit machine.

On the 64-bit machine, the kernel message reports that ESR value is
0x96000021. Checking Arm Architecture Reference Manual Armv8 suggests that
it's the alignment fault.

SMBnCTL3's address is 0xE.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 56af571f65c1..e3c13f801f1a 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -360,14 +360,14 @@ static int npcm_i2c_get_SCL(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
-- 
2.17.1

