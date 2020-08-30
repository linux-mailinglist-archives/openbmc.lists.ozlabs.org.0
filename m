Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47157256FA4
	for <lists+openbmc@lfdr.de>; Sun, 30 Aug 2020 20:02:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bfh584GM1zDqRL
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 04:02:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GhLe+JR6; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bfh4C478czDqPC
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 04:01:58 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id g6so1819818pjl.0
 for <openbmc@lists.ozlabs.org>; Sun, 30 Aug 2020 11:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l67Rw1sesTKoXlj3/enQAM/CdJ/NqO3HI/tHvDZitDc=;
 b=GhLe+JR6MCYusy5seMJga70EhO0dPqsJES/tKOcXiEd5uAQKJgZ4KwCCGcXjxP4YyO
 z8219umkSpaknsvY3swr4PpPl1TiL0u45d5VnMAuJKoDuQth+of2PvQ+D8sj4FV4Crs+
 /7DocExmKVPjmmJ14SFc94TCugtt8/C53e+6L5m1EiRG89Z2P08oJEasVQKE1eCzOaWD
 bINJLMXO9l4LNR5OJ6taAa5qmORQJrex4QLdOGywhGTswbSo05Vw66SSPXy5FC2TpQ/D
 vOuIO66MhbBf6QmaCimw/SUslZ3FvTznWa0hhw6pcnbpHQHH5TewJV0vpuvBKjLYhCjt
 OdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l67Rw1sesTKoXlj3/enQAM/CdJ/NqO3HI/tHvDZitDc=;
 b=JVVj3nOMRGKOMpMxy5l/Gz0q0Ha2mmlEmMahYQH7FuIEtTJeTnFQ2+Ksg3RB+PMkLT
 /8MBSutr06+b6rbunxR99o8bKWJYsrY1Loou4N1K/2rWPjWhc1gNt6F7RQtggBzXPfGY
 UuqqSK3ZAVahFHSQnMTw8Z4t2neYLzjSDRCWc1xLKPs+1TwomCjT4/I7eNiiwPZRDcQm
 TcxQaxEdGca8uClkNDsCTsgNahSsEFzcwwhd8T0YfPDUTNY/aFhGoOatxnTtz+0mIb6y
 fmcrhvME7ACzCjxgQgS8XHkz9669wiWhEX3PDY0noJORXEOEvBhkCkbvC48ojFuv/Crx
 aHCg==
X-Gm-Message-State: AOAM5313qD8i03iCdmfA8uUq+eMcPbz5is8XV/RjI6vwR9BQrevC858d
 eP5LtoteUe0f+fVGtQXBFAqsgTE0+yqq6pIcRf8=
X-Google-Smtp-Source: ABdhPJw+9Yw8+S266cpAmsmm5KS2ZNuUQJG0BrPBnDrpPTXTgGfVD8RPnxrG98llvczA/goxydGlReOrf3ARelFPguE=
X-Received: by 2002:a17:90a:e7cb:: with SMTP id
 kb11mr7065082pjb.181.1598810515270; 
 Sun, 30 Aug 2020 11:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200830122051.197892-1-tali.perry1@gmail.com>
In-Reply-To: <20200830122051.197892-1-tali.perry1@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 30 Aug 2020 21:01:38 +0300
Message-ID: <CAHp75VeX7OUeF=K_NmtXU4LACS9MxN1=nbSn01rvy-1MXoBL3Q@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: npcm7xx: bug fix timeout (usec instead of msec)
To: Tali Perry <tali.perry1@gmail.com>
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
Cc: xqiu@google.com, benjaminfair@google.com, Wolfram Sang <wsa@the-dreams.de>,
 Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c <linux-i2c@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Aug 30, 2020 at 3:23 PM Tali Perry <tali.perry1@gmail.com> wrote:

>
> i2c: npcm7xx: bug fix timeout (usec instead of msec)

This commit message is awful. Please read [1] as a tutorial how to
write a commit messages.

[1]: https://chris.beams.io/posts/git-commit/

...

> -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> +       /*
> +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> +        * 2: double the timeout for clock stretching case
> +        * 9: bits per transaction (including the ack/nack)

> +        * 1000000: micro second in a second

No need. See below.

> +        */

> +       timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);

USEC_PER_SEC

>         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
>         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
>                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);

-- 
With Best Regards,
Andy Shevchenko
