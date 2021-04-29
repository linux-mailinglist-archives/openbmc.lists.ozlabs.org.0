Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F8936F1F5
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 23:24:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWT6Z6wHZz301C
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 07:24:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=hTgvd7B9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=hTgvd7B9; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWT6L3KTBz2y6C
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 07:24:41 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id j84so10745517ybj.9
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 14:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eqDs+7Xm8m7/S+OFd9EwIxMCMsM2mC2OOeKOGVcryhU=;
 b=hTgvd7B99MWbj29ywTXeR50UX5ch79u9Dw5EX2oJYkGoqugM2tcaazqgap//Z11Zkx
 KsBYBv07gM3GlVmdAG9+xzdqgKtA1rY22u+rhZjNMUFe7yqH7Ckb3FDo3mhZnppO+eOK
 KwxUlumoaJNsFeNAKz4uomAtlWVDeMtMzs0taTvz3mpi9GcHWLlrxC9+MrgabKm1Ht3X
 RhBZfpFcG1aRvu+w5tb0mciUWXHYwtFKW4E1OdP77Ta2LrAPF7XV8Xurs/izzEOIzCCq
 CNGGdzvLGTpf/C6UDM4YAq3Ge4gN2tVWbTNtVbddchRpsqjlnMazRY40n5LO+Dl7F0mr
 4r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eqDs+7Xm8m7/S+OFd9EwIxMCMsM2mC2OOeKOGVcryhU=;
 b=slXDhB9lK53OpG8vBh3Oowjm+hT5gzMjxH4N1WTrEX6GrsazMbyutRBRkGpBaAV7C7
 nZBdyUhqvaPQ89x2n/I/iaGnhrmtwSFreWOuimPt9g/dZRXHQ/zCJCKSXOYyaTLoIx9W
 3obH+qoILZPNtT0rs98HyqzAMpXqE4wbalQwTGEkRlyajw/oC3820HC811bfZFHRljgc
 lU/b9+vd87hxYXfmFbpMSwQVWZ9Cn5EibCCUBoJzftQAKTx0YZaDBMnmY+l7WQr8rdX/
 vq9Wp2O0zfSx14FDaynAmRooIwISZFi+kBI5/ImF06zBk1SDy2j5ael+tPl+gljpR227
 POUA==
X-Gm-Message-State: AOAM533D9T/sfSGXQaJscH29+lRX4M8VGVx+8tL9L2ziZBZxOPaX7bW7
 u4VY/uRAQ7ljrPo9UsWWQndk3/skbTifZK1VXEqK2w==
X-Google-Smtp-Source: ABdhPJyshKNn3dAtZY7J/Dq3NZAycelzh7f+r8kOJIWYrrBMM4l9KjyxnLgMbLOlL9FdZvN+MjpzsTJZm0TMDLdbfwY=
X-Received: by 2002:a25:bd4:: with SMTP id 203mr2248678ybl.348.1619731476930; 
 Thu, 29 Apr 2021 14:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
 <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
In-Reply-To: <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 29 Apr 2021 14:24:26 -0700
Message-ID: <CACWQX831PF901VVN3-j_6Mh-R3CgQ=uzHmVUvtPsUJFruhGqgw@mail.gmail.com>
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

FYI, both of these return 404.  I'm assuming the permissions don't
make them public yet.

>
> - Joseph
>
