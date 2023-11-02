Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A17E7764
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 03:25:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha1 header.s=20230601 header.b=y/aIwDB1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRN2d03jnz3cW8
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 13:25:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=y/aIwDB1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLQNR6yrbz2xHb
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 11:53:27 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso1227488b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2023 17:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1698886404; x=1699491204; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEH7jgDGNi0IK8LdwBqEJDaZ1nOxkEDv/a4hPy0Cfvs=;
        b=y/aIwDB1z/AQyTa5ZGSsiIPnKW9syWiX3E/zrfKwckqLOGi2AE2FyhSAlRdyZYdPXj
         yhVHDoHuq+Gb/ac5I33dRx3kjyVD9WzB8N7FkUOeoZz3IRikgWThwiSY0gZIQOeWFuJb
         wyPC5GYqpvRDP0jAH5U654EX5TkZky/I1AWO+ZLwNNemTAZmDDIE+AtWvd+Ybij7WhoL
         1RY5mvwCeAFUmxE8WbYPk03Pp0ALwV6Z5CRiRIJ0cjeBs+d0lZrGh7JRv0/HUplS3kcH
         GhGWSYVBmtqZxylCshvCdU30JtoXQ6HmKxuUyhEmBUGCUj4DWWS0q6kdnrfQhWV5GVVV
         TEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698886404; x=1699491204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEH7jgDGNi0IK8LdwBqEJDaZ1nOxkEDv/a4hPy0Cfvs=;
        b=PFGPMGbtCM0VgAKpk5U/F8N8YPeu9N6rFDsAfU9w7Wg2uvW0F1h4zhogpmueat+ipt
         ceKm5NcFd9U38FGOir3WoZEHo1IIe3+2zOcMRQtTmRv6HBLwQ/9Qgz6YVSjHFiY5McL6
         5DnO/lwFfDCYphhIKqDhi3AoyfXWfddtpwtNAja81+/EyrK9b9Pgt/QV4KVF6a6Pkb2L
         9u2pjh+TUBsQX4wiVhfbdTTWB5B12VFHC1iqustaJ7DaAOd0WTjyKLAp6tFKrimYHoQk
         1JqBIyo2jq8665ef8U4QAkJpPdBqoLGhZh9dfID9Xrxgu86y8rrpzGPT5BXVaHbACpxo
         AUkg==
X-Gm-Message-State: AOJu0YyENOJ5cUZ+73wzQ78uTBaLYj7zygc4yXRkEan0hDwNMnZaSgeZ
	3h5gD44TuuhBFB4t7Vv5RwvVh71R59WqRe+3kf5rgg==
X-Google-Smtp-Source: AGHT+IGSWXVKZ/Zqa3AgiAFvgieUYgWobPDkFn/aMZfv3jNm/vUrhTJokjt51yoYFUCRMB0d+zLJXw==
X-Received: by 2002:a05:6a20:1443:b0:17e:aa00:ca62 with SMTP id a3-20020a056a20144300b0017eaa00ca62mr10468558pzi.17.1698886404340;
        Wed, 01 Nov 2023 17:53:24 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:8eb3:7c85:29f7:efa1])
        by smtp.gmail.com with ESMTPSA id n20-20020aa78a54000000b006c2d53e0b5fsm1768083pfa.57.2023.11.01.17.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 17:53:23 -0700 (PDT)
From: william@wkennington.com
To: tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	avifishman70@gmail.com
Subject: [PATCH RESEND] ARM: npcm: Add CPU hotplug callbacks for kexec support
Date: Wed,  1 Nov 2023 17:53:21 -0700
Message-ID: <20231102005321.1303809-1-william@wkennington.com>
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

