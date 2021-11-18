Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0873455F9E
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 16:34:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw3kF5yHxz2yg1
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 02:34:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hYozuXSJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hYozuXSJ; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw3jp65pyz2ymt;
 Fri, 19 Nov 2021 02:33:48 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so6924869pjj.0; 
 Thu, 18 Nov 2021 07:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=ZgnHyTFQ+qW0pv/HKrVWBqMS9x7zALwG/Yk+DsQJW5U=;
 b=hYozuXSJquDE3d3AAMwc/3BXYIgdwNAV0ivXeTBxAlWyjjavrkqlTGUTUlNKaJe/+G
 r/vjWrPUT8mojFYurm/pxYEJdCfQtEzwwDB0xqirQOl0/9MmhGY4XM8NLbBQOJ4HtpZk
 Zd4B0vTyypVwrWXxE5AW7qITHlRp351nS+IXVZiiWzM8Nn2mYqzUanj+VLJXGoX5R45x
 LBTxa3JoyXJRUVyN8OVcNUKvnp16bYS0JBGehM62wgHoOZHv6JaFUEz1KqOHo/1NlmNe
 5YcbQ1ivVxYS3roMkwcLkYo0uJ4jMtZDXZm1QORCAJE+VYEfDP9Y7B8v/SvSP72OYeTp
 5zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ZgnHyTFQ+qW0pv/HKrVWBqMS9x7zALwG/Yk+DsQJW5U=;
 b=o1SCG3Djer+zrJUKkTKFnp9AwlqU1XX7Q7zpovLX+bGUIl4c0gnmrtaOJcDnoTwvbZ
 wAncNXo66I7W7wl2OO/r37mliiIqzWV1N6KwIyuqAXRpn9H07U7uJ3XGeck6D8rNrw25
 WcE9APEabNESIehOo6K8l7Fx2GMROrC/f8KuQMJwk61dV+GLCaBCf9+yc7oZJbWc0gP8
 Zwnd5ERp/MtpjYA8cyfYHuBk/CqY9irL0L+6GYtmt7X1oaQsnk5ocOJyY8n6P52JZjEk
 XZ1/o0ph7zvUI0u7jmwWSylh5U+EAepqXZOJ/7EpzWklWN1ObigpNefZslfNBtwfmreX
 Wkpw==
X-Gm-Message-State: AOAM530F8Pc/I7rxoid2XVaF/sBKexSk4QODfZ9ZL8gs6cvDKnuupDnW
 ra2mixyC5h5NocpOnaZ/yQY=
X-Google-Smtp-Source: ABdhPJysDsGxpmZ9mCoRZ5xgfAUISXGPSnL46PBNO03h5a8wjebQIfvodBRPQIFa6z1ZwsQtgEe46A==
X-Received: by 2002:a17:902:8605:b0:13f:7c1d:56d1 with SMTP id
 f5-20020a170902860500b0013f7c1d56d1mr67828557plo.57.1637249625577; 
 Thu, 18 Nov 2021 07:33:45 -0800 (PST)
Received: from gmail.com ([122.178.80.201])
 by smtp.gmail.com with ESMTPSA id p188sm24682pfg.102.2021.11.18.07.33.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Nov 2021 07:33:45 -0800 (PST)
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
X-Google-Original-From: Kumar Thangavel <thangavel.k@hcl.com>
Date: Thu, 18 Nov 2021 21:03:38 +0530
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v7] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211118153338.GA18435@gmail.com>
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

