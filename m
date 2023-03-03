Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8966AB384
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 00:31:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVHym5bCDz3cGH
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 10:31:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T0qlZ92u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=tomato1220@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T0qlZ92u;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSdYZ1YHYz3cJK
	for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2023 17:37:06 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 130so890733pgg.3
        for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2023 22:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUufnqGUd6ZHw3YSoTgde4z4+kgG2gE44eDuR5QPdSQ=;
        b=T0qlZ92uB9S9P2212hvx5nufAkStuhEvfjJuYeTTt38/bUnwhLGGjMOjSpq8kVJkoi
         acuuH28YYfnaUKPCpLVh783Ku4PotFXIOkfGYHJiifeSQ7s11NPkw8wd+QF9+TZiB2f1
         LESAtvLfZbZ5x2/7qPZnkVEHu29RZYsN/ukETcbAVw3qrAb5Seh52p2IYb3cWOSKocxO
         3p2V4e3lO73eaV5M/qzGkh9eEBBz6/g8liVM8hK4i1mHDfnOdZH//nFQjfexiNLwfESU
         c7GUtHaa2ZIfVAgAtoA8tSqCSZFgVS4nioNTiNRNZgspdEJmfGM1Z344Gwv80hPzzfcN
         KK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUufnqGUd6ZHw3YSoTgde4z4+kgG2gE44eDuR5QPdSQ=;
        b=mlQy+PMNyeFTEctWcLHdxqFaJjsxv3TygFCFykQITnzmCM5vNBxQho8uF/fCrzf2Pc
         ruPNaEKJykl6wAOZiQ9J6+ZMnnMOz54JhfI73hngDKXY/VDxsfX/cLGrKQT8pIFIXTwc
         bOVdKX93GNzhYMRIGDhjbZ6OeftbvdWfCWbCRrhELZyA91tQbCNmKl53Mqo9TNZgorqZ
         n6X3/HITHngCDKCckOrP3JuvnIkSnpUPFxY7oge1r9HNrLxoduGBEgIDYtbB3vl6JNs5
         Rb/KWaUIiraotsf7c/V42Hvex3OBCSANXTi+kePszx9gkNobsEyPpWRRHmqd0kTgpQ/6
         +ZEw==
X-Gm-Message-State: AO0yUKX3j2SOU4Jqn/J9dTPbufB5sVBuZgyfWCK0oiUOvhmMg1Eenhvm
	pDO/E722Pg7T0HpuNCqz/1g=
X-Google-Smtp-Source: AK7set+KhVV1I4OqZOVr0styK+EuLYSUZYlFYuUiA/gFYJhR8P8CMhyhb1vyP7395AzuKK1/fwoDXg==
X-Received: by 2002:aa7:940b:0:b0:5a8:b705:4dd3 with SMTP id x11-20020aa7940b000000b005a8b7054dd3mr1212764pfo.13.1677825423959;
        Thu, 02 Mar 2023 22:37:03 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:37:03 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 6/7] ARM: dts: nuvoton: gsj: Add non-mainline nodes
Date: Fri,  3 Mar 2023 14:34:34 +0800
Message-Id: <20230303063435.803097-6-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 10:24:04 +1100
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
Cc: devicetree@vger.kernel.org, David Wang <davidwang@quantatw.com>, fran.hsu@quantatw.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is the remaining non-mainline component of the patch that adds the
GSJ machine.

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 2a394cc15284..48110f8aa3ca 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -14,6 +14,7 @@ / {
 	aliases {
 		ethernet1 = &gmac0;
 		serial3 = &serial3;
+		udc9 = &udc9;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
@@ -184,10 +185,40 @@ &gmac0 {
 	status = "okay";
 };
 
+&mc {
+	status = "okay";
+};
+
+&emc0 {
+	phy-mode = "rmii";
+	use-ncsi;
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
 
+&ohci1 {
+	status = "okay";
+};
+
+&aes {
+	status = "okay";
+};
+
+&sha {
+	status = "okay";
+};
+
+&pcimbox {
+	status = "okay";
+};
+
+&udc9 {
+	status = "okay";
+};
+
 &watchdog1 {
 	status = "okay";
 };
@@ -216,6 +247,10 @@ &adc {
 	status = "okay";
 };
 
+&otp {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 
-- 
2.25.1

