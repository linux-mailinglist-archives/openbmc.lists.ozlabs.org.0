Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A47EF219F66
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 13:57:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2ZRf4xXyzDqFw
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 21:57:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=qiDzE2FN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=vTmE2DgH; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2ZQX4090zDr1X
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 21:56:36 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 08FC1893;
 Thu,  9 Jul 2020 07:56:33 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 09 Jul 2020 07:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=8jsW73gbZgNDvsmoU+sHsjnlAMTvPCM
 1jMLmSTh8LUA=; b=qiDzE2FNUE79oAn0vgvllXI+Dmx4i16s43d4KKubNqfCLia
 T7d1wZUh+Ly84rMXZvp4sfdarVvgP6xai2ap25KSizuL6oi1YWyB/nEwwIPlXxhD
 TNAVhEj6HPTMf+jFEXRHCjdeRlTqtBuhIPMHYh+eJ6N36H2jmHuKiwfHTdPiqfns
 mXA+c42109pzBY9Q/nNNCFl1DxjdZxXJ+ioFhdT0j6WZstlzedMiQ/kWAkLeo5Qs
 cR67P9GZ8OIbup2ynfnse+euDm1kcObH+jdlwecZoTyizeL5Mx5Iyff9qhuISrNM
 NElNBDdOKtc3fyEEgaNIeet3+iyx43UOHCucZOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8jsW73
 gbZgNDvsmoU+sHsjnlAMTvPCM1jMLmSTh8LUA=; b=vTmE2DgHM15FplUVotnJpp
 ieW/mb2GclY9ArM8dDKAuHTUb2KZD1ANCil128620sDqsJfQeLC1lJTC2lsbofvO
 bqLmzNwuGzjvdlsHSO9NC3DegTTf60TxdjBO5uDGQIhApuVS//iiqHv97XagEFLi
 NPrbxacDgkQfdh47CJn/KEIx6FZEgmwAozKb4mOftqRTztQixFQNGO5tv21DUKeT
 VL0pjCCs7o4Xi9ST32KchsCylwO5Z1hYw/9tkGbyE0K4equZu54pBNHY9xZAaOti
 2RPJUF+7UvSZF0LdXt7q44bB6x8yUVLvldOfyaEjSCkxXmd0i3Z3OBN1KoEhCPDg
 ==
X-ME-Sender: <xms:8QUHX0zqMaJQqkxe5NfeHu2kxMfz3VBNe2Ld0bym2p-0B60cF1Tmzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudelgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8QUHX4QmxxUzBbiOX3tTArPTokj7W1qyss-tLOGB86lfuoR7WR4sYw>
 <xmx:8QUHX2VWdiNC-xOtDrJtSVRp2YiBYQcs8zyIVWv2KVMWlDlY001NIQ>
 <xmx:8QUHXyjzAOtjyM6PbKAHaUDPaL7jCEks__TsKJMunIy3SSZsyc0e6A>
 <xmx:8QUHX5PSQIY8Kr-uxaiV2ZAWuDLxJhkB5NHf9EsTZjbQjKNpojDUcQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0B091E00A6; Thu,  9 Jul 2020 07:56:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-613-g8a73ad6-fm-20200709.001-g8a73ad6e
Mime-Version: 1.0
Message-Id: <4caf166b-a461-49a6-92df-dfee4f426213@www.fastmail.com>
In-Reply-To: <20200708202454.21333-2-eajames@linux.ibm.com>
References: <20200708202454.21333-1-eajames@linux.ibm.com>
 <20200708202454.21333-2-eajames@linux.ibm.com>
Date: Thu, 09 Jul 2020 21:26:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_2/2]_mmc:_sdhci-of-aspeed:_Prevent_cl?=
 =?UTF-8?Q?ock_divider_of_zero?=
Content-Type: text/plain
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 9 Jul 2020, at 05:54, Eddie James wrote:
> The Aspeed specification forbids a clock divider of zero, which will be
> calculated if the parent clock is equal to the desired clock. Testing
> confirmed this broke the host controller.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c 
> b/drivers/mmc/host/sdhci-of-aspeed.c
> index 8962f6664381..5aa72e80cae9 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -74,6 +74,10 @@ static void aspeed_sdhci_set_clock(struct sdhci_host 
> *host, unsigned int clock)
>  	}
>  	div >>= 1;
>  
> +	/* Aspeed forbids a clock div of 0 */
> +	if (!div)
> +		div = 1;
> +

Nah, the search loop needs to initialise with div = 2. The current implementation is busted.
