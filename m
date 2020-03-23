Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 642331901FB
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 00:38:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mW6M4d3dzDqnM
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 10:38:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com;
 envelope-from=3eed5xgukb-urbufpnvvnsl.jvtvwluitjspzaz.vgshiz.vyn@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=IHAJPl2o; dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mW1Y6crlzDqpJ
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 10:34:19 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id j8so10738364plk.1
 for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2020 16:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=g1IXTxNeLuaEoIeAZquMIN8o8RyeqEvLaY82fpBZWjc=;
 b=IHAJPl2oTxONyfNceKZR24ED2EcxarW3ZSAI9FkMqFE0ID+RRsYVYXi/fqi8YylKMo
 xZC9QD9AIn59b5g/bRMjVT4gSbndx3PplMKjOoHeqCMVeb07iDVn3kco3S0VNdhmg0pY
 rZAEkQXs/YaXzYjK4qx1UpuatgbmdmooExWI5KIZ4t/aZ9oaIBIEymCkr9WPFdlxs8Xr
 biYrXf/F84ARMgUzOsMmb9Xbpo8PItkZbMK/Up5Uv3q0W/dHd2VDhVqyNzBJnlSKEfrI
 G373NRUxDdgwxiKbtjsuFhX/4Q9Uv5meYi6iK8UDoWK7rFRjTpGOWB3UJoFEHcwDdFn4
 LEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=g1IXTxNeLuaEoIeAZquMIN8o8RyeqEvLaY82fpBZWjc=;
 b=lMwpPlAf06jWoAzJv1dYH/XV/m+V0LYY34FLlRtVgZ4ANKrnzHCFvHJFFhs5RkZnk/
 KMwpkvzveofI0d+8rEnkNrZLNP9KmgAFq4RnK1xsFBinC//ZJJoGqwjy1L37X9CSvaqB
 jTkVAIjW7h6gGVDoaqync6HkbOw5jCwnYqTVZfS4CzB6B3+HkIM10vxgHJcXAS8vKv7c
 Nlo45bQrIOb7ca5YG6Yugq07pLksXTh7humrdmPmOgYWTKvb/V6XGi66J5h+sHwj4H77
 D4JBWYZ7REdvjwgBgw1p6VJwpo1lQWhftJC3eJ7BKDKHIvmZyaeMknqpvJlynCTyYXyU
 ihtA==
X-Gm-Message-State: ANhLgQ3xW2uy7/CWgGZ1+cr+Uw/zt7M2glfwo4EmV5JuyS3ioaVr1Gvv
 yp1gH+p2YiLo1VtiMK0+52ugUMeR7A==
X-Google-Smtp-Source: ADFU+vtuicKd9xEczdBa/a3me7A5WmLybcBMMiKtFPfL2j6mf5FWfWwsC5ap0rDRstz05QphVWxOQwQh5A==
X-Received: by 2002:a17:90a:e7c8:: with SMTP id
 kb8mr1901152pjb.79.1585006456742; 
 Mon, 23 Mar 2020 16:34:16 -0700 (PDT)
Date: Mon, 23 Mar 2020 16:33:54 -0700
In-Reply-To: <20200323233354.239365-1-kunyi@google.com>
Message-Id: <20200323233354.239365-4-kunyi@google.com>
Mime-Version: 1.0
References: <20200323233354.239365-1-kunyi@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v2 3/3] dt-bindings: (hwmon/sbtsi_tmep) Add
 SB-TSI hwmon driver bindings
From: Kun Yi <kunyi@google.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, 
 mark.rutland@arm.com
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document device tree bindings for AMD SB-TSI emulated temperature
sensor.

Signed-off-by: Kun Yi <kunyi@google.com>
Change-Id: Ife3285afa4cf8d410cb7bee1eb930dc0717084f9
---
 .../devicetree/bindings/hwmon/sbtsi_temp.txt       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt

diff --git a/Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt b/Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt
new file mode 100644
index 000000000000..4020f075699e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sbtsi_temp.txt
@@ -0,0 +1,14 @@
+*AMD SoC SB-TSI hwmon driver.
+
+Required properties:
+- compatible: manufacturer and chip name, should be
+	"amd,sbtsi",
+
+- reg: I2C bus address of the device
+
+Example:
+
+sbtsi@4c {
+	compatible = "amd,sbtsi";
+	reg = <0x4c>;
+};
-- 
2.25.1.696.g5e7596f4ac-goog

