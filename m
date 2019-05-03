Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A68F12E2D
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 14:46:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wX256JGZzDql6
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 22:46:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eGL6JRT5"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wX076My0zDqgF
 for <openbmc@lists.ozlabs.org>; Fri,  3 May 2019 22:44:55 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id z28so2866112pfk.0
 for <openbmc@lists.ozlabs.org>; Fri, 03 May 2019 05:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7XSv156rLdI7a5S/M3uGUnOSDabcbC7Ny+7WoJS21vQ=;
 b=eGL6JRT5SN//wWbHAU27IsQnrBimHurFgrp5xFPeJS4TJ8qiQBteioih/QVocriIn1
 gnIcYWdlVzgJtbsLDQIvO38oJpxsdaha32cUsgvsHVqJC9KkEK8RfFEEzWIqfq3zlU94
 95khcUoSyqLZEIc4AcxAfWAQJt1jvLyr0ghH3DJLKDy2HeUJ9jRrO//Twotn/pTdaZDI
 e/wzFDjpshqeh3Gi8yE4YpDnluBb9tpFF4SNLrkDW9pWYdSH62a7NqbpySr37AkOUc45
 Kl+Ovt0obaiXlEVyudtdfF+bfRVreyjmcWmnhv7uZrB1Jew6GcmMDkniptXuoBu+gxZB
 6ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7XSv156rLdI7a5S/M3uGUnOSDabcbC7Ny+7WoJS21vQ=;
 b=C24P9DPKyhmaGmIGFJjNdBH7qGzLNgbFoOtz0okO+xUlfGpPCNlhUky2JJqrkw77Vj
 9dj/FIUx1aCY5GX3iLhf25q6Q81iSw4eZ4XT+yAUy+vBW7f4E04ObIBhWib+0JWb/XQb
 aXHgjdEaxaJJWbNfiCPWLUeNOrVCaCmxQt0Zyd91mLY+T4cc3ez1+f6xvfgV33xCkLNB
 WySKrIVFIZYlpsBTMMiqITmDs8EmZ1rFkrcr/Vj3qoCBpSXMRHQVtkLlNM9OrytkJHKv
 5dYoO4oEGcPjd0g31eTTcYTDnmTt7hETZ3bN0ggVdPedQVtqZkW8BBE7JPFP1PxjtENh
 o8SA==
X-Gm-Message-State: APjAAAW//ugevErOi5pdSFNlMOUlz5V+CAJXRzi1nHDDbVgDYSY82uUR
 YGTWcRgOsyQbYirBk+S6DSNsrJyky+I=
X-Google-Smtp-Source: APXvYqzykRhiQx+Fzwf8mJnpQNb2Bq2uByi4YXkibISRXnYdemdxn+rANTrDS1PB8xCaUcsRVndcwQ==
X-Received: by 2002:aa7:8a92:: with SMTP id a18mr10549817pfc.218.1556887491602; 
 Fri, 03 May 2019 05:44:51 -0700 (PDT)
Received: from voyager.jms.id.au ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id c19sm2442659pgi.42.2019.05.03.05.44.48
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 May 2019 05:44:50 -0700 (PDT)
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
 Fri, 03 May 2019 22:14:45 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.0] ARM: dts: npcm: Remove use of skeleton.dtsi
Date: Fri,  3 May 2019 22:14:44 +0930
Message-Id: <20190503124444.5056-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This file is not present in 5.1. Clean it up in preparation for moving
to a future kernel base.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 04e842f460a9..da02aa70df06 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -2,7 +2,6 @@
 // Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
 // Copyright 2018 Google, Inc.
 
-#include "skeleton.dtsi"
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -12,6 +11,11 @@
 	#size-cells = <1>;
 	interrupt-parent = <&gic>;
 
+	memory {
+		device_type = "memory";
+		reg = <0 0>;
+	};
+
 	/* external reference clock */
 	clk_refclk: clk-refclk {
 		compatible = "fixed-clock";
-- 
2.20.1

