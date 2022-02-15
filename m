Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D274B6169
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 04:13:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyR4n2r8Dz3bc5
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 14:13:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=QvntA5hl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=QvntA5hl; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JyR4J2ZX2z2xrG
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 14:13:19 +1100 (AEDT)
Received: from [192.168.86.183] (unknown [50.47.106.53])
 by linux.microsoft.com (Postfix) with ESMTPSA id 707CF20B9C87;
 Mon, 14 Feb 2022 19:12:48 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 707CF20B9C87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1644894768;
 bh=phH4kl70EtCUrsO71mC+YauwX0HcH+u72BZdhzV5k44=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QvntA5hlVgMXj95/u9db4lMSM6elfxmC1Zja8WgXXeTKHruH+B4IkRt1I7nNg9VQP
 ycwKhckHqPYMj0L2OmlVyNVh1L7nhy19s3CIVIMB8mSaZqFsBMRR58AWqKaTNH9uZr
 Fd6HoX99hlMH+g58AfVd9H4UXK/267b/hGYy3aJg=
Message-ID: <06616971-2f88-740d-e805-d229aa86d985@linux.microsoft.com>
Date: Mon, 14 Feb 2022 19:12:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
 <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
 <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
 <YgriLTCF5hvtPCMm@heinlein>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <YgriLTCF5hvtPCMm@heinlein>
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
Cc: Christopher J Engel <cjengel@us.ibm.com>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, U-Boot-Denx <u-boot@lists.denx.de>,
 "Alex G." <mr.nuke.me@gmail.com>, Simon Glass <sjg@chromium.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/14/2022 3:13 PM, Patrick Williams wrote:
> On Mon, Feb 14, 2022 at 11:14:53AM -0800, Dhananjay Phadke wrote:
>> On 2/13/2022 5:13 PM, Andrew Jeffery wrote:
>>
>> We can decouple HW RoT and runtime control on enforcing secure boot
>> (requiring one or keys) on FIT image. Conflating two raises lot of
>> questions.
> 
> I won't claim to be a security expert but I don't understand this statement.
> What are the "lots of questions" that are raised?
> 
>> There's not much case for disabling HW RoT, which implies the bootloader
>> (U-Boot or more) has to be trusted after board is manufactured
>> (OTPstraps, especially OTPCFG0[6], are programmed).
>>
>> There's indeed a case for disabling secure boot on OS FIT image -
> 
> Why wouldn't you want to replace the bootloader just as easily as you can
> replace the kernel / OS itself?  I don't understand why this is more special
> than any other software.  Bootloaders are replaced on "real" systems all the
> time.  There are multiple efforts to be able to replace BIOS/UEFI with a free
> implementation as well.
> 
> I would consider the "HW RoT" to be the software in ROMs and not anything
> which can be replaced, like u-boot.  Why are you extending it to include u-boot?

Agree that ROM maybe just immutable code + some logic, but almost surely
lacks high level stack e.g. network stack to communicate securely and
change boot behavior (remote unlock).

Bootloader (U-Boot in Aspeed case) happens to be the first component
with rich stack to enable such workflows without / before physical
intervention.

It also means, for defense against physical attacks (e.g. replace boot
SPI), first mutable component (bootloader) must be trusted by immutable
component earlier in boot chain. Further secure boot chain may have its
own control knobs from compile or runtime.


> 
>> If bootloader is trusted, it's possible to remotely push the policy to
>> disable runtime FIT image secure boot. Such policy push must use secure
>> transport (someway authenticated) and storage (simplest U-Boot env).
>> This is helpful in cases like booting diagnostic images if board has to
>> be RMA'ed and diagnostic images won't be signed by production keys.
> 
> For second-hand / recycled hardware, I'm not sure the bootloader _is_ trusted.
> It is also possible that I punt on some aspects of supply-chain security and
> simply replace it all when it arrives in my hands.  ie. If I can securely
> replace all the bits, I really don't care if it was tampered with in transit.
> 
>> There's a key-requirement policy already implemented [1].
>>
>> [1]
>> https://lore.kernel.org/u-boot/cover.1597643014.git.thiruan@linux.microsoft.com/
>>
>> Board code can patch "required-policy" = none at runtime based
>> appropriate logic.
>>

[...]

> 
> Isn't this jumper proposal just like the TCG Physical Presence requirements?
> This is a software implementation and requires a particular hardware design for
> it to be done right, but it seems to be along the same lines.

I'm supporting idea of having control on FIT verification, just pointed
that it maybe done by board code by just patching U-Boot control FDT,
either the "required-policy" property at /signature or "required"
property in individual key nodes.


Regards,
Dhananjay


