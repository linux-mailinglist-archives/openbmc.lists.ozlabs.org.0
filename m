Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6668F671BE6
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 13:21:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxlGl1XShz3c4c
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 23:21:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=mpN523Ag;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=mpN523Ag;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxlG65L1Qz3bk8
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 23:20:29 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id 127so8753270pfe.4
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 04:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ4W5mgF31lAS6NBJVTpypR8zh/ZkHQGkGcEy6umXhw=;
        b=mpN523AgerbkShSxiMTE8wc5+gbWrLqlBWVRkBRxdj1xo3TiqDpa4FqwChsPwVfIn8
         VukxSjOScfNX03pBiqw/BiIIT/eJL/x8GW/uzOTYgJhzKj8pqR8Rk96fMC1chc9G6wYF
         10oHf8FcOnlPgBzF/RrtL4YwRtW1I4aPptsfPd1s9w19vXcpM2ODfXgo0SXl/r3wUbMl
         62jZqeDbzDfNHCM7bh0gfSDVDeQYZgeNHu+5xwhNTS4e6JtUWIaQNxmwTq3meK3aaTwD
         mkjarqOktRD7UxWm7yoiCHu/CfQAFAGXLgSpKVlg2Iqo1ThSwy9zM18/Igr1NXgXFxRs
         7M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQ4W5mgF31lAS6NBJVTpypR8zh/ZkHQGkGcEy6umXhw=;
        b=4NyVVDPJYVRbp83+tqTYozdwPWtCiFwzVLsZ0fhYhCrHfd/868hfktxcSZr2w6V0aA
         xP66b1r8gs8OkE4Qm/YvbQyhRwVSMQWKdGl+3ptS0dfTBYLzRWC/c8S63ocemKmri4PH
         dvtdD6GsQ9gU4TMtDVnKpi7Ovpf7qRclULR9n9k8FfqMlL4SxfYOcuU2nQn0unulruJM
         kx5bM9VfzEgSX8LHUJ+LIQ4WQv9N8hsxzNMMI7VW/TZHqNO6LsUIIMZOajFZflgUra0H
         UtRFaROR0lrjb/vxL5Cn31tMCm5Lcddw/TvSQiKSHejwHPjWoMQhXw2/2NR7zbh3QdEA
         TBDQ==
X-Gm-Message-State: AFqh2krew7mmJtGveenjI8YWYjuSpaFcJOtV8HBlphQCeYd1kstkqeTV
	9AqdNfp+5lD/vHb3H0VrrDLK9OV3GGMZVw4NKKXHdxh7B2z2KsfMUjM=
X-Google-Smtp-Source: AMrXdXt8i+rs4dl+MWjDyGRPwQsYN4IfddK6oVnjttUbiJ8315yImsiuinBr3ZpbPXUNLlXJn/EEQKXzFvT/YBqj410=
X-Received: by 2002:a05:6a02:284:b0:46f:59af:c1f4 with SMTP id
 bk4-20020a056a02028400b0046f59afc1f4mr466732pgb.344.1674044425008; Wed, 18
 Jan 2023 04:20:25 -0800 (PST)
MIME-Version: 1.0
References: <CAGm54UG=i8Ym-23N7R468xCsH3px5QAr52+zY+1MULBYVcf3Xg@mail.gmail.com>
 <Y8fhtUlvD05Z3qop@heinlein.taila677.ts.net>
In-Reply-To: <Y8fhtUlvD05Z3qop@heinlein.taila677.ts.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 18 Jan 2023 20:20:13 +0800
Message-ID: <CAGm54UF56JjS8+OxEsEYvNDyP8yN_aa=kTqUtfpAgjdq5VBqCg@mail.gmail.com>
Subject: Re: BMC image generation without private key
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 8:10 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Jan 16, 2023 at 05:53:40PM +0800, Lei Yu wrote:
> > The OpenBMC build requires a private key to:
> > 1. Generate the public key that is put in the image;
> > 2. Sign the image and generate the whole tarball.
> >
> > For dev builds, it uses the insecure development key in the tree.
> > For release builds, it requires the `SIGNING_KEY` env to point to a
> > secure key to sign the image.
> >
> > It is considered insecure because it requires the build server to
> > access the private key.
> >
> > An alternative is proposed:
> > * A new `SIGNING_PUBLIC_KEY` env is defined to point to a public key.
> > * The above key is default to empty, and the behavior is the same as
> > before, using the insecure development key to generate and sign the
> > image.
> > * With a valid `SIGNING_PUBLIC_KEY`:
> >    * The public key is installed into the BMC image.
> >    * The generated tarball is not signed, only containing the MANIFEST
> > and the image.
> >    * A new `gen-bmc-tar` tool will be introduced to sign the above
> > tarball, like `gen-bios-tar`.
> > * If both `SIGNING_PUBLIC_KEY` and `SIGNING_KEY` is set, throw an error.
> >
> > With the above proposal, the build does not require the private key
> > anymore and the user could install the public key during build, and
> > sign the image separately.
> >
> > Comments are welcome.
>
> I don't have much opinion on this if you think it is the right direction
> for your purposes.

The patches related to SIGNING_PUBLIC_KEY are sent to:
https://gerrit.openbmc.org/c/openbmc/openbmc/+/60336
https://gerrit.openbmc.org/c/openbmc/openbmc/+/60337

The singing mentioned above is related to the tarball and is verified
during BMC code update.
It does not involve the verification on BMC boot (which is a different topic).

>
> My companies' existing signing system does not rely on the signatures
> done during the build.  The output of our build is a single MTD image,
> with a FIT image.  When we want to sign the image, we [external to the
> build] extract the FIT signature device tree, re-sign it, and update the
> MTD with the new signature set.
>
> I've recently added some of the code upstream that eliminates the
> separate rootfs and puts everything into a single initramfs.  This is
> still in-progress but I plan to have it mostly complete by the end of
> the month.

This is interesting, this means a new flash layout, is it?

>
> 1. https://gerrit.openbmc.org/q/topic:no-rootfs
> 2. https://gerrit.openbmc.org/c/openbmc/openbmc/+/60110
>
> --
> Patrick Williams
