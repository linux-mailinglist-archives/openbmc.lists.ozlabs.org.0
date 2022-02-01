Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 353164A53F6
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 01:19:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnlsm0D8bz30Q6
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 11:19:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=XerAaj0R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=XerAaj0R; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnlsP1VsQz2yNv
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 11:18:48 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net
 [174.21.190.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EA9C9A6A;
 Mon, 31 Jan 2022 16:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1643674727;
 bh=GHTkxsASPABKmKkml1AsjQmWZbxD0ljM11iBp+9inDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XerAaj0Rld0i0njCHB2mmNb+NdDJoITVLaTpFsJzm2/giAj+K077OduZ2AO0FOhu6
 mN5pnLg732uoMUvFvy7p+ELJAnWGrOZdzT03Y/7oz0Vo6X/InFWmJFM/U+Gp7n9QAD
 eJfrtghgP4wj/eXJ61130Onw23wIqpY6bNBUvy/4=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: i2c: add nxp,
 pca9541 release-delay-us property
Date: Mon, 31 Jan 2022 16:18:10 -0800
Message-Id: <20220201001810.19516-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201001810.19516-1-zev@bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>,
 Peter Rosin <peda@axentia.se>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This property can be used to reduce arbitration overhead on busy i2c
busses by retaining ownership for a brief period in anticipation of
another transaction in the near future.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 Documentation/devicetree/bindings/i2c/nxp,pca9541.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt b/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
index 42bfc09c8918..9e8819593271 100644
--- a/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
+++ b/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
@@ -6,6 +6,14 @@ Required Properties:
 
   - reg: The I2C address of the device.
 
+Optional Properties:
+
+ - release-delay-us: the number of microseconds to delay before
+   releasing the bus after a transaction.  If unspecified the default
+   is zero (the bus is released immediately).  Non-zero values can
+   reduce arbitration overhead for back-to-back transactions, at the
+   cost of delaying the other master's access to the bus.
+
   The following required properties are defined externally:
 
   - I2C arbitration bus node. See i2c-arb.txt in this directory.
@@ -16,6 +24,7 @@ Example:
 	i2c-arbitrator@74 {
 		compatible = "nxp,pca9541";
 		reg = <0x74>;
+		release-delay-us = <20000>;
 
 		i2c-arb {
 			#address-cells = <1>;
-- 
2.34.1

