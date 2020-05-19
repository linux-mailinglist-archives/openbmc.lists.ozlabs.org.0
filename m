Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E494B1D8C95
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 02:53:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qy7P206fzDqcR
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 10:53:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Th8AEPyL; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qy6Z2jKyzDqQs
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 10:53:08 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id w4so6991064oia.1
 for <openbmc@lists.ozlabs.org>; Mon, 18 May 2020 17:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ceOyYSbdQY+O7BkOstEAL5Yh5YVPw6yXLmlg+eoHPjU=;
 b=Th8AEPyLzyZNQA71xD0d3ZRrRKbGUxy0Fz5RZRofLEAJQGJVxDvnFTXhkfkoS2YGcY
 zCFxzTYC0SssKrLvLOkDBszydAb0Colb5dB/vtyZWHRxNip0y8Z5FmuJ3jSQxhoo+r4p
 ai+SmfTtt0iLTV5Nd921hSX40eS1iYwQN1T9MMWYt8wtWtaz/0XHb5BMHxEY/65waXoe
 exGvlG2uiNDPsrG3JDxyeBiPCzv4gU3PDcx6WxwsTbIC3BFw+3D9gYuvlpGrJi4OF2rD
 Sym0kDKY8rkD+jSsmMNiQwy3yc77vjAp/+k98nxDrYCbEkU2qzQ3yBFib9DL+ZkcTwsf
 Nfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ceOyYSbdQY+O7BkOstEAL5Yh5YVPw6yXLmlg+eoHPjU=;
 b=bw3Bm1UMpU30JwKX8fGTKmh3lYLB85npEPcusMkkHkmWKEeE+nYryftls7Za3Gw8Ho
 DcNlYNydqe2m9hzkRCu+HvlssQa+TeHCqEYstI9dCZDeTT7N2lWvHZp0uXoBhWmovZ/i
 dpzKDEeJkcZJcQAU5bVL7C1pipIPtmDLHQgLLhx4iVtdbQGMCiJ1BZWPEne/DXTVuFC1
 0Hf2fMDUzZJcPSb18ubYCcVPxRNyohR6x5m0rSS4l+5ajMbqk02CwHl9lE3Ps5Drr0eq
 uzX8I0PFG+ekzUr9aTWlQsPpiRpgv3Y2QjJ3ctenCZy7AqvbIwUR0fsrXFcsnk54DEsG
 Qqig==
X-Gm-Message-State: AOAM5312JciuICpvEAL/ovGv5o6g1JtIs+3v9AtCQjeeiiITota/+5qt
 JqkkT9lr/4OCxC9aD/0VpPFfE818NZw=
X-Google-Smtp-Source: ABdhPJzz3MKfi2jvwUNc3hPqZTT4tuWK3fPC8eJ6mchBvYDmLhsLrHC0sTl/lGFVCbg1oiDjehhdKA==
X-Received: by 2002:aca:d493:: with SMTP id l141mr1603223oig.20.1589849584602; 
 Mon, 18 May 2020 17:53:04 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:78a3:9763:996f:9137])
 by smtp.gmail.com with ESMTPSA id t127sm737371oif.41.2020.05.18.17.53.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 17:53:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Reducing fragmentation in OpenBMC
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
Date: Mon, 18 May 2020 19:53:03 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA2FE467-1072-4CD6-BA9F-3AAAD40DC8E0@gmail.com>
References: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
To: Jeremy Kerr <jk@ozlabs.org>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 15, 2020, at 4:03 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
>=20
> So, a few things that I think may help the situation:
>=20
>  - Adherence to standards. Being a little more strict about what
> comprises an OpenBMC implementation will go a long way to prevent
> future incompatibilities, and means that all of our interface
> implementations automatically document their expected behaviour
> (because that's in the standard).

I know phosphor-dbus-interfaces has always been a bit onerous. I do feel =
like
we get some good stuff in the reviews though. It also ensures we have
documentation  of our interfaces. The cross-repo dependencies we
get are a bit frustrating (i.e. need to get interface merged and bubbled =
into
openbmc before you can implement). There=E2=80=99s also no versioning =
concept so
if an interface needs to be changed, it=E2=80=99s a huge pain. Ideas on =
how we could
make this easier but keep the benefits? Or people that don=E2=80=99t use =
it and just
define their own interfaces, any improvements we could make to get
you to use it?

>=20
>  - Identification of a set of reference platforms. If we can point
> adopters to a platform that provides a recommended (and somewhat
> "supported") way of doing things, that would prevent a lot of =
confusion
> around different implementations, and how to best work with the =
options
> available

This is definitely a big one. I=E2=80=99m not sure the solution though. =
There=E2=80=99s a
divergence between platforms. I know there=E2=80=99s some effort to to =
converge a bit
(entity manager usage) but  we seem to still be going through that phase =
where
we have multiple implementations of things and we=E2=80=99ve just got to =
let them work
themselves out. That can be confusing to new people coming in. A lack of =
an
affordable reference platform we can point people to is something that =
comes up
often in the community.

>=20
>  - Documentation of interactions between components. There's some =
great
> documentation on how our components work, but not a whole lot on how
> they fit together. Without this, it means a lot of jumping around
> between repos, trying to find the "other side" of each interface.
>=20
>  - Keep pushing on upstream. Sometimes this can delay things, but I
> really think that's almost always false economy; the out-of-tree
> patches will have to be addressed at some point, and that job just =
gets
> more involved as time passes. Even engaging other community members to
> help out would be great.
>=20
> Finally, I don't mean this to sound like a bunch of complaints - I'm
> keen to put in a bunch of time to address things. I'd just like to
> start some discussion on how best to do that, before I do so.

Good topics and thanks for starting the discussion Jeremy!

>=20
> So - any thoughts on how we can improve this? Comments / disagreements
> / questions always welcome.
>=20
> Cheers,
>=20
>=20
> Jeremy

