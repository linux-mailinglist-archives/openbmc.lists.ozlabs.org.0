Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AF7B6A03
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 15:15:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CDqpq7Zg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0JGw1bLzz3dxN
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 00:15:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CDqpq7Zg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0JGC5cjGz2ysD;
	Wed,  4 Oct 2023 00:15:15 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c16757987fso10848041fa.3;
        Tue, 03 Oct 2023 06:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696338911; x=1696943711; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3fi78NvQEfjOfWzfX4wAjQLrovVfB04wfletul8KM0=;
        b=CDqpq7ZgOwuEyzkxHE9ZwdGledkHNvjbVQCEKABp8nv+vrLIqyZWeGMOOqsrxfsqPx
         +xYmigNiAsutErQWrODKHFhDLmGkT8lYpPoszWQYKFZ3zZkGhcXRy3LUs1ORLpdFnX7Z
         LlLB9ld7I+XRsvPH7/f7VMUubkoxnckHPF6oTWyZiNiLqmJdeZyCQI9xxTcCK0Vx8a4k
         n5s5ZXzzqHaKxjaRHgLtHsPIavel0Ri0l4ljIYilDa9LYTWz+mkQwGT58bH96qOwScok
         cXZjFrkyaXJTJnLHdxo71uWMMfxwlwSVU3sj9XAp3rDa1hB7SVteJnYu1u9CBGVSSdta
         pPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696338911; x=1696943711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3fi78NvQEfjOfWzfX4wAjQLrovVfB04wfletul8KM0=;
        b=SWxSGtAZg6JFM+OMMViuwR+g+l0534/PkQdonwEevpQn3OdcD/ARF9vuQpUbiuo9K4
         Sbrf4PxRshQ5hbo+dAXWD1DrBWAQSR00n/IVWUV/NFOYua9ED8Aiey4nqzq3hmH9q+gg
         JTUE6XK2Bo7VmuwVUmMVSuJRhAC7fECIhZlX9gApOxbZmE7uEshw4kT/r8dtbTr3hP6y
         VS4N7NeUq+VfAkWImZdDnvXCWHbCZoZbzhuYu/fDz3SBXyTBHnOHtg+eapNJEJS6mbD6
         XRaTVeBZzgy+lKkBXQGtsOnu/OyyTMJ/CbkZcuigkjWBK/zuvSM+uIaacmcnz92DaXLI
         6wrw==
X-Gm-Message-State: AOJu0YwWvzuPgkhkWVeao4RcVkIkiQiOvNX9eo9ybt0YAprHNd5qLioz
	h9/zzk5RXJ0VPBuy/z9ZwlA=
X-Google-Smtp-Source: AGHT+IGtOe4J8GfD2HhulRf4hZgg+Q4XRQ/Bo4dVYtzPaSqmA5wmNUiaHv9t6UFcrUVi5fzVNQWg5w==
X-Received: by 2002:a2e:3a07:0:b0:2c0:ff6:984a with SMTP id h7-20020a2e3a07000000b002c00ff6984amr11636722lja.50.1696338909804;
        Tue, 03 Oct 2023 06:15:09 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id t25-20020a2e7819000000b002b9de06f119sm228657ljc.67.2023.10.03.06.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 06:15:09 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH v3 0/3] Add MCTP-over-KCS transport binding
Date: Tue,  3 Oct 2023 16:15:02 +0300
Message-Id: <20231003131505.337-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: tmaimon77@gmail.com, linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com, edumazet@google.com, jk@codeconstruct.com.au, matt@codeconstruct.com.au, benjaminfair@google.com, openbmc@lists.ozlabs.org, joel@jms.id.au, kuba@kernel.org, pabeni@redhat.com, minyard@acm.org, aladyshev22@gmail.com, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com, linux-kernel@vger.kernel.org, avifishman70@gmail.com, netdev@vger.kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This change adds a MCTP KCS transport binding, as defined by the DMTF
specificiation DSP0254 - "MCTP KCS Transport Binding".
A MCTP protocol network device is created for each KCS channel found in
the system.
The interrupt code for the KCS state machine is based on the current
IPMI KCS driver.
Since the KCS subsystem code is now used both in IPMI and MCTP drivers
the separate patchsets move KCS subsystem includes to a common folder.

Tested:
PLDM communication between the HOST and BMC was tested with both
components implemented via open-source software:
- The HOST (UEFI firmware) part was based one the edk2 [1] and
edk2-platforms [2] code,
- The BMC part was based on the openbmc [3] distribution.

The testing process and all the necessary utilities are described in
the [4] repository.

[1]: https://github.com/tianocore/edk2
[2]: https://github.com/tianocore/edk2-platforms
[3]: https://github.com/openbmc/openbmc
[4]: https://github.com/Kostr/PLDM

Changes v2 -> v3:
 - use 'dev_err_probe' correctly

Changes v1 -> v2:
 - correct warning found by kernel test robot
 - use 'i2c_smbus_pec' library function for PEC calculation
 - several code style corrections based on Jonathan Cameron comments
Original patchset can be found here:
https://lwn.net/ml/linux-kernel/20230928123009.2913-1-aladyshev22@gmail.com/

Konstantin Aladyshev (3):
  ipmi: Move KCS headers to common include folder
  ipmi: Create header with KCS interface defines
  mctp: Add MCTP-over-KCS transport binding

 drivers/char/ipmi/kcs_bmc.c                   |   8 +-
 drivers/char/ipmi/kcs_bmc_aspeed.c            |   3 +-
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c         |  73 +--
 drivers/char/ipmi/kcs_bmc_npcm7xx.c           |   2 +-
 drivers/char/ipmi/kcs_bmc_serio.c             |   2 +-
 drivers/net/mctp/Kconfig                      |   8 +
 drivers/net/mctp/Makefile                     |   1 +
 drivers/net/mctp/mctp-kcs.c                   | 594 ++++++++++++++++++
 include/linux/ipmi_kcs.h                      |  80 +++
 .../char/ipmi => include/linux}/kcs_bmc.h     |   0
 .../ipmi => include/linux}/kcs_bmc_client.h   |   3 +-
 .../ipmi => include/linux}/kcs_bmc_device.h   |   3 +-
 12 files changed, 693 insertions(+), 84 deletions(-)
 create mode 100644 drivers/net/mctp/mctp-kcs.c
 create mode 100644 include/linux/ipmi_kcs.h
 rename {drivers/char/ipmi => include/linux}/kcs_bmc.h (100%)
 rename {drivers/char/ipmi => include/linux}/kcs_bmc_client.h (97%)
 rename {drivers/char/ipmi => include/linux}/kcs_bmc_device.h (96%)

-- 
2.25.1

