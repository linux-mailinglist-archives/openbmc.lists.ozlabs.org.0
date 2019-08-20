Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62730952BA
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 02:25:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CBR46JdYzDqYC
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 10:25:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=terry.s.duncan@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CBQB0hYHzDqJh
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 10:25:04 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 17:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,406,1559545200"; d="scan'208";a="189691872"
Received: from tsduncan-ubuntu.jf.intel.com ([10.7.169.130])
 by orsmga002.jf.intel.com with ESMTP; 19 Aug 2019 17:25:00 -0700
From: "Terry S. Duncan" <terry.s.duncan@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] net/ncsi: Ensure 32-bit boundary for data cksum
Date: Mon, 19 Aug 2019 17:24:02 -0700
Message-Id: <20190820002402.39001-1-terry.s.duncan@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org,
 "Terry S. Duncan" <terry.s.duncan@linux.intel.com>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The NCSI spec indicates that if the data does not end on a 32 bit
boundary, one to three padding bytes equal to 0x00 shall be present to
align the checksum field to a 32-bit boundary.

Signed-off-by: Terry S. Duncan <terry.s.duncan@linux.intel.com>
---
 net/ncsi/ncsi-cmd.c | 2 +-
 net/ncsi/ncsi-rsp.c | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 5c3fad8cba57..eab4346b0a39 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -54,7 +54,7 @@ static void ncsi_cmd_build_header(struct ncsi_pkt_hdr *h,
 	checksum = ncsi_calculate_checksum((unsigned char *)h,
 					   sizeof(*h) + nca->payload);
 	pchecksum = (__be32 *)((void *)h + sizeof(struct ncsi_pkt_hdr) +
-		    nca->payload);
+		    ALIGN(nca->payload, 4));
 	*pchecksum = htonl(checksum);
 }
 
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 7581bf919885..d876bd55f356 100644
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
 
@@ -55,7 +56,7 @@ static int ncsi_validate_rsp_pkt(struct ncsi_request *nr,
 	 * sender doesn't support checksum according to NCSI
 	 * specification.
 	 */
-	pchecksum = (__be32 *)((void *)(h + 1) + payload - 4);
+	pchecksum = (__be32 *)((void *)(h + 1) + ALIGN(payload, 4) - 4);
 	if (ntohl(*pchecksum) == 0)
 		return 0;
 
@@ -63,7 +64,9 @@ static int ncsi_validate_rsp_pkt(struct ncsi_request *nr,
 					   sizeof(*h) + payload - 4);
 
 	if (*pchecksum != htonl(checksum)) {
-		netdev_dbg(nr->ndp->ndev.dev, "NCSI: checksum mismatched\n");
+		netdev_dbg(nr->ndp->ndev.dev,
+			   "NCSI: checksum mismatched; recd: %08x calc: %08x\n",
+			   *pchecksum, htonl(checksum));
 		return -EINVAL;
 	}
 
-- 
2.17.1

