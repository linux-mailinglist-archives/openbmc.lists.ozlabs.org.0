Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C32EA8C8
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 02:27:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473SPN20tkzF4Xy
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 12:27:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hG/i0zjP"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473SNb4vdHzF4TD
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 12:27:08 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id p1so2819183pgi.4
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 18:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/xbLLTWwwR0cd5qQbRpTD2PP+wmSB7aXKTDZeJyUHcY=;
 b=hG/i0zjP4PIYhFBy9cjOQ+6FA5yvDVZTVwsRMIajyd3MWIPZ3T0uOJLuPyupkeskOu
 p4O7CK/20sK5+q9CvApRlPjlmDJPHRoeeJRRqBvIKsFlsCrn50Lu7mW0xapyTrgg7BtH
 LXafi0hTusVYmMZSxsrLU6nBtWCvO8pZmrcysBuy3SGK4glcRMGAPFSIYniDWCzl7Sik
 MOPhn7yFhwcd7jtrp7Fs0nCmXttm95KAlIIqTS6ossP+ZqZO5BOTXBdG80Uobdi4uShM
 0T4iRKxpc8Ed+ULYJ/X1Dg53tt6BQTcoO4bE4FrHOwUTmYF9QGdEpBR0wF24ZJeL0L27
 qufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/xbLLTWwwR0cd5qQbRpTD2PP+wmSB7aXKTDZeJyUHcY=;
 b=A4MFxntHITq2no1m+2r5+bMIdd27UcxnCiHLgbA1ShI4F/UWckixti6nws4V27cSq3
 dGd/PymlJLvi6bXfE51WuD+8qKykq7opmZRiPiPqk5PCA33r8Qz6HhYeKjRYEeoMrsow
 biLqkHOxmkB099BVfa5SjYEOcOFpVH6hbUfsyLgI8SgRukTusUvk3eZX4cdEqPT5HYEs
 vGCn5r92FqyqQl/cL+wNEFgv0b/XtncjxG+Qj6anFSKoecEWdR6RDx5VbI9EjNvejMk0
 I+EsqR8DucqkgdRLeQ2HyjQENKR5PCuU26NRZVERusJUINxGJ2gC//ftm8LqM3WpERIW
 cvJQ==
X-Gm-Message-State: APjAAAVlCVG8y+OV0S3MeYbrofuvea/qKKfYiV7feUvQ6BbaYCkLrBew
 Uhd0igSh+H3bU2fYiezJC8o=
X-Google-Smtp-Source: APXvYqxPeZ8N9bZyMSYjCKY94CTqtNjhdT7egzR2ZWKkCv1KRQ2Mfmvy5+dmaQz587G4EdWPOF72qA==
X-Received: by 2002:a63:200e:: with SMTP id g14mr2889289pgg.91.1572485225237; 
 Wed, 30 Oct 2019 18:27:05 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::1:e375])
 by smtp.gmail.com with ESMTPSA id n23sm1116451pff.137.2019.10.30.18.27.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Oct 2019 18:27:04 -0700 (PDT)
Date: Wed, 30 Oct 2019 18:26:56 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: ASPEED: update default ARCH_NR_GPIO for ARCH_ASPEED
Message-ID: <20191031012655.GA5841@taoren-ubuntu-R90MNF91>
References: <20191028224909.1069-1-rentao.bupt@gmail.com>
 <CACRpkdbOPq4AYt9CLoganV_Ck9bYS9+_U3bggGKAukaQ=FHXkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbOPq4AYt9CLoganV_Ck9bYS9+_U3bggGKAukaQ=FHXkA@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Burton <paulburton@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Tao Ren <taoren@fb.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Doug Anderson <armlinux@m.disordat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 31, 2019 at 01:49:43AM +0100, Linus Walleij wrote:
> On Mon, Oct 28, 2019 at 11:49 PM <rentao.bupt@gmail.com> wrote:
> 
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > Increase the max number of GPIOs from default 512 to 1024 for ASPEED
> > platforms, because Facebook Yamp (AST2500) BMC platform has total 594
> > GPIO pins (232 provided by ASPEED SoC, and 362 by I/O Expanders).
> >
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Please send this patch to the ARM SoC and SoC maintainers:
> arm@kernel.org
> soc@kernel.org

Thanks Linus for the review. I will add ARM SoC and SoC maintaniers in
patch v2.

Somehow get_maintainer.pl doesn't list the 2 addresses in my tree; do I
need to send a patch to update MAINTAINERS accordingly?
 
> Yours,
> Linus Walleij
