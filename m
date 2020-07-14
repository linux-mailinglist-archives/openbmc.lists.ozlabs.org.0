Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D669F21E5D6
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 04:43:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5PvR5wWrzDqbr
	for <lists+openbmc@lfdr.de>; Tue, 14 Jul 2020 12:42:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DttSv8kr; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Psl19pXzDqZ3
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jul 2020 12:41:29 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id c11so10428580lfh.8
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 19:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fWMbUrByH6I1em3mBSOgn7X6I6vrWIt405AqdagfDtM=;
 b=DttSv8kruhhfYTHw/r+PbgAjgwEptnr7Wlm2V4uZ19e+5tUifxQ6m/pVNyzUI/6jED
 QgmS7uGiLZiLQwa5QNION18/GCsl6CEqGTIps7heqnf92Jg0Bdg18IgLyDnI/ECUI9t5
 hogE4w/IZ1CMd9ABUlq8Y9Zbajk/Q4clAGmfDgnYitQ2piZeFX4zK8Ito0/TVRQMYpbT
 NZ9jx1g44mdyA/FL+2UFmdCA7Ebl9+6PdhRW8hGVJ16ZZw4KnrFX3/s2XOsSUFhCcx6Y
 3uyf/rePWFFu8Zr6AsbtJMf8hyTXUhsDPomv/zakUZwgib6uU+0NuV5DFSt70iaGiW0I
 hJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fWMbUrByH6I1em3mBSOgn7X6I6vrWIt405AqdagfDtM=;
 b=jDrmouLiMUzzat6pg0nB/6bK60Z3oHo7wHkxAxQPPMSAQX+Dpqg7KbzKdWxfkWSwGS
 vVxdjPJNHcP8FOSTNav5m96Mn9Q3g1fIeifh9shSi1dZRwAwT/+yQjFf8YcSJ3I21qGo
 44qPtXA+eGz6sIXBpN1b0MUJmp2EhQQ777bBZ14r3tj0fkyfj8sZnHYpOoFVM+rCsr6a
 zoKY9BA80QvpPwijGBmGHVOg+rKlbGjlG6fiEqy9SAQ4Bc/vAIFepAMtjwjk1npupcm2
 I5sR1/KZdiARy0oOzOIm5TQWM/p4yf0jqDthtr+2LEQkwSSBZeTgrfiyHDaLO3IFjYhN
 G2MA==
X-Gm-Message-State: AOAM5301FgPr+nRBDd5PnsqxP6n2WLeJvyfaF4K7MCf1v5t53fzkp/uJ
 HO3IT5kywLWdc4UJCqi/PcFyCubc+h7qUbAZ7nJQuA==
X-Google-Smtp-Source: ABdhPJwNtLYTj4LzE8YYzMOvxbAwYG0H2jcAc5Ozjq8WtA4OqBuyPPE23q1SrDwSgWs/liD+TgI+SnxDJHmV50fLnE4=
X-Received: by 2002:a19:911:: with SMTP id 17mr1025625lfj.80.1594694483325;
 Mon, 13 Jul 2020 19:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610@HK2PR04MB3826.apcprd04.prod.outlook.com>
In-Reply-To: <HK2PR04MB3826F0E0E2F9CA1A041DFC5DFE610@HK2PR04MB3826.apcprd04.prod.outlook.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Tue, 14 Jul 2020 10:41:12 +0800
Message-ID: <CAGm54UH407RGGHmrbqUvWDy3ozXx08NQCNiW2E4qs576kwB67g@mail.gmail.com>
Subject: Re: How to let openbmc's kernel load jffs2 file system
To: =?UTF-8?B?5ZGoIOi/nOa4hQ==?= <zhouyuanqing8@outlook.com>
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
Cc: "uperic@163.com" <uperic@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 9:34 AM =E5=91=A8 =E8=BF=9C=E6=B8=85 <zhouyuanqing8=
@outlook.com> wrote:
>
> Hello everyone,
>
> The rofs squashfs currently loaded by the kernel of openbmc is very incon=
venient to debug because squashfs is a read-only file system. I made a jffs=
2 file system, after modifying the bootarg parameters of uboot, the kernel =
still loads squashfs.

By default the root (/) is mounted by an overlayfs, so the whole
rootfs is writable, see below:

    cow on / type overlay
(rw,relatime,lowerdir=3Drun/initramfs/ro,upperdir=3Drun/initramfs/rw/cow,wo=
rkdir=3Drun/initramfs/rw/work)

Be noted that the rwfs mounted at /run/initramfs/rw has a limited
size, so you could only put files with limited size.
For testing purposes, you could manually create overlayfs mount in
tmpfs, that way you could use the ramfs instead of rwfs, and it will
be cleaned after BMC reboot.

--=20
BRs,
Lei YU
