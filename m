Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C023A4CF0
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:55:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBSq5HVdzDqV5
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:55:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=richard.weinberger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QXTNme0y"; 
 dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GlR72mYkzDqc1
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 05:23:15 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id b16so13232406wrq.9
 for <openbmc@lists.ozlabs.org>; Sun, 25 Aug 2019 12:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x1Bm8L4LTPF+izF2olAcq5JuhMzc8jf5Ba+vwT1pHpY=;
 b=QXTNme0yAl2XhzqGkdlYjDqd1sGNa7X8+kmZmflprJjdt2ZUA7R8ONAu1ASmls5Rop
 4aPFG/7jQjDFsB0Tc1eSV1uzVmsENAzl32o9GDd43oshIhcZNCjpNM5w+gMGhSUJd8Nl
 MvNUZzqvgsEHVMWjpNNRKNFih0nbec64y2P25TOlDC0p1e+R/6vW08OUuT4gWIoKS1v/
 aK3R2vM57UmrWPivAnyU5qnJBGNJgurausswjwvPT18GiCmb+cO3e8tWKoSUyKAxdbJp
 kFiblKdlfjrkp0fEaub/Er6r8k4no09AvLK+sgARsrhcvbBBMjGEiC3xq4mTtz2yiJjD
 YtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x1Bm8L4LTPF+izF2olAcq5JuhMzc8jf5Ba+vwT1pHpY=;
 b=WGSwCTPYNhu8+cYHW1ojJ17F9bVgdNAxS85MB1mWFi5FoX7VttvBHvN+4ZNmwqLvBD
 nAN4tAgCgbonFPD80yJ9lFnHb0kJeNfFBnIEBZzsna9zq40E/uSUk8XrCrkal1eisH4c
 b9mYA2uFm+UYEu72j+GFOGoFDWWi0Qu5rCfCWs0MDwBqf5pazkY8W8BNFt+fcDIhUbJ1
 jd8LWg31WTCkdsVqINRShWUB81or6AsEhIjrY640JKweMkmPe7sbUqUJBMVtJqwrMJtn
 NU+eHgw6nfxxsyo1WhY+8dyWuLImKAOaSSwnddwnYf1YOvV2uuTnZk0ycTUkVWikOdz4
 0Xfg==
X-Gm-Message-State: APjAAAWXFM3uQmsBfOnMsrBW15isfAWtYuU7+4vGMTsK5qOJwT3Clmwn
 TjQ+vQkQuVkJZ71SJFoNq3U8vxRXuEXiNHcriQU=
X-Google-Smtp-Source: APXvYqw68fGyAi9r2oSCocUJG5FQWqQM42yDWWBB38qEhPxm9W3FBWdrxUyvSHxn7pPaFPTSAdye5nbqSvG3taTC3T8=
X-Received: by 2002:a5d:6a12:: with SMTP id m18mr17414533wru.306.1566760987723; 
 Sun, 25 Aug 2019 12:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
In-Reply-To: <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 25 Aug 2019 21:22:56 +0200
Message-ID: <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
Cc: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2019 at 2:06 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> Looks like a lack of robustness to filesystem corruption to me. LWN

What exactly makes you think so?
The inode cache entry is in state INO_STATE_UNCHECKED while GC run,
which is not allowed.

Tao, is the error persistent or did it happen only once?

-- 
Thanks,
//richard
