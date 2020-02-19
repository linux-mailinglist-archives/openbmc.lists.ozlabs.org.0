Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA2A163A9F
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 04:00:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MjC71l3ZzDq8X
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 14:00:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O6KsYx5/; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MjBR2JN4zDq7j
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 13:59:56 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id z26so16096334lfg.13
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 18:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=24Q5Mo8S7J7FH72SQvKOKofg+Ec92gYEcvE+9d1hMug=;
 b=O6KsYx5/YMfBR/Bdti1hWZEgv91v9oSzaz4wA4C7SfRdCd0asbrqWvjvpwxZx8vyoy
 N4Laoevs5Rans8fore3bW7sKL6xfftdV4/R8Hbf4hzfmahsgs7ZVEwVtvDBTSYbE2RuK
 cQ+25yNLl2Uyz0dPGoKYJt31A8IWojG11mt3ZGngp9uIzbZ+YshUnbb9vLgUflFm+2TG
 bjGomiUUuRqqeXNm8M4zlj7wa0HlSt3xmCK2gTIgvh82p358bfqV7Sa17MIt9K01Eky/
 4T4lZTcrMRXsKtyvOQ5fwjKsWFlHNbZQaccElYJelBrasQWGKuQXGAC/c9M1qp5arsuH
 PWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=24Q5Mo8S7J7FH72SQvKOKofg+Ec92gYEcvE+9d1hMug=;
 b=nsorJQJIB2ZYr+HoM14aELWW7wQjwJOxfLlhLjWShdHqhy/6SI/1KjAsILZtjzVBpu
 8iP/YWc3pnNbCqNTdUS1aaaOxAm7MQ1LTLLH7XIai1iulS5z8mGAAxiFb7m0EaMvK0G1
 Ube+kdRfLVMOi0nmI2OGYgEmN6BrXejVCfl1VbgI5ZGyDtSfVlSMt5Me6Y5HMRzAVrR0
 3WPdaUXzSU7gOxi2a//9ECM9BMkvEefDXYt7lM81xX0E1LJO7+0lkfmB0Fx4d4LBtrSc
 92F1BPtlye0PjQs8rv8GO/QK+3xtNiEUpqToins3NRXiMyiCnCl61vA0747y3n33YWMA
 6nwQ==
X-Gm-Message-State: APjAAAWLeffVPjyCSNzb56Gwya5X/HLfK0UefknGLgmOuhEtHl7VtMVV
 WGohQf+ITbar8xvfQ4RE7y+CXPM/qeqpkoLXq5QJQEjK
X-Google-Smtp-Source: APXvYqzyGzl1l4bPg6plPMVYHnzU3wCy2qrvRgMl8IVZYVSo348KKiKp1xGsYyRmWQ9ilYZf1axHfa1k0c/wA4wKr9c=
X-Received: by 2002:a05:6512:1047:: with SMTP id
 c7mr3157858lfb.78.1582081191666; 
 Tue, 18 Feb 2020 18:59:51 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
 <20200218203934.GB2219@patrickw3-mbp.lan.stwcx.xyz>
In-Reply-To: <20200218203934.GB2219@patrickw3-mbp.lan.stwcx.xyz>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 19 Feb 2020 10:59:40 +0800
Message-ID: <CAARXrtkwsy3t=bz7wHa=oEG-KwE7dBJ0Upkft-RN9XNgiFdSHA@mail.gmail.com>
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

On Wed, Feb 19, 2020 at 4:39 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Feb 13, 2020 at 10:38:37PM +0800, Lei YU wrote:
> > Currently, sdbus++ generates the server code separately, and in
> > phosphor-dbus-interfaces, the separated headers are installed, and the
> > separated cpp files are combined together, and compiled as a library.
> > The public information of the interfaces (e.g, the interface strings,
> > the enum strings) are either in the separated header or in the cpp
> > files.
> >
> > The result is, when a phosphor service needs to use an interface, or
> > an enum, it has to define the interface string or the enum string
> > manually, and it happens everywhere.
>
> I would say any case where this was done should have been fixed.  There
> were already functions in sdbusplus to convert<Enum>ToString and
> convertForMessage(<Enum>).  There are lots of cases where these are
> being used today[1].  You recently made the interface public as well, so
> we should begin converting these over.
>
> I've also got commits pending, for merge soon, that make the enums be
> supported as native types, so code should rarely even need to call the
> "convert" functions anymore.  Another refactoring once that is merged.

The idea of my proposal here is not to use "convertXXX" functions,
instead, it is to provide the constexpr strings that could be used by
client code.
E.g. the client code does not need to call any function, but directly use:

* xyz::...::server::MyServer::interface, instead of a user-defined string
  for the interface.
* xyz::...::MyServer::MyEnum::Enum1, instead of a user-defined string for
  the enum.

>
> >
> > How about
> > 1. Making sdbusplus to generate a "common" header for each interface
> > including the public information;
> > 2. Then phosphor-dbus-interfaces could generate a single header file
> > that includes all the public information of the interfaces;
> > 3. Then the phosphor service could include a single header file, and
> > use the interface/enum strings it needs, without manually defining
> > them?
>
> Currently only the 'server' interfaces are generated and some clients
> are including the server header files even though they are a client.
> The intention all along was to make proper 'client' bindings but there
> hasn't been sufficient effort put into that yet.
>
> I'm not sure if it is better or worse to have an explicit 'common'
> header rather than the two separate 'server' and 'client' headers.  Is
> there any reason to not simply get started on the client headers?
>
> Some pro/cons of 'common':
>     - Have an extra pass we have to run through 'sdbus++'.  This will
>       probably make the templates more complex (3x code paths rather
>       than 2x).
>
>     + Explicitly consistent types between client and server bindings.

Yup, the implementation is actually part of the "client" header, we
could rename the "common" to "client".
But preferably, we could combine all the client header into a single
header, which makes it easier for the client code to use.
If a client needs to set an enum property to a service, it then does
not have to include the server header nor the specific client header,
but include a single header.
Anyway, this part is done in phosphor-dbus-interface.

So we could say that sdbusplus generates part of the "client" header
instead of "common" header.

>
> >
> > There is an initial concept implementation:
> > * https://github.com/mine260309/sdbusplus/commit/78cb63fb7e1ceb62165c71e15779f23f7e9f166c
> > * https://github.com/mine260309/phosphor-dbus-interfaces/commit/6079d25547f0143fc7562a1c7ee6beb888a66432
> >
> > With the above changes, a service could directly use the generated
> > interface string, e.g.
> > `sdbusplus::xyz::openbmc_project::Software::ApplyTime::interface`.
> > In the future, the enum strings could be put there and thus we do not
> > have to manually write the long full qualified string.
> >
> > Ideas and suggestions are welcome.
>
> [1] https://github.com/search?q=org%3Aopenbmc+convertForMessage&type=Code
>
> --
> Patrick Williams
