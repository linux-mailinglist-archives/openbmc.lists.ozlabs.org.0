Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBEC175195
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 02:47:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W31b2jQTzDqv1
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 12:47:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lPsNwWVs; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W30x2Y1lzDqst
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 12:47:11 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id c20so1964399lfb.0
 for <openbmc@lists.ozlabs.org>; Sun, 01 Mar 2020 17:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q/++mFTjwFS1IYJnPRx7+/ZzsMNLW/BOGaLijz1ELkE=;
 b=lPsNwWVslEtXDgGnYM5OvhIDk8bmM6tD2As1iknWT7Feed6fXUTXtU2R6ryqYk/Pmm
 8038Vo960qrTp8NWyYTwZLE3jca/kUu1YKjdaizd6MbK92cswxwDJE5UAJ48/yzEjgLz
 UXgDEo9ElpKekXCJySnI8keHMAXM8KrGVAe+9xMZ1+/oqt7iYgDJKKxBrStFbS93Crsw
 ZqkYAx4V75Ydk55oPASnYFbeTGaNKEOQJMyU84Z77p64vrfdueOiERVPe9GtN1IFLFm5
 /fC3qfHPTbU4mmIsafCUmpib3xyiHHw7cRy9iJ0waa2yQ99gxx/KW0ecgEiJtjR39zw+
 pnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q/++mFTjwFS1IYJnPRx7+/ZzsMNLW/BOGaLijz1ELkE=;
 b=fYwbDSRNPgnuv/3Iasda7Zv6EOnq5kZtLVObzWgiUWTPj4FTw4FMrT3Rszy0l/P64L
 LxyKU1NfA3nRU8At7qdXKRAL40kayJCgb6nCikK0YtcGLJsnDwkPDgbv6FQSsLwCMs+P
 HIco5kRjUt28eNvUgFLKe84NLs6OBZa/9RZWaBGORsafqsjTUdIa8woGus36R5rt0FjF
 b2x3kBHQjUzG4k3xJ9pk9hilk2Tkp72txOY60/0qSTDDrbdTwfx/vYYEgzWddlHNp44T
 Np9jSGre2GG8WVtNkclgCnjaIJBsRJhxsanuLntlg4y6dB7btMLFEHCEithVUCl0Byg+
 uQXA==
X-Gm-Message-State: ANhLgQ0OeLnEaDVoeF0iL0zWhpfNSnsua7FYtK4BmVuS0+qsS+tjtCl8
 wVcz+f8WUF4ZLo88szDi6PbLEeMyzpzghdIOq+I=
X-Google-Smtp-Source: ADFU+vvUyLAzXdYFTaSEh0JHJsArq3yIN0oeUy7TwRhSZYelP4Lk+0WqNGitCk7+iB3BnxwJJ+ixsCpgWWGqDl45QWw=
X-Received: by 2002:a19:8c1c:: with SMTP id o28mr8992809lfd.185.1583113625913; 
 Sun, 01 Mar 2020 17:47:05 -0800 (PST)
MIME-Version: 1.0
References: <cedd60034505b933ee70a43e4d361720bca9b803.camel@fuzziesquirrel.com>
 <20200204140753.GD92818@patrickw3-mbp.dhcp.thefacebook.com>
 <20200226220525.GP67957@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrtkbiC5szUf7CroBk3+exy5wYu70z=Ryrpf73S3seV+GEQ@mail.gmail.com>
 <20200228150715.GQ67957@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200228150715.GQ67957@patrickw3-mbp.dhcp.thefacebook.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 2 Mar 2020 09:46:55 +0800
Message-ID: <CAARXrt=6Hb4rVc3gNWkVLZjBStKhOgum_2QjCaNGGTN-dWQnzw@mail.gmail.com>
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

On Fri, Feb 28, 2020 at 11:07 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Fri, Feb 28, 2020 at 11:48:53AM +0800, Lei YU wrote:
> > On Thu, Feb 27, 2020 at 6:06 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> > >   Often this means something like DEPENDS += "python-native python-yaml"
>
> I want to point out that this was meant as an example, not an exact
> recipe of what needs to be fixed.  Really we need whatever the
> dependencies are for a recipe to be expressed in that recipe.
> >
> > Why is it bad for a bitbake recipe to inherits what sdbusplus
> > depends?I tried to build phosphor-power with sdbusplus + python3, here
> > is what I found:
>
> Implicit dependencies are bad because you're relying on an
> implementation detail of another recipe that could change at any time
> (like it has here as we transition from py2 to py3).  What if we decided
> to rewrite sdbus++ in Rust?  As long as the sdbus++ package contains all
> of its own dependencies, we should be able to do that without breaking a
> single other recipe, but that assumes the other recipes are correctly
> expressing their own dependencies.
>
> sdbusplus / sdbus++ packages already RDEPEND on their own runtime
> requirements so that you and *execute* the executables they contain.
> But, if *your* recipe needs one of those itself directly, that should be
> expressed in DEPEND and not on something you happen to gain because
> sdbusplus has it in RDEPEND today.
>
> One of the bad things about bitbake is that it can be hard to recognize
> these errors in recipes.  I went through just the other day and fixed a
> handful of recipes that had a DEPEND on openssl (due to code changes
> that supported cypto-signing) but hadn't ever added them to the recipe.
> This py2 to py3 actually gives us a really good opportunity to find
> existing recipe bugs and fix them.
>
> >
> > 1. Without any change, it fails with below log:
> >
> >     meson.build:36:0: ERROR: <ExternalProgram 'python' ->
> > ['/extra/leiyu/work/openbmc/build/tmp/work/witherspoon-openbmc-linux-gnueabi/phosphor-power/1.0+gitAUTOINC+7d3a9f1b54-r1/recipe-sysroot-native/usr/bin/python-native/python']>
> > is not a valid python or it is missing setuptools
>
> Correct.  That is what I also observed.  Meson is identifying that the
> native (host build system version) python2 is missing.
>
> >
> > 2. Adding ${PYTHON_PN}-native and ${PYTHON_PN}-pyyaml-native to
> > DEPENDS, it still fails with below log:
> >
> >     meson.build:36:0: ERROR: <ExternalProgram 'python' ->
> > ['/extra/leiyu/work/openbmc/build/tmp/work/witherspoon-openbmc-linux-gnueabi/phosphor-power/1.0+gitAUTOINC+7d3a9f1b54-r1/recipe-sysroot-native/usr/bin/python-native/python']>
> > is not a valid python or it is missing setuptools
>
> I don't know the details of that repository to know if it uses pyyaml at
> build time, but lets assume it does.
>
> ${PYTHON_PN}-native is what should give you either python-native or
> python3-native, depending on which 'inherit pythonnative' or 'inherit
> python3native' you do in your recipe.  ${PYTHON_PN}-native is what
> should give you a python executable / environment that can run on the
> *build* system (hence the -native portion).
> ${PYTHON_PN}-<module>-native is what supplies that python module into
> the environment.
>
> sdbus++ uses inflection, mako, and pyyaml modules so that is why you see
> them add as DEPENDS (and in RDEPENDS_sdbus++) [1].
>
> As far as why ${PYTHON_PN}-setuptools "fixes" this problem, I already
> spoke about this in my original email (highlighting section below).
>
> > 3. Adding ${PYTHON_PN}-setuptools to DEPENDS, it fails with a
> > different log, indicating it requires python mako.
> >
> >     File "../git/power-sequencer/gen-ucd90160-defs.py", line 6, in <module>
> >         from mako.template import Template
> >     ImportError: No module named mako.template
>
> Right, so I don't know the python modules used by every repository.
> This is why their DEPENDS need to be fixed to express what they use.
>
> > 4. Adding ${PYTHON_PN}-mako-native, now it builds fine.
> >
> > So now it requires a recipe using sdbuplus to have below extra DEPENDS.
> >    ${PYTHON_PN}-native
> >    ${PYTHON_PN}-pyyaml-native
> >    ${PYTHON_PN}-setuptools
> >    ${PYTHON_PN}-mako-native
>
> Great.  Commit coming?
>
> > However, it's found that if I change the `inherit pythonnative` to
> > `inherit python3native`, it builds fine.
> > So I think that is a simpler fix and makes sense: it was inheriting
> > python2 while sdbusplus is using python2; now sdbusplus is using
> > python3, we need to update the recipes using sdbusplus to use python3.
> >
> > What do you think?
>
> Sorry for the length here, but there is a lot of depth to this rabbit
> hole you've uncovered.  TL;DR is: no, this is a very bad idea. ;)
>
> I've already spoken to why we need the *real* dependencies expressed,
> but your suggestion is far far worse than it appears on the surface.
>
> (I understand how you might have arrived at that option, but there are a
> lot of bitbake details here that most people just chalk up as *magic*.)
>
> First off, sdbus++ already provides its own RDEPENDS (again see [1]).
> This means that the recipe has already expressed everything it needs to
> run (the R in RDEPENDS).  If you DEPEND on sdbus++-native, because you
> use it during the build, we already supply all the dependencies
> necessary for sdbus++ to run.  It doesn't matter if sdbus++ uses py2 or
> py3, we take care of it.  You simply DEPEND += "sdbus++-native" and
> you're done; we did entirely the right thing for you.
>
> The issue you are observing here is that this repository supplies *its
> own* python script (gen-ucd90160-defs.py) and *didn't* express the its
> own DEPENDS with all the python bits it needed.  This recipe is the one
> at fault here, not sdbusplus.  This is what I mean by "it use to get its
> dependencies as a side-effect but now needs to express them."
>
> Now, why can't we just switch 'inherit pythonnative' to 'inherit
> python3native'?  Two reasons:
>
>     1. gen-ucd90160-defs.py is currently a py2 program.  You thus really
>        don't want python3native.
>
>     2. pythonnative / python3native are doing something *very* important
>        from a Yocto perspective and you need to pick the right one.
>
> When you run 'bitbake' there are up to 3 different python environments:
>
>     a. The one included in your OS, which is where 'bitbake' itself
>        runs.
>
>     b. The one compiled by 'bitbake' as part of the ${PYTHON_PN}-native
>        recipe which can run on your build system.
>
>     c. The one compiled by 'bitbake' as part of the ${PYTHON_PN} recipe
>        which can run on your *target* system.
>
> What 'pythonnative' does is it sets up bitbake / environment variables
> for the execution of that recipe so that (b) shows up in the path before
> (a).  This is critically important!  If you don't do this, you end up in
> a odd condition where you're using your OS's python environment and not
> the one supplied by bitbake.  This can lead to a compilation succeeding
> on your machine and failing on someone else's.  It can also lead to
> scenarios where we use a python3.8 feature in a script (and
> ${PYTHON_PN}-native is 3.8) but your machine only has python3.6
> installed and you're left confused as to how any of it is suppose to
> work.
>
> When you changed 'inherit pythonnative' to 'inherit python3native' what
> you did was you made it so that the version of python supplied by
> 'python-native' wasn't visible to the build of this repository.
> Instead, it ended up falling back to *your* OS version of python2.  The
> only reason it was successful for you was because *you* happen to have
> the mako and pyyaml modules installed in your OS.  Jenkins *should* fail
> in this case (and I hope it does) because that Docker image has only the
> bare minimum python bits installed in order to run bitbake (and this is
> a good thing).
>

Thanks a lot for explaining this, now I understand what exactly the
issue is and why it needs fix.
For phosphor-power itself, ideally, we will update the script in the
repo to use pthon3, and declare necessary dependencies in the bitbake
recipe correctly.


> ======= Highlighting history about ${PYTHON_PN}-setuptools ========
> > > * I'm seeing a regular failure with python3 and build systems like
> > >   meson, which OE has also observed.  For some reason even if we DEPEND
> > >   on "python-native" or "python3-native" meson cannot find the
> > >   setuptools module correctly.  We have to also DEPEND on "python" (the
> > >   non-native variant).  Since we don't actually install python anymore,
> > >   it doesn't make sense that we have to DEPEND on it either because that
> > >   means we are building a big target package for no reason.
> > >
> > >   Maybe someone could tackle this with upstream rather than us having to
> > >   piecemeal every recipe.
> > >
> > >   https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=ac467533f0b839237c5d31ce84102d28283f99dd
> ===================================================================
>
> [1] https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/29692/9/recipes-extended/sdbusplus/sdbusplus_git.bb#18
>
> --
> Patrick Williams
