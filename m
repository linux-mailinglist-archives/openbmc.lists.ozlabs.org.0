Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA67E2507BB
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 20:34:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb1445f4FzDqN3
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 04:34:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gdaarUoq; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb0zT5z6TzDqMx;
 Tue, 25 Aug 2020 04:30:13 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id mw10so4643901pjb.2;
 Mon, 24 Aug 2020 11:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SzSkUtPUy4wSVm8hpGwKYIsMtSZm67ZS2O89snx6pwI=;
 b=gdaarUoqCIiwABxnpMXnnZ2mqx23KMdtcFUddAcGaLfi6EiKe87Sd4RcWgzIyc1eas
 ZJgxK6sKT54qQjg0ljWEvKmZ3ZSzJ/ZKbFk1EyugLWWNBUrKya0Ghrt/8z4sFy2Gx8VU
 kjAJlJOGY0eTan2ks3iEi3FfH7VIyiSNemFFXitUbXOQAK+QHfSYZK6MvzNeV/IMpsGJ
 9B2yYVHvKak1G2fFW+S8OsPmUdj0oWouxZ6PN3C6D84Q/xJHRmMorjQKDaRJPMuZ6jUm
 Nq3WUqb1tkAiCVGw4WYOPj+9RGn3qaNG3v7bEGs+djoL+NmccNhxhcMAF/fqVa3B20Qe
 ZXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SzSkUtPUy4wSVm8hpGwKYIsMtSZm67ZS2O89snx6pwI=;
 b=Yg2Z1i2Ix2CQZ1SFUK/Of9ixq74LVW5MZJdP9YbGicFAer4EXJKXDC4Bmgs8Yjo1Se
 Ty2ytePL0zlcT6Me/pld85w9Xh0Tgwi5QWhZDkLyzJHygvHvB7i0HZ0B+ZvmujogryDf
 AIGtt+Wp4hJC0BQfd4pn7xKK7zRGBFEKAJIgmN1sPq9DGXnF05Q8RwzJKvEK/75nfm+e
 HXYpf9x8PWNcKAyNpcRKP3YNFRNTzDwfawpZt15nxt7LHBLo24WrPuENgZsPGf1605Jl
 e+rNbCbv0f/KM7K8XIhFr8je+5I0Ql7nGjuVw4HJH6jtY16URThxvzr5XjWMYVFTB/2T
 ABOg==
X-Gm-Message-State: AOAM533wYNEZL0ruNpKxIKatOD5x04ZvaZXcgM56w5RNH52UWjP9vAZc
 45LDK6YYG3nu+BQH//4aMaQ=
X-Google-Smtp-Source: ABdhPJyQl90yeiPKm6q0o8ykCH0TN4o1q1PbqZ5ByEogQFJ2Fyp7SaLSzFATDLheHgv4Megk9cEKzQ==
X-Received: by 2002:a17:90b:1214:: with SMTP id
 gl20mr456752pjb.225.1598293810528; 
 Mon, 24 Aug 2020 11:30:10 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id a66sm3920460pfa.176.2020.08.24.11.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:30:10 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 1/2] ARM: dts: aspeed: wedge40: Update FMC flash0 label
Date: Mon, 24 Aug 2020 11:29:54 -0700
Message-Id: <20200824182955.7988-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824182955.7988-1-rentao.bupt@gmail.com>
References: <20200824182955.7988-1-rentao.bupt@gmail.com>
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

Update FMC flash0's label to "spi0.0" so it's consistent with all the
other Facebook OpenBMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index 8ac23ff6b09e..3f2a48fa77b3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -48,7 +48,7 @@
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
-		label = "fmc0";
+		label = "spi0.0";
 #include "facebook-bmc-flash-layout.dtsi"
 	};
 };
-- 
2.17.1

