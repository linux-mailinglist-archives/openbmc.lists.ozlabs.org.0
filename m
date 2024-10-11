Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D951999C48
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 07:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPwl26yLPz3cSL
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 16:52:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728625964;
	cv=none; b=Q7ogMlUFIS0QO2roKS+LBmdGkFud5YF3h04jb16AJu7oRZ96Chjk2ubKrht9bugG6NO51HneuLV8FlKzevJ/byufF7F0S+Oq+JKChftKZYxYFKybf/gfFfmr3VSsmPV8VQdBN9rfh6qqnInx4ww1mZ21UuPqE7CprJNckqI7ZXhaycq42VlP9yCcygBjUhzmbrg8RUaL99nSVKuQIg87KpERg/141omFzB3H+wAMgXjO9ar8E1OsXkghMWW5Cq+uIlXJWnnHPJI7a/YIfia4scKmPcKmlGBLW2Be6a5UDDEfTvszWhAnohyS+pJDzvIkAAvmyFAGhAaNsihoaocVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728625964; c=relaxed/relaxed;
	bh=gubUx7YA3XH8B/MVDP0X02w0r61djF5HDUMcLAKhgk8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=PY0pcKQe78ZeZ7sFt3OxHHIH18Y7B7lYsO4KkHbLjPrT6C206WA88DyC7UBwR0Gl824XTSpOwP+9qY7Fq2Lrb75fvZkHg3fb45RA9sissgr4QDswKJDyFA8X4whPpEEGOQVRVthd2LZ6Ogeck2t145L6cqX5tB1G/xOM13yUwXyw3bSedRiLfqca8LNh+0/6RcJFDEcRMbsBuVrycI1BgJoHOdHevuIeEfLoQXA1OMGSCMhzKTOuQPILwWAeSm/kpvi6uesSiCHmnDSd7taCx3O4LJbc3aE/0aQSOLOXf51JfDloPw1yUtLFWMq3JWbriL8Y+PqD1Ikxb/3ua++PGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E0HktyhR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E0HktyhR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPwkz14dYz3bl7
	for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2024 16:52:42 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7e9f955cb97so950045a12.3
        for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2024 22:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728625958; x=1729230758; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gubUx7YA3XH8B/MVDP0X02w0r61djF5HDUMcLAKhgk8=;
        b=E0HktyhRuValmbzuglpbFGgS7pmyHK10p6/vadPmDGGXLWjJRz8KitTyP3YjqLzjLi
         mvdQxLXEscQV0ZQe1WnYOMCRSNmPz463qOD36I+L4nePTm7Ez0bYkuPL//qs47tNl8cR
         e2FBM2qrL+FQK56l5w8vgyJmJdKA8UIfaG3d3bdio1dGLpR8t5SeeD8+XGAj6bSQnRPk
         ICm/oCgvluQwQv2mztJRx8YwdyHa+T/jAfIoYm/1CGHI349PpRDdu7tB+NBLOsXOndFx
         kjM7DvloL4TUKmj+Lz/OqV+vSmvLfZEhWCCPW6YfBe5wjiEmtn8Ml3DMdbOKXW4mGQ6e
         sNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728625958; x=1729230758;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gubUx7YA3XH8B/MVDP0X02w0r61djF5HDUMcLAKhgk8=;
        b=IZXE2ryalsd/tfxmsVNL/3cpbByBfEL7TY8nB3jWmUzXhOvutG+OV2LWumfTwO6tOp
         kO5Ck7EvJ2Ws2NwXkRNuevgY+KzGaNqfTeLXIeSw9eC5JdOw/X40zDL8Yib3RvLSma2K
         U35DTEDijvVQyW1ZpH54tO8LEaZVsp7PTPJQnxzQ4h5wiDvtlVJnMavfB8B7EI5oWQpm
         fyBcindBkaG8hIDxP7Vfg1m20KKgLz238tJ6ox5QqQfLmxYcdwgGqANBn66HyWKLtzMP
         4H7wAZtGcAG9aoO7dKcc2B7RwePGI32w7ztAXOpiGYLzz6GFvuXdN8ac2SFFanAvHhwa
         orCg==
X-Gm-Message-State: AOJu0Yx+3SalnakZEAKmyegVBjHUmbBndJXtnDT8kOcQ/DMnVqkm00w6
	eZkwmmYiGWd3BGAXm6LX9Ai25xdZxiV7yKbUzagX3yW/RCgGCn0=
X-Google-Smtp-Source: AGHT+IFuXKSQzE3D4FXgPcQs86Ev89IWF58UUbrUTDSMyHazV9CkFfv59ZyhCE0poiLdoE+ciM2C+Q==
X-Received: by 2002:a05:6a21:6e4a:b0:1d8:a9c0:8853 with SMTP id adf61e73a8af0-1d8bcf3bd6amr2724825637.23.1728625958472;
        Thu, 10 Oct 2024 22:52:38 -0700 (PDT)
Received: from localhost (2001-b400-e38a-6880-f424-8486-7476-9f9d.emome-ip6.hinet.net. [2001:b400:e38a:6880:f424:8486:7476:9f9d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea44967269sm1915371a12.81.2024.10.10.22.52.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 22:52:37 -0700 (PDT)
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
Subject: [PATCH v6 0/4] i2c: npcm: read/write operation, checkpatch
Date: Fri, 11 Oct 2024 13:52:27 +0800
Message-Id: <20241011055231.9826-1-kfting@nuvoton.com>
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
- Andy Shevchenko : https://lore.kernel.org/lkml/CACD3sJYhAYV3zBse5ntF
  sQmLV+TpLKtOiyyqgp3g8qeja54Ejw@mail.gmail.com/
- Andy Shevchenko : https://lore.kernel.org/lkml/ZwVcGu3YeJ6pI0sM
  @black.fi.intel.com/
- Andy Shevchenko : https://lore.kernel.org/lkml/Zvv3ws1_jUMVnAAJ
  @smile.fi.intel.com/

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

 drivers/i2c/busses/i2c-npcm7xx.c | 428 ++++++++++++++++++++++++-------
 1 file changed, 332 insertions(+), 96 deletions(-)


base-commit: 663bff1ddfe4ecbba3bcf4a74646bb388b1ad5b2
-- 
2.34.1

