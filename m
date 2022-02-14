Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE614B3ED4
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 02:14:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxmV64Q5Pz3bV7
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 12:14:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=m3ay9NNa;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OuMJO+g6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=m3ay9NNa; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=OuMJO+g6; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxmTc48Vjz2xtv
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 12:14:27 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E59D55C0203;
 Sun, 13 Feb 2022 20:14:23 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Sun, 13 Feb 2022 20:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=7JR4Y7IzB3LOXOlTHDFaIp4+pXpiDYodyJe5og
 11GaI=; b=m3ay9NNa8wgufg2gun80DhUAjpYDrP834Ak9uLSrwRRCUJ49NNWpJJ
 XpUkloQk4vVi2UIrSysfDPCaXT2GPOcSbA05gRVHfW6RphmteuclAcnGt6apIyPj
 PDuCb2Uylrgtfzvag5f27uWK1DodQYSq/WoY9goGEb4PfF+uvSjLDW90k7Rqq1CU
 GWEY67Qa2+ooiMvQvYPkMrvtC1eqXr9iy6ur/lyOgJoXVbeSQG1m62K4w6k2MQhZ
 bOxbV2o9YD0t+p+3d8EuLVV7cvD3YUin/3T1fjJJGqvQxyTWgifqPdp0/Uo/AaZy
 B5ikgkZ9HZI7496nyKHol8S46x9RGPRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7JR4Y7IzB3LOXOlTH
 DFaIp4+pXpiDYodyJe5og11GaI=; b=OuMJO+g6keQmoOSADHN3ZjBAnbUDzNm1w
 ChR0xIz81NQ9s/yI9wI8ngs7tb4hggRiOKsMo7A9mWLdKfkANsREuUH0F6ggmT4M
 SqDmjwNREDyzYRNpzqIzifEtzUzWiql31hK2HyCCPYdzOOJiZeueU7Xtsgo7GFKJ
 eCkD/ZIcMsVhrbHmbtIYmo934NfbI1NXmYALU2sgOva4SbhOGoLLD9RlDpJqCsx8
 0FbwYUCMjhQUHIbHpD350S4I8gCCOkQjYSjnV1iMWzq5Q39/4LRMCjDOthiKUf80
 7Fnjz3JBJFWHFmV2r5A0NQAd4/obAn4YU8Lz1goJzNKEILO40OYzg==
X-ME-Sender: <xms:7qwJYsw-sFdO1XI-G5cx3qaN8VjExZik8s3Y6J-hiPARJZFWb17fVw>
 <xme:7qwJYgQhfMKFKX9Duohi8jmdFFrSBE7jx-0Z8OQ3cGbVB9NXrSTYH2hOfl7UHTxft
 g2NcZZVKfnT7caLig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedugdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeduffdtvdevkeffgfetffffueevgeejleeghfffjedthedthfelgfekfefh
 feekieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:7qwJYuX-kzNjoVrBdf9bgzdj0Y70sIXNEpkldlsJgLcwYCOr0cR67A>
 <xmx:7qwJYqixBMPa-X09geTS-y4GqQsU6uVwK3sDafnkTFiHE5wz3mwR6Q>
 <xmx:7qwJYuBYwPMGn6koIlgEpN87ABFqZqqi_W8Nr2N6MjmKqoWra_A4Jw>
 <xmx:76wJYl7ylbrH0oHXRuk7CzrxbtrTCtUzb_r_HbTEAGEVtG9mCd1NSA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 78F871920083; Sun, 13 Feb 2022 20:14:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
In-Reply-To: <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
Date: Mon, 14 Feb 2022 11:43:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alex G." <mr.nuke.me@gmail.com>, U-Boot-Denx <u-boot@lists.denx.de>,
 "Christopher J Engel" <cjengel@us.ibm.com>,
 "Dhananjay Phadke" <dphadke@linux.microsoft.com>
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
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
Cc: openbmc@lists.ozlabs.org, Simon Glass <sjg@chromium.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Alex, thanks for taking a look at the patch.

On Sun, 13 Feb 2022, at 05:25, Alex G. wrote:
> On 1/30/22 21:41, Andrew Jeffery wrote:
>> Some platform designs include support for disabling secure-boot via a
>> jumper on the board. Sometimes this control can be separate from the
>> mechanism enabling the root-of-trust for the platform. Add support for
>> this latter scenario by allowing boards to implement
>> board_fit_image_require_verfied(), which is then invoked in the usual
>> FIT verification paths.
>> 
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>> Hi,
>> 
>> This patch is extracted from and motivated by a series adding run-time
>> control of FIT signature verification to u-boot in OpenBMC:
>> 
>> https://lore.kernel.org/openbmc/20220131012538.73021-1-andrew@aj.id.au/
>> 
>> Unfortunately the OpenBMC u-boot tree is quite a way behind on tracking
>> upstream and contains a bunch of out-of-tree work as well. As such I'm
>> looking to upstream the couple of changes that make sense against
>> master.
>
> I don't understand the practical use of a mechanism to disable security 
> if secure boot was enabled in the first place. Sure it can be 
> technically done, but why is this not a bad idea?

Right, I think this question is an indication that I could write a more
informative commit message, so if we converge on something acceptable
I'll update it. Let me provide some more context:

As mentioned above this is motivated by use with BMCs, specifically on
the ASPEED AST2600, in some specific platform contexts.

Platforms can be designed with two styles of firmware management in
mind:

1. The typical approach - No owner control: Manufacturer supplied
firmware with secure-boot always enabled

2. The atypical approach - Full owner control: Owner-controlled firmware
with secure-boot optionally enabled

For quite a few contributing to OpenBMC, the manufacturer and the owner
are the same, and so the typical approach is a good match. It probably
is the use case Dhananjay was considering[1]. It also caters to the
traditionally closed-source firmware ecosystem where manufacturer
control is retained.

[1] https://lore.kernel.org/openbmc/016ae207-2ecb-1817-d10e-12819c8c40ef@linux.microsoft.com/

The second approach requires open-source firmware stacks combined with
platforms designed to enable owner control. There are some ecosystems
that allow this (e.g. OpenPOWER). On the host side for those systems
it's possible to secure-boot them using firmware and kernels signed
entirely and only by user-controlled keys. We're looking to enable this
for the BMC side too, as much as we can.

For completeness (i.e. stating this to make the argument self-contained,
not implying that you're unaware of it), for secure-boot to be
meaningful at a given point in the boot process we need all previous
elements of the boot process to have been verified. That is, it's not
enough to verify u-boot if the u-boot SPL is not verified.

Where such systems use the AST2600, limitations of the AST2600
secure-boot design come into play:

3. All secure-boot configuration is held in OTP memory integrated into
the SoC

4. The OTP memory must be write-protected to prevent attackers
installing arbitrary keys without physical presence

5. The OTP is write-protected by configuration held in the OTP.

The consequence with respect to 2. is that the system manufacturer
either must:

6. Program and write-protect the OTP during production, or

7. Ship the system with the OTP in a vulnerable state.

We figure the latter isn't desirable which means dealing with
limitations of the former.

If the OTP is programmed (with the required public keys) and
write-protected by the manufacturer, then when configured as a
secure-boot root-of-trust, the AST2600 must only boot an SPL image
signed by the manufacturer. From here there are two options for owner
control: 

8. The manufacturer signs arbitrary SPLs upon request. This requires
trust from both parties and potentially a lot of auditing focus from the
manufacturer.

9. The manufacturer publishes the source for the signed u-boot SPL
binary in a fashion that allows reproducible builds for verification by
inspection. Firmware signed by owner-controlled keys can only be applied
beyond this boot stage.

Despite the compromise, the latter approach seems to be the most
reasonable in the circumstances.

Again for completeness, broadly, security can be divided into two
categories:

10. Software security
11. Physical security

Controlling secure-boot in a way that requires physical presence rules
out the ability to influence the boot process via (remote) software
attacks. This is beneficial. The approach at the platform level does not
yet solve for physical security, however given this is motivated by use
on BMCs, physical security concerns could be viewed as taken care of in
the sense that the systems are likely installed in a datacenter or some
other controlled environment.

With that in mind:

To escape the manufacturer's key-chain for owner-controlled signatures
the concept is the manufacturer-signed SPL (or u-boot payload) will load
keys from an external, write-protected EEPROM. These keys are used to
verify the next element of the boot process, providing user control.

To configure owner-controlled keys the EEPROM write-protect must be
disabled. This may, for example, be done via a physical jumper. If left
with write-protection disabled the matching public key for the signature
on the payload can arbitrarily be installed into the EEPROM which makes
secure-boot verification moot. The patch avoids the run-around in this
last behaviour by providing a platform hook to read the state of what is
effectively the EEPROM write-protect pin.

>
>> Please take a look!
>> 
>> Andrew
>> 
>>   boot/Kconfig     |  8 ++++++++
>>   boot/image-fit.c | 21 +++++++++++++++++----
>>   include/image.h  |  9 +++++++++
>>   3 files changed, 34 insertions(+), 4 deletions(-)
>> 
>> diff --git a/boot/Kconfig b/boot/Kconfig
>> index c8d5906cd304..ec413151fd5a 100644
>> --- a/boot/Kconfig
>> +++ b/boot/Kconfig
>> @@ -78,6 +78,14 @@ config FIT_SIGNATURE
>>   	  format support in this case, enable it using
>>   	  CONFIG_LEGACY_IMAGE_FORMAT.
>>   
>> +if FIT_SIGNATURE
>> +config FIT_RUNTIME_SIGNATURE
>> +	bool "Control verification of FIT uImages at runtime"
>> +	help
>> +	  This option allows board support to disable verification of
>> +	  signatures at runtime, for example through the state of a GPIO.
>
> The commit message does a much nicer job explaining this option, even 
> though it is this kconfig help text that almost all users will ever see.

I'll fix this once we finish up on the discussion above.

>
>> +endif # FIT_SIGNATURE
>> +
>>   config FIT_SIGNATURE_MAX_SIZE
>>   	hex "Max size of signed FIT structures"
>>   	depends on FIT_SIGNATURE
>> diff --git a/boot/image-fit.c b/boot/image-fit.c
>> index f01cafe4e277..919dbfa4ee1d 100644
>> --- a/boot/image-fit.c
>> +++ b/boot/image-fit.c
>> @@ -1308,6 +1308,14 @@ static int fit_image_check_hash(const void *fit, int noffset, const void *data,
>>   	return 0;
>>   }
>>   
>> +#ifndef __weak
>> +#define __weak
>> +#endif
>
> What?

boot/image-fit.c is built by the tools as well as into the u-boot{,-spl}
images, but __weak is only defined when __KERNEL__ is defined, which is
not how the tools are compiled.

This is a bit of hack but if I resolve your concern about using weak
symbols below then this goes away.

>
>> +__weak int board_fit_image_require_verified(void)
>> +{
>> +	return 1;
>> +}
>> +
>
> I caution against having any platform security related functionality as 
> a weak function. Did I get the right function, or something else with 
> the same name was compiled that returns 0 and silently disables security 
> in my platform?
>
> I think a weak function in this context is a source of confusion and 
> future bugs. You could instead require the symbol to be defined if and 
> only if the appropriate kconfig is selected. Symbol not defined -> 
> compiler error. Symbol defined twice -> compiler error. Solves the 
> issues in the preceding paragraph.

Okay.

>
> [snip]
>
>> diff --git a/include/image.h b/include/image.h
>> index 97e5f2eb24d6..98900c2e839b 100644
>> --- a/include/image.h
>> +++ b/include/image.h
>> @@ -1173,6 +1173,15 @@ int calculate_hash(const void *data, int data_len, const char *algo,
>>   # define FIT_IMAGE_ENABLE_VERIFY	CONFIG_IS_ENABLED(FIT_SIGNATURE)
>>   #endif
>>   
>> +/*
>> + * Further, allow run-time control of verification, e.g. via a jumper
>> + */
>> +#if defined(CONFIG_FIT_RUNTIME_SIGNATURE)
>> +# define fit_image_require_verified()	board_fit_image_require_verified()
>> +#else
>> +# define fit_image_require_verified()	FIT_IMAGE_ENABLE_VERIFY
>> +#endif
>> +
>
> image.h is also used for host code. When only changing target code 
> behavior, there should be a very good reason to modify common code. I'm 
> not convinced that threshold has been met.

I guess I could move it into boot/image-fit.c as that's the only user,
but given its role that too doesn't really address your concern :)

Joel had related comments on the patch on the OpenBMC list[2]

[2] https://lore.kernel.org/openbmc/CACPK8XcY=afrQ9bE2A3q1tC8Hhxmx3oVM7k_C_fVoYGbLJ4OUg@mail.gmail.com/

How do you propose I add target-specific behaviour? Or is the patch just
a non-starter? As mentioned above, moving the behaviour to
boot/image-fit.c doesn't address this concern.

>
> My second concern here is subjective: I don't like functions defined as 
> macros, further depending on config selections. It makes many code 
> parsers and IDEs poop their pantaloons. It makes u-boot harder to work 
> with as a result. I suggest finding a way to turn this into a static inline.

That's fine, I'm not wedded to the approach so happy to clean it up.

I was trying to make sure the change had no impact on code generation
with CONFIG_FIT_RUNTIME_SIGNATURE=n without relying too much on the
optimiser to clean things up. I'll reassess what I've done to see if we
can get a decent outcome both ways.

Andrew
