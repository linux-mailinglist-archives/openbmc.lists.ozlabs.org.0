Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8646DBFC
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 20:21:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8RqW5YDFz2yJv
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 06:21:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W+cNiiE1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=W+cNiiE1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8RlP2kf4z3015
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 06:18:09 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8IRejW028894; 
 Wed, 8 Dec 2021 19:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=lYBSxupIP37oKvIlv9kJt2I5qdf488/0BjLOC7SJYpg=;
 b=W+cNiiE1ExoJh8KDru5sfjb7g/iFEqSVwFTF26ObBzqfv5/g5ePFL6gIXSgb2Y/FEt8X
 2wHEc/zbpGA4JVdNqfgd16TG9rDkRoPvrbZzGnJf9JMYoib4praQ7z5HaNKLviXTjxJQ
 ADzjRmryC8CfhQINaWFhJBVNjwNH8zW1ppz4SnXL5o1oYz5NChYmjOX53EsWdGy3+k5f
 jxXikIHTR/4vx5UC1Bw3uSX6e1a54RIbdyFfkXPhk3gBQr6zlQ77opvj/459M8vlwtyI
 8Fz886NRvnSI0uYxyOw87qxGm9p+cxy/wxcUp9CvmU1671LClavJoUPpoLtzUcfks2Ne yQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu20m0wqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 19:18:06 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8JDBwH016564;
 Wed, 8 Dec 2021 19:18:05 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3cqyybv52q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 19:18:05 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8JI4cO22741784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 19:18:04 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 341C9B206B;
 Wed,  8 Dec 2021 19:18:04 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8434B2064;
 Wed,  8 Dec 2021 19:18:03 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.84.65])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 19:18:03 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 5/7] tpm: Add YAML schema for TPM TIS I2C
 options
Date: Wed,  8 Dec 2021 13:17:56 -0600
Message-Id: <20211208191758.20517-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211208191758.20517-1-eajames@linux.ibm.com>
References: <20211208191758.20517-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: d0-YENwsY3mliULWBd_diEMBYfG4HkdU
X-Proofpoint-GUID: d0-YENwsY3mliULWBd_diEMBYfG4HkdU
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112080108
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

From: Amir Mizinski <amirmizi6@gmail.com>

Add a YAML schema to support tpm tis i2c related dt-bindings for the I2c
PTP based physical layer.

This patch adds the documentation for corresponding device tree bindings of
I2C based Physical TPM.
Refer to the 'I2C Interface Definition' section in
'TCG PC Client PlatformTPMProfile(PTP) Specification' publication
for specification.

Signed-off-by: Amir Mizinski <amirmizi6@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/security/tpm/tpm-tis-i2c.yaml    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml

diff --git a/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
new file mode 100644
index 000000000000..217ba8e366c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/security/tpm/tpm-tis-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C PTP based TPM Device Tree Bindings
+
+maintainers:
+  - Amir Mizinski <amirmizi6@gmail.com>
+
+description:
+  Device Tree Bindings for I2C based Trusted Platform Module(TPM).
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # Nuvoton's Trusted Platform Module (TPM) (NPCT75x)
+          - nuvoton,npct75x
+      - const: tcg,tpm-tis-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupt:
+    maxItems: 1
+
+  crc-checksum:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set this flag to enable CRC checksum.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      tpm@2e {
+        compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
+        reg = <0x2e>;
+        crc-checksum;
+      };
+    };
+...
-- 
2.27.0

