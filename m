Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0DB3B5041
	for <lists+openbmc@lfdr.de>; Sat, 26 Jun 2021 23:20:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GC6GQ3sFCz3c0W
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 07:20:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=I8YRZDtr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=I8YRZDtr; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GC6Dr0S9dz307J
 for <openbmc@lists.ozlabs.org>; Sun, 27 Jun 2021 07:18:52 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5C72B41381;
 Sat, 26 Jun 2021 21:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1624742326; x=1626556727; bh=kdbxWlSKUUSow8yjY7LkXm57fuM6N+KEQiA
 qv1pNhrw=; b=I8YRZDtrxFxWeVkFqpyBAO+AZgxhTE+eFMu8VdOZ8WTs4bBf7ZS
 AF7O5BuC8Xn1eBuI2sxjum7pf6fAfCTrLtOd+gzWuTQpgWhnnzgO5xOLqEp3QfAe
 DsBkewNdQrqfxHnh4hRcVPD6ILyD/JOiJtxD8h+Y5Ivs3VTaWqyrpx+I=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfmF3XcAiWiF; Sun, 27 Jun 2021 00:18:46 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7D0D741374;
 Sun, 27 Jun 2021 00:18:46 +0300 (MSK)
Received: from localhost.localdomain (10.199.0.6) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 27
 Jun 2021 00:18:46 +0300
From: Igor Kononenko <i.kononenko@yadro.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 3/6] fms: Add TOC/PMA/ATIP DVD-ROM capabilities
Date: Sun, 27 Jun 2021 00:18:16 +0300
Message-ID: <20210626211820.107310-4-i.kononenko@yadro.com>
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

The DVD-ROM required the SCSI 6.25 READ TOC/PMA/ATIP Command formats:
 * Response Format 0000b: Formatted TOC
 * Response Format 0001b: Multi-session Information
(MMC-6 Specification).

This patch adds an implementation of that described above formats.

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
---
 drivers/usb/gadget/function/f_mass_storage.c |  99 +++++++++--
 drivers/usb/gadget/function/storage_common.c |  10 +-
 include/uapi/linux/cdrom.h                   | 177 +++++++++++++++++++
 3 files changed, 261 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index c3fddee21b53..4865937799aa 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -223,6 +223,7 @@
 #include <linux/usb/composite.h>
 
 #include <linux/nospec.h>
+#include <linux/cdrom.h>
 
 #include "configfs.h"
 
@@ -1319,29 +1320,93 @@ static int do_read_header(struct fsg_common *common, struct fsg_buffhd *bh)
 
 static int do_read_toc(struct fsg_common *common, struct fsg_buffhd *bh)
 {
-	struct fsg_lun	*curlun = common->curlun;
-	int		msf = common->cmnd[1] & 0x02;
-	int		start_track = common->cmnd[6];
-	u8		*buf = (u8 *)bh->buf;
+	struct fsg_lun *curlun = common->curlun;
+	struct cdb_read_toc_pma_atip *cdb =
+		(struct cdb_read_toc_pma_atip *)common->cmnd;
+	struct read_tpa_header *header = (struct read_tpa_header *)bh->buf;
+	struct read_tpa_toc_formatted *data =
+		(struct read_tpa_toc_formatted *)((u8 *)bh->buf +
+						  sizeof(*header));
+	size_t data_size = sizeof(*header);
 
-	if ((common->cmnd[1] & ~0x02) != 0 ||	/* Mask away MSF */
-			start_track > 1) {
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
+
+	/* Currently support response format 0000b: Formatted TOC only */
+	if (cdb->format > CDB_TPA_MULTI_SESS_INFO) {
+		LDBG(curlun, "Unsupported TOC/PMA/ATIP format: %02Xh\n",
+		    cdb->format);
 		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
 		return -EINVAL;
 	}
 
-	memset(buf, 0, 20);
-	buf[1] = (20-2);		/* TOC data length */
-	buf[2] = 1;			/* First track number */
-	buf[3] = 1;			/* Last track number */
-	buf[5] = 0x16;			/* Data track, copying allowed */
-	buf[6] = 0x01;			/* Only track is number 1 */
-	store_cdrom_address(&buf[8], msf, 0);
+	/*
+	 * We only support one track per disk.
+	 * We also needs to indicate the number of the last track
+	 */
+	if (cdb->number > 1 && cdb->number != READ_TPA_LEADOUT_TRACK) {
+		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
+		return -EINVAL;
+	}
 
-	buf[13] = 0x16;			/* Lead-out track is data */
-	buf[14] = 0xAA;			/* Lead-out track number */
-	store_cdrom_address(&buf[16], msf, curlun->num_sectors);
-	common->data_size_to_handle = 20;
+	/*
+	 * MULTI-SESSIOIN information must be reported only for first track.
+	 */
+	if (cdb->format == CDB_TPA_MULTI_SESS_INFO && cdb->number > 1) {
+		curlun->sense_data = SS_INVALID_FIELD_IN_CDB;
+		return -EINVAL;
+	}
+
+	memset(header, 0, sizeof(*header));
+	header->n_first_stf = 1;
+	header->n_last_stf = 1;
+
+	memset(data, 0, sizeof(*data));
+	data->addr = 1;
+	data->control = TPA_SECTOR_MODE2_MIXED;
+	data->track_number = cdb->number;
+	data_size += sizeof(*data);
+
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
+
+		data += 1; /* Add one more descriptor */
+		data_size += sizeof(*data);
+		memset(data, 0, sizeof(*data));
+		/* setting the lead-out track info. First part of data*/
+		data->addr = 1;
+		data->control = TPA_SECTOR_MODE2_MIXED;
+		data->track_number = READ_TPA_LEADOUT_TRACK;
+	}
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
 	return 0;
 }
 
diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
index b859a158a414..b883b8b7b05b 100644
--- a/drivers/usb/gadget/function/storage_common.c
+++ b/drivers/usb/gadget/function/storage_common.c
@@ -24,6 +24,7 @@
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/usb/composite.h>
+#include <linux/cdrom.h>
 
 #include "storage_common.h"
 
@@ -295,14 +296,7 @@ void store_cdrom_address(u8 *dest, int msf, u32 addr)
 {
 	if (msf) {
 		/* Convert to Minutes-Seconds-Frames */
-		addr >>= 2;		/* Convert to 2048-byte frames */
-		addr += 2*75;		/* Lead-in occupies 2 seconds */
-		dest[3] = addr % 75;	/* Frames */
-		addr /= 75;
-		dest[2] = addr % 60;	/* Seconds */
-		addr /= 60;
-		dest[1] = addr;		/* Minutes */
-		dest[0] = 0;		/* Reserved */
+		lba_to_msf(addr, &dest[1], &dest[2], &dest[3]);
 	} else {
 		/* Absolute sector */
 		put_unaligned_be32(addr, dest);
diff --git a/include/uapi/linux/cdrom.h b/include/uapi/linux/cdrom.h
index 6c34f6e2f1f7..1d7b4333c3aa 100644
--- a/include/uapi/linux/cdrom.h
+++ b/include/uapi/linux/cdrom.h
@@ -947,4 +947,181 @@ struct rm_feature_desc {
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
2.32.0

