Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAB2244426
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 06:19:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSVYz3HRMzDqGY
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 14:19:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=EUCzJHw7; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSVY66HX1zDqg4
 for <openbmc@lists.ozlabs.org>; Fri, 14 Aug 2020 14:18:16 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id df16so5852476edb.9
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 21:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d5Zj9iZSD2A9uPoidyItUrlCspsjLCmhnRZlWkifdio=;
 b=EUCzJHw7N9q+VdWr6kzibH3qT/LEwoJkE19/1tbFSwC6cJj3OgcW4kIutz6nl/eBQK
 KVaVrDXe8YzkRVWFHnU+sapG3ExMD4+COBmABWFE9zh6Ql5nB6ksu/s/PcP0GH0o8dA5
 5rxt3X0F+NAMo/E6/L/4nqgEDEtke+6WXC7Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d5Zj9iZSD2A9uPoidyItUrlCspsjLCmhnRZlWkifdio=;
 b=AEZM6Uo3YsJQn9GizQfh25dbjRKOFwLb7JFlwSjeJHL0OwXfG/I1PRstIhusyJxOa+
 OsWOel1PW3GkxgZ45Fo8UGzw2O5AXT5ZRzgqCLEEqBN3LSenwK1FZqNb2vSnE8VAUmoW
 EuY+v6jNj/Tnbr/QS56gqhgHbkCOSkOgyT+mnhMwhVOB3gcgCGz9rtslEiQ7FPbCwGnI
 +/U4qiZARoVrdSIj71y0gn2/DwuGd1C5+EMZppwqeplvDrdyc2p6k9NqB6Vp9nLPZ5Ov
 buk23f7GFqcW9aNB3Lco4tEhkj/qjONYLumANonCj1lm7Z6W2uXJRpaKgY6fsa2hkmKh
 EsHw==
X-Gm-Message-State: AOAM530jZhCWkgH3upKDesElaF4Xjt3o2GTXBrXhjjEk/SHB+NZvAmAB
 f8ao35GcD6C1DdPdFrgMqLnTPf8pDwZ9h5e/ATA=
X-Google-Smtp-Source: ABdhPJyOrtSAWRwuuJKF1mrohoYRdGKHN3NT18pQi3nDPSMa9dygi5pQmMnOEzALK/90hZk+GL92+Q1JkGV/LWAv5pY=
X-Received: by 2002:aa7:c406:: with SMTP id j6mr531343edq.143.1597378691887;
 Thu, 13 Aug 2020 21:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <1597308767-31538-1-git-send-email-vishwa@linux.vnet.ibm.com>
In-Reply-To: <1597308767-31538-1-git-send-email-vishwa@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 14 Aug 2020 04:17:59 +0000
Message-ID: <CACPK8XeSaY+QaUuPc_5T-FomPDA8ZZnCbTn-=eLg7dZfjj4iPw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 1/2] ARM: dts: aspeed: Add LEDs that are off
 9551 on Operator Panel
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
 Vishwanatha Subbanna <vishwa@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 13 Aug 2020 at 08:52, Vishwanatha Subbanna
<vishwa@linux.vnet.ibm.com> wrote:
>
> From: Vishwanatha Subbanna <vishwa@linux.ibm.com>
>
> These are LEDs that are controlled by 9551

This patch does not build:

  DTC     arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dtb
../arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts:986.19-1073.4: ERROR
(duplicate_label): /ahb/apb/bus@1e78a000/i2c-bus@480/pca9552@61:
Duplicate label 'pca1' on /ahb/apb/bus@1e78a000/i2c-bus@480/pca9552@61
and /ahb/apb/bus@1e78a000/i2c-bus@400/pca9551@60
ERROR: Input tree has errors, aborting (use -f to force output)


>
> +       pca1: pca9551@60 {

As I explained in the last email, this label is a duplicate.

$ git grep "pca1:" arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts:   pca1: pca9551@60 {
arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts:   pca1: pca9552@61 {

You can only have one label called 'pca1' per device tree. You will
need to come up with a naming scheme for each. For example, this could
be called pca_oppanel.

> +               compatible = "nxp,pca9551";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
>         dps: dps310@76 {
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
> --
> 1.8.3.1
>
