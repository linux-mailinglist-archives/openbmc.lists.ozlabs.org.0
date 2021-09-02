Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F41A23FE5C9
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 02:29:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0MHx6gkcz2yNQ
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 10:29:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oXfKSMuJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oXfKSMuJ; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0MHT3cffz2xsB
 for <openbmc@lists.ozlabs.org>; Thu,  2 Sep 2021 10:29:08 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id q39so409130oiw.12
 for <openbmc@lists.ozlabs.org>; Wed, 01 Sep 2021 17:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=52PuIgGJrhnTQ4JgyDojYl/vnRSnJ96PKRuFhDE3S+s=;
 b=oXfKSMuJtraZwWbNY/DglcJxkf/IsPriy8E50OvWBMHP3FTE82fBRgn7KTlX2YkPmh
 RP5TdyF4bgs/lTTlekbg8ZQOgFEoM1YNsyOakJGcbRbuDN3UbAJszOtRtvcSRMoY9p2g
 oM+5UmbiRvmlidVHvB5TgRNOIdklrb0j3NIEk0ZtQHrRHFgQC+GlE065Hz4rT6eFDbTv
 Sg3O0iYcQZMmmlnC7RjNZWL+PXQRb/DC+5JQQyMSsitbCzGzgKr1Ih/sZtWovRJ87f6d
 4OpwpcxOPsTDidJ35BSrjMUoIIScU61VTEyytnyZ8+ch0RGMVtHpJQhVBFdBf9EGmZn+
 7RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=52PuIgGJrhnTQ4JgyDojYl/vnRSnJ96PKRuFhDE3S+s=;
 b=AHlqU8VdS3REeZR6ex/wRu+ttoj4yf7Nq69I3br8Xg7ZZUFKyyDAB12MDGpISLSDr7
 KNsBkUQ5GvrGinTzMuonaED+qL5EOCl/9c3nb2Ed7R3lQHhDXQOKT091qAwZZXkmblx4
 Ll61yvIqtsi2p4CGboERDobg/048BmYpe8BkGSVNuY20BhuFu1wgjXDKwDwsI7pwIxl8
 K7yMfj+g55NswdG3y8El8tDabk2tsDj6H2EffFWtcmSzt2De7lIoH305ZMsGtsEMlc7I
 U1nAXd5QnC9zqhu9onLopMVkKCA/+/FPXAs3GvFY0KX4qrnXYNWDlO11ihv7auroY2ZS
 /pvw==
X-Gm-Message-State: AOAM533krbfVUKXVKn72PNu1D6BQrpeurhjNklThryUS1UcMj5PUbUYf
 1nNT0Do/lIR5GHTG2fRYa7LWa9QGnzBOEw==
X-Google-Smtp-Source: ABdhPJxZmFonUegFIA6ga2zWDhSBtQM7KZga/S6UiQFqHgZ9j/XTE+YN1dGN4+GeI+tLxAvfNDTd/A==
X-Received: by 2002:a05:6808:180e:: with SMTP id
 bh14mr328551oib.19.1630542544944; 
 Wed, 01 Sep 2021 17:29:04 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:6440:9418:3c3f:377d])
 by smtp.gmail.com with ESMTPSA id f126sm44659oob.9.2021.09.01.17.29.04
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Sep 2021 17:29:04 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: Critical BMC process failure recovery
Date: Wed, 1 Sep 2021 19:29:02 -0500
References: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
Message-Id: <F503539B-1F5B-4EC0-A11F-A8A6EEA950B2@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 19, 2020, at 2:53 PM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
> Greetings,
>=20
> I've started initial investigation into two IBM requirements:
>=20
> - Reboot the BMC if a "critical" process fails and can not recover
> - Limit the amount of times the BMC reboots for recovery
>  - Limit should be configurable, i.e. 3 resets within 5 minutes
>  - If limit reached, display error to panel (if one available) and =
halt
>    the BMC.

I=E2=80=99ve started to dig into this, and have had some internal =
discussions on this
here at IBM. We're starting to look in a bit different direction when a =
service
goes into the fail state. Rebooting the BMC has rarely shown to help =
these
application failure scenarios and it makes debug of the issue very =
difficult.
We'd prefer to log an error (with a bmc dump) and maybe but the BMC =
state into
something reflecting this error state.

It does seem like based on our previous emails though that there is some
interest in that capability though (bmc reboot on service failure). As a
flexible option, I'm thinking the following:

- Create a new obmc-bmc-service-failure.target
- Create a bbclass or some other mechanism for services to have a
  "OnFailure=3Dobmc-bmc-service-failure.target"
- By default an error log is created in this target
- System owners can plop whatever other services they want into this =
target
  - Reboot BMC
  - Capture additional debug data
  - ...
- Introduce a new BMC State, Quiesce. The BMC state changes to this when =
the
  new obmc-bmc-service-failure.target is started. This then gets mapped =
to
  the redfish/v1/Managers/bmc status as Quiesced so users know the BMC
  has entered a bad state.

BMC kernel panics and such would still trigger the BMC reboot path and =
some=20
TBD function will ensure we only reboot X amount of times before =
stopping
in the boot loader or systemd rescue mode.

Thoughts on this new idea?

>=20
> The goal here is to have the BMC try and get itself back into a =
working state
> via a reboot of itself.
>=20
> This same reboot logic and limits would also apply to kernel panics =
and/or
> BMC hardware watchdog expirations.
>=20
> Some thoughts that have been thrown around internally:
>=20
> - Spend more time ensuring code doesn't fail vs. handling them failing
> - Put all BMC code into a single application so it's all or nothing =
(vs.=20
>  trying to pick and choose specific applications and dealing with all =
of
>  the intricacies of restarting individual ones)
> - Rebooting the BMC and getting the proper ordering of service starts =
is
>  sometimes easier then testing every individual service restart for =
recovery
>  paths
>=20
> "Critical" processes would be things like mapper or dbus-broker. =
There's
> definitely a grey area though with other services so we'd need some
> guidelines around defining them and allow the meta layers to have a =
way
> to deem whichever they want critical.
>=20
> So anyway, just throwing this out there to see if anyone has any input
> or is looking for something similar.
>=20
> High level, I'd probably start looking into utilizing systemd as much =
as
> possible. "FailureAction=3Dreboot-force" in the critical services and =
something
> that monitors for these types of reboots and enforces the reboot =
limits.
>=20
> Andrew

