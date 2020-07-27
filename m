Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2A22FCC0
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:12:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFwYy1wbbzDqsC
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 09:12:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Yz81C3P5; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFwYD2q98zDqC8
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 09:11:43 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id a15so9613429ybs.8
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 16:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H7mzKZozbE8OQhDX1voK+mLfTxJuLDQ3lSKWum52Ofw=;
 b=Yz81C3P5KTG+GkMoiAeJsKbSFQswWNnCBRuYXdDGyEFY6EbFMUn4ULXHjr5EYyokCl
 q8yM2Lmh/8VzHY3o66kvdzSWIQ6SmNcmqX5Tsxf1tFmqW/ThsozD4G/nMZAs1PaMMjOw
 P2gBOqXb1phh+j7v0tSfcEdRBfYyLr69EGmJhlWPi1wMia4gxuNF+MMypbP5n/HC2I20
 EV4CWg/r2xwgeZRt8u06iqEBDev6PKBRSroaj2jUGdX4O9GGybeTHgw8Y6Bgtxz8UlnZ
 WzSoV2dAFgvYbKsifY5tC9Jp1rbz7gpbU5eAbPQd+LSasjPkcKa2FlniSCkwCuIkDM3Q
 HHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H7mzKZozbE8OQhDX1voK+mLfTxJuLDQ3lSKWum52Ofw=;
 b=rEqSnjz0exoOS2wx9KMpmRomG6UZTCgWoUC2NzoZhT7hrMiwD5IWGkdw7KxiXnAFI4
 hGAADkVrHnXdWER3HIi9dAYwtfgxki8raucSi4OWFNXWQ70VvAfxacy7JZFqplR8uGSA
 fZgRGdOybBx6idA1G7UPg3FT8DO+RMNXDHsFXBHQXXnsezzKb2yVsuea2JeBZuQi4ldz
 /+YEV72oBrim4+kncfPtzdOGPuyd3RZQ9id2RbzoUoQU1oeyKll6aEz2m/JeYFMkFR5a
 IpTYCgQi/6TvROqq2ghgR/Arp+AD9O3xTmmu3RtpaNr3PA+zL2YsdKETY2f0rAInscK/
 GtEg==
X-Gm-Message-State: AOAM531QeGSA9rfUuMIGWxxDOmApNpcYhOlLKwTX5R9JJfUSB5mK+Ert
 pyJ7NR3ZelX71rRlaFsRRlpzs8FCm7a/8e8PIcyR3EAVRaGqPFxk
X-Google-Smtp-Source: ABdhPJw/1j0JhsjYOShvS5kiIFaDTpL+n1QgKzd6Ufd5vosRhEiWLnNKsVhZJ2VzBnrrfG11KL4GYQoIOAsRXIw3d5w=
X-Received: by 2002:a5b:74d:: with SMTP id s13mr34365921ybq.170.1595891500003; 
 Mon, 27 Jul 2020 16:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX81_jq5asAMmiU-WCN1xsUDUpGL9DQtw5MuKSiq2q5GEPQ@mail.gmail.com>
 <1C79F0BF-0B03-4BED-92B2-56CB1C9B75DD@gmail.com>
In-Reply-To: <1C79F0BF-0B03-4BED-92B2-56CB1C9B75DD@gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 27 Jul 2020 16:11:30 -0700
Message-ID: <CACWQX835RVA3deOOzk++XJ+QX3riuN7VpjyZFeNsd010t220Ug@mail.gmail.com>
Subject: Re: Infinite redirect.
To: Mike <proclivis@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I had a reply to your other email in my drafts that I forgot to send.

-Ed

On Mon, Jul 27, 2020 at 4:06 PM Mike <proclivis@gmail.com> wrote:
>
> Ed,
>
> That fixed it.
>
> Committed to the repo below.
>
> Still fails to start the service without /var/log/redfish

Make sure you have this revert in your tree:
https://github.com/openbmc/bmcweb/commit/7f4eb5887f9a52a2832ee9b6e067495759=
03128a

If it still doesn't work, there's something that's a bigger problem
than I thought.

>
> Adding -DBMCWEB_ENABLE_REDFISH_DBUS_LOG=3DON will fix it. Otherwise someo=
ne might consider modifying event_service_manager.hpp to create the file wh=
en missing.
>
>  I still can=E2=80=99t l ssh to port 2200, but my goal is to add pmbus se=
nsors and the webui will do for that.

I thought by default we were on normal port 22, not 2200.  Maybe you
have a slightly different config.

>
> Anyone that wants to get raspberrypi4 running can use the repo below and =
it=E2=80=99s Readme. It will get it compiled and the webui up. Mainly is ju=
st working config files and a readme with every command I used including ma=
king the image.
>

If you are able, consider opening these as patches against
meta-phosphor to get it building again on mainline.  (note, I haven't
actually looked at the repo yet, but I suspect there were some recipe
edits?)
