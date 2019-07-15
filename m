Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2074D69642
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 17:03:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nRcf2fYxzDqD1
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 01:03:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uwOKluNF"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nRZl5GD2zDqQB
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 01:02:07 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id q22so34574309iog.4
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 08:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+kIXA8GU85p3Yokp73M6SuuvQd6PpNvvlT7z0N2F4io=;
 b=uwOKluNFh794Wb7BC3FTX0afdBMT1OJ6kZ7FACFrFkihCtoLPhrfNIgoArARcCPDoC
 B7SsB+3pXOpcJNCX5VZFyh7ssMJLqdrKjI4z/4SL/JNj4id4zVwuQA0/OPDFcXc+SVC6
 CcXxEqZce5f7qQkJnzx4Z4rxuJ1phGq1YbxhwUPnIrO3PfJlF9iaPS7dgpegpkJZ6+Sn
 U2nrDtUxdhBMhUX7ejnCMJRIbEefmz8JIfWoMbxZzEusfuYZNCLygcBGtVCeFwqZhg2Y
 yI+NHqRKLMZBLE6Isp5g8Eh0PrCBT01MCHMONSs+p/5ECGqihpPOenvXW6wYUIlU7xen
 +BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+kIXA8GU85p3Yokp73M6SuuvQd6PpNvvlT7z0N2F4io=;
 b=qmQSk9z/u0QcFgIamPvrxaIXepLiVCRrrGQIEnXVto0QZvTQitUG0ePuhuzS5vPRE7
 mZCKXNuf0Br+1aRPiSV96BvbKatbwSZDtl3CFxrEDzLKjN9bhRK/PL3IWYfk+fBIJpkG
 QB2x9aDUgGCwsci20l7q4VuQUgIBmJZm86HWwITCw1uhrnAwAgJhvTze4mNHzwvCxZjH
 T9FHDBxmhAiXDvtSNid1tRp8vXSU5y7RewDKk02+ErMIU+Fw0a+GyomPG86QhuG0qpua
 GJ04Hd0Fkr7bw5KdQLu7pBYj8yG6lJhOCZOZ4cO/NBwSCHWafFDOzgbki+Ae/S5L5pnR
 rONA==
X-Gm-Message-State: APjAAAUpat7NJ5atzCJuhhhjDuiBgcuzNzBSkH7XOzjJKHH+vbAnIuQs
 lT66mkdMxDpySWhjWv2qZxNJzverQWDd/TsMwQ==
X-Google-Smtp-Source: APXvYqyMX9ckVpVhNYM/AuXYFCF+2UwsWazz6PKm86ZZd+MuqhjC0agMegN0ch2fUPa5Yx29/GiwkCPyBstMZuWFB2M=
X-Received: by 2002:a6b:b756:: with SMTP id h83mr25547012iof.147.1563202922237; 
 Mon, 15 Jul 2019 08:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAKKbWA6S7KotAFtLO=ow=XYnLL2Ny5Mz2kcgM1cs+j=5mHQNmw@mail.gmail.com>
 <alpine.DEB.2.21.1907151435080.1722@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1907151435080.1722@nanos.tec.linutronix.de>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 15 Jul 2019 18:01:15 +0300
Message-ID: <CAKKbWA4jBMG8v4unqWEpGWgRm9CH+EJvojsOwMWTvnQH15HWdQ@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/npcm: fix GENMASK and timer operation
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Thomas,

Thanks,
Avi

On Mon, Jul 15, 2019 at 3:37 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Avi,
>
> On Mon, 15 Jul 2019, Avi Fishman wrote:
>
> > NPCM7XX_Tx_OPER GENMASK was wrong,
>
> That part is already fixed upstream:
>
>   9bdd7bb3a844 ("clocksource/drivers/npcm: Fix misuse of GENMASK macro")

The automatic fix changed from
GENMASK(3, 27) to
GENMASK(27, 3)
I reviewd again the code to check how it worked so far and saw that it
should have been
GENMASK(28, 27) - this is a different value than 9bdd7bb3a844
For our fortune this wrong value didn't effect the our final write to
the register.
But still this should be fixed.

>
> > npcm7xx_timer_oneshot() did wrong calculation
>
> That changelog is pretty unspecific. It does not tell what is wrong and
> which consequences that has. Please be a bit more specific.

OK I will fix

>
> Thanks,
>
>         tglx



-- 
Regards,
Avi
