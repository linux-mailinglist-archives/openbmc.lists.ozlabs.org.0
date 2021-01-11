Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4D92F0B6E
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 04:25:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDfGp0040zDqTZ
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 14:25:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=gPg/HQIi; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDfG36XZdzDqTZ
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 14:24:43 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id 19so13565192qkm.8
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2021 19:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8s7fbkRHR/4+pzKHGh644PddAWMtCuyDiX6cJe7SfwM=;
 b=gPg/HQIiZjNY1wTuk6a4TOx8PBkqQQ5yQf38muhB7jUc+CiQk2QBVBaBquFIshywqp
 GsB8gU1m0tym7Q7NtU9gQ9WtW6bkRNBxzJ7cPnVgOMVXj7nBiWGPvDBqZ9lGDGhTrpJt
 /TFZhAI2G4Itxtc+Ml0pHQNtitqlO/lTF7P9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8s7fbkRHR/4+pzKHGh644PddAWMtCuyDiX6cJe7SfwM=;
 b=HAl2XlnqqlVBDrtC6qvUDoYyA/db31qJf+AQ3imSmKhl/DnRWoHes7JalHU9z9aWRJ
 fgRsAdiqbRK65NN18fpY8pECk8+sDs/kS8SOIWy+0Znt/oegrWW28dAd2gHMklWPHrYj
 xVu93xdlrgjcO/pybRfwNcHV0tnuc/KLS5Uz3Njh7UqsxKayGxnPGO/hgxr9rwhUjBPr
 AFJJql2erwm3DKiacoq+iz8vNVPJSUfEI8NlSpz9MhkCYyrQAUR5ysBpsu+CEAj0CjEY
 5Ugs0Am8VXyHXh6muZvY6zWkdmG7WEJE7Xhz6hEqnYn8L/uWkmO9gq92IcyxIa0ycxGq
 BCuQ==
X-Gm-Message-State: AOAM531j6R/9vj+Li0nxbYaJuVo6MNY4ESaJoZfCZz1mJhtE7HNec6KP
 ghhAA/mch4dpYrbqUZOvMUorRO0yFuCWwZXU1mM=
X-Google-Smtp-Source: ABdhPJy6bjBfMQUQaxY4843RplyBRLG3bNf4D56LOpVQ1TNzF56DQgYRljXz5DlJX/MeXhG0Bu8snwpL5mspckVCzhk=
X-Received: by 2002:a37:6790:: with SMTP id
 b138mr14541733qkc.465.1610335481243; 
 Sun, 10 Jan 2021 19:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20201225015149.1416773-1-liuxiwei@inspur.com>
In-Reply-To: <20201225015149.1416773-1-liuxiwei@inspur.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Jan 2021 03:24:29 +0000
Message-ID: <CACPK8Xf+o54nmnHzdEAJ0Fx4cPnZr63_tu+zF8eJwe7w3=UpkQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: inspur-fp5280g2: Add ipsps1 driver
To: George Liu <liuxiwei1013@gmail.com>
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

Hi George,

On Fri, 25 Dec 2020 at 01:51, George Liu <liuxiwei1013@gmail.com> wrote:
>
> power-supply is compatible with Inspur's ipsps1 driver
>
> Signed-off-by: George Liu <liuxiwei@inspur.com>

I've merged both of these patches to dev-5.8.

Please ensure you submit them on the mainline mailing lists, to the
addresses provided by scripts/get_maintainer.pl.

Your two patches were not threaded as replies, so please ensure you
use git-send-email to send them together when submitting for mainline.

Cheers,

Joel


> ---
>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> index efe521538d70..07593897fc9a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> @@ -789,12 +789,12 @@ &i2c11 {
>         status = "okay";
>
>         power-supply@58 {
> -               compatible = "pmbus";
> +               compatible = "inspur,ipsps1";
>                 reg = <0x58>;
>         };
>
>         power-supply@59 {
> -               compatible = "pmbus";
> +               compatible = "inspur,ipsps1";
>                 reg = <0x59>;
>         };
>  };
> --
> 2.25.1
>
