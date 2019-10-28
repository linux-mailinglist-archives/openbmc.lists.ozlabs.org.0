Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D52EFE6AA2
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 03:03:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471dKy4ZLnzDqf9
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 13:03:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ut0pt5VL"; 
 dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471dKJ3zt5zDqP2
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 13:03:00 +1100 (AEDT)
Received: by mail-il1-x141.google.com with SMTP id y5so6807035ilb.5
 for <openbmc@lists.ozlabs.org>; Sun, 27 Oct 2019 19:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OypAzi2Zo1xMrftkUnv7sviCQUzMHIlpCkUzq0Rt/to=;
 b=ut0pt5VLtgI5pWukmdF4Gc08eqpmf7GjB0Kisk36q9TGw86iL+c8TjgCzkWBx2/WCa
 JqLJrmrJKvCORqjXUkpaHwPfrfaPCL4kExCMVoGtolQI5QtXuRibaCIIVp+q4N1igAjm
 cFl7qPwWZzX65KwLoDRqlOfwbtG94YBBXYIp+DNCMk1YzfCC/OVEgJSJU6UbyLsj/XMJ
 chSg1SZODMQ1cFpx17Plum70yfWIMSi/lRAG6Wu58IIMUlVVRicAOSbvCy+tRRXL3mqJ
 GbXDVdjGO5TffGInGhwUVQ3mphDUcRYKPj3FsXBqu0e98YWhYOlPpcMHM8Sk3nFeSuOQ
 4CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OypAzi2Zo1xMrftkUnv7sviCQUzMHIlpCkUzq0Rt/to=;
 b=JCvkbX1MTX5HPqyDgBH3a/Mw2ierasfvyz0jjXCze8/Fl65gJoeLZKKNRooGMcMX0e
 Od69R93RVuYDrnCcKQB4KtxsSG6T+XHvQas7epKI8q2/1mHEpiwoDm6nrq5F9PVFawnk
 C5yiN1XQROlAD4/G9rignniWkfPW4jP1UI+W1NmRhhrMEkWb8LvpS/L5obNSFUdWttpo
 vx+Hg7W1wU3GNUUOuh7kyVX9cIk/+SElypUcJy23zgGpDEkdiq2wUrQcEYyXpRxvRA3r
 OCqLUPH3PQzkIO8WoaMpnaGjgJZzTLZN1NqqxDIPq1krBiLjqe/8ih+lSxsYpE/VmzEt
 nhiA==
X-Gm-Message-State: APjAAAXecnfu2caYknytkFo8EBmh9pHVvay7/drjy6n7iRFyJlFqjfnp
 tFl3qfQm8nu3QuzgS30mQdB5G7bNO6+7eR5gPH8=
X-Google-Smtp-Source: APXvYqwm7Qtueibfa+9zy+hWYTirlqYgJB0l7FofsGGS0YPAc2wLuuwhsvgpAyS9538UNvTmKP/C3+sgpD+yr1uFdTQ=
X-Received: by 2002:a92:5ac2:: with SMTP id b63mr18661685ilg.138.1572228177206; 
 Sun, 27 Oct 2019 19:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <8371D980-4DCC-42C3-9BFA-4DB7C9475D80@fuzziesquirrel.com>
In-Reply-To: <8371D980-4DCC-42C3-9BFA-4DB7C9475D80@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 28 Oct 2019 10:02:46 +0800
Message-ID: <CAARXrt=UOQiyKdzUHkuLXqh+3oB7c=wq6UtvWaLVmz8v8WAfzg@mail.gmail.com>
Subject: Re: consolidation of *-dbus-interfaces
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@gmail.com>, Yong Li <yong.b.li@linux.intel.com>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Oct 26, 2019 at 3:18 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> Hi everyone
>
> I=E2=80=99ve discussed with a couple people off list the idea of consolid=
ating all the dbus interfaces into a single repository.  Today there exist =
four:
>
> phosphor-dbus-interfaces
> openpower-dbus-interfaces
> ibm-dbus-interfaces
> intel-dbus-interfaces
>
> The idea is that going forward all dbus interfaces would just go in phosp=
hor-dbus-interfaces regardless of the namespace.  That should cut away a lo=
t of complexity in the bitbake metadata and in other places as well.
>

That's great and I would love to see this happen!

> Is there any opposition to this idea?  If anyone is worried about maintai=
ner-ship, I am working on deploying the owners file plugin on our Gerrit in=
stall which enables kernel style ownership of different files depending on =
path, regex matches, etc.
>
> I would guess there would be a desire to configure (as in autoconf) in or=
 out different namespaces.  Am I correct in that thinking?  Any thoughts on=
 how exactly that should be done?

I guess package config seems like a way to configure which parts to build.

>
> On a somewhat related note I tried migrating phosphor-dbus-interfaces bui=
ld to meson and failed miserably when I got to generated sdbus++ header fil=
e placement.  If anyone has any ideas on how to do that I=E2=80=99d love to=
 hear about it.

I am OK to keep the existing autoconf tools as it works well.
For meson, I am not sure what kinds of issues you meet, but we
probably need to write configs to generate all kinds of server.hpp/cpp
files by `run_command()`
