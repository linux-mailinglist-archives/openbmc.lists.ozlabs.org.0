Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A77BFB49
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:25:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i0toWB4A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Zq42NJWz3vb8
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 23:25:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i0toWB4A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4ZnH6q3Hz3bx0;
	Tue, 10 Oct 2023 23:23:31 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c15463ddd4so63643231fa.3;
        Tue, 10 Oct 2023 05:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696940607; x=1697545407; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oPyRhYnTnlw7DtON8/f4uUVjXj+t1U+rNcjZ4jW1MJI=;
        b=i0toWB4AgJ0Kpn0s7cAOMan4axtC1QDpChogxkwLZzSApnqwCcgoJRuTiBkJYb8lUe
         siB9vPAq5Lg5TgXr1DMFktpzFf9yQTmBOHfO56LPb6HpQL5GgSqNoFjarvTMAfSQuJs1
         oE8KN8KSutusjSC2HIDJESPQX3hcxiL1YhzyupHkzc7nkUMchepaFZk5m2qHQ6iW+pDd
         1Bao9jjadNTX46l5OmeKYwYfjWZYN1zf9A8NTIKVy0v4jP9THoBrUPfW3i9y1vUyroph
         b9z3i+6Xkhgit+Tc7p/H+pWkoBILvJSkag2sLLbXC14pg9Jz27PC2WReMYaatTirhTMr
         DDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696940607; x=1697545407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPyRhYnTnlw7DtON8/f4uUVjXj+t1U+rNcjZ4jW1MJI=;
        b=Vx2vrsKTX3utK+s/F5yE9mLHL8iwAO0TF1sYtuYjfI0trU+laNk3e3yXFdQwu5B4w+
         x/M1A0Pu+8nRirCVZsTmz7eOEuJMvZ06G1iDBnMFLLGW1IPkDxF2Ylh12VSKZ4EvnQAy
         3Um8Lf7RytoKsgAEXnKRcuDgJSQaqwi3ZClRotsPYxOJY3Cj7K2DniaM4QYLqtZYF0iJ
         iONO/dePPNckL4/niT3wG7rwblxtCVKKkHA/jP3u8402TIId9Wibl2ONoPfLhbtVl8KF
         OdzdFeJ26VlJpGfzk/l+x5/tCKW7fANHtxKuF0/B0ti+fhq9S+Jc4WPH6VuFJOQHJuo3
         3K1Q==
X-Gm-Message-State: AOJu0YzoF14tWf33Bm13qH333oHfWOrvqBBTYOa3ShYiLtJ2/BG3TIrZ
	yBg38iSG9xhFnnTxS+1THN8=
X-Google-Smtp-Source: AGHT+IGxa/VzwMQyk/bDo1finjw3mICZD9B5q0yI+DRUIsS6DH1ij3P9b+SOtVsaRDdkt9gWV6j36w==
X-Received: by 2002:a2e:6e09:0:b0:2bc:e2bc:81ff with SMTP id j9-20020a2e6e09000000b002bce2bc81ffmr17213932ljc.51.1696940606426;
        Tue, 10 Oct 2023 05:23:26 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id g9-20020a2e9cc9000000b002b9e346a152sm2425638ljj.96.2023.10.10.05.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 05:23:25 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH v5 0/3] Add MCTP-over-KCS transport binding
Date: Tue, 10 Oct 2023 15:23:18 +0300
Message-Id: <20231010122321.823-1-aladyshev22@gmail.com>
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

Changes v4 -> v5:
 - correct spelling errors in description
 - check that rx data is big enough for binding structures
 - use unsigned int type for index and len variables
 - refactor mctp_kcs_rx_work() function
 - arrange local variables in reverse xmas tree order

Changes v3 -> v4:
 - drop 'inline' keyword

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
 drivers/net/mctp/mctp-kcs.c                   | 600 ++++++++++++++++++
 include/linux/ipmi_kcs.h                      |  80 +++
 .../char/ipmi => include/linux}/kcs_bmc.h     |   0
 .../ipmi => include/linux}/kcs_bmc_client.h   |   3 +-
 .../ipmi => include/linux}/kcs_bmc_device.h   |   3 +-
 12 files changed, 699 insertions(+), 84 deletions(-)
 create mode 100644 drivers/net/mctp/mctp-kcs.c
 create mode 100644 include/linux/ipmi_kcs.h
 rename {drivers/char/ipmi => include/linux}/kcs_bmc.h (100%)
 rename {drivers/char/ipmi => include/linux}/kcs_bmc_client.h (97%)
 rename {drivers/char/ipmi => include/linux}/kcs_bmc_device.h (96%)

-- 
2.25.1

