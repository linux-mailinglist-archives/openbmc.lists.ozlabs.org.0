Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE878153A8B
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 22:56:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Cb4G5kNgzDqLC
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 08:56:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q34KOhpk; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Cb3N0G7TzDqKb;
 Thu,  6 Feb 2020 08:55:43 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id i1so2400091oie.8;
 Wed, 05 Feb 2020 13:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qndbgjnKGTRqil5Ffj6ZYDKeVw7HlXNwJpUlAgm+S6Y=;
 b=q34KOhpk47Q/2E2X+VFfQB25SvVHJuhCnCg72JdZCFnW+34+VG2/GkEDFmAASAupm4
 on29xmt526yzth1T5zm/ebJ1M1wvCuY4Yx6/901AobkiGPk8jC7h3RyrgcH5Vs4C8UF7
 KN/spHDzuJjORoS0IUzm0FRkq1V9B/lbDpLuH0gB4B5pLXTjNV0uKEZCndTP1J4oCf8/
 h/1WjYJS3OGsZsmR6BFQPvhvM6grondSLwj30uUnPicUHus/rgxmJdX6sdVQ4DIV/eiN
 xO+0hbO8PBLNoTOiNpeK721XNw3+z+C9X+yrn0GnSkd+efN1vixeURjr63JB7sXnCxsx
 8Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qndbgjnKGTRqil5Ffj6ZYDKeVw7HlXNwJpUlAgm+S6Y=;
 b=i2eUHSxy9MqauX0FngUjzFSxvsLtxRnezFvdUrgkxHfgXayzmc4fuq9E+nn7k2vMAW
 SpFAdSJrlSNXjIGzeQf19OydbHS99vnplpzVs+PADNdCg9/mdEf+CqMDW6VxjUen/0bs
 BQNW/MpM9ZSjCP2V43T7Xydtea9x8S2ybfMk/cKN/jhSXJ48YoKm2FRY1YNREkriFC8Q
 Kj4PknqhrmRwZQ+tzzyZeAbm35hzBTudORMmsThIsMSNFhbL5WM+V/UCdKyELkDFyOCv
 l0T3eID1RxDh0/tWEJb6C3qRegJkBLovDne17VEQL2wztXhpf2EFT3FlxU0MnjgCVioO
 RFNA==
X-Gm-Message-State: APjAAAWm2NiKa53o5nuWlOKNDTVFhIiDdzus/n9S/BnRzmrBL6fK43qB
 mhe3NqEN1ZEA9Ldz3ZgXEZPGBknLExUTEg==
X-Google-Smtp-Source: APXvYqzIKlb6ICrQEIE/J8GnWSUbGPOQNuGxtAkBKjeoaS1kBpIQsikXhsSVFf7o1NUhEsOJfJTFIA==
X-Received: by 2002:aca:fd16:: with SMTP id b22mr4657409oii.73.1580939740596; 
 Wed, 05 Feb 2020 13:55:40 -0800 (PST)
Received: from Andrews-MBP-2.attlocal.com
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id t23sm242396oic.28.2020.02.05.13.55.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Feb 2020 13:55:40 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH linux dev-5.4 v2] ARM: dts: aspeed: witherspoon: Add gpio line
 names
Date: Wed,  5 Feb 2020 15:55:11 -0600
Message-Id: <20200205215511.80333-1-geissonator@gmail.com>
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

Name the gpios so libgiod will work with them

Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
---
v2: added upstream to patch
    prepended fsi- on fsi related gpios
    prepended led- on led related gpios
    prepended presence on presence related gpios
    dropped pin_gpio_a1 definition
---
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 515f0f208ee6..2519722928a4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -193,6 +193,42 @@
 
 };
 
+&gpio {
+    status = "okay";
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
+
+};
+
 &fmc {
 	status = "okay";
 
-- 
2.21.0 (Apple Git-122)

