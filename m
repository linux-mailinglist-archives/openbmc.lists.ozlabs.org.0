Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9CD398ED5
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 17:39:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwCrS2NDYz2ymQ
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 01:39:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=SCHTYpkS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=SCHTYpkS; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwCrD22MCz2xZ9
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 01:39:21 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso4044487wmi.3
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jun 2021 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/eZldGqah8l+f6I6mkyXqoi5yFV6+EWK/YWBZkXVuFI=;
 b=SCHTYpkSh4fRKYnv8l6ZU6YxtwWaaKzRO8mcbKAMFDTfzLKOnYEmz5vnSKSI5eECH+
 iOLNq7Y3taQWBk/nFYiFSXnHEFS3OmC5FQuDPwWrqBk4euAzxg/YsAUTY6p9ZECJ1cO3
 cE6MP2qHJihj9Gq8tMwUBtFaT5H5C8qfTykZIIwMrXbrZyvkwc1c8V3NLPJiTWZwuL1v
 q6Zz47CJlV525pRe3+3iBVQaoyCbuWmQClmQ5Va4xGG/i4NYT4BHXVvNgxfpviO3Uv8K
 bR60TqBzzOtqDf+Ixh7mTsSMjJ8Fx6+hHrvyFkYdVXD6AnDwVkI/TCuF1rbHTs+E7Gqf
 dThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/eZldGqah8l+f6I6mkyXqoi5yFV6+EWK/YWBZkXVuFI=;
 b=BmAY3T758C4tN6gIOa1l2jUzJQrVvvutwDw6LoDz3WFUmyQwG9mUrfYTrXovr0F7Yt
 rWNuqEqitGIM/zcoFI1cuUI8bdOnFj4jX8qNfFTOptHuBJNN278e3zzTgI2c8BqucjMT
 FUs6lSLZ+AO/gWvg+vgDynZ6NL7biNQGk6wpaTX6eVLkGCf3zt7XUt+z1M97MShckcV+
 qAUdvYegDeXGC4lg19MT7tgYLS6l5eEVj1NCpoHGyncw2ro0H5ZPoIwJXdMZSWmIataq
 mkB+BnB3zQuNHKlZbX3abrQ9/TLDFsVR3KbQuBlB4NdueRVBbxaGeWACBy1RMgpwxa2S
 KnJA==
X-Gm-Message-State: AOAM530BynEhJuMG4hJJ6Qzoe4TaEMKJELnMjlp9M9BTYDZu5r0d4Q6j
 vtxtgFUUbK+dgcoNRTYO2IBcp3OUOXOU/tUzoiBrBQ==
X-Google-Smtp-Source: ABdhPJz76rZ6D7/eC1gqEvm2TN9VT/iEnlWT5e+jWCgydN3YoBwocvEZbLLFxgGtMx3Ywyr3P3ooMrYqSSVg2D2gacI=
X-Received: by 2002:a05:600c:ad2:: with SMTP id
 c18mr22081491wmr.93.1622648356931; 
 Wed, 02 Jun 2021 08:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <2e3016fe-2827-891b-07e3-0437a6038514@linux.vnet.ibm.com>
In-Reply-To: <2e3016fe-2827-891b-07e3-0437a6038514@linux.vnet.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 2 Jun 2021 08:39:05 -0700
Message-ID: <CAH2-KxA1VyhoUznEr-W5M83ZpVSqdx2c1oR3E1XdeU9fhTHN4Q@mail.gmail.com>
Subject: Re: Seeking your opinion on ways to report both Altitude and Pressure
 sensors for the DPS310 as well as Temperature from dbus-sensors.
To: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
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
 Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 1, 2021 at 8:43 AM Bruce Mitchell
<bruce.mitchell@linux.vnet.ibm.com> wrote:
>
> Hello Ed,
>
> It has been suggest I seeking your opinion on ways to report both
> Altitude and Pressure sensors for the DPS310 as well as Temperature from
> dbus-sensors before going to far down the road.  Thus that is what I am
> attempting to do in the email, others on the mailing list input is
> desirable as well.

Thanks for discussing this before getting too far along.  I haven't
worked on any systems with physical pressure sensors, but I'm excited
to see new things get added.

>
> As I see it, Altitude and Pressure are different in that
>      1) Altitude is computed base off of essentially a policy

I have no idea what this means.....   In what way is altitude a
"policy"?  Can you elaborate a little?

>      2) Pressures is a read measurement which is a mechanism
>      3) Temperature is a read measurement which is also a mechanism

I'm really struggling with the above to understand what you're getting
after, so if I go down the wrong path, please forgive me.

I think what you're saying is that altitude is calculated based on
pressure + some transfer function to determine an altitude?  And that
transfer function might be fungible depending on the platform?

If I got the above right (big if) I would probably expect a new
pressure sensor type to be added that reports a pressure sensor, then
we'd put the transform code in something that looks a lot like CFM
sensor (which oddly enough has a hardcoded 0 for altitude in its
algorithm for systems without pressure sensors).  Considering how
related a pressure sensor is to altitude, I could see putting them in
the same application if you wanted;  It might simplify the code some.


I think overall a better picture of what you're wanting to accomplish
would be a good place to start, then we can iterate from there on what
pieces we need that are new.

>
> Thank you!
>
> --
> Bruce
