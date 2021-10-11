Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 963D2428623
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 07:15:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSRnw0YkYz2yWL
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 16:15:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=G70skPnx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=G70skPnx; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSRnV2ylXz2xYK
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 16:15:09 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id i1so14248569qtr.6
 for <openbmc@lists.ozlabs.org>; Sun, 10 Oct 2021 22:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HxYttqR+A+lo4l0ObvzLxW4YHPEBhtChDjTzyJ8Hr0Q=;
 b=G70skPnxeVM+hBydsk3TwB7sGcgL39I7h47LkjNf8dsCbigVvsk6kc/tH4++/Vm5Zv
 qYOps+F9+yrbbQD+W2yXPAxOBSNfHycRxz/tozMtorycy/Nle5AHCveCR9OOGjowSddq
 gYU+Bqs6dcm0O66wH2TG/AQBuk1xZIz8qd2Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HxYttqR+A+lo4l0ObvzLxW4YHPEBhtChDjTzyJ8Hr0Q=;
 b=mqCWyc8Otk1zcf321vMBRmwljG3LzEJnPTeheaWXDu0Rk4nwWGPw6HCFZbE6/rp4CY
 OJotsFhjT8gd3ZeQJ1Y4K00AUT6OaK1x3bCCTsTIPx4q3fFUJMQsnHLGjaQWxtiipE4x
 6tvrVVaLfHKC7KjZezKBZUNmfRGV2oT3op+jrMpKih4xVTuNyhUMkkkVs9AZ1JsbCA4n
 OoMC5CcQbC6O6bO8QNUN+SJzQZ9KeS/HquN5MU0XFBQmv/50sVFOP/+UTvE61GIZzUoR
 1Aa4sNPrhN2Imvy6wW40NvUfTDVeBp1dt/flIB4gwff0Cwqkz6msmjXWi92u27wyjfYt
 1aNQ==
X-Gm-Message-State: AOAM532Jl67KXklmX84+ycVf65bDSsLT+KX+TfDggh1xp0V9nJypi6Q9
 ykUhiRzCQxbeh47CwqYx+6ses3qnguHBCbZcfvU=
X-Google-Smtp-Source: ABdhPJwOxwsBJ9zGM3D6EktxJ2/Cy+mwm3512W46LbaqV1nq8sImM8eypP1lvc5ru7aoVu0F51pG0xYwBhmpCA7c+VY=
X-Received: by 2002:a05:622a:11c9:: with SMTP id
 n9mr12935881qtk.295.1633929304355; 
 Sun, 10 Oct 2021 22:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211008053006.31961-1-george.hung@quantatw.com>
In-Reply-To: <20211008053006.31961-1-george.hung@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Oct 2021 05:14:52 +0000
Message-ID: <CACPK8XeaaiK+dUjO2EnvgOPA2fCAGixWYdY7XL4t_iU57jJ25g@mail.gmail.com>
Subject: Re: [PATCH dev-5.14 v1] ARM: dts: nuvoton: gbs: split SPI flash
 partition
To: George Hung <ghung.quanta@gmail.com>
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
Cc: kwliu@nuvoton.com,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 Benjamin Fair <benjaminfair@google.com>, Willy Tu <wltu@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brandon Kim <brandonkim@google.com>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 8 Oct 2021 at 05:40, George Hung <ghung.quanta@gmail.com> wrote:
>
> Split the primary and secondary BIOS SPI EEPROMs in 2 partitions
>
> Signed-off-by: George Hung <george.hung@quantatw.com>

Applied, thanks.
