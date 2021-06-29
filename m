Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFB33B6EE1
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 09:36:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDbrh5Klsz30Mp
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 17:36:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RC+C/m7D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RC+C/m7D; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDbqc14Zsz301K
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 17:35:40 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id i4so10409179plt.12
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=72tAzKiXHsnKwCj0vbDyfWUkIt613OcwIIbNzSDrl1c=;
 b=RC+C/m7DPCMdAZFl9P6nt/Z7639t5kbr3+ZRIyH6/8nCRyCIADEeeTDdK/L9lvVqvJ
 ySi/6Tz0C1KDeInUVDFNoHm2XekkIqH3+6opFFV8OFAo+IoOg2n73wUcAHI+scE8WO15
 44SNIC61pFYGj0yvJXoQQAaueql1F/p3NTReFMJeDGT2XVCEzapg3SlPbNlhCPscEtTw
 Qcg1lN5JkJvDXbUUN2vgyiovtEN6+tZpx/2CFRihjWrFV8qlJ5Em++FyK5HMN/1kYham
 Qbr7TzzodQ/cY8daXUovTZpyRx1vMLEkFKEwNIOlvDUOZbUuAa2DpvR50PHBQFkl0Gku
 A/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=72tAzKiXHsnKwCj0vbDyfWUkIt613OcwIIbNzSDrl1c=;
 b=uZp4uap550VF0RdnGrcCZzPaq9ulMsQD/BYLdE9/k+uTyWSIjRYOoM1IPbEvv22iw6
 se+rT9k92PKhWvGSbwb6WyjGy1eGfGZIu9DiViajNZ9r8vQL+I2iDIofIqH4eY8BYOVX
 p5hUl3XB20nbDOcuKDnYpXFXTPM1LKuW7xiiiIYVXtGEVi1ZPdDf/CcQW6FA5n7ui4wa
 xv6RHqzXrCZB/DoMUD3yMdy1k0yZgtNQlqMxWzc7ziT/wYAOW0cBHpxcKtrgqXyhbXcB
 NkIczL+ss1ywpFE+Rufv67boEFFAREa/oXTcCw5Hf5RPJyzXTa23RoNZUnrntHLaNim7
 +R3A==
X-Gm-Message-State: AOAM531SbqjRpX6hw6UOqhXy4ZD60rPh7NhIKmq5VqpXmLkDMNgkULQp
 TrXNWiTldjL37d9UWKK3WAE=
X-Google-Smtp-Source: ABdhPJznWfm1AfJlskJltsFbzqZTwvevTX1VhGQwZM166vpAVRlJSJrgCpswZN9BuPB4l53q7+l6Ew==
X-Received: by 2002:a17:90a:fe10:: with SMTP id
 ck16mr29896pjb.202.1624952137604; 
 Tue, 29 Jun 2021 00:35:37 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id p8sm17622438pfw.135.2021.06.29.00.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 00:35:36 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.10 2/2] soc: aspeed: Re-enable XDMA on AST2600
Date: Tue, 29 Jun 2021 17:05:20 +0930
Message-Id: <20210629073520.318514-3-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629073520.318514-1-joel@jms.id.au>
References: <20210629073520.318514-1-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Recent builds of the vendor u-boot tree disable features of the
BMC that may allow unwanted access if not correctly configured. This
includes the PCIe DMA (XDMA) functionality.

The bit to "un-disable" it is in the SCU. It does not appear to matter
when it is cleared, as long as it is cleared before attempting a
transfer.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/soc/aspeed/aspeed-xdma.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index e6b4744bda64..48cfe30c90ad 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -34,6 +34,9 @@
 #define SCU_AST2600_MISC_CTRL			0x0c0
 #define  SCU_AST2600_MISC_CTRL_XDMA_BMC		 BIT(8)
 
+#define SCU_AST2600_DEBUG_CTRL			0x0c8
+#define  DEBUG_CTRL_XDMA_DISABLE	 	 BIT(2)
+
 #define SCU_AST2500_PCIE_CONF			0x180
 #define SCU_AST2600_PCIE_CONF			0xc20
 #define  SCU_PCIE_CONF_VGA_EN			 BIT(0)
@@ -831,10 +834,15 @@ static int aspeed_xdma_init_scu(struct aspeed_xdma *ctx, struct device *dev)
 		regmap_update_bits(scu, ctx->chip->scu_pcie_conf, bmc | vga,
 				   selection);
 
-		if (ctx->chip->scu_misc_ctrl)
+		if (ctx->chip->scu_misc_ctrl) {
 			regmap_update_bits(scu, ctx->chip->scu_misc_ctrl,
 					   SCU_AST2600_MISC_CTRL_XDMA_BMC,
 					   SCU_AST2600_MISC_CTRL_XDMA_BMC);
+
+			/* Allow XDMA to be used on AST2600 */
+			regmap_update_bits(scu, SCU_AST2600_DEBUG_CTRL,
+					   DEBUG_CTRL_XDMA_DISABLE, 0);
+		}
 	} else {
 		dev_warn(dev, "Unable to configure PCIe: %ld; continuing.\n",
 			 PTR_ERR(scu));
-- 
2.32.0

