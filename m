Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1460045613E
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 18:14:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw5y15vYtz305X
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 04:14:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L+QcLgEM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=eric.dumazet@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L+QcLgEM; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw5xY1KNrz2ynw;
 Fri, 19 Nov 2021 04:14:07 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id p17so5977244pgj.2;
 Thu, 18 Nov 2021 09:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/7HKNlpWUyJN/g+/zl3ikVoFrGZlwUpFJ0l0iJqjlAo=;
 b=L+QcLgEMplSxGv7SBJA1/cJiI8vc0gV+zGAOdPszZEQHdGETq7IuBsZ42JLnCYpwhO
 YSkLhPTbnz9Qa7Uy0KBhgDZuat411CJ6eC0tYiHZpemoSjaGGOfMOedSLKuM4ISxNs/h
 z2hn2rmYza1iIz7t970Hb5L91modU+g0tib+gQar6spCvM/M38PpGl1jocNfehTj9Kg5
 3Y8p6RQhdGwk4sBTUuI+OQCeX3z9p5jc6M+I7c/+F/8mpBh9UJ4dKoeQeQP2ZmE7JUT8
 bBc6AFRnsxece7ulcWgaTBBfzsi/Q8yXAmyKaq29/3HUvQnktc15sDq38i3cUEBWBt11
 mrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/7HKNlpWUyJN/g+/zl3ikVoFrGZlwUpFJ0l0iJqjlAo=;
 b=Nn8JoejK5kXYZKXyR2yAMO1m4BQ0Lz0iQSVJG4ahdySLcFQ/CZMC/Q28Sbl/Jld8Nz
 yiJlX+ymvF5boMAASuwry4YsplbJTqh6dFxXDfqHDPY5+oZ3dhId5m987OekjKNiVQNj
 GsBMAw8BaEgeoQ9/Lpfw2F52iK2FvhDzalpnRz20DjjD6UUPgpHbgIWKKWmTDEjObBeT
 6IF7HURtKWsfoo68d+RtnuS+cqBtbdHJW3gXSa4PBwxyW6nkA6ySHiK82IzX+ogZtriy
 yYaw6E1KQkwN3yzDHcJ72gAucIfoHHep9dIitZsybbvmk/q0/rFOhKhY6Rt/v7Uqk0Ju
 iPMA==
X-Gm-Message-State: AOAM533rHO8VYi8ipDdBAPdxmlZ5Wfa5o2eQmneNkHnInyt3EPuiGT77
 XDZXr0tD+GBz8rV2J/hsEfA=
X-Google-Smtp-Source: ABdhPJyLLW/dyJQ4eWeiLdVd4i1IQThN5YzoukmXAA/2F1NU+Lhzw9VVVVMKV7nlicBUeoyNMwegPA==
X-Received: by 2002:a63:b204:: with SMTP id x4mr12153740pge.212.1637255642465; 
 Thu, 18 Nov 2021 09:14:02 -0800 (PST)
Received: from [192.168.86.235] (c-73-241-150-58.hsd1.ca.comcast.net.
 [73.241.150.58])
 by smtp.gmail.com with ESMTPSA id a22sm185369pfh.111.2021.11.18.09.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 09:14:02 -0800 (PST)
Subject: Re: [PATCH v7] Add payload to be 32-bit aligned to fix dropped packets
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20211118160301.GA19542@gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <ad44434c-0356-701e-d355-174efc1917b5@gmail.com>
Date: Thu, 18 Nov 2021 09:14:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118160301.GA19542@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
 openbmc@lists.ozlabs.org, Amithash Prasad <amithash@fb.com>, velumanit@hcl.com,
 patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/18/21 8:03 AM, Kumar Thangavel wrote:
> Update NC-SI command handler (both standard and OEM) to take into
> account of payload paddings in allocating skb (in case of payload
> size is not 32-bit aligned).
> 
> The checksum field follows payload field, without taking payload
> padding into account can cause checksum being truncated, leading to
> dropped packets.
> 

Patch title should start with a prefix, identifying which layer/driver is
involved.

Probably in this case

net/ncsi: Add payload to be 32-bit aligned to fix dropped packets

> Fixes: fb4ee67529ff ("net/ncsi: Add NCSI OEM command support")
> Signed-off-by: Kumar Thangavel <thangavel.k@hcl.com>
> Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> 
> ---
>   v7:
>    - Updated padding_bytes as const static int variable
> 
>   v6:
>    - Updated type of padding_bytes variable
>    - Updated type of payload
>    - Seperated variable declarations and code
> 
>   v5:
>    - Added Fixes tag
>    - Added const variable for padding_bytes
> 
>   v4:
>    - Used existing macro for max function
> 
>   v3:
>    - Added Macro for MAX
>    - Fixed the missed semicolon
> 
>   v2:
>    - Added NC-SI spec version and section
>    - Removed blank line
>    - corrected spellings
> 
>   v1:
>    - Initial draft
> 
> ---
> ---
>  net/ncsi/ncsi-cmd.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index ba9ae482141b..9a6f10f4833e 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -18,6 +18,8 @@
>  #include "internal.h"
>  #include "ncsi-pkt.h"
>  
> +const static int padding_bytes = 26;

It would be nice to have some kind of reference, to explain
what is this magic value.

Moving the comment [1] here might make sense.


> +
>  u32 ncsi_calculate_checksum(unsigned char *data, int len)
>  {
>  	u32 checksum = 0;
> @@ -213,12 +215,17 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,
>  {
>  	struct ncsi_cmd_oem_pkt *cmd;
>  	unsigned int len;
> +	int payload;

[1] This comment could be moved before @padding_bytes

> +	/* NC-SI spec DSP_0222_1.2.0, section 8.2.2.2
> +	 * requires payload to be padded with 0 to
> +	 * 32-bit boundary before the checksum field.
> +	 * Ensure the padding bytes are accounted for in
> +	 * skb allocation
> +	 */
>  
> +	payload = ALIGN(nca->payload, 4);
>  	len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> -	if (nca->payload < 26)
> -		len += 26;
> -	else
> -		len += nca->payload;
> +	len += max(payload, padding_bytes);
>  
>  	cmd = skb_put_zero(skb, len);
>  	memcpy(&cmd->mfr_id, nca->data, nca->payload);
> @@ -272,6 +279,7 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
>  	struct net_device *dev = nd->dev;
>  	int hlen = LL_RESERVED_SPACE(dev);
>  	int tlen = dev->needed_tailroom;
> +	int payload;
>  	int len = hlen + tlen;
>  	struct sk_buff *skb;
>  	struct ncsi_request *nr;
> @@ -281,14 +289,14 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
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
>  
>  	/* Allocate skb */
>  	skb = alloc_skb(len, GFP_ATOMIC);
> 
