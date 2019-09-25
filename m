Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11506BD75B
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 06:29:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dQ711qxhzDqkT
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 14:29:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fEjGN5GY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="H+jN27zo"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dQ6C6nkGzDqB3
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:28:19 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C51A2220F4;
 Wed, 25 Sep 2019 00:28:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 00:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=Do6owN9rq6FwSm9C9xkYcp4wIRGmcFN
 vlbeAP0ujpZw=; b=fEjGN5GYHuuuzRyCfQXMX9Q8ogWC1jiXxP1IrO/wQ1+sLvo
 whpfpI9Ahjy4x/hP9pP+whvbbBa+q0swd3ovyFXFQeVdeGrRCW66TYC1uwnDyhd+
 tJJY+fJhaf7duBgi1DCvaeOVDeEgXGXAr9tr35wyozeJGtJrE1qT1lHBOrWzSvAm
 yXUYaBShm/jzK/M9Exs4AbDnjwreq4fOa1g2t0vQ9k330hscC4IrPsbBkLI4Yj9o
 HKJ/WuEMqvCInU8cKV03gc6V2v42EBKkfOVBPbhoOSziBusicEVEiA1o6CdmCQFZ
 WqFifDJqztPRTRMfcj4XhQ+qbs94eNhbBQ06fDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Do6owN
 9rq6FwSm9C9xkYcp4wIRGmcFNvlbeAP0ujpZw=; b=H+jN27zoRPh6lxDMiaNA6c
 49TlX2couLiN7lT5x3wOpTZDntPGsR6m6AVulqhvBc6UvX+ZesGy1MM9soqgMV8U
 WrKJCJZSy+dQf31TgSJxcMcby7OCJBX+b6nfvIkCBYjQyHdJSE5mpJ0gYLEDWbbu
 wX0K2sR6C3N8NNSN1RZB+7s+q1YjXDyQyFWFFqZJlY4A8WJ4gPf9PY/5vj026Z8o
 lQKsGbwE8hDHECY+ZzQaefYYUw8LqJ37tAdxw7ORexCC+m+uc9mm+o+gUYJaZqqj
 UcuT+sWiB8NnGB6yEAF0OxfTf9WMbn3GsR5oP1gA07eSZ03ZQrK0MUiEO8qCwJsA
 ==
X-ME-Sender: <xms:4OyKXQOMdhoVk8ABpQC8uC2PckI043hg9z89PVvM45boZgp5L27s5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:4OyKXV12eHbYdyEslxkCLgbbwgOXgQJ6Hlg11NrAWyyD0GGD-mBHnw>
 <xmx:4OyKXXp_1FQde5UCyozgk3Ti3V0WFYQGfComCNqUuyd4xMWATrWAng>
 <xmx:4OyKXdvrvoS8vKwEHyhqhJHqsk2hcPcVpnamDI1yt8FSR0iK8rhPtw>
 <xmx:4OyKXQzJW8TeA320xZ3z_qpPgojsfoxUyFfKRvEd3Wyp5dxY7h3bvg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 21025E00AF; Wed, 25 Sep 2019 00:28:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <9f7cc18d-2164-4a39-8f47-1a3ef3220685@www.fastmail.com>
In-Reply-To: <CAN34fowBHmprS9Wmo+GQkDEtxsz2s514j5+zO-rGvTWeMnzjOg@mail.gmail.com>
References: <CAN34fowBHmprS9Wmo+GQkDEtxsz2s514j5+zO-rGvTWeMnzjOg@mail.gmail.com>
Date: Wed, 25 Sep 2019 13:58:58 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Stephen Beckwith" <embeddedsteve@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Unable to boot OpenBMC image in QEMU for AST2500
Content-Type: text/plain
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



On Tue, 24 Sep 2019, at 06:16, Stephen Beckwith wrote:
> Greetings,
>  I am working on a Proof-of-Concept for OpenBMC. I am familiar with 
> SP/BMC setups using proprietary code. I have successfully built the 
> OpenBMC project (in a VM running Ubuntu 18.04) as well as 
> building/installing the eSDK. Note: system was built from a ZIP from 
> github, git clone failed due to access rights.

How are you cloning it? Might be some issue with SSH vs HTTPS.

>  When I completed the process, I tried to load the available image into 
> QEMU for ARM (which was also built) and received the following 
> error(s), depending upon the directory from which this is run (which is 
> also a question, why the difference?)
>  I was successful in booting the Poky example from Yocto for both x86 
> and ARM into the respective QEMU machines, for the minimal image. 
>  Any pointers would be greatly provided.
> 
> Regards,
> Stephen Beckwith
> 
> Failure #1: QEMU Hangs:
> ==> Fresh shell:
> 
> sbeckwit@ubuntu:~/yocto_dev/openbmc-master/build$ runqemu qemuarm
> runqemu - INFO - Running MACHINE=qemuarm bitbake -e...

You're running with the wrong qemu machine - the generic 'qemuarm' machine
won't work for the images the build produces. You need to use one of the
BMC-specific machines instead. Note that OpenBMC doesn't properly
integrate into the runqemu scripts, and you're often better served by invoking
it manually or (and!) sending a patch to make runqemu work properly.

We have some info on running qemu manually in the cheatsheet in the docs
repo:

https://github.com/openbmc/docs/blob/master/cheatsheet.md#using-qemu

Hope that helps,

Andrew
