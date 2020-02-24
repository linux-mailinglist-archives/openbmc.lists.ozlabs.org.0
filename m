Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4B4169C9F
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 04:26:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QnYB6JNHzDqKg
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 14:26:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UtwqCj6F; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QnXH43DzzDqCZ
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 14:26:04 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id z5so5706505lfd.12
 for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2020 19:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Omtg95rS3IjFxSKKUD43xXvS80mqCOInwW9uyEptRx4=;
 b=UtwqCj6F6PsQD17wlvXI6o9Uu4J+dwtc2Kb7Jya2cpj5JQyZKet0XCoyuVbHrjarMO
 0kVgqIoMRX2yB8isuD9WHhqi1vz9bfh51S5ca2iyHSryVuY21HB2+4OUDGlK0hCgVwOp
 l6NVut6GLzea6Jyep9aD82gsm5BFsH+hMr7X9904NOfAn0saNU+njsZWJMhwBRNqUvSb
 05ogPECSHj2aPPiGFVqv70YG/E4g9F3Xay8T+7mwwVkhRXkv2/IT9j4vSwCPlbo1vb7u
 +6j4bGgTFd2YdNaD2SK7cn5x48kdECJvtI0iH3HR0AHFLbd9WzFz+CZkX1plicosQY6f
 d3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Omtg95rS3IjFxSKKUD43xXvS80mqCOInwW9uyEptRx4=;
 b=ZgIRfb+rIHuuRuW+XzDz8OPCna6W+mwA7MkMnCf1/52om+Atn9pIE9gYpu0u17ABy9
 JXXGgbAfLPIpyFJQD7Cr+5+dhufHXpv7NsfFY/Lx1gAKaqFnhlvQcxA4UL163lqg6ltt
 yPcjy5ez213Xu1PGWvqUYWvQ3Nt3eQYaMiQqNCnorMA0/WoHJjWyWYxP08nm4hXIfQJr
 zCwRzxmPuj37lF2E4nRaAV14rJxEBwPu92uGEK3iJ01v+KobuxwnIwQI3Revkl5m0q16
 DKafzZEDXjhGQWRFx4aHhTkEH20REYqo0UK5vztJMMgQu24mwJmiQ69OlDDtujSJS/gH
 7GUQ==
X-Gm-Message-State: APjAAAU8QDNY0RCPl6CKo7sRG4q/z6yJ1+EDnzyYkVlCiXIoZ18/PTjP
 90PixV2/9iQzf2eZZMgnE8tAhegkgBp038dCqIQ=
X-Google-Smtp-Source: APXvYqzHOzTXUhCFT4YK6bK6m0JtOl3zcyvkyuajZIl3yZWDr+NfyUxxU86WRVf4xSCrUdzPY/OaJqu1OwsOErBdLBU=
X-Received: by 2002:a19:2396:: with SMTP id
 j144mr12077300lfj.113.1582514759718; 
 Sun, 23 Feb 2020 19:25:59 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
 <20200218203934.GB2219@patrickw3-mbp.lan.stwcx.xyz>
 <CAARXrtkwsy3t=bz7wHa=oEG-KwE7dBJ0Upkft-RN9XNgiFdSHA@mail.gmail.com>
 <20200220163830.GD41328@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200220163830.GD41328@patrickw3-mbp.dhcp.thefacebook.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 24 Feb 2020 11:25:46 +0800
Message-ID: <CAARXrt=7=X53tQ33C9+wBkUV7tZXgVZCtf8un7y8wpRxVdVufw@mail.gmail.com>
Subject: Re: [sdbusplus] To generate a common header for public information of
 interfaces
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

> > The idea of my proposal here is not to use "convertXXX" functions,
> > instead, it is to provide the constexpr strings that could be used by
> > client code.
> > E.g. the client code does not need to call any function, but directly use:
> >
> > * xyz::...::server::MyServer::interface, instead of a user-defined string
> >   for the interface.
> > * xyz::...::MyServer::MyEnum::Enum1, instead of a user-defined string for
> >   the enum.
>
> I don't see any reason any code should ever directly utilize the enum
> strings.  We generate code already to safely convert them to and from
> real C++ enum types.  Why would you want to use string comparison
> instead?
>
> Can you elaborate on why we should be enabling this usage pattern?

There are cases for a service to use a "enum string" directly instead
of getting the string from enum by `convertForMessage()`
E.g.
* https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/master/activation.hpp#L43
* https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L218

Some of the cases could be changed to use `convertForMessage()`, but
if one does want to directly use that, or use it as constexpr, why not
provide it directly?

>
> > Yup, the implementation is actually part of the "client" header, we
> > could rename the "common" to "client".
> > But preferably, we could combine all the client header into a single
> > header, which makes it easier for the client code to use.
> > If a client needs to set an enum property to a service, it then does
> > not have to include the server header nor the specific client header,
> > but include a single header.
> > Anyway, this part is done in phosphor-dbus-interface.
> >
> > So we could say that sdbusplus generates part of the "client" header
> > instead of "common" header.
>
> Agree, but we don't even need this code now if people were just
> including the server header files (and there are many examples of
> clients doing exactly this).  If we're not going to create client
> headers now, this seems like wasted effort just for some slight syntax
> improvement.
>
> We could simply symlink <xyz/openbmc_project/foo/server.hpp> to
> <xyz/openbmc_project/foo/client.hpp> and add a `namespace
> xyz::openbmc_project::foo::client = xyz::openbmc_project:server;` and
> get the same syntactic enhancement without nearly as much work.
>

I do not think it's good behavior for a client to include another
server's heaader files.
E.g. if I am writing client code and want to set a property on another
service (e.g. foo.bar), I do not really want to include a
"foo/bar/server.hpp", because it's not part of my client.
What I want is some constexpr strings, like interface name, property
name, enum string, etc.

Ideally, sdbusplus would generate the full client binding code. But we
do not have that now.
So I am proposing to move a bit forward to generate a little client
code that would benefit the client's usage. The client won't have to
write the full string manually anymore.


> --
> Patrick Williams
