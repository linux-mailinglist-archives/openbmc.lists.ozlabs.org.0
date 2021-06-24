Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B123B2956
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 09:32:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Wzm329kz307D
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 17:32:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=AzXpVQ7f;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=bNGeoeH3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=AzXpVQ7f; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=bNGeoeH3; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9WzN4F51z3btD
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 17:31:43 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id C9AFA5C0075;
 Thu, 24 Jun 2021 03:31:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 24 Jun 2021 03:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=hEJpSrYSR1Ha2L1krRbpV+Lthp
 fs8cdVmzKUka8DWC0=; b=AzXpVQ7fAfjvYAjqpVU7k1W4lQ5291ojxetRGYxHzJ
 Lv3aJ0VFnPCkJ+/9OFrPBdw2I+UbJ5XkXyX5RtP8tVlLvePUeUNNbu6vebBCMsln
 eNfgdUnQCKV5ZZ/DEARgk3/BfBHuAgD/OXZuzg/I3iUShTcUksBdYX4ZUOncpSpS
 MWkzlDJORnRIXQMrVhtSHidWXGery4j2kE/EWdO4USpHeDGBq2kI4XUzyMXi8O3F
 ie5xB9f0a2NtVHOIVrEf7IbIb53uiuAyId2zITuxxtpYSUcJZTV/PLrjJ4PfW+9B
 FssbRVHFsSfA0/34WNbobSbFajG2pEgHipGJ5paToytQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hEJpSrYSR1Ha2L1kr
 RbpV+Lthpfs8cdVmzKUka8DWC0=; b=bNGeoeH3RqQ7saR6Xq+q+8R66h7Q/Kq/i
 4QXZ+QDH8SKy4fDEHORGsdUlH7IVJATbHTvcy3GneD0u/p3gKP8Cu6nujFZBQlq3
 EKFZWCeAdJwmq+VHHTDx9GpA/+efafC+oyDBtleJ6OcFlzZb38EqqNYcCK5klrHE
 RNhvZ8+88j2EwJowCSyjyXcsYgrNm3t0fYPsL6FtY+WxqzCUBEj2rE47z97qYpA1
 Hf8ceAhLcHNglpUAYfh0eQWW31rR8YfThckRldiIl0QhSzEtLo/HpLsWaUCH6pp9
 wtIfwMWymdNT017UzMI3nOTeHEzH4Qpd5V/L064sOdvme2XvtuIQg==
X-ME-Sender: <xms:2zTUYBhxqnM-3EiCDMFxY9syRISh5Ir5ctzIgLbcz6D-ysvNSfJj5w>
 <xme:2zTUYGDTQ7tBquATie6m-iZaJqSx0M3hVYtIjBwuJvrVWT4hf15CjlE_odzeRoleQ
 u_lxYqONtZAVvBY4A>
X-ME-Received: <xmr:2zTUYBGYqb-MMnx3oOFvyk82a4AbED63jr74YGNUr2THl2OGtaWLGDQEvTTr4zq44c5PmE24yEdRCDd_n6KDYKsb8xDX88DxcUsMf8XxaeCsVteYXnBX8y3Ee0neKrq7honBGyB4OcFOEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeggedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeeiteehudevlefhvddvjeeluefhleetve
 ehfffgiedtfeegkeejfeeivefgheehgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:2zTUYGRxZCxnDWnyPxzcbbE032-Vt7LclA7dSuoKCl5BN7xsdSLvRg>
 <xmx:2zTUYOzjF6HuPDDgbjDgASBUkhHqx4Aq6DwseXCLRaeJi1_sojkneQ>
 <xmx:2zTUYM6vaFReIIeECEcLGcIFCXwdleXnxctDhzAgGL2S30UdwBO0HA>
 <xmx:2zTUYEZGEbyxHb12nxTZzVXikV7q8GrftAFMBnd9n8dNMSUwPSzBDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Jun 2021 03:31:37 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10] ARM: dts: aspeed: rainier: Add eMMC clock
 phase compensation
Date: Thu, 24 Jun 2021 17:01:29 +0930
Message-Id: <20210624073129.802108-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Determined by scope measurements at speed.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20201208012615.2717412-7-andrew@aj.id.au
Signed-off-by: Joel Stanley <joel@jms.id.au>
(cherry picked from commit d2dc55b96f876616838b61b2378656effd0e14ba)
---

We missed this when backporting the eMMC phase series

 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 73e94be5424b..1491c62e5b76 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -310,6 +310,7 @@ &pinctrl_emmc_default {
 
 &emmc {
 	status = "okay";
+	clk-phase-mmc-hs200 = <180>, <180>;
 };
 
 &fsim0 {
-- 
2.30.2

