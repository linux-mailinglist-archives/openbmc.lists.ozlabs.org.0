Return-Path: <openbmc+bounces-124-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6755EACD24D
	for <lists+openbmc@lfdr.de>; Wed,  4 Jun 2025 03:05:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBqBt0W5Qz30BG;
	Wed,  4 Jun 2025 11:05:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748999142;
	cv=none; b=mQSevRZSQBjuYS5HtWdgw1N/l5+VIPPCbQSGT+5zk8+cOluyWFq7p3V8HhBjkQm3Qfwxfq4ODMVkRvu2q/JvLCNC9V7f5wbya81khFGuAXMVsCp/tQztTeuGS+3lpbl2MbApFDyfX0E+MAHOXTVYRnIJe6CJ3TWSPv0glJIq2O/RaT8rK2m6K3MpGmAFKh19tFetXRrRTqMFwLfk9yqbvsW9gG1gMRtdUtmJFYe6Gjhs9JzJLUjCj1tkIOh/Yzf6ZkingoJkh8l3RimRUAoGpzzk7cTjCb2bodSyhDrwyX0dKE7NOPzHKacjF2GRdLHc2lZ8Yof95mWEkcA/ovu4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748999142; c=relaxed/relaxed;
	bh=J6IO6CDxHfrNM5Ns+nSzjV0oB9Bb683gFjWHQaz6mbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I8H12Mb2wSPhJmhsuOsP2QdFQSy3763vWRwvW16q/JuHRZl1FC/8BrR6WH7Dx5rJ7aao17F0/b3zuEBnxHLZCK95yji8D0Q3GANCfav/0aTj8iiHh7VhhP8Gq3QmeBkzGtQjk9bcBB5MhTLTaoLrKrwaaf/iEn/5lC8BSRYf/nzPcwTfpudq0FiIx64rEQNW1LadGYOwXlkT4FaQ7Wd1nl8Jw45JoF1UGVmWCFz5qyvATdalRHVcj4tWUW6X0zLOKUkG3PerODcUu/ocBFt8CeMYXQP08wr8oy8TQbqiUFV01OuUdgpBFk2sRkI8dT5wuxR+NehYia1hTCgXFwjsTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hzh8I/OA; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hzh8I/OA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBqBs2NL1z306l
	for <openbmc@lists.ozlabs.org>; Wed,  4 Jun 2025 11:05:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A0404A6B9;
	Wed,  4 Jun 2025 01:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA19EC4CEF3;
	Wed,  4 Jun 2025 01:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999138;
	bh=SA6HIY3yDC4xKt1COY2bbznzUxE8mwjPYmgofmI2pxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hzh8I/OA8p0H8N9WV9w3rgNsNJv9+MBE75whH4gEWaJ1jMmYPVtOmScuMGNsmO7tl
	 F0QrMbuhQKCVP3PpdOcS4P/jnZn2aHujLbkF7BhrqHWxFSMa8MZkO8/4v2AKZjygyo
	 JqOFnuRcKZnCFxWwX/fE3pAKcZPcpXWbq80PbNbaswXsm06D/xfnOLGaSU5oHtyIgK
	 5BnzeGku1SuZ48HAGJxExB/vcUPd95f8HNfhfGQM+FL1wsL58rIZiAtQPcm8UDk4K6
	 44iEFjQN7T1ANl4JXZrwEejy2OGYacSBSsN4jYVRTptH1evhad6uP/XKRa4ddIpzmA
	 LJxZsdopkKnMQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tali Perry <tali.perry1@gmail.com>,
	Mohammed Elbadry <mohammed.0.elbadry@gmail.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/33] i2c: npcm: Add clock toggle recovery
Date: Tue,  3 Jun 2025 21:04:59 -0400
Message-Id: <20250604010524.6091-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010524.6091-1-sashal@kernel.org>
References: <20250604010524.6091-1-sashal@kernel.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Tali Perry <tali.perry1@gmail.com>

[ Upstream commit 38010591a0fc3203f1cee45b01ab358b72dd9ab2 ]

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to recover them first before failing.
Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Reviewed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Link: https://lore.kernel.org/r/20250328193252.1570811-1-mohammed.0.elbadry@gmail.com
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my detailed analysis: ## **Primary Reasons for Backporting:** ### **1.
Fixes a Real Hardware Bug** The commit addresses a legitimate hardware
initialization issue where the NPCM I2C controller can fail to
initialize if SDA or SCL lines are stuck low after system reset. This is
not a theoretical problem but a real-world scenario that occurs when: -
External I2C devices (sensors, EEPROMs) hold SDA low after improper
reset - Power cycling leaves slave devices in an inconsistent state -
BMC systems reboot while I2C transactions are in progress ### **2.
Small, Contained Fix** The code change is minimal and well-contained: -
**Before**: Hard failure with `dev_err()` and `return -ENXIO` when lines
are stuck - **After**: Attempts recovery first, only fails if recovery
doesn't work - Uses existing `npcm_i2c_recovery_tgclk()` function that's
already proven and in use for runtime recovery ### **3. Prevents System
Boot Failures** Without this fix, systems can fail to boot completely
when I2C controllers can't initialize due to stuck bus lines. The commit
message specifically mentions "Sometimes SDA and SCL are low if improper
reset occurs (e.g., reboot)" - this is a boot-critical issue. ### **4.
Conservative Error Handling** The fix uses defensive programming: -
First attempts recovery using hardware-specific TGCLK mechanism - Only
fails initialization if recovery is unsuccessful - Downgrades the
initial error from `dev_err` to `dev_warn` with recovery attempt -
Maintains the same failure path if recovery doesn't work ### **5.
Alignment with Similar Successful Backports** Looking at the reference
commits, this follows the pattern of similar commit #4 (npcm timeout
calculation fix) which was marked "YES" for backporting. Both: - Fix
NPCM I2C driver issues - Address real hardware problems - Make small,
targeted changes - Don't introduce new features ### **6. Hardware-
Specific, Low Risk** The change only affects the NPCM I2C controller
initialization path and uses existing recovery mechanisms. The risk of
regression is minimal since: - It only adds a recovery attempt before an
existing failure case - Uses proven recovery logic already in the driver
- Specific to Nuvoton BMC hardware ## **Code Analysis:** The key change
replaces immediate failure: ```c // OLD: Immediate failure
dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num); return
-ENXIO; ``` With recovery attempt: ```c // NEW: Try recovery first
dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n",
...); if (npcm_i2c_recovery_tgclk(&bus->adap)) { dev_err(bus->dev,
"I2C%d init fail: SDA=%d SCL=%d\n", ...); return -ENXIO; } ``` This is a
textbook example of a good stable backport candidate: it fixes a real
bug that prevents system functionality, uses minimal changes, and has
low regression risk.

 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index d97694ac29ca9..3f30c3cff7201 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1950,10 +1950,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
+			dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
+				bus->num, npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return -ENXIO;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.39.5


