Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 041D33EAFFD
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 08:25:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmD7V6BxZz30Lv
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 16:25:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XSCXFQhS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XSCXFQhS; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmD736WKSz2xgN;
 Fri, 13 Aug 2021 16:24:45 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso281686pjh.5; 
 Thu, 12 Aug 2021 23:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NQOgsa59p3OqAoKwO2wbmemr8LIvk6W1Ex9qIpv1D+8=;
 b=XSCXFQhSWV7wnRv57pbuYofo7JuIdaxxRNPHMw/xEfbe6NmKM6ykVQdgYUBklVGXPt
 rKfSyNKxoD29KTu5xqVebvxgmj+HQIl2JkmioID0fJg/LzUNPvhIXG3Vcop3nFkuj14I
 FGY3Kbp96asKLB5ByhIos71CS14z4hsdaJ4VUTenxmYD3kvEgp+NFBhyD62R7+MDP5Eh
 kc5BpCXKg5uoxoPF87mD53VtYGw/nk/dtYu/9aS09wyJh1wWFYwDpv7WObJGyxYfjYb0
 KFQc89cK+uSTT0QzyBh73WoCtc5MWPanA8P+1T2arRjN6gIb0+zsOloGRsV6Wg9K8jFx
 9OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NQOgsa59p3OqAoKwO2wbmemr8LIvk6W1Ex9qIpv1D+8=;
 b=sE5W9MvpfIVy3NHByHcZb6evwNRBZH96bgxSO75PJfbtwvZx86ybOPNzpKlAhFyKCg
 ye8dzpkzocMnosod0MheCdwvlm1CcVgVgTLbhsXWat9VeENpQ7SmTcfkG/QVMz29JUoL
 zk/sxKtNg8HSMBt6lvP7ouaWKDFeRwjX75eaScwFhNzfXi04JDCuitQ2FQi02jYdjZPI
 +uSw9pjgM7QSfmD0JykAWUqRo1gXARsgpzFfuNInmi+ZP3KodOjq8vuPj5iei7RJB8x7
 6UbePBT4LSQ8AMUbH/hoKV8jU5I3RmK0FlGh9BbLEaWp9cIW+MXYE2SnjH1LDqX8C8ME
 Br6w==
X-Gm-Message-State: AOAM531opD/mFWYQmvfsDYxstmVfIWgh9KUiZej5Ls4wbddR8LEtBOz7
 /JtABPsi3nY3lly1Sc5Sopc=
X-Google-Smtp-Source: ABdhPJxsJUWbeaU62Wj9coO/fud1cjIRqM6Z84ZOc4FvCf3W9tPAlNR+vMa1GvVoUW+NjYXNOmbNdA==
X-Received: by 2002:a05:6a00:aca:b029:392:9c79:3a39 with SMTP id
 c10-20020a056a000acab02903929c793a39mr931084pfl.57.1628835882167; 
 Thu, 12 Aug 2021 23:24:42 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-92-48-112.hsd1.ca.comcast.net.
 [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id b7sm790956pfl.195.2021.08.12.23.24.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Aug 2021 23:24:42 -0700 (PDT)
Date: Thu, 12 Aug 2021 23:24:35 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: Re: [PATCH] ARM: dts: aspeed: minipack: Update flash partition table
Message-ID: <20210813062435.GA24497@taoren-ubuntu-R90MNF91>
References: <20210720002704.7390-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720002704.7390-1-rentao.bupt@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

Hi Joel,

Looks like the patch is not included in "dt-for-v5.15". Any comments? Or
should I send v2 if the email was not delivered?


Cheers,

Tao

On Mon, Jul 19, 2021 at 05:27:04PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Update firmware flash "data0" partition size from 4MB to 8MB for larger
> persistent storage on minipack BMC.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
> index 9eb23e874f19..230d16cd9967 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
> @@ -265,19 +265,19 @@
>  		};
>  
>  		/*
> -		 * FIT image: 59.5 MB.
> +		 * FIT image: 55.5 MB.
>  		 */
>  		fit@80000 {
> -			reg = <0x80000 0x3b80000>;
> +			reg = <0x80000 0x3780000>;
>  			label = "fit";
>  		};
>  
>  		/*
> -		 * "data0" partition (4MB) is reserved for persistent
> +		 * "data0" partition (8MB) is reserved for persistent
>  		 * data store.
>  		 */
>  		data0@3800000 {
> -			reg = <0x3c00000 0x400000>;
> +			reg = <0x3800000 0x800000>;
>  			label = "data0";
>  		};
>  
> -- 
> 2.17.1
> 
