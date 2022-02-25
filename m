Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C64C4466
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:14:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4pcL0bhwz3bZf
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 23:14:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=JM5/WiYN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=JM5/WiYN; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4pbt74tbz3bSh
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 23:14:15 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 m13-20020a17090aab0d00b001bbe267d4d1so7596570pjq.0
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 04:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K9p7qgAiEgXJzEVRUriFuDmlOHMm2fyb6frFyTSJJDc=;
 b=JM5/WiYNJoAEmKN74mh2mNpEGESr7uOHRp+AzKrtyr/t8QYtnZ/PH+6sxqlcMXmTZ/
 dO2uiTKDr+uGk+FQkXqMV8cxCFy4rn6GlW/l2xfo/DPuiAIiyedzjHqcj6Ahor4Hq7FW
 Zos5Wjc0bUqiOCpAfw97zt7Hi205GZH8W0TsBYGnCNCWzRf/VieLNC12KaZFervFHqLi
 6j0yg3uqptHSbdIDELFkpSsO3LL1L1MIzlarPzejc0ug0dQafY4cHi6ryEdRCrrATew5
 lKNSdsxHoZ5pbVHepsw1GYrMILeW4JsYZF3+REquTs32j2zKkwuZKlleqJ9TxMI966UB
 2JZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K9p7qgAiEgXJzEVRUriFuDmlOHMm2fyb6frFyTSJJDc=;
 b=5muuP44Q7QLxaq5NbwfSilGjN90WQrL39GgKWM3peLo+JWGURtJW6RrmjlOj5q0ds8
 aZuoXYvsvVzHjaYOCfcsQ63ktLG0ZLiNl46ffnlO1Rzt3Se84Mgk00isq2nw8ctlZLWM
 CigTb5ZX+zogOCgGQBO8KWfvVIsbD3h8mrDvpkyhYL6tG3O6MrOPYfRqwx7Hp9oE8V8D
 hXM65IUqrG0gslnVcIC3arnt1AG6L0QDQkz8Zyy4PX2Q4jG5fUkRylPUz8xcDgnfy5OG
 5RP2xQoSA527Avu7C18lrjR71aIxky3i12iIZxr6qJYZ7D9M/f9+WFEXvNX6Sf2WckMh
 yF6g==
X-Gm-Message-State: AOAM5338ApGAx3jFer/HXLQdR/cDq5odsR0Xjgyg9TfN3I5JCW6fqtsz
 s+l/m0hqGdoZAlaw7guxFbZUWIUh2xF4wq+C
X-Google-Smtp-Source: ABdhPJxaMy1GGbbIua/YZPfpLdVIfFO4QCQbKPBB/x7tGN2p3paCU/9bWF/cUPI5VICfxE73TcXVAQ==
X-Received: by 2002:a17:90a:a097:b0:1b9:5f0:6706 with SMTP id
 r23-20020a17090aa09700b001b905f06706mr2937882pjp.6.1645791252650; 
 Fri, 25 Feb 2022 04:14:12 -0800 (PST)
Received: from localhost ([49.7.45.214]) by smtp.gmail.com with ESMTPSA id
 r12-20020a63a54c000000b00376047bf784sm2534524pgu.23.2022.02.25.04.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 04:14:12 -0800 (PST)
From: Lei YU <yulei.sh@bytedance.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] Revert "configs: disable
 dcache on ast2500 evb"
Date: Fri, 25 Feb 2022 20:12:54 +0800
Message-Id: <20220225121254.2467104-1-yulei.sh@bytedance.com>
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
Cc: Lei YU <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This reverts commit c1bfa87b767b2dc532cedc00f561bf6433fe30c7.
---
 configs/evb-ast2500-spl_defconfig | 1 -
 configs/evb-ast2500_defconfig     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/evb-ast2500-spl_defconfig b/configs/evb-ast2500-spl_defconfig
index 0f6780b5e4..432bb5aed0 100644
--- a/configs/evb-ast2500-spl_defconfig
+++ b/configs/evb-ast2500-spl_defconfig
@@ -1,6 +1,5 @@
 CONFIG_ARM=y
 CONFIG_SYS_CONFIG_NAME="evb_ast2500_spl"
-CONFIG_SYS_DCACHE_OFF=y
 CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2500/u-boot-spl.lds"
 CONFIG_ARCH_ASPEED=y
 CONFIG_SYS_TEXT_BASE=0x10000
diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index 91921cf76e..540af0fcf0 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -1,5 +1,4 @@
 CONFIG_ARM=y
-CONFIG_SYS_DCACHE_OFF=y
 CONFIG_ARCH_ASPEED=y
 CONFIG_SYS_TEXT_BASE=0x0
 CONFIG_SYS_MALLOC_F_LEN=0x2000
-- 
2.25.1

