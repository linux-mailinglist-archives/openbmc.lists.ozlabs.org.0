Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 223DA18528
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:12:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45030p31yNzDqMb
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:12:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=codeaurora.org
 (client-ip=198.145.29.96; helo=smtp.codeaurora.org;
 envelope-from=mojha@codeaurora.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeaurora.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="QXb1LBZw"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="mm5D6fIh"; dkim-atps=neutral
X-Greylist: delayed 1679 seconds by postgrey-1.36 at bilbo;
 Sat, 30 Mar 2019 01:35:34 AEDT
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44W45y1H3JzDqTg
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 01:35:33 +1100 (AEDT)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id D77AE60DB4; Fri, 29 Mar 2019 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553868451;
 bh=lr8gVn+JEAPnNvkty/sTPLFZxa/laEWN12wveQ3lIyY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QXb1LBZwDWsYxNu2d89xloowNCdullJNaeGndjTTN+qGN+fAkq6cPsFtay21k8wJd
 iSEh6Sh5W8wXsXkIoF+QfJbg/bO1SZS5mn/l8TiYUMMHGnQTR5kQ1ei6ow2s9AxpHV
 5MHoyZc+9MXduXZDo4X1OGHOtgfJicmDC0NcQs3w=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.204.79.83]
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: mojha@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D78B860DB4;
 Fri, 29 Mar 2019 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553868450;
 bh=lr8gVn+JEAPnNvkty/sTPLFZxa/laEWN12wveQ3lIyY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mm5D6fIhCDYeQLprGZNxpR6jA3B7dsOY3jvdCQMRh4zyArnMKefcfPA6dWF5HadtS
 2zx9ZVv3f4FEtZOoEz6rDGp8oWUgylhEIosGi2BWeABra+UMN/ut9WyxW5MyTxHzKY
 BIl1yNao1cEeG/5IJqddJPOoI7NlpUJnP0nlfuDg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D78B860DB4
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [PATCH v2 1/2] MAINTAINERS: fix bad pattern in ARM/NUVOTON NPCM
To: Tomer Maimon <tmaimon77@gmail.com>, joe@perches.com,
 avifishman70@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, brendanhiggins@google.com, tali.perry1@gmail.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org
References: <20190328235752.334462-1-tmaimon77@gmail.com>
From: Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <367707d3-9f3f-e15b-1db3-eedb2e23981d@codeaurora.org>
Date: Fri, 29 Mar 2019 19:37:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190328235752.334462-1-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Thu, 09 May 2019 16:11:01 +1000
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 3/29/2019 5:27 AM, Tomer Maimon wrote:
> In the process of upstreaming architecture support for ARM/NUVOTON NPCM
> include/dt-bindings/clock/nuvoton,npcm7xx-clks.h was renamed
> include/dt-bindings/clock/nuvoton,npcm7xx-clock.h without updating
> MAINTAINERS. This updates the MAINTAINERS pattern to match the new name
> of this file.
>
> Fixes: 6a498e06ba22 ("MAINTAINERS: Add entry for the Nuvoton NPCM architecture")
> Reported-by: Joe Perches <joe@perches.com>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3e5a5d263f29..8b305d2f2a8a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1900,7 +1900,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
>   S:	Supported
>   F:	arch/arm/mach-npcm/
>   F:	arch/arm/boot/dts/nuvoton-npcm*
> -F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> +F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
>   F:	drivers/*/*npcm*
>   F:	Documentation/devicetree/bindings/*/*npcm*
>   F:	Documentation/devicetree/bindings/*/*/*npcm*
