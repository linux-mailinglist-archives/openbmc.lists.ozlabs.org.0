Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F9946B38E
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 08:18:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Wq55LQhz2ypL
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 18:18:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=BS0Frtvf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=BS0Frtvf; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7WnL494vz2yNr
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 18:16:38 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 80EFC673;
 Mon,  6 Dec 2021 23:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1638861396;
 bh=DLYbN0BwJINAopqXYHsMVrIfzEfDIDq+91j/Sj5/ryo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BS0Frtvf3KSXKl63obYXoev+Pyp5IFsDZdFKwgnNhrrHUUXdbcjy+uJqPancCwX5c
 n0tgeApW6XhWj5B9fO1zsmj1BEUiKCMYcjl9tNCF+eNG2LCw1GyTlyy3n4F2LPatbw
 Rib/5W0DIZawEApZg4DxdJX1MratdEz5yU91+t0k=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: add Delta AHE-50DC fan control module
Date: Mon,  6 Dec 2021 23:15:21 -0800
Message-Id: <20211207071521.543-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211207071521.543-1-zev@bewilderbeest.net>
References: <20211207071521.543-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Zev Weiss <zev@bewilderbeest.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is the integrated fan control module of the Delta AHE-50DC Open19
power shelf.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 791079021f1b..1c43cc91f804 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -73,6 +73,8 @@ properties:
           - dallas,ds4510
             # Digital Thermometer and Thermostat
           - dallas,ds75
+            # Delta AHE-50DC Open19 power shelf fan control module
+          - delta,ahe50dc-fan
             # Delta Electronics DPS-650-AB power supply
           - delta,dps650ab
           # Delta Electronics DPS920AB 920W 54V Power Supply
-- 
2.34.1

