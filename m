Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD42852F1
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 20:26:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463g1w3t29zDqyG
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 04:26:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="SUVFbX7R"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463g1C5PDQzDqwB
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 04:25:49 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id w190so66588484qkc.6
 for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2019 11:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=TDeetVQl8Zpt3dJx1+9iczrZhKUuc7lJYaOnvp76iac=;
 b=SUVFbX7RJz/ZgxpQ863QUGypJ9/huxAmIuBnzrsOJpv1SL1xbwfi9Zd2VozLJW3Uio
 uCwMRK7sZEQ3t6VoAgN84Iy0o8SDuH8q3txZl9MgYuz/4ZUqlLuhg1RKYveIk84n7q0n
 upRlQKf/hHgbdlulfQeAjgB3iLLzXCy6Y8tumKekScLiyUMkjJPaU458UX2KDt3PFkah
 Z1dR8Ar96BldSUPTGJfh6Gmt082ymwzyl1STQASMdeaTJItISeIa8mX6UJVeP+cWEz/t
 6X4G0KmLSGBta25tz/MEO5SNWBgonj57LHck7qr8q5cgTGSXc3sGmCwogUtijs2p/WQR
 zCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=TDeetVQl8Zpt3dJx1+9iczrZhKUuc7lJYaOnvp76iac=;
 b=OE6x1HRQo6X/prWvr0d2G4+Y4bkt4nIzrcl+aL43Ge7b5ljlFddi+un7qekTlgdQSm
 QXD3YM51YVVOYJf3rw2nWsvJxwUeApR59SDG5EO0wjQJSPS5+edL5OjE53DXIiIr+sS6
 3AifGS2KbyxY+uxop1r1p+oDlC5BzO0k/qUhSl86m1+0QZmEX2EWWPzuGrrKyqW8SHto
 s2aydoOOpMHzskyoW7uDKCNwyivSam0juap8gzVr4Omjt7RGW+URxyF588OMz7D8gFjW
 rQVgGQCgptEzmuJM6CWZP7oSXZNywSBUzzmHnn2cDSwmBfPzX80FtzMfFkfqmzaK42JX
 4z9A==
X-Gm-Message-State: APjAAAX1R5tyRqL/ElrYwm62meJfG70B7Rd5YxKRJN6HbUkhIcS6a19l
 qbJQ7jGI04scGRwlzLvuEjgQuw==
X-Google-Smtp-Source: APXvYqwge9tEfeNHYTyIZEosm8L30NJ+ROpOAKEqB/tFI7o2HeICjm4+gULkNh8U/mTvR7vn4DGQjQ==
X-Received: by 2002:a37:8081:: with SMTP id b123mr9760497qkd.62.1565202346375; 
 Wed, 07 Aug 2019 11:25:46 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id m8sm34744362qkg.104.2019.08.07.11.25.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 11:25:46 -0700 (PDT)
Date: Wed, 7 Aug 2019 11:25:18 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Tao Ren <taoren@fb.com>
Subject: Re: [PATCH net-next] net/ncsi: allow to customize BMC MAC Address
 offset
Message-ID: <20190807112518.644a21a2@cakuba.netronome.com>
In-Reply-To: <20190807002118.164360-1-taoren@fb.com>
References: <20190807002118.164360-1-taoren@fb.com>
Organization: Netronome Systems, Ltd.
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
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 6 Aug 2019 17:21:18 -0700, Tao Ren wrote:
> Currently BMC's MAC address is calculated by adding 1 to NCSI NIC's base
> MAC address when CONFIG_NCSI_OEM_CMD_GET_MAC option is enabled. The logic
> doesn't work for platforms with different BMC MAC offset: for example,
> Facebook Yamp BMC's MAC address is calculated by adding 2 to NIC's base
> MAC address ("BaseMAC + 1" is reserved for Host use).
> 
> This patch adds NET_NCSI_MC_MAC_OFFSET config option to customize offset
> between NIC's Base MAC address and BMC's MAC address. Its default value is
> set to 1 to avoid breaking existing users.
> 
> Signed-off-by: Tao Ren <taoren@fb.com>

Maybe someone more knowledgeable like Andrew has an opinion here, 
but to me it seems a bit strange to encode what seems to be platfrom
information in the kernel config :(

> diff --git a/net/ncsi/Kconfig b/net/ncsi/Kconfig
> index 2f1e5756c03a..be8efe1ed99e 100644
> --- a/net/ncsi/Kconfig
> +++ b/net/ncsi/Kconfig
> @@ -17,3 +17,11 @@ config NCSI_OEM_CMD_GET_MAC
>  	---help---
>  	  This allows to get MAC address from NCSI firmware and set them back to
>  		controller.
> +config NET_NCSI_MC_MAC_OFFSET
> +	int
> +	prompt "Offset of Management Controller's MAC Address"
> +	depends on NCSI_OEM_CMD_GET_MAC
> +	default 1
> +	help
> +	  This defines the offset between Network Controller's (base) MAC
> +	  address and Management Controller's MAC address.
> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 7581bf919885..24a791f9ebf5 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -656,6 +656,11 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
>  	struct ncsi_rsp_oem_pkt *rsp;
>  	struct sockaddr saddr;
>  	int ret = 0;
> +#ifdef CONFIG_NET_NCSI_MC_MAC_OFFSET
> +	int mac_offset = CONFIG_NET_NCSI_MC_MAC_OFFSET;
> +#else
> +	int mac_offset = 1;
> +#endif
>  
>  	/* Get the response header */
>  	rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
> @@ -663,8 +668,14 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
>  	saddr.sa_family = ndev->type;
>  	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
>  	memcpy(saddr.sa_data, &rsp->data[BCM_MAC_ADDR_OFFSET], ETH_ALEN);
> -	/* Increase mac address by 1 for BMC's address */
> -	eth_addr_inc((u8 *)saddr.sa_data);
> +
> +	/* Management Controller's MAC address is calculated by adding
> +	 * the offset to Network Controller's (base) MAC address.
> +	 * Note: negative offset is "ignored", and BMC will use the Base
> +	 * MAC address in this case.
> +	 */
> +	while (mac_offset-- > 0)
> +		eth_addr_inc((u8 *)saddr.sa_data);
>  	if (!is_valid_ether_addr((const u8 *)saddr.sa_data))
>  		return -ENXIO;
>  

