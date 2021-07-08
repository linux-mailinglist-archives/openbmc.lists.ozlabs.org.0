Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD433BF862
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 12:26:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLCC01GvYz2xKL
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 20:26:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nuviainc-com.20150623.gappssmtp.com header.i=@nuviainc-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=cutKNGLS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nuviainc.com (client-ip=2a00:1450:4864:20::32f;
 helo=mail-wm1-x32f.google.com; envelope-from=graeme@nuviainc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nuviainc-com.20150623.gappssmtp.com
 header.i=@nuviainc-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=cutKNGLS; dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLCBk3p75z2ywx
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jul 2021 20:26:36 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so6328418wmb.3
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jul 2021 03:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yXbrxsdOZzMk8hZhMJ6JMPQ/sFkPA/IzAjJC/5f4H64=;
 b=cutKNGLS1jklTTbK0M1jqdI0MACh1r14/6P8/Oj8hSRY/XhYX/SgrIz4HnZU3yfkal
 D6oGWWFa8LVuc30CFL7eevLu9UAKDrr1c06eMdR9IiIZTdo2bIfMpWWyGGXFZKpxDR6l
 RLCOXdZDW0S/z/NGQ+iIUqQR1cWk8jpN6ZMe7VTNE+ViK7cngINd3Xd6Et5xZFky6q3u
 uOpxSjug9SAaq2vDu8sh/mlBJgS7YxcX9EqW/1P6OBmeq5thSzJvNdm4eXNeM4wzz4vv
 XJ9UFSZI83wFjhYbRY+SeD34c3kvBWRUqFxQ4KjhoPbLZAAnpT4x+k9VhhZ2o9o+b5eW
 qxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yXbrxsdOZzMk8hZhMJ6JMPQ/sFkPA/IzAjJC/5f4H64=;
 b=mTtByjw958hhXuv7AWI8Pw3Q2goXWDWw/KK5zZpO8B8BPUXEuL0uuB8gjy5Fsfm0nZ
 LlGGplkcgpZYSHq2VUr9ehYP7RO9qnfcFMkgvaM3EDr6Vhc35JXZViBMxf4kSzzYi5FH
 8jf6f/QgDStO/6BuYKkSBSeaVdPaSanVJP5Lo9p5+vnuIR95h6yzYum8oI+hzMqqQShq
 +AnOJRW8/uS0ErxQHZth8+FDg0F/DMezXjWRtDyN1rk0C306Sq9V2bjV51hw17mvwn7O
 6VGwELNnciZElQV+nm2ejUqQngK6zWLnb/W/F58if5HdmBB0pA3MWpN+LABjJSA97riR
 y9nA==
X-Gm-Message-State: AOAM531IsxxZbLnF5un6Bn4VCdvhKlDtBSpuz1QG+1214mxqnc3QA11K
 jxUf9zn4lOi9o7Keag2RYn+x/g==
X-Google-Smtp-Source: ABdhPJyntmaq/4y2dFyEj70eonM2Lbl+uIXeDxh6wn3DK+n2JP8SNEbl/QXra3QF3LV3KKG+fAHEqA==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr4584399wmj.115.1625739989549; 
 Thu, 08 Jul 2021 03:26:29 -0700 (PDT)
Received: from ggregory-linuxws ([2a02:8010:64d6:0:ad:d50c:ff6a:47])
 by smtp.gmail.com with ESMTPSA id b8sm9617273wmb.20.2021.07.08.03.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 03:26:29 -0700 (PDT)
Date: Thu, 8 Jul 2021 11:26:27 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 0/2] Store default
 u-boot env in
Message-ID: <20210708102627.GA2084@ggregory-linuxws>
References: <20210621064102.961633-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621064102.961633-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Adriana Kobylak <anoo@us.ibm.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jun 21, 2021 at 04:11:00PM +0930, Joel Stanley wrote:
> 
> This patch adds the u-boot environment to the u-boot binary, and a build
> fix for the new configuration that I have also sent upstream.
> 
> v2 uses the latest boot commands from openbmc.
> 
> We currently rely on the default environment being populated in the
> image. This has the downside that if something corrupts the environment,
> the system won't know how to boot itself.
> 
> The ast2600_openbmc_mmc.txt is copied from
> meta-aspeed/recipes-bsp/u-boot/files/u-boot-env-ast2600.txt.
> 

Just a note because I just stumbled on this, when these commits hit
OpenBMC there will need to be an xxd-native package added as xxd is
a build requirement for this.

Graeme

> Adriana has indicated she will update openbmc to use the .txt from the
> u-boot tree to generate the filesystem image (or we could stop doing
> that, and simply use the default?).
> 
> Joel Stanley (2):
>   Makefile: Conditionally add defaultenv_h to envtools target
>   ast2600: Add environment for booting from mmc
> 
>  Makefile                                   |  2 ++
>  board/aspeed/ast2600_openbmc_mmc.txt       | 11 +++++++++++
>  configs/ast2600_openbmc_spl_emmc_defconfig |  2 ++
>  3 files changed, 15 insertions(+)
>  create mode 100644 board/aspeed/ast2600_openbmc_mmc.txt
> 
> -- 
> 2.32.0
> 
