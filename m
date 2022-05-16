Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448215288CD
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 17:28:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L23721DqTz3by9
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 01:28:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U4hyg03x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U4hyg03x; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L236c6mP6z3bsG
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 01:28:08 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id c9so14776390plh.2
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=jvAEBjwUOb6zwBl6DiP+4dhdWO5kB2YZRGfj+rIA7BU=;
 b=U4hyg03xi6oe6X6bhQ1T1+v1r88DZ0by9HRN+VaKWFNIlfUp5+BpC2BgklaZ/gjmSZ
 Hzbe1Rg0Pqrgg6fUbPg9DCsFUP99lBVSI47LnmUwRdBVddVBukWeDVchsCUKHjIsVH6l
 ialCaFcZI0XBicM6OnNUlqlfGebQB2qNtYT6fZkmsI6mZjrfSzemK8yhu92r5cJSnth/
 c31ysVRyvCrgDcd/Mp5vp93qiHTtVsQhpo+1zYC87CD5o7XD6ricuQ2ziF1u53JHteK6
 N39Vy4qsAcIk4UsWLwoGB7+g+5t8oLWp/nfChFy+BlbEL32ZNovG8uZk8Gsv2e1/sYJr
 qehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jvAEBjwUOb6zwBl6DiP+4dhdWO5kB2YZRGfj+rIA7BU=;
 b=HODDTt1SYsr4V4e5Pt1Ln54N6O6wloLO5T9V/H30ua4RfX2eEcOkaMG1zg5Cd6bRyG
 ealachb0ASDUGg9D4CtpoRLx4FskteNXZTyX5TZLlmK8QVzqDeFcC/1jZgaug44Y1GgH
 JiigW6e/kk8uVGf7155giNlHgQTa0KuDOxgfxwgpOd8NNqckFQl5LAnrkZ6IznC4n/7J
 xLpsOtUkh93V/hHLURVwv5wvqJer7nVy3K0sJcQbmEJRSoZhqLOl1lw5c+EHnEFGwFdS
 AvIXY3oX50sma5vsgijmOCaz+uMVX4va7AAOtMMEYIKRYgnpQu8PemMCjUMq4+plnQ0l
 /FCA==
X-Gm-Message-State: AOAM531j/VuAxmYiV4/w0U7IK4etWXaUdbpuwf5F9nnoog0p5e/LIr75
 NSajscBmYgYAyTt3Q0Oym98=
X-Google-Smtp-Source: ABdhPJy0iI39XqHCU2EmY5yUaX8imnzPT4LnPTzcfum+hrQ94V4WB81XJo2SovUpsXsl2iF2fpfWMw==
X-Received: by 2002:a17:903:230b:b0:15e:bc9c:18c7 with SMTP id
 d11-20020a170903230b00b0015ebc9c18c7mr17829910plh.29.1652714885101; 
 Mon, 16 May 2022 08:28:05 -0700 (PDT)
Received: from localhost.localdomain ([116.89.131.16])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a655acf000000b003c14af50605sm6895126pgt.29.2022.05.16.08.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:28:04 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: benjaminfair@google.com, yuenn@google.com, venture@google.com,
 tali.perry1@gmail.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 robh+dt@kernel.org, alexandre.belloni@bootlin.com, a.zummo@towertech.it,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, ctcchien@nuvoton.com
Subject: [PATCH v1 1/3] ARM: dts: nuvoton: Add nuvoton RTC3018Y node
Date: Mon, 16 May 2022 23:27:49 +0800
Message-Id: <20220516152751.27716-1-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add nuvoton real time clock RTC3018Y in I2C node

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index 0334641f8829..c1248211b1b4 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -202,6 +202,12 @@
 		reg = <0x48>;
 		status = "okay";
 	};
+	rtc0: rtc@6f {
+		compatible = "nuvoton,nct3018y";
+		reg = <0x6f>;
+		#clock-cells = <0>;
+		host-wakeup-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+	};
 };
 
 /* lm75 on EB */
-- 
2.17.1

