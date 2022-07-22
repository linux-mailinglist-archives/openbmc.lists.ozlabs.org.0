Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A85657DFDB
	for <lists+openbmc@lfdr.de>; Fri, 22 Jul 2022 12:32:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq5NV16K2z3cDT
	for <lists+openbmc@lfdr.de>; Fri, 22 Jul 2022 20:32:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ODcKD8AK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ODcKD8AK;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lq5N3512Qz3c2g
	for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2022 20:32:02 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id m8so5302364edd.9
        for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2022 03:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IFnsmnbjcLlYoAr+xu6Ngnb6y3ZV0ANVWM4gMEJHPHs=;
        b=ODcKD8AKT8ZDFo1Dq1Me1oMI0j3JdBF/BczXgmiYMw21AhSv0qxXSpkVlPAFbQHi3w
         JcUMMZ+2Z0VrdUZ4t53DgWZDjo0dkP2ECKnmqlb0vaHElM6lMjXhZ2xtP1fLuFhtjIwm
         li9GhqCYir0h+IoaJ0IEOhpfO6l8enuHGnWR94y2kAlWQrudeiaW6flY4Kx1QT0sCAig
         262JebI8msFNSZE/iF3Uic+zO4uarea7WPSf6rBSmp7MqZV5lPrwdCgAIjYqAbNbPvai
         IJXNwlOmaUcCqOUMov2mmvucDBFjIA3MJ3fZLE8Uz+CQvUuzWaErz6x1qYDdjS0RbS03
         +Aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IFnsmnbjcLlYoAr+xu6Ngnb6y3ZV0ANVWM4gMEJHPHs=;
        b=a2dnmT3Z63vH9ADgb9gA6K7MKWAb/AioMGCy85l6b9fPvkUkQOyGle64ciHML3lB+6
         x95apJ5x1wgWC5jJ3a3UtzNDXQRbX4Kpi9MFKIO8Oi8ZUax8Sx0VzFYPMKFs2uNROee2
         jna0eiNjj4yh9ChHotk+05RzMnKMhjX2Tmhggo34FHduQenPjJXTcugbi0CZKaAHqlHg
         iZPEmwV1fPWoQgEzt2bz8X5kF5HL7tqqkKujf1eZe5CXVS8EEgl+P3ReTPlr/Lf1C5fk
         EACBHE5EdjGSJ6nt9Wa/MhrNM/eVLXRdW30IzBxjwvdSCXEehKDGtRHgDCcmgGxWaqMl
         06OA==
X-Gm-Message-State: AJIora+FOpsC76BA1LHi2pN90IFfarKjaGg77eDhbAp6nduVPwQz37F8
	7jQGVM4s/abL6uzjni9cOm8=
X-Google-Smtp-Source: AGRyM1s4VWxM8kdBPaogcz5EkWQVbnvREQtxatII7yHeZJssaVyWzvpJpywlE5aDi7jeDqYKENptAQ==
X-Received: by 2002:a05:6402:28c3:b0:43a:6d78:1b64 with SMTP id ef3-20020a05640228c300b0043a6d781b64mr2866830edb.93.1658485915793;
        Fri, 22 Jul 2022 03:31:55 -0700 (PDT)
Received: from felia.fritz.box (200116b826e64200edeeb77a6a94b0d2.dip.versatel-1u1.de. [2001:16b8:26e6:4200:edee:b77a:6a94:b0d2])
        by smtp.gmail.com with ESMTPSA id lu44-20020a170906faec00b006fe9ec4ba9esm1856159ejb.52.2022.07.22.03.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 03:31:54 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] MAINTAINERS: rectify entry for ARM/NUVOTON NPCM ARCHITECTURE
Date: Fri, 22 Jul 2022 12:31:29 +0200
Message-Id: <20220722103129.22998-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Commit 08e950449c62 ("dt-binding: clk: npcm845: Add binding for Nuvoton
NPCM8XX Clock") obviously adds nuvoton,npcm845-clk.h, but the file entry in
MAINTAINERS, added with commit 3670d2ec13ee ("arm64: npcm: Add support for
Nuvoton NPCM8XX BMC SoC") then refers to nuvoton,npcm8xx-clock.h.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file reference in ARM/NUVOTON NPCM ARCHITECTURE.

Fixes: 3670d2ec13ee ("arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Arnd, please pick this patch on top of the commits above.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d14a446df13..e2734926f6ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2488,7 +2488,7 @@ F:	arch/arm64/boot/dts/nuvoton/
 F:	drivers/*/*npcm*
 F:	drivers/*/*/*npcm*
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
-F:	include/dt-bindings/clock/nuvoton,npcm8xx-clock.h
+F:	include/dt-bindings/clock/nuvoton,npcm845-clk.h
 
 ARM/NUVOTON WPCM450 ARCHITECTURE
 M:	Jonathan Neuschäfer <j.neuschaefer@gmx.net>
-- 
2.17.1

