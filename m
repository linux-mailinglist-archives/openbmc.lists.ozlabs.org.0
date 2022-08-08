Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11A58D00A
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 00:11:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1r5m712nz3bXn
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 08:11:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=tU34nOrA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=FczUkLLj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=tU34nOrA;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=FczUkLLj;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1r2M5gwpz2xH3
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 08:08:59 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id B2ABB5815F6;
	Mon,  8 Aug 2022 18:08:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 08 Aug 2022 18:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1659996537; x=1660000137; bh=/i
	3P4h/lp/Rw/oQ6KFugy0Qjo5uku2lEqN2IdNqoncA=; b=tU34nOrA34IfJ9VuJ3
	r27w1+8PQmQKyICfdb3620IaF/2Iz3krIkbr9VPTJ8U75IJwSKtZad4qF8FgfmQ/
	61Zr+lFEEZf4IoJpF4AZWjsjIqToWFCN9R+F8qUCNkwRTOBQyiQEd+jKluCBoEah
	S/EGfJV8vkfTlw4UZE3V5hjAmIFU2M/0gMT+HHm1OAEE0mVG+vDRSlqLI9UH/Pqd
	nT7PjG6hw9lF14F2tarHKaJNUo3fRCfWjUSAo3EGGcBkobT0VRZCvEdsfTKdr2J/
	Yyhj5VHKgSUOFeDCR7Cwy9fSuIDE+UiLlCdth8IEdwhmUiPP7sK0QWm/fCQHheFI
	TV4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1659996537; x=1660000137; bh=/i3P4h/lp/Rw/
	oQ6KFugy0Qjo5uku2lEqN2IdNqoncA=; b=FczUkLLj/gwODAy4XETXiFHMZHDfz
	IgeEMSa77asbol9GiqcvzC2t4/ek/Sdj/rsYNtMtl39BVywPMhf1J31kbW6w8Sx/
	sJRxu5slYlNHa5o2STHaU5Wcn1BZQ0VLs+hZl685CV+uk+nxfH96qgbw4DgfHzMb
	u715iQModYsCk50dj9doaqnSMzsZrSTdEXHsL1yFREZhtenUVmQ8oZ4rIB5uSbTu
	tkNJkYOw9JDnmeA2Lb9gS2IrwPm0FB0OQc5KSuxXz9B/U9APoEBZ4LzN5KbaWANV
	a4jDapf/i10nVfGeoQgim+A6Duk4p1JsMZqpBW92zX1AoxNzupob+sPTQ==
X-ME-Sender: <xms:eYnxYuaIqYkDK0oPifRMZAf1OX4YY6PWpl8pzmGDc5bvPirbJphP-g>
    <xme:eYnxYhYKLN4cyTuYFkzGrW98B7EYnpic0nM7lJ_iMzdQK6Mi1ym_SDq89RvVQ7JxO
    wzGzFpQYb8z6DLOm80>
X-ME-Received: <xmr:eYnxYo9neIHaTPrKWGTJ-CcF9Y2Rkd_kEsaLTMRy1L-VswQF-UB4zi06EGDAoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
    dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
    redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
    esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
    uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:eYnxYgr-BQxQ_f_0Smq6pAVZ3AmObAd15d_OUQ2uBVHbGxZaHPQ3Mg>
    <xmx:eYnxYprqRZqw_CYZSQH8MJFoIxpJzQVV4Aixqgkf72du0Q6jsflPDg>
    <xmx:eYnxYuTbadNVKASZPTbIIEOuF4epcYtEMph7Aln1ViJcOnbk3NdJXg>
    <xmx:eYnxYgVa1EmlZXJrqLtdkQBjjyH-E-BnyYJ3ArTWWhTucZ11_2FWCw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 18:08:57 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Subject: [PATCH 4/7] tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
Date: Mon,  8 Aug 2022 15:08:36 -0700
Message-Id: <20220808220839.1006341-5-peter@pjd.dev>
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

From: Alexander Steffen <Alexander.Steffen@infineon.com>

Some TPMs, e.g. those implementing the I2C variant of TIS, can verify
data transfers to/from the FIFO with a CRC. The CRC is calculated over
the entirety of the FIFO register. Since the phy_ops layer is not aware
when the core layer is done reading/writing the FIFO, CRC verification
must be triggered from the core layer. To this end, add an optional
phy_ops API call.

Co-developed-by: Johannes Holland <johannes.holland@infineon.com>
Signed-off-by: Johannes Holland <johannes.holland@infineon.com>
Signed-off-by: Alexander Steffen <Alexander.Steffen@infineon.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 drivers/char/tpm/tpm_tis_core.c | 14 ++++++++++++++
 drivers/char/tpm/tpm_tis_core.h | 10 ++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index d2fc3fe94146..21a706d8d737 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -294,6 +294,7 @@ static int tpm_tis_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 	int size = 0;
 	int status;
 	u32 expected;
+	int rc;
 
 	if (count < TPM_HEADER_SIZE) {
 		size = -EIO;
@@ -334,6 +335,13 @@ static int tpm_tis_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 		goto out;
 	}
 
+	rc = tpm_tis_verify_crc(priv, (size_t)size, buf);
+	if (rc < 0) {
+		dev_err(&chip->dev, "CRC mismatch for response.\n");
+		size = rc;
+		goto out;
+	}
+
 out:
 	tpm_tis_ready(chip);
 	return size;
@@ -439,6 +447,12 @@ static int tpm_tis_send_main(struct tpm_chip *chip, const u8 *buf, size_t len)
 	if (rc < 0)
 		return rc;
 
+	rc = tpm_tis_verify_crc(priv, len, buf);
+	if (rc < 0) {
+		dev_err(&chip->dev, "CRC mismatch for command.\n");
+		return rc;
+	}
+
 	/* go and do it */
 	rc = tpm_tis_write8(priv, TPM_STS(priv->locality), TPM_STS_GO);
 	if (rc < 0)
diff --git a/drivers/char/tpm/tpm_tis_core.h b/drivers/char/tpm/tpm_tis_core.h
index 6c203f36b8a1..66a5a13cd1df 100644
--- a/drivers/char/tpm/tpm_tis_core.h
+++ b/drivers/char/tpm/tpm_tis_core.h
@@ -121,6 +121,8 @@ struct tpm_tis_phy_ops {
 			  u8 *result, enum tpm_tis_io_mode mode);
 	int (*write_bytes)(struct tpm_tis_data *data, u32 addr, u16 len,
 			   const u8 *value, enum tpm_tis_io_mode mode);
+	int (*verify_crc)(struct tpm_tis_data *data, size_t len,
+			  const u8 *value);
 };
 
 static inline int tpm_tis_read_bytes(struct tpm_tis_data *data, u32 addr,
@@ -188,6 +190,14 @@ static inline int tpm_tis_write32(struct tpm_tis_data *data, u32 addr,
 	return rc;
 }
 
+static inline int tpm_tis_verify_crc(struct tpm_tis_data *data, size_t len,
+				     const u8 *value)
+{
+	if (!data->phy_ops->verify_crc)
+		return 0;
+	return data->phy_ops->verify_crc(data, len, value);
+}
+
 static inline bool is_bsw(void)
 {
 #ifdef CONFIG_X86
-- 
2.37.1

