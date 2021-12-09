Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C70A646F792
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 00:36:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J99Qp5SYFz3bY9
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 10:36:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=H/zT7lQ0;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=eif43q45;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=H/zT7lQ0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=eif43q45; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J99QK47Q8z2yjS
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 10:35:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D54313201D59;
 Thu,  9 Dec 2021 18:35:48 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Thu, 09 Dec 2021 18:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=nQ9SR
 VtktTrg4J39KYnIs+fv0Yz4TzdMYspdZ+WUvec=; b=H/zT7lQ0m7duyNt1i0FPM
 iOQQnvqIdlClfO7C9kUe4GajZi3zH0sDRXIyDtdvFV8wQH2j/MLR7BKzDMIGNOX+
 vK1DPme4QUUM10IcpMwAJN1wtHq2PaCdZGOo95RLkxzzC20pwxAjf3ll58bCIFNO
 9bpPplsoVeChtGt2YPu75/tGuA3+8b1vNl7P4QaJyoM23Uz30esgukhzGMK9UviN
 83J/fcoZq2vCq+aMBjR5GAHBZEGv954DolZmNchfgrr/OXgXnuYsGFsq1192oUC1
 /q5c7aSMHeolagm0UcVbliCtZYw+5FZ9qVGYgGOr87Rge5PscLyHSM4rgHQeQueC
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=nQ9SRVtktTrg4J39KYnIs+fv0Yz4TzdMYspdZ+WUv
 ec=; b=eif43q45l7KvQ4lAt1JWE2mDX++SDBhEomMa45BvuRb65vVaQmnifvlxa
 S7z3Clkcr3QA/BzyZdjluew8q1DGXslrz5qlhnre7Xkcc7BP/7u5U97bxoEZezY1
 S2yNdFZ9IdimNwvkHtCC7U+STu2WaW4vRR6PJfa9xMXbYUSaBUTXC7N36Zl2tDra
 bOM9QA+qSxrnYrmgFMl8tBeKT3+dIhYTlr4SfoQYw869j5lEiAhuPG/1u1CONlob
 hE5tyu2r2mNNpjnei131JMZLEqdeX4sYyTdnz9QczAKwW/6wGCbHaCDfAFr6pA4d
 aDSt1U8D+civUcwd2A2dOa6Eb21UA==
X-ME-Sender: <xms:1JKyYSR0JRL4SO5FwXhqNBHbpIXFxEO7tHEyxDMUI4gACGJLQzKOSw>
 <xme:1JKyYXzncPEXiZl6b7W-We0KOgcoUwwFmGJr86wOhW8hO0bB_B-ZN1DZC1n1DcAr6
 1D45bZOjdb5Uxu_Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgfgsehtqhertder
 reejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpefghfelhfeugfdvleehkeevvdfgveeh
 tdfgheegtdejhedvkeetvdduveevhefhhfenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmpdhfvggrthhurhgvshdrmhgupdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:1JKyYf1PvCK7KraATs2SVM-3EOcoJ9D3OxUbLToOt4BFHbw34ymQOg>
 <xmx:1JKyYeDIKmLlwwWlxnWUvmAUCDy2QA42uhxWnTMeucHCBQLM0HX8cw>
 <xmx:1JKyYbiLdOdWyoKTTtPQW3RcqMZtTnxoICKqi1-Ene48_mmgwdunNA>
 <xmx:1JKyYbKP0koBbPG3P-RGRMmJt1KsCO7_iPatm5nWxrhRbpgI-04j9g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EC269AC03DB; Thu,  9 Dec 2021 18:35:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4506-g4374de3f18-fm-20211208.001-g4374de3f
Mime-Version: 1.0
Message-Id: <df30fbcd-870a-4d9e-9377-80c0b1a9c3ca@www.fastmail.com>
In-Reply-To: <1639071097-7076-1-git-send-email-dphadke@linux.microsoft.com>
References: <7e7f0779-d6c7-99b3-d88a-5a239440984a@linux.ibm.com>
 <1639071097-7076-1-git-send-email-dphadke@linux.microsoft.com>
Date: Fri, 10 Dec 2021 10:05:27 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dhananjay Phadke" <dphadke@linux.microsoft.com>,
 "Joseph Reynolds" <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday December 8 - results
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 10 Dec 2021, at 04:01, Dhananjay Phadke wrote:
>>> On Thu, 9 Dec 2021, at 05:44, Joseph Reynolds wrote:
>>>
>>>> 4 Progress on BMC secure boot?
>>>>
>>>> AST2600 hardware secure U-boot=C2=A0 boot, then secure booting the =
Linux
>>>> kernel. No additional pieces.
>>>>
>>>> See the AST security guide.=C2=A0 How is signing-key management don=
e?
>>>>
>>>> Dhananjay to=C2=A0 follow up.
>>> As someone who was involved in integrating the AST2600 secure-boot s=
upport into OpenBMC, what's going on here?
>>
>>Someone asked the question you see above, and Dhananjay tried to=20
>>answer.=C2=A0 The consensus was that there is support for AST2600 secu=
re=20
>>booting U-Boot, support for U-Boot securely loading the Linux kernel,=20
>>and no additional support.=C2=A0 Your summary would be appreciated.
>>
>>Is there a document which what a system integrator needs to use this=20
>>function?=C2=A0 Ideally it would be linked from=20
>>https://github.com/openbmc/docs/blob/master/features.md

There's not much documentation as yet. p10bmc can be used as an example=20
of a system that enables it.

https://github.com/openbmc/openbmc/blob/ade3e145ead0beedad181394fcaa6385=
6176bdee/meta-ibm/conf/machine/p10bmc.conf#L39-L56

Given the lack of documentation it's probably also reviewing these=20
patches in the context of the configuration above:

https://gerrit.openbmc-project.xyz/q/topic:%22secure-boot%22+(status:ope=
n%20OR%20status:merged)

>
> Right, I noted recent submissions to U-Boot and Kernel.
> (1) HACE/ARCY support in U-Boot
> (2) OTP sysfs access for logging Secure Boot status.
>
> Need clarity regarding OTP programming.
> (1) There's Linux tool

I assume this refers to socsec? The socsec repo provides two tools:=20
`socsec` and `otptool`. `otptool` can be used to generate the OTP image=20
and exercise signature validity.

https://github.com/AspeedTech-BMC/socsec/

> and U-Boot patches floating somewhere.

I'm not sure what patches you're referring to here, can you clarify?

> (2) Any specific OTP straps preferred by OpenBMC, e.g. enabling alt
> boot (ABR).

There's no real preference. My intent is to add a recipe that can=20
consume a platform-specific otptool json config and spit out the OTP=20
binary as a build artefact. Currently I just have the config captured=20
in a separate repo internally and I generate binaries from that using=20
make.

> (3) Any interest in using encryption besides SHA/RSA auth?

SHA/RSA is what IBM will ship with in current platforms, so not from us.

Andrew
