Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 741EE934FEA
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2024 17:31:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FWRfNF16;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPxcG2hvSz3fVZ
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2024 01:31:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FWRfNF16;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPxbj1rXDz2yvx
	for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2024 01:31:11 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7163489149eso726453a12.1
        for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2024 08:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721316666; x=1721921466; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEFye0Dsk7Zyp8CrFXtXmiS20SE9tzlxERuXii0FnHc=;
        b=FWRfNF16BG6stF5y6D5Q+gIsshLun7fY/4UNDAost51DonB+OdE0axtQxK42Vv0Zcn
         D5viL3AyVedYjaFKQcu3SbYvUQwjvQXHHBTLVekXKpQtqQ1YRC3KVl8TkMK6NphwdBTB
         rN9GyIXb4cXkA04GWWnfbnyfRTftRimKf7oZ4F86rsPPmcWLYhZ/9fGlcICdQVnO0WxJ
         QMoCsEzIMomXJHDNUMdQkT8S7HFi9wHGDErGJiMFihQ+An4RK0gYNK6AoMTndNGTWYqt
         g/TZAAKbKNYDWau1+uIhl6kx4xwld/ERrX1YXgU27D+P7KCoCk6BOXsfego3gnRGpzAN
         mQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721316666; x=1721921466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEFye0Dsk7Zyp8CrFXtXmiS20SE9tzlxERuXii0FnHc=;
        b=Sj3rHJNSP8hSiCLmbmxARKJKKc8CPYY3LK1kj7+N2g587dW4luc9mu0FLLlHseSLE+
         2uYfx7kEP82C7r/EkF33lcUpr9jAVgyPIC00N6wsKYpsxdMbtFJWgUsSlD0xPHW1AI8K
         tyIrGyxAwXWLRaV68hVLA9btInvsqb4gx04oKCR2flYzJ6GSYwfiXHukc1/7CgTNX4kM
         zLJtnYK34TezWWgVtpd/PymofyIohAzTp33NKXvG7eraXYE9mQ5OZj4buJqH1cE8e7nJ
         FZiNIt1LJ2l2F0Mwt74MgswxaqXxYnmHILOhz3yivL9xb9uDh0kDRSkW3BITU7BkbwIU
         UVtA==
X-Gm-Message-State: AOJu0YzzknahYwKwhIss/oQOglwe3UaSeo86sUbdFQ6D/dg/Q4L4ABNi
	q4TFJ22gk5GLCX2sYAJe1ZosGgQ3sOXZbcVocg6sePFuBpy/Jk8RyduEYg==
X-Google-Smtp-Source: AGHT+IH9iIDEL+WGdL9Wn0RzH2IDPNP9k477harWlsX3Nbfiacb3TKbHAvd/yNtdLyb8xbEE9HHhWg==
X-Received: by 2002:a05:6a21:7899:b0:1c3:b1b3:75cf with SMTP id adf61e73a8af0-1c3fdcd431emr7025711637.14.1721316665507;
        Thu, 18 Jul 2024 08:31:05 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb77b045edsm794810a91.48.2024.07.18.08.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 08:31:05 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc 1/1] ARM: dts: Aspeed: Add Catalina into Facebook DTS
Date: Thu, 18 Jul 2024 23:28:53 +0800
Message-Id: <20240718152853.1291804-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Introduce Mata Catalina system with Aspeed 2600 BMC SoC.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/dts/ast2600-facebook.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/dts/ast2600-facebook.dts b/arch/arm/dts/ast2600-facebook.dts
index b988ff755e..c742ac1dc3 100644
--- a/arch/arm/dts/ast2600-facebook.dts
+++ b/arch/arm/dts/ast2600-facebook.dts
@@ -6,7 +6,7 @@
 
 / {
 	model = "Facebook BMC";
-	compatible = "facebook,harma-bmc", "facebook,minerva-bmc", "aspeed,ast2600";
+	compatible = "facebook,harma-bmc", "facebook,minerva-bmc", "facebook,catalina-bmc", "aspeed,ast2600";
 
 	memory {
 		device_type = "memory";
-- 
2.31.1

