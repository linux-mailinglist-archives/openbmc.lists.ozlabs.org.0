Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F39450DAF
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 19:02:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtH950f6xz2yNK
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 05:02:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bDn9nyyM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bDn9nyyM; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtH8Y5dr9z2xtF;
 Tue, 16 Nov 2021 05:02:21 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 993B9619E3;
 Mon, 15 Nov 2021 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636999338;
 bh=rchIZSvTy0GDopVKqAM7vszKatW6GF64RIwJMnf6JUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bDn9nyyM4PWkVwdd3wzFvEmLJtEnzqJKotKlWpyU3z5RRFbPYATQo1/1i0FRCpQZT
 3rBuxCcjOebLpArOHMVPXrxoKmMI146Wyiwn1y6D7+0/ixL4avVnuEzw7YG+mLE2ao
 1M/ehJhoSDvDIgwjsxC73QjPkKf00FQx69vu/GlHSTzgfwzrKKBzIuyhP7YDuXEEtf
 fXyFY5ur+zj2lbJ5ToaPLDEcY5/J3xU/wN3zkDHR8kX5une7Xa5nspH3tqjKVruT6p
 7HAnQt9pisHn4ISkbkvwVg+3DMxEwKTjmrwzCl2FHWQ0JUo3Ij1kTUomS6pZIqGJDG
 gJlSVKwXBfg5g==
Date: Mon, 15 Nov 2021 10:02:16 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: [PATCH v5] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211115100216.57cc4591@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211115144846.GA12078@gmail.com>
References: <20211115144846.GA12078@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 openbmc@lists.ozlabs.org, Amithash Prasad <amithash@fb.com>, patrickw3@fb.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 15 Nov 2021 20:18:46 +0530 Kumar Thangavel wrote:
> @@ -213,12 +215,16 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,
>  {
>  	struct ncsi_cmd_oem_pkt *cmd;
>  	unsigned int len;
> +	/* NC-SI spec DSP_0222_1.2.0, section 8.2.2.2
> +	 * requires payload to be padded with 0 to
> +	 * 32-bit boundary before the checksum field.
> +	 * Ensure the padding bytes are accounted for in
> +	 * skb allocation
> +	 */
>  
> +	unsigned short payload = ALIGN(nca->payload, 4);
>  	len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;

This looks like mixing code and declarations.

If a piece of code is important enough to warrant a comment it should
not be placed as variable init.

> @@ -272,6 +278,7 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
>  	struct net_device *dev = nd->dev;
>  	int hlen = LL_RESERVED_SPACE(dev);
>  	int tlen = dev->needed_tailroom;
> +	int payload;
>  	int len = hlen + tlen;
>  	struct sk_buff *skb;
>  	struct ncsi_request *nr;
> @@ -281,14 +288,14 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
>  		return NULL;
>  
>  	/* NCSI command packet has 16-bytes header, payload, 4 bytes checksum.
> +	 * Payload needs padding so that the checksum field following payload is
> +	 * aligned to 32-bit boundary.
>  	 * The packet needs padding if its payload is less than 26 bytes to
>  	 * meet 64 bytes minimal ethernet frame length.
>  	 */
>  	len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> -	if (nca->payload < 26)
> -		len += 26;
> -	else
> -		len += nca->payload;
> +	payload = ALIGN(nca->payload, 4);
> +	len += max(payload, padding_bytes);

payload is int here, and padding_bytes is unsigned short, you either
have to use max_t() or change the types to agree.
