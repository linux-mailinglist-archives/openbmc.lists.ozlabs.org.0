Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F7920E9F9
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 02:14:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wlG95BqqzDqSv
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 10:14:09 +1000 (AEST)
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
 header.s=20161025 header.b=NuiSCbQ0; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wl8N07NFzDqcj;
 Tue, 30 Jun 2020 10:09:07 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id g67so8173727pgc.8;
 Mon, 29 Jun 2020 17:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b+IGZ6PpnygOrvzFHrSSaDrACHYYVu9vYgrcmIAaoTc=;
 b=NuiSCbQ0oSqAv7iiF5qikfnPTsQDbEqi6aWPQHuzs/QkcqQ98qHp6wBqkD6XbBmDWk
 e82jReIUedwdHPM2bp/XHgPj8lOQUCRvzlE5Fpg93YgFr7BXdMuQmLA9Auf0CnmqCfnm
 JqZ9ExcPRomIBC5CqFQUyzTuF8/X+2uGLVZykeKD/ezb5WDzVxA3GJnQa5tSDieA2l3W
 /b/GVoFztFSupMHDyP84VziMeiYX9O2gKaU//U6xfzhxTVQ/nkULYGYsHI7BeVlJqsUG
 SJ8ynf2K3TM5BEJl5vWtijOHjiEHHk5dLXkHbfdj0QIOLkyxwKTidE+OD8Lqy/D5SjOV
 RQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b+IGZ6PpnygOrvzFHrSSaDrACHYYVu9vYgrcmIAaoTc=;
 b=IqqjLP5dUaa0iqHsHAvRo2hbu1fzpRgbbV4H3zt+LwjWLYzjFL1onHjNkVA4wwqoyE
 fGgzBE59EjEqtIiPiiVx3MCuYK9ORhZxdtlG1mNDErCAHOMsW10PTL1gkLeuqL3o5RHc
 oOA8wE130XHiGmmMlG8nx0r3dsyJxGJYJ+TkSuDtqnBuqSw4wkNmZKtKN5VJKoRdteMr
 vHhgDtgDjPCG3fl1UMtrIm7aOvIAqiMqD2AEWxH30qN4sh2kuQ9ELCU+Dw+0MMggdIZ8
 /v5jpClWV6Zv3JW1n/1LO5xI1J4f3tJ5dcCsiAr84Xj1uBPm1a1ZnpPLYpL1QE0aKPTO
 cj/w==
X-Gm-Message-State: AOAM533AU29C+iGLLwqueSgOWT85k3fbCM0gLtKzqdjEVfULPakOqYnO
 XZriqriuW3mOK942BEAbr+w=
X-Google-Smtp-Source: ABdhPJxJlzhlDCwbl4BKRLwMmmx7nhtrQm6pzWRE2A58IuRaPXG5n4u144jDdYNAnyapV80N6ZKJag==
X-Received: by 2002:a65:63ca:: with SMTP id n10mr12762077pgv.252.1593475745495; 
 Mon, 29 Jun 2020 17:09:05 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id m9sm754600pgq.61.2020.06.29.17.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 17:09:05 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 3/3] ARM: dts: aspeed: wedge40: enable pwm_tacho device
Date: Mon, 29 Jun 2020 17:08:51 -0700
Message-Id: <20200630000851.26879-4-rentao.bupt@gmail.com>
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

Enable pwm_tacho device for fan control and monitoring in Wedge40.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../boot/dts/aspeed-bmc-facebook-wedge40.dts  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index 1049cfa80ac2..8ac23ff6b09e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -135,3 +135,32 @@
 &adc {
 	status = "okay";
 };
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default
+		     &pinctrl_pwm1_default
+		     &pinctrl_pwm6_default
+		     &pinctrl_pwm7_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
+	};
+
+	fan@6 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x05>;
+	};
+
+	fan@7 {
+		reg = <0x07>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06 0x07>;
+	};
+};
-- 
2.17.1

