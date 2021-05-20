Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF238BABA
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 02:13:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmRrt41CYz3btv
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 10:13:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=iqmdk/F0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net
 (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256
 header.s=20201203 header.b=iqmdk/F0; dkim-atps=neutral
X-Greylist: delayed 498 seconds by postgrey-1.36 at boromir;
 Fri, 21 May 2021 06:36:12 AEST
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmM2h4hngz300K
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 06:36:12 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 814E72F3;
 Thu, 20 May 2021 20:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 814E72F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1621542465; bh=4Sb890MJb2ftT0eWtK0c6D8gcH4gbMVh+6xP0bEVTBU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iqmdk/F0zXlaOzi2qIfonlCtVp7Uo3ZYdslx8Oxhc8VWiicgjKQm4xQE1ZRDUuUzI
 tFtqZDz18WQRoqB6pV+j9C4tJkmEaK9kVwDm+SLWLA3PjJ3IPRTqwUpd8qZ/qIQZ8G
 VEUVtJGqoT7zTxMCd/gvZDTBKOzQZY3aJEWFuo6TxL8hlTCNH65N3o9EQVFDrY+byu
 YEjZRkEHxe+0534Qx9S083tTbZK/RctTIcoTTVN641pLiN+a44A7oEwE/a//+TFtQE
 EN8Dvcj8CqDReMukj2VRfwjQV2RZRQS45gjjYvicT7reR3XaMRlWnrIYe1xHLl3cf2
 nSGYaovzR4T8w==
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Jeffery <andrew@aj.id.au>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: checkpatch: Tweak BIT() macro include
In-Reply-To: <20210520093949.511471-1-andrew@aj.id.au>
References: <20210520093949.511471-1-andrew@aj.id.au>
Date: Thu, 20 May 2021 14:27:45 -0600
Message-ID: <8735uhnoam.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 21 May 2021 10:10:39 +1000
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
Cc: dwaipayanray1@gmail.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, joe@perches.com, lukas.bulwahn@gmail.com,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Andrew Jeffery <andrew@aj.id.au> writes:

> While include/linux/bitops.h brings in the BIT() macro, it was moved to
> include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic:
> Move some macros from <linux/bitops.h> to a new <linux/bits.h> file").
>
> Since that commit BIT() has moved again into include/vdso/bits.h via
> commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").
>
> I think the move to the vDSO header can be considered an implementation
> detail, so for now update the checkpatch documentation to recommend use
> of include/linux/bits.h.
>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Acked-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/dev-tools/checkpatch.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index 51fed1bd72ec..59fcc9f627ea 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -472,7 +472,7 @@ Macros, Attributes and Symbols
>  
>    **BIT_MACRO**
>      Defines like: 1 << <digit> could be BIT(digit).
> -    The BIT() macro is defined in include/linux/bitops.h::
> +    The BIT() macro is defined via include/linux/bits.h::

Applied, thanks.

jon
