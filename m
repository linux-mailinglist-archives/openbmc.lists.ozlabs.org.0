Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD89B3B5044
	for <lists+openbmc@lfdr.de>; Sat, 26 Jun 2021 23:21:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GC6Hc53tgz3bxN
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 07:21:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=YczVUdW6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=YczVUdW6; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GC6Dx4w7Hz308q
 for <openbmc@lists.ozlabs.org>; Sun, 27 Jun 2021 07:18:57 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 01602413B4;
 Sat, 26 Jun 2021 21:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1624742332; x=1626556733; bh=s6lDsQktPgY555UnSshQR3ZqaHQ3iDSnDQU
 7QjnimJ8=; b=YczVUdW6xwJHXUlazEu1WEjVLfjAj2M65UCr58fUSyYZDZutL04
 YyhobO5ORQ6KKFvwk+9Bo4Zp1OhIL6DmxrdXFo4jclQLyI6x4VSTYNlU5d9l1e/K
 tAE9jPVJXfw/iSNbRf7gLzNgoa0oNvg9Ou/RIP7fIlxfZk2AZkrklhfE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dM5H7JoxMI11; Sun, 27 Jun 2021 00:18:52 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 45ED941374;
 Sun, 27 Jun 2021 00:18:52 +0300 (MSK)
Received: from localhost.localdomain (10.199.0.6) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 27
 Jun 2021 00:18:51 +0300
From: Igor Kononenko <i.kononenko@yadro.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe
 <axboe@kernel.dk>
Subject: [PATCH 6/6] FMS: Add SCSI Read Disc Information command.
Date: Sun, 27 Jun 2021 00:18:19 +0300
Message-ID: <20210626211820.107310-7-i.kononenko@yadro.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210626211820.107310-1-i.kononenko@yadro.com>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
 Igor Kononenko <i.kononenko@yadro.com>, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adds the SCSI Read Disc Information command, which should be given for
multimedia device consumers to retrieve the DVD/BD disk information
about:
* Total tracks contained at the disc Total and active sessions Border
* status(incomplete, damaged, etc.)
This information is wanted for supporting the DVD-ROM and BD-ROM
devices.

End-user-impact: Now, multimedia device consumers have a way to retrieve
                 the multimedia disk information.

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
---
 drivers/usb/gadget/function/f_mass_storage.c |  37 ++++
 include/scsi/scsi_proto.h                    |   1 +
 include/uapi/linux/cdrom.h                   | 195 +++++++++++++++++--
 3 files changed, 212 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 7e736e5594f9..d3d8a806b5e6 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -1932,6 +1932,40 @@ static void send_status(struct fsg_common *common)
 	return;
 }
 
+static int do_read_disc_info(struct fsg_common *common, struct fsg_buffhd *bh)
+{
+	struct fsg_lun *curlun = common->curlun;
+	struct cdb_disc_info *cdb = (struct cdb_disc_info *)common->cmnd;
+	disc_information *info = (disc_information *)bh->buf;
+
+	if (cdb->type != DISC_TYPE_STANDARD) {
+		LERROR(curlun,
+		       "Unsupported disc information type(%02Xh) requested\n",
+		       cdb->type);
+		return -EINVAL;
+	}
+	memset(info, 0, sizeof(disc_information));
+	info->disc_information_length = cpu_to_be16(
+		sizeof(*info) - sizeof(info->disc_information_length));
+
+	info->border_status = DISC_LAST_SESS_COMPLETE;
+	info->disc_status = DISC_STATUS_FINALIZED;
+
+	/* We only support one session per disk */
+	info->n_first_track = 1;
+	info->n_sessions_lsb = 1;
+	info->first_track_lsb = 1;
+	info->last_track_lsb = 1;
+
+	/* Setting the unrestricted use because we only support (CD/DVD/BD)-ROM */
+	info->uru = 1;
+
+	info->disc_type = DISC_FIELD_DA_ROM;
+
+	common->data_size_to_handle = sizeof(*info);
+	return 0;
+}
+
 /**
  * Attempts to guess medium type by looking at the length of the disc layout.
  */
@@ -2253,6 +2287,8 @@ static struct cdb_command_check cdb_checker_table[] = {
 	{ CDB_REG_CHECKER(TEST_UNIT_READY, 6, CDB_NO_SIZE_FIELD, DATA_DIR_NONE,
 			  0x0000, MEDIUM_REQUIRED) },
 
+	{ CDB_REG_NO_CHECKER(READ_DISC_INFORMATION, CDB_SIZE_FIELD_7,
+			     DATA_DIR_TO_HOST, MEDIUM_REQUIRED) },
 	{ CDB_REG_NO_CHECKER(GET_CONFIGURATION, CDB_SIZE_FIELD_7,
 			     DATA_DIR_TO_HOST, MEDIUM_REQUIRED) },
 
@@ -2286,6 +2322,7 @@ static struct cdb_handler cdb_handlers_table[] = {
 	{ CDB_REG_HANDLER(SYNCHRONIZE_CACHE, &do_synchronize_cache) },
 	{ CDB_REG_HANDLER(TEST_UNIT_READY, NULL) },
 
+	{ CDB_REG_HANDLER_BUFFHD(READ_DISC_INFORMATION, &do_read_disc_info) },
 	{ CDB_REG_HANDLER_BUFFHD(GET_CONFIGURATION, &do_get_configuration) },
 	/*
 	 * Although optional, this command is used by MS-Windows.  We
diff --git a/include/scsi/scsi_proto.h b/include/scsi/scsi_proto.h
index 6b2a8ee1f0a3..6728fcbd73e4 100644
--- a/include/scsi/scsi_proto.h
+++ b/include/scsi/scsi_proto.h
@@ -77,6 +77,7 @@
 #define GET_EVENT_STATUS_NOTIFICATION 0x4a
 #define LOG_SELECT            0x4c
 #define LOG_SENSE             0x4d
+#define READ_DISC_INFORMATION 0x51
 #define XDWRITEREAD_10        0x53
 #define MODE_SELECT_10        0x55
 #define RESERVE_10            0x56
diff --git a/include/uapi/linux/cdrom.h b/include/uapi/linux/cdrom.h
index 442693fdc059..460377e1a532 100644
--- a/include/uapi/linux/cdrom.h
+++ b/include/uapi/linux/cdrom.h
@@ -816,51 +816,204 @@ struct rwrt_feature_desc {
 	__u8 reserved3;
 };
 
+/* Disc Information Data Types */
+#define DISC_TYPE_STANDARD			(0x00U)
+#define DISC_TYPE_TRACK				(0x01U)
+#define DISC_TYPE_POW				(0x02U)
+
+/* Disc Status */
+#define DISC_STATUS_EMPTY			(0x00U)
+#define DISC_STATUS_INCOMPLETE		(0x01U)
+#define DISC_STATUS_FINALIZED		(0x02U)
+#define DISC_STATUS_OTHER			(0x03U)
+
+/* State of Last Session */
+#define DISC_LAST_SESS_EMPTY		(0x00U)
+#define DISC_LAST_SESS_INCOMPLETE	(0x01U)
+#define DISC_LAST_SESS_DAMAGED		(0x02U)
+#define DISC_LAST_SESS_COMPLETE		(0x03U)
+
+/* Background Format Status Codes */
+#define DISC_BACK_FMT_NEITHER		(0x00U)
+#define DISC_BACK_FMT_STARTED		(0x01U)
+#define DISC_BACK_FMT_PROGRESS		(0x02U)
+#define DISC_BACK_FMT_COMPLETED		(0x03U)
+
+/* Disc Type Field */
+#define DISC_FIELD_DA_ROM			(0x00U)
+#define DISC_FIELD_I				(0x10U)
+#define DISC_FIELD_ROM_XA			(0x20U)
+#define DISC_FIELD_UNDEF			(0xFFU)
+
+/**
+ * @brief The READ DISC INFORMATION CDB(0051h)
+ * The READ DISC INFORMATION command allows the Host to request information about
+ * the currently mounted MM disc.
+ */
+struct cdb_disc_info {
+	__u8 code;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved1 : 5;
+	/**
+	 * When a disc is present, Data Type defines the specific information requested
+	 */
+	__u8 type : 3;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 type : 3;
+	__u8 reserved1 : 5;
+#endif
+
+	__u8 reserved2[5];
+
+	__be16 length;
+
+	__u8 control;
+}  __packed;
+
 typedef struct {
 	__be16 disc_information_length;
 #if defined(__BIG_ENDIAN_BITFIELD)
-	__u8 reserved1			: 3;
-        __u8 erasable			: 1;
-        __u8 border_status		: 2;
-        __u8 disc_status		: 2;
+	/**
+	 * The Disc Information Data Type field shall be set to the reported
+	 * Disc Information Type
+	 */
+	__u8 info_data_type : 3;
+	/**
+	 * The Erasable bit, when set to one, indicates that CD-RW, DVD-RAM, DVD-RW, DVD+RW,
+	 * HD DVD-RAM, or BD-RE media is present and the Drive is capable of writing the media.
+	 * If the Erasable bit is set to zero, then either the medium is not erasable or the
+	 * Drive is unable to write the media.
+	 */
+	__u8 erasable : 1;
+	/**
+	 * The State of Last Session field specifies the recorded state of the last
+	 * session, regardless of the number of sessions on the disc.
+	 */
+	__u8 border_status : 2;
+	/* The Disc Status field indicates the recorded status of the disc */
+	__u8 disc_status : 2;
 #elif defined(__LITTLE_ENDIAN_BITFIELD)
-        __u8 disc_status		: 2;
-        __u8 border_status		: 2;
-        __u8 erasable			: 1;
-	__u8 reserved1			: 3;
+	__u8 disc_status : 2;
+	__u8 border_status : 2;
+	__u8 erasable : 1;
+	__u8 info_data_type : 3;
 #else
 #error "Please fix <asm/byteorder.h>"
 #endif
+	/**
+	 * The Number of First Track on Disc is the track number of the Logical Track that
+	 * contains LBA 0
+	 */
 	__u8 n_first_track;
 	__u8 n_sessions_lsb;
+	/**
+	 * First Track Number in Last Session (bytes 5 & 10) is the track number of the
+	 * first Logical Track in the last session.
+	 * This includes the incomplete logical track.
+	 */
 	__u8 first_track_lsb;
+	/**
+	 * Last Track Number in Last Session (bytes 6 & 11) is the track number of the last
+	 * Logical Track in the last session.
+	 * This includes the incomplete logical track.
+	 */
 	__u8 last_track_lsb;
 #if defined(__BIG_ENDIAN_BITFIELD)
-	__u8 did_v			: 1;
-        __u8 dbc_v			: 1;
-        __u8 uru			: 1;
-        __u8 reserved2			: 2;
-	__u8 dbit			: 1;
-	__u8 mrw_status			: 2;
+	/**
+	 * The DID_V (Disc ID Valid) bit, when set to one, indicates that the Disc
+	 * Identification field is valid
+	 */
+	__u8 did_v : 1;
+	/**
+	 * The DBC_V (Disc Bar Code Valid bit, when set to one, indicates that the Disc Bar
+	 * Code field (bytes 24 through 31) is valid
+	 */
+	__u8 dbc_v : 1;
+	/**
+	 * The URU (Unrestricted Use Disc) bit may be zero for special use CD-R, CD-RW,
+	 * or DVD-R, medium.
+	 * For all other media types, URU shall be set to one. When URU is zero, the mounted
+	 * disc is defined for restricted use.
+	 */
+	__u8 uru : 1;
+	/**
+	 * DAC_V indicates the validity of the Disc Application Code in byte 32. If DAC_V is
+	 * set to zero, then the Disc Application Code is not valid. If DAC_V is set to one,
+	 * the Disc Application Code is valid.
+	 */
+	__u8 dac_v: 1;
+	__u8 reserved2 : 1;
+	/**
+	 * If the disc is MRW formatted or MRW formatting (state = 01b, 10b, or 11b),
+	 * then bit 2 of byte 7 (Dbit) is a copy of the “dirty bit” from the defect table.
+	 * If Dbit is set to zero, then the MRW structures are current.
+	 * If Dbit is set to one, then the MRW structures may not be current.
+	 * When BG format status = 00b, Dbit shall be set to zero.
+	 */
+	__u8 dbit : 1;
+	/**
+	 * The BG format status is the background format status of the mounted disc.
+	 * Drives that report the Formattable Feature and either the MRW Feature or the DVD+RW
+	 * Feature, or both are required to implement Background format.
+	 * For all other Drives, this field shall be @param DISC_BACK_FMT_NEITHER.
+	 */
+	__u8 mrw_status : 2;
 #elif defined(__LITTLE_ENDIAN_BITFIELD)
-	__u8 mrw_status			: 2;
-	__u8 dbit			: 1;
-        __u8 reserved2			: 2;
-        __u8 uru			: 1;
-        __u8 dbc_v			: 1;
-	__u8 did_v			: 1;
+	__u8 mrw_status : 2;
+	__u8 dbit : 1;
+	__u8 reserved2 : 1;
+	__u8 dac_v: 1;
+	__u8 uru : 1;
+	__u8 dbc_v : 1;
+	__u8 did_v : 1;
 #endif
+	/**
+	 * The Disc Type field is associated only with CD media type
+	 */
 	__u8 disc_type;
 	__u8 n_sessions_msb;
 	__u8 first_track_msb;
 	__u8 last_track_msb;
+
+	/**
+	 * For CD-R/RW, the Disc Identification number recorded in the PMA is returned.
+	 * The Disc Identification Number is recorded in the PMA as a six-digit BCD number.
+	 * It is returned in the Disc Information Block as a 32 bit binary integer.
+	 * This value should be zero filled for all other media types.
+	 */
 	__u32 disc_id;
+	/**
+	 * The Last Session Lead-in Start Address field is dependent on medium and
+	 * recorded status.
+	 */
 	__u32 lead_in;
+	/**
+	 * The Last Possible Lead-out Start Address field is dependent on medium and
+	 * recorded status.
+	 */
 	__u32 lead_out;
+	/**
+	 * For CD, the Disc Bar Code field contains the hexadecimal value of the bar code
+	 * if the Drive has the ability to read Disc Bar Code and a bar code is present.
+	 * For all other media this field should be set to zeros.
+	 */
 	__u8 disc_bar_code[8];
+	/**
+	 *
+	 */
 	__u8 reserved3;
+	/**
+	 * The Number of OPC Tables field is the number of OPC tables that follow this field.
+	 * If OPC has not been determined for the currently mounted medium, the Number of
+	 * OPC Tables field is set to zero.
+	 * The Number of OPC Tables represents the number of disc speeds for which the OPC
+	 * values are known.
+	 * Since each OPC Table is 8 bytes in length, then the number of bytes that follow
+	 * the Number of OPC Tables field is 8 x Number of OPC Tables.
+	 */
 	__u8 n_opc;
-} disc_information;
+} __packed disc_information;
 
 typedef struct {
 	__be16 track_information_length;
-- 
2.32.0

