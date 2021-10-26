Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C3B43B4C8
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 16:50:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdvrM70BDz2xb6
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 01:50:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C521lOPn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=C521lOPn; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdvqx1pT5z2xt0;
 Wed, 27 Oct 2021 01:50:02 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id f11so14533925pfc.12;
 Tue, 26 Oct 2021 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=YZIm96LbqBgjV0pIqz1KZWtt3dypc/WAF3GjBy/AirE=;
 b=C521lOPnJzqQc9Qm6CmJkWAUgVXrrVLGgRh1IuwwiB+RePruIXXMz5wOD+72YgnOT5
 WGLt1YJcb/52YLQf5aipWz9PR6qNiK4mj6d287Eif+vxQRFzSYkg9rlU30M3vhpTsCjQ
 fyEBGyrbqS/ISCnwacLl4VQ9Kl0nXyUN3H252uE7JAQszJ+Uew03uFlwqjOqwFREJOLD
 14YmSMyasT7Xb6r+hFIyVZsFevQzC7RDNGiBe1veL3rJfMyCjJuXEI6Hjx57IrA7M5xY
 w1vtoKHtsa+tSh7IHewiF9pSMd2/CGygOTM1ms3n5UZnR6Wg5qUvAVOr70WXjsW+Kbzy
 vyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=YZIm96LbqBgjV0pIqz1KZWtt3dypc/WAF3GjBy/AirE=;
 b=hJuCgB/6NxTxMutPXlTVU5pdnvLz32sBTNWfdXChnMZnhjQQgRQqZC+sleQkvFTPJF
 CDTrrX89Kmw0jk5L0zkx57lvwT58uoBFwOX6Gsg77NUbaSJG8q1W4ERugQKY9FWy038R
 lnlZ1OU9HZfzSR5wXJylrj1rSlc02Q2K3QpMLS7w0BGNvr0zpNDOPznEgHugawFR1+tN
 GHqaAqlodU+rWxGij4Foqw8nOpJblHskD7ZpnJquE3qMXy/yFTSr4/BVfj05tNUzqp8x
 Vm7QVHp5EedPYo4IDIS4opiMV2fibkmfn2TEiU27txtbFrshLct02Zj6JEemIwNMCWOq
 BggA==
X-Gm-Message-State: AOAM531pniTVdCYIrxYUR3qCx7V2ADhYWw1OjTJ2qW/PaXwQZTcKvA/a
 Fto6cM4uJpaQcXifsVOgjuk=
X-Google-Smtp-Source: ABdhPJzGuv2WnfRgauy6ynsONYcB+kO9o5T9gSlxjwdToJz3l9PC7qFnCd6tDQqwyjVHfqTFWvEEtQ==
X-Received: by 2002:a63:8541:: with SMTP id u62mr12153651pgd.248.1635259800697; 
 Tue, 26 Oct 2021 07:50:00 -0700 (PDT)
Received: from gmail.com ([122.178.170.40])
 by smtp.gmail.com with ESMTPSA id v13sm19001289pgt.7.2021.10.26.07.49.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 26 Oct 2021 07:50:00 -0700 (PDT)
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
X-Google-Original-From: Kumar Thangavel <thangavel.k@hcl.com>
Date: Tue, 26 Oct 2021 20:19:53 +0530
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v3] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211026144953.GA15611@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Amithash Prasad <amithash@fb.com>, velumanit@hcl.com, patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update NC-SI command handler (both standard and OEM) to take into
account of payload paddings in allocating skb (in case of payload
size is not 32-bit aligned).

The checksum field follows payload field, without taking payload
padding into account can cause checksum being truncated, leading to
dropped packets.

Signed-off-by: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

---
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
 net/ncsi/ncsi-cmd.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index ba9ae482141b..179e39105072 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -18,6 +18,8 @@
 #include "internal.h"
 #include "ncsi-pkt.h"
 
+#define MAX(X, Y) (((X) > (Y)) ? (X) : (Y))
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
+	len += MAX(payload, 26);
 
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
+	len += MAX(payload, 26);
 
 	/* Allocate skb */
 	skb = alloc_skb(len, GFP_ATOMIC);
-- 
2.17.1

