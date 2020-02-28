Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FF173AB7
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 16:08:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TXwX1WbFzDrNL
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 02:08:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=B9Jq14Bz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=BtZxGr8k; 
 dkim-atps=neutral
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TXvb55jDzDrCD
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 02:07:22 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id ED6B85A6;
 Fri, 28 Feb 2020 10:07:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 28 Feb 2020 10:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=OHAcWuMfS4NsoMRVQcoMRlq3tKo
 wgP3JtKctwbeziMw=; b=B9Jq14BzMlylgI+Vy2rJnijLqIbAwCIXOoXX6cKwPTk
 mRqQZXCt+ZO4ztC5mD7dMSqRACy2HoTfOANB8SyKFDDnxW9pQu3MQPJZRQxYmOCX
 dZgBNAemZzsBZ+LkFMcg7lJuY+0iKKWpGgMpJrfxEgxRFjPqbpyGsdPuxBCDntQi
 sxnauvgLGH+lgVxM9lcW1hvzEk0k6BBS0QvXFAbMt1RJb05wy8NqrSdmlCj/W9th
 2/z1Pi34HEZAv5FcCeTfKcTQ0T9eZM7cnLPXekwNijcz2rkHaL40VVrTpoOLplL+
 rVxI4bzblBI0Tley0PRkWpuytqK5FFAXVyy2cKalQBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OHAcWu
 MfS4NsoMRVQcoMRlq3tKowgP3JtKctwbeziMw=; b=BtZxGr8kmGNcHxLCa8HVs4
 WsrqW9mNibhz+evmVbrx1tsEbEvfLZzOUlwfK0Ttua69Ot/AS+vDgEq9gYtfYMq2
 DbCYjT7IoBSpXbrgBreeIl5iBJfWsK6ZUXTc9eMJu3IROfxk5zb/69bFWwNtoHlH
 NjCTwau5pLb9quWvpvuwPUeWl2Yla+rIaJjCanqKw95PkYpmZ/KjG+CyRZX15Rby
 KT2S8qokmgEP4aHwSGEBwdBIlqqYNi5nUAsiN/Q/Ay6BJhVns8FjEfb+p6rqWgXR
 1ml+339QO9XuAu9l3oDKXVYIGwIxtXSUvN4rHXb1SjfeLOvBt/GCwNAo6t9d00IQ
 ==
X-ME-Sender: <xms:pSxZXrX51A5DlxnsXhdllb3fw7DnA-e_HhTsEaIbX_eX075CihcwFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleekgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdho
 phgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecukfhppedutdejrddutdejrdduledtrd
 efieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:pSxZXvzd3cDLgckFJESMMSmrypx2jj_a89UCK-6bp1MsmQgAvwfHmw>
 <xmx:pSxZXqSi1holkJ9gk5sK-4gXdt2BL8V-uhzqMN83Mg-RmPlREciayg>
 <xmx:pSxZXk-atkYFLuh8gjWKSkp5cb0uxGxkN41bJb3OFfngodzNCIa3bw>
 <xmx:pSxZXuXP2tb6xHTDuLyxWbj95_apudw-Kcn9K79gFoQ53tqx2HaNdjZw7RE>
Received: from localhost (mobile-107-107-190-36.mycingular.net
 [107.107.190.36])
 by mail.messagingengine.com (Postfix) with ESMTPA id D88643280066;
 Fri, 28 Feb 2020 10:07:16 -0500 (EST)
Date: Fri, 28 Feb 2020 09:07:15 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei YU <mine260309@gmail.com>
Subject: Re: python 2 deprecation - assistance required
Message-ID: <20200228150715.GQ67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <cedd60034505b933ee70a43e4d361720bca9b803.camel@fuzziesquirrel.com>
 <20200204140753.GD92818@patrickw3-mbp.dhcp.thefacebook.com>
 <20200226220525.GP67957@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrtkbiC5szUf7CroBk3+exy5wYu70z=Ryrpf73S3seV+GEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rUztinBX/EQDJOOk"
Content-Disposition: inline
In-Reply-To: <CAARXrtkbiC5szUf7CroBk3+exy5wYu70z=Ryrpf73S3seV+GEQ@mail.gmail.com>
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


--rUztinBX/EQDJOOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 11:48:53AM +0800, Lei YU wrote:
> On Thu, Feb 27, 2020 at 6:06 AM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> >   Often this means something like DEPENDS +=3D "python-native python-ya=
ml"

I want to point out that this was meant as an example, not an exact
recipe of what needs to be fixed.  Really we need whatever the
dependencies are for a recipe to be expressed in that recipe.
>=20
> Why is it bad for a bitbake recipe to inherits what sdbusplus
> depends?I tried to build phosphor-power with sdbusplus + python3, here
> is what I found:

Implicit dependencies are bad because you're relying on an
implementation detail of another recipe that could change at any time
(like it has here as we transition from py2 to py3).  What if we decided
to rewrite sdbus++ in Rust?  As long as the sdbus++ package contains all
of its own dependencies, we should be able to do that without breaking a
single other recipe, but that assumes the other recipes are correctly
expressing their own dependencies.

sdbusplus / sdbus++ packages already RDEPEND on their own runtime
requirements so that you and *execute* the executables they contain.
But, if *your* recipe needs one of those itself directly, that should be
expressed in DEPEND and not on something you happen to gain because
sdbusplus has it in RDEPEND today.

One of the bad things about bitbake is that it can be hard to recognize
these errors in recipes.  I went through just the other day and fixed a
handful of recipes that had a DEPEND on openssl (due to code changes
that supported cypto-signing) but hadn't ever added them to the recipe.
This py2 to py3 actually gives us a really good opportunity to find
existing recipe bugs and fix them.

>=20
> 1. Without any change, it fails with below log:
>=20
>     meson.build:36:0: ERROR: <ExternalProgram 'python' ->
> ['/extra/leiyu/work/openbmc/build/tmp/work/witherspoon-openbmc-linux-gnue=
abi/phosphor-power/1.0+gitAUTOINC+7d3a9f1b54-r1/recipe-sysroot-native/usr/b=
in/python-native/python']>
> is not a valid python or it is missing setuptools

Correct.  That is what I also observed.  Meson is identifying that the
native (host build system version) python2 is missing.

>=20
> 2. Adding ${PYTHON_PN}-native and ${PYTHON_PN}-pyyaml-native to
> DEPENDS, it still fails with below log:
>=20
>     meson.build:36:0: ERROR: <ExternalProgram 'python' ->
> ['/extra/leiyu/work/openbmc/build/tmp/work/witherspoon-openbmc-linux-gnue=
abi/phosphor-power/1.0+gitAUTOINC+7d3a9f1b54-r1/recipe-sysroot-native/usr/b=
in/python-native/python']>
> is not a valid python or it is missing setuptools

I don't know the details of that repository to know if it uses pyyaml at
build time, but lets assume it does.

${PYTHON_PN}-native is what should give you either python-native or
python3-native, depending on which 'inherit pythonnative' or 'inherit
python3native' you do in your recipe.  ${PYTHON_PN}-native is what
should give you a python executable / environment that can run on the
*build* system (hence the -native portion).
${PYTHON_PN}-<module>-native is what supplies that python module into
the environment.

sdbus++ uses inflection, mako, and pyyaml modules so that is why you see
them add as DEPENDS (and in RDEPENDS_sdbus++) [1].

As far as why ${PYTHON_PN}-setuptools "fixes" this problem, I already
spoke about this in my original email (highlighting section below).

> 3. Adding ${PYTHON_PN}-setuptools to DEPENDS, it fails with a
> different log, indicating it requires python mako.
>=20
>     File "../git/power-sequencer/gen-ucd90160-defs.py", line 6, in <modul=
e>
>         from mako.template import Template
>     ImportError: No module named mako.template

Right, so I don't know the python modules used by every repository.
This is why their DEPENDS need to be fixed to express what they use.

> 4. Adding ${PYTHON_PN}-mako-native, now it builds fine.
>=20
> So now it requires a recipe using sdbuplus to have below extra DEPENDS.
>    ${PYTHON_PN}-native
>    ${PYTHON_PN}-pyyaml-native
>    ${PYTHON_PN}-setuptools
>    ${PYTHON_PN}-mako-native

Great.  Commit coming?

> However, it's found that if I change the `inherit pythonnative` to
> `inherit python3native`, it builds fine.
> So I think that is a simpler fix and makes sense: it was inheriting
> python2 while sdbusplus is using python2; now sdbusplus is using
> python3, we need to update the recipes using sdbusplus to use python3.
>=20
> What do you think?

Sorry for the length here, but there is a lot of depth to this rabbit
hole you've uncovered.  TL;DR is: no, this is a very bad idea. ;)

I've already spoken to why we need the *real* dependencies expressed,
but your suggestion is far far worse than it appears on the surface.

(I understand how you might have arrived at that option, but there are a
lot of bitbake details here that most people just chalk up as *magic*.)

First off, sdbus++ already provides its own RDEPENDS (again see [1]).
This means that the recipe has already expressed everything it needs to
run (the R in RDEPENDS).  If you DEPEND on sdbus++-native, because you
use it during the build, we already supply all the dependencies
necessary for sdbus++ to run.  It doesn't matter if sdbus++ uses py2 or
py3, we take care of it.  You simply DEPEND +=3D "sdbus++-native" and
you're done; we did entirely the right thing for you.

The issue you are observing here is that this repository supplies *its
own* python script (gen-ucd90160-defs.py) and *didn't* express the its
own DEPENDS with all the python bits it needed.  This recipe is the one
at fault here, not sdbusplus.  This is what I mean by "it use to get its
dependencies as a side-effect but now needs to express them."

Now, why can't we just switch 'inherit pythonnative' to 'inherit
python3native'?  Two reasons:

    1. gen-ucd90160-defs.py is currently a py2 program.  You thus really
       don't want python3native.

    2. pythonnative / python3native are doing something *very* important
       from a Yocto perspective and you need to pick the right one.

When you run 'bitbake' there are up to 3 different python environments:

    a. The one included in your OS, which is where 'bitbake' itself
       runs.

    b. The one compiled by 'bitbake' as part of the ${PYTHON_PN}-native
       recipe which can run on your build system.

    c. The one compiled by 'bitbake' as part of the ${PYTHON_PN} recipe
       which can run on your *target* system.

What 'pythonnative' does is it sets up bitbake / environment variables
for the execution of that recipe so that (b) shows up in the path before
(a).  This is critically important!  If you don't do this, you end up in
a odd condition where you're using your OS's python environment and not
the one supplied by bitbake.  This can lead to a compilation succeeding
on your machine and failing on someone else's.  It can also lead to
scenarios where we use a python3.8 feature in a script (and
${PYTHON_PN}-native is 3.8) but your machine only has python3.6
installed and you're left confused as to how any of it is suppose to
work.

When you changed 'inherit pythonnative' to 'inherit python3native' what
you did was you made it so that the version of python supplied by
'python-native' wasn't visible to the build of this repository.
Instead, it ended up falling back to *your* OS version of python2.  The
only reason it was successful for you was because *you* happen to have
the mako and pyyaml modules installed in your OS.  Jenkins *should* fail
in this case (and I hope it does) because that Docker image has only the
bare minimum python bits installed in order to run bitbake (and this is
a good thing).

=3D=3D=3D=3D=3D=3D=3D Highlighting history about ${PYTHON_PN}-setuptools =
=3D=3D=3D=3D=3D=3D=3D=3D
> > * I'm seeing a regular failure with python3 and build systems like
> >   meson, which OE has also observed.  For some reason even if we DEPEND
> >   on "python-native" or "python3-native" meson cannot find the
> >   setuptools module correctly.  We have to also DEPEND on "python" (the
> >   non-native variant).  Since we don't actually install python anymore,
> >   it doesn't make sense that we have to DEPEND on it either because that
> >   means we are building a big target package for no reason.
> >
> >   Maybe someone could tackle this with upstream rather than us having to
> >   piecemeal every recipe.
> >
> >   https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dac467533=
f0b839237c5d31ce84102d28283f99dd
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[1] https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/29692/9/re=
cipes-extended/sdbusplus/sdbusplus_git.bb#18

--=20
Patrick Williams

--rUztinBX/EQDJOOk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5ZLKEACgkQqwNHzC0A
wRnTWxAAp/+IzkW8/jqmNLX+0Hfz93L24803PPGdRyLljXix5OwJbbNqrvXcbT3o
69zrFMQ1LgLW6NgX1Yzhc6/Bczc+kRLxffKLn0Ri64VBBEysD6usMZWCvtxGsi2A
IWekh9wmwOfwTQz8khQ9BzhIkoHL5LoLuooK/l6IoD+79llHepQ8iUvtXmuXKFC/
TMjawgoOMCboLRjnVH8rIoVvalKpBxMnZ3SRzPeI/YN2VRRIqpIbaWFSFYF7DXWX
D0m9Xmk1FbGbJcKcj3t2pneQB0HDI/FUGGjd0Vpxt1QBz6eAue94dndfsjap6A0K
i23POv6QciJZdFRfMmtGBDRT7W6BQ4V71vPD2T+iGiBJ8mqOrrKdWtC6Aa5akxg0
rENkStZ4HG+MCO9gRLmBGLyEemueM0IQ7205+XzsHWWGfV39vj2W+AzQNoS8JYjY
8A0su59uVxHptofDLtiiN2tLN9dGCf369Sbfmp8nXZ6z8H96VakFXVaTv6QiWGAW
WhQcZKm5WdlDi115porKZg4WmxsDkPY0LLvq9Zk++qdvbAvVy8elSfHhYNFNIPhq
fYa4AbEpdZJiCh5B8+/35J+v5MXBzte9JI+2sCqUrWW6SQ4YMm4PFvmYsmCqZHKt
orTKqgGvm19UZby53i6mKPLpJZN51hRlvqZemOoBgs63zXdL/7I=
=77EZ
-----END PGP SIGNATURE-----

--rUztinBX/EQDJOOk--
