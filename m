Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3963E87F13C
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 21:36:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GVy/GA6e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz68C6qb5z3dJ0
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 07:36:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GVy/GA6e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz66k3JRjz3c12
	for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2024 07:35:09 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d46c44dcc0so59791451fa.2
        for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 13:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710794104; x=1711398904; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNzhHn0g5rCUe9a3yKkuCxAk27qdnhBHsL8OeNZ3I0A=;
        b=GVy/GA6e7gFh0DzxV+BIp9ZKhY2CDzYklglhTY0CpQyMrbgOd3xXnDvcuM5IeG1fyW
         z1QLZHZ+2l1mGmoHbAuhkVXbe4FTqYaDmYvTzOU7IU/fSHLYo1QV7UFWyErsFtZzq1dC
         sBue3fFErePK3lBVBOTtHwpCU2GG/8DZaL4L4+Z8LlCFrfiuAnsj8bD8fuJD+pgm4Aj7
         +qlozYH6Vs+qnFr/NCMeFWQ8g98xnItHsXQ2+H1pttOt+c/gy9UIYexjmcMNluTPycH+
         vc0uNZT5/1fP41wZ98NbPwsfdlC2zUDGlefqhhuQDHu8YnvuMN0zJkj+7egzczZXm/Qi
         +XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710794104; x=1711398904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNzhHn0g5rCUe9a3yKkuCxAk27qdnhBHsL8OeNZ3I0A=;
        b=Q/2/2oObTpaTFkaH/YzBMnt6UcnpSpFsFg1x8HCS1eY2LsoInC5zm5JhLjra3n/HNq
         YwXiAZ9eyZ3EOSflo8S/SNZPJ8za6vQcM+/rz2SI/q3FIPcAqjwxYcNCVYvAHJ2U+qwo
         j3tBeharbKPXHvyj+HVUW/OMNsDNbUCwsSHdZPeAD8ERSj8gDfdDs3qQ6UZFPdGGhmkz
         eh7EoOxfwzRBXnGZ4G3/Yzd0X3vLsF2YLRM2YkSbzWW9WO/lLUGqiAsy/SNx0HOQz+mu
         +pVcpvmw6joutwHQ/9a9yH8maTT66NzeJNz0vzU9xwPC4CfEIIcvs2Ae5bjKfRD5hiUU
         q9xg==
X-Gm-Message-State: AOJu0YzI8o9JJzBPDXfv5Cszga4W+XkmWOgQuHKuCTtoaHVI79ZziaQ1
	II1tqEb4sl28X3G7Yavc9X4k5jj4UjVXDlmVV5oxt9WHRc3nmKhdY/tXz1nlZqU=
X-Google-Smtp-Source: AGHT+IEZI93rGApwOPY7zVocjvjnT7BWn1cQkktUQzWTQEfHigTqmhNin2+hta1Siez/R/WXt6SsGw==
X-Received: by 2002:a2e:850d:0:b0:2d4:c9c4:cd54 with SMTP id j13-20020a2e850d000000b002d4c9c4cd54mr325560lji.46.1710794104215;
        Mon, 18 Mar 2024 13:35:04 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id r21-20020a2e9955000000b002d46e2610f2sm1521917ljj.105.2024.03.18.13.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:35:03 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 42IKYxUt029085;
	Mon, 18 Mar 2024 23:35:00 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 42IKYxk3029084;
	Mon, 18 Mar 2024 23:34:59 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH downstream-hack dev-6.6 1/6] usb:gadget:mass-storage: Improve the signature of SCSI handler function
Date: Mon, 18 Mar 2024 23:34:40 +0300
Message-Id: <20240318203445.29036-2-fercerpav@gmail.com>
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
Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 200 ++++++++++---------
 1 file changed, 108 insertions(+), 92 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index c265a1f62fc1..01525f02293d 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -268,6 +268,7 @@ struct fsg_common {
 	enum data_direction	data_dir;
 	u32			data_size;
 	u32			data_size_from_cmnd;
+	u32			data_size_to_handle;
 	u32			tag;
 	u32			residue;
 	u32			usb_amount_left;
@@ -1060,7 +1061,8 @@ static int do_inquiry(struct fsg_common *common, struct fsg_buffhd *bh)
 		memset(buf, 0, 36);
 		buf[0] = TYPE_NO_LUN;	/* Unsupported, no device-type */
 		buf[4] = 31;		/* Additional length */
-		return 36;
+		common->data_size_to_handle = 36;
+		return 0;
 	}
 
 	buf[0] = curlun->cdrom ? TYPE_ROM : TYPE_DISK;
@@ -1077,7 +1079,8 @@ static int do_inquiry(struct fsg_common *common, struct fsg_buffhd *bh)
 	else
 		memcpy(buf + 8, common->inquiry_string,
 		       sizeof(common->inquiry_string));
-	return 36;
+	common->data_size_to_handle = 36;
+	return 0;
 }
 
 static int do_request_sense(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1130,7 +1133,8 @@ static int do_request_sense(struct fsg_common *common, struct fsg_buffhd *bh)
 	buf[7] = 18 - 8;			/* Additional sense length */
 	buf[12] = ASC(sd);
 	buf[13] = ASCQ(sd);
-	return 18;
+	common->data_size_to_handle = 18;
+	return 0;
 }
 
 static int do_read_capacity(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1153,7 +1157,8 @@ static int do_read_capacity(struct fsg_common *common, struct fsg_buffhd *bh)
 		max_lba = 0xffffffff;
 	put_unaligned_be32(max_lba, &buf[0]);		/* Max logical block */
 	put_unaligned_be32(curlun->blksize, &buf[4]);	/* Block length */
-	return 8;
+	common->data_size_to_handle = 8;
+	return 0;
 }
 
 static int do_read_capacity_16(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1175,7 +1180,8 @@ static int do_read_capacity_16(struct fsg_common *common, struct fsg_buffhd *bh)
 
 	/* It is safe to keep other fields zeroed */
 	memset(&buf[12], 0, 32 - 12);
-	return 32;
+	common->data_size_to_handle = 32;
+	return 0;
 }
 
 static int do_read_header(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1197,7 +1203,8 @@ static int do_read_header(struct fsg_common *common, struct fsg_buffhd *bh)
 	memset(buf, 0, 8);
 	buf[0] = 0x01;		/* 2048 bytes of user data, rest is EC */
 	store_cdrom_address(&buf[4], msf, lba);
-	return 8;
+	common->data_size_to_handle = 8;
+	return 0;
 }
 
 static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1240,7 +1247,8 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
 		buf[13] = 0x16;		/* Lead-out track is data */
 		buf[14] = 0xAA;		/* Lead-out track number */
 		store_cdrom_address(&buf[16], msf, curlun->num_sectors);
-		return len;
+		common->data_size_to_handle = len;
+		return 0;
 
 	case 2:
 		/* Raw TOC */
@@ -1265,7 +1273,8 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
 
 		/* For A2, 7, 8, 9, 10 - zero, Pmin, Psec, Pframe of Lead out */
 		store_cdrom_address(&buf[7], msf, curlun->num_sectors);
-		return len;
+		common->data_size_to_handle = len;
+		return 0;
 
 	default:
 		/* PMA, ATIP, CD-TEXT not supported/required */
@@ -1357,7 +1366,8 @@ static int do_mode_sense(struct fsg_common *common, struct fsg_buffhd *bh)
 		buf0[0] = len - 1;
 	else
 		put_unaligned_be16(len - 2, buf0);
-	return len;
+	common->data_size_to_handle = len;
+	return 0;
 }
 
 static int do_start_stop(struct fsg_common *common)
@@ -1448,7 +1458,8 @@ static int do_read_format_capacities(struct fsg_common *common,
 						/* Number of blocks */
 	put_unaligned_be32(curlun->blksize, &buf[4]);/* Block length */
 	buf[4] = 0x02;				/* Current capacity */
-	return 12;
+	common->data_size_to_handle = 12;
+	return 0;
 }
 
 static int do_mode_select(struct fsg_common *common, struct fsg_buffhd *bh)
@@ -1863,7 +1874,7 @@ static int do_scsi_command(struct fsg_common *common)
 {
 	struct fsg_buffhd	*bh;
 	int			rc;
-	int			reply = -EINVAL;
+	int			status = -EINVAL;
 	int			i;
 	static char		unknown[16];
 
@@ -1880,115 +1891,118 @@ static int do_scsi_command(struct fsg_common *common)
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
 
 	case READ_16:
 		common->data_size_from_cmnd =
 				get_unaligned_be32(&common->cmnd[10]);
-		reply = check_command_size_in_blocks(common, 16,
+		status = check_command_size_in_blocks(common, 16,
 				      DATA_DIR_TO_HOST,
 				      (1<<1) | (0xff<<2) | (0xf<<10), 1,
 				      "READ(16)");
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
@@ -1996,11 +2010,11 @@ static int do_scsi_command(struct fsg_common *common)
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
@@ -2008,30 +2022,30 @@ static int do_scsi_command(struct fsg_common *common)
 			goto unknown_cmnd;
 		common->data_size_from_cmnd =
 			get_unaligned_be16(&common->cmnd[7]);
-		reply = check_command(common, 10, DATA_DIR_TO_HOST,
+		status = check_command(common, 10, DATA_DIR_TO_HOST,
 				      (0xf<<6) | (3<<1), 1,
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
 
 	case SERVICE_ACTION_IN_16:
@@ -2040,12 +2054,12 @@ static int do_scsi_command(struct fsg_common *common)
 		case SAI_READ_CAPACITY_16:
 			common->data_size_from_cmnd =
 				get_unaligned_be32(&common->cmnd[10]);
-			reply = check_command(common, 16, DATA_DIR_TO_HOST,
+			status = check_command(common, 16, DATA_DIR_TO_HOST,
 					      (1<<1) | (0xff<<2) | (0xf<<10) |
 					      (1<<14), 1,
 					      "READ CAPACITY(16)");
-			if (reply == 0)
-				reply = do_read_capacity_16(common, bh);
+			if (status == 0)
+				status = do_read_capacity_16(common, bh);
 			break;
 
 		default:
@@ -2055,25 +2069,25 @@ static int do_scsi_command(struct fsg_common *common)
 
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
@@ -2084,55 +2098,55 @@ static int do_scsi_command(struct fsg_common *common)
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
 
 	case WRITE_16:
 		common->data_size_from_cmnd =
 				get_unaligned_be32(&common->cmnd[10]);
-		reply = check_command_size_in_blocks(common, 16,
+		status = check_command_size_in_blocks(common, 16,
 				      DATA_DIR_FROM_HOST,
 				      (1<<1) | (0xff<<2) | (0xf<<10), 1,
 				      "WRITE(16)");
-		if (reply == 0)
-			reply = do_write(common);
+		if (status == 0)
+			status = do_write(common);
 		break;
 
 	/*
@@ -2150,27 +2164,29 @@ static int do_scsi_command(struct fsg_common *common)
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
2.34.1

