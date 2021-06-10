Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9E83A34DD
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 22:31:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1Fxy3zDzz3btY
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 06:31:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tWFVduSx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tWFVduSx; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1Fxg0dGBz308F;
 Fri, 11 Jun 2021 06:31:34 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id
 102-20020a9d0eef0000b02903fccc5b733fso995124otj.4; 
 Thu, 10 Jun 2021 13:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xt0U3YUAq1iLZIuBd7Di4+UirPrgjGPkiR3BVaEs7AE=;
 b=tWFVduSxUj5xOZHeRwM0hh3+JJds7QGtnsIy0ARNtYzMkZFqUpl6NqxksrIBtbg6q8
 akntAATXTz2P4PZ9tdk0oWefyd3G+ptpGz07WD1EqTQMlhlYwVEgXtD8TQu8QFPse64C
 FVbxShPRHo/WUqZVhbOsSkrLmYnT9um6DkVgPweZYy9V0kd9CCZ0LdX6cAY0bU+NW14U
 gBD+TIKNgsnrzi4+dD310F6lPQZdaNqbobGy5iP+dzTshYjToY2l8Ey3wXqY8zgMev7g
 2OZ3qdfYos4tjDUyKF5sj5Y0F0j0r6odPfHNRTHdbpUYMtHsiRZxDVXTC+NL5gNF9RFF
 3ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xt0U3YUAq1iLZIuBd7Di4+UirPrgjGPkiR3BVaEs7AE=;
 b=j4qk1bLHX3tnhx0/4rOJDKU/7uge12RP2MdbPYtYoMM41eC2e1sAkPc9W63+wHyBBr
 cPyidETRckkeaxWPu3jLML+GEDCpO0iyWTE2UGTs292LdfCxHiWqmH88+6KfbFq/C3Bo
 4+HAy9SgEhYHED4KA1AXpeaa6hiCk1+QNgS8On537DBZug/aCglu2sAqlecO7rmPoNaU
 woYJQMz5PDVfCyk+tV2lNH/xT0GwmzGK2f7URwowXEWBdOUN1JoJL+IsmlBKuKB/9/dc
 yXYHByMyWcwzJxfM2z7JBGXSxtHep/UDJrN68af8KPulBgiIQXsbK+4uRFIENLIQfzkQ
 g8oQ==
X-Gm-Message-State: AOAM5308q8fbyR5MxyFWlMVBtyvoKq+qpvmj6Rmr8o9CXdYlqL8ene4k
 nLRxBvBUiOirDgzRNa7I3V4=
X-Google-Smtp-Source: ABdhPJz7/Bv78csqgtMUQ2xDH5jZWw8KWwG33NZUr2c85Mm64g1LUBsstgRcxmFi7NG+5po0gtblWQ==
X-Received: by 2002:a05:6830:1d96:: with SMTP id
 y22mr177018oti.266.1623357088758; 
 Thu, 10 Jun 2021 13:31:28 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id q16sm805680ott.56.2021.06.10.13.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 13:31:28 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: Everest PSU #3 address change
Date: Thu, 10 Jun 2021 20:29:41 +0000
Message-Id: <20210610202940.3650554-1-bjwyman@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: "B. J. Wyman" <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: "B. J. Wyman" <bjwyman@gmail.com>

The third power supply had an I2C address conflict with another device
in the system. The device will have the address changed from 6Ah to 6Dh.

Signed-off-by: B. J. Wyman <bjwyman@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 3295c8c7c05c..480cb6604c7d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -536,9 +536,9 @@ power-supply@69 {
 		reg = <0x69>;
 	};
 
-	power-supply@6a {
+	power-supply@6d {
 		compatible = "ibm,cffps";
-		reg = <0x6a>;
+		reg = <0x6d>;
 	};
 
 	power-supply@6b {
-- 
2.25.1

