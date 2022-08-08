Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E68658D008
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 00:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1r510KWLz3bZY
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 08:11:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=iPVKYkrR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=QWGKRoc/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=iPVKYkrR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=QWGKRoc/;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1r2K3S01z2xGr
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 08:08:56 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 8D22A5815F4;
	Mon,  8 Aug 2022 18:08:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 08 Aug 2022 18:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1659996534; x=1660000134; bh=6L
	e5dw3ZMMhsCphJhgIGwVqGcvmegpsz96T/larvV/4=; b=iPVKYkrREoV+dip+NU
	HOpVwYyWiUNM01BxrMJPHLMz8uoj9mpc1ocP8bTUFOaP0wyjmnDXcLMQcwVJ88rO
	7i630m7LrQFroOAaS5ZdT6NnCv4XCp2ZIqygnLRzxlrtwO19HCw48sBzMSbdRr9+
	h0kjKuW3akeuYSTYq35jHiba4EPZHurBfOvm+PvNSPN83unNn99qH0nortozeMra
	8OXPzEgPMaSFtWDbHpM7uFnZFNbtUeqIrEHYtJIBS1b6ZkfujeibwzkE5HFaOWEn
	I2fkPJNW0mWjXHa9wSK9IrkF8ge7ND1J4XjKeNCs4hBnINBdoH3eVCOrZB6Bmku0
	7jyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1659996534; x=1660000134; bh=6Le5dw3ZMMhsC
	phJhgIGwVqGcvmegpsz96T/larvV/4=; b=QWGKRoc/+/5+YmXZ+cmxohZxVcr1S
	6oToEAy88XgIB812QFsTiqpLOD+C65UlZGaWcJcdgsDGlUfUmgk355jqVGs/Ybk4
	PpxfWuHQa8Jaw8m9k6uOk/h6Lt1n/stUA0URPFNELSjRuWiDEHmcNSZ05w9Tlknt
	oKPG91ZUf07X+0rRKVDlXzuekzwhHWYCfhW6vrSgveItzbv7ZGS+UnsASw/z0KGS
	qPPB3kqOKsFmk+3fnoUn6UzfCzA+154Tw1WPRq1QGlonWxGyTEpVh5NSd3iL0WLU
	rgaty8RtKGuERC4IKRTFVEWGyEgOPkjPnWp0SzeEmfId+KwOji573NixA==
X-ME-Sender: <xms:dYnxYtDoufswHulQ_UJ7gspsQB2OLYG8lDU51bEbwMeyPPqFrXcWCw>
    <xme:dYnxYrgcCX1U7HV6D7TouODoHoSWlBOB8-6pq_3mJhFLfmytEVr_pCpPiAGOTYUv0
    S7sHfIuF8ArWneNqbY>
X-ME-Received: <xmr:dYnxYonirm1CAQ3U8TTH1wRciHBvbI_xTEBguHX5Mn4r06Fnb_l9-6z7NU_OXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
    dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
    redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
    esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
    uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:dYnxYnz2LLxEf0gS7CBaHQhQgdRNHK0-j23vBXcyC6ivSVN3tlV3Mg>
    <xmx:dYnxYiQfLIO9Xknd4KOLlNIpbrsx6FP76bp4rAPp_cBjCdt3E43CCQ>
    <xmx:dYnxYqY22uvXdu32Rr25z3w9hKQVatEliRHCemiht0lwQTDcjltDpg>
    <xmx:donxYgeLuNRjMkL6rMvgsTGWBTHLLKkJPe1g8xXNFPw7mfdJ1f7CTQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 18:08:53 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Subject: [PATCH 2/7] tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
Date: Mon,  8 Aug 2022 15:08:34 -0700
Message-Id: <20220808220839.1006341-3-peter@pjd.dev>
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

From: Johannes Holland <johannes.holland@infineon.com>

Only tpm_tis and tpm_tis_synquacer have a dedicated way to access
multiple bytes at once, every other driver will just fall back to
read_bytes/write_bytes. Therefore, remove the read16/read32/write32
calls and move their logic to read_bytes/write_bytes.

Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Johannes Holland <johannes.holland@infineon.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 drivers/char/tpm/tpm_tis.c           | 67 +++++++++----------
 drivers/char/tpm/tpm_tis_core.h      | 58 ++++++++++++----
 drivers/char/tpm/tpm_tis_spi.h       |  4 --
 drivers/char/tpm/tpm_tis_spi_cr50.c  |  7 +-
 drivers/char/tpm/tpm_tis_spi_main.c  | 45 +------------
 drivers/char/tpm/tpm_tis_synquacer.c | 98 +++++++++++-----------------
 6 files changed, 118 insertions(+), 161 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index d3f2e5364c27..bcff6429e0b4 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -153,50 +153,46 @@ static int check_acpi_tpm2(struct device *dev)
 #endif
 
 static int tpm_tcg_read_bytes(struct tpm_tis_data *data, u32 addr, u16 len,
-			      u8 *result)
+			      u8 *result, enum tpm_tis_io_mode io_mode)
 {
 	struct tpm_tis_tcg_phy *phy = to_tpm_tis_tcg_phy(data);
-
-	while (len--)
-		*result++ = ioread8(phy->iobase + addr);
+	__le16 result_le16;
+	__le32 result_le32;
+
+	switch (io_mode) {
+	case TPM_TIS_PHYS_8:
+		while (len--)
+			*result++ = ioread8(phy->iobase + addr);
+		break;
+	case TPM_TIS_PHYS_16:
+		result_le16 = cpu_to_le16(ioread16(phy->iobase + addr));
+		memcpy(result, &result_le16, sizeof(u16));
+		break;
+	case TPM_TIS_PHYS_32:
+		result_le32 = cpu_to_le32(ioread32(phy->iobase + addr));
+		memcpy(result, &result_le32, sizeof(u32));
+		break;
+	}
 
 	return 0;
 }
 
 static int tpm_tcg_write_bytes(struct tpm_tis_data *data, u32 addr, u16 len,
-			       const u8 *value)
+			       const u8 *value, enum tpm_tis_io_mode io_mode)
 {
 	struct tpm_tis_tcg_phy *phy = to_tpm_tis_tcg_phy(data);
 
-	while (len--)
-		iowrite8(*value++, phy->iobase + addr);
-
-	return 0;
-}
-
-static int tpm_tcg_read16(struct tpm_tis_data *data, u32 addr, u16 *result)
-{
-	struct tpm_tis_tcg_phy *phy = to_tpm_tis_tcg_phy(data);
-
-	*result = ioread16(phy->iobase + addr);
-
-	return 0;
-}
-
-static int tpm_tcg_read32(struct tpm_tis_data *data, u32 addr, u32 *result)
-{
-	struct tpm_tis_tcg_phy *phy = to_tpm_tis_tcg_phy(data);
-
-	*result = ioread32(phy->iobase + addr);
-
-	return 0;
-}
-
-static int tpm_tcg_write32(struct tpm_tis_data *data, u32 addr, u32 value)
-{
-	struct tpm_tis_tcg_phy *phy = to_tpm_tis_tcg_phy(data);
-
-	iowrite32(value, phy->iobase + addr);
+	switch (io_mode) {
+	case TPM_TIS_PHYS_8:
+		while (len--)
+			iowrite8(*value++, phy->iobase + addr);
+		break;
+	case TPM_TIS_PHYS_16:
+		return -EINVAL;
+	case TPM_TIS_PHYS_32:
+		iowrite32(le32_to_cpu(*((__le32 *)value)), phy->iobase + addr);
+		break;
+	}
 
 	return 0;
 }
@@ -204,9 +200,6 @@ static int tpm_tcg_write32(struct tpm_tis_data *data, u32 addr, u32 value)
 static const struct tpm_tis_phy_ops tpm_tcg = {
 	.read_bytes = tpm_tcg_read_bytes,
 	.write_bytes = tpm_tcg_write_bytes,
-	.read16 = tpm_tcg_read16,
-	.read32 = tpm_tcg_read32,
-	.write32 = tpm_tcg_write32,
 };
 
 static int tpm_tis_init(struct device *dev, struct tpm_info *tpm_info)
diff --git a/drivers/char/tpm/tpm_tis_core.h b/drivers/char/tpm/tpm_tis_core.h
index 3be24f221e32..6c203f36b8a1 100644
--- a/drivers/char/tpm/tpm_tis_core.h
+++ b/drivers/char/tpm/tpm_tis_core.h
@@ -104,54 +104,88 @@ struct tpm_tis_data {
 	unsigned int timeout_max; /* usecs */
 };
 
+/*
+ * IO modes to indicate how many bytes should be read/written at once in the
+ * tpm_tis_phy_ops read_bytes/write_bytes calls. Use TPM_TIS_PHYS_8 to
+ * receive/transmit byte-wise, TPM_TIS_PHYS_16 for two bytes etc.
+ */
+enum tpm_tis_io_mode {
+	TPM_TIS_PHYS_8,
+	TPM_TIS_PHYS_16,
+	TPM_TIS_PHYS_32,
+};
+
 struct tpm_tis_phy_ops {
+	/* data is passed in little endian */
 	int (*read_bytes)(struct tpm_tis_data *data, u32 addr, u16 len,
-			  u8 *result);
+			  u8 *result, enum tpm_tis_io_mode mode);
 	int (*write_bytes)(struct tpm_tis_data *data, u32 addr, u16 len,
-			   const u8 *value);
-	int (*read16)(struct tpm_tis_data *data, u32 addr, u16 *result);
-	int (*read32)(struct tpm_tis_data *data, u32 addr, u32 *result);
-	int (*write32)(struct tpm_tis_data *data, u32 addr, u32 src);
+			   const u8 *value, enum tpm_tis_io_mode mode);
 };
 
 static inline int tpm_tis_read_bytes(struct tpm_tis_data *data, u32 addr,
 				     u16 len, u8 *result)
 {
-	return data->phy_ops->read_bytes(data, addr, len, result);
+	return data->phy_ops->read_bytes(data, addr, len, result,
+					 TPM_TIS_PHYS_8);
 }
 
 static inline int tpm_tis_read8(struct tpm_tis_data *data, u32 addr, u8 *result)
 {
-	return data->phy_ops->read_bytes(data, addr, 1, result);
+	return data->phy_ops->read_bytes(data, addr, 1, result, TPM_TIS_PHYS_8);
 }
 
 static inline int tpm_tis_read16(struct tpm_tis_data *data, u32 addr,
 				 u16 *result)
 {
-	return data->phy_ops->read16(data, addr, result);
+	__le16 result_le;
+	int rc;
+
+	rc = data->phy_ops->read_bytes(data, addr, sizeof(u16),
+				       (u8 *)&result_le, TPM_TIS_PHYS_16);
+	if (!rc)
+		*result = le16_to_cpu(result_le);
+
+	return rc;
 }
 
 static inline int tpm_tis_read32(struct tpm_tis_data *data, u32 addr,
 				 u32 *result)
 {
-	return data->phy_ops->read32(data, addr, result);
+	__le32 result_le;
+	int rc;
+
+	rc = data->phy_ops->read_bytes(data, addr, sizeof(u32),
+				       (u8 *)&result_le, TPM_TIS_PHYS_32);
+	if (!rc)
+		*result = le32_to_cpu(result_le);
+
+	return rc;
 }
 
 static inline int tpm_tis_write_bytes(struct tpm_tis_data *data, u32 addr,
 				      u16 len, const u8 *value)
 {
-	return data->phy_ops->write_bytes(data, addr, len, value);
+	return data->phy_ops->write_bytes(data, addr, len, value,
+					  TPM_TIS_PHYS_8);
 }
 
 static inline int tpm_tis_write8(struct tpm_tis_data *data, u32 addr, u8 value)
 {
-	return data->phy_ops->write_bytes(data, addr, 1, &value);
+	return data->phy_ops->write_bytes(data, addr, 1, &value,
+					  TPM_TIS_PHYS_8);
 }
 
 static inline int tpm_tis_write32(struct tpm_tis_data *data, u32 addr,
 				  u32 value)
 {
-	return data->phy_ops->write32(data, addr, value);
+	__le32 value_le;
+	int rc;
+
+	value_le = cpu_to_le32(value);
+	rc =  data->phy_ops->write_bytes(data, addr, sizeof(u32),
+					 (u8 *)&value_le, TPM_TIS_PHYS_32);
+	return rc;
 }
 
 static inline bool is_bsw(void)
diff --git a/drivers/char/tpm/tpm_tis_spi.h b/drivers/char/tpm/tpm_tis_spi.h
index bba73979c368..d0f66f6f1931 100644
--- a/drivers/char/tpm/tpm_tis_spi.h
+++ b/drivers/char/tpm/tpm_tis_spi.h
@@ -31,10 +31,6 @@ extern int tpm_tis_spi_init(struct spi_device *spi, struct tpm_tis_spi_phy *phy,
 extern int tpm_tis_spi_transfer(struct tpm_tis_data *data, u32 addr, u16 len,
 				u8 *in, const u8 *out);
 
-extern int tpm_tis_spi_read16(struct tpm_tis_data *data, u32 addr, u16 *result);
-extern int tpm_tis_spi_read32(struct tpm_tis_data *data, u32 addr, u32 *result);
-extern int tpm_tis_spi_write32(struct tpm_tis_data *data, u32 addr, u32 value);
-
 #ifdef CONFIG_TCG_TIS_SPI_CR50
 extern int cr50_spi_probe(struct spi_device *spi);
 #else
diff --git a/drivers/char/tpm/tpm_tis_spi_cr50.c b/drivers/char/tpm/tpm_tis_spi_cr50.c
index ea759af25634..6d3092e2df46 100644
--- a/drivers/char/tpm/tpm_tis_spi_cr50.c
+++ b/drivers/char/tpm/tpm_tis_spi_cr50.c
@@ -206,13 +206,13 @@ static int tpm_tis_spi_cr50_transfer(struct tpm_tis_data *data, u32 addr, u16 le
 }
 
 static int tpm_tis_spi_cr50_read_bytes(struct tpm_tis_data *data, u32 addr,
-				       u16 len, u8 *result)
+				       u16 len, u8 *result, enum tpm_tis_io_mode io_mode)
 {
 	return tpm_tis_spi_cr50_transfer(data, addr, len, result, NULL);
 }
 
 static int tpm_tis_spi_cr50_write_bytes(struct tpm_tis_data *data, u32 addr,
-					u16 len, const u8 *value)
+					u16 len, const u8 *value, enum tpm_tis_io_mode io_mode)
 {
 	return tpm_tis_spi_cr50_transfer(data, addr, len, NULL, value);
 }
@@ -220,9 +220,6 @@ static int tpm_tis_spi_cr50_write_bytes(struct tpm_tis_data *data, u32 addr,
 static const struct tpm_tis_phy_ops tpm_spi_cr50_phy_ops = {
 	.read_bytes = tpm_tis_spi_cr50_read_bytes,
 	.write_bytes = tpm_tis_spi_cr50_write_bytes,
-	.read16 = tpm_tis_spi_read16,
-	.read32 = tpm_tis_spi_read32,
-	.write32 = tpm_tis_spi_write32,
 };
 
 static void cr50_print_fw_version(struct tpm_tis_data *data)
diff --git a/drivers/char/tpm/tpm_tis_spi_main.c b/drivers/char/tpm/tpm_tis_spi_main.c
index aaa59a00eeae..d0920c3c400f 100644
--- a/drivers/char/tpm/tpm_tis_spi_main.c
+++ b/drivers/char/tpm/tpm_tis_spi_main.c
@@ -141,55 +141,17 @@ int tpm_tis_spi_transfer(struct tpm_tis_data *data, u32 addr, u16 len,
 }
 
 static int tpm_tis_spi_read_bytes(struct tpm_tis_data *data, u32 addr,
-				  u16 len, u8 *result)
+				  u16 len, u8 *result, enum tpm_tis_io_mode io_mode)
 {
 	return tpm_tis_spi_transfer(data, addr, len, result, NULL);
 }
 
 static int tpm_tis_spi_write_bytes(struct tpm_tis_data *data, u32 addr,
-				   u16 len, const u8 *value)
+				   u16 len, const u8 *value, enum tpm_tis_io_mode io_mode)
 {
 	return tpm_tis_spi_transfer(data, addr, len, NULL, value);
 }
 
-int tpm_tis_spi_read16(struct tpm_tis_data *data, u32 addr, u16 *result)
-{
-	__le16 result_le;
-	int rc;
-
-	rc = data->phy_ops->read_bytes(data, addr, sizeof(u16),
-				       (u8 *)&result_le);
-	if (!rc)
-		*result = le16_to_cpu(result_le);
-
-	return rc;
-}
-
-int tpm_tis_spi_read32(struct tpm_tis_data *data, u32 addr, u32 *result)
-{
-	__le32 result_le;
-	int rc;
-
-	rc = data->phy_ops->read_bytes(data, addr, sizeof(u32),
-				       (u8 *)&result_le);
-	if (!rc)
-		*result = le32_to_cpu(result_le);
-
-	return rc;
-}
-
-int tpm_tis_spi_write32(struct tpm_tis_data *data, u32 addr, u32 value)
-{
-	__le32 value_le;
-	int rc;
-
-	value_le = cpu_to_le32(value);
-	rc = data->phy_ops->write_bytes(data, addr, sizeof(u32),
-					(u8 *)&value_le);
-
-	return rc;
-}
-
 int tpm_tis_spi_init(struct spi_device *spi, struct tpm_tis_spi_phy *phy,
 		     int irq, const struct tpm_tis_phy_ops *phy_ops)
 {
@@ -205,9 +167,6 @@ int tpm_tis_spi_init(struct spi_device *spi, struct tpm_tis_spi_phy *phy,
 static const struct tpm_tis_phy_ops tpm_spi_phy_ops = {
 	.read_bytes = tpm_tis_spi_read_bytes,
 	.write_bytes = tpm_tis_spi_write_bytes,
-	.read16 = tpm_tis_spi_read16,
-	.read32 = tpm_tis_spi_read32,
-	.write32 = tpm_tis_spi_write32,
 };
 
 static int tpm_tis_spi_probe(struct spi_device *dev)
diff --git a/drivers/char/tpm/tpm_tis_synquacer.c b/drivers/char/tpm/tpm_tis_synquacer.c
index e47bdd272704..679196c61401 100644
--- a/drivers/char/tpm/tpm_tis_synquacer.c
+++ b/drivers/char/tpm/tpm_tis_synquacer.c
@@ -35,72 +35,53 @@ static inline struct tpm_tis_synquacer_phy *to_tpm_tis_tcg_phy(struct tpm_tis_da
 }
 
 static int tpm_tis_synquacer_read_bytes(struct tpm_tis_data *data, u32 addr,
-					u16 len, u8 *result)
+					u16 len, u8 *result,
+					enum tpm_tis_io_mode io_mode)
 {
 	struct tpm_tis_synquacer_phy *phy = to_tpm_tis_tcg_phy(data);
-
-	while (len--)
-		*result++ = ioread8(phy->iobase + addr);
+	switch (io_mode) {
+	case TPM_TIS_PHYS_8:
+		while (len--)
+			*result++ = ioread8(phy->iobase + addr);
+		break;
+	case TPM_TIS_PHYS_16:
+		result[1] = ioread8(phy->iobase + addr + 1);
+		result[0] = ioread8(phy->iobase + addr);
+		break;
+	case TPM_TIS_PHYS_32:
+		result[3] = ioread8(phy->iobase + addr + 3);
+		result[2] = ioread8(phy->iobase + addr + 2);
+		result[1] = ioread8(phy->iobase + addr + 1);
+		result[0] = ioread8(phy->iobase + addr);
+		break;
+	}
 
 	return 0;
 }
 
 static int tpm_tis_synquacer_write_bytes(struct tpm_tis_data *data, u32 addr,
-					 u16 len, const u8 *value)
+					 u16 len, const u8 *value,
+					 enum tpm_tis_io_mode io_mode)
 {
 	struct tpm_tis_synquacer_phy *phy = to_tpm_tis_tcg_phy(data);
-
-	while (len--)
-		iowrite8(*value++, phy->iobase + addr);
-
-	return 0;
-}
-
-static int tpm_tis_synquacer_read16_bw(struct tpm_tis_data *data,
-				       u32 addr, u16 *result)
-{
-	struct tpm_tis_synquacer_phy *phy = to_tpm_tis_tcg_phy(data);
-
-	/*
-	 * Due to the limitation of SPI controller on SynQuacer,
-	 * 16/32 bits access must be done in byte-wise and descending order.
-	 */
-	*result = (ioread8(phy->iobase + addr + 1) << 8) |
-		  (ioread8(phy->iobase + addr));
-
-	return 0;
-}
-
-static int tpm_tis_synquacer_read32_bw(struct tpm_tis_data *data,
-				       u32 addr, u32 *result)
-{
-	struct tpm_tis_synquacer_phy *phy = to_tpm_tis_tcg_phy(data);
-
-	/*
-	 * Due to the limitation of SPI controller on SynQuacer,
-	 * 16/32 bits access must be done in byte-wise and descending order.
-	 */
-	*result = (ioread8(phy->iobase + addr + 3) << 24) |
-		  (ioread8(phy->iobase + addr + 2) << 16) |
-		  (ioread8(phy->iobase + addr + 1) << 8) |
-		  (ioread8(phy->iobase + addr));
-
-	return 0;
-}
-
-static int tpm_tis_synquacer_write32_bw(struct tpm_tis_data *data,
-					u32 addr, u32 value)
-{
-	struct tpm_tis_synquacer_phy *phy = to_tpm_tis_tcg_phy(data);
-
-	/*
-	 * Due to the limitation of SPI controller on SynQuacer,
-	 * 16/32 bits access must be done in byte-wise and descending order.
-	 */
-	iowrite8(value >> 24, phy->iobase + addr + 3);
-	iowrite8(value >> 16, phy->iobase + addr + 2);
-	iowrite8(value >> 8, phy->iobase + addr + 1);
-	iowrite8(value, phy->iobase + addr);
+	switch (io_mode) {
+	case TPM_TIS_PHYS_8:
+		while (len--)
+			iowrite8(*value++, phy->iobase + addr);
+		break;
+	case TPM_TIS_PHYS_16:
+		return -EINVAL;
+	case TPM_TIS_PHYS_32:
+		/*
+		 * Due to the limitation of SPI controller on SynQuacer,
+		 * 16/32 bits access must be done in byte-wise and descending order.
+		 */
+		iowrite8(value[3], phy->iobase + addr + 3);
+		iowrite8(value[2], phy->iobase + addr + 2);
+		iowrite8(value[1], phy->iobase + addr + 1);
+		iowrite8(value[0], phy->iobase + addr);
+		break;
+	}
 
 	return 0;
 }
@@ -108,9 +89,6 @@ static int tpm_tis_synquacer_write32_bw(struct tpm_tis_data *data,
 static const struct tpm_tis_phy_ops tpm_tcg_bw = {
 	.read_bytes	= tpm_tis_synquacer_read_bytes,
 	.write_bytes	= tpm_tis_synquacer_write_bytes,
-	.read16		= tpm_tis_synquacer_read16_bw,
-	.read32		= tpm_tis_synquacer_read32_bw,
-	.write32	= tpm_tis_synquacer_write32_bw,
 };
 
 static int tpm_tis_synquacer_init(struct device *dev,
-- 
2.37.1

