Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FA5484BC7
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 01:38:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT9Yy0WKfz2yp0
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 11:37:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=DpjUe5Jk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=DpjUe5Jk; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT9YX3z7Mz2xBK
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 11:37:36 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net
 [174.21.190.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6C51E190;
 Tue,  4 Jan 2022 16:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1641343052;
 bh=GeuscGny1ziTVBaA6vYScM7v6qdUcEMdSpfwsytT5yg=;
 h=From:To:Cc:Subject:Date:From;
 b=DpjUe5Jkw8PDbQQ8t6uh8fS9pnLE0hLniXf3vdv3WfnhS+K37exVxXxNHV/aznYQo
 qZPBSCoahHeyDdStxET25OoHGstNCOQq+0ezsFKp3Ny/kxKOmOBQocCqjAQq8esaZO
 q4Y7qn0Vr0rTBg3ofu9i/uMZqg7sZImoPpYp4BGg=
From: Zev Weiss <zev@bewilderbeest.net>
To: devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: Fix OpenBMC flash layout label addresses
Date: Tue,  4 Jan 2022 16:37:18 -0800
Message-Id: <20220105003718.19888-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
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
Cc: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org,
 Troy Lee <troy_lee@aspeedtech.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We've ended up with some inconsistencies between the addresses in the
DT node labels and the actual offsets of the partitions; this brings
them back in sync.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Fixes: 529022738c8e ("ARM: dts: Add OpenBMC flash layout")
Fixes: 8dec60e7b8d0 ("ARM: dts: aspeed: Grow u-boot partition 64MiB OpenBMC flash layout")
---
 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi | 2 +-
 arch/arm/boot/dts/openbmc-flash-layout.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
index 31f59de5190b..7af41361c480 100644
--- a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
+++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
@@ -28,7 +28,7 @@ rofs@a00000 {
 		label = "rofs";
 	};
 
-	rwfs@6000000 {
+	rwfs@2a00000 {
 		reg = <0x2a00000 0x1600000>; // 22MB
 		label = "rwfs";
 	};
diff --git a/arch/arm/boot/dts/openbmc-flash-layout.dtsi b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
index 6c26524e93e1..b47e14063c38 100644
--- a/arch/arm/boot/dts/openbmc-flash-layout.dtsi
+++ b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
@@ -20,7 +20,7 @@ kernel@80000 {
 		label = "kernel";
 	};
 
-	rofs@c0000 {
+	rofs@4c0000 {
 		reg = <0x4c0000 0x1740000>;
 		label = "rofs";
 	};
-- 
2.34.1

