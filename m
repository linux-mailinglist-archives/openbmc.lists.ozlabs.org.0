Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AB46A34F
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 18:43:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J79kW2yXcz2ywd
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 04:42:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.42; helo=mail-ot1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J79kD3v0nz2xCt;
 Tue,  7 Dec 2021 04:42:42 +1100 (AEDT)
Received: by mail-ot1-f42.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso14564435otj.11; 
 Mon, 06 Dec 2021 09:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AbndXfdUqpyPQteYDfKjE1VIDsx2qwSU9ZClP6riQdE=;
 b=6PbxTA727EPdj7hxJrRGi/ZahyulLr7JpQc+L+NcBmYph4d8lDFO5eFg/dlu7ZmKeO
 U2C2g5PJd38Dt6Mp4d+Mn2i3819PqCAOpUPddwjUMcNuQT+I5CDdw4KUG0mN0OXxsNca
 4MPnga1LpILDsZBzUhbHn0/mrnfXC2jgrx+sYn175W3lKiPO0k+MX+l+LXFwTvfNSgOr
 bbWkekLQxuHRPB4NwhR7M2dTD2gBQgj5yAPwBKO058KgF8uFdAYciyjEEGXuQz2Upjnv
 ETuJ7iLX/mwMHddGuQc7P+vd3dRGS/x4SOim9K7I1vxahqiZPQIwwO4O8jZji6KEoLS7
 HJuw==
X-Gm-Message-State: AOAM530dU7/IMqDE/QsjYOcY6AwUIJs2L5ifrTwzKkJjf2zGj9rXKK3n
 HLKLVRb8V8vM2Fc7Ux+Pdg==
X-Google-Smtp-Source: ABdhPJzRIALyGrYVn7vIW3KpfiJT2LlB6/qH5jyCFoTtpMhgKtFla0ts7XKqa5lxJaRE1k7QLXD+DA==
X-Received: by 2002:a05:6830:1bc3:: with SMTP id
 v3mr30400158ota.276.1638812559197; 
 Mon, 06 Dec 2021 09:42:39 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id b17sm2494489ots.66.2021.12.06.09.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 09:42:38 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Rayn Chen <rayn_chen@aspeedtech.com>
Subject: [PATCH] dt-bindings: i2c: aspeed: Drop stray '#interrupt-cells'
Date: Mon,  6 Dec 2021 11:42:37 -0600
Message-Id: <20211206174237.2298580-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

'#interrupt-cells' is not documented which causes a warning when
'unevaluatedProperties' is implemented. Unless the I2C controller is
also an interrupt controller, '#interrupt-cells' is not valid. This
doesn't appear to be the case from the driver, so just remove it from
the example.

Cc: Brendan Higgins <brendanhiggins@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Rayn Chen <rayn_chen@aspeedtech.com>
Cc: linux-i2c@vger.kernel.org
Cc: openbmc@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index ea643e6c3ef5..f597f73ccd87 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -63,7 +63,6 @@ examples:
     i2c0: i2c-bus@40 {
       #address-cells = <1>;
       #size-cells = <0>;
-      #interrupt-cells = <1>;
       compatible = "aspeed,ast2500-i2c-bus";
       reg = <0x40 0x40>;
       clocks = <&syscon ASPEED_CLK_APB>;
-- 
2.32.0

