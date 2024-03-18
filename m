Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE8087F140
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 21:38:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RC80mc+4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz6B51CH1z3cS3
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 07:38:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RC80mc+4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz66l0jT3z3cDw
	for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2024 07:35:10 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-513dc9d6938so3865637e87.2
        for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 13:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710794107; x=1711398907; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Pl2LmuYA5MH8IJ4lFxu3DsKjgbO5FuUgGaO1z/R6W8=;
        b=RC80mc+4bl0/lnb90EEat43RU5WwKaUQHYI/6hbShKbFUaGJet915zb3N6AjqBPzId
         Ms9jJAhDqngEM/fI+ZFHWViWPl3t8UDsmG8pajbrnUqeocQhzSXIeUPjfZA1ZI0GXBvJ
         gQJv1Sq+O7eOwh+xacgWhqpljA8mdpm/vkqGTxH2oXLVpKUBbXBcTWqO3CRzvfBy5G6j
         9qdEiJ77r5DWdNyCvVKSHUt9VJskNLOYirnR1Kpyi1Xt4QX6pESnMNymLZ4vh5UsZrts
         BJYY3pN3aTxQrCHZdZ2puUL2KlnHhcYSkSbF/rqC/6/XdhMaWVcBtiqYI1VZEJGoAXua
         ZsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710794107; x=1711398907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Pl2LmuYA5MH8IJ4lFxu3DsKjgbO5FuUgGaO1z/R6W8=;
        b=CPPIFuvoGoQaVpzFfAPindy5T75sLlwhsfH+uWPUG9fSCGCiOyE7Aq4q+LY+YHnZf1
         zbhpEqBK6SZrbhQ3fgXZEIYQhRv+z/x7F+rzByc2unNofR8H07BeM6VpgPYgYAiSYIam
         NLSYNQP8u3sfP0hnyhiFU2Hl4H5akn79Afs5cufyv6Z0ufkx0SGXWVWGdmX8ljZkSEDX
         laA3a5cudiK1oGVVSD3BmBl1BP32MT5WJEplggPe2ZWRJXFDX0KsugHrGiIjP00HXGz+
         Yc8naxog1QkQtYUqpmh8QGqgPZe9wlv3qGMM6YIKJxMFE7F/TeUXPz4QGfQZXwj0Jd1r
         1Lgw==
X-Gm-Message-State: AOJu0YzboZfWusr/RW+/qhI0b7XgMiNd+1VhGOgutlW9pazeexK//96b
	fxmpar98NMt+xFugoh1l7AZcpbOeh9iq0abqminIbyaozX5fdYt1T3WGh5ESgyQ=
X-Google-Smtp-Source: AGHT+IGWaXpKsa5jdh2IXI4wh/QI1yyZCJQ2dWCIN6KYqopa2LhgrEK+Ukich9KQOC/ZoynL+ItJ2A==
X-Received: by 2002:a05:6512:3447:b0:513:8f41:eeb7 with SMTP id j7-20020a056512344700b005138f41eeb7mr8167512lfr.42.1710794106619;
        Mon, 18 Mar 2024 13:35:06 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id y24-20020ac255b8000000b005134751aca7sm1689927lfg.275.2024.03.18.13.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:35:06 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 42IKZ3fl029093;
	Mon, 18 Mar 2024 23:35:04 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 42IKZ3de029092;
	Mon, 18 Mar 2024 23:35:03 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH downstream-hack dev-6.6 3/6] fms: Add TOC/PMA/ATIP DVD-ROM capabilities
Date: Mon, 18 Mar 2024 23:34:42 +0300
Message-Id: <20240318203445.29036-4-fercerpav@gmail.com>
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

The DVD-ROM required the SCSI 6.25 READ TOC/PMA/ATIP Command formats:
 * Response Format 0000b: Formatted TOC
 * Response Format 0001b: Multi-session Information
(MMC-6 Specification).

This patch adds an implementation of that described above formats.

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/usb/gadget/function/f_mass_storage.c | 129 ++++++++------
 drivers/usb/gadget/function/storage_common.c |   8 +-
 include/uapi/linux/cdrom.h                   | 177 +++++++++++++++++++
 3 files changed, 254 insertions(+), 60 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index b86c2e0576bc..395c4d39efae 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -195,6 +195,7 @@
 #include <linux/usb/composite.h>
 
 #include <linux/nospec.h>
+#include <linux/cdrom.h>
 
 #include "configfs.h"
 
@@ -1345,74 +1346,94 @@ static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
 	int		msf = common->cmnd[1] & 0x02;
 	int		start_track = common->cmnd[6];
 	u8		*buf = (u8 *)bh->buf;
-	u8		format;
 	int		i, len;
+	struct cdb_read_toc_pma_atip *cdb =
+		(struct cdb_read_toc_pma_atip *)common->cmnd;
+	struct read_tpa_header *header = (struct read_tpa_header *)bh->buf;
+	struct read_tpa_toc_formatted *data =
+		(struct read_tpa_toc_formatted *)((u8 *)bh->buf +
+						  sizeof(*header));
+	size_t data_size = sizeof(*header);
+
+	if (cdb->format == 0) {
+		if (cdb->control == READ_TPA_CTRL_MAGIC_SESS) {
+			LDBG(curlun,
+			    "The MMC-3 specifies format a control byte. Using Multi-Session info\n");
+			cdb->format = CDB_TPA_MULTI_SESS_INFO;
+		}
+		if (cdb->control == READ_TPA_CTRL_MAGIC_RAW) {
+			LDBG(curlun,
+			    "The MMC-3 specifies format a control byte. Using RAW TOC\n");
+			cdb->format = CDB_TPA_RAW_TOC;
+		}
+	}
 
-	format = common->cmnd[2] & 0xf;
+	/* Currently support response format 0000b: Formatted TOC only */
+	if (cdb->format > CDB_TPA_MULTI_SESS_INFO) {
+		LDBG(curlun, "Unsupported TOC/PMA/ATIP format: %02Xh\n",
+		    cdb->format);
+		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
+		return -EINVAL;
+	}
 
-	if ((common->cmnd[1] & ~0x02) != 0 ||	/* Mask away MSF */
-			(start_track > 1 && format != 0x1)) {
+	/*
+	 * We only support one track per disk.
+	 * We also needs to indicate the number of the last track
+	 */
+	if (cdb->number > 1 && cdb->number != READ_TPA_LEADOUT_TRACK) {
 		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
 		return -EINVAL;
 	}
 
 	/*
-	 * Check if CDB is old style SFF-8020i
-	 * i.e. format is in 2 MSBs of byte 9
-	 * Mac OS-X host sends us this.
+	 * MULTI-SESSIOIN information must be reported only for first track.
 	 */
-	if (format == 0)
-		format = (common->cmnd[9] >> 6) & 0x3;
-
-	switch (format) {
-	case 0:	/* Formatted TOC */
-	case 1:	/* Multi-session info */
-		len = 4 + 2*8;		/* 4 byte header + 2 descriptors */
-		memset(buf, 0, len);
-		buf[1] = len - 2;	/* TOC Length excludes length field */
-		buf[2] = 1;		/* First track number */
-		buf[3] = 1;		/* Last track number */
-		buf[5] = 0x16;		/* Data track, copying allowed */
-		buf[6] = 0x01;		/* Only track is number 1 */
-		store_cdrom_address(&buf[8], msf, 0);
-
-		buf[13] = 0x16;		/* Lead-out track is data */
-		buf[14] = 0xAA;		/* Lead-out track number */
-		store_cdrom_address(&buf[16], msf, curlun->num_sectors);
-		common->data_size_to_handle = len;
-		return 0;
+	if (cdb->format == CDB_TPA_MULTI_SESS_INFO && cdb->number > 1) {
+		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
+		return -EINVAL;
+	}
 
-	case 2:
-		/* Raw TOC */
-		len = 4 + 3*11;		/* 4 byte header + 3 descriptors */
-		memset(buf, 0, len);	/* Header + A0, A1 & A2 descriptors */
-		buf[1] = len - 2;	/* TOC Length excludes length field */
-		buf[2] = 1;		/* First complete session */
-		buf[3] = 1;		/* Last complete session */
+	memset(header, 0, sizeof(*header));
+	header->n_first_stf = 1;
+	header->n_last_stf = 1;
 
-		buf += 4;
-		/* fill in A0, A1 and A2 points */
-		for (i = 0; i < 3; i++) {
-			buf[0] = 1;	/* Session number */
-			buf[1] = 0x16;	/* Data track, copying allowed */
-			/* 2 - Track number 0 ->  TOC */
-			buf[3] = 0xA0 + i; /* A0, A1, A2 point */
-			/* 4, 5, 6 - Min, sec, frame is zero */
-			buf[8] = 1;	/* Pmin: last track number */
-			buf += 11;	/* go to next track descriptor */
-		}
-		buf -= 11;		/* go back to A2 descriptor */
+	memset(data, 0, sizeof(*data));
+	data->addr = 1;
+	data->control = TPA_SECTOR_MODE2_MIXED;
+	data->track_number = cdb->number;
+	data_size += sizeof(*data);
 
-		/* For A2, 7, 8, 9, 10 - zero, Pmin, Psec, Pframe of Lead out */
-		store_cdrom_address(&buf[7], msf, curlun->num_sectors);
-		common->data_size_to_handle = len;
-		return 0;
+	/*
+	 * We have too case:
+	 *	1)	The request Track Number == 1.
+	 *		We shall set 2 descriptors: First Track, Lead-Out Track
+	 *	2)	The requested Track Number == 0xAA
+	 *		Only Lead-Out descriptor shall be set
+	 */
+	if (cdb->number == 1) {
+		DBG(common, "Fill first track addr\n");
+		store_cdrom_address((u8 *)&data->start_addr_track, cdb->msf, 0);
 
-	default:
-		/* PMA, ATIP, CD-TEXT not supported/required */
-		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
-		return -EINVAL;
+		data += 1; /* Add one more descriptor */
+		data_size += sizeof(*data);
+		memset(data, 0, sizeof(*data));
+		/* setting the lead-out track info. First part of data*/
+		data->addr = 1;
+		data->control = TPA_SECTOR_MODE2_MIXED;
+		data->track_number = READ_TPA_LEADOUT_TRACK;
 	}
+
+	/*
+	 * Lead-out track must be set anyway.
+	 * If 0xAA Track is requested - the first part of data is already set.
+	 */
+	DBG(common, "Fill last track addr\n");
+	store_cdrom_address((u8 *)&data->start_addr_track,
+				cdb->msf, curlun->num_sectors);
+
+	header->length = cpu_to_be16(data_size - sizeof(header->length));
+	common->data_size_to_handle = data_size;
+	return 0;
 }
 
 static int do_mode_sense(struct fsg_common *common, struct fsg_buffhd *bh)
diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
index 2a4163b0f6fe..081ffba7725e 100644
--- a/drivers/usb/gadget/function/storage_common.c
+++ b/drivers/usb/gadget/function/storage_common.c
@@ -25,6 +25,7 @@
 #include <linux/fs.h>
 #include <linux/kstrtox.h>
 #include <linux/usb/composite.h>
+#include <linux/cdrom.h>
 
 #include "storage_common.h"
 
@@ -299,13 +300,8 @@ void store_cdrom_address(u8 *dest, int msf, u32 addr)
 		 * Convert to Minutes-Seconds-Frames.
 		 * Sector size is already set to 2048 bytes.
 		 */
-		addr += 2*75;		/* Lead-in occupies 2 seconds */
-		dest[3] = addr % 75;	/* Frames */
-		addr /= 75;
-		dest[2] = addr % 60;	/* Seconds */
-		addr /= 60;
-		dest[1] = addr;		/* Minutes */
 		dest[0] = 0;		/* Reserved */
+		lba_to_msf(addr, &dest[1], &dest[2], &dest[3]);
 	} else {
 		/* Absolute sector */
 		put_unaligned_be32(addr, dest);
diff --git a/include/uapi/linux/cdrom.h b/include/uapi/linux/cdrom.h
index 011e594e4a0d..2c4609c8d1dd 100644
--- a/include/uapi/linux/cdrom.h
+++ b/include/uapi/linux/cdrom.h
@@ -966,4 +966,181 @@ struct rm_feature_desc {
 	__u8 reserved4;
 };
 
+/**
+ * The READ TOC/PMA/ATIP format field values
+ */
+enum cdb_read_tpa_format {
+	/**
+	 * The Track/Session Number field specifies starting track number
+	 * for which the data is returned. For multi-session discs, TOC
+	 * data is returned for all sessions. Track number AAh is reported
+	 * only for the Lead-out area of the last complete session.
+	 */
+	CDB_TPA_FORMATTED_TOC,
+	/**
+	 * This format returns the first complete session number, last
+	 * complete session number and last complete session starting address.
+	 * In this format, the Track/Session Number field is reserved and
+	 * should be set to 00h.
+	 * NOTE: This format provides the Host access to the last closed
+	 * session starting address quickly.
+	 */
+	CDB_TPA_MULTI_SESS_INFO,
+	/**
+	 * This format returns all Q sub-code data in the Lead-In (TOC) areas
+	 * starting from a session number as specified in the Number
+	 * Track/Session Number field.
+	 * In this mode, the Drive shall support Q Sub-channel POINT field
+	 * value of A0h, A1h, A2h, Track numbers, B0h, B1h, B2h, B3h, B4h, C0h,
+	 * and C1h.
+	 * There is no defined LBA addressing and MSF bit shall be set to one.
+	 */
+	CDB_TPA_RAW_TOC,
+	/**
+	 * This format returns Q sub-channel data in the PMA area. In this
+	 * format, the Track/Session Number field is reserved and shall be
+	 * set to 00h. There is no defined LBA addressing and MSF bit
+	 * shall be set to one.
+	 */
+	CDB_TPA_PMA,
+	/**
+	 * This format returns ATIP data. In this format, the Track/Session
+	 * Number field is reserved and shall be set to 00h. There is no
+	 * defined LBA addressing and MSF bit shall be set to one.
+	 */
+	CDB_TPA_ATIP,
+	/**
+	 * This format returns CD-TEXT information that is recorded in the
+	 * Lead-in area as R-W Sub-channel Data.
+	 */
+	CDB_TPA_CD_TEXT,
+};
+
+#define TPA_SECTOR_MODE0		(0x00)
+#define TPA_SECTOR_AUDIO		(0x01)
+#define TPA_SECTOR_MODE1		(0x02)
+#define TPA_SECTOR_MODE2		(0x03)
+#define TPA_SECTOR_MODE2_FORM1		(0x04)
+#define TPA_SECTOR_MODE2_FORM2		(0x05)
+#define TPA_SECTOR_MODE2_MIXED		(TPA_SECTOR_MODE1 | TPA_SECTOR_MODE2_FORM1)
+#define TPA_SECTOR_RAW				(0x07)
+#define TPA_SECTOR_RAW_SCRAMBLED	(0x08)
+
+/**
+ * @brief The READ TOC/PMA/ATIP CDB (43h)
+ * The READ TOC/PMA/ATIP command requests that the Drive read data from a
+ * Table of Contents, the Program Memory Area (PMA), or the Absolute Time
+ * in Pre-Grove (ATIP) from CD media, format according to CDB parameters
+ * and transfer the result to the Host.
+ */
+struct cdb_read_toc_pma_atip {
+	__u8 code;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved1 : 6;
+	/**
+	 * When MSF is set to zero, the address fields in some returned data
+	 * formats shall be in LBA form. When MSF is set to one, the address
+	 * fields in some returned data formats shall be in MSF form
+	 */
+	__u8 msf : 1;
+	__u8 reserved2 : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 reserved2 : 1;
+	__u8 msf : 1;
+	__u8 reserved1 : 6;
+#endif
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved3 : 4;
+	/**
+	 * The Format field is used to select specific returned data format
+	 * according to @enum cdb_read_tpa_format
+	 */
+	__u8 format : 4;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 format : 4;
+	__u8 reserved3 : 4;
+#endif
+
+	__u8 reserved4[3];
+	/**
+	 * The Track/Session Number field provides a method to restrict the
+	 * returned of some data formats to a specific session or a track range
+	 */
+	__u8 number;
+
+	/**
+	 * The Allocation Length field specifies the maximum number of bytes that
+	 * may be returned by the Drive.
+	 * An Allocation Length field of zero shall not be considered an error
+	 */
+	__be16 length;
+
+	__u8 control;
+} __packed;
+
+#define READ_TPA_LEADOUT_TRACK	(0xAAU)
+/*
+ * Control magic byte
+ * Some legacy media recorder implementations set the control byte,
+ * helping determine the relevant TOC/PMA/ATIP formats.
+ * We should support this as well.
+ */
+#define READ_TPA_CTRL_MAGIC_SESS	(0x40U)
+#define READ_TPA_CTRL_MAGIC_RAW		(0x80U)
+
+/**
+ * @brief READ TOC/PMA/ATIP Data list header
+ * The response data list shows the general description of the response data
+ * to the Read TOC/PMA/ATIP command.
+ */
+struct read_tpa_header {
+	__be16 length;
+	/* First Track/Session/Reserved Field */
+	__u8 n_first_stf;
+	/* Last Track/Session/Reserved Field */
+	__u8 n_last_stf;
+} __packed;
+
+/**
+ * @brief Response Format 0000b: Formatted TOC
+ * The response data consist of four header bytes and zero or more track
+ * descriptors.
+ */
+struct read_tpa_toc_formatted {
+	__u8 reserved1;
+#if defined(__BIG_ENDIAN_BITFIELD)
+	/**
+	 * The ADR field gives the type of information encoded in the Q Sub-channel
+	 * of the block where this TOC entry was found.
+	 */
+	__u8 addr : 4;
+	/**
+	 * The CONTROL Field indicates the attributes of the track.
+	 */
+	__u8 control : 4;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 control : 4;
+	__u8 addr : 4;
+#endif
+	/**
+	 * The Track Start Address contains the address of the first block with user
+	 * information for that track number as read from the Table of Contents.
+	 * A MSF bit of zero indicates that the Track Start Address field shall contain
+	 * a logical block address.
+	 * A MSF bit of one indicates the Logical Block Address field shall contain a
+	 * MSF address
+	 */
+	__u8 track_number;
+	__u8 reserved2;
+	/**
+	 * The Track Number field indicates the track number for that the data in the
+	 * TOC track descriptor is valid. A track number of READ_TPA_LEADOUT_TRACK
+	 * indicates that the track descriptor is for the start of the Lead-out area.
+	 */
+	__be32 start_addr_track;
+} __packed;
+
+
 #endif /* _UAPI_LINUX_CDROM_H */
-- 
2.34.1

