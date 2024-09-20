Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DAD97D411
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 12:18:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X97dS5y4Mz3c72
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 20:18:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726827512;
	cv=none; b=H5Ha9BdBURf46S6c1PCToPCxDbIIqibCQOcQAGTmJjXpsbqExzA8pa29XJ7LH4tnDiuGdve9FvLuhDlEiCz7DrTmPEE7CDw07uUy1PYEt2emn2ZWaLQCQ2B0SlyqaRExNH3MLDb0/s96QTLV7vtQL48DyIUiMG9kz8DuWhYv5cXJbm/Z2FhTrQkaH0wF6zjheIuL7L3esMB9ECJUKCa9qO1ZTaDlN5Q993ANq8TfJw1wgnqQhv3ID5X/P+OhQluEuwtqevDRvRnm4QioHdjD/EqcKvFj5PnHnv6tx4N4NPB9+v/JAxGdjrVuqkmv9kRLKLOPx8wGXC34d8XMydRGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726827512; c=relaxed/relaxed;
	bh=qBcCIjRoxiVjgDZ5MgMhXd2EKuQeYew6JZXuK1tPsac=;
	h=From:To:Cc:Subject:Date:Message-Id; b=abrzEHlBgLf5dRN8eTRVS/jB3utf2S5pOaj0dMPLsAW/olrdk12deCyT2ztJ31S16ffZE1G/DsMeD/hfX6wcYciWzfMGTrN4N6xZTtgaj0DIumI4xzhX7A7cCZ2VNcS7upC5c+1HVoIyZpuaEuC3KJEPADNugkcyl8TEPIAXJ0Kd9NleG6nY0VOLukI+J5CFkTgUYvJ4f0gMekY2DytxVwrcYn8o0eexs+FxHMIHe2jMS1b7dqkQYGrIEk5eX32pZ+Db+tNw5Q9XFPGHlXXlzArE0oU7mFj06thyE7fn/ffZcbSTixgxrWUgfVNoiuRnXV/Dnv+UPdh0L/fFC+O2dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DPMiPcBZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DPMiPcBZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X97dM7142z2xYg
	for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 20:18:30 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so891519a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 03:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726827507; x=1727432307; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBcCIjRoxiVjgDZ5MgMhXd2EKuQeYew6JZXuK1tPsac=;
        b=DPMiPcBZ44hljFbPbJGlulxALKShJeSg9WP4/nBiixerIRgoWW0IIGpbxmCMGHHEwk
         W8vlUo5V23EAEcH+YabKgXwQuErT3xk/JcwZai/b/qXk0+AHs/+S6WiK27I9JxD3UxR9
         onmGMv/9RNIelTnenhfn834E7oLJluTpF0FGKLs0yASBmIVsViYwkrJqUfOme9qW/bSF
         T/Vv0aTaztVJG/i4gGeHSXOmTydtM/43JPO0bdGrVBcnbMgZGpN0vUcrjwhaxGKvO9dD
         rG689JSoR1D+zAuNv9KAI1RHmkKVfOzYQ45MTx38KeYLTWR2FMKDihc875DvOxzoBOby
         tHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726827507; x=1727432307;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBcCIjRoxiVjgDZ5MgMhXd2EKuQeYew6JZXuK1tPsac=;
        b=jDhKsr/afrRAJBvXg+kkAZzpMci4G9ULR28/uze/4jqjKAS85+EVNuu0nC3ZBGkxjP
         UbW6Ah6963KYzUpCd7f/ww9gfNufH9kUD3j/JRrkFjWhIobd3Zn/QyLCO/r+6gtKtprR
         dCOU1Ipjya3zR9NMOgDmZTF/TiiBiM8hZfKihLL5kiH+PPAA2qXEnH60/j6KSDHFWGCw
         /us+cW0MGEuNAEic9I2nf4xP0xMJ8bkHyawkLQ+nczSJ/lGRfICiSQ7wmpltrXzkMYxK
         0pGxIfcXGpHDs3DJq/lzSAcpfpRcxez1H9Qe9eCzUCbTakF8uLP/2QYMvC3G+g72W+Dm
         ucWg==
X-Gm-Message-State: AOJu0Yzb321olBl44K+A3zp3Y11EW4vMGcQSm8UNByzI9B3a8Q9ypffx
	T8Wu4GFib0RzOm6AHJHKaQ3U5CSfl7zs9iMBsBghn/c484laDWI=
X-Google-Smtp-Source: AGHT+IFbP/eoSZq3hbpekXAbmM4GZBdYL25BhV5ix8BcXAh8aBgnpApziN0RHvvL0/JIKZRAtrQzmw==
X-Received: by 2002:a17:90a:d906:b0:2d8:aa5d:5856 with SMTP id 98e67ed59e1d1-2dd7ed20097mr4122520a91.11.1726827507470;
        Fri, 20 Sep 2024 03:18:27 -0700 (PDT)
Received: from localhost (2001-b400-e35c-9cc2-447a-d760-d4f6-01f4.emome-ip6.hinet.net. [2001:b400:e35c:9cc2:447a:d760:d4f6:1f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6ef93b3asm3631278a91.54.2024.09.20.03.18.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2024 03:18:26 -0700 (PDT)
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
Subject: [PATCH v4 0/6] i2c: npcm: read/write operation, checkpatch
Date: Fri, 20 Sep 2024 18:18:14 +0800
Message-Id: <20240920101820.44850-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
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

This patchset includes the following fixes:

- Enable the target functionality in the interrupt handling routine 
  when the i2c transfer is about to finish.
- Correct the read/write operation procedure.
- Introduce a software flag to handle the bus error (BER) condition
  which is not caused by the i2c transfer.
- Modify timeout calculation.
- Assign the client address earlier logically.
- Use an i2c frequency table for the frequency parameters assignment.
- Coding style fix.

The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Addressed comments from:
- Andy Shevchenko : https://lore.kernel.org/linux-i2c/ZuQUfCK7d7DuR9eH
  @smile.fi.intel.com/
- Andy Shevchenko : https://lore.kernel.org/linux-i2c/ZuQU2iIZwW4mAumo
  @smile.fi.intel.com/
- Andy Shevchenko : https://lore.kernel.org/linux-i2c/ZuQWYabomv_xyYyj
  @smile.fi.intel.com/ 

Changes since version 3:
- Remove "Bug fixes" in the cover letter title.
- Modify the term "function" to "func()" in the commit message and
  code comments.
- Correct the coding style.

Changes since version 2:
- Add more explanations in the commit message and code modification.
- Use lower character names for declarations.
- Remove Fixes tags in commits which are not to fix bugs.

Changes since version 1:
- Restore the npcm_i2caddr array length to fix the smatch warning.
- Remove unused variables.
- Handle the condition where scl_table_cnt reaches to the maximum value.
- Fix the checkpatch warning.

Charles Boyer (1):
  i2c: npcm: Enable slave in eob interrupt

Tyrone Ting (5):
  i2c: npcm: correct the read/write operation procedure
  i2c: npcm: use a software flag to indicate a BER condition
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Modify the client address assignment
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 425 +++++++++++++++++++++++--------
 1 file changed, 323 insertions(+), 102 deletions(-)


base-commit: f56f4ba2fc1dbefd3242946f2fad35338a60e3bc
-- 
2.34.1

