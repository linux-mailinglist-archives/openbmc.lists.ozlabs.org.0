Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D11198BA3
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 07:19:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ryL40KK2zDqmC
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 16:19:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ryKR0hqszDqDP
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 16:18:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=bNP3CJvX; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48ryKQ4cK4z9sPJ;
 Tue, 31 Mar 2020 16:18:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1585631914; bh=iyCzwERs6WU3hln8Qbia/iJ1o94JEiRWSxMnXgn9UFE=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=bNP3CJvX4XlmOpOAyyRL0iO+dWAoWONH7cuegPKZNxh0icocsHed2pj7WBbsvrm4W
 uBalajnDosc5hGAjqXusmQeV+Dmejknt63pucAsCnVHcoeSnGS/dzkHXeVdLR3605o
 CAP777r0EiVR8Wpa4+BidkMpMWy4vELhHitn6nB+Y6qYnphjRuY1dHZjMddA7pGJgm
 JnEP5DJ4wJspH3LdcPj3xiho41gh2Nw9eIE2vAfVvJSlHXsF9uNOkC+PLGdquMkc9a
 RCcsG6ZuDv5IVYnt920pQBARdusCARtc3rukGc55mxSobH+fuaCuDEER5vY5jonaph
 Er1tx3JelJcVg==
Message-ID: <20fd1439d28e6310d6c4dfc1d98ef4fa63cca794.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.4 v2] fsi: master: Add link_disable function
From: Jeremy Kerr <jk@ozlabs.org>
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Date: Tue, 31 Mar 2020 13:18:31 +0800
In-Reply-To: <20200305034641.11426-1-eajames@linux.ibm.com>
References: <20200305034641.11426-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eddie,

> The master driver should disable links that don't have slaves or links
> that fail to be accessed. To do this, add a link_disable function and
> use it in the failure path for slave break and init.

Concept looks good, but would it work to merge the disable
functionality with the existing link_enable callback?

ie., something like:

--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -130,6 +130,7 @@ struct fsi_master {
 				uint32_t addr, const void *val, size_t size);
 	int		(*term)(struct fsi_master *, int link, uint8_t id);
 	int		(*send_break)(struct fsi_master *, int link);
-  	int		(*link_enable)(struct fsi_master *, int link);
+  	int		(*link_enable)(struct fsi_master *, int link, bool enable);
 	int		(*link_config)(struct fsi_master *, int link,
 				       u8 t_send_delay, u8 t_echo_delay);

(and add the bool to the core api too).

- as I suspect the logic between enable and disable will be much the
same, aside from the actual value set.

Along those lines:

> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -299,6 +299,20 @@ static int aspeed_master_write(struct fsi_master *master, int link,
>  	return 0;
>  }
>  
> +static int aspeed_master_link_disable(struct fsi_master *master, int link)
> +{
> +	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
> +	int idx, bit;
> +	__be32 reg;
> +
> +	idx = link / 32;
> +	bit = link % 32;
> +
> +	reg = cpu_to_be32(0x80000000 >> bit);
> +
> +	return opb_writel(aspeed, ctrl_base + FSI_MCENP0 + (4 * idx), reg);
> +}

If we don't need the delay and read-back here, should we drop it from
enable too?

Cheers,


Jeremy

