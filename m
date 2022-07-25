Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D15807D3
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 00:53:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsFgl2yNPz3c1Q
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 08:53:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm1 header.b=KUchf/u6;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ctCr4m50;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=64.147.123.27; helo=wnew2-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm1 header.b=KUchf/u6;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ctCr4m50;
	dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsFfY0rgdz3bZP
	for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 08:52:04 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id C46EE2B05BB6;
	Mon, 25 Jul 2022 18:52:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 25 Jul 2022 18:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1658789522; x=
	1658793122; bh=Zt8KgH3T7tiNQ/dH7dVhL5HddYyDV+Q70NxRDUxCKTk=; b=K
	Uchf/u6NXlC8yxDvTiH00uHevsi8DawlPUwFSYVncYAbqERs/zuuVp/J81hu71sP
	cdo2xXlBrI4DiDodL1yJK+msuk90OxbpodbEVx2C4Y6er7ssHf45E9QWWaKNTZVM
	7RDZkrv6IIt7mbg+YY3DZp6Sbp2QVzFR2vE5eWt4TV7TPGKSE9cpvDdklufZMvwB
	43STIqdaslMRfeaQLCjAvHyY/6E6xB+g3cGqLHMJsDaEzc/43n22wXAHp0vlaP/B
	d0vcJaWMY1j32aINeFor6ltY+8oiE8i/pYGM6THPYt5FoRsKj+t73YLqbNvURm9R
	HCM9uYDpRODDcywhALVgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1658789522; x=1658793122; bh=Z
	t8KgH3T7tiNQ/dH7dVhL5HddYyDV+Q70NxRDUxCKTk=; b=ctCr4m50RkpClXk4f
	FQjkAeG/yCTZJsZsG5EKgpbKslCom63K8BU2AIY+dF+5n2zVXc2XPW72PBAsGuf0
	3BTWAjMjOTQRFWi+xPPU6VKc+m6kJuRWRSor1y6KDI2AEHnUGyN18Rqyob0QXCYq
	12i1kaLqbtUcufKkRJTDsh9mFsyvMpXfctxxG4og3/vDOwat2YwXh70+dxksUDdp
	yeqKklNt6C7DrwBuXpEE14wXDk1+unvhj3axjtuG8xLCiTwvJ7QyCiRvNJsDiQhz
	iRXFHWAf+VhCcqt5JFYP5gU1MzT8o0AQENHbTg3Kcl1y75rlr0TF7MEpisXoCJ98
	gtRbQ==
X-ME-Sender: <xms:kR7fYlvptWy3PN4LEZTRp3sw4LsOoJ0bG5yTcqMbe-GgqdO7v-EO1g>
    <xme:kR7fYuc59gqy_1alorp0fj5SXy-nOWyIccVe8bMoajUb3ADiAlhZ35JeRMFr_pEEe
    wr8AZp39JA5Gb2fmi0>
X-ME-Received: <xmr:kR7fYoyJMI2At7PcV3VtHtPQw7IR64F4573LlzGWmFRCAne2yyWqsXSgXsFIww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhggtgfgsehtke
    ertdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvghr
    sehpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeeuvddtgeeileeiueehteejhedvve
    fhffeuffegtdeigfekvdffleekieetfffhfeenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:kR7fYsPEMTM8Q20XUbO2Oe6IvO6kQR8uIQGD8GMBXWpmgOCMKjwefw>
    <xmx:kR7fYl-9_zzRwx1AubMMv2nlh_1DmA9efxorHjT8QipqLa3G8y3CQw>
    <xmx:kR7fYsWXgTMBs4WAojAlC3YBuOtXNhPRGXe5UCC_AMMr8CV3gRbj6Q>
    <xmx:kh7fYnJ3G9CABDKs4tMNv7PtLWWKWW17neWJplmGGRfYptqtKNluOPZPxGc>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 18:52:01 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: peter@pjd.dev,
	patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/1] tpm_tis_i2c: Fix -Wdeclaration-after-statement
Date: Mon, 25 Jul 2022 15:51:51 -0700
Message-Id: <20220725225151.393384-2-peter@pjd.dev>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220725225151.393384-1-peter@pjd.dev>
References: <20220725225151.393384-1-peter@pjd.dev>
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

If I try to build with CONFIG_TCG_TIS_I2C=y, I get the following
warning:

../drivers/char/tpm/tpm_tis_i2c.c: In function ‘tpm_tis_i2c_write_bytes’:
../drivers/char/tpm/tpm_tis_i2c.c:114:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
  114 |                 struct i2c_msg msgs[] = {
      |                 ^~~~~~

This just refactors the code slightly to avoid the warning. It shouldn't
really be any different behavior. In fact, I think the first call to
i2c_transfer() is wrong: it's sending 2 messages but only populating the
first one? That doesn't seem right. But, I'm not testing this change, so
I'll leave the behavior as-is.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 drivers/char/tpm/tpm_tis_i2c.c | 36 ++++++++++++----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
index 12984a3be327..0bc8a1cea554 100644
--- a/drivers/char/tpm/tpm_tis_i2c.c
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -101,6 +101,7 @@ static int tpm_tis_i2c_write_bytes(struct tpm_tis_data *data, u32 addr,
 				   u16 len, const u8 *value)
 {
 	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
+	struct i2c_msg msgs[2];
 	int ret = 0;
 	int i = 0;
 
@@ -111,14 +112,10 @@ static int tpm_tis_i2c_write_bytes(struct tpm_tis_data *data, u32 addr,
 		phy->iobuf[0] = address_to_register(addr);
 		memcpy(phy->iobuf + 1, value, len);
 
-		struct i2c_msg msgs[] = {
-			{
-				.addr = phy->i2c_client->addr,
-				.len = len + 1,
-				.buf = phy->iobuf,
-			},
-		};
-
+		memset(msgs, 0, sizeof(msgs));
+		msgs[0].addr = phy->i2c_client->addr;
+		msgs[0].len = len + 1;
+		msgs[0].buf = phy->iobuf;
 		do {
 			ret = i2c_transfer(phy->i2c_client->adapter,
 					   msgs, ARRAY_SIZE(msgs));
@@ -127,21 +124,14 @@ static int tpm_tis_i2c_write_bytes(struct tpm_tis_data *data, u32 addr,
 		} while (ret < 0 && i++ < TPM_RETRY);
 	} else {
 		u8 reg = address_to_register(addr);
-
-		struct i2c_msg msgs[] = {
-			{
-				.addr = phy->i2c_client->addr,
-				.len = sizeof(reg),
-				.buf = &reg,
-			},
-			{
-				.addr = phy->i2c_client->addr,
-				.len = len,
-				.buf = (u8 *)value,
-				.flags = I2C_M_NOSTART,
-			},
-		};
-
+		memset(msgs, 0, sizeof(msgs));
+		msgs[0].addr = phy->i2c_client->addr;
+		msgs[0].len = sizeof(reg);
+		msgs[0].buf = &reg;
+		msgs[1].addr = phy->i2c_client->addr;
+		msgs[1].len = len;
+		msgs[1].buf = (u8 *)value;
+		msgs[1].flags = I2C_M_NOSTART;
 		do {
 			ret = i2c_transfer(phy->i2c_client->adapter, msgs,
 					   ARRAY_SIZE(msgs));
-- 
2.37.1

