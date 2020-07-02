Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 414AA212F57
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 00:14:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yXSz55SBzDr83
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 08:14:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kg6yLeFQ; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yXSC47rRzDr5D
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jul 2020 08:14:03 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id o1so5264649plk.1
 for <openbmc@lists.ozlabs.org>; Thu, 02 Jul 2020 15:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6oWu8CGvUHxicXVBr6Djg+FI6SK9f+5RLFtIeKJCKoQ=;
 b=Kg6yLeFQkYuYlGuTGlH8RpB/8QyZN7ayi8Kmblyda3HyVQW8KZarHzTEO8j9QiIQQ2
 Ojyw1CijRsJmicug/Cc/ouz7/zxT6z45Ls2cIyk2euuvZ04DbKj3pIIFNOby+jBti/iW
 f94ZMLPw/RrmZbPTVpXHLles2/HvxgPRn1fUZWUWDO3nL8iiWvKZnnY2i1rYV+KXZbyl
 U/CyLRJtpBd1uWKL4yZu3qfZpdWu0OZ/nmLCgI6OwcdluJg9LS3L7U5AcNZNcQQFrpnR
 xQgK59XDDBAYP1AOvrXQNYbVvJuzg5NaJf1wbmeP9k4xlirDBsKue62x9TaU/Whbv6Hs
 v81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6oWu8CGvUHxicXVBr6Djg+FI6SK9f+5RLFtIeKJCKoQ=;
 b=Ju9Quj4B+gogsqWZMKhiPeiTo6VLso4iQp3lu+cv+0snm1jGESHHQ8Ug4CkIsFduaj
 yq81WT5PiVEwGxLbLsWm10rjmnQR+Kn8f/CXXNTLxZmr4r/m5wymtO23mZ7Mq3PiLFVa
 KiJ4RwaH2rC1iDKAtXa6XDG4RLbFf2HxwrwXvcLQPK3Wt4NUeQ2O7ynlExG7NGWaxueA
 b+oS1sm0SrxG/MHJ26h/zgLqYPuZjuQ6vO0hQilZfya78Nvt0ETmyzvBppqeWp5xuejl
 3HTpCV8tkc0h+VSOSqGZWdfP8jHIDq98qEJr6B5f3jka6rnmGaybPad/gaxm706ZMmrF
 4leg==
X-Gm-Message-State: AOAM532vpAa4SACToqQIYhSkPA9ByrX5AjsAosPSQrJNs+D4bBXk4WWk
 wrCMzv70UbpmQtE3fcxkCKE=
X-Google-Smtp-Source: ABdhPJyVFpqOvhx2lOLP9HTgx4ksvqPWVFw5kfuwAYv84vVPBxgiuYi8T6w/iZ621zdxYYC2MmlsBA==
X-Received: by 2002:a17:902:9a02:: with SMTP id
 v2mr28968513plp.321.1593728039427; 
 Thu, 02 Jul 2020 15:13:59 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id nl8sm8979501pjb.13.2020.07.02.15.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 15:13:58 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 openbmc@lists.ozlabs.org, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 taoren@fb.com
Subject: [PATCH] hwmon: (pmbus) fix a typo in Kconfig SENSORS_IR35221 option
Date: Thu,  2 Jul 2020 15:13:49 -0700
Message-Id: <20200702221349.18139-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Fix a typo in SENSORS_IR35221 option: module name should be "ir35221"
instead of "ir35521".

Fixes: 8991ebd9c9a6 ("hwmon: (pmbus) Add client driver for IR35221")

Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/hwmon/pmbus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 3ad97fd5ce03..e35db489b76f 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -71,7 +71,7 @@ config SENSORS_IR35221
 	  Infineon IR35221 controller.
 
 	  This driver can also be built as a module. If so, the module will
-	  be called ir35521.
+	  be called ir35221.
 
 config SENSORS_IR38064
 	tristate "Infineon IR38064"
-- 
2.17.1

