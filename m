Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2362265BA88
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 06:44:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmMBJ1yBgz3bgF
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 16:44:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T0juNQOr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T0juNQOr;
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at boromir; Tue, 03 Jan 2023 16:44:07 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmM9g6Qm5z3bV1
	for <openbmc@lists.ozlabs.org>; Tue,  3 Jan 2023 16:44:07 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CD30D20037;
	Tue,  3 Jan 2023 13:36:57 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1672724218;
	bh=F6TZopetU2MLdka5zV1SO/iqdR8kDAu/GhuDjp6Kr0I=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=T0juNQOrdwJ/kCcjtrR8k3dcuxHVukN/5FbksiReNW5WcU2jqCND6lu8nCg7+LM+Z
	 aQJxr2emJPEwNZ3A1MRzo1soWXOp6EgD6pbqj/vXHyTxGYhcykHYx4/yZ1JHMCwRpC
	 VHPGQ+rzU67+MUjrosU6WkIXUxPq5L6vAAELSI6MleSMpvwF9RwMyqUAdLP2sIL/3V
	 /x/d2BFXf+n1XBynAJGhtsWLtnpfy6kkQ7NPhXNmL/LyvctJH6Fmfn9J5fpmn1APgy
	 Z+5fEFtN+j6R+honkN3pFOBLcJsf+bp+KD55dmNZU7WattWIuE4F2bbkozhVjpGMig
	 48TFSymsGnEVQ==
Message-ID: <adb27a4e0bc05dd29ef2b4024876a0a312a8f262.camel@codeconstruct.com.au>
Subject: Re: Virtual Media repository request
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>,
 openbmc@lists.ozlabs.org
Date: Tue, 03 Jan 2023 13:36:57 +0800
In-Reply-To: <8a15e91f-a8a1-0a70-1006-d07dafdd7b34@linux.intel.com>
References: 	<DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
	 <YbDjsxZYYtnNPsCK@heinlein>
	 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
	 <YbdwYODNRJPuRady@heinlein>
	 <5c98b6d46d71907242f1d868cc3d918db99cea53.camel@codeconstruct.com.au>
	 <CACWQX819tsUA6t190mVp8LrrHbteiP4w-35MEH9LG9mWTvYgxw@mail.gmail.com>
	 <d9ea11af-4b30-3424-5b1b-e0a51dde28f4@linux.intel.com>
	 <8857fb3c25b2e3918dcda00f04710b3e9f84f1d9.camel@codeconstruct.com.au>
	 <592e3b4d-2125-22b7-2413-0aa0857c9fe8@linux.intel.com>
	 <4ab2d31e-4433-5987-c2ad-8f3d4ce50090@linux.intel.com>
	 <8a15e91f-a8a1-0a70-1006-d07dafdd7b34@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-1 
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Przemyslaw,
> I would like to rise the request for new service of Virtual Media=20
> repository once again.

Sure! I've seen a lot of gerrit updates happen recently, but it looks
like they're failing verification. Is there a particular challenge that
you're facing there?

> Recently I've made an attempt to push VM service patches once again=20
> after UT has been added.

(what does UT refer to here?)

> In the meantime, I've noticed that in order to make a graceful
> transition between old and new solution the final
> switch between the old and new code should be made at the moment when
> the last patch is accepted.

In this case, I figure the approach is to just make a wholesale switch-
over to the new codebase; so, an incremental patch series may be a bit
onerous on you for not much community benefit. Since you'd be the
maintainer of the new code, I'm happy with whatever approach gets you
there :)

There was an earlier decision to use the same (jsnbd) repo for this,
rather than add a new repo and do a switch over. That wouldn't be my
preferred approach, but still seems workable - is that the issue you're
looking to re-review? Or something else?

Cheers,


Jeremy
