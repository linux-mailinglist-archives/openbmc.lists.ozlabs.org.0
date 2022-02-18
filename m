Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE7C4BAFAE
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 03:30:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0Fyz475Fz3cVK
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 13:30:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=1gPM+7d2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c36;
 helo=mail-oo1-xc36.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1gPM+7d2; dkim-atps=neutral
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0FyZ1FPWz3bVG
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 13:29:39 +1100 (AEDT)
Received: by mail-oo1-xc36.google.com with SMTP id
 w10-20020a4ae08a000000b0031bdf7a6d76so1887286oos.10
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 18:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y5rvOzYSBXt1xJVWgVMLZz134ORWWkG36rZQafdg9aM=;
 b=1gPM+7d2fh7a0svgtSl7wSHz1BP54yYX6Q+0FgrpKxW1rPUh4SuaXIB6vutIB7sOX4
 qjqlaFUdgA3bzhmH3HmVJOceityeV97ORoxQ+UxQvM3x/EoXPQ5wqi0Kw9F+5HNqw6Fo
 SkHkwkXQlOhQg4StIqNZK8jqHL3Pn0HnqpU7Zn1yRfTJUqlPWfmMqDhy+SolucQPJWBD
 pe9B7Ec8D7W9/1ItfRsxFFnoan8ShNrUhEM6VWs/+OKBSWwBdNj7SyOsTSDq8TFlxxOM
 u2QPzEJSqvW2cgCvaq4rgWF73/HIs9FWdmRVsFEOIKFf5D0DJi/xzlF8tu/kj48Y6WaU
 DVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y5rvOzYSBXt1xJVWgVMLZz134ORWWkG36rZQafdg9aM=;
 b=b8Pd/RdIfstbPal/T+oY0/CulmdNyzAg02ALbor4B2urVSHTgMQxqoITnV2LQ+uZX5
 foBI9bDWlGvaNlNe1F/05NmLMHiek027AC4N6uRYJBcHvKa3tpTFmjkZjdlR6kYX5krR
 Vn3VyTyKhIkdoe+t+QiwZep8Qg+e8kGme2Fu3bkzY2Vi437I8/vjPTD4oVgktVvRuf6t
 e+QhkJSdEQOz6p1BKo/ajPi5iDo9nHv8tt7YteOWp28p/mCiict8WAKmj+HUoMIA6wkA
 F8WYCPGrybNBcKAFXvXop9DHLMka0yoWBd1qYYDcRkXmpKA7QyKM67trfurreaaPnXeQ
 AZCw==
X-Gm-Message-State: AOAM533k2uR9B0qAR37o0FMYI+4gcApMG+6dYAM11Navs395f9aUuyKw
 r8Uk1SHAkf5/fs6IDeJvGo2r8ka5mjho6dwBkCEdjA==
X-Google-Smtp-Source: ABdhPJz8BjsaANN65ntYD0fa1zFuew6726LI6XyGdoYPeVOPanMYKZ9xTyNDYB1EVbgJ+uFfLJ5fn480sUzGTSqusmk=
X-Received: by 2002:a05:6870:219c:b0:d1:5c1d:7f54 with SMTP id
 l28-20020a056870219c00b000d15c1d7f54mr3484713oae.213.1645151376680; Thu, 17
 Feb 2022 18:29:36 -0800 (PST)
MIME-Version: 1.0
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
In-Reply-To: <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 18 Feb 2022 10:29:25 +0800
Message-ID: <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
Subject: Re: Checking for network online
To: Jeremy Kerr <jk@codeconstruct.com.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 18, 2022 at 8:11 AM Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Johnathan,
>
> > Issue: systemd-networkd-wait-online.service stalls for 120 seconds
> > when the managed NICs do not have a network connection.
> >
> > TLDR: Should OpenBMC remove systemd-networkd-wait-online.service
> > universally?
>
> Probably not, it's required to implement network-online,target, which
> is standard, and may be referred to by arbitrary packages.
>
> There's some good background on the issues you're experiencing here:
>
>  https://www.freedesktop.org/wiki/Software/systemd/NetworkTarget/
>
> in short: most services should be able to start before network-
> online.target, and be able to adapt to changes in network configuration
> after that point.
>
> For your specific issue there:
>
> > Issues: This service blocks entry to multi-user.target.
> > phosphor-state-manager uses multi-user.target to report the BMC is
> > ready to use.
> > This is reported via IPMI Get Device ID.
>
> That sounds like more of an issue of whether that reported state
> actually represents the expected BMC state...

We have an internal "override" config to start
systemd-networkd-wait-online with --any option:

 # override.conf
 [Service]
 ExecStart=
 ExecStart=/lib/systemd/systemd-networkd-wait-online --any

This is mostly about fixing the QEMU CI.
In the real environment the network *should* be up and online so the
above makes the systemd-networkd-wait-online starts OK in both cases.
