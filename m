Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A81637140
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 04:46:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHkSD6rKfz3dvG
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 14:46:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l9FX/mvm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e34; helo=mail-vs1-xe34.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l9FX/mvm;
	dkim-atps=neutral
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHkRh0Nqjz3cGV
	for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2022 14:45:51 +1100 (AEDT)
Received: by mail-vs1-xe34.google.com with SMTP id 124so450995vsv.4
        for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 19:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/CPKIuCUVqvoXjJBT5OG33wh3hTUjcahfD7x6JjejEw=;
        b=l9FX/mvmG3ZDFdIg0Dh6i2eSdfwI2KgR2LwDENRw/ry3R6BLnI0VkS3Dgke/iIurR6
         b23pseaF8VzEnd8uBg6W0AQ8FKctL8Mlp/3aRzjFD00vAFKk1wjdqjV3Uyu35WC4BInw
         aEEOyEU/tuXyHo4H3beWKhiPdZQLGXPiXpyfYCDTIBEJP3wdRLq/nhUIhLWRa7hnbMib
         D0WiM1pzAto4Aj+Beq8AfxEhSdTKnlfqQsP3rmdtc9qKPbU8DgSUXngGCLaBoULCLx48
         uP1M4vgOkzdoo/QUo33fEVq03u94b40LJa1UMgqb+A4dIkIVsp7OOlf6AfVEMFFxzP9x
         +mCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CPKIuCUVqvoXjJBT5OG33wh3hTUjcahfD7x6JjejEw=;
        b=roQOmNKrR0c52L0r2CNn5BRbPQThIZXSsJPfOfk1KG9afkw9tnmq4L2CWh+ulN0Fl9
         uTGk5/sfnd34W+oTwVFUowQ9IyjlRf2yeC5LaeBMs6+rCKSTzlRbMxT0Xy3BBnp1D9Eb
         adMhT86hSO+4Fj0a148jrWBHD50G/UUEOjoq/IZeZEAtvkH3jnBRJoH3hc3p2Kit+J8D
         gUqkhTybBH5VSGcJc6i2ZCWYkNEamNuNN4JM1VJ6UAA7zKzKToQky7nybIJe+ni6g1Pk
         Mfq26ENTsmiTgvnUhP9IG1JtpgSA27GeSwZtogensfO+0Y7zUzUU0C8Q2hxYVFmF3r5W
         CWCw==
X-Gm-Message-State: ANoB5pmS4y+HIo4i6UDtL3GcXWOwNw4I6PEYi0HrDj407Kv0CnLWl1gd
	D+wbcvRaTArw6jj156n3FdVcmu514yTbW4QM60nbefbeHjFDNw==
X-Google-Smtp-Source: AA0mqf4JL6iIJCd9AkmeeowxoY9GON5Kyy5dquooYyFHAfVdHDRzh2JiOvxgOqodsdWCUtYdUSq11MpCPVadt2k3ZkE=
X-Received: by 2002:a05:6102:1e:b0:3ac:3e44:e649 with SMTP id
 j30-20020a056102001e00b003ac3e44e649mr7837955vsp.63.1669261547637; Wed, 23
 Nov 2022 19:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20221122085724.3245078-1-milkfafa@gmail.com> <20221122085724.3245078-3-milkfafa@gmail.com>
 <20221123000552.GA817752-robh@kernel.org>
In-Reply-To: <20221123000552.GA817752-robh@kernel.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 24 Nov 2022 11:45:36 +0800
Message-ID: <CADnNmFq_1+OJNWCGSjmyV=sB39TNvAjKVs_1uLN8rOJ_RQNPSQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] media: dt-binding: nuvoton: Add bindings for NPCM
 VCD and ECE engine
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, mchehab@kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for the review.

> > +title: Nuvoton NPCM Video Capture/Encode Engine Device Tree Bindings
>
> Drop ' Device Tree Bindings'
>
> > +
> > +maintainers:
> > +  - Joseph Liu <kwliu@nuvoton.com>
> > +  - Marvin Lin <kflin@nuvoton.com>
> > +
> > +description: |
> > +  Video Capture/Differentiation Engine (VCD) and Encoding Compression Engine
> > +  (ECE) present on Nuvoton NPCM SoCs.
>
> Sounds like 2 h/w blocks? If so, then it should be 2 separate nodes.
>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,npcm750-video
> > +      - nuvoton,npcm845-video
>
> 'video' doesn't sound like the name of the h/w block(s).

VCD and ECE are 2 h/w blocks and our video capture driver needs to
control their registers.
If I separate them and store a phandle (referring to ece node) in vcd
node like this:

vcd: vcd@f0810000 {
    compatible = "nuvoton,npcm750-vcd";
    reg = <0xf0810000 0x10000>;
    ...
    nuvoton,enc-engine = <&ece>;
};

ece: ece@f0820000 {
    compatible = "nuvoton,npcm750-ece";
    reg = <0xf0820000 0x2000>;
    ...
};

Does it look good to you?

Regards,
Marvin
