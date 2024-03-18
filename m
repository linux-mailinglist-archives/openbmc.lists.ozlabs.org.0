Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E484A87F13D
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 21:37:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z81rcp8E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz6984xspz3fFT
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 07:37:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z81rcp8E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz66k3Gctz3bsT
	for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2024 07:35:09 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-513d717269fso4950155e87.0
        for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 13:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710794105; x=1711398905; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvcDtkndjm/UBeE+GDj+OLBiaQohVsgFa07MB6FFitY=;
        b=Z81rcp8E7+nhzY7C1HPhVPgOA+gTpJKVviJkGpGMvAlysBGeBiZGVhDvYd48ddR7tJ
         L2irAJzKjn/ScP0e5b6t1bjN3dwgv6At/TxmTtDnve8wCkyl+vqDe/YCttY1Z0ULhFCz
         MF5RsJliSWLu/QYpuVh/HFNpwOxeVSNhInqP5jgOWRhDw4itdKHkTEH01ltLWyNX7kVg
         ibg81XBeAmKu1+cB5D+lCoJpZj2SNF8wg1AVo8fSlUpcn1O1ywjAkgZ0I5N8fBZkIVID
         JA0ehp/+ZquRWPhZ0Ui10pXhxkiizqNtnBtUg7UWKH38PjvXpI9nE+rmytgGbddWaTXm
         ynXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710794105; x=1711398905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvcDtkndjm/UBeE+GDj+OLBiaQohVsgFa07MB6FFitY=;
        b=g+oaATlxLEN23NoBCf24LjrVDBxH6u2QTOcXK/aZvMfbypfS22hKeyry0uiv6P4hCw
         95xpw1g38MTMsTrzRvSMsZ6jk4c7CmYISs/gaCU0Qh4CpLilZfA7gjl0qJTAT30nLa/6
         XAhMcuZ2iTGCjgZALSqxq4IoP40hqQqrGxHIWuN/ZZsHHH/+hqiAFaBjl2a0lL+hSxkO
         4wgVvZT0BOoeZLO9wfBgSNg2fScM37osJqbPyktMP/B8R6enER02U6vaaZokfV6oh/PD
         +laziE5X1ulZEWJ/QZPRB652On4YJ5/TBy9AL7ufGD7ABmh63a80J9mxx+pP4+sp2B3A
         PIng==
X-Gm-Message-State: AOJu0YwtQnW8Ucbp4DVjMLUBT0oxe39VAoR27n08BpTuaNlZCZZnVCKG
	SNJBc2xU7ttnszwvKjidYfFvVfxviJZQFkTRyOWaGda7WoKS8ogxPFZx8ffk2LQ=
X-Google-Smtp-Source: AGHT+IGViWZKxe+a6ZGSxRkfnKAwcAWUurVx2EJxRC6wsP+izTakg5XHY0FiWhgOZ3h6QXCwICNmAg==
X-Received: by 2002:ac2:4d81:0:b0:513:5bdb:10f7 with SMTP id g1-20020ac24d81000000b005135bdb10f7mr1924751lfe.14.1710794105059;
        Mon, 18 Mar 2024 13:35:05 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00513eaf392d8sm455979lfb.284.2024.03.18.13.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:35:04 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 42IKZ1tT029089;
	Mon, 18 Mar 2024 23:35:02 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 42IKZ1Ul029088;
	Mon, 18 Mar 2024 23:35:01 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH downstream-hack dev-6.6 2/6] usb:gadget:mass-storage: refactoring the SCSI command handling
Date: Mon, 18 Mar 2024 23:34:41 +0300
Message-Id: <20240318203445.29036-3-fercerpav@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318203445.29036-1-fercerpav@gmail.com>
References: <20240318203445.29036-1-fercerpav@gmail.com>
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
Cc: Paul Fertser <fercerpav@gmail.com>, Igor Kononenko <i.kononenko@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Igor Kononenko <i.kononenko@yadro.com>

Implements a universal way to define SCSI commands and configure
precheck handlers.

Tested: By probing the USBGadget Mass-Storage on the YADRO VEGMAN
BMC(AST2500) sample, each SCSI command was sent through HOST->BMC; the
USBGadget MassStorage debug print showed all sent commands works
properly.

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 567 ++++++++++---------
 drivers/usb/gadget/function/storage_common.h |   5 +
 2 files changed, 319 insertions(+), 253 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 01525f02293d..b86c2e0576bc 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -209,6 +209,138 @@ static const char fsg_string_interface[] = "Mass Storage";
 #include "storage_common.h"
 #include "f_mass_storage.h"
 
+
+/*------------------------------------------------------------------------*/
+
+/**
+ * @brief The handler of incoming CDB command
+ * @param cmd		- SCSI command number
+ * @param callback	- The callback of handle the incoming command
+ */
+#define CDB_REG_HANDLER(cmd, callback)                                         \
+	.command = (cmd), .do_command = (callback),                            \
+	.type = CDB_HANDLER_COMMON, .name = (#cmd)
+
+/**
+ * @brief The handler of incoming CDB command
+ * @param cmd		- SCSI command nubmer with fsg buffhd
+ * @param callback	- The callback of handle the incoming command
+ */
+#define CDB_REG_HANDLER_BUFFHD(cmd, callback)                                  \
+	.command = (cmd), .do_command_with_buffhd = (callback),                \
+	.type = CDB_HANDLER_FSG_BUFFHD, .name = (#cmd)
+
+/**
+ * @see CDB_REG_CHECKER_DS
+ * @details Register CDB command without additional check handler.
+ */
+#define CDB_REG_NO_CHECKER(cmd, si, dir, req)                                  \
+	.command = (cmd), .direction = (dir), .size_index = (si),              \
+	.medium_required = (req), .do_check_command = NULL,
+
+/**
+ * @brief Register the CDB command checker, which checks an incoming command
+ * by specified criteria.
+ * This validator will take care of the specified data size (DS)
+ *
+ * @param cmd	- SCSI command nubmer
+ * @param s		- CDB command size in bytes
+ * @param si	- The CDB command might have the recommended response size.
+ * This field indicates the size field index in the input CDB command
+ * buffer
+ * @param dir	- Direction of data transfer of requested CDB command
+ * @param mask  - Mask of relevant bytes in the input command buffer.
+ * The ordinal number of a bit in the mask indicates that a byte in the
+ * CDB command buffer might be present.
+ * If that ordinal number bit equals zero, only a zero value must be
+ * present in this original byte.
+ * @param req	- Indicates that medium MUST be present or might be optional
+ * @param ds	- If @param SI member is equal to @enum CDB_SIZE_MANUAL, than this
+ * field indicates the custom response buffer size
+ */
+#define CDB_REG_CHECKER_DS(cmd, s, si, dir, mask, req, ds)                     \
+	.command = (cmd), .size = (s), .size_index = (si), .direction = (dir), \
+	.valid_bytes_bitmask = (mask), .medium_required = (req),               \
+	.data_size_manual = (ds), .do_check_command = &check_command
+
+/**
+ * @see CDB_REG_CHECKER_DS
+ * @details The data size is zero.
+ * This macro can't be used with the @enum CDB_SIZE_MANUAL
+ */
+#define CDB_REG_CHECKER(cmd, s, si, dir, mask, req)                            \
+	CDB_REG_CHECKER_DS(cmd, s, si, dir, mask, req, 0)
+
+/**
+ * @see CDB_REG_CHECKER_DS
+ * @details The checker which registried by this macros will validate the input
+ * data size in blocks.
+ * Block size specified by MSF interface type, in the curlun->blksize.
+ */
+#define CDB_REG_CHECKER_BLK(cmd, s, si, dir, mask, req)                        \
+	CDB_REG_CHECKER_DS(cmd, s, si, dir, mask, req, 0),                     \
+		.do_check_command = &check_command_size_in_blocks
+
+/**
+ * @brief Field index of possible data length of output buffer size, which
+ * contains in the input CDB command buffer
+ */
+enum cdb_data_size_field {
+	CDB_SIZE_MANUAL = -2,
+	CDB_NO_SIZE_FIELD = -1,
+	CDB_SIZE_FIELD_4 = 4,
+	CDB_SIZE_FIELD_6 = 6,
+	CDB_SIZE_FIELD_7 = 7,
+	CDB_SIZE_FIELD_10 = 10,
+};
+
+/* Type of CDB command checker with associated data to check */
+struct cdb_command_check {
+	/* SCSI command number */
+	u8 command;
+	/* CDB command size */
+	size_t size;
+	/* Size field index in the input CDB command buffer */
+	enum cdb_data_size_field size_index;
+	/* CDB command data direction, @enum data_direction */
+	u8 direction;
+	/* Mask of expected meaningfull bytes in input CDB command buffer */
+	u32 valid_bytes_bitmask;
+	/* Is medium must be present or not */
+	u8 medium_required;
+	/* If data size is custom (the size_index is equal to CDB_SIZE_MANUAL),
+	 * then this field indicates the output data size
+	 */
+	u8 data_size_manual;
+	/* the CDB command checker */
+	int (*do_check_command)(struct fsg_common *common, int size,
+				enum data_direction direction,
+				unsigned int mask, int needs_medium,
+				const char *name);
+};
+
+/* CDB command hundler metadata */
+struct cdb_handler {
+	/* SCSI command number */
+	u8 command;
+	/**
+	 * @brief the CDB command hundler
+	 * @param fsg_common	- FSG instance
+	 */
+	int (*do_command)(struct fsg_common *common);
+	/**
+	 * @brief The CDB command hundler with a fsg_buffhd specified
+	 */
+	int (*do_command_with_buffhd)(struct fsg_common *common,
+				      struct fsg_buffhd *bufhd);
+	/* CDB handler type to pick a relevant callback */
+	enum { CDB_HANDLER_COMMON, CDB_HANDLER_FSG_BUFFHD } type;
+	/* SCSI command ASCII name */
+	char *name;
+};
+
+/*------------------------------------------------------------------------*/
+
 /* Static strings, in UTF-8 (for simplicity we use only ASCII characters) */
 static struct usb_string		fsg_strings[] = {
 	{FSG_STRING_INTERFACE,		fsg_string_interface},
@@ -1870,6 +2002,103 @@ static int check_command_size_in_blocks(struct fsg_common *common,
 			mask, needs_medium, name);
 }
 
+static struct cdb_command_check cdb_checker_table[] = {
+	{ CDB_REG_CHECKER(INQUIRY, 6, CDB_SIZE_FIELD_4, DATA_DIR_TO_HOST,
+			  0x0010, MEDIUM_OPTIONAL) },
+	{ CDB_REG_CHECKER(MODE_SELECT, 6, CDB_SIZE_FIELD_4, DATA_DIR_FROM_HOST,
+			  0x0012, MEDIUM_OPTIONAL) },
+	{ CDB_REG_CHECKER(MODE_SELECT_10, 10, CDB_SIZE_FIELD_7,
+			  DATA_DIR_FROM_HOST, 0x0182, MEDIUM_OPTIONAL) },
+	{ CDB_REG_CHECKER(MODE_SENSE, 6, CDB_SIZE_FIELD_4, DATA_DIR_TO_HOST,
+			  0x0016, MEDIUM_OPTIONAL) },
+	{ CDB_REG_CHECKER(MODE_SENSE_10, 10, CDB_SIZE_FIELD_7, DATA_DIR_TO_HOST,
+			  0x186, MEDIUM_OPTIONAL) },
+	{ CDB_REG_CHECKER(ALLOW_MEDIUM_REMOVAL, 6, CDB_NO_SIZE_FIELD,
+			  DATA_DIR_NONE, 0x0010, MEDIUM_OPTIONAL) },
+	{ CDB_REG_CHECKER_BLK(READ_6, 6, CDB_SIZE_FIELD_4, DATA_DIR_TO_HOST,
+			      0x001E, MEDIUM_REQUIRED) },
+	{ CDB_REG_CHECKER_BLK(READ_10, 10, CDB_SIZE_FIELD_7, DATA_DIR_TO_HOST,
+			      0x01BE, MEDIUM_REQUIRED) },
+	{ CDB_REG_CHECKER_BLK(READ_12, 12, CDB_SIZE_FIELD_6, DATA_DIR_TO_HOST,
+			      0x03FE, MEDIUM_REQUIRED) },
+	{ CDB_REG_CHECKER_BLK(READ_16, 16, CDB_SIZE_FIELD_10, DATA_DIR_TO_HOST,
+			      0x3FFE, MEDIUM_REQUIRED) },
+	{ CDB_REG_CHECKER_DS(READ_CAPACITY, 10, CDB_SIZE_MANUAL,
+			     DATA_DIR_TO_HOST, 0x011E, MEDIUM_REQUIRED, 8) },
+	{ CDB_REG_CHECKER(READ_HEADER, 10, CDB_SIZE_FIELD_7, DATA_DIR_TO_HOST,
+			  0x01BE, MEDIUM_REQUIRED) },
+	{ CDB_REG_CHECKER(READ_TOC, 10, CDB_SIZE_FIELD_7, DATA_DIR_TO_HOST,
+			  0x03C7, MEDIUM_REQUIRED) },
+	{ CDB_REG_CHECKER(READ_FORMAT_CAPACITIES, 10, CDB_SIZE_FIELD_7,
+			  DATA_DIR_TO_HOST, 0x0180, MEDIUM_REQUIRED) },
+
+	{ CDB_REG_CHECKER(REQUEST_SENSE, 6, CDB_SIZE_FIELD_4, DATA_DIR_TO_HOST,
+			  0x0010, MEDIUM_OPTIONAL) },
+	{ CDB_REG_CHECKER(START_STOP, 6, CDB_NO_SIZE_FIELD, DATA_DIR_NONE,
+			  0x0012, MEDIUM_OPTIONAL) },
+	{ CDB_REG_CHECKER(SYNCHRONIZE_CACHE, 10, CDB_NO_SIZE_FIELD,
+			  DATA_DIR_NONE, 0x01BC, MEDIUM_REQUIRED) },
+
+	{ CDB_REG_CHECKER(TEST_UNIT_READY, 6, CDB_NO_SIZE_FIELD, DATA_DIR_NONE,
+			  0x0000, MEDIUM_REQUIRED) },
+
+	{ CDB_REG_CHECKER_BLK(VERIFY, 10, CDB_NO_SIZE_FIELD, DATA_DIR_NONE,
+			      0x0000, MEDIUM_REQUIRED) },
+	{ CDB_REG_CHECKER_BLK(WRITE_6, 6, CDB_SIZE_FIELD_4, DATA_DIR_FROM_HOST,
+			      0x001E, MEDIUM_REQUIRED) },
+	{ CDB_REG_CHECKER_BLK(WRITE_10, 10, CDB_SIZE_FIELD_7,
+			      DATA_DIR_FROM_HOST, 0x01BE, MEDIUM_REQUIRED) },
+	{ CDB_REG_CHECKER_BLK(WRITE_12, 12, CDB_SIZE_FIELD_6,
+			      DATA_DIR_FROM_HOST, 0x03FE, MEDIUM_REQUIRED) },
+	{ CDB_REG_CHECKER_BLK(WRITE_16, 16, CDB_SIZE_FIELD_10,
+			      DATA_DIR_FROM_HOST, 0x3FFE, MEDIUM_REQUIRED) },
+};
+
+static struct cdb_handler cdb_handlers_table[] = {
+	{ CDB_REG_HANDLER_BUFFHD(INQUIRY, &do_inquiry) },
+	{ CDB_REG_HANDLER_BUFFHD(MODE_SELECT, &do_mode_select) },
+	{ CDB_REG_HANDLER_BUFFHD(MODE_SELECT_10, &do_mode_select) },
+	{ CDB_REG_HANDLER_BUFFHD(MODE_SENSE, &do_mode_sense) },
+	{ CDB_REG_HANDLER_BUFFHD(MODE_SENSE_10, &do_mode_sense) },
+	{ CDB_REG_HANDLER(ALLOW_MEDIUM_REMOVAL, &do_prevent_allow) },
+	{ CDB_REG_HANDLER(READ_6, &do_read) },
+	{ CDB_REG_HANDLER(READ_10, &do_read) },
+	{ CDB_REG_HANDLER(READ_12, &do_read) },
+	{ CDB_REG_HANDLER(READ_16, &do_read) },
+	{ CDB_REG_HANDLER_BUFFHD(READ_CAPACITY, &do_read_capacity) },
+	{ CDB_REG_HANDLER_BUFFHD(READ_HEADER, &do_read_header) },
+	{ CDB_REG_HANDLER_BUFFHD(READ_TOC, &do_read_toc) },
+	{ CDB_REG_HANDLER_BUFFHD(READ_FORMAT_CAPACITIES, &do_read_format_capacities) },
+
+	{ CDB_REG_HANDLER_BUFFHD(REQUEST_SENSE, &do_request_sense) },
+	{ CDB_REG_HANDLER(START_STOP, &do_start_stop) },
+	{ CDB_REG_HANDLER(SYNCHRONIZE_CACHE, &do_synchronize_cache) },
+	{ CDB_REG_HANDLER(TEST_UNIT_READY, NULL) },
+
+	/*
+	 * Although optional, this command is used by MS-Windows.  We
+	 * support a minimal version: BytChk must be 0.
+	 */
+
+	{ CDB_REG_HANDLER(VERIFY, do_verify) },
+	{ CDB_REG_HANDLER(WRITE_6, do_write) },
+	{ CDB_REG_HANDLER(WRITE_10, do_write) },
+	{ CDB_REG_HANDLER(WRITE_12, do_write) },
+	{ CDB_REG_HANDLER(WRITE_16, do_write) },
+	/*
+	 * Some mandatory commands that we recognize but don't implement.
+	 * They don't mean much in this setting.  It's left as an exercise
+	 * for anyone interested to implement RESERVE and RELEASE in terms
+	 * of Posix locks.
+	 *
+	 * Commands:
+	 *	FORMAT_UNIT
+	 *	RELEASE
+	 *	RESERVE
+	 *	SEND_DIAGNOSTIC
+	 */
+};
+
 static int do_scsi_command(struct fsg_common *common)
 {
 	struct fsg_buffhd	*bh;
@@ -1880,6 +2109,14 @@ static int do_scsi_command(struct fsg_common *common)
 
 	dump_cdb(common);
 
+	/* The size of both handlers and SCSI-checkers tables must be equal */
+	if (WARN(ARRAY_SIZE(cdb_checker_table) !=
+			 ARRAY_SIZE(cdb_handlers_table),
+		 "The checkers and handlers tables length are not matched!\n")) {
+		pr_err("Invalid cdb handlers initialization.\n");
+		return status;
+	}
+
 	/* Wait for the next buffer to become available for data or status */
 	bh = common->next_buffhd_to_fill;
 	common->next_buffhd_to_drain = bh;
@@ -1894,160 +2131,11 @@ static int do_scsi_command(struct fsg_common *common)
 	/* flash all unhandled data */
 	common->data_size_to_handle = 0;
 
-	switch (common->cmnd[0]) {
-
-	case INQUIRY:
-		common->data_size_from_cmnd = common->cmnd[4];
-		status = check_command(common, 6, DATA_DIR_TO_HOST,
-				      (1<<4), 0,
-				      "INQUIRY");
-		if (status == 0)
-			status = do_inquiry(common, bh);
-		break;
-
-	case MODE_SELECT:
-		common->data_size_from_cmnd = common->cmnd[4];
-		status = check_command(common, 6, DATA_DIR_FROM_HOST,
-				      (1<<1) | (1<<4), 0,
-				      "MODE SELECT(6)");
-		if (status == 0)
-			status = do_mode_select(common, bh);
-		break;
-
-	case MODE_SELECT_10:
-		common->data_size_from_cmnd =
-			get_unaligned_be16(&common->cmnd[7]);
-		status = check_command(common, 10, DATA_DIR_FROM_HOST,
-				      (1<<1) | (3<<7), 0,
-				      "MODE SELECT(10)");
-		if (status == 0)
-			status = do_mode_select(common, bh);
-		break;
-
-	case MODE_SENSE:
-		common->data_size_from_cmnd = common->cmnd[4];
-		status = check_command(common, 6, DATA_DIR_TO_HOST,
-				      (1<<1) | (1<<2) | (1<<4), 0,
-				      "MODE SENSE(6)");
-		if (status == 0)
-			status = do_mode_sense(common, bh);
-		break;
-
-	case MODE_SENSE_10:
-		common->data_size_from_cmnd =
-			get_unaligned_be16(&common->cmnd[7]);
-		status = check_command(common, 10, DATA_DIR_TO_HOST,
-				      (1<<1) | (1<<2) | (3<<7), 0,
-				      "MODE SENSE(10)");
-		if (status == 0)
-			status = do_mode_sense(common, bh);
-		break;
-
-	case ALLOW_MEDIUM_REMOVAL:
-		common->data_size_from_cmnd = 0;
-		status = check_command(common, 6, DATA_DIR_NONE,
-				      (1<<4), 0,
-				      "PREVENT-ALLOW MEDIUM REMOVAL");
-		if (status == 0)
-			status = do_prevent_allow(common);
-		break;
-
-	case READ_6:
-		i = common->cmnd[4];
-		common->data_size_from_cmnd = (i == 0) ? 256 : i;
-		status = check_command_size_in_blocks(common, 6,
-				      DATA_DIR_TO_HOST,
-				      (7<<1) | (1<<4), 1,
-				      "READ(6)");
-		if (status == 0)
-			status = do_read(common);
-		break;
-
-	case READ_10:
-		common->data_size_from_cmnd =
-				get_unaligned_be16(&common->cmnd[7]);
-		status = check_command_size_in_blocks(common, 10,
-				      DATA_DIR_TO_HOST,
-				      (1<<1) | (0xf<<2) | (3<<7), 1,
-				      "READ(10)");
-		if (status == 0)
-			status = do_read(common);
-		break;
-
-	case READ_12:
-		common->data_size_from_cmnd =
-				get_unaligned_be32(&common->cmnd[6]);
-		status = check_command_size_in_blocks(common, 12,
-				      DATA_DIR_TO_HOST,
-				      (1<<1) | (0xf<<2) | (0xf<<6), 1,
-				      "READ(12)");
-		if (status == 0)
-			status = do_read(common);
-		break;
-
-	case READ_16:
-		common->data_size_from_cmnd =
-				get_unaligned_be32(&common->cmnd[10]);
-		status = check_command_size_in_blocks(common, 16,
-				      DATA_DIR_TO_HOST,
-				      (1<<1) | (0xff<<2) | (0xf<<10), 1,
-				      "READ(16)");
-		if (status == 0)
-			status = do_read(common);
-		break;
-
-	case READ_CAPACITY:
-		common->data_size_from_cmnd = 8;
-		status = check_command(common, 10, DATA_DIR_TO_HOST,
-				      (0xf<<2) | (1<<8), 1,
-				      "READ CAPACITY");
-		if (status == 0)
-			status = do_read_capacity(common, bh);
-		break;
-
-	case READ_HEADER:
-		if (!common->curlun || !common->curlun->cdrom)
-			goto unknown_cmnd;
-		common->data_size_from_cmnd =
-			get_unaligned_be16(&common->cmnd[7]);
-		status = check_command(common, 10, DATA_DIR_TO_HOST,
-				      (3<<7) | (0x1f<<1), 1,
-				      "READ HEADER");
-		if (status == 0)
-			status = do_read_header(common, bh);
-		break;
-
-	case READ_TOC:
-		if (!common->curlun || !common->curlun->cdrom)
-			goto unknown_cmnd;
-		common->data_size_from_cmnd =
-			get_unaligned_be16(&common->cmnd[7]);
-		status = check_command(common, 10, DATA_DIR_TO_HOST,
-				      (0xf<<6) | (3<<1), 1,
-				      "READ TOC");
-		if (status == 0)
-			status = do_read_toc(common, bh);
-		break;
-
-	case READ_FORMAT_CAPACITIES:
-		common->data_size_from_cmnd =
-			get_unaligned_be16(&common->cmnd[7]);
-		status = check_command(common, 10, DATA_DIR_TO_HOST,
-				      (3<<7), 1,
-				      "READ FORMAT CAPACITIES");
-		if (status == 0)
-			status = do_read_format_capacities(common, bh);
-		break;
-
-	case REQUEST_SENSE:
-		common->data_size_from_cmnd = common->cmnd[4];
-		status = check_command(common, 6, DATA_DIR_TO_HOST,
-				      (1<<4), 0,
-				      "REQUEST SENSE");
-		if (status == 0)
-			status = do_request_sense(common, bh);
-		break;
-
+	for (i = 0; i < ARRAY_SIZE(cdb_checker_table); ++i) {
+		const struct cdb_command_check *curr_check =
+			&cdb_checker_table[i];
+		const struct cdb_handler *curr_handler = &cdb_handlers_table[i];
+/*
 	case SERVICE_ACTION_IN_16:
 		switch (common->cmnd[1] & 0x1f) {
 
@@ -2066,112 +2154,86 @@ static int do_scsi_command(struct fsg_common *common)
 			goto unknown_cmnd;
 		}
 		break;
+*/
 
-	case START_STOP:
-		common->data_size_from_cmnd = 0;
-		status = check_command(common, 6, DATA_DIR_NONE,
-				      (1<<1) | (1<<4), 0,
-				      "START-STOP UNIT");
-		if (status == 0)
-			status = do_start_stop(common);
-		break;
-
-	case SYNCHRONIZE_CACHE:
-		common->data_size_from_cmnd = 0;
-		status = check_command(common, 10, DATA_DIR_NONE,
-				      (0xf<<2) | (3<<7), 1,
-				      "SYNCHRONIZE CACHE");
-		if (status == 0)
-			status = do_synchronize_cache(common);
-		break;
 
-	case TEST_UNIT_READY:
-		common->data_size_from_cmnd = 0;
-		status = check_command(common, 6, DATA_DIR_NONE,
-				0, 1,
-				"TEST UNIT READY");
-		break;
-
-	/*
-	 * Although optional, this command is used by MS-Windows.  We
-	 * support a minimal version: BytChk must be 0.
-	 */
-	case VERIFY:
-		common->data_size_from_cmnd = 0;
-		status = check_command(common, 10, DATA_DIR_NONE,
-				      (1<<1) | (0xf<<2) | (3<<7), 1,
-				      "VERIFY");
-		if (status == 0)
-			status = do_verify(common);
-		break;
-
-	case WRITE_6:
-		i = common->cmnd[4];
-		common->data_size_from_cmnd = (i == 0) ? 256 : i;
-		status = check_command_size_in_blocks(common, 6,
-				      DATA_DIR_FROM_HOST,
-				      (7<<1) | (1<<4), 1,
-				      "WRITE(6)");
-		if (status == 0)
-			status = do_write(common);
-		break;
-
-	case WRITE_10:
-		common->data_size_from_cmnd =
-				get_unaligned_be16(&common->cmnd[7]);
-		status = check_command_size_in_blocks(common, 10,
-				      DATA_DIR_FROM_HOST,
-				      (1<<1) | (0xf<<2) | (3<<7), 1,
-				      "WRITE(10)");
-		if (status == 0)
-			status = do_write(common);
-		break;
-
-	case WRITE_12:
-		common->data_size_from_cmnd =
-				get_unaligned_be32(&common->cmnd[6]);
-		status = check_command_size_in_blocks(common, 12,
-				      DATA_DIR_FROM_HOST,
-				      (1<<1) | (0xf<<2) | (0xf<<6), 1,
-				      "WRITE(12)");
-		if (status == 0)
-			status = do_write(common);
-		break;
+		if (common->cmnd[0] != curr_check->command)
+			continue;
+		if (WARN(curr_check->command != curr_handler->command,
+			 "Invalid CDB handlers initialization. Command not matches\n")) {
+			goto end;
+		}
 
-	case WRITE_16:
-		common->data_size_from_cmnd =
-				get_unaligned_be32(&common->cmnd[10]);
-		status = check_command_size_in_blocks(common, 16,
-				      DATA_DIR_FROM_HOST,
-				      (1<<1) | (0xff<<2) | (0xf<<10), 1,
-				      "WRITE(16)");
-		if (status == 0)
-			status = do_write(common);
-		break;
+		// The command was matched. Go to processing
+		switch (curr_check->size_index) {
+		case CDB_NO_SIZE_FIELD:
+			common->data_size_from_cmnd = 0;
+			break;
+		case CDB_SIZE_FIELD_4:
+			common->data_size_from_cmnd =
+				(common->cmnd[CDB_SIZE_FIELD_4] == 0) ?
+					0xFF :
+					common->cmnd[CDB_SIZE_FIELD_4];
+			break;
+		case CDB_SIZE_FIELD_6:
+			common->data_size_from_cmnd =
+				get_unaligned_be32(&common->cmnd[CDB_SIZE_FIELD_6]);
+			break;
+		case CDB_SIZE_FIELD_7:
+			common->data_size_from_cmnd =
+				get_unaligned_be16(&common->cmnd[CDB_SIZE_FIELD_7]);
+			break;
+		case CDB_SIZE_FIELD_10:
+			common->data_size_from_cmnd =
+				get_unaligned_be16(&common->cmnd[CDB_SIZE_FIELD_10]);
+			break;
+		case CDB_SIZE_MANUAL:
+			common->data_size_from_cmnd =
+				curr_check->data_size_manual;
+			break;
+		default:
+			// should never happen
+			pr_err("error of get kind size field\n");
+			goto end;
+		}
 
-	/*
-	 * Some mandatory commands that we recognize but don't implement.
-	 * They don't mean much in this setting.  It's left as an exercise
-	 * for anyone interested to implement RESERVE and RELEASE in terms
-	 * of Posix locks.
-	 */
-	case FORMAT_UNIT:
-	case RELEASE:
-	case RESERVE:
-	case SEND_DIAGNOSTIC:
+		if (curr_check->do_check_command) {
+			status = curr_check->do_check_command(common,
+				curr_check->size, curr_check->direction,
+				curr_check->valid_bytes_bitmask,
+				curr_check->medium_required,
+				curr_handler->name);
+		} else {
+			DBG(common, "SCSI command: %s\n", curr_handler->name);
+			status = 0;
+		}
 
-	default:
-unknown_cmnd:
-		common->data_size_from_cmnd = 0;
-		sprintf(unknown, "Unknown x%02x", common->cmnd[0]);
-		status = check_command(common, common->cmnd_size,
-				      DATA_DIR_UNKNOWN, ~0, 0, unknown);
 		if (status == 0) {
-			common->curlun->sense_data = SS_INVALID_COMMAND;
-			status = -EINVAL;
+			if (curr_handler->type == CDB_HANDLER_COMMON &&
+			    curr_handler->do_command) {
+				status = curr_handler->do_command(common);
+			} else if (curr_handler->type ==
+					   CDB_HANDLER_FSG_BUFFHD &&
+				   curr_handler->do_command_with_buffhd !=
+					   NULL) {
+				status =
+					curr_handler->do_command_with_buffhd(common, bh);
+			}
 		}
-		break;
+
+		goto end;
+	}
+
+	common->data_size_from_cmnd = 0;
+	sprintf(unknown, "Unknown %02Xh", common->cmnd[0]);
+	status = check_command(common, common->cmnd_size, DATA_DIR_UNKNOWN, ~0,
+			       MEDIUM_OPTIONAL, unknown);
+	if (status == 0) {
+		common->curlun->sense_data = SS_INVALID_COMMAND;
+		status = -EINVAL;
 	}
+
+end:
 	up_read(&common->filesem);
 
 	if (status == -EINTR || signal_pending(current))
@@ -2192,7 +2254,6 @@ static int do_scsi_command(struct fsg_common *common)
 	return 0;
 }
 
-
 /*-------------------------------------------------------------------------*/
 
 static int received_cbw(struct fsg_dev *fsg, struct fsg_buffhd *bh)
diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/gadget/function/storage_common.h
index 0a544a82cbf8..1930482a8ddc 100644
--- a/drivers/usb/gadget/function/storage_common.h
+++ b/drivers/usb/gadget/function/storage_common.h
@@ -172,6 +172,11 @@ enum data_direction {
 	DATA_DIR_NONE
 };
 
+enum medium_required_values {
+	MEDIUM_OPTIONAL = 0,
+	MEDIUM_REQUIRED
+};
+
 static inline struct fsg_lun *fsg_lun_from_dev(struct device *dev)
 {
 	return container_of(dev, struct fsg_lun, dev);
-- 
2.34.1

