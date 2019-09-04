Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0E0A8348
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 14:58:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NkQq24HjzDqvn
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 22:58:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JVSjINst"; 
 dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NjF61BcwzDqhC
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 22:05:13 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id n7so12913562otk.6
 for <openbmc@lists.ozlabs.org>; Wed, 04 Sep 2019 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1NXV9FLRBHDyj1wZxYH27g6UbF6z6kU6srlQqSJoMEQ=;
 b=JVSjINstxo0MEpJrq+De2BNR2CaTqoHA/xeNLHIBvPi1T+WILq35ZqFDs8DslWHjFh
 UQaAY5AxTGU2UfkzbNND+wLrbWqO9M+8CTSKqL3w++1rHNkN3ekmchoms8paoWJDauov
 3jqclWP1fZ/M3+pJJfWo3s5BIlPXVd7CD2acZtCcI4yODs+JnxPPc2gMyXoIauq3uiO/
 ZTkfctL1EY8Jz5q3CX+MYFe6gfqMrrw/RoyYxTHDct1EXZa3QhJJxSqw0+CwRag1s1vA
 yZ6pMDcA9Yj35GbukaYPy+aJNQhGOZNsucE2bvZjGo2S1g1wNc7yeOGM6ZdLsnwaMIf7
 UkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NXV9FLRBHDyj1wZxYH27g6UbF6z6kU6srlQqSJoMEQ=;
 b=AFhxJVZKTsiLkhbEeSBDTlanKGxH810+XVJogIlTwozHi3zXdEAHHdqAIxfOlxaIYU
 HlUwLkguSnhTWSogK6vMs6vbDFUPVbrwFfFe75x+r/KIYBj+X2mgj70U+qf7yItaN/NS
 oi90UjobDZ9IMAr59XC2wNFl2zv5XVI4nKuhkJVykRJRxImdnSRKUS+4su9X2Oyfk9uz
 jJnJ17yYsXLtp0M4k9E8iMwXHBfDEo5u1cyQViQobIsLqMsZNmROdPHNmmtt7td5QaGp
 H7IIEUuli/W6AYRsDNoPJ5P95ky4+2UeVPSZvLATDw9ZevEDsy8n4qP8rS4pxdMqCBOw
 SZLA==
X-Gm-Message-State: APjAAAX15fp1yWC90KPpgSHAfQkNNccRFXoIpkEAoKAIxOGKGskDgDC9
 igr5/cvUaya1FXawcWMZlWBLSwLP8woZD5EPZt0=
X-Google-Smtp-Source: APXvYqxo26Cs+A9QY7ZjwOIJZzUx+3hzUlj8U/zzNoEAIL1JN19q9xnWEQkj0a8S10zl6aY+MSeUf9FQlX/eh7P1z6k=
X-Received: by 2002:a05:6830:15c5:: with SMTP id
 j5mr33379101otr.296.1567598709398; 
 Wed, 04 Sep 2019 05:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=o3+h7JpEdyFci7BXzpDyN2XvYvDmxOGLwOxaqn9OneNw@mail.gmail.com>
 <CAARXrtkOnosU2N6pvNUCxaRnjbXMBKP=iopC+92Gc0iUmzZL0Q@mail.gmail.com>
In-Reply-To: <CAARXrtkOnosU2N6pvNUCxaRnjbXMBKP=iopC+92Gc0iUmzZL0Q@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 4 Sep 2019 07:04:53 -0500
Message-ID: <CALLMt=oQ1muBW+u49OaQkLJDhmqN+vKqSsxTisRARTjBdN0Zsw@mail.gmail.com>
Subject: Re: stack overflow tag for openbmc questions?
To: Lei YU <mine260309@gmail.com>
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

On Wed, Sep 4, 2019 at 12:33 AM Lei YU <mine260309@gmail.com> wrote:
>
> On Fri, Aug 30, 2019 at 2:59 AM Andrew Geissler <geissonator@gmail.com> wrote:
> >
> > As a community, we're getting more and more questions via
> > IRC, the mailing list, and openbmc github issues. Any thoughts
> > on creating a stack overflow tag to try and get a more searchable
> > and consistent location for questions (i.e. openbmc)?
> >
> > Andrew
>
> Done. Tag `openbmc` is created in StackOverflow :)
> The wiki needs peer review though:
> https://stackoverflow.com/review/suggested-edits/23960865

Awesome, thanks Lei!

Andrew
