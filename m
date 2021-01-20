Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A902FD97D
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 20:24:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLb7L4hCQzDqc3
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 06:24:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UWDy86LG; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLb6R4Xc7zDqRt
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 06:23:41 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id e67so11936174ybc.12
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 11:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=SOAniQBSxSoS8Kd5wydMCxQBngIaLz44y2QuHXogDTs=;
 b=UWDy86LGHi5xWWJQ6Kc8c/AnrFsPdabQnx4cG1PWJn9RSQJjwBSoYVNCDjlFjswq+U
 pgRYK1+2/jzR6qh+0Mxj3/BrN1hG58XaqA9JvRp/JG5t0xnCR8HVceax5e9fy/C8WMwZ
 0rBZHw8kHX279rnQqg7DPGwI1OKPk0RUa6avfaZtnoDewVLM38P1v477D28Tg9C67S/8
 pgRZ0muGjr3fjChNrHRThdXKGiccEAy+ybyf+uB9uJp+BM5NPTpDBUs1VfuMOLk4Vw6L
 Dl50BdN9EtWat0ZbEZCgMr78ebHNfY3X5XjltMp5dhM1FmPndPlirhuCmVTPFIiUT/m3
 9TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SOAniQBSxSoS8Kd5wydMCxQBngIaLz44y2QuHXogDTs=;
 b=Prm/Ld9q3OTj+0vNMI2S+1QQfno+HAqf87c9TjS9JLwKNqNRjStvTWiMLDof2CDLn2
 Ku962RW93Pp6SdeMacIgoFnIvPcrDQnyqbyyi2c8K6S6nEDyhRq9rBgNfg2U/eIby0qy
 dECmeDdAysjgskiNxlgY2r9ImRLXaQKH4zkJ615KdPacoorOdQtNmhEAtRoHqq47lPIt
 +SwZZaT9G2LuMDEV9STXFT0gz7lt9E/H7e5Yrwt1WMOsT5nP/eXbwdmP5WlP2y9go5LM
 51hXoSrZGnBOUy8ilOiSrH2c1/YSP+vfdV9Kzn9/zGsFSjTSYU3ansZDNdmu+9ZMvNn4
 MZ6w==
X-Gm-Message-State: AOAM533ecHoBctMVQgO9iRqsoksrbNXzu9zG781tCbZjbqF3ElNsjlsJ
 MzqSQ75IWYHrfKD3Mu8xMu1I4GLP1ERxGByceAktsdbUgahmFQ==
X-Google-Smtp-Source: ABdhPJznjX0nR9RUsSkMTO0+q563Hi9qs3ksHPIcNb6xEhmB4APkZ5KLHU39/W0euq9VK5Yfa74J3POkZUpO9TN4apY=
X-Received: by 2002:a25:ba0e:: with SMTP id t14mr15995962ybg.203.1611170616645; 
 Wed, 20 Jan 2021 11:23:36 -0800 (PST)
MIME-Version: 1.0
From: Ed Tanous <ed@tanous.net>
Date: Wed, 20 Jan 2021 11:23:25 -0800
Message-ID: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
Subject: Gerrit owners plugin coming
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Over the last few weeks, we've been slowly getting the gerrit owners
plugin deployed and tested, and got the OWNERS files merged into their
respective meta layers.

This has been leading up to a process change that has been on the
roadmap for some time now.  Once the plugin is enabled (and some other
housekeeping is done) meta-layer changes will be able to be submitted
to the normal openbmc/openbmc repository, simplifying one portion of
our review/merge process.  Submitting to openbmc/openbmc is something
most newcomers to the project expect, and we've had numerous gerrit
reviews submitted to the wrong repo in error.  Hopefully, this change
makes meta-layer changes much more normalized.

Once this goes in, this means that functionally:
1. We no longer have a bottleneck on creating new meta-layers,
renaming meta layers, or moving files between meta layers.  New meta
layers can be submitted through gerrit similar to any other patchset,
and will be reviewed with the same process we already have for any
other type of code, and don't require requesting a new repo in
advance.
2. Changes that require mods to all meta layers (yocto compat fields
for example) can be done in a single commit, across all systems at
once, reducing the possibility of breaking builds for meta-layer
combinations that aren't covered by CI.
3. No more waiting for your meta-X changes to get merged into
mainline, which should reduce the amount of time between recipe bumps
and the main build reflecting the changes.

Ownership of the various meta-layer folders is still enforced by
gerrit through the owners plugin using the OWNERS files.  Today, they
contain the same mapping as the content in the MAINTAINERS files, so
no files in the repo actually change ownership.

The final review to add the OWNERS file to the root of the repo is here:
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/39379
And has already had some discussion and looks to be good to go.
Assuming there's no other objections, I'd like to get this change made
on this coming Sunday.

Overall, I hope that this will be a great improvement in the overall
structure and usability of openbmc, and remove at least one stumbling
block people new to the project tend to hit.

-Ed
