Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ADD5F62C9
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 10:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjl9f3VD7z3c8C
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 19:34:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mDec0KAZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=mDec0KAZ;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjl945sWcz2yhy
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 19:34:15 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id b4so1561628wrs.1
        for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2022 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FPNUTNTpcv6j/KbpOG6QdRUrs1ERz5AvzNn4LNwyhvQ=;
        b=mDec0KAZY9RKJBCzqOoD++x6l9Ig0HXruY3mZ025wJ8aEWVsN0iSAtx8IrldqK9nJ3
         jp526VlYA8KPU//FZB52ZGVclkec5zoeYh1FxkEgBJP6eM6pV93XNtKtz6dLTGfOGJpL
         ZL+90Qf++q9PFQdf3kLcPnNBnjJgl5/1wmsjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FPNUTNTpcv6j/KbpOG6QdRUrs1ERz5AvzNn4LNwyhvQ=;
        b=Id8cFHXxl0lsmtgXRQYJhELKdWof9QvPFZrs7V8ucI9ehL3WxD0CmFyv9B3YRk+AC3
         iAeNLsI6b+xr7RpZVJKiez5O5Ax/hJv3pWN788zQv9iyyS9mGQFmwRTraiZepHUUKHsh
         b4aaHkviuoTI7sXVA5sV4s4fRXfCXOCj/9UI+6EG0lVFniSyL01LF0r0PrYSfukhZW1y
         2IqeT0ygZmWThT3cffvZxTs/7YeGkL9yJiqYcsmycC97mIUAv8MF6RPWxqGutpxMbhFt
         FR7I6lqmSl+ABxxxSaE/aLQ/qzSFw15Zu1/+30fJzXS++beWAD74T1iuSylFmGrJe5ZT
         iaYA==
X-Gm-Message-State: ACrzQf0RIqZx8smQziXfEupP0E4dKi7AJ7K3R3id6EIPc4bWXrxS4O/5
	9T3eTEUGkfLyBqD8n/F8Xjj3PnD1iMys8rtrLqM1CvKD
X-Google-Smtp-Source: AMsMyM7CfFlJkqi+KnvowYMXiy5ePzNo4FAdGJw/aFHSCvdCdtOe3NpWDMwYgenKxfxasfSY9AM7YITRaTYYKl7Bzeg=
X-Received: by 2002:a5d:52c9:0:b0:22c:c9e0:8547 with SMTP id
 r9-20020a5d52c9000000b0022cc9e08547mr2240724wrv.3.1665045247727; Thu, 06 Oct
 2022 01:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
 <CACPK8XfrECvJtwZ8AR1EgsVHpSnkKCVp2LovCXCyFXBpjeBbfQ@mail.gmail.com> <Yz5MGyM9yXFPz1Er@heinlein>
In-Reply-To: <Yz5MGyM9yXFPz1Er@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Oct 2022 08:33:55 +0000
Message-ID: <CACPK8Xd_p1_aS-zU_=fTrPKm_ZhfqL3Rs8icexC7=94EeDm2HQ@mail.gmail.com>
Subject: Re: Linux kernel updates and v6.0
To: Patrick Williams <patrick@stwcx.xyz>
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

On Thu, 6 Oct 2022 at 03:31, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Oct 06, 2022 at 01:26:13AM +0000, Joel Stanley wrote:
> > On Wed, 28 Sept 2022 at 06:34, Joel Stanley <joel@jms.id.au> wrote:
> > > Please address any future patches to the dev-6.0 tree.
> >
> > If you have pending patches then please let me know that you want them
> > merged to the dev-6.0 branch. Otherwise, rebase and re-send them to
> > the list.
>
> Hi Joel,
>
> We'd like to have this series applied to your tree and backported to
> dev-6.0.
>
> https://lore.kernel.org/lkml/20220929013130.1916525-1-potin.lai.pt@gmail.com/

I've merged to dev-6.0. This missed the merge window for 6.1; I'll try
to remember to apply it once 6.1-rc1 comes out for 6.2.
