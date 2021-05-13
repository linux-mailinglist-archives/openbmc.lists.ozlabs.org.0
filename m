Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D04D37F056
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 02:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgXXp2wgyz2yx9
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 10:27:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=tBkUG8/6;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hpBW+ZeZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=tBkUG8/6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=hpBW+ZeZ; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgXXQ3cpXz2yY7
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 10:26:46 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C5E0117D0;
 Wed, 12 May 2021 20:26:41 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 12 May 2021 20:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=9qQQH
 jG3XTEYP64m/4Dqqo1k9cEn9V0MBgGUO2IGDhg=; b=tBkUG8/6vSdmZ7SHPm7XE
 +pDgdEtt5j1a57K+inUr5sb5dvXHR4NLbsD1PJdkSRqBaRi61rk2ip8PQ3H8T98m
 1me5G0KO0QOoQKT/8mEaTYFoqPrDZUq9yD5wgDKvlyzgqDfl1permmaTIZQNk5kl
 ITDHD/fciHYJ4aH/Yd1mMacBj8CFeVbn2jeFjiCxWTl/EZDOSXniLPUCrCoczuOH
 3+G0ylVsFtPSV8ytWFsqKvyA2iDdGWyBQZa0FTvaA7qqrUGLItc3NILwJOn1G6tt
 VPGVuwRAykpmLNLwgoHinp5ZRAjoSJG0Wl5MmHOi9fWvYeOjcJ1O9isUkfYRlE0z
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=9qQQHjG3XTEYP64m/4Dqqo1k9cEn9V0MBgGUO2IGD
 hg=; b=hpBW+ZeZ32PabCrcy3z57WO6eyL3WPMx8Vryu8EFI4dX5JOFRy1rat0u/
 Jz6cRNcJftTzePiQmBZVS27DfWv+WtsDX2fs/pul/XgT/CiF8AUvBnF64lPcWGlI
 0WdJtCVQqnI3irrwW+3dBCtnB7mGLYfGDqzQLuKYuZiAQE7ofxemvxt9jDxzzamd
 Vd2zGcVZeipxvBGc+dken/vlRhKUmaVgtqeCJDJlMdO8AzjFJqDRfYYN23jhM9lM
 youZvxVAar/CuzCFB0lj84pxhV2b0cpP7VxB7fQHV0xIsPIWBexX87lMYXOB4qcN
 Se6Llr/UUwh1bs9AwDQADaYtZgv9w==
X-ME-Sender: <xms:QHKcYPeRNiK8F6ZfW_tL09RhonotoJ9hzgfJxeg97rCKIxR6cmsykg>
 <xme:QHKcYFMsCqKyxJGTVizH34r1zsKPjSUZSTAx8ElAmUZzOpmPsKkoOaN-7rZmYyxV3
 e4IgKJcodUdQmLDDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehfedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepofgfggfkjghffffhvffu
 tgfgsehtqhertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoe
 grnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeethffhkeetudeh
 geekkeelteetkeetgfefgeekieeugfetleffudevtedtvdevtdenucffohhmrghinhepgh
 hoohhglhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:QHKcYIjJC_BdKPapa9TH21d3Qhj1W_vbwZx6HU-Fdk0afICn6eVM9A>
 <xmx:QHKcYA9rWMpuukR_jnAJFimg1kNN8jn0YV9j_TMbkBMLFSI7iKwbGw>
 <xmx:QHKcYLvT7IfFa_vtsI5HSvNVO5ATB865nUbNSyaKV1zCi_Y1Djk4_w>
 <xmx:QXKcYI52mpkEokGY1emtuQ6cVxg8HIvOry9BM-khz25ExldlmKSjig>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C6AE0A00079; Wed, 12 May 2021 20:26:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <99f4fa9d-9fc2-4092-be1f-d3246379206a@www.fastmail.com>
In-Reply-To: <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
References: <35156c27-e195-c238-1bb9-d20a30db3c63@linux.ibm.com>
 <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
Date: Thu, 13 May 2021 09:55:41 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: Security Working Group - Wednesday May 12 - results
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joseph,

It tends to be useful to Cc the developers doing the work. Posting to=20=

the list without Cc'ing relevant people leaves discovery of your=20
discussion to chance, where as adding them on To: or Cc: does two=20
things:

1. Raises the chance that they'll pay attention to your discussion
2. Removes the impression that you're intentionally talking past them

Please try to engage the relevant people directly in the discussion by=20=

adding them in To: or Cc.

On Thu, 13 May 2021, at 03:48, Joseph Reynolds wrote:
> On 5/11/21 8:59 PM, Joseph Reynolds wrote:
> > This is a reminder of the OpenBMC Security Working Group meeting=20
> > scheduled for this Wednesday May 12 at 10:00am PDT.
> >
> > We'll discuss the following items on the agenda=20
> > <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQ=
vLxxsDUWmAOI/edit>,=20
> > and anything else that comes up:
> >
>=20
> Three items were discussed.=C2=A0 You might want to start with item 3 =
first=20
> to introduce the first two.=C2=A0 Summary:
>=20
> 1. Security impacts of enabling kexec (load and optionally execute new=
=20
> kernel) in the BMC's production kernel.=C2=A0 How does this work and p=
lay=20
> with secure boot and with IMA?

Have you engaged with OpenBMC's kernel developers? They might be are=20
interested in this problem. I'm vaguely aware of some work-in-progress=20=

patches that allows kexec to load FIT images, which can be signed and=20=

validated. This would mitigate execution of arbitrary kernels and also=20=

helps avoid the problem of shipping multiple kernel binaries or=20
extracting artefacts from a FIT to pass to kexec.

>=20
> 2. What are the security impacts of having the proc file system file=20=

> /proc/sysrq-triggerwhich can cause kernel panics which can cause the B=
MC=20
> to terminate processing?
>=20
> 3. In general, how can you (an operator or the BMC's host system)=20
> recover a BMC which has become unresponsive, for example, because its=20=

> kernel processing has failed.=C2=A0 A design introduces using=20
> /proc/sysrq-triggertogether with a recovery kernel installed by kexec.=


To be clear, the use of /proc/sysrq-trigger is a temporary hack to=20
reboot the BMC in the absence of kexec/kdump. Once those features are=20=

merged the application implementing this behaviour can invoke kexec=20
directly. The slight advantage of /proc/sysrq-trigger is that with or=20=

without kexec/kdump enabled the BMC will reboot, and if kexec/kdump are=20=

enabled then it will automatically take advantage of them.

In the specific case p10bmc platforms the host has access to a GPIO=20
tied to the BMC's EXTRST line, so with or without this software feature=20=

the host can mount denial of service attacks of arbitrary length. This=20=

hardware design places the BMC and host firmware in the same trust=20
domain.

Andrew
