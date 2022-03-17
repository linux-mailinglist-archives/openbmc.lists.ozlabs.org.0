Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E1C4DD12F
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 00:31:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKNgm3qRFz30KR
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 10:31:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VVucs9qD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VVucs9qD; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKNgL2cBLz2xrc
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 10:30:52 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id j26so9583727wrb.1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 16:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kf+pDBs2nbvt7GpmUkQZXtJLUtopEEIfY3t5/TWUWOc=;
 b=VVucs9qDmdDKge+F191+fRNzExdWb3Lo0N2rleaCXYe5S0r3FlfewC8VZQaIkE1og2
 4dYejnaeMwMLg//7nWTWkMEyzx69MgJoFupSrhvFuJLx+zV8G/7lOqdAjI9f+sv/gtBr
 vd2yPqB75GUyX0wzkJLJdZjfMrlP3dNJOKxhjcU1TJtcGAqp7iry2ppem4lPYVyd9XAQ
 nawvWAF5kNDi9cWN+Lonvq0Sq3snbL9ka/pSeuACez2tdq3d/Vo0KTa6eIjsVFiqMlm5
 NbIavEJ6xnrkQoKSrDkO/0cv4mk0wi0kfDgeXR0Q+5iRXAiGqxv884In4ldMkCEQVdd6
 p8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kf+pDBs2nbvt7GpmUkQZXtJLUtopEEIfY3t5/TWUWOc=;
 b=C256MwYkKteUfOa+R90SeMY1kH0Kq+rprSRF0YEw+KL4Kf2JC3NJnC7cIi2lDNlBUs
 NNMI3J7vgfKBzH9MlL0wyh9nUSahNppK1/n/BLSc3bo58vCLFi4drOZG4AVueTpDnpQ2
 cOCX7ICabgg3mQtpiT2Hqy22jaK6uTUiwo/H7ezfuCDmZoeCrFpnd4cJHjr7Jn2W56cG
 lKHdl4uCnSVOXSylwUD6pBxRBw+as3aLHREM5jhCdMY1n1eMlA7dAIkOpNe902tQ6HnC
 yPtmAGe6PMGm0nGYgQywAT8JYpcWvnM5cdEGpLMSoxnVdI2ENld8GcaqfJu5HE97dHco
 vMDA==
X-Gm-Message-State: AOAM532leJnmMayJAiUjVfxNth/fUPvOPzvzEN8RsS1R8D1PfgpCGt9y
 QTzCyl+5ASdRg/HsjRmU+70u2Im+SNqkr7kxHlFy5DS+S1JcGg==
X-Google-Smtp-Source: ABdhPJxmSMSY2cEFdzhlD4Ik29HDsWr2Tb3B+hhEsTAKkWNrSEDmy8KicWxkB2svfRU2gNRkUX3PymoBsz1AmB02/v0=
X-Received: by 2002:adf:c54c:0:b0:203:ed16:2570 with SMTP id
 s12-20020adfc54c000000b00203ed162570mr3845609wrf.646.1647559845276; Thu, 17
 Mar 2022 16:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220311181014.3448936-1-bjwyman@gmail.com>
 <fa8b2d9f-e5c9-73f4-3916-84e370748687@roeck-us.net>
 <CAK_vbW2S07+S8+PrQnBLjvXYnLBXU06FHBvfM2zaT6RYx9HO+g@mail.gmail.com>
 <582086fe-1cc3-d161-a866-f4726d04a254@roeck-us.net>
 <CAK_vbW1Lfroo91cMxsLpuf-uuDwcsssG1=fjp3an_O5-FUHjMQ@mail.gmail.com>
 <b284838a-6987-273c-ce00-592aa9ab51b2@roeck-us.net>
In-Reply-To: <b284838a-6987-273c-ce00-592aa9ab51b2@roeck-us.net>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Thu, 17 Mar 2022 18:30:10 -0500
Message-ID: <CAK_vbW2QFk8wJrK6X+Xyvefx1XDPLHOFoh0VpKnSCNN43knwMw@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (pmbus/ibm-cffps) Add clear_faults debugfs entry
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 1:50 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 3/17/22 09:12, Brandon Wyman wrote:
> > On Wed, Mar 16, 2022 at 3:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 3/16/22 13:03, Brandon Wyman wrote:
> >>> On Sun, Mar 13, 2022 at 11:36 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>>>
> >>>> On 3/11/22 10:10, Brandon Wyman wrote:
> >>>>> Add a clear_faults write-only debugfs entry for the ibm-cffps device
> >>>>> driver.
> >>>>>
> >>>>> Certain IBM power supplies require clearing some latched faults in order
> >>>>> to indicate that the fault has indeed been observed/noticed.
> >>>>>
> >>>>
> >>>> That is insufficient, sorry. Please provide the affected power supplies as
> >>>> well as the affected faults, and confirm that the problem still exists
> >>>> in v5.17-rc6 or later kernels - or, more specifically, in any kernel which
> >>>> includes commit 35f165f08950 ("hwmon: (pmbus) Clear pmbus fault/warning
> >>>> bits after read").
> >>>>
> >>>> Thanks,
> >>>> Guenter
> >>>
> >>> Sorry for the delay in responding. I did some testing with commit
> >>> 35f165f08950. I could not get that code to send the CLEAR_FAULTS
> >>> command to the power supplies.
> >>>
> >>> I can update the commit message to be more specific about which power
> >>> supplies need this CLEAR_FAULTS sent, and which faults. It is observed
> >>> with the 1600W power supplies (2B1E model). The faults that latch are
> >>> the VIN_UV and INPUT faults in the STATUS_WORD. The corresponding
> >>> STATUS_INPUT fault bits are VIN_UV_FAULT and Unit is Off.
> >>>
> >>
> >> The point is that the respective fault bits should be reset when the
> >> corresponding alarm attributes are read. This isn't about executing
> >> a CLEAR_FAULTS command, but about selectively resetting fault bits
> >> while ensuring that faults are reported at least once. Executing
> >> CLEAR_FAULTS is a big hammer.
> >>
> >> With the patch I pointed to in place, input (and other) faults should
> >> be reset after the corresponding alarm attributes are read, assuming
> >> that the condition no longer exists. If that does not happen, we should
> >> fix the problem instead of deploying the big hammer.
> >>
> >> Thanks,
> >> Guenter
> >
> > Okay, I see what you are pointing out there. I had been mostly looking
> > at the "files" in the debugfs paths. Those do not end up running
> > through that pmbus_get_boolean() function, so the individual fault
> > clearing was not being attempted. The fault I was interested in
> > appears to be associated with in1_lcrti_alarm. Reading that will give
> > me a 1 if there is a VIN_UV fault, and then it sends 0x10 to
> > STATUS_INPUT. That clears out VIN_UV, but the STATUS_INPUT command was
> > returning 0x18. Nothing appears to handle clearing BIT(3), that 0x08
> > mask.
> >
> > Should there be some kind of define for BIT(3) over in pmbus.h?
> > Something like PB_VOLTAGE_OFF? Somehow we need something using that in
> > sbit of the attributes. I had a quick hack that just OR'ed BIT(3) with
> > BIT(4) for that PB_VOLTAGE_UV_FAULT. That resulted in a clear of both
> > bits in STATUS_INPUT, and the faults clearing in STATUS_WORD.
> >
> > It is not clear if there should be a separate alarm for that "Unit Off
> > For Insufficient Input Voltage", or if the one for in1_lcrit_alarm
> > could just be the two bits OR'ed into one mask. I can send a patch
> > with a proposal on how to fix this one bit not getting cleared.
> >
>
> We don't have a separate standard attribute. I think the best approach
> would be to add a mask for bit 3 and or that mask for lcrit in
> vin_limit_attrs with PB_VOLTAGE_UV_FAULT. I'd suggest to name the
> define something like PB_VOLTAGE_VIN_OFF or PB_VOLTAGE_VIN_FAULT
> to clarify that the bit applies to the input.

Done. See: https://lore.kernel.org/linux-hwmon/20220317232123.2103592-1-bjwyman@gmail.com/T/#u

>
> Thanks,
> Guenter
