Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F687BB4BA
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 12:04:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VbnpjZin;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S23tM2dM7z3cnK
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 21:04:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VbnpjZin;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S23rR2thBz3c9c;
	Fri,  6 Oct 2023 21:02:30 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c1854bebf5so23533751fa.1;
        Fri, 06 Oct 2023 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696586541; x=1697191341; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ktL+I01NTaZsZ6v/JRIqW6LdHu2rTqqgaRhir8MBsc=;
        b=VbnpjZinD8Tql6MVtwke37OSKI1Za5vxBWlnwWNbX6PVZXGU9ruRqJPoVHC3+fGqHe
         85gZ9yRT9LUWkpI/PTsDBQVxQX/FfiU1aWVCpC4ouM+BkiCQT4BR7MYIm1NsMOyVGOwX
         9xDeaf9yWLgNRY8ZTBzAucHzMOh8gDwulXsgkIm7RdNJotQluvCoQcQTXq1C9Z5bkIz7
         wsA2sHxnDH1fA4GsC6hcce5/sQCxTekQtYl5Z2eSgofVmCWhCxN30yOv08oxTHxABKAc
         MtQcwCCrfavJRR5Ej3buOzuOGVJ+bGTn30pDmYDMzHTjTz6JMupptW0rGdndoL4lkarX
         gpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696586541; x=1697191341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ktL+I01NTaZsZ6v/JRIqW6LdHu2rTqqgaRhir8MBsc=;
        b=k8NQLRvTzy0AOIBKBMoznNqo6MoAKJUqj7SA3HBq9BcESqVajokQfWR5WcyMvN6Hl2
         rOEydposTYf/YhMU3rLaBeFDdx/RfNT++y8zllFqn/gpVrZUAlxoMmhp2s1PcEUR+mpx
         APPF/2a2r5v8ql3uWHxsHf9SwduXeZgpfY8/qb9vMlj1zev0OBTV2h7gU1pXhqRpHJ3j
         mj/r+TRmS/kwE9DDMmNKBuWEt+0rS3by/YflcspUBDM+ICSWj3Dny+NcZ65Qyx+uOQwB
         Ko81T8j8BNrqTvuma3bGyVbjUApVgeCpTFiYlWF709UgEjeoNYN/qbXstn8i97Tm8qNu
         RTKw==
X-Gm-Message-State: AOJu0YwtDcfhqm+0X/URjbF8SIoN+/HSalR+FmEWcs/tOlSNjxQSZjlG
	djazn1n+wFbmEAXqmU8b/n0=
X-Google-Smtp-Source: AGHT+IHaRqD4DeoB0LFomJ3p3asSCL0QydjpRcHT/wndYgqlLfX//Z7aKLjPnDZygv7OoEPADcdwSQ==
X-Received: by 2002:a2e:9053:0:b0:2c0:3284:64d5 with SMTP id n19-20020a2e9053000000b002c0328464d5mr5922469ljg.47.1696586541184;
        Fri, 06 Oct 2023 03:02:21 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id x12-20020a2e9dcc000000b002bcedacd726sm713674ljj.25.2023.10.06.03.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 03:02:20 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH v4 0/3] Add MCTP-over-KCS transport binding
Date: Fri,  6 Oct 2023 13:02:11 +0300
Message-Id: <20231006100214.396-1-aladyshev22@gmail.com>
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

