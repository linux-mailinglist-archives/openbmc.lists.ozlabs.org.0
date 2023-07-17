Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAE3757029
	for <lists+openbmc@lfdr.de>; Tue, 18 Jul 2023 01:01:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VHjk3NjK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4cyM4k4lz2ytj
	for <lists+openbmc@lfdr.de>; Tue, 18 Jul 2023 09:01:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VHjk3NjK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=vv+k=dd=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4cxp0r38z2ypx
	for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2023 09:00:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A763E6130D;
	Mon, 17 Jul 2023 23:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A368EC433C8;
	Mon, 17 Jul 2023 23:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689634843;
	bh=Ay5ljBkwVc2fqKDgl+j5GKtS+R/gvbLAjPMhqjMBKEc=;
	h=From:To:Cc:Subject:Date:From;
	b=VHjk3NjK36dq3DNJPCkBfj43Ys/rE2WlKYBvjKf8fa0QOp1hE20UXlhLI75LR7tGS
	 86cI0t4/6MyDiSdUB7iIwF2tBJplL82mkCJM3yJof1+M1jbAT9k/ANBlHCyIpc/ok5
	 1TS3BcC9B/EsEVKYau6MAHDNLGwKbVQP1UXU1J9/WZqzkHL+8AdB+JlIpCZS+F3mr8
	 qiybUWbo8lCSYxeiJdkPa70TxrQOiCZfaRAz5W6t3tLG4xT6l9Jr2gCczmxmx23yHW
	 Qc0m7zo1rFqPCEOhYdd8Om3OS2ghHcWaydQPwr3PZ0vVruferVeivAn+y0+/iQ9l47
	 peBbZJmyU8QsA==
Received: (nullmailer pid 3213463 invoked by uid 1000);
	Mon, 17 Jul 2023 22:55:49 -0000
From: Rob Herring <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: npcm: Drop unused includes
Date: Mon, 17 Jul 2023 16:55:45 -0600
Message-Id: <20230717225545.3213329-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Several includes are not needed, so drop them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/mach-npcm/platsmp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
index 21633c70fe7f..41891d3aa124 100644
--- a/arch/arm/mach-npcm/platsmp.c
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -5,12 +5,9 @@
 #define pr_fmt(fmt) "nuvoton,npcm7xx-smp: " fmt
 
 #include <linux/delay.h>
-#include <linux/device.h>
 #include <linux/smp.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <asm/cacheflush.h>
 #include <asm/smp.h>
-- 
2.40.1

