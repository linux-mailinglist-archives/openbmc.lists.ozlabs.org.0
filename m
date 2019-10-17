Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDD9DA470
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 05:57:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46twNC0j4tzDr84
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 14:57:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WZDy05U+"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46twMb3cfJzDqWq
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 14:56:43 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id e15so481685pgu.13
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 20:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0g/o3e/kUKWPYZw6CoTHvipyaQ/pSBnOSk+ADuLHrTY=;
 b=WZDy05U+IDuWlO0EVWOXohyxZjzxZ/qd8ZYVCw20LT8C61LDfMfKgi00IC2Vb7v0SE
 eFUdgSvwfuy0uR3ZwRls29XoHL/jYavfPEGsn640WS4zMTYoDoSpwPcrbN5N7BmkDmGg
 fws5TsgB5R2B8LMhL38IgFzBhsXVsQ5gLAq45EgeODf/cZDy5UDMx0ekYpB3iF9d/mLj
 lCYpud4XquQfKE0vT7LcnTWaD1wIiodA8vYAU0lNHKtM2nhByhxIzABPT9tUgKue2kZF
 IAZf0RCJUVkldBdHqcGhwGqUvch9BjJKVBRQTRSLiixdPX+yH0mKv/UI/yxiT/uALAof
 ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0g/o3e/kUKWPYZw6CoTHvipyaQ/pSBnOSk+ADuLHrTY=;
 b=PPkoN12hhon37GmmK1E7fV7cIwht5YcmX1WyGdAi/Lwfr/hnZk4ow7PyvEL17yuBKg
 SK4ETE4L1IF6cy5KwgFVPshqkZ8ITnaSONb/Xfwjn0FRV059yWYKyYEOGoeaIh5J0V6P
 IHYEC2Jmm2lj15RIDkm+ncdM+rE8wlSuwxh6mECEG9D3f5awAQ0n+hP3MfgH5yaXnqoZ
 xkZ4ijtismoElN6l1ZuIeDAMGprXgSrG6jQbV4JoAct4cSlR1wjKbnfX08BM3Dvsqkpt
 tfjW+o6H2BD6kjsmcndDXw1bXzktysRrahWYn8bcuJhne++F6u9EPJ9RCdcml+jQA/Yq
 92QQ==
X-Gm-Message-State: APjAAAVFiTfaogLUrcUE/AiRopY0NxuG4fewevRoWyFiRENMBkHyowSq
 5hdZF+Ca3NJQQ97FhiAiZIbFc9Wdlds=
X-Google-Smtp-Source: APXvYqwx+bw7Nth4M6XS+LCiqDUUDKYuCGyI+W2hK/kyiENGCVx30bVqvbR7ZoTdcnR8rb/dayBtHg==
X-Received: by 2002:a62:38d5:: with SMTP id f204mr1342032pfa.100.1571284598258; 
 Wed, 16 Oct 2019 20:56:38 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id v9sm615699pfe.1.2019.10.16.20.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 20:56:37 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3] ARM: config: aspeed-g5: Add DW UART and ADT7475
Date: Thu, 17 Oct 2019 14:26:30 +1030
Message-Id: <20191017035630.18840-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This adds the Synopsis DesignWare UART quirks, which is used by the
AST2600 A0 to workaround an issue.

The ADT7475 is an I2C device present on the AST2600 EVB and is useful
for testing that I2C works.

OpenBMC userspace does not yet understand the "new" fsi device node
layout, so disable it for now.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 4d31e9edbc8a..0fbb9335679b 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -146,6 +146,7 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=6
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_ASPEED_VUART=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_ASPEED_KCS_IPMI_BMC=y
 CONFIG_ASPEED_BT_IPMI_BMC=y
@@ -165,6 +166,7 @@ CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_W1=y
 CONFIG_W1_MASTER_GPIO=y
 CONFIG_W1_SLAVE_THERM=y
+CONFIG_SENSORS_ADT7475=y
 CONFIG_SENSORS_ASPEED=y
 CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_LM75=y
@@ -237,7 +239,6 @@ CONFIG_BMP280=y
 CONFIG_DPS310=y
 CONFIG_RAS=y
 CONFIG_FSI=y
-CONFIG_FSI_NEW_DEV_NODE=y
 CONFIG_FSI_MASTER_GPIO=y
 CONFIG_FSI_MASTER_HUB=y
 CONFIG_FSI_MASTER_AST_CF=y
-- 
2.23.0

