Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9358D3B5038
	for <lists+openbmc@lfdr.de>; Sat, 26 Jun 2021 23:19:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GC6FV2n7vz3bwc
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 07:19:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=PNo2s0B0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=PNo2s0B0; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GC6Dn2h6Qz307J
 for <openbmc@lists.ozlabs.org>; Sun, 27 Jun 2021 07:18:49 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7CB4B4137F;
 Sat, 26 Jun 2021 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1624742323; x=1626556724; bh=+Csb1ypFrD0J9dXnsR6ulq+FUFtQsaF/34c
 mF9R3yvo=; b=PNo2s0B07CmEv4fTrsrNWo9tANdvMzpcYiq62du7kLpbdrQRD4I
 3Gs5CWk3xmUIMbRia6T2Gm8lUEgaL4y7PBosDdYmEAsNHkkVKVCBe6QESOF1zRCQ
 7alUJ5KcJk4pGVHS2AcEmjlUaA/3iSHU4voFtDP8UenLie8wuC3/wwUM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kupWmCyUKUW2; Sun, 27 Jun 2021 00:18:43 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 628C24127F;
 Sun, 27 Jun 2021 00:18:43 +0300 (MSK)
Received: from localhost.localdomain (10.199.0.6) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 27
 Jun 2021 00:18:42 +0300
From: Igor Kononenko <i.kononenko@yadro.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 1/6] usb:gadget:mass-storage: Improve the signature of SCSI
 handler function
Date: Sun, 27 Jun 2021 00:18:14 +0300
Message-ID: <20210626211820.107310-2-i.kononenko@yadro.com>
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

SCSI command handlers currently have an ambiguous return value. This
return value may indicate the length of the data written to the response
buffer and the command's processing status. Thus, the understanding of
command handling may be implicit.

After this patch, the output buffer's size will be set in the
'data_size_to_handle' field of 'struct fsg_common', and the command
handler's return value indicates only the processing status.

Tested: By probing the USBGadget Mass-Storage on the YADRO VEGMAN
BMC(AST2500) sample, each SCSI command was sent through HOST->BMC; the
USBGadget MassStorage debug print showed all sent commands works
properly.

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 176 ++++++++++---------
 1 file changed, 95 insertions(+), 81 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 4a4703634a2a..e9a7f87b4df3 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -296,6 +296,7 @@ struct fsg_common {
 	enum data_direction	data_dir;
 	u32			data_size;
 	u32			data_size_from_cmnd;
+	u32			data_size_to_handle;
 	u32			tag;
 	u32			residue;
 	u32			usb_amount_left;
@@ -1066,7 +1067,8 @@ static int do_inquiry(struct fsg_common *common, struct fsg_buffhd *bh)
 		memset(buf, 0, 36);
 		buf[0] = TYPE_NO_LUN;	/* Unsupported, no device-type */
 		buf[4] = 31;		/* Additional length */
-		return 36;
+		common->data_size_to_handle = 36;
+		return 0;
 	}
 
 	buf[0] = curlun->cdrom ? TYPE_ROM : TYPE_DISK;
@@ -1083,7 +1085,8 @@ static int do_inquiry(struct fsg_common *common, struct fsg_buffhd *bh)
 	else
 		memcpy(buf + 8, common->inquiry_string,
 		       sizeof(common->inquiry_string));
-	return 36;
+	common->data_size_to_handle = 36;
+	return 0;
 }
 
 static int do_request_sense(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1136,7 +1139,8 @@ static int do_request_sense(struct fsg_common *common, struct fsg_buffhd *bh)
 	buf[7] = 18 - 8;			/* Additional sense length */
 	buf[12] = ASC(sd);
 	buf[13] = ASCQ(sd);
-	return 18;
+	common->data_size_to_handle = 18;
+	return 0;
 }
 
 static int do_read_capacity(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1155,7 +1159,8 @@ static int do_read_capacity(struct fsg_common *common, struct fsg_buffhd *bh)
 	put_unaligned_be32(curlun->num_sectors - 1, &buf[0]);
 						/* Max logical block */
 	put_unaligned_be32(curlun->blksize, &buf[4]);/* Block length */
-	return 8;
+	common->data_size_to_handle = 8;
+	return 0;
 }
 
 static int do_read_header(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1177,7 +1182,8 @@ static int do_read_header(struct fsg_common *common, struct fsg_buffhd *bh)
 	memset(buf, 0, 8);
 	buf[0] = 0x01;		/* 2048 bytes of user data, rest is EC */
 	store_cdrom_address(&buf[4], msf, lba);
-	return 8;
+	common->data_size_to_handle = 8;
+	return 0;
 }
 
 static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1204,7 +1210,8 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
 	buf[13] = 0x16;			/* Lead-out track is data */
 	buf[14] = 0xAA;			/* Lead-out track number */
 	store_cdrom_address(&buf[16], msf, curlun->num_sectors);
-	return 20;
+	common->data_size_to_handle = 20;
+	return 0;
 }
 
 static int do_mode_sense(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1290,7 +1297,8 @@ static int do_mode_sense(struct fsg_common *common, struct fsg_buffhd *bh)
 		buf0[0] = len - 1;
 	else
 		put_unaligned_be16(len - 2, buf0);
-	return len;
+	common->data_size_to_handle = len;
+	return 0;
 }
 
 static int do_start_stop(struct fsg_common *common)
@@ -1381,7 +1389,8 @@ static int do_read_format_capacities(struct fsg_common *common,
 						/* Number of blocks */
 	put_unaligned_be32(curlun->blksize, &buf[4]);/* Block length */
 	buf[4] = 0x02;				/* Current capacity */
-	return 12;
+	common->data_size_to_handle = 12;
+	return 0;
 }
 
 static int do_mode_select(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1796,7 +1805,7 @@ static int do_scsi_command(struct fsg_common *common)
 {
 	struct fsg_buffhd	*bh;
 	int			rc;
-	int			reply = -EINVAL;
+	int			status = -EINVAL;
 	int			i;
 	static char		unknown[16];
 
@@ -1813,104 +1822,107 @@ static int do_scsi_command(struct fsg_common *common)
 	common->short_packet_received = 0;
 
 	down_read(&common->filesem);	/* We're using the backing file */
+	/* flash all unhandled data */
+	common->data_size_to_handle = 0;
+
 	switch (common->cmnd[0]) {
 
 	case INQUIRY:
 		common->data_size_from_cmnd = common->cmnd[4];
-		reply = check_command(common, 6, DATA_DIR_TO_HOST,
+		status = check_command(common, 6, DATA_DIR_TO_HOST,
 				      (1<<4), 0,
 				      "INQUIRY");
-		if (reply == 0)
-			reply = do_inquiry(common, bh);
+		if (status == 0)
+			status = do_inquiry(common, bh);
 		break;
 
 	case MODE_SELECT:
 		common->data_size_from_cmnd = common->cmnd[4];
-		reply = check_command(common, 6, DATA_DIR_FROM_HOST,
+		status = check_command(common, 6, DATA_DIR_FROM_HOST,
 				      (1<<1) | (1<<4), 0,
 				      "MODE SELECT(6)");
-		if (reply == 0)
-			reply = do_mode_select(common, bh);
+		if (status == 0)
+			status = do_mode_select(common, bh);
 		break;
 
 	case MODE_SELECT_10:
 		common->data_size_from_cmnd =
 			get_unaligned_be16(&common->cmnd[7]);
-		reply = check_command(common, 10, DATA_DIR_FROM_HOST,
+		status = check_command(common, 10, DATA_DIR_FROM_HOST,
 				      (1<<1) | (3<<7), 0,
 				      "MODE SELECT(10)");
-		if (reply == 0)
-			reply = do_mode_select(common, bh);
+		if (status == 0)
+			status = do_mode_select(common, bh);
 		break;
 
 	case MODE_SENSE:
 		common->data_size_from_cmnd = common->cmnd[4];
-		reply = check_command(common, 6, DATA_DIR_TO_HOST,
+		status = check_command(common, 6, DATA_DIR_TO_HOST,
 				      (1<<1) | (1<<2) | (1<<4), 0,
 				      "MODE SENSE(6)");
-		if (reply == 0)
-			reply = do_mode_sense(common, bh);
+		if (status == 0)
+			status = do_mode_sense(common, bh);
 		break;
 
 	case MODE_SENSE_10:
 		common->data_size_from_cmnd =
 			get_unaligned_be16(&common->cmnd[7]);
-		reply = check_command(common, 10, DATA_DIR_TO_HOST,
+		status = check_command(common, 10, DATA_DIR_TO_HOST,
 				      (1<<1) | (1<<2) | (3<<7), 0,
 				      "MODE SENSE(10)");
-		if (reply == 0)
-			reply = do_mode_sense(common, bh);
+		if (status == 0)
+			status = do_mode_sense(common, bh);
 		break;
 
 	case ALLOW_MEDIUM_REMOVAL:
 		common->data_size_from_cmnd = 0;
-		reply = check_command(common, 6, DATA_DIR_NONE,
+		status = check_command(common, 6, DATA_DIR_NONE,
 				      (1<<4), 0,
 				      "PREVENT-ALLOW MEDIUM REMOVAL");
-		if (reply == 0)
-			reply = do_prevent_allow(common);
+		if (status == 0)
+			status = do_prevent_allow(common);
 		break;
 
 	case READ_6:
 		i = common->cmnd[4];
 		common->data_size_from_cmnd = (i == 0) ? 256 : i;
-		reply = check_command_size_in_blocks(common, 6,
+		status = check_command_size_in_blocks(common, 6,
 				      DATA_DIR_TO_HOST,
 				      (7<<1) | (1<<4), 1,
 				      "READ(6)");
-		if (reply == 0)
-			reply = do_read(common);
+		if (status == 0)
+			status = do_read(common);
 		break;
 
 	case READ_10:
 		common->data_size_from_cmnd =
 				get_unaligned_be16(&common->cmnd[7]);
-		reply = check_command_size_in_blocks(common, 10,
+		status = check_command_size_in_blocks(common, 10,
 				      DATA_DIR_TO_HOST,
 				      (1<<1) | (0xf<<2) | (3<<7), 1,
 				      "READ(10)");
-		if (reply == 0)
-			reply = do_read(common);
+		if (status == 0)
+			status = do_read(common);
 		break;
 
 	case READ_12:
 		common->data_size_from_cmnd =
 				get_unaligned_be32(&common->cmnd[6]);
-		reply = check_command_size_in_blocks(common, 12,
+		status = check_command_size_in_blocks(common, 12,
 				      DATA_DIR_TO_HOST,
 				      (1<<1) | (0xf<<2) | (0xf<<6), 1,
 				      "READ(12)");
-		if (reply == 0)
-			reply = do_read(common);
+		if (status == 0)
+			status = do_read(common);
 		break;
 
 	case READ_CAPACITY:
 		common->data_size_from_cmnd = 8;
-		reply = check_command(common, 10, DATA_DIR_TO_HOST,
+		status = check_command(common, 10, DATA_DIR_TO_HOST,
 				      (0xf<<2) | (1<<8), 1,
 				      "READ CAPACITY");
-		if (reply == 0)
-			reply = do_read_capacity(common, bh);
+		if (status == 0)
+			status = do_read_capacity(common, bh);
 		break;
 
 	case READ_HEADER:
@@ -1918,11 +1930,11 @@ static int do_scsi_command(struct fsg_common *common)
 			goto unknown_cmnd;
 		common->data_size_from_cmnd =
 			get_unaligned_be16(&common->cmnd[7]);
-		reply = check_command(common, 10, DATA_DIR_TO_HOST,
+		status = check_command(common, 10, DATA_DIR_TO_HOST,
 				      (3<<7) | (0x1f<<1), 1,
 				      "READ HEADER");
-		if (reply == 0)
-			reply = do_read_header(common, bh);
+		if (status == 0)
+			status = do_read_header(common, bh);
 		break;
 
 	case READ_TOC:
@@ -1930,53 +1942,53 @@ static int do_scsi_command(struct fsg_common *common)
 			goto unknown_cmnd;
 		common->data_size_from_cmnd =
 			get_unaligned_be16(&common->cmnd[7]);
-		reply = check_command(common, 10, DATA_DIR_TO_HOST,
+		status = check_command(common, 10, DATA_DIR_TO_HOST,
 				      (7<<6) | (1<<1), 1,
 				      "READ TOC");
-		if (reply == 0)
-			reply = do_read_toc(common, bh);
+		if (status == 0)
+			status = do_read_toc(common, bh);
 		break;
 
 	case READ_FORMAT_CAPACITIES:
 		common->data_size_from_cmnd =
 			get_unaligned_be16(&common->cmnd[7]);
-		reply = check_command(common, 10, DATA_DIR_TO_HOST,
+		status = check_command(common, 10, DATA_DIR_TO_HOST,
 				      (3<<7), 1,
 				      "READ FORMAT CAPACITIES");
-		if (reply == 0)
-			reply = do_read_format_capacities(common, bh);
+		if (status == 0)
+			status = do_read_format_capacities(common, bh);
 		break;
 
 	case REQUEST_SENSE:
 		common->data_size_from_cmnd = common->cmnd[4];
-		reply = check_command(common, 6, DATA_DIR_TO_HOST,
+		status = check_command(common, 6, DATA_DIR_TO_HOST,
 				      (1<<4), 0,
 				      "REQUEST SENSE");
-		if (reply == 0)
-			reply = do_request_sense(common, bh);
+		if (status == 0)
+			status = do_request_sense(common, bh);
 		break;
 
 	case START_STOP:
 		common->data_size_from_cmnd = 0;
-		reply = check_command(common, 6, DATA_DIR_NONE,
+		status = check_command(common, 6, DATA_DIR_NONE,
 				      (1<<1) | (1<<4), 0,
 				      "START-STOP UNIT");
-		if (reply == 0)
-			reply = do_start_stop(common);
+		if (status == 0)
+			status = do_start_stop(common);
 		break;
 
 	case SYNCHRONIZE_CACHE:
 		common->data_size_from_cmnd = 0;
-		reply = check_command(common, 10, DATA_DIR_NONE,
+		status = check_command(common, 10, DATA_DIR_NONE,
 				      (0xf<<2) | (3<<7), 1,
 				      "SYNCHRONIZE CACHE");
-		if (reply == 0)
-			reply = do_synchronize_cache(common);
+		if (status == 0)
+			status = do_synchronize_cache(common);
 		break;
 
 	case TEST_UNIT_READY:
 		common->data_size_from_cmnd = 0;
-		reply = check_command(common, 6, DATA_DIR_NONE,
+		status = check_command(common, 6, DATA_DIR_NONE,
 				0, 1,
 				"TEST UNIT READY");
 		break;
@@ -1987,44 +1999,44 @@ static int do_scsi_command(struct fsg_common *common)
 	 */
 	case VERIFY:
 		common->data_size_from_cmnd = 0;
-		reply = check_command(common, 10, DATA_DIR_NONE,
+		status = check_command(common, 10, DATA_DIR_NONE,
 				      (1<<1) | (0xf<<2) | (3<<7), 1,
 				      "VERIFY");
-		if (reply == 0)
-			reply = do_verify(common);
+		if (status == 0)
+			status = do_verify(common);
 		break;
 
 	case WRITE_6:
 		i = common->cmnd[4];
 		common->data_size_from_cmnd = (i == 0) ? 256 : i;
-		reply = check_command_size_in_blocks(common, 6,
+		status = check_command_size_in_blocks(common, 6,
 				      DATA_DIR_FROM_HOST,
 				      (7<<1) | (1<<4), 1,
 				      "WRITE(6)");
-		if (reply == 0)
-			reply = do_write(common);
+		if (status == 0)
+			status = do_write(common);
 		break;
 
 	case WRITE_10:
 		common->data_size_from_cmnd =
 				get_unaligned_be16(&common->cmnd[7]);
-		reply = check_command_size_in_blocks(common, 10,
+		status = check_command_size_in_blocks(common, 10,
 				      DATA_DIR_FROM_HOST,
 				      (1<<1) | (0xf<<2) | (3<<7), 1,
 				      "WRITE(10)");
-		if (reply == 0)
-			reply = do_write(common);
+		if (status == 0)
+			status = do_write(common);
 		break;
 
 	case WRITE_12:
 		common->data_size_from_cmnd =
 				get_unaligned_be32(&common->cmnd[6]);
-		reply = check_command_size_in_blocks(common, 12,
+		status = check_command_size_in_blocks(common, 12,
 				      DATA_DIR_FROM_HOST,
 				      (1<<1) | (0xf<<2) | (0xf<<6), 1,
 				      "WRITE(12)");
-		if (reply == 0)
-			reply = do_write(common);
+		if (status == 0)
+			status = do_write(common);
 		break;
 
 	/*
@@ -2042,27 +2054,29 @@ static int do_scsi_command(struct fsg_common *common)
 unknown_cmnd:
 		common->data_size_from_cmnd = 0;
 		sprintf(unknown, "Unknown x%02x", common->cmnd[0]);
-		reply = check_command(common, common->cmnd_size,
+		status = check_command(common, common->cmnd_size,
 				      DATA_DIR_UNKNOWN, ~0, 0, unknown);
-		if (reply == 0) {
+		if (status == 0) {
 			common->curlun->sense_data = SS_INVALID_COMMAND;
-			reply = -EINVAL;
+			status = -EINVAL;
 		}
 		break;
 	}
 	up_read(&common->filesem);
 
-	if (reply == -EINTR || signal_pending(current))
+	if (status == -EINTR || signal_pending(current))
 		return -EINTR;
 
-	/* Set up the single reply buffer for finish_reply() */
-	if (reply == -EINVAL)
-		reply = 0;		/* Error reply length */
-	if (reply >= 0 && common->data_dir == DATA_DIR_TO_HOST) {
-		reply = min((u32)reply, common->data_size_from_cmnd);
-		bh->inreq->length = reply;
+	/* Set up the single status buffer for finish_reply() */
+	if (status == -EINVAL)
+		status = 0;		/* Error reply length */
+	if (status == 0 && common->data_dir == DATA_DIR_TO_HOST) {
+		common->data_size_to_handle =
+			min_t(u32, common->data_size_to_handle,
+			      common->data_size_from_cmnd);
+		bh->inreq->length = common->data_size_to_handle;
 		bh->state = BUF_STATE_FULL;
-		common->residue -= reply;
+		common->residue -= common->data_size_to_handle;
 	}				/* Otherwise it's already set */
 
 	return 0;
-- 
2.32.0

