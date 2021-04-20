Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 113CB365297
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:51:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ9818Pyz30J6
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:51:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HCOvZX1Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HCOvZX1Z; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ4V4kljz2yjP
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:38 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id nk8so6144876pjb.3
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r2qgXcm5Nm9VhyyOpaw0iZoKbO2o7HPupBvQqxgTZzc=;
 b=HCOvZX1Z1yeDZBdBRBnLKGUC5GGUoZZQkQVyObgThua5BEYlW7VjCU+9dvb6BabCwR
 rGtcCPJehJDOoH7HVHxE12HlruqlRgL54xb5dyC2Tsc6EdALGkBXQhlDjIcG45+prLPF
 Y6V+xf2yJAqSSXpESeTwjPMwgrXZdr+lyeIuTjo1ikM64LXwdcHTKq16s8m6X1T3Nq3M
 4x6Zwa3uoSxRcApyS1nqoQHY1TBYuGidwoo9pjBRaBur//2AaLI+ft2inzQi6Jq6b+yN
 GyaDLnAnT7GY4U/mufBKWGlQLW7RrcglrPCSGYffQtgfVw1qaWyZrZ1xxs4VM8LhR+Ei
 tlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r2qgXcm5Nm9VhyyOpaw0iZoKbO2o7HPupBvQqxgTZzc=;
 b=mn6nMF2MBvA8CnBzRViJ7N/VnWj1XHw6oHIcboY6f2K3T+wqF0KbPx+hR6oEXMswUq
 s7eBpuvCdhjBubn4LdZk3agUvfEdRIvKR93hoIZbKzMIts8t7EC8Tdyi8GUNYlGv8fRL
 ebGo2sN873Cnrtj8pAyAvk2yayfQT5eTweXguYeoe+M6nBjRxVIN7Wm6zf8om67r8DqV
 gkozhg6kJngYFwEPMDn2/rMCLkzGhLDg//05Ep6yIgQt82sB/ChH6RFcaQ6ctL/bnMiI
 XSo4ui8KNu+IsHvaaY8mxhPsyVxyLpFEl6QtLbrYt5rZPBxRuZeBRiHPCeY0vuSi0Ct4
 YpkA==
X-Gm-Message-State: AOAM530Sj+wNgXP5GQ22HRDb2jafBtG3bwkHyO8VV/oVIJ/D6cGPcUwv
 d7qk+X+cYez2ZQHAJZRS3FlYCTnOmB8=
X-Google-Smtp-Source: ABdhPJyFOJYqx8m1vqKIcsivthq52EhkP5da26WhAEx/QUIMzWxa73Z3ovxa3GZjHKbtvSmNEtPgLA==
X-Received: by 2002:a17:90a:fc90:: with SMTP id
 ci16mr123618pjb.8.1618901255566; 
 Mon, 19 Apr 2021 23:47:35 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:34 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 10/10] config: ast2600:
 Disable SPL raw image support
Date: Tue, 20 Apr 2021 16:16:48 +0930
Message-Id: <20210420064648.994075-11-joel@jms.id.au>
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

The only way to load u-boot will be as part FIT, so secure boot cannot
be bypassed.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 195c03d274f9..f72c77cd7541 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -39,6 +39,7 @@ CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_ARCH_EARLY_INIT_R=y
 CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_SPL_BOARD_INIT=y
+# CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
 # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_STACK_R=y
-- 
2.30.2

