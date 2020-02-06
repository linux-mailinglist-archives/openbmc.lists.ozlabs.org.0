Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C9A1549EC
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 18:03:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D4XB3Rx2zDqb9
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 04:03:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Au6nzfnD; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D4WT2DdCzDqVk;
 Fri,  7 Feb 2020 04:03:16 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id r16so6188255otd.2;
 Thu, 06 Feb 2020 09:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IeTZrdBP9Hf13GH1UBDM8f5f9+rl1pL1drtOnzJSoEE=;
 b=Au6nzfnD9JbIjuoL9LmDt9DO926XEvDDHsqD3l/D5SC7ZozTSJ+f4XOnJpbkDsYtG0
 eg5KT4+bF59pq5e9sDR4TQE74ywJzQpYY37KE8FlsTyf6aeunElkQ4SgL9N8tMkYsaN8
 ZVG5x3SZdso7y0fWUJMwFfL6OpB/8UCT8soltYwM1BXWAfWoFR9hg0bJZFTN6HjibXSp
 c95t2C/tXP1ot8+8xJOO4Q2koHI0WlH3RQ7wV5EWwZF6PE2qWyXqLDyz6EArzslT8yK7
 5+rBsMTNPoW/clqZnguEvtTjFDjVm3rHrfJRNuGsT3bcY/y/L1PKgxGhrMeJap+HJcZ5
 IFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IeTZrdBP9Hf13GH1UBDM8f5f9+rl1pL1drtOnzJSoEE=;
 b=uXrdyei6ymFjAxL2EU6OV1Xd7Yv+nwPq01VgodFb3rOLeolMk4oIHwCzK+3ADuZodo
 87Gg8GEykg4HrILP/iD+9ZpXW6gQHqrXB9Ki7dOho2+FjndC1RRUrkHKIzY/gH0udKpW
 s0aA2f0/p0N9oISThKBW6TLivT/f7iqnOT9Y9hckVLcTtfLwjZ2Q9cz2z9pZ8rYaOduA
 Ivx5RmLnJHqxp405CHqJYAh+Sz0uuzC4X6dv9tFjZFvU8sAdXPKpLywwXmW8isnF8JkP
 vhO3vOD2ki6nxCuGFiqgBsE7ZUvIQWTw4X6099jmm7j+1GzoKpYxFftwpeqHW0c0ylJd
 dQuA==
X-Gm-Message-State: APjAAAU0hAhNqj4N8Llx511TA6AabrSQTJ0yhiMj1JW22SfQ/kkcRyZt
 54U2T6iEJqZRDV73tRtEZ/fjqMJqmaOvvA==
X-Google-Smtp-Source: APXvYqzojO5LxaWz5TmWr0czHWvxHCGQ25CU390Jrs7j5DnAUB0SRjmiKdacElgXeHOX8NXFZ1Dt6w==
X-Received: by 2002:a05:6830:50:: with SMTP id
 d16mr24338717otp.166.1581008586834; 
 Thu, 06 Feb 2020 09:03:06 -0800 (PST)
Received: from Andrews-MBP-2.attlocal.com
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id m68sm55687oig.50.2020.02.06.09.03.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Feb 2020 09:03:06 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] ARM: dts: aspeed: witherspoon: Add gpio line names
Date: Thu,  6 Feb 2020 11:02:34 -0600
Message-Id: <20200206170234.84288-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <FMfcgxwGDDpcbrVbWGfkMRbZCLSZqpMM>
References: <FMfcgxwGDDpcbrVbWGfkMRbZCLSZqpMM>
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
Cc: linux-gpio@vger.kernel.org, Andrew Geissler <geissonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Geissler <geissonator@yahoo.com>

Name the GPIOs to help userspace work with them. The names describe the
functionality the lines provide, not the net or ball name. This makes it
easier to share userspace code across different systems and makes the
use of the lines more obvious.

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
v3: added more detail to commit message
    removed linux dev-5.4 from PATCH header
    removed redundant status from gpio
    removed blank line
v2: added upstream to patch
    prepended fsi- on fsi related gpios
    prepended led- on led related gpios
    prepended presence on presence related gpios
    dropped pin_gpio_a1 definition
---
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 515f0f208ee6..2269c73b8987 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -193,6 +193,40 @@
 
 };
 
+&gpio {
+	gpio-line-names =
+	/*A0-A7*/	"","cfam-reset","","","","","fsi-mux","",
+	/*B0-B7*/	"","","","","","air-water","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"fsi-enable","","","","","","","",
+	/*E0-E7*/	"fsi-data","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","checkstop","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"presence-ps1","","led-rear-fault","led-rear-power",
+		        "led-rear-id","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","presence-ps0",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","fsi-trans","","","power-button","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"fsi-clock","","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 &fmc {
 	status = "okay";
 
-- 
2.21.0 (Apple Git-122)

