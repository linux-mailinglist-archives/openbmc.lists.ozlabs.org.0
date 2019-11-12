Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 919A3F9F5A
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 01:36:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CQdp4zsNzF5s2
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 11:36:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=betafive.co.uk (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=paul@betafive.co.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=betafive.co.uk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=betafive.co.uk header.i=@betafive.co.uk
 header.b="UoR+igBE"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ON2Dh0ec"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CGn020QTzF5cx
 for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2019 05:41:48 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 73B8D30F;
 Tue, 12 Nov 2019 13:41:44 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute1.internal (MEProxy); Tue, 12 Nov 2019 13:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type:content-transfer-encoding; s=fm3; bh=Pz
 +Z8/HdAv9ndKLymjUJ4A8FpATSzFEVqbWtOYhToSk=; b=UoR+igBExtN3N7jMxb
 cVVJwUji7Mj+yQEVaC5IwT85bgQOHwWAYCoD3Bcz9mKml1vKCnTMPSpgwFUkVd5A
 LMoHNFnx2QYcg7W5TN/HL4WKmR5tc/X0ahCmNknvk6Wbp8cHls3Wtw7ioJLFq2hX
 34cp9kvbt4iSuxrTIpAVp0ga7Gf3PvwYFB4T7h3IKuRr4IE5bwqQajEHot8f01Bn
 lfQaS2xuW/2/8ZJblU8KMaBxcKnG2ZFVmxyjIFE7VTsNU4AEsnvWsWp7zZazaQP+
 1Esku/r21T79G6gnWQcx3eIvo5uAWvYD9e7l2sLqS6TslW3dnrX6l+YPnUKYBhpL
 33zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Pz+Z8/HdAv9ndKLymjUJ4A8FpATSzFEVqbWtOYhTo
 Sk=; b=ON2Dh0ec4bKid3ueDVP+AMYirYaiXqNEhi7QL/YVz0psqlR7b9jfLFykW
 O5gocZOmJWvIvZZ3FiIQ5mGYPhSd4i67CbySo4pGhYXZHqa+nGELW2OgKdTRFy6Q
 I/pmrckhbomiLoZ5/7Jl6DIOvO/2sg8irld7wKRAcph7HjuwbU8c4NH39GmxDIls
 CmW8t4f/yoGT1d+uWJRtwuxsvj59z4u9DkLHeSrUYx4uDqGdJwZCXv8KHIgLp/NB
 cQOhfpVn+I2lWESwu/7s3BBgzTwCaT5AorlJP3IxidBbwisQLlR6BEXVuEAiXguY
 FuQfnamfaOqCe6m0ElYV3HzK+YaAg==
X-ME-Sender: <xms:5_zKXTbTxftnygWrz-eVIkKqZh5aUm1GX2MQRCYDGHevDl_Wuit9_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvledgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfr
 rghulhcuuegrrhhkvghrfdcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenuc
 ffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhoiihlrggsshdrohhrghen
 ucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukh
 enucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:5_zKXRKQpwHkPcr2URy7vnMJzATTLlOkltV1AqhpMKP3Q89PTm4A8w>
 <xmx:5_zKXVgMvrGkH36RvTMTYrSZcnP6KqdT_5ngn0zO_d50WwA4eOz3sw>
 <xmx:5_zKXT-XWb9Ie77ExRI1BUh8AzJewK1CLM0Ks4Lmejb6dZQZDMT97g>
 <xmx:5_zKXRYyRgRvsmSUUMIgAEqNmF59cpFcXKB-lAtihjVzC-SDR1RPHg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1337CE00A3; Tue, 12 Nov 2019 13:41:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <8fe3f80a-5b5c-4474-bb18-98c19fad29cd@www.fastmail.com>
In-Reply-To: <CEB2088C-C91F-46ED-9FC1-2480893767E0@fuzziesquirrel.com>
References: <CAGMNF6U81+d9wz4h_TiPBA0EoxC6bhiUZ67mozWWwwT4GTVMCg@mail.gmail.com>
 <9AC7EF7E-3FFF-4855-B9DE-80F3B68236E0@fuzziesquirrel.com>
 <CAGMNF6W8bWD_2Zpynz9vcVdGA9d8B+QfbA=oau2zQj+xpf9NEw@mail.gmail.com>
 <CEB2088C-C91F-46ED-9FC1-2480893767E0@fuzziesquirrel.com>
Date: Tue, 12 Nov 2019 18:41:22 +0000
From: "Paul Barker" <paul@betafive.co.uk>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>, "Kun Yi" <kunyi@google.com>
Subject: Re: [yocto] Yocto/bitbake recipe 'diff test'?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 13 Nov 2019 11:33:02 +1100
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
Cc: Yocto discussion list <yocto@yoctoproject.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 12 Nov 2019, at 18:05, Brad Bishop wrote:
>=20
>=20
> > On Nov 12, 2019, at 1:55 AM, Kun Yi <kunyi@google.com> wrote:
> > =20
> > Sure, it's partially due to how we set up the build downstream. Our =
downstream would put all the needed layers in one bblayers file, so we w=
ould have something like:
> >=20
> >   ##OEROOT##/meta \
> >   ##OEROOT##/meta-poky \
> >   ##OEROOT##/meta-openembedded/meta-oe \
> >   ##OEROOT##/meta-openembedded/meta-networking \
> >   ##OEROOT##/meta-openembedded/meta-python \
> >   ##OEROOT##/meta-phosphor \
> >   ##OEROOT##/meta-google \
> >   ##OEROOT##/meta-google-gbmc \
> >   ##OEROOT##/meta-aspeed \
> >   ##OEROOT##/meta-nuvoton \
> >   ##OEROOT##/meta-openpower \
> >   ##OEROOT##/meta-ingrasys \
> >   ##OEROOT##/meta-ingrasys/meta-zaius \
> >   ##OEROOT##/meta-quanta \
> >   ##OEROOT##/meta-quanta/meta-gsj \
> > ...
> >=20
> > The distinct advantage of this approach is that we would be able to =
build images for different machine types using the same layer conf, so t=
he build doesn't need to be reconfigured if you were to test on another =
platform.
> >=20
> > The challenge, as you can imagine, is that each meta layer now canno=
t 'leak' any variable. e.g. if some recipe in meta-quanta sets a variabl=
e for quanta systems only, then it must specify "_quanta" or a similar s=
uffix to prevent the variable expansion to apply to other systems. I thi=
nk this rule is generally preferred upstream, but not sure whether it is=
 an official guideline.
> >=20
> > With my proposal, it would be much easier for a multi-system layer s=
etup like ours to work. Not only that, it would benefit the most common =
use cases: moving variable definitions in bitbake recipes, or even just =
adding a variable for a particular machine feature. Having a visible dif=
f would make reviewing the changes so much easier.
>=20
> Thanks for the background Kun.
>=20
> I know yocto has a concept of Q&A checks that can be run - would it=20=

> make sense to try something like this via that mechanism?  Emit=20
> warnings (which we can elevate to build failures in CI) if variables=20=

> aren=E2=80=99t properly overriden?  That is nice because it doesn=E2=80=
=99t require any=20
> changes to our CI system.
>=20
> I=E2=80=99ve cross posted to the yocto mailing list in case there is a=
ny=20
> interest or ideas there.  Here is a link to the entire thread as I=20
> remove a little too much context I think=E2=80=A6
>=20
> https://lists.ozlabs.org/pipermail/openbmc/2019-November/019409.html

This is something I covered in the Yocto Project Summit in Lyon at the e=
nd of October. I'm hoping to get the project documentation updated to re=
flect what was discussed but that will take a little time.

In the mean time, the `yocto-check-layer` script is what you want here -=
 it calculates the signatures for all recipes before adding the layer in=
 question and then again after adding the layer. If the signatures diffe=
r that means one or more variables or tasks has been changed uncondition=
ally. This check can't be an ordinary QA test as it relies on the layer =
being added during the test and on multiple bitbake invocations.

There are many ways to make modifications dependent on the selected MACH=
INE, DISTRO, DISTRO_FEATURES, MACHINE_FEATURES, IMAGE_FEATURES, etc - mo=
re than just using simple overrides everywhere. Until the video is up or=
 the documentation is updated, have a look at my slides at the start of =
the Day 1 slide deck at https://wiki.yoctoproject.org/wiki/YP_Summit_Lyo=
n_2019.

Thanks,

--=20
Paul Barker
