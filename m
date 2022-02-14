Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4184B5A78
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 20:15:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyDTK5XSRz3cPD
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 06:15:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Z3FRMJQU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=Z3FRMJQU; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JyDSv5PGJz30QZ
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 06:15:27 +1100 (AEDT)
Received: from [192.168.86.183] (unknown [50.47.106.53])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7DB1E20B9C2C;
 Mon, 14 Feb 2022 11:14:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7DB1E20B9C2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1644866093;
 bh=u7fmwyMnefTy/iAPBlNWtwJwxxEPBonFRf3mFB40KyI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z3FRMJQUHf3kbu2qgNJK1nessI5R9KKbr6YD2LTEZ1JGojSI4JFg0wHcGXWDidzZa
 rbMjdCYW299wsAObk7BXW2O2GjYP7tezJKSg5eS4GnyEsUeKpMx6MfAIcC3llxbzJk
 b+HMbzpa3V6RP6pFQ/nTnGo7dMAbLZjwHT+3MfwU=
Message-ID: <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
Date: Mon, 14 Feb 2022 11:14:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, "Alex G." <mr.nuke.me@gmail.com>,
 U-Boot-Denx <u-boot@lists.denx.de>, Christopher J Engel <cjengel@us.ibm.com>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
 <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2/13/2022 5:13 PM, Andrew Jeffery wrote:
> Right, I think this question is an indication that I could write a more
> informative commit message, so if we converge on something acceptable
> I'll update it. Let me provide some more context:
> 
> As mentioned above this is motivated by use with BMCs, specifically on
> the ASPEED AST2600, in some specific platform contexts.
> 
> Platforms can be designed with two styles of firmware management in
> mind:
> 
> 1. The typical approach - No owner control: Manufacturer supplied
> firmware with secure-boot always enabled
> 
> 2. The atypical approach - Full owner control: Owner-controlled firmware
> with secure-boot optionally enabled
> 
> For quite a few contributing to OpenBMC, the manufacturer and the owner
> are the same, and so the typical approach is a good match. It probably
> is the use case Dhananjay was considering[1]. It also caters to the
> traditionally closed-source firmware ecosystem where manufacturer
> control is retained.
> 
> [1]https://lore.kernel.org/openbmc/016ae207-2ecb-1817-d10e-12819c8c40ef@linux.microsoft.com/
> 
> The second approach requires open-source firmware stacks combined with
> platforms designed to enable owner control. There are some ecosystems
> that allow this (e.g. OpenPOWER). On the host side for those systems
> it's possible to secure-boot them using firmware and kernels signed
> entirely and only by user-controlled keys. We're looking to enable this
> for the BMC side too, as much as we can.
> 
> For completeness (i.e. stating this to make the argument self-contained,
> not implying that you're unaware of it), for secure-boot to be
> meaningful at a given point in the boot process we need all previous
> elements of the boot process to have been verified. That is, it's not
> enough to verify u-boot if the u-boot SPL is not verified.
> 
> Where such systems use the AST2600, limitations of the AST2600
> secure-boot design come into play:
> 
> 3. All secure-boot configuration is held in OTP memory integrated into
> the SoC
> 
> 4. The OTP memory must be write-protected to prevent attackers
> installing arbitrary keys without physical presence
> 
> 5. The OTP is write-protected by configuration held in the OTP.
> 
> The consequence with respect to 2. is that the system manufacturer
> either must:
> 
> 6. Program and write-protect the OTP during production, or
> 
> 7. Ship the system with the OTP in a vulnerable state.
> 
> We figure the latter isn't desirable which means dealing with
> limitations of the former.
> 
> If the OTP is programmed (with the required public keys) and
> write-protected by the manufacturer, then when configured as a
> secure-boot root-of-trust, the AST2600 must only boot an SPL image
> signed by the manufacturer. From here there are two options for owner
> control:
> 
> 8. The manufacturer signs arbitrary SPLs upon request. This requires
> trust from both parties and potentially a lot of auditing focus from the
> manufacturer.
> 
> 9. The manufacturer publishes the source for the signed u-boot SPL
> binary in a fashion that allows reproducible builds for verification by
> inspection. Firmware signed by owner-controlled keys can only be applied
> beyond this boot stage.
> 
> Despite the compromise, the latter approach seems to be the most
> reasonable in the circumstances.
> 
> Again for completeness, broadly, security can be divided into two
> categories:
> 
> 10. Software security
> 11. Physical security
> 
> Controlling secure-boot in a way that requires physical presence rules
> out the ability to influence the boot process via (remote) software
> attacks. This is beneficial. The approach at the platform level does not
> yet solve for physical security, however given this is motivated by use
> on BMCs, physical security concerns could be viewed as taken care of in
> the sense that the systems are likely installed in a datacenter or some
> other controlled environment.

We can decouple HW RoT and runtime control on enforcing secure boot
(requiring one or keys) on FIT image. Conflating two raises lot of
questions.

There's not much case for disabling HW RoT, which implies the bootloader
(U-Boot or more) has to be trusted after board is manufactured
(OTPstraps, especially OTPCFG0[6], are programmed).

There's indeed a case for disabling secure boot on OS FIT image -
If bootloader is trusted, it's possible to remotely push the policy to
disable runtime FIT image secure boot. Such policy push must use secure 
transport (someway authenticated) and storage (simplest U-Boot env).
This is helpful in cases like booting diagnostic images if board has to
be RMA'ed and diagnostic images won't be signed by production keys.

There's a key-requirement policy already implemented [1].

[1] 
https://lore.kernel.org/u-boot/cover.1597643014.git.thiruan@linux.microsoft.com/

Board code can patch "required-policy" = none at runtime based 
appropriate logic.

Regards,
Dhananjay

> 
> With that in mind:
> 
> To escape the manufacturer's key-chain for owner-controlled signatures
> the concept is the manufacturer-signed SPL (or u-boot payload) will load
> keys from an external, write-protected EEPROM. These keys are used to
> verify the next element of the boot process, providing user control.
> 
> To configure owner-controlled keys the EEPROM write-protect must be
> disabled. This may, for example, be done via a physical jumper. If left
> with write-protection disabled the matching public key for the signature
> on the payload can arbitrarily be installed into the EEPROM which makes
> secure-boot verification moot. The patch avoids the run-around in this
> last behaviour by providing a platform hook to read the state of what is
> effectively the EEPROM write-protect pin.

