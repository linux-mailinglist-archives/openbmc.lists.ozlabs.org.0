Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D446A78504
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 00:56:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS3JD0YTgz3c8H
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 09:55:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743548152;
	cv=none; b=bJZ83OOYejmGkinNMlTnIMENbbUABTAsCGk5Izzxfb7L9X+txMsas1ktAtu0v3N+VONaBclF9xURguANFW+Xvkj7BJArLLcfZpY4gpPtFZQ/UCVKQa64HsgbqVBywsae+Nbbj0+7TS1ZAEFtA2zOaUmubbJO8HoWE/+Y+9QofglrR6uNNj7exD5glzzyHWg1lFUPn2QxgbtCi+4dqwjxqjljBgKG+6ouLK6whV3iA7HScQM9skgzDX175Q7UVQwn3pspzjzUiJu7//N2ShP9j8X7u02H4ay5nN8jke681TmvymC7y6Wm8aW2qHV9zrykwPJw1MyusA6Xk/5F2X1r2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743548152; c=relaxed/relaxed;
	bh=IOjvUvD4SsraF3i83uhg6pN0Bc9uqSDvIgKmbp1S2UQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5fAjhaMKPSORdX9CfrRwr0Y7O4hR5ydO5FT6rZos90zjsfnmxiMqA/e0u9Qa/KdXoMSLqRotBmjZsmQl4gqwiNXaAV6nTvmPahd0KMmpFk3Y3MSWS7je0wPUeVVWsdZX5sn/RuRF+RWV+p9DCo8wXJoYAp2jhpZn9rASSbz6JZUHZS7O0eXuvxB1pELeq/2AS/F5Ukc3RIGaaAcQbI6H4VSzFQiWJ2MU5tLqmwpH3fAKNkpN02t0pC4Y45gOAzs9pSC3PdFnd3j4idvRo10Mf3qNUMjVm6ZzN0XHzNBmRodPtKkaiaDVIyJ82AMgqKPIrsvPA4zOJGlq5swR041mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PoeKgrnW; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PoeKgrnW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZS3J74k2tz2ySc
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 09:55:51 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22435603572so114759625ad.1
        for <openbmc@lists.ozlabs.org>; Tue, 01 Apr 2025 15:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743548149; x=1744152949; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOjvUvD4SsraF3i83uhg6pN0Bc9uqSDvIgKmbp1S2UQ=;
        b=PoeKgrnW+VzumZLxb5519LFRr6RLrKneomHASWiOVvX5slShkaxOkpFF54xBI2UEuB
         9thEB9W1q6EKc/d5cfBAX4S2cbfYvdADBpp5B3B6qhaGjKMzo8c8qMyub0DDTjnfo0hT
         xdyKn5k/hghvSCL6VUTGUl4+GdCx6crLmA/e1YCQF0tFxh4mx3zshZlHTcobeIpH/uud
         w83iDweHGdb2n1IXxlvgJDaxymuHnnOs8bNbAaL+GAdW1hE32qNyrR8rEJXpuaYztSCj
         GtieU3M4tYCTQNQvE9qj3b6zfxV8AAJDFbzmmH0Lt61Giy509b87SfY2Iv44J6Vyb7s4
         VKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743548149; x=1744152949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOjvUvD4SsraF3i83uhg6pN0Bc9uqSDvIgKmbp1S2UQ=;
        b=OaPXLfgKC1tE22OYlzqUVXK2jLZCS3N3bgwXraIdsOKTAMhkifd1wk/Y3U+SYkvTrG
         e8AodZOfAZ1OfjIVhwu+a2eYXxZKFVQvhe65wqyRCJ0tH/EflZK3PKoDZt1GVGb7Juzs
         O7odaL5nE9Qpsim5q58d7HjHfy0VU6Ss7ecjj35v7dxQ8BuL9pPsKSPgLE5uTwYigwB+
         1AhlyAEvXS7PIqh1wByG3Up3kdyhQsiuV2gLSHWFhbK2rH7iNDxZXp2So8DVbp+Z7qXN
         mo1SdTiwOPyEurIcnkiy5IPeWLUl6gwE7TjUoL0RZqA+G/fFDZxUJernh6WyKImVRZH9
         JsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVubP/jr4cP7rdETspHnlypsEvZrJ7wANCLURRf1D9no+dWmmN6lbsugYxO+X+wJWyL8iFcVgUY@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAtpjYqmuWQKZfO+VSoUHUHdRmPcmpYLkqdhYghHhAA6rwBBbN
	sKWBVy7NZ7KCR0KJ4ChWYaHWXdW7QH25mZIy2ALTGdoJ8gq+elRywBsogJLuf1cXLOeqmFTvOqA
	sVO//zFyLiBoLhgNd7c4Sp5ZWv+hgUuFnoAm32j3X9uilu2RdRFcIFw==
X-Gm-Gg: ASbGncv0YogCBgIthE2YPYdZcIG2HUgLL1rHdQW1AdYt+BaRGxSgwes7o/RMNiZN3Zk
	+pLmLdyqLleEtinDIvfG3joPB7CTSanZXnezR2sHW8bf7nsTb8lGR+2YzR6maL+zZ8KWMY+jwQp
	TztBSPgIroq6UI8SSJ3QMAKA8eqir9md2eSEWgn+EohEuC6tH9WrUUA2v4Y7g3
X-Google-Smtp-Source: AGHT+IExmMPgc6yrAKEj+Wun1m65Eq0nFCLPlFD9SJcyf9Mm4KMXd4QfMnTRDK1kJTLibYa1qloy/8tf1AWnyuca7LI=
X-Received: by 2002:a05:6a00:39aa:b0:736:50c4:3e0f with SMTP id
 d2e1a72fcca58-7398037c9f2mr20232897b3a.10.1743548149206; Tue, 01 Apr 2025
 15:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250401220850.3189582-1-william@wkennington.com> <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net>
In-Reply-To: <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net>
From: William Kennington <william@wkennington.com>
Date: Tue, 1 Apr 2025 15:55:37 -0700
X-Gm-Features: AQ5f1JrkfEUxutwJdGJvqOVTtWHYUegIU6mDj23C07Bw7_FIpmf5v-xoL4RzNtI
Message-ID: <CAD_4BXgzvFavEcfhY5_BEi9y6pK0wJ1q4oqFYC5ctP53c57=wg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: max34451: Workaround for lost page
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 1, 2025 at 3:52=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 4/1/25 15:08, William A. Kennington III wrote:
> > When requesting new pages from the max34451 we sometimes see that the
> > firmware doesn't update the page on the max34451 side fast enough. This
> > results in the kernel receiving data for a different page than what it
> > expects.
> >
> > To remedy this, the manufacturer recommends we wait 50-100us until
> > the firmware should be ready with the new page.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
> >   drivers/hwmon/pmbus/max34440.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34=
440.c
> > index c9dda33831ff..ac3a26f7cff3 100644
> > --- a/drivers/hwmon/pmbus/max34440.c
> > +++ b/drivers/hwmon/pmbus/max34440.c
> > @@ -12,6 +12,7 @@
> >   #include <linux/init.h>
> >   #include <linux/err.h>
> >   #include <linux/i2c.h>
> > +#include <linux/delay.h>
> >   #include "pmbus.h"
> >
> >   enum chips { max34440, max34441, max34446, max34451, max34460, max344=
61 };
> > @@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i2c=
_client *client,
> >               if (rv < 0)
> >                       return rv;
> >
> > +             /* Firmware is sometimes not ready if we try and read the
>
> This is not the networking subsystem. Standard multi-line comments, pleas=
e.

Okay, let me fix that.

>
> > +              * data from the page immediately after setting. Maxim
> > +              * recommends 50-100us delay.
> > +              */
> > +             fsleep(50);
>
> I would suggest to wait 100uS to be safe. The function is only called dur=
ing probe,
> so that should be ok.

Yeah, I don't think they did strenuous measurement of these values on
their end. We have been using this patch for 4-5 years now with
seemingly good robustness on the 50us value. I just pulled up an old
email from the vendor that gives this context.

>
> Is this a generic problem with this chip when changing pages ?

I believe that is the case, but this patch is pretty old at this
point. Is there somewhere to add in quirks for such chips that would
allow us to build in such a delay?

>
> Thanks,
> Guenter
>
