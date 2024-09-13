Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 867CD977D08
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:15:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4qtb1G4Kz3cCt
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:15:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726222496;
	cv=none; b=H2AVjrw1BadG2Lr5g+noIoNsvpKaPwFqf8XCm2dPpaaBXprwDOvpup4iiYWxKKqxGY4YfBaeArqSJbWbVkUngZe+dkm1Q25aAWdEpRgNYGPfNeiDSdDgk48cvfxS+gTByzgpRkbyRKQLoTWr6pYBT/7NpNlDYc03O0nuj2ateEyGCL/XTrY/JTOjDqC9Jkr/Kb3PTASlk1rgt6QC6vVzTopnRP2/HAtujgE/4/V6Lqza6W84p+58BNK4OEm87plhvdIA/lJJgJ5H/DkiKiiHYgpaWjxwi1GPsyO3TfvVxwNRfv0kvRuv7eln4NN7Toim99RnBq4+Sz00BmlJZ5yScw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726222496; c=relaxed/relaxed;
	bh=fG6tr1CEMYW+hGol0y7P6nh0VSGKd7m23E/GKIsNqpE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=DSRYRr2LaKWQNGyIIVWGMfUiQL6xO8f2E2XoS7r0dFampkLQuHOJe8q1pV6bKzFvpV8mDxU01CRkI5vU0WDZ3lsa4sd4CPuf4OsrrgW3LtP0NcbHM+AQWCSpJujan/trl3xddby6leWUXtPLmdCzV1ZwV0rIIgkKrQ9kxW29/7zRL/zegbCEo7r3jnzvInzLiPlsPde43WawKU+LWTWwSFKDUgGm9aTl1y+bn5yfDeJGaoWhgy4o0JZUBLGms9RO2Szi5F3m3wkeuFhD1SFKER2uRcuk68j/Xp0tY0mCxUBXssGU1OPMbb/vc0gmxIayYLPBIPhJvaTOEVy0yjbjdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UrO/E9ar; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UrO/E9ar;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4qtS0Grtz2xn5
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:14:54 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20543fdb7acso5616375ad.1
        for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222491; x=1726827291; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fG6tr1CEMYW+hGol0y7P6nh0VSGKd7m23E/GKIsNqpE=;
        b=UrO/E9arT1koiP09cy3Bf+HW+3y2m9Z0g3JWGAXbOVO+rqEqB4TSX9DYNzIN8gPq1Y
         8beV9O2+hYYPxNMrERgTUz/Wi2+KWTImWRbCOJ/RwS1aI66XXxEl7SvoIfML0Eet/ego
         eO0htRoNCEwMjq3iPte/bsi4h7fksMa518YqOrexNoDFBuWj+xWazK9NVqYTUmoL0yfJ
         IQMht80/latM1XGR189AW49E0Y1enujwXGK4+N3DrKZb3HkrhY7OIvUDLPaOWbxpvH2K
         CC12C9RstoIfYm/Y1dOOlmbDrzi7nRrEbb4qBy2cqbXuuM1hGWhr1gpQbaA/zc7P3jIt
         Ramg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222491; x=1726827291;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fG6tr1CEMYW+hGol0y7P6nh0VSGKd7m23E/GKIsNqpE=;
        b=rJiL0dmtziKMlojBQnl1tLvzmSLwiEhbmQD9ogfo1oDrVUypm+ma5GYK3G07ZLmFm9
         FVtbyZVC3Cp3niWcOEdxTFQCZsT+LWmJ9HJ6djqWNSbX+eZalc3+6woyWtxabrlNqMN4
         HT4WN6CbzP3YyZv0zFdnM09oV3YMVmwOSHus+UZoLYY3Dd6AtifmpmItmrSD9ydewJBv
         0OGVYTyf2Dpvthhu50+SoK9WQ859zAevmfx7JqFdkEDJ2VBqVLyn9pu48GDxus7MHz9H
         RpNoM7IPREfYT0TIwv7Jy8UsqSx0x/36XgbeHA3Aca7zVNbzwmCuv1CpIJRSdRHLOCKB
         2TCQ==
X-Gm-Message-State: AOJu0YxWnUCywdUpAhspKUIdU+GBcE5lRi00mbueVfnaiKuNGfkH1RGy
	OXskjHa0wieW1w4R7/PS84Q5SwLfXNS3xu98QoEj/mlQYSDGN/g=
X-Google-Smtp-Source: AGHT+IGe7fD6EqPAmOXxGUzdjT+wv0BtZDhatz1LkOcMyllPOxfMDoG9hDmkUDaXk7n+6F8ZAqv4cQ==
X-Received: by 2002:a17:902:e88a:b0:206:ba7c:9f2e with SMTP id d9443c01a7336-207822414b5mr31809455ad.25.1726222491019;
        Fri, 13 Sep 2024 03:14:51 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af250f2sm25787545ad.61.2024.09.13.03.14.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:14:50 -0700 (PDT)
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
Subject: [PATCH v3 0/6] i2c: npcm: Bug fixes read/write operation, checkpatch
Date: Fri, 13 Sep 2024 18:14:40 +0800
Message-Id: <20240913101445.16513-1-kfting@nuvoton.com>
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
- Andi Shyti : https://lore.kernel.org/lkml/
  cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2/
- Andi Shyti : https://lore.kernel.org/lkml/
  stnyjmnqdobzq2f2ntq32tu4kq6ohsxyevjn5rgz3uu2qncuzl@nt4ifscgokgj/
- Andy Shevchenko : https://lore.kernel.org/lkml/ZtWnd8bmiu-M4fQg
  @smile.fi.intel.com/
- Andy Shevchenko : https://lore.kernel.org/lkml/Zt7Nn9uJSeHFUZZF
  @smile.fi.intel.com/
- Andi Shyti : https://lore.kernel.org/lkml/
  2kqhf2ad3omx3dsjucrqhtnonnox7ghtp7vkogrwrdfh3dgg2o@4cpa4gfg6c3f/

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

 drivers/i2c/busses/i2c-npcm7xx.c | 281 ++++++++++++++++++++-----------
 1 file changed, 179 insertions(+), 102 deletions(-)


base-commit: 48b83f5f68edb4d19771d5ecc54bbbc37166f753
-- 
2.34.1

