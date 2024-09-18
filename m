Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C6497BA0B
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 11:20:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7tR73KLRz3c4W
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 19:20:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726651215;
	cv=none; b=DDwnpNdMYwDCiqZ2epBWL3ChUvkCkrsWs203rOZeFAmVgBUDzZ1S6728060tDcuUPSjfDeD5ctYgmMQozXeWN5RzJoZ6gk15rBiNYATv7hQ9heJGL0GJ8mqyjPfgj/wgrEO6Bt7QrogES3mXhBnmEY/OejtNToLhRTDpY0IAuAOPmTn8g1tSDA8KybFZdUGGJ68LBXDCJjqrOY2cnQqKL5n1Ch7xRnOFW9YKNIgRSL6jnfbNf9R/ptKy+4RgPR+2lPjsFa96iAv1akj31VDfmSJEZEOGiswyQeT/2asZhxkJw3U6ARqDxN/zVFuM3XbL/2EX7A9lef5n2WhiGfx4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726651215; c=relaxed/relaxed;
	bh=eeJFuaxmJ0JWZgKVL9Bp8bqHW7U0rpAowqo6QvJDnAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Hbo/AslCZp1o5Fdb9TdX17k27LXTvYYwmUcE77w2IGYU/vGTQNnOZelEIYqHsaiBL6qUV99LVv7muvNIcthXVJ2E8hx8wbmWPVjQCJKV2wv0Ji6LsxBLq2atiJ3htj2Jy8Q1KjDgBUkZiJSlf22fWD0KTcuHUmCK1S+v12QOTKYEtLg9ZCcVG3f7PBD7ljm+jeq6T0GJENdrV9MS1Nhjc9eg4US349YJJNxIWF8QqPQ08rrt8GIipFKdMMjjFWtlJfBu/m9+kybkyt8eaj4w9VR2rag7tqTUbqDspsTCWn6pSOsKK/9rTfMwCDgtrLVOvhJi3ke5SNhQC/8orM6hCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fC06XVHb; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+manojkiran.eda.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fC06XVHb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+manojkiran.eda.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7tR31l1mz2xWt;
	Wed, 18 Sep 2024 19:20:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 446455C5ABC;
	Wed, 18 Sep 2024 09:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2314C4CECD;
	Wed, 18 Sep 2024 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726651210;
	bh=2IPuGsFVx6i3IPlbaxYG1lBF+gtjjtT/tgBzPKncEKQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fC06XVHb0/Un4jdSh1HWBV7i/wmL1z2RxPkGk8bOlKg9AfKs01BfHtIzPEx+yuwTl
	 lBs6hYpXEK09I/sWdZSYTDA2yePX/1dUhQZTnoj2tMWdUN/lh4368Ri1SXjyMo6M1U
	 kGaeqrLxMYiNpHBuyUFq1li+i6nrob1V4+sMThYJezPS3HFbjkfgAtg3KbWaHQHctu
	 Opi3Fjbl8UDWlH75eCxCulPgpszA/eymt9iVSA4RifTcA6eJ8gFCF2A7X3yy5b7oiA
	 NdQNBtNgCQCg2joM8bqJn34ekUqhqnZYLWe0o77gcwGZ6Xd9FicrH1FxU61poWlcED
	 j6aJEIM8xkCKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971C5CCD193;
	Wed, 18 Sep 2024 09:20:10 +0000 (UTC)
From: Manojkiran Eda via B4 Relay <devnull+manojkiran.eda.gmail.com@kernel.org>
Date: Wed, 18 Sep 2024 14:50:03 +0530
Subject: [PATCH v2] ARM: dts: aspeed: Enable PECI and LPC snoop for IBM
 System1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240918-dts-aspeed-system1-peci-snoop-v2-1-2d4d17403670@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEKb6mYC/43NTQ6CMBCG4auQWTuGlp+qK+9hWJQywCRCmw4hE
 sLdrZzA5fMt3m8Hocgk8Mh2iLSysJ8T9CUDN9p5IOQuGXSuy/yuDHaLoJVA1KFsstCkMJBjlNn
 7gEZXzuR9actbBakRIvX8OfuvJnlkWXzczrtV/dZ/y6tChe29Nn1b2NoU1XOYLL+vzk/QHMfxB
 WL1jDLKAAAA
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726651208; l=2124;
 i=manojkiran.eda@gmail.com; s=20240917; h=from:subject:message-id;
 bh=PhsAWX7PZUt4OM1Bw10bIDsLdGTH2xpjWLavU7+Q4Tk=;
 b=czWKIuxWc7LaxglC3n9wJmLebajDF5jrdBsRa+IlENMLoNzE6kVM3/qJqWPjuB3Y/egwdDuqB
 JNNjTtL1XS5BICAZswrBb/1tOEriGVb3/1DQfw2KkhL3/sE8CpMpgrM
X-Developer-Key: i=manojkiran.eda@gmail.com; a=ed25519;
 pk=DhQ/NRPeyE1WOxUmafF9Oy8LLco0c8CCeTN+Ef6q6Ts=
X-Endpoint-Received: by B4 Relay for manojkiran.eda@gmail.com/20240917 with
 auth_id=215
X-Original-From: Manojkiran Eda <manojkiran.eda@gmail.com>
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
Reply-To: manojkiran.eda@gmail.com
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org, Ninad Palsule <ninad@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, Manojkiran Eda <manojkiran.eda@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Manojkiran Eda <manojkiran.eda@gmail.com>

This patch enables the PECI interface and configures the LPC Snoop for
ports 0x80 and 0x81 in the ASPEED BMC for IBM System1.

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
---
This patch enables PECI and LPC snoop functionality on the IBM System1
BMC in the device tree.

The following changes have been made:

1. Enabled the PECI controller (peci0) by marking its status to "okay".
2. Enabled the LPC snoop engine, configuring snoop ports at 0x80 and
   0x81.

These changes are required to support PECI communication and LPC
snooping for system monitoring and debugging purposes.

To: Ninad Palsule <ninad@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
To: openbmc@lists.ozlabs.org
To: Eddie James <eajames@linux.ibm.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org

Changes in v2:
- Added ibm system1 in the subject & added upstream mailing
  list as well for reviews.
- Link to v1: https://lore.kernel.org/r/20240917-dts-aspeed-system1-peci-snoop-v1-1-b967fb3a6735@gmail.com
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index cb3063413d1f..738a86c787c0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -464,6 +464,15 @@ &kcs3 {
 	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 };
 
+&peci0 {
+	status = "okay";
+};
+
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>, <0x81>;
+};
+
 &i2c0 {
 	status = "okay";
 

---
base-commit: ca2478a7d974f38d29d27acb42a952c7f168916e
change-id: 20240917-dts-aspeed-system1-peci-snoop-725c70f4a485

Best regards,
-- 
Manojkiran Eda <manojkiran.eda@gmail.com>


