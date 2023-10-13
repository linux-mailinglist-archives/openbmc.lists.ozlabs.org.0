Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773567C7DC0
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 08:35:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=X013AJo9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6Gvm28Dgz3bfK
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 17:35:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=X013AJo9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Gv75lcCz3bWH
	for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 17:34:27 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-88-154.adl-apt-pir-bras31.tpg.internode.on.net [14.2.88.154])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 69E4A20009;
	Fri, 13 Oct 2023 14:34:24 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1697178865;
	bh=oxfWYUI7h0K41XA0k2jVHN52D1wlCODYlb5XwaJYL0c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=X013AJo9hV66PPO746EtscTSPWnHIh1F3TSoSlzsWTu8y8HIAYyRjiijPWChBBQn5
	 tOIxfY1mYZWX8FRX7dogy2UkEBairNWD+XH76FZAYlKfj1RvxPmAkiE16Nr938AwIW
	 Cgil3mrfTMKwxFdQFrGrE3fg133+09+K+8hlmxqAISrjku8Ci/WmJYpTekaW1sbc4V
	 BG0m3tfOLlFU0gZeaeABW+Y29KXjpBccRADifpoyHHrTC9o2pg0IdbHrcqoMGAn2mZ
	 XPOudcpn8rrSVIpxEQVVkJPy0Sf+C3NYclqL8XQhjP5sdPi1XdVmjBRvk3ZjElL5Fg
	 JhnLAjR4UZfSg==
Message-ID: <0a4277122b61695d802c25d089533d1bdefe64a8.camel@codeconstruct.com.au>
Subject: Re: D-bus model proposal for pay for access features -
 LicenseService at OpenBMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Date: Fri, 13 Oct 2023 17:04:23 +1030
In-Reply-To: <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
References: 	<CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
	 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
	 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
	 <YJLXlNyk/c8IVf9e@heinlein>
	 <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
	 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
	 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
	 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
	 <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
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

On Fri, 2023-10-13 at 00:13 -0400, Brad Bishop wrote:
> On Fri, Oct 13, 2023 at 12:32:09PM +1030, Andrew Jeffery wrote:
>=20
> > I think for this
> > to go anywhere it has to be demonstrated that there's a group of people
> > needing a solution=20
>=20
> Isn't this self-evident from the schema being adopted by the DMTF?

My comment was more in the context of OpenBMC and less in the context
of the DMTF. Standards that the DMTF produce are more broadly
applicable than to OpenBMC, so not all interested parties pushing it in
the DMTF are going to be parties willing to do the social legwork to
gain acceptance for and to maintain an implementation in OpenBMC.

>=20
> > and some collective interest in maintaining one. If
> > we can't get multiple parties to collaborate on a design then I don't
> > see a reason for trying to maintain it upstream.
>=20
> How many parties collaborated on getting FSI into Linux?   How many=20
> parties are collaborating on <foocorp>-misc or <platform>-misc?  Are=20
> those different somehow?

How do FSI, <foocorp>-misc or <platform>-misc run afoul of common open
source beliefs and values? FSI is a specification and implementation of
a communication bus for processor management and doesn't particularly
interfere with any open source ideological principles. Implementing a
subsystem for it in upstream Linux doesn't impact anyone's ability to
run, study, share or modify the software on their system.

What we're discussing here is a community-endorsed implementation of a
license server that exists to constrain people's abilities to run,
study, share or modify the software or hardware that composes their
machine. That certainly isn't supporting the principles on which open
source software collaboration is often built.

I'm asking for a higher bar to establish whether a license server
implementation that constrains user freedoms is something the OpenBMC
community significantly values. Satisfying that (in my mind) requires a
diverse set of community members come forward and demonstrate that
they're willing to collaborate on design and maintenance, as a proxy
for value.

However, there is an escape hatch for project social issues. For
example interested parties might choose to collaborate on the license
manager implementation outside of the OpenBMC org, and package it
through Yocto or OpenEmbedded.


Andrew
