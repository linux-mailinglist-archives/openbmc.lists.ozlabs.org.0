Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E59129691
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 14:37:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hL4W5nLLzDqDl
	for <lists+openbmc@lfdr.de>; Tue, 24 Dec 2019 00:37:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K9YQD2rP"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hL3F373TzDqM7
 for <openbmc@lists.ozlabs.org>; Tue, 24 Dec 2019 00:36:08 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id z16so9226099pfk.0
 for <openbmc@lists.ozlabs.org>; Mon, 23 Dec 2019 05:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W69ZY84XSWRFqafR63Sdv3VtkdKq6jpwOtKb/mggzQo=;
 b=K9YQD2rPiR0zLbjCw7a/9l/2azezcM6iBPZjM7aa4rluYkkwclhzU08qL/IUHDWyvY
 qEVzTlJR4G7HAp5bjCQKF0m4jkcDtqJ5mXPfO+BDhuSzPl16hEJ4LuuD+1/ocTfBRhF1
 oeOeF3fAqa5f2bSyiXaYkGtTKRK9CVTEXN6LBRfYdUUoThIgheTNZiDLGiTJKGboSXwt
 oWN/vEGIGDlrsXONLrisnCo3uVKjV70oMr/sZp3/5Zod5+PwvZj9SZU2U+nXdO8ppcyn
 X2nWmsxq1ohU44mCIDGzGbr0y/3AukDRNUz7HLab4zwPFAkXRKlNbB2G1IAYZt9y0f8w
 tEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=W69ZY84XSWRFqafR63Sdv3VtkdKq6jpwOtKb/mggzQo=;
 b=XJRQZNIPu0OrmqZtfS237hGcdupDT7uvNoLPE9lf5bhjuEplYxFCJPYpA7BLDBG7OP
 heVoja1PcV3o/3MiRu7PH4xKpCvVa3mlCHIGkVqr6yz+6QtWkD65prw2gfN6OEb0GR5P
 dRPk9JYL04eXju1wWY6bp8peMurucTq9RG0sTgrh7NYlOkQgdQj9cLt7hKXd9oZ5J+DG
 hsoUttDjsGqDWb6xg7X20LSCNPlx9KRryKxHFK1tb15+T38HVY87a/ipLUe0mfXkKZWn
 X2uZX/xm0ld6nFWBJKnmDSvrx+ymeCfHeiMrCrLJzMGeFc+jGAEDmtjoPeBKZe8mgPHP
 ASNw==
X-Gm-Message-State: APjAAAWQAnaaPzwqmhHjnaITFQnC8JScwlQbWZz+7Hf4ObSZ6AdJIWlu
 bOPjlN5HNqTZqiLoJTY0H/o=
X-Google-Smtp-Source: APXvYqw4lSh8zUyee7bTgQgBCzZ+AF/Tl2IO4Xd81zu/jyT5p5i+norujI5heywmdrAvlz28UQSljw==
X-Received: by 2002:aa7:800e:: with SMTP id j14mr6588841pfi.174.1577108164841; 
 Mon, 23 Dec 2019 05:36:04 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id c78sm25194818pfb.122.2019.12.23.05.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 05:36:04 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Popple <alistair@popple.id.au>
Subject: [PATCH linux dev-5.4] ARM: dts: aspeed: rainier: Add host FSI
 description
Date: Tue, 24 Dec 2019 00:35:54 +1100
Message-Id: <20191223133554.537395-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This adds the description of the Power CPUs that are attached to the
BMC.

Without this userspace will see the '/dev/scom66' style layout.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 ++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index dad5233efba3..e1d931a0907b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -72,6 +72,88 @@
 	status = "okay";
 };
 
+&fsim0 {
+	status = "okay";
+
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	cfam@0,0 {
+		reg = <0 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <0>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ0: occ {
+				compatible = "ibm,p9-occ";
+			};
+		};
+
+		fsi_hub0: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+};
+
+&fsi_hub0 {
+	cfam@1,0 {
+		reg = <1 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <1>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ1: occ {
+				compatible = "ibm,p9-occ";
+			};
+		};
+
+		fsi_hub1: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+};
+
+/* Legacy OCC numbering (to get rid of when userspace is fixed) */
+&fsi_occ0 {
+	reg = <1>;
+};
+
+&fsi_occ1 {
+	reg = <2>;
+};
+
 &ibt {
 	status = "okay";
 };
-- 
2.24.0

