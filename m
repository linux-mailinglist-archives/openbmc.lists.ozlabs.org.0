Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3C7391660
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 13:41:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fqpv614RKz305p
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 21:41:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IGpGgAlu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IGpGgAlu; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqpsy6j0hz2yRD
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 21:40:38 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id v14so712943pgi.6
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a3QkFps1DctBeYEgaq0bdjEXphWzVWbkJt3DpKN8pVw=;
 b=IGpGgAluD3CVt+XcgmQ7DBAonXdaDrtMJ8ktQ7PibTV+E1JCA5BXyUESpoi4rZnfO1
 uo14No+rlrL44zeJt0bV6NLbNQ4sKZEpn/SZonk8OY5xCxVywIsqgVnExz4NUlZgNcX+
 I5r8LiJqDPV6dfkE2pjAJEMd8obLRrlKJWSy/Kuk3atN5DK3vQySjsuc4tGYkbv7SQU8
 ekve6XOtOMnwbF4O6wofq82Pg6WSOKLf55UFG1e1+ua97L3RtrFCMq18PcmI6V1aLc3l
 5yMioZATW3l1qQaCvhO+hqtCulOXbSkcvsmy/a44JUZ1ZWJZ+xZfhfMtSegm1nPijCH8
 h53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a3QkFps1DctBeYEgaq0bdjEXphWzVWbkJt3DpKN8pVw=;
 b=MAAEeEjzIRXVBsgeFuVxZYev27MyQqNgiZ4uwBMxE9eEO7m4+CQvk8y5kWuN6qqM5U
 2vrDUdDrJcyfKeysasWw9MS1vbc42Eh0A6khO2j9iDFMFPl7nz7bXCyXxvjaGOr6boMq
 VF1UDQhT6ogymbCXVEZC/Ns8Miuid+JE8wEWEd1VXamoqSXZgRbBpqbO5Ybs89fPLNbN
 bUlyaNHgJ2YRF2LFYwEINTOcAGIcuzB8vPXUcROpFBZYcLusUOMloUiZjvI/ZohrTtIw
 NVj6cZ/z3G1MJ5aECNLlmiKtQLCUn+npUj6SUvjpufJ68ChzJ1+39HwCt46IH1giVDrn
 14xg==
X-Gm-Message-State: AOAM5309fKuSuy2vRbyGS6iJm3UOS9Yilk9UCWDbwTp4ZybRqqXvxHt+
 /yKkG1FJFG2aDEcm/SZl2ck=
X-Google-Smtp-Source: ABdhPJwZAACRmzJWliC43KJu3tQUcgDrBoRT2/0J3cjh26htDF41dPB2/HevBrxiWGrnV6f5r+1eOA==
X-Received: by 2002:a63:3e8c:: with SMTP id
 l134mr24599986pga.202.1622029236425; 
 Wed, 26 May 2021 04:40:36 -0700 (PDT)
Received: from george-Quanta.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id s14sm17124805pfs.108.2021.05.26.04.40.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 May 2021 04:40:36 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.10 v1 2/3] ARM: dts: nuvoton: gbs: add fans-efuse GPIO
 to gpio-keys
Date: Wed, 26 May 2021 19:31:00 +0800
Message-Id: <20210526113101.7457-3-george.hung@quantatw.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210526113101.7457-1-george.hung@quantatw.com>
References: <20210526113101.7457-1-george.hung@quantatw.com>
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, Fran.Hsu@quantatw.com,
 benjaminfair@google.com, openbmc@lists.ozlabs.org, brandonkim@google.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index fe2836d220b9..3d53fbe54055 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -141,6 +141,12 @@
 			gpios = <&gpio3 25 GPIO_ACTIVE_LOW>;
 			linux,code = <121>;
 		};
+
+		fans-efuse {
+			label = "fans-efuse";
+			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+			linux,code = <146>;
+		};
 	};
 
 	iio-hwmon {
-- 
2.21.0

