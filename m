Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E216E19C28F
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 15:27:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tP452rxMzDrKn
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 00:27:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uN3EohhB; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tP1c38vXzDrJq
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 00:24:50 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id q204so2692705oia.13
 for <openbmc@lists.ozlabs.org>; Thu, 02 Apr 2020 06:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=4+g1yjqkVto6kWbssuTF510eyFtCn9cQBNdvJQYalBM=;
 b=uN3EohhBc3gTzON4Z1dEXrV5mfiZhRGpam52wqRF32FFAVlrDsHdh1tzavcnslE/xv
 S+EoZ7U/xDwka9KVia8mhAh0BvuthqYbRbKIeAgybXkjIfla9v/eJTwnEhcZeQR5epRx
 rbGBEB2gWQtJn8EBcwoActxGw7PO+VAMs6sXLkLyNDyWNaR7eNqunzCVVhr/Mp8yLQEj
 ipFRpR6Qo/FZJbRX2JL/ihvu6pa/pMy/M6mUTJIs9jaajJ/L/5RA4Oisk4JSIKZvUQN8
 FSMeKFzpmoTh95o2Y906qQ6/6H5JBHNZnbaqnxbiuNIz6eN/MoeBGFySx6Dsx7DWHPxZ
 1EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=4+g1yjqkVto6kWbssuTF510eyFtCn9cQBNdvJQYalBM=;
 b=YmeYpoRLCWf5eY0mx7GfTzHHbVjT5ZTPbLUFpIJbdpR0TBlzVMDjSuJv6D4Vw2znZx
 REVefbh/uk+d+jJ+UZNKsalZtzsUKdCi4rNXu4AtLSqLT8uM/yjIU6TzJzyawlz4JjwT
 uUII6+h9SClzm9HkUh+KtMJUJffh+5UReawuZbcfWtVK1R/TZujQKQ9mVSONOt/oLMus
 CBUG7F1FrW7YCG3rVNFhTqBO3g2561WpfZgSrF7y+G2wJuH5iw/zmdHc92qkxJQj3Zal
 OWUCoYj5E5EEX2D+I4jthbhelrpG9CguAMg22AjLg+8bts8BFKkZC1xgMs26t0cEcdy8
 0wWA==
X-Gm-Message-State: AGi0PuaAH7hSt8NtqLerv6f8tS7Ra90fsrxXrpvR7FhNh8jMWSIU5qGb
 yoL84A5tcZVf39jH736LTto=
X-Google-Smtp-Source: APiQypLKuio0fpAtNgLUkF/wHEAva0luyq85UGTYGjRPXPWkaDWmEz50wd4DUeg7N8KX9BhnZsXv7A==
X-Received: by 2002:aca:100e:: with SMTP id 14mr2205987oiq.79.1585833886413;
 Thu, 02 Apr 2020 06:24:46 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:88e1:9244:7116:6a6b])
 by smtp.gmail.com with ESMTPSA id r18sm1253823ooc.17.2020.04.02.06.24.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 06:24:45 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: OpenBMC Janitor/Gardener
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CAH1kD+ans6=BbPP9Sut7OQC3Fdt_=+=QEgzyFgyPa_9vwLS0TQ@mail.gmail.com>
Date: Thu, 2 Apr 2020 08:24:44 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <D5247659-8187-4C5E-8CDB-452BA6B411E5@gmail.com>
References: <CAH1kD+ans6=BbPP9Sut7OQC3Fdt_=+=QEgzyFgyPa_9vwLS0TQ@mail.gmail.com>
To: Richard Hanley <rhanley@google.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Apr 1, 2020, at 12:34 PM, Richard Hanley <rhanley@google.com> =
wrote:
>=20
> Hi,
>=20
> I was recently looking into the linux kernel introduction, and I =
noticed the kernel janitors https://kernelnewbies.org/KernelJanitors.  =
It seems like a pretty interesting idea, and I've been thinking about =
janitorial tasks in OpenBMC.

Yeah, this is nice. I saw yocto just did something recently as well with =
their =E2=80=9Cnewcomer=E2=80=9D tag.
https://wiki.yoctoproject.org/wiki/Newcomers

> For some context, we've had a handful of new developers join recently, =
and I've been looking for some small refactoring projects that they =
could work on upstream.

Yeah, best way to learn is always to just jump in with some easy =
bugs/refactor.

> So I guess there are two parts to this email.  First does anyone have =
some bite sized improvement task that's been on their wishlist, but =
there hasn't been anyone around to work on it.  (In particular things =
around bmcweb and phosphor dbus interfaces would be appreciated).

We=E2=80=99ve always been a bit lacking in unit test coverage in bmcweb. =
Anything to improve that would be great.
I know Gunnar also has a constant stream of DMTF Redfish spec new =
function and updates that always need some bmcweb work.

>=20
> The other thing is, what do people think would be the best way to =
publicize these kinds of refactoring/janitorial/gardening tasks. One way =
would be to create a *gardening* tag in the github issues.  That way =
people can set up filters for ideas that experts think are a good idea, =
but probably won't need deep design discussions to get started.

I think we used to try and do this with the =E2=80=9Cbitesize=E2=80=9D =
tag (https://github.com/openbmc/openbmc/issues?q=3Dlabel%3Abitesize+) =
but it really isn=E2=80=99t used much anymore. I=E2=80=99d vote we try =
and be consistent with whatever tag others use though. =E2=80=9Cgardening=E2=
=80=9D or maybe the yocto one of =E2=80=9Cnewcomer"

>=20
> Another way would be to have a monthly/quarterly wishlist gathering on =
the mailing list.  That way we have some dedicated time to discuss =
issues of the day, and put them together into a markdown document (like =
a per project version of the security group wishlist =
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-fe=
ature-wish-list)

I would def participate in a mailing list gathering on this topic if it =
were to happen!

>=20
> Maybe this is already happening, and I just haven't noticed it.  =
Anywho, hope you are all doing well.
>=20
> Cheers,
> Richard

