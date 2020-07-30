Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B7232B1B
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 07:00:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHJBF5Cr8zDqg3
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 15:00:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=fGXYckR+; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHJ975qY4zDqnr
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 14:59:06 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id c14so13788181ybj.0
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 21:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eWujhJUGUn8hk6T5s2/nLrGKyTtJWMZLs0yezZ8TB+Q=;
 b=fGXYckR+lxJWjSX4Vmf0fC3CqGUGwteA5C3G3Pdt0/rjLDTdSHM/3PqOzcI3WDMVUY
 CKLHnCDRsUhJ5f/P9oOiZvw56t62xTQyO0d4pREfum16JdySsP/XQK74ttNsAHvy5Ca3
 DD9coM7ivEtWHjtGv23QljGbIvgVt+jNx8GXT5XMaKozdNb/ARdmUP9z8zWKRjC/eGG1
 JE4d7o8Y/ePy78ecPSbd8TkCLPvebIRuNQWTpGR6WSahhf9ob8KvabP6e1W0KKWKy0OV
 rtQVQSKVhdafN3Ox6AFVpqF29JGPMVecEyu+38LIxfsqbW2NvnyWBBApmGpNjB7vVH2t
 FbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eWujhJUGUn8hk6T5s2/nLrGKyTtJWMZLs0yezZ8TB+Q=;
 b=I4JaHFehCVfSui1qsgu8pCaawz3prgJFazdtDCVJvXHdJksoHA6KEEVW5wLWvZVkdl
 8whkAVHA1zA7r2Rh7h4zZtl7Z3p4qiK1xM81+4mtFyyp+9o26gSe+CajCLBikmxSmjMY
 LRaFb3ki2j+28ROrcWQp4jebe2mQ3fP5pwbGIhDkv6HkRSUr21u4UTcpmj4/Aaek96hI
 qLbQoQ/o5c2mkNLcej1vTLGnGjTFXdOv6UcbJ3w4RQVPggbUGyGZiIHTYF9rYfDs3v+5
 QdKsgcjIzkXfdi2AmGERNt9bMqwk6YyFm0cIledpEyZex7hAl1SDuGu6r1qb9wJIOVUR
 N6rA==
X-Gm-Message-State: AOAM531ehPwMdppMPOqWDA/FkgFkvhurM7Y6iFrLV8jQ8LF2mYIV4mz+
 NoQ6arXdUCw3z1vwg9Eva8RbE/DdXPAt4RqDS2vRtg==
X-Google-Smtp-Source: ABdhPJznh1hmTlKBH1j3GhnSI9f5WL99D3Q2aczwSvGUu1TVULoxSOyCM+CIMpOfGG7KwbSRS7TToDhQ+bM6acqiZWs=
X-Received: by 2002:a25:8891:: with SMTP id d17mr49580464ybl.209.1596085143402; 
 Wed, 29 Jul 2020 21:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <80EB1AD4-61FB-489C-8D6B-5FDDF7F46ED3@fb.com>
In-Reply-To: <80EB1AD4-61FB-489C-8D6B-5FDDF7F46ED3@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 29 Jul 2020 21:58:52 -0700
Message-ID: <CACWQX807x=poNBwJurSKu7kGAh=x=cv4d6Wixy9cMqHax6AXMQ@mail.gmail.com>
Subject: Re: using third party library
To: Vijay Khemka <vijaykhemka@fb.com>
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

On Wed, Jul 29, 2020 at 12:52 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi,
>
> I want to use following library from open source which is under MIT licen=
se, please let me know if there is any restriction to use this in our openb=
mc package.
>
> https://github.com/ArashPartow/exprtk/
>

Upfront, there are some important questions you should ask to save
yourself time on the backend:
1. What binary size on disk does the package add?  Is this in line
with the value it's adding?
2. Is the library of sufficient quality and modernization to be able
to be used under the openbmc c++ coding guidelines?
3. Does the library have regular releases that we can target?
4. Does the library accept patches?
5. Does the library compile under our current compiler settings?
(ideally without warnings)
6. Is the library secure against security testing tools like fuzzers?
7. What license does the library have?  (I suspect MIT will be fine,
as we pull in other MIT components)

In the specific case of this library, looking at the grammar
definition, and given how many features are allowed in the language, I
worry that we're opening ourselves up to lots of expressions that
really shouldn't be done in a virtual sensor parser.  String
modification, slicing, and comparisons for example, probably don't
make sense in the context of sensors.  If/else blocks, and loops also
worry me in the context of a runtime-read config file.  Looking at the
language spec, it's basically another programming language.  If
there's a mechanism to limit the grammar, I think I'd be a lot more ok
with it, although my previous concerns on your design review still
stand.

>
>
> Also I need to write simple recipe to include this so please let me know =
what is the best location to put this recipe as well. As I am thinking of u=
sing this for virtual sensors then I can put under Sensors or if there is b=
etter place to put this then please advise.

I'm guessing openembedded would be the best place for this, as the
component is not specific to openbmc.  I don't think sensors is the
right place to put this (as it's not a sensor).
