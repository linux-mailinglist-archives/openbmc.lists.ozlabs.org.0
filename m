Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F849655E7
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 05:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3zd6qvGz3c1D
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 13:49:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989739;
	cv=none; b=W7iQF0h49N1ZasbzW7qqQ35xDdIkiz3zXyYkITAmv55x5BQCGwzHV/grfxN1IOJsAUWzQ3xbS1pSaT1CEMOU91WsToKIfHSEHdXxcg7tQDRrosKa718iS+6hkwy5Dp8XPrBM12Wx3o2/aYKWUud52PeLytqzHhOEYDV/Okn5OWRe88al2NIfNZf8fsdrrgJ/GF8m9JxMm5a20IWmUyxY+2VWdpnkUn8ZUDD0aklzAVy4/YoE2pfZjimbOsI737y2+39tqSXCp9BaVDsFNbMXx4Q/WwkGucmBNkYY9M2LGlJDbdJmajFwhIUMWtXA+PAm1SAyGorq1m/0VSsjeAAkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989739; c=relaxed/relaxed;
	bh=0Yuwb6+ZqfPT0JtISqh7yyK1d1c60sdj5zghOt5FrDU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References; b=jdwvEF8dtzknHngO659P4Se4ph99+3WcIACEgWGCw66DzMWrMewcLOJLlSH+4ltWozA/HFU++EGiOdZYW+AGRyv86J6R493MPFsFpXukv5BJfIuwsqtb6PvBWF9Hs7eebQUBBt4c18sAHkJrTVIBFqmDxvP5jcPXzjcYfA2fh/exaIVcf/o4/r/uhd0hiPGKArwHk+fvoDYI/qD2dW3f0p0zmkn9q5hBTcrbq+oFWQFDLFNIN7hQlB/OagR7xsBDr7TeTJ/OFmIFLzk6dJmf5wX7hdizXtXx+LnNurSO1a1Ou0tBdpyxa710SfhrS4RJBlnEdbbx7ifoHPdryHJySA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=huublalg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=huublalg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3zZ5k93z2ytl
	for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2024 13:48:58 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7cb3db0932cso966849a12.1
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 20:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989735; x=1725594535; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Yuwb6+ZqfPT0JtISqh7yyK1d1c60sdj5zghOt5FrDU=;
        b=huublalg7U4e3BpMkxRYyEZecpFs8UojJxv0cxZQL+uEK8WzSR3HgQ1va052OVNfSV
         Rqs62t/+74xbPpqE+je+DCdP1dyOAagbK6qSbeJw2ig2Gp5hrgayHs4T4xnXAHvSyYdo
         qg9cdvPYd5dhSzNOFrrEG1ivYTOGpRxgabDMG9hkPCIG71UAFMd8jZ3Bg7oS9mfohsaf
         j41V9cDbe07y5bjXa1A9kXUTbAnCg8yVvbHsw7b6Q2VvIG45UbzcLj2IT7eUHE63czgl
         3bD9U56VTe77wT3MSbs/u09CvNFuro/Nq++9N6achkDLUnL5FM3DuO6iY4fUW52S5xt4
         zF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989735; x=1725594535;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Yuwb6+ZqfPT0JtISqh7yyK1d1c60sdj5zghOt5FrDU=;
        b=XB9BpFraJXr5PGy/6Sv1biTU8/s0rYEPy/l1I4OqUr18x4dMMJYpJfNch9anVeF6Mx
         BtWe3EhLyXNx+1kYBMkBb/g4qJAKt24YoM9noQ1hL8hTQf28Rsz/feCvUvdzSFiO3QF8
         43u+dTN9A9ruyehVkN1WOgFSLv3g5lJwdsxcf+RmK0gTd7WsbIPUToOdfO7pwMVcBexG
         MilR9aD0tShIsbYyepeYDGkAYjn7arHMnPs8XevRw6PM2td+co+K8slX7oZLerSBbucr
         MhbN1ZIDR6baXBIl2LC4w9vCh+OyB4WbvQghu4L1ziDE3IQu+pr9GRmXAmZ1IoGwGEa4
         renA==
X-Gm-Message-State: AOJu0Yx7qeAMYW8Hnj0PkFwaRg320X+CvAswWLegBTY5BeeEdmMxp8F6
	n1sGxhXPhvSHOxxsXBqSzrCPBbqeztg5r75svIj1771qnlHJ7vA=
X-Google-Smtp-Source: AGHT+IFQRsKAjsdhrL2+vAvZzE83PEnwKYSeTkwNNHy+5kcEHFwYymLvN94tr8b32+bjiWubAZNy8A==
X-Received: by 2002:a17:902:c94c:b0:201:e646:4d8 with SMTP id d9443c01a7336-2050c3a7166mr62180945ad.26.1724989734783;
        Thu, 29 Aug 2024 20:48:54 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1225sm18350175ad.22.2024.08.29.20.48.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:48:54 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
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
Subject: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Date: Fri, 30 Aug 2024 11:46:34 +0800
Message-Id: <20240830034640.7049-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
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

The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
The original design supports 10 slave addresses although only 2
addresses are required for current implementation.

Restore the npcm_i2caddr array length to fix the smatch warning.

Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2fe68615942e..bbcb4d6668ce 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -136,11 +136,13 @@ enum i2c_addr {
  * Since the addr regs are sprinkled all over the address space,
  * use this array to get the address or each register.
  */
-#define I2C_NUM_OWN_ADDR 2
+#define I2C_NUM_OWN_ADDR 10
 #define I2C_NUM_OWN_ADDR_SUPPORTED 2
 
 static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
-	NPCM_I2CADDR1, NPCM_I2CADDR2,
+	NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
+	NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
+	NPCM_I2CADDR9, NPCM_I2CADDR10,
 };
 #endif
 
-- 
2.34.1

