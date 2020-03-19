Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C43518C358
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 23:53:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k2HY41tzzDqwl
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 09:52:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com;
 envelope-from=3v_zzxgukb3yeohscaiiafy.wigijyhvgwfcmnm.itfuvm.ila@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=a3I+KiTG; dkim-atps=neutral
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k2Bc2GHkzDr3p
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 09:48:33 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id f75so3033473pfa.13
 for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2020 15:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=p2FECenFo/SV+lvmBUFJN/N3tCfRxwr2b4eodVl25VI=;
 b=a3I+KiTG8nWWCWq5o/hbNf7tgyx9XDAThb0tz5gwUfh0lfIOPV14Y+uE5vbEhILmxN
 xkAUviA4XsZ6iaKNhkGwT+Asbp+hEu/fyIVBR8Zroy967ppdGOV9aVyvD8HVoKpZRXkI
 b7/axSYnJ87E4WNgdOeBRJS7oeBQbPBXSAijU+4JTuPtzhaKm6TifdtGeHdBKV+6nA5x
 /kfXfwsPxHTPKl28em94wM71Ug+hSPn26/Fh163ZsHYgliNWvAxA7ZIBhtp9zwBKnSuK
 k9x6fHhO8VJ7k9i159tiGWe/STUBqXq7Blv3A7H+ZZYf877JDX228pSNax2iTD2avlAW
 m57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=p2FECenFo/SV+lvmBUFJN/N3tCfRxwr2b4eodVl25VI=;
 b=H6J4ghADFELCgTizslqES0vqI/bNKkcClxMWjnX/NVVbYA0obpqBPFZWXKeExa/9Pr
 DrLRgsK8ZqJqZraB8l65mywL6yusQEsB+4nTCww17saM+G1gTjfshFXJ93ro4PCiTTgC
 a0OTMKfwkvcyx2iG5bF7hfRwZUPE99KphGJ2FitomwksODfhkSVE9Il3gmH6o1x6jaAf
 2U+1EQqsfGOO/RMqFgDmIgeZAje7c9xeZJ/FDIAeoMKzssvj5tDrSJJ8Gvd7W+XqXseC
 teqxf/SkG+/WuFnpKg4olWuF9lxGIQuqFvFLneP/pCjs6lzInl0fBSsey58it692kGkS
 PBng==
X-Gm-Message-State: ANhLgQ3FK/dlAPF/4LWMkinlh4dhyRnAFJhmzptus6eE0VWui/3GWFuV
 Ahd6YkfG7FY58200s0E7pawvwT6xeA==
X-Google-Smtp-Source: ADFU+vsiwSXNqmafTIi8B+BiMHfBtFjBqB+UtENXanP1PQfB14qdA7ZVWXrhzSCXbwWiNFPLFow4n0qFDA==
X-Received: by 2002:a63:c54b:: with SMTP id g11mr5703406pgd.164.1584658111321; 
 Thu, 19 Mar 2020 15:48:31 -0700 (PDT)
Date: Thu, 19 Mar 2020 15:48:12 -0700
In-Reply-To: <20200319224812.202013-1-kunyi@google.com>
Message-Id: <20200319224812.202013-4-kunyi@google.com>
Mime-Version: 1.0
References: <20200319224812.202013-1-kunyi@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v1 3/3] dt-bindings: (hwmon/sbtsi_tmep) Add
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

