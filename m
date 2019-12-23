Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4611296A6
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 14:51:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hLNc6jQ3zDqMx
	for <lists+openbmc@lfdr.de>; Tue, 24 Dec 2019 00:51:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RddtxdLj"; 
 dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hLJn4gsQzDqFB
 for <openbmc@lists.ozlabs.org>; Tue, 24 Dec 2019 00:47:53 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id t101so7527522pjb.4
 for <openbmc@lists.ozlabs.org>; Mon, 23 Dec 2019 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/jqUrRk/TIaYg25joKvtwqYSUC5aEpgX77iIaHrSFg4=;
 b=RddtxdLjEs//4QuXKwCCQmpSs29AeX303VhjrjJ/LsnJsVUSFkCVXAlk2X+BNTZMCR
 S8eTWcxm0TBUzhkIRJj47o5mTbcxSAXwWpVvHBU7sCNKoUk4RwR65qPLjoJWwvVNhAHU
 wfYZvZCzbROIV89SXjTgX+z+pIYtInD/7tRlPG5Xu6RU+2atMjJjgAs7BvwCEhwm4l0L
 SUQQDaokLqztg1fWHj2u+MxSQCkZTZAIM5iKx9vHLSoliJZl35TJJfzrW7eZVG4iCCzX
 RHw1q7odPSrRRl06g7kIUAJFepMTnNG19xoU0BRgbP9gUfAo7QlDV1ouDOr5SEAJl8PO
 coNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/jqUrRk/TIaYg25joKvtwqYSUC5aEpgX77iIaHrSFg4=;
 b=MziBjyGYt77rRLJSBNKGdgf+XDvrmTkXs2cKmCp7CRjuPtybYmHLGD3ZcJ9H/RjX8B
 Whb06GfSxp+4syLY9N7atuGYQkAOpr73uC039hbQp6wwBYVanhNtZm5aY/Hk8xZhYasp
 2om6HVfvd5EDt8KMz+7Iny/FSo8Dc4NIy2VtRjCFpuX9qcvpD6rkDGtbElhEO2VzD6he
 iUZ7YqoO7gPhpu+IyiW6pGefWgz5IC0qjD45LSKi3E4gK2e5GCQKArNYPW8OXS+C/1/n
 KSJTv+VjgPmARqWGr8oL656dy+aYAXJL4pMCcpTp/93wXzdngTO4ZCLgjgwogmcsbdkZ
 xiYw==
X-Gm-Message-State: APjAAAWzAstIiJ/UlwlyhVERRxYnBMrdl38t7Nbdz2WzmwZnKtmUrXVk
 zlE14J6tLCkQPOSADP8VerNKyIJy
X-Google-Smtp-Source: APXvYqxwmkSFbZVEiobYyCzfSWVmQOKWSRLGzV8vImQNXeKjmlKboBeRg2G6nEc+gF2TCRBdkILf4A==
X-Received: by 2002:a17:90b:142:: with SMTP id
 em2mr25105591pjb.4.1577108870698; 
 Mon, 23 Dec 2019 05:47:50 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id b65sm22988588pgc.18.2019.12.23.05.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 05:47:50 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 2/4] ARM: dts: aspeed: tacoma: Remove duplicate
 i2c busses
Date: Tue, 24 Dec 2019 00:47:33 +1100
Message-Id: <20191223134735.559200-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191223134735.559200-1-joel@jms.id.au>
References: <20191223134735.559200-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a revert of "ARM: dts: aspeed: tacoma: Enable I2C busses", which
was already applied as part of "ARM: dts: aspeed: Add Tacoma machine".

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 367 --------------------
 1 file changed, 367 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 5dfd597110f9..73aaf58d9f42 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -825,373 +825,6 @@
 	status = "okay";
 };
 
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
-	bmp: bmp280@77 {
-		compatible = "bosch,bmp280";
-		reg = <0x77>;
-		#io-channel-cells = <1>;
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
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-dual-tach;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@1 {
-			compatible = "pmbus-fan";
-			reg = <1>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-dual-tach;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@2 {
-			compatible = "pmbus-fan";
-			reg = <2>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-dual-tach;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@3 {
-			compatible = "pmbus-fan";
-			reg = <3>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-dual-tach;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-	};
-
-	dps: dps310@76 {
-		compatible = "infineon,dps310";
-		reg = <0x76>;
-		#io-channel-cells = <0>;
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
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-	};
-
-	power-supply@68 {
-		compatible = "ibm,cffps1";
-		reg = <0x68>;
-	};
-
-	power-supply@69 {
-		compatible = "ibm,cffps1";
-		reg = <0x69>;
-	};
-};
-
-&i2c4 {
-	status = "okay";
-
-	tmp423a@4c {
-		compatible = "ti,tmp423";
-		reg = <0x4c>;
-	};
-
-	ir35221@70 {
-		compatible = "infineon,ir35221";
-		reg = <0x70>;
-	};
-
-	ir35221@71 {
-		compatible = "infineon,ir35221";
-		reg = <0x71>;
-	};
-};
-
-&i2c5 {
-	status = "okay";
-
-	tmp423a@4c {
-		compatible = "ti,tmp423";
-		reg = <0x4c>;
-	};
-
-	ir35221@70 {
-		compatible = "infineon,ir35221";
-		reg = <0x70>;
-	};
-
-	ir35221@71 {
-		compatible = "infineon,ir35221";
-		reg = <0x71>;
-	};
-};
-
-&i2c7 {
-	status = "okay";
-};
-
-&i2c9 {
-	status = "okay";
-
-	tmp275@4a {
-		compatible = "ti,tmp275";
-		reg = <0x4a>;
-	};
-};
-
-&i2c10 {
-	status = "okay";
-};
-
-&i2c11 {
-	status = "okay";
-
-	pca9552: pca9552@60 {
-		compatible = "nxp,pca9552";
-		reg = <0x60>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names = "PS_SMBUS_RESET_N", "APSS_RESET_N",
-			"GPU0_TH_OVERT_N_BUFF",	"GPU1_TH_OVERT_N_BUFF",
-			"GPU2_TH_OVERT_N_BUFF", "GPU3_TH_OVERT_N_BUFF",
-			"GPU4_TH_OVERT_N_BUFF",	"GPU5_TH_OVERT_N_BUFF",
-			"GPU0_PWR_GOOD_BUFF", "GPU1_PWR_GOOD_BUFF",
-			"GPU2_PWR_GOOD_BUFF", "GPU3_PWR_GOOD_BUFF",
-			"GPU4_PWR_GOOD_BUFF", "GPU5_PWR_GOOD_BUFF",
-			"12V_BREAKER_FLT_N", "THROTTLE_UNLATCHED_N";
-
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-	};
-
-	rtc@32 {
-		compatible = "epson,rx8900";
-		reg = <0x32>;
-	};
-
-	eeprom@51 {
-		compatible = "atmel,24c64";
-		reg = <0x51>;
-	};
-
-	ucd90160@64 {
-		compatible = "ti,ucd90160";
-		reg = <0x64>;
-	};
-};
-
-&i2c12 {
-	status = "okay";
-};
-
-&i2c13 {
-	status = "okay";
-};
-
 &pinctrl {
 	/* Hog these as no driver is probed for the entire LPC block */
 	pinctrl-names = "default";
-- 
2.24.0

