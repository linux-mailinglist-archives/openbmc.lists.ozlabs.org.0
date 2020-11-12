Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA52AFBCD
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 01:42:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWjV40xXkzDqtW
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 11:42:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pSJiiSCQ; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWjTC4XmJzDqtQ;
 Thu, 12 Nov 2020 11:41:19 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id e7so2858044pfn.12;
 Wed, 11 Nov 2020 16:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hy+K1YgnwFdKlAc0ui0j41XCZFbpulfNL4llqoUSukQ=;
 b=pSJiiSCQJBX1wSPW5tIs3qbjlpf4FlNsL99G/EMu5rAuxi1mu/4KZoFRgkbDtNrHsI
 QRwgpVnwEIhf82OJS8mi2eFIB6LuQ77aRGCI2E1DUr8t4xnh2/FilkFtn/+R5hTuP+Ub
 myio/ANiOAuhvAF+DLrIpVsljjnoXyF10s853krs1IJl2/JjcsQu+SZtOGdCjYjq/z/2
 vxIJV/iEzTC8bFjTKJmO9qc3FmGSzK72P2x/vF2gjV3ap49pMnkmEmp6hyix4EwzLJGI
 kom1bRANzZuIqo3Zlpr8fW3XUFg0j21iR+ON+3aAv87A68Vei645AHoeW1Pqk9ve/Wuc
 yYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hy+K1YgnwFdKlAc0ui0j41XCZFbpulfNL4llqoUSukQ=;
 b=cqVryZjaj40AN52sRfz4BadkIKAlmjbAHvdbfkHXUMjANgfJMcnUHNt2y3Mz2RgHfF
 rsb9t4mB4a/QuRyCbJdxRTfkC5TtvUAkV1de4NXuIhOCBnIagY1u4tOaHfxeB0qmMZJ1
 nbmsNz/kcmrr7NqXDoYslK9oy+8/oWqryJYFNg8fb/VUxEDXssFLvVF2emMnCIcfPdX2
 daFU9cOq3T3u34svGzYPkZ92OY8f542x22YyJD+k21RE454/AWuKq2bdJvRIt2yJJ4/I
 tmFDjpbWB6B+zmb3bSxf4354pm/xmrHwFfJUlh2jETMReB8iynABy/I9Q9j3kdNu/LgI
 Ms5w==
X-Gm-Message-State: AOAM531ixf4UELFEBh2sDhe3ERWx0yjuBqwABmmf66h1vO9If/zyrKf9
 L0FIwFCNKsgNPjc82wZxM+Q=
X-Google-Smtp-Source: ABdhPJyYGAhwK1wvgbPRZygnqvGf9L9Av/xAFmTIIyPPx6DmFzEUVef1MpHBcTjgdqXAIi1iLGjVgQ==
X-Received: by 2002:aa7:908d:0:b029:15f:d774:584 with SMTP id
 i13-20020aa7908d0000b029015fd7740584mr167784pfa.6.1605141675790; 
 Wed, 11 Nov 2020 16:41:15 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id b4sm3854232pfi.208.2020.11.11.16.41.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Nov 2020 16:41:15 -0800 (PST)
Date: Wed, 11 Nov 2020 16:41:08 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Add Facebook Galaxy100 BMC
Message-ID: <20201112004107.GA31289@taoren-ubuntu-R90MNF91>
References: <20201111232330.30843-1-rentao.bupt@gmail.com>
 <CACPK8XdC8FRKOLQ9e583gVuDrL5829MOfx5L=O68dou6mjW_6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XdC8FRKOLQ9e583gVuDrL5829MOfx5L=O68dou6mjW_6g@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 11, 2020 at 11:34:10PM +0000, Joel Stanley wrote:
> On Wed, 11 Nov 2020 at 23:23, <rentao.bupt@gmail.com> wrote:
> >
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > The patch series adds the initial version of device tree for Facebook
> > Galaxy100 (AST2400) BMC.
> >
> > Patch #1 adds common dtsi to minimize duplicated device entries across
> > Facebook Network AST2400 BMC device trees.
> >
> > Patch #2 simplfies Wedge40 device tree by using the common dtsi.
> >
> > Patch #3 simplfies Wedge100 device tree by using the common dtsi.
> >
> > Patch #4 adds the initial version of device tree for Facebook Galaxy100
> > BMC.
> 
> Nice. They look good to me.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks a lot for the quick review, Joel.

> Is there another person familiar with the design you would like to
> review before I merge?

Patrick Williams sometimes helps reviewing my patches although he doesn't
work on Network BMCs. Let me see if he has bandwidth this time :)


Cheers,

Tao
