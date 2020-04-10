Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF371A4A50
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 21:21:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zSXn6cRjzDqfd
	for <lists+openbmc@lfdr.de>; Sat, 11 Apr 2020 05:20:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cJ4hIkna; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zST06KcbzDrCS;
 Sat, 11 Apr 2020 05:17:40 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id 103so2804300otv.0;
 Fri, 10 Apr 2020 12:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pGMNxl5yMaSl8w4TVy6/u5eqbJHU/Il2MpyvoWjq+Hs=;
 b=cJ4hIknacOZTf+wTNHq17b7pSjadFHPOsl31Rr/7cFhiBWqXjznKp4SYO/Fa30y1oU
 CDgEOxy2o0za+R4gRtGHD8ZTCDK/vata9dknSwXvyhiP0jkBxQOh/HFgD82OvIKxZ5Qg
 GVlL42E+DSIrJWrjAB/hLCC41H1by0iDzKbzytR2Dyi5U4nFTQ9utqE8kI1+PKxK68Tn
 PTmNiSgYbjlMyUDrbb9Y9dGq42a28vdsobMxH29zntYKSwNEIeuqawyqtvbJ1l45uIo/
 FQFhsXzEqhns0G+zB3YZvjF8PPkiVpp4DR9/uZdINhyyajINXUs1xVP73IH1e/avxy+9
 RG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pGMNxl5yMaSl8w4TVy6/u5eqbJHU/Il2MpyvoWjq+Hs=;
 b=NbVBoHgYIAIvIdfJJE5wFQWO6L7JKjEhHcwDaYt8iepywzSU56GlnXhX1KPm57HsA5
 cR+y0EmlF1hZ9hp97ZRgf8vGSmnUp84VkKqxiYNBVwBrosgrrNItL7P4HUeHUbTVrbGl
 jyaCPCEaAzUdJLTz/h/pZJkJfYXQqkvsAjuKozvWUnPjzxTL0cwKCjkW6hr/IrXRIRTE
 QAP8v7f+xD48I3mAno/Tp2I3cEoTuif6U51Zm76YqmERpT5NgcWHFd3wO0/o/S4eswFT
 hpGKGzIHaaoPQA+ECSoB4rb2KK8771UhKpXmLofZB3WvIKZqh3sBJy+68dEJFh3KLcO+
 5aJw==
X-Gm-Message-State: AGi0PubpsscFhwyXUwgqE8d9cdZYvqCzwnjvTzTkmKXFi+FoqD6xPLX6
 M1N+xjKF+Id4sR+Pp+jZYY3ZLNpQAgym0A==
X-Google-Smtp-Source: APiQypIPe6SDOZEbT2UuatfbKpEq3Q7lnEcSmKVNAe9RU1+ELrHnloyze7yIhau2lR+NFI1Io5EAuA==
X-Received: by 2002:a9d:6a95:: with SMTP id l21mr5173279otq.237.1586546255357; 
 Fri, 10 Apr 2020 12:17:35 -0700 (PDT)
Received: from Andrews-MBP-2.attlocal.net
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id i17sm1597363otc.16.2020.04.10.12.17.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Apr 2020 12:17:34 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: aspeed: rainier: Add gpio line names
Date: Fri, 10 Apr 2020 14:17:04 -0500
Message-Id: <20200410191704.82625-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
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
Cc: linux-gpio@vger.kernel.org, Andrew Geissler <geisonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Geissler <geisonator@yahoo.com>

Name the GPIOs to help userspace work with them. The names describe the
functionality the lines provide, not the net or ball name. This makes it
easier to share userspace code across different systems and makes the
use of the lines more obvious.

Signed-off-by: Andrew Geissler <geisonator@yahoo.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 0a7a8b84c118..01db238ce741 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -70,6 +70,40 @@
 
 };
 
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","",
+	/*Q0-Q7*/	"cfam-reset","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
+				"","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"","","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 &emmc_controller {
 	status = "okay";
 };
-- 
2.17.1

