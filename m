Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CA67B1C85
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 14:34:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IcBNUsXc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxCbK61c4z3cc8
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 22:34:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IcBNUsXc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxCWB68WPz30MY;
	Thu, 28 Sep 2023 22:30:45 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50435a9f800so19774715e87.2;
        Thu, 28 Sep 2023 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695904236; x=1696509036; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gm1ISeW+idItfKS/eOu6/qm0WSJn6LCWGU5CplrSsM=;
        b=IcBNUsXcWxtNN+Y60nx0en7RGIKEgULIxJIodGDhmTUXCLvEAU+0PuNRvzwKTUi8sn
         3cHLUlVQAwNZqiyB0JHuTtkvuBnqrrK4wXXpXWYCVXKHlL86h1OxiAXwE6W+SHu4nWNR
         GA8HDJoLuJ+BUqCcnOgJThhECt2BmkE6ZOISq1rzONW9Pp4J5FsaYgdwbw0OsjzBegRF
         Io29/3Ei2O3YHCbX9s5Z3FKUQ4bg2da632bfZM763eyP660Fyr6AuykFDNJM60GpAmL/
         Gy4waqZv3Q8IJs+2PNK9MmeVHLrXkNh6IRxcfj5plc2dcA14ugqtY18RTK0u0ZEAaVR5
         GdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695904236; x=1696509036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Gm1ISeW+idItfKS/eOu6/qm0WSJn6LCWGU5CplrSsM=;
        b=gyOvTJQ9MS9ybs/O+vZfzzWKrI/k2rLua080ok3Q3EIn1kc7icgl6WhI5TIoKP8xeb
         yPZMoFNsCAEndJKQXy3ak7wPpxPwjiCEweFNdXQgHfTRE1jV3AQemUB6+/AuoXHOsv9M
         3JLQ/c7sg29bweN9A6DZVPYYOr+jlZ9rzeSQEedQ6O53r8r5JdEcGaWcSsd9779mhwAe
         M3HjF6M6CWAQBjqPxtQPpirRijMelm7+v7whalT0wl+/JRl2oi+Oz/i+GbuHBi+hhne3
         /HSYUjYpX2m145m4CALKz1eshXDfILbf/8CHvxZb1SM2PemxmpuSRQ/NVy6seW+ixQXK
         RwJQ==
X-Gm-Message-State: AOJu0YzMvH7msYQ0Uvhi7LNJr+Mdzd5l6GSS2PYubep+7GU4GeHClYYJ
	YodlkGZ9aJncN5rL8iW5XQs=
X-Google-Smtp-Source: AGHT+IELWBzD5+DshFb82aU+91c6MxU621XWEWP2vB5rQd9UYeEMJrPISaje63D4gQs+E+MgoEPD8w==
X-Received: by 2002:a2e:2c16:0:b0:2bf:ff17:811e with SMTP id s22-20020a2e2c16000000b002bfff17811emr1044718ljs.14.1695904235857;
        Thu, 28 Sep 2023 05:30:35 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id x6-20020a2e9c86000000b002ba045496d0sm3588724lji.125.2023.09.28.05.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 05:30:35 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH 0/3] Add MCTP-over-KCS transport binding
Date: Thu, 28 Sep 2023 15:30:06 +0300
Message-Id: <20230928123009.2913-1-aladyshev22@gmail.com>
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

Konstantin Aladyshev (3):
  ipmi: Move KCS headers to common include folder
  ipmi: Create header with KCS interface defines
  mctp: Add MCTP-over-KCS transport binding

 drivers/char/ipmi/kcs_bmc.c                   |   8 +-
 drivers/char/ipmi/kcs_bmc_aspeed.c            |   3 +-
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c         |  73 +-
 drivers/char/ipmi/kcs_bmc_npcm7xx.c           |   2 +-
 drivers/char/ipmi/kcs_bmc_serio.c             |   2 +-
 drivers/net/mctp/Kconfig                      |   8 +
 drivers/net/mctp/Makefile                     |   1 +
 drivers/net/mctp/mctp-kcs.c                   | 624 ++++++++++++++++++
 include/linux/ipmi_kcs.h                      |  80 +++
 .../char/ipmi => include/linux}/kcs_bmc.h     |   0
 .../ipmi => include/linux}/kcs_bmc_client.h   |   3 +-
 .../ipmi => include/linux}/kcs_bmc_device.h   |   3 +-
 12 files changed, 723 insertions(+), 84 deletions(-)
 create mode 100644 drivers/net/mctp/mctp-kcs.c
 create mode 100644 include/linux/ipmi_kcs.h
 rename {drivers/char/ipmi => include/linux}/kcs_bmc.h (100%)
 rename {drivers/char/ipmi => include/linux}/kcs_bmc_client.h (97%)
 rename {drivers/char/ipmi => include/linux}/kcs_bmc_device.h (96%)

-- 
2.25.1

