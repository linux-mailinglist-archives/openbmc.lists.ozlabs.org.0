Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 812129F77FA
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 10:09:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDPqw1G7cz3cG5
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 20:09:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734599352;
	cv=none; b=V6NrI4FjPrnDdL7FaupmqirCoVm8wKMEbaZlEL31LTz24UYwwYPtP3dua0wJRGLL3xVBcJ/CjrTffakSYCxZcRWDKV+E0LiFMUyWWCYqohXJQrD3qaxcTBmECAEMGNldURIax6OFnw9GlEt9ctU2kgJ4UWMPHy1XbEMIC7LgNp/Ahkokj12qtMFq6+B5/hYQ4tCTwxKjlGBC/Z2I38Isaz4WJ1G68T1JBOkHdSaGZhedxRHUdE+fSy485TdJ7a1fpPMf6ybmHvuXETwyGbwgiSS8mraepDkyrtalwKxh8AZeGBF0XBYMpYIRspUCYxDmWgyb4/EC+vUAAmJ6wqaCww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734599352; c=relaxed/relaxed;
	bh=5FZVo9yrFWm1ZHZhqCeWDgA1Bi74R8VjGoD/NF/vjQA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=GrAnioU5p57Cm6iKiM4c/+tJYikagbb5ivzUGuaTdfPhGY9NfjpC955Bh08bbgEi9KC78s/1/NG66f4+RjsghpX1eOQWIuMJRVPOH99Jx+r7LSQbm50RfTxjfKnTPW7yxNHiVJpJ4EO7DKjmeUonRi6klT6PA7PPTGAvS9qyHhMAx5kqIm/NosagdNg/xA57Os+PwGP4rvLTrRIS9bcWLkVwk4ZfwuLkXBM0KXTE2X4SSpA/hI4lAccuaVSmSR7tyPPmtXoPWVb70r5TW9hAPLkKH74ObdSF7O/ozXVshdIUqbLRU+p//gtd9JfBUQ1cKxnZZuOf5xQSYPD26ugL2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EZjq7rRs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EZjq7rRs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDPqq0bqrz2yGm
	for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 20:09:08 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7fc99fc2b16so266065a12.3
        for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2024 01:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599345; x=1735204145; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FZVo9yrFWm1ZHZhqCeWDgA1Bi74R8VjGoD/NF/vjQA=;
        b=EZjq7rRsAuRUMalbfgV/Rp992C8sSdFZ8CltaKr8Z64HDQCvGBY4QB3b5Sx89vg0t0
         zl1xe9/zapjE6xQVYBumMY+ZCVk6/zcdEh9yz2fDg80nnfEwdVuY58VEclq0/sS389ky
         37ltsXdO4HDJmyX3COIkgeXTYYOea9bxPOka+4OAmrisJ0Y++OSCRWKnbNytaXCrZ9l7
         IOSrLzL17svtpdlnhRnBR0jMJQR+WM8VXvZdqaDOmm7i//aMo6WTi3A4Llh37LwFvt/q
         wJuLUmU9xIkajij9/dfe8+IyRhy6GuqX26RRwNpMPzOolhHRoRPF9ZoTuPDnYqoe6c9z
         NkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599345; x=1735204145;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FZVo9yrFWm1ZHZhqCeWDgA1Bi74R8VjGoD/NF/vjQA=;
        b=Wyq+1CmaPQk+QN2Gwias+wYeEaHgO0GfoqYIzwWBHkv9NGhApd8kRvtyOUQ2JemkTg
         aDGqk39yE/HXZxghSb4kqPMwyzGExdeCu7iLLxSyTI3xKPnE0So4XIFcpXXXD2OfesNC
         II/aPzeSXveLlKVycpW7vKsKbyPg/Oc9SrYUW+UPwyqwCa2faepzwqAvyFaTSat3UokO
         frpvM6w7doG5hq2kHLG3Wr1gkj8VAWLs+7SALCR0AOX26axvugGSkWtlCapbfbj/MmjY
         +oE8Cn/NhK+qBHz6flui0muXNKLVEj4jD66wQmjeew2/gEKrGDBmVySC92CAcxn9nI+l
         Zigg==
X-Gm-Message-State: AOJu0Yyk0qmEV+dadzk68zlSqLC5qDTzNN5Mh4aiesVQX0FujcyoBfPh
	l44azeppgIVSWntzDalOQWDAqcMycM8OrWRuaCn592s06QDZfeU=
X-Gm-Gg: ASbGncs1pB1SDRhpRW8GYBVltqS/VRsmChFG0wZwS80f/YN9a6sjz3wZuUuzBjndf5a
	2GRPjhe1hq70mOz9UeGWffYshHtd6NIjq+eEnBzqbvyn8Pzly9zCSmRJemKfQyIHGXlkQEsAEo2
	PG9reY/5G7DrzmJFQdTVqrfjdcK9f5dDrojVCYu1ydAJk1JsZKC8p5PMJ1AyFCq2lTJoYdtlRoW
	wM5UbHPCbwMlDIq+MAd0mdNeyPAIo+1GtChkuEE/nsi3ILM+esFxIZ4q9GkyNLlgZgundO7Um4O
	pxhKCLq7PZEu1w9ECUj04WojK4ccb0UJoXESlzZIvFac3/Jy
X-Google-Smtp-Source: AGHT+IFwp2rwAf8SnTYio5mfU04YzPMAsVdxRwNoOKeATSvCJKQkxU5bEZG4Wd4iiq4j22tQcxPeTQ==
X-Received: by 2002:a17:90b:53d0:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f2e8f5e4b6mr9740495a91.0.1734599344759;
        Thu, 19 Dec 2024 01:09:04 -0800 (PST)
Received: from localhost (2001-b400-e356-b45b-f574-35d0-91d3-527b.emome-ip6.hinet.net. [2001:b400:e356:b45b:f574:35d0:91d3:527b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee06dcb0sm2787111a91.35.2024.12.19.01.09.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 01:09:04 -0800 (PST)
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
Subject: [PATCH v8 0/4] i2c: npcm: read/write operation, checkpatch
Date: Thu, 19 Dec 2024 17:08:55 +0800
Message-Id: <20241219090859.18722-1-kfting@nuvoton.com>
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
- Paul Menzel : https://lore.kernel.org/lkml/67d34216-e98b-43d9-afd1-
  2e73ffb71968@molgen.mpg.de/
- Andi Shyti : https://lore.kernel.org/lkml/cexpymszobfl7676acibp474e
  q3qx242ppo22wrbjepxhufkvt@w4ptnmfjx7yo/
- Tali Perry : https://lore.kernel.org/lkml/CAHb3i=uT+Zx8m4hAF1M2yjCn
  =a5sDBn2wJajWdCm79syuy97Ag@mail.gmail.com/

Changes since version 7:
- Modify the commit title for better description.
- Modify i2c address assignment.

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
  i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 427 +++++++++++++++++++++++--------
 1 file changed, 326 insertions(+), 101 deletions(-)


base-commit: 663bff1ddfe4ecbba3bcf4a74646bb388b1ad5b2
-- 
2.34.1

