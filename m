Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88DDD593
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 01:38:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46w2XG1n8MzDqs8
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 10:38:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TyLE+FGG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iGoV99cs"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46w2WN71XYzDqhH
 for <openbmc@lists.ozlabs.org>; Sat, 19 Oct 2019 10:37:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A305D42B;
 Fri, 18 Oct 2019 19:37:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 18 Oct 2019 19:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=DVhQC
 VVK1TQaUJ37NNq2MjkGW7p1oBx4Iy5ZiMqnm7w=; b=TyLE+FGGcCKFzqLRgl+m7
 XKz8ayRKXYu9+OXoWj7K/UXxuL5eNZ9VV7gc82Q9jizcn1vNTAUu3YCZ7KaSCY7S
 j0MlirJi1eVXw1IQH50ZkMy4K13J1r1Dsz54j6b+b5e4wRjMhT/BD7pmQYXGF9ZL
 tmSIol0YXlPEygBU2xsqeNBhU2e1XWhARPFeXgkatW7HZidjt0OysZFcPCHn7eXI
 hF9V/tBSos6C02JtIQwGECIHNdNSkq6KWvgmc9ho/8rKuEcK9C2t0SgMDChEXCA0
 k+sTYJ4gIw6tS2mTyDc7n+1lA0NZbzFscuQyc2G4R1PP9jo57cntR2DHXtWXGj0l
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=DVhQCVVK1TQaUJ37NNq2MjkGW7p1oBx4Iy5ZiMqnm
 7w=; b=iGoV99csp1KMMkpjkTQ8fwDNL6zhzjEehNdXElpCynEWilyDTWmnSXfXR
 XfZykFgnUyrbrh7ZBjco/oBHG7O1ys4mbJrfrU7FRZy6x3nj6n+rbwChcUDSYj3N
 fDWqvLlnRlOgeQWJFuQi0cxQu3mWf+udqyVct+X/UdFPby5amHUlz4kAtyNp7RD2
 V92fBMHKUijFffAfeku+wU7oECLv7u9U5NXuCPuzxWO0NAJ1GTkxtQd/y4UQ3FQw
 N9/Y1J1h8IsUhwg3Q0nBLs0yZFwyVINntaIn3urEkUkRsWU7Yax6GFJtzCcU3/LE
 zfTKN1quCcSTG4Y60/QZJ3MFX+5cA==
X-ME-Sender: <xms:q0yqXeZjcAFklOcWgj-XpYtKsurD6wXMSmxSOpctxjRH_ZKqVIxDKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkedtgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:q0yqXaWLBxJQeD5gBenpFPhUvUmon7ASdZe2nByRb1Yj1NDBKZ6CVw>
 <xmx:q0yqXWQhgej3FcsnjgwfZ1Lo1MrA1BleehypSMV62DJbV783165A2Q>
 <xmx:q0yqXUXCyHEB3yxR6t8-WLRdrlumZvC1POgtG2aTe0eN-EJeYYPc-g>
 <xmx:rEyqXRNzJOSnlEHzmX3e91DLw031QTRVR-EXSEJ-IQb91QtjKbt2Zg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 654B4E00A5; Fri, 18 Oct 2019 19:37:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <c9e673c4-7228-4b69-bb5e-ba4c8f373709@www.fastmail.com>
In-Reply-To: <43161B7F-E635-49A8-B145-E3BA19C6236D@fuzziesquirrel.com>
References: <170FEA13-6C0D-4D08-9118-1831E85DD5A8@fuzziesquirrel.com>
 <cf6f11adb105ae774fa5d1ecf2959f9f64d1b131.camel@ozlabs.org>
 <43161B7F-E635-49A8-B145-E3BA19C6236D@fuzziesquirrel.com>
Date: Sat, 19 Oct 2019 10:06:54 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: Re: phosphor-hwmon refactoring proposal
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
Cc: Patrick Venture <venture@google.com>, jolie.ku@ibm.com,
 Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 18 Oct 2019, at 22:44, Brad Bishop wrote:
> at 6:26 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
>=20
> > Hi Brad,
> >
> >> I have a quick phosphor-hwmon change proposal I=E2=80=99d like to g=
et feedback
> >> on.
> >>
> >> One issue with phosphor-hwmon that has been brought up a couple tim=
es
> >> now  is that it gets its configuration settings from a file with a
> >> path in the  filesystem that mirrors the path to the hwmon device i=
n
> >> the device tree.   This is problematic because the device tree path=
 is
> >> not required to be  stable, so whenever things move around there, t=
he
> >> config files all have to  be moved.
> >
> > Yep, sounds like we should find a better approach.
> >
> >> The proposal is simply to quit passing the configuration via the
> >> environment and instead look for a config file, the location specif=
ied
> >> via logic in the application, with a path like:
> >>
> >> /usr/share/phosphor-hwmon/i2c/2-004c.conf
> >>
> >> This is the path to the hwmon parent device relative to /sys/bus
> >
> > We want to ensure that any of those paths use persistent kernel
> > naming/numbering though. In your example, we would need that i2c bus=
 to
> > be guaranteed to be probed as i2c bus id 2.
> >
> > There are facilities in place to ensure this happens, and as far as =
I
> > know we are currently using those, but we will need to ensure that s=
tays
> > the case.
>=20
> Can you elaborate a tiny bit on what the facilities are?  I just want =
to =20
> convince myself we are in fact using those.

One is aliases in the devicetrees, e.g:=20

https://github.com/openbmc/linux/blob/dev-5.3/arch/arm/boot/dts/aspeed-g=
5.dtsi#L11
