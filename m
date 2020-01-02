Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C412F1E8
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2020 00:45:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47pl605nQczDqCB
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2020 10:45:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y2b5uzG6"; 
 dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47pl5G5F2PzDqC4
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jan 2020 10:45:04 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id a6so3891593pjh.2
 for <openbmc@lists.ozlabs.org>; Thu, 02 Jan 2020 15:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8jJoif8+uhUGnG/yxKt+aQSnehq3+M9a17ZJrGpL2Bw=;
 b=Y2b5uzG6oS2QEPllB0qQdaxqHnR6kp9i+LTVXBANFYhr/5kaonhmFmQ5Xf4AkoYK8V
 4GhXAtjtGEBc4K50RkQd+vlCS2QC92mlRKbJZIUopPsCPUnln46xFLRWBHv8jIFGfd9i
 oEgkqc0djlNbFFJo6oVA76W1qu0ouZJxovJvQMN0FrNQvrP+JNPH8nObXjzxBe0HkY3Q
 3LtZEpTklqyxWT1iMf/uI/Nt11S35TcGm/InB4MIqg6f9HBWcBLTvm8fRIH3EUJwRpNk
 auZw3N+KPruqwZtjWD9dWuGkcZqNUdKWsBRYBKFhIUS4yCwUEbTnDg2FI607ir3IAx6d
 aBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8jJoif8+uhUGnG/yxKt+aQSnehq3+M9a17ZJrGpL2Bw=;
 b=cWqL8Dnuo2cnjimTSnfBfDct8usXK8b8DQnpIAM/MmREBcxvfmsQrFokLHcGSSm3yH
 jz7t9j2aSlt2xhQV4Q04acRtjIyU+TP1Q+fTW4wc0Q9S/m4INGTAhzalhGmsDat3eIPp
 bPzDMvutxwlD1Qw6qGrKQy8YN+7MkyGYfdo72v3o/iMoRcWgR7wF6pEw0vpjonsnUp/Y
 8P0LjsfTCQgIxZx5NpT73KdqWZrxGKAOn5OlI202ka6kuhegBCH0BaJRBObSr1Ye9NPZ
 fVSlZsxikK5xVYGyIsi+JjMjf/KbmKDFi4dV/IJY0GUZI4wZQZ/VJWYUp5CUq1zWPQJN
 KIuw==
X-Gm-Message-State: APjAAAUVY/IPr++Pr4O8cXdrKpYwtWz9vaAbDNudtTRSrrj6FutGHnEk
 6+pk197D+npg5z+0/I6mKhiyAHnQ
X-Google-Smtp-Source: APXvYqxJFosvQWs/J/9cdeo3kqhzuBN4SZWc4CmtZa+ewleKQyIxdQ2ZXyemM7VfkmUKnxu/iNiVTA==
X-Received: by 2002:a17:90a:2223:: with SMTP id
 c32mr23838916pje.15.1578008700034; 
 Thu, 02 Jan 2020 15:45:00 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id gc1sm12053441pjb.20.2020.01.02.15.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 15:44:59 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4] ARM: dts: aspeed: rainier: Remove duplicate i2c
 busses
Date: Fri,  3 Jan 2020 10:44:51 +1100
Message-Id: <20200102234451.301828-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
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
Cc: Derek Howard <derekh@us.ibm.com>, Jim L Wright <jlwright@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a revert of "ARM: dts: aspeed: rainier: Add i2c devices", which
was already applied to the tree.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 365 -------------------
 1 file changed, 365 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index e1d931a0907b..1edeb8a415b5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -591,371 +591,6 @@
 	status = "okay";
 };
 
-&i2c13 {
-	status = "okay";
-};
-
-&i2c14 {
-	status = "okay";
-};
-
-&i2c15 {
-	status = "okay";
-};
-
-&i2c0 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-};
-
-&i2c2 {
-	status = "okay";
-};
-
-&i2c3 {
-	status = "okay";
-
-	power-supply@68 {
-		compatible = "ibm,cffps2";
-		reg = <0x68>;
-	};
-
-	power-supply@69 {
-		compatible = "ibm,cffps2";
-		reg = <0x69>;
-	};
-
-	power-supply@6a {
-		compatible = "ibm,cffps2";
-		reg = <0x6a>;
-	};
-
-	power-supply@6b {
-		compatible = "ibm,cffps2";
-		reg = <0x6b>;
-	};
-};
-
-&i2c4 {
-	status = "okay";
-
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
-
-	tmp275@49 {
-		compatible = "ti,tmp275";
-		reg = <0x49>;
-	};
-
-	tmp275@4a {
-		compatible = "ti,tmp275";
-		reg = <0x4a>;
-	};
-};
-
-&i2c5 {
-	status = "okay";
-
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
-
-	tmp275@49 {
-		compatible = "ti,tmp275";
-		reg = <0x49>;
-	};
-};
-
-&i2c6 {
-	status = "okay";
-
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
-
-	tmp275@4a {
-		compatible = "ti,tmp275";
-		reg = <0x4a>;
-	};
-
-	tmp275@4b {
-		compatible = "ti,tmp275";
-		reg = <0x4b>;
-	};
-};
-
-&i2c7 {
-	status = "okay";
-
-	si7021-a20@20 {
-		compatible = "silabs,si7020";
-		reg = <0x20>;
-	};
-
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
-
-	max31785@52 {
-		compatible = "maxim,max31785a";
-		reg = <0x52>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		fan@0 {
-			compatible = "pmbus-fan";
-			reg = <0>;
-			tach-pulses = <2>;
-		};
-
-		fan@1 {
-			compatible = "pmbus-fan";
-			reg = <1>;
-			tach-pulses = <2>;
-		};
-
-		fan@2 {
-			compatible = "pmbus-fan";
-			reg = <2>;
-			tach-pulses = <2>;
-		};
-
-		fan@3 {
-			compatible = "pmbus-fan";
-			reg = <3>;
-			tach-pulses = <2>;
-		};
-	};
-
-	pca0: pca9552@60 {
-		compatible = "nxp,pca9552";
-		reg = <0x60>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio@0 {
-			reg = <0>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-		};
-	};
-
-	dps: dps310@76 {
-		compatible = "infineon,dps310";
-		reg = <0x76>;
-		#io-channel-cells = <0>;
-	};
-};
-
-&i2c8 {
-	status = "okay";
-
-	ucd90320@b {
-		compatible = "ti,ucd90160";
-		reg = <0x0b>;
-	};
-
-	ucd90320@c {
-		compatible = "ti,ucd90160";
-		reg = <0x0c>;
-	};
-
-	ucd90320@11 {
-		compatible = "ti,ucd90160";
-		reg = <0x11>;
-	};
-
-	rtc@32 {
-		compatible = "epson,rx8900";
-		reg = <0x32>;
-	};
-
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
-
-	tmp275@4a {
-		compatible = "ti,tmp275";
-		reg = <0x4a>;
-	};
-};
-
-&i2c9 {
-	status = "okay";
-
-	ir35221@42 {
-		compatible = "infineon,ir35221";
-		reg = <0x42>;
-	};
-
-	ir35221@43 {
-		compatible = "infineon,ir35221";
-		reg = <0x43>;
-	};
-
-	ir35221@44 {
-		compatible = "infineon,ir35221";
-		reg = <0x44>;
-	};
-
-	tmp423a@4c {
-		compatible = "ti,tmp423";
-		reg = <0x4c>;
-	};
-
-	tmp423b@4d {
-		compatible = "ti,tmp423";
-		reg = <0x4d>;
-	};
-
-	ir35221@72 {
-		compatible = "infineon,ir35221";
-		reg = <0x72>;
-	};
-
-	ir35221@73 {
-		compatible = "infineon,ir35221";
-		reg = <0x73>;
-	};
-
-	ir35221@74 {
-		compatible = "infineon,ir35221";
-		reg = <0x74>;
-	};
-};
-
-&i2c10 {
-	status = "okay";
-
-	ir35221@42 {
-		compatible = "infineon,ir35221";
-		reg = <0x42>;
-	};
-
-	ir35221@43 {
-		compatible = "infineon,ir35221";
-		reg = <0x43>;
-	};
-
-	ir35221@44 {
-		compatible = "infineon,ir35221";
-		reg = <0x44>;
-	};
-
-	tmp423a@4c {
-		compatible = "ti,tmp423";
-		reg = <0x4c>;
-	};
-
-	tmp423b@4d {
-		compatible = "ti,tmp423";
-		reg = <0x4d>;
-	};
-
-	ir35221@72 {
-		compatible = "infineon,ir35221";
-		reg = <0x72>;
-	};
-
-	ir35221@73 {
-		compatible = "infineon,ir35221";
-		reg = <0x73>;
-	};
-
-	ir35221@74 {
-		compatible = "infineon,ir35221";
-		reg = <0x74>;
-	};
-};
-
-&i2c11 {
-	status = "okay";
-
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
-
-	tmp275@49 {
-		compatible = "ti,tmp275";
-		reg = <0x49>;
-	};
-};
-
-&i2c12 {
-	status = "okay";
-};
-
 &i2c13 {
 	status = "okay";
 
-- 
2.24.1

