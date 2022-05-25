Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2653349F
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 03:15:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Cm527Fjz3bdy
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 11:15:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DYWfmc03;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DYWfmc03; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Clj2lz1z2y0B
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 11:14:40 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id c22so17692212pgu.2
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 18:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=txa6hemsWcF1RURar1l4iGE6FmJuG0Kz/kUccZJ5Vts=;
 b=DYWfmc03zJObL1GoD/u4sidJIWgoWRnM9+fGOYYq8vpGeg1+EJvlFx+2B4yl1zCnFf
 9Erh2sjTXe8vkVH+KNiDEUIb6mfeKJ3xHn4sIBEIZcr8BukalfWGuO+459dQyiVIkXtx
 2y/rHzmGEW26lElktniQQHbByuIDGnnfsC68mvOuiaHznSab36QRUJDI/3irVWG25fP9
 fhmm7kX94pL4cQfL4cAYdH0PCm0+9gkbIf4M1X0b40LiOAB5h70ODBdNe2YFl1YvrnRa
 RH3UL7YrepTOy9UzHFE465UjiXjykwXFMQPqqZ2IgSIaAOp/QUo2HNZkWa5SSLgIuWrm
 4b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=txa6hemsWcF1RURar1l4iGE6FmJuG0Kz/kUccZJ5Vts=;
 b=Kvgm/H8zecLZY+o8N5cXkWTREMzSmzreW0g6SD2+on2fMGk/0ZNxUlb19VgydC5xEH
 vVv6CC9aJ+RmvPTqRWJhVLPrqGLZy9tlqxt59ws0/hYdgt3LIzb+gK3ohKXspBV1Qbf4
 tRkn4VOz9xQjenrRdWv2a3gF9VwbhIvEUmoSxpHCy+nhLD0EywQAktxsI0HNq811kLUF
 wbgj1zH/beeuze5XT2g1nvMBdzJg15WWImxoXrVRBy0jNVi9bXslE52IfonKn89DUNs9
 69EYvbMFZneCEzSjYxxcebG6V0YIkWD1tY+xPpsHnR/UsWrXjH6iTFZvAaaj/q/VVrur
 mkCA==
X-Gm-Message-State: AOAM5317G8fIuI2tfn/AnMvv4ZabwJpHknFOj9xWiZ8ZNl/tCAuNtHaq
 UFRPjtGT+/3DlIaPcz0X8PmC7osD1Y0=
X-Google-Smtp-Source: ABdhPJz5JiVrOnnx0FLPLAAm7Yc0nUmNG6e7LB1BveDeQuAoKhO29z7vm9FoH9Ewe8dPD51rc9p84w==
X-Received: by 2002:a05:6a00:1411:b0:4fd:e594:fac0 with SMTP id
 l17-20020a056a00141100b004fde594fac0mr31023943pfu.79.1653441274974; 
 Tue, 24 May 2022 18:14:34 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a170902bb9800b0015e8d4eb28csm7821972pls.214.2022.05.24.18.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 18:14:33 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	eajames@linux.ibm.com
Subject: [PATCH] ARM: dts: aspeed: everest: Add SiLabs sensor
Date: Wed, 25 May 2022 10:44:18 +0930
Message-Id: <20220525011418.875109-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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

Everest has a SiLabs Si7020-A20-IM1 sensor on an I2C expander.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 382da7934eaa..1bba5ad7378e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -1958,6 +1958,12 @@ i2c14mux0chn2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			si8021-a20@40 {
+				compatible = "silabs,si7020";
+				reg = <0x40>;
+			};
+
 			eeprom@50 {
 				compatible = "atmel,24c32";
 				reg = <0x50>;
-- 
2.35.1

