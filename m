Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4441547CFC4
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 11:13:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJq0Q10h4z2ypX
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 21:13:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OwZGvPbC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32;
 helo=mail-oo1-xc32.google.com; envelope-from=leetroy@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OwZGvPbC; dkim-atps=neutral
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJq000CQYz2xsj
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 21:13:01 +1100 (AEDT)
Received: by mail-oo1-xc32.google.com with SMTP id
 y13-20020a4a624d000000b002daae38b0b5so573110oog.9
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 02:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V7bbdHWNEEqlKDqJhjPg0gt0ycyFpnBJ9VFQDwjPwJk=;
 b=OwZGvPbCWliC1s6b3g+osC4vh+r/G4X1boWK01Fidhk4SAdG+k68oXeoI2ZvDgY0Uc
 CO7BjJsliv+5fCaEUESA3II6kPrnpPraeglaMidGqSykNvbeXQEWKeIAtL40jqEBLk9W
 rA/udVK+vWlGDZ2mbNGapA7n4XPleFVgldBHP8+Y2siByurt1O9a4PdX4DHHUJ8kGsi6
 GjoKCUX1yh/kKfXqxJb7b1X1xV48+Jqf1Lk/abG7QXuquqb8QB1BBD7Ctf2+8FSbO3m3
 bPgRyxB5lkR72yQl1szq9ttyHCv8dAWLjM9JRgBkqnrut/nQUn83mW7MwQKJc8O2tn3a
 5PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7bbdHWNEEqlKDqJhjPg0gt0ycyFpnBJ9VFQDwjPwJk=;
 b=G/qnW/jJJP0bbdd3g08NixjHVsW5HPjES0curp7ogrWSRuOY+CABKouFyihu8tmFQY
 MFQRR13c8OO13tP2LSOY3beu2gN5LBXFCg/vBeFhbytaO8RAdSa5MJo6JsuS4wY2w3HS
 qdP5iSiCeDbNfiCZMa8hmzhfRFlPYbhdknW3r5DV+pqRYp0oIxLDH/DNiswElTy1DJIh
 UoEwCYFO2IPlC2QNd/IUCAvNPCfdluMBAJXh+e02zRCRBcCdGaUpj1AN7YCEfokiFmvu
 sXNqQL5iW4plhVsCetua8/qVkW3cldaI/gVjK8Eit+Ke16FiSF5ttuVbS8kl4VJAJTcE
 AUEw==
X-Gm-Message-State: AOAM530lygRm6c6QMY1dhIRLh0qNqqdkRtik96dszjJ61Lzsa9GcroDm
 UOOisWs13Mdlx7mpR7/pfQgx8VgpdtbaFpPk7SPxKF0h/1I=
X-Google-Smtp-Source: ABdhPJxBOq7emtO+k7PdSsn9pe8Myd++LWgbgOU5ke885UQAy3VFC11XSaC41OcuwvgD6pE97Bl9f7C5SC2sMUpMUnM=
X-Received: by 2002:a4a:ead8:: with SMTP id s24mr1397236ooh.89.1640167978358; 
 Wed, 22 Dec 2021 02:12:58 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notyNtux_jNWFsrYex_vkKxt_JEE=ATU-RrL=o7vmsEdEBA@mail.gmail.com>
In-Reply-To: <CAO=notyNtux_jNWFsrYex_vkKxt_JEE=ATU-RrL=o7vmsEdEBA@mail.gmail.com>
From: Troy Lee <leetroy@gmail.com>
Date: Wed, 22 Dec 2021 18:12:51 +0800
Message-ID: <CAN9Jwz0fLF+8_mSS8hSDOcAJVB_78zX3jwORd96ZAkCZNc5VnA@mail.gmail.com>
Subject: Re: i3c on Qemu
To: Patrick Venture <venture@google.com>
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
Cc: Hao Wu <wuhaotsh@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick,

On Thu, Dec 9, 2021 at 3:02 AM Patrick Venture <venture@google.com> wrote:
>
> Hi all;
>
> With ast2600 and the nuvoton 8xx, we're seeing the introduction of i3c and I was curious if anyone on this list was already working on it for Aspeed or Qemu in general.
>
> Patrick

I have submitted an initial commit for I3C with ast2600.
However, this isn't a real I3C model, and it is just good enough to
bring Aspeed SDK image up.

https://patchwork.kernel.org/project/qemu-devel/list/?series=599257

Thanks,
Troy Lee
