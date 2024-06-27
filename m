Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6861791B285
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:09:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V91Zjttb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dlt4ckkz3cbL
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:09:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V91Zjttb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdQ07Hdz2xjL
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:09 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1f6a837e9a3so46544575ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469928; x=1720074728; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eq7Km+kNindSOJ7hf0QT9SRfkWv9U1E4WEwZCW/4V7k=;
        b=V91ZjttbIluUoH5MNGzRmMUC1O8bft8niabW7SIoBm2GAKfSBuO3v++D+aeIp52xGl
         WBkdilyT0AoZOpIg7WyrYaO8U+CcSl3F5YCX15Jx7mTRkXJP0FNhBNZc0i3w0D6HgzxF
         gwP2p2hRyfeXUaT3TdfwfAOEFTBAhR/Ybv6Qw5Qfray1h/d+zRCcSgf/Az44KfVTUmrp
         CIxiC4rRJgDp6Up33VJJn6IMFaKMo6gEPiAh0YYOb18HVq138VIBLycdRQTDvOp9bvdR
         PTaF8POu59HFZcXEzoXhEyaAQtV8kGx6FVA4sNrPM7Sa9WycA37yHaleTkwwMkLbxgOv
         9d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469928; x=1720074728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq7Km+kNindSOJ7hf0QT9SRfkWv9U1E4WEwZCW/4V7k=;
        b=I7qT4VPbjvCqypHAIDW8MjMqaGVPUspq44KhGahP6IC1XhM/d9p2RAWmEKIOJ6g4TJ
         itFH0SkNeTjyQ/nHTNuLUh9bAkC44xykF8hXR2+uK0kH+aGDCRLt1Ulr8it5vhQkOb7w
         JWmB0ke53IuZdbQEkhUBW9D5Htb8FoJ9E8gt06FYDRn8UgvgsE+e2t/R/HUQK+rE9fd/
         DhgAbWd50a63OtCxmoagkQtNBDjsSCXO8jGWGGncnreA8V87h17OezXMy2YLNH3+23L/
         luthaBbi285sJFgDHokMdLo6QKlk7WPVhLxZ/HIj5xZ1eWvsS+wxXpuUOU1ORupR0+qF
         S67A==
X-Gm-Message-State: AOJu0Yz6/v3zt1Mwleka4AHnDPR0t7MGw2OzYj/TPm83+cObJJIwOjFO
	SyOpQ/ZvXm6DwldVWSkuCa4QNTJbK8ddXqr6PwjCCwO9z5rHt016FXpBZZEd
X-Google-Smtp-Source: AGHT+IE6H04NR9EBXpPNS7FVyIcXrOt4Rgl7i62wConuuxDPDulqY1I7virJaL9P1/v5sFx5p3m4gQ==
X-Received: by 2002:a17:902:d50b:b0:1f7:3a4:f669 with SMTP id d9443c01a7336-1fa240f30c9mr144578155ad.69.1719469928425;
        Wed, 26 Jun 2024 23:32:08 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:08 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 06/17] ARM: dts: aspeed: minerva: remove unused bus and device
Date: Thu, 27 Jun 2024 14:29:40 +0800
Message-Id: <20240627062951.936256-7-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jun 2024 09:03:24 +1000
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Remove unused bus and device.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 13819bc166cc..bc323bfbe514 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -315,10 +315,6 @@ rtc@51 {
 	};
 };
 
-&i2c10 {
-	status = "okay";
-};
-
 &i2c12 {
 	status = "okay";
 };
-- 
2.34.1

