Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD167B79D
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 03:34:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ywvz4YL4zDqZQ
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 11:34:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::84a;
 helo=mail-qt1-x84a.google.com;
 envelope-from=3ffbaxqmkb-gycuqyyqvo.mywyzoxlwmvscdc.yjvklc.ybq@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Iog/Gj/R"; 
 dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ywvJ2D8RzDqZ1
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 11:34:16 +1000 (AEST)
Received: by mail-qt1-x84a.google.com with SMTP id r58so60152934qtb.5
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 18:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Zp7XOXGgqgS84ECJzPjkmEakVRYPXqlWmSUTXdVq/Lg=;
 b=Iog/Gj/RN63oNAo/bT6kmB1wL9LvJybMwVe1Df6I0GW14ZS09ftL521WNREZLwnwvQ
 DtVAkNN0q+eyHB2nfhOpCzooJ/yX39I68yFeiHQ4ipMFsiIbMiN/8mcGddflyL+vRHK6
 MHWFt9Skp3yzC6I9/OhOhIMxVp7JLGfB2s1h6xTJTbFDrIzkPWdO6VEryvcSqKxEAO2X
 6I7ErXWHCXoqS2aTS/tlEigY+NiwYYIkhYuAkLgz6AvTkOCtmZkVSfFQrru4hL4qXZhG
 /5NRCLbcMcUvnlhQhrW/6h5z6nlIG8SlARKHurproXUhTEZBu/3G8MBsQHGp6FLkNaet
 fMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Zp7XOXGgqgS84ECJzPjkmEakVRYPXqlWmSUTXdVq/Lg=;
 b=tFrweZqcZ6EqlhI2GRqX2t67iLlKWlo9M+91QzTdAGWa4j7+MNDkXqCWJx7lGPzxmO
 KBqXGt+Mld9H7DtdJNAfeBwYIBssELHcjdghJY0k+l0bj/QiNiOkjLqhHVcDQ/EYo6fO
 1pMRrMuE6VQLBTxkuTeMDIfixl2wQgDQ9fO3A0VGAFlYsftyYrVErzr7//JicSinh0vj
 b32vDHnB0T3L+twzXvfSWTiRg9ifqeiRsgTje3/opdP8uzE8IzkF7qpbHuImqzXY45RC
 kn347vKqByPMUvBiw1B9lZ/e8GnMF1GlLKdqmXTx8p8c1cP0R8n5RRpNiIxUkieQZG2t
 ko3w==
X-Gm-Message-State: APjAAAUlPzo9mQkgt6Yrk5Xrc0B8FCCiJyvHgBeJVAOFNI7vPdm9lDxL
 9wfqVL3ziPyIkjM6xM/qESEqS/o=
X-Google-Smtp-Source: APXvYqwiUn//YjhOfk55fYLDZLioaBBPG9E86sxxoOgvhBh7wd/zP4nWVp62v6Az9J114YqGF+AO7g4=
X-Received: by 2002:a37:5f82:: with SMTP id
 t124mr71235338qkb.180.1564536853625; 
 Tue, 30 Jul 2019 18:34:13 -0700 (PDT)
Date: Tue, 30 Jul 2019 21:34:03 -0400
In-Reply-To: <20190731013404.243755-1-osk@google.com>
Message-Id: <20190731013404.243755-2-osk@google.com>
Mime-Version: 1.0
References: <20190731013404.243755-1-osk@google.com>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v2 2/3] dt-bindings: serial: 8250: Add documentation for
 espi-enabled.
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc@lists.ozlabs.org, Oskar Senft <osk@google.com>,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add documentation for 8250_aspeed_vuart's espi-enabled property that
enables to auto-configure the VUART's SIRQ polarity.

Signed-off-by: Oskar Senft <osk@google.com>
---
 Documentation/devicetree/bindings/serial/8250.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.txt b/Documentation/devicetree/bindings/serial/8250.txt
index 20d351f268ef..4b8b9e502179 100644
--- a/Documentation/devicetree/bindings/serial/8250.txt
+++ b/Documentation/devicetree/bindings/serial/8250.txt
@@ -56,6 +56,11 @@ Optional properties:
 - {rts,cts,dtr,dsr,rng,dcd}-gpios: specify a GPIO for RTS/CTS/DTR/DSR/RI/DCD
   line respectively. It will use specified GPIO instead of the peripheral
   function pin for the UART feature. If unsure, don't specify this property.
+- espi-enabled: Only applicable to aspeed,ast2500-vuart. Value is a phandle to
+  aspeed,ast2500-scu syscon alongside register offset and bit number to
+  identify whether the system is in eSPI mode. This is used to auto-configure
+  SIRQ polarity on the vuart.
+  Example: espi-enabled = <&syscon 0x70 25>
 
 Note:
 * fsl,ns16550:
-- 
2.22.0.709.g102302147b-goog

