Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D32799120C1
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 11:36:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KvRoRuX5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5C0n3MYmz3d8J
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 19:36:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KvRoRuX5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5By84Cmdz3c6n;
	Fri, 21 Jun 2024 19:34:07 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f9e2affc8cso7374115ad.2;
        Fri, 21 Jun 2024 02:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718962442; x=1719567242; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlPyR2DwNKIhgYcJR7RVlheTP0T99OY10zKkh8vPfJo=;
        b=KvRoRuX5ebP84Jz1vXobk5vUrm6wQSD3PR6U4HsRDgLEPj3Fl1grmc+HtBGWQQYAFB
         Lm1QHicAxDjcVAk8+Kmyaye33x86zUBN74LOS4S0eBdg2S3/IyL0jiLC9aZ/vAAnrn/x
         PF//i1nnQN9fP0Ta6Txablv4p6XtmEKKFo1vKn2TdifASY8XpcUXKGuMw/FEdC7S+pIf
         bOusFAwDDqv/yQZi9Npgnx+FBHxrqfT0XNdj0LtcDRpt9jFEUwsGctB6yOY4PnFZMzij
         EL0I+KCUq874gdiXdZdSTUCPCtgzCq2pkwFk5XjQ9GNKvAZ22qaF1HKrCDd3iudBN4EI
         Z3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962442; x=1719567242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlPyR2DwNKIhgYcJR7RVlheTP0T99OY10zKkh8vPfJo=;
        b=Z7sBb6ywFNFQuTrLzl6Kz+Dx+6GlWsCxe9YjFx/IGPkeNzii5zic/0hpIRSHW/M9Lj
         tmjHirXRBTzMiyjsvy6AdYF0DmNFE5S5FON3CKGL5oc4clcmsx5/iPkY8JNfHRCxIicG
         cpnMWegyStHNsHNZ+rOuYbRY4Af7mcjmFbaT6HaYd1iMg0ZS0TZnPczXn85Tdf14Wie0
         Y2nENZRh011MBhSXztvdk6SgGhB+TWd0NVFX0YuGX4YTlfTTQL9xt06l+c8t0hSnmpbH
         idloJgwk/QCbKQ2AlMpX5PP6eeuTXZxInxiGKyb2eSpQwMHAnw1Wf1XhAsJ40eKUnaRT
         2YdA==
X-Forwarded-Encrypted: i=1; AJvYcCXifLajN1Fydzczh8vO9REZxf1owJ4VGOaXsgggsBCFodNEoqcBhGr6s6fQOkOGrC6EINI3yOgwy7Af7paz4aO/lJyhvZvthEo=
X-Gm-Message-State: AOJu0YwxMbJxUe+MQbEArgkdVnTi975k/VsLNOaMsQ+7p32PXMd8j5Cb
	ZzA/2Hk82n60rcqMYLIabJxagOfmfVnZ4IZWPY3N49YhL/yHIFF6
X-Google-Smtp-Source: AGHT+IFfA7C54egHwv68x+7wV7g0a7OIDYQlMXJVlMpjxHZw9f4QfFjmcMgrvV4MeiBayo09KJSZQg==
X-Received: by 2002:a17:902:cec1:b0:1f8:67e4:398a with SMTP id d9443c01a7336-1f9aa3bcab8mr82874115ad.13.1718962441726;
        Fri, 21 Jun 2024 02:34:01 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbc72e9sm9810365ad.296.2024.06.21.02.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:34:01 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI groups
Date: Fri, 21 Jun 2024 17:31:41 +0800
Message-Id: <20240621093142.698529-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240621093142.698529-1-potin.lai.pt@gmail.com>
References: <20240621093142.698529-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

Add "NCSI" pin groups that are equivalent to the RMII pin groups, but
without the RMIIXRCLKO pin.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

