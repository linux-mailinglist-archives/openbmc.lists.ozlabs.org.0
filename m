Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EE1A78A0A
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 10:33:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZSJ6g6Jzyz3c95
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 19:33:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743582808;
	cv=none; b=nDQrFmKMiNBqh75N0Wt6UkSnhTwsnjGy2BJlMYf2wooKQkm85fdEIziCNJhs5t/tc+PrnRDMv7cG139vOb/5fu3HnSIGDCvFAxRsVunBddaQXKJOgSpLPEOfMxH09nbCiDG/IfrL7THJmRpimXQsVGbN4W0CB3h/n5bbT+JuLVJegdlV5v5zhepG2iVT4qwAi7FLvJj8UKLdDskSw8uG2QjUzz1gM0XZt2iwSSN3GN1Eplxn5sn6jF6vuYEWFHmk89ebC66GBdOhkZGSSDYu2vo40kkgyzHX5DZjLsEFOSYyhaQ3gmKwaskDtPuzkzirF5FMwcNjt8iY5lPM1XLMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743582808; c=relaxed/relaxed;
	bh=4zbCN7/36D6rNO+6WczUGmYkS2wWeNOSiv+dD5fzbc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4pkaeO6+08yNB+GT0hgBWM7sXsNHCID2CXiO8ER2RGesQY6I1qWVkEBR9uY4ONC2uG0qo8rCaaDC9shPICFUT0wemBnDoLgQXiHj9JJsBXBvkgVJXQDApc5uhCtMkmyJFrn/SJ5WIX9ojglDqcDvizF3XKUtzQuk71MkMrcdS7U37rWJJAluiZHewgr4VPTK5p1OO16sYv37YlFe4MWySN2yyQt6tcGjIKRfbS/dBVPMcQ/Ot8LHqAB5eBadtD6Te/VxTRBmcUFJgDWDnGEV5t/ga/74msCM4OHab78H3BpbqQFtKtiZb0H3iaR80xlobcNtg8IgDy5KvdIac6x9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CKBfz+ik; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CKBfz+ik;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZSJ6b0NxGz2ygh
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 19:33:25 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2241053582dso111280925ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 02 Apr 2025 01:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743582801; x=1744187601; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zbCN7/36D6rNO+6WczUGmYkS2wWeNOSiv+dD5fzbc8=;
        b=CKBfz+iksjMVdShF6bXUtKry9GU9r6Jgn1eDlRrs36UUVcj0tAp7x8gG4Hg2S/4A2/
         rVSQK1b4vNt1wSXJdNTHS0sngo8n5Rx/POuGMFauq/F8Hvd/Xo13lILYEdHxSe5Lm8Hi
         FA4Q6R5Way+clb83YefS3VS04PVDBGyAK2yD7TZT+hPl4aX8V+3u7tz56HDA+buRL81q
         3G8W5Q4tAZ+55f1lVA6fJb+wfa0MKMHG1726+qwBb05pKnZbMIBX4VrvSszjjNLISBR1
         3rxz34QYS8MZZaQWri8swwsNV3KLAGO4XXAtL/fZ3fmpNvC/SKq3D1yyhRw5pU52YBZH
         iqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743582801; x=1744187601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zbCN7/36D6rNO+6WczUGmYkS2wWeNOSiv+dD5fzbc8=;
        b=vNWTbqWxmGWU6MP3mcIWwtlMUA8ha9FEbDmGWpv6yf/Rsa7Ola8Ltn0ygCzRoXTlAx
         +cKSBxIQSm9Egr7QUsU7Gvpglpul43gnr28/3fHuLqIYgkMj2wcRKn2WWwaV6euPHT/k
         KwVyZOm6a5FnY+umEDbtkb9wfSpOK9+p4f4dNKKMxW1vQhAFtPkmL4odHrGlt2yDuVsx
         ls4FdTLKZ2RxG+0PM+wgsoPbxArQE3eKZmZORFa5T0krkDirJXeJAjcHmiMr8KbrruCB
         iCZ4nUa3hWi+CtfwAGQ5s5fj1orGBC/bIPJccCa5ykUJLMyjaxQjesoch2v74XPY0y/6
         2aZg==
X-Forwarded-Encrypted: i=1; AJvYcCWud2D398Nu06J83QIWLuswIrGucKCgi7/Rtero7t3A+X3LI/Ls5ErYCyJ2NAuu63XoutC16Pce@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzU3Ptf7qtlnhyHYamREOp0TzVjpJUwStQlnWwNurpouCDT8Ffr
	EQaPkvXowiBwwSXJYaFb5pSkU0uMHidv3xqvIhzU2zouZUexw5ZE0o11WTe+xKSnuEKBGmoyoS5
	gdJpEL4wXl0sNNM9In+STcLmiCV+MC+J1EOXrjA==
X-Gm-Gg: ASbGncu24ZQ8p+WLayaxCZ8IuB6u05pUnfiDaEQto0zxKjDSVjL97oRuAxGF/uhCABX
	mf2POOkCeRpA8mEC1QC1nCKlIgqgtzQQY3R0subldZrglWv6iyb9yrt8ungq21z20N07jqMyvm1
	tgj2Bv6SGksxdh4k9a1uVHzbCyz+qa
X-Google-Smtp-Source: AGHT+IECa8vOuJWn11iMEwGLRvcjY2DqXsAj8ZLW6d2RQCfllK6etY+RQclFt1PkiFw09dKf5UneNsfK41PQ0Wlc4Kg=
X-Received: by 2002:a05:6a00:2e18:b0:736:a973:748 with SMTP id
 d2e1a72fcca58-739804484admr23046777b3a.22.1743582800678; Wed, 02 Apr 2025
 01:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250401220850.3189582-1-william@wkennington.com>
 <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net> <CAD_4BXgzvFavEcfhY5_BEi9y6pK0wJ1q4oqFYC5ctP53c57=wg@mail.gmail.com>
 <84d37c25-197b-44b4-b181-f71f5e8b81d8@roeck-us.net>
In-Reply-To: <84d37c25-197b-44b4-b181-f71f5e8b81d8@roeck-us.net>
From: William Kennington <william@wkennington.com>
Date: Wed, 2 Apr 2025 01:33:08 -0700
X-Gm-Features: AQ5f1JpF0TbFppZlbdINtj6p3CO4yPycwcUeh0ZCC6cwfVlwY364gxiKVFB1nzE
Message-ID: <CAD_4BXhUVRpNjORSHYiwhxXAGbAv5=4SYekWZhK+r9Wi=n5+Lw@mail.gmail.com>
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

On Tue, Apr 1, 2025 at 5:19=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 4/1/25 15:55, William Kennington wrote:
> > On Tue, Apr 1, 2025 at 3:52=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> >>
> >> On 4/1/25 15:08, William A. Kennington III wrote:
> >>> When requesting new pages from the max34451 we sometimes see that the
> >>> firmware doesn't update the page on the max34451 side fast enough. Th=
is
> >>> results in the kernel receiving data for a different page than what i=
t
> >>> expects.
> >>>
> >>> To remedy this, the manufacturer recommends we wait 50-100us until
> >>> the firmware should be ready with the new page.
> >>>
> >>> Signed-off-by: William A. Kennington III <william@wkennington.com>
> >>> ---
> >>>    drivers/hwmon/pmbus/max34440.c | 7 +++++++
> >>>    1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max=
34440.c
> >>> index c9dda33831ff..ac3a26f7cff3 100644
> >>> --- a/drivers/hwmon/pmbus/max34440.c
> >>> +++ b/drivers/hwmon/pmbus/max34440.c
> >>> @@ -12,6 +12,7 @@
> >>>    #include <linux/init.h>
> >>>    #include <linux/err.h>
> >>>    #include <linux/i2c.h>
> >>> +#include <linux/delay.h>
> >>>    #include "pmbus.h"
> >>>
> >>>    enum chips { max34440, max34441, max34446, max34451, max34460, max=
34461 };
> >>> @@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i=
2c_client *client,
> >>>                if (rv < 0)
> >>>                        return rv;
> >>>
> >>> +             /* Firmware is sometimes not ready if we try and read t=
he
> >>
> >> This is not the networking subsystem. Standard multi-line comments, pl=
ease.
> >
> > Okay, let me fix that.
> >
> >>
> >>> +              * data from the page immediately after setting. Maxim
> >>> +              * recommends 50-100us delay.
> >>> +              */
> >>> +             fsleep(50);
> >>
> >> I would suggest to wait 100uS to be safe. The function is only called =
during probe,
> >> so that should be ok.
> >
> > Yeah, I don't think they did strenuous measurement of these values on
> > their end. We have been using this patch for 4-5 years now with
> > seemingly good robustness on the 50us value. I just pulled up an old
> > email from the vendor that gives this context.
> >
> >>
> >> Is this a generic problem with this chip when changing pages ?
> >
> > I believe that is the case, but this patch is pretty old at this
> > point. Is there somewhere to add in quirks for such chips that would
> > allow us to build in such a delay?
> >
>
> So far we only have delays for all accesses and for write operations.
> See access_delay and write_delay in struct pmbus_data. If the problem
> only affects page changes, we might have to add page_change_delay or
> something similar. Alternatively, maybe we could just set write_delay.
> If the chip has trouble with page changes, it might well be that it has
> trouble with write operations in general.
>

So I did some digging and asked the original contributors to the
patch. It would appear that it's specifically an issue with this IC
around page switches and not any arbitrary write command. There is an
issue where it does not correctly respond to the second command issued
after a PAGE switch occurs, if the commands come in too quickly. They
believe it's an issue with max34451 (and other derivative ICs) not
correctly clock stretching while the PAGE command is processed.

Let me know what approach you would prefer to take here. It seems like
it would be most optimal to have a quirk specifically to delay
commands after a PAGE.

> Thanks,
> Guenter
>
