Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2C307D52
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 19:05:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRT0X25dWzDrdg
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 05:05:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=VnZmyXEN; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRSzT5PxgzDrVb
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 05:04:35 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id p72so6489354iod.12
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 10:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5aPUxNS34SUhBaY4wyfxADI0uqLDGAFQh4LgHtoZCUk=;
 b=VnZmyXENN5MAYRj4F360I+z/yzzqq2tLF7lmTOXH99PJSaWFeMB3ki5I3wL+goXsPm
 3+hOUAaTkEOgm3BbFw+tgMDgkhZ9IQPGlPn01Kp2WSOKxJ9i6yka+2kJFZQqOC8UmL4x
 1YIBXPfy4aENK2zBcpHpUuYHlVjzP8YoCf0N2vTYepGxrMfgF896fuBS0WHD761zdsOb
 EEagj073nk0QLCTUwIbuhPbMQkwFxgR16sApaqhw0MC0Ax3j3PGUt+TulmORyOpizrix
 SsejTqj7ZGc0M8uskm18TZ0Sy+p32z8HBPNdhrTVftE++OkausuCMacjaDKWpUY3N7nR
 0FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5aPUxNS34SUhBaY4wyfxADI0uqLDGAFQh4LgHtoZCUk=;
 b=OO54/FXlrFOmwYrKxyZSqe85sjvpQWYy6/gTMx37JrikM+T9ivJ5Qj9XWfpT3czQ2q
 WW5wgCA/cuakiTmkb04IxVTmiYjiCVTg/9sQSsv3UjDOct4XydLtnr213Q5ZQASWxo5e
 kJoFEb4f66DhmG2xhpJD/9DAdvH4jIVIysMVZYicXQ1Ggh15OLJMzD6J+tHlZ7kwMmtE
 eT1gneGbpIfpTnKS22BzHMsV6fsBDzguWpWv6jLUQnVW5L71cYKZuXg1tdxUgGfrsPpq
 coavvDC1YPxqYjOtoCYaDPDO2nnx+rjyUxo/YjgjLEwxmFqFqkfF3FzLleLIreSHdXnW
 xzSg==
X-Gm-Message-State: AOAM533mUq/d0Hn99fmhRzpGwnFXLq8pQqoqN9Mp9brkmW1F4WYxn6b0
 e6+4ahnkR4x9cC/Q241agleWZstvH9rJ69p55iAFhw==
X-Google-Smtp-Source: ABdhPJyTtYf1EDpBE+r7c64AO4AkFdB5Fvl0+WNAEe7OCudBv+pEvzUVP94tuVCZ7UC98zJFLUbxGlgSesH9e7tBHPE=
X-Received: by 2002:a02:77c2:: with SMTP id g185mr434312jac.108.1611857072025; 
 Thu, 28 Jan 2021 10:04:32 -0800 (PST)
MIME-Version: 1.0
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
 <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
In-Reply-To: <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 28 Jan 2021 10:03:55 -0800
Message-ID: <CADKL2t4EgE3bcnLU9NOP6fL71ifqzVOLH3U9T6ncfUJJKVzK9Q@mail.gmail.com>
Subject: Re: Progress Codes in BMC
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 22 Jan 2021 at 06:19, Supreeth Venkatesh
<supreeth.venkatesh@amd.com> wrote:
>
>
>
> On 1/22/21 6:32 AM, Deepak Kodihalli wrote:
> > [CAUTION: External Email]
> >
> > Hi Manoj,
> >
> > On Fri, Jan 22, 2021 at 5:25 PM manoj kiran <manojkiran.eda@gmail.com> =
wrote:
> >>
> >> Hi All,
> >>
> >> IBM Servers has a feature called Progress codes[1]. These are generate=
d by applications on the BMC & host to show their progress via the standard=
 interfaces like GUI & control panel [2]. These progress codes are used dur=
ing boot hangs e.t.c to provide additional detail as to how far we made it =
with respect to boot.
> >>
> >> Does the community has shared interests on this & would like to collab=
orate ?
> >
> > I am interested in this problem as well and would like to collaborate.
> I am interested as well.
>
> > OpenBMC already seems to have solutions for POST codes -
> > phosphor-host-postd, phosphor-post-code-manager and there's a
> > Boot.Raw.Value D-Bus API. However it would be nice to have a more
> > generic solution. I think it's hard to converge on the format of such
> > codes (since they can originate from different layers of firmware
> > stacks/bootloaders and some of these layers might not accommodate
> > PLDM/IPMI etc).
> In this process, We may have to extend
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0249_1.0.=
0.pdf
> which has a 16 bit state sensor for Boot Progress. As well, We may have t=
o make sure that it gets mapped to
> Redfish.
>
> What I mean by generic above is:
> > - A generic D-Bus API for progress codes
> > - A generic app for managing the policies around such codes
> > - Platform specific "Producers" of progress codes, conforming to the
> > generic D-Bus API
> > - Redfish mechanisms (LogService/other) to extract codes

Yes, this would definitely be useful. I believe we've had discussions
in the past but were unable to come up with a satisfactory interface
that supports all of the different types of progress codes.

>
> +1
>
> >
> > Maybe some of the apps I pointed above can be extended for this
> > purpose, but I'm yet to take a closer look.
> One of the deviations on AMD platforms is that POST code is usually 32 bi=
t code.
> I did extend phosphor-host-postd to read 32 bit codes and added experimen=
tal associated driver in Linux, as LPC ports supported is only two.
> However, it is far from production quality code at this point. We can def=
initely collaborate on this to arrive at a generic solution.
>

phosphor-host-postd supports the "-b" option to specify POST code
length in bytes, with up to 8 supported.

The Nuvoton BPC driver has support for 32 bit POST codes as well, so
you may find it helpful to refer to that when working on the Aspeed
driver.

> >
> > Thanks,
> > Deepak
> >
