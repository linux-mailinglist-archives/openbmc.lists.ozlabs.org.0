Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7E27BD41
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 08:42:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0qZ320X5zDqWP
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 16:42:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=wangzhiqiang.bj@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=SWT1LDXz; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0qWV3tdGzDqVT
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 16:40:02 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id j19so962197pjl.4
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 23:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Yjp9EgCbJQjo6/sF6TCmIxlxrdpQFWxaPPyIVeRxF0=;
 b=SWT1LDXzyNTAtUS8sdIlmwWQzoqvj0B7sDp4RPi/TQ1RsYpx+T8SKEJgzRBMuuTkq1
 k69WssFCRHrqoN6WHxAdRh40Rj+0wn/HguligvTvI15zmm4NuoqKUr+73PQvF/u5hb8t
 4SdRmBIZWR+AhQWIbsYxdr3a8IP5wZuYD0hmdt1lCvgjYCpehZYsCqn0Y82fJ7yhLkVo
 E7G70N4dPisaua/TJLHcTQjqzm3ePh+JN7curviBOO2yc6Jf9NPMy+ff2xTiNd7B09ZM
 t8PEX2s5CFKLbE5Aliyi4+/RbaYm0f0oVHfRuniHHdyrDrMwqxf6eD1irmA6VVm/ix/F
 qUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Yjp9EgCbJQjo6/sF6TCmIxlxrdpQFWxaPPyIVeRxF0=;
 b=YXMCRUJx8UzS3sWeHlSDRurC+PKuj5E2LZStJG8rgnxAmGnC0SS3/DmjgiyCrJNBWN
 pTcbTP0RXi79V7LWLlqKTTrEaGM20ctcyLs6pfnINhx4hp7wloO8wKSfO+q0Xwz0OY1l
 HaQz1beofRKM2NOBmVajpkjHyFfHWH+IhDH64uz1mahJ3VyM+byNV8gwRI2c7bs+ewSD
 UGsq5LhPXF5gf1ThjUyXgNhRh6qG3auI3F2IVj2z86pa5NsrKzOqmYk+8iDqHh5Dig2i
 Bxxa9AhxQbRwtcD0UEKg+IocWtX5D7YfXbQJ7vPRa85d6lmY0cQpxsm7hmc8Zwbl/ERG
 TSpQ==
X-Gm-Message-State: AOAM532O7k5Yuo8hHxzEVF5NuUqSynZtw5fkCJGZhJO1XVhIb+pnJjCK
 DbgcZ9oFp2GTE23L2rBwhF6nng==
X-Google-Smtp-Source: ABdhPJwYh9E58yjhwM1cVovj7MieI53YR1O5ta2dglUqzttgE+VnNUfz0yEC7r9MddaKlc0vOp+/vg==
X-Received: by 2002:a17:90a:b88a:: with SMTP id
 o10mr2578412pjr.58.1601361598456; 
 Mon, 28 Sep 2020 23:39:58 -0700 (PDT)
Received: from localhost ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id i25sm3785540pgi.9.2020.09.28.23.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 23:39:58 -0700 (PDT)
From: John Wang <wangzhiqiang.bj@bytedance.com>
To: yulei.sh@bytedance.com, xuxiaohan@bytedance.com, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Subject: [PATCH linux dev-5.8 v3 1/2] ARM: dts: Add 64MiB OpenBMC flash layout
Date: Tue, 29 Sep 2020 14:39:54 +0800
Message-Id: <20200929063955.1206-1-wangzhiqiang.bj@bytedance.com>
X-Mailer: git-send-email 2.25.1
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

This is an alternate layout used by OpenBMC systems

The division of space is as follows:

 u-boot + env: 0.5MB
 kernel/FIT: 5MB
 rofs: 42.5MB
 rwfs: 16MB

Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>

---
v2:
  - Add copyright notice
v3:
  - nothing
---
 .../arm/boot/dts/openbmc-flash-layout-64.dtsi | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi

diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
new file mode 100644
index 000000000000..c8e0409d889e
--- /dev/null
+++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2020 Bytedance.
+ */
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	u-boot@0 {
+		reg = <0x0 0x60000>; // 384KB
+		label = "u-boot";
+	};
+
+	u-boot-env@e0000 {
+		reg = <0x60000 0x20000>; // 128KB
+		label = "u-boot-env";
+	};
+
+	kernel@100000 {
+		reg = <0x80000 0x500000>; // 5MB
+		label = "kernel";
+	};
+
+	rofs@a00000 {
+		reg = <0x580000 0x2a80000>; // 42.5MB
+		label = "rofs";
+	};
+
+	rwfs@6000000 {
+		reg = <0x3000000 0x1000000>; // 16MB
+		label = "rwfs";
+	};
+};
-- 
2.25.1

