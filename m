Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6274B67B8A3
	for <lists+openbmc@lfdr.de>; Wed, 25 Jan 2023 18:33:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P29sT1yDxz3cdl
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 04:33:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m509XhZB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m509XhZB;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P29pg4jyGz3cLb
	for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2023 04:30:35 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PHNmuI006877;
	Wed, 25 Jan 2023 17:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7lT3N2sf3UZoWdQ0ls8Y9ntbLfBNArwL9jcxIQd99fw=;
 b=m509XhZBkaBs4HNobCyO/ITODoZUx4gzbwJBzKTMgIS21SUZY3QSMcvKxqzFoOzsm9AR
 lR9lAkinzNvCbuWBsDVrrlc5TsL197i/0/MAl9P9WZntytfjjcMD5d3hzeskdOoAcv40
 cKkf4yETVicUCNDjSF+y+bwl0stkriw6D6JRLZ9pX8pH5CTDeS2WNgnjylAyMX/l2sdS
 SZwwFuWqXONfzzoTlpNxypWHDyEB8IIoNp+HRdLFGsU++Xs/Tb1BEebqZoPWA6vslNyr
 dUcJtc5Asz+RyJhzsB9Ts5JVa3zGBUohKHq+ZQz9WYwJDCequoan4a/ic9khWIAbTY8P aA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3naaguw0qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 17:30:31 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30PGUB7N006854;
	Wed, 25 Jan 2023 17:30:29 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3n87p7h27r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 17:30:29 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30PHUSfp5702372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 17:30:29 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9866A58054;
	Wed, 25 Jan 2023 17:30:28 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBA955805A;
	Wed, 25 Jan 2023 17:30:27 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.77.150.21])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jan 2023 17:30:27 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/4] tpm: Support boot measurements
Date: Wed, 25 Jan 2023 11:30:23 -0600
Message-Id: <20230125173025.3725606-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230125173025.3725606-1-eajames@linux.ibm.com>
References: <20230125173025.3725606-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QdQpa39DZ9Dcr_lR5zDG87M2lAPuNc9J
X-Proofpoint-GUID: QdQpa39DZ9Dcr_lR5zDG87M2lAPuNc9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_10,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301250147
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

Add TPM2 functions to support boot measurement. This includes
starting up the TPM, initializing/appending the event log, and
measuring the U-Boot version. Much of the code was used in the
EFI subsystem, so remove it there and use the common functions.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 include/tpm-v2.h | 254 +++++++++++++++
 lib/tpm-v2.c     | 799 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1053 insertions(+)

diff --git a/include/tpm-v2.h b/include/tpm-v2.h
index edebf9dc78..8f42315209 100644
--- a/include/tpm-v2.h
+++ b/include/tpm-v2.h
@@ -180,6 +180,50 @@ struct tcg_pcr_event2 {
 	u8 event[];
 } __packed;
 
+/**
+ *  struct TCG_EfiSpecIdEventAlgorithmSize - hashing algorithm information
+ *
+ *  @algorithm_id:	algorithm defined in enum tpm2_algorithms
+ *  @digest_size:	size of the algorithm
+ */
+struct tcg_efi_spec_id_event_algorithm_size {
+	u16      algorithm_id;
+	u16      digest_size;
+} __packed;
+
+#define TCG_EFI_SPEC_ID_EVENT_SIGNATURE_03 "Spec ID Event03"
+#define TCG_EFI_SPEC_ID_EVENT_SPEC_VERSION_MAJOR_TPM2 2
+#define TCG_EFI_SPEC_ID_EVENT_SPEC_VERSION_MINOR_TPM2 0
+#define TCG_EFI_SPEC_ID_EVENT_SPEC_VERSION_ERRATA_TPM2 2
+
+/**
+ * struct TCG_EfiSpecIDEventStruct - content of the event log header
+ *
+ * @signature:			signature, set to Spec ID Event03
+ * @platform_class:		class defined in TCG ACPI Specification
+ *				Client  Common Header.
+ * @spec_version_minor:		minor version
+ * @spec_version_major:		major version
+ * @spec_version_errata:	major version
+ * @uintn_size:			size of the efi_uintn_t fields used in various
+ *				data structures used in this specification.
+ *				0x01 indicates u32  and 0x02  indicates u64
+ * @number_of_algorithms:	hashing algorithms used in this event log
+ * @digest_sizes:		array of number_of_algorithms pairs
+ *				1st member defines the algorithm id
+ *				2nd member defines the algorithm size
+ */
+struct tcg_efi_spec_id_event {
+	u8 signature[16];
+	u32 platform_class;
+	u8 spec_version_minor;
+	u8 spec_version_major;
+	u8 spec_errata;
+	u8 uintn_size;
+	u32 number_of_algorithms;
+	struct tcg_efi_spec_id_event_algorithm_size digest_sizes[];
+} __packed;
+
 /**
  * TPM2 Structure Tags for command/response buffers.
  *
@@ -306,6 +350,26 @@ enum tpm2_algorithms {
 	TPM2_ALG_SM3_256	= 0x12,
 };
 
+extern const enum tpm2_algorithms tpm2_supported_algorithms[4];
+
+static inline u16 tpm2_algorithm_to_len(enum tpm2_algorithms a)
+{
+	switch (a) {
+	case TPM2_ALG_SHA1:
+		return TPM2_SHA1_DIGEST_SIZE;
+	case TPM2_ALG_SHA256:
+		return TPM2_SHA256_DIGEST_SIZE;
+	case TPM2_ALG_SHA384:
+		return TPM2_SHA384_DIGEST_SIZE;
+	case TPM2_ALG_SHA512:
+		return TPM2_SHA512_DIGEST_SIZE;
+	default:
+		return 0;
+	}
+}
+
+#define tpm2_algorithm_to_mask(a)	(1 << (a))
+
 /* NV index attributes */
 enum tpm_index_attrs {
 	TPMA_NV_PPWRITE		= 1UL << 0,
@@ -371,6 +435,183 @@ enum {
 	TPM_MAX_BUF_SIZE	= 1260,
 };
 
+/**
+ * struct tcg2_event_log - Container for managing the platform event log
+ *
+ * @log:		Address of the log
+ * @log_position:	Current entry position
+ * @log_size:		Log space available
+ * @found:		Boolean indicating if an existing log was discovered
+ */
+struct tcg2_event_log {
+	u8 *log;
+	u32 log_position;
+	u32 log_size;
+	bool found;
+};
+
+/**
+ * Create a list of digests of the supported PCR banks for a given input data
+ *
+ * @dev		TPM device
+ * @input	Data
+ * @length	Length of the data to calculate the digest
+ * @digest_list	List of digests to fill in
+ *
+ * Return: zero on success, negative errno otherwise
+ */
+int tcg2_create_digest(struct udevice *dev, const u8 *input, u32 length,
+		       struct tpml_digest_values *digest_list);
+
+/**
+ * Get the event size of the specified digests
+ *
+ * @digest_list	List of digests for the event
+ *
+ * Return: Size in bytes of the event
+ */
+u32 tcg2_event_get_size(struct tpml_digest_values *digest_list);
+
+/**
+ * tcg2_get_active_pcr_banks
+ *
+ * @dev			TPM device
+ * @active_pcr_banks	Bitmask of PCR algorithms supported
+ *
+ * Return: zero on success, negative errno otherwise
+ */
+int tcg2_get_active_pcr_banks(struct udevice *dev, u32 *active_pcr_banks);
+
+/**
+ * tcg2_log_append - Append an event to an event log
+ *
+ * @pcr_index	Index of the PCR
+ * @event_type	Type of event
+ * @digest_list List of digests to add
+ * @size	Size of event
+ * @event	Event data
+ * @log		Log buffer to append the event to
+ */
+void tcg2_log_append(u32 pcr_index, u32 event_type,
+		     struct tpml_digest_values *digest_list, u32 size,
+		     const u8 *event, u8 *log);
+
+/**
+ * Extend the PCR with specified digests
+ *
+ * @dev		TPM device
+ * @pcr_index	Index of the PCR
+ * @digest_list	List of digests to extend
+ *
+ * Return: zero on success, negative errno otherwise
+ */
+int tcg2_pcr_extend(struct udevice *dev, u32 pcr_index,
+		    struct tpml_digest_values *digest_list);
+
+/**
+ * Read the PCR into a list of digests
+ *
+* @dev		TPM device
+ * @pcr_index	Index of the PCR
+ * @digest_list	List of digests to extend
+ *
+ * Return: zero on success, negative errno otherwise
+ */
+int tcg2_pcr_read(struct udevice *dev, u32 pcr_index,
+		  struct tpml_digest_values *digest_list);
+
+/**
+ * Measure data into the TPM PCRs and the platform event log.
+ *
+ * @dev		TPM device
+ * @log		Platform event log
+ * @pcr_index	Index of the PCR
+ * @size	Size of the data
+ * @data	Pointer to the data
+ * @event_type	Event log type
+ * @event_size	Size of the event
+ * @event	Pointer to the event
+ *
+ * Return: zero on success, negative errno otherwise
+ */
+int tcg2_measure_data(struct udevice *dev, struct tcg2_event_log *elog,
+		      u32 pcr_index, u32 size, const u8 *data, u32 event_type,
+		      u32 event_size, const u8 *event);
+
+/**
+ * Measure an event into the platform event log.
+ *
+ * @dev		TPM device
+ * @log		Platform event log
+ * @pcr_index	Index of the PCR
+ * @event_type	Event log type
+ * @size	Size of the event
+ * @event	Pointer to the event
+ *
+ * Return: zero on success, negative errno otherwise
+ */
+int tcg2_measure_event(struct udevice *dev, struct tcg2_event_log *elog,
+		       u32 pcr_index, u32 event_type, u32 size,
+		       const u8 *event);
+
+/**
+ * Initialize the event log
+ *
+ * @dev		TPM device
+ * @elog	Platform event log
+ *
+ * Return: zero on success, negative errno otherwise
+ */
+int tcg2_init_log(struct udevice *dev, struct tcg2_event_log *elog);
+
+/**
+ * Begin measurements.
+ *
+ * @dev		TPM device
+ * @elog	Platform event log
+ *
+ * Return: zero on success, negative errno otherwise
+ */
+int tcg2_measurement_init(struct udevice **dev, struct tcg2_event_log *elog);
+
+/**
+ * Stop measurements and record separator events.
+ *
+ * @dev		TPM device
+ * @elog	Platform event log
+ * @error	Boolean to indicate whether an error ocurred or not
+ */
+void tcg2_measurement_term(struct udevice *dev, struct tcg2_event_log *elog,
+			   bool error);
+
+/**
+ * Get the platform event log address and size.
+ *
+ * @dev		TPM device
+ * @addr	Address of the log
+ * @size	Size of the log
+ *
+ * Return: zero on success, negative errno otherwise
+ */
+int tcg2_platform_get_log(struct udevice *dev, void **addr, u32 *size);
+
+/**
+ * Get the first TPM2 device found.
+ *
+ * @dev		TPM device
+ *
+ * Return: zero on success, negative errno otherwise
+ */
+int tcg2_platform_get_tpm2(struct udevice **dev);
+
+/**
+ * Platform-specific function for handling TPM startup errors
+ *
+ * @dev		TPM device
+ * @rc		The TPM response code
+ */
+void tcg2_platform_startup_error(struct udevice *dev, int rc);
+
 /**
  * Issue a TPM2_Startup command.
  *
@@ -450,6 +691,19 @@ u32 tpm2_pcr_read(struct udevice *dev, u32 idx, unsigned int idx_min_sz,
 u32 tpm2_get_capability(struct udevice *dev, u32 capability, u32 property,
 			void *buf, size_t prop_count);
 
+/**
+ * tpm2_get_pcr_info() - get the supported, active PCRs and number of banks
+ *
+ * @dev:		TPM device
+ * @supported_pcr:	bitmask with the algorithms supported
+ * @active_pcr:		bitmask with the active algorithms
+ * @pcr_banks:		number of PCR banks
+ *
+ * @return 0 on success, code of operation or negative errno on failure
+ */
+int tpm2_get_pcr_info(struct udevice *dev, u32 *supported_pcr, u32 *active_pcr,
+		      u32 *pcr_banks);
+
 /**
  * Issue a TPM2_DictionaryAttackLockReset command.
  *
diff --git a/lib/tpm-v2.c b/lib/tpm-v2.c
index 7272170c78..222df8bfe4 100644
--- a/lib/tpm-v2.c
+++ b/lib/tpm-v2.c
@@ -6,11 +6,685 @@
 
 #include <common.h>
 #include <dm.h>
+#include <dm/of_access.h>
 #include <tpm-common.h>
 #include <tpm-v2.h>
+#include <u-boot/sha1.h>
+#include <u-boot/sha256.h>
+#include <u-boot/sha512.h>
+#include <version.h>
+#include <asm/io.h>
 #include <linux/bitops.h>
+#include <linux/unaligned/be_byteshift.h>
+#include <linux/unaligned/generic.h>
+#include <linux/unaligned/le_byteshift.h>
+
 #include "tpm-utils.h"
 
+const enum tpm2_algorithms tpm2_supported_algorithms[4] = {
+	TPM2_ALG_SHA1,
+	TPM2_ALG_SHA256,
+	TPM2_ALG_SHA384,
+	TPM2_ALG_SHA512,
+};
+
+int tcg2_get_active_pcr_banks(struct udevice *dev, u32 *active_pcr_banks)
+{
+	u32 supported = 0;
+	u32 pcr_banks = 0;
+	u32 active = 0;
+	int rc;
+
+	rc = tpm2_get_pcr_info(dev, &supported, &active, &pcr_banks);
+	if (rc)
+		return rc;
+
+	*active_pcr_banks = active;
+
+	return 0;
+}
+
+u32 tcg2_event_get_size(struct tpml_digest_values *digest_list)
+{
+	u32 len;
+	size_t i;
+
+	len = offsetof(struct tcg_pcr_event2, digests);
+	len += offsetof(struct tpml_digest_values, digests);
+	for (i = 0; i < digest_list->count; ++i) {
+		u16 l = tpm2_algorithm_to_len(digest_list->digests[i].hash_alg);
+
+		if (!l)
+			continue;
+
+		len += l + offsetof(struct tpmt_ha, digest);
+	}
+	len += sizeof(u32);
+
+	return len;
+}
+
+int tcg2_create_digest(struct udevice *dev, const u8 *input, u32 length,
+		       struct tpml_digest_values *digest_list)
+{
+	u8 final[sizeof(union tpmu_ha)];
+	sha256_context ctx_256;
+	sha512_context ctx_512;
+	sha1_context ctx;
+	u32 active;
+	size_t i;
+	u32 len;
+	int rc;
+
+	rc = tcg2_get_active_pcr_banks(dev, &active);
+	if (rc)
+		return rc;
+
+	digest_list->count = 0;
+	for (i = 0; i < ARRAY_SIZE(tpm2_supported_algorithms); ++i) {
+		u32 mask =
+			tpm2_algorithm_to_mask(tpm2_supported_algorithms[i]);
+
+		if (!(active & mask))
+			continue;
+
+		switch (tpm2_supported_algorithms[i]) {
+		case TPM2_ALG_SHA1:
+			sha1_starts(&ctx);
+			sha1_update(&ctx, input, length);
+			sha1_finish(&ctx, final);
+			len = TPM2_SHA1_DIGEST_SIZE;
+			break;
+		case TPM2_ALG_SHA256:
+			sha256_starts(&ctx_256);
+			sha256_update(&ctx_256, input, length);
+			sha256_finish(&ctx_256, final);
+			len = TPM2_SHA256_DIGEST_SIZE;
+			break;
+		case TPM2_ALG_SHA384:
+			sha384_starts(&ctx_512);
+			sha384_update(&ctx_512, input, length);
+			sha384_finish(&ctx_512, final);
+			len = TPM2_SHA384_DIGEST_SIZE;
+			break;
+		case TPM2_ALG_SHA512:
+			sha512_starts(&ctx_512);
+			sha512_update(&ctx_512, input, length);
+			sha512_finish(&ctx_512, final);
+			len = TPM2_SHA512_DIGEST_SIZE;
+			break;
+		default:
+			printf("%s: unsupported algorithm %x\n", __func__,
+			       tpm2_supported_algorithms[i]);
+			continue;
+		}
+
+		digest_list->digests[digest_list->count].hash_alg =
+			tpm2_supported_algorithms[i];
+		memcpy(&digest_list->digests[digest_list->count].digest, final,
+		       len);
+		digest_list->count++;
+	}
+
+	return 0;
+}
+
+void tcg2_log_append(u32 pcr_index, u32 event_type,
+		     struct tpml_digest_values *digest_list, u32 size,
+		     const u8 *event, u8 *log)
+{
+	size_t len;
+	size_t pos;
+	u32 i;
+
+	pos = offsetof(struct tcg_pcr_event2, pcr_index);
+	put_unaligned_le32(pcr_index, log);
+	pos = offsetof(struct tcg_pcr_event2, event_type);
+	put_unaligned_le32(event_type, log + pos);
+	pos = offsetof(struct tcg_pcr_event2, digests) +
+		offsetof(struct tpml_digest_values, count);
+	put_unaligned_le32(digest_list->count, log + pos);
+
+	pos = offsetof(struct tcg_pcr_event2, digests) +
+		offsetof(struct tpml_digest_values, digests);
+	for (i = 0; i < digest_list->count; ++i) {
+		u16 hash_alg = digest_list->digests[i].hash_alg;
+
+		len = tpm2_algorithm_to_len(hash_alg);
+		if (!len)
+			continue;
+
+		pos += offsetof(struct tpmt_ha, hash_alg);
+		put_unaligned_le16(hash_alg, log + pos);
+		pos += offsetof(struct tpmt_ha, digest);
+		memcpy(log + pos, (u8 *)&digest_list->digests[i].digest, len);
+		pos += len;
+	}
+
+	put_unaligned_le32(size, log + pos);
+	pos += sizeof(u32);
+	memcpy(log + pos, event, size);
+}
+
+static int tcg2_log_append_check(struct tcg2_event_log *elog, u32 pcr_index,
+				 u32 event_type,
+				 struct tpml_digest_values *digest_list,
+				 u32 size, const u8 *event)
+{
+	u32 event_size;
+	u8 *log;
+
+	event_size = size + tcg2_event_get_size(digest_list);
+	if (elog->log_position + event_size > elog->log_size) {
+		printf("%s: log too large: %u + %u > %u\n", __func__,
+		       elog->log_position, event_size, elog->log_size);
+		return -ENOBUFS;
+	}
+
+	log = elog->log + elog->log_position;
+	elog->log_position += event_size;
+
+	tcg2_log_append(pcr_index, event_type, digest_list, size, event, log);
+
+	return 0;
+}
+
+static int tcg2_log_init(struct udevice *dev, struct tcg2_event_log *elog)
+{
+	struct tcg_efi_spec_id_event *ev;
+	struct tcg_pcr_event *log;
+	u32 event_size;
+	u32 count = 0;
+	u32 log_size;
+	u32 active;
+	u32 mask;
+	size_t i;
+	u16 len;
+	int rc;
+
+	rc = tcg2_get_active_pcr_banks(dev, &active);
+	if (rc)
+		return rc;
+
+	event_size = offsetof(struct tcg_efi_spec_id_event, digest_sizes);
+	for (i = 0; i < ARRAY_SIZE(tpm2_supported_algorithms); ++i) {
+		mask = tpm2_algorithm_to_mask(tpm2_supported_algorithms[i]);
+
+		if (!(active & mask))
+			continue;
+
+		switch (tpm2_supported_algorithms[i]) {
+		case TPM2_ALG_SHA1:
+		case TPM2_ALG_SHA256:
+		case TPM2_ALG_SHA384:
+		case TPM2_ALG_SHA512:
+			count++;
+			break;
+		default:
+			continue;
+		}
+	}
+
+	event_size += 1 +
+		(sizeof(struct tcg_efi_spec_id_event_algorithm_size) * count);
+	log_size = offsetof(struct tcg_pcr_event, event) + event_size;
+
+	if (log_size > elog->log_size) {
+		printf("%s: log too large: %u > %u\n", __func__, log_size,
+		       elog->log_size);
+		return -ENOBUFS;
+	}
+
+	log = (struct tcg_pcr_event *)elog->log;
+	put_unaligned_le32(0, &log->pcr_index);
+	put_unaligned_le32(EV_NO_ACTION, &log->event_type);
+	memset(&log->digest, 0, sizeof(log->digest));
+	put_unaligned_le32(event_size, &log->event_size);
+
+	ev = (struct tcg_efi_spec_id_event *)log->event;
+	strlcpy((char *)ev->signature, TCG_EFI_SPEC_ID_EVENT_SIGNATURE_03,
+		sizeof(ev->signature));
+	put_unaligned_le32(0, &ev->platform_class);
+	ev->spec_version_minor = TCG_EFI_SPEC_ID_EVENT_SPEC_VERSION_MINOR_TPM2;
+	ev->spec_version_major = TCG_EFI_SPEC_ID_EVENT_SPEC_VERSION_MAJOR_TPM2;
+	ev->spec_errata = TCG_EFI_SPEC_ID_EVENT_SPEC_VERSION_ERRATA_TPM2;
+	ev->uintn_size = sizeof(size_t) / sizeof(u32);
+	put_unaligned_le32(count, &ev->number_of_algorithms);
+
+	count = 0;
+	for (i = 0; i < ARRAY_SIZE(tpm2_supported_algorithms); ++i) {
+		mask = tpm2_algorithm_to_mask(tpm2_supported_algorithms[i]);
+
+		if (!(active & mask))
+			continue;
+
+		len = tpm2_algorithm_to_len(tpm2_supported_algorithms[i]);
+		if (!len)
+			continue;
+
+		put_unaligned_le16(tpm2_supported_algorithms[i],
+				   &ev->digest_sizes[count].algorithm_id);
+		put_unaligned_le16(len, &ev->digest_sizes[count].digest_size);
+		count++;
+	}
+
+	*((u8 *)ev + (event_size - 1)) = 0;
+	elog->log_position = log_size;
+
+	return 0;
+}
+
+static int tcg2_log_find_end(struct tcg2_event_log *elog, struct udevice *dev,
+			     struct tpml_digest_values *digest_list)
+{
+	const u32 offset = offsetof(struct tcg_pcr_event2, digests) +
+		offsetof(struct tpml_digest_values, digests);
+	u32 event_size;
+	u32 count;
+	u16 algo;
+	u32 pcr;
+	u32 pos;
+	u16 len;
+	u8 *log;
+	int rc;
+	u32 i;
+
+	while (elog->log_position + offset < elog->log_size) {
+		log = elog->log + elog->log_position;
+
+		pos = offsetof(struct tcg_pcr_event2, pcr_index);
+		pcr = get_unaligned_le32(log + pos);
+		pos = offsetof(struct tcg_pcr_event2, event_type);
+		if (!get_unaligned_le32(log + pos))
+			return 0;
+
+		pos = offsetof(struct tcg_pcr_event2, digests) +
+			offsetof(struct tpml_digest_values, count);
+		count = get_unaligned_le32(log + pos);
+		if (count > ARRAY_SIZE(tpm2_supported_algorithms) ||
+		    (digest_list->count && digest_list->count != count))
+			return 0;
+
+		pos = offsetof(struct tcg_pcr_event2, digests) +
+			offsetof(struct tpml_digest_values, digests);
+		for (i = 0; i < count; ++i) {
+			pos += offsetof(struct tpmt_ha, hash_alg);
+			if (elog->log_position + pos + sizeof(u16) >=
+			    elog->log_size)
+				return 0;
+
+			algo = get_unaligned_le16(log + pos);
+			pos += offsetof(struct tpmt_ha, digest);
+			switch (algo) {
+			case TPM2_ALG_SHA1:
+			case TPM2_ALG_SHA256:
+			case TPM2_ALG_SHA384:
+			case TPM2_ALG_SHA512:
+				len = tpm2_algorithm_to_len(algo);
+				break;
+			default:
+				return 0;
+			}
+
+			if (digest_list->count) {
+				if (algo != digest_list->digests[i].hash_alg ||
+				    elog->log_position + pos + len >=
+				    elog->log_size)
+					return 0;
+
+				memcpy(digest_list->digests[i].digest.sha512,
+					log + pos, len);
+			}
+
+			pos += len;
+		}
+
+		if (elog->log_position + pos + sizeof(u32) >= elog->log_size)
+			return 0;
+
+		event_size = get_unaligned_le32(log + pos);
+		pos += event_size + sizeof(u32);
+		if (elog->log_position + pos >= elog->log_size)
+			return 0;
+
+		if (digest_list->count) {
+			rc = tcg2_pcr_extend(dev, pcr, digest_list);
+			if (rc)
+				return rc;
+		}
+
+		elog->log_position += pos;
+	}
+
+	return 0;
+}
+
+static int tcg2_log_parse(struct udevice *dev, struct tcg2_event_log *elog)
+{
+	struct tpml_digest_values digest_list;
+	struct tcg_efi_spec_id_event *event;
+	struct tcg_pcr_event *log;
+	u32 calc_size;
+	u32 active;
+	u32 count;
+	u32 evsz;
+	u32 mask;
+	u16 algo;
+	u16 len;
+	int rc;
+	u32 i;
+	u16 j;
+
+	if (elog->log_size <= offsetof(struct tcg_pcr_event, event))
+		return 0;
+
+	log = (struct tcg_pcr_event *)elog->log;
+	if (get_unaligned_le32(&log->pcr_index) != 0 ||
+	    get_unaligned_le32(&log->event_type) != EV_NO_ACTION)
+		return 0;
+
+	for (i = 0; i < sizeof(log->digest); i++) {
+		if (log->digest[i])
+			return 0;
+	}
+
+	evsz = get_unaligned_le32(&log->event_size);
+	if (evsz < offsetof(struct tcg_efi_spec_id_event, digest_sizes) ||
+	    evsz + offsetof(struct tcg_pcr_event, event) > elog->log_size)
+		return 0;
+
+	event = (struct tcg_efi_spec_id_event *)log->event;
+	if (memcmp(event->signature, TCG_EFI_SPEC_ID_EVENT_SIGNATURE_03,
+		   sizeof(TCG_EFI_SPEC_ID_EVENT_SIGNATURE_03)))
+		return 0;
+
+	if (event->spec_version_minor != TCG_EFI_SPEC_ID_EVENT_SPEC_VERSION_MINOR_TPM2 ||
+	    event->spec_version_major != TCG_EFI_SPEC_ID_EVENT_SPEC_VERSION_MAJOR_TPM2)
+		return 0;
+
+	count = get_unaligned_le32(&event->number_of_algorithms);
+	if (count > ARRAY_SIZE(tpm2_supported_algorithms))
+		return 0;
+
+	calc_size = offsetof(struct tcg_efi_spec_id_event, digest_sizes) +
+		(sizeof(struct tcg_efi_spec_id_event_algorithm_size) * count) +
+		1;
+	if (evsz != calc_size)
+		return 0;
+
+	rc = tcg2_get_active_pcr_banks(dev, &active);
+	if (rc)
+		return rc;
+
+	digest_list.count = 0;
+
+	for (i = 0; i < count; ++i) {
+		algo = get_unaligned_le16(&event->digest_sizes[i].algorithm_id);
+		mask = tpm2_algorithm_to_mask(algo);
+
+		if (!(active & mask))
+			return 0;
+
+		switch (algo) {
+		case TPM2_ALG_SHA1:
+		case TPM2_ALG_SHA256:
+		case TPM2_ALG_SHA384:
+		case TPM2_ALG_SHA512:
+			len = get_unaligned_le16(&event->digest_sizes[i].digest_size);
+			if (tpm2_algorithm_to_len(algo) != len)
+				return 0;
+			digest_list.digests[digest_list.count++].hash_alg = algo;
+			break;
+		default:
+			return 0;
+		}
+	}
+
+	/* Read PCR0 to check if previous firmware extended the PCRs or not. */
+	rc = tcg2_pcr_read(dev, 0, &digest_list);
+	if (rc)
+		return rc;
+
+	for (i = 0; i < digest_list.count; ++i) {
+		len = tpm2_algorithm_to_len(digest_list.digests[i].hash_alg);
+		for (j = 0; j < len; ++j) {
+			if (digest_list.digests[i].digest.sha512[j])
+				break;
+		}
+
+		/* PCR is non-zero; it has been extended, so skip extending. */
+		if (j != len) {
+			digest_list.count = 0;
+			break;
+		}
+	}
+
+	elog->log_position = offsetof(struct tcg_pcr_event, event) + evsz;
+	rc = tcg2_log_find_end(elog, dev, &digest_list);
+	if (rc)
+		return rc;
+
+	elog->found = true;
+	return 0;
+}
+
+int tcg2_pcr_extend(struct udevice *dev, u32 pcr_index,
+		    struct tpml_digest_values *digest_list)
+{
+	u32 rc;
+	u32 i;
+
+	for (i = 0; i < digest_list->count; i++) {
+		u32 alg = digest_list->digests[i].hash_alg;
+
+		rc = tpm2_pcr_extend(dev, pcr_index, alg,
+				     (u8 *)&digest_list->digests[i].digest,
+				     tpm2_algorithm_to_len(alg));
+		if (rc) {
+			printf("%s: error pcr:%u alg:%08x\n", __func__,
+			       pcr_index, alg);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+int tcg2_pcr_read(struct udevice *dev, u32 pcr_index,
+		  struct tpml_digest_values *digest_list)
+{
+	struct tpm_chip_priv *priv;
+	u32 rc;
+	u32 i;
+
+	priv = dev_get_uclass_priv(dev);
+	if (!priv)
+		return -ENODEV;
+
+	for (i = 0; i < digest_list->count; i++) {
+		u32 alg = digest_list->digests[i].hash_alg;
+		u8 *digest = (u8 *)&digest_list->digests[i].digest;
+
+		rc = tpm2_pcr_read(dev, pcr_index, priv->pcr_select_min, alg,
+				   digest, tpm2_algorithm_to_len(alg), NULL);
+		if (rc) {
+			printf("%s: error pcr:%u alg:%08x\n", __func__,
+			       pcr_index, alg);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+int tcg2_measure_data(struct udevice *dev, struct tcg2_event_log *elog,
+		      u32 pcr_index, u32 size, const u8 *data, u32 event_type,
+		      u32 event_size, const u8 *event)
+{
+	struct tpml_digest_values digest_list;
+	int rc;
+
+	rc = tcg2_create_digest(dev, data, size, &digest_list);
+	if (rc)
+		return rc;
+
+	rc = tcg2_pcr_extend(dev, pcr_index, &digest_list);
+	if (rc)
+		return rc;
+
+	return tcg2_log_append_check(elog, pcr_index, event_type, &digest_list,
+				     event_size, event);
+}
+
+int tcg2_measure_event(struct udevice *dev, struct tcg2_event_log *elog,
+		       u32 pcr_index, u32 event_type, u32 size,
+		       const u8 *event)
+{
+	struct tpml_digest_values digest_list;
+	int rc;
+
+	rc = tcg2_create_digest(dev, event, size, &digest_list);
+	if (rc)
+		return rc;
+
+	rc = tcg2_pcr_extend(dev, pcr_index, &digest_list);
+	if (rc)
+		return rc;
+
+	return tcg2_log_append_check(elog, pcr_index, event_type, &digest_list,
+				     size, event);
+}
+
+int tcg2_init_log(struct udevice *dev, struct tcg2_event_log *elog)
+{
+	int rc;
+
+	rc = tcg2_platform_get_log(dev, (void **)&elog->log, &elog->log_size);
+	if (rc)
+		return rc;
+
+	elog->log_position = 0;
+	elog->found = false;
+	rc = tcg2_log_parse(dev, elog);
+	if (rc)
+		return rc;
+
+	if (!elog->found) {
+		rc = tcg2_log_init(dev, elog);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+int tcg2_measurement_init(struct udevice **dev, struct tcg2_event_log *elog)
+{
+	int rc;
+
+	rc = tcg2_platform_get_tpm2(dev);
+	if (rc)
+		return rc;
+
+	rc = tpm_init(*dev);
+	if (rc)
+		return rc;
+
+	rc = tpm2_startup(*dev, TPM2_SU_CLEAR);
+	if (rc) {
+		tcg2_platform_startup_error(*dev, rc);
+		return rc;
+	}
+
+	rc = tpm2_self_test(*dev, TPMI_YES);
+	if (rc)
+		printf("%s: self test error, continuing.\n", __func__);
+
+	rc = tcg2_init_log(*dev, elog);
+	if (rc) {
+		tcg2_measurement_term(*dev, elog, true);
+		return rc;
+	}
+
+	rc = tcg2_measure_event(*dev, elog, 0, EV_S_CRTM_VERSION,
+				strlen(version_string) + 1,
+				(u8 *)version_string);
+	if (rc) {
+		tcg2_measurement_term(*dev, elog, true);
+		return rc;
+	}
+
+	return 0;
+}
+
+void tcg2_measurement_term(struct udevice *dev, struct tcg2_event_log *elog,
+			   bool error)
+{
+	u32 event = error ? 0x1 : 0xffffffff;
+	int i;
+
+	for (i = 0; i < 8; ++i)
+		tcg2_measure_event(dev, elog, i, EV_SEPARATOR, sizeof(event),
+				   (const u8 *)&event);
+
+	if (elog->log)
+		unmap_physmem(elog->log, MAP_NOCACHE);
+}
+
+__weak int tcg2_platform_get_log(struct udevice *dev, void **addr, u32 *size)
+{
+	const __be32 *addr_prop;
+	const __be32 *size_prop;
+	int asize;
+	int ssize;
+
+	*addr = NULL;
+	*size = 0;
+
+	addr_prop = dev_read_prop(dev, "linux,sml-base", &asize);
+	if (!addr_prop)
+		addr_prop = dev_read_prop(dev, "tpm_event_log_addr", &asize);
+	size_prop = dev_read_prop(dev, "linux,sml-size", &ssize);
+	if (!size_prop)
+		size_prop = dev_read_prop(dev, "tpm_event_log_size", &ssize);
+	if (addr_prop && size_prop) {
+		u64 a = of_read_number(addr_prop, asize / sizeof(__be32));
+		u64 s = of_read_number(size_prop, ssize / sizeof(__be32));
+
+		*addr = map_physmem(a, s, MAP_NOCACHE);
+		*size = (u32)s;
+	} else {
+		struct ofnode_phandle_args args;
+		phys_addr_t a;
+		phys_size_t s;
+
+		if (dev_read_phandle_with_args(dev, "memory-region", NULL, 0,
+					       0, &args))
+			return -ENODEV;
+
+		a = ofnode_get_addr_size(args.node, "reg", &s);
+		if (a == FDT_ADDR_T_NONE)
+			return -ENOMEM;
+
+		*addr = map_physmem(a, s, MAP_NOCACHE);
+		*size = (u32)s;
+	}
+
+	return 0;
+}
+
+__weak int tcg2_platform_get_tpm2(struct udevice **dev)
+{
+	for_each_tpm_device(*dev) {
+		if (tpm_get_version(*dev) == TPM_V2)
+			return 0;
+	}
+
+	return -ENODEV;
+}
+
+__weak void tcg2_platform_startup_error(struct udevice *dev, int rc) {}
+
 u32 tpm2_startup(struct udevice *dev, enum tpm2_startup_types mode)
 {
 	const u8 command_v2[12] = {
@@ -203,6 +877,131 @@ u32 tpm2_get_capability(struct udevice *dev, u32 capability, u32 property,
 	return 0;
 }
 
+static int tpm2_get_num_pcr(struct udevice *dev, u32 *num_pcr)
+{
+	u8 response[(sizeof(struct tpms_capability_data) -
+		offsetof(struct tpms_capability_data, data))];
+	u32 properties_offset =
+		offsetof(struct tpml_tagged_tpm_property, tpm_property) +
+		offsetof(struct tpms_tagged_property, value);
+	u32 ret;
+
+	memset(response, 0, sizeof(response));
+	ret = tpm2_get_capability(dev, TPM2_CAP_TPM_PROPERTIES,
+				  TPM2_PT_PCR_COUNT, response, 1);
+	if (ret)
+		return ret;
+
+	*num_pcr = get_unaligned_be32(response + properties_offset);
+	if (*num_pcr > TPM2_MAX_PCRS) {
+		printf("%s: too many pcrs: %u\n", __func__, *num_pcr);
+		return -E2BIG;
+	}
+
+	return 0;
+}
+
+static bool tpm2_is_active_pcr(struct tpms_pcr_selection *selection)
+{
+	int i;
+
+	/*
+	 * check the pcr_select. If at least one of the PCRs supports the
+	 * algorithm add it on the active ones
+	 */
+	for (i = 0; i < selection->size_of_select; i++) {
+		if (selection->pcr_select[i])
+			return true;
+	}
+
+	return false;
+}
+
+int tpm2_get_pcr_info(struct udevice *dev, u32 *supported_pcr, u32 *active_pcr,
+		      u32 *pcr_banks)
+{
+	u8 response[(sizeof(struct tpms_capability_data) -
+		offsetof(struct tpms_capability_data, data))];
+	struct tpml_pcr_selection pcrs;
+	u32 num_pcr;
+	size_t i;
+	u32 ret;
+
+	*supported_pcr = 0;
+	*active_pcr = 0;
+	*pcr_banks = 0;
+	memset(response, 0, sizeof(response));
+	ret = tpm2_get_capability(dev, TPM2_CAP_PCRS, 0, response, 1);
+	if (ret)
+		return ret;
+
+	pcrs.count = get_unaligned_be32(response);
+	/*
+	 * We only support 5 algorithms for now so check against that
+	 * instead of TPM2_NUM_PCR_BANKS
+	 */
+	if (pcrs.count > ARRAY_SIZE(tpm2_supported_algorithms) ||
+	    pcrs.count < 1) {
+		printf("%s: too many pcrs: %u\n", __func__, pcrs.count);
+		return -EMSGSIZE;
+	}
+
+	ret = tpm2_get_num_pcr(dev, &num_pcr);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < pcrs.count; i++) {
+		/*
+		 * Definition of TPMS_PCR_SELECTION Structure
+		 * hash: u16
+		 * size_of_select: u8
+		 * pcr_select: u8 array
+		 *
+		 * The offsets depend on the number of the device PCRs
+		 * so we have to calculate them based on that
+		 */
+		u32 hash_offset = offsetof(struct tpml_pcr_selection, selection) +
+			i * offsetof(struct tpms_pcr_selection, pcr_select) +
+			i * ((num_pcr + 7) / 8);
+		u32 size_select_offset =
+			hash_offset + offsetof(struct tpms_pcr_selection,
+					       size_of_select);
+		u32 pcr_select_offset =
+			hash_offset + offsetof(struct tpms_pcr_selection,
+					       pcr_select);
+
+		pcrs.selection[i].hash =
+			get_unaligned_be16(response + hash_offset);
+		pcrs.selection[i].size_of_select =
+			__get_unaligned_be(response + size_select_offset);
+		if (pcrs.selection[i].size_of_select > TPM2_PCR_SELECT_MAX) {
+			printf("%s: pcrs selection too large: %u\n", __func__,
+			       pcrs.selection[i].size_of_select);
+			return -ENOBUFS;
+		}
+		/* copy the array of pcr_select */
+		memcpy(pcrs.selection[i].pcr_select, response + pcr_select_offset,
+		       pcrs.selection[i].size_of_select);
+	}
+
+	for (i = 0; i < pcrs.count; i++) {
+		u32 hash_mask = tpm2_algorithm_to_mask(pcrs.selection[i].hash);
+
+		if (hash_mask) {
+			*supported_pcr |= hash_mask;
+			if (tpm2_is_active_pcr(&pcrs.selection[i]))
+				*active_pcr |= hash_mask;
+		} else {
+			printf("%s: unknown algorithm %x\n", __func__,
+			       pcrs.selection[i].hash);
+		}
+	}
+
+	*pcr_banks = pcrs.count;
+
+	return 0;
+}
+
 u32 tpm2_dam_reset(struct udevice *dev, const char *pw, const ssize_t pw_sz)
 {
 	u8 command_v2[COMMAND_BUFFER_SIZE] = {
-- 
2.31.1

