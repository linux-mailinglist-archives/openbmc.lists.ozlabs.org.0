Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6C27E30C
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 09:52:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1T5058LtzDqW9
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 17:52:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e6OQ/6ii; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1T4C0CnSzDqW7
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 17:52:07 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id b19so731098lji.11
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 00:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1c5OyVXbGVrRIGQ31bSb8EMeT1TKCNaKbCqWw/eY1rw=;
 b=e6OQ/6iiFYWMWHAitUHmwvrPUU3oxubvcaJgKgJuoHD4ow0cjFLLK7vB5Tet2Xkt0B
 ZZJ3PIVNVH7XBTQOOf0otpFRRYLXtaZl6bSeMidUYKqSA5/vS4LaiDlRKQ3LwvmElvQ/
 HYe1E6N2UL8i9dSFxgMxun+nFbWa9OVZnNSHMD+mivx0i40UtHKdji5W2ffQVQE5BUL8
 +CY0ypgv97VE2YsH+7DZVezR8JkumsYssYe3aJ4Qdh3TpiZsNuKQk5oS9zlExZVxrDcD
 hKYGDqEe92whCVTI3PzBb042FqWu6TZnO2w8xwhwWVgWrUXqS3bIXq3gn8exicdQ2Ix9
 zrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1c5OyVXbGVrRIGQ31bSb8EMeT1TKCNaKbCqWw/eY1rw=;
 b=czCWlophzwQ66pHkgHyHxD3RJyGAkBTVRvqm6h43a33Zuh2ZRPxaSS2donIAUP9Dw9
 kbYkGBamv/AEYP7/sG+Sm5ccBr7gcGdZYuwhH30c5ltsoU97q/u4D16qTGdr0vQSF8PE
 NJOOmypt3IKvabVzru9CVRnnt3CZX2/g7cIwt4+5J5Tq+7sOHu3ckkWuFSl/Qk4HloUn
 W/fkkB4doo4Zj5rGVivjxgGjx5RMWMFv0cEWNeMEiLvWutSX62SmECgMUXk9oiE7ijFO
 gEF76S0YjQJ0zDtasPfu6iAHBW+3zBWFSEvPdhK13kTbDTGlFrfoAjcr8kgzOHvGNGA3
 xvWQ==
X-Gm-Message-State: AOAM532jU5AFYS8dh608p+H1jY1B3B1yQGrSYYJYbCAY3BLgDqG7Fi2Q
 hZPqDoWph15+2rfcVmtOt3A=
X-Google-Smtp-Source: ABdhPJzzl+Gh1yUgNSEl0LPkcxctavTHVz3KGQLyuUu5JOJfQJ0jYFLPSW8bNK0YfnyQ9I1jMvTIMA==
X-Received: by 2002:a2e:b8d4:: with SMTP id s20mr450558ljp.232.1601452321447; 
 Wed, 30 Sep 2020 00:52:01 -0700 (PDT)
Received: from PC10319.localdomain ([82.97.198.254])
 by smtp.gmail.com with ESMTPSA id c19sm97275lfc.222.2020.09.30.00.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 00:52:00 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8] ARM: dts: aspeed: amd-ethanolx: Update KCS
 nodes to use v2 binding
Date: Wed, 30 Sep 2020 10:51:53 +0300
Message-Id: <20200930075153.2115-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

KCS nodes compatible property in the 'aspeed-g5.dtsi' file was
changed to use v2 binding in the commit fa4c8ec6feaa
(ARM: dts: aspeed: Change KCS nodes to v2 binding).
For the proper initialization of /dev/ipmi-kcs* devices
KCS node variables also need to be changed to use v2 binding.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 60ba86f3e5bc..89ddc3847222 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -139,17 +139,17 @@ lm75a@4f {
 
 &kcs1 {
 	status = "okay";
-	kcs_addr = <0x60>;
+	aspeed,lpc-io-reg = <0x60>;
 };
 
 &kcs2 {
 	status = "okay";
-	kcs_addr = <0x62>;
+	aspeed,lpc-io-reg = <0x62>;
 };
 
 &kcs4 {
 	status = "okay";
-	kcs_addr = <0x97DE>;
+	aspeed,lpc-io-reg = <0x97DE>;
 };
 
 &lpc_snoop {
-- 
2.25.1

