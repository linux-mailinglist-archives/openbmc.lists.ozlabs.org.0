Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FFA27DBFA
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 00:23:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1DS23hsvzDqZV
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 08:23:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=pDrco89o; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1DR15FXszDqF7
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 08:22:31 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id x8so4814394ybe.12
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 15:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wI5ojAeFNhKbgt15wstZPvNJPVpZSHX5Zew9uoPtCpk=;
 b=pDrco89oYDqji3wE92ag3GmiQMeQy/Wmqv/IS2FPUs2O6n0yxWfAHbGbV2o3X5TzkJ
 kY1G77dVekyz9HOBzOYRxM8aP6qSKTy91e+/eOzhX4+5kgV7Q9p683YCt6/712EN14co
 wfHCuNa0uPIILBc+LmJ2y40plNa1JqGpDEQo4YuqaXPWi29AaPnNRp+Gkmn1AK23QvdG
 yWo0s9DgWGpciNpYguFZs/MuC2zL7aLS7yDw+OeHZgj5wREqTkOGM5e8edoxtmhthy51
 GlUsBl1/d5QzqyvvZe+Hkvr9OkPYz/kSUmGCU2N9HvH11ISrvUC7pvaNavjhzOlfoUZT
 JKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wI5ojAeFNhKbgt15wstZPvNJPVpZSHX5Zew9uoPtCpk=;
 b=eSwI+ol0UA0MMLiRxixGLc+lvSgRWJyRm5To3aq6XkVrN4ORzhZZo21EMBHcOvlcZC
 ydcgPJD0ICHaE4alR1xZmwDXsMHl3QMFh7+vdksFnmCOibU15CI6s3izipnufNmHYWni
 BUR2pGYxoWnXVlu5HEa4LYZTTzW+21NDOnKtue38QrTBwh1rrp6o65IlfnNbdiRN4DV8
 ovKa0VwdA2qf88GA7Jp8ByBW4jJJvr6LicufZwOVlm9ZkdYBTRc1gQJ0YAx/i0yQQ0SV
 lr8HlUM0gCmZejvfNEZoDmF78Wt3Rg9nFqZdehaLgwc1FHQMawkY535zYVr/o+Q/0ySY
 /abw==
X-Gm-Message-State: AOAM531RO4vuipmdw/jIKstIUaRJ9mBVXCzh/6zGsNAYe2ZDKI5I3vXW
 GqUwYb8doiNhVf72gVcxbtleFDUPfBOqdb0JUKK5EQ==
X-Google-Smtp-Source: ABdhPJwc/jCzPjpQv8f4uURETs2AkOh/x9YLe0oPOlAL2Y3G3zphbUTtpPDOHbShYp6XBfJ+JpApbA4ObLV/XHNy+lo=
X-Received: by 2002:a25:74d7:: with SMTP id p206mr8533691ybc.170.1601418147919; 
 Tue, 29 Sep 2020 15:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com> <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
 <20200923214237.GV6152@heinlein>
 <CACWQX82uw_PEWouQ0tu=vKL_Wh_G8t-yUiEQ64RJh=0O=vDSAA@mail.gmail.com>
 <4F207AFD-3CE9-4AA3-B520-34C63041EB55@fb.com>
 <CACWQX831_jv3NXBEjX6mCDgne65ynASgAeNNHUpiOUfME53Swg@mail.gmail.com>
 <3C833FB0-8B23-4F0D-BA4D-60033CA2557F@fb.com>
In-Reply-To: <3C833FB0-8B23-4F0D-BA4D-60033CA2557F@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 29 Sep 2020 15:22:16 -0700
Message-ID: <CACWQX83M0zZQvFx+pzM8n2r127KSYgVXWV1ZJOdHYhCyBmXvEg@mail.gmail.com>
Subject: Re: Chassis reset
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 29, 2020 at 3:14 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 9/23/20, 7:24 PM, "Ed Tanous" <ed@tanous.net> wrote:
>
>     On Wed, Sep 23, 2020 at 6:59 PM Vijay Khemka <vijaykhemka@fb.com> wro=
te:
>     >
>     >
>     >     >
>     >     > I'm not understanding what you mean by "come up with an API t=
o steer the
>     >     > Redfish..."  I think everything is specified here at a dbus l=
evel.  The
>     >     > issue is figuring out the appropriate Redfish model of
>     >     > Chassis/ComputerSystem objects (along with the included Resou=
rce.Reset
>     >     > types).  To a casual reader, who hasn't been involved much in=
 Redfish
>     >     > implementation, the current mapping of these ResetTypes seems=
 fairly
>     >     > arbitrary.
>     >
>     >     Some might be arbitrary, but most are explicit and chosen on pu=
rpose,
>     >     especially in the case of the System schema.  The Chassis schem=
a is a
>     >     little more lax, as it's more of a backward compatibility thing=
 today.
>     >     I think you (Vijay) are the first person trying to model it
>     >     "properly".
>     >
>     >     What I mean is that the current Redfish definition of Chassis p=
oints
>     >     the PowerCycle action to chassis0.  That PowerCycle action now =
needs
>     >     to point at multiple things, chassis0 if we don't support AC re=
set, or
>     >     chassis_system0 if we do.  That is the "steering" I was referri=
ng to.
>     >
>     > How about we map powerCycle to chassis0 and ForceRestart to chassis=
_system0
>     >
>     >
>
>     I would not be in favor of this.  Technically you're implementing a
>     PowerCycle here as you're cycling the power supplies off then on.  A
>     ForceReset would be if you asserted some kind of reset pin to the
>     board, while keeping the power supplies up, which, while valid, is no=
t
>     what you're doing.
>
> I am actually asserting a pin by sending i2c command to HSC (Hot swap con=
troller)
> Which removes power and restores back.

That doesn't change anything in this regard.  Regardless of the
physical medium, the end result is that power is removed, then
restored.  That's a PowerCycle action.

>
>     Also, it would mean that we have multiple actions to maintain
>     externally, and users would have no guarantees about which ones are
>     supported.  Mapping PowerCycle to the best supported mechanism we hav=
e
>     seems like the best thing to do here.
>
> Then should we map this chassis powercycle to chassis_system0 in the code=
?
>

yes, if chassis_system0 is supported on that platform.  If it's not,
it should fall back to the old chassis0 node, so we don't break
anyone.
