Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A631193B5DF
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2024 19:25:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FFrqc3q+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTgs749rzz3dBW
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2024 03:25:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FFrqc3q+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTgpl2v4Pz3c1L
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2024 03:23:43 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fd70ba6a15so238395ad.0
        for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2024 10:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721841820; x=1722446620; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1a/3GBsJ3XA25r7yFKet3H9hl25T3Tc6KX3d6HI17q8=;
        b=FFrqc3q+bcbuMMewFy7jkL0pnPy52+8TpLBK3RUPbY23Wp3Ko/HoTbz65WD1Eno2lw
         JR5wXSFJHmBIkhMJvpnV/llQ3r25MJL73v0/qgRc9ee7WNRg1DESVrnu3607KcNKEECH
         tjx246CGxAnK3o/Wtg5SncSZ5HHM+/Zmob8L+RII6vzs+Ke1ZYeCdRjUcBKke3FQvK0K
         N0k4BA/1pA4YuYfQmydp1LPbCAZLOS+khZShJSQE7n4z+A1Lb8LW27dNeO54E1k1IRG7
         cX4pnQFYPjU23oZshTyZIFH6EVUMbCZOKXjol3uoPi4PYmoBfQl9r0IVdu28cklPIHR4
         JllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721841820; x=1722446620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1a/3GBsJ3XA25r7yFKet3H9hl25T3Tc6KX3d6HI17q8=;
        b=eyx5WlWhrJiz5dME5rC0cSuEaPD7LgpkB+LiGEI5YYIWKgc2stdX45nhLNgVhxzOb4
         UEUeBrIq/0ilxMR7Tci5XuoVlPOHJlBQoyHmaJUrlzAnjrzbn7SSbRMoq7bjphsQpRLK
         6iwEMiKEH1Jr3ZoRvfLAvFsFV/kVikL9cQN41lRA/SCfaFtAFgOvoXnCda9R6nUboFKt
         kPHBBIMxCYaPZhcPhonYDBgUQXbaYzvJUX8RrzClzgaLLHLSm68BtDLc727tIG9YFKoC
         9soUBTAiUwzJWZxM7jKY3rCvdNmAdnb/WG8L5+sEimMEb/4MJ/JIbSZaEIQH8/jYZT2C
         0y1w==
X-Gm-Message-State: AOJu0YwZjYqdjhmOb7Hy4a0lNyACx4bP3Pa4iky+sldgd+bjEZslpX5w
	zPC8NEHsCcKv6nrfaDnSzvNE3Tr0sbuvxGJsrHkCTNFwlVdQiuG7mMQe0g==
X-Google-Smtp-Source: AGHT+IH5P+1dKAwMe3pe480Ik0uMWTUtsmFii5IySRDaQRdQJ0JvwjKTGuYk/Yveecf7f97e8hWwYw==
X-Received: by 2002:a17:902:f68d:b0:1fd:668b:ac4b with SMTP id d9443c01a7336-1fed3846d56mr2970615ad.15.1721841820062;
        Wed, 24 Jul 2024 10:23:40 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f318457sm96830945ad.134.2024.07.24.10.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 10:23:39 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-6.6 2/5] dt-bindings: pinctrl: aspeed,ast2500-pinctrl: Describe SGPM
Date: Thu, 25 Jul 2024 01:21:26 +0800
Message-Id: <20240724172129.3064490-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240724172129.3064490-1-potin.lai.pt@gmail.com>
References: <20240724172129.3064490-1-potin.lai.pt@gmail.com>
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

From: Andrew Jeffery <andrew@codeconstruct.com.au>

Squash warnings such as:

    arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: pinctrl@80: sgpm_default:groups:0: 'SGPM' is not one of ['ACPI', 'ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'DDCCLK', 'DDCDAT', 'ESPI', 'FWSPICS1', 'FWSPICS2', 'GPID0', 'GPID2', 'GPID4', 'GPID6', 'GPIE0', 'GPIE2', 'GPIE4', 'GPIE6', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'LAD0', 'LAD1', 'LAD2', 'LAD3', 'LCLK', 'LFRAME', 'LPCHC', 'LPCPD', 'LPCPLUS', 'LPCPME', 'LPCRST', 'LPCSMI', 'LSIRQ', 'MAC1LINK', 'MAC2LINK', 'MDIO1', 'MDIO2', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PNOR', 'PWM0', 'PWM1', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'RGMII1', 'RGMII2', 'RMII1', 'RMII2', 'RXD1', '
 RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9', 'SCL1', 'SCL2', 'SD1', 'SD2', 'SDA1', 'SDA2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1CS1', 'SPI1DEBUG', 'SPI1PASSTHRU', 'SPI2CK', 'SPI2CS0', 'SPI2CS1', 'SPI2MISO', 'SPI2MOSI', 'TIMER3', 'TIMER4', 'TIMER5', 'TIMER6', 'TIMER7', 'TIMER8', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART6', 'USB11BHID', 'USB2AD', 'USB2AH', 'USB2BD', 'USB2BH', 'USBCKI', 'VGABIOSROM', 'VGAHS', 'VGAVS', 'VPI24', 'VPO', 'WDTRST1', 'WDTRST2']

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index ef8499a0aba4c..35bd0e1eadae2 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -171,6 +171,7 @@ additionalProperties:
         - SD2
         - SDA1
         - SDA2
+        - SGPM
         - SGPS1
         - SGPS2
         - SIOONCTRL
-- 
2.31.1

