Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF721A47D
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 18:14:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2h7n27pHzDrC8
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 02:14:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=A1QJFFSN; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2h6p0k98zDr4r
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 02:13:20 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id d4so2093900otk.2
 for <openbmc@lists.ozlabs.org>; Thu, 09 Jul 2020 09:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mDA4xNgQhejXZ9O2/M4zK1Jp3iQR+lndM1LTtmwMDEc=;
 b=A1QJFFSNLn+pgAPQiTjeJj6COKIzhMpJ261Fq+qESTcoa9oT7ICCw8mPZULP0oFGbl
 X1I9NqubQCqZRcZixqz5VAU//08pgMDwo5RCXtD+JJLJGW8RfBMg0XNSRH+vbkDQP6AK
 n0MIT+uCj8kbptm9hbB2n31XkcKYfo93sr9R8kj9N2u22wiyvNt5bXc+We0E2vYqSaNW
 WlFjrz3jfgO7Fw6wVXVi0iT0MF6nLVJZo/crJk4xnSltP8SNXLDuk/565120tJ3a2Yzz
 62BNwzAumMO+HKnKKYyWBW/5SCrAWQi1z7T2vb0hynHC+llqnr9vbtfOTNLz2XrtMQyr
 Zs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mDA4xNgQhejXZ9O2/M4zK1Jp3iQR+lndM1LTtmwMDEc=;
 b=iFyFBED7FWGKgHUXIsYSl5F79CGIa7BQt0ZdBrwsI3GoYaCObvVCvEbqDbALpWuKAJ
 1OO4A6oYh/svw7qAYmWIqSfnTIcORkJxueLPVfLLmBJdog4D+MJG48z+sav6mvH3vjD0
 y2t6kkpUhZTY7ZClrBkGiqAp3Wmxe+7GfcT5QovSOSyKbWV1z0Tw2rYsUz3LzKNss6Sw
 HxfD4l7DjAMb2+8Y8tUVLq9C5h4tydCHIM06oNP1FC9Y45PhP0AyfmnfJ/tI40Qjoosx
 fJ9nwRoaw9rtzDYxHEGt0iE4ouklkSD8BfN3vIeXc7axVxEGQiyUSZjjKqBV4nKYlcY+
 ccMA==
X-Gm-Message-State: AOAM533cN6aEURzaZ7+cmleFdKT4ktDhzktebuRoVIPqSWNoHD8BqE/g
 oLl51Zxe2iOrS3cJssFAwDjkOwUBBFOiE763v6AcHQ==
X-Google-Smtp-Source: ABdhPJykcl98EkM9xZMnTbHC5Izpga2eN81VcVLsYjqijeJqLz2uqimk1KMbKkcYN9yVx0MSQyeFtj6nJdxw+b1aMEI=
X-Received: by 2002:a05:6830:3149:: with SMTP id
 c9mr53912510ots.302.1594311195302; 
 Thu, 09 Jul 2020 09:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9x+7DLrwoN9YmjZneghnGaZHAqM9kzzPo2RThH=GgSFw6w@mail.gmail.com>
 <CACWQX83XycCWC+oXXea8z6vB3Vm61_C=niUXyGXA9NO89Zwf-A@mail.gmail.com>
 <CAA_a9x+h61N1j3_OPvXeb7uCH+gcouy=r7_y8uSt3+XFh38ddA@mail.gmail.com>
 <CACWQX83baDkPtr6CxEUvBCQQF2YdOkfQDxc03c8YVpqX5qcpfQ@mail.gmail.com>
 <CAA_a9x+6OfxGP+Sd6hYeBo3u1yEm1Z=OeXbk5+EOkcik9KyGdg@mail.gmail.com>
 <CACWQX83treqBh2Xh6ycyK=3eO3HbGmZuPyqFPTEXt1dH8QheFA@mail.gmail.com>
 <CAA_a9xLuCPRGawer58S-XUMo_2A27hLYsn=5_0LE4BUvqSLmtg@mail.gmail.com>
 <CACWQX80nVRC_dXRiNYUmdmTubpVz3oVrv_DHiAeUPbpGKBVGYw@mail.gmail.com>
 <CAA_a9xJSx9c=_JwGDh=3ikSvF8QUkxS1No_myqcWJ6bDViYKRQ@mail.gmail.com>
 <CACWQX808TL-xzCOSoh0BfZSZZQS+PJqYimw8TCU44o0Qk9qHaA@mail.gmail.com>
 <20200709124246.g5axir3p7yyfr6u5@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20200709124246.g5axir3p7yyfr6u5@thinkpad.dyn.fuzziesquirrel.com>
From: Alex Qiu <xqiu@google.com>
Date: Thu, 9 Jul 2020 09:13:04 -0700
Message-ID: <CAA_a9xJVcX6Ja69hHtn3qFVrg73kiSWBS6BN_TQJOgnkJ8vnsw@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Kais Belgaied <belgaied@google.com>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Ofer Yehielli <ofery@google.com>, Josh Lehan <krellan@google.com>,
 Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thank you, Ed!

Hi Brad,

Last time we checked with the maintainer Guenter Roeck
<linux@roeck-us.net>, I remembered that he suggested we could add
these controls in debugfs. Feel free to reach out to him and see if
anything new is coming up.

On the other hand, my solution to this of the proposals in these email
series is to create a wrapper library around I2C devices and hwmon. We
can continue to have the benefit of hwmon to take care of the reading
tasks, and we can also lock all the I2C access at this level and issue
raw I2C commands as needed without worrying races between I2C
transactions. However, we need to ensure that no other applications
are sneaking below this library and interacting with hwmon sysfs.

Thanks!

- Alex Qiu


On Thu, Jul 9, 2020 at 5:43 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Wed, Jul 08, 2020 at 11:15:03PM -0700, Ed Tanous wrote:
> >On Wed, Jul 8, 2020 at 2:46 PM Alex Qiu <xqiu@google.com> wrote:
>
> >> We've talked with the maintainer of hwmon, and he doesn't think adding
> >> these to hwmon interface is a good idea, as hwmon is supposed to be a
> >> monitoring interface.
>
> Except most "monitoring devices" are configurable and/or have a dual
> nature - e.g. voltage regulators.
>
> >> Although we haven't yet met the need to set the
> >> voltage other than debugging.
>
> We have a need to tweak things in the production firmware.
>
> >Excellent.  I hadn't realized you'd done that.  You're right,
> >userspace is probably the right spot for this then.
>
> I dunno.  It would be nice to have an in-kernel solution that allows
> VRMs to be both monitored and controlled.  Mixing i2c-dev with the
> actual vrm driver makes us do strange things like unbinding drivers
> while the vrms are configured, or rewriting the vrm driver monitor
> function in usersapce and missing out on the benefit of a well
> maintained kernel driver.
>
> This problem comes up over and over again.  What would be great is if
> someone with good relationships and standing in the kernel community
> could work with the kernel maintainers to build their understanding of
> how we are using the kernel and figure out a good solution we could
> implement other than just: "use i2c-dev".
