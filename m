Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F71F9A5A4D
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 08:27:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX52p6yKPz3c3v
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 17:27:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729492064;
	cv=none; b=VTXq3p7nAOy0ZuK6fudIKpTuOQsFXosPPMABOYV8y4PD/vpxmLf9EFmX26Y8qesdER2jldZsIiQ3vvsyAqFEzkG30DHH4MfCR9AXig7roZsvj3dIh+XbzW5qXbubWh3jc7aXa0LvuFMM6aZmAMWCj4k/GMClThz25HpmVEopZYkomiN9ScEWaqs/I08oEFDlf2PvAifrHWnIq7dLTzTmnVxkayrvYBvnfQ3vCrMG7IrIMJ1pZz3eomZkgMv3w+/gTY9nBg4KWtjkm62t9SlhsURWZfQnpDF/PfkgM8D01ij45oqbUDdCxuRz8S8wmtPIY5dunDiPvcybyhnX8vbjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729492064; c=relaxed/relaxed;
	bh=s56c+/LO6NBVWgMpiwpkhSioI6B4YvZqh4mtUGgHfdc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Dh5MzAiXMQ3N6WA7OyWWgBNGoohiUgheEYdJ13GRWomhIZ11vYA5W1DmGDycxL+I/3aQQ6HgMQrAF0T7e7Cwc1Mm6SsgND+PwsJLubkUzbhBhqgx8py5B/PPHZFJM9YvecPVrGGnWQp1zbTbZp/BNvsucV1VsCBp1N38+7AGFhphhpwVuofDdSgRCk3/CbpEADqllIsH1WvBtoml8lE3uC1uhK/ujZ8MT0XI723pqIi//L5yv5nauPVHI+odFcerKn9OMv933wzNhJSLAlRSDH8kb3XclsNAuLcz/RQlu1jBcCZOmnlCYimFDQdQcJGQEG5oVGSUgF6sGcsGplHl8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mq2wX8Ih; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mq2wX8Ih;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX52k33ZDz2xfR
	for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2024 17:27:41 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ea80863f12so1699828a12.1
        for <openbmc@lists.ozlabs.org>; Sun, 20 Oct 2024 23:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729492058; x=1730096858; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s56c+/LO6NBVWgMpiwpkhSioI6B4YvZqh4mtUGgHfdc=;
        b=Mq2wX8IhjGDuUN265pFQUjON+tvpbcYR3JgZiMcHkVExon0Hzup5dLRt7E2y9D6XD+
         05rwagncgZx0CoaUPfpVaICmPA7GmvDJK6AHIZTrP7rh9Ksvg4+qr/5dcVXYEqJUuigT
         8o2ZI/xKOZiw2A8D/ZXp3aRtLBFjIsHbHEmDdakjHT9sZCnmlkPmVC28Kmr/yp8vqPRM
         4ifbcjmaXyTJyqFuDqIGD+ORCSAKPlOrxJ96LYuO7iAWP79OlXKOPQUlTJBSCMSpukC2
         ewySdpr3XmBfKjbPA9SeleMYqbLgmTI376lZLr3dm5e/kUg0ZFPI06piWP/XMkX9kfIK
         9Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729492058; x=1730096858;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s56c+/LO6NBVWgMpiwpkhSioI6B4YvZqh4mtUGgHfdc=;
        b=iNXX9hFGtqaxt1fgSn8b6lulJKEzuCiFe2pwijE3kcC+7/nMpcbp1qFUPoT2gf5eD+
         09ixs87zukKxFu6fMQRDygzl+XKoc7bWHC6dgf66n/JhnmkPU7Zk9mgkS9xAsXXPWyTl
         NCohn4bCFTeivVaoM2dJpVEzCEpAE82aGuBFD4SOP4eo5ROk+kaFM+7D3v8GzzWPfv8n
         +k6o2SJYzJtgOkdRb7LcEEFBa8yDtDxDzIFgYGG2TMSTHsw1URfyNDZIaKaYbo/3GUtB
         eq2RTAQSbIDSDf6SytdF0/jSu8QJpiqJcHwxzhSLDVvvbBbVyPf6BqH+JWJr0dIiprf3
         hqug==
X-Gm-Message-State: AOJu0Yx+9HH26VZQsgImm4WvBK1+Z/huDFf/RrRlHgjaftOratmVKRkI
	bomWwuTyZH+0X1bNfwYaHUhHagWPiCFgn4wvX6Oogzk/oQ6VJYE=
X-Google-Smtp-Source: AGHT+IGG/B7+Tn5iB7renUdnGDg7/rv1JOu3+Pd4cAaEkQR1SOfQ7EInkZJFb3oU73e0M7B7NsaYmQ==
X-Received: by 2002:a05:6a21:6b0b:b0:1d9:ae4:91ef with SMTP id adf61e73a8af0-1d92c5087b3mr14838800637.22.1729492057856;
        Sun, 20 Oct 2024 23:27:37 -0700 (PDT)
Received: from localhost (2001-b400-e38e-c9a7-dd38-775c-4093-c057.emome-ip6.hinet.net. [2001:b400:e38e:c9a7:dd38:775c:4093:c057])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad3677b2sm2700255a91.20.2024.10.20.23.27.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 23:27:37 -0700 (PDT)
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
Subject: [PATCH v7 0/4] i2c: npcm: read/write operation, checkpatch
Date: Mon, 21 Oct 2024 14:27:28 +0800
Message-Id: <20241021062732.5592-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
- Andy Shevchenko : https://lore.kernel.org/lkml/ZwkFWVC3_5xr6OQW
  @smile.fi.intel.com/
- Andy Shevchenko : https://lore.kernel.org/lkml/ZwkFwABviY8ClyUo
  @smile.fi.intel.com/

Changes since version 6:
- Modify code comments.
- Remove redundant code check.
- Remove i2c address mask.

Changes since version 5:
- Correct "EAGAIN" to "-EAGAIN" in the commit message.
- Configure the bus->dest_addr by calling i2c_8bit_addr_from_msg()
  and remove the I2C_M_RD flag when calling i2c_recover_bus().
- Fix the commit message which meets a too small wrapping limit.

Changes since version 4:
- Add more description for the codes.
- Modify the term "function" to "function()" in the commit message
and code comments.

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

Tyrone Ting (3):
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Modify the client address assignment
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 424 ++++++++++++++++++++++++-------
 1 file changed, 328 insertions(+), 96 deletions(-)


base-commit: 663bff1ddfe4ecbba3bcf4a74646bb388b1ad5b2
-- 
2.34.1

