Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF07DAFE9
	for <lists+openbmc@lfdr.de>; Mon, 30 Oct 2023 00:00:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KIOvPMyK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJX215clZz3bdG
	for <lists+openbmc@lfdr.de>; Mon, 30 Oct 2023 10:00:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KIOvPMyK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJX1N1gNYz2xQB
	for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2023 10:00:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1E3BAB80707;
	Sun, 29 Oct 2023 23:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EF8C433B6;
	Sun, 29 Oct 2023 23:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620419;
	bh=sBDIHq+0hLK1ueiIEOPxcxCoKOrigSC15i7yeQqHbo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KIOvPMyKTkh+R5mNr6crBeE1GgccIFYdqCtxVLkO2MRejGJeP7pLSVZCusvRiZhiE
	 61siRO3T7g1n91loD+0qKSzNToWjJO5mkFzUMMz2Oqd752B2d324ynVd9vuUqxhXLP
	 yEiaXcbj7tgaSSkAL3TdqP0LcPYFUnqBgdgfJ/95crN9w9agPf+jndOQfqfY7sIenG
	 YgiTJ/scaioiQfbGZHOfWww6ad9FgvuxcsH5Rn9pLyAoL9XY9f9w+7bUBNJdfNJTht
	 YEMil3wbp/Egb8elxt46ckT5XruZbZqr/TAjXHPA8Y+BlTh3UzN73Mt4kgvi63jsBh
	 ZDw2aeAjp6uBQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 02/16] spi: npcm-fiu: Fix UMA reads when dummy.nbytes == 0
Date: Sun, 29 Oct 2023 18:59:48 -0400
Message-ID: <20231029230014.792490-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029230014.792490-1-sashal@kernel.org>
References: <20231029230014.792490-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.199
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
Cc: Sasha Levin <sashal@kernel.org>, tmaimon77@gmail.com, avifishman70@gmail.com, "William A. Kennington III" <william@wkennington.com>, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: "William A. Kennington III" <william@wkennington.com>

[ Upstream commit 2ec8b010979036c2fe79a64adb6ecc0bd11e91d1 ]

We don't want to use the value of ilog2(0) as dummy.buswidth is 0 when
dummy.nbytes is 0. Since we have no dummy bytes, we don't need to
configure the dummy byte bits per clock register value anyway.

Signed-off-by: "William A. Kennington III" <william@wkennington.com>
Link: https://lore.kernel.org/r/20230922182812.2728066-1-william@wkennington.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-npcm-fiu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index b62471ab6d7f2..1edaf22e265bf 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -334,8 +334,9 @@ static int npcm_fiu_uma_read(struct spi_mem *mem,
 		uma_cfg |= ilog2(op->cmd.buswidth);
 		uma_cfg |= ilog2(op->addr.buswidth)
 			<< NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
-		uma_cfg |= ilog2(op->dummy.buswidth)
-			<< NPCM_FIU_UMA_CFG_DBPCK_SHIFT;
+		if (op->dummy.nbytes)
+			uma_cfg |= ilog2(op->dummy.buswidth)
+				<< NPCM_FIU_UMA_CFG_DBPCK_SHIFT;
 		uma_cfg |= ilog2(op->data.buswidth)
 			<< NPCM_FIU_UMA_CFG_RDBPCK_SHIFT;
 		uma_cfg |= op->dummy.nbytes << NPCM_FIU_UMA_CFG_DBSIZ_SHIFT;
-- 
2.42.0

