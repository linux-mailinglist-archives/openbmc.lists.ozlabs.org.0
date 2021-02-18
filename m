Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E7731E9E4
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 13:42:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhDrS6F8Kz30Nj
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 23:42:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=CyA8njne;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--gmouse.bounces.google.com
 (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com;
 envelope-from=3ugauyaykbzsdjlrpbdlldib.zljlmbkyjzifpqp.lwixyp.lod@flex--gmouse.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=CyA8njne; dkim-atps=neutral
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com
 [IPv6:2a00:1450:4864:20::349])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhDrF47WSz30L4
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 23:42:35 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id r21so641397wmq.7
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 04:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=12xH3yyVOIuqoskf7QIx7KU01U1JfoKfQv8+ls70s5Y=;
 b=CyA8njneqzwx2QyxmhsXyAbAj6GktuUw2eXrjvynifGNMjgoD6ihUmf5ciLkaJelpg
 8mU2Ld78RXoaSrF3pl11AKBVFMldWipzz14CMefIocrk+nzHOz3kvIAlu6UZh3W5mhZW
 us1wcIyJUZYkYnOcALoaoe9FOu5MPpV7GEC5owLBDvv3iEgcXzCXtaycTIYttQZbkFww
 Ku2MIfXssrHvrBFmQkNrcglySF9UBK+jcKeXwC9pSNxV0ifpLnaQn2bubwfrWnXI2ZDz
 K8WJ8O+3KFZuA3Y9i+eyIdvLdTjrHlr7NZ69eSGjI/xIhuqgQEU3hJBu5VQ4GTQ5kinU
 ySLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=12xH3yyVOIuqoskf7QIx7KU01U1JfoKfQv8+ls70s5Y=;
 b=QLAwjyx1yuhhMu0RHPQofxiZy3Ce/LJc0V0qoknRl/p4yzAvTSt2wMl913WG5deCCb
 aoFmXJS0rLO3NXTcIwmE2W5e0DRUfuGoeQ6vkcqh9UFpdgS6kWuAXQ4x0xfC2MOHPKv0
 BmJ5nuWc/rULgADBq5/tser3zVBe8Sc5pKC8U3DdLCZdLSKFtplZZRRyEGhmx+L1E8Z/
 KJRpcDCTtm4fxaCrrWU450yyLymqPcUAGgH9pu4e/vnLMJZxew86vsSmYxDeQwLxHnsv
 7vH4PONdSDi8/0BmSJjDHM2X3UrL2D/81bEnJn2BzHHJjGzx+7zRAThCyjffQ4Sfd+41
 oCiA==
X-Gm-Message-State: AOAM531HDEokCT/bKiVgQA5KsVEq5LKk4i+hQw4+7YxcIZ+29wnGjs4j
 qNwiIX/pccj3yJ2LWU6j+rrXzhAX7Hc=
X-Google-Smtp-Source: ABdhPJyiVzxI0YDISQjX2JBs62xB/E9eeIJjHXfwdsQddnhZzCp5OUmTVJXXsb4k3DDzpTQSBkI+6N7B50k=
X-Received: from gmouse.zrh.corp.google.com
 ([2a00:79e0:42:200:f532:e78:dab6:4447])
 (user=gmouse job=sendgmr) by 2002:adf:ec82:: with SMTP id
 z2mr4277790wrn.16.1613652152566; 
 Thu, 18 Feb 2021 04:42:32 -0800 (PST)
Date: Thu, 18 Feb 2021 13:25:46 +0100
Message-Id: <20210218122546.3546582-1-gmouse@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH] ARM: dts: nuvoton: Fix flash layout
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

This change satisfy OpenBMC requirements for flash layout.

Signed-off-by: Anton D. Kachalov <gmouse@google.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index bd1eb6ee380f..741c1fee8552 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -182,8 +182,8 @@ bbuboot2@80000 {
 				reg = <0x0080000 0x80000>;
 				read-only;
 				};
-			envparam@100000 {
-				label = "env-param";
+			ubootenv@100000 {
+				label = "u-boot-env";
 				reg = <0x0100000 0x40000>;
 				read-only;
 				};
@@ -195,25 +195,13 @@ kernel@200000 {
 				label = "kernel";
 				reg = <0x0200000 0x400000>;
 				};
-			rootfs@600000 {
-				label = "rootfs";
-				reg = <0x0600000 0x700000>;
+			rofs@780000 {
+				label = "rofs";
+				reg = <0x0780000 0x1680000>;
 				};
-			spare1@D00000 {
-				label = "spare1";
-				reg = <0x0D00000 0x200000>;
-				};
-			spare2@0F00000 {
-				label = "spare2";
-				reg = <0x0F00000 0x200000>;
-				};
-			spare3@1100000 {
-				label = "spare3";
-				reg = <0x1100000 0x200000>;
-				};
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
2.30.0.478.g8a0d178c01-goog

