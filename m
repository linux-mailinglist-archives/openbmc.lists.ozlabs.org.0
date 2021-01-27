Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC8C30619A
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:11:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQqrG3XFxzDr1P
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 04:11:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=kS3FBfqC; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQqqC4nKQzDq7k
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 04:10:13 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id m13so2676515wro.12
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 09:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TtWydekmAoAXqU0+ZYm94Ma9c+DRx03c62N6pu76n5c=;
 b=kS3FBfqC6gC3Q0KRoL/wLXkCUgTgelP6zpwNvAYiGmWZI22+GthXMOkgy5U1AZ+vbi
 EILwP0SLN8bbEMWEoqqQmnY+Iz1VHDcQU0Bt/VCSpJq5exDuiplXWoDgg5aLKifOTp6g
 AkWDV3gW/vMkzxa4xH4xLnQ/J/+BV+UtFrfSkuom9phtuB3Yfcc3pb3IZ96r2PGK0KBO
 DRsH6ZIZDfJOSoC6E820o9OAXmzgU2KtpxCkKBA1MkyjeMBdUhoZKv3GImHRFKKCK0WE
 WpWcaLgLJ9M2+AIrLcL7iIXj2KArWUmod9hiO/UKk52Oao1KJ+cFmCXZCnabWnGSPk0S
 nlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TtWydekmAoAXqU0+ZYm94Ma9c+DRx03c62N6pu76n5c=;
 b=GDVsJjLvW9yu7lpZPpW4DmD5GrwPgGiXbbnrgKdaYYWTcOfP1Y8Obb8FcN0aDO8Glk
 rBg1eMHsR50qCPM7KTCtFci4gNBsI2kdQhuOU+PGk+kX9iksYifPmJcZ6DAJ1/O+2UB9
 jv+lQES4o79EHuEg+o5eYOsHuTwFSXAgcdmY0Vm6Is7ddMwQMkhMji0xx79WWu9bGBA/
 /7JR39sQ+siAvgvKukw4FuuhZ7r+qkE2hK9FWpCaIz/4DyFu5+VSiByOFRBTRvaD5foT
 SyY30U57M674zQivPs2bG2I21h/mV8rUV8tBZcw+So19ommQxfTWzBHFttTT+sZiyhx3
 ZlJQ==
X-Gm-Message-State: AOAM5315zJpFFROeeK18UQbva+NXyWpWcC487gTMFyh0RvRd6FuHF2w/
 ZCsjbiIIw2DTmKbYRnKUSISU2aG1MDiZPVUhRwAw/fK5CLmd+g==
X-Google-Smtp-Source: ABdhPJwqxFzovFzNpPcb9xcM4JhlolohsaEiI10JuWytK4GZ7eYwVvazSMGgUMULI5dNGeclu8ZY+TGHZds2RjJJsqk=
X-Received: by 2002:adf:e80f:: with SMTP id o15mr11997203wrm.366.1611767408555; 
 Wed, 27 Jan 2021 09:10:08 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
 <CACWQX8236dghCCdnDAdnij0Di_GF7DsmAO_xEtWmk6ckKDocYg@mail.gmail.com>
 <e18c023a-ccb3-6591-1092-cd488cd331e9@yadro.com>
In-Reply-To: <e18c023a-ccb3-6591-1092-cd488cd331e9@yadro.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 27 Jan 2021 09:09:56 -0800
Message-ID: <CAH2-KxAC1r2tSOmbCyyvnYcY0Z-iyW97FoGHbtzitVNH1u5jow@mail.gmail.com>
Subject: Re: Gerrit owners plugin coming
To: Alexander Amelkin <a.amelkin@yadro.com>
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

On Wed, Jan 27, 2021 at 4:02 AM Alexander Amelkin <a.amelkin@yadro.com> wro=
te:
>
> 26.01.2021 00:26, Ed Tanous =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Jan 20, 2021 at 11:23 AM Ed Tanous <ed@tanous.net> wrote:
> >> Over the last few weeks, we've been slowly getting the gerrit owners
> >> plugin deployed and tested, and got the OWNERS files merged into their
> >> respective meta layers.
> > These changes are live.  Any commits to the individual meta layers can
> > now be submitted directly to openbmc/openbmc now.  If there's anything
> > broken about the new workflow, or anything unexpected happens in your
> > workflow, please let me know on discord and we'll try to get it
> > resolved.
>
> Does this mean that meta-<vendor> directories are not subtrees anymore
> and respective repositories are now obsolete and can (will?) be dropped?
>

The intent was to make them read-only in case someone was relying on
them directly.

> Thanks.
>
> Alexander.
>
