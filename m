Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D7C58CA7A
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 16:24:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1djm4wyBz3bZ2
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 00:23:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZnLmow2w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZnLmow2w;
	dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1djP042nz2xJG
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 00:23:35 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id cb12-20020a056830618c00b00616b871cef3so6582410otb.5
        for <openbmc@lists.ozlabs.org>; Mon, 08 Aug 2022 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc;
        bh=c4sdWPDGZh2lpcz0JPsH1RxILtP+3NzhgDmzZEzhFwU=;
        b=ZnLmow2wQ4sURptG6gn+2TtbvfsVwBPnjNh04IBl4k64MgxlFvSvUC+wp+vboN3FgO
         ZyzRtpw9HTFDSJFU034ypntElaqBvXbVjdm6be2TRrV7uK16N99P1EchihnkRoKVliBv
         8GPCh+Cfbd5UnCYx4nUQfWm3niPkbwQoKkNBKaNVXIw+u4CP7aMrxBGpmDm79s1VSoSA
         UiPRyNaRR/wMj53t/PjOxllk2TJrO0AEUzOkw2dCBTrfbgVAfMHFdUe/xgp/HVbunerL
         TOsm01vtfLxY0tyde5qMUJ1Q267z+JxC2cJNOEpgBI8FwHIQPZxY08ZWIUvoyhQxNAN4
         Du/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc;
        bh=c4sdWPDGZh2lpcz0JPsH1RxILtP+3NzhgDmzZEzhFwU=;
        b=oCtrs2zaHjh/9wvbGoqcAZyZLH7MFx5kWhGP47OYZOeqblc3aaSR5vLpbF2grSSymn
         Yv/ElJ9pbq2s0z0nnWzaHnEPr3jeAdPSHb9razZAeABKAmcBgTKdQZZ5SCuDOb9b+V+E
         uy0aE7NQERB40ds4ws2pdLYV+urs/qZd+v8NOHozozYzMi8DhKNcziNUzNaads+f4rsz
         ox1AGfTN2cugTwzLuiyHNq0EhtMFyA92laoamHU1t/RfF0Cphn7BXX64KxNZ7Di6mTRY
         L86xF6BXSlev1kYlaZB2RKma7SRoTxPeiT9BERmQPnrTrboULeH8mIaS+twqP3cqLT5C
         sxyg==
X-Gm-Message-State: ACgBeo1y4OXjupsocOKELXII8ef+oQj22EIktdiuTNt/o8XdBPwCj2UO
	XznrrnVQ/uanXd867s8k1Q==
X-Google-Smtp-Source: AA6agR5il2qTkCti/3qg75D5Tbky90Do0XQ9veQVqgQYxxPzZdL+FNKM8OV8jU27apltAUSE8fZdRA==
X-Received: by 2002:a9d:73d0:0:b0:61c:8d31:6981 with SMTP id m16-20020a9d73d0000000b0061c8d316981mr7149505otk.99.1659968610070;
        Mon, 08 Aug 2022 07:23:30 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
        by smtp.gmail.com with ESMTPSA id fo34-20020a0568709a2200b0010e47737471sm2295305oab.49.2022.08.08.07.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:23:29 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:3153:e085:df0f:abc2])
	by serve.minyard.net (Postfix) with ESMTPSA id B79DE1800FA;
	Mon,  8 Aug 2022 14:23:28 +0000 (UTC)
Date: Mon, 8 Aug 2022 09:23:27 -0500
From: Corey Minyard <minyard@acm.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] dt-binding: ipmi: add fallback to npcm845 compatible
Message-ID: <20220808142327.GR3834@minyard.net>
References: <20220808075452.115907-1-tmaimon77@gmail.com>
 <da83671e-08b9-2d68-e5d3-d9b09c105bb4@linaro.org>
 <20220808122652.GO3834@minyard.net>
 <937b6737-5d55-2185-a4bc-7535fa6da85c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <937b6737-5d55-2185-a4bc-7535fa6da85c@linaro.org>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openipmi-developer@lists.sourceforge.net, jic23@kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 08, 2022 at 03:38:45PM +0300, Krzysztof Kozlowski wrote:
> On 08/08/2022 15:26, Corey Minyard wrote:
> > On Mon, Aug 08, 2022 at 11:11:16AM +0300, Krzysztof Kozlowski wrote:
> >> On 08/08/2022 09:54, Tomer Maimon wrote:
> >>> Add to npcm845 KCS compatible string a fallback to npcm750 KCS compatible
> >>> string becuase NPCM845 and NPCM750 BMCs are using identical KCS modules.
> >>>
> >>> Fixes: 84261749e58a ("dt-bindings: ipmi: Add npcm845 compatible")
> >>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >>
> >>
> >> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Ok, I think I understand how this is supposed to work.  It's not
> > altogether clear from the device tree documentation.  It says in
> > Documentation/devicetree/bindings/writing-bindings.rst:
> > 
> > - DO make 'compatible' properties specific. DON'T use wildcards in compatible
> >   strings. DO use fallback compatibles when devices are the same as or a subset
> >   of prior implementations. DO add new compatibles in case there are new
> >   features or bugs.
> 
> This documentation is short, so it explains what should be done, not
> exactly why it should be done. If we wanted "why" this would not be set
> of 4 sentences but twice more...
> 
> > 
> > AFAICT, there are no new features or bugs, just a new SOC with the same
> > device.  In general usage I have seen, you would just use the same
> > compatible.  
> 
> Most of the usages are like shown here. There are several other cases.
> It's the same with poor or good code - you will always find both patterns.

It is true, but lack of specified good examples makes it hard for people
like me to know what is right and wrong.

> 
> > However, if I understand this, that last sentence should say:
> > 
> >   DO add new compatibles in case there is a new version of hardware with
> >   the possibility of new features and/or bugs.
> > 
> > Also, the term "specific" is, ironically, vague.  Specific to what?
> 
> To me it is rather clear. Specific as in first meanings of the word (1,
> 3, 4 and 5):
> https://en.wiktionary.org/wiki/specific

Everything is always clear when you understand something :).
The really hard part about technical documentation is forgetting what
you know and approaching it from a newbie's context.

> 
> nuvoton,npcm7xx-kcs-bmc would not be definite (allows more meanings),
> unique (in terms of devices it expresses), distinctive (as two different
> devices use the same) or serving to identify one thing (again - two SoCs).
> 
> What other meaning do you think of?

It is not the definition of specific that is vague, it is what
"specific" applies to.  Is it specific to a SOC?  Specific to a board?
Specific to a particular device implementation?  Specific to a rev of
the silicon?

I will say that when I read that sentence, it means nothing to me.
If it said "DO make compatible properties as specific as possible to the
particular hardware implementation of the device" that would have more
meaning, but still leaves the reader wondering exactly how to do this.

For instance, should I put board/rev specific compatibles in?  Would it
be:

   "mycompany,myboard-rev1-npcm845-kcs-bmc", "mycompany,myboard-npcm845-kcs-bmc",
   "nuvoton,npcm845-revb-kcs-bmc", "nuvoton,npcm845-kcs-bmc",
   "nuvoton,npcm750-kcs-bmc"

That's about as specific as you can get with fallbacks for everything,
but it is too specific?  How far do you go?  There might be wiring
differences on specific board, maybe that makes a difference.

That's where good (and identified bad) examples and rationale come in.
Tell the user why something is being done and it's easier to understand
what to do in different situations.  It's not a matter of number of
sentences.  Just like code, shorter is not always better.

Anyway, I have ranted for too long.  Thank you for clearing this up for
me.

-corey

> 
> > 
> > It would be nice to have something added to "Typical cases and caveats"
> > that says:
> > 
> > - If you are writing a binding for a new device that is the same as, or
> >   a superset of another existing device, add a new specific compatible
> >   for the new device followed by a compatible for the existing device.
> >   That way, if the device has new bugs or new specific features are
> >   added, you can add workarounds without modifying the device tree.
> > 
> > Anyway, I have added this to my tree with your ack.
> 
> Fantastic, thanks!
> 
> 
> Best regards,
> Krzysztof
