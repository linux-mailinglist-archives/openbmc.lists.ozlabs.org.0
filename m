Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23535829F1
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 17:47:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtJ7m0n7Qz3c4f
	for <lists+openbmc@lfdr.de>; Thu, 28 Jul 2022 01:47:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VoB86KfU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VoB86KfU;
	dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtJ7J6g0lz3bxC
	for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2022 01:47:07 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id x11so12865030qts.13
        for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=rKRkz1r3/CKmoOGWsptt41HcBfvgNG2KAxM3cUlyRgg=;
        b=VoB86KfUBj/OZpm9xIVznbBQgZc4uhxKvVqM6lBqGHVxY4BRsFuuc3xlU3sMxZvcWa
         4b8ibsPfgRsNd5aIAwrY7NssOu/jUVv3lLJDGVPa6vRidh5+LMt14tCMnn1XwZLBFp+O
         HQ+Tj+xaYFKZ7w8ImT5JLW2a/FZn2lAizet0UGek3kuZgKbaK7WyoezQ8YGBsO8CqdJ1
         EjYv/CNb2NbNMBeCTv9ZteUxUViXcld1dSsU03u5kcWMpLMWMZYO0GH+RqTQJOpRT0K7
         sWi/+E8fjLR9kw8t4Qs+GVWY5Hcq0BKNIHpf3iWNYd5XZjYbecqJl8L+vRAphnxKscDy
         E1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=rKRkz1r3/CKmoOGWsptt41HcBfvgNG2KAxM3cUlyRgg=;
        b=Ymdiz5OAiG+c6Ryuncvg2iVWjO6a8FFB8ShUWrmej5rm3hJA52odfHo/yXTEpzK4b+
         S02EI2GvnY9bmKhbV/mHIdGmTAapvaMmUxjZCzsLc4UNOOnyGPrHFi7OfUacW0QjRW6e
         DMoL4i4+Q7M5uFY9y2RI65+P883N/QBIk1JPiLaOYN9Ayah3bEH6H07RGqDUUiOa4aWk
         8HKXbkfHYapyOBwN5M/q61HTFD1on8Yo7PlE3+svx4m69WPuYLYE5MqwCSGYgCI3Brxu
         zBnURQfeb0JHvpn9kCgUz6dzvU9asZBN8JYpmyWq7fJ1F2lIhO5Pw42llRwrcI2GFF/D
         fd0w==
X-Gm-Message-State: AJIora9u6D9A4qAI2Er3iFFv1UzsAuz94jLoMhJfElDX+eZTZYx91HYB
	0HOfBO+vPX4a6qri0naiNg==
X-Google-Smtp-Source: AGRyM1syoHp48BJmUDOkb6xY/O5snpMs1dVQsCfX28eSSiv/YiQUo0sVB6pmKfpcMiJUw10Xvbbbnw==
X-Received: by 2002:a05:622a:1316:b0:31e:f3b4:1c8c with SMTP id v22-20020a05622a131600b0031ef3b41c8cmr19396972qtk.339.1658936823961;
        Wed, 27 Jul 2022 08:47:03 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
        by smtp.gmail.com with ESMTPSA id de39-20020a05620a372700b006b568bdd7d5sm14091459qkb.71.2022.07.27.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 08:47:03 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:495f:ee54:913c:d540])
	by serve.minyard.net (Postfix) with ESMTPSA id AF322180052;
	Wed, 27 Jul 2022 15:47:01 +0000 (UTC)
Date: Wed, 27 Jul 2022 10:47:00 -0500
From: Corey Minyard <minyard@acm.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 0/2] char: ipmi: kcs: add Arbel NPCM8XX support
Message-ID: <20220727154700.GS3834@minyard.net>
References: <20220717121124.154734-1-tmaimon77@gmail.com>
 <20220718125155.GA40038@minyard.net>
 <CAP6Zq1haOErfj2HZkqKwXZKr3+QvWP2VYK6QQOH5cjHYJ2rV0w@mail.gmail.com>
 <20220726194708.GO3834@minyard.net>
 <CAP6Zq1hHXiZw2a6+o30N-GUhcA_ZJoYH+wZa8AzLu3NmYST+kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1hHXiZw2a6+o30N-GUhcA_ZJoYH+wZa8AzLu3NmYST+kw@mail.gmail.com>
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
Reply-To: minyard@acm.org
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 27, 2022 at 08:39:08AM +0300, Tomer Maimon wrote:
> Hi Corey,
> 
> On Tue, 26 Jul 2022 at 22:47, Corey Minyard <minyard@acm.org> wrote:
> >
> > On Tue, Jul 26, 2022 at 10:41:38PM +0300, Tomer Maimon wrote:
> > > Hi Corey,
> > >
> > >
> > > On Mon, 18 Jul 2022 at 15:51, Corey Minyard <minyard@acm.org> wrote:
> > > >
> > > > On Sun, Jul 17, 2022 at 03:11:22PM +0300, Tomer Maimon wrote:
> > > > > This patch set adds Arbel NPCM8XX Keyboard Controller Style (KCS) support to
> > > > > KCS NPCM driver.
> > > > >
> > > > > The NPCM KCS driver tested on NPCM845 evaluation board.
> > > >
> > > > This seems reasonable, I've pulled it into my tree.  If anyone has any
> > > > issues with this, please respond.
> > > >
> > > > -corey
> > > >
> > > > >
> > > > > Tomer Maimon (2):
> > > > >   dt-bindings: ipmi: Add npcm845 compatible
> > > > >   char: ipmi: modify NPCM KCS configuration
> > > > >
> > > > >  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 5 +++--
> > > > >  drivers/char/ipmi/Kconfig                                  | 6 +++---
> > > > >  2 files changed, 6 insertions(+), 5 deletions(-)
> > > > >
> > > > > --
> > > > > 2.33.0
> > > > >
> > >
> > > Sorry but I need to do a little fix in the document file.
> > >
> > > Can I do it or have you already applied the patches?
> >
> > At this point I'd prefer a patch on top of what is there.  5.19 isn't
> > released yet, so the window isn't open, but that will happen soon and I
> > don't want to rebase at this point.
> O.K. thanks,
> I will wait until 5.19 is released and then I will send the patch.

Oh, sorry I wasn't clear.  You can send it now, I just don't want to
rebase what I have already.  Just a new patch on top of it, and I'll get
it in to 5.19.

-corey
