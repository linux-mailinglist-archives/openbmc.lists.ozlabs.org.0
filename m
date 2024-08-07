Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A690F94A4ED
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 12:03:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=earNUqdf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf5Np0zj0z3dDT
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2024 20:03:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=earNUqdf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wf5NF5RPkz3cTl
	for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2024 20:03:23 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fc4fccdd78so12766805ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2024 03:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723024999; x=1723629799; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QZYXRPEg528ElfNUTSQ20mrku4XweYkGoPgtSo1AS4=;
        b=earNUqdfOKpD4SrsRDyk4afGJJ+yTw+oxOVAYCKz823eCGlyDzcUR1Vmq/srVV3ova
         Gv82z4tbsUUBp0JUxlg5fsWKMeKSGlMRHzWf+2+CzGA0kyMDMvRIH8s4w8FEnji0txsH
         4thVxBlzMYhCN+HPCmzNhS1YV72QzJjCWF6su2vqB4u+Lsr5R3lg5KKH/gq3FP/OOWcW
         rn0D/94BZOTUX3Q3ci3Utw2mg5x1Eh3i0Iug45BpgBErVwm4Kx6wKZONhjPRFz5KzaPF
         6EguAYFkPHgEH0xqZYTnzp3OXtQHHUQ1NnjGuqfLfrRMrnUPAzZcW4eHhDxiB+vXxzcp
         zNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723024999; x=1723629799;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QZYXRPEg528ElfNUTSQ20mrku4XweYkGoPgtSo1AS4=;
        b=ZrZi7tBf1fmNNW/EEXJqfaUn3xh0+rlG49edl/kz7QLp5iDgfYmD97KGbryQopzXv6
         bsfK5mYzihHDuJfWOBlk882of4Z7RFo7GpQJ9/x7JSiHlKvQHDWqRvtzY0yvBXqCVR3Z
         KROrSsOaqmwaeN4/keJKNpyMhvP0Osjqiw352Fgw4p/uJ0KJkfczZomDUGlDq0Su41/T
         O6pTFGexg3KkBroF6Ck2+45q8T2k8XjXV/K0dekPwB03lJwM0C4Ois89y32uEuoBL8Fz
         XqAc3YcmjBFOL67OnFjzAFls4rb2tpjVHt3IRivop+fSqEjTZn1JaHQt8wTp8sUQYMr1
         ujPA==
X-Forwarded-Encrypted: i=1; AJvYcCV473vrDnat0GxY3sxfri6v4/G5cTKE4t36PO/qO532c6tiUwajrC/OE4Ady9owGXs5tGo43a4ryMp9y3KR3p/8+9SEmPDV2MA=
X-Gm-Message-State: AOJu0YzHvGkmQPNMoIirybOXCeC60EjeWVNHUKXK+peQP5vdwog9sgMG
	37+I+2Q5zkzJGFEKCagrlVRgQHg0/ifRkLvl1vcMMSqfVau5wZ8=
X-Google-Smtp-Source: AGHT+IGtt7yBZ4CfHFL434fO0nZ9TPo2uWQBtrGHO/+MhwTtlMQLPNCENUE0OdSburFSvWg21GelPA==
X-Received: by 2002:a17:902:e54e:b0:1fb:7f82:515 with SMTP id d9443c01a7336-1ff572a2c1emr198249685ad.15.1723024998874;
        Wed, 07 Aug 2024 03:03:18 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592976b3sm102874295ad.252.2024.08.07.03.03.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:18 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com,
	kwliu@nuvoton.com,
	jjliu0@nuvoton.com,
	kfting@nuvoton.com,
	warp5tw@gmail.com
Subject: [PATCH v1 0/7] i2c: npcm: Bug fixes read/write operation, checkpatch
Date: Wed,  7 Aug 2024 18:02:37 +0800
Message-Id: <20240807100244.16872-1-kfting@nuvoton.com>
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

- Enable the target functionality in the interrupt handling routine when the
  i2c transfer is about to finish.
- Correct the read/write operation procedure.
- Introduce a software flag to handle the bus error (BER) condition
  which is not caused by the i2c transfer.
- Modify timeout calculation.
- Assign the client address earlier logically.
- Use an i2c frequency table for the frequency parameters assignment.
- Coding style fix.

The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Charles Boyer (1):
  i2c-npcm7xx.c: Enable slave in eob interrupt

Tyrone Ting (6):
  i2c: npcm: correct the read/write operation procedure
  i2c: npcm: use a software flag to indicate a BER condition
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Modify the client address assignment
  drivers: i2c: use i2c frequency table
  i2c: npcm: fix checkpatch

 drivers/i2c/busses/i2c-npcm7xx.c | 266 +++++++++++++++++++------------
 1 file changed, 167 insertions(+), 99 deletions(-)

-- 
2.34.1

