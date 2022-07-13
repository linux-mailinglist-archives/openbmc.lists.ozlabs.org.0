Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674A7573B33
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 18:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjjhJ1gdVz3c4G
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 02:27:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nJ5BNGa+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nJ5BNGa+;
	dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljjgs2JXwz3c38
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 02:27:03 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id i2so6914703qkm.8
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 09:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G6D8lzzaDRFsvj1Y4Ov2buN9VB7UWiExbHjJyG6fARM=;
        b=nJ5BNGa+ApSXjQhNAq4Kv3y1fgG+xnRy0znvPWQR9VIdnF1zpMlW1LtZOh/GwBLzHL
         lKHg25O9pXrWah56kUjm5kKJrzEzv0isKKlF3DyJZbtVcGgoi/9r16wP8P5ovfwtlg+b
         eOd8qnAiGCynZovupRR14bp4XcN4koc2fWCCufGfjxEYKyb5/S9mtZeAUrZI0wOhMsN6
         NXAcNSnHDopGgJO5YFTk+YDIn5jdGSGx2TuYrxMyhSBMjJABV5D79Rep2wLYe0QMNzMV
         E3AkaWgCSTEMgDJ1pIZhRWPMaiIWOXfVMGPMF9iLDO1sa7j4X6/FHdWXT0OwHOM6CHAJ
         hLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G6D8lzzaDRFsvj1Y4Ov2buN9VB7UWiExbHjJyG6fARM=;
        b=8DNDv/fJdvci6unTLBt0gRFpvCPSAR//7c81lgVZv+kMaqoPuRoUFc4dArDuL/eAhw
         bPDOnXucevraXPwo+k0eETGCsAVxCtSo5fBCLyJEGe1bgxAL1lwO4xB8gQt0qvyMtwxw
         kQlyRzn5ag5drxehEvMfSWXq6npgCWdJr9UbMUjIb0BGNskUmQQTonFRI9sNPCQn0dvv
         jXoB2wgv1Q6bowkQR3yhHJsbLZuuFY6ghpqTycgxpiBPzBWuORksqOt/ch1Hsxq644+i
         Giku6O08OB2eWJH4C9GNPfEZDNwnkltb4Pn6wYNUSST63n7QPOHa4ILS0Km/wiRj2kNe
         41jg==
X-Gm-Message-State: AJIora+klmqRmGteFDznN7qFoeOtRIQ86au7VCOB0a90Oc3vASaSFy82
	7N5wbDhigOtmXe2JrjnaJ4sfFFMVjYE6L5QZr+Xwng==
X-Google-Smtp-Source: AGRyM1v/0UxbQvhBoD7yZh/PY3Bdom+kmeDIyXyUX2l0kudYv7l24WnmKgh8DPeetGT0y18/6If1W1+O+rEDVUHYz/w=
X-Received: by 2002:a05:620a:4482:b0:6b5:a60f:4701 with SMTP id
 x2-20020a05620a448200b006b5a60f4701mr3019341qkp.61.1657729619235; Wed, 13 Jul
 2022 09:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <CALGRKGMTT4Rb-VzxBh-2zQKXkDHH7Cye1YzqyHxJZp-09A=ggA@mail.gmail.com>
 <Ys6zBXR+8AP3wjYG@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Ys6zBXR+8AP3wjYG@heinlein.stwcx.org.github.beta.tailscale.net>
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 13 Jul 2022 09:26:48 -0700
Message-ID: <CALGRKGNrWOy=nVeOjLsi+7vHJ00+X12E8yg64e0L5+EdhFJ9WA@mail.gmail.com>
Subject: Re: Request to add "meta-google/recipes-google/console/glome_git.bb"
 to auto bump
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the insight, agreed on not using AUTOREV (which we don't
do, and thus why we had to manually bump a year's worth of change
here: https://gerrit.openbmc.org/c/openbmc/openbmc/+/55214) and I
guess it gets fuzzy on what the definition of a  "well-maintained open
source projects" is.

I'll see if I can figure out what the process of adding to Yocto / OE
meta-layer is.

Thanks,
Brandon

On Wed, Jul 13, 2022 at 4:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Jul 12, 2022 at 11:42:58AM -0700, Brandon Kim wrote:
> > Hello,
> >
> > Following the instructions in
> > https://github.com/openbmc/docs/blob/master/meta-layer-guidelines.md#dont-use-srcrevautorev-in-a-recipe
> > we'd like to request "glome_git.bb
> > <https://github.com/openbmc/openbmc/blob/master/meta-google/recipes-google/console/glome_git.bb>"
> > to be added to the autobump list if possible (or let us know if the
> > instruction is outdated - or if there is concern for adding a meta-google
> > recipe to the autobump list). It points to a public github repo under
> > google: https://github.com/google/glome
>
> This instruction is correct still.  You should never use AUTOREV in a
> recipe.  It makes it so that builds are not reproducible and at a
> minimum breaks the release process.  When we make a release we'd have
> to make an additional commit to pin all the AUTOREVs, which we don't
> currently do.  If you look through the entire tree, including all the
> Yocto meta-layers, you shouldn't see any examples of using this in a
> formal meta-layer(*).
>
> I don't think we should add glome to the autobump list.  This list
> currently only contains recipes under the openbmc org.  Honestly, glome
> shouldn't even exist in meta-google[1].  There has been some discussion
> about what does "well-maintained open source projects" mean, but lately
> we've been interpreting this guideline to mean "nothing outside the
> openbmc org".  The expectation is that if you really are pointing at a
> "well-maintained open source project" you should have no trouble getting
> it put into meta-openembedded instead.  This saves us the trouble of
> having any debate about what is / is not "well-maintained".
>
> My recommendation would be to move glome to a Yocto/OE meta-layer and
> deal with them for updates because that is what we've been suggesting
> for anything not in the openbmc org lately.
>
> (*) I do see one in one of _our_ meta-layers and this needs to get
>     fixed... one of the problems of opening up machine metas to almost
>     any company who asks with little review oversight.
>
> 1. https://github.com/openbmc/docs/blob/master/meta-layer-guidelines.md#meta-layer-recipes-should-only-point-to-well-maintained-open-source-projects
>
> --
> Patrick Williams
