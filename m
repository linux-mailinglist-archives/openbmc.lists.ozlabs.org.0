Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D72B134E
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 01:35:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXKJ04hyFzDr5J
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 11:35:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oGh7cKqn; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXKGz54GgzDr1m;
 Fri, 13 Nov 2020 11:34:34 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id h6so5676139pgk.4;
 Thu, 12 Nov 2020 16:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P8TtnzNEhdL1QCglKeltAYHSPUZllVgYYEg6VbDdAHU=;
 b=oGh7cKqnLcwhcEG6ECHTrGrwtapz/35tLXsK7yJGn9yxHo34ZcJiljqrNkzKeq/bA3
 b/afwpLyR8vbuHs67B6vPxj3kjVNchBNe00DKJk3IwUmwScSHryOuWZLLyB6gyrBOW+P
 fKGhO+i/j0OA21gWNVEH1B1Nq6gk2kfOFmjm4dz8Hg58ZfCPtmX5Bu9/egwa1X3ioE3x
 mWP51tXBBgoKdRA/tdK9F+xx/RPZA6wQdm45KXp3N3FQQMjAOQ/U1IHQGaFhJUzWVblm
 YsyA11U6DpT9xemuFLWfFE4RV6vP2Dam5IA6CpcnXwge3agVLRwcLjjJ/M0zjv/5tgfv
 1Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P8TtnzNEhdL1QCglKeltAYHSPUZllVgYYEg6VbDdAHU=;
 b=qJCpk4cakDZmv24zrc5L0ChSOjqVVXehpSPHKeBvuuWzp0S7s2m8hPmdVxoc6PDkfH
 P8T1IGgYszXB9lW4TH/qpFCyXc1BsUA/ShkGtf79o50gFlFi2yAcsI9U66xYu831dMo7
 1aqFR3f9YHAIPPqpUm8MXsvK7MTkTI8Oyy6WOJLRfGUQIiIBj2D1Cl+u4wjyBWp8E2dY
 4cP4HiQAF3sFynFsUoCt/VpEKW/e1LJ1bS8vU+8FXnC0Pg0Clf74CD+rOuxUrhK1Xq59
 KNYbw72D+T8iKCtjBK1dyFhv3BICiKxx9SZqq5N/eRah6RvwOM0aeJgVTWRYjZEod73X
 27qQ==
X-Gm-Message-State: AOAM532GDkIdlqMUGhoeHoX96ZbHC69TB8ylXDf1hPdlVnWdUmTFaM9m
 mjCi1IAGsrmnv3mtrgd6ksM=
X-Google-Smtp-Source: ABdhPJz1ppPRVXyEQyquvcp3Dv8fodvoeP5O8Y52eu4o1MymuhkYt6ycVTzQC3Irlnh2prtaZx+2jw==
X-Received: by 2002:a17:90a:440d:: with SMTP id
 s13mr387147pjg.99.1605227671319; 
 Thu, 12 Nov 2020 16:34:31 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id q72sm1132211pfq.62.2020.11.12.16.34.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Nov 2020 16:34:30 -0800 (PST)
Date: Thu, 12 Nov 2020 16:34:20 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Add Facebook Galaxy100 BMC
Message-ID: <20201113003419.GA12608@taoren-ubuntu-R90MNF91>
References: <20201111232330.30843-1-rentao.bupt@gmail.com>
 <CACPK8XdC8FRKOLQ9e583gVuDrL5829MOfx5L=O68dou6mjW_6g@mail.gmail.com>
 <20201112031828.GA4495@heinlein>
 <CACPK8Xf07AZNb3K76sDsZDHNOPuhpkkUGST0=RTCTS5BXgncmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xf07AZNb3K76sDsZDHNOPuhpkkUGST0=RTCTS5BXgncmA@mail.gmail.com>
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

On Thu, Nov 12, 2020 at 05:49:30AM +0000, Joel Stanley wrote:
> On Thu, 12 Nov 2020 at 03:18, Patrick Williams <patrick@stwcx.xyz> wrote:
> >
> > On Wed, Nov 11, 2020 at 11:34:10PM +0000, Joel Stanley wrote:
> > > On Wed, 11 Nov 2020 at 23:23, <rentao.bupt@gmail.com> wrote:
> > > >
> > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > >
> > > > The patch series adds the initial version of device tree for Facebook
> > > > Galaxy100 (AST2400) BMC.
> > > >
> > > > Patch #1 adds common dtsi to minimize duplicated device entries across
> > > > Facebook Network AST2400 BMC device trees.
> > > >
> > > > Patch #2 simplfies Wedge40 device tree by using the common dtsi.
> > > >
> > > > Patch #3 simplfies Wedge100 device tree by using the common dtsi.
> > > >
> > > > Patch #4 adds the initial version of device tree for Facebook Galaxy100
> > > > BMC.
> > >
> > > Nice. They look good to me.
> > >
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > >
> > > Is there another person familiar with the design you would like to
> > > review before I merge?
> >
> > Also,
> >
> > Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
> 
> Thanks. I have merged them into the aspeed tree for 5.11.
> 
> Cheers,
> 
> Joel

Thank you Joel.

BTW, I sent out another 2 patches for AST2500 dts earlier this week; not
sure if they were successfully delivered; if not, I will resend them
earlier next week.


Cheers,

Tao
