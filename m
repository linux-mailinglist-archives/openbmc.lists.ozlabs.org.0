Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF767B896
	for <lists+openbmc@lfdr.de>; Wed, 25 Jan 2023 18:31:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P29qJ4mNrz3cfl
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 04:31:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qfVIOLwF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qfVIOLwF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P29pg5q5Vz3cYd
	for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2023 04:30:35 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PGbHMJ004263;
	Wed, 25 Jan 2023 17:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=hX2R0RzdAn8abvVHDyRRckW+irvjuFWugGWBrOgSd+k=;
 b=qfVIOLwFHXmT7qym+sQ13oYts1zoNPBNYWwAqM1VIkd2QPbkRp6/3KKsOICF+9lkkGO2
 +GWa9vN/1zBjh1tjwFrb1tmnD6nnvcRQrcI5m3QYwLbrQH3NP3pTykshk1cyKXxFDMft
 jpuGICNgZS4owvvC/yYtAdwz4zOKHwWlnlzkw3QLc8gN62MHk2TToll7XMOskkq3ykLz
 fOEGDxHOlVSbqcOVvvmCtg29bVWdBd5zb7MA7d8HHovsJupsXBLO403kkWocfS8puCKX
 GCUxWP/J3DkW3e0fMRDZwF8S4foIl+aOf3U5gQxPkZAPY/hyvh68Ke6VtNoh3yEhhrV4 Vw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nacg1udwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 17:30:30 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30PGlo8E010809;
	Wed, 25 Jan 2023 17:30:28 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3n87p792w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 17:30:28 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30PHUROC6619732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 17:30:28 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA7DD5805C;
	Wed, 25 Jan 2023 17:30:27 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F07565805D;
	Wed, 25 Jan 2023 17:30:26 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.77.150.21])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jan 2023 17:30:26 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/4] tpm: Pull in upstream changes
Date: Wed, 25 Jan 2023 11:30:22 -0600
Message-Id: <20230125173025.3725606-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230125173025.3725606-1-eajames@linux.ibm.com>
References: <20230125173025.3725606-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G-k8K1jn8E1IMfXhaCJJlooPG5NXXaKM
X-Proofpoint-GUID: G-k8K1jn8E1IMfXhaCJJlooPG5NXXaKM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_11,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250152
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Get the TPM driver into the same state as upstream.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 cmd/tpm-v1.c         |  16 ++--
 cmd/tpm-v2.c         |  10 ++-
 include/tpm-common.h |   3 +
 include/tpm-v2.h     | 188 ++++++++++++++++++++++++++++++++++++++++++-
 lib/tpm-v2.c         |  39 +++++----
 5 files changed, 231 insertions(+), 25 deletions(-)

diff --git a/cmd/tpm-v1.c b/cmd/tpm-v1.c
index b75e0933a1..ebddb93bff 100644
--- a/cmd/tpm-v1.c
+++ b/cmd/tpm-v1.c
@@ -128,7 +128,8 @@ static int do_tpm_extend(cmd_tbl_t *cmdtp, int flag, int argc,
 		return CMD_RET_FAILURE;
 	}
 
-	rc = tpm_extend(dev, index, in_digest, out_digest);
+	rc = tpm_pcr_extend(dev, index, in_digest, sizeof(in_digest),
+			    out_digest, "cmd");
 	if (!rc) {
 		puts("PCR value after execution of the command:\n");
 		print_byte_string(out_digest, sizeof(out_digest));
@@ -403,9 +404,9 @@ static int do_tpm_load_key_by_sha1(cmd_tbl_t *cmdtp, int flag, int argc, char *
 	void *key;
 	struct udevice *dev;
 
-	rc = get_tpm(&dev);
-	if (rc)
-		return rc;
+	err = get_tpm(&dev);
+	if (err)
+		return err;
 
 	if (argc < 5)
 		return CMD_RET_USAGE;
@@ -579,6 +580,7 @@ static int do_tpm_flush(cmd_tbl_t *cmdtp, int flag, int argc,
 static int do_tpm_list(cmd_tbl_t *cmdtp, int flag, int argc,
 		       char * const argv[])
 {
+	struct udevice *dev;
 	int type = 0;
 	u16 res_count;
 	u8 buf[288];
@@ -586,6 +588,10 @@ static int do_tpm_list(cmd_tbl_t *cmdtp, int flag, int argc,
 	int err;
 	uint i;
 
+	err = get_tpm(&dev);
+	if (err)
+		return err;
+
 	if (argc != 2)
 		return CMD_RET_USAGE;
 
@@ -616,7 +622,7 @@ static int do_tpm_list(cmd_tbl_t *cmdtp, int flag, int argc,
 	}
 
 	/* fetch list of already loaded resources in the TPM */
-	err = tpm_get_capability(TPM_CAP_HANDLE, type, buf,
+	err = tpm_get_capability(dev, TPM_CAP_HANDLE, type, buf,
 				 sizeof(buf));
 	if (err) {
 		printf("tpm_get_capability returned error %d.\n", err);
diff --git a/cmd/tpm-v2.c b/cmd/tpm-v2.c
index 459a955d29..65bab81405 100644
--- a/cmd/tpm-v2.c
+++ b/cmd/tpm-v2.c
@@ -115,7 +115,8 @@ static int do_tpm2_pcr_extend(cmd_tbl_t *cmdtp, int flag, int argc,
 	if (index >= priv->pcr_count)
 		return -EINVAL;
 
-	rc = tpm2_pcr_extend(dev, index, digest);
+	rc = tpm2_pcr_extend(dev, index, TPM2_ALG_SHA256, digest,
+			     TPM2_DIGEST_LEN);
 
 	unmap_sysmem(digest);
 
@@ -149,7 +150,8 @@ static int do_tpm_pcr_read(cmd_tbl_t *cmdtp, int flag, int argc,
 
 	data = map_sysmem(simple_strtoul(argv[2], NULL, 0), 0);
 
-	rc = tpm2_pcr_read(dev, index, priv->pcr_select_min, data, &updates);
+	rc = tpm2_pcr_read(dev, index, priv->pcr_select_min, TPM2_ALG_SHA256,
+			   data, TPM2_DIGEST_LEN, &updates);
 	if (!rc) {
 		printf("PCR #%u content (%u known updates):\n", index, updates);
 		print_byte_string(data, TPM2_DIGEST_LEN);
@@ -190,10 +192,10 @@ static int do_tpm_get_capability(cmd_tbl_t *cmdtp, int flag, int argc,
 	for (i = 0; i < count; i++) {
 		printf("Property 0x");
 		for (j = 0; j < 4; j++)
-			printf("%02x", data[(i * 8) + j]);
+			printf("%02x", data[(i * 8) + j + sizeof(u32)]);
 		printf(": 0x");
 		for (j = 4; j < 8; j++)
-			printf("%02x", data[(i * 8) + j]);
+			printf("%02x", data[(i * 8) + j + sizeof(u32)]);
 		printf("\n");
 	}
 
diff --git a/include/tpm-common.h b/include/tpm-common.h
index f9c2ca2053..702cd6e93b 100644
--- a/include/tpm-common.h
+++ b/include/tpm-common.h
@@ -293,4 +293,7 @@ static inline cmd_tbl_t *get_tpm2_commands(unsigned int *size)
  */
 enum tpm_version tpm_get_version(struct udevice *dev);
 
+/* Iterate on all TPM devices */
+#define for_each_tpm_device(dev) uclass_foreach_dev_probe(UCLASS_TPM, (dev))
+
 #endif /* __TPM_COMMON_H */
diff --git a/include/tpm-v2.h b/include/tpm-v2.h
index b65f2ce55a..edebf9dc78 100644
--- a/include/tpm-v2.h
+++ b/include/tpm-v2.h
@@ -1,6 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
+ * Defines APIs and structures that allow software to interact with a
+ * TPM2 device
+ *
+ * Copyright (c) 2020 Linaro
  * Copyright (c) 2018 Bootlin
+ *
+ * https://trustedcomputinggroup.org/resource/tss-overview-common-structures-specification/
+ *
  * Author: Miquel Raynal <miquel.raynal@bootlin.com>
  */
 
@@ -9,8 +16,170 @@
 
 #include <tpm-common.h>
 
+struct udevice;
+
 #define TPM2_DIGEST_LEN		32
 
+#define TPM2_SHA1_DIGEST_SIZE 20
+#define TPM2_SHA256_DIGEST_SIZE	32
+#define TPM2_SHA384_DIGEST_SIZE	48
+#define TPM2_SHA512_DIGEST_SIZE	64
+#define TPM2_SM3_256_DIGEST_SIZE 32
+
+#define TPM2_MAX_PCRS 32
+#define TPM2_PCR_SELECT_MAX ((TPM2_MAX_PCRS + 7) / 8)
+#define TPM2_MAX_CAP_BUFFER 1024
+#define TPM2_MAX_TPM_PROPERTIES ((TPM2_MAX_CAP_BUFFER - sizeof(u32) /* TPM2_CAP */ - \
+				 sizeof(u32)) / sizeof(struct tpms_tagged_property))
+
+#define TPM2_HDR_LEN		10
+
+/*
+ *  We deviate from this draft of the specification by increasing the value of
+ *  TPM2_NUM_PCR_BANKS from 3 to 16 to ensure compatibility with TPM2
+ *  implementations that have enabled a larger than typical number of PCR
+ *  banks. This larger value for TPM2_NUM_PCR_BANKS is expected to be included
+ *  in a future revision of the specification.
+ */
+#define TPM2_NUM_PCR_BANKS 16
+
+/* Definition of (UINT32) TPM2_CAP Constants */
+#define TPM2_CAP_PCRS 0x00000005U
+#define TPM2_CAP_TPM_PROPERTIES 0x00000006U
+
+/* Definition of (UINT32) TPM2_PT Constants */
+#define TPM2_PT_GROUP			(u32)(0x00000100)
+#define TPM2_PT_FIXED			(u32)(TPM2_PT_GROUP * 1)
+#define TPM2_PT_MANUFACTURER		(u32)(TPM2_PT_FIXED + 5)
+#define TPM2_PT_PCR_COUNT		(u32)(TPM2_PT_FIXED + 18)
+#define TPM2_PT_MAX_COMMAND_SIZE	(u32)(TPM2_PT_FIXED + 30)
+#define TPM2_PT_MAX_RESPONSE_SIZE	(u32)(TPM2_PT_FIXED + 31)
+
+/*
+ * event types, cf.
+ * "TCG Server Management Domain Firmware Profile Specification",
+ * rev 1.00, 2020-05-01
+ */
+#define EV_POST_CODE			((u32)0x00000001)
+#define EV_NO_ACTION			((u32)0x00000003)
+#define EV_SEPARATOR			((u32)0x00000004)
+#define EV_ACTION			((u32)0x00000005)
+#define EV_TAG				((u32)0x00000006)
+#define EV_S_CRTM_CONTENTS		((u32)0x00000007)
+#define EV_S_CRTM_VERSION		((u32)0x00000008)
+#define EV_CPU_MICROCODE		((u32)0x00000009)
+#define EV_PLATFORM_CONFIG_FLAGS	((u32)0x0000000A)
+#define EV_TABLE_OF_DEVICES		((u32)0x0000000B)
+#define EV_COMPACT_HASH			((u32)0x0000000C)
+
+/* TPMS_TAGGED_PROPERTY Structure */
+struct tpms_tagged_property {
+	u32 property;
+	u32 value;
+} __packed;
+
+/* TPMS_PCR_SELECTION Structure */
+struct tpms_pcr_selection {
+	u16 hash;
+	u8 size_of_select;
+	u8 pcr_select[TPM2_PCR_SELECT_MAX];
+} __packed;
+
+/* TPML_PCR_SELECTION Structure */
+struct tpml_pcr_selection {
+	u32 count;
+	struct tpms_pcr_selection selection[TPM2_NUM_PCR_BANKS];
+} __packed;
+
+/* TPML_TAGGED_TPM_PROPERTY Structure */
+struct tpml_tagged_tpm_property {
+	u32 count;
+	struct tpms_tagged_property tpm_property[TPM2_MAX_TPM_PROPERTIES];
+} __packed;
+
+/* TPMU_CAPABILITIES Union */
+union tpmu_capabilities {
+	/*
+	 * Non exhaustive. Only added the structs needed for our
+	 * current code
+	 */
+	struct tpml_pcr_selection assigned_pcr;
+	struct tpml_tagged_tpm_property tpm_properties;
+} __packed;
+
+/* TPMS_CAPABILITY_DATA Structure */
+struct tpms_capability_data {
+	u32 capability;
+	union tpmu_capabilities data;
+} __packed;
+
+/**
+ * SHA1 Event Log Entry Format
+ *
+ * @pcr_index:	PCRIndex event extended to
+ * @event_type:	Type of event (see EFI specs)
+ * @digest:	Value extended into PCR index
+ * @event_size:	Size of event
+ * @event:	Event data
+ */
+struct tcg_pcr_event {
+	u32 pcr_index;
+	u32 event_type;
+	u8 digest[TPM2_SHA1_DIGEST_SIZE];
+	u32 event_size;
+	u8 event[];
+} __packed;
+
+/**
+ * Definition of TPMU_HA Union
+ */
+union tpmu_ha {
+	u8 sha1[TPM2_SHA1_DIGEST_SIZE];
+	u8 sha256[TPM2_SHA256_DIGEST_SIZE];
+	u8 sm3_256[TPM2_SM3_256_DIGEST_SIZE];
+	u8 sha384[TPM2_SHA384_DIGEST_SIZE];
+	u8 sha512[TPM2_SHA512_DIGEST_SIZE];
+} __packed;
+
+/**
+ * Definition of TPMT_HA Structure
+ *
+ * @hash_alg:	Hash algorithm defined in enum tpm2_algorithms
+ * @digest:	Digest value for a given algorithm
+ */
+struct tpmt_ha {
+	u16 hash_alg;
+	union tpmu_ha digest;
+} __packed;
+
+/**
+ * Definition of TPML_DIGEST_VALUES Structure
+ *
+ * @count:	Number of algorithms supported by hardware
+ * @digests:	struct for algorithm id and hash value
+ */
+struct tpml_digest_values {
+	u32 count;
+	struct tpmt_ha digests[TPM2_NUM_PCR_BANKS];
+} __packed;
+
+/**
+ * Crypto Agile Log Entry Format
+ *
+ * @pcr_index:	PCRIndex event extended to
+ * @event_type:	Type of event
+ * @digests:	List of digests extended to PCR index
+ * @event_size: Size of the event data
+ * @event:	Event data
+ */
+struct tcg_pcr_event2 {
+	u32 pcr_index;
+	u32 event_type;
+	struct tpml_digest_values digests;
+	u32 event_size;
+	u8 event[];
+} __packed;
+
 /**
  * TPM2 Structure Tags for command/response buffers.
  *
@@ -70,6 +239,7 @@ enum tpm2_handles {
  * @TPM2_CC_DAM_RESET: TPM2_DictionaryAttackLockReset().
  * @TPM2_CC_DAM_PARAMETERS: TPM2_DictionaryAttackParameters().
  * @TPM2_CC_GET_CAPABILITY: TPM2_GetCapibility().
+ * @TPM2_CC_GET_RANDOM: TPM2_GetRandom().
  * @TPM2_CC_PCR_READ: TPM2_PCR_Read().
  * @TPM2_CC_PCR_EXTEND: TPM2_PCR_Extend().
  * @TPM2_CC_PCR_SETAUTHVAL: TPM2_PCR_SetAuthValue().
@@ -77,14 +247,19 @@ enum tpm2_handles {
 enum tpm2_command_codes {
 	TPM2_CC_STARTUP		= 0x0144,
 	TPM2_CC_SELF_TEST	= 0x0143,
+	TPM2_CC_HIER_CONTROL	= 0x0121,
 	TPM2_CC_CLEAR		= 0x0126,
 	TPM2_CC_CLEARCONTROL	= 0x0127,
 	TPM2_CC_HIERCHANGEAUTH	= 0x0129,
+	TPM2_CC_NV_DEFINE_SPACE	= 0x012a,
 	TPM2_CC_PCR_SETAUTHPOL	= 0x012C,
+	TPM2_CC_NV_WRITE	= 0x0137,
+	TPM2_CC_NV_WRITELOCK	= 0x0138,
 	TPM2_CC_DAM_RESET	= 0x0139,
 	TPM2_CC_DAM_PARAMETERS	= 0x013A,
 	TPM2_CC_NV_READ         = 0x014E,
 	TPM2_CC_GET_CAPABILITY	= 0x017A,
+	TPM2_CC_GET_RANDOM      = 0x017B,
 	TPM2_CC_PCR_READ	= 0x017E,
 	TPM2_CC_PCR_EXTEND	= 0x0182,
 	TPM2_CC_PCR_SETAUTHVAL	= 0x0183,
@@ -110,6 +285,7 @@ enum tpm2_return_codes {
 	TPM2_RC_COMMAND_CODE	= TPM2_RC_VER1 + 0x0043,
 	TPM2_RC_AUTHSIZE	= TPM2_RC_VER1 + 0x0044,
 	TPM2_RC_AUTH_CONTEXT	= TPM2_RC_VER1 + 0x0045,
+	TPM2_RC_NV_DEFINED	= TPM2_RC_VER1 + 0x004c,
 	TPM2_RC_NEEDS_TEST	= TPM2_RC_VER1 + 0x0053,
 	TPM2_RC_WARN		= 0x0900,
 	TPM2_RC_TESTING		= TPM2_RC_WARN + 0x000A,
@@ -121,11 +297,13 @@ enum tpm2_return_codes {
  * TPM2 algorithms.
  */
 enum tpm2_algorithms {
+	TPM2_ALG_SHA1		= 0x04,
 	TPM2_ALG_XOR		= 0x0A,
 	TPM2_ALG_SHA256		= 0x0B,
 	TPM2_ALG_SHA384		= 0x0C,
 	TPM2_ALG_SHA512		= 0x0D,
 	TPM2_ALG_NULL		= 0x10,
+	TPM2_ALG_SM3_256	= 0x12,
 };
 
 /* NV index attributes */
@@ -231,11 +409,14 @@ u32 tpm2_clear(struct udevice *dev, u32 handle, const char *pw,
  *
  * @dev		TPM device
  * @index	Index of the PCR
+ * @algorithm	Algorithm used, defined in 'enum tpm2_algorithms'
  * @digest	Value representing the event to be recorded
+ * @digest_len  len of the hash
  *
  * @return code of the operation
  */
-u32 tpm2_pcr_extend(struct udevice *dev, u32 index, const uint8_t *digest);
+u32 tpm2_pcr_extend(struct udevice *dev, u32 index, u32 algorithm,
+		    const u8 *digest, u32 digest_len);
 
 /**
  * Issue a TPM2_PCR_Read command.
@@ -243,13 +424,16 @@ u32 tpm2_pcr_extend(struct udevice *dev, u32 index, const uint8_t *digest);
  * @dev		TPM device
  * @idx		Index of the PCR
  * @idx_min_sz	Minimum size in bytes of the pcrSelect array
+ * @algorithm	Algorithm used, defined in 'enum tpm2_algorithms'
  * @data	Output buffer for contents of the named PCR
+ * @digest_len  len of the data
  * @updates	Optional out parameter: number of updates for this PCR
  *
  * @return code of the operation
  */
 u32 tpm2_pcr_read(struct udevice *dev, u32 idx, unsigned int idx_min_sz,
-		  void *data, unsigned int *updates);
+		  u16 algorithm, void *data, u32 digest_len,
+		  unsigned int *updates);
 
 /**
  * Issue a TPM2_GetCapability command.  This implementation is limited
diff --git a/lib/tpm-v2.c b/lib/tpm-v2.c
index f89592d6e2..7272170c78 100644
--- a/lib/tpm-v2.c
+++ b/lib/tpm-v2.c
@@ -8,6 +8,7 @@
 #include <dm.h>
 #include <tpm-common.h>
 #include <tpm-v2.h>
+#include <linux/bitops.h>
 #include "tpm-utils.h"
 
 u32 tpm2_startup(struct udevice *dev, enum tpm2_startup_types mode)
@@ -46,9 +47,11 @@ u32 tpm2_self_test(struct udevice *dev, enum tpm2_yes_no full_test)
 u32 tpm2_clear(struct udevice *dev, u32 handle, const char *pw,
 	       const ssize_t pw_sz)
 {
+	/* Length of the message header, up to start of password */
+	uint offset = 27;
 	u8 command_v2[COMMAND_BUFFER_SIZE] = {
 		tpm_u16(TPM2_ST_SESSIONS),	/* TAG */
-		tpm_u32(27 + pw_sz),		/* Length */
+		tpm_u32(offset + pw_sz),	/* Length */
 		tpm_u32(TPM2_CC_CLEAR),		/* Command code */
 
 		/* HANDLE */
@@ -63,7 +66,6 @@ u32 tpm2_clear(struct udevice *dev, u32 handle, const char *pw,
 		tpm_u16(pw_sz),			/* Size of <hmac/password> */
 		/* STRING(pw)			   <hmac/password> (if any) */
 	};
-	unsigned int offset = 27;
 	int ret;
 
 	/*
@@ -79,11 +81,14 @@ u32 tpm2_clear(struct udevice *dev, u32 handle, const char *pw,
 	return tpm_sendrecv_command(dev, command_v2, NULL, NULL);
 }
 
-u32 tpm2_pcr_extend(struct udevice *dev, u32 index, const uint8_t *digest)
+u32 tpm2_pcr_extend(struct udevice *dev, u32 index, u32 algorithm,
+		    const u8 *digest, u32 digest_len)
 {
+	/* Length of the message header, up to start of digest */
+	uint offset = 33;
 	u8 command_v2[COMMAND_BUFFER_SIZE] = {
 		tpm_u16(TPM2_ST_SESSIONS),	/* TAG */
-		tpm_u32(33 + TPM2_DIGEST_LEN),	/* Length */
+		tpm_u32(offset + digest_len),	/* Length */
 		tpm_u32(TPM2_CC_PCR_EXTEND),	/* Command code */
 
 		/* HANDLE */
@@ -97,20 +102,22 @@ u32 tpm2_pcr_extend(struct udevice *dev, u32 index, const uint8_t *digest)
 		0,				/* Attributes: Cont/Excl/Rst */
 		tpm_u16(0),			/* Size of <hmac/password> */
 						/* <hmac/password> (if any) */
+
+		/* hashes */
 		tpm_u32(1),			/* Count (number of hashes) */
-		tpm_u16(TPM2_ALG_SHA256),	/* Algorithm of the hash */
+		tpm_u16(algorithm),	/* Algorithm of the hash */
 		/* STRING(digest)		   Digest */
 	};
-	unsigned int offset = 33;
 	int ret;
 
+	if (!digest)
+		return -EINVAL;
 	/*
 	 * Fill the command structure starting from the first buffer:
 	 *     - the digest
 	 */
 	ret = pack_byte_string(command_v2, sizeof(command_v2), "s",
-			       offset, digest, TPM2_DIGEST_LEN);
-	offset += TPM2_DIGEST_LEN;
+			       offset, digest, digest_len);
 	if (ret)
 		return TPM_LIB_ERROR;
 
@@ -118,7 +125,8 @@ u32 tpm2_pcr_extend(struct udevice *dev, u32 index, const uint8_t *digest)
 }
 
 u32 tpm2_pcr_read(struct udevice *dev, u32 idx, unsigned int idx_min_sz,
-		  void *data, unsigned int *updates)
+		  u16 algorithm, void *data, u32 digest_len,
+		  unsigned int *updates)
 {
 	u8 idx_array_sz = max(idx_min_sz, DIV_ROUND_UP(idx, 8));
 	u8 command_v2[COMMAND_BUFFER_SIZE] = {
@@ -128,7 +136,7 @@ u32 tpm2_pcr_read(struct udevice *dev, u32 idx, unsigned int idx_min_sz,
 
 		/* TPML_PCR_SELECTION */
 		tpm_u32(1),			/* Number of selections */
-		tpm_u16(TPM2_ALG_SHA256),	/* Algorithm of the hash */
+		tpm_u16(algorithm),		/* Algorithm of the hash */
 		idx_array_sz,			/* Array size for selection */
 		/* bitmap(idx)			   Selected PCR bitmap */
 	};
@@ -147,10 +155,13 @@ u32 tpm2_pcr_read(struct udevice *dev, u32 idx, unsigned int idx_min_sz,
 	if (ret)
 		return ret;
 
+	if (digest_len > response_len)
+		return TPM_LIB_ERROR;
+
 	if (unpack_byte_string(response, response_len, "ds",
 			       10, &counter,
-			       response_len - TPM2_DIGEST_LEN, data,
-			       TPM2_DIGEST_LEN))
+			       response_len - digest_len, data,
+			       digest_len))
 		return TPM_LIB_ERROR;
 
 	if (updates)
@@ -183,10 +194,10 @@ u32 tpm2_get_capability(struct udevice *dev, u32 capability, u32 property,
 	/*
 	 * In the response buffer, the properties are located after the:
 	 * tag (u16), response size (u32), response code (u32),
-	 * YES/NO flag (u8), TPM_CAP (u32) and TPMU_CAPABILITIES (u32).
+	 * YES/NO flag (u8), TPM_CAP (u32).
 	 */
 	properties_off = sizeof(u16) + sizeof(u32) + sizeof(u32) +
-			 sizeof(u8) + sizeof(u32) + sizeof(u32);
+			 sizeof(u8) + sizeof(u32);
 	memcpy(buf, &response[properties_off], response_len - properties_off);
 
 	return 0;
-- 
2.31.1

