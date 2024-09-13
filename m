Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB41977D0B
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:15:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4qtf4GC5z3cmw
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:15:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726222501;
	cv=none; b=I2pZw/v2sKesJ+ubyw6fMySNX/JQ4Zeq65gGvoTny3ajYhN/y02C/sg+PJ+xeHS7FmhQyJrE+0mI0ddEThrQbT3PfoIYzctbQPBYHtxoU9pXjzRiEWBL2I61vLPKH8gBOW4lt1wAbh/km/gYKPRM09lotiEXBXNYvAfSoI8fTcBqIjtMu9NrE8rPcHfEZb7zW93wYZsEVhQ11N3ltEubNKmlnWLwmMl+GYViK/JFY4gHsyebbkAH5aCOYEwOlZ9ywBo+0qkQnNH2OoZQjRXKKJPRch3y/rrHKhNkBCjnoGeiZT8VHjnBCht02OLfhiCOOqNcLrEAuEbn55uXNzHrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726222501; c=relaxed/relaxed;
	bh=mgfOidgW6QQd83F5+t8/o7O3J5kWPZhDUGZrc2VOvL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ivsGCJxxPnm01gLdUL/r/A6ibMIxYPHlPfXKF7uynl+dFddMzoyPAH7t72uAvx4D5l+aUhUIu/Q830UJZiUd9GX9gIWTlHEz55jkQXqaUud17dl3Log+2vwp+BEz6V/exnQ6YvxB2QxUrns0MGlf1BpV6Gz+PnJsA7dHVfkVldVil8dU08jymQNfg9wxU2bBw6VfRV6gzB4mz2aDlltA2U050an4cVH5d33TTp1ZQ6TcMYEBg25x5O7j3UCFsffSxpqq9nj00mBDWaon9pz2HKjEwTbACpux14j1CoqQhulSG9PPsglm0YCihgyA8ILeGDa0IoKs9h9TTQ2a2XJoyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hKARZx2Y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hKARZx2Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4qtY2RRmz2xmC
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:15:01 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2d8a54f1250so1385858a91.0
        for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222499; x=1726827299; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgfOidgW6QQd83F5+t8/o7O3J5kWPZhDUGZrc2VOvL0=;
        b=hKARZx2Yt3nau2ehXsB/RuKkgMVybs9K/W45bB+3UxMsE5V5GPlUjaTpKxw6pXYLZy
         x5QOvxkv6qn5OhtRxLgeMP4UMLg8DA1Z0P/WCs+iq/YWusJI6LKN0Ujmkz0k1pOes3kv
         QjzMigcSlbCYa+vLJaaQDvr+FEoTdg3QEeDa46JlU2HSK/had2/0bQjCatfGKWtuPnai
         zFLyNhv7SDCQBXG6fekd+u1o93nMz3ccMopwX3WcoQZ3EapO4+8rXzotNoq95EZabjwO
         MINnWd7MMb+l15r+tBh7dfrgALheDZi3hUrbaLOvcmzuUxG6r/yMC+9+JhDyII7+ZuNu
         16bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222499; x=1726827299;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgfOidgW6QQd83F5+t8/o7O3J5kWPZhDUGZrc2VOvL0=;
        b=aviUhwXb4b/UNoK5g3dLDpG7ByY7ylGBvNTWPbRhh4izpRCvNO4DJICBiFP9s9IM0v
         IK9Luo2p36X9XnxzH8Dw03QeJrgbn0IsuqD1O1GYvUyyz+frmFt2TL1XtSgDh3/nlT/V
         kVCN5VIZb6nemi6k2L4bzbiqFs/rKiBXRH5QxYwUUDtRAxLCPFvQps3OmgfsO0Xorkeo
         UPnd4s8Jllx7HbxPUb48ni8ZxQJINLfKkAH8qvVoa1lfKsPfnguW9048YlUEfFMnAee4
         +YZTVri8ekFlU7IAri/fTJq4zCMndHswjJynpM/mlOOSZfMFkjTPqnNXAwSo0fixnJvb
         eyzg==
X-Gm-Message-State: AOJu0YwgJn43wcdDWdd+faB8qYUYAb6YC7FWat5vXVdn9b0fZwW4VNlz
	vmn3ShPuJCIC4OFKcXVRVuKvLfeLwJ+DiEJq7nRRMPO8ocO5IhM=
X-Google-Smtp-Source: AGHT+IGYenqOVhVnCvgeCN41uV0ql81wR0Eu1V6J2NcQ2jh3zcbTj94rIYBZr8B6KrzAZyPWuGrRcA==
X-Received: by 2002:a17:90b:b83:b0:2d8:7307:3f73 with SMTP id 98e67ed59e1d1-2dba008231dmr6286966a91.39.1726222498365;
        Fri, 13 Sep 2024 03:14:58 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9c4a253sm1347026a91.4.2024.09.13.03.14.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:14:57 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Subject: [PATCH v3 1/6] i2c: npcm: correct the read/write operation procedure
Date: Fri, 13 Sep 2024 18:14:41 +0800
Message-Id: <20240913101445.16513-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240913101445.16513-1-kfting@nuvoton.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

Originally the driver uses the XMIT bit in SMBnST register to decide
the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
write operation. If it's 0, then a read operation will be executed.

In slave mode the XMIT bit can simply be used directly to set the state.
XMIT bit can be used as an indication to the current state of the state
machine during slave operation. (meaning XMIT = 1 during writing and
XMIT = 0 during reading).

In master operation XMIT is valid only if there are no bus errors.
For example: in a multi master where the same module is switching from
master to slave at runtime, and there are collisions, the XMIT bit
cannot be trusted.

However the maser already "knows" what the bus state is, so this bit
is not needed and the driver can just track what it is currently doing.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index bbcb4d6668ce..2b76dbfba438 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
 			npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
 	/* SDA interrupt, after start\restart */
 	} else {
-		if (NPCM_I2CST_XMIT & i2cst) {
-			bus->operation = I2C_WRITE_OPER;
+		if (bus->operation == I2C_WRITE_OPER)
 			npcm_i2c_irq_master_handler_write(bus);
-		} else {
-			bus->operation = I2C_READ_OPER;
+		else if (bus->operation == I2C_READ_OPER)
 			npcm_i2c_irq_master_handler_read(bus);
-		}
 	}
 }
 
-- 
2.34.1

