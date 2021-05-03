Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B67C837192C
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 18:22:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYpCj4kZ8z3027
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 02:22:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=FnEYhcl6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FnEYhcl6; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYpCM3mV6z2yYd
 for <openbmc@lists.ozlabs.org>; Tue,  4 May 2021 02:22:04 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id d11so6206757wrw.8
 for <openbmc@lists.ozlabs.org>; Mon, 03 May 2021 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JEl9RxiYJBySbkxUOZlWufpZaRO+5Ld3N5gVxAjXyN0=;
 b=FnEYhcl6Ui+C264wEK7HBHYd51T2JdebpxKpBFojkuI+nWrGkdI0z1j0EFfbPg5Mth
 g4ULvcGp69pNduaS9jjCR6P1Xz2KX2F6Gzo2HoLzlqOFm42GfYj05tTwSybZH+DgTVQr
 p/puNpTzcPiLLRG0/gRFmqb34SJYQcVbkrE7F5QyDpfF1+vEaqGS87UYWg87V24BXKkG
 1IYoGtYfvWYbZqWgjR8ZZoBFd6eUo0dtdxJWupTdE0LPswZIb8vNVfrFNwQYiepchEjp
 OhbJ8UK7qGuEbUJamRoLxQvM2DJMTEzSwW59Sg0uhnobfGyirLyP4tk3CJeK1q7vue8Y
 ddTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JEl9RxiYJBySbkxUOZlWufpZaRO+5Ld3N5gVxAjXyN0=;
 b=Mg0rQbFFEgzjc/+ejqzcGQrEsyUCcad1sJFkZ/jnEYmSHx1qtI6W0M+2a0PSjDqD7v
 Y+ydP5hw3KiT4EGdi9VYhe7lZDtqltBktlCX4iikZeG8t2ngTdXzdE40Oe2w3saR1BoZ
 A0yh0QZPSzS+ARJtVRQ23/wfR31qxmTS+noIspD+qH+h4JWAKnQvPGdFg4/NIvLjvKUR
 pngRW4OdAQoMn22pUzu9ujY0fH8agafmAJV2wsmGttnyBSxJ8tD26LFf1e4UXKj0HAG5
 S1LGJIGuvZUq6Q+xrpmYZ4b+TvqnTr2z+C8gUNMf5EHuRCCHdcs37Zngc4BclGNOiQu1
 VQfQ==
X-Gm-Message-State: AOAM532RnG0PthqpKX4WpzR0BzQXJhTM00FgEZOGVTs71DyGFdQCr3N2
 kz2Y8UlAAe0w37snHuJduTq2Hqd2MzOB22PO7IKeUQ==
X-Google-Smtp-Source: ABdhPJxcUJBLLgDWzBhrBP0karHsvKQg6fnh57T9wMbkMLde8TyltuoOiznsnsEeFuXX2xljMkuK9y6r6/6NXijDu74=
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr21937474wrj.407.1620058917052; 
 Mon, 03 May 2021 09:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
 <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
In-Reply-To: <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 3 May 2021 09:21:48 -0700
Message-ID: <CAH2-KxC5ivp9WgNubKxGXcW_iTdFOwAGz-5=dwYcRBo_JZr9UA@mail.gmail.com>
Subject: Re: Request new repo for IBM-specific code
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 29, 2021 at 2:10 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> On 3/8/21 12:45 PM, Patrick Williams wrote:
> > On Sat, Mar 06, 2021 at 10:09:36PM -0600, Joseph Reynolds wrote:
> >> On 3/5/21 1:15 PM, Patrick Williams wrote:
> >>> On Thu, Mar 04, 2021 at 09:14:47PM -0600, Joseph Reynolds wrote:
> >>> My first reading of what is there, I'm not sure why typical certificate
> >>> based authentication couldn't solve your needs (but I'm just guessing
> >>> what your needs are).  It seems like you have a root-authority (IBM), a
> >>> a daily expiring certificate, and some fields in the certificate you
> >>> want to confirm (ex. serial number).  I've seen other production-level
> >>> systems doing similar for SSH/HTTPS without additional PAM modules.
> >> Our service team requires password based authentication.  Period. And
> >> they don't like the idea of having to generate a certificate/password
> >> pair for each service call.  But certificates offer the best technology
> >> we have to solve the access problem.  And we are not yet prepared to go
> >> to a certificate-only solution. ... So this is where we are at.
> >>
> >>>> Note the [pam-ipmi modules][] are scoped to the OpenBMC project because
> >>>> the IPMI implementation is shared by all of OpenBMC.  By comparison, the
> >>>> proposed ibm-pam-acf module is intended only for IBM Enterprise
> >>>> systems.  The intended implementation is based on standard cryptography
> >>>> techniques and could be developed into a general authentication
> >>>> solution, but the ACF is specific to IBM in terms of its exact format
> >>>> and content, and I expect it will only be used by IBM and its partners.
> >>> Are you planning to open up the tools necessary to create these ACFs?
> >> No, I hadn't been, but good idea!  We have prototype tools to generate
> >> and read the ACF.  They should be useful to our test team.
> >> There should be nothing secret in the code.  ("The only secret is the
> >> private key.")  I'll check with my security team.
> > My two concerns about hosting a repository for this are:
> >     1. Is it actually a secure method?
> >     2. Is it [potentially] useful to anyone else?
> >
> > WRT, #1, I think we need more details to make an assessment.
> >
> > For #2 I think there is some unsettled debate around "what do we do
> > about code that is only ever going to be useful to one company"?
> > Opening up the tools would at least make it possible that someone else
> > could find this useful.  I think the proposed "Repository Review Board"
> > might work on better guidance otherwise.
> >
> > Beyond that, I just have the normal "is this the right way to be doing
> > this" questions.  You've answered that somewhat with the Certs.  I may
> > disagree with it, but you obviously know your support team better than I
> > do.
> >
> > I recommended some SSH support for certificates before.  Based on your
> > ask for password-based authentiation, I would suggest looking into
> > pam_2fa[1] as a potential implementation as well.
> ...snip...
>
> Let's restart this thread from where we left off.  I am working on an
> IBM-specific design to explain the BMC portions of the IBM ACF design to
> the OpenBMC community.
>
> For item 1 ("is the ACF design a secure method"), we discussed an
> abbreviated threat model in this email thread.  From the service
> organizations point of view, it only allows authorized service reps into
> the service account.  And from the BMC admin's point of view, they can
> either lock out or authorize the service user via how they handle the
> ACFm but they don't know the password so they cannot login to the
> service account.
> The ACF features including its digital signature, matching system serial
> number, and expiration date -- all of these limit which ACFs a BMC will
> accept.  The new Linux-PAM module login is a straightforward decoding
> and validation of the ACF, and then checking the password hash.  We
> discussed using pam_2fa in this email thread, and I believe it only
> trades the complexity of a PAM module (which I regard as
> straightforward) for the complexity of a REST server.
>
> For item 2 ("is it useful to anyone else"), the answer is no.  This will
> ever only be useful to IBM and to vendors who clone OpenPOWER systems
> including IBM's approach to service account access.
>
> So ... does the GitHub OpenBMC organization host vendor specific repos
> (perhaps github.com/openbmc/ibm-misc), or does the source code go
> somewhere else (such as IBM's public fork in
> github.com/ibm-openbmc/pam-ibm-acf)?
>

Is there a design doc for this yet?  I'm not feeling like there's
enough details on what "ACF" even is to understand whether a new repo
would be warranted, or this is something that we want to support.  I'd
like to understand all the components that we'd expect to change, and
how we can ensure that the abstractions are good enough that we don't
break or cause security vulnerabilities to anyone else that's not
using this feature.

> - Joseph
>
