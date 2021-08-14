Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C433EC5D9
	for <lists+openbmc@lfdr.de>; Sun, 15 Aug 2021 00:42:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GnFn85NjTz30FX
	for <lists+openbmc@lfdr.de>; Sun, 15 Aug 2021 08:42:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IfzL7SZd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IfzL7SZd; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GnFmh3Sgdz307n
 for <openbmc@lists.ozlabs.org>; Sun, 15 Aug 2021 08:42:27 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id p38so27080998lfa.0
 for <openbmc@lists.ozlabs.org>; Sat, 14 Aug 2021 15:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bKqY2ODulb1XJEskPNVxqR6YJVPe7PXRasqK0cTAlPw=;
 b=IfzL7SZdV9M3O8SuXZsUZPgiFgvNUj1w3FZXDHvTQfoV31EirOgqC7z6DHs2xGXt+M
 QNwHX5mgFK6PnSrprJ/jZZo6Mf5DgiBvkMiRzl7VmD3oJnEu5405COmfi7MbGO0pBCPD
 9HoM7FII/IBjp/rJUlkUBFDKc9ou7d2RpPoGT9lMds26qjZwVaQIOMDd642EzSyXsDO3
 3gdJlA++QLmr2zYPkXhoFisvs8NjtD0Ei4UgHfi560mwxCt/Ia7X5qGkiskAEoDzOtcR
 1mMvFdikTWA0JeEi8RZMXp1XFDeqXd0CA7So/qqCU0JqjRVJoEeZiC6Ts1kXxbaipEfZ
 c/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bKqY2ODulb1XJEskPNVxqR6YJVPe7PXRasqK0cTAlPw=;
 b=QLnJH1oXx61xS4Yush6EHiMPt6RP66R0CSTmNzQpdRtTnlU+bvwnxOBY/hBqTxZs+i
 qq+jC2pibKZsowmKtkltzVSzJGP3tg5ibGDhxir4PJ3kYdT5Tyh8Lj4WZUM1+FQCbfOS
 f2qbHPAO944vv4yM36AAuErYvGKVBvSjHmHVQI6ImDI4bv3Yw1A5Wcl+D0P++PCaZa/L
 LEtNB1X9zZBhH5ynF4fi7awWf8Vdm1qXYlJI/+koXemLds2xkPrXXBLFW47bOqbkt3dG
 L2v4JeUYxQPbIvXaJZjzfRlFqzWTJa46mODJ7/9cUBnAsATWRjSg0AlClYp6IZn9yiXs
 1yIA==
X-Gm-Message-State: AOAM532OOSHYTfVRQuqHjmn9HgknBpYN2su5zVverryofUfKcO3DVK5W
 d67LBy9njLRY8GPD0YIIQ2E=
X-Google-Smtp-Source: ABdhPJy3XK7chN4zWmy3RKYxYeip8yvnowvQOoN0H/oc6dg/vrLJIx+Jz2irz7qf2h0uQ9lcYlSwdQ==
X-Received: by 2002:ac2:4e16:: with SMTP id e22mr6301838lfr.134.1628980939715; 
 Sat, 14 Aug 2021 15:42:19 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id w6sm518097lfk.163.2021.08.14.15.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 15:42:19 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 17EMgG8j008711; Sun, 15 Aug 2021 01:42:17 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 17EMgFoZ008710;
 Sun, 15 Aug 2021 01:42:15 +0300
Date: Sun, 15 Aug 2021 01:42:15 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH 0/2] rtc: pch-rtc: add Intel Series PCH built-in
 read-only RTC
Message-ID: <20210814224215.GX15173@home.paul.comp>
References: <20210810154436.125678-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810154436.125678-1-i.mikhaylov@yadro.com>
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
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 10, 2021 at 06:44:34PM +0300, Ivan Mikhaylov wrote:
> Add RTC driver with dt binding tree document. Also this driver adds one sysfs
> attribute for host power control which I think is odd for RTC driver.
> Need I cut it off and use I2C_SLAVE_FORCE? I2C_SLAVE_FORCE is not good
> way too from my point of view. Is there any better approach?

Reading the C620 datasheet I see this interface also allows other
commands (wake up, watchdog feeding, reboot etc.) and reading statuses
(e.g Intruder Detect, POWER_OK_BAD).

I think if there's any plan to use anything other but RTC via this
interface then the driver should be registered as an MFD.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
