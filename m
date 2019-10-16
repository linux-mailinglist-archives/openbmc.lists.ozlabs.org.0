Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838ADA261
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 01:37:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tpcz75LNzDr1Z
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 10:37:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BfJxiqLR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="vhsVR/KZ"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tpcN55r8zDq6B
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 10:37:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 629FB5BA
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 19:37:22 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 19:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=MMv3WmNwVW0St+Q0eAtdDLBrHiJVHCQ
 Z/cMdR/Uya8k=; b=BfJxiqLRbToKN1EFIDgZFDWPBvROhuYRlpXb8b4n5mgK+gy
 nqL+Dr9a3zsbmG9VnoZRQDzVSUq5MJRwaOhFxVEzahmpHaOoZezbF1aSdnSj9Xsd
 CymCjTCkRVS1YGIyoO0IY+thWgek6yQvI8iZYQsU0KxigmP/TI+O25Z9iEp3z9GX
 YW1AHKFIYujFshFaX1m2pDATWzsx+eO8FO4fN6hd0Qs/UAzjKolMhiuTH/1Hz+F7
 oL3YHVOurAS9YluGvXwgVfbaE5NA8hYlSuycPE1S/7qLch9Q+nXzZ08ZheHpI4ti
 ZVwZJTO8B2Yr3Q4x4ZdB1dSPfiWm4p862iiBRHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MMv3Wm
 NwVW0St+Q0eAtdDLBrHiJVHCQZ/cMdR/Uya8k=; b=vhsVR/KZqrmCGeZB3DCpbK
 ry6sR4dkZEo5uhrq0wEywSfJn40uqwl/plh8HAuRCuRaujWT7jJr7Q8n3FiWcXIt
 m1jm3taESF5aWQqirL8FcLHBRmHDP8qhI8dOohVVDOhsEU2QtA3FXyJILPDBtvlz
 92s4mAXhSFcFqjIAiVacXiyAe5yXsZ7r8J2MFbrQGZpqefditKX6UB4lGKTC4cOx
 5FeUhYAS5eSWt+l1DezDjrWoaeQKt/4kM2RYQMEhdg7dZrE9gyRG1He6vofeEcpy
 PgOc7LD+NmMXwNwkUUOqxZ/XgwmdoHqHGxLlxoZt/gLIcFOavu7NZJyim1kexmqA
 ==
X-ME-Sender: <xms:samnXTTae26jx3AHGuOKJLMFjENzKfsM-LrqLQ9Ereoj8AAy6k76Yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrg
 hjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:samnXRjKGy-9XhPb4_FAV6LH6hEMZhT70OJSCbGuLJrCWJBnCmtZRQ>
 <xmx:samnXYZmqOxIwcskFd8wbN3BNtNzTVooMgP3AqbbdoQzCrhE9aXINg>
 <xmx:samnXbplvJpMgPh3cLbvYtBzF4p2i_pBhfDNxbFi46VLWklqTO779g>
 <xmx:sqmnXRv1i_1ZzCBk3ERjQXd4bGHCyFPe1PEXJltSiP2Q416j-gKFVg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9EDD8E00A5; Wed, 16 Oct 2019 19:37:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <6598f6fe-dcad-43a0-818d-8229cd08b914@www.fastmail.com>
In-Reply-To: <20191016233558.9740-1-andrew@aj.id.au>
References: <20191016233558.9740-1-andrew@aj.id.au>
Date: Thu, 17 Oct 2019 10:08:18 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_v2]_soc:_aspeed:_Fail_probe_of_lpc-ct?=
 =?UTF-8?Q?rl_if_reserved_memory_is_not_aligned?=
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



On Thu, 17 Oct 2019, at 10:05, Andrew Jeffery wrote:
> Alignment is a hardware constraint of the LPC2AHB bridge, and misaligned
> reserved memory will present as corrupted data.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> v2: Cosmetic fixes pointed out by Milton
> 
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts |  2 +-
>  drivers/soc/aspeed/aspeed-lpc-ctrl.c         | 13 +++++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index a2eef507ffbb..635744a76884 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -28,7 +28,7 @@
>  
>  		flash_memory: region@98000000 {
>  			no-map;
> -			reg = <0x98000000 0x04000000>; /* 64M */
> +			reg = <0x99000000 0x04000000>; /* 64M */
>  		};
>  

Agh, v3 inbound.
