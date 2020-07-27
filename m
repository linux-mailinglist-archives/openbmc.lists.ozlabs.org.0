Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25222F42A
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 17:56:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFkts73MFzDqlW
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:56:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=JLIXaWm7; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFkpr5zL1zF0fg
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 01:52:51 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id a34so3960228ybj.9
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 08:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=na028BaKfOl8Eye1596uNMlx04ESmoYzOA0tvWug4Hg=;
 b=JLIXaWm7LnUFdmHLJQOsdZ9GkRYlL0bidcPoXNOQK6wFYeh9wjGSoXrAyODvCjowoS
 DWA/MOnc+niJggiVTohHn6tsYH9ym9VxDKRTWTXH9WFA1sGEy9pn6ekF5hAJeNoEzFTL
 jvOho6B7/gENGECnCxd5H3WoU8T31maysgrPtBVGJlxBvZoDPCyGDpFOuVvQ9lWhutNg
 M8fBy71S8vw/Opkc1iFpngBSB/5Wq+iJuyOGBuY7ue5BwdW+Rfgs5CYgtrblT9i6Xk+n
 SXpJ6Leu/A57OmDUC9VMJlwVjC2jzx9ZYNbILw23ySU4jrtEz4mmR+JqxwQId8c+QRDh
 q7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=na028BaKfOl8Eye1596uNMlx04ESmoYzOA0tvWug4Hg=;
 b=WWZLaUzdqyqwVXsySEYqmLvcgMdJU1JFoCq2MiRNnw19H671e+0LqPkypXNoyZg8hB
 94hJyzRQY4IdUxWG3gTp8F+qiD5dKVClBEWDj3RzQleOwHt700Btv1Gx17yPu2QvYFkg
 ZtfHQWvUfyWqHgjrf14wsbYOtWlKK6JrCidOED81qKQM6OMnN51eisC1bMJflZH5jXPK
 deAd6ec3DyPwg3KP+7oWa3neROv4DfG5Wgb9sWDNfzCciBOB0y+EvMZIt0Uq47IWPQjr
 LiMp6aGI2HYccVV9BdOVwpFepyxBgsFEPK7nOd4WqBJTPRiuiak4xNpHJeR3MwmaSB79
 zQBg==
X-Gm-Message-State: AOAM533trYzjvpNWTMTQftdyeAr6zRChCrKNXVJB0SM+Py82VwR2B/It
 ssT01Si0wJiQZ7UjHjiM3hoJ1jWI7hkazcYKveEVfFaI3L4=
X-Google-Smtp-Source: ABdhPJz0+J/sBqfOhSu4FR9BVTQTjmHhPGFYcdIhI5m6zrGMZD+H0KKMW/1ieiyNbO8+xw7WJVZX/7dcUVAF6OthFYQ=
X-Received: by 2002:a25:7344:: with SMTP id o65mr16100982ybc.417.1595865168950; 
 Mon, 27 Jul 2020 08:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <AT5PR8401MB06263771D26D0EE53D41A5818F720@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <AT5PR8401MB06263771D26D0EE53D41A5818F720@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 27 Jul 2020 08:52:39 -0700
Message-ID: <CACWQX836VGj9JOB+h75cODoti9+0mGeMioQbdiTwmVG_8ydFcw@mail.gmail.com>
Subject: Re: 2.9 planning/progress docs?
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 27, 2020 at 8:22 AM Garrett, Mike (HPE Server Firmware)
<mike.garrett@hpe.com> wrote:
>
> Is there a good place to find the 2.9 change list, both in progress and p=
lanned?
>

Frankly, no.  There is an official changelist that has been attempted
in the past (and might still be going), but we as a project have had
trouble in this area as people seem more motivated to build out
featuresets than document and schedule said building of them.  Also, a
number of the organizations (including the one the dbus-sensors
maintainer works for) have a "live at head" philosophy when it comes
to master.

>  For instance, I noticed a lot of change occurring in the dbus-sensors re=
po, but I=E2=80=99d like to see what master plan is guiding these commits a=
nd when they are =E2=80=9Cdone=E2=80=9D for 2.9.  I know things might be mo=
re fluid than that, but if there is a doc, I=E2=80=99d like to keep an eye =
on it.
>
>
>
> We have some patches for dbus-sensors specific to our platforms that are =
frequently being invalidated by updates upstream, and instead of constantly=
 regenerating our patches, it would be nice to know when the upstream has a=
ccomplished its goals for 2.9 and we can regenerate our patches once.  We a=
re still getting acquainted with the processes here.
>

The best answer here is to get your patches into review and onto
master, then you shouldn't ever need to regenerate your downstream
patches again.  Pushing a gerrit review is significantly less effort
than even a single rebase, and you might gain some valuable insight
from the maintainer doing so.  I understand the realities of that in
the corporate world are not ideal, and sometimes you have technical
conflicts that are hard to resolve, but at the very least if patches
are "unmergeable" but in review, the maintainer can take this into
consideration when other patches are merged, and possibly point out
breaks.
It should be noted, the dbus-sensors repo is set up to intentionally
separate the platform specific configuration things (how many
drives/slots/sockets/cores ect) that can't be made public yet from the
generic implementation in code for a given exposes record.  The hope
is that the C++ daemon code can be put into review as it's built, and
the config files can be followed on later (once the product is
released), thus avoiding most of the merge conflicts.
