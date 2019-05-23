Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF0927CF0
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 14:34:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458pq66pDLzDqkK
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 22:34:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=ghung.quanta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SzaIkcMy"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458pnM48Y6zDqdT
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 22:33:11 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id go2so2706411plb.9
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RgiS7H/BWmNQXE0cSi+6/kiMwCPXedV01AKTZUIJXBM=;
 b=SzaIkcMyoqDUgctahEd0jZxpyE7fgP79Y5xLOQsnEv1+b8soc7IFwPy/+3zmKZlkV5
 poTAvDCUYs8Fyfa6Sclfp2/anbA0UQJoSrXNMhKZrBhye2dVMYnN8qIxYAiSScEsBIJC
 MYTqKZE894mcJzZjmxDvAyhkv2RxpXr9lAi1jer2Hot8vldfWPK98uTzKBE9WQu5+V/B
 9GtM2z/4WZ4Jt2VQ1gattcKxui8MyqrQqI1voyYxavV7J0E1H7dDWS/WTjcY3d72b6S5
 k8AXlBsMikv2hhVhJOO2Te4CGfYNobHabNlIyCn9WHHsRJqJrEkIW7ItPKeCksMmzXyc
 w9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RgiS7H/BWmNQXE0cSi+6/kiMwCPXedV01AKTZUIJXBM=;
 b=KBSbR5hESYN+wJrMzodCxeBlHeow/hWJJfKOIb3IUr1Yi+lfB8Imtya21qdnIbAdWk
 Paj8HwoClZ8VPBl74bt/Too13gkU0taBAhxbiMfIfZ5hV9nH9vqgTg/0ZfcDKEBFkm1k
 lG30UGq06jmYXvBaj5n7sNM6DuekY27zOqTPGxW7q+ieCS7q3MlxCUEf5GL/O4Zt7SBS
 NokYbXOa2L4BfdkG5eYs8oy8GSOvbO+RUFpNJtwo56goPBdujUkZtM8h5eCBrjEZZb58
 fUhCaXGyPC488OgPC5VNC5xf0DIzCICmBlKBXLQOSKGzqlBh6gYnUcEQsdovhUSWrZ9b
 +zAw==
X-Gm-Message-State: APjAAAVuAFVSZ0YmLW+j7lijPKU3C1a38Y5HNkoq+iZ72Yg49drQMwws
 CctA+NdfU09tH9wq5VtPJAU=
X-Google-Smtp-Source: APXvYqytR/eaJ4kvGpJiVDzDULKklCYHLljPykS46nokGuRbhps8rlsvfcAbN7IRxmwu2Nd1W8VCqg==
X-Received: by 2002:a17:902:5c5:: with SMTP id
 f63mr96095919plf.327.1558614788575; 
 Thu, 23 May 2019 05:33:08 -0700 (PDT)
Received: from george-Quanta.com.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id o20sm40066516pgj.70.2019.05.23.05.33.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 23 May 2019 05:33:08 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v1 2/2] dt-binding: edac: add NPCM ECC documentation
Date: Thu, 23 May 2019 20:27:34 +0800
Message-Id: <20190523122734.27034-2-ghung.quanta@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190523122734.27034-1-ghung.quanta@gmail.com>
References: <20190523122734.27034-1-ghung.quanta@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, tomer.maimon@nuvoton.com, benjaminfair@google.com,
 Avi.Fishman@nuvoton.com, wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: George Hung <george.hung@quantatw.com>

Add device tree documentation for Nuvoton BMC ECC

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 .../bindings/edac/npcm7xx-sdram-edac.txt        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
new file mode 100644
index 000000000000..dd4dac59a5bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
@@ -0,0 +1,17 @@
+Nuvoton NPCM7xx SoC EDAC device driver
+
+The Nuvoton NPCM7xx SoC supports DDR4 memory with/without ECC and the driver
+uses the EDAC framework to implement the ECC detection and corrtection.
+
+Required properties:
+- compatible:	should be "nuvoton,npcm7xx-sdram-edac"
+- reg:		Memory controller register set should be <0xf0824000 0x1000>
+- interrupts:	should be MC interrupt #25
+
+Example:
+
+	mc: memory-controller@f0824000 {
+		compatible = "nuvoton,npcm7xx-sdram-edac";
+		reg = <0xf0824000 0x1000>;
+		interrupts = <0 25 4>;
+	};
-- 
2.21.0

