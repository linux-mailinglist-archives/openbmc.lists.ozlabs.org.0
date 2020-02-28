Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ACE172F8F
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 04:49:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TFsp3nQczDrH8
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 14:49:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XSPKQoOY; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TFs36slZzDr5d
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 14:49:10 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id w22so31947lfk.5
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 19:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N7BOK3E8pZL2TBXBWc8BpcOLquTic/HQWfJETQc0cfM=;
 b=XSPKQoOYUyX4ibShdb4KWS7SkAC9EH8Mxpk/2tBn7roY0Cs287FNa4mgbWbDwEHPAi
 bNfxJ7xPix1rGOVmpGgDBIxkbeSzv6L6//WSvDElAvK5qhkoF8gMQR4krK79JXHB8OTh
 8GKYa270Px5bR1vVDIE0IzptfN18p+1Tb86GzxYeGh2C4YZqwri4BrslMvoT7x+AsfrG
 XyStrHRXUx2/duKxwnQyFaTRJQbnajt8zRzMBiTljiKCjdpJemRfuHh1NOme5gVdC39y
 RHV8yhdBr6MmFCdwydgT4xF2og0EvHX5bT3FlWuKXYG49Nfe90LXLyJDAqpqF2dNTbmp
 jy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N7BOK3E8pZL2TBXBWc8BpcOLquTic/HQWfJETQc0cfM=;
 b=WBOrb8o4i0LnFvS6EgiYY3rH7AWJnMqs3LvjszuAF2gDg7HT96sv1qHzPl/p3VLfAn
 1IVuPv85JHRNIkbhpJGjr/kgyVVn7sZLi4IEGz3JX5yyoJEr5AedOsj19TOKWz1mPR64
 MyVgpg7ZtqF8g7KxsapQuX+4a5qbySjD1fgkyhedC+e+2zfQbzLLZO7LIyl3yMp1rFYp
 bdT6GM3Q96SPNJ9fwUHCt1ay1FgmdO+bx4hDda7WqcQq285ka/Gwcf0nxia9/tVzgsTJ
 z0gHglkvXtxsjfvL+DtAkcCcneHA0VTb2ltSBEkBAcxWBysDBbeqUTeEFaZ7Srh0d16F
 WhOg==
X-Gm-Message-State: ANhLgQ0HRVed7+K4H1qO/RcyszEJjngrLijuD/C7zqxQo1bmrEsOr3Ld
 mUTv3XOUBhBE5e1an13XvEs6ujiIAJzUc0DKhAY=
X-Google-Smtp-Source: ADFU+vvqs2oR/HV45I+W7+90VfGt7mKtHsDu9GzzGKQPKo1zFFFwJK0xAWv5lJSc3JVYWBDNZiFqJx5aBf/c8uA9Da8=
X-Received: by 2002:a05:6512:1047:: with SMTP id
 c7mr1444565lfb.78.1582861745092; 
 Thu, 27 Feb 2020 19:49:05 -0800 (PST)
MIME-Version: 1.0
References: <cedd60034505b933ee70a43e4d361720bca9b803.camel@fuzziesquirrel.com>
 <20200204140753.GD92818@patrickw3-mbp.dhcp.thefacebook.com>
 <20200226220525.GP67957@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200226220525.GP67957@patrickw3-mbp.dhcp.thefacebook.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 28 Feb 2020 11:48:53 +0800
Message-ID: <CAARXrtkbiC5szUf7CroBk3+exy5wYu70z=Ryrpf73S3seV+GEQ@mail.gmail.com>
Subject: Re: python 2 deprecation - assistance required
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 27, 2020 at 6:06 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Brad (and everyone else),
>
> Wanted to give an update on the sdbusplus conversion to python3.  There
> are lots of issues I've solved already that I want to give visibility to
> as others are doing similar conversions.  Also, there 7 recipes with bad
> dependencies that break when sdbusplus moves to python3 because they
> previous got their dependencies indirectly from sdbusplus; these need to
> be fixed before we can complete the move.
>
>
> * All of the code is done in sdbusplus and ready for merge, but I am
>   holding off on merging it until we are good to go on openbmc/openbmc.
>
>   https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/29055
>   https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/29545
>
>
> * The recipes for meta-phosphor are available to convert sdbusplus to
>   python3 there.
>
>   https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/29692
>
>   I will update this commit once we are ready to merge 29055 with the
>   SRCREV update instead of a patch file.
>
>
> * The recipe changes at 29692 fails to build the complete
>   openbmc/openbmc due to problems in other recipes.  Many recipes
>   assumed they were getting their "python requirements" indirectly from
>   sdbusplus (which is bad).  When I change sdbusplus to use python3, but
>   those recipes still expect python2 (and modules) they fail to build.
>
>   I ran with 'bitbake obmc-phosphor-image -k' and find the following
>   failures:
>
>     meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-host_git.bb:do_compile
>     meta-phosphor/recipes-phosphor/power/phosphor-power_git.bb:do_compile
>     meta-phosphor/recipes-phosphor/inventory/phosphor-inventory-manager_git.bb:do_compile
>     meta-phosphor/recipes-phosphor/dump/phosphor-debug-collector_git.bb:do_compile
>     meta-phosphor/recipes-phosphor/dbus/phosphor-dbus-monitor_git.bb:do_compile
>     meta-openpower/recipes-phosphor/occ/openpower-occ-control_git.bb:do_compile
>     meta-phosphor/recipes-phosphor/leds/phosphor-led-manager_git.bb:do_compile
>
>   I'm not going to have time to fix all of these myself, so it would be
>   nice if the maintainers of each of these repositories would fix up
>   their dependencies in the Yocto recipe.
>
>   Often this means something like DEPENDS += "python-native python-yaml"
>

Why is it bad for a bitbake recipe to inherits what sdbusplus
depends?I tried to build phosphor-power with sdbusplus + python3, here
is what I found:

1. Without any change, it fails with below log:

    meson.build:36:0: ERROR: <ExternalProgram 'python' ->
['/extra/leiyu/work/openbmc/build/tmp/work/witherspoon-openbmc-linux-gnueabi/phosphor-power/1.0+gitAUTOINC+7d3a9f1b54-r1/recipe-sysroot-native/usr/bin/python-native/python']>
is not a valid python or it is missing setuptools

2. Adding ${PYTHON_PN}-native and ${PYTHON_PN}-pyyaml-native to
DEPENDS, it still fails with below log:

    meson.build:36:0: ERROR: <ExternalProgram 'python' ->
['/extra/leiyu/work/openbmc/build/tmp/work/witherspoon-openbmc-linux-gnueabi/phosphor-power/1.0+gitAUTOINC+7d3a9f1b54-r1/recipe-sysroot-native/usr/bin/python-native/python']>
is not a valid python or it is missing setuptools

3. Adding ${PYTHON_PN}-setuptools to DEPENDS, it fails with a
different log, indicating it requires python mako.

    File "../git/power-sequencer/gen-ucd90160-defs.py", line 6, in <module>
        from mako.template import Template
    ImportError: No module named mako.template

4. Adding ${PYTHON_PN}-mako-native, now it builds fine.

So now it requires a recipe using sdbuplus to have below extra DEPENDS.
   ${PYTHON_PN}-native
   ${PYTHON_PN}-pyyaml-native
   ${PYTHON_PN}-setuptools
   ${PYTHON_PN}-mako-native

However, it's found that if I change the `inherit pythonnative` to
`inherit python3native`, it builds fine.
So I think that is a simpler fix and makes sense: it was inheriting
python2 while sdbusplus is using python2; now sdbusplus is using
python3, we need to update the recipes using sdbusplus to use python3.

What do you think?

>
> * I'm seeing a regular failure with python3 and build systems like
>   meson, which OE has also observed.  For some reason even if we DEPEND
>   on "python-native" or "python3-native" meson cannot find the
>   setuptools module correctly.  We have to also DEPEND on "python" (the
>   non-native variant).  Since we don't actually install python anymore,
>   it doesn't make sense that we have to DEPEND on it either because that
>   means we are building a big target package for no reason.
>
>   Maybe someone could tackle this with upstream rather than us having to
>   piecemeal every recipe.
>
>   https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=ac467533f0b839237c5d31ce84102d28283f99dd
>
>
> * python3-setuptools does some funny mangling of our shebang's when we
>   use setuptools to install a python script.  OE's distutils3.bbclass
>   takes care of this, but often we have some hybrid autotools/setuptools
>   repository so we cannot use this bbclass.  I've added a workaround
>   here:
>
>   https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/29789/1/classes/obmc-phosphor-python3-autotools.bbclass#31
>
>   If you are using another build system (or not using this bbclass) you
>   might also run into this with other recipes.  I suspect, since we
>   aren't using python-on-target anymore, this only affects -native
>   packages, which might only ever be sdbus++?
>
>
> --
> Patrick Williams
