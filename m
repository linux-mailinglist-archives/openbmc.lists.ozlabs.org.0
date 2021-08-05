Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E13E1EB4
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 00:29:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggjw81xTWz3dDW
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 08:29:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eDkLQqI6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eDkLQqI6; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggjtq1K4yz3bWb;
 Fri,  6 Aug 2021 08:28:33 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id nh14so12477797pjb.2;
 Thu, 05 Aug 2021 15:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TR1r9V+hd8xcQrbIhhyYGERXkzqKnmp/yYfpwm5Qa7o=;
 b=eDkLQqI6KBcq68piTi/kCGeXAuwS+6vgt/1vFMFS66Xz2Nj45a0U0oDjgv6/iIPZDX
 oNc8NhITVCzK4gvbUSvCa9YXmz3aA6RAOkfOb3eUNxpImk7uuwmAZbGqZV4LIPQw1Nq/
 LmPYrYcK3VA14PAgCeM3Jncbw2XrX+Bfs8N742YhyT+tN9xWavotc8WVDI0vwyoJ0+HK
 a3L9FpaZLnaTJGf9y/iPO1ZpZXe2RGyIHrPYZf1djMvFEkn+EX6vedun1CxEj+Vc24L8
 f+ye0iB6+F84BzbHmb3+ChuyoJMahHwZjWSPiUp938QSZmE3oIkEjYe47ONCiNuZY7AY
 hFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TR1r9V+hd8xcQrbIhhyYGERXkzqKnmp/yYfpwm5Qa7o=;
 b=rwo8p1ph91ztgoli86Lr0kAO9wVt8REJQo3ik6ApMs3VwmZyOnz9q2g+WvEJQuPsqG
 ITZGYJFDMkpRqrM2tTZhbgReb7M7uTdN3SrDbBDee2O5ZY2AhznVB0vpsfwxdEva/bV+
 pXIvF9VlElIlgjlqq3Rdx4+HIFhVljlpMLETbSd/zN2GxflxFsdzXoZ/VpsxsU3FoDno
 PMLVDiobQeNs+vkcRk+q447YVPxoxVKR7eoyVv20solLlADRJ0DmvuGw/hr0S1m5+bza
 gOv9c2kIRPjZO/TDUB5piOBnEDfgv5bhihQAUnuB3NbSK+vLtJLYYQwGRc0DUSLjz2hO
 yMUQ==
X-Gm-Message-State: AOAM533E52SD51IyAMuQfSZGD8+hPlXlmFeWaJJdL1sYxIo+8TOH7AGn
 czooYUXZvESVDP8W8uBhw2I=
X-Google-Smtp-Source: ABdhPJyrQZG82agY7vsjAnNxKZ0mN6nB8d0Zxt4KZA9v2izYx97kafZ4Q5fVX/Tl5bgq8F+2OYoKdg==
X-Received: by 2002:aa7:9906:0:b029:3c7:a6a1:c73d with SMTP id
 z6-20020aa799060000b02903c7a6a1c73dmr1764963pff.1.1628202509864; 
 Thu, 05 Aug 2021 15:28:29 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id b26sm8082292pfo.47.2021.08.05.15.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 15:28:29 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 1/6] ARM: dts: Add Facebook BMC 128MB flash layout
Date: Thu,  5 Aug 2021 15:28:13 -0700
Message-Id: <20210805222818.8391-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805222818.8391-1-rentao.bupt@gmail.com>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

This is the layout used by Facebook BMC systems. It describes the fixed
flash layout of a 128MB mtd device.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
  - None.

 .../dts/facebook-bmc-flash-layout-128.dtsi    | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi

diff --git a/arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi b/arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi
new file mode 100644
index 000000000000..7f3652dea550
--- /dev/null
+++ b/arch/arm/boot/dts/facebook-bmc-flash-layout-128.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * u-boot partition: 896KB.
+	 */
+	u-boot@0 {
+		reg = <0x0 0xe0000>;
+		label = "u-boot";
+	};
+
+	/*
+	 * u-boot environment variables: 64KB.
+	 */
+	u-boot-env@e0000 {
+		reg = <0xe0000 0x10000>;
+		label = "env";
+	};
+
+	/*
+	 * image metadata partition (64KB), used by Facebook internal
+	 * tools.
+	 */
+	image-meta@f0000 {
+		reg = <0xf0000 0x10000>;
+		label = "meta";
+	};
+
+	/*
+	 * FIT image: 119 MB.
+	 */
+	fit@100000 {
+		reg = <0x100000 0x7700000>;
+		label = "fit";
+	};
+
+	/*
+	 * "data0" partition (8MB) is used by Facebook BMC platforms as
+	 * persistent data store.
+	 */
+	data0@7800000 {
+		reg = <0x7800000 0x800000>;
+		label = "data0";
+	};
+
+	/*
+	 * Although the master partition can be created by enabling
+	 * MTD_PARTITIONED_MASTER option, below "flash0" partition is
+	 * explicitly created to avoid breaking legacy applications.
+	 */
+	flash0@0 {
+		reg = <0x0 0x8000000>;
+		label = "flash0";
+	};
+};
-- 
2.17.1

