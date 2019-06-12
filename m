Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FC541A00
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 03:42:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NqPd4bY8zDqy6
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 11:42:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jx1y86q3"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NqP51kLPzDqtS
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 11:42:14 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id u13so11639042iop.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 18:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WKlDhgLH60a043n+C/PTaGj1btWnr10MF6yYNSYM2kc=;
 b=Jx1y86q3gBa9IQ4PYcCYyB1m20rVS+VoQD9NhYHngQJ0hjEtnzlYHpRAWH+bLXBjKx
 P96NZtCawLNGVVSSPvo4AuynK7uw6U0MBipRwjGnchnj4bVdaUHDfpNycFRML/97hkFf
 x+sPGtgCPFbx/dVQ/3eC5V5+XIPObiRbaA2z47pUMGR033PQkjUzieXSVTU5IrfbtdCL
 PpjJOtLqdOiI/KXgGiEHv6Un1v3V1lXqX1YtqEBEYNY8eWdk1VNCeNAfutcWk5YO75Ay
 FKrCV2FDsf9Dx8vH1eECPjuvHnljZc8AnoE1C9kyaPS21tBDIwphVFuTeNHbagPQVeRM
 oCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WKlDhgLH60a043n+C/PTaGj1btWnr10MF6yYNSYM2kc=;
 b=CX+0tCPmoQd/XN4Jke3VN306bG9l5zHp5XURdOlEhc6M+V7ct+T15mGm/qg1yVOLR8
 9ZMbEPvYZLBgfyusJvDZPsyGQF1sA66EgsqELhRUhm5LcvdXnCmn/AVDq0OjCfD9R1wV
 dgBhzsqm9Fo+Ml6PYNUaDwuChj2Yx1uF4E/Fuy/FpyuP5ehyUXhNgj2MCgy/oYFb4hdj
 9gVGg4rHHWAqNB81mLafNzX+UhxUkUwwd/1gZuJy5FfwLGtWwczDMHwqqrbTuwbV0fcD
 QN3sGXUQZe7VdIhsWSH088laixYPZydqSMxVcv96Q0HEWNHMQgil0DjOPq//axYUSiS6
 R2rQ==
X-Gm-Message-State: APjAAAV5dt7SCOJpJQtpwbstscI7IIVg86z9Vy0GanwvvSz2UyQpLlsA
 6ETR4L6yWzpkIGZIHx6KOIvbTVjIJZ6imi9y6sE=
X-Google-Smtp-Source: APXvYqzxk5Cccpc1ILGkL4seXqTVHV0PJa/GmHWvbYxRMKHUrZHVmHPyMrxZ8Vw0fuuSvzZ3Ekx5tv1iR6nL2PsCXiU=
X-Received: by 2002:a6b:4101:: with SMTP id n1mr1674797ioa.138.1560303731254; 
 Tue, 11 Jun 2019 18:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrtkeMTts2GXpqjwNM6danj0jZoZVnkvJLKgo=416LheqRQ@mail.gmail.com>
 <d99f8d73-f648-df65-2c87-00f398e6dd35@intel.com>
In-Reply-To: <d99f8d73-f648-df65-2c87-00f398e6dd35@intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 12 Jun 2019 09:42:01 +0800
Message-ID: <CAARXrtnQEwJGhZo1ZO8M-x7PkgxP75QpDcKZtj=bOBXJJjoZHQ@mail.gmail.com>
Subject: Re: About the external project of sdbusplus in bmcweb
To: Ed Tanous <ed.tanous@intel.com>
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

On Tue, Jun 11, 2019 at 11:55 PM Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 6/11/19 2:29 AM, Lei YU wrote:
> > While I was adding some new function in sdbusplus, it's found that bmcweb is
> > not working correctly, that it always gives errors like below.
> >
> >     Jun 11 09:14:26 romulus bmcweb[1501]: terminate called after
> > throwing an instance of 'sdbusplus::exception::SdBusError'
> >     Jun 11 09:14:26 romulus bmcweb[1501]:   what():  sd_bus_process
> > discard: org.freedesktop.DBus.Error.AccessDenied: Operation not
> > permitted
>
> It should be noted, I am not seeing this behavior in my builds.
>
> >
> > Then it's noticed that bmcweb is using its own revision of sdbusplus during
> > build, as external project in "CMakeLists.txt.in"
>
> https://github.com/openbmc/bmcweb/blob/6ca6ac12e62bd8bfbdb9a24bbfded4a138a1150a/CMakeLists.txt#L9
> https://github.com/openbmc/bmcweb/blob/6ca6ac12e62bd8bfbdb9a24bbfded4a138a1150a/CMakeLists.txt#L142
>
> Notice the YOCTO_DEPENDENCIES option.  When bmcweb is built within yocto
> (which should be a majority of the time), it relies on the sdbusplus
> version that yocto has decided, and ignores its own.  The
> CMakeLists.txt.in is only used when building out of the yocto tree, to
> enable static analysis tools to function without having to static
> analyze the entire codebase.

Thanks for this information, I did not notice that.

> >
> > It's worrying that one should expect that the whole build of OpenBMC should
> > use a single sdbusplus lib defined in
> > meta-phosphor/recipes-extended/sdbusplus/sdbusplus_git.bb, but apparently
> > it's not for bmcweb, and that results in the weird behavior.
>
> See above, my understanding is that bmcweb should be using the single
> sdbusplus lib.
>
> >
> > When I change the "CMakeLists.txt.in" to use the same revision as the one in
> > sdbusplus_git.bb, the issue is gone and bmcweb behaves normally.
>
> This is really confusing to me.  When building the openbmc image, this
> should have zero effect.  Can you verify you're building with "bitbake
> obmc-phosphor-image"?  What machine are you building for?

What I was doing is:

1. devtool modify bmcweb
2. Go to build/workspace/sources/bmcweb, modify the code
3. bitbake obmc-phosphor-image

So it looks like when bmcweb is being built with devtool, the
YOCTO_DEPENDENCIES is missing, is it?

Be noted that devtool is a yocto tool, see below reference:
* https://www.yoctoproject.org/software-item/devtool/
* https://wiki.yoctoproject.org/wiki/TipsAndTricks/Patching_the_source_for_a_recipe

>
> >
> > So the question is, why bmcweb uses sdbusplus this way? Is it possible to make
> > it just link against sdbusplus like other repos?
> >
>
> See above about static analysis, and building out of the yocto tree.
