Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9287E353
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 06:45:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T3nWFjGO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TykN421Ssz3cHC
	for <lists+openbmc@lfdr.de>; Mon, 18 Mar 2024 16:45:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T3nWFjGO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tyc685yvkz3cSL
	for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2024 12:02:56 +1100 (AEDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3664b08a419so18769535ab.0
        for <openbmc@lists.ozlabs.org>; Sun, 17 Mar 2024 18:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710723773; x=1711328573; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q057OV69lTu4ctPYW4hfEX8QoC9FK779RSSG++bu6xM=;
        b=T3nWFjGOgVnyff1yurzVDC4apPIeZmEcPQaLsOC5mdDbHPlE8tT5cklGdZS+FCXihM
         9uhKhdaHUm4sBFYuZNYaATrlY1QyOPNOqgWh1rhDUtyrVv3ccN8Yuohi4WOdaZ0cEDQG
         aVWGFF1bojwV/z8JM/LLrJtJO9kAUr3PEKXAgMSSjm/zaODtEK9ZsTFjxmqTqFQfc+cn
         vqBvkZ6p/U1UDFB8sX2Qw9b+EtgwgNd4zLp5ZYNOrsTNY196uYvaVNokJwlZt0uoP1m9
         5/rPSg1egs7XbXuH8bmX2Kt/9dYn1vfoNs9JA6JuB1POR4fpu7JleaZb0f+FYS7Qq4TT
         LCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710723773; x=1711328573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q057OV69lTu4ctPYW4hfEX8QoC9FK779RSSG++bu6xM=;
        b=gJixJ8TDyG1jNqeF+mqCpdjpw4vwKWWJrMuRwvttlYHjicXLIfSp2o2hb1yvkk8gS1
         3wNXqzQEADHRX0fR17u40fvh1adaVV3d7iAMRy6tkFbcBd8tfZiVxqCW4M29yfFI9X/c
         kAHXcxtrMsS89XPblQHZF3JrJcYAimP9Ae0Og2EMztz4SNCB0pRL8UCr0sAX5roVi4jE
         Gc0yM8B8uvOfmDFbLMuhoOjQm++hDLVeVocZWJddHz2Zz2nyTsuqViuzZ5GxW/ijtUHS
         +UB7C8lCqp3o1Pt0zDzOFJvHzxS+nVoRZYUXx+etbaj9PetxKTlEE6juquxPwBU9ny9W
         nViw==
X-Forwarded-Encrypted: i=1; AJvYcCXQiuV6flT/2aQBzl8eHIAVcWFsn1OeKxiETBICeN++TxraVAHGsN1H0aUv1sfuIFbaIKuAVZ+5BGf7clrx5OtjAkVlKRpxbdU=
X-Gm-Message-State: AOJu0YyR70WqUZhUuiLCxoXJJ/lTKxilZb8JqymkWyecBcujN5qBLkMr
	kuUo32JzuolEiJNdOWrFCCtBxJZOSIshBG0tLYDJA1cYRMGE8ESK0rUmPVnp5sSmeJl6UoNJwWS
	h0/EXPu8QquwKXXOMeWSTJ4vD3Lg=
X-Google-Smtp-Source: AGHT+IHgOcsuxrqW0t2XLKTOIxiWENVYN+gYwOfy3XkeKLpBv3+o5PftE+g10QYy+oHEGt9JsF/LRFsWvEdocg826T0=
X-Received: by 2002:a05:6e02:11a5:b0:366:95be:fdc6 with SMTP id
 5-20020a056e0211a500b0036695befdc6mr9347885ilj.28.1710723773618; Sun, 17 Mar
 2024 18:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com> <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <a90ed00c-f836-4fb6-8191-9974937e3eb7@hatter.bewilderbeest.net>
 <CALz278Zgfgob573vgWz4PgC7vb=i8xt3kC1hSjo_cQi00B0XAg@mail.gmail.com>
 <cd63bec7-01c6-466e-b772-3a3d3d90a7d5@hatter.bewilderbeest.net>
 <37e11daa-c24e-45b2-a22d-769693fd2038@roeck-us.net> <a93e2971-cafc-480b-b439-f42ed0838660@hatter.bewilderbeest.net>
In-Reply-To: <a93e2971-cafc-480b-b439-f42ed0838660@hatter.bewilderbeest.net>
From: Ban Feng <baneric926@gmail.com>
Date: Mon, 18 Mar 2024 09:02:42 +0800
Message-ID: <CALz278b7BeGoYunqh1Rs91N81sEnU_RDox3urqTb9CFX0ic5_g@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Mar 2024 16:44:10 +1100
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

HI Guenter and Zev,

If there's no concern about supporting nct7362 in nct7363 driver,
I'll add it to the of_device_id and i2c_device_id table in v5.

Thanks,
Ban

On Wed, Mar 13, 2024 at 8:21=E2=80=AFAM Zev Weiss <zev@bewilderbeest.net> w=
rote:
>
> On Tue, Mar 12, 2024 at 04:58:12PM PDT, Guenter Roeck wrote:
> >On 3/12/24 16:18, Zev Weiss wrote:
> >>On Wed, Mar 06, 2024 at 11:35:31PM PST, Ban Feng wrote:
> >>>Hi Zev,
> >>>
> >>>On Sat, Mar 2, 2024 at 4:19=E2=80=AFPM Zev Weiss <zev@bewilderbeest.ne=
t> wrote:
> >>>>
> >>>>On Mon, Feb 26, 2024 at 04:56:06PM PST, baneric926@gmail.com wrote:
> >>>>>From: Ban Feng <kcfeng0@nuvoton.com>
> >>>>>
> >>>>>NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.
> >>>>>
> >>>>>Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> >>>>>---
> >>
> >><snip>
> >>
> >>>>>+
> >>>>>+static const struct of_device_id nct7363_of_match[] =3D {
> >>>>>+      { .compatible =3D "nuvoton,nct7363" },
> >>>>
> >>>>As far as I can see from the code in this driver, it looks like this
> >>>>driver should also be compatible with the nct7362; shall we add the I=
D
> >>>>table entry for it now?  (Though I only have a datasheet for the
> >>>>nct7362, not the nct7363, so I don't know exactly how they differ.)
> >>>
> >>>As far as I know, the difference between these two ICs is 0x2A~0x2C
> >>>Fading LED for 7362, and 0x2A Watchdog Timer for 7363.
> >>>In my v1 patch, I indeed add the nct7362 to the ID table, however,
> >>>this makes it more complicated and our datasheet isn't public yet.
> >>>I think maybe supporting more chips will be done in the future, but no=
t now.
> >>>
> >>
> >>If the only differences are in features the driver doesn't utilize, I'm=
 not clear on how it adds any complexity.  As far as I'm aware, neither dat=
asheet is public (NCT7363 nor NCT7362), so if we're going to have a public =
driver for one, why not also do so for the other?  It's a single additional=
 line -- and furthermore, having made that change and tested it out, I can =
report that the driver seems to work just fine on NCT7362 hardware as well.
> >>
> >
> >"if we're going to have a public driver for one, why not also do so for =
the other"
> >
> >If you are trying to say that there should be two separate drivers, sorr=
y, that
> >would be absolutely unacceptable.
> >
>
> Sorry if that was unclear -- it was very much *not* my intent to suggest
> adding a separate driver, merely that we make the nct7363 driver also
> support the nct7362.
>
>
> Zev
>
