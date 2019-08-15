Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FDA8F4AE
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 21:33:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468c7b3f41zDr9L
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 05:33:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468c6s01QtzDr9L
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 05:32:51 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 176741400EC64;
 Thu, 15 Aug 2019 12:32:36 -0700 (PDT)
Date: Thu, 15 Aug 2019 12:32:35 -0700 (PDT)
Message-Id: <20190815.123235.516041583959546572.davem@davemloft.net>
To: terry.s.duncan@linux.intel.com
Subject: Re: [PATCH] net/ncsi: Ensure 32-bit boundary for data cksum
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190814011840.9387-1-terry.s.duncan@linux.intel.com>
References: <20190814011840.9387-1-terry.s.duncan@linux.intel.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 15 Aug 2019 12:32:36 -0700 (PDT)
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, sam@mendozajonas.com, wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: "Terry S. Duncan" <terry.s.duncan@linux.intel.com>
Date: Tue, 13 Aug 2019 18:18:40 -0700

> The NCSI spec indicates that if the data does not end on a 32 bit
> boundary, one to three padding bytes equal to 0x00 shall be present to
> align the checksum field to a 32-bit boundary.
> 
> Signed-off-by: Terry S. Duncan <terry.s.duncan@linux.intel.com>
> ---
>  net/ncsi/internal.h |  1 +
>  net/ncsi/ncsi-cmd.c |  2 +-
>  net/ncsi/ncsi-rsp.c | 12 ++++++++----
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
> index 0b3f0673e1a2..468a19fdfd88 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -185,6 +185,7 @@ struct ncsi_package;
>  #define NCSI_TO_CHANNEL(p, c)	(((p) << NCSI_PACKAGE_SHIFT) | (c))
>  #define NCSI_MAX_PACKAGE	8
>  #define NCSI_MAX_CHANNEL	32
> +#define NCSI_ROUND32(x)		(((x) + 3) & ~3) /* Round to 32 bit boundary */

I think we have enough of a proliferation of alignment macros, let's not add more.

Either define this to "ALIGN(x, 4)" or expand that into each of the locations:

>  	pchecksum = (__be32 *)((void *)h + sizeof(struct ncsi_pkt_hdr) +
> -		    nca->payload);
> +		    NCSI_ROUND32(nca->payload));

		     ALIGN(nca->payload, 4)

> -	pchecksum = (__be32 *)((void *)(h + 1) + payload - 4);
> +	pchecksum = (__be32 *)((void *)(h + 1) + NCSI_ROUND32(payload) - 4);

						 ALIGN(payload, 4)


etc.
