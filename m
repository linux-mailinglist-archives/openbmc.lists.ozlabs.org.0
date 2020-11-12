Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A17802AFDE4
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 06:26:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWqpj6BYHzDqwN
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 16:26:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cLaWQgCX; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWqnq6lMZzDqsM;
 Thu, 12 Nov 2020 16:26:07 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id b3so2174629pls.11;
 Wed, 11 Nov 2020 21:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pJfnnhc7tEjJrgDlvsROK+XxTP5/LN/c7M7Xz2gFhuY=;
 b=cLaWQgCXWWPpgY9ONzvSCnmnAPabiqAORFxX6sOR8VfxA5OB28xfNq/XAQ6zKD1vLD
 PlwvOirnn/fkKn7hV6fhSfmKzQAg5PD82tuUzSgCBEYJtlnnskcRNM9+EvlBB0BbAC3w
 fbCJBdSo/U0mBkQMZVlNBIMq3B8FweCIeFGbLPyUSsxe7mWmNe7YahVvWf1oKzLgUOo1
 BwcYVML60q1cNyqrsiR/XwDQTgsZxTvZCvOrou52daqqtn0KsKAXYT5rVm8dlm0JHVcZ
 XZ1Zpgdx5kN1p1pFCrJdTIQa/b4Irn+o1icRGLeiYjOZ+amiqAJkHuiJr1K2y01BamJo
 rwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pJfnnhc7tEjJrgDlvsROK+XxTP5/LN/c7M7Xz2gFhuY=;
 b=SdRRXwGd7fF8wXtoF+z7RVOzvcH4EZwM8TtKSonrgY6bVjg7xYis1tlqaVYtt0g8mU
 o+LxFKQ7/EYbrmWifp+O3rE3bT4vLI3yKFleC+ffDcFHJfvdhj40Y5kXaE2sw2NL/W+B
 YIfQ3n4f6hcwQEQHPCR4PehrnEEiUvz7SA29TBWZkK1/c+VEk7PxqVfyKn23f4R6cDpG
 MDlB24r4I9EjywAmrGxMT5qFh6l07fbu72xzjHQWrnJ9c/4/MBEgW2hUHGoDnGxlMvOZ
 +ltmgcK6PwItQ2ScKebOUp1Ec84+1Z83eBXCe+MjozlZU0YPkQUXTGWN4C+trmtJETAw
 e1pA==
X-Gm-Message-State: AOAM531cixT6pvtQvtPCdjM+sxD/yq1omFMNznyxU1iiJrGl4/GjRbUy
 o8cRQr9m/K9o6wJ2jd8yi8k=
X-Google-Smtp-Source: ABdhPJz2becez7wcvS0QDgwSyIvzMgEOqMClu/htOGVz/O9iygHBqxAF+/ujEBEHTvHr8b/rhG11Zg==
X-Received: by 2002:a17:902:c254:b029:d6:ac10:6d50 with SMTP id
 20-20020a170902c254b02900d6ac106d50mr25751204plg.48.1605158764968; 
 Wed, 11 Nov 2020 21:26:04 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id r6sm4468364pjd.39.2020.11.11.21.26.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Nov 2020 21:26:04 -0800 (PST)
Date: Wed, 11 Nov 2020 21:25:57 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Add Facebook Galaxy100 BMC
Message-ID: <20201112052556.GA3533@taoren-ubuntu-R90MNF91>
References: <20201111232330.30843-1-rentao.bupt@gmail.com>
 <CACPK8XdC8FRKOLQ9e583gVuDrL5829MOfx5L=O68dou6mjW_6g@mail.gmail.com>
 <20201112031828.GA4495@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112031828.GA4495@heinlein>
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

On Wed, Nov 11, 2020 at 09:18:28PM -0600, Patrick Williams wrote:
> On Wed, Nov 11, 2020 at 11:34:10PM +0000, Joel Stanley wrote:
> > On Wed, 11 Nov 2020 at 23:23, <rentao.bupt@gmail.com> wrote:
> > >
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > >
> > > The patch series adds the initial version of device tree for Facebook
> > > Galaxy100 (AST2400) BMC.
> > >
> > > Patch #1 adds common dtsi to minimize duplicated device entries across
> > > Facebook Network AST2400 BMC device trees.
> > >
> > > Patch #2 simplfies Wedge40 device tree by using the common dtsi.
> > >
> > > Patch #3 simplfies Wedge100 device tree by using the common dtsi.
> > >
> > > Patch #4 adds the initial version of device tree for Facebook Galaxy100
> > > BMC.
> > 
> > Nice. They look good to me.
> > 
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > 
> > Is there another person familiar with the design you would like to
> > review before I merge?
> 
> Also,
> 
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
> 
> -- 
> Patrick Williams

Thank you Patrick!

Cheers,

Tao
