Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F3331AB6
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 00:06:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYqW6jDQz3dG9
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 10:06:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MC6zTpM2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MC6zTpM2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYZ04G6Xz3cXK
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:32 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MXffN103419; Mon, 8 Mar 2021 17:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jq7YneR/pWGSYzbjYtHAyjmfkb9kKes2UEhKH5p4s+A=;
 b=MC6zTpM2k35Y4kS4oGqmuoDwjRcu07IbrRKdjHYpsulBVoNfv9UsBtWfR9Z6LPhChfy4
 eGXIPXYBHDTw4K0ruKFVfgWdxGUoSKSnXjVmZVKMdTcIDc+tEkThy99QxAbIWXEM1ree
 Mcf4e1Xacb76HMNMbI2KuaAc3lWDCVN9UVVydFMkJpeOjZHOFxflDgy1Zz1Jo58cx7b7
 pqiSh+ZYm9Q19TMwksvFwppK1NTG62lOVR9CHcmrKz+OtBzHjYJADss4EVQgdbAl8k78
 itEMzIcC3ixCgkctTzmiENcQKj7bWENRhJUS5vyZvD9LMfblEPyGRssxxDMIP/VoHtVj hg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375uddtkb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:29 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128MrLu5005598;
 Mon, 8 Mar 2021 22:54:28 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3741c9efa6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsRoW25821440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:27 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 880D2C6057;
 Mon,  8 Mar 2021 22:54:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50D83C605A;
 Mon,  8 Mar 2021 22:54:27 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:27 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 25/35] ARM: dts: aspeed: rainier: Support pass
 2 planar
Date: Mon,  8 Mar 2021 16:54:09 -0600
Message-Id: <20210308225419.46530-26-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103080118
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

From: Alpana Kumari <alpankum@in.ibm.com>

Add device trees for the second version of the Rainier system planar.
Include the original dts and make the necessary changes.

Signed-off-by: Alpana Kumari <alpankum@in.ibm.com>
---
 arch/arm/boot/dts/Makefile                    |   2 +
 .../boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts | 198 ++++++++++++++++++
 .../boot/dts/aspeed-bmc-ibm-rainier-v2.dts    | 198 ++++++++++++++++++
 3 files changed, 398 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index c57729f40185..7b24be9cf961 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1397,7 +1397,9 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-yosemitev2.dtb \
 	aspeed-bmc-ibm-everest.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
+	aspeed-bmc-ibm-rainier-v2.dtb \
 	aspeed-bmc-ibm-rainier-4u.dtb \
+	aspeed-bmc-ibm-rainier-4u-v2.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts
new file mode 100644
index 000000000000..6712b2e7e7b5
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2021 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-rainier-4u.dts"
+
+/ {
+	i2c20 = &i2c4mux0chn0;
+	i2c21 = &i2c4mux0chn1;
+	i2c22 = &i2c4mux0chn2;
+	i2c23 = &i2c5mux0chn0;
+	i2c24 = &i2c5mux0chn1;
+	i2c25 = &i2c6mux0chn0;
+	i2c26 = &i2c6mux0chn1;
+	i2c27 = &i2c6mux0chn2;
+	i2c28 = &i2c6mux0chn3;
+	i2c29 = &i2c11mux0chn0;
+	i2c30 = &i2c11mux0chn1;
+};
+
+&i2c4 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+	/delete-node/ eeprom@52;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c4mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c4mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+
+		i2c4mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+	};
+};
+
+&i2c5 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c5mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c5mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c6 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+	/delete-node/ eeprom@52;
+	/delete-node/ eeprom@53;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c6mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@53 {
+				compatible = "atmel,24c64";
+				reg = <0x53>;
+			};
+		};
+
+		i2c6mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+		};
+
+		i2c6mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c11 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c11mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c11mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts
new file mode 100644
index 000000000000..24cf12150919
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2021 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-rainier.dts"
+
+/ {
+	i2c20 = &i2c4mux0chn0;
+	i2c21 = &i2c4mux0chn1;
+	i2c22 = &i2c4mux0chn2;
+	i2c23 = &i2c5mux0chn0;
+	i2c24 = &i2c5mux0chn1;
+	i2c25 = &i2c6mux0chn0;
+	i2c26 = &i2c6mux0chn1;
+	i2c27 = &i2c6mux0chn2;
+	i2c28 = &i2c6mux0chn3;
+	i2c29 = &i2c11mux0chn0;
+	i2c30 = &i2c11mux0chn1;
+};
+
+&i2c4 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+	/delete-node/ eeprom@52;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c4mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c4mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+
+		i2c4mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+	};
+};
+
+&i2c5 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c5mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c5mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c6 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+	/delete-node/ eeprom@52;
+	/delete-node/ eeprom@53;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c6mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@53 {
+				compatible = "atmel,24c64";
+				reg = <0x53>;
+			};
+		};
+
+		i2c6mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@52 {
+				compatible = "atmel,24c64";
+				reg = <0x52>;
+			};
+		};
+
+		i2c6mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c6mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
+
+&i2c11 {
+	/delete-node/ eeprom@50;
+	/delete-node/ eeprom@51;
+
+	pca9546@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c11mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c11mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@51 {
+				compatible = "atmel,24c64";
+				reg = <0x51>;
+			};
+		};
+	};
+};
-- 
2.27.0

