Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7046645933D
	for <lists+openbmc@lfdr.de>; Mon, 22 Nov 2021 17:38:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyXz122Ryz2ypL
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 03:38:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DTqBN1DB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DTqBN1DB; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyXyY5X9lz2xDH;
 Tue, 23 Nov 2021 03:38:28 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id n85so16643553pfd.10;
 Mon, 22 Nov 2021 08:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=3T98/3whduiezAonMuPxJQbLzPy6xKkpapq3TTnGn3A=;
 b=DTqBN1DBvRcSPQY4uLvY4uTUvu28S0X3a0RZunwFl5MlX7cseoCA7weDmuwhy1XgNp
 vLUDwHMVXKz8JXjnV/RRqKyJB58qen9Vq2xs0J1sDgMg3xsqOBPMVMSHqoW4BC9SXf2w
 g0KXDmBvOvyKBrNp1BPfJhhc0Tio6RH1e7BOvXEBNgjSd1LfckCuC1KGKzqH2ez7RvKw
 STlaEnfykCrPIQzK8tN3gsBwppVDdnMbpDN+oEWoOFWQn/P6h1ajFLlNZQ6c4M0NCk4N
 BMRVfi8UXGxzvif4XfnpsyPP4i29L0uwcS+OQWl+e1QgisnpwYOi47kI0MtWq37pdFHE
 7P4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=3T98/3whduiezAonMuPxJQbLzPy6xKkpapq3TTnGn3A=;
 b=mBAbcB0kgmtrdIRe+FeChajdMCSmQjmDS0gnAjszjKVybm3WzLJaZ2IOO1Ye3Mx4Cm
 qZYzRr70yLRGuc1CVzll7quPuOeip6WJgqZ9vKhnHDDDvMuVK7bHlzAh1zszbFMoaPqJ
 1M/CBj5fatB5NdOkUHPPYXVg0i00T6m7+AfyWLlyty0/Ws0TdNqGy1kxeydf0whxWjFD
 ZS3UUzUdskc/SYGGTMTRSPfK3pLSbT3tkWD5Cbf9suTy4h2+4S1lq6eY5AnR+YQbKjbP
 1y3re7B1brk6odIkmMiOyXz7JbKzlEMA3zz1SfR6zTHf7c6eRD3Ttlq6Rq+SHk6Q7ssL
 d1dw==
X-Gm-Message-State: AOAM531UMVv+aoDwd/k85az+eJLruY99QoK1+dL8kPWwUPlZG/g+uPPa
 8thEiNrek6Wmlqmk5KFCJas=
X-Google-Smtp-Source: ABdhPJyV/5UP+Sjzqpc7BJDMQgu9hM1YcX9NW0+NbLC4BW7DL6VNt2cC7gIA0iFiooTxc4fjLcIMpQ==
X-Received: by 2002:a63:f808:: with SMTP id n8mr15552616pgh.50.1637599105495; 
 Mon, 22 Nov 2021 08:38:25 -0800 (PST)
Received: from gmail.com ([122.178.80.201])
 by smtp.gmail.com with ESMTPSA id p19sm10375718pfo.92.2021.11.22.08.38.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Nov 2021 08:38:25 -0800 (PST)
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
X-Google-Original-From: Kumar Thangavel <thangavel.k@hcl.com>
Date: Mon, 22 Nov 2021 22:08:18 +0530
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v8] net/ncsi : Add payload to be 32-bit aligned to fix
 dropped packets
Message-ID: <20211122163818.GA11306@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, Amithash Prasad <amithash@fb.com>, velumanit@hcl.com,
 patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update NC-SI command handler (both standard and OEM) to take into
account of payload paddings in allocating skb (in case of payload
size is not 32-bit aligned).

The checksum field follows payload field, without taking payload
padding into account can cause checksum being truncated, leading to
dropped packets.

Fixes: fb4ee67529ff ("net/ncsi: Add NCSI OEM command support")
Signed-off-by: Kumar Thangavel <thangavel.k@hcl.com>
Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

---
  v8:
   - Updated padding_bytes as static const int variable

  v7:
   - Updated padding_bytes as const static int variable

  v6:
   - Updated type of padding_bytes variable
   - Updated type of payload
   - Seperated variable declarations and code

  v5:
   - Added Fixes tag
   - Added const variable for padding_bytes

  v4:
   - Used existing macro for max function

  v3:
   - Added Macro for MAX
   - Fixed the missed semicolon

  v2:
   - Added NC-SI spec version and section
   - Removed blank line
   - corrected spellings

  v1:
   - Initial draft

---
---
 net/ncsi/ncsi-cmd.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index ba9ae482141b..dda8b76b7798 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -18,6 +18,8 @@
 #include "internal.h"
 #include "ncsi-pkt.h"
 
+static const int padding_bytes = 26;
+
 u32 ncsi_calculate_checksum(unsigned char *data, int len)
 {
 	u32 checksum = 0;
@@ -213,12 +215,17 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,
 {
 	struct ncsi_cmd_oem_pkt *cmd;
 	unsigned int len;
+	int payload;
+	/* NC-SI spec DSP_0222_1.2.0, section 8.2.2.2
+	 * requires payload to be padded with 0 to
+	 * 32-bit boundary before the checksum field.
+	 * Ensure the padding bytes are accounted for in
+	 * skb allocation
+	 */
 
+	payload = ALIGN(nca->payload, 4);
 	len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
-	if (nca->payload < 26)
-		len += 26;
-	else
-		len += nca->payload;
+	len += max(payload, padding_bytes);
 
 	cmd = skb_put_zero(skb, len);
 	memcpy(&cmd->mfr_id, nca->data, nca->payload);
@@ -272,6 +279,7 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
 	struct net_device *dev = nd->dev;
 	int hlen = LL_RESERVED_SPACE(dev);
 	int tlen = dev->needed_tailroom;
+	int payload;
 	int len = hlen + tlen;
 	struct sk_buff *skb;
 	struct ncsi_request *nr;
@@ -281,14 +289,14 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
 		return NULL;
 
 	/* NCSI command packet has 16-bytes header, payload, 4 bytes checksum.
+	 * Payload needs padding so that the checksum field following payload is
+	 * aligned to 32-bit boundary.
 	 * The packet needs padding if its payload is less than 26 bytes to
 	 * meet 64 bytes minimal ethernet frame length.
 	 */
 	len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
-	if (nca->payload < 26)
-		len += 26;
-	else
-		len += nca->payload;
+	payload = ALIGN(nca->payload, 4);
+	len += max(payload, padding_bytes);
 
 	/* Allocate skb */
 	skb = alloc_skb(len, GFP_ATOMIC);
-- 
2.17.1

