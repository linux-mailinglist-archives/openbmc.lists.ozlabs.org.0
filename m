Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8AC429DA2
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 08:23:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT5FZ1RWqz2yPg
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 17:23:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=McQMZTzz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=McQMZTzz; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT5F90xsGz2xXb;
 Tue, 12 Oct 2021 17:22:52 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id k26so16753277pfi.5;
 Mon, 11 Oct 2021 23:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=NEBAU1RWs6YJxzDRg0LMwfxlDVZpKjQ2JmxA/FMQn9I=;
 b=McQMZTzzabqyQoFoDz0StgCDkbRur8jQXp9EFJgKGSMZZmgfGdvhTm38pr4OvcR12i
 4PeD56h//3/bd+QLwPHJLYIBru6UZKbYVU4mXsBDbP8ANmFwUseGimunlsyKK9/GOZI3
 RJ8Gx0lPDlQ504jIHHfRNG+iYpAigd+LGm16vlqDl+jEU8SC/3M+oMOcwyNTjfRWVj+S
 WK//+a+XKGs0MvZvHk2Ia3LjWG2jO2KaoBAkgi4xGLYhad/e83YVZcJ3V4zTGDoivUrT
 Q5e2J7VDTjG9bJirjL3AUh02qdzOR4MfAfdQFwr1HcyWCIAJSrixLQiAQa2FiVkoESJR
 cMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=NEBAU1RWs6YJxzDRg0LMwfxlDVZpKjQ2JmxA/FMQn9I=;
 b=Q/yfNbteodVgu5ZW7QQyvfoe6D4saoE8RUMu3YWcO45YZZqPs2uRInu04StGrfBT4a
 LvBuMkhvNR5+16rRMIwjYlj3ISG45hVTW1X7gu3OvUqpTAoqPEeRww0xUAC9SmMAEkhG
 QiAc/uei8etC0Kdewr1KRDAAXOsT7tvqTpuqSIZZFGtKMpFgIjRcJziVAomwPAwZOx1U
 2DfG++TsxDr41Pc/zb/YeLJ2H1Z+61QTOLALZqLjhter8qbtrghRpuMgC36OjsNbZYyR
 SbN58ZaKdLjw1YCLFP7ipbrD+2Lx01wC2jXgRD+YI12mPh3miW7I0Qq4DppxqPCP6lGR
 y9yg==
X-Gm-Message-State: AOAM5314GpFHosDISg+pb6yyoc4Zs7Owq7ZdNGXJnW4jrOPas9tRuleL
 OzIOQixmNHhwfvywkwKCCt8=
X-Google-Smtp-Source: ABdhPJxATpW9oPrVRGySI6PVTwCs5AllHaaU5QwxgAoohRoVLEUprtd6ExSynuJ5fkMIyXgCVd1rzg==
X-Received: by 2002:a63:7447:: with SMTP id e7mr12512872pgn.261.1634019767950; 
 Mon, 11 Oct 2021 23:22:47 -0700 (PDT)
Received: from gmail.com ([2401:4900:1733:f30f:252a:9e24:80ca:38da])
 by smtp.gmail.com with ESMTPSA id n207sm9769768pfd.143.2021.10.11.23.22.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Oct 2021 23:22:47 -0700 (PDT)
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
X-Google-Original-From: Kumar Thangavel <thangavel.k@hcl.com>
Date: Tue, 12 Oct 2021 11:52:40 +0530
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH] net: ncsi: Adding padding bytes in the payload
Message-ID: <20211012062240.GA5761@gmail.com>
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
 openbmc@lists.ozlabs.org, Amithash Prasad <amithash@fb.com>,
 linux-kernel@vger.kernel.org, velumanit@hcl.com, patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update NC-SI command handler (both standard and OEM) to take into
account of payload paddings in allocating skb (in case of payload
size is not 32-bit aligned).

The checksum field follows payload field, without taking payload
padding into account can cause checksum being truncated, leading to
dropped packets.

Signed-off-by: Kumar Thangavel <thangavel.k@hcl.com>

---
 net/ncsi/ncsi-cmd.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index ba9ae482141b..4625fc935603 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -214,11 +214,19 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,
 	struct ncsi_cmd_oem_pkt *cmd;
 	unsigned int len;
 
+	/* NC-SI spec requires payload to be padded with 0
+	 * to 32-bit boundary before the checksum field.
+	 * Ensure the padding bytes are accounted for in
+	 * skb allocation
+	 */
+
+	unsigned short payload = ALIGN(nca->payload, 4);
+
 	len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
-	if (nca->payload < 26)
+	if (payload < 26)
 		len += 26;
 	else
-		len += nca->payload;
+		len += payload;
 
 	cmd = skb_put_zero(skb, len);
 	memcpy(&cmd->mfr_id, nca->data, nca->payload);
@@ -272,6 +280,7 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
 	struct net_device *dev = nd->dev;
 	int hlen = LL_RESERVED_SPACE(dev);
 	int tlen = dev->needed_tailroom;
+	int payload;
 	int len = hlen + tlen;
 	struct sk_buff *skb;
 	struct ncsi_request *nr;
@@ -281,14 +290,18 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
 		return NULL;
 
 	/* NCSI command packet has 16-bytes header, payload, 4 bytes checksum.
+	 * Payload needs padding so that the checksum field follwoing payload is
+	 * aligned to 32bit boundary.
 	 * The packet needs padding if its payload is less than 26 bytes to
 	 * meet 64 bytes minimal ethernet frame length.
 	 */
 	len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
-	if (nca->payload < 26)
+
+	payload = ALIGN(nca->payload, 4);
+	if (payload < 26)
 		len += 26;
 	else
-		len += nca->payload;
+		len += payload;
 
 	/* Allocate skb */
 	skb = alloc_skb(len, GFP_ATOMIC);
-- 
2.17.1

