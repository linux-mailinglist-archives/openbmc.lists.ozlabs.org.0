Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3AF88A70
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 11:54:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465HWY1Pj0zDqvv
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 19:54:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.145; helo=unicom145.biz-email.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465HVz5msnzDqlc
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 19:53:39 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id BRL32730;
 Sat, 10 Aug 2019 17:53:30 +0800
Received: from localhost (10.100.1.52) by Jtjnmail201618.home.langchao.com
 (10.100.2.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 10 Aug
 2019 17:53:25 +0800
From: John Wang <wangzqbj@inspur.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <trivial@kernel.org>,
 <linux@roeck-us.net>, <venture@google.com>, <jgebben@sweptlaser.com>,
 <anson.huang@nxp.com>, <devicetree@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <duanzhijia01@inspur.com>, <mine260309@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: Add ipsps1 as a trivial device
Date: Sat, 10 Aug 2019 17:53:25 +0800
Message-ID: <20190810095325.5333-1-wangzqbj@inspur.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201604.home.langchao.com (10.100.2.4) To
 Jtjnmail201618.home.langchao.com (10.100.2.18)
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

The ipsps1 is an Inspur Power System power supply unit

Signed-off-by: John Wang <wangzqbj@inspur.com>
---
v2:
    - No changes.
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 747fd3f689dc..63960c7d949a 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -101,6 +101,8 @@ properties:
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
             # Intersil ISL29028 Ambient Light and Proximity Sensor
+          - inspur,ipsps1
+            # Inspur Power System power supply unit version 1
           - isil,isl29028
             # Intersil ISL29030 Ambient Light and Proximity Sensor
           - isil,isl29030
-- 
2.17.1

