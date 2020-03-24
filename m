Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8AF190C72
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 12:29:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mpv13SDxzDqw0
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 22:29:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dvyGVIJs; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mppN5gvfzDqp7
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 22:25:48 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id j29so1998479pgl.3
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zpsHVakMGAWUXFZdqoTaGOyyfDkcHePHpPOH1FLx73E=;
 b=dvyGVIJsPkCdFZaLPLjc9Jla+0a2dVSVlwgBPg3zysw8EWVB9YqwQKBMG8R+FiLhwb
 hmq8PVZHlzcXb9ayhkoYOFPU6SNt5EppdIaT6myXyJVeXyptYWa4b4L9HP4ARvcaAssr
 t57UVfCIUQVGYukGkH0fyKKbbzJmYh30rZ/nIOuXHEfsfVpf03foCydSyWyiqRVmq/FR
 EvD2j0gZ1Z4oVfgQnQZY7prcl/arCyOGYLFmomJyuauulGb3J4CjjcwZ/V3hKsPMutfH
 HLF5ioAJam5Yq3GUg0xTpfQzVeRv262jbmaHZtjzhUPCmq7XwlJaglvXBokskm8CJZXA
 Grkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zpsHVakMGAWUXFZdqoTaGOyyfDkcHePHpPOH1FLx73E=;
 b=NqD8zOJu3sVp9VjR7zDXlLJZ2nGQ1EuMdZhWRhnbEbuv7TSCCV4/dGlxlhQWzFXX8k
 vT5QLCpDTV2pZT/2zGpDSC1qmjdiyueptQWEh6VnUyPrFxgcrhuZSNdesnan7aFAE8TJ
 r+33UL4MqbFxeIXzglhHopiFgXVTZ0ulxSnJZVFNuT54bbjAZVecTofdz8yzUu+dZ5sP
 zIu5WDVF+gfUoIf8iXu/lD52mMcYt3PdEkVDM5WPPJ+/6wKdsxrrdlskCxyH5zRQIYM/
 dVouUpzysxymL6niIKsLwPx552NMv3W/AMmB/LXpgchs4SmMHqPAZYLsCHSB0wq50lDm
 OkrQ==
X-Gm-Message-State: ANhLgQ0eBok0pRHwA8ddLoeLkEZQZ9ZrzeehNvvG2VSOeGNfj9dvh20h
 86bomYq8Xp12bNZtOJ09mXc=
X-Google-Smtp-Source: ADFU+vvQymVRPB8ZRGU3hh0HX7KmC8+Io3HUc5BRsjdYn4/9JX/KV5oNcoNKWQLcZ13ejETDCxI/eg==
X-Received: by 2002:a63:f60e:: with SMTP id m14mr26157453pgh.342.1585049145397; 
 Tue, 24 Mar 2020 04:25:45 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id v26sm2824004pfn.51.2020.03.24.04.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 04:25:44 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 1/2] ARM: dts: aspeed: tacoma: Add GPIOs for FSI
Date: Tue, 24 Mar 2020 21:55:28 +1030
Message-Id: <20200324112530.293386-2-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324112530.293386-1-joel@jms.id.au>
References: <20200324112530.293386-1-joel@jms.id.au>
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

GPIO Q7 is no longer used for air/water. It is repurposed on Tacoma to
indicate cabled (low) vs internal FSI (high).

GPIO B0 controls the muxing of FSI to the cable (low) or internal pins
(high).

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 88ef4af7b234..be699fd4ad22 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -34,12 +34,6 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		air-water {
-			label = "air-water";
-			gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(Q, 7)>;
-		};
-
 		checkstop {
 			label = "checkstop";
 			gpios = <&gpio0 ASPEED_GPIO(E, 3) GPIO_ACTIVE_LOW>;
@@ -178,6 +172,9 @@
 	#address-cells = <2>;
 	#size-cells = <0>;
 
+	fsi-routing-gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
+	fsi-mux-gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
+
 	cfam@0,0 {
 		reg = <0 0>;
 		#address-cells = <1>;
-- 
2.25.1

