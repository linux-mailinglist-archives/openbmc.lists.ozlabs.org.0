Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3C5577D8C
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmZvH6y0mz2yLT
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:31:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iYfcMNoO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iYfcMNoO;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmZtr4tV4z2xn6
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:31:30 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id d16so15914017wrv.10
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 01:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LJKhQUd6xv8UVrB6TPmjuLtGUxti4beDYERkVcKWtJ4=;
        b=iYfcMNoOaavzRK8reaHIHfALUMiZxvbY+nj8NFDtcNJiUedWzc7ZDeK4z+Xi0Ew0xB
         nq868M3y5Xi/Yf7zaIlVlwBo9G6zTMwZjXV0cY7lbqQue9DUo4Z4nO+l3uIQbY/fEsMR
         bWTxpvWEhBrBJ8Ca2mScgd/4Sqmv+jJI7JjLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LJKhQUd6xv8UVrB6TPmjuLtGUxti4beDYERkVcKWtJ4=;
        b=qd60j8l4u9R2tU3FlK9sqpvs6SJ8EKMX/4A1q+A9p5zcqAQ/VK3UNWiSVCoK7Ewt2N
         jv8x+cJFERoHbG2P49m0qwxjMwX6E3kYXc0ISMAYfFgSGo2d5VxnsZDPxeOgDRM83NHs
         2oA7PxQ7H4Do2hoyeegpWh5ia3IYvzz7ZbKlyTwfpK3WVR0/RJLHLGj+S2SUAYCbah2E
         ZB29/FmM5RvP7Iums/gjCBCfDj4XBTjYKUm+Nr4l1Frp4ElCtPkWLog8OyQUeb0WEMOA
         2G8ObADxqPzE41x6wTciEaddnSuidkNqK75PjUh/dk3WDVo+iM3Kp5Ws/bOB6j1m+DRG
         ByQA==
X-Gm-Message-State: AJIora/4s1cWIrfJQOxut9vShpMgNlF7HLi+mm4/4F/OPJ1d2rKNTg6t
	7v3/DrZTmn+E+lAU2IkN/sS9ni2B9zdpbOW0muk=
X-Google-Smtp-Source: AGRyM1sGS8DxBZHVBvi+Bt3nW4gLnaTlysfyqNHln/bGjfCX/P7bDfOhilsKe0Gr7GfiULN6IijJLMctM4YH5vFyivs=
X-Received: by 2002:a5d:4a09:0:b0:21d:a9ad:3b1b with SMTP id
 m9-20020a5d4a09000000b0021da9ad3b1bmr21086869wrq.3.1658133083405; Mon, 18 Jul
 2022 01:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220715033327.1053462-1-joel@jms.id.au> <f518fc94-5534-0fac-c5fc-7059eb166b0c@molgen.mpg.de>
In-Reply-To: <f518fc94-5534-0fac-c5fc-7059eb166b0c@molgen.mpg.de>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Jul 2022 08:31:11 +0000
Message-ID: <CACPK8XcBQmhf2sObvWWvbOyaGzBWd5t9+t0ibtpM64aWAjLGvQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] tools: Disable OpenSSL
 deprecation warnings
To: Paul Menzel <pmenzel@molgen.mpg.de>
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

On Fri, 15 Jul 2022 at 07:25, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Joel,
>
>
> Thank you for the patch.
>
> Am 15.07.22 um 05:33 schrieb Joel Stanley:
> > mkimage is linked against the host version of OpenSSL. If the distro
> > happens to be using OpenSSL 3.0 then several warnings about using
> > depreciated functions will be emitted.
>
> sdepreciated/deprecated/
>
> >
> >   warning: =E2=80=98RSA_get0_key=E2=80=99 is deprecated: Since OpenSSL =
3.0 [-Wdeprecated-declarations]
> >
> > These functions still work for now, so suppress the warning and delay
> > the need to move to the new API.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> [=E2=80=A6]
>
> Reviewed-by: Paul Menzel <pmenzel@molgne.mpg.de>

Thanks for the review. I fixed the grammar and committed it.

Cheers,

Joel
