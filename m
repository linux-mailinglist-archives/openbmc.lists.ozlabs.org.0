Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F8E46E60
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 06:56:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QlZ33QM7zDrhF
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 14:56:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iyn3Yubv"; 
 dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QlYV3jspzDqPj
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 14:56:13 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id p11so4498491wre.7
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 21:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+6vRz89MSTBzIuM1bBeR+2rjfs9Seud68p0gSom1uy0=;
 b=iyn3YubvJeSfH94ekfgCXhKkpHb9tSpnUiwpDjNa12U93kUNKIswRqc1nU69biRtGX
 dRqO3Ry+9khSECoL9KP/T0yZCD5Lu3zDQSoKfPUXBSBUwqzvztXkml7YcbQ5XAlfTg16
 uutAHFb6k5kmd6nU5WUyeaf7x4vau/2hE9AT/yqzelBCLGz33+H/GiiXGHnG8zJGotbO
 NGVokj7uPBshmJLyHgR1gUQpnMPfFHxwC1VC0c/9w7WZzFXck2bzr+iMNeJTC/f4ixd+
 Il06/RWT+14P0HUSdpBJ8/YZFcBcLUHhyz3qkNa7q08OQ3j68+t4YUyWQ9di73T02PGf
 Y9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6vRz89MSTBzIuM1bBeR+2rjfs9Seud68p0gSom1uy0=;
 b=jrRpxGG28/Qi5GMXnT/gKrSNHotNtxrolOqyGrR4lsts3vRiAqgAO+S0LoNg6OM5L0
 yZ3yqT9hoPupXDSrfM4C5l3izlSDtg2KsPw4Va/i7HhFCqhbCYfOJD7FULDFSkal1R9B
 qLenR9cAcJBHe8n76hyI1PAAnzwjNmrl7ZOvjpYm16V915XLkmiAdfLWKgggK1qnul+9
 mcXG/VHksLIBsN3y/d1bgwIGLKWUtqynUYU01Mr0kl9wpyduord4vORTsFRpiV6ADcQ0
 Afmm7KajI4FvLzhQVpQ+coJh2DAT5Oe/GbXF/8L9m+HSNSF8XdklDKK0SNK4+FJEtPVf
 V4sQ==
X-Gm-Message-State: APjAAAWEAZlRn0oeVAftrvfGkbYRYJ6djkOK4O94xBOKXuRGU+swwbzb
 kK/AphKh6P9avGJm8Q92qPh1FBfcJ9H7pQLidns=
X-Google-Smtp-Source: APXvYqwfJpLgSnvilC7/0VsZlvQFxyASwNz1JFhCOwz2nR1OFmUQqrgEymLQ5cOVAfrJyznWdQdiJ5Whws7jE+kLhFE=
X-Received: by 2002:adf:afd5:: with SMTP id y21mr65447571wrd.12.1560574566525; 
 Fri, 14 Jun 2019 21:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAOUmYFRfVQha0NCZd2aLTc-EC2GNF8wuXqnAyWNMCpzcecQUKw@mail.gmail.com>
 <6f963ba0-467f-14fe-ac0b-7c09b547d109@intel.com>
 <CAOUmYFRHh3bQSwmFMEcvokd6_yFxPE7-X+UmBTcFxMegHdX0eA@mail.gmail.com>
 <26aeae20-6815-d160-584f-c9252ec6a568@intel.com>
In-Reply-To: <26aeae20-6815-d160-584f-c9252ec6a568@intel.com>
From: Derick <derick.montague@gmail.com>
Date: Fri, 14 Jun 2019 23:55:54 -0500
Message-ID: <CAOUmYFTj37WtKAs+RdjXPabEjVKj859=j2e5v0NWBc5n81VcUA@mail.gmail.com>
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

>  If you think the google config
> makes you more efficient, by all means, I can get behind it, that just
> wasn't my experience.

Where I find it valuable is the visual indicators that happen when
integrated into the editor. It helps hunt down small problems that
often cause big issues, but are hard to spot.

> Did you find any patterns that the UI
> consistently got wrong?

Mostly  just inconsistencies in formatting, but there were some
syntax errors that prettier just fixed for us, unnecessary semi-colons
is one example.

> Were there checks that identified real
> functional issues in the webui (memory leaks, bad pages, race
> conditions, ect)

No

> I'm scrolling through your changeset, and most of it seems like
> whitespace.

It was mostly with exception to some syntax errors. In the update
to the Gerrit review, I removed all the files I formatted, so running
eslint on the app folder will reveal them. I will go in and resolve
those issues in a different patch.

> All in all, if this is something you want, I can get behind it.

Thank you! I don't want to stretch this conversation out. I have found
a win-win.
We can keep the formatting in place using clang-format. ESLint can provide
basic fixes, like removing trailing commas and flagging syntax and potential
issues without impacting the build. We can use prettier only for SCSS.
