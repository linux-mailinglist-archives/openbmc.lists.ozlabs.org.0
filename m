Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC1497AFE0
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2024 13:57:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7Kz04LM1z3c6b
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2024 21:57:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726574248;
	cv=none; b=aD9BNW2k89EW9mvo0Re0EX+8GNei+G50Z59FwkQeGJ0sNL4Df3w2tHLWkgSK2ATZZAINoIxqdvPD4h6Z8gEEm3D8nKc+GS2OlXbFih+uxJb2tD8VdvFw6S2Mva8j+jrchxhDEmaz5MVKihH7R6vHmKCKlco+P4MWHH8F9a885zVXpGz9jIQEVuqQbC6nwKVTDGc7lj6+Aun4r1AIRosOGHtgvieF9lwguAy/iz6cldPH8WPPt0bSoYxuZvm1MCllJAtU2f/emzDIAEG7vhdI3ckqWr9R+CecOiQhuGEq+vXt60bRNKOhJ6VlxTptng+UGqzMVvaq/uNMJ97LB5SXJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726574248; c=relaxed/relaxed;
	bh=CikFR1gq0gSQKzJyKNyxCjit3KuMZtnr9psSgcDO3CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mf+Z5jUcEk/b7gIKL9daMj5QdIlKzfop0HccUCQGd7QJB3tDNu7TdKq593674WmtqxGcFJT2tRn6kiE71qsUidlllG+QV6JTHIyqAzFH23HOrwoDn/39yhE45u+CrS+l7TN97nQljMvqpmC0InBYB9fF3z1TQgWTKzPMRUz4jkXSkMUTsQ4BVgy/vUa1z8ON0V/es9WQod9dsew4fNdW+F01Dec0CfIwcIo/qIE2mcXQrDQBy3Qx7WwrbuNZ2Hfa4Av0Hf+sViEsfUX363ykj1ffR4lEHOYF1dkgfWTN5LHFITAZPOi4PkA1yUV3i3RD7LZBtJgFEsREZEzlYAmG0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=efy3NRWn; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+manojkiran.eda.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=efy3NRWn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+manojkiran.eda.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7Kyv5yJzz2xYl
	for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2024 21:57:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31849A40DEA;
	Tue, 17 Sep 2024 11:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B02EDC4CECD;
	Tue, 17 Sep 2024 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726574243;
	bh=oH2QB1s4XnDmw5FrnrE7csTN0s9V0t5AqWEf3HxQGPI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=efy3NRWnXr/iRqbE0TC3nwjiOud7S0lN4KfPE7nFwH5nP2B6HpDOoYmcMgROADp9f
	 PNafCZovwXKKE52CjMYOzbEh+Hy6EfBGoOdrTYeQrqb2POpyCOLhWXKYlNu0bJvJtA
	 1dF+2PHHny8gOovSepYBhLHGHafGOeaFRSqIf/I/fIvWyV2vnQK1qF13uZIrKh+4Ap
	 nIElmGDNNpgxPAt1bKE1CxRT8Bgj2CT6UOQ6CuuELk7ilY4Th6lxfzkH0W3Si2Wh0r
	 RziaNGMTZ6Uo3UUYrhuugDkq1cn9LDz6c42q/jo7tNPDDBUFc7w8X7RN04BiG6NXg8
	 1iKHqd0znvGqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72D1C35FFF;
	Tue, 17 Sep 2024 11:57:23 +0000 (UTC)
From: Manojkiran Eda via B4 Relay <devnull+manojkiran.eda.gmail.com@kernel.org>
Date: Tue, 17 Sep 2024 17:27:08 +0530
Subject: [PATCH] arm: dts: aspeed: Enable PECI and LPC Snoop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-dts-aspeed-system1-peci-snoop-v1-1-b967fb3a6735@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJNu6WYC/x3MQQrDIBAF0KuEWXdAxWDbq5QuRH+SWVTFCaUl5
 O6VLt/mHaToAqX7dFDHW1RqGbCXidIWywqWPEzOOG9uNnDelaM2ILN+dcfLckMS1lJr4+DmFMz
 io7/ONI7Wscjn/z+e5/kDtxZUKG8AAAA=
To: Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org, 
 Eddie James <eajames@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726574241; l=1427;
 i=manojkiran.eda@gmail.com; s=20240917; h=from:subject:message-id;
 bh=/1nUIqnNZDWK/Gq0s2SEC3Nt9jxEcTyK93Dbo2tVeno=;
 b=Mr1/kTJU6zcF2l+GCyb8NtyXvLOg64fP2VpzhFv8/8qfP+p8kmJzx3PlpqZFTkVzCFzoMEvSr
 rYczmGitysQBXvsFFm29c0naO0q+2OgLnEt2TiyVCKVLE3Yv2xoNiD/
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
Cc: Manojkiran Eda <manojkiran.eda@gmail.com>
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


