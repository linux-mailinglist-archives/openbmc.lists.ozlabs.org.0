Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC287F14B
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 21:39:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O0XUH4D1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tz6Cx6Trfz3vY4
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 07:39:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O0XUH4D1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tz66m6WPMz3cDw
	for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2024 07:35:12 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-513e4dd6ca4so1666829e87.0
        for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710794110; x=1711398910; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/kSPulHRPJ8wa+xVBHDZ66xmbwTUbdkXXUM5WuDLTo=;
        b=O0XUH4D12p1ASdiZPVvwZGwZtPhrE9vOhIR3tcG9uhmsd4PQvs+TIKLuqyWA/UBzzD
         xtnGYAmXkXqrvrFzGp4MmrgVDXc/q4ZEXYC5IxQK0YbCYh5VQK5gmTa5B9UJY2y0yXbp
         JOJ9fISdJeqFtcqI63nk6q7sni0Ov9to66i9LWfw2kNGY2ZcJug3lKSF4h/1/FHs58MD
         HQfNJyUPyZVW3MO+6OiquWIeL5sJwsopYOEBPkHWWAqpww4KMt4oU+1E/4WONMuniocv
         1T6ZSPZyZfhiG9ml4geJaxYi2IdcJkCif2Te6UpzuiReFbi0WImzMfTCeEtIfpWHLIZ4
         eP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710794110; x=1711398910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/kSPulHRPJ8wa+xVBHDZ66xmbwTUbdkXXUM5WuDLTo=;
        b=TEkF2n/R/DAb3jp44gHd9PaGGdvbgeE10vMZYSTj0AYsFIyw5Xy+pvq2axJWHiGu/F
         oFhlTwFjS8wNEA7J/IYlHfJhWtV6+1+iQU80diikqbx7yYH1S0bXP2vv51U6oYfK5cGO
         LHx7VRf0mwVyijo4lrkp8M/EV7zJrYcB0tg2gIiKUvQBEv7DBVleY6frutc+/D8LHrbL
         vq8m62AT53Faqp2P9zRktg7v8lR6SjCRNEOhNrGtbqc8zDvLCUfifGrPR/tsLgRHSXFQ
         cJkFArbdOmtew4c7C6jHMsFfWzrigBAi9N2dpVtuts7OZw9YbsaMQIqW23n730tLLE2x
         OoFQ==
X-Gm-Message-State: AOJu0YyavkK6yHz9jsTpLKK2VaLjKsTVSfLC8t21CsllXvl0KZZ4xqm/
	quKmfLS0H/uUjZsFO5BnkUUHKx1jWcHfPgQcYsy6aBm1z7ytnhIdDha//xnaAds=
X-Google-Smtp-Source: AGHT+IFja27yK+Z++BtpfPTP2Yx4+HUdYlRhOm81v9irHjmFQzQNxx46VP3EqDsgiEihSqE2CQbPHA==
X-Received: by 2002:a19:690e:0:b0:513:dce2:9929 with SMTP id e14-20020a19690e000000b00513dce29929mr224165lfc.1.1710794109397;
        Mon, 18 Mar 2024 13:35:09 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id o12-20020ac24bcc000000b00513c271b67asm649169lfq.239.2024.03.18.13.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:35:09 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 42IKZ6n2029101;
	Mon, 18 Mar 2024 23:35:07 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 42IKZ6Xr029100;
	Mon, 18 Mar 2024 23:35:06 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH downstream-hack dev-6.6 5/6] FMS: Add the SCSI Get Configuration command.
Date: Mon, 18 Mar 2024 23:34:44 +0300
Message-Id: <20240318203445.29036-6-fercerpav@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318203445.29036-1-fercerpav@gmail.com>
References: <20240318203445.29036-1-fercerpav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The SCSI Get Configuration command is required to obtain information
about a CD/DVD/BL device (MMC-6, 6.5 GET CONFIGURATION Command).

The aforementioned ability will be expected by several multimedia
consumers, such as OS MS Windows, OS ESXi, etc., for selecting the
appropriate FS driver.

End-user-impact: The FMS devices consumers can now retrieve their
                 capabilities.
                 FMS supports the ISO-13346(UDF) multimedia file systems

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/ata/libata-zpodd.c                   |   8 +-
 drivers/usb/gadget/function/f_mass_storage.c | 222 +++++
 include/scsi/scsi_proto.h                    |   1 +
 include/uapi/linux/cdrom.h                   | 836 ++++++++++++++++++-
 4 files changed, 1037 insertions(+), 30 deletions(-)

diff --git a/drivers/ata/libata-zpodd.c b/drivers/ata/libata-zpodd.c
index eefda51f97d3..e49ff795a506 100644
--- a/drivers/ata/libata-zpodd.c
+++ b/drivers/ata/libata-zpodd.c
@@ -54,7 +54,7 @@ static enum odd_mech_type zpodd_get_mech_type(struct ata_device *dev)
 {
 	char *buf;
 	unsigned int ret;
-	struct rm_feature_desc *desc;
+	struct cdf_removable_medium *desc;
 	struct ata_taskfile tf;
 	static const char cdb[ATAPI_CDB_LEN] = {  GPCMD_GET_CONFIGURATION,
 			2,      /* only 1 feature descriptor requested */
@@ -82,15 +82,15 @@ static enum odd_mech_type zpodd_get_mech_type(struct ata_device *dev)
 		return ODD_MECH_TYPE_UNSUPPORTED;
 	}
 
-	if (be16_to_cpu(desc->feature_code) != 3) {
+	if (be16_to_cpu(desc->code) != 3) {
 		kfree(buf);
 		return ODD_MECH_TYPE_UNSUPPORTED;
 	}
 
-	if (desc->mech_type == 0 && desc->load == 0 && desc->eject == 1) {
+	if (desc->mechanism == 0 && desc->load == 0 && desc->eject == 1) {
 		kfree(buf);
 		return ODD_MECH_TYPE_SLOT;
-	} else if (desc->mech_type == 1 && desc->load == 0 &&
+	} else if (desc->mechanism == 1 && desc->load == 0 &&
 		   desc->eject == 1) {
 		kfree(buf);
 		return ODD_MECH_TYPE_DRAWER;
diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 395c4d39efae..e7bd62445a73 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -339,6 +339,87 @@ struct cdb_handler {
 	/* SCSI command ASCII name */
 	char *name;
 };
+/*-------------------------------------------------------------------------*/
+
+#define CDF_PROFILES_COUNT (ARRAY_SIZE(cdf_supported_profiles))
+
+/* List of supported profiles */
+static struct mmc_profile cdf_supported_profiles[] = {
+	{ .profile = cpu_to_be16(MMC_PROFILE_BD_ROM) },
+	{ .profile = cpu_to_be16(MMC_PROFILE_DVD_ROM) },
+	{ .profile = cpu_to_be16(MMC_PROFILE_CD_ROM) },
+};
+
+struct cdf_profile_list_custom {
+	struct cdf_profile_list header;
+	/* We support several profiles, whose indices are declared in the
+	 * enum above
+	 */
+	struct mmc_profile profiles[CDF_PROFILES_COUNT];
+} __packed;
+
+/**
+ * Type to allocate of all supported features
+ * @param populate - callback to fill the specified feature data which
+ * is depended by medium
+ */
+struct cdr_features;
+struct cdr_features {
+	union {
+		struct cdf_profile_list_custom profile_list;
+		struct cdf_core core;
+		struct cdf_morphing morphing;
+		struct cdf_removable_medium removable;
+		struct cdf_random_readable random_readable;
+		struct cdf_multi_read multi_read;
+		struct cdf_cd_read cd_read;
+		struct cdf_dvd_read dvd_read;
+		struct cdf_rt_streaming rt_streaming;
+	} __packed feature;
+	void (*populate)(struct fsg_common *common,
+			 struct cdr_features **features);
+};
+
+/**
+ * @brief Adjust the Profile List members of actual data which is depended
+ * on the inserted medium image
+ *
+ * @param common - the FSG instance
+ * @param feature - a list of profile descriptors which to be configured
+ */
+static void cdf_populate_profile_list(struct fsg_common *common,
+				      struct cdr_features **feature);
+
+#define CDF_SET_VPC(v, p, c) .vpc = { .ver = (v), .per = (p), .cur = (c) }
+
+#define CDF_FT_SIZE(member)                                                    \
+	((sizeof(((struct cdr_features *)0)->feature.member)) -                \
+	 sizeof(struct cdb_ft_generic))
+
+#define CDR_FT_ITEM(item, c, ...)                                              \
+	CDR_FT_ITEM_S(item, c, CDF_FT_SIZE(item), __VA_ARGS__)
+
+#define CDR_FT_ITEM_S(item, c, s, ...)                                         \
+	.feature.item = { .code = cpu_to_be16(c), .length = (s), __VA_ARGS__ }
+
+static struct cdr_features features_table[] = {
+	{ CDR_FT_ITEM_S(profile_list.header, CDF_PROFILE_LIST_CODE,
+			CDF_FT_SIZE(profile_list), CDF_SET_VPC(0, 1, 1)),
+	  .populate = &cdf_populate_profile_list },
+	{ CDR_FT_ITEM(core, CDF_CORE, CDF_SET_VPC(2, 1, 1), .dbevent = 1,
+		      .interface = cpu_to_be32(CF_PIS_USB)) },
+	{ CDR_FT_ITEM(morphing, CDF_MORPHING_CODE, CDF_SET_VPC(1, 1, 1),
+		      .ocevent = 1) },
+	{ CDR_FT_ITEM(removable, CDF_REMOVEBLE_MEDIA, CDF_SET_VPC(2, 1, 1),
+		      .mechanism = CDF_LMT__TRAY_TYPE, .eject = 1, .lock = 1) },
+	{ CDR_FT_ITEM(random_readable, CDF_RANDOM_READ, CDF_SET_VPC(0, 0, 1),
+		      .block_size = cpu_to_be32(CD_FRAMESIZE),
+		      .blocking = cpu_to_be16(0x10), .pp = 1) },
+	{ CDR_FT_ITEM(dvd_read, CDF_DVD_READ, CDF_SET_VPC(2, 1, 1),
+		      .multi110 = 1, .dualr = 1) },
+	{ CDR_FT_ITEM(rt_streaming, CDF_REAL_TIME_STREAM, CDF_SET_VPC(5, 0, 1),
+		      .rbcb = 1, .scs = 1, .mp2a = 1, .wspd = 1, .sw = 1) },
+};
 
 /*------------------------------------------------------------------------*/
 
@@ -1877,6 +1958,143 @@ static void send_status(struct fsg_common *common)
 	return;
 }
 
+/**
+ * Attempts to guess medium type by looking at the length of the disc layout.
+ */
+static inline __be16 cdr_guess_medium_type(struct fsg_common *common)
+{
+	struct fsg_lun *curlun = common->curlun;
+	size_t length = curlun->num_sectors;
+
+	if (length <= CD_MAX_FRAMES) {
+		LDBG(curlun, "Disc layout size implies CD-ROM image\n");
+		return MMC_PROFILE_CD_ROM;
+	} else if (length <= CD_DVD_MAX_FRAMES) {
+		LDBG(curlun,
+		     "Disc layout size implies single-layer DVD-ROM image\n");
+		return MMC_PROFILE_DVD_ROM;
+	} else if (length <= CD_DVDDL_MAX_FRAMES) {
+		LDBG(curlun,
+		     "Disc layout size implies dual-layer DVD-ROM image\n");
+		return MMC_PROFILE_DVD_ROM;
+	} else if (length <= CD_BD_MAX_FRAMES) {
+		LDBG(curlun,
+		     "Disc layout size implies single-layer BD-ROM image\n");
+		return MMC_PROFILE_BD_ROM;
+	} else if (length <= CD_BDDL_MAX_FRAMES) {
+		LDBG(curlun,
+		     "Disc layout size implies dual-layer BD-ROM image\n");
+		return MMC_PROFILE_BD_ROM;
+	}
+
+	LDBG(curlun,
+	     "Disc layout size (%u) exceeds all known media types, assuming BD - ROM !\n",
+	     length);
+	return MMC_PROFILE_BD_ROM;
+}
+
+/* Adjust current profile which depended on an inserted medium */
+static inline void cdf_populate_profile_list(struct fsg_common *common,
+					     struct cdr_features **feature)
+{
+	__be16 current_media_type = cdr_guess_medium_type(common);
+	struct mmc_profile *profiles =
+		(*feature)->feature.profile_list.profiles;
+	int i;
+
+	/* copy profile list to the response buffer */
+	memcpy(profiles, cdf_supported_profiles,
+	       sizeof(cdf_supported_profiles));
+	for (i = 0; i < CDF_PROFILES_COUNT; ++i) {
+		/*
+		 * Reset the current profile bit,
+		 * because it might be set from the previous one
+		 */
+		profiles[i].current_p = 0;
+		if (be16_to_cpu(profiles[i].profile) == current_media_type) {
+			DBG(common, "Fill current profile: curr=(%04Xh)\n",
+			    be16_to_cpu(profiles[i].profile));
+			profiles[i].current_p = 1;
+		}
+	}
+}
+
+static int do_get_configuration(struct fsg_common *common,
+				struct fsg_buffhd *bh)
+{
+	struct fsg_lun *curlun = common->curlun;
+	int i;
+	struct cdb_get_configuration *cdb =
+		(struct cdb_get_configuration *)common->cmnd;
+	size_t buffer_size = sizeof(struct feature_header);
+	size_t generic_desc_size = sizeof(struct cdb_ft_generic);
+	struct feature_header *ret_header = (struct feature_header *)bh->buf;
+	u8 *ret_data = ((u8 *)ret_header) + buffer_size;
+
+	LDBG(curlun, "Requesting features from 0x%04X, with RT flag 0x%02X\n",
+	     be16_to_cpu(cdb->sfn), cdb->rt);
+
+	if (!common->curlun || !common->curlun->cdrom)
+		return -EINVAL;
+
+	/* Go over *all* features, and copy them according to RT value */
+	for (i = 0; i < ARRAY_SIZE(features_table); ++i) {
+		struct cdb_ft_generic *generic =
+			(struct cdb_ft_generic *)&features_table[i];
+		struct cdr_features *feature = &features_table[i];
+
+		if (feature->populate != NULL)
+			feature->populate(common, &feature);
+
+		// a) RT is 0x00 and feature's code >= SFN
+		// b) RT is 0x01, feature's code >= SFN and feature has 'current' bit set
+		// c) RT is 0x02 and feature's code == SFN
+
+		if (be16_to_cpu(generic->code) >= be16_to_cpu(cdb->sfn)) {
+			if ((cdb->rt == CDR_CFG_RT_FULL) ||
+			    (cdb->rt == CDR_CFG_RT_CURRENT &&
+			     generic->vpc.cur) ||
+			    (cdb->rt == CDR_CFG_RT_SPECIFIED_SFN &&
+			     be16_to_cpu(generic->code) ==
+				     be16_to_cpu(cdb->sfn))) {
+				LDBG(curlun, "Copying feature 0x%04X\n",
+				     be16_to_cpu(generic->code));
+
+				memset(ret_data, 0,
+				       (generic->length + generic_desc_size));
+				/* Copy feature */
+				memcpy(ret_data, feature,
+				       (generic->length + generic_desc_size));
+				buffer_size +=
+					(generic->length + generic_desc_size);
+				ret_data +=
+					(generic->length + generic_desc_size);
+
+				/* Break the loop if RT is CDR_CFG_RT_SPECIFIED_SFN */
+				if (cdb->rt == CDR_CFG_RT_SPECIFIED_SFN) {
+					LDBG(curlun,
+					     "Got the feature we wanted (0x%04X), breaking the loop\n",
+					     be16_to_cpu(cdb->sfn));
+					break;
+				}
+			}
+		}
+	}
+
+	memset(ret_header, 0, sizeof(struct feature_header));
+	/* Header */
+	ret_header->data_len = cpu_to_be32(buffer_size - generic_desc_size);
+	ret_header->curr_profile =
+		cpu_to_be16(cdr_guess_medium_type(common));
+
+	dump_msg(common, "feature header", (u8 *)ret_header,
+		 sizeof(struct feature_header));
+
+	dump_msg(common, "features table", (u8 *)bh->buf, buffer_size);
+
+	common->data_size_to_handle = buffer_size;
+	return 0;
+}
 
 /*-------------------------------------------------------------------------*/
 
@@ -2063,6 +2281,9 @@ static struct cdb_command_check cdb_checker_table[] = {
 	{ CDB_REG_CHECKER(TEST_UNIT_READY, 6, CDB_NO_SIZE_FIELD, DATA_DIR_NONE,
 			  0x0000, MEDIUM_REQUIRED) },
 
+	{ CDB_REG_NO_CHECKER(GET_CONFIGURATION, CDB_SIZE_FIELD_7,
+			     DATA_DIR_TO_HOST, MEDIUM_REQUIRED) },
+
 	{ CDB_REG_CHECKER_BLK(VERIFY, 10, CDB_NO_SIZE_FIELD, DATA_DIR_NONE,
 			      0x0000, MEDIUM_REQUIRED) },
 	{ CDB_REG_CHECKER_BLK(WRITE_6, 6, CDB_SIZE_FIELD_4, DATA_DIR_FROM_HOST,
@@ -2096,6 +2317,7 @@ static struct cdb_handler cdb_handlers_table[] = {
 	{ CDB_REG_HANDLER(SYNCHRONIZE_CACHE, &do_synchronize_cache) },
 	{ CDB_REG_HANDLER(TEST_UNIT_READY, NULL) },
 
+	{ CDB_REG_HANDLER_BUFFHD(GET_CONFIGURATION, &do_get_configuration) },
 	/*
 	 * Although optional, this command is used by MS-Windows.  We
 	 * support a minimal version: BytChk must be 0.
diff --git a/include/scsi/scsi_proto.h b/include/scsi/scsi_proto.h
index 07d65c1f59db..4c6740ebf631 100644
--- a/include/scsi/scsi_proto.h
+++ b/include/scsi/scsi_proto.h
@@ -73,6 +73,7 @@
 #define UNMAP		      0x42
 #define READ_TOC              0x43
 #define READ_HEADER           0x44
+#define GET_CONFIGURATION     0x46
 #define GET_EVENT_STATUS_NOTIFICATION 0x4a
 #define LOG_SELECT            0x4c
 #define LOG_SENSE             0x4d
diff --git a/include/uapi/linux/cdrom.h b/include/uapi/linux/cdrom.h
index 2c4609c8d1dd..c42b5ac3e8cd 100644
--- a/include/uapi/linux/cdrom.h
+++ b/include/uapi/linux/cdrom.h
@@ -368,6 +368,12 @@ struct cdrom_timed_media_change_info {
 /* most drives don't deliver everything: */
 #define CD_FRAMESIZE_RAW1 (CD_FRAMESIZE_RAW-CD_SYNC_SIZE) /*2340*/
 #define CD_FRAMESIZE_RAW0 (CD_FRAMESIZE_RAW-CD_SYNC_SIZE-CD_HEAD_SIZE) /*2336*/
+/* total frames on the specific medium-disk format */
+#define CD_MAX_FRAMES			(CD_MINS * CD_SECS * CD_FRAMES)
+#define CD_DVD_MAX_FRAMES		(2295104)
+#define CD_DVDDL_MAX_FRAMES	(4173824)
+#define CD_BD_MAX_FRAMES		(12219392)
+#define CD_BDDL_MAX_FRAMES		(24438784)
 
 #define CD_XA_HEAD        (CD_HEAD_SIZE+CD_SUBHEAD_SIZE) /* "before data" part of raw XA frame */
 #define CD_XA_TAIL        (CD_EDC_SIZE+CD_ECC_SIZE) /* "after data" part of raw XA frame */
@@ -915,12 +921,173 @@ typedef struct {
 	__be32 last_rec_address;
 } track_information;
 
+/* CDB Get Configuration command */
+
+/**
+ * The Drive shall return the Feature Header and all Feature Descriptors supported by the
+ * Drive without regard to currency
+ */
+#define CDR_CFG_RT_FULL 0x00
+/**
+ * The Drive shall return the Feature Header and only those Feature Descriptors in which
+ * the Current bit is set to one.
+ */
+#define CDR_CFG_RT_CURRENT 0x01
+/**
+ * The Feature Header and the Feature Descriptor identified by Starting Feature Number
+ * shall be returned. If the Drive does not support the specified feature, only the Feature
+ * Header shall be returned.
+ */
+#define CDR_CFG_RT_SPECIFIED_SFN 0x02
+#define CDR_CFG_RT_RESERVED 0x03
+
+/**
+ * @brief GET CONFIGURATION Command
+ * The GET CONFIGURATION command provides a Host with information about Drive capabilities;
+ * both current and potential.
+ *
+ * @note The command shall not return a CHECK CONDITION Status due to a pending
+ * UNIT ATTENTION Condition.
+ */
+struct cdb_get_configuration {
+	__u8 code;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved1 : 6;
+	/* The RT field identifies the type of data to be returned by the Drive */
+	__u8 rt : 2;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 rt : 2;
+	__u8 reserved1 : 6;
+#endif
+	/**
+	 * The Starting Feature Number field indicates the first Feature number to be returned.
+	 * All supported Feature numbers higher than the Starting Feature Number shall be
+	 * returned.
+	 */
+	__be16 sfn;
+	__u8 reserved2[3];
+	/**
+	 * The Allocation Length field specifies the maximum length in bytes of the
+	 * Get Configuration response data. An Allocation Length field of zero indicates that no
+	 * data shall be transferred
+	 */
+	__be16 length;
+	__u8 control;
+
+} __packed;
+
+/* Features */
+
+/* Feature and Profile Descriptors*/
+
+/**
+ * @brief The Version, Persisten and Current byte.
+ * This structure is required for many CDB features.
+ */
+struct cdb_ft_vpc_byte {
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved1 : 2;
+	/**
+	 * The Version field is reserved and shall be set to zero unless otherwise specified
+	 * within the Feature Description
+	 */
+	__u8 ver : 4;
+	/**
+	 * The Persistent bit, when set to zero, shall indicate that this Feature may change
+	 * its current status.
+	 * When set to one, shall indicate that this Feature is always active.
+	 * The Drive shall not set this bit to one if the Current bit is, or may become, zero.
+	 */
+	__u8 per : 1;
+	/**
+	 * The Current bit, when set to zero, indicates that this Feature is not currently
+	 * active and that the Feature Dependent Data may not be valid.
+	 * When set to one, this Feature is currently active and the Feature Dependent Data is
+	 * valid.
+	 */
+	__u8 cur : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 cur : 1;
+	__u8 per : 1;
+	__u8 ver : 4;
+	__u8 reserved1 : 2;
+#endif
+} __packed;
+
+/**
+ * @brief Feature Descriptor generic
+ * A Feature Descriptor shall describe each Feature supported by a Drive. All
+ * Feature descriptors shall be a multiple of four bytes
+ */
+struct cdb_ft_generic {
+	/**
+	 * The Feature Code field shall identify a Feature supported by the Drive
+	 */
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	/**
+	 * The Additional Length field indicates the number of Feature specific
+	 * bytes that follow this header. This field shall be an integral multiple
+	 * of 4
+	 */
+	__u8 length;
+} __packed;
+
+/* Profile list */
+#define MMC_PROFILE_NONE 0x0000
+#define MMC_PROFILE_CD_ROM 0x0008
+#define MMC_PROFILE_CD_R 0x0009
+#define MMC_PROFILE_CD_RW 0x000A
+#define MMC_PROFILE_DVD_ROM 0x0010
+#define MMC_PROFILE_DVD_R_SR 0x0011
+#define MMC_PROFILE_DVD_RAM 0x0012
+#define MMC_PROFILE_DVD_RW_RO 0x0013
+#define MMC_PROFILE_DVD_RW_SR 0x0014
+#define MMC_PROFILE_DVD_R_DL_SR 0x0015
+#define MMC_PROFILE_DVD_R_DL_JR 0x0016
+#define MMC_PROFILE_DVD_RW_DL 0x0017
+#define MMC_PROFILE_DVD_DDR 0x0018
+#define MMC_PROFILE_DVD_PLUS_RW 0x001A
+#define MMC_PROFILE_DVD_PLUS_R 0x001B
+#define MMC_PROFILE_DVD_PLUS_RW_DL 0x002A
+#define MMC_PROFILE_DVD_PLUS_R_DL 0x002B
+#define MMC_PROFILE_BD_ROM 0x0040
+#define MMC_PROFILE_BD_R_SRM 0x0041
+#define MMC_PROFILE_BD_R_RRM 0x0042
+#define MMC_PROFILE_BD_RE 0x0043
+#define MMC_PROFILE_HDDVD_ROM 0x0050
+#define MMC_PROFILE_HDDVD_R 0x0051
+#define MMC_PROFILE_HDDVD_RAM 0x0052
+#define MMC_PROFILE_HDDVD_RW 0x0053
+#define MMC_PROFILE_HDDVD_R_DL 0x0058
+#define MMC_PROFILE_HDDVD_RW_DL 0x005A
+#define MMC_PROFILE_INVALID 0xFFFF
+
+/**
+ * @brief The CDB Feature Header
+ * Response data consists of a header field and zero or more variable length
+ * Feature descriptors
+ */
 struct feature_header {
+	/**
+	 * The Data Length field indicates the amount of data available given a
+	 * sufficient allocation length following this field.
+	 * This length shall not be truncated due to an insufficient Allocation
+	 * Length
+	 */
 	__u32 data_len;
 	__u8 reserved1;
 	__u8 reserved2;
+	/**
+	 * The Current Profile field shall identify one of the profiles from the
+	 * Profile List Feature. If there are no Profiles currently active, this
+	 * field shall contain zero.
+	 */
 	__u16 curr_profile;
-};
+} __packed;
 
 struct mode_page_header {
 	__be16 mode_data_length;
@@ -931,41 +1098,658 @@ struct mode_page_header {
 	__be16 desc_length;
 };
 
-/* removable medium feature descriptor */
-struct rm_feature_desc {
-	__be16 feature_code;
+/**
+ * @brief Profile descriptors are returned in the order of preferred
+ * operation – most desirable to least desirable. e.g., a DVD-ROM
+ * that is also able to read a CD-ROM should list the DVD-ROM
+ * Profile first and the CD-ROM Profile second.
+ */
+struct mmc_profile {
+	/* The Profile Number identifies a Profile */
+	__be16 profile;
+
 #if defined(__BIG_ENDIAN_BITFIELD)
-	__u8 reserved1:2;
-	__u8 feature_version:4;
-	__u8 persistent:1;
-	__u8 curr:1;
+	__u8 reserved1 : 7;
+	/**
+	 * The current_p bit, when set to one, shall indicate that this
+	 * Profile is currently active.
+	 */
+	__u8 current_p : 1;
 #elif defined(__LITTLE_ENDIAN_BITFIELD)
-	__u8 curr:1;
-	__u8 persistent:1;
-	__u8 feature_version:4;
-	__u8 reserved1:2;
+	__u8 current_p : 1;
+	__u8 reserved1 : 7;
 #endif
-	__u8 add_len;
+
+	__u8 reserved2;
+} __packed;
+
+/**
+ * @brief Profile List Feature (0000h)
+ *
+ * This Feature identifies Profiles supported by the Drive.
+ * Profiles are defined as collections of Features and provide a method
+ * to quickly determine the Drive’s type.
+ */
+struct cdf_profile_list {
+	/* The Feature Code */
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+	/**
+	 * The Additional Length field shall be set
+	 * to ((number of Profile Descriptors) * 4).
+	 */
+	__u8 length;
+} __packed;
+
+/**
+ * @brief The core feature: phisycal interface standards
+ */
+enum cdf_cf_pis {
+	CF_PIS_UNSPECIFIED = 0x00000000U,
+	CF_PIS_SCSI_FAMILY,
+	CF_PIS_ATAPI,
+	CF_PIS_IEEE_1394_1995,
+	CF_PIS_IEEE_1394A,
+	CF_PIS_FIBRE_CHANNEL,
+	CF_PIS_IEEE_1394_B,
+	CF_PIS_USB,
+	CF_PIS_RESERVED,
+	CF_PIS_DEF_INCITS = 0x00010000U,
+	CF_PIS_DEF_SFF = 0x00020000U,
+	CF_PIS_DEF_IEEE = 0x00030000U,
+	CF_PIS_DEF_RESERVED = 0x00040000U
+};
+
+/**
+ * @brief Core Feature (0001h)
+ * This Feature identifies a Drive that supports functionality common
+ * to all devices.
+ */
+struct cdf_core {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	/* The Additional Length field shall be set to 8. */
+	__u8 length;
+	/**
+	 * The Physical Interface Standard field shall be set to a value
+	 * selected from @enum cdf_cf_pis
+	 * It is possible that more than one physical interface exists
+	 * between the Host and Drive, e.g., an IEEE1394 Host connecting
+	 * to an ATAPI bridge to an ATAPI Drive. The Drive may not be aware
+	 * of interfaces beyond the ATAPI.
+	 */
+	__be32 interface;
+
 #if defined(__BIG_ENDIAN_BITFIELD)
-	__u8 mech_type:3;
-	__u8 load:1;
-	__u8 eject:1;
-	__u8 pvnt_jmpr:1;
-	__u8 dbml:1;
-	__u8 lock:1;
+	__u8 reserved2 : 6;
+	/**
+	 * The INQ2 bit permits the Drive to indicate support for certain
+	 * features of the INQUIRY command. If INQ2 is set to one, the
+	 * Drive shall support validation of EVPD, Page Code, and the
+	 * 16-bit Allocation Length fields
+	 */
+	__u8 inq2 : 1;
+	/**
+	 * DBE (Device Busy Event) shall be set to one.
+	 */
+	__u8 dbevent : 1;
 #elif defined(__LITTLE_ENDIAN_BITFIELD)
-	__u8 lock:1;
-	__u8 dbml:1;
-	__u8 pvnt_jmpr:1;
-	__u8 eject:1;
-	__u8 load:1;
-	__u8 mech_type:3;
+	__u8 dbevent : 1;
+	__u8 inq2 : 1;
+	__u8 reserved2 : 6;
+#endif
+
+	__u8 reserved3[3];
+} __packed;
+
+/**
+ * @brief Morphing Feature (0002h)
+ * This Feature identifies the ability of the Drive to notify
+ * A Host about operational changes and accept Host requests to
+ * prevent operational changes.
+ */
+struct cdf_morphing {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	__u8 length;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved2 : 6;
+	__u8 ocevent : 1;
+	__u8 async : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 async : 1;
+	__u8 ocevent : 1;
+	__u8 reserved2 : 6;
+#endif
+
+	__u8 reserved3[3];
+} __packed;
+
+/**
+ * @brief Removable Medium: Loading Mechanism Types
+ */
+enum cdf_removable_media_lmt {
+	CDF_LMT__CADDY_SLOT_TYPE,
+	CDF_LMT__TRAY_TYPE,
+	CDF_LMT__POP_UP_TYPE,
+	CDF_LMT__RESERVED1,
+	CDF_LMT__EMBEDDED_INDIVIDUALLY,
+	CDF_LMT__EMBEDDED_MAGAZINE,
+	CDF_LMT__RESERVED2,
+};
+
+/**
+ * @brief Removable Medium Feature (0003h)
+ *
+ * This Feature identifies a Drive that has a medium that is removable.
+ * Media shall be considered removable if it is possible to remove it
+ * from the loaded position, i.e., a single mechanism changer, even if
+ * the media is captive to the changer.
+ *
+ * The Drive shall generate Events for media changes.
+ * Event Notification Class 4 (Media Events) shall be supported. This
+ * includes reporting user requests to load/eject the medium.
+ */
+struct cdf_removable_medium {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+	/* The Additional Length field shall be set to 4. */
+	__u8 length;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	/**
+	 * The Loading Mechanism Type field shall be set according to
+	 * @enum cdf_removable_media_lmt
+	 */
+	__u8 mechanism : 3;
+	/**
+	 * If the Load bit is set to zero, the Drive is unable to load
+	 * the medium or cartridge via the START STOP UNIT command with
+	 * the LoEj bit set to one, e.g. the tray type loading mechanism
+	 * that is found in many portable PCs.
+	 * If the Load bit is set to one, the Drive is able to load the
+	 * medium or cartridge.
+	 */
+	__u8 load : 1;
+	/**
+	 * The Eject bit, when set to zero, indicates that the device is
+	 * unable to eject the medium or magazine via the normal START STOP UNIT
+	 * command with the LoEj bit set.
+	 * When set to one, indicates that the device is able to eject
+	 * the medium or magazine.
+	 */
+	__u8 eject : 1;
+	/**
+	 * The Pvnt Jmpr bit, when set to zero, shall indicate that the
+	 * Prevent Jumper is present.
+	 * When set to one, the Prevent Jumper is not present.
+	 * The Pvnt Jmpr bit shall not change state, even if the physical
+	 * jumper is added or removed during operation.
+	 */
+	__u8 prvnt_jmp : 1;
+	__u8 reserved2 : 1;
+	/**
+	 * If Lock is set to zero, there is no locking mechanism for locking
+	 * the medium into the Drive. If Lock is set to one, the Drive is
+	 * capable of locking the media into the Drive.
+	 */
+	__u8 lock : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 lock : 1;
+	__u8 reserved2 : 1;
+	__u8 prvnt_jmp : 1;
+	__u8 eject : 1;
+	__u8 load : 1;
+	__u8 mechanism : 3;
+#endif
+
+	__u8 reserved3[3];
+} __packed;
+
+/**
+ * @brief Random Readable Feature (0010h)
+ *
+ * This Feature identifies a Drive that is able to read data from logical
+ * blocks referenced by Logical Block Addresses, but not requiring that
+ * either the addresses or the read sequences occur in any particular order.
+ */
+struct cdf_random_readable {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+	/* The Additional Length field shall be set to 8. */
+	__u8 length;
+	/**
+	 * The Logical Block Size shall be set to the number of bytes per
+	 * logical block.
+	 */
+	__be32 block_size;
+	/**
+	 * The Blocking field shall indicate the number of logical blocks per
+	 * device readable unit.
+	 * If there is more than one Blocking on the medium possible,
+	 * the Blocking field shall be set to zero.
+	 */
+	__be16 blocking;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved2 : 7;
+	/**
+	 * The PP (Page Present) bit, when set to zero, shall indicate that
+	 * the Read/Write Error Recovery mode page may not be present.
+	 * When set to one, shall indicate that the Read/Write Error Recovery
+	 * mode page is present.
+	 */
+	__u8 pp : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 pp : 1;
+	__u8 reserved2 : 7;
+#endif
+
+	__u8 reserved3;
+} __packed;
+
+/*
+ * Multi-read Feature (001Dh)
+ * The Drive shall conform to the OSTA Multi-Read
+ * specification 1.00, with the exception of CD Play
+ * capability (the CD Audio Feature is not required).
+ */
+struct cdf_multi_read {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	__u8 length;
+} __packed;
+
+/*
+ * CD Read Feature (001Eh)
+ * This Feature identifies a Drive that is able to read
+ * CD specific information from the media and is able
+ * to read user data from all types of CD sectors.
+ */
+struct cdf_cd_read {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	__u8 length;
+#if defined(__BIG_ENDIAN_BITFIELD)
+
+	/*
+	 * If DAP is set to one, the READ CD and READ CD MSF
+	 * commands support the DAP bit in bit 1, byte 1
+	 * of the CDB.
+	 */
+	__u8 dap : 1;
+	__u8 reserved2 : 5;
+
+	/*
+	 * The C2 Flags, when set to one, indicates the Drive
+	 * supports the C2 Error Pointers.
+	 * When set to zero the Drive does not support
+	 * C2 Error Pointers.
+	 */
+	__u8 c2flags : 1;
+	/*
+	 * The CD-Text bit, when set to one, indicates the Drive
+	 * supports Format Code 5h of the READ TOC/PMA/ATIP
+	 * command.
+	 * When set to zero, CD-Text is not supported.
+	 */
+	__u8 cdtext : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 cdtext : 1;
+	__u8 c2flags : 1;
+	__u8 reserved2 : 5;
+	__u8 dap : 1;
+#endif
+
+	__u8 reserved3[3];
+} __packed;
+
+/*
+ * DVD Read Feature (001Fh)
+ * This Feature identifies a Drive that is able to read DVD
+ * specific information from the media.
+ */
+struct cdf_dvd_read {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	__u8 length;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved2 : 7;
+	/*
+	 * If MULTI110 is set to one, the Drive shall
+	 * be compliant with the DVD Multi Drive Read-only
+	 * specifications as defined in [DVD-Ref8].
+	 */
+	__u8 multi110 : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 multi110 : 1;
+	__u8 reserved2 : 7;
 #endif
-	__u8 reserved2;
 	__u8 reserved3;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved4 : 6;
+	/*
+	 * If the DVD-RW Dual Layer (Dual-RW) bit is set to one,
+	 * the Drive is able to read DVD-RW DL media that has the
+	 * Complete state.
+	 * If the Dual-RW bit is set to zero, the Drive is unable
+	 * to read the DVD-RW DL media.
+	 */
+	__u8 dualrw : 1;
+	/*
+	 * If the DVD-R Dual Layer (Dual-R) bit is set to one,
+	 * the Drive shall support reading all recording modes
+	 * (i.e., Sequential recording and Layer Jump recording modes)
+	 * of DVD-R DL discs.
+	 * The Drive shall support Remapping on DVD-R DL discs.
+	 */
+	__u8 dualr : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 dualr : 1;
+	__u8 dualrw : 1;
+	__u8 reserved4 : 6;
+#endif
+
+	__u8 reserved5;
+} __packed;
+
+/**
+ * @brief DVD+R Feature (002Bh)
+ * The presence of the DVD+R Feature indicates that the Drive is
+ * capable of reading a recorded DVD+R disc that is written according
+ * to [DVD+Ref1].
+ * Specifically, this includes the capability of reading DCBs.
+ */
+struct cdf_dvd_plus_r {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	__u8 length;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved2 : 7;
+	/**
+	 * If the Write bit is set to one, then the Drive is also capable
+	 * of writing DVD+R discs according to [DVD+Ref1].
+	 */
+	__u8 write : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 write : 1;
+	__u8 reserved2 : 7;
+#endif
+
+	__u8 reserved3[3];
+} __packed;
+
+/**
+ * @brief CD Track at Once Feature (002Dh)
+ * This Feature identifies a Drive that is able to write data to
+ * a CD track.
+ */
+struct cdf_cd_track_at_once {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	__u8 length;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved2 : 1;
+	/**
+	 * The BUF bit, if set to 1, shall indicate that the Drive
+	 * is capable of zero loss linking.
+	 */
+	__u8 buf : 1;
+	__u8 reserved1 : 1;
+	/**
+	 * The R-W Raw bit, if set to 1, shall indicate that the Drive
+	 * supports writing R-W Sub code in the Raw mode.
+	 * The R-W Sub-code bit shall be set if this bit is set.
+	 */
+	__u8 rw_raw : 1;
+	/**
+	 * The R-W Pack bit, if set to 1, shall indicate that the Drive
+	 * supports writing R-W Sub code in the Packed mode.
+	 * The R-W Sub-code bit shall be set if this bit is set.
+	 */
+	__u8 rw_pack : 1;
+	/**
+	 * The Test Write bit indicates that the Drive is able to
+	 * perform test writes.
+	 */
+	__u8 test_write : 1;
+	/**
+	 * The CD-RW bit indicates support for overwriting a Track at
+	 * Once track with another.
+	 */
+	__u8 cd_rw : 1;
+	/**
+	 * The R-W Sub-code bit indicates that the Drive is able to
+	 * record the R-W Sub-channels with user supplied data.
+	 */
+	__u8 rw_subcode : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 rw_subcode : 1;
+	__u8 cd_rw : 1;
+	__u8 test_write : 1;
+	__u8 rw_pack : 1;
+	__u8 rw_raw : 1;
+	__u8 reserved3 : 1;
+	__u8 buf : 1;
+	__u8 reserved2 : 1;
+#endif
+
 	__u8 reserved4;
+	/**
+	 * The data type references to the
+	 * "Incremental Streaming Writable Feature"
+	 */
+	__be16 data_type_supported;
+} __packed;
+
+/**
+ * @brief BD Read Feature (0040h)
+ * This Feature identifies a Drive that is able to read control
+ * structures and user data from the BD disc.
+ */
+struct cdf_bd_read {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	__u8 length;
+
+	__u8 reserved2[4];
+	/**
+	 * If the Version K bit (K = 0...15) of the Class M (M = 0...3)
+	 * bit map is set to zero, the Drive claims no read capabilities
+	 * for BD-R(E)(ROM) discs of Class M and Version K.
+	 * If the Version K bit of Class M is set to one, the Drive is
+	 * able to read BD-RE discs of class M and Version K.
+	 *
+	 */
+
+	/* Class M (M = 0..3) BD-RE Read Support */
+	__be16 class0_bdre_read_support;
+	__be16 class1_bdre_read_support;
+	__be16 class2_bdre_read_support;
+	__be16 class3_bdre_read_support;
+	/* Class M (M = 0..3) BD-R Read Support */
+	__be16 class0_bdr_read_support;
+	__be16 class1_bdr_read_support;
+	__be16 class2_bdr_read_support;
+	__be16 class3_bdr_read_support;
+	/* Class M (M = 0..3) BD-ROM Read Support */
+	__be16 class0_bdrom_read_support;
+	__be16 class1_bdrom_read_support;
+	__be16 class2_bdrom_read_support;
+	__be16 class3_bdrom_read_support;
+} __packed;
+
+/**
+ * @brief Power Management Feature (0100h)
+ * This Feature identifies a Drive that is able to perform Host and
+ * Drive directed power management.
+ */
+struct cdf_power_mgmt {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	__u8 length;
+} __packed;
+
+/**
+ * @brief Real Time Streaming Feature (0107h)
+ * This Feature identifies a Drive that is able to perform reading
+ * and writing within Host specified (and Drive verified) performance
+ * ranges. This Feature also indicates whether the Drive supports the
+ * Stream playback operation.
+ */
+struct cdf_rt_streaming {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	__u8 length;
+
+#if defined(__BIG_ENDIAN_BITFIELD)
+	__u8 reserved2 : 3;
+	/**
+	 * The Read Buffer Capacity Block (RBCB) bit indicates that the
+	 * Drive supports the READ_BUFFER_CAPACITY command and its Block
+	 * bit.
+	 */
+	__u8 rbcb : 1;
+	/**
+	 * The Set CD Speed (SCS) bit of one indicates that the Drive
+	 * supports the SET_CD_SPEED command. Otherwise, the Drive does not
+	 * support the SET_CD_SPEED command.
+	 */
+	__u8 scs : 1;
+	/**
+	 * The mode page 2A (MP2A) bit of one indicates that the MM
+	 * Capabilities & Mechanical Status mode page (2Ah) with the Drive
+	 * Write Speed Performance Descriptor Blocks is supported.
+	 * Otherwise, the MM Capabilities & Mechanical Status mode
+	 * page (2Ah), with the Drive Write Speed Performance Descriptor
+	 * Blocks are not supported by the Drive.
+	 */
+	__u8 mp2a : 1;
+	/**
+	 * A Write Speed Performance Descriptor (WSPD) bit of one indicates
+	 * that the Drive supports the Write Speed (Type field = 03h) data
+	 * of GET PERFORMANCE command and the WRC field of SET STREAMING
+	 * command. This bit shall be set to one, if Drive supports writing
+	 * speed selection.
+	 */
+	__u8 wspd : 1;
+	/**
+	 * A Stream Writing (SW) bit of one indicates that the Drive
+	 * supports the Stream recording operation. A SW bit of zero
+	 * indicates that the Drive may not support the Stream recording
+	 * operation.
+	 */
+	__u8 sw : 1;
+#elif defined(__LITTLE_ENDIAN_BITFIELD)
+	__u8 sw : 1;
+	__u8 wspd : 1;
+	__u8 mp2a : 1;
+	__u8 scs : 1;
+	__u8 rbcb : 1;
+	__u8 reserved2 : 3;
+#endif
+
+	__u8 reserved3[3];
+} __packed;
+
+/**
+ * @brief Disc Control Blocks (DCBs) Feature (010Ah)
+ *
+ * This Feature identifies a Drive that is able to read and/or write
+ * DCBs from or to the media.
+ */
+struct cdf_dcbs {
+	__be16 code;
+
+	struct cdb_ft_vpc_byte vpc;
+
+	/**
+	 * The Additional Length field shall be set to N * 4, where n is
+	 * the number of Supported DCB entries. The Supported DCB entry
+	 * n fields shall each contain the Content Descriptor of a
+	 * supported DCB.
+	 * Entries shall be sorted in ascending order.
+	 */
+	__u8 length;
+
+	/**
+	 * Non supported read and/or write the DCBs blocks.
+	 */
+	__be32 supported_dcb_entry[0];
 };
 
+/*
+ * feature codes list
+ */
+
+/* A list of all Profiles supported by the Drive*/
+#define CDF_PROFILE_LIST_CODE 0x0000
+/* Mandatory behavior for all devices */
+#define CDF_CORE 0x0001
+
+#define CDF_MORPHING_CODE 0x0002
+/* The medium may be removed from the device */
+#define CDF_REMOVEBLE_MEDIA 0x0003
+#define CDF_RANDOM_READ 0x0010
+/* The Drive is able to read all CD media types; based on OSTA MultiRead */
+#define CDF_MULTI_READ 0x001D
+/* The ability to read CD specific structures */
+#define CDF_CD_READ 0x001E
+/* The ability to read DVD specific structures*/
+#define CDF_DVD_READ 0x001F
+/* Write support for randomly addressed writes */
+#define CDF_RWRT 0x0020
+/* Write support for sequential recording */
+#define CDF_INC_STREAM_WR 0x0021
+/* Hardware Defect Management */
+#define CDF_HWDM 0x0024
+/* The ability to recognize and read and optionally write MRW formatted media */
+#define CDF_MRW 0x0028
+/* The ability to read DVD+R recorded media formats */
+#define CDF_DVD_R 0x002B
+/* Ability to write CD with Track at Once recording */
+#define CDF_CD_TRACK_ONCE 0x002D
+/* The ability to read control structures and user data from a BD disc */
+#define CDF_BD_READ 0x0040
+/* The ability to write control structures and user data to certain BD discs */
+#define CDF_BD_WRITE 0x0041
+/* Host and device directed power management */
+#define CDF_POWER_MGMT 0x0100
+/* Ability to perform DVD CSS/CPPM authentication and RPC */
+#define CDF_DVD_CSS 0x0106
+/* Ability to read and write using Host requested performance parameters */
+#define CDF_REAL_TIME_STREAM 0x0107
+/* The ability to read and/or write DCBs*/
+#define CDF_DCBS 0x010A
+
 /**
  * The READ TOC/PMA/ATIP format field values
  */
-- 
2.34.1

