Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAC74E3917
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 07:39:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KN2012672z2yY1
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 17:39:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WS1Rn8Ap;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WS1Rn8Ap; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KN1zc6xvWz2xgY
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 17:39:08 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id p5so11287176pfo.5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 23:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7mUOt/PS+kt8AFoz/gsjalLDdtaXfj6MWVWebM9Oxy8=;
 b=WS1Rn8Ap8cDpsig1l12yGyBLU7ZM/VrW+vjGjmZvDzvCTGXVZ6N6R17yY8svId2x52
 kNcoLH4o3sw9xONr6eRRU7lqIRkJRugcmvAc+ZEcdQs1dG+M2cdJE8We6hXZW5fMh6j/
 ALTmBvb0KkmmnKQ5DcoH83RK1RE+W+z8nM64k9OQkSetkpqOGhGFexKQAQR980WqQGBu
 Jry1xpgY6qWeb8klikC0Ylo7+6gn0oSLbWsutvPNqLS8ErwNF9LxbbfWlJ3CqNJa4uMR
 ByC6N4qSwB9hS5TuFzCAvqIVzbGnsNsg89117k6FAudXlITHEZyv5nAu5qQMvR9zu6Tm
 ZVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7mUOt/PS+kt8AFoz/gsjalLDdtaXfj6MWVWebM9Oxy8=;
 b=IeLXVb4ErmMGpr+m9eQKspQYWylUDtTGdvZCAB5N6MDuzHMUsr6Jul2pa+bGOhFmFk
 CeQiSeA1SXii21p4gBuYk3L4prVOI8vNIeSZFFb2qSaySBWGjwVpkClDkuYhYhYyOjtn
 qhl9BwQpAFHxl/zYYkU56++L/vqLO882VlHvJIE6xO4et0n92eP/AEqL+50h7HjG6DhB
 xzdSHvgxTR6N6NJTDzalC5iBtn5Mpk98oD+Y1vcHPF10nQdotpGwAxMidKLT+SG9wX73
 ZTqEqzE7yc33rb1+K2og11V3af/skWl99UpsePTgTIh7MNms6JKZ6m2++u6Q2Aq53ElL
 It9A==
X-Gm-Message-State: AOAM5326V0OVbX1QSW22L+xrwNFpYcXlZEWb5Na2u/TepGuiaQ+rVuuE
 MNpHmHNi/wVonOfCqoxTC+s=
X-Google-Smtp-Source: ABdhPJxFC/PnI6laqJmcRB2YCE+hVI3JUKjIo9s2obJhBEG1E7SYcFAGArR8xTLfKP5GTsdY4Vaz3A==
X-Received: by 2002:a05:6a00:158b:b0:4f8:e4a9:973f with SMTP id
 u11-20020a056a00158b00b004f8e4a9973fmr27544723pfk.2.1647931145479; 
 Mon, 21 Mar 2022 23:39:05 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056a000a8200b004f1111c66afsm24158003pfl.148.2022.03.21.23.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 23:39:05 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: fp5280g2: Add UID button gpio name
Date: Tue, 22 Mar 2022 14:38:59 +0800
Message-Id: <20220322063859.770715-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.30.2
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
Cc: George Liu <liuxiwei@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 60a39ea10ab1..dd7960983392 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -91,6 +91,12 @@ ps1-presence {
 			linux,code = <ASPEED_GPIO(F, 1)>;
 		};
 
+		uid-button {
+			label = "uid-button";
+			gpios = <&gpio ASPEED_GPIO(Y, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(Y, 1)>;
+		};
+
 	};
 
 	gpio-keys-polled {
-- 
2.30.2

