Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B90675807D0
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 00:52:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsFfz4m44z3bsy
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 08:52:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm1 header.b=lNGJWEWw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LFPJCHPh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=64.147.123.27; helo=wnew2-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm1 header.b=lNGJWEWw;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LFPJCHPh;
	dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsFfT23bQz3bZP
	for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 08:51:59 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.west.internal (Postfix) with ESMTP id 4BE872B05BB3;
	Mon, 25 Jul 2022 18:51:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 25 Jul 2022 18:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1658789514; x=1658793114; bh=f5QJnoQ+V1
	Scs+zkQ6jpMWcDfCBNhIEVCqAhufSDrEA=; b=lNGJWEWwyNsVEmOJE5/MdHp0yv
	Ttq431g5NjIEtXsddXyuoOxm4atJcWH46BkjcmVjMbvtbmv9sBUlTFaqE90QBvIT
	PhT6QXFs7Wc8w1fXEf8DBAeJ3H3ou8xSFYBLkkU+32vI/Gp18YpXgeVD9vPMQVA+
	WaAkJb0FyM20YRXoh2E2MkBZbyPnbg/KsOh0dEn26n0O4JOsX0MtqXWZSo14nUL/
	nFjVNZKPgMg4+ZLqTUoxX6/vQ3RPpKYy1jDKRRgLtjqHMBu0DbWQZ6X1GxlOfOLs
	BVYwVjEdyeqomM0nIXJ6GimRo0RKJcvXLdMVtkhm3TwxuS0tmdCMWDVXe48g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658789514; x=1658793114; bh=f5QJnoQ+V1Scs+zkQ6jpMWcDfCBN
	hIEVCqAhufSDrEA=; b=LFPJCHPh8mn4xOn4G+HYnLDeuNStqIv4fP/vHafb6IIi
	lZ7ihcmQoh3fp5j3nAXnTVWbWinImBISDMZ38uBeQXa2N0ahefifVfwhuqtsqBXy
	Wz9qLlkyyRIXfBlad5c8R0Px6xkih9YMnzWyXWZhGUrQdAvXr4d5hfH3qG6iFBPW
	Amlv2Yasdc8iZDcliMaXp9bACyRmLSZsNfc2tGpjObWvX6Ph0ncSlomAlXEeYNMG
	hRal11EB+x7rsrrfNPDD/op1aGROOQ4R9GIkA0LOPwW+JhWgpoqK61/zlXYKV+Hs
	PVtJdMwlVNQbdhPgOIUrpk7ta/wfk9LmDuBM3BfTHg==
X-ME-Sender: <xms:ih7fYhRcvSVxJocXc2ukJAY57WS56Aa6Wfp2r-mEC9fP3IMbcJlOFA>
    <xme:ih7fYqxIwLTD3pVHyeTvgtrgeKax2qMwc6HgQLZPv_f3aR5TpWHO_RHvPrDTSDMtB
    kwy_UDHTxTmJM293Zs>
X-ME-Received: <xmr:ih7fYm3RGdUTgXsOc3sSGMWCrInUHmWG3XzhtUAhJMr-t-2nBQeDsjj_kvs2fQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofggtgfgsehtkeertd
    ertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehp
    jhgurdguvghvqeenucggtffrrghtthgvrhhnpeejgffflefguefgtddtteekgeffkedtff
    egjeeuueejvdeugfehgfdtjedvteffleenucffohhmrghinhepghhithhhuhgsrdgtohhm
    pdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:ih7fYpCFhcmKTS4_NWS6Yr82YDHVHGmXLJQa8nBNyRB57Qj62OTLjw>
    <xmx:ih7fYqgC3QDTdynN01-FaRtTN-XnPfBX38MT-m2M_ctklKKBLJU4MQ>
    <xmx:ih7fYtqtQ5K-dtev4GqHTG-5ntNfa7yCCdHGN1-sH2vKEsOTE5O6mA>
    <xmx:ih7fYtu8NtiLg4-ezmeNkbCQfiwpzogPmso2Cm08p7rqbmGMelpvJor6FHs>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 18:51:53 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: peter@pjd.dev,
	patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 0/1] tpm_tis_i2c: Fix -Wdeclaration-after-statement
Date: Mon, 25 Jul 2022 15:51:50 -0700
Message-Id: <20220725225151.393384-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hey Joel,

I've been trying to build fby35 from https://github.com/openbmc/openbmc, and I
noticed that the TPM TIS I2C file seems to emit a warning that causes a
compilation error:

../drivers/char/tpm/tpm_tis_i2c.c: In function ‘tpm_tis_i2c_write_bytes’:
../drivers/char/tpm/tpm_tis_i2c.c:114:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
  114 |                 struct i2c_msg msgs[] = {
      |                 ^~~~~~

I'm sending this patch as a fix for the warning, to avoid the compilation error.

Normally I think I would send this to the upstream kernel mailing list, but
this file doesn't actually seem to be in the upstream at any point:

    drivers/char/tpm/tpm_tis_i2c.c

It looks like it was added by Nuvoton and never upstreamed successfully? Perhaps
we should get rid of it at this point? fby35 doesn't actually use the TPM TIS
I2C interface, it uses the SPI one. Bletchley doesn't use the I2C one either.
Only older FB platforms did.

Actually, doing a quick search on lore.kernel.org: It looks like maybe there's
a new version submitted by Infineon in June:

    https://lore.kernel.org/all/20220608173113.9232-1-Alexander.Steffen@infineon.com/

If fby35 wants to avoid this error, should we fix the driver, remove it from the
kernel, pull in the new driver from upstream, or maybe just disable it in the
linux-aspeed tpm2 distro feature Kconfig?

Thanks,
Peter

Peter Delevoryas (1):
  tpm_tis_i2c: Fix -Wdeclaration-after-statement

 drivers/char/tpm/tpm_tis_i2c.c | 36 ++++++++++++----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

-- 
2.37.1

