Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6B306191
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:08:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQqmY64h4zDqvN
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 04:07:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Ocg0MZLT; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQqlY4vWjzDqDq
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 04:07:04 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id h9so2673478wrr.9
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 09:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zf22D611O0lQhtb8l6rlJERFgoCflAZpTPmiBsSoK9E=;
 b=Ocg0MZLTRhZTJDdNMSQDP1dx+8wcu+CXBHujCDF3nAeIp26Tu1vxfQNQ654KlaqTWW
 LDQBB3qWpUTgUeRjpZpp1d/YcFvgyx0+LCYipM7h6tb2Ma8dpFOvGSlNSWFi6qHdF7+K
 L38mbvMw7rDiJq9vTakS/Su1qcrul+9zWSH522nYoGntIWgBMyvruCWPvCtchcFujKR/
 tzzrxqM3UyCcqS4Ll48Yk1OXZTAoXphfgNAiQepzqJiur+fOtyu6xrlpw29WLiAbkhXP
 v5ldB6lj9jtWlNeQobO+PddDdQ5KE/XdRcViXleU2nb94p7Z8PXJA5iHXpBK+JrJELiN
 3xGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zf22D611O0lQhtb8l6rlJERFgoCflAZpTPmiBsSoK9E=;
 b=AweFqsy8CwITjjV0HDcuvqylgiI9rhRwcJSdHzWtGEOL1bsF/TdTIoZSiXALYaOUwv
 2zJghnyXg5eqvIRCAqD4qFYNQkBYLiJzpaQPXGf3w8pK1W1t3k11NyC3G4VUgNjAucYE
 /2QROSDuy2ZcV4tqLfGMhxxSVr8IkvXFS0CI9h4YBvgPn94Q2OHaiBI7TDXB6sngxVSs
 P4MnK0AysOfjv96JRRk4YeBxtNdEEP7MmpwC528c9u8rB5Nf20VL7UpLm8Ofed6TsjGE
 iN1MJefzJDwo6SIpJZjXaoW6Lq+gZVYkJomd8aSVg+GxzkWPcFcq7W+LKaClcdSOWVTa
 lqgA==
X-Gm-Message-State: AOAM532vO9VRQOsb0sZt1ijOiQQXjBxzXOG7hi23krQ/yAnI82ApI7YU
 imYVJRBa1z/FoVDeuIaAP+M6tvDnjz0pn/1TSVFP+g==
X-Google-Smtp-Source: ABdhPJzUL0VySIAuW2MbzLOsHmty7wpkovus0zjGm0j9hSevjh26IybsavTyaMW9+1eiE3w8cc85Jfxr7uzDxCyKGjc=
X-Received: by 2002:adf:e80f:: with SMTP id o15mr11979428wrm.366.1611767219947; 
 Wed, 27 Jan 2021 09:06:59 -0800 (PST)
MIME-Version: 1.0
References: <TYZPR04MB441643EFC954C795DD1290A886BB0@TYZPR04MB4416.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB441643EFC954C795DD1290A886BB0@TYZPR04MB4416.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 27 Jan 2021 09:06:48 -0800
Message-ID: <CAH2-KxA20CfM9upvUkB=jhapVNF4AdVROA4wafFxxYftmvwO=w@mail.gmail.com>
Subject: Re: [entity-manager] Issue about entity-manager getting stuck
To: =?UTF-8?B?U2Nyb24gQ2hhbmcgKOW8teS7suW7tik=?= <Scron.Chang@quantatw.com>
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

On Tue, Jan 26, 2021 at 10:34 PM Scron Chang (=E5=BC=B5=E4=BB=B2=E5=BB=B6)
<Scron.Chang@quantatw.com> wrote:
>
> Hi all,
>
> I am using openbmc/entity-manager in this version: "f094125cd3bdbc8737dc8=
035a6e9ac252f6e8840" and I found calling Dbus makes entity-manager get stuc=
k.
>
> Reproduce this by following steps:
> 1. systemctl stop xyz.openbmc_project.EntityManager
> 2. open another terminal and do this while-loop: "while true; do busctl ;=
 sleep 1; done"
> 3. systemctl start xyz.openbmc_project.EntityManager
> I think the root cause is this function: "nameOwnerChangedMatch." (Please=
 refer to this line: https://github.com/openbmc/entity-manager/blob/f094125=
cd3bdbc8737dc8035a6e9ac252f6e8840/src/EntityManager.cpp#L1859.)

My first thought is: Don't run an empty busctl in a loop then, but I'm
guessing that's not what you're really trying to do.  If we had more
ideas about what you were really hoping to accomplish, we might have
some better advice for how to proceed.

The intent of that code is to reconfigure entity-manager when
interfaces are changed, so if you're constantly attaching and
detaching to dbus, entity-manager (and object manager) never sees the
system as "up" and keeps waiting for the system to finish stabilizing
before it runs the config logic.

In your specific case above, the code could be a little smarter, and
ignore unique names in that check, only caring about newly-defined
well known names, but without knowing your real use case, it's hard to
know if that would help.

>
> Manually calling Dbus or calling Dbus in a script makes NameOwnerChanged =
signal and thus triggers the function: "propertiesChangedCallback" repeated=
ly. Meanwhile, the async_wait in propertiesChangedCallback gets returned be=
cause of the operation_aborted.

Personal opinion: Don't call busctl continuously in a script.  It's
inefficient, and causes problems like this.

> So here is the conclusion:
> Manually calling Dbus in a period that is less than 5 seconds leads entit=
y-manager keeping to trigger new async_wait and abort the old one. However,=
 the async_wait never gets done.
>
> Is this a bug of entity-manager, or I get something wrong. Please help me=
 with this.

IMO, entity-manager is working as intended, but lets try to figure out
what you're really trying to do, and see if we can find you a
solution.

>
> Scron Chang
> E-Mail  Scron.Chang@quantatw.com
>
