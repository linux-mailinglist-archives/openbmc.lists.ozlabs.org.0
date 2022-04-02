Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B634A4EFE38
	for <lists+openbmc@lfdr.de>; Sat,  2 Apr 2022 05:34:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVjMH3g8rz302k
	for <lists+openbmc@lfdr.de>; Sat,  2 Apr 2022 14:34:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Eq+YMdKm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2001:4860:4864:20::36;
 helo=mail-oa1-x36.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Eq+YMdKm; dkim-atps=neutral
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVjLr468lz2yPv
 for <openbmc@lists.ozlabs.org>; Sat,  2 Apr 2022 14:33:52 +1100 (AEDT)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-deb9295679so4743167fac.6
 for <openbmc@lists.ozlabs.org>; Fri, 01 Apr 2022 20:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VIYXbRrLYJRr/n9ul8FbEq9CPuWRF6CbROSb1PNHH3g=;
 b=Eq+YMdKmQBeKOU5Y0wDFNHmHpVLpK8jRlEm7epFuQntkXxMlFdq2oPZfalEyLg172J
 Pw891GJVxBv3IXRgIgzDpxtX5tql5pSWpQh8r4uQpzdwI/2Br5R/Ve1ZtIaHYLOFCluj
 J63Fb/5EfC/IYPjpn+m+2brajWDZ/HvVE86byKXUz1fwlAs0Z7je1bEe7ilk2nMaTAmS
 wdgmhAHq3ZMwctnqoW8osXDEl2sDWyPsMsjeo/8q+BBs6mLNPxIMlGPutBSQL/ZcAkpg
 PzilOXEgWpyk+uxNG4YwYVjmHAw02DDO137V8NMH5pqAyp6ZlFZ/ZKrvvll5PnYCxV7E
 58nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VIYXbRrLYJRr/n9ul8FbEq9CPuWRF6CbROSb1PNHH3g=;
 b=eB8MLrBeHJAxvSMu7ISvsyEbbt3Pd06vXN+tobzEsI59IeVO9GIOS0eO4U7fq7K7sP
 nAhkfaNdi/slVaVSGuDrCrcY14ECeIyg1GJyAFZHuEZfBCRq3+LUK7YKA/89Zxonbat9
 RzDVP9hKqfKDaDwOsU9hIhHzBgVhi37sC++rizMFYA/DdKS8kHY6feT1SKf/iuhh426i
 O0y3rKu1QGZw0LSgoh339DReJvncggUkQO+1AM2Gz7bVonFBoP30wwFWs83b1p5d9/xh
 wRfqZsOmri9Hd6kNU2TsffpSobWOlDUzEMEe8jamT20AAaROBuFdRORJcpu6ixXZ0Y0S
 HqKw==
X-Gm-Message-State: AOAM531BL5d5AoUy6+vOvLuFMFA6qHg2aPwiR3wGTQ1Pxs1BQqWyo1E5
 xAOEj4hcGZ7g6wd8ZabeLy+ugZzuCUORtinsliBH6z10Z9Qh9GB+
X-Google-Smtp-Source: ABdhPJy1xJL1N9Oy1RRSPWKZBYSzj41QEa1H5d3ipVWleplbebvT9S8sdwjgKVlMSvWHlai2ZjmYncD6bfJ+7e/U7eU=
X-Received: by 2002:a05:6870:5b93:b0:dd:c65c:a2c with SMTP id
 em19-20020a0568705b9300b000ddc65c0a2cmr6301992oab.8.1648870425654; Fri, 01
 Apr 2022 20:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UHMED4Np0MThLfp4H-i8R24o8pCns2-6MEzy1Me-9XJmA@mail.gmail.com>
 <YkdmjcI3Mk3dvySe@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <YkdmjcI3Mk3dvySe@heinlein.stwcx.org.github.beta.tailscale.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Sat, 2 Apr 2022 11:33:57 +0800
Message-ID: <CAGm54UHYuUsJxYqxdmNVJJxRaJvHF3hcmnTD4d06TMqA0qfMQg@mail.gmail.com>
Subject: Re: Missed interfacesRemoved signal callbacks in object-mapper
 results in invalidated DBus objects
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Apr 2, 2022 at 4:54 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Mon, Mar 28, 2022 at 09:19:40PM +0800, Lei Yu wrote:
>
> > This looks like some fundamental issue in dbus-broker or sdbusplus.
> > Is there anyone who hits the similar issue?
>
> I've have a write-up on what I intend to do about this issue at:
>     https://www.stwcx.xyz/blog/2022/04/01/sdbusplus-object-signals.html

Thanks! It's a nice article and clarifies the different cases.
But I still have a question about `Permanent Sub-Objects`:

> We never want the sub-object to deal with its own lifetime signals! If we=
 did they=E2=80=99d also be the lifetime signals for the parent object beca=
use they are all residing at the same dbus object-path

For example the `Value` and `Critical` objects in phosphor-hwmon:
1. when it's destructed, it will emit the interfacesRemoved signal for
the `Value` interface, but no such signal for the `Critical`
interface, is it? I do not think it's expected behavior.
2. It has the assumption that the service needs to know which is the
permanent `main` object, and which are the `sub` objects. What if the
service could not tell which is the main and which is the sub? I think
this makes it harder for sdbusplus' users to design the object
hierarchy, is it?


--=20
BRs,
Lei YU
