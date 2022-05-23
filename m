Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 180FF53112C
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:45:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6JW76MKtz3blR
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 23:45:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=M9uzG6OV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=M9uzG6OV; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6JTK5N1Cz307B
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 23:44:04 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id rq11so6806172ejc.4
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 06:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I52a+7ox89l0GNFILHX89jPDXF1F3pSIfpvY3ebelHI=;
 b=M9uzG6OVdiBwUyG8SJTZ+BSJqmJmBRtajEsE+gAxB6lEBFNmf9bSBWvHNQH30vCZm1
 cFCGA2Z5ZLFU0Pg0RTLsGzClKRdJ30Oh9AF1fj3fJAH9gbmOOsXW6AJ86nuamtH/DvZJ
 yIcwjqnYmKrvF39+4quTawNbi1MiFX/H1S20VIiktrVRSEbvaFt3jOn7TxC8Chi8qgmr
 QHC6hPL9heikn7w2+a+Vn1MQuOFgaJpmKipJ3zJEyae92FDgH7+OQjTUFd1O9e2tJFnp
 a3G6gyNHmyVBQTlz6Vi9hZooNYdbXtjHZzsqVWiUMwa0lzN5w9niY6SGz8tDDEH0ixRA
 tBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I52a+7ox89l0GNFILHX89jPDXF1F3pSIfpvY3ebelHI=;
 b=WL5LTHydnsOWPo4ULO2Y3j7v1yAh+3WSU6Po5LEVxOOPOwmKXTDQYoAjGC76BtlOa4
 5AUn8nad9TWfYgYVYoTYDMth+32x1/xoEWnlIPXkNZwDFtwus6xuKOLTnjTmaYoPK1BJ
 es+m25nB7K6YbydIkygFWE3x5RJtdIwEDU3stBBwaWXTDMoEVH5DKAevYNGCPXGqFWUt
 CaiXqpDqCLkV/riKD/kDwrA6YdLejFmZVpiNsmoouhWC1t8Tnc3oOIiEAfL049s6swnr
 oBXp50Q+J/qxzKDcp/aydGVw1n1HNz9DO3vB0zrIMCGbcyDlx0dStdMhSMrBhnLjC/N0
 uD6g==
X-Gm-Message-State: AOAM530RikMbFEUeQ5quQcm7uEG6KVgvBrFbSpMZCLey/oWFApGxEsSQ
 Ehowp4+4J/KZGafRrqYwd816yg==
X-Google-Smtp-Source: ABdhPJxhoBe+9Jp2lNgV1AJlQKvwSxa1bU5lGYMjjfxVb5fuTm7qBUPsd/zoc4OXMhwZkpiCZNqiZA==
X-Received: by 2002:a17:906:4fc6:b0:6f4:da16:4a09 with SMTP id
 i6-20020a1709064fc600b006f4da164a09mr19627125ejw.599.1653313438345; 
 Mon, 23 May 2022 06:43:58 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
 by smtp.gmail.com with ESMTPSA id
 v1-20020aa7d641000000b0042acd78014esm8146587edr.11.2022.05.23.06.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 06:43:57 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v4 0/2] Add support for IBM
 Genesis3
Date: Mon, 23 May 2022 15:40:02 +0200
Message-Id: <20220523134004.469176-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>, zev@bewilderbeest.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

v4:
  - Rebase on upstream
  - Drop defconfig and add it on openbmc instead
  - Rename Kconfig for debug uart

v3:
  - Drop FIRMWARE_2ND_BOOT patch
  - Include reference board DTS instead of copying it
  - Rename DTS to ast2500-<boardname>
  - Describe defconfig changes in commit message

v2:
  - Fix whitespace and compatible in DTS
  - Remove board stub
  - Improve commit message
  - Rewrite FIRMWARE_2ND_BOOT support
  - Update defconfig

Patrick Rudolph (2):
  arm/dts: Add IBM Genesis3 board
  arm/mach-aspeed: Add support for CONFIG_ASPEED_DEBUG_UART_TO_UART1

 arch/arm/dts/Makefile                   |  1 +
 arch/arm/dts/ast2500-genesis3.dts       | 28 +++++++++++++++++++++++++
 arch/arm/mach-aspeed/Kconfig            |  5 +++++
 arch/arm/mach-aspeed/ast2500/platform.S |  2 +-
 4 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2500-genesis3.dts

-- 
2.35.3

