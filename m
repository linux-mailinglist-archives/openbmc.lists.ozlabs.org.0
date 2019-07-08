Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E00A662A6F
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 22:36:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jHKQ5cbtzDq67
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 06:36:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WzfTW/UN"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jHH93KypzDqM0
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 06:34:11 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id b3so5545000plr.4
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jul 2019 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0je59Hy1gQdUZKVrI4NzxRuFrRUwGHUJj80szDK5PFY=;
 b=WzfTW/UNK8bPNxXgOyPA+p9pj8MpbU/ZNxf8LKc6U4Xk1nK/g85+10dm+WiOfMW1m9
 hQV+pGL3cbf5w+nv1gzJLK1trWdiwpS5crC7D10/9P5aq6rv5NktjPqc4zHrNBgoqF4c
 vfQxe39X7TLKwQB6injJ0NGz5pjsSg6pRbeV5PBJs85oL9PfXmeDKRz4OiJjwagst7qa
 4Mw9uBiPeV7MOB2LEi1L82yhWizGdUXifjH1KKQmB+avjhebUvG3V7GhSoudoGWp4Vu1
 ga/3BiPka0l2UdAqK+wBW0SQtfkaj92ZM7JjWRqIhwGT+cE8vFjd5Le5tGr6ijCsdpEQ
 pxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0je59Hy1gQdUZKVrI4NzxRuFrRUwGHUJj80szDK5PFY=;
 b=TK9+Dzq/GZXd83lndiLmq8EC+50rIEd3OjmvtlySOnyrk39w522vYuvbqLo+4Y5Xxf
 cECr/cOxiGJS32o2WLd6tro6H+k4TymK3fhTHQtrK5oltkGjacaNgU2dBDnLx9U4QE/x
 9VqQXE/aYCZlEmPmz6n5hje1/uLMObsevqRSkPN9yS+3KXbtIYchvW0ESQ5bHGDCYMbl
 /dWfMrpWQBetX1eQNmDwCV8lTrwYTjOILjsCyFm8jV+U6qRT1338qFixfxjhBwKzMghE
 AcViGGwi46v2fnx9UqeMAUNUxvIMfAAu5poXJ7+0L3RZisWxTHaxUK8WBS+PbZ35DxTM
 fqRw==
X-Gm-Message-State: APjAAAWA5AAfJs79rzHMC/YQjkau/Fzm6fBS8CyvAlqc9jukUhzugDIH
 25/vPFnVpCf/bZa+BGHoueTidahofX6mEdud5SDKOA==
X-Google-Smtp-Source: APXvYqzwPabG+cQx0axuyUFWjwY8zREsVts7xsch0LIcRUU7YqBDvjaR+HzMwzrwyV305Rns73QQdYJUF1KVcBEKA54=
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr27151337plp.47.1562618047472; 
 Mon, 08 Jul 2019 13:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <2061b2a4-5308-0d65-ad52-4a4ad4dbaca5@gmail.com>
In-Reply-To: <2061b2a4-5308-0d65-ad52-4a4ad4dbaca5@gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 8 Jul 2019 13:33:56 -0700
Message-ID: <CAO=notxcDVnOgPLsJtcVxXn5VB8RNbcAnCZtAA2Nd6CmeXz3Wg@mail.gmail.com>
Subject: Re: 2.7 Release: Freeze Week - What to do
To: krtaylor <kurt.r.taylor@gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 8, 2019 at 12:00 PM krtaylor <kurt.r.taylor@gmail.com> wrote:
>
> Soon we will branch a 2.7 release candidate. <UPDATE: done, see email
> from Brad> Here are some things to prepare for:
>
> 1) Start testing the release candidate as soon as possible - please post
> results to IRC or email, openly discuss any problems that you find on
> your system.
>
> 2) Clean up documentation, bring old docs current, add documentation for
> new functionality.
>
> 3) Send me any input for release notes that did not make it in a release
> feature (github issue)

phosphor-ipmi-flash support -- sending firmware bmc and bios images
over ipmi, pci-aspeed, and other mechanisms for host-driven updates.

>
> 4)Bug cleanup/feature (issue) cleanup, add comments, indicate state - if
> something didn't make it in the release, please let me know first and/or
> come to a release planning meeting and we'll take care of it.
>
> 5) Master will not be frozen, so new functionality can continue to make
> progress, but please take some time in the next couple of weeks to test
> or contribute docs, etc
>
> Remember: communicate outside your organization MUCH more than you think
> you need to - use IRC, send email, share what you are doing and where
> you are with it!
>
> Happy 2.7 release month!
> Kurt Taylor (krtaylor)
