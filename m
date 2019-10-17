Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF23DA2B7
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 02:32:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tqqy21HhzDqwh
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 11:32:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N5XE0UXg"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tqnH0WlwzDr4Y
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 11:30:10 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id f14so222007pgi.9
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 17:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LgFL6uuElnM59wfqPefCVyA7w/FbX4l26GIcU7B1KFA=;
 b=N5XE0UXgsc1BTKLPVx1fYU7dQTOu4+whOWAwHE5bY06KUkAAjvUFvSY1heGSdZ6WaS
 LSyb8yvJ0ME+l22xrCVrudXVBhC5NWfBGmmEhS/HnLxEepNClCk8rYT4uoD46g5lqdA6
 NGDqchQsy1Q1U2vkEeDDeH2vyWGf/3B6k3NDPZSPcVtN57RRGTCS16yg1JVwRMl6JrQL
 LBijFxhLStfadWSd2bKndTGrlimcxjHfqPHR4kGOaVd6LkVoAL/uvYHns8JUCLi4coq2
 lU5QrfRJCgQwznN7moI99miCZlbZeDSPHIYGFsMEt5BaqCaO7rR2QG1ssIe+udowRM0d
 qvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LgFL6uuElnM59wfqPefCVyA7w/FbX4l26GIcU7B1KFA=;
 b=uidUqwZb/k3PIpFAcDA8M7mjBrFV92PEC/w6uY4qrwFrmbXUiwH0of0LiJWWKeVp/9
 FWnDLuVakWjLPbyHA/FT/gM8V+ludep9KfawjDALt40GTJfNhK2KSGwp8MjjJ9ATVM1a
 NdEH7lvhpps1oDq55dLc2uTBR0aWOnM2VtdjF90WSZmhPDmhf3CjnjQRSxVes/Bipa/g
 ixkV5KVX1p6EWzJvS8l5Bc2u50WgkEtVsUicyFEejalKqnfoRZTXJgrvmhqqVlvUhk4/
 EXrnaX+V1xKCz+O3fyX4CIPjjraK4ZpDkT3xJZr5yyP+XtErA/5hCBDI2uBpaPJ03iqW
 T9hQ==
X-Gm-Message-State: APjAAAUsvXfgce4ZPEI+9KDJpM1g364qychekmr2IoyVjlVGFYgXLM4s
 lK7w5503jXuDT28yZ/URcuiIsBsXyWo=
X-Google-Smtp-Source: APXvYqxbA0/etb0bw8M77TkVWYH76kX0wuS3oLo3q+IiK0AhyPy/qZgfYnzWCUNZrFdNuMC0rkyLMw==
X-Received: by 2002:a17:90a:2302:: with SMTP id
 f2mr889223pje.132.1571272208368; 
 Wed, 16 Oct 2019 17:30:08 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id z2sm265261pfq.58.2019.10.16.17.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 17:30:07 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 v2 2/3] ARM: dts: aspeed: tacoma: Use 64MB for
 firmware memory
Date: Thu, 17 Oct 2019 10:59:54 +1030
Message-Id: <20191017002955.2925-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017002955.2925-1-joel@jms.id.au>
References: <20191017002955.2925-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Mbox's file mode needs a window the same size as the image being loaded.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 fix alignment
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index c073ad8d071f..bf363a735232 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -27,7 +27,7 @@
 
 		flash_memory: region@ba000000 {
 			no-map;
-			reg = <0xba000000 0x2000000>; /* 32M */
+			reg = <0xb8000000 0x4000000>; /* 64M */
 		};
 	};
 
-- 
2.23.0

