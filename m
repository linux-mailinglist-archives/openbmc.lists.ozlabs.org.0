Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB44B307C34
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 18:25:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRS5s6DC6zDrgT
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 04:25:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aUexg+wB; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRS4r63fKzDrdc
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 04:24:11 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id 84so6194984yba.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 09:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P2hJtIMnZaZv1sELITvibF7++QG64oFgAHo7nLIyJ5M=;
 b=aUexg+wB+qTMZ+BdSO87wQtnBRZie2WEvH+LAOUQI3d7ZVNULEwfOUVXzLrKtHh8K1
 RHfPwbnVUhoEiOTdSZHHbWRQOTYS0NTUHb8WumFGMALm1AImlTyPGQ4lind/XFeR3LkW
 sL/Mor4JcIsqxlUpv8N4xiPSeueB0NxXNwDjnRlhf+ynDHgkg76x0qafgoocfN/osXkQ
 PuML9IMy3bkbDEaYQCuDsrLLLgIK5TOs1qqpotpSmuWWxnrrUexpYFDepOHMhbhKkkPg
 BybyLMQ0XgSo2F4FBRn1Yt1WIxXSs9dp/SCXHut7jPs1o47YIE9p/d/+SY1Y198VCQSd
 ZnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P2hJtIMnZaZv1sELITvibF7++QG64oFgAHo7nLIyJ5M=;
 b=s8qmsKRP0L3DFMETBuW/2q9Y54agL20UfJiHsT9ZH2cRiXMnXYWH5aNf/e3M0KCCfJ
 E6dBLjBuAaZuXw3B9V+K36RRoyDMRaYEroMr4AdbnL6tbPvunZ0A6XbUXz++/5um83wb
 x4VFgRr8gLRbCDbHr38bzxLlrrdMSGgPc/OyAY26uDPbM24osQqexAMP9BYSb8FEiPXs
 8xRlVpsIY9LVJxuabwqvWI22/S28UamjB8nKmMEj4pD0tNjfKEq4+OcYw/K6QPcQhV0e
 4WKJIhVk0d+YGG4HqAg4zzzNqUpvw32+if0gOnF3XP0X80s7yGgcbB4nQUqmApMVlzOR
 An+Q==
X-Gm-Message-State: AOAM533sbqfTPJ9zoz0P8G0ipAYF1ah7XJXFoM5G6IF31FzAvm9D6owT
 DCLgqH6OgN8aOWWXg9XkarLkmCw5tPwPURL/Fnuj8y7jSr0=
X-Google-Smtp-Source: ABdhPJxDUN8A9YfEwGdpJdv42H8trzY/OKuff2LouvGTLGylEImqaQwDkxjrdaflzWnhoj0lxFD92odE7zvItt3Rn9I=
X-Received: by 2002:a25:6854:: with SMTP id d81mr293217ybc.170.1611854647350; 
 Thu, 28 Jan 2021 09:24:07 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
 <CACWQX8236dghCCdnDAdnij0Di_GF7DsmAO_xEtWmk6ckKDocYg@mail.gmail.com>
 <e18c023a-ccb3-6591-1092-cd488cd331e9@yadro.com>
 <CAH2-KxAC1r2tSOmbCyyvnYcY0Z-iyW97FoGHbtzitVNH1u5jow@mail.gmail.com>
 <5a209aef-f6cd-40fe-bd3b-8a4e1c623c8a@os.amperecomputing.com>
In-Reply-To: <5a209aef-f6cd-40fe-bd3b-8a4e1c623c8a@os.amperecomputing.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 28 Jan 2021 09:23:56 -0800
Message-ID: <CACWQX83_KWqvroAzdZTOh=HHre+w8T-QF-eftGxah++-5Yda3g@mail.gmail.com>
Subject: Re: Gerrit owners plugin coming
To: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jan 27, 2021 at 6:08 PM Thang Q. Nguyen
<thang@os.amperecomputing.com> wrote:
>
> On 1/28/21 00:09, Ed Tanous wrote:
> > On Wed, Jan 27, 2021 at 4:02 AM Alexander Amelkin <a.amelkin@yadro.com>=
 wrote:
> >> 26.01.2021 00:26, Ed Tanous =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Wed, Jan 20, 2021 at 11:23 AM Ed Tanous <ed@tanous.net> wrote:
> >>>> Over the last few weeks, we've been slowly getting the gerrit owners
> >>>> plugin deployed and tested, and got the OWNERS files merged into the=
ir
> >>>> respective meta layers.
> >>> These changes are live.  Any commits to the individual meta layers ca=
n
> >>> now be submitted directly to openbmc/openbmc now.  If there's anythin=
g
> >>> broken about the new workflow, or anything unexpected happens in your
> >>> workflow, please let me know on discord and we'll try to get it
> >>> resolved.
> >> Does this mean that meta-<vendor> directories are not subtrees anymore
> >> and respective repositories are now obsolete and can (will?) be droppe=
d?
> >>
> > The intent was to make them read-only in case someone was relying on
> > them directly.
>
> Hi Ed,
>
> Any problem with meta-* repos which have not been integrated into the
> main openbmc repo? For example, meta-ampere, meta-fii.

They'll need a review pushed to openbmc/openbmc by someone with an
interest in them.  Make sure to include an OWNERS file in them.

>
> And with the change, the new change will be submitted into
> openbmc/openbmc repos in gerrit instead of openbmc/meta-*?

correct.

>
> >> Thanks.
> >>
> >> Alexander.
> >>
