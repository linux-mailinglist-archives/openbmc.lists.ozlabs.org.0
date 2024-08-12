Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E196294FA53
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 01:34:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lhaw28ws;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjW8F60Nwz2yVB
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 09:34:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lhaw28ws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.4; helo=m16.mail.163.com; envelope-from=wenliang202407@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjJhR696qz2xfR
	for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 01:43:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=NoUqN+rkRXS4dIJK7h
	ro1lKr5yjGbMaQfAOxGGlXL3g=; b=lhaw28wscAKoJAsjBpIMVCf2Kv9CG/hoI+
	aDArOtS7XeVSkT/IhCgowCqP4HPdogb/MZDRyKk5DOF1b/6LleVCDIrb7dtA2CSZ
	D5tYHxprHJUj8s0Udd5Og9aqlj/0U6HbTULiXc00ckQux2dGLJWKt5kfmst6megH
	TM1rNdz2M=
Received: from 100ask.localdomain (unknown [112.10.185.129])
	by gzga-smtp-mta-g2-2 (Coremail) with SMTP id _____wD3_62LLbpmhOmUBg--.11349S2;
	Mon, 12 Aug 2024 23:43:07 +0800 (CST)
From: Wenliang <wenliang202407@163.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Subject: [PATCH linux dev 6.11 2/2] hwmon driver sq52205 documentation
Date: Mon, 12 Aug 2024 11:43:04 -0400
Message-Id: <20240812154304.3623-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3_62LLbpmhOmUBg--.11349S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw15ZF47XFWkZrW7KF13CFg_yoWDXrb_u3
	4xKFykXrZ8JF1Fga48AwsIyrW7Ar4Ikrn7Ca4Dtrs8AwnIv39xWFykJry7Zr17Zr43uFWr
	uws7AFWkZrsFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNrWrJUUUUU==
X-Originating-IP: [112.10.185.129]
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiNQ0502V4JH7mHQAAsu
X-Mailman-Approved-At: Tue, 13 Aug 2024 09:34:28 +1000
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
Cc: Wenliang <wenliang202407@163.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Provide the binding documentation related to the sq52205 driver.

Signed-off-by: Wenliang <wenliang202407@163.com>

---
 .../bindings/hwmon/silergy,sq52205.txt        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/silergy,sq52205.txt

diff --git a/Documentation/devicetree/bindings/hwmon/silergy,sq52205.txt b/Documentation/devicetree/bindings/hwmon/silergy,sq52205.txt
new file mode 100644
index 000000000000..d3f790fed32e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/silergy,sq52205.txt
@@ -0,0 +1,21 @@
+sq52205 properties
+
+Required properties:
+- compatible:
+	Should be one of
+		silergy,sq52205
+- reg: I2C address
+
+Optional properties:
+
+- shunt-resistor:
+    description:
+      Shunt resistor value in micro-Ohm.
+
+Example:
+
+temp-sensor@40 {
+	compatible = "silergy,sq52205";
+	reg = <0x40>;
+	shunt-resistor = <1000>;
+};
-- 
2.17.1

