Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA35958D00E
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 00:13:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1r826QWvz3bZB
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 08:13:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=ogW6+vjT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=j5Y7ZctP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=ogW6+vjT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=j5Y7ZctP;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1r2S2fgRz2xH3
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 08:09:04 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 771BB5815F3;
	Mon,  8 Aug 2022 18:09:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 08 Aug 2022 18:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1659996542; x=1660000142; bh=KO
	vbTQK71UIaBtP/fGgY4pnkjvLcKvliRk17xSsGPRA=; b=ogW6+vjT24gMNxw0ph
	2N2K1SkpYRl7C2maMUFmW/GIh17MdNnWg5B4zUs/1UhldnbAxrxdgZvO1cbIkmSc
	jXRNKYxsdSN+9HLVEpQhk7oj4oPeMUJCRTCJWGO4G52duhuxHURH1jpIXsEPwiGG
	U/eijsXU/By5B5d0HPggjqIJfN7D5FjBzNbjxAJdCeZUorVMkL/8ziYgDVPJbZgX
	1tUlVv+tUUc9FQKVqA2/sEZamTonRj5rL+hsNSF1OmSN6P3M4ETYCRhw1idTUd+M
	UWqzl927W8OLSbU+fS/WYuxKo1/UVRPXsJmZGPcFjjyJ2lTWm9GugffOuFsdoA0T
	NY8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1659996542; x=1660000142; bh=KOvbTQK71UIaB
	tP/fGgY4pnkjvLcKvliRk17xSsGPRA=; b=j5Y7ZctPWq8WaFxy3E2Y8dkyFGBbU
	83GOm8WLs/Np9rcXw7TyiMWMh+LxLwNQn2WTjtYzzXvHOqBA5JpZQ9oW9OAWrySE
	EqBjomhpjHH92Sll1fmzkCb2gskcsvuJb7LXOP+p9+bzVXVOgD44BfQsnKUcrm7B
	6K0obo4lZDJjkxxQF4IpRJzXSLMLjorwiJbnA7MLKknLOvBHjhiytAVQq7H+pS0X
	GkAcDDkBpYKOB32c+NBPFxHDQ2fysOIB7AiYDQVJqwzZ41+fMgSptgQPCJBPyR7M
	YBVsh5Ap72f9+8J9trg09eCCKs85Kosl6wUP6+TiGUWlFGAzF0DBoO6Bg==
X-ME-Sender: <xms:fonxYuAjXpW0ZfdHAa6FVteMyJTf_qHFAsa7nBgGTlR9wqbjnexAIw>
    <xme:fonxYoiixsdlBFykFR2uVB_gJXcf4hnxcIxkcmTv2RvXuX5AotRAFYGHR7NN49qIq
    UuWcYm40K9iEAct0jI>
X-ME-Received: <xmr:fonxYhm8WUIWcpqVZNHMXbwMIai0OQRe3A_FeiQ6P4n9NcLDNAd27shaE9NhbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
    dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
    redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
    esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
    uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:fonxYsz4IjnuYmIlHmt-nsWyZPMGvok_Rjqtk9HZqPuAW2UH5_Pcdw>
    <xmx:fonxYjT7vj_ew54-qqNDWsWwq0CBvXJPLBTVOV48T1Fr9zpIs40vng>
    <xmx:fonxYnZJ2ObeIM47QhvwpKROfOLIsl02_szXWqVJiWf8vgO2f3VD7Q>
    <xmx:fonxYtcnOOXwnqVI4DwUuBDcrvJUgck4zX7ZtEHINhqNv5l_bGLVgg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 18:09:01 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Subject: [PATCH 7/7] tpm_tis_i2c: Add old compatible strings back
Date: Mon,  8 Aug 2022 15:08:39 -0700
Message-Id: <20220808220839.1006341-8-peter@pjd.dev>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808220839.1006341-1-peter@pjd.dev>
References: <20220808220839.1006341-1-peter@pjd.dev>
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
Cc: Alexander.Steffen@infineon.com, peter@pjd.dev, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The old version of this driver from Nuvoton included different
compatible strings, which are in-use by a few dts's.

$ egrep -r "npct75x|tpm-tis-i2c" arch/arm
arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts:           compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts:           compatible = "nuvoton,npct75x";
arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts:            compatible = "tcg,tpm-tis-i2c";

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 drivers/char/tpm/tpm_tis_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
index ba0911b1d1ff..a2ae2eafed6d 100644
--- a/drivers/char/tpm/tpm_tis_i2c.c
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -369,6 +369,8 @@ MODULE_DEVICE_TABLE(i2c, tpm_tis_i2c_id);
 #ifdef CONFIG_OF
 static const struct of_device_id of_tis_i2c_match[] = {
 	{ .compatible = "infineon,slb9673", },
+	{ .compatible = "nuvoton,npct75x", },
+	{ .compatible = "tcg,tpm-tis-i2c", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_tis_i2c_match);
-- 
2.37.1

