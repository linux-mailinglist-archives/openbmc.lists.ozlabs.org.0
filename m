Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B124B0091
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 23:45:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvFMy5Wjkz3bV7
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 09:45:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XRLh2+zD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::329;
 helo=mail-wm1-x329.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=XRLh2+zD; dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvFMY0lltz2yNv
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 09:45:26 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so4146465wml.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Feb 2022 14:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fTCt4moqLTSJY1PFm8vbDMjHHG/FC2rgMDUceDTHV0E=;
 b=XRLh2+zDjDHxC/BM60hBv36jCnElrpJJ//ENTwQaSuTKUADtC100UYBHyBxDMmqP5l
 B7LR/w+racbSs7u25LOX174g9sAiw77nj/0lR0GOePDyv6s6D0xiGMCbCvUk0ptOJ2Fe
 XSKCQFoyhs8rXFFdjs+6a47YkIQ2LGovo6vVYO93k3gvsymIa1JvS3QPTeKc4nYieXW2
 IUB/sHNj9NIHkwq7Yz8PE3QyfpW9M3pRMWqg5pewFCgWCjgtuL/pvV7jDtooLwGERbh7
 nTaAq7F4p/IaJK638ps2lR8b8WEsgd+PFepZrdgZqn2R4AvKTjW/ibYU+k/UJnl6RVMN
 8rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fTCt4moqLTSJY1PFm8vbDMjHHG/FC2rgMDUceDTHV0E=;
 b=0bIa/kBR1cEbwRte1xYiwfSmnYwoz4dvZH3ibcLndSZAmzyyWy2VzbsKceB9I4U5ix
 oB/BitD4aiw/hw+kNPAijOo12E9N4SnkblEa5rJADHNeMr/TpWsNuSitHdDwIv0mqkJl
 SrNgtEbBUpQRdTQtcWIBGj4aF0fPWjwwUk3HEo2ZriqlyYQalS3vHvYJzZJqhRmLs0ql
 99dFpti/1LGgoV13SCz6tA3LgfvbyXtQKsgwT+hSsxBZjT1bYU0ZqhQ8qr9LnBjH7h7y
 WW8RebIvNr6AzY3RnXKXVHhWbg5YvuvxsgJyBf6K/Dzbw7R6LKmYV6/GPSpUb1Tam0Kp
 LMCg==
X-Gm-Message-State: AOAM531mV5ANUyQLWuwPEgQOPE13JNAJc0b/zui+KIVWzCjH1w4kqzjq
 x06sBOCpltC66R0WNrN7cBoMPM2imh5rzKh6p26POA==
X-Google-Smtp-Source: ABdhPJxKnv0x5+Zq0jpF2bIC15cT/0SWLZuDjP/9DZayf7vyh40ZoATlWFu8Evsf0AGzQ6TMlyFJkyaLGebUwwFLE8o=
X-Received: by 2002:a05:600c:1da4:: with SMTP id
 p36mr4566360wms.98.1644446720518; 
 Wed, 09 Feb 2022 14:45:20 -0800 (PST)
MIME-Version: 1.0
References: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
 <YgIXodbEP9hmae6Q@heinlein>
 <CAD1rtg-tTrbjiL76NRDGnAfx36JBM4Rcb2gyUYjROR-2=H+Uqg@mail.gmail.com>
 <YgQcaInEBq8ZBlIm@heinlein>
 <CAH2-KxAyXn3YndZY_aWAMt4M6eTMrkPA91vCPeOj0tZOgPv-vA@mail.gmail.com>
 <YgQuzD9AkrqstygH@heinlein>
In-Reply-To: <YgQuzD9AkrqstygH@heinlein>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 9 Feb 2022 14:45:09 -0800
Message-ID: <CAH2-KxA6MhNXUs+KXAjHTcJe1gWyGwfL+OUQBuCfQnPMSX7GZQ@mail.gmail.com>
Subject: Re: Propose a new application for reading DIMM SPD directly
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>,
 Michael Shen <gpgpgp@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 9, 2022 at 1:14 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Feb 09, 2022 at 12:20:00PM -0800, Ed Tanous wrote:
> > On Wed, Feb 9, 2022 at 11:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> > > On Tue, Feb 08, 2022 at 04:23:12PM +0800, Michael Shen wrote:
> > > > On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > > > > On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
>
> > > > BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I3C) bus.
> > > > From my understanding, BIOS only needs to read SPD during the POST stage.
> > > > For the rest of time, BIOS will hand over the SPD bus to BMC.
> > >
> > > That seems like it might work.  You'll have to deal with the time when the BIOS
> > > has the mux in the BMC code somehow.  Ideally I'd ask for the mux select to also
> > > be fed to the BMC as an input GPIO so that you can differentiate between "we
> > > don't own the mux" and "all the devices are NAKing us".
> >
> > This seems like a nitty gritty design detail that's best handled in
> > code when we review it.  I think the important bit here is that there
> > are paths where this could work without a significant design issue.
>
> Just one subtlety.  I wouldn't expect this, necessarily, to be in _our_ design
> and/or code, except that we'd want to document the GPIO line like we do all
> others.  I was trying to hint that "if I were involved in this hardware design,
> I'd ask for...".  If you leave it out, I'm sure it'll work _most_ of the time
> just fine and it'll be your problem to debug it when it doesn't.

Understood.

>
> --
> Patrick Williams
