Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F01875B05
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 00:20:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kmE5zCPj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrQJd5bLfz3vXc
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 10:20:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kmE5zCPj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqrX44qphz30gn
	for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2024 11:58:28 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7c86482429fso17296339f.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2024 16:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709773105; x=1710377905; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOXetrYB7FG7uPFK9qD35tNyUTXHX53MKHAyDztq5IU=;
        b=kmE5zCPjfKWjk1DAtsnwMPMydFGtjfQQ7C1OKqRhdVFVO8dAk4/Zw1EOl+GFxhay+g
         IXBPcE9tZ/45zEresLYL+Ps7bBbZuugiXa5WPperVyVsYUcCJ9vwDAA/EyJ3XgHe4HuI
         /qFMXQDuTJ37+jiAfJNjzadLCfjZIbyWe8mzUFoyoH5VXGF/9hRe74fqYyUFksiASNT6
         B3NECAPsuTKcZinCUd0LXEpp15NztIcIP5ll4hUXPD+kvXpvSr6SvXOxjmMKh8rLyKXY
         P8+NViUcvNH34ArZN/0XIAujkB2jtt4No+9svz95a7hv2kGkkCdWTOD9SVvEgnKKQhv0
         WbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709773105; x=1710377905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOXetrYB7FG7uPFK9qD35tNyUTXHX53MKHAyDztq5IU=;
        b=vNNM0bjKGDtEz2QC0Ot6FwWuvHmECHzltgoxNt/uRPUdOK49mtcyPc+AieJBCwNeRQ
         SyvrxVlWF8JKHlhbwapXvV3r1DtGx8Zkkf667xiGOTlLqhImW09otgBs2ewWUVOsRayl
         SfUQwJ8g20Q6Y6fXTTXtAnYJlzBe2RSJMSW6J+Q0cpccKeGa8vEHOKVGM8mxmolc/8th
         RjBPAVLFSDHB0xaj0mzNbto7gZA6a9NViRB/I7/dNa+4G0s5v9Lq53AUR19C0r4rUSzI
         Ohctyoh91xujbuAcgOjCf6zeW/CxYY17Zi7VT/SpPySZdEr9yh4WL7Y66rGF+JNIoBhp
         qv7w==
X-Forwarded-Encrypted: i=1; AJvYcCXF7We8sMoLNtnLwBiLnkmh1UrukGnZJKIiNaX1YJsTwWgWG6Am/zMI+wOFZWk2T6Ryovs/rPfJaRpA9KHY6AM28Ptidwqt4pw=
X-Gm-Message-State: AOJu0YwJhT+flRHTNeKKmSXfPAx6AaPgvrvhtXBrKmQzkQ829JuJ4yQ8
	XD47v76dzoh0+11awQzy7DMMI28UreGOkRJBapKfAB/ycydyIIyf+RBgx6OgkJEdGWADj8020KD
	YRyISQqOBtUmvs6nWoB2dA4GOBJw=
X-Google-Smtp-Source: AGHT+IG8PjRaZLt/Q5CiEttvyPNHeWicHW61mnLg89xliS1+pm55W9W/fIsDsAuZF8ItOHUpgqY7hQ7MZ2R9HfODMxs=
X-Received: by 2002:a05:6e02:19c8:b0:365:cac8:87a9 with SMTP id
 r8-20020a056e0219c800b00365cac887a9mr20930302ill.6.1709773105301; Wed, 06 Mar
 2024 16:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com> <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <62f38808-7d5f-4466-a65e-b6a64b2e7c01@molgen.mpg.de> <4b06d535-6739-47b5-ad1e-0ff94322620e@roeck-us.net>
 <e2b0b8e3-9b39-4621-9e43-d7de02286a27@molgen.mpg.de> <24ee4bf3-aa91-483d-a9be-5c47e5c37ed7@roeck-us.net>
 <35dcecdd-ee19-40d6-80ab-5eed9718e639@molgen.mpg.de>
In-Reply-To: <35dcecdd-ee19-40d6-80ab-5eed9718e639@molgen.mpg.de>
From: Ban Feng <baneric926@gmail.com>
Date: Thu, 7 Mar 2024 08:58:14 +0800
Message-ID: <CALz278a4zoje8ZL5REY==fGmowO5EJnRT8rGXaDnSvDK+aROdg@mail.gmail.com>
Subject: Re: Commit messages (was: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y)
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 08 Mar 2024 10:18:22 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul and Guenter,

Appreciate your valuable comments, and I'll add some commit messages
to describe this chip for pwm and fan.

Thanks,
Ban

On Thu, Feb 29, 2024 at 12:25=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de=
> wrote:
>
> Dear Guenter,
>
>
> Thank you for your reply.
>
> Am 28.02.24 um 17:03 schrieb Guenter Roeck:
> > On 2/28/24 03:03, Paul Menzel wrote:
>
> >> Am 28.02.24 um 10:03 schrieb Guenter Roeck:
> >>> On 2/27/24 23:57, Paul Menzel wrote:
> >>
> >>>> Am 27.02.24 um 01:56 schrieb baneric926@gmail.com:
> >>>>> From: Ban Feng <kcfeng0@nuvoton.com>
> >>>>>
> >>>>> NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.
> >>>>
> >>>> Please reference the datasheet.
> >>>
> >>> Note that something like
> >>>
> >>> Datasheet: Available from Nuvoton upon request
> >>>
> >>> is quite common for hardware monitoring chips and acceptable.
> >>
> >> Yes, it would be nice to document it though. (And finally for vendors
> >> to just make them available for download.)
> >
> > Nuvoton is nice enough and commonly makes datasheets available on reque=
st.
> > The only exception I have seen so far is where they were forced into an=
 NDA
> > by a large chip and board vendor, which prevented them from publishing =
a
> > specific datasheet.
>
> Nice, that they are better in this regard than others.
>
> > Others are much worse. Many PMIC vendors don't publish their datasheets=
 at
> > all, and sometimes chips don't even officially exist (notorious for chi=
ps
> > intended for the automotive market). Just look at the whole discussion
> > around MAX31335.
> >
> > Anyway, there are lots of examples in Documentation/hwmon/. I don't see
> > the need to add further documentation, and I specifically don't want to
> > make it official that "Datasheet not public" is acceptable as well.
> > We really don't have a choice unless we want to exclude a whole class
> > of chips from the kernel, but that doesn't make it better.
>
> I know folks figure it out eventually, but I found it helpful to have
> the datesheet name in the commit message to know what to search for, ask
> for, or in case of difference between datasheet revision what to compare
> against.
>
> >>>> Could you please give a high level description of the driver design?
> >>>
> >>> Can you be more specific ? I didn't have time yet to look into detail=
s,
> >>> but at first glance this looks like a standard hardware monitoring
> >>> driver.
> >>> One could argue that the high level design of such drivers is describ=
ed
> >>> in Documentation/hwmon/hwmon-kernel-api.rst.
> >>>
> >>> I don't usually ask for a additional design information for hwmon dri=
vers
> >>> unless some chip interaction is unusual and needs to be explained,
> >>> and then I prefer to have it explained in the code. Given that, I am
> >>> quite curious and would like to understand what you are looking for.
> >> For a 10+ lines commit, in my opinion the commit message should say
> >> something about the implementation. Even it is just, as you wrote, a
> >> note, that it follows the standard design.
> >
> > Again, I have not looked into the submission, but usually we ask for th=
at
> > to be documented in Documentation/hwmon/. I find that much better than
> > a soon-to-be-forgotten commit message. I don't mind something like
> > "The NCT7363Y is a fan controller with up to 16 independent fan input
> >   monitors and up to 16 independent PWM outputs. It also supports up
> >   to 16 GPIO pins"
> > or in other words a description of the chip, not the implementation.
> > That a driver hwmon driver uses the hardware monitoring API seems to be
> > obvious to me, so I don't see the value of adding it to the commit
> > description. I would not mind having something there, but I don't
> > see it as mandatory.
> >
> > On the  other side, granted, that is just _my_ personal opinion.
> > Do we have a common guideline for what exactly should be in commit
> > descriptions for driver submissions ? I guess I should look that up.
>
> `Documentation/hwmon/submitting-patches.rst` refers to
> `Documentation/process/submitting-patches.rst`, and there *Describe your
> changes* seems to have been written for documenting bug fixes or
> enhancements and not new additions. It for example contains:
>
> > Once the problem is established, describe what you are actually doing
> > about it in technical detail.  It's important to describe the change
> > in plain English for the reviewer to verify that the code is behaving
> > as you intend it to.
>
> I agree with your description, but I am also convinced if you write 500
> lines of code, that you can write ten lines of commit messages giving a
> broad overview. In this case, saying that it follows the standard driver
> model would be good enough for me.
>
> Also, at least for me, often having to bisect stuff and using `git
> blame` to look at old commits, commit messages are very valuable to me,
> and not =E2=80=9Cforgotten=E2=80=9D. ;-)
>
>
> Kind regards,
>
> Paul
