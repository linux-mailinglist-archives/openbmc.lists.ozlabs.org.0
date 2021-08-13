Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62FA3EB33B
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 11:14:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmHvF426Wz302V
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 19:14:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qkxw1h4v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qkxw1h4v; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmHtn6nqtz2yxP
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 19:14:24 +1000 (AEST)
Received: by mail-qv1-xf44.google.com with SMTP id bl13so4844421qvb.5
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 02:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NUNjenaFw3r/7T8HezUSZlsy+QZfgG1auKnxQ8X834g=;
 b=qkxw1h4vgZJAEcIwLPCDaEHRndd4nlguYpZe+l7PuS9FxTefEXyvphvjWKZuLW1RXG
 qziDvIzOvhbIBkzp/tVhnF1aKZP5A0s9PLFX6FaMTNe/kP+8j1cB8Nb84m19uiV9KMSd
 BYj4QPsmbpRCnL7WPkrP0ZTBp+j6UL4vg8XSbWGDit3ROgETy+t+/d7o/VCbrtG5FoFj
 voXFqJEt0px9dbpD9uCNXSFvBIpDcOsee1n4eQS62yaqTiy5UWR4zpEZdChgvv0iZHF0
 m+5786iY9mPEUamCro9WTctReI2h26xMt+rTXkHusuoe4HQ7wUNBzdHA9slp67AGO8+h
 tkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NUNjenaFw3r/7T8HezUSZlsy+QZfgG1auKnxQ8X834g=;
 b=D+KxpepRXcf/9fZnsJ39VHb482AZp0wXwkn1Ark8Ta3C4dz8FfxUGv9LayDfiOAquW
 GUW58Bk8MiktjUBZ5I8lUV1HhS2PwGNQM0kgbzb07P58rfZieCXCZ1Ak+f+iaZcNHYy4
 89hJ1x2TcZMsw/OYbj4hTUQg5IIAPv8gdJATajnvrvPLRYPNn47TRYXsVNxHzEYBCxgc
 j3LtFNRvSOZb/2PEokOn1tUOxoWBhtMdQRkX3D85FekUfQy2D6FCW0/8y5US6KO29Fzg
 aGCO5F1t5jNMKuV33VSKDE9DxX60+YfeCxU9NbsovLWojGwjS0eB7SsEPlSsVBohfVma
 IIgg==
X-Gm-Message-State: AOAM532BY/7MOLjVDYYyWBJc0TjE3zUUbLHW10Kl4gNBCN+/IddHh0iQ
 DBDukoBrxgKP3zdq44rgHKZKm4VTLEdlaBv5UmY=
X-Google-Smtp-Source: ABdhPJzFYVkHUBX5V1zMLcUl4Mc/VPqmeHj2l5qJD7iUaswS8BXL3txBlwwkWRAmUDrRfTGbZuGrskl2z3dlRs4JMA4=
X-Received: by 2002:a05:6214:18ec:: with SMTP id
 ep12mr1692351qvb.51.1628846061000; 
 Fri, 13 Aug 2021 02:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <OFA5154048.C3010138-ON00258730.00127D40-1628824917257@ibm.com>
 <CANFuQ7D+ihCTnQHuyzatLsu8RBa8gLe0iDed18EAM_sy3aPNYQ@mail.gmail.com>
 <916fc23f02ec749ecccf70dff356daa400026b28.camel@yadro.com>
In-Reply-To: <916fc23f02ec749ecccf70dff356daa400026b28.camel@yadro.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Fri, 13 Aug 2021 17:14:10 +0800
Message-ID: <CANFuQ7BXy1s6SKLLgwah5p2EpX7_yBK4CUOHxi4J+LQ6r2OuCw@mail.gmail.com>
Subject: Re: Request new repo for Audit function
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 13, 2021 at 4:31 PM Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
>
> On Fri, 2021-08-13 at 14:09 +0800, George Liu wrote:
> > On Fri, Aug 13, 2021 at 11:22 AM Milton Miller II <miltonm@us.ibm.com> wrote:
> > >
> > >
> > > Reply below
> > >
> > > -------- Original Message --------
> > > From: George Liu
> > > Date: Thu, August 12, 2021 7:52 PM -0500
> > >
> > >
> > > Hi Brad:
> > >
> > > We have a requirement to implement an Audit function, I found that
> > > there is a design doc[1], but there is no code to implement it.
> > >
> > > Could you create a new repo for Audit function?
> > > eg: phosphor-audit
> > >
> > > [1]: https://github.com/openbmc/docs/blob/master/designs/phosphor-audit.md
> > >
> > > thx - George Liu
> > >
> > > -------- End of Original Message --------
> > >
> > > Hi George.
> > >
> > >
> > > Please update the design with consideration for inclusive naming[2] before
> > > submitting code for it, as it uses depreciated terminology in it's external
> > > control interface.
> > >
> > > I see this design was merged almost 2 years ago before this policy was in
> > > place but as you said it hasn't been exposed by the community yet so we won't
> > > need to maintain compatibility with prior implementations.
> >
> > Thanks for your advice.
> > I will read and update this design doc ASAP :)
> >
> > >
> > >
> > > [2]
> > > https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#inclusive-naming
> > >
> > > Thanks,
> > > Milton
> > >
> > >
>
> George, there is answer about same question in this thread
> https://lists.ozlabs.org/pipermail/openbmc/2020-March/020839.html .
> Should be part of phosphor-logging.

Okay, Let me check, thanks so much

>
> Thanks.
>
