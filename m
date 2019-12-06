Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9CA1158E0
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 22:59:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V61R5NK5zDqhR
	for <lists+openbmc@lfdr.de>; Sat,  7 Dec 2019 08:59:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=wrightj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V60j4lTVzDqgV
 for <openbmc@lists.ozlabs.org>; Sat,  7 Dec 2019 08:58:26 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6LvLAZ033313; Fri, 6 Dec 2019 16:58:22 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq9ve0n7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2019 16:58:22 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB6LtLFg017432;
 Fri, 6 Dec 2019 21:58:22 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 2wkg27t2t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2019 21:58:22 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB6LwKQd50659736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 21:58:20 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0894C6057;
 Fri,  6 Dec 2019 21:58:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FC31C6055;
 Fri,  6 Dec 2019 21:58:20 +0000 (GMT)
Received: from wrightj-ThinkPad-W520.rchland.ibm.com (unknown [9.10.101.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 21:58:20 +0000 (GMT)
From: Jim Wright <wrightj@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 1/2] dt-bindings: hwmon/pmbus: Add ti,
 ucd90320 power sequencer
Date: Fri,  6 Dec 2019 15:57:40 -0600
Message-Id: <20191206215741.4269-2-wrightj@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206215741.4269-1-wrightj@linux.vnet.ibm.com>
References: <20191206215741.4269-1-wrightj@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_07:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912060175
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
Cc: Jim Wright <wrightj@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document the UCD90320 device tree binding.

Signed-off-by: Jim Wright <wrightj@linux.vnet.ibm.com>
---
 .../bindings/hwmon/pmbus/ti,ucd90320.yaml     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml
new file mode 100644
index 000000000000..5d42e1304202
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/ti,ucd90320.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UCD90320 power sequencer
+
+maintainers:
+  - Jim Wright <wrightj@linux.vnet.ibm.com>
+
+description: |
+  The UCD90320 is a 32-rail PMBus/I2C addressable power-supply sequencer and
+  monitor. The 24 integrated ADC channels (AMONx) monitor the power supply
+  voltage, current, and temperature. Of the 84 GPIO pins, 8 can be used as
+  digital monitors (DMONx), 32 to enable the power supply (ENx), 24 for
+  margining (MARx), 16 for logical GPO, and 32 GPIs for cascading, and system
+  function.
+
+  http://focus.ti.com/lit/ds/symlink/ucd90320.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,ucd90320
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ucd90320@11 {
+            compatible = "ti,ucd90320";
+            reg = <0x11>;
+        };
+    };
-- 
2.17.1

