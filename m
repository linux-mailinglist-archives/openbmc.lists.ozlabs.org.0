Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F7C7C7B73
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 04:02:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MGDiDOl5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S68sj0Rcpz3cMH
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 13:02:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MGDiDOl5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S68s36PJtz3bdm
	for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 13:02:15 +1100 (AEDT)
Received: from heihei.lan (unknown [45.124.203.15])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D4C0220009;
	Fri, 13 Oct 2023 10:02:11 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1697162533;
	bh=h18ARNDdsVUJP6UHQHtka6H4s/7kdpnBIVQQG+owbuw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MGDiDOl57Evdx66Ru9HkPdVDDQexQ2FqfSyTnDpJTcCCIuTPeKaVY/yaHRDdhbSwH
	 SHwWoBVpchbgAZ5m4YtDOnNv++n0ZD1sdGs2Ahvc61fw3K+8PF4lv4fiS4Dv94qWul
	 6Snki52fOdDOq2/2TIKMSuuGP3IEB2rjnImP73ERsT+msuDSnMBJX2nkAe02GJUHoe
	 dwB/jclodR0hY50+FIttTt3K4S6/uI85nCDFuegUgCDIpo5LF8Qq+uXWjtnOFOoVzN
	 9vQa0Qor8BIrV/iDD8b0YRjaSLrFZErjVfAN5TSeSOKy0jmlc8odSNch6qsHMeSBeN
	 9IYNyAtwC753w==
Message-ID: <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
Subject: Re: D-bus model proposal for pay for access features -
 LicenseService at OpenBMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Patrick Williams
	 <patrick@stwcx.xyz>
Date: Fri, 13 Oct 2023 12:32:09 +1030
In-Reply-To: <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
References: 	<CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
	 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
	 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
	 <YJLXlNyk/c8IVf9e@heinlein>
	 <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
	 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
	 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, Sunitha Harish <sunithaharish04@gmail.com>, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2023-10-06 at 13:17 -0400, Brad Bishop wrote:
> On Fri, Oct 06, 2023 at 07:29:27AM -0500, Patrick Williams wrote:
> > On Fri, Oct 06, 2023 at 10:21:01AM +0530, Sunitha Harish wrote:
> > > Hi Patrick,
> > >=20
> > > Re-starting this discussion with the design that is being worked at
> > > License Manager: Add license manager design (Ibd6c6f35) =C2=B7 Gerrit=
 Code
> > > Review (openbmc.org) <https://gerrit.openbmc.org/c/openbmc/docs/+/647=
10>.
> >=20
> > I've already written enough on this topic.  You've not added much in
> > terms of what I've already written, so I'm not sure what more you want
> > me to say.
>=20
> I just want to say that OEMs have many, many happy customers that gladly=
=20
> pay for unlocking things.  They just don't typically hang out here =F0=9F=
=99=82. =20
> I just bought a BMC license key the other day for my ~8 year old=20
> Supermicro x10slh-f.  For what it is worth.  I know a lot of people have=
=20
> a problem with charging for security fixes but this is bigger than just=
=20
> that.
>=20

Brad: Given the interest, are you able to provide feedback on IBM's
design proposal?

https://gerrit.openbmc.org/c/openbmc/docs/+/64710

More broadly, setting aside Patrick's legal concerns, I think for this
to go anywhere it has to be demonstrated that there's a group of people
needing a solution and some collective interest in maintaining one. If
we can't get multiple parties to collaborate on a design then I don't
see a reason for trying to maintain it upstream.

From a personal perspective, the concept grinds badly against common
believes and values in open source software projects and I'm not going
to go out of my way to support it. I'm also concerned at the lack of
engagement from IBM on the proposal since reviving the thread. The
concerns raised need responses from the people proposing that a
solution needs to exist. This is a social problem as much as - perhaps
even more so than - a technical one. Both need to be solved together,
and that requires responsive communication and engagement with the
issues raised.

Andrew
