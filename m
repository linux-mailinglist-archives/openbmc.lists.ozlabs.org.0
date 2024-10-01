Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3AB98B452
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 08:29:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHp1v1Q37z30W8
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 16:29:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727764159;
	cv=none; b=ffuURiekvQkfuOS/K/E2MZy2w0KFPoM55/5HFrbpSoC8ktSDzBi7sPfiiZ/qbkd+Kt7XicMZK0X5mIThp4kiqeyc2BwnurbWRnWJh9xo6lg7YZ+UMqCv9CK8Bd6J96bEn1ylgUR6hDrMmYZ57uFlg17y76jhAHEOkwud81/G/kWw1MH/uWq16Lhh2WAe2Fkmp+/0MHzMWKoIxykpPcCpmfDzHGz4qalaZc3wvYpWQ8VzFlkOqd7+tMhntfsQHtltkN6LDn5fHxKlXkEdoI/W6m40iSjl41rscMi7EtxuCUEPWIdEsEftscB/bq7GlTzcSbmg+bXknA6Wg8ns9pXYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727764159; c=relaxed/relaxed;
	bh=oYuuvZ+ipGa30qTfy2WMGB6rrbu+NUHXUKcEf89oisQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Bv7U6qpPw/bOQ9Yj4klIhS5DdekcX0Bc4NM//zJx8ieCPcXS3OdTmAaA0fWLo4lJxnW6OiO1hYNHjuR0Opa4m1jW1NSB4hoOrjwu44b7TO57X+OwL70DrEb8LGfEwp/ZT0c+Q8Bb4GRfn8r2+kC9QVKTkRdFJhXTgb00WsvsOEcUVi500Dh67ZYqKQpRRwUCuHiAJDz/L1wvVTMGakcYKDG0qxsJD5DEqaBI43P86FP6B5ZSha3Fe4kGVNqDbfSrHbuvP0oPcnpTj1Y33Yy1JKkRlXMUGgqtZmVF138Vz9AN5s/F/nZ/jiiygAI8gf5NQ/rFGIsuxXjX+JCDT6QZhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SIgW9VY2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SIgW9VY2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHp1p2R3Fz2xnM
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 16:29:16 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e077a4b8c0so3777906a91.1
        for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2024 23:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764153; x=1728368953; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYuuvZ+ipGa30qTfy2WMGB6rrbu+NUHXUKcEf89oisQ=;
        b=SIgW9VY2RExTzPvhboWW+5g7VOtaQnG3muTo/iFN98A4e7CVZxRNUG078Y/68BDy5H
         hDjxIgYau0iVeIgx8LsoK4wfyb3reI6iVL7Z1HoOaNBRmPJmdCfs1yg2VID/mEz2lrGQ
         yK5yUad4wxGZyTaZndw/3FaJlrHOSr2WjYXYUGDV9en/sPLASOkENXMoatLE8IqIUDHs
         sEA482tmEaC/VYJkZV7KfP6oB9WH6hvz3T1Ha9/VqObw7jnQg9ZhBOZkbzXIW79yvpuX
         AY84wRhUWDbm1NBGuaG7zT4fNG4Qgj3hAB/tBoqFoMDr1lFQW5PjG5gEjh/eN2+Fo+kv
         QOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764153; x=1728368953;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYuuvZ+ipGa30qTfy2WMGB6rrbu+NUHXUKcEf89oisQ=;
        b=UdnKCqU4rgJxll0AfV9vmfEBPxP7wUtvRPkla+e4mQW7J9SG3T3Xw6P26R1wVzFKPr
         7xXG0ObFtL/do/MsG9RqK5wjmXhFWJQtKsmjqDCiniijOha01E3UPtCRmF0L7KQYM1TT
         favQo1kJODi2li/AFBflVKHXoFQFzPt/ZopuRupLf2BFfRKMSx4hr6vOLFNY6hcmHP+A
         nvJyT5EIjBymR13ArWpQhIewKij/h8dtDv7dPiUCU5awWzhVZgdWbAmRQt6H4R061wfL
         VIoBUzEBjYdd/UdLPiXZwJLj9zK8I2d4ALlOra6QGpxO84LowsFByNy7ydwWVXUeSS+C
         ZfRA==
X-Gm-Message-State: AOJu0YyywUyF5AVrx2XK8VAPzF0q3DzhZUoRQhGXuFU5sSdxXy5Pb0xB
	qji6Q/Gc3TI7116U6M9plYyeDZ99BHd6eOOh3A4UqSGbhlEgZTE=
X-Google-Smtp-Source: AGHT+IEOZHtfxpvKHDCmKrIxF+xoxOJJyAbKzGs+AqYFUj0RoA43o5UzzvbHQEaj8y7GN+3zIFmhFA==
X-Received: by 2002:a17:90a:fd8c:b0:2c9:36bf:ba6f with SMTP id 98e67ed59e1d1-2e15a1b6980mr3138039a91.3.1727764153255;
        Mon, 30 Sep 2024 23:29:13 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6c4c1e3sm9217053a91.10.2024.09.30.23.29.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:12 -0700 (PDT)
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
Subject: [PATCH v5 0/6] i2c: npcm: read/write operation, checkpatch
Date: Tue,  1 Oct 2024 14:28:49 +0800
Message-Id: <20241001062855.6928-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
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
- Andi Shyti : https://lore.kernel.org/lkml/5mxsciw6443k5rlpymrs7addvme
  53f5v3zuj5u7tvlggfeirik@dy2bvyz2lyue/
- Andi Shyti : https://lore.kernel.org/lkml/z4g5alkk3cug7v5bsmrmzspgvo4
  hhu2ebtykht72ewwhsqxqgq@kg2tlpvz3ctp/
- Andy Shevchenko : https://lore.kernel.org/lkml/Zu2HmkagbpMf_CNE@smile
  .fi.intel.com/

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

Tyrone Ting (5):
  i2c: npcm: correct the read/write operation procedure
  i2c: npcm: use a software flag to indicate a BER condition
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Modify the client address assignment
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 440 ++++++++++++++++++++++++-------
 1 file changed, 338 insertions(+), 102 deletions(-)


base-commit: f56f4ba2fc1dbefd3242946f2fad35338a60e3bc
-- 
2.34.1

