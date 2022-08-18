Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF7659CC50
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 01:40:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBTP81l45z3bvZ
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 09:40:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FEt60bpp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FEt60bpp;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Ygq6S1Xz2yMK
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 15:42:47 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id x63-20020a17090a6c4500b001fabbf8debfso804501pjj.4
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 22:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=khqf1k3+MfYNkalxMZpYKoE5do6tLfZ/fJm+K3skWls=;
        b=FEt60bpp5tVbIgreY0rCLhxVx8JmflDWcWCXuhwxQKdht22OvYSxbt/78528D9Sp1L
         K/2trrrdz/Ea9H5pGYuue664Z6tkKCaDv/jXWdxMXzTEpGLSsXXdZKNSRTvWITcJFuuf
         cPhZnw9NUd+E5EYTggvc0PTKHNO8HA3OZlQSXCFtJvxn4P+B+p5TPPG2BqT/6iuC6IVZ
         WX8mMc1vuW5oc+C9Hmc+Cw8mr/F4U+S8Sfg/NEy0xKujeGTWQu+E5Iq84SbAWrEQWRHZ
         Nv2/kQU9rU628QOw9tHFBkf9oI6J3MnzSvh2U/l6fs0IksPbggx59kca5EQpUBw4nJOq
         DBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=khqf1k3+MfYNkalxMZpYKoE5do6tLfZ/fJm+K3skWls=;
        b=HG5w9qIaNngmqszOP+CnyLZazpjNUCv4UxZkN0aNuJ/lT7tAUbaNKsg06mLLSmfIZU
         OI4cXfTUpbjF38GQCBhAyF2bXS4sWc6SKAqUeIyIdZVcwtVu9ZD9rFZQTbvHlrjYJcMv
         wgxSZaq+t4ZLDtYEmYi/Md0DrA+bDDMfZj+4kO/9TYkJTIEmTAt1hn+nw2Je5Wk1rCo5
         oSAjjW6RLR1zqpBZVuoKIsgXaIY5Wy2nQt61EJIYbFYg4+HU5/BrR5VEQZXkDjvwvYhQ
         BZR8Jo9ggv9nIro+byxL7KFC7VGSc5vsjc4skXdZ5XLfAIo/DuJeSWefcteeRczU4GY9
         mx8Q==
X-Gm-Message-State: ACgBeo0B1/TMfVGGJTL3qnZBzUPRoN5LXD0JfHaHxXk4DltjRMOMxcHR
	NyqtX/AS4sa3CvNKhKsQelSAAGvtLMd0Og==
X-Google-Smtp-Source: AA6agR5N6/er9jigNhJLVVQlbwI6TkYPScy7hVaOB4002cq3eqOfRxHCN8+zyIX8WsCeLxUgrsdiTA==
X-Received: by 2002:a17:903:120d:b0:171:4fa0:7b4a with SMTP id l13-20020a170903120d00b001714fa07b4amr1281386plh.45.1660801364548;
        Wed, 17 Aug 2022 22:42:44 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id x22-20020a170902821600b0016d5626af4fsm459129pln.21.2022.08.17.22.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 22:42:43 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 1/2] ARM: dts: aspeed: bletchley: add USB debug card IPMB node
Date: Thu, 18 Aug 2022 05:03:55 +0000
Message-Id: <20220818050356.1459349-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220818050356.1459349-1-potin.lai.pt@gmail.com>
References: <20220818050356.1459349-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Aug 2022 09:39:56 +1000
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
Cc: potin.lai@quantatw.com, Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add an IPMB node for USB debug card (13-0010) to support IPMI comnunication

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 9fdb3d17596b9..54c9f182f6a5c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -7,6 +7,7 @@
 #include <dt-bindings/usb/pd.h>
 #include <dt-bindings/leds/leds-pca955x.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/i2c/i2c.h>
 
 / {
 	model = "Facebook Bletchley BMC";
@@ -946,6 +947,13 @@ &i2c13 {
 	multi-master;
 	aspeed,hw-timeout-ms = <1000>;
 	status = "okay";
+
+	//USB Debug Connector
+	ipmb13@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &gpio0 {
-- 
2.31.1

