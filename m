Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC29F90FF36
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 10:46:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QfXBuAh/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4Yxf3Vn8z30T1
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 18:46:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QfXBuAh/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4Yx075MMz30T1;
	Thu, 20 Jun 2024 18:45:56 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7061365d2f3so499430b3a.3;
        Thu, 20 Jun 2024 01:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718873155; x=1719477955; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fte78PnOfBiH+sJHP9JZR7QJmPh/4n6xzLMPWhbJ8Gc=;
        b=QfXBuAh/y9mx1uGq/JxtIb3LmmQ3OiiUG+fPgwJ2gtuMxgBZu8F9k5DW2F2FydIuYn
         eGa3FZU27fL75F7NwrOURuJOqJCTSutK6Rcnr6wzfKXJ6POqM9TEKjQHyE+OsRPZckfp
         zAhsg3Bpx8xm64L07neP3gjhpaQy1ANtLGQhDrZJmME8tp4voDMJ6yLiTS6MXPHHeKxq
         H2zMoWOslfanrfdZZLEFVxfgKRaJnmQ42DyqI67K37F49pcSMpMt82i86aWEtU+f5lMm
         gdcvGwrKqlfhRAo+6aAG0PqQpfMrUKwWuB4zQeyXiOdg5Q9576W3UCfZg3u14d/Ngmts
         FLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873155; x=1719477955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fte78PnOfBiH+sJHP9JZR7QJmPh/4n6xzLMPWhbJ8Gc=;
        b=wiWcXH/nlsIQEe8jOnqVNENkaMxgtAhAkKENzCXYga+dTpwNXvG7au+crN2bd+Ul7Z
         88JVjMo0eW+fCjtf24NYS1TuDr6pZ022ZDjwqA7t+PdKFMjTs5avVSWNnhn2kCS1E0wU
         kR7UMZNvmpMl70eM6OGy5yg+IhMemtY+okDlN+SEwv8mr30K9do3fndEVe/TRsY0BMbr
         nucJHsH7PB+XalzW9VL+omg8k3BPNxDJElpeyzlUlZB9YdrIGNVPugFiL6opKEo7uUQQ
         yGZtxg63Dfuu6CCEYCx0y07USIlxpWX8tbNZPTR7TFUAKyr4r3tB/SQGjXVvHYE6jlK/
         zehg==
X-Forwarded-Encrypted: i=1; AJvYcCVbP51OgWszyJcmx9Fy8iQpOJjee0LMXeZbTdD4gtErhwrVQ0J/weAnjxbT1Ax+n04tGtUfc25i6jsG6rNz2/mf5uL8ILW2elQ=
X-Gm-Message-State: AOJu0Yz6yDYPxlYAY+KPr7HyAS0IXN7g7iP1lMotUu8TYNIWdSUxEN+l
	DbGMj+ApPASYmtb7tYvNKw6ahEBvo78eNAxhqJIYCs4NbEJYsYPX
X-Google-Smtp-Source: AGHT+IFxym5JK2ZJ/HsMfJgwaJm993/2O/e1hkkImoYa+PVFsL906eYHSVqcL7DY+taWQyuSWfH3Bw==
X-Received: by 2002:a05:6a20:968e:b0:1b8:a13f:3a39 with SMTP id adf61e73a8af0-1bcbb5cb26fmr5082372637.38.1718873154815;
        Thu, 20 Jun 2024 01:45:54 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b9besm11895592b3a.165.2024.06.20.01.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:45:54 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: add NCSI group
Date: Thu, 20 Jun 2024 16:43:36 +0800
Message-Id: <20240620084337.3525690-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
References: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

Add NCSI group to distinguish the pin group between RMII and NCSI.

- RMII pins:
  - RMIIXRCLKI
  - RMIIXRXD0
  - RMIIXRXD1
  - RMIIXCRSDV
  - RMIIXRXER
  - RMIIXRCLKO
  - RMIIXTXEN
  - RMIIXTXD0
  - RMIIXTXD1

- NCSI pins:
  - RMIIXRCLKI
  - RMIIXRXD0
  - RMIIXRXD1
  - RMIIXCRSDV
  - RMIIXRXER
  - RMIIXTXEN
  - RMIIXTXD0
  - RMIIXTXD1

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 00b6974a5ed3d..3f02dc94a7ce2 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -337,6 +337,8 @@ additionalProperties:
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

