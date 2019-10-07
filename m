Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 739B3CEDD2
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 22:43:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nC9S1tZNzDqLp
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 07:43:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HM3UWTM7"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nC8x11bLzDqCT
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 07:42:40 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id x127so9389842pfb.7
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 13:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEwEQ/q/3jOS6POYgzq5+HhhTX8QnQLdxcjfAgVa3wM=;
 b=HM3UWTM7ZTpHhHGKEG95xW0CIJOyunqlkpvIv9mZM+zkRi76F0NGx/h0cThkJ8d1V6
 dXNqcviOpmXSCD5LVgky687K8cUrUnDjbfM3c2nClUGKMY4TAMq5jT6uYXUos9zJ5s1C
 tFnFwcR2lK7xtOT90EaqAivAdp/qGMmRobnmycJNB2F4Bayj0CyRqBMkFpzaE9uZ4Cqm
 0M2ey1RWtAZBLn1flrwhuNKnZrWgy+XwsAtVjTQft5JFGwaNGgsq8Bb+Sf6hS7n+infg
 Gg83pFV0vfz8ks/wFnpQvNnzxegVvXvM9YSPL1TJsVO2ABnnnpxv4peWJL2DyxFRowew
 Pg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEwEQ/q/3jOS6POYgzq5+HhhTX8QnQLdxcjfAgVa3wM=;
 b=d7/XlK1IdGApPCuWLLXbXF46lG5RAwP6FV6N0dM+yzXAmCDjHRK1rpQPAi4UgjbxZ7
 7hO3yKU7CTLrTU86iL3oz4/KOEdBhpvk1YL/Qjv2cejVLkIYiDzt9gsn4WDeUGhLEub1
 kTc/wpQB8AlQxvlPonE86pLO+tZQGBDMu/RKUJ6AmOi/j5KrSIs4CovA8F+T2vXhgeqr
 g+Fc7H4U3CXayJfescuMptsDcR5apFLfEaFy80hvJL5P8isKs+FHEkkvLcizIaqs6Ivw
 jYvMlQShAk4qj+SgHPrQ55I+Ck6uGSMQkKEQ+zkGR+/MFKGc85PmyTm8Czhm52ymwUmz
 ZSWg==
X-Gm-Message-State: APjAAAXl69b0hn/1lkxSBw/3ZxwWEqifnmAyD/DyUiiG7/gOSr7V+4tf
 UHPO61bqgI2RtFKrcf+aC93F4H6Eee4LlEysDZ3C6KQioWU=
X-Google-Smtp-Source: APXvYqz/znFs4FRIEHENbvSqr7rPpU1XXdRTS2qE9FK8ohZ6DqgU4OJSuHvN4MLrEX+UtUNQ9rFwWw81kA/zYuYGyGE=
X-Received: by 2002:a63:cb4f:: with SMTP id m15mr32009152pgi.292.1570480956729; 
 Mon, 07 Oct 2019 13:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <7050D8BB-A7B0-4CA5-AA56-8AB61D762AEB@fuzziesquirrel.com>
 <CAPnigK=c+rpWLtB7XbaPPM3s2V8TAbgRgqKChUTKkNpUtC836Q@mail.gmail.com>
 <CAGMNF6VCJxS_ewJkpvGAUwtiJrgVUSp2ajeVeN+k7hZoiXj8gg@mail.gmail.com>
 <46DC7782-8F89-4890-9876-E54895CC8C98@fuzziesquirrel.com>
In-Reply-To: <46DC7782-8F89-4890-9876-E54895CC8C98@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 7 Oct 2019 13:42:25 -0700
Message-ID: <CAO=notyDgrSBRsKcuT0vwFLQi91hAco4dH7v=NPeK__+-PhpEQ@mail.gmail.com>
Subject: Re: unit test build failure in phosphor-hwmon
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>, wangkair@cn.ibm.com,
 Andrew Geissler <geissonator@yahoo.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 7, 2019 at 1:31 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> at 4:22 PM, Kun Yi <kunyi@google.com> wrote:
>
> > What's the test build error message with meson?
>
> It fails the same way with autotools...
>
> I created a gist with the failure here:
>
> https://gist.github.com/bradbishop/0f18c71f734a8459dcab0ea886528b4f

Thanks, my CI checkout must be stale.

>
> thanks Kun!
