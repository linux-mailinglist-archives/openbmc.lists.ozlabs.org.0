Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A308242471
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 05:59:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRGDf5rgLzDqGZ
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 13:59:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q454ViY9; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRGCv0gH5zDqF5
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 13:59:06 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id m34so340455pgl.11
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 20:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u1PUS3lRHj7tHMcLsfvq1MSJH/0rj869hU2m+XxFH8g=;
 b=Q454ViY9yAK6TJhOcVqmjvdv8EnL+EITcz7t2jXHtwcKbwfTJMc3u00GbPo3FGqswS
 Ch6oj06c5kJ0V93iOOkxOi360IDofKpUELF7hf1P2+dCeGLF3woOBM1K9CDemOq7Y6/X
 EQtDK4sS51L7lmuYEk+jEMLXADZGKks6ZpvNnid293RSRUP0ZIik1KucvF7xQOVDqr5C
 GgB0i5fOSNCB0unZ4e8ZERz1k4CMTFlseuQ47SoL04CYk9rc8X9imyLJ7jVS8Q4TMpX3
 Qf4Dz9PKzmo3EsY1nnmff7XVoSrOL9Q/3Vep/NuTy/3NDx+fnJCaKY7C2lyJhvKhMqMp
 uipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=u1PUS3lRHj7tHMcLsfvq1MSJH/0rj869hU2m+XxFH8g=;
 b=IlebMcWKLCTUtnE3pm+icSmbUqrVTvxQBx7/qJ37UIsVe25zjXsBIwJDJ2S4UJcjSc
 cEk7MRRZ5yY8S4JCDzvU4W6HA1hk6WooAnjAjlj7CeFMbpueNtmVurym5ZQKEzRQZOQf
 LMYWxaY4lA0a73R9IN5lW4C0SzKf/+Chc2yUH0J7Y31/hayNZV7TntUpGr//RmZiGpgX
 qsIZXbaJCzDW4dgo2lCaI99wG9dD81NXqS7U1P/FaDopthne2cPfc/7bzelFqXEnvF59
 Sfumrq/7ar1id4Euzqz2xxN6T1bR5RUUO45u4I714+xQxCJMdULjb4iV1DMEkfoeh0Wt
 mLww==
X-Gm-Message-State: AOAM530CoENW0Fzvarf0gcxHMFM23+Uq7amFgu8KhS2Vd4lvVezFHkF8
 7oHyr3TwoZfPOgf0LP0xYLfn9idhJgI=
X-Google-Smtp-Source: ABdhPJx4YqYAxdq/HXo9R7p4a93SVvqZlgWEwObPJmctkLq6aO44tgGmqRdwWBaxmTIBZZSMfLzEqA==
X-Received: by 2002:a62:7f0e:: with SMTP id a14mr9490870pfd.320.1597204741161; 
 Tue, 11 Aug 2020 20:59:01 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id fv7sm10276801pjb.2.2020.08.11.20.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 20:58:59 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-5.8] mtd: spi-nor: sfdp: Revert "default to
 addr_width of 3 for configurable widths"
Date: Wed, 12 Aug 2020 13:28:47 +0930
Message-Id: <20200812035847.2352277-1-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This reverts commit f9acd7fa80be6ee14aecdc54429f2a48e56224e8 which
breaks mounting of UBI volumes with the aspeed-smc driver:

 ubi0: default fastmap pool size: 25
 ubi0: default fastmap WL pool size: 12
 ubi0: attaching mtd3
 ubi0: scanning is finished
 ubi0 error: ubi_read_volume_table: the layout volume was not found
 ubi0 error: ubi_attach_mtd_dev: failed to attach mtd3, error -22

Found by bisecting between v5.7 and v5.8.

Fixes: f9acd7fa80be ("mtd: spi-nor: sfdp: default to addr_width of 3 for configurable widths")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
This identifies why we are seeing SPI NOR failures on v5.8. There is
potentially a fix that needs to be made in the aspeed-smc driver instead
of reverting the core spi-nor change.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/mtd/spi-nor/sfdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 55c0c508464b..9db07182e9c8 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -456,7 +456,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	/* Number of address bytes. */
 	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
 	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
-	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
 		nor->addr_width = 3;
 		break;
 
-- 
2.28.0

