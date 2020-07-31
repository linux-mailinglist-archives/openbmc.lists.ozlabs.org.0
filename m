Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 412D0234BD1
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 21:57:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJJ3l2qxczDqgj
	for <lists+openbmc@lfdr.de>; Sat,  1 Aug 2020 05:57:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=kwuh/qMq; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJJ2m2B09zDqdM
 for <openbmc@lists.ozlabs.org>; Sat,  1 Aug 2020 05:57:03 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id b79so29862169qkg.9
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 12:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mCwC1iABYMcRM5dpbDYfuG5eJ3fPITUqD6AdsMMZ9Dk=;
 b=kwuh/qMq7fW0XmhtTrVfjulwqBo4k/PljT6+U0gi/x5emQfq3jsC2ljV4OiCoDoOs3
 HYy6XspeNf/VrY9QG7EyHzBA3SYLuwQ2eZ0v37kSFVVO7RftFGYeo7N78hWVZJUTKgrK
 qSVE2FOW+ZCft1ag9wxVKrzmVtAewvtT+k0AZnM33bptjdyR7M6kjxaTl4pUUXlEeOas
 0qNlVr8wiP4lMPt8dsLhuwuIbFe/OBdg73cSSJ+BPSl9h3RuEu32G1SireZnvzSwwUmN
 MkGss7gLcU3xV1a5sUTbnf8rKqDuornP4EeXt4dBGUamx05aP4+po7QdYWKelD3LJ35B
 VrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mCwC1iABYMcRM5dpbDYfuG5eJ3fPITUqD6AdsMMZ9Dk=;
 b=jJRfU6MRMZJ3yQsUxno2jpCJHsGmn1lq1TF4faf6pYRKq4ZtLuNTa2L+U0d/Kz359F
 cGYcd+RzdwcMWSPJUXwDiJj5xEd9aAvILqc0sG91q1pH7C0In1veKooh3SodMLoS4tkm
 ZpPvaFi75ZqDIirJd9Th1m9DuLFpScOaI9zHBhmfC7nEOfKMuCPaGWMCQFKXCIcE41KA
 uFJNl0koceH1TpZpxBgXVZApBFy9yK2xQs0dxcRzDAlLR8b4Ow6LgK0BaixdStcgmPBO
 Hu6GalRx+GByjsSudmGzA3Ndof1oYL1cc0s3Khif2PLqfip/ZZSZzNeiX+5wepI1qMop
 UUkA==
X-Gm-Message-State: AOAM533EyohBd+T0GIuKAdNWPjy0P377rlTaPugrdvT0BfM2yCtR8s6w
 cYsGPCvBid/NRUhn0dXd8VMdsOfKK8GGOuHcacuEmg==
X-Google-Smtp-Source: ABdhPJyRN6UhVqyRXpMsvamOHmtLu5nPTnyrlJgxxNn8yoZjnNIFdUWylU6pL+gcNuWKHW80UG4bhTQZuYkBxbcuotU=
X-Received: by 2002:a37:a292:: with SMTP id l140mr5121388qke.79.1596225418625; 
 Fri, 31 Jul 2020 12:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <E27B8EFBB1796B4A8CF2A20BF59146F901AB3E@atlms1.us.megatrends.com>
In-Reply-To: <E27B8EFBB1796B4A8CF2A20BF59146F901AB3E@atlms1.us.megatrends.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 31 Jul 2020 12:56:47 -0700
Message-ID: <CAO=notyMGd9XNFP99DBq+BC9G91h41omzDhw_oQYiyHnwkt8KA@mail.gmail.com>
Subject: Re: Query regarding the host LPC address in phosphor-ipmi-flash
To: Connie Yin <ConnieY@ami.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 31, 2020 at 11:21 AM Connie Yin <ConnieY@ami.com> wrote:
>
> Hi, Team,
>
>
>
> I am checking this OpemBMC firmware update interface on an x86 system, an=
d wondering how to construct this host LPC address at which the chunk is to=
 be mapped.
>
> I saw once when test on some platform,  0xfedc1000 was used as host LPC a=
ddress.
>
>
>
> Would anyone please elaborate a little bit more?  To get this host LPC ad=
dress,  should I add/modify some drivers in BMC? What about host side?

The host-side address is a region set aside in the BIOS that gets
reserved in the e820 map.  The BiOS dev adds it manually for this
purpose.

>
>
>
>
>
> Thanks a lot.
>
> Connie
>
> P Please consider the environment before printing this email
>
> The information contained in this message may be confidential and proprie=
tary to American Megatrends (AMI). This communication is intended to be rea=
d only by the individual or entity to whom it is addressed or by their desi=
gnee. If the reader of this message is not the intended recipient, you are =
on notice that any distribution of this message, in any form, is strictly p=
rohibited. Please promptly notify the sender by reply e-mail or by telephon=
e at 770-246-8600, and then delete or destroy all copies of the transmissio=
n.
