Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB154037F
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 18:12:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHb341wczz3blk
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 02:12:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gmuDLqSx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gmuDLqSx;
	dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHb2c5jL9z3bWm
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 02:11:35 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id e5so2752807wma.0
        for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2022 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Skw4LeFuZkvMShWGJwuniZqRBJWBjAeSE+iN9a6vpG8=;
        b=gmuDLqSxCCyom9WJSLZ5jb6pn9KQPGyZv+aP1FAPHOMGbZYH6ECKoMcqiVUx08SMpG
         Dj+YRWRbTBQLW3inSk9SY74cl2cIof+0SfKoH/PjLwdjMXAqHMrrEcMZuICLlPtlQVCY
         knX9GKwLvvdY/ivL0Cto7tIjM4mRbRncARA8eIcNSccyJFVV8dIMUMOsgtEQHmgnreaF
         odBX/hjXBpqc7kNbwsNhyhVUI4ddCVMCrjgsbYxG5Z7dVHnAZCx5Q6ZiWiqIm7ezz3+F
         /G4tXWh1ZCXDogc4yDVb8Yu7DgrmkVhmz8xkD+QVk4O6r43o5U26J1dF4J1teV0b+gGl
         pDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Skw4LeFuZkvMShWGJwuniZqRBJWBjAeSE+iN9a6vpG8=;
        b=3hmkoa2MnidShnw8J32ypwSGLcckZHwWgWgYiUntS1zq/X7bcZO+2wTnfAKlC4GjL4
         2FzelSVXFfqn17hLDtYJ/pObkKasX0Zm8qYKzI6uw+0F1+gXHo9NBCy7x5wPil+lW2wY
         A9yzQ/0Vfpt+NO7iY1iqEFOCYauBQTld3YdviyzZNAouUnqlIRU+yiWl+Ct/JaEDINar
         +TJqSVmiNl5QV/hKt8EqlOW5lfQFEEjjIbc6wNxicelXCjTLcHvMtLUZbHonVbbIPfRJ
         Oo2hbixosarwF+BX6S7Tkhvg/Uph2u7xLaoGKDt4tS/tx6lwSEgZMXpYjJxu/hZjUAUM
         J/kQ==
X-Gm-Message-State: AOAM533OKIwmgDvuMZdY9ah2d2KAKEnbzEsoYrPzitEsbFiul1cH9wAQ
	Et8tu3nOx2Llqb/NjHSV348bHymKtJmdTFPX73YONQ==
X-Google-Smtp-Source: ABdhPJz2kxl0rcg/W9OuLpf+WkkBgfEE+f5alD4urIHaIXPgzOj77AkblU2V3EkXXxM3CUHEnF1wil0E4Ktn0HKPbEQ=
X-Received: by 2002:a05:600c:646:b0:397:77ab:5eb7 with SMTP id
 p6-20020a05600c064600b0039777ab5eb7mr30727677wmm.166.1654618288675; Tue, 07
 Jun 2022 09:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <CALXuKJetn8x+z0xrn_9WJEtt0NyZQa2-Br8irggi7Djk-U8Xmg@mail.gmail.com>
 <CALXuKJetkkPPCWZT8T24LFkfkYhqJzOi7oPdtLDOTH2VROHf8Q@mail.gmail.com>
In-Reply-To: <CALXuKJetkkPPCWZT8T24LFkfkYhqJzOi7oPdtLDOTH2VROHf8Q@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 7 Jun 2022 09:11:17 -0700
Message-ID: <CAH2-KxCViS3py6bZ4EX1_V9HU2i8t3o47DG5dhUeE48s8VApAg@mail.gmail.com>
Subject: Re: Physical LED Design Proposal
To: Jayashree D <srid.11486@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: spinler@us.ibm.com, andrew@aj.id.au, openbmc@lists.ozlabs.org, jayashree-d@hcl.com, bradleyb@fuzziesquirrel.com, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 7, 2022 at 12:07 AM Jayashree D <srid.11486@gmail.com> wrote:
>
> Hi Team,
>
> Could you please provide your suggestions on the above design for LED.
>
> Thanks,
> Jayashree
>
>
> On Fri, May 27, 2022 at 12:42 PM Jayashree D <srid.11486@gmail.com> wrote=
:
>>
>> Hi Team,
>>
>> Problem Description :
>>
>> In the existing phosphor-led-sysfs design, it exposes one service per LE=
D. Therefore, multiple services will be created for multiple GPIO pins conf=
igured for LED. To abstract this method and also to create LEDs under a sin=
gle service, a new implementation is proposed.

You've kind of jumped directly to a solution without spending any
details on why this design is necessary.  What are you trying to
achieve?  Why does the existing solution not work?  You allude to
multiple services being bad, but you don't really state why, or what's
preventing that from working.  This is a section labeled problem
description, it needs to describe the problem, ideally in much more
length than your solution itself.

>>
>> Existing Implementation :
>>
>> 1. Physical Leds are defined in the device tree under "leds" section.
>> 2. Corresponding GPIO pin are defined for the physical LEDs.
>> 3. "udev rules" are used to monitor the physical LEDs.
>> 4. Once the LED in initialized in device tree, udev event will be create=
d and it will trigger a systemd service for that LED.
>> 5. Therefore, if multiple GPIO pins are configured for LEDs, then it wil=
l create a multiple systemd services (xyz.openbmc_project.led.controller@.s=
ervice) for phosphor-led-sysfs based on the LED name.
>>
>> Example :
>>
>> busctl tree xyz.openbmc_project.LED.Controller.led1
>> `-/xyz
>>   `-/xyz/openbmc_project
>>     `-/xyz/openbmc_project/led
>>       `-/xyz/openbmc_project/led/physical
>>         `-/xyz/openbmc_project/led/physical/led1
>>
>> busctl tree xyz.openbmc_project.LED.Controller.led2
>> `-/xyz
>>   `-/xyz/openbmc_project
>>     `-/xyz/openbmc_project/led
>>       `-/xyz/openbmc_project/led/physical
>>         `-/xyz/openbmc_project/led/physical/led2
>>
>>
>>
>> New Implementation :
>>
>> 1. Physical Leds are defined in the device tree under "leds" section.
>> 2. Corresponding GPIO pin are defined for the physical LEDs.
>> 3. "udev rules" are used to monitor the physical LEDs.
>> 4. Once the udev event is initialized for the LED, it will store those L=
ED name using the script in udev instead of triggering systemd   service.
>> 5. Phosphor-led-sysfs will have a single systemd service (xyz.openbmc_pr=
oject.led.controller.service) running by default at system startup.
>> 6. A dbus method call will be exposed from the service. udev will notify=
 the LEDs detected in the driver.
>>
>> Example :
>>
>> busctl tree xyz.openbmc_project.LED.Controller
>> `-/xyz
>>   `-/xyz/openbmc_project
>>     `-/xyz/openbmc_project/led
>>       `-/xyz/openbmc_project/led/physical
>>         `-/xyz/openbmc_project/led/physical/led1
>>         `-/xyz/openbmc_project/led/physical/led2
>>
>>
>> This was already discussed in the previous mail thread. Please refer to =
the below link.
>> https://lists.ozlabs.org/pipermail/openbmc/2022-April/030272.html
>>
>> Please provide your suggestions on this new proposal.
>>
>>
>> Thanks
>> Jayashree
