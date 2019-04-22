Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83D1853F
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:16:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45035L1575zDqLD
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:16:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="mE9OADSk"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44p0jq4WpTzDqMH
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 07:54:52 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id g7so6428426qtc.0
 for <openbmc@lists.ozlabs.org>; Mon, 22 Apr 2019 14:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=kTvA5Kmg+3HcCF2yD6g76qbiLSinUsBTi2zmCwQo+eU=;
 b=mE9OADSk7Pcwd3TLJ1zXHvja36Lr+xMve74Fs6czDBIaY1ZxTh1lQV8YRek2tx40z+
 W8g/Xju0X4GPbBOWK3IiI+wCxMIAR12cYP/NKO50Fbx2aMrdsQdGSVPzHl4dbPkTYPuR
 v5a9gwNQlc/us+HTKKPsGYsw5PpMArHHBH+oMluoqM6hb7o1jawVsrboLg08QNJu0U5m
 iUxz9PXn7LyRbFjIuNn4VJD/zXAhPkDnOEC6ZmtG6B1iQkHLpQpEDQ5lg0w5i1va5SnO
 /MavESFE1QxuuKbNWkXZY4Z9aneBaOAIU6yNw4OBsRDgFnn+8lu4GO2AMCKMHWssMNzB
 FA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=kTvA5Kmg+3HcCF2yD6g76qbiLSinUsBTi2zmCwQo+eU=;
 b=i4cCA1xIIVErbD0c2PCw+DKCbV9e0l5mNJMm4EWe4MP4oRoT0MNEP1xtwqQtkIZeA4
 OtO/JDsXj/khmZGWsLQxr1Iw3lURjXhPu5h8xzvhCbusEGPWvC7MRqcO7ja/Jez5XqzD
 cPwjCskJUbY72bl7zxACGEib1uHdpGpMo8zjXsq7O6Ld47beOcV1ZX0a/Pl6rBUg1WMM
 CPAK2tp0fbXdc1uJy+Jt4mBT6jbvn6HE8OAkec9OPb3bMOudOQ8yTSYA0n1fX2J7v4Kg
 BDO0+HlHYHGzgW10kpWrmFojxeD+dIbYM/tFK0B/M7zWUPFkWsuDC8XWbyp2Fbs/bOQD
 ZoiA==
X-Gm-Message-State: APjAAAUdVbAZKtv7jB36t19nVI4RrFqFXih3V+VOq08h/vtFOzCe2U2v
 ot9llnZQnmcWD99ujqQ4WYOEjA==
X-Google-Smtp-Source: APXvYqwuB3b1JbRgFtNOCcFHWud7XtM69Tk41Ids7cLqJ2nu2ueDsd8+G4Yxr9kWiKWsWBqE54WvQg==
X-Received: by 2002:aed:2307:: with SMTP id h7mr17582700qtc.87.1555970088440; 
 Mon, 22 Apr 2019 14:54:48 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id f65sm6939392qkb.83.2019.04.22.14.54.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Apr 2019 14:54:48 -0700 (PDT)
Date: Mon, 22 Apr 2019 14:54:43 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Tao Ren <taoren@fb.com>
Subject: Re: [PATCH net] net/ncsi: handle overflow when incrementing mac
 address
Message-ID: <20190422145443.6391eaf8@cakuba.netronome.com>
In-Reply-To: <20190422172754.1011894-1-taoren@fb.com>
References: <20190422172754.1011894-1-taoren@fb.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 09 May 2019 16:11:00 +1000
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
Cc: Andrew Jeffery <andrew@aj.id.au>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 22 Apr 2019 10:27:54 -0700, Tao Ren wrote:
> Previously BMC's MAC address is calculated by simply adding 1 to the
> last byte of network controller's MAC address, and it produces incorrect
> result when network controller's MAC address ends with 0xFF.
> The problem is fixed by detecting integer overflow when incrementing MAC
> address and adding the carry bit (if any) to the next/left bytes of the
> MAC address.
> 

It'd be good to have a Fixes tag, if it's worth going to the net tree.

> Signed-off-by: Tao Ren <taoren@fb.com>
> ---
>  net/ncsi/ncsi-rsp.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index dc07fcc7938e..eb42bbdb7501 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -658,7 +658,8 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
>  	const struct net_device_ops *ops = ndev->netdev_ops;
>  	struct ncsi_rsp_oem_pkt *rsp;
>  	struct sockaddr saddr;
> -	int ret = 0;
> +	int ret, offset;
> +	u16 carry = 1;
>  
>  	/* Get the response header */
>  	rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
> @@ -667,7 +668,12 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
>  	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
>  	memcpy(saddr.sa_data, &rsp->data[BCM_MAC_ADDR_OFFSET], ETH_ALEN);
>  	/* Increase mac address by 1 for BMC's address */
> -	saddr.sa_data[ETH_ALEN - 1]++;
> +	offset = ETH_ALEN - 1;
> +	do {
> +		carry += (u8)saddr.sa_data[offset];
> +		saddr.sa_data[offset] = (char)carry;
> +		carry = carry >> 8;
> +	} while (carry != 0 && --offset >= 0);

We have eth_addr_dec(), perhaps it'd be good to add an eth_addr_inc()
equivalent?  (I'm not sure if it'd have to be in net-next, it's a tiny
function, and OK for net for my taste, but I had been wrong before).

If I'm allowed to be paranoid I'd also advise checking the resulting
MAC is a valid ethernet unicast addr.

>  	ret = ops->ndo_set_mac_address(ndev, &saddr);
>  	if (ret < 0)
>  		netdev_warn(ndev, "NCSI: 'Writing mac address to device failed\n");

