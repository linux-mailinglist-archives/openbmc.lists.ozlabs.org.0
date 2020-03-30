Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A6D19738E
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 06:49:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rKjm27KKzDqND
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 15:49:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N3Q3UJMg; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rKgv7530zDqWW
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 15:47:23 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id r14so5526367pfl.12
 for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2020 21:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4G3eNfMsJOvNOHDBqh862hk5h/Cp6/P4m03gSY6XZ3k=;
 b=N3Q3UJMgPvicdzPFBz8CNaZqNlG1mQPAOCT/2UCIzLg8cB4yjDkljty8+Ggb7gI7g/
 eSSJh6eyF95q7bAJbptWLSaS0/LJygDpzn6B30yxO1cwXA3lKD3naxMC4/rBBL5i1dfD
 8/E4ENXn5Zdzwf+S42Lle0FTXf935nxHZp7eb1Wdkml6cF5NbLU9wr1AFh0hPW+jzrbB
 9+tep1mJfO/IqtzaQtAN8pwk1NZKcVjLnLxejmkp9CpE0mLuvui95iWftwkL+FXz9c8s
 pqL+HTF/mlEmAjGhAggieSo/LGcdrT/nn4sL1T7p1/8wF2l2QjorU7vELYtdOHazPuEI
 OR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4G3eNfMsJOvNOHDBqh862hk5h/Cp6/P4m03gSY6XZ3k=;
 b=HndjrILBUTXTmkdYNhGoJ/SW6EALMNEzETyNxZKwmkMMYOQkATjlTkWDPiSawQOfz8
 a/FxIz9gOXVD7C5iKekYr3P7jS2F0HRjdK9eiwePo2ybBUbw+wwK6/Xqc1KpE5Kir7CN
 wBSQRGcddrhDgzNbOU1DkuOxtrv6Sn30cK1JQVCexSdbpkwskLwWJdsWZfYB53FR05FI
 NY/Mj8kfY6/KU0zMJDR8e3y6SrYPSYQJulI+HbFAgfcTxEt1ThL6EjuOm7ImxyTODuIV
 +RuuY3ji0gGYhkjWiB9yeleViGhrEXk2mSjRlwdffWQkMN89Puc5FSRFLg/pi0cokJ1D
 O6Zw==
X-Gm-Message-State: ANhLgQ2liKe7oqW0ehoARdOSQemWtgxr8MR704dbHbaI+inrsodMryB3
 amCPh9OQ8SlRFdXxUSG5NsA=
X-Google-Smtp-Source: ADFU+vv0mQdNkNztYiEB0TMj3HR3MzHtLXZcT4KYWneghKKtJHbYXWE69PqCirtVXtgtjdepqE67tg==
X-Received: by 2002:a62:1894:: with SMTP id 142mr11604053pfy.27.1585543640800; 
 Sun, 29 Mar 2020 21:47:20 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id x27sm9239537pfj.74.2020.03.29.21.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 21:47:20 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Eddie James <eajames@linux.ibm.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] ARM: dts: aspeed: rainier: Add VGA reserved memory region
Date: Mon, 30 Mar 2020 15:17:07 +1030
Message-Id: <20200330044708.195184-2-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330044708.195184-1-joel@jms.id.au>
References: <20200330044708.195184-1-joel@jms.id.au>
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

The BMC uses reserves the top 16MB of memory for the host to use for VGA
or PCIe communication.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 4920ee384078..708924fe42cb 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -33,6 +33,11 @@
 			no-map;
 			reg = <0xB8000000 0x04000000>; /* 64M */
 		};
+
+		vga_memory: region@bf000000 {
+                        no-map;
+                        reg = <0xbf000000 0x01000000>;  /* 16M */
+                };
 	};
 
 	gpio-keys {
-- 
2.25.1

