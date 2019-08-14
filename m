Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 620388C582
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 03:19:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Wvx1Y1MzDqfb
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 11:19:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=terry.s.duncan@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467WvN033wzDqc6
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 11:19:10 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 18:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="170575833"
Received: from tsduncan-ubuntu.jf.intel.com ([10.7.169.130])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2019 18:19:07 -0700
From: "Terry S. Duncan" <terry.s.duncan@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 William Kennington <wak@google.com>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH] net/ncsi: Ensure 32-bit boundary for data cksum
Date: Tue, 13 Aug 2019 18:18:40 -0700
Message-Id: <20190814011840.9387-1-terry.s.duncan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: "Terry S. Duncan" <terry.s.duncan@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The NCSI spec indicates that if the data does not end on a 32 bit
boundary, one to three padding bytes equal to 0x00 shall be present to
align the checksum field to a 32-bit boundary.

Signed-off-by: Terry S. Duncan <terry.s.duncan@linux.intel.com>
---
 net/ncsi/internal.h |  1 +
 net/ncsi/ncsi-cmd.c |  2 +-
 net/ncsi/ncsi-rsp.c | 12 ++++++++----
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 0b3f0673e1a2..468a19fdfd88 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -185,6 +185,7 @@ struct ncsi_package;
 #define NCSI_TO_CHANNEL(p, c)	(((p) << NCSI_PACKAGE_SHIFT) | (c))
 #define NCSI_MAX_PACKAGE	8
 #define NCSI_MAX_CHANNEL	32
+#define NCSI_ROUND32(x)		(((x) + 3) & ~3) /* Round to 32 bit boundary */
 
 struct ncsi_channel {
 	unsigned char               id;
diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 5c3fad8cba57..c12f2183b460 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -54,7 +54,7 @@ static void ncsi_cmd_build_header(struct ncsi_pkt_hdr *h,
 	checksum = ncsi_calculate_checksum((unsigned char *)h,
 					   sizeof(*h) + nca->payload);
 	pchecksum = (__be32 *)((void *)h + sizeof(struct ncsi_pkt_hdr) +
-		    nca->payload);
+		    NCSI_ROUND32(nca->payload));
 	*pchecksum = htonl(checksum);
 }
 
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 7581bf919885..10a142d0422f 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -47,7 +47,8 @@ static int ncsi_validate_rsp_pkt(struct ncsi_request *nr,
 	if (ntohs(h->code) != NCSI_PKT_RSP_C_COMPLETED ||
 	    ntohs(h->reason) != NCSI_PKT_RSP_R_NO_ERROR) {
 		netdev_dbg(nr->ndp->ndev.dev,
-			   "NCSI: non zero response/reason code\n");
+			   "NCSI: non zero response/reason code %04xh, %04xh\n",
+			    ntohs(h->code), ntohs(h->reason));
 		return -EPERM;
 	}
 
@@ -55,15 +56,18 @@ static int ncsi_validate_rsp_pkt(struct ncsi_request *nr,
 	 * sender doesn't support checksum according to NCSI
 	 * specification.
 	 */
-	pchecksum = (__be32 *)((void *)(h + 1) + payload - 4);
+	pchecksum = (__be32 *)((void *)(h + 1) + NCSI_ROUND32(payload) - 4);
 	if (ntohl(*pchecksum) == 0)
 		return 0;
 
 	checksum = ncsi_calculate_checksum((unsigned char *)h,
-					   sizeof(*h) + payload - 4);
+					   sizeof(*h) +
+					       NCSI_ROUND32(payload) - 4);
 
 	if (*pchecksum != htonl(checksum)) {
-		netdev_dbg(nr->ndp->ndev.dev, "NCSI: checksum mismatched\n");
+		netdev_dbg(nr->ndp->ndev.dev,
+			   "NCSI: checksum mismatched; recd: %08x calc: %08x\n",
+			   *pchecksum, htonl(checksum));
 		return -EINVAL;
 	}
 
-- 
2.17.1

