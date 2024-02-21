Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A285E3DE
	for <lists+openbmc@lfdr.de>; Wed, 21 Feb 2024 17:58:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jpgf+ZOT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg2Xf2kkzz3dV5
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 03:58:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jpgf+ZOT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg2X12pd6z3dVB;
	Thu, 22 Feb 2024 03:57:52 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3bbd6ea06f5so3396531b6e.1;
        Wed, 21 Feb 2024 08:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708534670; x=1709139470; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJWYEU/M/WsHNzSMkh9EKav36BnK47emNVVN/Db4odE=;
        b=Jpgf+ZOTwwhZrEjsinuImNrMR86u75ffEJrKimk837NkoeBcaW3AdS1gLINScFu2Wf
         sbRdzG8wH7QvknkBYMfZrTmhmJcYNDk+qk1fEJ4fdx8VHF+hsVmFaK7jaTNRbHZMFiMf
         O7cUgw7kdniYDWD/rl3ENXOrb7o7Fpfi6gGU3bVvpSasr8QWGyxNZXKLC37Cfgpli8Zz
         P1IUPZjcUedhtd1bPG0PJid47Y6I+M81TfQFP7Xhw399Y+L5ANnuMKlRVYImD4cfuNJO
         Uyod/+CxR41jHWC8Y6Mkjb993cAGZb0/bj3d1+hwT8Y5D+utT9XK7OUmXyBk8T/qNJyh
         vuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708534670; x=1709139470;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJWYEU/M/WsHNzSMkh9EKav36BnK47emNVVN/Db4odE=;
        b=GgQb/BdVFd6Ec0L5f06ZbAC2a/592B4l3Von7XphVrcQO0Vel2DtTEykthjbyu6KkG
         vsegfToWTygSuCh+mtOxlGSa9O9uSbp25LRNHdianGIZlPZpCKH8YO543gFVjBXF/ZBt
         0GJ5ASsALTVeJ+hZCvV4XjkyXwk7K9VcXcLZHibQ+FYtoFTkYCK1WUD0fgLaTW78BD9b
         kncnSKDC0DvMk8gYxAHLjmDsl0Hr8UHpjSpOYgvMGUbNZioL4LDiBQ+h3rklhR2ldtnc
         po9q4Qkq7Y8yWkEsykQLFUKgt0mvE0xc1+m95E6pLsqZ2eeg96KhhaKc76KvEswF5tSB
         4Vyw==
X-Forwarded-Encrypted: i=1; AJvYcCVW5hJ2kchAfpFWWO4FmbdqzcvddTC38b5MyzS5FdybHsczrovvyPtXXriwAoTnrRmpOd4oWdds3x0ELrqthaL5jl+rPZc0wqdW6eNqd7yzQDF2FDibxhF3mJxb+hvu6hmSlxM8oBl0
X-Gm-Message-State: AOJu0YztrZ/3g48+HVgxEbzhDBEev1Wc/jamgjX9jYALwzH5BmmZk2MB
	mb/C+mOAKA/3W694iaNSvyFKJM47T6aewibUEnRBjqz/VSZnY/2ssN73lATFeoE=
X-Google-Smtp-Source: AGHT+IHUcyjcP2AuJIMMMPPLJA0QZmjqHygE1wZIcVBYLdz8J3dluza4MbNXQvR57Vui1zS7cOCffQ==
X-Received: by 2002:a05:6808:189a:b0:3c1:6caa:1131 with SMTP id bi26-20020a056808189a00b003c16caa1131mr22813oib.18.1708534670133;
        Wed, 21 Feb 2024 08:57:50 -0800 (PST)
Received: from smtpclient.apple ([2605:a601:aa0a:4200:30a5:ebd1:48db:41c6])
        by smtp.gmail.com with ESMTPSA id nz6-20020a056871758600b0021ed5ee3c77sm1551790oac.16.2024.02.21.08.57.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Feb 2024 08:57:49 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH] ipmi: kcs: Update OBF poll timeout to reduce latency
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <9680ad7d7a48fc36a0572dc2286a1229a29341fe.camel@codeconstruct.com.au>
Date: Wed, 21 Feb 2024 10:57:38 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <527F52AB-0070-43EA-BE82-945280CA2AEE@gmail.com>
References: <20240220123615.963916-1-geissonator@gmail.com>
 <a9169894-6972-49c0-a1d4-d80863f5b511@molgen.mpg.de>
 <ZdT+eThnYqb3iawF@mail.minyard.net>
 <9680ad7d7a48fc36a0572dc2286a1229a29341fe.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, minyard@acm.org, linux-aspeed <linux-aspeed@lists.ozlabs.org>, openbmc@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, openipmi-developer@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 20, 2024, at 4:36=E2=80=AFPM, Andrew Jeffery =
<andrew@codeconstruct.com.au> wrote:
>=20
> On Tue, 2024-02-20 at 13:33 -0600, Corey Minyard wrote:
>> On Tue, Feb 20, 2024 at 04:51:21PM +0100, Paul Menzel wrote:
>>> Dear Andrew,
>>=20
>> It's because increasing that number causes it to poll longer for the
>> event, the host takes longer than 100us to generate the event, and if
>> the event is missed the time when it is checked again is very long.
>>=20
>> Polling for 100us is already pretty extreme. 200us is really too =
long.
>>=20
>> The real problem is that there is no interrupt for this.  I'd also =
guess
>> there is no interrupt on the host side, because that would solve this
>> problem, too, as it would certainly get around to handling the =
interupt
>> in 100us.  I'm assuming the host driver is not the Linux driver, as =
it
>> should also handle this in a timely manner, even when polling.
>=20
> I expect the issues Andrew G is observing are with the Power10 boot
> firmware. The boot firmware only polls. The runtime firmware enables
> interrupts.

Yep, this is with the low level host boot firmware.
Also, further testing over night showed that 200us wasn=E2=80=99t enough =
for
our larger Everest P10 machines, I needed to go to 300us. As we
were struggling to allow 200us, I assume 300us is going to be a no-go.

>>=20
>=20
>>=20
>> The right way to fix this is probably to do the same thing the host =
side
>> Linux driver does.  It has a kernel thread that is kicked off to do
>> this.  Unfortunately, that's more complicated to implement, but it
>> avoids polling in this location (which causes latency issues on the =
BMC
>> side) and lets you poll longer without causing issues.
>=20
> In Andrew G's case he's talking MCTP over KCS using a vendor-defined
> transport binding (that also leverages LPC FWH cycles for bulk data
> transfers)[1]. I think it could have taken more inspiration from the
> IPMI KCS protocol: It might be worth an experiment to write the dummy
> command value to IDR from the host side after each ODR read to signal
> the host's clearing of OBF (no interrupt for the BMC) with an IBF
> (which does interrupt the BMC). And doing the obverse for the BMC. =
Some
> brief thought suggests that if the dummy value is read there's no need
> to send a dummy value in reply (as it's an indicator to read the =
status
> register). With that the need for the spin here (or on the host side)
> is reduced at the cost of some constant protocol overhead.
>=20

Thanks for the quick reviews and ideas.
I=E2=80=99ll see if I can find someone on the team to help out with =
Andrew J=E2=80=99s
thoughts and if that doesn=E2=80=99t work, look into the kernel thread =
idea.

>=20
>=20
> Andrew J


