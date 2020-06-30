Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53620E9EE
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 02:12:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wlDm41tPzDqdZ
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 10:12:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GZswfwgE; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wl8L2xFCzDqcv;
 Tue, 30 Jun 2020 10:09:06 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id bj10so2506252plb.11;
 Mon, 29 Jun 2020 17:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eqibuAlbVerKw/zefMiddrebHe1JsCRw3HQfqdX+MX8=;
 b=GZswfwgEpHRnkCLZDWcoi5oj2YnH2/71kUslgS0hEGKRctt7+oWGXAR100Jk3nSNoY
 RVBbfykXXOddSv0OfVfN2rgSEmJ3Wq7bkMD0+St3Lxm4AbVcd6uXuUnu5Y5XqNlWo0mG
 ORxdMawTlko0koyR0spoOv9bocVpjmjlltuP7BSk/BvFymVrhSRwW00Fw2NYIfkbm7as
 1Cc2XUK7+2JDYbjkyC2Stcjr3qKEb8xmlaZxXTJnfB4Sx+eXDwLgR+Xk1G2Nl8OnpS6W
 hY6OIvnclwLsVpTj8CpUpQuI90qsJjqt4tuSZoKVcpuF0CAQ2dy0dvm+OfpCV+HxDGjn
 73YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eqibuAlbVerKw/zefMiddrebHe1JsCRw3HQfqdX+MX8=;
 b=cGQ/hDmetJDLxqK5uuCmgECfpf5JjLnswXohWV8kQto3PvtWo2/yDp50eEtIak7jPy
 KRSSWoAVQKfir9A4/e8Fg1HsA/gFeslqHYrgDaYEbw0gHtgp8m3bw9NjG/1+kdadHVtt
 NT+tdWIYVhkP/UQaDUxIl/phfc1Hxef1lgB+uKvA960PgIzvYXTUIkdqZHYaRrSVQ9m1
 8pe1YvguzCIGl/UMvnwLYg8ehMCU/Sc3ke9Rpo8Wo6nFh53txobguvFViLINn63EZ3O2
 qJ2a5RazeHy0S7g43lLjXi0pkTdZZsfDKW44snMUqv3gML6fm8/RhwLLa85/lmc/RnSs
 vEJg==
X-Gm-Message-State: AOAM530mFFXCO1LCntWrHSziaWMMQQgrLoeCopbRmO5Bh54MTwNm7XcO
 xgfJuIIUm2HKwNTlxGyVaH0=
X-Google-Smtp-Source: ABdhPJywOKmCFfyQ5L/XOiQUMEjegV1m/9OHXGCYWL5vhYb0EzL028liqixSQqewmEE6FjLYW5NzPQ==
X-Received: by 2002:a17:90a:ff16:: with SMTP id
 ce22mr20515645pjb.160.1593475743310; 
 Mon, 29 Jun 2020 17:09:03 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id m9sm754600pgq.61.2020.06.29.17.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 17:09:02 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 1/3] ARM: dts: aspeed: wedge40: disable a few i2c controllers
Date: Mon, 29 Jun 2020 17:08:49 -0700
Message-Id: <20200630000851.26879-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630000851.26879-1-rentao.bupt@gmail.com>
References: <20200630000851.26879-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Disable i2c bus #9, #10 and #13 as these i2c controllers are not used on
Wedge40.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index 54e508530dce..aea23c313088 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -115,14 +115,6 @@
 	status = "okay";
 };
 
-&i2c9 {
-	status = "okay";
-};
-
-&i2c10 {
-	status = "okay";
-};
-
 &i2c11 {
 	status = "okay";
 };
@@ -131,10 +123,6 @@
 	status = "okay";
 };
 
-&i2c13 {
-	status = "okay";
-};
-
 &vhub {
 	status = "okay";
 };
-- 
2.17.1

