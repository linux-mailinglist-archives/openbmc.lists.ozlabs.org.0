Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAA158BBC6
	for <lists+openbmc@lfdr.de>; Sun,  7 Aug 2022 18:06:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M142M38pXz2yjC
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 02:06:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EvHSbDNc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EvHSbDNc;
	dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M141y61YZz2xX6
	for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2022 02:05:56 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id a2so5012717qkk.2
        for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2022 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc;
        bh=7uXlWgTEohYxQ85BoECVY/ep9kMm6DW6Jlta0tAZuF8=;
        b=EvHSbDNccf0snsRpgwYGhmLSWdQMVy+oeswA9ebG69tnbHOwO9NlY3PoOLjQT4BkGH
         /r3PLj7ywbrZeOhzqI6eH5Gmu7SBMh8hgvdV5q6c9rqjvnbvgJEk/1Uut0XQqAILbesQ
         SVXEJnwo2j3qbSkO0fkLZb4JkHKyqJ/DcDTqJAj2SgckTgnmQa4feQR76mxYwd0fN99P
         AulCq3TQx/wqxuYUg/VK+VxEu/tzkKeHD59iEX6uyek43aRXBqIc3lp5ZKJ2rLWBwdjc
         qDtKH2lEgi+YAxwyYDV+FlevhWc7bGMUeSYt3DOUO5mhPmS8lxiZbau4GvzyQTtENsWP
         1MXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc;
        bh=7uXlWgTEohYxQ85BoECVY/ep9kMm6DW6Jlta0tAZuF8=;
        b=qH4P0T53UYiapgz4mn1/YJ/uUSRZUSx9+R6qJVBRPdAWeYbn1f7WsIJpvChWXmdtup
         Vscm6H4TkoNjnZoNA1F4+iTjz0BoIwAR8qeoZtjc3apOISleGG1TASGxSchhQx4w6Vwt
         h7/hZXTRBlDrlGuytUc3KOdMj35h2DWc8Xr7MOdzWdZt+3IdFH8MF1IdC2l1BQ9qU2m7
         0SVbXlpVDrfUL8aJZ8J9isFx1le4BdR7TLocVtoua7Q3LeF4QPzdioCEyAde+eBpBz+A
         Dm0K31xoijkEXD3AAM82ffbmJl/0rE3pKkdMR6zZHOkw5+tSn5h7qAZa3C5Yb0at9pH9
         AqgA==
X-Gm-Message-State: ACgBeo2aa7jZhckISJaNRvIJyU/K+Ov9pNhvqeG2Zv+FZuynOfCFBZhW
	XBVYGosvKK6TqL0vF9JSCg==
X-Google-Smtp-Source: AA6agR7W0fL0etBw0UI6nbPmKvtMZORG9mGYM35ublkn8y6s3O213D9Bej3/lrThwHkRKLA3SQFEPA==
X-Received: by 2002:a05:620a:4103:b0:6b9:3ee8:ed41 with SMTP id j3-20020a05620a410300b006b93ee8ed41mr3820288qko.264.1659888348837;
        Sun, 07 Aug 2022 09:05:48 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id m22-20020ac866d6000000b0031f229d4427sm6206958qtp.96.2022.08.07.09.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 09:05:48 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:18ee:4123:89ce:5c5d])
	by serve.minyard.net (Postfix) with ESMTPSA id 0563E1800BB;
	Sun,  7 Aug 2022 16:05:47 +0000 (UTC)
Date: Sun, 7 Aug 2022 11:05:45 -0500
From: Corey Minyard <minyard@acm.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2] dt-binding: ipmi: add fallback to npcm845 compatible
Message-ID: <20220807160545.GM3834@minyard.net>
References: <20220804181800.235368-1-tmaimon77@gmail.com>
 <20220805115827.GG3834@minyard.net>
 <CAP6Zq1gfvEpUF-TKhA8EdJqBtwaVvJR3qxtn=8Li4swHB6sDYQ@mail.gmail.com>
 <20220807121138.GL3834@minyard.net>
 <CAP6Zq1iL7okjGU8_-CnrBnRUzjLKPD8FNw_oYso-jbthbeR1iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1iL7okjGU8_-CnrBnRUzjLKPD8FNw_oYso-jbthbeR1iQ@mail.gmail.com>
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

On Sun, Aug 07, 2022 at 05:54:28PM +0300, Tomer Maimon wrote:
> On Sun, 7 Aug 2022 at 15:11, Corey Minyard <minyard@acm.org> wrote:
> >
> > On Sun, Aug 07, 2022 at 11:03:56AM +0300, Tomer Maimon wrote:
> > > Hi Corey,
> > >
> > > Thanks for your comment.
> > >
> > > On Fri, 5 Aug 2022 at 14:58, Corey Minyard <minyard@acm.org> wrote:
> > > >
> > > > On Thu, Aug 04, 2022 at 09:18:00PM +0300, Tomer Maimon wrote:
> > > > > Add to npcm845 KCS compatible string a fallback to npcm750 KCS compatible
> > > > > string becuase NPCM845 and NPCM750 BMCs are using identical KCS modules.
> > > > >
> > > > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > > > > index cbc10a68ddef..4fda76e63396 100644
> > > > > --- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > > > > +++ b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> > > > > @@ -7,7 +7,7 @@ used to perform in-band IPMI communication with their host.
> > > > >  Required properties:
> > > > >  - compatible : should be one of
> > > > >      "nuvoton,npcm750-kcs-bmc"
> > > > > -    "nuvoton,npcm845-kcs-bmc"
> > > > > +    "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"
> > > >
> > > > This is just wrong.  The compatible is supposed to identify the device,
> > > > not the board the device is on.  I think compatible here should be
> > > > "npcm7xx-kcs-bmc", and just use that everywhere.  It's fine if that is
> > > > used on a board named npcm845.
> > > The NPCM8XX is not a board, The Nuvoton NPCM8XX is a fourth-generation
> > > BMC SoC device family.
> >
> > Ok, but same principle applies.
> >
> > If the device is exactly the same, then you would only use one of the
> > "npcm7xx-kcs-bmc" and put that in both device trees.  You can use
> > "nuvoton,npcm750-kcs-bmc", it's really not that important.  Or even
> > "nuvoton,npcm-kcs-bmc"
> If we use "nuvoton, npcm-kcs-bmc" we should take care of backward dts
> compatibility, and I am not sure we like to change NPCM KCS driver.
> >
> > If the device has a minor difference that can be expressed in a
> > parameter, then create a parameter for it.
> >
> > If the device has enough differences that a parameter or two doesn't
> > cover it, then you put either nuvoton,npcm750-kcs-bmc or
> > nuvoton,npcm750-kcs-bmc in the device tree.  Not both.  Then you need
> > two entries in the of_device_id array and you use the data field or
> > something to express the difference.
> >
> > Since there appears to be no difference, just put
> > "nuvoton,npcm750-kcs-bmc" in the npcm845 and I will drop the patch
> > adding all this.  Then a patch can be added saying it applies to both
> > the 7xx and 8xx series of BMC SOCs.  If you want to change the name,
> > then a patch will be needed for that, but then you will need multiple
> > entries in your device tree, but you would not document it as such, as
> > there would only be one that applies for this kernel.
> 
> It little bit confusing to use nuvoton,npcm750-kcs-bmc that are
> related to NPCM7XX for NPCM8XX KCS.

A little, but it's not unusual.

> We can use the generic name "nuvoton, npcm-kcs-bmc" as you suggested
> above but we should take care of backward dts compatibility, and I am
> not sure we like to change NPCM KCS driver.
> 
> We had a disscation with Arnd, Arnd asked us to use a fallback as we
> did here if NPCM8XX device module is similar to NPCM7XX module:
> https://lore.kernel.org/lkml/20220522155046.260146-5-tmaimon77@gmail.com/
> 
> I think we should use a fallback to describe the NPCM8XX KCS in the
> dt-binding document.

I'm ok with that option.  I guess I should have mentioned it.  Add
nuvoton,npcm-kcs-bmc to the driver's of_device_id table.  Then use that
in that compatible string in the device tree.  Leave the 750 compatible
string in the table for backwards compatibility.

There's no point in having a bunch of those strings if they are all the
same.  If a new one comes out that is different, we can handle that when
the time comes.

-corey

> >
> > I'm pretty sure the only reason to have muliple compatible entries in a
> > device tree is to cover multiple kernels where the name changed.
> >
> > -corey
> >
> > > >
> > > > -corey
> > > >
> > > > >  - interrupts : interrupt generated by the controller
> > > > >  - kcs_chan : The KCS channel number in the controller
> > > > >
> > > > > --
> > > > > 2.33.0
> > > > >
> > >
> > > Best regards,
> > >
> > > Tomer
> 
> Best regards,
> 
> Tomer
