Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC79D904C
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 14:03:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tWCR74h3zDqnW
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 23:03:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vRvBiMjR"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tW7B0RqKzDqkp
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 22:59:33 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id k7so11186387pll.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IPIVJKYrPGQKOhBaBUAHBtGzBvDlTW4UwpdtubRt8TQ=;
 b=vRvBiMjRe6sj7CqYKm8nnaDiCQHropCZhc79n9usv+esUF7GZtFfg9yJSYtJ+/tKC0
 8mAEF9jR1ZNX9UzoB8OEimNnlwdNJC/hHcbxFFSxD84THvkrsNcffYOI5w8r3ZUcGkr9
 5KauKkJ8i9LlLmBHoUxU1NIx9m8YHktFxYztQoxz8YFNURsNVruTmJ0eZwHRwnQoPaUB
 Nij2jj++vKbhXnt4EtUu2XmiQS4J0iTigeEaUDmeKxED6tJdunqKhvfMaEgiYfBzOD1d
 ywLDGy8rxoPx9cOUmuDs/W766PVxQ8DysCmj2ZmXBpzWg8ikX/5daAppBviVX3fKOolp
 T0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IPIVJKYrPGQKOhBaBUAHBtGzBvDlTW4UwpdtubRt8TQ=;
 b=oIQN1xvcY5DFA/t4fJl1iX+SoRTPr8cOK+RseRtyHIVIs5x3eljSGis9bjKCw+cwMl
 VqAm4ovin+b7feclGomOBkJak1pRGNCx653ID8mEZTN9GZ2DBTGWjbt6cRInzUaWCdj1
 taxQynAvHZCE4ma8i9DiEQ64Yv7pZ+uZN2kKkAJ8CYb+d0gdHMqIWyNxDNoN6G84AeIv
 o8dR9C9TjhevL7HCnBLBoIUQjW3Sm+gIEPLboGflTH1qUhv72SGPQCL/OTCXbuY8Jd/a
 PyOImnndRYJwXZ3dwFwVgfW/ShaxQACyhwebKN5SwRen2FjlRsF4SKZNF3sB32ivSjIi
 04Fg==
X-Gm-Message-State: APjAAAW7fSzqGEga0YimwJ6zuvNCluh5bqvwYVr45LTb4tQ9ON4bteK/
 R3PjgZeU7mhEq4hjv3KrHfUr/aYYidY=
X-Google-Smtp-Source: APXvYqysfWGgFgBnPDXJQ9GajKaBFxmS9enJ2aDMYOkK1nLJbQaU3qasw2kNjpr5LFG/Irhlhz/lQw==
X-Received: by 2002:a17:902:d705:: with SMTP id
 w5mr39077086ply.142.1571227171655; 
 Wed, 16 Oct 2019 04:59:31 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d19sm2561396pjz.5.2019.10.16.04.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 04:59:31 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 2/3] ARM: dts: aspeed: tacoma: Add UART1 and
 workaround
Date: Wed, 16 Oct 2019 22:29:02 +1030
Message-Id: <20191016115903.24663-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016115903.24663-1-joel@jms.id.au>
References: <20191016115903.24663-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The UARTs on the AST2600 A0 have a known issue that can be worked around
by using the Synopsys driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index cdc14773ddda..b38498a317ce 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -10,10 +10,6 @@
 	model = "Tacoma";
 	compatible = "ibm,tacoma-bmc", "aspeed,ast2600";
 
-	aliases {
-		serial4 = &uart5;
-	};
-
 	chosen {
 		stdout-path = &uart5;
 		bootargs = "console=ttyS4,115200n8";
@@ -515,6 +511,17 @@
 	status = "okay";
 };
 
+&uart1 {
+	status = "okay";
+	// Workaround for A0
+	compatible = "snps,dw-apb-uart";
+};
+
+&uart5 {
+	// Workaround for A0
+	compatible = "snps,dw-apb-uart";
+};
+
 &vuart1 {
 	status = "okay";
 };
-- 
2.23.0

