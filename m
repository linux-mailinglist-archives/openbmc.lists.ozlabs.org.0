Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A6F16BBC9
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 09:23:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RX5B5F9MzDqWl
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 19:23:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J/DBN5B/; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RX4K4XzTzDqRW
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 19:22:57 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id y17so5942130lfe.8
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 00:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/MGF0H+lv+0MXNhS663qk1bb7+kBytOh98sa2yUV/A=;
 b=J/DBN5B/kBkLAI7bqtuDQAY+yCJ6xo6RD3xd/r6mlAS3j6CqD+l+fBn4AxOTvAeskv
 Tb9yVhXlEQ64ClAZCDEOwJK8nWUx8jBa804hXWMtwZZvqZP3Eo/DksDpRTiQSC6M0iLu
 +Wg5nM9MKvzNquKNXWJJ8Nb52EXt8HkDO4llwkd5Ieomg/4Eqs16k7mebPCrZ8cTODul
 ZpVsyXao9WlLHuPBUV4sFiCURNP1DRfzPIR2xIevmiIWR5IzDkpXSO/Ec0x5rq8vTzVp
 deM4nsMC6/RWH/nHZe9M6bEk1rENoiVj2G+tRkygSTem8qxyB2jkg8xaSTz14Zn4CBmj
 u7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/MGF0H+lv+0MXNhS663qk1bb7+kBytOh98sa2yUV/A=;
 b=iWdfq7xD6RYulpxlH46DYngmHJJAjtgs7if+syvayDnsoUmMncXFHCHI5SVFMyf2ny
 EY0g1zmSfkWuWvrnJM9pXgxN5YJJwy1Os6ggOQMZl6zhzenL/xi2KLJ9j/Zap3NPLfli
 T523auv1e9184Mx8R7p2zv/64jWJdCBj4jQOR1W89AyyTptNCe9U8F2AEiR5xcZiyO4B
 S1eIgOx6cWTcLnjmP1hC2/4ePQRWjCnb+JhbgH/og+cvOOi9HOjRJoflAEoEnw9vGIH5
 Gxw6wQEgEiq2sKEHhZnp0Cv/KP/KBqHmy0g+nsC1ieLe3aPXCbenY03+BM41QElJ5Smx
 /goA==
X-Gm-Message-State: APjAAAXYZ5WdVsdQJPtKJcc8jhvwYEll1QTDl3ayG3lNZjw83xlCdiAs
 Rt+FMf+ece9yTCyrlIdDenEEn37vc+/FsG7g3JM=
X-Google-Smtp-Source: APXvYqznViFXFlMTpJILNJt8rTZXj/B+hVR+GfX3D5cBXHcTdsuKSdSFPePuyVhgTYEwmmQ0cmdQsE8XPs7UnmI+opk=
X-Received: by 2002:a19:2396:: with SMTP id
 j144mr15719505lfj.113.1582618971905; 
 Tue, 25 Feb 2020 00:22:51 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
 <20200218203934.GB2219@patrickw3-mbp.lan.stwcx.xyz>
 <CAARXrtkwsy3t=bz7wHa=oEG-KwE7dBJ0Upkft-RN9XNgiFdSHA@mail.gmail.com>
 <20200220163830.GD41328@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrt=7=X53tQ33C9+wBkUV7tZXgVZCtf8un7y8wpRxVdVufw@mail.gmail.com>
 <20200224203215.GE67957@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200224203215.GE67957@patrickw3-mbp.dhcp.thefacebook.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 25 Feb 2020 16:22:40 +0800
Message-ID: <CAARXrtnykCRL2EXekwb62aBie6YRQuSLBftZAg2AzheKA0vGug@mail.gmail.com>
Subject: [sdbusplus] To generate client header (was: Re: To generate a common
 header for public information of interfaces)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > > I don't see any reason any code should ever directly utilize the enum
> > > strings.  We generate code already to safely convert them to and from
> > > real C++ enum types.  Why would you want to use string comparison
> > > instead?
> > >
> > > Can you elaborate on why we should be enabling this usage pattern?
> >
> > There are cases for a service to use a "enum string" directly instead
> > of getting the string from enum by `convertForMessage()`
> > E.g.
> > * https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/master/activation.hpp#L43
> > * https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L218
>
> Examples of poor code are not a use case.  Both of these examples are
> trivially converted to convert<enum>ToString APIs.  We should do that
> rather than facilitate unmaintainable code.

My concern to use "convertXXX" APIs is that it requires the client
code to link the server code, where logically all it needs is the enum
string.

>
> >
> > Some of the cases could be changed to use `convertForMessage()`, but
> > if one does want to directly use that, or use it as constexpr, why not
> > provide it directly?
>
> Because it limits our future ability to change the string format.  When
> people decided to reverse engineer what sdbusplus was doing and hard
> code strings, they made it so we cannot change the format of what
> sdbusplus is sending.
>
> There was a commit recently, as an example, that requested we add an
> Intel-only "Management Engine" enumeration to an xyz.openbmc_project interface
> rather than a com.intel one.  If we supported enumeration inheritance,
> there would have been less need for this.  I don't know how we might
> implement enumeration inheritance, but we might need to change the
> "on-the-wire" string as a result.  Right now we're hamstrung by people
> having hard coded strings.

This is exactly why I propose to provide enum strings in by the client header.
Currently, client code (poorly) uses "hard-coded" strings directly. If
we provide the constexpr strings in the client header, the client code
could be "refacted" to use the definitions from the client header.
Then sdbusplus is freely to update the string format without breaking
client code.

>
> > I do not think it's good behavior for a client to include another
> > server's heaader files.
> > E.g. if I am writing client code and want to set a property on another
> > service (e.g. foo.bar), I do not really want to include a
> > "foo/bar/server.hpp", because it's not part of my client.
> > What I want is some constexpr strings, like interface name, property
> > name, enum string, etc.
>
> With the current state of things, programming choices are:
>     1. Include a header poorly named "server" into a "client" code.
>     2. Reimplement what is in that "server" header file.
>
> Under no circumstances is a good approach or one that should be
> encouraged.
>
> > Ideally, sdbusplus would generate the full client binding code. But we
> > do not have that now.
> > So I am proposing to move a bit forward to generate a little client
> > code that would benefit the client's usage. The client won't have to
> > write the full string manually anymore.
>
> So maybe we call it "client" rather than "common"?  Common implies that
> there are header files that are okay to import under any case and I
> don't see that to be the case with what you're proposing we define.
>

Yeah, agreed.

> Again, I don't have any issue with the interface names.  I do take issue
> with the enumeration strings because they shouldn't ever be used outside
> of sdbusplus (or a similar dbus binding).
>

For the interface names, the patch is updated at:
https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/29404
Let's treat it as a start point of client code.

> --
> Patrick Williams
