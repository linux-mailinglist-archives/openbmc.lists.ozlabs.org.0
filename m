Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5EB6237C6
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 00:55:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N71zq73rdz3cKM
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 10:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JGrNoVBq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JGrNoVBq;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N71z836mwz2xBV;
	Thu, 10 Nov 2022 10:54:26 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id y16so27067wrt.12;
        Wed, 09 Nov 2022 15:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ezhkiUAqi2l6VwKXB0QYPoVGYNWs01dB7FsMX445sWI=;
        b=JGrNoVBqQjy1sJOX32nLvJPi5zEkiVA/k+1gj0kuuC7+w2AnR066I5Bq/Ljq0vaMnu
         vhyaj+ebx91Aid8dPDThkGBf9f1Gj8iS1qbyU5jp+c6fXElRyVhsITHsHjOfTBIhknf3
         G4ZQy9mD29kkzRE2vRfdh2SS7+3ymuPXBe1zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezhkiUAqi2l6VwKXB0QYPoVGYNWs01dB7FsMX445sWI=;
        b=vN+FvOVDNhjj9bxsBIZxDsmU7WoBmjj7rdVtwVuEFGOhaq56hlTfjgcCOfONgfAB9T
         FXwsMJpW7IpBbU0N9uhrHCk82HoufS8x8lnk9egsn6ZvnP3u8LKF7rT4WvFbd/xsZKoM
         9zodrtXao2Fx/JEjKAoIsq6gSMd1sW+hqrbP8tJ/S5zVQ8We3thZ5l+TGXnirddmd5Oq
         /47nnuw/okrzGoRc5TISV9uZfrQqYSs5BlthX9KGh296gAZelYAC9YGIOWRysTkBK5R9
         e5Fx5+TgBPZllFf/GP0UyBwnpE5h3SbM96sytUmljtX5y0Qgf/1YcoZv3sxerQZvs8bF
         75ug==
X-Gm-Message-State: ACrzQf32DjibGJbNiBRw0/AdCFqH9UkyrpYP/VZK5dyX0tj0PMpqrrTD
	csUya2psb4QDwLtTiTZpyRkl73il9vnGyJkMEXc=
X-Google-Smtp-Source: AMsMyM6ZuTaqhm5IhznW/MzuhraD0/lalekwmR5e3lvpGzl0cVSdoev5oDbv06BBqOKZlsyvENmp8dYA9ykXX6CVgZ0=
X-Received: by 2002:a5d:6b8d:0:b0:236:6d5d:bcbc with SMTP id
 n13-20020a5d6b8d000000b002366d5dbcbcmr39111865wrx.628.1668038059073; Wed, 09
 Nov 2022 15:54:19 -0800 (PST)
MIME-Version: 1.0
References: <Y1dX9r9ybGjBrW0k@hatter.bewilderbeest.net>
In-Reply-To: <Y1dX9r9ybGjBrW0k@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Nov 2022 23:54:07 +0000
Message-ID: <CACPK8XfQhaG2pb6=0YL6J3ME2XLxuQdV37tTuoOX5-05c7pDnQ@mail.gmail.com>
Subject: Re: Log spam from aspeed-video driver
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jammy Huang <jammy_huang@aspeedtech.com>, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 25 Oct 2022 at 03:29, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hi all,
>
> Since the recent update of the OpenBMC kernel to 6.0, I've been seeing a
> lot of new log noise from aspeed-video driver when the host is powered
> off after having been on:
>
>      [  335.526279] aspeed-video 1e700000.video: Timed out; first mode detect
>      [  335.544172] aspeed-video 1e700000.video: No signal; don't start frame
>      [  337.165555] aspeed-video 1e700000.video: Timed out; first mode detect
>      [  337.186214] aspeed-video 1e700000.video: No signal; don't start frame
>      [  338.815501] aspeed-video 1e700000.video: Timed out; first mode detect
>      [  338.834008] aspeed-video 1e700000.video: No signal; don't start frame
>
> It just emits that pair of messages continuously, about every 1.6
> seconds.

Our current generation machines don't use the bmc kvm setup, so this
hasn't seen much testing by IBM.

I'd like to hear from aspeed. If this is a problem with the driver
then it's something to look into. If it's log spam then we should put
it back to a dbg call.

>
> Looking through the commit history of the driver, it looks like that
> stems from commit a3de90afe392 ("media: aspeed: use
> v4l2_info/v4l2_warn/v4l2_dbg for log"), which converted a bunch of print
> calls from dev_dbg() to various v4l2_*() calls.  Reverting to the old
> 5.15 kernel (which didn't include that change), I found by enabling the
> dev_dbg() prints via sysfs (and cranking up the console loglevel) that
> the conditions triggering those messages have been happening all along,
> I just hadn't been seeing them because the debug prints were disabled by
> default.
>
> I should note that aside from the dmesg spam I don't see any functional
> problems with the driver; obmc-ikvm works as expected.
>
> Was switching those dev_dbg() calls to v4l2_warn() instead of v4l2_dbg()
> intentional?  Does this indicate some latent bug that should be fixed,
> or should they just be converted to v4l2_dbg()?
>
>
> Thanks,
> Zev
>
