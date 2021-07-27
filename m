Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F563D7205
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 11:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYs3Q3j5Gz30F8
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 19:30:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=r37BXuBm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r37BXuBm; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYs3546mgz309F
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 19:30:24 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id r17so20548977lfe.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 02:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=S0gAukOTkYpPjolE1yK/WePF77gVxUMCVrFCdBP7mNU=;
 b=r37BXuBmqkZmwH805r8vA5Y66fKL7VAApDciWI7uwdi+oweXet/LkZT+iU0cszWsW6
 Coy/dthvSiXsb3RJdBQ3WhmVvajrbGey47MyhUo41dMQifwM+DPNyTXUenborRmtm7Dc
 Nzk9O60Xf9wVWBkHU0t+0rYeaht4CO+FjXxjUhZWkS/FVCFeFwJVbqwXVFvzoZ2EHGo1
 TAj+/UuZBrdcmi7jtztGWq1ZFxKDkVCSTndGKJSogvc/uhDR8jToDnR6Fv5fBvffgbdH
 5/E6FOldvoA7VN2kfKnDLQ0LjBEfGOyuR8v684g27U6+/h/WpuX8A3nL3Z6OOAFgMqRt
 xc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S0gAukOTkYpPjolE1yK/WePF77gVxUMCVrFCdBP7mNU=;
 b=hSy6D9KaNPfxP6OXXQEXGLshvHjda0Bp/Wniyar09+L79bE3GrkNWG1rj9g0PsW76J
 Y3LXmerhhRlLBBhCeneiYWrjHePt3fpW3Y27/fUkfB+vvEfPrBxSI7lBh39rWDN8tmyK
 +KmKAc1eg3ZdXm+TPasruo+x1dkeWHGS3N+qVuBlXo+xUG5SB+3zu2ZwkbA3MEe9Muwy
 DOTP5U2/w3NaUmboxiFkowvdgrZo40I6z0Yubo+VZdCDdm0UygmqppnqFzqYRCAIuXdH
 KdyRKEYTF2eZ6eOhqWWIso1QvzeQQrjprMNHKYsinfEmbHX022eWNTKgehHVciuXveHk
 6dPA==
X-Gm-Message-State: AOAM5321tgq4BT+vY/Me40ZecbIGWSwIJQxGIxsWQ4oOhmp9Zam1IH4S
 1M+3iBEh/fS50xDWL8QvpxM=
X-Google-Smtp-Source: ABdhPJzXeo2Wz8Ph8YX7KDLjs+SoazEFrWBzUjLwAWAISfdm2TpIHPGxeHP8dpM11KaRVMphelcIIg==
X-Received: by 2002:ac2:4310:: with SMTP id l16mr15888204lfh.481.1627378219395; 
 Tue, 27 Jul 2021 02:30:19 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id r9sm221403ljc.62.2021.07.27.02.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:30:18 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 16R9UGLw007390; Tue, 27 Jul 2021 12:30:17 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 16R9UFnv007389;
 Tue, 27 Jul 2021 12:30:15 +0300
Date: Tue, 27 Jul 2021 12:30:15 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: Re: Serial Over Lan (SOL) no login prompt on Linux IRQ mode
Message-ID: <20210727093015.GQ875@home.paul.comp>
References: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
 <000001d5bc87$f6fe3780$e4faa680$@linux.intel.com>
 <CAE33tLHvjuwFwCsSdohvYPHgs-f-8sDWMsNdAhzgQbs3=o7_tQ@mail.gmail.com>
 <429111627309901@mail.yandex-team.ru>
 <20210726145246.GL875@home.paul.comp>
 <435311627317580@mail.yandex-team.ru>
 <20210726165144.GN875@home.paul.comp>
 <477521627375667@mail.yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <477521627375667@mail.yandex-team.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, Jul 27, 2021 at 11:53:57AM +0300, Konstantin Klubnichkin wrote:
> SIRQ polarity is something I didn't try, will do it. And yes, SIRQ bit is zero,
> but all other bits are also zero in that register, that confuses me.

I was also able to manually export the SIRQ pin via sysfs and when
manually toggling it the host was seeing UART interrupts and getting
data to and from VUART. That lead nowhere though, so we resorted to
hardware routing in ast2500 between "real UARTs".

> Instead I configure UART routing by direct writing to registers via /dev/mem
> (yes, I know that it's a bad practive, but it's development).

Should work the same.

> With the routing I have absolutely no data in BMC UARTs neither during POST nor
> is OS.
> What I'm missing is how that routing works. Is it on-crystal or UART need to be
> routed to SoC pins thus TX/RX are connected via pins?

With the configuration as shown the host is sending data to and from
"COM1" (0x3f8,4) and any program on BMC is able to interact with it
via /dev/ttyS2, without any additional hardware connections, all
purely in software, the routing happens inside aspeed. Do not forget
to enable ttyS2 in your board's DTS. VUART is not involved at all.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
