Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E8A2F7F56
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 16:19:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHPwn5bBMzDsj7
	for <lists+openbmc@lfdr.de>; Sat, 16 Jan 2021 02:19:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RthqImdx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHPls1dwzzDsgM
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2021 02:11:36 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FF28dS135220; Fri, 15 Jan 2021 10:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=f88HYNmjigdORFnXmGTqqGY2ZvoZ4cJH2Kvmw7PHljE=;
 b=RthqImdx9nnHdnWZWsspsjIGbeUiA8IvBYG7yJuLzLbKLnxUF+RXeDhQFtVIt1XlDRau
 FfAV1FrcVX/yEh489d/oBQqCGJMr5RpKd4i5pfPMwEa5L3nNbHqf92ltDZwA0+knby1s
 vIbXOsIVPMYpxnuVGuCOkX3/Q7tK85wGjvoUjx/9+XHbazNxjdzWqOFWaVGSYGXaDqsc
 HUXS7V2CE8DNh8GpTkN27VsWhsWrGcLWdZkZjELuthhummn6NVotwOKITilxySiixtm9
 2J8RMOjJdXFYh8MemX39WjAcMFNEJAtsZp5nxTXixk2TFw3B9bzl4hbncBM+R6pv4iHx Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 363d8v0ff9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 10:11:34 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10FF2hoA137513;
 Fri, 15 Jan 2021 10:11:33 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 363d8v0ff0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 10:11:33 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FF8ADl006269;
 Fri, 15 Jan 2021 15:11:33 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 35y44a0vdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 15:11:33 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10FFBWi419268076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 15:11:32 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD519BE062;
 Fri, 15 Jan 2021 15:11:31 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B071BE061;
 Fri, 15 Jan 2021 15:11:30 +0000 (GMT)
Received: from klaus-virtual-ubuntu.aus.stglabs.ibm.com (unknown [9.80.230.10])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 15:11:30 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: [PATCH linux dev-5.8 4/9] tpm: tpm_tis: Add verify_data_integrity
 handle to tpm_tis_phy_ops
Date: Fri, 15 Jan 2021 12:10:43 -0300
Message-Id: <20210115151048.15965-5-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115151048.15965-1-klaus@linux.vnet.ibm.com>
References: <20210115151048.15965-1-klaus@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_08:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150091
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
Cc: Amir Mizinski <amirmizi6@gmail.com>,
 Christophe Ricard <christophe-h.ricard@st.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Amir Mizinski <amirmizi6@gmail.com>

When using I2C bus protocol, the TPM has the ability to report data
integrity on incoming or outgoing command parameter bytes.
According to the TCG specs, if this data validation functionality is
enabled via the TPM_DATA_CSUM_ENABLE register, the TPM will update the
TPM_DATA_CSUM register after reception of the last command byte and after
the last response byte has been read.

Data integrity is checked if a "verify_data_integrity" handle is defined in
"tpm_tis_phy_ops".

Co-developed-by: Christophe Ricard <christophe-h.ricard@st.com>
Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
Signed-off-by: Amir Mizinski <amirmizi6@gmail.com>
---
 drivers/char/tpm/tpm_tis_core.c | 14 ++++++++++++++
 drivers/char/tpm/tpm_tis_core.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index 931240674579..419a36835c23 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -347,6 +347,13 @@ static int __tpm_tis_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 		return size;
 	}
 
+	if (priv->phy_ops->verify_data_integrity)
+		if (!priv->phy_ops->verify_data_integrity(priv, buf,
+							  size)) {
+			size = -EIO;
+			return size;
+		}
+
 	return size;
 }
 
@@ -419,6 +426,13 @@ static int tpm_tis_send_data(struct tpm_chip *chip, const u8 *buf, size_t len)
 		return rc;
 	}
 
+	if (priv->phy_ops->verify_data_integrity) {
+		if (!priv->phy_ops->verify_data_integrity(priv, buf, len)) {
+			rc = -EIO;
+			return rc;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/char/tpm/tpm_tis_core.h b/drivers/char/tpm/tpm_tis_core.h
index 6cc6b761a095..cd97c018c27b 100644
--- a/drivers/char/tpm/tpm_tis_core.h
+++ b/drivers/char/tpm/tpm_tis_core.h
@@ -107,6 +107,8 @@ struct tpm_tis_phy_ops {
 	int (*read16)(struct tpm_tis_data *data, u32 addr, u16 *result);
 	int (*read32)(struct tpm_tis_data *data, u32 addr, u32 *result);
 	int (*write32)(struct tpm_tis_data *data, u32 addr, u32 src);
+	bool (*verify_data_integrity)(struct tpm_tis_data *data, const u8 *buf,
+				      size_t len);
 };
 
 static inline int tpm_tis_read_bytes(struct tpm_tis_data *data, u32 addr,
-- 
2.20.1

