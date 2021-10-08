Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBB54263D8
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 06:36:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQb3t5bMCz2ywX
	for <lists+openbmc@lfdr.de>; Fri,  8 Oct 2021 15:36:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=XDBDrBRC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XDBDrBRC; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQb3R2Hj0z2xv0;
 Fri,  8 Oct 2021 15:35:46 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id w2so180291qtn.0;
 Thu, 07 Oct 2021 21:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ZuW84FCUeNefVYpl7AXF9/6C9HEWosikSwgMkrYqEo=;
 b=XDBDrBRCGDfMhmfBsfE4sYKoyPV6PDJ6GFvDUZJKpWtPB1mLpgU0cYQm5X5YNh3mnD
 3p8FNTlquaHZ8+ppbR8E612WozKfh7KLFuGh+mqvFBHcySVnfIAmS8PDOcpVBxleTeRT
 zl7Yg1iEbVGFlmHnqu04v7jeaskKs2aT0PvDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ZuW84FCUeNefVYpl7AXF9/6C9HEWosikSwgMkrYqEo=;
 b=YWjkKY3tkE+4R2Jc/tP9mg1TPTZUvH6vgsMo7GSWDF7bYQfsQq6E/EPz+u2q8Vmn0y
 BwSI12xEES7lyQ3kflOOrx4ZSU9//If0wLYvpvuwIBn0gEHS/8lXbm0/a0IzcfuLY7RY
 7P90wnRyonp5CBt45oZL01l3rPZ3LsT6wd0w2xGcPhUiAICSPEIL4207iBSyXdWMptOW
 aVDC9W5MymUTpa89yY76snXk976VMVjSr6wXt0jYuMbuzWZPzKR3XTkIEBafdmFJpKUi
 uB+iRbPgKGxky7hMt2o7+Ll0YpbHchMW1X12pfZRoDGQNd/lF6mmbZrvpX/OqiRaLHTx
 Pmhg==
X-Gm-Message-State: AOAM533aLVvtYhaKGL6FtUuIR6Gb05FZ2gkUsjdajGvWPX9UcJG3VB7S
 jwbwp5Ew25UPQUydgfYXQ+yMkhnSE8rMfYOuncw=
X-Google-Smtp-Source: ABdhPJx23WvHqotWOkfOASvG4ZJEedhf8Z22sYYHd357XdyP13GG/0PdPRGQ7t/sI6n+IBEYzZwvvHjHMJCb9sipnQY=
X-Received: by 2002:a05:622a:1345:: with SMTP id
 w5mr9462603qtk.259.1633667743064; 
 Thu, 07 Oct 2021 21:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
 <20210927023053.6728-2-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210927023053.6728-2-chiawei_wang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Oct 2021 04:35:31 +0000
Message-ID: <CACPK8Xc+9yFJn_pO1sAVQJu_FWkA1U9XnbB+TLYgfdbHi1TyaQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] ARM: dts: aspeed: Drop reg-io-width from LPC nodes
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 27 Sept 2021 at 02:31, Chia-Wei Wang
<chiawei_wang@aspeedtech.com> wrote:
>
> The 'reg-io-width' properties are not used by LPC drivers
> nor documented as part of bindings. Therefore drop them.

I assume they are there due to the lpc having a 'syscon' compatible.
THey are documented in the syscon bindings:

Documentation/devicetree/bindings/mfd/syscon.yaml

Andrew, do you have any comments?

>
> This is in preparation to move aspeed-lpc.txt to YAML schema.
>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 1 -
>  arch/arm/boot/dts/aspeed-g5.dtsi | 1 -
>  arch/arm/boot/dts/aspeed-g6.dtsi | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index c5aeb3cf3a09..45a25eb4baa4 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -345,7 +345,6 @@
>                         lpc: lpc@1e789000 {
>                                 compatible = "aspeed,ast2400-lpc-v2", "simple-mfd", "syscon";
>                                 reg = <0x1e789000 0x1000>;
> -                               reg-io-width = <4>;
>
>                                 #address-cells = <1>;
>                                 #size-cells = <1>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 73ca1ec6fc24..8e1d00d8445e 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -436,7 +436,6 @@
>                         lpc: lpc@1e789000 {
>                                 compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
>                                 reg = <0x1e789000 0x1000>;
> -                               reg-io-width = <4>;
>
>                                 #address-cells = <1>;
>                                 #size-cells = <1>;
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index 1b47be1704f8..0d1aae6887cd 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -490,7 +490,6 @@
>                         lpc: lpc@1e789000 {
>                                 compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
>                                 reg = <0x1e789000 0x1000>;
> -                               reg-io-width = <4>;
>
>                                 #address-cells = <1>;
>                                 #size-cells = <1>;
> --
> 2.17.1
>
