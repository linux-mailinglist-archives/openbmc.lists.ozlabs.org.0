Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA38637FF84
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 22:55:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fh3pb4lhdz307l
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 06:55:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=RxSALYgh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RxSALYgh; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fh3pH1l5Bz2yYS
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 06:55:32 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id m9so28127019wrx.3
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wkAybXOynelFGKgrh2X61GyDVUsX881zWhXKX1n1X8Y=;
 b=RxSALYghzmaqnZru64swgHZTulmp2kHdcr6ltwZTBraeneEly9cGHaQVVE5sJCChyN
 8opD5erJt4pdyz2NjcowQaWufWfp1AUy7XoTZxHtXD93mku/AXGc5ogciyS27mTPWQFq
 cgUHzC+uUKQWv/z9LM9hpL5+4xahgb+7ywM6lN0aou/DorVg8zNGdg3kRQrxMSEuVynL
 SwTLdGL31wHoWpww7RpArZ9WPUNP8ePe+29dNLRh5AwBk9MUvVXTqFcOqKbeMeb1Ltj9
 jHCfRxpz3HSvPjDwrel6k1FjLn2pPYo/QDos24GnIb9gfO926J7Cq8pjdA/+S3K94K5O
 HU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wkAybXOynelFGKgrh2X61GyDVUsX881zWhXKX1n1X8Y=;
 b=nJ7Cmad6DpU85HjBLsTxp49ioccYYfGLdLlRLddRl/Itd8RZeuMGdrSRs8Vp4et/CD
 RHz1b/1WaYRsCYlwOiEXyFe8Brevp+z2MxxmLU2Q9qV5Km2UlSpAENYePuXTX375bh3P
 e7xjoSPhImDT3d1+Aq/WNv1BS1ivaxi0PZ9A3+LvXkDfo20rDZusA1K/PieO0uJ8b7IH
 HZ8+0U7/BSUrRJJWED4fDf+HQ/j0EBhSPExoOvwicHhUpu29IWiRmkUU+5dPQ70jNbUx
 3yQexspgGy89/+WPg4sGjdAx6pzaoel02+roU92lTm25/HIoBoUNUdkMLHqNpSy5jja/
 UkhQ==
X-Gm-Message-State: AOAM530cHDK/RGQqaQHvvkceayb4HpYl4c5W2Qb0J1/CZEP65RQO9BHR
 kojHXFkXPRWtoIdJcNh6oIQHf7W52XvwyxoPTC7JTg==
X-Google-Smtp-Source: ABdhPJyu3Zk9KqS4ZYSMHEwzOz7xoXf55uUma5FF7Jk98pFnAO4ka8hhtxOcNUQCmIl+7ADypCDm1ClXMAuLkjlix2s=
X-Received: by 2002:a5d:4947:: with SMTP id r7mr53531459wrs.217.1620939320067; 
 Thu, 13 May 2021 13:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR08MB43999FF4F59E2DB627EF52CBC3659@SN6PR08MB4399.namprd08.prod.outlook.com>
 <91538a6c-60be-b8fa-7b9a-021c98a06326@linux.intel.com>
 <DM6PR08MB58830D49DACE954A4C7EDFCBB25F9@DM6PR08MB5883.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB58830D49DACE954A4C7EDFCBB25F9@DM6PR08MB5883.namprd08.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 13 May 2021 13:55:09 -0700
Message-ID: <CAH2-KxBtxOOBubEKvdMRy+bbJrzc65Hn7N2EGft8vrMWcL+dAQ@mail.gmail.com>
Subject: Re: x86-power-control for ARM CPU based system.
To: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
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
Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, Brandon Ong <Brandon.Ong@fii-na.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 29, 2021 at 8:47 AM Mohaimen Alsamarai
<Mohaimen.Alsamarai@fii-na.com> wrote:
>
> Adding openbmc mail list
>
> -----Original Message-----
> From: Bills, Jason M <jason.m.bills@linux.intel.com>
> Sent: Tuesday, March 23, 2021 4:08 PM
> To: Brandon Ong <Brandon.Ong@fii-na.com>
> Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>; Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
> Subject: Re: x86-power-control for ARM CPU based system.
>
> Hi Brandon,
> On 3/22/2021 3:43 PM, Brandon Ong wrote:
> > Hi Jason,
> >
> > I am currently working on the implementation of the x86-power-control
> > for an ARM CPU based system.
> >
> >
> > Is there a way to add a compile option to x86-power-control in order
> > to change the behavior to support the ARM power control logic if it
> > were to be integrated into x86-power-control?
> x86-power-control was created to solve specific timing issues with our platforms.  It wasn't designed to be a flexible solution for the community to use.

And OpenBMC was initially designed for POWER platforms.  Things change :)

Clearly x86-power-control seems to solve more problems, as a lot of
new platforms seem to be preferring it.  If the code being changed is
messy, unmaintainable, or isn't well abstracted, that's a different
discussion, but outright saying nobody else can make use of
x86-power-control seems problematic, and would lead to a power control
daemon per-platform, which seems hard to maintain, and in looking at
the amd patches, an amd specific daemon would largely just copy-paste
95% of x86-power-control today into something like amd-power-control
if we took this to the logical conclusion.

>
> phosphor-state-manager
> (https://github.com/openbmc/phosphor-state-manager) is the OpenBMC community power state manager.  It is designed for flexibility in how different systems change power state.
>
> Rather than add build modifications to x86-power-control for your needs, I'd recommend that you look at phosphor-state-manager which was designed to be customizable for different systems.

phosphor-state-manager has all the problems that you found when you
went to use it, and found it lacking.  Clearly Brandon has found the
same and is looking to make some (hopefully minor) mods to make
x86-power-control more useful in more contexts.  If it's a matter of
code cleanliness or separation, there's certainly a discussion to be
had here, but effectively saying that everyone should go build their
own version of x86-power-control seems wasteful, as a lot of platforms
share similar properties to what x86-power-control does.

The things I see in the patch are:
1. The ability to invert polarities of the inputs.
2. The ability to disable at compile time some of the watchdogs that
don't make sense on certain platforms.
3. disabling the beeper (which I'm not sure is needed so long as you
handle errors silently).
4. A couple of platform-name-specific hardcodes, that I suspect aren't
needed or can be abstracted.

Is there a way we can avoid the duplication of code in this case?

>
> Thanks,
> -Jason
>
> >
> > Thanks,
> > Brandon
> >
