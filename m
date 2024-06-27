Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD0A91B273
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:03:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TsxTS8n3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Ddj22V8z3cbg
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:03:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TsxTS8n3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdH52v5z30T8
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:02 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7201cb6cae1so2416053a12.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469916; x=1720074716; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwHLBm1f58et6VFa4lgOHjS4UmMPL44cmRSH7R6P8rs=;
        b=TsxTS8n37GJ+ASXZLUAIQvc25PZ1hKCSnp03ir+DcJuQ8hGucmcUtw+YJPgQul4P6g
         V9IDIKIc8dDGCNx27ZKBpOEnr2MDGXwxVG0tyRR/SRuVPx5FL0GrKEIXhf109kWTJj8x
         WcoMhW2tDr1uTv/i+tXPoalSWrLybDfSVGyXzSvkxBDARHWZHxJgmmOK45Q5RF1mhBPI
         DJGa1kUbrX0HHzNf6i49VhnioHxdZOLJa6q4/yhh/hX4Slo+1JZfC0+QVGKaIydBYqtK
         6pLmyq9skqCP76gPxj4g+45zENZEd/9+WvmrTVf8Bw4tT+AsXZzR2g14Jcl5oYwDyB0H
         2m1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469916; x=1720074716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwHLBm1f58et6VFa4lgOHjS4UmMPL44cmRSH7R6P8rs=;
        b=VP4HJ7lrhiCpTpdLvJTl/Sj0p1LMUC2u0y9RGZ+at0vKnM+XKYTDlm+ayc+1vuHqng
         AjyTxp4GTnHLljWIEvIklyY64P+fU6M6u0lN1aA12gETOpZwdX3/DQk1WM1GalAOCQ9v
         Xb1ByAiSL44nSlI8te0b9oub58T5yIjds+qfG8bDXrXtEIMUPZUcE5F7/JACg1yddLSH
         jsyDshEv523iVryb2AuisdCgURj+L6hTKmfgk4E98TPxPcp+qLc6x2mVvL8uY9BrNoJ3
         WcLtBvKYGb0c453vM2tLR481yaXSA3eIuXaruFFuAUNDLyO7R7kJcOgBMxm1S2Oq8YMu
         ek6g==
X-Gm-Message-State: AOJu0Yy1OSPDiurQYtyGGXOYkvtWa2nkxv65pIGXg/DRt4/I8avCI55B
	jcNtHD0yxXQb30l4iz+eQQFUmdF1LgZShdeyH8iweBmnnAZ7yfdsPm2it/R7
X-Google-Smtp-Source: AGHT+IEi0SsnCmDlBD1m+xvz90L1fqXUMbB5aIYMOf2RfZXZPDGnQ2xpMTPLf1P3YcOUm02NEnE1pA==
X-Received: by 2002:a05:6a21:7891:b0:1be:b317:17ec with SMTP id adf61e73a8af0-1beb31719f7mr4587891637.35.1719469915924;
        Wed, 26 Jun 2024 23:31:55 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:31:55 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 00/17] Revise Facebook Minerva BMC DTS
Date: Thu, 27 Jun 2024 14:29:34 +0800
Message-Id: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jun 2024 09:03:24 +1000
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Revise the Linux device tree entry related to Facebook platform Minerva
specific device connected to the Aspeed AST2600 BMC.

LORE Link: https://lore.kernel.org/all/20240626130332.929534-1-yangchen.openbmc@gmail.com/

Yang Chen (17):
  ARM: dts: aspeed: minerva: change the address of tmp75
  ARM: dts: aspeed: minerva: change aliases for uart
  ARM: dts: aspeed: minerva: add eeprom on i2c bus
  ARM: dts: aspeed: minerva: change RTC reference
  ARM: dts: aspeed: minerva: enable mdio3
  ARM: dts: aspeed: minerva: remove unused bus and device
  ARM: dts: aspeed: minerva: Define the LEDs node name
  ARM: dts: aspeed: minerva: Add adc sensors for fan board
  ARM: dts: aspeed: minerva: add linename of two pins
  ARM: dts: aspeed: minerva: enable ehci0 for USB
  ARM: dts: aspeed: minerva: add tmp75 sensor
  ARM: dts: aspeed: minerva: add power monitor xdp710
  ARM: dts: aspeed: minerva: revise sgpio line name
  ARM: dts: aspeed: minerva: Switch the i2c bus number
  ARM: dts: aspeed: minerva: remove unused power device
  ARM: dts: aspeed: minerva: add ltc4287 device
  ARM: dts: aspeed: minerva: Add spi-gpio

 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 516 +++++++++++++-----
 1 file changed, 373 insertions(+), 143 deletions(-)

-- 
2.34.1

