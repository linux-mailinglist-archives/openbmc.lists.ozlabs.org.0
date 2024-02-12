Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 883CA852188
	for <lists+openbmc@lfdr.de>; Mon, 12 Feb 2024 23:37:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ltxsz3X1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYfV34vj0z3d2n
	for <lists+openbmc@lfdr.de>; Tue, 13 Feb 2024 09:37:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ltxsz3X1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYfTP3rM0z3bnL
	for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2024 09:36:57 +1100 (AEDT)
Received: from heihei.fritz.box (ppp14-2-125-29.adl-apt-pir-bras32.tpg.internode.on.net [14.2.125.29])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4E63A200EE;
	Tue, 13 Feb 2024 06:36:54 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1707777415;
	bh=4qqKOfEqxXoC88/2/Nu2iidqb9k1pRWM1h2UkXN62RM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ltxsz3X1UDpDChtM1orgH0dBllYQIo3LjZjpVt61YMFxerm1XCCH61EePhG23YA39
	 KpZZjr49oU3QdWH0y1TOroQX+FQiCWXNsx7aPEBlFXgITVD8sZWvsXtPKAyS+Q+zKy
	 ljv1XJL7Vs7ybx5tnECVTT/FdBS6Gk+R6CnLUq4+mkYFb1iJjKmpkRsAz+TC9A71A+
	 H89IOK6xt/Y6gBiDx9rSrU5dNLwXv5a+9lTCKLJElPKUWXNPI0bye9vtH4V29HTf+Z
	 GnaTvApJ+hLQX5YndSuIZe1JsxiaSXmtCVtSyQODh7Jf0PU42mLMcCq/V0QEOWg8dA
	 gz6xF/AcLxzWA==
Message-ID: <874a7f5aff1452173c2b145f7ccd25302e1569c8.camel@codeconstruct.com.au>
Subject: Re: File Manager Service in OpenBMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Sunitha Harish <sunithaharish04@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 13 Feb 2024 09:06:52 +1030
In-Reply-To: <4cb036ca-aedb-4fae-a09e-9a783a9adb1f@gmail.com>
References: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
	 <34f3ba2f2279f5c63b20b7dc0da80f3de53a0768.camel@codeconstruct.com.au>
	 <f7de9480-d92e-462b-ac8f-8e1d3c90b886@gmail.com>
	 <eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au>
	 <4cb036ca-aedb-4fae-a09e-9a783a9adb1f@gmail.com>
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
Cc: gmills@us.ibm.com, ed@tanous.net, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Sunitha,

On Mon, 2024-02-12 at 20:34 +0530, Sunitha Harish wrote:
> On 12/02/24 3:45 am, Andrew Jeffery wrote:
> > Hi Sunitha,
> >=20
> > On Fri, 2024-02-09 at 11:23 +0530, Sunitha Harish wrote:
> > > Thank you Andrew for the reply.
> > >=20
> > > When IBM manages a single server with multiple management
> > > clients(redfish clients), they need to save some server related data
> > > (host data) in the form of files at BMC's persistent file system.
> > >=20
> > What are the specific use-cases though? It seems that we've jumped
> > straight to an implementation detail (persisted files) when it's not
> > clear to me *what* it is that's needing to be communicated to begin
> > with.
>=20
> IBM has usecases implemented under /ibm/v1 path at bmcweb, which uploads =
and manages files on the BMC.
> These are APIs to Create, Update, Get and Delete a file.

These aren't what I consider use cases though, IMO they're behaviours
you might need for an implementation of something supporting a use-
case.

Given you have files, what is their purpose? Why would someone upload
one? Who is it that's uploading the file? What are they trying to
achieve? What's their motivation? Can you enumerate those reasons?

>=20
> >=20
> > Discussions in the abstract in the context of a specific implementation
> > approach feel to me like they might struggle to gain traction.
>=20
> This is the primary usecase of IBM.
>=20

But it's not something I'd categorise as a use-case. It's a specific
implementation strategy for something else, where the something else is
probably the use-case I'm asking you to describe. Use-cases should
involve discussions of actors trying to achieve an outcome with a
system. Who are the actors? What are the outcomes they're trying to
achieve with the system?

>  But, if there are any other way of getting this done in a any other way,=
 please suggest and we can work together on that.

I'm unsure, because I don't feel like I have a solid grip on what the
use-cases are, in terms of what someone would be trying to achieve with
the system.

> With this email, i am actually looking for someone who may have similar u=
secase of providing the user a facility to manage files at BMC.

I'm hoping that by clarifying what your use-cases are it's easier for
people who may have similar use-cases to identify themselves. It would
certainly help me be satisfied that re-implementing a filesystem on top
of DBus is sensible, because on the surface it doesn't feel like it is.

Andrew
