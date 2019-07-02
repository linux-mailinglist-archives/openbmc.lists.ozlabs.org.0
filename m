Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B98A61A57
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 07:39:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hvQF6L7TzDqWH
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 15:39:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fQfcYMrC"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dDvv5GPJzDqSp;
 Tue,  2 Jul 2019 16:33:30 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id e3so26113566edr.10;
 Mon, 01 Jul 2019 23:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vrhZMISchd7sGxny8Pn79m9lKufOLYxEQC7IHi63Z/c=;
 b=fQfcYMrC6VDwfZ9himAq9txAiRt6kNpb0+/EE6ct41lHlo8f5zjugS4PFSWqnl9tUm
 lTCLyoVfGYV2GUaBgln6FPNi6hjKpAP1W28dy7GaZKscLCpR8hDeDTndl3FK/mo1HL8E
 K7qsXVyOfrdow4xPaXeeNpzHkwd8AQR1UdtP0UJiBRZzEZbvVYlsvDephgwmGBgZUL3d
 Yay3g1AD9P4RVpSXUU0k8Vj6MxwRgmKrJv8HEdP6i3voxtYqUpAEWSP9VGpR3PYAWQDA
 EFbjJLUTowIX/yzL6w8NJg1cwQ2Aiz9FsRy4nqCzcmJYXf1TXYSL2maRKv3iiYJkWhPv
 IoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vrhZMISchd7sGxny8Pn79m9lKufOLYxEQC7IHi63Z/c=;
 b=FcYHs33DhElRl8LFv3TA0YowZquIVl+3xNfPdoZPVuVkTRcy+960uaYbfvjToByOlJ
 2hc0T+OO6yb47WgcFrxwdW+weV/3ZwuVhx6FsESRvqTbo/SbxAm9LCHLJ+UsZFxJVt4G
 lATWSvjrEme24y0p8bugGRU4K7O2wEJklTR910ZW8LLRwVWdvgE4ZocKaBD5uift+psF
 LCVVmyh987BqJtC7dkfFxfo/pzpXHjdM2KHYjVi4enRj1a3bWj/ndWZ/vpI/Etz6G1yA
 k7iWSBGfhwCiEiFj9KcVXw1n+Ijn5ObkKJPaV466MS1H8mBk9fkEJBd4OyoHJOJjmc4Q
 ryOw==
X-Gm-Message-State: APjAAAWoYYaYiBqbWNnNTjQIoLHraPHYdANE+Oorg7706YKxpmdaiZbO
 cxjEsuddj3ky/JQgmmBAp8k=
X-Google-Smtp-Source: APXvYqw9f0FqKoC6XDyCJtiRq5TNEDPexmu5lcp1MfQ+SKaZfvxyiRrHv/3vuVP+F+PUzPfxfL7Xuw==
X-Received: by 2002:a05:6402:8c3:: with SMTP id
 d3mr25619075edz.183.1562049206767; 
 Mon, 01 Jul 2019 23:33:26 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id z22sm4365499edz.6.2019.07.01.23.33.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 23:33:25 -0700 (PDT)
Date: Mon, 1 Jul 2019 23:33:23 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] MAINTAINERS: Add FSI subsystem
Message-ID: <20190702063323.GA53677@archlinux-epyc>
References: <20190702043706.15069-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702043706.15069-1-joel@jms.id.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 08 Jul 2019 15:38:31 +1000
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

On Tue, Jul 02, 2019 at 02:07:05PM +0930, Joel Stanley wrote:
> The subsystem was merged some time ago but we did not have a maintainers
> entry.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01a52fc964da..2a5df9c20ecb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6498,6 +6498,19 @@ F:	fs/crypto/
>  F:	include/linux/fscrypt*.h
>  F:	Documentation/filesystems/fscrypt.rst
>  
> +FSI SUBSYSTEM
> +M:	Jeremy Kerr <jk@ozlabs.org>
> +M:	Joel Stanley <joel@jms.id.au>
> +R:	Alistar Popple <alistair@popple.id.au>
> +R:	Eddie James <eajames@linux.ibm.com>
> +L:	linux-fsi@lists.ozlabs.org
> +T:	git git://git.kernel.org/pub/scm/joel/fsi.git

Just a drive by review, this link does not work, seems it should be:

git://git.kernel.org/pub/scm/linux/kernel/git/joel/fsi.git

Cheers,
Nathan

> +Q:	http://patchwork.ozlabs.org/project/linux-fsi/list/
> +S:	Supported
> +F:	drivers/fsi/
> +F:	include/linux/fsi*.h
> +F:	include/trace/events/fsi*.h
> +
>  FSI-ATTACHED I2C DRIVER
>  M:	Eddie James <eajames@linux.ibm.com>
>  L:	linux-i2c@vger.kernel.org
> -- 
> 2.20.1
> 
