Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D03793B5D9
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2024 19:25:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cj/cnwry;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTgrB3RNlz2xps
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2024 03:24:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cj/cnwry;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTgpj5vbWz3c1L
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2024 03:23:41 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fc491f9b55so30785ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2024 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721841819; x=1722446619; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1dyRqYfHazFyspDFnKEq8kCZsNXkEGI9apvC6Z8Vr4=;
        b=cj/cnwryE4BbmgjxvH0Z+LoacXTFV5Ul6BbQ1iUfCvG0/dwk9p7jwXzBcS7gWh4UFk
         /U/6A/O7l/rgxiMPnOkbOSqk7BguW7192Xmqqss8Qyw2gZ6a516/b885ZliROGjzKPvl
         oA15OU4Lc03n7mhYM3F7sYPxSIFmcuXydWQhdCIntwp7Wu5W8tccLV2eDpDnjW6tTIHP
         kfzavDjC3oN3bJdC7TYEAZGOiH6Nsd0JA6sT5Sj2mP4CmZszkYZr/is52DvJQ/njEPSe
         2I7jMW/0HK695E8VgKYtP/4jVlbCXeoYATC0m9xQnIuSuZ8Dug5kyIvdBS3AL2lTYBdJ
         obYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721841819; x=1722446619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1dyRqYfHazFyspDFnKEq8kCZsNXkEGI9apvC6Z8Vr4=;
        b=A7GL+VYo2q5AnkggyEwkM2gg5Yx2AOt0QcpYpDh+CbYLSWhga8LrwX055B2DtNdgu7
         K/Iw8VBo+HqogRox3xmwBtum9a+AiD2G35yLwNk7NvLDLUt3Gno0otf2Lp3IY4nWxyFB
         C8rT5t9FGQ6GPo758g5X6hwU40H5GcweCEQwOFnGbT0SXc4wb9qtnqN3OaM10SqBf0o6
         1ZoenZo29rtLpv5RVAWeIV0Eq4DWywsMU+JiA8V+d6mkZv1JJIBNSTaofvfu6c0d0SYu
         Ffl9n1Z+mhqvKduKXxwYR8heRD+1Aeb2XyazqsWptwG+4EUOzRQpzug6BJGI01XEmryZ
         uj3A==
X-Gm-Message-State: AOJu0YygClqbAyubY5/QYATZFig9y1EpoffUsDWf53GbeVF+ZA96/0ar
	CcH/bTb+UZLXhiq3JxKStgJORlKi8tZdjbs3/uxicCnrQ1HnzZPT8QDSxA==
X-Google-Smtp-Source: AGHT+IHhnouw5MyJ6C8v5YD5VE0ZlaJrsjvc89tHdrBsPzHh8XwTVWRZk/SePJMKLtfb4pEr3RJkmw==
X-Received: by 2002:a17:902:ced2:b0:1fb:6e06:a099 with SMTP id d9443c01a7336-1fed3ad747fmr2235745ad.40.1721841818717;
        Wed, 24 Jul 2024 10:23:38 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f318457sm96830945ad.134.2024.07.24.10.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 10:23:38 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-6.6 1/5] dt-bindings: pinctrl: aspeed: Use block syntax for function and groups
Date: Thu, 25 Jul 2024 01:21:25 +0800
Message-Id: <20240724172129.3064490-2-potin.lai.pt@gmail.com>
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

The expansion makes the documents a lot longer, but it's easier to
review changes to functions and groups when we're not having to deal
with line wrapping.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
---
 .../pinctrl/aspeed,ast2400-pinctrl.yaml       | 169 +++++-
 .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 187 ++++++-
 .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 501 ++++++++++++++++--
 3 files changed, 774 insertions(+), 83 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index 37c0a74c7c01a..23ed9a8b6689f 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -35,22 +35,159 @@ additionalProperties:
 
   patternProperties:
     "^function|groups$":
-      enum: [ ACPI, ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15,
-              ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, DDCCLK, DDCDAT,
-              EXTRST, FLACK, FLBUSY, FLWP, GPID, GPID0, GPID2, GPID4, GPID6, GPIE0,
-              GPIE2, GPIE4, GPIE6, I2C10, I2C11, I2C12, I2C13, I2C14, I2C3, I2C4,
-              I2C5, I2C6, I2C7, I2C8, I2C9, LPCPD, LPCPME, LPCRST, LPCSMI, MAC1LINK,
-              MAC2LINK, MDIO1, MDIO2, NCTS1, NCTS2, NCTS3, NCTS4, NDCD1, NDCD2,
-              NDCD3, NDCD4, NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4,
-              NDTS4, NRI1, NRI2, NRI3, NRI4, NRTS1, NRTS2, NRTS3, OSCCLK, PWM0,
-              PWM1, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, RGMII1, RGMII2, RMII1,
-              RMII2, ROM16, ROM8, ROMCS1, ROMCS2, ROMCS3, ROMCS4, RXD1, RXD2, RXD3,
-              RXD4, SALT1, SALT2, SALT3, SALT4, SD1, SD2, SGPMCK, SGPMI, SGPMLD,
-              SGPMO, SGPSCK, SGPSI0, SGPSI1, SGPSLD, SIOONCTRL, SIOPBI, SIOPBO,
-              SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1DEBUG, SPI1PASSTHRU,
-              SPICS1, TIMER3, TIMER4, TIMER5, TIMER6, TIMER7, TIMER8, TXD1, TXD2,
-              TXD3, TXD4, UART6, USB11D1, USB11H2, USB2D1, USB2H1, USBCKI, VGABIOS_ROM,
-              VGAHS, VGAVS, VPI18, VPI24, VPI30, VPO12, VPO24, WDTRST1, WDTRST2]
+      enum:
+        - ACPI
+        - ADC0
+        - ADC1
+        - ADC10
+        - ADC11
+        - ADC12
+        - ADC13
+        - ADC14
+        - ADC15
+        - ADC2
+        - ADC3
+        - ADC4
+        - ADC5
+        - ADC6
+        - ADC7
+        - ADC8
+        - ADC9
+        - BMCINT
+        - DDCCLK
+        - DDCDAT
+        - EXTRST
+        - FLACK
+        - FLBUSY
+        - FLWP
+        - GPID
+        - GPID0
+        - GPID2
+        - GPID4
+        - GPID6
+        - GPIE0
+        - GPIE2
+        - GPIE4
+        - GPIE6
+        - I2C10
+        - I2C11
+        - I2C12
+        - I2C13
+        - I2C14
+        - I2C3
+        - I2C4
+        - I2C5
+        - I2C6
+        - I2C7
+        - I2C8
+        - I2C9
+        - LPCPD
+        - LPCPME
+        - LPCRST
+        - LPCSMI
+        - MAC1LINK
+        - MAC2LINK
+        - MDIO1
+        - MDIO2
+        - NCTS1
+        - NCTS2
+        - NCTS3
+        - NCTS4
+        - NDCD1
+        - NDCD2
+        - NDCD3
+        - NDCD4
+        - NDSR1
+        - NDSR2
+        - NDSR3
+        - NDSR4
+        - NDTR1
+        - NDTR2
+        - NDTR3
+        - NDTR4
+        - NDTS4
+        - NRI1
+        - NRI2
+        - NRI3
+        - NRI4
+        - NRTS1
+        - NRTS2
+        - NRTS3
+        - OSCCLK
+        - PWM0
+        - PWM1
+        - PWM2
+        - PWM3
+        - PWM4
+        - PWM5
+        - PWM6
+        - PWM7
+        - RGMII1
+        - RGMII2
+        - RMII1
+        - RMII2
+        - ROM16
+        - ROM8
+        - ROMCS1
+        - ROMCS2
+        - ROMCS3
+        - ROMCS4
+        - RXD1
+        - RXD2
+        - RXD3
+        - RXD4
+        - SALT1
+        - SALT2
+        - SALT3
+        - SALT4
+        - SD1
+        - SD2
+        - SGPMCK
+        - SGPMI
+        - SGPMLD
+        - SGPMO
+        - SGPSCK
+        - SGPSI0
+        - SGPSI1
+        - SGPSLD
+        - SIOONCTRL
+        - SIOPBI
+        - SIOPBO
+        - SIOPWREQ
+        - SIOPWRGD
+        - SIOS3
+        - SIOS5
+        - SIOSCI
+        - SPI1
+        - SPI1DEBUG
+        - SPI1PASSTHRU
+        - SPICS1
+        - TIMER3
+        - TIMER4
+        - TIMER5
+        - TIMER6
+        - TIMER7
+        - TIMER8
+        - TXD1
+        - TXD2
+        - TXD3
+        - TXD4
+        - UART6
+        - USB11D1
+        - USB11H2
+        - USB2D1
+        - USB2H1
+        - USBCKI
+        - VGABIOS_ROM
+        - VGAHS
+        - VGAVS
+        - VPI18
+        - VPI24
+        - VPI30
+        - VPO12
+        - VPO24
+        - WDTRST1
+        - WDTRST2
 
 allOf:
   - $ref: pinctrl.yaml#
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index 863da5d80826f..ef8499a0aba4c 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -35,7 +35,7 @@ properties:
     description: |
       A cell of phandles to external controller nodes:
       0: compatible with "aspeed,ast2500-gfx", "syscon"
-      1: compatible with "aspeed,ast2500-lhc", "syscon"
+      1: compatible with "aspeed,ast2500-lpc", "syscon"
 
 additionalProperties:
   $ref: pinmux-node.yaml#
@@ -47,24 +47,173 @@ additionalProperties:
 
   patternProperties:
     "^function|groups$":
-      enum: [ ACPI, ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15,
-              ADC2, ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, DDCCLK, DDCDAT,
-              ESPI, FWSPICS1, FWSPICS2, GPID0, GPID2, GPID4, GPID6, GPIE0, GPIE2,
-              GPIE4, GPIE6, I2C10, I2C11, I2C12, I2C13, I2C14, I2C3, I2C4, I2C5,
-              I2C6, I2C7, I2C8, I2C9, LAD0, LAD1, LAD2, LAD3, LCLK, LFRAME, LPCHC,
-              LPCPD, LPCPLUS, LPCPME, LPCRST, LPCSMI, LSIRQ, MAC1LINK, MAC2LINK,
-              MDIO1, MDIO2, NCTS1, NCTS2, NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4,
-              NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2,
-              NRI3, NRI4, NRTS1, NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE, PNOR, PWM0,
-              PWM1, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, RGMII1, RGMII2, RMII1,
-              RMII2, RXD1, RXD2, RXD3, RXD4, SALT1, SALT10, SALT11, SALT12, SALT13,
-              SALT14, SALT2, SALT3, SALT4, SALT5, SALT6, SALT7, SALT8, SALT9, SCL1,
-              SCL2, SD1, SD2, SDA1, SDA2, SGPS1, SGPS2, SIOONCTRL, SIOPBI, SIOPBO,
-              SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1CS1, SPI1DEBUG,
-              SPI1PASSTHRU, SPI2CK, SPI2CS0, SPI2CS1, SPI2MISO, SPI2MOSI, TIMER3,
-              TIMER4, TIMER5, TIMER6, TIMER7, TIMER8, TXD1, TXD2, TXD3, TXD4, UART6,
-              USB11BHID, USB2AD, USB2AH, USB2BD, USB2BH, USBCKI, VGABIOSROM, VGAHS,
-              VGAVS, VPI24, VPO, WDTRST1, WDTRST2]
+      enum:
+        - ACPI
+        - ADC0
+        - ADC1
+        - ADC10
+        - ADC11
+        - ADC12
+        - ADC13
+        - ADC14
+        - ADC15
+        - ADC2
+        - ADC3
+        - ADC4
+        - ADC5
+        - ADC6
+        - ADC7
+        - ADC8
+        - ADC9
+        - BMCINT
+        - DDCCLK
+        - DDCDAT
+        - ESPI
+        - FWSPICS1
+        - FWSPICS2
+        - GPID0
+        - GPID2
+        - GPID4
+        - GPID6
+        - GPIE0
+        - GPIE2
+        - GPIE4
+        - GPIE6
+        - I2C10
+        - I2C11
+        - I2C12
+        - I2C13
+        - I2C14
+        - I2C3
+        - I2C4
+        - I2C5
+        - I2C6
+        - I2C7
+        - I2C8
+        - I2C9
+        - LAD0
+        - LAD1
+        - LAD2
+        - LAD3
+        - LCLK
+        - LFRAME
+        - LPCHC
+        - LPCPD
+        - LPCPLUS
+        - LPCPME
+        - LPCRST
+        - LPCSMI
+        - LSIRQ
+        - MAC1LINK
+        - MAC2LINK
+        - MDIO1
+        - MDIO2
+        - NCTS1
+        - NCTS2
+        - NCTS3
+        - NCTS4
+        - NDCD1
+        - NDCD2
+        - NDCD3
+        - NDCD4
+        - NDSR1
+        - NDSR2
+        - NDSR3
+        - NDSR4
+        - NDTR1
+        - NDTR2
+        - NDTR3
+        - NDTR4
+        - NRI1
+        - NRI2
+        - NRI3
+        - NRI4
+        - NRTS1
+        - NRTS2
+        - NRTS3
+        - NRTS4
+        - OSCCLK
+        - PEWAKE
+        - PNOR
+        - PWM0
+        - PWM1
+        - PWM2
+        - PWM3
+        - PWM4
+        - PWM5
+        - PWM6
+        - PWM7
+        - RGMII1
+        - RGMII2
+        - RMII1
+        - RMII2
+        - RXD1
+        - RXD2
+        - RXD3
+        - RXD4
+        - SALT1
+        - SALT10
+        - SALT11
+        - SALT12
+        - SALT13
+        - SALT14
+        - SALT2
+        - SALT3
+        - SALT4
+        - SALT5
+        - SALT6
+        - SALT7
+        - SALT8
+        - SALT9
+        - SCL1
+        - SCL2
+        - SD1
+        - SD2
+        - SDA1
+        - SDA2
+        - SGPS1
+        - SGPS2
+        - SIOONCTRL
+        - SIOPBI
+        - SIOPBO
+        - SIOPWREQ
+        - SIOPWRGD
+        - SIOS3
+        - SIOS5
+        - SIOSCI
+        - SPI1
+        - SPI1CS1
+        - SPI1DEBUG
+        - SPI1PASSTHRU
+        - SPI2CK
+        - SPI2CS0
+        - SPI2CS1
+        - SPI2MISO
+        - SPI2MOSI
+        - TIMER3
+        - TIMER4
+        - TIMER5
+        - TIMER6
+        - TIMER7
+        - TIMER8
+        - TXD1
+        - TXD2
+        - TXD3
+        - TXD4
+        - UART6
+        - USB11BHID
+        - USB2AD
+        - USB2AH
+        - USB2BD
+        - USB2BH
+        - USBCKI
+        - VGABIOSROM
+        - VGAHS
+        - VGAVS
+        - VPI24
+        - VPO
+        - WDTRST1
+        - WDTRST2
 
 allOf:
   - $ref: pinctrl.yaml#
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 612464aef98bf..d0a9cc2027f85 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -29,56 +29,461 @@ additionalProperties:
 
   properties:
     function:
-      enum: [ ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15, ADC2,
-              ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, EMMC, ESPI, ESPIALT,
-              FSI1, FSI2, FWQSPI, FWSPIABR, FWSPID, FWSPIWP, GPIT0, GPIT1, GPIT2, GPIT3,
-              GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1, GPIU2, GPIU3, GPIU4, GPIU5,
-              GPIU6, GPIU7, I2C1, I2C10, I2C11, I2C12, I2C13, I2C14, I2C15, I2C16,
-              I2C2, I2C3, I2C4, I2C5, I2C6, I2C7, I2C8, I2C9, I3C3, I3C4, I3C5,
-              I3C6, JTAGM, LHPD, LHSIRQ, LPC, LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ,
-              MACLINK1, MACLINK2, MACLINK3, MACLINK4, MDIO1, MDIO2, MDIO3, MDIO4,
-              NCTS1, NCTS2, NCTS3, NCTS4, NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2,
-              NDSR3, NDSR4, NDTR1, NDTR2, NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4,
-              NRTS1, NRTS2, NRTS3, NRTS4, OSCCLK, PEWAKE, PWM0, PWM1, PWM10, PWM11,
-              PWM12, PWM13, PWM14, PWM15, PWM2, PWM3, PWM4, PWM5, PWM6, PWM7, PWM8,
-              PWM9, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3, RMII4,
-              RXD1, RXD2, RXD3, RXD4, SALT1, SALT10, SALT11, SALT12, SALT13, SALT14,
-              SALT15, SALT16, SALT2, SALT3, SALT4, SALT5, SALT6, SALT7, SALT8,
-              SALT9, SD1, SD2, SGPM1, SGPM2, SGPS1, SGPS2, SIOONCTRL, SIOPBI, SIOPBO,
-              SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1, SPI1ABR, SPI1CS1, SPI1WP, SPI2,
-              SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11, TACH12, TACH13, TACH14,
-              TACH15, TACH2, TACH3, TACH4, TACH5, TACH6, TACH7, TACH8, TACH9, THRU0,
-              THRU1, THRU2, THRU3, TXD1, TXD2, TXD3, TXD4, UART10, UART11, UART12,
-              UART13, UART6, UART7, UART8, UART9, USBAD, USBADP, USB2AH, USB2AHP,
-              USB2BD, USB2BH, VB, VGAHS, VGAVS, WDTRST1, WDTRST2, WDTRST3, WDTRST4 ]
+      enum:
+        - ADC0
+        - ADC1
+        - ADC10
+        - ADC11
+        - ADC12
+        - ADC13
+        - ADC14
+        - ADC15
+        - ADC2
+        - ADC3
+        - ADC4
+        - ADC5
+        - ADC6
+        - ADC7
+        - ADC8
+        - ADC9
+        - BMCINT
+        - EMMC
+        - ESPI
+        - ESPIALT
+        - FSI1
+        - FSI2
+        - FWQSPI
+        - FWSPIABR
+        - FWSPID
+        - FWSPIWP
+        - GPIT0
+        - GPIT1
+        - GPIT2
+        - GPIT3
+        - GPIT4
+        - GPIT5
+        - GPIT6
+        - GPIT7
+        - GPIU0
+        - GPIU1
+        - GPIU2
+        - GPIU3
+        - GPIU4
+        - GPIU5
+        - GPIU6
+        - GPIU7
+        - I2C1
+        - I2C10
+        - I2C11
+        - I2C12
+        - I2C13
+        - I2C14
+        - I2C15
+        - I2C16
+        - I2C2
+        - I2C3
+        - I2C4
+        - I2C5
+        - I2C6
+        - I2C7
+        - I2C8
+        - I2C9
+        - I3C3
+        - I3C4
+        - I3C5
+        - I3C6
+        - JTAGM
+        - LHPD
+        - LHSIRQ
+        - LPC
+        - LPCHC
+        - LPCPD
+        - LPCPME
+        - LPCSMI
+        - LSIRQ
+        - MACLINK1
+        - MACLINK2
+        - MACLINK3
+        - MACLINK4
+        - MDIO1
+        - MDIO2
+        - MDIO3
+        - MDIO4
+        - NCTS1
+        - NCTS2
+        - NCTS3
+        - NCTS4
+        - NDCD1
+        - NDCD2
+        - NDCD3
+        - NDCD4
+        - NDSR1
+        - NDSR2
+        - NDSR3
+        - NDSR4
+        - NDTR1
+        - NDTR2
+        - NDTR3
+        - NDTR4
+        - NRI1
+        - NRI2
+        - NRI3
+        - NRI4
+        - NRTS1
+        - NRTS2
+        - NRTS3
+        - NRTS4
+        - OSCCLK
+        - PEWAKE
+        - PWM0
+        - PWM1
+        - PWM10
+        - PWM11
+        - PWM12
+        - PWM13
+        - PWM14
+        - PWM15
+        - PWM2
+        - PWM3
+        - PWM4
+        - PWM5
+        - PWM6
+        - PWM7
+        - PWM8
+        - PWM9
+        - RGMII1
+        - RGMII2
+        - RGMII3
+        - RGMII4
+        - RMII1
+        - RMII2
+        - RMII3
+        - RMII4
+        - RXD1
+        - RXD2
+        - RXD3
+        - RXD4
+        - SALT1
+        - SALT10
+        - SALT11
+        - SALT12
+        - SALT13
+        - SALT14
+        - SALT15
+        - SALT16
+        - SALT2
+        - SALT3
+        - SALT4
+        - SALT5
+        - SALT6
+        - SALT7
+        - SALT8
+        - SALT9
+        - SD1
+        - SD2
+        - SGPM1
+        - SGPM2
+        - SGPS1
+        - SGPS2
+        - SIOONCTRL
+        - SIOPBI
+        - SIOPBO
+        - SIOPWREQ
+        - SIOPWRGD
+        - SIOS3
+        - SIOS5
+        - SIOSCI
+        - SPI1
+        - SPI1ABR
+        - SPI1CS1
+        - SPI1WP
+        - SPI2
+        - SPI2CS1
+        - SPI2CS2
+        - TACH0
+        - TACH1
+        - TACH10
+        - TACH11
+        - TACH12
+        - TACH13
+        - TACH14
+        - TACH15
+        - TACH2
+        - TACH3
+        - TACH4
+        - TACH5
+        - TACH6
+        - TACH7
+        - TACH8
+        - TACH9
+        - THRU0
+        - THRU1
+        - THRU2
+        - THRU3
+        - TXD1
+        - TXD2
+        - TXD3
+        - TXD4
+        - UART10
+        - UART11
+        - UART12
+        - UART13
+        - UART6
+        - UART7
+        - UART8
+        - UART9
+        - USB2AH
+        - USB2AHP
+        - USB2BD
+        - USB2BH
+        - USBAD
+        - USBADP
+        - VB
+        - VGAHS
+        - VGAVS
+        - WDTRST1
+        - WDTRST2
+        - WDTRST3
+        - WDTRST4
 
     groups:
-      enum: [ ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15, ADC2,
-              ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, EMMCG1, EMMCG4,
-              EMMCG8, ESPI, ESPIALT, FSI1, FSI2, FWQSPI, FWSPIABR, FWSPID, FWSPIWP,
-              GPIT0, GPIT1, GPIT2, GPIT3, GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1,
-              GPIU2, GPIU3, GPIU4, GPIU5, GPIU6, GPIU7, HVI3C3, HVI3C4, I2C1, I2C10,
-              I2C11, I2C12, I2C13, I2C14, I2C15, I2C16, I2C2, I2C3, I2C4, I2C5,
-              I2C6, I2C7, I2C8, I2C9, I3C3, I3C4, I3C5, I3C6, JTAGM, LHPD, LHSIRQ,
-              LPC, LPCHC, LPCPD, LPCPME, LPCSMI, LSIRQ, MACLINK1, MACLINK2, MACLINK3,
-              MACLINK4, MDIO1, MDIO2, MDIO3, MDIO4, NCTS1, NCTS2, NCTS3, NCTS4,
-              NDCD1, NDCD2, NDCD3, NDCD4, NDSR1, NDSR2, NDSR3, NDSR4, NDTR1, NDTR2,
-              NDTR3, NDTR4, NRI1, NRI2, NRI3, NRI4, NRTS1, NRTS2, NRTS3, NRTS4,
-              OSCCLK, PEWAKE, PWM0, PWM1, PWM10G0, PWM10G1, PWM11G0, PWM11G1, PWM12G0,
-              PWM12G1, PWM13G0, PWM13G1, PWM14G0, PWM14G1, PWM15G0, PWM15G1, PWM2,
-              PWM3, PWM4, PWM5, PWM6, PWM7, PWM8G0, PWM8G1, PWM9G0, PWM9G1, QSPI1,
-              QSPI2, RGMII1, RGMII2, RGMII3, RGMII4, RMII1, RMII2, RMII3, RMII4,
-              RXD1, RXD2, RXD3, RXD4, SALT1, SALT10G0, SALT10G1, SALT11G0, SALT11G1,
-              SALT12G0, SALT12G1, SALT13G0, SALT13G1, SALT14G0, SALT14G1, SALT15G0,
-              SALT15G1, SALT16G0, SALT16G1, SALT2, SALT3, SALT4, SALT5, SALT6,
-              SALT7, SALT8, SALT9G0, SALT9G1, SD1, SD2, SD3, SGPM1, SGPM2, SGPS1, SGPS2,
-              SIOONCTRL, SIOPBI, SIOPBO, SIOPWREQ, SIOPWRGD, SIOS3, SIOS5, SIOSCI, SPI1,
-              SPI1ABR, SPI1CS1, SPI1WP, SPI2, SPI2CS1, SPI2CS2, TACH0, TACH1, TACH10, TACH11,
-              TACH12, TACH13, TACH14, TACH15, TACH2, TACH3, TACH4, TACH5, TACH6,
-              TACH7, TACH8, TACH9, THRU0, THRU1, THRU2, THRU3, TXD1, TXD2, TXD3,
-              TXD4, UART10, UART11, UART12G0, UART12G1, UART13G0, UART13G1, UART6,
-              UART7, UART8, UART9, USBA, USBB, VB, VGAHS, VGAVS, WDTRST1, WDTRST2,
-              WDTRST3, WDTRST4]
+      enum:
+        - ADC0
+        - ADC1
+        - ADC10
+        - ADC11
+        - ADC12
+        - ADC13
+        - ADC14
+        - ADC15
+        - ADC2
+        - ADC3
+        - ADC4
+        - ADC5
+        - ADC6
+        - ADC7
+        - ADC8
+        - ADC9
+        - BMCINT
+        - EMMCG1
+        - EMMCG4
+        - EMMCG8
+        - ESPI
+        - ESPIALT
+        - FSI1
+        - FSI2
+        - FWQSPI
+        - FWSPIABR
+        - FWSPID
+        - FWSPIWP
+        - GPIT0
+        - GPIT1
+        - GPIT2
+        - GPIT3
+        - GPIT4
+        - GPIT5
+        - GPIT6
+        - GPIT7
+        - GPIU0
+        - GPIU1
+        - GPIU2
+        - GPIU3
+        - GPIU4
+        - GPIU5
+        - GPIU6
+        - GPIU7
+        - HVI3C3
+        - HVI3C4
+        - I2C1
+        - I2C10
+        - I2C11
+        - I2C12
+        - I2C13
+        - I2C14
+        - I2C15
+        - I2C16
+        - I2C2
+        - I2C3
+        - I2C4
+        - I2C5
+        - I2C6
+        - I2C7
+        - I2C8
+        - I2C9
+        - I3C3
+        - I3C4
+        - I3C5
+        - I3C6
+        - JTAGM
+        - LHPD
+        - LHSIRQ
+        - LPC
+        - LPCHC
+        - LPCPD
+        - LPCPME
+        - LPCSMI
+        - LSIRQ
+        - MACLINK1
+        - MACLINK2
+        - MACLINK3
+        - MACLINK4
+        - MDIO1
+        - MDIO2
+        - MDIO3
+        - MDIO4
+        - NCTS1
+        - NCTS2
+        - NCTS3
+        - NCTS4
+        - NDCD1
+        - NDCD2
+        - NDCD3
+        - NDCD4
+        - NDSR1
+        - NDSR2
+        - NDSR3
+        - NDSR4
+        - NDTR1
+        - NDTR2
+        - NDTR3
+        - NDTR4
+        - NRI1
+        - NRI2
+        - NRI3
+        - NRI4
+        - NRTS1
+        - NRTS2
+        - NRTS3
+        - NRTS4
+        - OSCCLK
+        - PEWAKE
+        - PWM0
+        - PWM1
+        - PWM10G0
+        - PWM10G1
+        - PWM11G0
+        - PWM11G1
+        - PWM12G0
+        - PWM12G1
+        - PWM13G0
+        - PWM13G1
+        - PWM14G0
+        - PWM14G1
+        - PWM15G0
+        - PWM15G1
+        - PWM2
+        - PWM3
+        - PWM4
+        - PWM5
+        - PWM6
+        - PWM7
+        - PWM8G0
+        - PWM8G1
+        - PWM9G0
+        - PWM9G1
+        - QSPI1
+        - QSPI2
+        - RGMII1
+        - RGMII2
+        - RGMII3
+        - RGMII4
+        - RMII1
+        - RMII2
+        - RMII3
+        - RMII4
+        - RXD1
+        - RXD2
+        - RXD3
+        - RXD4
+        - SALT1
+        - SALT10G0
+        - SALT10G1
+        - SALT11G0
+        - SALT11G1
+        - SALT12G0
+        - SALT12G1
+        - SALT13G0
+        - SALT13G1
+        - SALT14G0
+        - SALT14G1
+        - SALT15G0
+        - SALT15G1
+        - SALT16G0
+        - SALT16G1
+        - SALT2
+        - SALT3
+        - SALT4
+        - SALT5
+        - SALT6
+        - SALT7
+        - SALT8
+        - SALT9G0
+        - SALT9G1
+        - SD1
+        - SD2
+        - SD3
+        - SGPM1
+        - SGPM2
+        - SGPS1
+        - SGPS2
+        - SIOONCTRL
+        - SIOPBI
+        - SIOPBO
+        - SIOPWREQ
+        - SIOPWRGD
+        - SIOS3
+        - SIOS5
+        - SIOSCI
+        - SPI1
+        - SPI1ABR
+        - SPI1CS1
+        - SPI1WP
+        - SPI2
+        - SPI2CS1
+        - SPI2CS2
+        - TACH0
+        - TACH1
+        - TACH10
+        - TACH11
+        - TACH12
+        - TACH13
+        - TACH14
+        - TACH15
+        - TACH2
+        - TACH3
+        - TACH4
+        - TACH5
+        - TACH6
+        - TACH7
+        - TACH8
+        - TACH9
+        - THRU0
+        - THRU1
+        - THRU2
+        - THRU3
+        - TXD1
+        - TXD2
+        - TXD3
+        - TXD4
+        - UART10
+        - UART11
+        - UART12G0
+        - UART12G1
+        - UART13G0
+        - UART13G1
+        - UART6
+        - UART7
+        - UART8
+        - UART9
+        - USBA
+        - USBB
+        - VB
+        - VGAHS
+        - VGAVS
+        - WDTRST1
+        - WDTRST2
+        - WDTRST3
+        - WDTRST4
 
     pins: true
     bias-disable: true
-- 
2.31.1

