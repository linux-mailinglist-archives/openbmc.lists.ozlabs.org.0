Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F53CD91
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 15:50:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NWbG3r7fzDqbW
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 23:50:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pbqRV+bN"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NWYp73zbzDqZN
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 23:48:46 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id p184so4187901pfp.7
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 06:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EroxvxCcwUummiXjdLKCrFSxyQkMQpP0/W5G0iGJ42w=;
 b=pbqRV+bNUSzx1A02Y1tLUmbtaqUqB6mOvLuGqyqyWKrecnyd9wQwePmF9YeFkoFjf/
 16GrTPX2AWOxxKABIuJQoS9Eduxbz/013bnO13v9rK98VFUUUNQXf+mDJV1ALgU3WObF
 nghXM1P5ZNpqr0ZLuzqOkh/thSqOh5qQMZhkQLpyfze8LMfvpeE4g0Sf8JF3DM0mr3kg
 icpAFr3ZskaMbGJnt3l2ebuxKMASqpv7FWoG6hpRuR6jumPHJRcXqQPexNLJ06tWsWZ0
 KE0rlSj2XeRfVZHXd0C8BGCWZXvoAc4Ht0QPkh3Buo+SVzG3mg5+JFoj+wPFdA3DxIwx
 pCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EroxvxCcwUummiXjdLKCrFSxyQkMQpP0/W5G0iGJ42w=;
 b=dDNetnomwqjRG41yJ4aPSvzIOfBNlJ8AUu38hA5F5MF5cpSVlz41LpdLGtJwkCpTUe
 HyMOLdKONk0s3vJb5wf6csrWyNvWifhDr5GyXO5BS0+ksI04QSMm4BlPXN6Xe62XHKm1
 ApIsnRLSHJhkRFI0j6nxlcMBfbClotww3rb3gtwUfiAiWXJqHWAnFv2E+UX8F5ddMeb2
 2UDcYdv1t+3C4HEFq4eJTLAlj1VCloyZHR3J4E61WW8cdZ8IPCidjqwo13Yq+vJbSJqZ
 n8JjqnlPd031jsdTViO1i26qvSAkv8TWzhWipKB0geYaC8PwM0BfoCEsX8XuxkreFlTM
 vNHQ==
X-Gm-Message-State: APjAAAUThx0t2OiN+cgYd4H4xC2n3jGKMaLOqMXhRB5UszMoGsuQq3H8
 JcGAMzvW9xTFBpZQNJeVgAc=
X-Google-Smtp-Source: APXvYqzD6RMJHTt7hq0nSUdOZcf8A7+wnINyGy9fNoCdeRlUDGu/qAEeLMKYrJXsygJcXaiv0SE4EA==
X-Received: by 2002:a17:90a:7343:: with SMTP id
 j3mr25749905pjs.84.1560260923362; 
 Tue, 11 Jun 2019 06:48:43 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id 27sm3267385pgl.82.2019.06.11.06.48.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 11 Jun 2019 06:48:42 -0700 (PDT)
From: Fran Hsu <franhsutw@gmail.com>
X-Google-Original-From: Fran Hsu <Fran.Hsu@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v7] ARM: dts: nuvoton: Update Quanta GSJ BMC Device
 Tree.
Date: Tue, 11 Jun 2019 21:46:36 +0800
Message-Id: <20190611134636.15828-1-Fran.Hsu@quantatw.com>
X-Mailer: git-send-email 2.21.0
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
Cc: openbmc@lists.ozlabs.org, Fran Hsu <Fran.Hsu@quantatw.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch cleans up the warning message when build GSJ device tree.
Remove the part of i2c-slave-mqueue from GSJ device tree.

Tested:
  Build Quanta GSJ image and load on the GSJ BMC module.
  Ensure that BMC boots to console successful.

Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 380d0d382395..497f46d690e9 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -5,7 +5,7 @@
 #include "nuvoton-npcm730.dtsi"
 #include "nuvoton-npcm730-gsj-gpio.dtsi"
 / {
-	model = "Quanta GSJ Board (Device Tree v11)";
+	model = "Quanta GSJ Board (Device Tree v12)";
 	compatible = "nuvoton,npcm750";
 
 	aliases {
@@ -300,26 +300,14 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
-				status = "okay";
-
-				ipmb@40000010 {
-					compatible = "slave-mqueue";
-					reg = <0x40000010>;
-					status = "okay";
-				};
+				status = "disabled";
 			};
 
 			i2c14: i2c@8e000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
-				status = "okay";
-
-				ipmb@40000012 {
-					compatible = "slave-mqueue";
-					reg = <0x40000012>;
-					status = "okay";
-				};
+				status = "disabled";
 			};
 
 			i2c15: i2c@8f000 {
-- 
2.21.0

