Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E817306888
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 01:22:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR1PT6M85zDr3L
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:22:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gbf6TJrg; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR1GC5xhmzDr43
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 11:15:47 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id l18so2934516pji.3
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 16:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k5FxfkQgJxX+Y+Mv01I55bzM0/UvvDUSkJ505ezrpIc=;
 b=gbf6TJrg7Uus6t01DAGNhqY0PnsrQTsnFsdJwPJY38LEf1SfXZB5fFEPYy/dDXAEt1
 0lt31tv8AYp0SGbyOvEYlfivaJDGvUSr6qLUgI3lkOJssxuPrElHQzKRGFttcmtEnV9G
 839gvzU1x8TEZj+szi+JnlYJFrYoSLfXyF+bQO8Z4JPigro2TtfLNK1HIAHPWSZjsmkk
 39cK3CPZzt63IpoKs96/BjFfjMgDiwLHFfFkUrvHCd1seFc307eBTsyt/LgLySgA7Cwy
 VEpDGBwj1cwmkR/fwwdFm4HqXli3r6T3PuE8w2Dr1d+q/2mq5WYSDzXioI9ZGftJlBDE
 QbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=k5FxfkQgJxX+Y+Mv01I55bzM0/UvvDUSkJ505ezrpIc=;
 b=EuUvUEWN/YOBBCcZe0d1ZGzpFmX3e2XCB2GpaG32r0iz9haTq+zIBssTa06PXsJqxg
 hfCKEZ3ZhAh4qVl2qKiwt7bCdcI8EegmFhFGQisWmmjoyplJSQL8d5fPYlGZwgfSe4+N
 VGk/2oACxTBFYrhcSRi74Z829bjUR+gf16gBgVoZKAt6NDEX5fkMVWiEouC6XwMJlRer
 KibvuS3lTE92fkMB2v5DsrXZpsrKhBs7u28OoJEAe/nTebl9deW08TutlMK9syIkB7p/
 zhJj8dRnAHOWgmbaFOXAwNiLhcRgNzi2IkeSy+Ez8MHRd+YD8vu8CfL971jVuARWsExf
 bnaw==
X-Gm-Message-State: AOAM532IyNsAp/lSRCBu0A35se5qhxfvoF3RGOM7G2ilLZb5Xq3UzLLK
 l4jNoHf3SPjW0pvj9r72oIy9G0/PCP0=
X-Google-Smtp-Source: ABdhPJy9NpAC6aiZEQ6InZb1WxocRtmSk3R6tniajjQ+ZvvGT98+BtICQOCqW9U2LAIv3j0weY8Ujg==
X-Received: by 2002:a17:90a:c82:: with SMTP id
 v2mr8303842pja.171.1611792944304; 
 Wed, 27 Jan 2021 16:15:44 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x19sm3529239pff.192.2021.01.27.16.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:15:43 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 4/4] config: ast2600: Enable
 FIT signature verification
Date: Thu, 28 Jan 2021 10:45:20 +1030
Message-Id: <20210128001521.266883-5-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128001521.266883-1-joel@jms.id.au>
References: <20210128001521.266883-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This turns on FIT signature verification for the OpenBMC SPL
configuration, for both the SPL and u-boot.

This enables rsa and sha algorithms for verifying the signature of the
u-boot FIT when loading it.

FIT_IMAGE_TINY is selected to save approx 3KB from the image size.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: Move SPL_FIT_IMAGE_TINY to this patch
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 26e8790cef87..6daf6343478b 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -36,6 +36,9 @@ CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 CONFIG_ARMV7_PSCI_NR_CPUS=2
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
+CONFIG_FIT_SIGNATURE=y
+CONFIG_SPL_FIT_SIGNATURE=y
+CONFIG_SPL_LOAD_FIT=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS4,115200n8 root=/dev/ram rw"
 CONFIG_USE_BOOTCOMMAND=y
@@ -49,6 +52,7 @@ CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_STACK_R=y
 CONFIG_SPL_SEPARATE_BSS=y
+CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_DM_RESET=y
 CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_RAM_DEVICE=y
-- 
2.29.2

