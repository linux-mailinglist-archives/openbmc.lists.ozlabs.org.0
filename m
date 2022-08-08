Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E658D00B
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 00:12:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1r6W6BSSz3bZs
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 08:12:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=g2SBMugt;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=S1sxygvn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=g2SBMugt;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=S1sxygvn;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1r2Q6Dfjz2xHH
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 08:09:02 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id EF4055815F2;
	Mon,  8 Aug 2022 18:09:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 08 Aug 2022 18:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1659996540; x=1660000140; bh=KN
	+q0y1iABj5NiCZUVEZz0OIvyX7/aQ7wOsnHocF5Uw=; b=g2SBMugt721ZnWVaDT
	Ko4tdheZf3QWuHGm1Tk/+kuypdW6szr17F/QW+qS4Ok1KmAd1V1YoLqgsZGHTnRX
	A497YOgTie69i6anyRaqe+nYD1uKfeyoTCEM2LrUwQxiNzvu9hRoPWTNj65T7SS2
	0Ocr/uvDqDN3Q+eeJY4QSE/+2dImI1jCXLh7HVD6Lt2Aa/5m4qMCMjeO4LTbIxcU
	yoQngNN9yttPcjwGbf4tEvjvTmNMX4F00Sy8MQA5qrBXkVtEIvdXFuQraEh/yHsk
	TZ0/xaRa+3L9amLtFMYXlUjHnvSTFap0+HDAuTD9mVu7TU0CcJ14BesPyOKQ1aCF
	U1UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1659996540; x=1660000140; bh=KN+q0y1iABj5N
	iCZUVEZz0OIvyX7/aQ7wOsnHocF5Uw=; b=S1sxygvn/5b5UqjxncAK/aD4QVKye
	JtJASIHBDPZT+eJ46ZjBngk9BPLyFlTkV2qVe6CGfY9+URBmVoiKJ1l/T/F4pfQU
	ZBGpMN25kafakdUc+3TycVCNEJ1ut7fHYerIU37CpBmUj7WPB/U8avx0pYSygfnk
	xZns8M+4/HSZOqJvtWZ3iTNx1Wi4cKV3Xg5VcPxX4urwHVZoYZ4qSNmJplj4uTyI
	en1TI2C2LshS4l32yr9Acunhg/psN/d6kSgVU7UfTahtVkx2EfqVogtaarl0Yfc9
	qJBAt1R5cSauA+dJFSJUwz2rO+GpcJOe6mHeUbCziXJtByUbk1OEG3lDQ==
X-ME-Sender: <xms:fInxYkXB1c2TFhYRb7NOmRJGy8BgwARszSX4zxYhoA66zznZNmzj4A>
    <xme:fInxYolkOfnyPX7EZ9X_YHRsdC58PLjeyHnVaylo53LBYG4qPAxOklhsx7rZYInNm
    O65O44ckvrJwECGTx0>
X-ME-Received: <xmr:fInxYoY8byF8FPPj60jH63OJksvv1Yy9ZPTf5XUudOzyFxCt52kP4O2kWjaNhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
    dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
    redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
    esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
    uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:fInxYjWVKHFnvoyc8FeSKlkytgb0NrKAG0_Z-4Ft1qicdqi7NM5bBQ>
    <xmx:fInxYunpdGOD9NNT7toQMeQcT3Z2mJ29a60j9DRWG6g5MffEM0-hVw>
    <xmx:fInxYoeKoZSyOyr6azBZht0DhFTLuc4PTeydMQoHTMqAUXe4ygNxRw>
    <xmx:fInxYggaCELEuRo_6ZBBUR_-3yqIXEFAMNcMA7bNpx2DkLTVpm6jmA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 18:09:00 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Subject: [PATCH 6/7] tpm: fix platform_no_drv_owner.cocci warning
Date: Mon,  8 Aug 2022 15:08:38 -0700
Message-Id: <20220808220839.1006341-7-peter@pjd.dev>
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

From: Yang Li <yang.lee@linux.alibaba.com>

Eliminate the following coccicheck warning:
./drivers/char/tpm/tpm_tis_i2c.c:379:3-8: No need to set .owner here.  The core will do it.

Remove .owner field if calls are used which set it automatically

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 drivers/char/tpm/tpm_tis_i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
index 8e0686fe4eb1..ba0911b1d1ff 100644
--- a/drivers/char/tpm/tpm_tis_i2c.c
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -376,7 +376,6 @@ MODULE_DEVICE_TABLE(of, of_tis_i2c_match);
 
 static struct i2c_driver tpm_tis_i2c_driver = {
 	.driver = {
-		.owner = THIS_MODULE,
 		.name = "tpm_tis_i2c",
 		.pm = &tpm_tis_pm,
 		.of_match_table = of_match_ptr(of_tis_i2c_match),
-- 
2.37.1

