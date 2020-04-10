Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC161A3E69
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 04:41:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z2MY1QvQzDqY4
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 12:41:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=BxSpnNQb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=En87MV1r; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z2LK6XN9zDrNY
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 12:40:25 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 892665C01F4;
 Thu,  9 Apr 2020 22:40:12 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 09 Apr 2020 22:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=T5ZWDL9asyTPvGZG/0sJWdT7kUN+1DU
 TIViFvOvx5GE=; b=BxSpnNQbkJ/Vc7W7ME4G1WknncOk2vM23MFpOpLQ+mO7WJp
 DQh/AE8ob7gYQXwewlWg7rmkEt0ZRrJZZJ7c+aZJoxSz8RtI76hLb1n448BP3gK6
 7+b95bicBQZvdvb3jpOvFp7sMwYPQoZ4umSEebU2pqt7iqwCkT+wevbTQ3IzXTuB
 tAHOiBTwtqtRCjpPm4iwWkUDAFroe1CcrczbdT89fRXcB7s6cmW506U6NzzloGrK
 0j56kSuqhBQsJF88seuabPbgwXOEeUFpwKSnjeOyqknFDHu9c2apatFNvtjf+cw8
 BXbXZTB59SbEAbCGmLNpIHShSl5mW3q49fO5eqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=T5ZWDL
 9asyTPvGZG/0sJWdT7kUN+1DUTIViFvOvx5GE=; b=En87MV1rG2S2pODxygpX8k
 Z/zHNm3R0+EjgaMe9C2cqZtCOECKQPWiuibruZlT6NzTZe0KdtBSezwXNXsyFB0G
 kfhtdpU3d9XAZFpNwHup6t+1GUjeI4DM770n5zbasz2fZu1Y4YaeVhal4dh6GeW9
 mq8vJhq4WqvYJIRx2ZS6xyK5Ia1adXUv7+lYolIF83vGgQQ9SevPdSrguDIGiiT5
 VRQIwHXAbnvFt+7V+XY7zzC4mf07f8gjd3Erhv7Vr44MtSytXkJ5gCiYoeORS1HL
 +rc46cs2lzC6nxi5sNGZRAQ3z3CGfHpHhlwC0lsnBTk7cdlEzSjXKdhi2J9tNtvA
 ==
X-ME-Sender: <xms:i9yPXhKzouEgHVR8ufXuFkH8z22TlXhSCHeWe4amiev7Qst5grdz9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddugdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:i9yPXnhSMY4rsqqpaQYKsX0ySGjIV4R9mVFmaDGZxOJQrBOI5DhICA>
 <xmx:i9yPXlRukY2oZqVVAo_hzEb2pV4_-2nfcFFxMewiUCxroHU4xkMoVg>
 <xmx:i9yPXsYsG8sEfClE7Js7Mz6BoUy4Ne0HYKBn8Rl5gAzz2k_smeeigg>
 <xmx:jNyPXtOj7tVVEEilxrtwHq3LfRZCb4_bE0YsgwQMAnY9bYKgjNKz4g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A61B7E00A5; Thu,  9 Apr 2020 22:40:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1104-g203475c-fmstable-20200408v2
Mime-Version: 1.0
Message-Id: <02609dd8-ccde-4126-961b-9ae1a4229870@www.fastmail.com>
In-Reply-To: <b75bce785fbc4bad8c053ed2261102c2@zhaoxin.com>
References: <b75bce785fbc4bad8c053ed2261102c2@zhaoxin.com>
Date: Fri, 10 Apr 2020 12:10:36 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tiger Liu(BJ-RD)" <TigerLiu@zhaoxin.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Eddie James" <eajames@linux.ibm.com>
Subject: Re: OpenBMC : KVM over IP and media redirection function
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

Hi Tiger Liu,

On Thu, 9 Apr 2020, at 17:26, Tiger Liu(BJ-RD) wrote:
>  
> Hi, experts:
> 
> I have a question about KVM over IP and media redirection function.
> 
> Intel provided a RMM lite component, which provided KVM/Media 
> redirection capability.
> 
> 
> So my question is:
> 
> 1. OpenBMC + AST2500 Chip, could not implement KVM/Media redirection capability?

Do you have more specific questions? Are you porting OpenBMC to a platform
you've developed, or are you just trying to use a system that has a BMC
implementation base on OpenBMC?

Regardless, I've added Eddie in To: as he implemented the KVM support. If you
are trying to support KVM on a platform you're developing then he can likely
offer you some advice.

> 
> 2. If wanting to use KVM/Media redirection ,must buy a RMM component?

OpenBMC has no concept of an RMM component.

Hope that helps.

Andrew
