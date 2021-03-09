Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BB1332995
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 16:03:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvz4S3FQzz3cRh
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 02:03:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=UUnJ7LX+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UUnJ7LX+; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvz4D20vNz3cGg
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 02:03:37 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id x19so14307367ybe.0
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 07:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m3ElbC6sKeincbTSJhOwNZY/saXIA/CqlrMG2pPbv6Y=;
 b=UUnJ7LX+OahYFkoHZqXjnsh3XartRNqjVg+w9fd5vgfmUZNo6MFOC0xv9mTkURXIcb
 nkYXu78GiR/83lSvKyAN0TGtXhwADGu1s/e/JaMVYAfuCUkqDCOJnleVLFdltgbS6VmK
 FtnPN76BS+P2eD+1IH7c5M0UAzXPrxxa0KTWN1NWwiT8e5TwUOAER4U8UKjNjBqt15DL
 WubU0CzxGiYLWR4u3QlyZNahh/NjBFaoV7ZI0lBVNh9pT81UngaEDFy6y2kcHPLFc8H4
 3eyPvet9yRfVczkmCxK+l9TLDEXhAjaH8r79LI2SeVU1jK8ckfJkO4XiZzRt0ktNxSFe
 j67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m3ElbC6sKeincbTSJhOwNZY/saXIA/CqlrMG2pPbv6Y=;
 b=oeLkbrCvT3iQtHy0sB3W3YUU9ugeIgkWb9ObjICMSf4XQbyk0F7TCpwgYYClG8hPZa
 HMzE8gcOijslU0eMleXKkWNtzHPfMAfux2IkTuCgi2Mv7vZAcJEdVmbTO4MDlL/VVr5U
 NVzyFCpIxmba/K1QT7GeNon2Bjp635zN7T78CpO+SsVfHG5lQUxawyzd1rBgZbwwgcF4
 L+mRHUSUAHYHOU9XJJIv0mzCbBjOgZOLxDbe7leugNCZVpAotKRAtnkcnuISBZNAJSOF
 Z8tXD6g+xWs0fiGCH1sIchgTapOAVGws/x5+ftn8HkCoE0+fFo6+fQ77K/K3VpmP5VLF
 pE6Q==
X-Gm-Message-State: AOAM530MtApGRfEMZJecMwCxwxMrKqr/T1Kvy4XGzmQzu9ZiX32ESDRl
 ztnVZUG1eYYSlV6kmN7yfoCSG+0RLIYt6Ue17eGLew==
X-Google-Smtp-Source: ABdhPJyi4XMKJjmKfdUokDX8SixIzqrD69Mwfq8Yafhte1QxFN/FFvn0mD4j09C/cZ5127kKSr425AMHRuaWKgkLVDc=
X-Received: by 2002:a25:8687:: with SMTP id z7mr37580834ybk.209.1615302212441; 
 Tue, 09 Mar 2021 07:03:32 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
 <CACWQX82OCCAkUzdvKv4pj2YgOL+Y+SifJKAbGOEnZ_MuVyB2+A@mail.gmail.com>
 <20210309135745.vgx3mjwnfnkvilxx@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210309135745.vgx3mjwnfnkvilxx@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 9 Mar 2021 07:03:20 -0800
Message-ID: <CACWQX81UROJhBGX4qAdu6J5xy9AHpVRLXKxR5TcXeKonj2o4Ng@mail.gmail.com>
Subject: Re: Making the "new repo" requests go faster
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 9, 2021 at 5:57 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Fri, Mar 05, 2021 at 11:02:24AM -0800, Ed Tanous wrote:
> >On Fri, Feb 5, 2021 at 12:02 PM Ed Tanous <ed@tanous.net> wrote:
> >>
> >> In an effort to fix these issues and more, I'd like to propose
> >> creating a new repository for a "new daemon" template.
> >
> >If anyone is following this thread still, patches have been pushed to
> >https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41099 for the
> >moment.  As they get closer to approval, I'd like to get a new
> >template repo created to house the code contained in that patch, and
> >CI setup on said repo if I could.
>
> Thanks Ed!
>
> The only reason I haven't created this already was I wasn't sure what to
> call it.  Any ideas on a name out there?

No worries.  I don't really have a strong opinion on what it's called
either.  The ideas I've had so far were "Sample app" or "example app".

>
> -brad
