Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E663E7C6E
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 17:36:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkcW05s1Sz308M
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 01:36:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=X2Z++hTE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=X2Z++hTE; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkcT72tmLz307n
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 01:34:51 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7CE58412DE;
 Tue, 10 Aug 2021 15:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1628609684; x=1630424085; bh=BRiyzJ6ERUdHZZPZotHcTYGai20iWJt8gC8
 cOR8wUgg=; b=X2Z++hTE9b7pltR+jTs4c8ewKRpYFXZYM2b81F2LoaPRYFZ8+ay
 xJ5DmlLYDFi7E6la34/Lz3Eqm3tdMhqvZ9vFmlDiw/W7hn7E1Ll5CC1/jeX0XcS/
 q5prKlVbB4R7g/kyKOq6DG1lnWdq4oNj6Q2sGNEp8+43Saz6wwBRL+og=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nb1N5h8pMOw3; Tue, 10 Aug 2021 18:34:44 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 140CC412DF;
 Tue, 10 Aug 2021 18:34:43 +0300 (MSK)
Received: from fedora.bbmc.yadro.com (10.199.0.188) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 10 Aug 2021 18:34:39 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] dt-bindings: rtc: provide RTC PCH device tree binding doc
Date: Tue, 10 Aug 2021 18:44:36 +0300
Message-ID: <20210810154436.125678-3-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810154436.125678-1-i.mikhaylov@yadro.com>
References: <20210810154436.125678-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.188]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add I2C Intel Series PCH built-in read-only RTC driver documentation.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 .../bindings/rtc/intel,pch-rtc.yaml           | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/intel,pch-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/intel,pch-rtc.yaml b/Documentation/devicetree/bindings/rtc/intel,pch-rtc.yaml
new file mode 100644
index 000000000000..f49867257f93
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/intel,pch-rtc.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/intel,pch-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Series PCH built-in read-only RTC
+
+maintainers:
+  - Ivan Mikhaylov <i.mikhaylov@yadro.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - intel,pch-rtc
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@0 {
+            compatible = "intel,pch-rtc";
+            reg = <0x44>;
+        };
+    };
-- 
2.31.1

