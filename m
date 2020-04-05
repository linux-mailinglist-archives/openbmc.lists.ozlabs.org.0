Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E4C19E8BE
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 05:05:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vz7V5lPpzDqcJ
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 13:05:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=3dkqjxgukb8er1u5pnvvnsl.jvtvwluitjspz0z.v6shiz.vyn@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PO44/Tdb; dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vz381hJszDqSM
 for <openbmc@lists.ozlabs.org>; Sun,  5 Apr 2020 13:01:36 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id w70so4791104pgw.6
 for <openbmc@lists.ozlabs.org>; Sat, 04 Apr 2020 20:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=/mhEVKDrcLowpzfx6YTsJHtWxucbZ6JF/7+trFXxaIo=;
 b=PO44/TdbXsdOKUnGcbwCiq/biYVFIazEY47zEiL9aID60XNQpcSbVLtTbF1LgtQNwu
 pq8ors1X0WVg3T14QfHi7jePFG7uQd9ygbYZ6CpcFfjP/18Wf+elgVnt5F1k5n4JTJ88
 wPmAHTdtEMBZ9c4iEm7ET5yZaVXbSdnJxh4D/AcqBo+UW8TDHuzclsZA7utXw9OpDhga
 +2K7HKhe7i3QIUgjhE6O9ZNROr7e5cy2HNGHVJrpRSZmhPjQGhABt/equMSc59wTWcwT
 pJfczuxrC9ZErwPiAZCZ5Yd0aL2OYbkslHcPXbWXWA0pWQUgI8ar1xlvTEqM5Uvs3TiU
 N6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/mhEVKDrcLowpzfx6YTsJHtWxucbZ6JF/7+trFXxaIo=;
 b=AbnrlT3mDfaRuYgtRD1NkaTv3NWX26GaOu3Hw2RKz8Y65Qlk7Om4xXu7T2v1pyshEI
 i+O0IjqXWpPM+sEbasxxgKQ+GD+D4/vBx3K9kfldR1nBM2bgdRothsS98ij55YTEnERJ
 4xNVvGE3dabdPBBE3OPBt9G7vASfaCDqMCdhu9ObR8JlTlK8UtKx0HvTU21JcfLUfKHl
 8nimb3MwKsczrJM6dh1cXDrSQaE6elAMSj1cT5lLp2E1sBanZXXVgn/1W+0+Kd5pjm5E
 S2vBID8OlKivIfvENyaXnTL6B93jSk1wNCLYQr1QC34ljqw/fDYDFGbQxsJW4+R7biRc
 P5Ew==
X-Gm-Message-State: AGi0PuZo3hFzGULxEMK0YpDIiLm779snlbJESJHe4oHdNjVk/mLU/qfx
 sBx9ZS6Kl1huEwPrM4pftqio9VclHw==
X-Google-Smtp-Source: APiQypJo7hFsDNHoEJgwxYSllOJInVS57xICFoKfaImyalPvwkywRfVPaQkhFH+eDgQu9zLiFFDHLfoToQ==
X-Received: by 2002:a63:2e44:: with SMTP id u65mr3435016pgu.142.1586055694463; 
 Sat, 04 Apr 2020 20:01:34 -0700 (PDT)
Date: Sat,  4 Apr 2020 20:01:18 -0700
In-Reply-To: <20200405030118.191950-1-kunyi@google.com>
Message-Id: <20200405030118.191950-4-kunyi@google.com>
Mime-Version: 1.0
References: <20200405030118.191950-1-kunyi@google.com>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
Subject: [PATCH linux hwmon-next v3 3/3] dt-bindings: (hwmon/sbtsi_tmep) Add
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
 .../devicetree/bindings/hwmon/amd,sbtsi.txt   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt

diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt
new file mode 100644
index 000000000000..be7293c43c0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.txt
@@ -0,0 +1,26 @@
+* Sideband interface Temperature Sensor Interface (SB-TSI) compliant
+AMD SoC temperature device.
+
+SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
+interface that reports AMD SoC's Ttcl (normalized temperature),
+and resembles a typical 8-pin remote temperature sensor's I2C interface
+to BMC. The emulated thermal sensor can report temperatures in increments of
+0.125 degrees, ranging from 0 to 255.875.
+
+Required properties:
+- compatible: manufacturer and chip name, should be
+	"amd,sbtsi",
+
+- reg: I2C bus address of the device as specified in Section 6.3.1 of the
+SoC register reference: The SB-TSI address is normally 98h for socket 0 and
+90h for socket 1, but it could vary based on hardware address select pins.
+
+[open source SoC register reference]:
+	https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
+
+Example:
+
+sbtsi@4c {
+	compatible = "amd,sbtsi";
+	reg = <0x4c>;
+};
-- 
2.26.0.292.g33ef6b2f38-goog

