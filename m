Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E66FF4656C
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 19:12:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QRy134zYzDrj9
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 03:12:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iQGRkyV9"; 
 dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QRxG4zBszDrgX
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 03:12:18 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id w9so9339514wmd.1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lYU7WCJkTxeyq9xrCsy9osS5Ss5oayh0KT/NSLWcAZo=;
 b=iQGRkyV97eRtdLW36MTPh14xgLNmBVE4+IXpjNODBUe5R0leF9W3mqhEvpPAY9r1iH
 ABhArmmEXnND/9U0A7dR8tD3Au1uJUpEKWZyrjEUmg661ZekExTJY7rJtsK/BXtvVlzw
 IG/C0qSvi0ieCO9MstRo6KNQVGy2n3A8TbhBAYcVHTMFLTzLg4kAhoofAUoGFB1DHawT
 Iss08i4ShrKcLsfj84LDQBoIhAhNykG7CeUNah8dl45WNV4h9sHUiTCiiRnYH5aysUFX
 QokE1QPQ1q3ocYJfq/Kj3N9oQC14IJB3IzbI1LTCSii7PQBaqfQFge23Kw7GEwpGjF0d
 3IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lYU7WCJkTxeyq9xrCsy9osS5Ss5oayh0KT/NSLWcAZo=;
 b=lupEnn4wQhQqCmuFnb5WgIjCu9yywKetcvf+IXNhsr3yfv53GARzHqVImAsV+EXSlJ
 DmwesQaKDo5FbUhayD4g97FG7RZ7WdqlKd4GmOAt9gHuZXBHFYQhkrK8ZJUh+Cj5rYbY
 P/8Xj1+xeO0FGr848EO8oPYkSNhdo1BjbWB4WQmlpOLU3mug2A6FlfufHCvrjywgurPK
 QgRtnytsyqcdUduxzpMZTUVamocnihUPAr3RYFwFKm4OVMW6an3WFcI0YXb7h7Wog6i5
 etzYCsMwHhip/wpuXBZT5JbdKqbHFU9UlBEXTaHn867Glsk1cjtmgu1VVGlwkxmQ6UA/
 516g==
X-Gm-Message-State: APjAAAVlNgPSiiHTHoBTx8dtD2kiEmskLFLhpby29pQA2EkDLXAPeRsY
 IVZpAgvPqo4U4eUtQmjfqzpB0CwyiSfwo4k7wud3d7lQLuM=
X-Google-Smtp-Source: APXvYqwrqhE4zDihHW9HT7svzsCYu7iC1zOUfdN+ECQZdHROiGNCm3Nvt49TlvcVxGV12nS0MMx/YrxlskxxttqQdO0=
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr8677417wmb.152.1560532334087; 
 Fri, 14 Jun 2019 10:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAOUmYFRfVQha0NCZd2aLTc-EC2GNF8wuXqnAyWNMCpzcecQUKw@mail.gmail.com>
 <6f963ba0-467f-14fe-ac0b-7c09b547d109@intel.com>
In-Reply-To: <6f963ba0-467f-14fe-ac0b-7c09b547d109@intel.com>
From: Derick <derick.montague@gmail.com>
Date: Fri, 14 Jun 2019 12:12:02 -0500
Message-ID: <CAOUmYFRHh3bQSwmFMEcvokd6_yFxPE7-X+UmBTcFxMegHdX0eA@mail.gmail.com>
Subject: Re: Proposal to replace Clang Format with ESLint and Prettier in
 phosphor-webui
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

Thanks for the follow up Ed!

> Prettier:
> I struggle with this one, because as a whole, this project seems to use
> clang-format for most everything else.  In the research I've done, I
> wasn't able to find something that Prettier does significantly better
> than clang-format, with the exception of maybe being more "standard" in
> the javascript realm.  I'd much rather OpenBMC sticks with something
> that's consistent than say every language gets its own formatting library.

I am ok if we don't want to use Prettier for JavaScript, but
clang-format does not
support SCSS and we would like to have consistent formatting in SCSS as well.
We wouldn't expect it to stop the builds, just to ensure code quality. I want
to use the .prettierrc file to keep it consistent for anyone that uses
Prettier and
we can easily ignore .js files in the config. We can also make this a
work in progress
if we don't want to try and resolve all the files up front.

> If ESlint is really something you want to tackle, by all means, but in
> terms of value to the end user, I suspect it's a wash.

I feel the benefit to the user is code quality and to the developer it
is efficiency.
You're correct, the formatting is not something that results in bugs that
require rework. However, clang-format does not surface any potential errors.
It is simply a formatting tool and not one that is widely used in the JavaScript
community (https://www.npmtrends.com/clang-format-vs-eslint-vs-prettier).
ESLint is extremely helpful to people using IDE/Editors like Visual Studio
Code due to it's integration and showing the developer potential problems
in their code as they are writing it. Personally, I have found the
formatting of
ESLint with the Google shared config preferable than clang-format and more
consistent with the formatting most JavaScript projects use.

> If you start with eslint-config-google, the changes are a lot less
> invasive, as we're pretty close to being compliant.

We want to use ESLint based on its ability to catch errors. I did
start with Google's
shared eslint configuration file and it is less invasive. There are
still a few issues to
resolve with that configuration, but if that is the tradeoff for using
ESLint, I'm good with that.

> At one point I had looked at moving forward with Angular 2 and
> typescript, and tried to sketch out the path to get there, but it
> quickly got out of hand.

Agree, that will require effort and time and our team doesn't have the
bandwidth for that.
