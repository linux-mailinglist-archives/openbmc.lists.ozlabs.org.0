Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E27AF4BEC1D
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 21:55:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2ZLc2Kbsz3c9t
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 07:55:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j+UqPRPE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=j+UqPRPE; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2ZL9491Hz30Bc
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 07:54:39 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id s5so12224504oic.10
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 12:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=vz97BKZqqnHlexLTojmBd7seb0OC9zr3YrjdaMt1ODM=;
 b=j+UqPRPEwOtEKDfw69r326dkJXKKIeg7H8S8iCzUJYorqZLx2eUUsngo4syRjsKvzC
 /zsEzRwgb9TQ9IQKGH9LkfGq8q6Lq5OJ00ZrVedbrgRsIGwkcUgyGy+iAx/enad5F2zt
 maeBfijpfh6BRXLJQJ1HVFz8GdMiz+G0FruK6ZfW+epC6sIbiHXc0hJW2GOnlycoF+Mv
 Ztyq6QO5NOJisRwOuo3OrZYqY4kXZEoh+vzKwQnJDRhLw5TJh47mOVlWeHhNfzwM5TJI
 kDtXEU9K2xrMulgapsCqIk/lo2rNXyTZfIWblRWHHMUcORTXUFdE6G25yjKGUW/fVMBQ
 nzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=vz97BKZqqnHlexLTojmBd7seb0OC9zr3YrjdaMt1ODM=;
 b=gbDMOgn48HE/lZ0hqGubkrVWwPKt09DVZ+DtglvClYCqDnZnoDcYoxKEoMSTe6qCCg
 jDNT+BMSAmZOIptxvreOTKcoIKaA3y3SIQ/trsGnDaY67jwRp41G09aTgF8Se5kgbO+u
 0CKy1znVy8f/jyNCTkvKajEyO7WZ3x/JYYzrotygu6ztfNIpcbRyLPYh6YHhWAX0a4EU
 gdXS8BHzRSRnp1nkKLsU13HG8K78ZLZwdgUEJSbsCdQvpCELDINaEWvQbgEzvH0S1DA1
 KPmAc+b4AGfslCK60tbhDSDouqMsIGOtIc/SzPgSnH4uI+uTvgnCDB9UgBfBH1b2z8N8
 eW4g==
X-Gm-Message-State: AOAM533a5uYH39Dz3Oj6trjQp+WGU0lpx8jdr9yzm26cJV/8BWLGQqnE
 PZxq2tZwsxCbVl3GXaM4mubyZqs3Mmjrxg==
X-Google-Smtp-Source: ABdhPJxzqnenluaaWUKBSGLZcH6TTquaz4hfnPbRGVVczOsSic/F/enalUiAPOhIEV4Xor+v8IGC7A==
X-Received: by 2002:a05:6808:d54:b0:2ca:d439:1cdb with SMTP id
 w20-20020a0568080d5400b002cad4391cdbmr425822oik.79.1645476875005; 
 Mon, 21 Feb 2022 12:54:35 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:19e0:3310:6d06:d060:5868:a6c5])
 by smtp.gmail.com with ESMTPSA id bh21sm8117707oib.6.2022.02.21.12.54.34
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:54:34 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Critical BMC process failure recovery
Date: Mon, 21 Feb 2022 14:54:33 -0600
References: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
 <F503539B-1F5B-4EC0-A11F-A8A6EEA950B2@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <F503539B-1F5B-4EC0-A11F-A8A6EEA950B2@gmail.com>
Message-Id: <1663E960-38C1-401C-910D-32A74EFC6455@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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



> On Sep 1, 2021, at 7:29 PM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
>=20
>=20
>> On Oct 19, 2020, at 2:53 PM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>>=20
>> Greetings,
>>=20
>> I've started initial investigation into two IBM requirements:
>>=20
>> - Reboot the BMC if a "critical" process fails and can not recover
>> - Limit the amount of times the BMC reboots for recovery
>> - Limit should be configurable, i.e. 3 resets within 5 minutes
>> - If limit reached, display error to panel (if one available) and =
halt
>>   the BMC.
>=20
> I=E2=80=99ve started to dig into this, and have had some internal =
discussions on this
> here at IBM. We're starting to look in a bit different direction when =
a service
> goes into the fail state. Rebooting the BMC has rarely shown to help =
these
> application failure scenarios and it makes debug of the issue very =
difficult.
> We'd prefer to log an error (with a bmc dump) and maybe but the BMC =
state into
> something reflecting this error state.
>=20

For those following along, there has been yet another (slight) direction =
change.
Instead of trying to manipulate the service files directly for each =
=E2=80=9Ccritical=E2=80=9D service,
a json file design was done. So we=E2=80=99ll have a default json that =
defines
the base BMC =E2=80=9Ccritical=E2=80=9D services and then system owners =
can override or
just append their own json file for their critical services.

This builds upon the existing target monitoring design which made =
implementation
quite easy.

# Updated Design Docs
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46690
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/51413

# Initial critical services:
=
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/5112=
8/2/data/phosphor-service-monitor-default.json

>=20
> Thoughts on this new idea?
>=20
>>=20
>> The goal here is to have the BMC try and get itself back into a =
working state
>> via a reboot of itself.
>>=20
>> This same reboot logic and limits would also apply to kernel panics =
and/or
>> BMC hardware watchdog expirations.
>>=20
>> Some thoughts that have been thrown around internally:
>>=20
>> - Spend more time ensuring code doesn't fail vs. handling them =
failing
>> - Put all BMC code into a single application so it's all or nothing =
(vs.=20
>> trying to pick and choose specific applications and dealing with all =
of
>> the intricacies of restarting individual ones)
>> - Rebooting the BMC and getting the proper ordering of service starts =
is
>> sometimes easier then testing every individual service restart for =
recovery
>> paths
>>=20
>> "Critical" processes would be things like mapper or dbus-broker. =
There's
>> definitely a grey area though with other services so we'd need some
>> guidelines around defining them and allow the meta layers to have a =
way
>> to deem whichever they want critical.
>>=20
>> So anyway, just throwing this out there to see if anyone has any =
input
>> or is looking for something similar.
>>=20
>> High level, I'd probably start looking into utilizing systemd as much =
as
>> possible. "FailureAction=3Dreboot-force" in the critical services and =
something
>> that monitors for these types of reboots and enforces the reboot =
limits.
>>=20
>> Andrew
>=20

