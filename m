Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 441FF5294BE
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 01:11:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FPH1C5vz3bY6
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 09:11:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J/zsEQMu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=J/zsEQMu; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzGnd0RDgz3bd9
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 13:03:48 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 c1-20020a17090a558100b001dca2694f23so3687991pji.3
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 20:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q41Jr8VR5dY09mKNn7RY5RfYlHLETTBtn1k7thCkKuQ=;
 b=J/zsEQMuV3jeFz2ZNyP7VN5TA+LgtwO4M2U3fzh8HvTEAuUbQNRfq7QJ9DC12ZVfn4
 I8TTZ5KkOAOZxahJkyBOlCo1U2T2zkc03IKM6xt3J77YxyPEaOL0Vwl7tKMlMRSXogCp
 d3ZluyhDUTx4//RZrGv0wFfOp3u4s0S7Tp33qk561OC64mhOSZrVZuRTeohjmV+qI7q6
 hbYyzx3z2iWEhcgWfnAN+06TIfsNB6ORPz8rwURmywoHEKF+TpiZgsCgXzVCjHAbyBR4
 d5yxPSkTuXmq4T+SQBxa7W0HtrS3sKh3kO9N0X7tRqggNj4gahwMG3eyaBdDKgGJFCD8
 sBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q41Jr8VR5dY09mKNn7RY5RfYlHLETTBtn1k7thCkKuQ=;
 b=oA3t+YSlFxh7d+P991GrFrkWCsn4zc2ccVxJnUos/o4YX1BZriLt454LFZX/NcfIXT
 g0MHs4dK3g4rkD0uoyxNP3/6Dl9RPmeMm9twvfiQBBhgZ7dQZHKwHORrpzwCgbuWkGX6
 Dc19GEsr+y3ryPUXjAsWgnxBBFJyk9ah0E1kJzgHLUJtoxISuRlZjlt7YJ0OH0Elp4Kz
 U6rVbog24zX7cHm/Yp+3E/AfvBsbq7u2rGeS7FIsn/H5g2KAOP+Eq22yPPvn+dJwx4uK
 SZFWABQGSAk9XI6UXa2uyCtJcS/eKHde74QlsvXCbhb5eNgutnR35GSx/I+s0TAPCYzE
 w3Ug==
X-Gm-Message-State: AOAM53294TFhqpJzzALc/sjHU08a5gvDW1pzTJJcmNHsC/4ZquITFGT1
 k6OOolCI9o8FH8cjuLoukFE=
X-Google-Smtp-Source: ABdhPJzMEbwjlTwN4njMLoFUKyG6CTBFqiX1Z2hsX7AHrrVgcWAFRUs76ym8HM2zKTrZihSX41SbVg==
X-Received: by 2002:a17:90b:3901:b0:1dc:5a24:691 with SMTP id
 ob1-20020a17090b390100b001dc5a240691mr8562489pjb.40.1652324624077; 
 Wed, 11 May 2022 20:03:44 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 5-20020a17090a190500b001d77f392280sm640890pjg.30.2022.05.11.20.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 20:03:43 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Brendan Higgins <brendanhiggins@google.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm: npcm: Fix some refcount leaks
Date: Thu, 12 May 2022 07:03:34 +0400
Message-Id: <20220512030334.52918-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 May 2022 09:10:20 +1000
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
Cc: linmq006@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

of_find_compatible_node() returns a node pointer with refcount
incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: 7bffa14c9aed ("arm: npcm: add basic support for Nuvoton BMCs")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/arm/mach-npcm/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
index 21633c70fe7f..fe63edc9886d 100644
--- a/arch/arm/mach-npcm/platsmp.c
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -35,6 +35,7 @@ static int npcm7xx_smp_boot_secondary(unsigned int cpu,
 		goto out;
 	}
 	gcr_base = of_iomap(gcr_np, 0);
+	of_node_put(gcr_np);
 	if (!gcr_base) {
 		pr_err("could not iomap gcr");
 		ret = -ENOMEM;
@@ -63,6 +64,7 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
 		return;
 	}
 	scu_base = of_iomap(scu_np, 0);
+	of_node_put(scu_np);
 	if (!scu_base) {
 		pr_err("could not iomap scu");
 		return;
-- 
2.25.1

