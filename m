Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E349603A5F
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 09:10:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mshhb2Dftz3c4N
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 18:10:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=IrjRlqIw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::930; helo=mail-ua1-x930.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=IrjRlqIw;
	dkim-atps=neutral
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mshgy4Sp6z301Z
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 18:10:04 +1100 (AEDT)
Received: by mail-ua1-x930.google.com with SMTP id h25so6677165uao.13
        for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lbyZLws2/ef2ptA8KMRrRCWYeZaeE32P5VKd6w8/EeE=;
        b=IrjRlqIwnLDLjwAWLA5uBhNXt7otHoN21FqTN3cJh/RGMzrQtEoNsxIJCJo1K5magb
         B5dmKLjf31MHvo/8P3cPou2ywMkfbx9YMEAvzQsYfKmMi90KlgWoLTz7FeB05qCKca3t
         J86AVDmRNx4vdB4vtsI2/6D7XzxVGV5E20IdM4NUcIgGaLna9yEwad/ynlcqAucVwScd
         lbbjDZJKuWv+dXn5wV1/DnNSnC834uEadmxcuedjVrDNXr3XevUd2JoRBkskD+nEYV7v
         y/di0X9FQh5k8omGgci+96X191coVXfWvsYLhe5R3DtsLIntTQnfoMpFA5JVxQttUnU2
         it5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbyZLws2/ef2ptA8KMRrRCWYeZaeE32P5VKd6w8/EeE=;
        b=ROp/rVlJIH9KKsRjHwyWijjCnH/cCBzh8S36zz5PYasC3fCtFTQVl9ktQML3DC7fMk
         ljW5OJSEKT60hwRyVXu1lefTVA0BjaUr+0N9u9ZQMtjtaMG+rLuu095M0eJNXRCp/Hiy
         8iY5wDxrkhFTaDOZV1CyrQIhfgAzdTHi9yR82k1IBy6cmm52bBjEtPG14q4EYrM7vMHt
         0GXh0IpVGkl0pY6Jnn4PGVJqbdE6+EpAihhH7SxYAjSxbp+2umlICtRZq7LIOaCm0P05
         x6BMdyaUzIgG01evBaJVdyDplgkGhhuz0wJlh7mo3GPwSZqnQBXNqDBUcxzGOb1/8EP/
         C/ZA==
X-Gm-Message-State: ACrzQf1IoleFWPX+9Gni9gDDRSJRgePkA21ieRAivvmK0nzt5B9CWDh5
	xnpSAfWRujKzmjRqd3xJIT61EOLNHhbZC4crbKpSlM1wtS7UJjEB
X-Google-Smtp-Source: AMsMyM7zZFZfvq7t6GriYsMvNi8yNMMcd0nh6MC619zHVwLNm2NlDS1qOxjl52sQD/v/Ov1b5YNye60KJjlZRQaln6w=
X-Received: by 2002:a05:6130:183:b0:3ea:47df:c75d with SMTP id
 i3-20020a056130018300b003ea47dfc75dmr3563782uag.116.1666163398108; Wed, 19
 Oct 2022 00:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UF_XeQivcVozvjMjWbc4J68E+PJSbyVRFdScoyfKh9oEQ@mail.gmail.com>
 <Y0+Cc2sp3mHZ0Z85@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Y0+Cc2sp3mHZ0Z85@heinlein.stwcx.org.github.beta.tailscale.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 19 Oct 2022 15:09:47 +0800
Message-ID: <CAGm54UFVdbM3cVRPk3qxeu0G-qp9n-ij5-JH8RFFBQ5oq2M7LQ@mail.gmail.com>
Subject: Re: Blocking call in phosphor-networkd
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 19, 2022 at 12:52 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Oct 19, 2022 at 11:40:17AM +0800, Lei Yu wrote:
>
> > How about changing the code to read the `/etc/hostname` file directly?
> > It is much faster than making DBus call to `systemd-hostnamed`.
>
> Absolutely not.
>
> The value of `/etc/hostname` is considered to be the "static hostname",
> which is configured by default in the 'base-files' package to be the
> value of ${MACHINE}:
>
> poky/meta/recipes-core/base-files/base-files_3.0.14.bb:hostname = "${MACHINE}"
> poky/meta/recipes-core/base-files/base-files_3.0.14.bb:         echo ${hostname} > ${D}${sysconfdir}/hostname
>
> The value from the dbus call is the "transient hostname" which is
> typically assigned by the DHCP server and is much much more likely to be
> something that resolves properly on your network.  Since all the
> machines of the same type will have the same static hostname (due to it
> being derived from MACHINE) you are almost certain that this name is
> useless for any purpose.
>

According to https://www.freedesktop.org/software/systemd/man/hostname.html:

```
Otherwise, a transient hostname may be set during runtime, for example
based on information in a DHCP lease, see
systemd-hostnamed.service(8). Both NetworkManager and
systemd-networkd.service(8) allow this. Note that
systemd-hostnamed.service(8) gives higher priority to the static
hostname, so the transient hostname will only be used if the static
hostname is not configured.
```

systemd-networkd will use the static hostname anyway even DHCP gives a
transient hostname.
So I do not think it makes any difference.


-- 
BRs,
Lei YU
