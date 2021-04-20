Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17C365294
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:51:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ8Q3jYFz309X
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:51:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=f5Id28/h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f5Id28/h; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ4R3X0nz3017
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:35 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id lt13so10451923pjb.1
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5KdQ7yx1WHlAuBiAcerGJ3CLQsY0N9nJX7fYnrWqZA4=;
 b=f5Id28/hqptVTEZEUXfYAKzZZjiaTyIQtPlY1dRzC2nS1EJRB5RGr61KAJO3SLS+RL
 I+x5fzCbY4KkuuR59//wed3dZ/GG5pidDeuqIlxTVm7YMQFt84evjyRVExe8VKea6meF
 2G0M+aeOfaaBK53XgIaavplRFrZ3GWcI++LvE4Z7MCDq7qI/BBJ/PtL/nTaA2Or/sj0+
 tzLhvAMUNav92Iuc+guL2krBoJkJDfLcd/6qBi/Hh6i08KLWwJXpOT4Ah6UkcEwJFJV4
 hMlN5wFHfQsyHEY+64E5JjvLoc9Y24sh3Zro3qfhWg1VeTm4lAA4R+l/Nl9+CTje8TuF
 UvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5KdQ7yx1WHlAuBiAcerGJ3CLQsY0N9nJX7fYnrWqZA4=;
 b=kdzpobgVnyvWboYImIDKkkAnsEran8xGPt2/bAawitll5rYw1f9NBFNgr+rkJQ+++W
 32kXvcx0i5XAEU+vDOM+NzlznzVxaj8UNkWkKwUKft0voPu0ba0MEAgQUKqBqzZfDmwt
 TQw+fHGtBwmJyMeUSZpRoJRZY/IjF/Wz5FfVgidtRkpBf6WYJNZdY46ZE11YD5AKjb/c
 37YL/Op99w8FncWzD06nh2Eut4kCxztXBQxvp/bYyH0C+GB26zviVMI5HPFcET7DpFOh
 FOnVVhJm5V3K36B1Qgyk5vvIyNUMTDENDOv77LF5Go4uA+hB0d9C3ubWBeNaz3sTK3ph
 YSvg==
X-Gm-Message-State: AOAM531GRVPLwDKZ67OVQKOksYICtYyzMbcOH3enOrZZX8h7LF1TL2YC
 UCmUs3+M8dlZfBtadnMt7ImRBTCJ2pM=
X-Google-Smtp-Source: ABdhPJz6X8mSv2g0iFTqkgmu6zxWsUWzpVH5x9wzHCvYGSkWxDp5b3i3agAfPumfduqsTmviZShOLg==
X-Received: by 2002:a17:902:e851:b029:eb:1fd0:fa8e with SMTP id
 t17-20020a170902e851b02900eb1fd0fa8emr27751858plg.38.1618901252446; 
 Mon, 19 Apr 2021 23:47:32 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:31 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 09/10] configs: ast2600:
 Enable FIT SHA512 support
Date: Tue, 20 Apr 2021 16:16:47 +0930
Message-Id: <20210420064648.994075-10-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420064648.994075-1-joel@jms.id.au>
References: <20210420064648.994075-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

OpenBMC systems intend to use SHA512 in the FIT images.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index b9190c70baa5..195c03d274f9 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -26,6 +26,7 @@ CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 CONFIG_ARMV7_PSCI_NR_CPUS=2
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
+CONFIG_FIT_ENABLE_SHA512_SUPPORT=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_SPL_FIT_SIGNATURE=y
 CONFIG_SPL_LOAD_FIT=y
@@ -44,6 +45,7 @@ CONFIG_SPL_STACK_R=y
 CONFIG_SPL_SEPARATE_BSS=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x80
+CONFIG_SPL_SHA512_SUPPORT=y
 CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_DM_RESET=y
 CONFIG_SPL_RAM_SUPPORT=y
-- 
2.30.2

