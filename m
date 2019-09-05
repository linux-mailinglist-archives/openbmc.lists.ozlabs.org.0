Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92894AA674
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 16:49:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PNrh0WVfzDr27
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 00:49:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::84a;
 helo=mail-qt1-x84a.google.com;
 envelope-from=3pr5xxqmkb5ggkc8gg8d6.4gegh6f3e4daklk.grd23k.gj8@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BtnXfkFF"; 
 dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PNqN3plXzDqT4
 for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2019 00:48:46 +1000 (AEST)
Received: by mail-qt1-x84a.google.com with SMTP id k13so2751069qtp.15
 for <openbmc@lists.ozlabs.org>; Thu, 05 Sep 2019 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=RaOdMEdHWabRyA48tWifREdKC/PQMtkOlsK8xXnOLlg=;
 b=BtnXfkFFib9LY2N7CLMrbVvS73v4Eq6wm+VbGidSpNhFCD42EtMTDvVL8+G02UX2lJ
 6hfjWa8pXNEsKJfxRxDoiJ6Js2le/D2knnMzOom9h3YZXu6WCmWpYxSPqhxIf8XvjDqK
 4mY6MhLeCLz8/uWepBTNX4NevsjTbdtjpmk3VvfemuGiEPKEMVJGs1z5NKuM2TNKIIoy
 rU9+aiGOOrDooEWyk2m/Kjd8XrbaMEzSWl/SESdIm9GPtZki1ifsqtx7xqM3Ww2w7UL0
 9GgqgjK2Efr4Fibow4GjVnEev3fd78/76t9xWzithNMZm/vJerJGWBfYf/js6NCc21jt
 WkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=RaOdMEdHWabRyA48tWifREdKC/PQMtkOlsK8xXnOLlg=;
 b=cxgddhQdND3Wz/dNqiDNJjV/XauGEUa6Hvg30+fwGKL5fOciYF7eR1w14u5S6TA+G1
 btkhxV+RrV7DEtrTdywHO5uL34Z9brnwtxf+ej/lsrH+1ehUpMd62/cbOD/+Qvkhslns
 AqM834nqFPeayvZMh/L9zZNdBl+cmhnhAbw5w+ZP6/LmU6XMYO2lSZxeZOTeOFOXdVZ3
 Qybd3ThDqUhcM8hvNdyNJQmJ8jENq1d8crS7IDpX5AAbBbt5q1aSS9NWaiDx02EqKBLt
 uQzB1vSwoqR8EiWMrOFt6cjCNNasaHx/eJtVH2+UcVLDLkBvz4VvzbZsST6ET6kFZZZW
 tWCA==
X-Gm-Message-State: APjAAAVTpkKn6zeDVWfX2xh/TlGEsjXuKjsiULljxLFyvyqsr4JcCimY
 s8OftzPnMAh8OgcoD82vwU/obU8=
X-Google-Smtp-Source: APXvYqzkDOBp79PXpEAipYZadtwGS7ZnIH63SZDea9FHuBgDn4feswfOL5kDKxXMwh4xwbR5YKHd0wE=
X-Received: by 2002:a37:9d3:: with SMTP id 202mr3162654qkj.391.1567694501708; 
 Thu, 05 Sep 2019 07:41:41 -0700 (PDT)
Date: Thu,  5 Sep 2019 10:41:29 -0400
In-Reply-To: <20190905144130.220713-1-osk@google.com>
Message-Id: <20190905144130.220713-2-osk@google.com>
Mime-Version: 1.0
References: <20190905144130.220713-1-osk@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v3 2/3] dt-bindings: serial: 8250: Add aspeed,
 sirq-polarity-sense.
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org, 
 gregkh@linuxfoundation.org, jk@ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add documentation for 8250_aspeed_vuart's aspeed,sirq-polarity-sense
property that enables to auto-configure the VUART's SIRQ polarity.

Signed-off-by: Oskar Senft <osk@google.com>
---
 Documentation/devicetree/bindings/serial/8250.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.txt b/Documentation/devicetree/bindings/serial/8250.txt
index 20d351f268ef..55700f20f6ee 100644
--- a/Documentation/devicetree/bindings/serial/8250.txt
+++ b/Documentation/devicetree/bindings/serial/8250.txt
@@ -56,6 +56,11 @@ Optional properties:
 - {rts,cts,dtr,dsr,rng,dcd}-gpios: specify a GPIO for RTS/CTS/DTR/DSR/RI/DCD
   line respectively. It will use specified GPIO instead of the peripheral
   function pin for the UART feature. If unsure, don't specify this property.
+- aspeed,sirq-polarity-sense: Only applicable to aspeed,ast2500-vuart.
+  phandle to aspeed,ast2500-scu compatible syscon alongside register offset
+  and bit number to identify how the SIRQ polarity should be configured.
+  One possible data source is the LPC/eSPI mode bit.
+  Example: aspeed,sirq-polarity-sense = <&syscon 0x70 25>
 
 Note:
 * fsl,ns16550:
-- 
2.23.0.187.g17f5b7556c-goog

