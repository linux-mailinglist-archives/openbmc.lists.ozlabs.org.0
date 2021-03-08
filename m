Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D160F331448
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 18:11:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvPyZ6CLRz3cYt
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 04:11:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=gyAhJPIJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--gmouse.bounces.google.com
 (client-ip=2607:f8b0:4864:20::84a; helo=mail-qt1-x84a.google.com;
 envelope-from=3w1pgyaykb5oagiom8aiiaf8.6igij8h5g6fcmnm.itf45m.ila@flex--gmouse.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gyAhJPIJ; dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvPyL325rz30Hp
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 04:11:36 +1100 (AEDT)
Received: by mail-qt1-x84a.google.com with SMTP id j2so3049556qtv.10
 for <openbmc@lists.ozlabs.org>; Mon, 08 Mar 2021 09:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=tr6HPkgg4MpqWELU1JEOSqGDxtxLd5dCELHGhpEUINY=;
 b=gyAhJPIJZ6+npspbb5RY1bDEB+mSkCu8gFewM5MDwQZqi/n5g7l7VNpeB+OUb2Q7K6
 ITZoyRrIpyK7YGSyE/7d3h6V5mpk5r87VAHlcRCfogUl4NQG2kU2V9HVM6vVCYge1hC2
 vgU1eoNz7eFQAH9g2FhM3EJKsONxpLgfbxT54RRsmsNKbqIC3JxUSaRqxg8yQ2J35hU6
 AFsxOOgCyHlOCOFnBHjOkZbOxgj7POoHgHnZsjCZU/ioxYx18OxtS/7JWAKp60fA08/S
 8pszrq2V3vWtXxDGJLyFG/cwUubVBuGKtZKW5i7UiBGFYLm8j3pquD04A7PKYmYG60oi
 CHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=tr6HPkgg4MpqWELU1JEOSqGDxtxLd5dCELHGhpEUINY=;
 b=X8NwzzZovbXLvvZgxid0ylheRIQ00JLOCvBXRV0jyGUpodD8sszVAZs6UDA4Fuuftf
 JYYwazsNGmT4sEcmzGpToneubIeKQS9wJpibw/rxzVCz1erzCARHTWrSpAGTXh0xxzsX
 vdDfGPDqP3Eln8Kly9Aa+uMLiUK380b3CcZLSdf8pI8SFYHZnbgqOlNCs2Jpggn+p5vF
 tFOayRpFN14lqN8zblddqDw//JX0P/rycvjYoWtyt+lwgwBqvN4Gc8UpFWn+v7w4mnOw
 3hUSc6g0vmoeUdKnUqLcWO8agR6ea8+ce/wFchPC1Xwb38bQImxVXCqz6XQ2ZTPfcr82
 NpBQ==
X-Gm-Message-State: AOAM533PyKaSah4VV2fpqpp80bkQ7jFYl/S9HVHE8qS4cmxPIGiR7MSC
 N88STP4ji+d63BBq1e+o328P1ayq4QU=
X-Google-Smtp-Source: ABdhPJz2ZlLneZ3FlZYATGAP2s9AJEsAx87D3eZviiGASrYqqJBH+I3gnmjuQ3+KB7CzOVlhxMACVsrGq+U=
X-Received: from gmouse.zrh.corp.google.com
 ([2a00:79e0:42:200:8548:5463:8d18:40de])
 (user=gmouse job=sendgmr) by 2002:a05:6214:4b3:: with SMTP id
 w19mr21839691qvz.26.1615223491101; Mon, 08 Mar 2021 09:11:31 -0800 (PST)
Date: Mon,  8 Mar 2021 18:10:50 +0100
Message-Id: <20210308171049.3962577-1-gmouse@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH v2] ARM: dts: nuvoton: Fix flash layout
From: gmouse@google.com
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 "Anton D. Kachalov" <gmouse@google.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: "Anton D. Kachalov" <gmouse@google.com>

This change follows OpenBMC partitions' naming layout.

Signed-off-by: Anton D. Kachalov <gmouse@google.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 38 +++++++----------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index 9f13d08f5804..55c5a89592d7 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -78,8 +78,8 @@ partitions@80000000 {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			bbuboot1@0 {
-				label = "bb-uboot-1";
+			u-boot@0 {
+				label = "u-boot";
 				reg = <0x0000000 0x80000>;
 				read-only;
 				};
@@ -88,38 +88,22 @@ bbuboot2@80000 {
 				reg = <0x0080000 0x80000>;
 				read-only;
 				};
-			envparam@100000 {
-				label = "env-param";
+			u-boot-env@100000 {
+				label = "u-boot-env";
 				reg = <0x0100000 0x40000>;
 				read-only;
 				};
-			spare@140000 {
-				label = "spare";
-				reg = <0x0140000 0xC0000>;
-				};
 			kernel@200000 {
 				label = "kernel";
-				reg = <0x0200000 0x400000>;
-				};
-			rootfs@600000 {
-				label = "rootfs";
-				reg = <0x0600000 0x700000>;
-				};
-			spare1@D00000 {
-				label = "spare1";
-				reg = <0x0D00000 0x200000>;
-				};
-			spare2@0F00000 {
-				label = "spare2";
-				reg = <0x0F00000 0x200000>;
+				reg = <0x0200000 0x580000>;
 				};
-			spare3@1100000 {
-				label = "spare3";
-				reg = <0x1100000 0x200000>;
+			rofs@780000 {
+				label = "rofs";
+				reg = <0x0780000 0x1680000>;
 				};
-			spare4@1300000 {
-				label = "spare4";
-				reg = <0x1300000 0x0>;
+			rwfs@1e00000 {
+				label = "rwfs";
+				reg = <0x1e00000 0x200000>;
 			};
 		};
 	};
-- 
2.30.1.766.gb4fecdf3b7-goog

