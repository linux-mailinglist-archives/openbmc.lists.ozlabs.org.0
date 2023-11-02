Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D79197E7768
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 03:26:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha1 header.s=20230601 header.b=U/nvIUZx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRN3d5pvvz3cXJ
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 13:26:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=U/nvIUZx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLflc0R8Nz3cQj
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 21:10:50 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6be0277c05bso776311b3a.0
        for <openbmc@lists.ozlabs.org>; Thu, 02 Nov 2023 03:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1698919847; x=1699524647; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odwL1J6AS5nuqoPCF8FI4fUOnDzh+OWjuHaoV8Nap8E=;
        b=U/nvIUZxqyalZzj/UOFuB778nSumzqDZg3Gq3aGhF76jqhCsVu5aGY4cb2ls0bXVFl
         mV/daveZkh6RCULScnVp3DKgxHS+AJPaznhZ9LUx5ywseSOAOJ+qSO3mPaVKm/ILO54r
         5L3IoLoXCGhdIJOyMQtJk0yUP7Cr5SLronTJreI2GAAaHhl0slmsvEleNIMpEOKses0Q
         lXuQe2Yl8sRUk6oXV2u1HuM70w8Vf5W61DrBLrtThnXMxBo7DC7W02iVeh6VVYdLlt89
         U9bmEEXtF2Sc8C1jc47CeNFcToTQNUviV2nx3aNiMfNsARPeR2lkjYLvKTtx1w7eN9Oo
         Lu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698919847; x=1699524647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odwL1J6AS5nuqoPCF8FI4fUOnDzh+OWjuHaoV8Nap8E=;
        b=pqmL21x3bDGbYoEs3WUMt4J/Ddqw/bIDCc5oqhybOIrNh9K59+RN1Tg0OvDqRlgeYc
         5Y+Q6PUA0gcvDIlK/u0+liszZwe4sWXRdumLvq+n4feAefS3L+DR7BPNpcz873DK6nmW
         geKVPe5Ytm3NimO+4ZG2TDN5nZ/kXApIRQEFvDTBM44Hg9X5z3L9EHhjlyYt4XnaA9Wz
         yxVV8uoG7ckEngv2MKNkRzG/ncprAexms8hEFv26pdtcuez+4cdIMkfntxHvAlcC0VBr
         w+KanqdLjBYf2R9GTDV5gqRnYDBbZ7nXjk4H4323Da1s1K1j4ojXEuFJ4bVW9L2tkW2B
         o9+w==
X-Gm-Message-State: AOJu0YwCBXH88GjyLs6+Eg7mR1o6BVBtpamMHwDum9vTmUw/9f6RFlcP
	j//3/fKz/Cvd8d2qsy+wpkXNSA==
X-Google-Smtp-Source: AGHT+IEf7ZgC902FAtds2SgN5IYeyPxxxWqsIRQdyf4VSs9bXlV7zIMiF/oukOjY8Q/mn5suukmJWQ==
X-Received: by 2002:a05:6a20:7488:b0:16b:8132:b547 with SMTP id p8-20020a056a20748800b0016b8132b547mr17207560pzd.4.1698919847221;
        Thu, 02 Nov 2023 03:10:47 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:4b75:12e:f4c2:92ac])
        by smtp.gmail.com with ESMTPSA id fb27-20020a056a002d9b00b006bdd7cbcf98sm2552127pfb.182.2023.11.02.03.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 03:10:46 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	avifishman70@gmail.com
Subject: [PATCH v2] ARM: npcm: Add CPU hotplug callbacks for kexec support
Date: Thu,  2 Nov 2023 03:10:09 -0700
Message-ID: <20231102101009.15104-1-william@wkennington.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231102002453.1299195-1-william@wkennington.com>
References: <20231102002453.1299195-1-william@wkennington.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Nov 2023 13:23:51 +1100
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
Cc: "William A . Kennington III" <william@wkennington.com>, openbmc@lists.ozlabs.org, Brian Ma <chma0@nuvoton.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Brian Ma <chma0@nuvoton.com>

Add callbacks required for kexec to function. The NPCM7xx does
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

