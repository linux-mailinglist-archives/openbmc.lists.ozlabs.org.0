Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A46516FA4
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 05:46:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zMpn5Sb0zDqMr
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 13:46:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::130; helo=mail-it1-x130.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a/tDiURp"; 
 dkim-atps=neutral
Received: from mail-it1-x130.google.com (mail-it1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zMnz5C8VzDqLc
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 13:45:59 +1000 (AEST)
Received: by mail-it1-x130.google.com with SMTP id q65so1788803itg.2
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 20:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X/4MdNLqFxgs6PSDMdgYhWTX72QZWuqNINz1bgCUaJI=;
 b=a/tDiURp3KWdyMuvjGk5q3LOX/LaTNLUVEAuvblSh25MRng4tOHxQMSlzUChVgsgEO
 LN990B8GFjlqxtkzWL5XyAnCrx052xozFA5eufj85CWcoAuevwKOg2sbbtQiWqBpNkoq
 c6PsU3OabHcRvZibAz23Io0dnPihFZWYTn4wVNhIwM0Vm7v+qq0oeZmgjSrZcJp5pPVv
 UUN0jKlGZlJLvLYevH+0D/U8lfnJ5fnvMsCFxErYWX3RN6+U6mJ+D3lJ/VPMSMRkMjEa
 w4RFgf7t+ctIcWw65nRrERsg4LEOGE9KOuY41bwSK5M+1OtEzjD/55brAphzXY7QDP+E
 WXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X/4MdNLqFxgs6PSDMdgYhWTX72QZWuqNINz1bgCUaJI=;
 b=JA0UOUGu0H5+scyHJZ4O6yyAZpSuJAIKf+OOepgoOQx7LYb/NFH2T/BG2duP/vYtBJ
 CEoX134yBagqpn+9BktpD39HfCXb3HqhzwfzMMhi2ypo5U+BqbHHkNBYCRJOd2cL/89X
 iBr09N2iDoSEAymoNuvUeuDHVb3q1DS05tgRZqjGAled1DWyphixBjlBNL7qOyfoPo4y
 yQqIMNJg0mo0Z1XbImvLcpFDCtJElCMY7+Nkb6SikX9P5YPBXmwspeozi5s4gGopGeUQ
 cSToHsCyn/i7ybN2mLMDuj1MYRrcAhV2oBBzZmVQCVMNtfkcihLBHxDK/UkOJVXASZiN
 W2Lw==
X-Gm-Message-State: APjAAAWTSaOs7U6SyJ1Z9ET6YjYo5Do/Pq9B36xFk1BDjQa/OWhmUlS3
 rlqQPyd1hmoyRpwcgpwbnSPZIgL1CyQbh4XAIm0=
X-Google-Smtp-Source: APXvYqw5d0LvjcExJEV1IGXGkLg7VtCLsMgi9yLgQaFNmDpXxx4Fw1bG0yNb31KfFmFHhWenLeFbF5nmtAftkbA8Tlc=
X-Received: by 2002:a02:2b1d:: with SMTP id h29mr25860530jaa.76.1557287155942; 
 Tue, 07 May 2019 20:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=oNUnnPHXnbybAPAvdq9PvxHe4B3GiX0BYw6rdoXgDqw@mail.gmail.com>
 <CALLMt=orZcWQ+A-dJwd+QKroYe78AK9LXTr=BsjeJiVpQj69SA@mail.gmail.com>
In-Reply-To: <CALLMt=orZcWQ+A-dJwd+QKroYe78AK9LXTr=BsjeJiVpQj69SA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 8 May 2019 11:45:39 +0800
Message-ID: <CAARXrtk6k56kn2UJYPQq=truocS=Dp6CFgQMyBw78K-WjTMqug@mail.gmail.com>
Subject: Re: Proposal for removing legacy code update services
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The services are being removed at:
https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/21208

The related docs are being updated at:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21209
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21210
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21211

Leave comments there if you have any concerns.


On Wed, Apr 3, 2019 at 11:33 PM Andrew Geissler <geissonator@gmail.com> wrote:
>
> On Tue, Apr 2, 2019 at 10:48 PM Lei YU <mine260309@gmail.com> wrote:
> >
> > Hi All,
> >
> > With 3ba97559e, OpenBMC supports PNOR code update by
> > org.open_power.Software.Host.Updater.service, with the steps described in
> > [host-code-update.md][1]
> >
> > And before that OpenBMC already supports BMC code update by
> > xyz.openbmc_project.Software.BMC.Updater.service as well, with the steps
> > described in [ubi-code-update.md][2]
> >
> > So it's time to remove the legacy services that could be replaced:
> > - org.openbmc.control.BmcFlash.service
> > - org.openbmc.control.Flash.service
> > - org.openbmc.managers.Download.service
> >
> > What do you think?
>
> Sounds good to me! Get some more python applications out of our images and
> makes it easier to have standard CI tests for all machines.
>
> > Thanks!
> >
> > [1]: https://github.com/openbmc/docs/blob/master/code-update/host-code-update.md
> > [2]: https://github.com/openbmc/docs/blob/master/code-update/ubi-code-update.md
