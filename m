Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FB44B1A94
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 01:41:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvvtv43w3z3cCJ
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 11:41:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Sk3nbC/r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=gpgpgp@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Sk3nbC/r; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvvtR4VVdz2yMt
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 11:41:01 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id p6so3130938plf.10
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 16:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=isrBlndXuvLsapYZe2PTZmW9pr9h9sLnbctweu/ub30=;
 b=Sk3nbC/rqg+okMFm4PLWPRUywUCZGv+Uqx9yQDGl7q9gzAAB0cHe1xRZ+9LlWTQOLP
 yLWT2BAlmb5cU9DFZkOTW/JnAIgjXCZvmqLMqZY3H2zL/MKODZmk0iRfDYFSeP6oFttE
 EQmPQ/BYPR9V8yfpsmj51aoQOpr21hS/PaWAMrMUCdkrVVNymEtUg4qcNmtFes5SfjmY
 T5/naP4AU+1bzq6+YeXl/JRRFMqQJ8/5mQ8L2HrBzOVSjPWGKvuf3mGALJ6GGc9PdesB
 kIF7hR0IzJmvmSvgUrMK92WSjPh9W130Dl2S02YUshhXg0Gvh/Sz0J6ofXpTljvSOmAL
 MAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=isrBlndXuvLsapYZe2PTZmW9pr9h9sLnbctweu/ub30=;
 b=5tplkw9E+3lRWxj/H5Zk4QIxWWHwb7vwvzsBeg4ax/Fazr/cP/SjzakjSIe1xrJEcu
 oH/4hi0KxY98RXau/37CUdqcHx8kr6ntO2RBQiRkMC7GQnD6WQes6QmKJvpoxDlICYi2
 GFd3yQNKAbftpL7qLVYHVcaglXpt9s2LrGmKw4melQH2y6Y5QApQ+5l9fJKsIP3JDDig
 GmAf879tzCJ2Cdg2/moEI5k8Oaj6fH9ChMshpgVVyk2OAhZgg5d2TZr1nkEHv8aCCNYf
 Y+pqdXKInMJy8lBr+4aAFATVn4K4zWEv8slG7gAAXLsPk/5HBniXZTox98ePiZyZamSR
 adSw==
X-Gm-Message-State: AOAM532oogOiieV6l/Hl0TbU5YpKJOSeH1VcXczDejcBfmw/6urA1OcL
 IrVI8V19jD8J1d59vpB3RG9lAp5NhBQjuO3GIsJxXg==
X-Google-Smtp-Source: ABdhPJzHbofmUqb2oyZ+DxpBRYIQFWbx39/U4TWVBYyVCmslTKgKfDP1Rbf8BDVdnIxfDTR+lmmkTNIOFtgUWwzGCHQ=
X-Received: by 2002:a17:90a:5210:: with SMTP id
 v16mr20881pjh.107.1644540058217; 
 Thu, 10 Feb 2022 16:40:58 -0800 (PST)
MIME-Version: 1.0
References: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
 <YgIXodbEP9hmae6Q@heinlein>
 <CAD1rtg-tTrbjiL76NRDGnAfx36JBM4Rcb2gyUYjROR-2=H+Uqg@mail.gmail.com>
 <YgQcaInEBq8ZBlIm@heinlein>
 <CAH2-KxAyXn3YndZY_aWAMt4M6eTMrkPA91vCPeOj0tZOgPv-vA@mail.gmail.com>
 <YgQuzD9AkrqstygH@heinlein>
 <CAH2-KxA6MhNXUs+KXAjHTcJe1gWyGwfL+OUQBuCfQnPMSX7GZQ@mail.gmail.com>
In-Reply-To: <CAH2-KxA6MhNXUs+KXAjHTcJe1gWyGwfL+OUQBuCfQnPMSX7GZQ@mail.gmail.com>
From: Michael Shen <gpgpgp@google.com>
Date: Fri, 11 Feb 2022 08:40:22 +0800
Message-ID: <CAD1rtg8vM-2PckG1Cct7m5tyFJ-axvKQ_ky2z=rzV4O9mZjoWA@mail.gmail.com>
Subject: Re: Propose a new application for reading DIMM SPD directly
To: Ed Tanous <edtanous@google.com>
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
Cc: openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 10, 2022 at 6:45 AM Ed Tanous <edtanous@google.com> wrote:
>
> On Wed, Feb 9, 2022 at 1:14 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> >
> > On Wed, Feb 09, 2022 at 12:20:00PM -0800, Ed Tanous wrote:
> > > On Wed, Feb 9, 2022 at 11:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> > > > On Tue, Feb 08, 2022 at 04:23:12PM +0800, Michael Shen wrote:
> > > > > On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > > > > > On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
> >
> > > > > BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I3C) bus.
> > > > > From my understanding, BIOS only needs to read SPD during the POST stage.
> > > > > For the rest of time, BIOS will hand over the SPD bus to BMC.
> > > >
> > > > That seems like it might work.  You'll have to deal with the time when the BIOS
> > > > has the mux in the BMC code somehow.  Ideally I'd ask for the mux select to also
> > > > be fed to the BMC as an input GPIO so that you can differentiate between "we
> > > > don't own the mux" and "all the devices are NAKing us".
> > >
> > > This seems like a nitty gritty design detail that's best handled in
> > > code when we review it.  I think the important bit here is that there
> > > are paths where this could work without a significant design issue.
> >
> > Just one subtlety.  I wouldn't expect this, necessarily, to be in _our_ design
> > and/or code, except that we'd want to document the GPIO line like we do all
> > others.  I was trying to hint that "if I were involved in this hardware design,
> > I'd ask for...".  If you leave it out, I'm sure it'll work _most_ of the time
> > just fine and it'll be your problem to debug it when it doesn't.
>
> Understood.

Thanks for all your suggestions. I will keep them in mind during implementation.

> > > > You should take a look at what is already existing in fru-device (part of
> > > > entity-manager repository).  This is already doing this for IPMI-format EEPROM
> > > > data.  We should be able to replicate/enhance this code, in the same repository,
> > > > to handle SPD format.
> > >
> > > I am not sure if it's a good idea to put it into the entity-manager
> > > repo. As you said EM
> > > is designed for IPMI-format EEPROM. Adding another parser into that
> > > repo may violate
> > > EM's design.
> >
> > I'm not sure why it would be an issue.  Hopefully one of the maintainers of that
> > repo can weigh in.  I wouldn't expect "parsing only IPMI-format EEPROMs" is a
> > design but just the current state of implementation.
>
> So long as it can function properly in its current design, i have no
> problem with FruDevice adding more parsing types.  In fact, there's
> already patchsets out to add Linkedins proprietary fru type to
> FruDevice, so in terms of design, Patricks request seems reasonable.

Got it. Then I will push the code to EM.
