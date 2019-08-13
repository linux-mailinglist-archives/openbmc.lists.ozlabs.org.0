Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0F68ABB8
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 02:01:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466tDf4RqKzDqdv
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 10:01:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="r48q27Al"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466tCq4DBRzDqWy
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 10:01:10 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id w3so13076190pgt.13
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 17:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DEwELwAgFo47wefs1TKQoscqOjJ3THB4HIoOv4eULE0=;
 b=r48q27AldEakXEyqCZIWGEtPZkAiqzcvmfFNOvcu9UpRhKXvysJMFFJBbTKtlarX/Y
 SZxZCl4DvF0Ymvxh191M1SPZkD71s+xXPAY0U3muaXgxJPGX8TMEjfTPFhhFYrBL+cJu
 pOhan8PWIhDUjfwO89O88bbXu9t9GlBTkpd1JJKkwbj04Ei+OE9qLuuz8H8UDr+tu95A
 ce/LM2SxIDvpfsRCdduelEBt7NQ/3wGChRvlRUxNDS7lTUlVEy/cIvtmU9t08IGZz4H9
 jcS6RB5XXG6TcLJLbyDlgbjcWpZpUZzqxQuH1FrOLdlG6C4AQzD6tJPGByqTvFR3WobB
 yTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DEwELwAgFo47wefs1TKQoscqOjJ3THB4HIoOv4eULE0=;
 b=t8IWOEp5wMxiWSEuzKRotSR34+vRIczOLAcTxLQ0FFM4KeACfzAHRSzq6U1Qn6ghF9
 d/FN/jaqWLrp1/TO2sHGEqpiQl3Bu8mbnZdsjsQ4QBKvO+P6IRHE5a+nX3GvaD598c7Z
 s/iy27k2PuVGjSSDoYRYWERHWMRqhoEGCT89+lOuehm+EZ6P4ZeTXZVx5n77zKhVMFbs
 pkSg+YjD4fCU4S170FS03lShSUFRAcunDImQBh5MkhcU9ET3nnfrtljjmQGaAO5HkaQY
 jUy5uDLykA8inX9WrUbecAHRLjsAjSSv4NXDweKV7imuwl2mTkiU857CXN4YvFBU/Dyv
 82zQ==
X-Gm-Message-State: APjAAAVdPwOv3KWe46p7+tEoFmloG9pXFka5kQRcDNlR8q9wDKXkyVU6
 1P1qWQOqX+0b6knBRvgRfisZzi78UlOHJ5rfKIo6wg==
X-Google-Smtp-Source: APXvYqzPUvXg9DDzBfXFg7UNXNac/nhBDDjm0E2SCnZpZEy5L/Q0Wm422CnfJauO7BgzbJiluzrSejAZtpYSsGxQIUA=
X-Received: by 2002:a63:2784:: with SMTP id n126mr31201474pgn.92.1565654467245; 
 Mon, 12 Aug 2019 17:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notykGFd7Ux3k6OcsskrKTAxLa=vEiybFD3agPuqkGoYG-Q@mail.gmail.com>
 <3f980968-f67f-1529-e681-e351c597a2ff@intel.com>
In-Reply-To: <3f980968-f67f-1529-e681-e351c597a2ff@intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 12 Aug 2019 17:00:56 -0700
Message-ID: <CAO=notyEk_g5O0CujPMha0bCAYgo8W3MMEjNu4jmSEVYZ5htsw@mail.gmail.com>
Subject: Re: template replacement
To: Ed Tanous <ed.tanous@intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 12, 2019 at 4:58 PM Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 8/12/19 9:10 AM, Patrick Venture wrote:
> > I've run into an issue and before I submitted a patch to solve my
> > specific problem, I wanted to get a sense of what was intended:
> >
> > I have a field "name" that I want to set dynamically to "$bus_v2345_0_local"
> > It finds the $bus match but then fails on the split.
> > If I add a " " it then fails as well.
> >
>
> Probably just a bug.  A quick scan of $bus in the configurations shows
> that we've only ever used it in cases where it was the complete string
> (ie "$bus") and even then, only used to populate numeric interfaces with
> the bus number to be used programmatically by downstream sensors.
>
> Some of the intent was to largely remove the bus number from the device
> naming convention, as outside the system the bus topology is largely
> irrelevant.  With that said, I could see how that might be desired for
> some setups.

Yeah, I figured out it -- there's an assumption that a field has at
least two other words other than $bus.

So like "$bus card temp" will work -> "26_card_temp"

But "$bus temp" will not -> "$bus_temp"

If the field ends with "$bus" it'll just end up being that value as an
int and lose the rest:

"this that $bus" -> 26

I haven't tried to debug the last case yet, and the names I'm using
happen to be two extra words, so I can hold off on fixing that more
generally -- i have a patch that should handle it, but haven't had a
cycle to test it.

>
>
> > It seems to be that if a template is at the end of the field, it works
> > fine, otherwise it assumes there must be some operation to perform.
> >
> > Did you already have a fix in mind?
>
> James is out the next few days, so his answer might differ from mine
> when he gets back, but I don't think we knew about this issue previously.
