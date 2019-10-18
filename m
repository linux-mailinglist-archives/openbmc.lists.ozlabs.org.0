Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD76EDC6A5
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 15:56:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vndN15L2zF0Tr
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 00:56:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y6xdvJ6X"; 
 dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vncL0NHwzDq60
 for <openbmc@lists.ozlabs.org>; Sat, 19 Oct 2019 00:55:43 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id x3so5290230oig.2
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 06:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lMtqIMXjbn3huoy5L6bf1STuC2ELwg7grbNBKN9Jplg=;
 b=Y6xdvJ6XPMCubY/AnlSG+NqDC8BW1Eb9PXJiNTrfUz6hSv5gRVrjqm2TOt3fGYKDJV
 QQ3CtWhRAs89AjGmog4IlPzym9OHx5AI5aoGlH0z73l2i16F13WShhHCpIHhfMuqKO0N
 SQnF1HIlfZ6D99FydLSaT4ovOD1Q3KVquk541ScgbaWgseTutEqtctPFfBabILzVRNvP
 ZwZ9UtqC7ltB1U8z9zmtqv0VQYafpjZiN2SyCme/OFGxazCHj0OsmFdANWChC1rPJzpT
 hpIwcP7T77fnZJocXEr4hGz7Pso8jVNx9XEMgDjyvNocjUvvyVaguxjjRC7FzJAY+f16
 2pUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lMtqIMXjbn3huoy5L6bf1STuC2ELwg7grbNBKN9Jplg=;
 b=d6SS8IUZFeF0TlriZpm6oa3076m3KQedsIc4xuXAvvIis3a0btGsrZ3uIx6/TyFfX0
 ygFBqwu0bico5wQbHSIR1xvzotaH84q7p5l9vyINEz29w6KseEPL9vYTGHCWR4/YqPr5
 ZG++kToa/jX6ooTAvrn/nLpUEITsQ45h8tLBV3Efof0atYVYJI4qZy5soKENpyZc2TYi
 CBL056VzyEzM8ODU+8sSN4MBWsQ90u76V9lqq+oO4XcIyaD5JIul4OcErgkxXs3PfV9J
 ZLF6/+PHZc4mp8h+kG5UKQqgNxIbB6Be73NIO6sTiNeljzI6CAHeccIg5KvdGF8P3lcr
 si3g==
X-Gm-Message-State: APjAAAWJtqG7Z1WJ0IdvSOimY7Ywv1ZI7CR9FNGZBj5zCfOyhW0A+i9d
 5LxvU3Kt/1/3rtfSeLVtBIJaHGzQyjEcG4DQy5A=
X-Google-Smtp-Source: APXvYqwdeMGAezWahEBjyo2VrEvyhk6aWcHTRklnwgGwCCvQ7hK2zODRr2F5/6Ldoi09jzIMQtckFDQGMUgYQRyK49Q=
X-Received: by 2002:aca:cfd5:: with SMTP id f204mr7985481oig.42.1571406940302; 
 Fri, 18 Oct 2019 06:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <CANPkJS9muk9j6whELvOzsqx6-fko8LgpZCmx=aCwqf7Y4g1xWQ@mail.gmail.com>
 <CAARXrtkGAe4AxjqAjMzy6wR8US57akfnQvePVLO=gtJr39K6cQ@mail.gmail.com>
In-Reply-To: <CAARXrtkGAe4AxjqAjMzy6wR8US57akfnQvePVLO=gtJr39K6cQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 18 Oct 2019 08:55:24 -0500
Message-ID: <CALLMt=pFHOf3peOJ5nQ8C0oOSS5ga2f_JG-6raibjc6F_rvRbw@mail.gmail.com>
Subject: Re: Question about Gerrit push certificate indication
To: Lei YU <mine260309@gmail.com>
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
Cc: Josh Lehan <krellan@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 17, 2019 at 9:17 PM Lei YU <mine260309@gmail.com> wrote:
>
> On Thu, Oct 17, 2019 at 2:17 AM Josh Lehan <krellan@google.com> wrote:
> >
> > Hi there! I have a question about Gerrit for OpenBMC.
> >
> > In Gerrit, when I look at a change that I'm the owner of, under the "Owner" line of the left sidebar, there's now an orange question mark circle. The mouseover text reads "This patch set was created without a push certificate".
>
> I have the same question.
> I am no gerrit expert, but it looks like it's related to we are not
> using signed push.
>
> I tried to sign my commit and push to gerrit with --signed, but it says:
>
>  fatal: the receiving end does not support --signed push
>
> So it looks like the OpenBMC gerrit does not enable signed push:
> https://gerrit-review.googlesource.com/Documentation/config-gerrit.html#receive.enableSignedPush
>
> @Andrew Geissler Maybe let's enable this option so we could sign and
> push a commit?

Sure, I'll add this to the TODO list on my next gerrit maintenance window.
