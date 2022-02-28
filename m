Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A0A4C64C2
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 09:20:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6YG91hYWz30hm
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 19:20:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hiix7GNo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=hiix7GNo; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6YFk51Kmz2x9F
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 19:19:35 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id e13so10062398plh.3
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 00:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=avM5MQ2+s1AvxtF6lx3xO/DH4BBngvyst+T/ivfnfxQ=;
 b=hiix7GNoRnwM4hDqJ+0hoqekavRZA9PR2zQkWiuS0OTqQC8Nx2DR16WgVpsobDQCqS
 keaOWeT4TpttKR0sPfY59aigLbeP2e65zzaSEqbf9rbK+DlRY2jFilkWcDEM+5ALh3Yd
 zAcFMxFyIqYZAGHNvFRZJlLFA+S63vunfo7/cr9J95xJgKfGI4qc8PwwZ0+8tZF0kW1K
 gaUGQUbCLLKPq7SbX48lIFprXeQAijniqS8WboEI3eQj/BuihIzYa4Ui6nrUkkmr7NFs
 48qGIE1cOON1+p1b1dDvkdV/mRFaaf+keBv01jLo3h8xc/UNd11O8QZXOMuBNJFvKZ62
 tdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=avM5MQ2+s1AvxtF6lx3xO/DH4BBngvyst+T/ivfnfxQ=;
 b=YPs0LcMY8P286tT+ST3bz+lTXb5BDYH+rSjHhLpnVmM0VmkLgJLEaWNcDa4SL1DYLX
 qXpYDpREqHMDW6Z+SsQHFAyDwAQhRgyKRpzOu7u79lTYZ5r1NnTrDdRfhK6VZKz5k8xB
 QXlQahaJw5YVdf8V/KWzNA5G7VcV5/6GwKT27YQ1xulDF5FGZlwaKo5nK1zGmWLaktWB
 pfcW0QPCie3AY0ZBlRweK8GDjxwoQWrkLvedgyPAbcPFEJc3jnw07RHAS8SMkzmbqUjZ
 8RDHs+ZVjzrKcY/0sRj2kbuCcFpOD12/NWnRvUrvgB3BCzqbCAXFXM0nCaLA6ehnRzMg
 VXaA==
X-Gm-Message-State: AOAM532Tmdth4ms934mtcggPHEbvIo/nd6ufDviqYiROdmZnEtaDD+7M
 nMBLNAGAqL/U3nJmGADYe/RshfvfgWIi5ND9
X-Google-Smtp-Source: ABdhPJz2JSWGnl8h4kYJ8sJFQsAR10sNZ0qXtUWLgRXbPoCfe0oNo9v9GEF8mxpJwGimFZsM0Kzm3w==
X-Received: by 2002:a17:902:ea12:b0:151:58b1:e5be with SMTP id
 s18-20020a170902ea1200b0015158b1e5bemr7567233plg.149.1646036371395; 
 Mon, 28 Feb 2022 00:19:31 -0800 (PST)
Received: from localhost ([49.7.45.40]) by smtp.gmail.com with ESMTPSA id
 r19-20020a17090aa09300b001bc5fb5886asm16188324pjp.5.2022.02.28.00.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 00:19:31 -0800 (PST)
From: Lei YU <yulei.sh@bytedance.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] Revert "configs: disable
 dcache on ast2500 evb"
Date: Mon, 28 Feb 2022 16:19:09 +0800
Message-Id: <20220228081909.2525176-1-yulei.sh@bytedance.com>
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

Disabling DCACHE on ast2500 causes significant performance drop and it
gets watchdog timeout during normal boot.

Revert the commit to make it behave normal as before.
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

