Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DF0286A6E
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 23:48:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C67J34w1vzDqRv
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 08:48:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=oVpDRpV0; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C67HD48zSzDqDF
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 08:47:49 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id r8so3336512qtp.13
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 14:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OvdIVkLe3bAgJ1gXZn/hAk7G/0EA7JKKqG3ULgTMFwM=;
 b=oVpDRpV0Mv5v/yqyFjm8Cy4V95t+hMiZQCePtGMD3PMjEGlz3Z9pQTeqgFeBibsZJo
 BQ6Ti56DBiE/Nv3NOFNBlKvCaZ+4eAN6RlHJa54c2QlcFk5nX8ZIz18GLovyEHNCVxMG
 5b2uxnsu/SkpA7hFfUveWfpAGP5Mm0rHv5TlXLOzc5e2taKg1KW6ua4q8IpJAdVEDou2
 6cEU4/dGM0lZKKvXIlOphV4wUVangvlfLxlBcEpOJHXPwSmvQpDEkSEESfd+k71P5CvG
 z+Vnb0pQGq2gvrFwgRucYDsLj6ZO8IyQYFa/vYg78frDEeL1Jy2X0KvILBE42pXOJ0DT
 BtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OvdIVkLe3bAgJ1gXZn/hAk7G/0EA7JKKqG3ULgTMFwM=;
 b=h8U5d8xCqCQMYyRumopAYz8ZpRBWkPi+GhSio4ivKOf0jE2i5BAhpg6kgUBPMhzL+l
 wIyKvNF9GmGj5PZhqFFEi93bWTUc8agtWUOLld/P656fllCebPbM9V1U7FHHgbLFNsZg
 7jsXJm0UehM52bZnqKOlQoYp7nUU3MicOYNKAtS/GBVTi/VgF7SO+5j1nEMoOknlOhSU
 DYv8Qrgh7f+3HkOalddG8RJZ/c/g36GiY/Ck1B4xAWXhYDa3p6sDQ9+fUlxdkoEFbkr5
 m8oaUmQZqfzB2C61z+POQCnFgB2qPogP0VP6MmEmeMRCtJu1O82Ee2gBbsQXeactVrMf
 n/wQ==
X-Gm-Message-State: AOAM530vOruvpreIZ+nM6Ct/N2+iboUcI/hZTNyeW08Mg8QXcr8jrzOG
 VaivmeZi8lpxHXtasv7FHXLzwMM30cSKRPOWusV/Aw==
X-Google-Smtp-Source: ABdhPJxv9o0qOyOvF/15lL3sPS9TT7Re8wnv8Q+xhfNHr9vBF0Y9ytLETXxNKb5dzbhqxB6IuzC326C0ApVESwLMOQU=
X-Received: by 2002:ac8:cc4:: with SMTP id o4mr5330261qti.21.1602107265187;
 Wed, 07 Oct 2020 14:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
 <eb06797a-ccfd-2d5c-f3c4-0d3c024eb127@linux.vnet.ibm.com>
In-Reply-To: <eb06797a-ccfd-2d5c-f3c4-0d3c024eb127@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 7 Oct 2020 14:47:34 -0700
Message-ID: <CAO=notwdhfj_+DbjEiO-fK-YH86CyEdV-mznOM6RirjRqWrP6w@mail.gmail.com>
Subject: Re: Heading out
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 7, 2020 at 1:13 PM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>
> On 10/7/2020 12:21 PM, James Feist wrote:
> > Hi everyone,
> >
> > This will be my last week on the OpenBMC project. I'll be moving on to
> > something unrelated to OpenBMC. It's been great working with you all.
>
> Great working with you, James! Best of luck in your new position! The
> project will miss you.
>
> - Gunnar
>
> > All the repos I maintain have additional maintainers who will continue
> > to maintain those projects. I'll begin removing myself from the
> > maintainers lists shortly.
> >
> > Best of luck with the project,

Good luck!

> >
> > -James
> >
>
