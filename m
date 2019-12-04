Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42521113524
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 19:46:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Snqw2LB6zDqWd
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 05:46:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2d;
 helo=mail-vk1-xa2d.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e44LGiKv"; 
 dkim-atps=neutral
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SnpT6ZrpzDqWF
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 05:45:03 +1100 (AEDT)
Received: by mail-vk1-xa2d.google.com with SMTP id i4so278503vkc.3
 for <openbmc@lists.ozlabs.org>; Wed, 04 Dec 2019 10:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ob3PIwDaqwwkq3ZqiQsOXUmDGTQDwBLJKYBDrY0Q5N0=;
 b=e44LGiKvu0KIG6jGNh04tq5rbqNm/i3Dyjp4VnuhPkwPfn9HRwqXzRHFZVcai58Bg6
 Jilg4alXw29YwPSJ4bgqwGW9VyyXIUxkU6pBh17eIkEKBlRKshhbc+PoFdm6x4e+mzUF
 j4K7gcXb13ka+0U08gWj4r+6qynYnZPxsxZ7Yp7Bt4v2OLYD7NzeGfFzUGEdcFv1VdJn
 BH0NIA9HlBy7AQheO4pXmptLDrPaHCTA6p39Ke/U97LADKbdJY+TSWPSlKmqUJs4ZIIN
 w3XVP8BvLDybclQR4H8SDXsNxSw0iiIbTUrGX8K1+E8qo7oC6aawzIF849Yngj+yZnjP
 OxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ob3PIwDaqwwkq3ZqiQsOXUmDGTQDwBLJKYBDrY0Q5N0=;
 b=ONUASGsRDVuy+wb9WJDDUWRhljkXvnsukm1nyCMBrAmKi9jlLSDqRg3kK6BQUTrcl1
 Dk79oE+ec+5N/7ucT2/bkplx56lAF1n4eXvkzxfwt1yIweguaJ34c2gN3Yq+BCxkF9bk
 x4lUwARsm3P6y+g/y2chwlj8MJ8X7qTjDy39XsiG0A/VykSs+ngkLENHsApdonBFHlaS
 EDHQyx/XBY5Usu59YgVhTXcCAcAvy8Sfz0MkQVL+2jow5/FkSQ5CPMTvCohBC1dYt18J
 HBCgpPTwsKUYv12DWV6SMS85SLiuEfSCkWU3ESD5R/hCJRTKEvwGlz9Lp03zhGexg4uL
 xaWw==
X-Gm-Message-State: APjAAAXBzcM/1aAeCfJwgkqls50CjMjNyiw+Z0Ct7g6sIW+y0C8DbqE6
 /RohupXkOpPVAUqV6Hgd3iAOX6tWTNaHEfK/FseMRpCt
X-Google-Smtp-Source: APXvYqxKXXSihrwh2/3MUXMrQcpvi5uwHEgJLgvOQdAHrHqkYQrSe175jp8MIBgmqG93l++1WtOx/s29YnZwR2zyN0E=
X-Received: by 2002:a1f:1e13:: with SMTP id e19mr3340611vke.88.1575485099379; 
 Wed, 04 Dec 2019 10:44:59 -0800 (PST)
MIME-Version: 1.0
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Wed, 4 Dec 2019 12:44:48 -0600
Message-ID: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
Subject: OpenBMC Project metrics
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

All, I just posted the project merge metrics for September and
October. I will be updating the company/developer lists for November
and posting those shortly. Enjoy.

https://github.com/openbmc/openbmc/wiki/Project-Metrics

NOTE: these metrics should be used *very carefully*. They do not
represent the total contributions to the project. We value
contributions many that do not show up in these charts, including
reviews, mail list involvement, IRC involvement, etc.

Kurt Taylor (krtaylor)
