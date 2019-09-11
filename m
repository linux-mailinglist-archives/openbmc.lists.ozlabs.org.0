Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3EDB05B6
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 00:38:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TGyG4xrbzF3xl
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 08:38:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=bjwyman@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kZRvTdr4"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TGxX6bZszF3xK
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 08:37:33 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id n7so24177092otk.6
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=uqv6hADPDOmI/dQ3P17awSAVIyIVUf59LwTwj/Y+2Oo=;
 b=kZRvTdr4MBpOGSuZkoUmUVSjevZ0OACPlZc+ZNwidox7wNeUPVHss5m9xhKB+Imgmr
 JLUSeSV56mLrKlfhxdBwsIfzblwkra7S32abSzgejfebxPeSQDEv+IAzmSYUNDbArmsS
 XThr6iLHTkW4yVVgA665xIrha2oezd/br2sLZkprCZG39wqdk/3bJIeNuljHIwhKMywS
 vbeZboVi0C1//a6w4XBoxpeEkO897hvJdn5Cab2REclIOaLhmAz4wGnVaDlVzkgzmTg9
 EuXji5xp6Ai0GYVfMU5FR5m8AjGn5Wrk8fj7Ehg2lb2hAQIVo0bKJvLb8IpSk54hppd0
 OJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=uqv6hADPDOmI/dQ3P17awSAVIyIVUf59LwTwj/Y+2Oo=;
 b=jqoci2m+nHgGcFllgrGqk+BCiAtPxPiv8O9IoVw79eO5OYXEe7V438dZoBEm3R7oTr
 N/VIuH/CLl0U7c8A4whS4sedLx1Ro23Zlh8tNghPni2bABNVrZkaCf+ntOsHO9y3+Q8v
 psurKB5EPk3pZrFF9jDEIGqTSnY4r19hYRH19gEyctYmcT7K7Lp7LPdVlrmKPRsebXS7
 Ywod6sJ2PckXgs5Q8oVEJTQShcNZkD4utZBBWez1c3PoqeuCskyb+XzYbzvd/6tiKZwV
 PFCfRQbK6+K9HMsyPPYUO99lZyHo1ZyDQHb904I9LC2/3RFrIQ2tKw/k8P7zDXSTz4Vf
 bBgw==
X-Gm-Message-State: APjAAAXTqP+DydNROPAf0EJm9b5FC5ig0slo8X4Vkpx7KZFZacJFZVFG
 o23F4cL2IVm4ZmKXZ2SpSWbhAqJgClEz1R5HToGlinw7
X-Google-Smtp-Source: APXvYqxto40PcEehfGLJEkXndEUOhGil53RZ15i79/v0njV90+c8RyepWQiDr1e2j0uMZarB5cSuQhWacRlgfTpTNUo=
X-Received: by 2002:a9d:7ccb:: with SMTP id r11mr12780168otn.331.1568241449797; 
 Wed, 11 Sep 2019 15:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=o3+h7JpEdyFci7BXzpDyN2XvYvDmxOGLwOxaqn9OneNw@mail.gmail.com>
 <CAARXrtkOnosU2N6pvNUCxaRnjbXMBKP=iopC+92Gc0iUmzZL0Q@mail.gmail.com>
 <CALLMt=oQ1muBW+u49OaQkLJDhmqN+vKqSsxTisRARTjBdN0Zsw@mail.gmail.com>
 <3aa37f37-b9c9-f9bb-e125-7e1f998f1c3d@gmail.com>
In-Reply-To: <3aa37f37-b9c9-f9bb-e125-7e1f998f1c3d@gmail.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Wed, 11 Sep 2019 17:37:19 -0500
Message-ID: <CAK_vbW2gCBLu_VyzDK3OBHvvNQyHjUunHDyrMaaNmmrEVegmnQ@mail.gmail.com>
Subject: Re: stack overflow tag for openbmc questions?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 4, 2019 at 9:07 AM krtaylor <kurt.r.taylor@gmail.com> wrote:
>
> On 9/4/19 7:04 AM, Andrew Geissler wrote:
> > On Wed, Sep 4, 2019 at 12:33 AM Lei YU <mine260309@gmail.com> wrote:
> >>
> >> On Fri, Aug 30, 2019 at 2:59 AM Andrew Geissler <geissonator@gmail.com> wrote:
> >>>
> >>> As a community, we're getting more and more questions via
> >>> IRC, the mailing list, and openbmc github issues. Any thoughts
> >>> on creating a stack overflow tag to try and get a more searchable
> >>> and consistent location for questions (i.e. openbmc)?
> >>>
> >>> Andrew
> >>
> >> Done. Tag `openbmc` is created in StackOverflow :)
> >> The wiki needs peer review though:
> >> https://stackoverflow.com/review/suggested-edits/23960865
>
> Just be careful about sharing code ideas or bug fixes there. The license
> terms may be incompatible if that code wound up in our tree.
>
> I see no problems with answering usage/build questions there.
>
> Kurt Taylor (krtaylor)
>
>

Curious what this link was, and what there was to review, I clicked on
it. It looks to be too generic, not helpful, rejected. So, I guess we
don't (yet) have something to worry about on copying code.
