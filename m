Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645E22BA03
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 01:09:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCShz5s3hzDrfs
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 09:09:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oKJuJgi3; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCScL0DhfzDrcN;
 Fri, 24 Jul 2020 09:05:53 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id g67so4065986pgc.8;
 Thu, 23 Jul 2020 16:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Zf3sEMsL0DPGCRUnLMz+Lz6K06ydPn+rQ+/2py+7OzE=;
 b=oKJuJgi3jXl0gFItYfYerp5IuxM+KnI/XCd+fqR7+VKJwnwOZTDB3UxG9XC0UQsCey
 aDPdu2Tb4JXmd/J3I3KcbxapdceIy8bznltwlbQ8vZwa9+AmhyO1CmAUB725E4bM+ONW
 N35jTF8ny1KZpsWHE9VhjuTaL8xYOqD89qq8JhTpL7zr0v8iks0nyKknj1CGvux++7KH
 Yidx/P7DfYyVOHv75uZniLyB3n8qhOKGM+QbYGd14sPARZXev81Aor5ml30g/SoWG/Po
 N7VZlNg+8snGhUFW4i1OCn66fvIe7Kg4UGMo7Ox7uCWzukia7dSWj7ifSpIh1GmuPLRc
 Q55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Zf3sEMsL0DPGCRUnLMz+Lz6K06ydPn+rQ+/2py+7OzE=;
 b=g/GR7EPKGmVuEzLjtnE0+1iyTb3JdEef5MxCZxIpR8OA09rp90uWqGnE4aZeFXCBJY
 WmdL74dM147jc5cnIDRN3TatnXOHzs0BHLV7Rq8hCHAOmvx9jDOkR6AM09H1ODAyKyCv
 ZWDOy/mD4zC4CO9qPfhfNOXX+qC2Pi+dmJxRdmHEU82jxeAu1YO1fXB29sr064xdH6Zb
 6154+DdpAjkdVCgsLp49hQ9E4sfLDH86OZ6K6dNF4H7lviMMsQJdCQTL95UKzcrf3cKA
 Wt1Tj8ofl9tXuIdujry8Xjcl8yUeMUPROu38k/tyCBfNbwLiWnq5hzxmvPMhwwpNLY7p
 B9og==
X-Gm-Message-State: AOAM5330MoBGMm2/7dcS7N/lR1VEGvGDmx/exPZQnZUsbnWbU3oqd7sP
 8sLSN65o5yOX/ktDLx64cTQ=
X-Google-Smtp-Source: ABdhPJzSr/qRS6pTZToh9J+O+BKWXJaU9VYurAj++Srk/ErDDZN8/HehZ/qFCw5K6+UHcK0Q1jzQfQ==
X-Received: by 2002:a05:6a00:782:: with SMTP id
 g2mr6316942pfu.126.1595545550863; 
 Thu, 23 Jul 2020 16:05:50 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id gn5sm3644742pjb.23.2020.07.23.16.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 16:05:50 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 2/3] ARM: dts: aspeed: wedge40: enable adc device
Date: Thu, 23 Jul 2020 16:05:38 -0700
Message-Id: <20200723230539.17860-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723230539.17860-1-rentao.bupt@gmail.com>
References: <20200723230539.17860-1-rentao.bupt@gmail.com>
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

Enable adc controller and corresponding voltage sensoring channels for
Wedge40.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
   - Nothing changed. Resending the patch just in case the previous
     email was not delivered.

 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index aea23c313088..1049cfa80ac2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -27,6 +27,11 @@
 	memory@40000000 {
 		reg = <0x40000000 0x20000000>;
 	};
+
+	ast-adc-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>;
+	};
 };
 
 &wdt1 {
@@ -126,3 +131,7 @@
 &vhub {
 	status = "okay";
 };
+
+&adc {
+	status = "okay";
+};
-- 
2.17.1

