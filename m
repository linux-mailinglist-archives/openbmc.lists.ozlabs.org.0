Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E57B428A54
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 12:02:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSZ9N0HKYz2yZ2
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 21:02:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UjDPP1Fa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92b;
 helo=mail-ua1-x92b.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UjDPP1Fa; dkim-atps=neutral
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSZ8z1jhvz2xfD
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 21:02:25 +1100 (AEDT)
Received: by mail-ua1-x92b.google.com with SMTP id f4so6063534uad.4
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 03:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3JzcycPOFjD0nRcOwCIfDmKnvO5Km5t1zi80B1lPvlI=;
 b=UjDPP1FaYjDeIEfCx20V7J/b9Os47qdXl/5Vj8l/X3d4CJkh2ICzUt0WCEe7ZCKVpH
 2Bd7O2wNvL6IRLUZ7iYygqESs8yQlWjNHPItXtaymoR3HlzAXZ1oQZBbczJlhzahD/4D
 dtmdRG0/CeIJla7NSOfny9npHza+B/6S9ftQeh/K+HHU1f8DvqzIo4qkb66Hxw4Pf2DZ
 Xv5oyPB1X6O2Jj0JpLRyM1860qM91F5h/h9lKrRCwIFif8DIkogl8tLXt4mW6AokKvzT
 TPOQSSny5/NhWF1NYbFcoufD0Li3YTuECSxz4hSr1hqZf62qtMhqP2OFIKE8fyBEc5yj
 P35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3JzcycPOFjD0nRcOwCIfDmKnvO5Km5t1zi80B1lPvlI=;
 b=grjSQ1hxIW9hV+mGUUJS5wUUAmxne1x4jTz7cON8e4EcfMH21ILWN77kIKUc2waUhI
 xwWsfED/zy3mI6Prx/6XSeISwzKuVNh0rl62xn3usnE+Q/e/IXTG/Bdc4yhJHA2QwQYL
 wwez4XL0Y3hmvUhbssisLb2B6NQXSHx7R/dirUw/b+CfTcLXt4bJUIHMI84DL62gBXDt
 mSKAfmkZywwKBx/zI6ezzXJwmCHPeMjCeRRfmVYxPqZfHmWCKnGOrbduHgoW72f0ry7J
 dGX3AHLtIGK1vMBHu9xviF9MhQdZmmjj8M4P+5rZOER3d3wz7cVDhNnUl8LLc7JfAP0z
 pbQA==
X-Gm-Message-State: AOAM5308h2Ibg2X5oibb7kaPTbUm8KMbYUoXBcEqFFl096PrtaNEzKE2
 t+sl4eVHc72X8DKEcuBuDKvnbAEIDZpu34U27n8=
X-Google-Smtp-Source: ABdhPJz6dF3D+ffWkBsuDG/BekT2rLXS67K/U7ppbS+8O+H5Gi84Ray4ycn6gbSTPF2gYjNxsZrLm3Qp7SvB0d08cos=
X-Received: by 2002:a05:6130:328:: with SMTP id
 ay40mr14439474uab.60.1633946540264; 
 Mon, 11 Oct 2021 03:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <3cb39323-c6f3-878b-9b99-444158777aad@amperemail.onmicrosoft.com>
In-Reply-To: <3cb39323-c6f3-878b-9b99-444158777aad@amperemail.onmicrosoft.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Mon, 11 Oct 2021 15:32:09 +0530
Message-ID: <CAM=TmwVrKiNVBrouyFCkX9nOM7GthwHU9LS=+tKtPR77maOUgQ@mail.gmail.com>
Subject: Re: Support PLDM sensors/state/events in entity-manager and
 Dbus-sensors
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
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
 Matt Spinler <mspinler@linux.ibm.com>, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Sat, Oct 9, 2021 at 5:37 PM Thu Nguyen
<thu@amperemail.onmicrosoft.com> wrote:
>
> Dear All,
>
>
> In Ampere Computing, we are starting on supporting PLDM
> sensors/events/status in openBmc.
>
> Research the openBmc specs, I do not see much spec about the PLDM
> sensors/events/status.
>
> I only see PLDM stack.
>
> https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md
>
> Do we have any others spec for PLDM sensors?

I presume you mean an OpenBMC design doc and not a DMTF PLDM spec.
There's some work going on around PLDM sensors - see
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/47252 and
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/46346.

Thanks,
Deepak
