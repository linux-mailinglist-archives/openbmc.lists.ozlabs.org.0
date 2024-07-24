Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB893B5EE
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2024 19:27:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zy3ibURA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTgvT3HmRz3dHC
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2024 03:27:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zy3ibURA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTgpp5KZLz3cnK
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2024 03:23:46 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so27062b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2024 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721841823; x=1722446623; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19xZKILzK3P9Ni6YSoes1vsbL5f2JUo3+5EVJJxbbjI=;
        b=Zy3ibURA/Wi3WT5lMyc1QAw0sTOpsxUg8SzvWIOums3WY8/bXKL1pxdX3JkVLE789R
         tRGAVdE+NXKatmolKwiukUKXY0y3HVDRFhWYkpEppklgGnaopkOZthdIFBETkHG23FLb
         zf3xfvErSfkSwsbbXZTbaxeduVLIzhgUpsWjHKijOqzvq4YDlzVDTiOCoswmhJ60k8I7
         26sOOpSdErj7ASccqYNStcF6Be7GZKk2jUD2nbQy31+8aj0SLwFgqVlWnFbTWlhLZDsj
         LuBBJGsGlcbMwEJ9qRFypp+jRwnGx3dJ7Gr/EWx4U3pKtFqNrULxSaNo4IFkuHoZEkJY
         ZtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721841823; x=1722446623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19xZKILzK3P9Ni6YSoes1vsbL5f2JUo3+5EVJJxbbjI=;
        b=dAUxcoIS+jlABPyIQvxazHQ7ghWOS6oSB0zKXfSeddem6ngE3B2gFMpMJ+VSfAwP2w
         1+iaRg6UulZuqOwH1JW1JYpR8aLbjeLDad2yyhU3doygQzUSW3qBNRSuzumQ3X3sg7CT
         pg3qyCSmKexbmMAVyu2Eue1b2GQ7vRlMkpzyi8AeqnBQhTY6K9GFVU4Rb9rIjwan7X0H
         uGZ55j8fmMV3WQbfO+mU3RDF9tzR98ZYZM/1wseDa0E5fv/SX82MdUwBvyc6jS8GVzJj
         RABYeLeFclsjQyQaaRQOa61I0PfPY8z8xbA+8eIdwSFQ6euM9SMSOFArAfJOdsZRpSzn
         H3cA==
X-Gm-Message-State: AOJu0YxHh8kK25ABj6G3iEjxyoSLsT6Q/GEb9nCv13u1WJHQGW9dj7DH
	h4zz1x0/Xyv9pqwVCuSFAIqpxKpfZc8e0asXAsH7cGOzATiaVMxcFDpEPA==
X-Google-Smtp-Source: AGHT+IHQVJlMuITeLxrR7HfXCF+u+r40MhecVTCFpTN6WjEQJAqT/kVMoPXfUf9KPeq3zOXtYQLLAQ==
X-Received: by 2002:a05:6a20:d80d:b0:1c1:879:9f5e with SMTP id adf61e73a8af0-1c472d1ba57mr583807637.53.1721841823097;
        Wed, 24 Jul 2024 10:23:43 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f318457sm96830945ad.134.2024.07.24.10.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 10:23:42 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-6.6 4/5] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI groups
Date: Thu, 25 Jul 2024 01:21:28 +0800
Message-Id: <20240724172129.3064490-5-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240724172129.3064490-1-potin.lai.pt@gmail.com>
References: <20240724172129.3064490-1-potin.lai.pt@gmail.com>
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

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

Add "NCSI" pin groups that are equivalent to the RMII pin groups, but
without the RMIIXRCLKO pin.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml           | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 00b6974a5ed3d..80974c46f3ef9 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -19,6 +19,11 @@ description: |+
   Refer to the bindings described in
   Documentation/devicetree/bindings/mfd/syscon.yaml
 
+  Note: According to the NCSI specification, the reference clock output pin
+  (RMIIXRCLKO) is not required on the management controller side. To optimize
+  pin usage, add "NCSI" pin groups that are equivalent to the RMII pin groups,
+  but without the RMIIXRCLKO pin.
+
 properties:
   compatible:
     const: aspeed,ast2600-pinctrl
@@ -337,6 +342,8 @@ additionalProperties:
         - MDIO2
         - MDIO3
         - MDIO4
+        - NCSI3
+        - NCSI4
         - NCTS1
         - NCTS2
         - NCTS3
-- 
2.31.1

