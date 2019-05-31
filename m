Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E2B30EDA
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 15:28:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Fld857MyzDqWG
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 23:28:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JeBREaTv"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Flbb0xK2zDqWH
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 23:26:51 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id c14so3818178pfi.1
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wkgxzl6NAmXqTsC39DolqxxxWiGQep+CJmhyKwDja18=;
 b=JeBREaTvbt6CVfd9qvbJdBxxYVszxzgWR8Bs6TUt+tUrIB1d8JcqoGg1aVstlwEMkR
 nZunfhR0ZmrFW5Zr5R1DiLbWRhtnILoBIrCVwEs8tl6WEE7zpz6QX+pt6k+MM/s5WShO
 e0lYIr+kmyXdwPQURgwOhJnG8CHwuQVe5sdDSqy4s4jqM7Qqsw1YAXxo5OmC+PnP89vt
 dmEpok2JK32q6WbL1vXziJrx978rOrKQ+pkinZ5HfNBswCqUT28a8RseTAgPTr05eMu4
 7n6uTA/G2QaE80eve+J0I96FRxWo3OX980E4IUFqdAX9bwhx83WGvdoSRYsYUO4TtJJ3
 ayLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wkgxzl6NAmXqTsC39DolqxxxWiGQep+CJmhyKwDja18=;
 b=hbwFfolTgW+vWC6jU3lw6CsvxYXc4ZuPMAD3SooCH9jcMkJxFK6k7MeKAUY+HOSi9S
 t3L0CQtUtq8eBFrALmrViTNnFOCW7aSMiTjHApC6SiXuaeWNCfSDa2MQGhv6qcCzYVXP
 3En/9CRle3MPVRhAjvjCSfJj0iNnZEWTQ9aRuip+d9QX4UQP927EBus5/xnDO53IqOSy
 KgEN5SmlMo64UTj3wek5p9UKHAUCQ3+nLIZrEbv2USLaI5JeP+9+BFxfa+UplaK++xcR
 p7cWPrhCLdM09EydzAg/zDhW8iDB/CaQyyjsvmqcZSci7E+xSVUQnYl2FiWia8Z5DAxg
 d3Fg==
X-Gm-Message-State: APjAAAUCY+LvZ7qgIdNEOj9arXOYHhA4yR6imIMIKz0P7wSckkaWMb0Z
 lGU+AQ/lc+q0J6w3Eex1Foo=
X-Google-Smtp-Source: APXvYqzWMBnt2S9xoWUqBawq540I7eKGbfJzkrssInDIl48pXZHXLYMp0IFTU8Z3Fjk6YCiQalEiTw==
X-Received: by 2002:a63:f10e:: with SMTP id f14mr9111960pgi.226.1559309209461; 
 Fri, 31 May 2019 06:26:49 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id p20sm15444571pgk.7.2019.05.31.06.26.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 31 May 2019 06:26:48 -0700 (PDT)
From: Fran Hsu <franhsutw@gmail.com>
X-Google-Original-From: Fran Hsu <Fran.Hsu@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v5 4/4] ARM: dts: nuvoton: Add GPIOs and LEDs to GSJ
 device tree.
Date: Fri, 31 May 2019 21:24:40 +0800
Message-Id: <20190531132440.37572-4-Fran.Hsu@quantatw.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
References: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
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

Add Quanta GSJ BMC device tree part 2.
This file included the definition of following two functions:
1.GPIO
2.LED

Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 195 ++++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 8f4ca6084..380d0d382 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -415,4 +415,199 @@
 		};
 	};
 
+	pinctrl: pinctrl@f0800000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <
+				/* GPI pins*/
+				&gpio8_pins
+				&gpio9_pins
+				&gpio12_pins
+				&gpio13_pins
+				&gpio14_pins
+				&gpio60_pins
+				&gpio83_pins
+				&gpio91_pins
+				&gpio92_pins
+				&gpio95_pins
+				&gpio136_pins
+				&gpio137_pins
+				&gpio141_pins
+				&gpio144_pins
+				&gpio145_pins
+				&gpio146_pins
+				&gpio147_pins
+				&gpio148_pins
+				&gpio149_pins
+				&gpio150_pins
+				&gpio151_pins
+				&gpio152_pins
+				&gpio153_pins
+				&gpio154_pins
+				&gpio155_pins
+				&gpio156_pins
+				&gpio157_pins
+				&gpio158_pins
+				&gpio159_pins
+				&gpio161_pins
+				&gpio162_pins
+				&gpio163_pins
+				&gpio164_pins
+				&gpio165_pins
+				&gpio166_pins
+				&gpio167_pins
+				&gpio168_pins
+				&gpio169_pins
+				&gpio170_pins
+				&gpio177_pins
+				&gpio191_pins
+				&gpio192_pins
+				&gpio203_pins
+				/* GPO pins*/
+				&gpio0pp_pins
+				&gpio1pp_pins
+				&gpio2pp_pins
+				&gpio3pp_pins
+				&gpio4pp_pins
+				&gpio5pp_pins
+				&gpio6pp_pins
+				&gpio7pp_pins
+				&gpio10pp_pins
+				&gpio11pp_pins
+				&gpio15od_pins
+				&gpio17pp_pins
+				&gpio18pp_pins
+				&gpio19pp_pins
+				&gpio24pp_pins
+				&gpio25pp_pins
+				&gpio37od_pins
+				&gpio59pp_pins
+				&gpio72od_pins
+				&gpio73od_pins
+				&gpio74od_pins
+				&gpio75od_pins
+				&gpio76od_pins
+				&gpio77od_pins
+				&gpio78od_pins
+				&gpio79od_pins
+				&gpio84pp_pins
+				&gpio85pp_pins
+				&gpio86pp_pins
+				&gpio87pp_pins
+				&gpio88pp_pins
+				&gpio89pp_pins
+				&gpio90pp_pins
+				&gpio93pp_pins
+				&gpio94pp_pins
+				&gpio125pp_pins
+				&gpio126od_pins
+				&gpio127od_pins
+				&gpio142od_pins
+				&gpio143ol_pins
+				&gpio175od_pins
+				&gpio176od_pins
+				&gpio190od_pins
+				&gpio194pp_pins
+				&gpio195od_pins
+				&gpio196od_pins
+				&gpio197od_pins
+				&gpio198od_pins
+				&gpio199od_pins
+				&gpio200pp_pins
+				&gpio202od_pins
+				>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-bmc-live {
+			gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		LED_U2_0_LOCATE {
+			gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_1_LOCATE {
+			gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_2_LOCATE {
+			gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_3_LOCATE {
+			gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_4_LOCATE {
+			gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_5_LOCATE {
+			gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_BMC_TRAY_PWRGD {
+			gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_7_FAULT {
+			gpios = <&gpio6 8 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_6_LOCATE {
+			gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_7_LOCATE {
+			gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_0_FAULT {
+			gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_1_FAULT {
+			gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_2_FAULT {
+			gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_3_FAULT {
+			gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_4_FAULT {
+			gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_5_FAULT {
+			gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_6_FAULT {
+			gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
 };
-- 
2.21.0

