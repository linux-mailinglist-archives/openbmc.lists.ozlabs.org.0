Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CF456010
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 17:03:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw4NK1VZlz303f
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 03:03:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g0b/96AP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=g0b/96AP; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw4Mn5yz7z2x98;
 Fri, 19 Nov 2021 03:03:15 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id y8so5646804plg.1;
 Thu, 18 Nov 2021 08:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=ZgnHyTFQ+qW0pv/HKrVWBqMS9x7zALwG/Yk+DsQJW5U=;
 b=g0b/96APpudjV6Sa+H3SWzKNyTjnJdPYk2TegdkuwJMisJjlGdK+t3ZB6Lk+M2W6c2
 fs4/lxYbQwT52+E0gMvTfj/rQmpiZBSIJWdMaru0qXfCVYGCQqrwo4f4byD/AB4wDkiw
 DNbTzFefiy+zrhLeBYKqjL2Lk3s2eNl7H1qc8mp0rpltpbRNfDCBaKs7JAoFLkmnjXhn
 we0a9S8c5j5iguYJuCvlL9UTqK1SfOQWRzkUthZD47is1SlJD3DMEtdF59AvjECfKOvR
 oxRU2Fu1H5Z7/0rXb+fRS122Zmiajs/4iGY3kRwx4BQorThnZaX0zGoQ8ku7G88LH7Uk
 QtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ZgnHyTFQ+qW0pv/HKrVWBqMS9x7zALwG/Yk+DsQJW5U=;
 b=gdb3Zx1Y5oVYHMayDreFxwOe5+U+IDTwuUBdmj2bA7mE4ykLws3zdxsmMN6aLQXWbu
 T17rZnTBkSKpuG22qw4bWCECDrWWeYoZdhhDuBMbXWTiFFI18fX9IjXDrVnFVCe/oFK+
 gBev7pYTFfSSJmb8cgraq6e3i8g05z9KnA5pxaEOkQ6aak/XRaoPz/xxErvOCNj1T3p3
 w7rznxp7zDdm8lnvo6VXzlw7WRBza7Vvwo+xd9QSgwIoUhC/29muvxmB6/k34oq9Gf9E
 97LXUjpDoSoYYAcWlvBP7kRCSEZoSEhclTtKlcAV2T/CT2wCx+PrmrrkzEpG++Ivpguc
 Mf3A==
X-Gm-Message-State: AOAM530Jc0Owae9YrhP66UnAyEAUC3IxtHrTbpQU9Z4m19NAbqNHafJL
 es5w9/p3ou1YRvkKfxcpvSU=
X-Google-Smtp-Source: ABdhPJwdZgVgtZff0tup4etEV1ghUze5s8BeszB3FZsiMSLSTcwoAcXqMiR/l/e2vewNLb9hpcztTg==
X-Received: by 2002:a17:90a:fd96:: with SMTP id
 cx22mr11838791pjb.151.1637251391351; 
 Thu, 18 Nov 2021 08:03:11 -0800 (PST)
Received: from gmail.com ([122.178.80.201])
 by smtp.gmail.com with ESMTPSA id u13sm115515pgp.27.2021.11.18.08.03.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Nov 2021 08:03:10 -0800 (PST)
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
X-Google-Original-From: Kumar Thangavel <thangavel.k@hcl.com>
Date: Thu, 18 Nov 2021 21:33:02 +0530
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v7] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211118160301.GA19542@gmail.com>
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
index ba9ae482141b..9a6f10f4833e 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -18,6 +18,8 @@
 #include "internal.h"
 #include "ncsi-pkt.h"
 
+const static int padding_bytes = 26;
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

