Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C9218C34D
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 23:51:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k2G10xK0zDrR3
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 09:51:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=3vpzzxgukb3mblepzxffxcv.tfdfgvesdtczjkj.fqcrsj.fix@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MhM+didP; dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k2BT1ppQzDqwl
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 09:48:30 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id s18so3220863pgd.13
 for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2020 15:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=LhMQ+INauU/9KsdnAD4j2Pb0cvx1ECfEdZDOsAn7Tjs=;
 b=MhM+didPcgg860ORFtZLYW+f0Yigz9R3V9Dt9sQFenpw5C8t+d3zAp4iZdnHS20qBj
 rluUdvf3Tk5HZ+fhAi+3AhaWvz6M+8nPWu3gEjKl+mlO13h6gzwlEWXL/mUVBeRs2Q1Z
 BXnLAIZ4oYQYPE6viTR1RxUYphilXx+en4IHpEXGMygvfUa40O3kVU0Oxj2sc6V1ACiT
 3eQOHS+rfuemcp3ctkZ5yzASfOo/QIp4jzErU+6nwvqG/FjdsT3YbnG4foi4eG0755xh
 aBIwiN7e8pqaY440bLfaY470kt6vhy+0vhGsbDWheRHYTqa9t2oI6lP7JabCSxg+rBng
 2tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LhMQ+INauU/9KsdnAD4j2Pb0cvx1ECfEdZDOsAn7Tjs=;
 b=kK7SXTEMm4V5AtgTEEVbhKjsVN1ZVX9PXvhK1BpDXrtpRB2X1KIdU0FUXhkdU7uXhT
 L0Lpumi70MtqzF16CH7UyiDYXltbr3PPC4X2v4qGPF3lIdALVPl+XimRRQA2CrIJ3kIh
 zGqAQXh3o8cqgsovnbXLhUopJXVC5xF6Za0OhMTosbsJBHUCbsS/MKMMHoGd4zWIg3tc
 aSIyj8Gs3msR6v0hGuB6ZTsMOWhrMR2WMKaw9p2T0KMkOwPBX3mUAs+A2y94xHj5wMWd
 8h0cyYz7y7NRselFj/0C3y9MGs4XEwVfqCP7vFpdNyQ1YBW70brDOXE7ARkELnH0FZh/
 BDpQ==
X-Gm-Message-State: ANhLgQ1V5LJyHXmD0u73PhTYv2z3mqMcOyOIelpdZT0L99XeFAO3xk/c
 CuyydDHGowQC5lngwveKvraG9p3UIQ==
X-Google-Smtp-Source: ADFU+vsLgunwRk9yZ3AUlPSafEADszzRYkrqieYJNQ1jOtHdB0maXLeE+UQJmDtZWigVEJCVaugEtLcuxQ==
X-Received: by 2002:a17:90a:25c8:: with SMTP id
 k66mr6241638pje.90.1584658108071; 
 Thu, 19 Mar 2020 15:48:28 -0700 (PDT)
Date: Thu, 19 Mar 2020 15:48:11 -0700
In-Reply-To: <20200319224812.202013-1-kunyi@google.com>
Message-Id: <20200319224812.202013-3-kunyi@google.com>
Mime-Version: 1.0
References: <20200319224812.202013-1-kunyi@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v1 2/3] hwmon: (sbtsi) Add documentation
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

Document the SB-TSI sensor interface driver.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 Documentation/hwmon/sbtsi_temp.rst | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst

diff --git a/Documentation/hwmon/sbtsi_temp.rst b/Documentation/hwmon/sbtsi_temp.rst
new file mode 100644
index 000000000000..f5addb72d13f
--- /dev/null
+++ b/Documentation/hwmon/sbtsi_temp.rst
@@ -0,0 +1,33 @@
+Kernel driver sbtsi_temp
+==================
+
+Supported hardware:
+
+  * Sideband interface (SBI) Temperature Sensor Interface (SB-TSI)
+    compliant AMD SoC temperature device.
+
+    Prefix: 'sbtsi_temp'
+
+    Addresses scanned: This driver doesn't support address scanning.
+
+    Datasheet: The SB-TSI interface and protocol is available as part of
+               the open source SoC register reference at:
+
+	       https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
+
+               The Advanced Platform Management Link (APML) Specification is
+               available at:
+
+	       http://developer.amd.com/wordpress/media/2012/10/41918.pdf
+
+Author: Kun Yi <kunyi@google.com>
+
+Description
+-----------
+
+The SBI temperature sensor interface (SB-TSI) is an emulation of the software
+and physical interface of a typical 8-pin remote temperature sensor (RTS) on
+AMD SoCs. It implements one temperature sensor with readings and limit
+registers encode the temperature in increments of 0.125 from 0 to 255.875.
+Limits can be set through the writable thresholds, and if reached will trigger
+corresponding alert signals.
-- 
2.25.1.696.g5e7596f4ac-goog

