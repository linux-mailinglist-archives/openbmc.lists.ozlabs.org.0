Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE55158B1
	for <lists+openbmc@lfdr.de>; Sat, 30 Apr 2022 00:53:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kqnnp272Rz3bpL
	for <lists+openbmc@lfdr.de>; Sat, 30 Apr 2022 08:53:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ikU6jlUX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::331;
 helo=mail-wm1-x331.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=ikU6jlUX; dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqnnQ2zpsz2yMS
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2022 08:52:41 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id bg25so5356817wmb.4
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 15:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wvXL5ezXYM3r3nGHhTTHxOGBSp7mG+tWy0tEacQTjsI=;
 b=ikU6jlUXolzenKuxauyr3VCr9HFerlmXStJNunrzCr/jP/CK4d0Y7V4dmKtaHlRreq
 3SaXVpir9moerGbZSatOsEtFGb10igSzvvO5oRVP1zn8nnB2B/4Gv/UuKQjm7kpUvH7W
 jnouJQlhpwdBiw9CLJWbSj/kfjk4AjDrCPY8nvDW1TgmuXDxZow63DR3jOxJtfEnLCfk
 PBaFHym3yvw8MgGfEc8OVjFXlwzKZJKayFrQgHylp3puO4VRgQ7NTDPPdmgWp1qhPmAx
 1BMNjMUb/6fZEvdNJqhnTXXP7eubo7DFvPU2Peu9Edpv/YPOva/oAXocUk6khPkFUdht
 lHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wvXL5ezXYM3r3nGHhTTHxOGBSp7mG+tWy0tEacQTjsI=;
 b=iNFi95EX0IsxofPKrETvWJvHfO7OJGVQYjxqx4wFKxhBou/LiDqdqe1alBe+dZr2KQ
 536uQoXMxQ4g9fr45+8zu6mKR16jkUweYNrNkmH2lzKjdokd1nHLXVE10FJ2ONeOBJra
 5R7ZtWaEL8o1F0vaTANIRoq+RWxDbWeXP5JntPBFG/ND44QEo9Qaf05+UZNRnI39CtK0
 gP9aTY9v1ROCF+RKkpzJ+13wPCt9IWUJDopm+8ebCXUMqZPyiaKpd0unP4Rl9xI/e2lq
 F0O0ObrHujVsI2rngw3IXan6dlUTHduyG69l4mJCkWYli91drhNRE9I86PUB7vJC1NuK
 uDIA==
X-Gm-Message-State: AOAM530hq+BGB+6mw6zVG1h2z1FtM5YJx5uB5/OrmdHM9ombfGe/vcnD
 3uJ4qpE0EOaKrNxFuKqG4AoaS6rDQIs8AFO3rUq8ig==
X-Google-Smtp-Source: ABdhPJxeT/eFiFFn/Lp91rFRSdH5D/02HF9+W6X9S6VPcuFieuTV2bNK+MZIpdmNluqDkeQXsh51VH9OOjBmLe8uCrw=
X-Received: by 2002:a05:600c:4f90:b0:392:8de8:9deb with SMTP id
 n16-20020a05600c4f9000b003928de89debmr1047708wmq.166.1651272753914; Fri, 29
 Apr 2022 15:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <DM4PR11MB5247C11F5DAB40B354BE4088B9FC9@DM4PR11MB5247.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5247C11F5DAB40B354BE4088B9FC9@DM4PR11MB5247.namprd11.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 29 Apr 2022 15:52:22 -0700
Message-ID: <CAH2-KxAusoe1=puTtT-cz4gtFpPeRd7u6VG+4e5eqd-rnabq4Q@mail.gmail.com>
Subject: Re: Virtual Media upstream status.
To: "Hawrylewicz Czarnowski,
 Przemyslaw" <przemyslaw.hawrylewicz.czarnowski@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>,
 "przemyslaw.hawrylewicz.czarnowski@linux.intel.com"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 29, 2022 at 1:42 PM Hawrylewicz Czarnowski, Przemyslaw
<przemyslaw.hawrylewicz.czarnowski@intel.com> wrote:
>
> Hi.
>
> In response to Ed's request, I started this topic to discuss upstreaming =
activities (to both existing and new code). And to make update seamless and=
 effective.
>
> As service upstream is little stalled waiting for UT to be completed (alm=
ost completed), I wanted to attack the problem from another surface. I've p=
ushed bmcweb patches as it got old since first submission.
>
> There are two blocking problems I am aware of in current nbd_proxy code. =
First is that compilation fails. The second is a race appearing sometimes d=
uring disconnection. But those are the simple ones.
>
> There is more to rework for redfish part. There are two patches
> * Make status of InsertMedia action consistent (I29d53483) https://gerrit=
.openbmc-project.xyz/c/openbmc/bmcweb/+/53343/1
> * Apply async dbus API (I1d016126) https://gerrit.openbmc-project.xyz/c/o=
penbmc/bmcweb/+/53345/1
>
> First one addresses simple problem with inconsistent responses from rest =
api calls connected with actions. Proxy mode does not support InsertMedia a=
ction, but is implemented for legacy so response has to be applied accordin=
gly. It has been fixed with some code generalization.
>
> The second one applies latest design changes (https://github.com/openbmc/=
docs/blob/master/designs/virtual-media.md, dbus communication part).
>
> Those are must-have changes to work with the service state we upstream at=
 the moment.
>
> After service upstream is completed changes removing nbd_proxy option in =
meson has to be reverted as the last part.
>
> No more activities are planned now from out side, but later on we may foc=
us on adding privileges support for websockets (AFAIK it is not supported o=
n level of web server yet).

Great to hear from you!  You mention a lot about the bmcweb-side
changes, which are a pretty minor part (I just merged 2 of the 4
patches), and I'm happy to review them.  The part that interests me is
the backend daemon upstreaming to make this feature useful and
testable outside of the Intel tree;  When would you expect that to
occur?  Will it be an incremental update to jsnb?

In terms of bmcweb, there's currently two implementations, the jsnb
targeted one, and the one you're working on above.  Is there any
reason to keep the jsnb one once this new daemon has been updated?

The design doc referenced above is about 3 years old at this point,
are there any design updates that need to happen, or is it still
relatively accurate?

I'm glad to have someone working on it.  If you need quicker response
times to short-run things, most of the maintainers and myself are on
Discord, and would be happy to help you work through the specifics of
the patches needed to get this in.


>
> --
> Best regards,
> Przemyslaw Czarnowski
