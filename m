Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 924155B472
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 08:03:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ccHB6brjzDqV2
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 16:03:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GCJn2yF7"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ccGM41RszDqRv
 for <openbmc@lists.ozlabs.org>; Mon,  1 Jul 2019 16:02:19 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id 196so5469400pgc.6
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jun 2019 23:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q1fiqcHRXGHsbndMK1CPknRYLyXD66HLFL9N25fXOzM=;
 b=GCJn2yF7OH8nHkCXbTcuG1izIUz7kLSrXrMbgkH24oTKx2fcneIYMV3mTU8NdIjc3O
 1z860/xxjRTkYvI4oe5WP4AS9Xhaa90LUVu+ljKK2/TtZKZdE/+8+nQczoTz+cc63gHm
 55Q8aU0QDfbWNWSQZACrvj838su6RS1tunCJwl4dJEpS0mhGrUmZzGpO4Nnsb8derF72
 QYXOfGruBcFreiPNLN4BRViYwz9MfT5kyWQJw6d3lpJt0bj+HD+MMdrxabBoT5U3O3Az
 4QWKz08HlRq93tOOAvJjjpxD8hnmewYtseJpxuZWl2bBnAMle635fj5voEaprQeztJMi
 FA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q1fiqcHRXGHsbndMK1CPknRYLyXD66HLFL9N25fXOzM=;
 b=f7zBUNXoEX8iQJ7s34YcedDNmg5pv5B7aGNbTNercSNsjvOPGj+msmtNrLnFYcgBmm
 e0Q0es/PqvcxFUjDN4fCl6jA0BttgPPku3oNeS8f3y80+R9UABhUaCasZL2wZNhAEPIo
 WI4QbF53MwIJJTv2NluYuPhPd3uZjrUSTq93JGvtRpb0R3K0wlcUvSLA5BNPBclIiHVY
 lL/218FHsNpXmnEIG22vy1k4LUY+1oajQUz7tl3AldVYovTPS24+cyLIkQQQw2IY1Z1w
 HX1v1TmgyVjMqDjJdXQtM6a4Z9EsvJaLxXqtn/rTA9Nl7A8oFZ/Y0yvch60ziDznsSAV
 yYCg==
X-Gm-Message-State: APjAAAWkpwB5/Uj3iVj7U0xExxfir2QQgDfNWS73EAje/+q26H8h5ffH
 Cfg0L5LU7SnOJm5+dOy+0cY=
X-Google-Smtp-Source: APXvYqxpZ7Zn8cuKUbReJe2YG88St4S5QdO6Ne5TTIB1trrRhPUtMsSrrRd7bFuVytnPC7asA3WCmQ==
X-Received: by 2002:a17:90a:e397:: with SMTP id
 b23mr14769238pjz.117.1561960935521; 
 Sun, 30 Jun 2019 23:02:15 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id w14sm8672127pfn.47.2019.06.30.23.02.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 30 Jun 2019 23:02:14 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: [PATCH dev-5.17 v1 1/6] ARM: dts: nuvoton: Add Nuvoton RunBMC
 DeviceTree
Date: Mon,  1 Jul 2019 14:01:32 +0800
Message-Id: <20190701060137.22116-1-chyishian.jiang@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: openbmc@lists.ozlabs.org, Samuel Jiang <Samuel.Jiang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Samuel Jiang <Samuel.Jiang@quantatw.com>

Initial Nuvoton RunBMC Module which use NPCM750 SoC.

Including features:
1. image partitions
2. lpc and kcs
3. usb
4. serial port
5. spi
6. fiu
7. watchdog

Testeed:
  Build Qunata runbmc-nuvoton image and load on RunBMC-nuvoton module

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 292 +++++++++++++++++++
 1 file changed, 292 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
new file mode 100644
index 000000000000..eec815d2a638
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Nuvoton Technology kwliu@nuvoton.com
+// Copyright (c) 2019 Quanta Computer Inc. Samuel.Jiang@quantatw.com
+
+/dts-v1/;
+#include "nuvoton-npcm750.dtsi"
+
+/ {
+	model = "Nuvoton npcm750 RunBMC Module";
+	compatible = "nuvoton,npcm750";
+
+	aliases {
+		ethernet0 = &emc0;
+		ethernet1 = &gmac0;
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+		udc0 = &udc0;
+		udc1 = &udc1;
+		udc2 = &udc2;
+		udc3 = &udc3;
+		udc4 = &udc4;
+		udc5 = &udc5;
+		udc6 = &udc6;
+		udc7 = &udc7;
+		udc8 = &udc8;
+		udc9 = &udc9;
+		emmc0 = &sdhci0;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+	};
+
+	chosen {
+		stdout-path = &serial3;
+	};
+
+	memory {
+		reg = <0 0x40000000>;
+	};
+
+	ahb {
+		gmac0: eth@f0802000 {
+			phy-mode = "rgmii-id";
+			snps,eee-force-disable;
+			status = "okay";
+		};
+
+		emc0: eth@f0825000 {
+			phy-mode = "rmii";
+			use-ncsi;
+			status = "okay";
+		};
+
+		ehci1: usb@f0806000 {
+			status = "okay";
+		};
+
+		ohci1: ohci@f0807000 {
+			status = "okay";
+		};
+
+		udc0:udc@f0830000 {
+			status = "okay";
+		};
+
+		udc1:udc@f0831000 {
+			status = "okay";
+		};
+
+		udc2:udc@f0832000 {
+			status = "okay";
+		};
+
+		udc3:udc@f0833000 {
+			status = "okay";
+		};
+
+		udc4:udc@f0834000 {
+			status = "okay";
+		};
+
+		udc5:udc@f0835000 {
+			status = "okay";
+		};
+
+		udc6:udc@f0836000 {
+			status = "okay";
+		};
+
+		udc7:udc@f0837000 {
+			status = "okay";
+		};
+
+		udc8:udc@f0838000 {
+			status = "okay";
+		};
+
+		udc9:udc@f0839000 {
+			status = "okay";
+		};
+
+		aes:aes@f0858000 {
+			status = "okay";
+		};
+
+		sha:sha@f085a000 {
+			status = "okay";
+		};
+
+		fiu0: fiu@fb000000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0cs1_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-rx-bus-width = <2>;
+				partitions@80000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					bmc@0{
+						label = "bmc";
+						reg = <0x000000 0x4000000>;
+					};
+					u-boot@0 {
+						label = "u-boot";
+						read-only;
+						reg = <0x0000000 0x80000>;
+					};
+					u-boot-env@100000 {
+						label = "u-boot-env";
+						reg = <0x00100000 0x40000>;
+					};
+					kernel@200000 {
+						label = "kernel";
+						reg = <0x0200000 0x600000>;
+					};
+					rofs@800000 {
+						label = "rofs";
+						reg = <0x0800000 0x1500000>;
+					};
+					rwfs@1c00000 {
+						label = "rwfs";
+						reg = <0x1c00000 0x300000>;
+					};
+				};
+			};
+			spi-nor@1 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <1>;
+				npcm,fiu-rx-bus-width = <2>;
+				partitions@88000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spare1@0 {
+						label = "spi0-cs1-spare1";
+						reg = <0x0 0x800000>;
+					};
+					spare2@800000 {
+						label = "spi0-cs1-spare2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+
+		fiu3: fiu@c0000000 {
+			pinctrl-0 = <&spi3_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-rx-bus-width = <2>;
+				partitions@A0000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					system1@0 {
+						label = "spi3-system1";
+						reg = <0x0 0x800000>;
+					};
+					system2@800000 {
+						label = "spi3-system2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+
+		sdhci0: sdhci@f0842000 {
+			status = "okay";
+		};
+
+		pcimbox: pcimbox@f0848000 {
+			status = "okay";
+		};
+
+		vcd: vcd@f0810000 {
+			status = "okay";
+		};
+
+		ece: ece@f0820000 {
+			status = "okay";
+		};
+
+		apb {
+
+			watchdog1: watchdog@901C {
+				status = "okay";
+			};
+
+			rng: rng@b000 {
+				status = "okay";
+			};
+
+			serial0: serial@1000 {
+				status = "okay";
+			};
+
+			serial1: serial@2000 {
+				status = "okay";
+			};
+
+			serial2: serial@3000 {
+				status = "okay";
+			};
+
+			serial3: serial@4000 {
+				status = "okay";
+			};
+
+			adc: adc@c000 {
+				status = "okay";
+			};
+
+			otp:otp@189000 {
+				status = "okay";
+			};
+
+			lpc_kcs: lpc_kcs@7000 {
+				kcs1: kcs1@0 {
+					status = "okay";
+				};
+
+				kcs2: kcs2@0 {
+					status = "okay";
+				};
+
+				kcs3: kcs3@0 {
+					status = "okay";
+				};
+			};
+
+			lpc_host: lpc_host@7000 {
+				lpc_bpc: lpc_bpc@40 {
+					monitor-ports = <0x80>;
+					status = "okay";
+				};
+			};
+
+			spi0: spi@200000 {
+				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+				status = "okay";
+			};
+
+			spi1: spi@201000 {
+				status = "okay";
+			};
+		};
+	};
+};
+
+&gcr {
+	serial_port_mux: mux-controller {
+	compatible = "mmio-mux";
+	#mux-control-cells = <1>;
+
+	mux-reg-masks = <0x38 0x07>;
+	idle-states = <6>;
+	};
+};
-- 
2.20.1

