Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35567450783
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 15:49:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtBsy0zBqz2yJM
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 01:49:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k2JqhB/c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=k2JqhB/c; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtBsQ6NfWz2xXg;
 Tue, 16 Nov 2021 01:48:58 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id x131so15220124pfc.12;
 Mon, 15 Nov 2021 06:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=W+Hq2phrYgE/sih4cUE4IW0apjvnE17VNBKBZTkliAc=;
 b=k2JqhB/cmW+d3Ry+KWcgnMTDrMNX5/zJ/O8RFNBk24euCCxxA4Tyexx7yMkT0LYfHy
 v7aPrPIDGxUi3hekkp8e0nCUzv/7AcNh9rJSQyA/rJGuj3FlBLF/gMvq+/k+V0/ylUur
 6BgRGIhYkBnKB+Ut4H3SqJWBV20OStlfOWegCGtQ0KsJIWIUziV3fYmVhjAWNwORZwM+
 rHXXfq6cAleFuij0gqs7KBFrFhMoJtDQ9I6jGlzfp0ojuiKQv97/1wzL2ZEBP6TftSwi
 Za00oJ+x4AHk3uq4PBEM9A9mqTarPyC5sTJlxAGXGlxaRvWZjUV3dRzHSe855I8lJwfQ
 nqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=W+Hq2phrYgE/sih4cUE4IW0apjvnE17VNBKBZTkliAc=;
 b=I96dxOcxhJ3LD6N5uX9GNsXUuAOQuZL9dnpwXbsxNNWVpAukSUs5cMrDZNFfXf6m8W
 8TPGc6UEOWXtjU3AEGfvAAZqBjddZ8Nh20frbpdppGC0T7YQEXEY5rmK79Ot70gAIH0m
 UTKw9GGjhX3e22b6aEqXc0B4d018K72KHhrURbvs+HxwAKmg/dbUIEPmJbAgNG9DVd2E
 etzHuHTFESgHkg62YhkHuhA88z3On3dldEkDkTthcuLkISQ5e+4+si8RjDQLlzTOl2MG
 rESofZ+AknxV2hdTKLDbzqazdJyWBbB11xoV5jupDh9Z7U38DzVUG4b7ZkAwwz0fQoYM
 L5Fg==
X-Gm-Message-State: AOAM531wArIODcnjb6xvvUgvu6E1jFpdYWYVNtGF5oGg7OGC2H7qiLez
 HkLEcYDUEIZmE0eDVhE3wlI=
X-Google-Smtp-Source: ABdhPJzOmAqRow3mtUBFk7RQe23RjcZmiy9nAKSWNVOi2QDuDIQhChAJ0+z48WxCQvZF62es8IT/Ig==
X-Received: by 2002:a63:a01a:: with SMTP id r26mr24346553pge.88.1636987734391; 
 Mon, 15 Nov 2021 06:48:54 -0800 (PST)
Received: from gmail.com ([117.202.1.72])
 by smtp.gmail.com with ESMTPSA id lw1sm20003043pjb.38.2021.11.15.06.48.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Nov 2021 06:48:53 -0800 (PST)
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
X-Google-Original-From: Kumar Thangavel <thangavel.k@hcl.com>
Date: Mon, 15 Nov 2021 20:18:46 +0530
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v5] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211115144846.GA12078@gmail.com>
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
 net/ncsi/ncsi-cmd.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index ba9ae482141b..9571bb4dd991 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -18,6 +18,8 @@
 #include "internal.h"
 #include "ncsi-pkt.h"
 
+const unsigned short padding_bytes = 26;
+
 u32 ncsi_calculate_checksum(unsigned char *data, int len)
 {
 	u32 checksum = 0;
@@ -213,12 +215,16 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,
 {
 	struct ncsi_cmd_oem_pkt *cmd;
 	unsigned int len;
+	/* NC-SI spec DSP_0222_1.2.0, section 8.2.2.2
+	 * requires payload to be padded with 0 to
+	 * 32-bit boundary before the checksum field.
+	 * Ensure the padding bytes are accounted for in
+	 * skb allocation
+	 */
 
+	unsigned short payload = ALIGN(nca->payload, 4);
 	len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
-	if (nca->payload < 26)
-		len += 26;
-	else
-		len += nca->payload;
+	len += max(payload, padding_bytes);
 
 	cmd = skb_put_zero(skb, len);
 	memcpy(&cmd->mfr_id, nca->data, nca->payload);
@@ -272,6 +278,7 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
 	struct net_device *dev = nd->dev;
 	int hlen = LL_RESERVED_SPACE(dev);
 	int tlen = dev->needed_tailroom;
+	int payload;
 	int len = hlen + tlen;
 	struct sk_buff *skb;
 	struct ncsi_request *nr;
@@ -281,14 +288,14 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
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

