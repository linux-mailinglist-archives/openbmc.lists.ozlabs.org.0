Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D857CBEBFB
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 08:33:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f4rV4MLmzDqnk
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:33:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ha0kSj5C"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f4pf3j7xzDqmC
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 16:32:10 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id t14so970624pgs.3
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 23:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5lE6JlrI959QyUt2tX2GULrOT2pN9vQMatj6j9vjqw=;
 b=ha0kSj5CrYUXUAnq2gcPEfx7qMc1L5LBNaYT0wrkfdOk2a+GkamBZmXYJTvzSfsy0g
 SaEqxV4t7gOhl4EHUHczducuZVzFcBiiW7UC/klKd520LUG7hJ02PUW9NKFoiBz1bXXX
 rMbjAPObXuR6GmuGuIZbVvgF6AAtbNOAlWYsKkD7kENC0qvd7PZO3A7chOrHY5XjYOe/
 OIwh1+ObggxhegKowDa4MVqXMMFgyDtNk3Wl5eyGUzGMP5CjrmCZk4ZXfVrgPKgQu6+n
 Y/gJoWGJIonMp1E3HYU/koat+dY1ABS742qqu84fP0QBo4xo5L/y/+sJhBMBm+gxx1YU
 oKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v5lE6JlrI959QyUt2tX2GULrOT2pN9vQMatj6j9vjqw=;
 b=V/axMlRM98yScyZxxu97K2/alU45H9f1ukyMrTyNZBZb2RgQP/C0l+isbFpLU2g+yD
 WFIintJ+5BwRxKfFsasNmqjppS/LKD3nMYvesY1TNFp0yyTQTji9OM0NvcwenzXd1EyU
 l1Y0TjaJZYHvm9QeP7scj8SuxGfglmkpLdARwi1M230qajDG4waVIkX0dJeVMmha8yLX
 7GVLSlt/8lQvLLq7udl0G+pAWAEIYTDxSkrudSsn9unBxHsoR+526NGo7kIKj9mgqRD+
 1nzBxLbVRekcSd2GDXfE1BfjtVoh9zPxu2LmzWbwhmwHpV8BlBUf4is9VJeb1wTEvgaN
 ivvg==
X-Gm-Message-State: APjAAAVB+GIVNz0wHMaLYxBwG9t/yxL3MV8gwr+xSTxjjL0BjZ/zW3Fv
 YL7jbjDVcyG9wnggjryG6J5QZBYU
X-Google-Smtp-Source: APXvYqzDvdQxhjX8kVhbThp9m7JLZ1RVLNR1y31N6MG4XDXeHO3qR+Ba/JIY5xZDDP+qsUlUEZlQNA==
X-Received: by 2002:a62:7684:: with SMTP id r126mr1846453pfc.26.1569479527190; 
 Wed, 25 Sep 2019 23:32:07 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i6sm1899984pfq.20.2019.09.25.23.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 23:32:06 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 1/2] ARM: dts: Add 128MiB OpenBMC flash layout
Date: Thu, 26 Sep 2019 16:01:56 +0930
Message-Id: <20190926063157.22743-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926063157.22743-1-joel@jms.id.au>
References: <20190926063157.22743-1-joel@jms.id.au>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This is an alternate layout used by OpenBMC systems that require more
space on the BMC's flash. In addition to more space for the rootfs, it
supports a larger u-boot and Linux kernel FIT image.

The division of space is as follows:

 u-boot + env: 1MB
 kernel/FIT: 9MB
 rwfs: 86MB
 rofs: 32MB

OpenBMC-Staging-Count: 1
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: adjust layout to have larger u-boot and kernel
---
 .../boot/dts/openbmc-flash-layout-128.dtsi    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-128.dtsi

diff --git a/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi
new file mode 100644
index 000000000000..05101a38c5bd
--- /dev/null
+++ b/arch/arm/boot/dts/openbmc-flash-layout-128.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	u-boot@0 {
+		reg = <0x0 0xe0000>; // 896KB
+		label = "u-boot";
+	};
+
+	u-boot-env@e0000 {
+		reg = <0xe0000 0x20000>; // 128KB
+		label = "u-boot-env";
+	};
+
+	kernel@100000 {
+		reg = <0x100000 0x900000>; // 9MB
+		label = "kernel";
+	};
+
+	rofs@a00000 {
+		reg = <0xa00000 0x5600000>; // 86MB
+		label = "rofs";
+	};
+
+	rwfs@6000000 {
+		reg = <0x6000000 0x2000000>; // 32MB
+		label = "rwfs";
+	};
+};
-- 
2.23.0

