Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E98AAA3E
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 19:40:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PSd91tfXzDqmJ
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 03:40:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sirena.co.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.co.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="X1aHfL7d"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PSc00JxYzDqfj
 for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2019 03:39:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=u/jyKCR0c7O6hZK0BTOZC8fGSA/TBitpvpVeuX5oSeg=; b=X1aHfL7dDGT4
 4sdiGhPr11mNXThpPVHqTtxeO0JqBg4a8hCYnY6CHEJ9OkelbhUTd+PVE4Dr7sAMWtfzvu4iYkI8B
 XAo9rw+yB8C2qvPzEOJGG1VQukRA7Tml9rh6TMr59379boExPf1R/lr+FzTDuYdPU0rzNH5JnYszs
 eFIzg=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5vim-0005I9-PM; Thu, 05 Sep 2019 17:39:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4B98F2742D17; Thu,  5 Sep 2019 18:39:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Applied "spi: npcm-fiu: remove set but not used variable 'retlen'" to
 the spi tree
In-Reply-To: <20190905072436.23932-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190905173900.4B98F2742D17@ypsilon.sirena.org.uk>
Date: Thu,  5 Sep 2019 18:39:00 +0100 (BST)
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
Cc: benjaminfair@google.com, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 tali.perry1@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The patch

   spi: npcm-fiu: remove set but not used variable 'retlen'

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From a0ce1fd11e587be803eb2f299d478c962df3706f Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 5 Sep 2019 15:24:36 +0800
Subject: [PATCH] spi: npcm-fiu: remove set but not used variable 'retlen'

drivers/spi/spi-npcm-fiu.c: In function npcm_fiu_read:
drivers/spi/spi-npcm-fiu.c:472:9: warning:
 variable retlen set but not used [-Wunused-but-set-variable]

It is never used, so remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190905072436.23932-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-npcm-fiu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index d9e2f58b104b..cb52fd8008d0 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -469,7 +469,6 @@ static int npcm_fiu_read(struct spi_mem *mem, const struct spi_mem_op *op)
 {
 	u8 *data = op->data.buf.in;
 	int i, readlen, currlen;
-	size_t retlen = 0;
 	u8 *buf_ptr;
 	u32 addr;
 	int ret;
@@ -494,8 +493,6 @@ static int npcm_fiu_read(struct spi_mem *mem, const struct spi_mem_op *op)
 		currlen -= 16;
 	} while (currlen > 0);
 
-	retlen = i;
-
 	return 0;
 }
 
-- 
2.20.1

