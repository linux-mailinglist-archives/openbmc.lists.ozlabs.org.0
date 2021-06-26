Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2CF3B5040
	for <lists+openbmc@lfdr.de>; Sat, 26 Jun 2021 23:19:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GC6Fw15zSz3bv7
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 07:19:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=K3pEeWpb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=K3pEeWpb; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GC6Dp6QGBz307J
 for <openbmc@lists.ozlabs.org>; Sun, 27 Jun 2021 07:18:50 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 120D54127F;
 Sat, 26 Jun 2021 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1624742324; x=1626556725; bh=dEnfhMJYT4zzd5l6dZA16GPtMcOFjQIeboc
 D1ABS2Yw=; b=K3pEeWpbL01GKgZ8AVkP1SwmwxKPJujsGnaULG7s6lIpt/mqqlq
 H7ZSJRP0xR8fDuKAXOtGFEDgTyqgJj8jAdJXS8dNpfoceJcmBVP9Y8J7FYxz68xj
 4NWgH1zYckJeV6XPbsGAv2S4Y7Kmbv8hOyajhM0gLn6RkrS8YBEaDnOY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6x8zG0Rtc0H5; Sun, 27 Jun 2021 00:18:44 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D437C41381;
 Sun, 27 Jun 2021 00:18:44 +0300 (MSK)
Received: from localhost.localdomain (10.199.0.6) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 27
 Jun 2021 00:18:44 +0300
From: Igor Kononenko <i.kononenko@yadro.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 2/6] usb:gadget:mass-storage: refactoring the SCSI command
 handling
Date: Sun, 27 Jun 2021 00:18:15 +0300
Message-ID: <20210626211820.107310-3-i.kononenko@yadro.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210626211820.107310-1-i.kononenko@yadro.com>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.6]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
 Igor Kononenko <i.kononenko@yadro.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Implements a universal way to define SCSI commands and configure
precheck handlers.

Tested: By probing the USBGadget Mass-Storage on the YADRO VEGMAN
BMC(AST2500) sample, each SCSI command was sent through HOST->BMC; the
USBGadget MassStorage debug print showed all sent commands works
properly.

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 540 +++++++++++--------
 drivers/usb/gadget/function/storage_common.h |   5 +
 2 files changed, 310 insertions(+), 235 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index e9a7f87b4df3..c3fddee21b53 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -237,6 +237,137 @@ static const char fsg_string_interface[] = "Mass Storage";
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
@@ -1801,6 +1932,97 @@ static int check_command_size_in_blocks(struct fsg_common *common,
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
@@ -1811,6 +2033,14 @@ static int do_scsi_command(struct fsg_common *common)
 
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
@@ -1825,243 +2055,84 @@ static int do_scsi_command(struct fsg_common *common)
 	/* flash all unhandled data */
 	common->data_size_to_handle = 0;
 
-	switch (common->cmnd[0]) {
+	for (i = 0; i < ARRAY_SIZE(cdb_checker_table); ++i) {
+		const struct cdb_command_check *curr_check =
+			&cdb_checker_table[i];
+		const struct cdb_handler *curr_handler = &cdb_handlers_table[i];
 
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
-				      (7<<6) | (1<<1), 1,
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
-
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
-
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
-
-	default:
-unknown_cmnd:
-		common->data_size_from_cmnd = 0;
-		sprintf(unknown, "Unknown x%02x", common->cmnd[0]);
-		status = check_command(common, common->cmnd_size,
-				      DATA_DIR_UNKNOWN, ~0, 0, unknown);
-		if (status == 0) {
-			common->curlun->sense_data = SS_INVALID_COMMAND;
-			status = -EINVAL;
+		if (common->cmnd[0] != curr_check->command)
+			continue;
+		if (WARN(curr_check->command != curr_handler->command,
+			 "Invalid CDB handlers initialization. Command not matches\n")) {
+			goto end;
 		}
-		break;
+
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
+		case CDB_SIZE_MANUAL:
+			common->data_size_from_cmnd =
+				curr_check->data_size_manual;
+			break;
+		default:
+			// should never happen
+			pr_err("error of get kind size field\n");
+			goto end;
+		}
+
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
+
+		if (status == 0) {
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
+		}
+
+		goto end;
 	}
+
+	common->data_size_from_cmnd = 0;
+	sprintf(unknown, "Unknown %02Xh", common->cmnd[0]);
+	status = check_command(common, common->cmnd_size, DATA_DIR_UNKNOWN, ~0,
+			       MEDIUM_OPTIONAL, unknown);
+	if (status == 0) {
+		common->curlun->sense_data = SS_INVALID_COMMAND;
+		status = -EINVAL;
+	}
+
+end:
 	up_read(&common->filesem);
 
 	if (status == -EINTR || signal_pending(current))
@@ -2082,7 +2153,6 @@ static int do_scsi_command(struct fsg_common *common)
 	return 0;
 }
 
-
 /*-------------------------------------------------------------------------*/
 
 static int received_cbw(struct fsg_dev *fsg, struct fsg_buffhd *bh)
diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/gadget/function/storage_common.h
index bdeb1e233fc9..84f5d2ffd7d8 100644
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
2.32.0

