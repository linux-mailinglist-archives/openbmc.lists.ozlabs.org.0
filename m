Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E084F25CE3D
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 01:19:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjGwh73M2zDqll
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 09:19:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::131;
 helo=mail-il1-x131.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ASkqMMOy; dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjGvv6QkzzDqjg
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 09:18:50 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id b17so4772160ilh.4
 for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2020 16:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9hWsv3UL+CQcKonNy6E3+bC/YsuBpzjJHP5pUhfs9T8=;
 b=ASkqMMOyoDWwm20yX11NHcK3GpUWY1NtGlSEqc+56s/fsEjz9ziiTf7sLa+kDS0NIh
 VHkFsZjrdj2TNSVusQMRBUFraPAD6I5ILdTGg3A5bAmMSmjzVmiFcqH/yAO0IsjxC4EH
 Mui/YjCMwcVFL4Rva8epFRxI6cCpop7SXGOxLYuI7SgOnVt3BjEMheHzvMsWXqxgHims
 rhS4R5yjcV4f2vy6k4SA6eazRkNDkGX2PD4XeCWoC1Fw7WliAzf9UgLiKxmgXYeHl6Lv
 dZioKA5uYNXDdqUi5B8PYWa9r3wcdX/fR909Wj3PwuLtkBk7unCvfth/orbub3kOjFGd
 zcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9hWsv3UL+CQcKonNy6E3+bC/YsuBpzjJHP5pUhfs9T8=;
 b=qoXzJhtt3YVk4suvmrFdOiFKEmhNijS163ZgTs+Zr8BNRxnydAG8pgd1u/T8wdZNjt
 mBiCG20A8OcrkZ+V1zoGIzr86k5CjExZZxSWsJtrdRe7cNlvgbsmXZKFwX6jtJPrSNzU
 BUKOX6Sh8+Wg/x/ypVwnJ/c5/lbPgZAZ+3J5blweZeAHbDVL0nuIYrT5V5haQFzrzTQZ
 jePlNFqJlefQ7O9p5FWsTaJ/tkiAKagTcfgVomKd60vYJXFxuBEDdcGcUWjBEJDa/bM9
 1SWdj6mcY3atoJiEag4eW80soG8W6Vx5suwpWBWSX3Amdgd+yWASQGb4cGg6kkeRLFwT
 9Qsg==
X-Gm-Message-State: AOAM5332YKb+N/SlZiVQ3YzaZPoFhn5qOCngNNvek65O+DnpGDnoMYW7
 d+H7f3bX0X8/HDaYnRRL+BsHYLplkKydTHeVYvR+cA==
X-Google-Smtp-Source: ABdhPJwV1w8rKVZ2SmeuJMKA+67rPpnakPyNutBtFw0//dm2qgO75c6xJNQm2Dl8HX72wQ98EL0FSNTQ9iiTs+UCrGM=
X-Received: by 2002:a05:6e02:146:: with SMTP id
 j6mr5652400ilr.132.1599175126537; 
 Thu, 03 Sep 2020 16:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <FA2BA7DD-2DD5-4CCD-927B-310AB5B56C64@fii-na.com>
In-Reply-To: <FA2BA7DD-2DD5-4CCD-927B-310AB5B56C64@fii-na.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 3 Sep 2020 16:18:09 -0700
Message-ID: <CADKL2t5z_ZcgN1jKChungKgNuRJs4JRQtaqa3DeKX-DQtYPGRA@mail.gmail.com>
Subject: Re: New meta-layer request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 31 Aug 2020 at 15:40, Lancelot Kao <lancelot.cy.kao@fii-na.com> wrote:
>
> Hi, Pioneer
>
>                 I come from Fii crops as a subgroup of Foxconn. We are using the openBMC to develop our openBMC with the Ampere & Nuvoton solution.
>
>                 So, we need to create a new meta-layer for us. I am told there is someone who may help us to create the meta-layer for us. The below is the information needs to create meta-layer.
>
>                 Name : meta-fii
>
>                 Maintainers :
>
> Lancelot.kao@fii-usa.com
> Neil.chen@fii-usa.com
> vveerach@google.com
> benjaminfair@google.com
>
>
>
>                 If I miss anything, please let me know.
>
>
>
> --
>
> Best Regards.
>
> Lancelot Kao
>
> CABG/CESBG
> TW : +886-2-2268-3466 #3766
>
> US : +1-281-655-2668
> e-mail : lancelot.cy.kao@fii-na.com
>

Hi Brad,

Can you help create the repo for meta-fii as described above?

Thanks,
Benjamin
