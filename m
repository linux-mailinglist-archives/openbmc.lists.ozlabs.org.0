Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617CF9655E4
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 05:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww3zT1CQNz3bN8
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 13:48:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724989728;
	cv=none; b=ZA5WUCV0CHeBghXvjGMkd6BLFqIZFfBC1GL5h/XSAGryEvrCCijX1Fx6QZdwOafKbnRL1QurDAQjX9ECJ+Go7RimpWustE1nMRKaWt8+WLaKtZskttOGzyUZWePvQ2ax6X0fp+y1j6sEe4UBv05Ux4hxGosRuf1JryZKvbWVc2sZooV2MFIUkuCf6hV3CQRpXGeaZc8x/A2dQpjOiGOpeAHEBKKu/0yXCqOKB8b1cT/xNeTTmSGNRmjZECqMaEkcArb29ucxtisdJQ24alOq7ijh+igrNqrdic3nFQXcneXzfpYWRyanSZvN5fxsinH/jyAMaVjkCHDZdCUl19vGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724989728; c=relaxed/relaxed;
	bh=qbsfqCs5csSDvxpE96NTbhH7GVwWt1XCT6ArdWTDKno=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer; b=iGhK2xsgSQgYvSElu9NQZ+5dSkO8fWXx0QTVw8qzPHEjsnLhKHoHnVAM3Kjvk43xt1DuXoBJC11iN5HgxmUE8Y+zgDP6X+aohC5TDt5y2TVj1WV+h7Aujnsy3tRg0eHhah7Snxtg/FnvenJ3u8zPf8UhL5riMUeACmZHg9O0e5l3D88lBq43NScdoMq/jU+26tz9tbOOqycVTO0ZSLrLnu3iczH+jg/iLCH43h7j6ZoBpJmWrUn7/YsTXq9TcK0L9BpBmcBn9F9k+CBw6y7GZWvXAg14SGgh7+Dx1WxPYgl+0k6JTHHNJS3vnqY9CcE28CYpChNcuPsnhnMus69u5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MxgBIvaP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MxgBIvaP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww3zN0Qjdz2ypx
	for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2024 13:48:46 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71430e7eaf8so1158536b3a.1
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 20:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989724; x=1725594524; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbsfqCs5csSDvxpE96NTbhH7GVwWt1XCT6ArdWTDKno=;
        b=MxgBIvaP2kQdKNr/PV5KfzDauXj0CsVwpNbzwTHa4NrA7AGoUVm1vcKZpkKwo+vMMh
         HXKqooO67p7BM2VvkdAItlTTNmSrqE6DEtC3EsF6eTX7L2nCZXhZy3NhS7gRcQGJ0QS7
         YrkoHIse8szcag/zjhkDjwWZ/lqZ6w+23dtQQVPOtcdGmix0al3XnMKJV+ZSQ77oAK7v
         ys6/BDLZKr/5aCMYaSvSwZ6H3nzs5HKvkqlIjkAVPOt36wgX0ol/EwTr5abSjgLeBzWm
         /m9l/hplRXZ6AfbWNrwb1eg+q1UdYg6fpshOki0RvvoigsXCR1KAcO4tqc4Ekj2eSdWG
         weLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989724; x=1725594524;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbsfqCs5csSDvxpE96NTbhH7GVwWt1XCT6ArdWTDKno=;
        b=tSTHtNsRCgPRKkKE/tN0j4AkItb57CIIcKAmMGlfw0bbUpxJ4C61njURDOy7MtlNwT
         8zPWaHZfggOfi1FQLDDOs97mRnye9kS97BEP3Rvx+oEI/4PLX67VT5budGBLCJitVLwW
         iqsl+x9sxBnRQBZtb0Hu/NEcI4t2ToNZndzt23pFIySq/vEqux4ls/3jtP8BUZEFmfF1
         jsYRwaKF9tCweSb5915f1dkeSg4/RFG73JD1qkb730oyWtpP6+FnHJEI83JumHEL0Sde
         ofb9vMvOWtqyzmGIcsnFksc0uepE/53Rgs1WcHAYFpmwQUgjNu6dpkjhqu7Y4u2DM+Mw
         ZALA==
X-Gm-Message-State: AOJu0YykMPu3zwcrLXBHxt95YGVUBRKDyejAQLyfey6KJqpQsrLjlzL0
	bM9sSHIMKe/G80dR3mIxD652BsZCjWhQrmOO/G9EUM6dNyqgEZE=
X-Google-Smtp-Source: AGHT+IG3pIEbVlY0gXmkEN2xlmwfRwBfNFoebUp1tCda4OOj4xC208HlKYVhFM2v0yuqkG1ZSsDaQQ==
X-Received: by 2002:a05:6a20:9e49:b0:1ca:edd5:9254 with SMTP id adf61e73a8af0-1cce100b937mr4232979637.16.1724989723905;
        Thu, 29 Aug 2024 20:48:43 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152cd8d6sm18391205ad.71.2024.08.29.20.48.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:48:43 -0700 (PDT)
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
Subject: [PATCH v2 0/7] i2c: npcm: Bug fixes read/write operation, checkpatch
Date: Fri, 30 Aug 2024 11:46:33 +0800
Message-Id: <20240830034640.7049-1-kfting@nuvoton.com>
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

This patchset includes the following fixes:

- Restore the npcm_i2caddr array length to fix the smatch warning.
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
- kernel test robot : https://lore.kernel.org/oe-kbuild-all/
  202408080319.de2B6PgU-lkp@intel.com/
- Dan Carpenter : https://lore.kernel.org/all/202408130818
  .FgDP5uNm-lkp@intel.com/
- Andrew Jeffery : https://lore.kernel.org/lkml/
  20240807100244.16872-7-kfting@nuvoton.com/T/
  #m3ed3351bf59675bfe0de89c75aae1fb26cad5567

Changes since version 1:
- Restore the npcm_i2caddr array length to fix the smatch warning.
- Remove unused variables.
- Handle the condition where scl_table_cnt reaches to the maximum value.
- Fix the checkpatch warning.

Charles Boyer (1):
  i2c: npcm: Enable slave in eob interrupt

Tyrone Ting (6):
  i2c: npcm: restore slave addresses array length
  i2c: npcm: correct the read/write operation procedure
  i2c: npcm: use a software flag to indicate a BER condition
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Modify the client address assignment
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 276 +++++++++++++++++++------------
 1 file changed, 172 insertions(+), 104 deletions(-)


base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
-- 
2.34.1

