Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB26D873E
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 06:22:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tJzR72ydzDqk5
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 15:22:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jinujoy@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tJyr3XQmzDqcK
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 15:21:39 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9G4HJZP094295
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 00:21:37 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vnqj2xx1p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 00:21:36 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jinujoy@linux.vnet.ibm.com>;
 Wed, 16 Oct 2019 05:21:35 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 16 Oct 2019 05:21:33 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9G4L1ST32309638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 04:21:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9809711C054;
 Wed, 16 Oct 2019 04:21:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6F7611C050;
 Wed, 16 Oct 2019 04:21:31 +0000 (GMT)
Received: from jinus-mbp.in.ibm.com (unknown [9.122.210.142])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Oct 2019 04:21:31 +0000 (GMT)
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 "Santosh Puranik\"" <santosh.puranik.ibm@gmail.com>
From: Jinu Thomas <jinujoy@linux.vnet.ibm.com>
Subject: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: Add i2c eeproms
Date: Wed, 16 Oct 2019 09:51:31 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19101604-0028-0000-0000-000003AA6D00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101604-0029-0000-0000-0000246C849C
Message-Id: <2fd6a175-e249-741a-7f20-67705b9800e6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-16_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=854 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910160038
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

Added eeproms for the below VPD devices
- BMC
- TPM
- System Planar
- DCM 0 VRM
- DCM 1 VRM
- Base Op panel
- Lcd Op panel
- DASD (All)
- PCIe Cards (All)

Signed-off-by: Jinu Joy Thomas <jinu.joy.thomas@in.ibm.com 
<mailto:jinu.joy.thomas@in.ibm.com>>
---
arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 107 ++++++++++++++++++-
1 file changed, 106 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts 
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index cdc65eb28d20..46f36863c001 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -52,7 +52,12 @@
};
&i2c0 {
-status = "okay";
+        status = "okay";
+
+        eeprom@51 {
+                compatible = "atmel,24c64";
+                reg = <0x51>;
+        };
};
&i2c1 {
@@ -104,6 +109,21 @@
compatible = "ti,tmp275";
reg = <0x4a>;
};
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
+
+        eeprom@51 {
+                compatible = "atmel,24c64";
+                reg = <0x51>;
+        };
+
+        eeprom@52 {
+                compatible = "atmel,24c64";
+                reg = <0x52>;
+        };
};
&i2c5 {
@@ -118,6 +138,16 @@
compatible = "ti,tmp275";
reg = <0x49>;
};
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
+
+        eeprom@51 {
+                compatible = "atmel,24c64";
+                reg = <0x51>;
+        };
};
&i2c6 {
@@ -137,6 +167,26 @@
compatible = "ti,tmp275";
reg = <0x4b>;
};
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
+
+        eeprom@51 {
+                compatible = "atmel,24c64";
+                reg = <0x51>;
+        };
+
+        eeprom@52 {
+                compatible = "atmel,24c64";
+                reg = <0x52>;
+        };
+
+        eeprom@53 {
+                compatible = "atmel,24c64";
+                reg = <0x53>;
+        };
};
&i2c7 {
@@ -262,6 +312,16 @@
reg = <0x76>;
#io-channel-cells = <0>;
};
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
+
+        eeprom@51 {
+                compatible = "atmel,24c64";
+                reg = <0x51>;
+        };
};
&i2c8 {
@@ -296,6 +356,16 @@
compatible = "ti,tmp275";
reg = <0x4a>;
};
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
+
+        eeprom@51 {
+                compatible = "atmel,24c64";
+                reg = <0x51>;
+        };
};
&i2c9 {
@@ -340,6 +410,11 @@
compatible = "infineon,ir35221";
reg = <0x74>;
};
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
};
&i2c10 {
@@ -384,6 +459,11 @@
compatible = "infineon,ir35221";
reg = <0x74>;
};
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
};
&i2c11 {
@@ -398,6 +478,16 @@
compatible = "ti,tmp275";
reg = <0x49>;
};
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
+
+        eeprom@51 {
+                compatible = "atmel,24c64";
+                reg = <0x51>;
+        };
};
&i2c12 {
@@ -406,14 +496,29 @@
&i2c13 {
status = "okay";
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
};
&i2c14 {
status = "okay";
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
};
&i2c15 {
status = "okay";
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
};
&lpc_ctrl {
-- 
2.21.0 (Apple Git-122)

