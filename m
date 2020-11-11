Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F742AF31D
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 15:09:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWRST0KZHzDqS1
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 01:09:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c3x2fMXM; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWQvk24T1zDqMN
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 00:44:50 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id s30so3225258lfc.4
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 05:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f22kTKOX3u2MT6CHn3/sIK1JD6EjW0TBUjfMyRklYuU=;
 b=c3x2fMXMB1ejWBp2Xwj177xJTKlOsJeJ3xnf+vdN+c/NyW6afBJ6/Gv5g598cWCv7W
 SFCli6XXKnFfvTR3OK670Afxw/Z/cMh26FYsPs1CZZlyCcdgNpr3GYB/IGZfTcAwt8gP
 Xe2b6qaHSoQCrMcBrrvwirB4Ff1h6ySIMHFwi2fYL4wVcl4SSEugEA4/rhf6ZveKLAoC
 MFRw8omPjkcwr9UaHGG3HWhH7EcPi/jqSm8KwWwrZ31P7/gaImYvPQao10vXO1HVhi0C
 BbnyAx4srdKybHSPmvFsNF34LjBm/oobUVUBf4EAHkBdOlCpVveLWmL8JyeZWTvbNlPQ
 F2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=f22kTKOX3u2MT6CHn3/sIK1JD6EjW0TBUjfMyRklYuU=;
 b=fNSVtv3W2P/y1Dore7fhpxiKct82A6VH8HQAaSuJtJFYpwU3acNWJPJ8O0GERqZOGy
 cdI2V0Gastd90Dc7zsxjqrpLMO0qZUjJCx8nDjUVEEZUtMrQQ5tVF9vAnWgQgupHMkxi
 6vINw7lzooTxXDF75uurwDCjc2LN+AR5/r/JSgy0fv+E3a80A2O8KpRlxcWPj3hmCm/a
 37wxlhCghKy5pp/tyqD6yprApkz/aKt0OkcNIzarpWkHoZxHVcDPgUgi2f9lPTNcNOPd
 tCr9WRcIZ+j/i91gVUisb6Q1ZrDNaBLgHBGD9cALS+pGeTRuuxP5h5n0gd9VJKGM1hIS
 NyLw==
X-Gm-Message-State: AOAM530J6UjGulVxclS/uE8PNmmbFdQQa91xYReiD6fvLwvD5MAMOWKU
 QR8rXkzxqT0AGmdcgIhB9tw=
X-Google-Smtp-Source: ABdhPJz2fKIz/JoKUGKJwYycHn3QZK9RirF430Ze7nrIgowtYcizADauqGdNl3/0dP3ho+nbmSu0tw==
X-Received: by 2002:a19:434a:: with SMTP id m10mr7040126lfj.153.1605102285295; 
 Wed, 11 Nov 2020 05:44:45 -0800 (PST)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-8-148.ip.moscow.rt.ru. [46.242.8.148])
 by smtp.gmail.com with ESMTPSA id q191sm239916ljb.139.2020.11.11.05.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:44:44 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 2/3] ARM: dts: aspeed: amd-ethanolx: Enable
 devices for the iKVM functionality
Date: Wed, 11 Nov 2020 16:44:26 +0300
Message-Id: <20201111134427.1579-2-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111134427.1579-1-aladyshev22@gmail.com>
References: <20201111134427.1579-1-aladyshev22@gmail.com>
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable the USB 2.0 Virtual Hub Controller and
the Video Engine with it's reserved memory region for the implementation
of the iKVM functionality in the BMC.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
Reviewed-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20201027123722.2935-3-aladyshev22@gmail.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 2a86bda8afd8..b93ed44eba0c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -13,6 +13,21 @@
 	memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		video_engine_memory: jpegbuffer {
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+
 	aliases {
 		serial0 = &uart1;
 		serial4 = &uart5;
@@ -220,5 +235,12 @@
 	};
 };
 
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
 
+&vhub {
+	status = "okay";
+};
 
-- 
2.17.1

