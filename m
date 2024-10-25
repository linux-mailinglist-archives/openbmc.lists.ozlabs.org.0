Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C32B9AF5F6
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 02:16:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZNcD3Lr9z3cDt
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2024 11:16:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729815368;
	cv=none; b=BKgIARkQ2r1TNvq1aH8VL89IcGnzwLBg1acOipnvvBGfslArn8HuPa3nqz5jkAkA763mtmNaSVmlYaFDzdEvvstTV/J6jhX0TUKLAy6iy/zwM4qWsWKam6++j4qv+SfGTNK3101s7f0Cl5EjxZdjLs7Op7Onemtuo3JL9zdylc9XBnRbtvLRoUXceYj7OxBlBrbsg+S8Yd9UIe6T7aC/DeerUR2deXR58rKhs55abcrEcaf+WAReA1YM0tefbTMA67vvre82I1wASclAwaRHQMbnnubqNi/uEY6NUNNRPVUbmfdKMDTAlPNBggFOoP1tplIwVAcBrQ7vlykOjI/m/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729815368; c=relaxed/relaxed;
	bh=ns1ald87qt1gqCmT58j8v7HUZhlPtry/TNup+6aiyls=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fVTEBTtU1VTlkClBILffvNcWRRHdtaUQ17vqbK9AZKj/D3/BWOouUJm7RMWs23XGIUAXkbkMKS7ZPDMa53+phOaUaXJok36D7799YPUBLcfs/9vgxGmWV0+KKhfL8ceCg1Y1NF2d3tuXVVl2Xj3Tka0HyUEbR2Znu94gFYy3v601i5b74mWfVqsL1gIYCK1MlWi6pqbKiVbH5xL2h6413/BfERPgNjKNu543+8JUGN0fOay1oj4z0ajnPj5foPFtq/lBQni7slNJ7YDkYIaN2XsUdauglL6QahFjPs6c8IvSX3wjM3dUKRa8JZaYNqvNteOgSF2EIt1A3dK55uQiLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a2oAY/3N; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a2oAY/3N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZNc81bmQz2yLg
	for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2024 11:16:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729815367;
	bh=ns1ald87qt1gqCmT58j8v7HUZhlPtry/TNup+6aiyls=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a2oAY/3NwAPOrYq/Ij2m5wMCodul+/3Gg0fQqjDsGj4BAzOs4VFSU0laZbCH/IopV
	 f3lzn0r8Lybc0O2HK4meewMcJfwTuqBk37cP5ek56Xbe6ruyP8T0MAnBJg2c4GxnkC
	 7Db7YtW0Z9c/3gLcTnrGQ+zeN6j5kgpIfqxjq8EPUJrcaKyZAAJYaZpVwdE/kW1gll
	 IG6B8AlULcNdHOH/qc+E5iUFThTP5G+WA6SwPs1zx0PHqm7bA4rCjIInAlwqkGVLPZ
	 tJWM8NIssPreM1wh4GOEgYtiz5h061dd77bu/LTXMbohBXlE+tP8zryW4yV9D0TmqY
	 oioIDSWc1N/8A==
Received: from [192.168.68.112] (ppp118-210-190-208.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.208])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 46B2369AC6;
	Fri, 25 Oct 2024 08:16:07 +0800 (AWST)
Message-ID: <9c048e8a161e59aece0acec324eeb48291abec8c.camel@codeconstruct.com.au>
Subject: Re: OpenBMC and the Yocto Project
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openbmc@lists.ozlabs.org
Date: Fri, 25 Oct 2024 10:46:06 +1030
In-Reply-To: <9939a99a8397f4473f21dd2931a6340ee552df68.camel@linuxfoundation.org>
References: 	<9939a99a8397f4473f21dd2931a6340ee552df68.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Richard,

On Tue, 2024-10-22 at 21:33 +0100, Richard Purdie wrote:
> Hi,
>=20
> I know OpenBMC uses the Yocto Project and we occasionally see patches
> from you. Some of the companies involved are Yocto Project members.
>=20
> We're working on creating better information about who is using Yocto
> Project and thought that the BMC use case might make an interesting
> example.
>=20

Nice!

>  I looked through the openBMC docs but couldn't really work out
> who the right people/group to talk to was about that.
>=20

Posting to the list is fine, though getting in touch with the current
members of the Technical Oversight Forum is probably the answer to your
question:

https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md

... we should probably put the email addresses of the members into that
table.

>  Is such a case
> study something the project would be interested in and is there someone
> we could work with on that? It should be good PR for both projects.

I'm interested in it, at least :)

>=20
> While I'm here I've also wondered how you're finding Yocto Project and
> if there is anything we need to discuss. We tend to assume things must
> be ok or you'd be talking to us but if that isn't the case, let us
> know!

I've Cc'ed Andrew Geissler and Patrick Williams who have been battling
some turbulence with recent OE updates in OpenBMC.

There's a series ending roughly at the patch below that's trying to
deal with the fallout:

https://gerrit.openbmc.org/c/openbmc/openbmc/+/75338

Andrew
