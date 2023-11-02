Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A316D7DE95D
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 01:32:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=eScF67F/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLPwB50nhz3c48
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 11:32:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=eScF67F/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLPll1srZz2yDY
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 11:25:05 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c434c33ec0so2907975ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2023 17:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1698884700; x=1699489500; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xEH7jgDGNi0IK8LdwBqEJDaZ1nOxkEDv/a4hPy0Cfvs=;
        b=eScF67F/l9Kw9rzqhNh0ThyfaDeaTkDLe3iNV0AvSlAmi+A1epZYOLj6iEVpkv8mvx
         Or9WbFqZBoY3X+a8nefKekjnZYMauQ0SXRJ5WmQFKSLtwsOtJxyjNozLL7Cn2HYbkUmS
         TZFmFgu4uRxE12bT5PnB+fKWZeLabQAeXnCTVETFRs2iewvsMY4V4lumLVCmKdPBxEqt
         +q1k3VoIflEylmvVI0/Tbsw8HaVlxdYiCNxcn9JVYfqGivBhbcHn4Xq1D8n7Hijyl7Gq
         nxSnv3HFuJCHDSfDse0UNmkPhZVkgX5PF44Sb/WYVRu/+xfzEWE1s2ezQYw+70sArF3/
         854w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698884700; x=1699489500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEH7jgDGNi0IK8LdwBqEJDaZ1nOxkEDv/a4hPy0Cfvs=;
        b=dmMXn8akGuiK3qc2sa40RDLVpcY2BTClO9RaxDcL+Kvlt5ZztWVMi0XQCMEiWX3a1z
         tbt8QcMGl1TWPhArxQdqdZ7wx4l2OZwh5qr1F2+28RHqeUmd0pe35btbUeGbZOAf/2L2
         U68zf90nwbabKX8emyNtrFIQy1f+DpTnZes1XuYEqaqXXcv+CsFn5veq/2j+FjDSgIcn
         EE8E5oef7bWqzgCAcFK2qmtMI70szHQ6lwEzqP4s3fu1a3amfzAhmfIo6P324tx7bzgi
         orCBoDB5KmO3mcL57tgRnuoIW6TzP5WQmFZHUqjdIju2kT92Wu8wKmFexDO22I82QWLp
         wT7g==
X-Gm-Message-State: AOJu0Yy+7hRUOHjsStmDupaB1AUf0CJMIuzlZmnONSBWbmj+fKD/CC31
	WWEMIJo4zaZSAmJXSxNIorykgA==
X-Google-Smtp-Source: AGHT+IHbe87+pda9KMj8h9yADQPuHza8FZiqPMjNvMkuAQyzoKTXx8xKJQouIlGMQjgJJVcPPWLo1A==
X-Received: by 2002:a17:902:904a:b0:1ca:a290:4c0c with SMTP id w10-20020a170902904a00b001caa2904c0cmr13808328plz.16.1698884700253;
        Wed, 01 Nov 2023 17:25:00 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:8eb3:7c85:29f7:efa1])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001c771740da4sm1831210plc.195.2023.11.01.17.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 17:24:59 -0700 (PDT)
From: william@wkennington.com
To: tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	avifishman70@gmail.com
Subject: [PATCH] ARM: npcm: Add CPU hotplug callbacks for kexec support
Date: Wed,  1 Nov 2023 17:24:53 -0700
Message-ID: <20231102002453.1299195-1-william@wkennington.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Nov 2023 11:31:58 +1100
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
Cc: "William A . Kennington III" <william@wkennington.com>, openbmc@lists.ozlabs.org, Brian Ma <chma0@nuvoton.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Brian Ma <chma0@nuvoton.com>

Add callbacks required for kexec to function. The NPCM7xx/NPCN8xx does
not expose controls for powering down CPU cores, so just wait in idle
loop.

Signed-off-by: Brian Ma <chma0@nuvoton.com>
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm/mach-npcm/platsmp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
index 41891d3aa124..6cc7b5894f08 100644
--- a/arch/arm/mach-npcm/platsmp.c
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -69,10 +69,27 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
 
 	iounmap(scu_base);
 }
+#ifdef CONFIG_HOTPLUG_CPU
+static void npcm7xx_cpu_die(unsigned int cpu)
+{
+	while (1)
+		cpu_do_idle();
+}
+
+static int npcm7xx_cpu_kill(unsigned int l_cpu)
+{
+	return 1;
+}
+#endif
+
 
 static struct smp_operations npcm7xx_smp_ops __initdata = {
 	.smp_prepare_cpus = npcm7xx_smp_prepare_cpus,
 	.smp_boot_secondary = npcm7xx_smp_boot_secondary,
+#ifdef CONFIG_HOTPLUG_CPU
+	.cpu_die			= npcm7xx_cpu_die,
+	.cpu_kill			= npcm7xx_cpu_kill,
+#endif
 };
 
 CPU_METHOD_OF_DECLARE(npcm7xx_smp, "nuvoton,npcm750-smp", &npcm7xx_smp_ops);
-- 
2.42.0.820.g83a721a137-goog

