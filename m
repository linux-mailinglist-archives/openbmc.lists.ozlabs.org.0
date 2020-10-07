Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 930392858BD
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 08:37:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5l5C530zzDqPS
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 17:37:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Dd7++d5q; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5l4V0brPzDqD5
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 17:37:08 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id cv1so492868qvb.2
 for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2020 23:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4s9KJz3g3gnU11QpdbAxGmu2tURffjKReSTs/IgXECs=;
 b=Dd7++d5qjRAGGlRTIxIFJLZqOa2Ba905oezcjLqmkb4nv+hBEjAVt9D3v5CLFfDO9r
 YAZSCCeH9DJtO916rtriuxgc4IxDatjjftyD3omN9+F8DOkeqLcOSpyRo3MTN70k5tRR
 OduzrwekdhQYX/GoLO+0fP6dl0vKUv793st9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4s9KJz3g3gnU11QpdbAxGmu2tURffjKReSTs/IgXECs=;
 b=gwKbyrt0EhS+q3qQ9U1lEN3qIhCiAJBXQvcWkXeFK3e18gvxJsj8jUWHX2bbgDRLZ0
 3CUm2NlvZQZmt2TjEIL6oxdUkjkbyp8dDSi6xYT/a0x01pY7+l7ZkGyXKuRZoXJIaRbX
 2QdkypMUfIOJpduXbbZo4jlnhYLAcIMv11qYgkneJystWJUDMKIlXvYIjh0wGuxERtfh
 JNqFHozo4PPQ8UCCaqFJl2ErlxlszNk3ZSBIhJ8xBk6QiDCxNpaBpstOe6dlZ8glqj/B
 sq+WXRa6JYJlG/lUtaXVn/MwdOJkYckPQqfp/mzUxYIGjs030y2T1Qr79L7j12zztMJg
 LPpw==
X-Gm-Message-State: AOAM531P6a0QwbzSwz0w/0E6VepLCGWreSyNuOHD8q4tZY8OAOb2HWl0
 jCfjZxZAT3ZcJ7iTl/gayx2quVNYNWFeIPywmVY=
X-Google-Smtp-Source: ABdhPJzFfySck/B9KMnusX+QBgft58xmeI4LuNzXNxiYtxBWoigla22WAB0DSAefc7nV6yanDOv1Refjj+cxnNrdvfc=
X-Received: by 2002:a05:6214:11e4:: with SMTP id
 e4mr1641937qvu.61.1602052624660; 
 Tue, 06 Oct 2020 23:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200930075153.2115-1-aladyshev22@gmail.com>
In-Reply-To: <20200930075153.2115-1-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Oct 2020 06:36:52 +0000
Message-ID: <CACPK8XfZ3ZymkF-QM9b5NTqgHuoRc67g1fTXE8_vudCRcvp_GQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] ARM: dts: aspeed: amd-ethanolx: Update KCS
 nodes to use v2 binding
To: Konstantin Aladyshev <aladyshev22@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 30 Sep 2020 at 07:52, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> KCS nodes compatible property in the 'aspeed-g5.dtsi' file was
> changed to use v2 binding in the commit fa4c8ec6feaa
> (ARM: dts: aspeed: Change KCS nodes to v2 binding).
> For the proper initialization of /dev/ipmi-kcs* devices
> KCS node variables also need to be changed to use v2 binding.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

Applied to dev-5.8.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> index 60ba86f3e5bc..89ddc3847222 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> @@ -139,17 +139,17 @@ lm75a@4f {
>
>  &kcs1 {
>         status = "okay";
> -       kcs_addr = <0x60>;
> +       aspeed,lpc-io-reg = <0x60>;
>  };
>
>  &kcs2 {
>         status = "okay";
> -       kcs_addr = <0x62>;
> +       aspeed,lpc-io-reg = <0x62>;
>  };
>
>  &kcs4 {
>         status = "okay";
> -       kcs_addr = <0x97DE>;
> +       aspeed,lpc-io-reg = <0x97DE>;
>  };
>
>  &lpc_snoop {
> --
> 2.25.1
>
