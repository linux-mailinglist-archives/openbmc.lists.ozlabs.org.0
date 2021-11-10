Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D07D44CD21
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 23:51:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqKpv35Vdz2yMx
	for <lists+openbmc@lfdr.de>; Thu, 11 Nov 2021 09:51:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wRJDhtBu;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sbsvONG8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=dkirjanov@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wRJDhtBu; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sbsvONG8; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq5zR05NXz2xXZ;
 Thu, 11 Nov 2021 00:58:26 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B974E21B04;
 Wed, 10 Nov 2021 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636552702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXZTBdeyVQwbfHLEl2Qd3oJBHCIZMitnb/RbNeAIjJY=;
 b=wRJDhtBuSOeZmDM6u2YhE+0EazYL98T1jy6Fhz3o6OlW9TUjVnLcMFogEkXtW7FBgwSZN9
 lru9gEpad175upns/O5IieuPSn23BB7hgRe8Vw0an2Zwe4gyGVbDiDg8znE0xmlBkbjpky
 EpizCq51KRFClJB7vpqY2ov3nrS79aw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636552702;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXZTBdeyVQwbfHLEl2Qd3oJBHCIZMitnb/RbNeAIjJY=;
 b=sbsvONG8khFAQhe3w0KvitiT8akzWBEgU11b//FXCollxDs6K30cPetcf4Rxt1r5bwgy7S
 C4cP68rZQR+42TBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC40F13BFF;
 Wed, 10 Nov 2021 13:58:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CzYjNv3Pi2HCLgAAMHmgww
 (envelope-from <dkirjanov@suse.de>); Wed, 10 Nov 2021 13:58:21 +0000
Subject: Re: [PATCH v4] Add payload to be 32-bit aligned to fix dropped packets
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20211110095432.GA9571@gmail.com>
From: Denis Kirjanov <dkirjanov@suse.de>
Message-ID: <3f23e37d-98fd-26db-6851-73a63c4f6d0a@suse.de>
Date: Wed, 10 Nov 2021 16:58:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211110095432.GA9571@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Nov 2021 09:51:32 +1100
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



11/10/21 12:54 PM, Kumar Thangavel пишет:
> Update NC-SI command handler (both standard and OEM) to take into
> account of payload paddings in allocating skb (in case of payload
> size is not 32-bit aligned).
> 
> The checksum field follows payload field, without taking payload
> padding into account can cause checksum being truncated, leading to
> dropped packets.

Please add Fixes tag
> 
> Signed-off-by: Kumar Thangavel <thangavel.k@hcl.com>
> Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> 
> ---
>    v4:
>     - Updated existing macro for max function
> 
>    v3:
>     - Added Macro for MAX
>     - Fixed the missed semicolon
> 
>    v2:
>     - Added NC-SI spec version and section
>     - Removed blank line
>     - corrected spellings
> 
>    v1:
>     - Initial draft
> 
> ---
> ---
>   net/ncsi/ncsi-cmd.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index ba9ae482141b..e44fe138c20f 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -213,12 +213,16 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb,
>   {
>   	struct ncsi_cmd_oem_pkt *cmd;
>   	unsigned int len;
> +	/* NC-SI spec DSP_0222_1.2.0, section 8.2.2.2
> +	 * requires payload to be padded with 0 to
> +	 * 32-bit boundary before the checksum field.
> +	 * Ensure the padding bytes are accounted for in
> +	 * skb allocation
> +	 */
>   
> +	unsigned short payload = ALIGN(nca->payload, 4);
>   	len = sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> -	if (nca->payload < 26)
> -		len += 26;
Would be nice to have a constant
> -	else
> -		len += nca->payload;
> +	len += max(payload, 26);
>   
>   	cmd = skb_put_zero(skb, len);
>   	memcpy(&cmd->mfr_id, nca->data, nca->payload);
> @@ -272,6 +276,7 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
>   	struct net_device *dev = nd->dev;
>   	int hlen = LL_RESERVED_SPACE(dev);
>   	int tlen = dev->needed_tailroom;
> +	int payload;
>   	int len = hlen + tlen;
>   	struct sk_buff *skb;
>   	struct ncsi_request *nr;
> @@ -281,14 +286,14 @@ static struct ncsi_request *ncsi_alloc_command(struct ncsi_cmd_arg *nca)
>   		return NULL;
>   
>   	/* NCSI command packet has 16-bytes header, payload, 4 bytes checksum.
> +	 * Payload needs padding so that the checksum field following payload is
> +	 * aligned to 32-bit boundary.
>   	 * The packet needs padding if its payload is less than 26 bytes to
>   	 * meet 64 bytes minimal ethernet frame length.
>   	 */
>   	len += sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> -	if (nca->payload < 26)
> -		len += 26;
> -	else
> -		len += nca->payload;
> +	payload = ALIGN(nca->payload, 4);
> +	len += max(payload, 26);
>   
>   	/* Allocate skb */
>   	skb = alloc_skb(len, GFP_ATOMIC);
> 
