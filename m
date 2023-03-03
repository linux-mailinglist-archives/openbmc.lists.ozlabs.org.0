Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 381A26AB382
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 00:29:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVHwf0mRFz3cCL
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 10:29:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m8eECwzr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=tomato1220@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m8eECwzr;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSdYS489hz3cJK
	for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2023 17:37:00 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id ky4so1746886plb.3
        for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2023 22:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVsweOV5Fj7dNrLOlFZRp9kTopvKPiRPfqHp7y5J/DA=;
        b=m8eECwzrQBfNMqoIkcDa+kFKYHUPtYFc4DCR16BTgCK+6eCS1X2gZooW86+1c04cwV
         yBWB5OXlZY978Kzj+33XiRpVG/49YC/JlWbWIfdc0i+28QAGBI6Nby6E5EeQb4O7Q6jL
         i6oC+7wk+TEMfvGZt0eIx+6GpREU+idzWhKFkAiH8A+C2dAoQ4AflFHGB1yMBdanJPYs
         h7gkDR6TmnydZo2OSNezNeVIeZNeO79kYtYb2BWm5VP79iJgeQDoa8vZRQMf7t2VfflX
         GlAT7FZgsnHpv44Gh/LxTQHkYxWYwd4pwjgPjjFbL67ZzHr04XIlYHzeHiDxm5i6pihl
         EDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVsweOV5Fj7dNrLOlFZRp9kTopvKPiRPfqHp7y5J/DA=;
        b=oS1iE4rFAc8oA7j8vQqdZyZTiiXWDxDOtp24MPU+e+q5EuGhEpfQKn/4JYr59i2mQw
         DTwKxN2KSZz4kVx9dlEkK6dNFhNxm74S024AquBVOmEaCe9Pd17mJwyKpLUEvBFwKw1z
         3hJDgDWn9u8AqA+XtC/BjILG9Agvzul7Z6VggVN9Nej7Q2St0E66mnawdaDXgWLfUWxT
         VkMB1Bc0+rEMm1z5HQQEDKea6XTSczmPnuM+Z7KaX2xH6/nYJsYxCicE4ON+P4B23Ate
         UyFaXvVvgy9DJhj4bSleSS7mc6FBPuYrl9R2y4ABqcECbdU0Uy3/gqV9BA13ykJds2Iw
         pyWw==
X-Gm-Message-State: AO0yUKXMoAolgnrzLY4woUAeOM3ZqMBy0yQ8RAg5cpXFM7ULEcUnaOQi
	aYnM+EZ9/p3zh9w/A+c9MAI=
X-Google-Smtp-Source: AK7set9PZFvojaiikRHm2IkFZ4HkcMxqxGOw5ocputE+L4/QnNnEgrR5RGzSmjhJadJ52rbXEqKAnA==
X-Received: by 2002:a17:90b:1b52:b0:237:b64c:6bb3 with SMTP id nv18-20020a17090b1b5200b00237b64c6bb3mr653916pjb.11.1677825418152;
        Thu, 02 Mar 2023 22:36:58 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:36:57 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 4/7] ARM: dts: nuvoton: gbs: Remove ethernet aliases
Date: Fri,  3 Mar 2023 14:34:32 +0800
Message-Id: <20230303063435.803097-4-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 10:24:04 +1100
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
Cc: devicetree@vger.kernel.org, David Wang <davidwang@quantatw.com>, fran.hsu@quantatw.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Alias "ethernet" in dts conflicted with systemd v252 naming rules and
caused a rename. Remove the aliases to avoid renaming.

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index a33766e430d7..b27fe12e3962 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -10,7 +10,6 @@ / {
 	compatible = "quanta,gbs-bmc","nuvoton,npcm730";
 
 	aliases {
-		ethernet1 = &gmac0;
 		serial0 = &serial0;
 		serial1 = &serial1;
 		serial2 = &serial2;
-- 
2.25.1

