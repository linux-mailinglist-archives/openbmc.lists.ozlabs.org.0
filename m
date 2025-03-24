Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8497A6D3A6
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 05:56:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLgjd5lKbz3c1w
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 15:55:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742792146;
	cv=none; b=eAthUux2OzWx9gjoSmHR2FI1k2gEejSsvoAuqyCRufaSouNP6FB3HVRPnV51lwM35MBwx0XoE5Q+M/TeTvDoH79Jn0veFFrjFNxQQNumQz0a70wkRlKsxJsMLUxhEwH36sXyCFhPgVDAV7s+k4APPjKvEAVwZxjM73r5P6wcRDaFwdtkYgQgnqtVM8iMP5TvRsQJC1oB6F98zN974RtWQvwxKJxr2w0+uDOnXhxKq9CfQAClWTVL4S1qqiWIVoGXUY6DwxkDNpJ4+rsyhn3NLkg8eCR3nxr17ZNUH5PoABm7FnfbzR6YtytgLghofoklsV6B/yBrzpRAcKyjL9C2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742792146; c=relaxed/relaxed;
	bh=bhM0Rv8U/d3EjWheMdKUcVtcdLtHBlcg7L/j3tw+fXE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YZpfcG2x7grPRbmtgEe4Dj7fIyLZW7lnQrGteEpaelc1Ii+G1pySK7QzbPYD+e3HDruuTn6iYqdbhkrkS3jZCz8erVrVxpcLnUG5f6fcl+b2D/6Vl88Ixu4QpZirrNJkmnYNmLqtr5Ew+PTr/f5CH6p8szj/epYAyIq0KeBT/Ozc4sag5D1P9GD0DFAidbJD1qFsn2PotyfeOLNNnLtKVUknBFnEiJpTW49hoQivDykBh5b2hP2f3T1F0ANViVMAEMP6qHQ4XpfP/G1VGtZrj/FSI4YLDu52B7KyvomckfOX5fS56Pvf0SaAIBPa1JW+l5tWhtjto6PtErFiI86CQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=If8Vg5ji; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=If8Vg5ji;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLgjY1RQDz2yGy
	for <openbmc@lists.ozlabs.org>; Mon, 24 Mar 2025 15:55:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742792142;
	bh=bhM0Rv8U/d3EjWheMdKUcVtcdLtHBlcg7L/j3tw+fXE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=If8Vg5jijIhIi9K64nv9mvKBkGftWc2XEE1Y9BhoiOOxKISXDdXHb++M2wTBpM0O6
	 9sZuagYjmt2nBCjmIz5QPp9SEbrXyxvc3p/6HGhcT0ZocmjYBJzPxm3q2Be13rcdvL
	 OaHiSGy0TVpV8q/tc3TLyLGSKie5MrhUHi37W3aOx4cl/KPBFPVlEROnLnnUG6JFxf
	 d+5L/SQmUsN6MCMUnoqk+bNXR9RLj0NqCFr5WXSApv35deFzzgi4kErswKaEQy8qtU
	 x4SI3gpd1lBjeg5JcJqibLCOqLxtia6uWzvBCrXVFstiovFjjwgScKeCr/UoYm15Xs
	 9KDQpNnvDlvTw==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 18F8F7867E;
	Mon, 24 Mar 2025 12:55:41 +0800 (AWST)
Message-ID: <a0c23f3a3f6f281e8394a396686828bc30c173b2.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/4] net: phy: marvell: Allow targets to skip MII RX/TX
 errata
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Paul Fertser <fercerpav@gmail.com>, Timothy Pearson
	 <tpearson@raptorengineering.com>
Date: Mon, 24 Mar 2025 15:25:39 +1030
In-Reply-To: <Z98bdd2GIxONrPpm@home.paul.comp>
References: 	<1982610042.19586749.1742574604453.JavaMail.zimbra@raptorengineeringinc.com>
	 <Z92lMNqRcWrdmMrS@home.paul.comp> <Z930epdwnOw+9DkR@home.paul.comp>
	 <709373445.19801813.1742664263471.JavaMail.zimbra@raptorengineeringinc.com>
	 <Z98bdd2GIxONrPpm@home.paul.comp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

On Sat, 2025-03-22 at 23:20 +0300, Paul Fertser wrote:
> On Sat, Mar 22, 2025 at 12:24:23PM -0500, Timothy Pearson wrote:
> > > On Fri, Mar 21, 2025 at 08:43:12PM +0300, Paul Fertser wrote:
> > > > On Fri, Mar 21, 2025 at 11:30:04AM -0500, Timothy Pearson wrote:
> > > > > Upstream-Status: Pending
> > > >=20
> > > > Pending what exactly and why? I guess you're supposed to send your
> > > > series upstream (to Linux devs) first, then after they're accepted =
you
> > > > can ask for backporting them to OpenBMC tree. There're exceptions b=
ut
> > > > you need to provide a rather convincing reason for that I guess. I'=
m
> > > > not saying that in any official capacity, just as a sidenote, Joel
> > > > will clarify if I'm wrong.
> > >=20
> > > Huh, it wasn't at all obvious to me that your patches were meant for
> > > U-boot, not Linux, sorry (and you didn't specify that in the
> > > subject). There slightly different rules apply, but in general my
> > > comments should all be still relevant. Overall impression I got is
> > > that you're adding a bunch of hacks and that most things about them
> > > would need to be heavily reworked to become digestible for upstream. =
I
> > > hope more experienced developers will correct me if I'm wrong here.
> ...
> >=20
> > I am assuming that new OpenBMC platforms can be merged into the
> > U-boot tree here vs. upstream U-boot, as upstream doesn't fully
> > support the ASpeed device?=C2=A0 When I attempted to apply and test to
> > upstream, there was a lot of missing code and it wasn't clear at all
> > that the result would ever be bootable on typical OpenBMC hardware
> > designs.
>=20
> It looks like like the current state is that people send patches like
> [0] and [1] (notice the subject line, recepients, informative commit
> messages etc),=C2=A0
>=20

Timothy: Yes, please put some effort into conforming to community
expectations such as those outlined by Paul, as well as producing a
properly threaded series of patches under a cover letter.

> then it gets synced to OpenBMC by changes like [2],
> then probably it used to propogate to Aspeed [3] (interesting how they
> have a much newer branch but everybody is still stuck at v2019 one).

I'm short of time for the most part, but if people would like more
recent trees then maybe we can start to identify where the work is and
coordinate on making progress.

Andrew

