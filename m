Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F935433890
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 16:42:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYbzw4Vklz305j
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 01:42:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D3mEBmuU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=D3mEBmuU; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYbzR5gMrz2yXM;
 Wed, 20 Oct 2021 01:41:38 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id v20so13803031plo.7;
 Tue, 19 Oct 2021 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=DrUUPCizKwC3ksHUSZfDSrYdCien60d8cF3/MHkkAR0=;
 b=D3mEBmuU2Jfs0CVLC4Ty1Y0EGDWYqIwfVWosSjUmWCdJygIoa8WY83TMLm8WTxtQZJ
 7bjkg6KAhunuH2TQ+FcFWCM4wpL3RqAytnDGWxt0QijP8YHDvxs7j9LxARn3d4hnV6iP
 KPCajNapGZz0IJaGH03hUeDRL0IdZuabBYjYKHg2uPG68ehmmNCVg1y7DLk7rT4HeIF6
 Tp0EaaBRRX7HkiJFDME+pfMXeqziOE3ttSXaa6U9/iEU/r5bmld76B8An3jZOXnadUbI
 SuILJz41GhzhN3zbjN0USfISZyGuZ0sOfMMauOWrZXGMHLcRTjAKf1+VEGKpUrsVmYZb
 Yhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=DrUUPCizKwC3ksHUSZfDSrYdCien60d8cF3/MHkkAR0=;
 b=Q9qV++w3/+EaM5ZeYpFP9LPyagZExoTAHvugXEuxT9PPwkKJJFoStCm0Ugf7FzknHI
 Ns7O33arjnWvpKKEi3D27SiGu8JWQhiWC884mdeTgK2PL8/WIliDfBvyNn9UjooZh8sc
 KxMwkuwDX0kwJXOU2x3ee/VaHA9CiaEdeMUKzMZ+84eB9uE+jAvSmso+vqKfe1oOD8mz
 W1G5cUPWhR+o9Rvmz8jhTOMDT53QeeEVCHm0sRjq8/6XZSfkYWV6wS+7DTfN+g4DAFlQ
 eOnPWWDHjTuQLz57SFfleunVpNmA/GBq10ALL89S6HJbwLkM8mGoUg3emUMBdtbBuFmI
 Fsww==
X-Gm-Message-State: AOAM530i42pAlhJOVStla04/ADcypOmFfWf7g2LXg/d5Ebr4SnQyAPiC
 zAWChnh2S+UdNUxTGmM2u/A=
X-Google-Smtp-Source: ABdhPJytA/SP7vE15F+aX1mnXYy3M4wlUUWJxDance6nXshNDMRAD1AJE+MRazc7aj3dqMIS248ibQ==
X-Received: by 2002:a17:90a:8a0b:: with SMTP id
 w11mr168690pjn.177.1634654494536; 
 Tue, 19 Oct 2021 07:41:34 -0700 (PDT)
Received: from gmail.com ([122.178.163.228])
 by smtp.gmail.com with ESMTPSA id t38sm13051952pfg.102.2021.10.19.07.41.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Oct 2021 07:41:34 -0700 (PDT)
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
X-Google-Original-From: Kumar Thangavel <thangavel.k@hcl.com>
Date: Tue, 19 Oct 2021 20:11:27 +0530
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v2] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211019144127.GA12978@gmail.com>
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

Signed-off-by: Kumar Thangavel <thangavel.k@hcl.com>
Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

---
  v2:
   - Added NC-SI spec version and section
   - Removed blank line
   - corrected spellings

  v1:
   - Initial draft.

---
 net/ncsi/ncsi-cmd.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index ba9ae482141b..29a75b79a811 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -213,12 +213,19 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,
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
+	if (payload < 26)
 		len += 26;
 	else
-		len += nca->payload;
+		len += payload;
 
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
@@ -281,14 +289,17 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
 		return NULL;
 
 	/* NCSI command packet has 16-bytes header, payload, 4 bytes checksum.
+	 * Payload needs padding so that the checksum field following payload is
+	 * aligned to 32-bit boundary.
 	 * The packet needs padding if its payload is less than 26 bytes to
 	 * meet 64 bytes minimal ethernet frame length.
 	 */
 	len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
-	if (nca->payload < 26)
+	payload = ALIGN(nca->payload, 4)
+	if (payload < 26)
 		len += 26;
 	else
-		len += nca->payload;
+		len += payload;
 
 	/* Allocate skb */
 	skb = alloc_skb(len, GFP_ATOMIC);
-- 
2.17.1

