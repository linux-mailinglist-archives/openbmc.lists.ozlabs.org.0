Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBBE43DE1E
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 11:51:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg16R0MB1z2yp4
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 20:51:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Mq9RvoyT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Mq9RvoyT; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg15w1jDvz2yK6;
 Thu, 28 Oct 2021 20:50:57 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 lx5-20020a17090b4b0500b001a262880e99so4232529pjb.5; 
 Thu, 28 Oct 2021 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=c/4MoribtVrSroVLteeEwlqfaqNWtDBUM4Q4t8ms3D4=;
 b=Mq9RvoyTVpctxxXHsszU2ikJCKE92Bxcj7L2kCHnD/S8Axo5EPIQeJZ4LSRRnevS9d
 1gu6SJoWhx+l9VMTKLoLvOSibmsJxPvDjFTW8RwtCZyFdN9pqdIi9MT2QjB702FLNVqz
 /+PJx7F9GoKJOyidzW2HBgDRSvhjo8I/4+GzBKNUKsUftxOjBQgHTIxRFswpzaTrYTpf
 jOw791iKA7BCkNYVPlpMLucpAdpZnZxiJgyD8s2CMvQxpqRnCHIn8vw+QVxBJwVFGSyc
 gMSocNdvjb1FhHHHDPDGABl8l7t/Zioes7sfE1w17gBGPSqSMXmbc8XDICL8JFctB6qF
 njXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=c/4MoribtVrSroVLteeEwlqfaqNWtDBUM4Q4t8ms3D4=;
 b=NoMCILuz9wa8lEu+rBbH5rkCX+jLGZvlxrjAZhk6h4WWMb2bWDajFVNINg0Q+KyCp+
 WUZ4DNm/McgUDOt2UZQnX81PsxWR+HU/WLNAR3LfsZ1xfxrdcJB3gkanLpEsMLdyBmWa
 D+MSClnsRuOe9HFEtjqArpJuEsa/1fMxnkvFGzzpkx6DAZpYuIUnmnfXDga8D86z7Vco
 VA0mc8OSmFL8ZPxw8Sw264dCe+FpFTsb6PX2HsQAQrLb7rGdaU+VkRZIQ4ykGOxpExfA
 b4QtJbaJ8S4tR00g7LJcquYvPodp39BtU5mbfQFLfzZLbHfgX5Ji7bu2dYeWrBu6BU70
 glrw==
X-Gm-Message-State: AOAM530OLiiRNADOM+G1mShwuZtWeoLZLhV2Hkco9rF2LQt6a9L4Ddik
 pPKVQfDWmaCq+cv90FTcezk=
X-Google-Smtp-Source: ABdhPJyXnVVdOZAb3eO65nIvPwtTmJ+Kvgmh5N+1ErNwraW2e2ar59AZe2axU1xQN8Xh9KKVmupMpQ==
X-Received: by 2002:a17:90a:f195:: with SMTP id
 bv21mr3338929pjb.203.1635414654860; 
 Thu, 28 Oct 2021 02:50:54 -0700 (PDT)
Received: from gmail.com ([122.178.170.40])
 by smtp.gmail.com with ESMTPSA id t40sm3217302pfg.142.2021.10.28.02.50.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Oct 2021 02:50:54 -0700 (PDT)
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
X-Google-Original-From: Kumar Thangavel <thangavel.k@hcl.com>
Date: Thu, 28 Oct 2021 15:20:48 +0530
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v4] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211028095047.GA15236@gmail.com>
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

Signed-off-by: Kumar Thangavel <thangavel.k@hcl.com>
Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

---
  v4:
   - Updated existing macro for max function

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
 net/ncsi/ncsi-cmd.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index ba9ae482141b..e44fe138c20f 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -213,12 +213,16 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,
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
+	len += max(payload, 26);
 
 	cmd = skb_put_zero(skb, len);
 	memcpy(&cmd->mfr_id, nca->data, nca->payload);
@@ -272,6 +276,7 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
 	struct net_device *dev = nd->dev;
 	int hlen = LL_RESERVED_SPACE(dev);
 	int tlen = dev->needed_tailroom;
+	int payload;
 	int len = hlen + tlen;
 	struct sk_buff *skb;
 	struct ncsi_request *nr;
@@ -281,14 +286,14 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
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
+	len += max(payload, 26);
 
 	/* Allocate skb */
 	skb = alloc_skb(len, GFP_ATOMIC);
-- 
2.17.1

