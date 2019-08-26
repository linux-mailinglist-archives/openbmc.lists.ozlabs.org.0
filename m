Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 502789C6F5
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 03:25:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GvTB4GgjzDqcc
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 11:25:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FQM8xlRh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jrElG+UX"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GvSc6W3lzDqbW
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 11:25:04 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id CE3AC393;
 Sun, 25 Aug 2019 21:25:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 25 Aug 2019 21:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=yMMsB
 aal4CDuvshs9sefdny3gwtmLsW14kUstLcTKSQ=; b=FQM8xlRhWcS8F5zUgrjHk
 bPYvfzFJVz7IXOMYXOp+aSo0YDgZIPgednFNCNrau3xC94ajld139Ayt2ohJf43H
 Xe+TtyF2QZPGzVUKp465oP7aMWaPNvichCORlDxt8wh79GVJDC4grtrCfEtJi5Uz
 0/l7GVmWVMoS4znt20KYAv/Bp55jvx3eR5VKXXZQyKgOErt3g97ef1r9RyT02Jsv
 jKt3f0thYF2cG0K22/iN0AyiYCwLlNwWc32iiOhuhX2zZRUn8x+6wEMJIns32xmM
 SL9UGc86nokHppR9aDMLBeTexFMLMeijgbVrEYHMWeJHLMQd0IaWjhpnBh4yrSJf
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=yMMsBaal4CDuvshs9sefdny3gwtmLsW14kUstLcTK
 SQ=; b=jrElG+UXj0ghy7/GuPL1IJb3sP+Km1dTcH/EG+ga6aI2Pfy/vJ5xspmEg
 D2uxtytjT33nbBOpwI4XPbKcr/Vu88h9nYREZKnnCe/4Wgtzwhfte+8P6Y6s++SD
 1/hbZYuGzM8ncViX794JOPx6uu7gr8r0AzpR+VRgNqz0Lr8xPTB4K8UoxyIC7HMr
 MAgFJaptaE+cBrpqhKO/Zv1VXiWIf7C6zqnnf3pCi2ThHEGHSAhKlprmNzMo0A/Y
 w4ZjZCrwhqxr81s5WisFc/EYmb9Gxs5TYfMY+JbjX0KieswCBhgIaaGp2kk/KbSa
 uOGTQifT8uvPPIfYi+Oc99KVDrNDw==
X-ME-Sender: <xms:7TRjXe5uICk2YzZ7THlyEXXb8wS5LSt1ac20VV4R6M4vG1BwqyJJOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehfedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepghhithhhuhgsrdgtohhmpdhprhhoohhfphhoihhnthdrtghomhenucfrrghr
 rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvg
 hrufhiiigvpedt
X-ME-Proxy: <xmx:7TRjXcHcmyBRkFXIx0LGgL47Brv33C2dBUQ5-RRndZEbDNXcnXsxFg>
 <xmx:7TRjXSHbDfFQuhgZeNBecxwrzqO6EkdflT7M5BnDRx2fPkThE5nsMA>
 <xmx:7TRjXRuOSg3X-DabXUn4ht7L025XquTJ3i8gmRVwYlR5LpNONwG4wQ>
 <xmx:7TRjXcmCRB2sNyPBi9dShoo5N_0PFQunzKXR-8ffFkokEhnA1oEiEw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 03EB6E00A3; Sun, 25 Aug 2019 21:25:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <1cfc89e9-0dde-4c09-b890-720317c661a2@www.fastmail.com>
In-Reply-To: <C922504E-A0F8-4E2E-A14A-47D72F1AEB03@fb.com>
References: <9788269D-C3EB-45AC-8591-888907C4D145@fb.com>
 <96a33d95-b42b-4a45-9a02-b14de0aa947d@www.fastmail.com>
 <C922504E-A0F8-4E2E-A14A-47D72F1AEB03@fb.com>
Date: Mon, 26 Aug 2019 10:54:52 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>
Subject: Re: A new repo for objc-debug-tools
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vijay,

First up, can you please change your mail client configuration to use a =
quote
marker that isn't a double space? It makes it quite hard to parse your e=
mails.
'> ' is a fairly standard choice and breaks in this pattern catch the ey=
e easily
(i.e. I can actually find where you've replied).

On Sat, 24 Aug 2019, at 09:02, Vijay Khemka wrote:
>=20
>=20
> =EF=BB=BFOn 8/20/19, 5:16 PM, "Andrew Jeffery" <andrew@aj.id.au> wrote=
:
>=20
>    =20
>    =20
>     On Wed, 21 Aug 2019, at 06:22, Vijay Khemka wrote:
>     > =20
>     > Hi Brad,
>     >=20
>     > Can you please create a new repo for obmc-debug-tools. I have pu=
t=20
> a=20
>     > simple document here and will elaborate later.
>     >=20
>     >=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc-=
2Dproject.xyz_-23_c_openbmc_docs_-2B_24591_&d=3DDwIBAg&c=3D5VD0RTtNlTh3y=
cd41b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3D6z2u4EUj64=
SDPW7olBwN2br_N9k1c_r4MLozFVqSD9E&s=3DGIVGeSr8_0FCPynnfun2IgbxjysQyF4bnc=
nGOF_CyX4&e=3D=20
>    =20
>     The documentation suggests these tools are primarily for debugging=

>     purposes. This wasn't clear to me previously - I now think we shou=
ld
>     just host them in the openbmc-tools repo where we already host a
>     bunch of other scripts for debugging. If you want to install them =
in the
>     image then we just write the recipes necessary.


>
> I see in openbmc-tools repo, there are separate directories for indivi=
dual user.

Not to be too argumentative here, but I don't see the issues you've outl=
ined
above as a compelling reason to create a new repository. My expectation =
of
the complexity of these debug tools is on the order of a single source f=
ile. If
this isn't the case, then please correct me, but I'd also be curious as =
to why
they are more complex than that.

Anyway, some history: The one-directory-per-person was mainly an artefac=
t
of how the repository came into existence, which involved a subtree-merg=
e of
several other people's repositories. To contain the mess I simply sucked=
 each
repo into a directory named after their github ID. The intent is, when s=
omeone
has time, to analyse what we've got and restructure the repository along=
 the
lines of purposes for the tools. Maybe that time has come.

> And it contains only scripts. I would like this debug tools to be buil=
dable via
> cmake=20

The fact that it currently contains only scripts doesn't mean that it ca=
n't
contain the source for any ahead-of-time compiled tools. In fact, the
statement that it contains only scripts isn't actually true: AMI have su=
bmitted
a couple of tools they find useful which are written in C and built with=

autotools[1][2]. There's no reason we can't accommodate CMake (it's not =
my
preference of build system, but that only becomes an issue when I'm tryi=
ng
to fix bugs in CMake-based projects :)).

> and we shouldn't download whole repo if we need only these tools.=20

I don't follow the line of reasoning for this statement. We download the=
 repo for
the Linux kernel but maybe only build a 10th of that; it seems odd to ma=
ke the
argument that we shouldn't grab the whole openbmc-tools repo when it cur=
rently
weighs 812KiB. If the haphazard structure is the concern then this shoul=
d be
addressed by my first point above, and the only minor issue is making su=
re any
bitbake recipes deal with the directory structure appropriately.

> Would prefer to have a separate repo for all tools which can be useful=
.

If we're collecting useless tools we should probably stop that :)

Andrew

[1] https://github.com/openbmc/openbmc-tools/tree/master/hongweiz/adcapp=

[2] https://github.com/openbmc/openbmc-tools/tree/master/hongweiz/pwmtac=
htool
