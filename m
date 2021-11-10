Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC944BE20
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 10:55:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hq0Zb5WCFz2yw1
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 20:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OI0Smq4l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OI0Smq4l; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq0Z94jpqz2xsS;
 Wed, 10 Nov 2021 20:54:41 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id iq11so1119678pjb.3;
 Wed, 10 Nov 2021 01:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=tR1eQ0HFDW+gSGWX2relDJWUrab0SBpRydg9vDOUk14=;
 b=OI0Smq4lZWfqIcM3FNpOstehatVCjUPriINDymUV+ZssG2a1GsBt6jj8/pqcDpMPC2
 52wobv7wPIy3cCS/LeaQKbFaF31izmXgzBJ5Bsubl/NKQhjt8wUnzhYr81rMS33VnqUc
 NRrywTsOWbhCzKRXNba//9dK6Feg/iFztS3j+NSKaXPD0nYufZ2LKuTxdz5zsYCOIJdJ
 u22PCP6OMjMyYzCzlYQNfWXTaMCTrTytpVTiMqSHTytL4Qp5XxL3oEmnmxR7jrtYap8x
 J+YooDCjIyS5FOYBOzpQ/oqRS8bEwNzu0hXoVrqmCiXzwL0JQAvXYziYeYJmtXYIHjk2
 Du9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=tR1eQ0HFDW+gSGWX2relDJWUrab0SBpRydg9vDOUk14=;
 b=Ro0asxzsfGNZrvObTpt4yPoc6g3KkhNoIntuVfx78tKvaN71FdTjSTLtXvwiKM8kCw
 +e8I996byQZEW6YBy5Z/KYZsolp2adwQS1njk3pBAfcgZX2bHhWa7fUYvi4JI2mBsAif
 50M67fM1JsjIFcKfHUlsa2z7Ppp2zLM2J/aylDH4lyGk4a/E/DB1MQtI07xms4Nbv8D2
 /o2601kqsym0s6TkqpNczuyU3Nv4sI4Vsy9DOu7uN6JWSMVZZb5zwLiD54f/T61I1FDz
 N71XD6iiDvarPPam4KyVBnZTcapSxARcVH19narXE05hAEOwoca1NO0ytGogBeVgBDgu
 HDiw==
X-Gm-Message-State: AOAM531tJHg4qhPKHQiaMVZkw/0Ewk7qGcAdq306Nx4wGx0HSNu6jG1s
 aH2FHJj2c6f3I7Bk21v6XYM=
X-Google-Smtp-Source: ABdhPJzWfr21w03ICiDUO5Y0+o6zZM1UMXHcxqk5ve27brAQbOY15zUDjW8yS2ToLYtllLuLJ1sUqA==
X-Received: by 2002:a17:90b:3e85:: with SMTP id
 rj5mr15205749pjb.172.1636538079538; 
 Wed, 10 Nov 2021 01:54:39 -0800 (PST)
Received: from gmail.com ([122.178.80.201])
 by smtp.gmail.com with ESMTPSA id i6sm11408891pfu.173.2021.11.10.01.54.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Nov 2021 01:54:39 -0800 (PST)
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
X-Google-Original-From: Kumar Thangavel <thangavel.k@hcl.com>
Date: Wed, 10 Nov 2021 15:24:32 +0530
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v4] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211110095432.GA9571@gmail.com>
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

