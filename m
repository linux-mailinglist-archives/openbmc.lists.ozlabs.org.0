Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6343542D3A0
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 09:28:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVLbg5jRSz2yn4
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 18:28:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HlYQB5Y0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=wangzq.jn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HlYQB5Y0; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVLbD0HKhz2xsx
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 18:27:49 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so6256080pjb.5
 for <openbmc@lists.ozlabs.org>; Thu, 14 Oct 2021 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=srrfvRHc4CHYWKmIvLb/SDpKTNLpQbNJL7vbzM1t244=;
 b=HlYQB5Y0DZFztGIYa0LvoYIPDC6pl3P0vKnplGSsCOrEo6xrC98vWiStxYzs3o1bY3
 AIDZF40E/0gCTjxHruubuh77TRDe9z3xd2B7clzF0rDS4dBoJbfSoteRsKEk2LPEqEGw
 /wOMTzPsu/TwDUCTA2J+j3DExSeeCPlzckDGURpmaQ1KF7yTiXHr3Bsg4REmxAjMEq6g
 Xwagoe4FmCmJD+vwe/B4h+8VA9MY+sxcDDzI0wSyFuoPc63oD9/TP17QZoNR9AvQBS+n
 oJ5MKAVBoXnzg+Y8Xh3wth/SuzUaKmGGeE0AIfVrLt73eutsknsrmUxWAbf14X4EUN08
 pzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=srrfvRHc4CHYWKmIvLb/SDpKTNLpQbNJL7vbzM1t244=;
 b=WgGPtS/HtvBk/uwvaM8AgZfXQh2IRJ2mzXI7KBKCvLWrhi6T4zzLd3WcUIXpUUENoo
 4exghNsyzQMiVQAQ1Vpk+R7JflUCZwM3TKJx6k7QjfUiaX1K694O4UXO64v+Xmi6MmVl
 sy9OCwwMgLFZ1/EmmRIEcQsLgm2ir9we/c+ps3VcXINOCVMvFtnRdlJTsBGpRlR/ZHS5
 DPbvQfiOMccQPeZbbGj7BzAREKw6PtyL3kBZgNPwN6usvNogAxA1i4hok+booHeWkQ49
 A+8xE6R5l8f14b4QcTIzspXOOUUsBBl0lrgLQ7SVt63RbZZZ2LBx0fgLFnQsB38ZSpEs
 K4WA==
X-Gm-Message-State: AOAM531oEpztyRJwKC+hgKL4xUDbQnWdVnwEkIpQd9qXtORC8ib4FNvj
 RBufS5hw/WBGzpNGIN4xWE288vbhLAfEkyp99tM=
X-Google-Smtp-Source: ABdhPJw9SvH3UcEpa55+/S62nsl5dj8A0WkWlhW9FOVeKGtYptyZAmetNAbSZWbqI76VvYvWIoJ68w==
X-Received: by 2002:a17:90b:164b:: with SMTP id
 il11mr5005614pjb.98.1634196467222; 
 Thu, 14 Oct 2021 00:27:47 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id k14sm1573228pji.45.2021.10.14.00.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 00:27:46 -0700 (PDT)
From: John Wang <wangzq.jn@gmail.com>
X-Google-Original-From: John Wang <wangzhiqiang02@inspur.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	liuxiwei1013@gmail.com
Subject: [PATCH] ARM: dts: aspeed: fp5280g2: Use the 64M layout
Date: Thu, 14 Oct 2021 15:27:43 +0800
Message-Id: <20211014072743.939293-1-wangzhiqiang02@inspur.com>
X-Mailer: git-send-email 2.30.2
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

Use the 64M layout since the flash on the board is 64M

Signed-off-by: John Wang <wangzhiqiang02@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 1752f3250e44..4574dcd72df8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -245,7 +245,7 @@ flash@0 {
 		label = "bmc";
 		m25p,fast-read;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout.dtsi"
+#include "openbmc-flash-layout-64.dtsi"
 	};
 };
 
-- 
2.30.2

