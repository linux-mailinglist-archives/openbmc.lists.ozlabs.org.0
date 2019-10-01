Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 257FFC2D10
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 08:05:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46j7zs0h1zzDqPm
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 16:05:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jinujoy@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46j7z53x4RzDqKj
 for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2019 16:05:02 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9163LVa007269
 for <openbmc@lists.ozlabs.org>; Tue, 1 Oct 2019 02:04:58 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vbypdtbfe-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 01 Oct 2019 02:04:58 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jinujoy@linux.vnet.ibm.com>;
 Tue, 1 Oct 2019 07:04:56 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 1 Oct 2019 07:04:54 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9164rTE56623178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 06:04:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9B6952057;
 Tue,  1 Oct 2019 06:04:53 +0000 (GMT)
Received: from jinus-mbp.in.ibm.com (unknown [9.122.210.196])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 36D3A5205A;
 Tue,  1 Oct 2019 06:04:53 +0000 (GMT)
To: joel@jms.id.au, openbmc@lists.ozlabs.org
From: Jinu Thomas <jinujoy@linux.vnet.ibm.com>
Subject: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: Add i2c eeproms
Date: Tue, 1 Oct 2019 11:34:52 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19100106-0016-0000-0000-000002B24834
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100106-0017-0000-0000-000033132671
Message-Id: <77b1d8b9-08a6-9a75-15a1-1c54dc7ddd9f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=823 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010059
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

Signed-off-by: Jinu Joy Thomas <jinu.joy.thomas@in.ibm.com>
---
  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 35 ++++++++++++++++++++
  1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts 
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index cdc65eb28d20..7d2f3257b419 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -53,6 +53,11 @@

  &i2c0 {
      status = "okay";
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
  };

  &i2c1 {
@@ -262,6 +267,16 @@
          reg = <0x76>;
          #io-channel-cells = <0>;
      };
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
+
+        eeprom@51 {
+                compatible = "atmel,24c64";
+                reg = <0x51>;
+        };
  };

  &i2c8 {
@@ -296,6 +311,16 @@
          compatible = "ti,tmp275";
          reg = <0x4a>;
      };
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
+
+        eeprom@51 {
+                compatible = "atmel,24c64";
+                reg = <0x51>;
+        };
  };

  &i2c9 {
@@ -340,6 +365,11 @@
          compatible = "infineon,ir35221";
          reg = <0x74>;
      };
+
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
  };

  &i2c10 {
@@ -384,6 +414,11 @@
          compatible = "infineon,ir35221";
          reg = <0x74>;
      };
+        eeprom@50 {
+                compatible = "atmel,24c64";
+                reg = <0x50>;
+        };
+
  };

  &i2c11 {
-- 
2.20.1 (Apple Git-117)

