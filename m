Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 073684A7BB2
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 00:32:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jpyl0575tz3bZG
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 10:32:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=nnf/7Xs6;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bNB8JeBb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=nnf/7Xs6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=bNB8JeBb; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpykZ0ZMwz30Lt
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 10:32:05 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 644DD5C011D;
 Wed,  2 Feb 2022 18:32:02 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Wed, 02 Feb 2022 18:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=WcFU68fkJydMYm
 DV0LwV/FDVDH9X53YIHMvXDEADnEM=; b=nnf/7Xs6lcX0ICMXOb5gcGwaxeXdSj
 W1Evjvy9ekw2xpx8s7+GhzERmi2JLsap3kzckUBsKQQRDSOcrgg6RIqPk3biPhK5
 x7AxQGzF0pmSyXsaI+AsQkAkQ8OeoenSZCobF/lDRHDkCCCRDZbkEI5faahMKpOm
 yVq2cqFxZHenzkK7F5XaOijHLD5CNrPW6gAAl77Kw90+gxygRHwkUbqmuNIONgCF
 INqDR9ktscdtBthFPO/VEPzx6oCJ9mX8hnDeupCCcTcENMIy8GF3kCtOHQHfbqX8
 FUpcg+BfYz7Q0IKW0fTXUZ1SiQJKAdFG6fnSD9bcF1S0mUifYvdSYYVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=WcFU68fkJydMYmDV0LwV/FDVDH9X53YIHMvXDEADn
 EM=; b=bNB8JeBbOvaMwi78n65aqJKu5x+BfMttpiJ7bznPz4ZMBhQft5mYrksW0
 bIuW3PN6zBp46bt1vlGDINHUJhGHY2kYMWQ7kp9CnH1B7Q8gt8iIFpUCzNy4rJHu
 bxPlgEa3mrhAUMApuU/o/rk5mBBb9es8HwkIPqy+PZP+zbi756njukCNkHonTPvh
 P6GO9CtWf+kDwf994VxjMKkvonPFK/6/QgPIg/uasFEn+K5cmHAXfFn4ks6nifVh
 6572PgEhDnM4S0tHpwcxiLvnFWXS4D0RlJPiaZhhEb+kMIMNHa9kyyn+esLCVxtH
 mUq+/G4+uSCGX8Pi7afrGBZXgZQ7w==
X-ME-Sender: <xms:cBT7YZXMzf6_RBBBsmSGcJkdFBmA1jh0YipoBXX1VkdIsJ-eZBqGtg>
 <xme:cBT7YZkVwHpbo0HdSRhFZjLPt0PYBDGDwAsN7_WsVO5jZAy_GKE-NKLKCx1m_aFBI
 jHIRAPGu_wG3Y6xJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenfghrlhcuvffnffculddvfedmnecujfgu
 rhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehnughrvg
 ifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrght
 thgvrhhnpeeigfektdetheethfdvffduieeihfeftdfgueetvdffueevudeftdelveejve
 efkeenucffohhmrghinhepghhoohhglhgvrdgtohhmpdhophgvnhgsmhgtqdhprhhojhgv
 tghtrdighiiipdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:cBT7YVYAnWW-PiPUNZAcZp6kJyEAWt4nk4hMtGrjprc4xVgevHnfeg>
 <xmx:cBT7YcXUUXrwYcMqCd48Xb0qyTeZexYyiYksxneP9kRJPaj8CzpJtA>
 <xmx:cBT7YTla4NGWiNCH-3H-ivoAPr7exf8TBUhWSMSFu5r-gIgnEN94Kw>
 <xmx:chT7YYwV_ZNiNJJ8qtvXrJY47Ru7TqKxZzf_5T5EOVf5koXdr7573g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8F360AC0E99; Wed,  2 Feb 2022 18:32:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <c5034623-a22e-47f9-b997-9e22cd00118e@www.fastmail.com>
In-Reply-To: <de58b515-0f0b-4e49-4955-f9144896d313@linux.ibm.com>
References: <5516f17c-5fb4-875f-fae1-00d86923bdae@linux.ibm.com>
 <de58b515-0f0b-4e49-4955-f9144896d313@linux.ibm.com>
Date: Thu, 03 Feb 2022 10:01:35 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday February 2
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
Cc: Christopher J Engel <cjengel@us.ibm.com>, jamin_lin@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 3 Feb 2022, at 07:51, Joseph Reynolds wrote:
> On 2/1/22 9:24 PM, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting=20
>> scheduled for this Wednesday February 2 at 10:00am PDT.
>>
>> We'll discuss the following items on the agenda=20
>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQv=
LxxsDUWmAOI>,=20
>> and anything else that comes up:
>
> Attended: Joseph, Jiang, Dick, Michael Richardson, Daniil, Surya, Jame=
s,=20
> Dhananjay
>
> Note that we started on topic 1 (RoT), and then covered topic 3 (CNA)=20
> before returning to topic 1.=C2=A0 Topic 2 (NoAccess users) was not co=
vered.
>
>
>>
>> 1. followup from previous meeting: OpenBMC=E2=80=99s AST2600 RoT work=
 2.=20
>> discuss the concept and need for NoAccess users and how they would be=20
>> different from disabled BMC user accounts
>
> 1 followup from previous meeting: OpenBMC=E2=80=99s AST2600 RoT work i=
s here=20
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49789=20
> <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49789>with the=20
> underlying OE/bitbake recipe here:=20
> https://github.com/openbmc/openbmc/blob/master/meta-aspeed/classes/soc=
sec-sign.bbclass=20
> <https://github.com/openbmc/openbmc/blob/master/meta-aspeed/classes/so=
csec-sign.bbclass>.=C2=A0=20
> Note OTP refers to one-time programmable memory used to set the signin=
g=20
> key, etc.=C2=A0 Also I (Joseph Reynolds) believe the AST2600 specs are=
 not=20
> public domain.

There's another related patch in-flight that adds the OTP configuration=20
for p10bmc. It might be a helpful reference. The only thing I'd ask is=20
that people use big-endian mode for their keys (which isn't what has=20
happened with p10bmc):

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/50716

SOCSEC_SIGN_ENABLE: command not found
Other than that the only thing that's required is setting  in the=20
machine configuration, e.g:

https://github.com/openbmc/openbmc/blob/bb99d22ecef61f3af21290b1e1ead308=
3f25d20f/meta-ibm/conf/machine/p10bmc.conf#L56

>
> =E2=80=A6=C2=A0 and general=C2=A0 OpenBMC Root of Trust (RoT) discussi=
on
>
>
> DISCUSSION:
>
> Secure boot trust chain: the BMC hardware performs secure boot of the=20
> bootloader (e.g., U-Boot, then U-Boot verifies=20
> {kernel,devicetree,rootfs}, etc., up to starting the application.
>
>
> Secure boot has three layers: 1 hardware validates uboot, 2 U-Boot=20
> validates the Readonly fs, 3 the operation system validates applicatio=
ns.

This is close but could be more general and more precise:

1. The hardware loads loads the bootloader and validates its signature
2. The bootloader loads the kernel and validates its signature
3. The kernel locates the rootfs and uses a mechanism to verify its=20
integrity

Mapping that to the AST2600, we have:

1. The ROM code loads the u-boot SPL into SRAM and validates its=20
signature using the public keys from the OTP

2. The SPL loads the u-boot FIT image into DRAM and validates the=20
configuration signatures over the hashes of the embedded images using=20
the keys residing in the SPL image

3. u-boot loads the kernel FIT image into DRAM and validates the=20
configuration signatures over the hashes of the embedded images using=20
keys residing in the u-boot image

4. The kernel locates the rootfs and uses a mechanism to verify its=20
integrity

> To validate before starting applications:=C2=A0 DMverity, IMA
>
>
> The OpenBMC project is working to support the first layer, specificall=
y=20
> AST2600 secure booting U-Boot.=C2=A0 The intention is then to support =
U-Boot=C2=A0=20
> securely booting the next layer (kernel, etc.)=C2=A0=20

Again, not quite true.

It's already the case that the SPL validates u-boot and u-boot=20
validates the kernel where signing for each is enabled.

Again, leaning on p10bmc as a reference, this scheme is enabled here:

https://github.com/openbmc/openbmc/blob/bb99d22ecef61f3af21290b1e1ead308=
3f25d20f/meta-ibm/conf/machine/p10bmc.conf#L39-L40

The patches linked earlier add the hardware root-of-trust support=20
(generating the AST2600 OTP image and signing the SPL in a manner that=20
can pass verification using the OTP image).

> Also there is interest=20
> in using DMverity and IMA, but no agreements.

dm-verity is conceptually simpler than IMA, but has limitations that=20
IMA can help overcome, so as you say, at least from IBM's perspective,=20
we're still working through the details here.

> Does BMC download applications as part of its intended operation?=C2=A0=20
> Different use cases.
>
> In the base use case, the BMC read only file system has all=20
> applications.=C2=A0 Only developers (and advanced diagnostics) downloa=
d code,=20
> presumably to test fixes or collect more diagnostic data.
>
> Use cases include both validating the filesystem which has the code, a=
nd=20
> validating the app itself as it is loaded (exec=E2=80=99d) into a Linu=
x process.

If no modifications are made to the filesystem then validating the=20
integrity of the filesystem is the same as validating the integrity of=20
the application. However in the face of run-time modifications to the=20
filesystem, IMA's design helps prevent arbitrary code execution by=20
enabling policies such as "any exec'ed file must have a valid=20
signature". Trying to enforce a signed execution environment in the=20
face of mutable filesystems is hard with dm-verity.

Andrew
