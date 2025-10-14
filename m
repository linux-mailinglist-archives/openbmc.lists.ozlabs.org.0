Return-Path: <openbmc+bounces-736-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAE7BD75A7
	for <lists+openbmc@lfdr.de>; Tue, 14 Oct 2025 07:03:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm2DB6rCSz2yrZ;
	Tue, 14 Oct 2025 16:03:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760418202;
	cv=none; b=DQ/PASbmVaAPjG8LnlrAUqKGu6bgNS45I/w8P3ZzYyM5Kqlom4D0QbemjSSFJETGs3Oz3Lor6VI7yi1tcpoyQzglVYjUoDMjPdv8B0YdhyFgx3mf637xDs5JpiDgUHpHEjSd4k6ZmCuMOKUNlcZcSutY37Mw98mS41msM1yS1kl8iXzxr6v8oDM6DJ4ymFOl2a5A2hP8DHZ02hbOwxV59Ej0EMIrl8pJC6PTfC2D0QZLXdMW2TYYpPIzNZqU1FGCE+sgQLoKSeA2hpDi0dduULOHJch2+qpA4oFWE6mGPXfyTXFhWWWv08bOkBxB92+7epcZ8wwiHuo1a1SupmgHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760418202; c=relaxed/relaxed;
	bh=8YuxpXWU7E8X2YYDz33xExfZqbznPCZyFwslB8dHILY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSz0xJxS7hn6ippuHtUy5+uHwuY56K0tIp5/veN04cL8Om/FhJgNy1x3SABxt/nMGR9W1xMAz4ALzwQfyrvqMacSE6XJDL4wKaJcrAUBoMxazJs1OZsk6i52YqRR3Hb7kQSPlz0U7Wm0gQLROfaEwYwubd2FSyrs0H/3dLnCu1MFX502batVDs6YIrFuq/iQVd2iXvcd4F3OSO9P+iDnNaM99dBC+wrbX/oJcPkyuHRH+4RFpchePR3u2kq8XS0wk5NDgdb5MzIe7HvTkDuwKGqPPB7CqDVCbONRj8M6IKla3Q1vNZ8WrvRTXDDopXmJTF2aAH5vMbLVN7AOlM8kJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CNI9zJA9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CNI9zJA9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cm2D920T8z2yr9
	for <openbmc@lists.ozlabs.org>; Tue, 14 Oct 2025 16:03:20 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-793021f348fso4466245b3a.1
        for <openbmc@lists.ozlabs.org>; Mon, 13 Oct 2025 22:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760418198; x=1761022998; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8YuxpXWU7E8X2YYDz33xExfZqbznPCZyFwslB8dHILY=;
        b=CNI9zJA9b6tGMRMDlogRE9nhyNgLCkWBW6GRC/iZQH19CDrVH3zXmsQdA0bEU7vo5s
         80AAz7URTYOqsPktzKkhZppxQorq+PrePuC3EwDg81izob5136W3BOvnOh9yw6h1o9Yn
         tkXOD22HxAomQLTNfZh65I/uW8rk18JJh5B7A2v8HuAGb9TMgLdFmMJ0aqvp1A3kL6qv
         zVyzRyzyr9TxzTHtzKd0/P+pLB3gwaPn/4J9daU42yN6UdJpjiefdU1JYHj+0eVYAxGX
         LAdcdWJ1QSv0wk4Au6NjqCxnFe8sCn3Jgaj/Lil9pzINsHUptRWOk1JLUXwucG/7ICrm
         lmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760418198; x=1761022998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YuxpXWU7E8X2YYDz33xExfZqbznPCZyFwslB8dHILY=;
        b=M5dAHuLI6x2VY+pcz4XMyNT80YUeITWoR2aV2MORKYxTh35PWuvNakHR8GOHn84PUL
         Dwl7DQ+XG8RP96IFi1IHYvTIiOc2f3768269GvknVODdw5VB9q2WosaozHlBx8d2yR0D
         7qpyBSY6eQYBzRhvrauaaQg0Z9OpvUsD6AzhiPUGSfJK17vm7UmIGXU+rp2+91JuIofK
         cByihZ9+pIFDTcLPdxP1pl/fhyjzV5uGoE6vshB3thucophWw0KCh3OvRw6QZ2hh6+8k
         E65MuQMgoreZdmLalbg9HieU29dVmIhG2vEDg+YSQ/LaYLonvmye5a1LkqFdknWgVoch
         GX+w==
X-Forwarded-Encrypted: i=1; AJvYcCXecF0I71YkITmE6395+SNXHJLSLU4FxBNxh4Kpp+hBS96vNfKbHeHWukDZVeqltCyReEvrJobE@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwmgsR4CgCLE/CkELo3I4+48d0doic9pxlRg5bFRZsIKeSbxvXk
	7TlGkAiE3aXVqCYDkpKQp/4gaFhhykUnlFC873wLFrXNuzekqF3pw48iEV7y2g==
X-Gm-Gg: ASbGncvphhOoIIIR9mVKhYfF7SsKibQNfYCksge0f+wWKsdXi2+RiwheDBBdtboqA1x
	KxFyTgbXvLTqs6ad+H3i5u1v3RFwjAZfRfyO2RRAB6hHC2Wi3ZrxTiPtSUus+e9hJngkKgfIGK3
	tr0ahDwr4mt9sBqqeXdzJGBgQz3dCARxSMvHY+4e8AGy5DdKuIKYZ/k3HuP0+mtsA2VCPI2LBzR
	2RIvwEPI7kcvSoV9w6huKMbYpgFbASOQDZ3piHncEu9ttNscTi2UGN+XL0W2LWW/k3JcWZcoJ76
	1ZSNAUKx4SN4baS3BAoI9ACPJwyvAI5Q7P1mzPb27i3RIcmk0aqrLtzrMKfyQH2gCY73Uk25YBV
	KME+Zm6cLqTez8zT58fUdQPFL8mkpiycDFC8KUCVTcu0fZ+jLuKlJIP7zeNAvUmNF0UicDdf0Xy
	dPTh01XvfmcyjiVMRgvNO+Pkb64kRUiz4sixmVS1DXMPpM7JGhI/waM8Q8jQuosIo=
X-Google-Smtp-Source: AGHT+IEyUukKtV5VV9AfEbv0lvt+2foGQ7uC+ERxXlhcakRp/fTYqEX+QtIlALIRc2os5CMigvWcEw==
X-Received: by 2002:a05:6a20:748c:b0:2fb:62bb:dfc with SMTP id adf61e73a8af0-32da83e3953mr30784125637.28.1760418198039;
        Mon, 13 Oct 2025 22:03:18 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df48a83sm11361562a12.31.2025.10.13.22.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 22:03:17 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH linux dev-6.12] mtd: spi-nor: winbond: Add support for w25q01jv
Date: Tue, 14 Oct 2025 13:01:08 +0800
Message-ID: <20251014050108.665338-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Miquel Raynal <miquel.raynal@bootlin.com>

Add support for Winbond w25q01jv spi-nor chip.

This chip is internally made of two dies with linear addressing
capabilities to make it transparent to the user that two dies were
used. There is one drawback however, the read status operation is racy
as the status bit only gives the active die status and not the status of
the other die. For commands affecting the two dies, it means if another
command is sent too fast after the first die has returned a valid status
(deviation can be up to 200us), the chip will get corrupted/in an
unstable state.

This chip hence requires a better status register read. There are three
solutions here:

1- If we assume that the most common situation producing this problem is
status register writes, maybe we could change the "non-volatile"
status register write commands to become "volatile" status register
writes. In practice, what takes time is the write operation of the bits
themselves, and not the activation of the feature in the internal
circuitry. Enabling "volatile" status register writes would make the
writes nearly instant.

This approach, besides probably being the less impacting one, could
overlook other possible actions where both dies can be used at the same
time like a chip erase (or any erase over die boundaries in general).

2- Wait about 200us after getting a first status ready feedback. This
200us is about the maximum possible deviation between dies and would
cover all cases.

3- We iterate manually over all internal dies (which takes about 30us
per die) until all are ready. This approach will always be faster than
a blind delay which represents the maximum deviation, while also being
totally safe.

This third approach has been adopted. A flash-specific hook for the
status register read had to be implemented. Testing with the flash_speed
benchmark shown no difference with the existing performances (using the
regular status read core function). In practice there are difference in
the experimental results below, but they are part of the natural
deviation of the benchmark:

	> Without the fixup
	$ flash_speed /dev/mtd0 -c100 -d
	eraseblock write speed is 442 KiB/s
	eraseblock read speed is 1606 KiB/s
	page write speed is 439 KiB/s
	page read speed is 1520 KiB/s
	2 page write speed is 441 KiB/s
	2 page read speed is 1562 KiB/s
	erase speed is 68 KiB/s

	> With the fixup
	$ flash_speed /dev/mtd0 -c100 -d
	eraseblock write speed is 428 KiB/s
	eraseblock read speed is 1626 KiB/s
	page write speed is 426 KiB/s
	page read speed is 1538 KiB/s
	2 page write speed is 426 KiB/s
	2 page read speed is 1574 KiB/s
	erase speed is 66 KiB/s

However, the fixup, whatever which one we pick, must be applied on
multi-die chips, which hence must be properly flagged. The SFDP tables
implemented give a lot of information but the die details are part of an
optional table that is not implemented, hence we use a post parsing
fixup hook to set the params->n_dice value manually.

Link: https://www.winbond.com/resource-files/W25Q01JV%20SPI%20RevE%2003042024%20Plus.pdf
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
Link: https://lore.kernel.org/r/20250110-winbond-6-12-rc1-nor-volatile-bit-v3-1-735363f8cc7d@bootlin.com
---
 drivers/mtd/spi-nor/winbond.c | 84 +++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 8d0a00d69e12..a4c0d99dde4f 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -10,6 +10,7 @@
 
 #define WINBOND_NOR_OP_RDEAR	0xc8	/* Read Extended Address Register */
 #define WINBOND_NOR_OP_WREAR	0xc5	/* Write Extended Address Register */
+#define WINBOND_NOR_OP_SELDIE	0xc2	/* Select active die */
 
 #define WINBOND_NOR_WREAR_OP(buf)					\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_WREAR, 0),		\
@@ -17,6 +18,12 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
 
+#define WINBOND_NOR_SELDIE_OP(buf)					\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_SELDIE, 0),		\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
+
 static int
 w25q128_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
@@ -66,6 +73,79 @@ static const struct spi_nor_fixups w25q256_fixups = {
 	.post_bfpt = w25q256_post_bfpt_fixups,
 };
 
+/**
+ * winbond_nor_select_die() - Set active die.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @die:	die to set active.
+ *
+ * Certain Winbond chips feature more than a single die. This is mostly hidden
+ * to the user, except that some chips may experience time deviation when
+ * modifying the status bits between dies, which in some corner cases may
+ * produce problematic races. Being able to explicitly select a die to check its
+ * state in this case may be useful.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int winbond_nor_select_die(struct spi_nor *nor, u8 die)
+{
+	int ret;
+
+	nor->bouncebuf[0] = die;
+
+	if (nor->spimem) {
+		struct spi_mem_op op = WINBOND_NOR_SELDIE_OP(nor->bouncebuf);
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor,
+						       WINBOND_NOR_OP_SELDIE,
+						       nor->bouncebuf, 1);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d selecting die %d\n", ret, die);
+
+	return ret;
+}
+
+static int winbond_nor_multi_die_ready(struct spi_nor *nor)
+{
+	int ret, i;
+
+	for (i = 0; i < nor->params->n_dice; i++) {
+		ret = winbond_nor_select_die(nor, i);
+		if (ret)
+			return ret;
+
+		ret = spi_nor_sr_ready(nor);
+		if (ret <= 0)
+			return ret;
+	}
+
+	return 1;
+}
+
+static int
+winbond_nor_multi_die_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/*
+	 * SFDP supports dice numbers, but this information is only available in
+	 * optional additional tables which are not provided by these chips.
+	 * Dice number has an impact though, because these devices need extra
+	 * care when reading the busy bit.
+	 */
+	nor->params->n_dice = nor->params->size / SZ_64M;
+	nor->params->ready = winbond_nor_multi_die_ready;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_nor_multi_die_fixups = {
+	.post_sfdp = winbond_nor_multi_die_post_sfdp_fixups,
+};
+
 static const struct flash_info winbond_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xef, 0x30, 0x10),
@@ -145,6 +225,10 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512jvq",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		/* W25Q01JV */
+		.id = SNOR_ID(0xef, 0x40, 0x21),
+		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x50, 0x12),
 		.name = "w25q20bw",
-- 
2.43.0


