Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5835291B276
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:04:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J2aOjwM7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dfk5dzHz30T8
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:04:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J2aOjwM7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdH49HCz2xjL
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:03 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-70671ecd334so3772451b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469921; x=1720074721; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzrCq55dKnidKKqWO6gxlx5gu7pwGXx0Jy9uGAk4Shk=;
        b=J2aOjwM7jAo2WMNgzo8LnWMmIBdZ8JMoW0mULot2uIqY1n7+t1si3MHxlq2rSfsWbs
         HfNt1Q5gLTwt6heW6+9w9K1ffKEqrJ6ZJ0Jt1+6gyBEalGuZn1zHkEG8u2exunLLY1RZ
         pzas7Nat1dtyFl1CqW7HIsqdzu2+ofA1iDtebmyKwYvQ5uSGIoO22eYLZkdpS8uZF88Q
         +PzBB/oipK95mk/raCcASQ3YtNNWjWYPaBDkXksD07ikSxUqPitT2dpNjHuIQ6SCTQ31
         mT87VaMTmfx3rpjeNkhBMRhIaCJXtv81yyB+wsXVMQH5qfpdIAz7ZJktyK9ISM2GUACL
         15Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469921; x=1720074721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzrCq55dKnidKKqWO6gxlx5gu7pwGXx0Jy9uGAk4Shk=;
        b=nW2oAMFp24dfDd1hC2qkDhGHr+BvE9Wsr3ueWylml0Y+6Ntg0CiBqY4sP+lG9oX8Fu
         d0plDo7NKyX3v6oYVO/u1mWHtZQb6DWy8j9OzH9DAZWZkFUwikkj7svLEDEFeazloXU4
         QKEM/YsMCBeUHJ+ijuWSgZX2k0tlq4TT00LVuW5DwVTGGwgKvZF8Tb9HcVRwssvcC85d
         6SC+b+cisA7qUFZi3K+6+o2ZMjrIv4Mvf/48vIJwG8V1+N4dI6SVFBjfhWk/caztOwnD
         Vugzx7EC3z8S90PkXkFlEC9dCsAekDn5whELYn6sLJTWrAfoA2Op270p6CMr9jHTe4nN
         3j3A==
X-Gm-Message-State: AOJu0Yy2HqVWFTvJT+ichh/edU4pXcT5sJoARVIlnqJr3+6sMCi8Joqx
	G5edNrdfZyv6eWguORQcLZsh3JU2MwhSqvuXsmVk3AEl+MPurPcuJMSmh3QF
X-Google-Smtp-Source: AGHT+IH0+YokwZPBAl3XBTPRd9kXOB0HRoS61Kq0qkRI5asO+lYTG6RBOAO33oBVp76LJcCIRMEiew==
X-Received: by 2002:a05:6a20:4993:b0:1bd:27b9:b63f with SMTP id adf61e73a8af0-1bd27b9b674mr5338555637.37.1719469921319;
        Wed, 26 Jun 2024 23:32:01 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:00 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 03/17] ARM: dts: aspeed: minerva: add eeprom on i2c bus
Date: Thu, 27 Jun 2024 14:29:37 +0800
Message-Id: <20240627062951.936256-4-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
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

From: Yang Chen <yang.chen@quantatw.com>

Add eeprom on the i2c-9 address 0x50 and i2c-15 address 0x56.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index ca3e417d2c7e..60002b8cffc6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -303,6 +303,11 @@ &i2c8 {
 
 &i2c9 {
 	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
 };
 
 &i2c10 {
@@ -339,6 +344,11 @@ eeprom@50 {
 		compatible = "atmel,24c128";
 		reg = <0x50>;
 	};
+
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
 };
 
 &adc0 {
-- 
2.34.1

