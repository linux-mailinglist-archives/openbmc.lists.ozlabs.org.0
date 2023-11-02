Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA47E7762
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 03:24:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha1 header.s=20230601 header.b=pe+EkiHk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRN1b23x7z3cV4
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 13:24:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=pe+EkiHk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLQMc0gMBz2xm5
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 11:52:42 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cc5b7057d5so3208515ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2023 17:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1698886359; x=1699491159; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEH7jgDGNi0IK8LdwBqEJDaZ1nOxkEDv/a4hPy0Cfvs=;
        b=pe+EkiHk81Ny7X0J26vAhohl0WxPKPlAdnkOH7YuFpeaRk193rCRj6DkGGYH1x0ZMH
         8sn1ym8SW1kSgGjY08A+t40evNDIJuZDITmLMmEqlDezoutIJkduuADV1TTYTyAGMvoq
         NRDZ1TM24kzti9OrH0DaZR7vLqyGF4henoDlcONNI+le+7d7gLBt17zl3s4SV8O1HO/h
         0mn2dorstiuiMfUTLpEvx9x6oyhnAL/IWFE09poPmkPxiwlb82SDea6DK93Xji5Ce0KG
         sWGsHFCMDlnR0K/5hQcC7FDKuS+NlSTL32KXNrDp7zPLiWKy+Zdg0BDIT3ca7kan8tNA
         6Xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698886359; x=1699491159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEH7jgDGNi0IK8LdwBqEJDaZ1nOxkEDv/a4hPy0Cfvs=;
        b=ZT1hBrKZIi80BXLdXOeXmogSfHByuoptDE07wAQy/jhiY1p4NUuY4If96mTL326gaX
         Aiu7ZOTnzO9YdJjbWontC5yeole2kIFG7y8Fz/UEnDpbQHpo90ejil1nPiXQ29b0hk4P
         3vGHnrI4mru6UwoonL5gBzQtcHKbva1+2oR1GNILZsMy/4Ot4AA1opKDxZ6VJA1V2Vqq
         TshnKDOVpF1ULLeefWx6PKmr+qTKUzB4d34/2/B7rTG6+9b4JMVpQEsu1lbHt9aUr6AO
         bDnhcTy5Mm+7adnjLgA88uRLiLf500FY0TiyRRRE8MBVCLjJsk3vfnsKZV6bdxDU/Lvp
         vb5w==
X-Gm-Message-State: AOJu0YxBMBETHLqxgZuI+/fWoNtcW6+tj8sB/3PJIUKtwyGFEBGsozUl
	DQtd6u5FQUxS30QYOJlYg/JveA==
X-Google-Smtp-Source: AGHT+IE+ZdLb3Aw+UkjefJkw08x3IgjX/CtA8o+83Guh4gaPv8UBFUr6Jry4WwmCNb1WOSCraNSQ3g==
X-Received: by 2002:a17:902:f688:b0:1cc:53db:f53a with SMTP id l8-20020a170902f68800b001cc53dbf53amr11579358plg.8.1698886359474;
        Wed, 01 Nov 2023 17:52:39 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:8eb3:7c85:29f7:efa1])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001cc29ffcd96sm1888663plb.192.2023.11.01.17.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 17:52:38 -0700 (PDT)
From: william@wkennington.com
To: tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	avifishman70@gmail.com
Subject: [PATCH RESEND] ARM: npcm: Add CPU hotplug callbacks for kexec support
Date: Wed,  1 Nov 2023 17:52:27 -0700
Message-ID: <20231102005227.1303733-1-william@wkennington.com>
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
Cc: "William A . Kennington III" <william@wkennington.com>, openbmc@lists.ozlabs.org, Brian Ma <chma0@nuvoton.com>, linux-arm-kernel@lists.ifradead.org, linux-kernel@vger.kernel.org
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

