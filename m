Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E316210F1
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 13:39:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N672V0wpWz3bhl
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 23:39:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fT8seVgK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fT8seVgK;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N671v1fyZz2xZp
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 23:38:40 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id a67so22223446edf.12
        for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2022 04:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pp912HVrz8PqeqrIKxFaWb4AiWSWox5YDDgMFHPmw2I=;
        b=fT8seVgK9bU5hhV0c1eskjhpB0FevCgnCy8pftrVzfK70NUDvTTkkxCeovS2keCrBJ
         simvZinIAJkgm2Khx4iauiUiibeXXuG9Vb7yl4wbFJaVe1QzMFUMIg19/on4/8m/McMX
         txrjqg8xGkRMBzaI/bz2OSVvTSgGYrZuz9vR0d2sdAR1iE8zQz/DrjwP37B5x3iYHu1z
         HAGgFXeukgLNzMyQrXNydxssDT4f6oLGYSG5jXVbNN3jkyPAt8LyWhFbn7x5vGl/bpTl
         Eu5hlMX9BdB/FEwdYk4nfL8GHlN/4PNMIpGg/cKlo/Vl0sqlQd/keitmwcFeQB7n1+hl
         dDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pp912HVrz8PqeqrIKxFaWb4AiWSWox5YDDgMFHPmw2I=;
        b=F3STC9crUALrg1ukfL1yM6y8cUte3ihU9Ue1KzNk0e/PZ4TrY5uTaBS0sbCvPFvc+U
         eU2OjvLDtcuBzrLJkJSCy0stFPqyxoD2DMpcyeWi72zX75ID7UCWzreFdEcbMKIkMgYV
         3VeN7xyMhaD7Tu0xhAk1FHwMisPAGyuy6s6Nlgo3ZeQk+A4fOkKSFbzq7RcjzQ8BhZpc
         E38HSVNMWcJIkQ8h6U4x4hZinuZhW3Xp+2LtroJxmWBeGUBx/ZbHkBF9AUqTBEWiLsgN
         LnunsCYEdFLx8lyGgSmLFPhgQB80uhYlqt8HRuiBmYmcxS9aPXecTYl86dJcLoHvkcAr
         Itsw==
X-Gm-Message-State: ACrzQf2pBHXoDQXWpGnLZe/l5TjLLpmL1u0Vo0M6J82pkXzmuHxdUFgG
	vIuES80N8JBUjjyb4EmbkbE7sfNhMAAzFpFr1asDOg==
X-Google-Smtp-Source: AMsMyM7s/Ou7mr76f9+OCLr5c/BlN+EsbPvkdWYDvue+wN+/babtSWv5nwImIBMViqAKc+ZB57fZdWwcRbGv9OqMtWQ=
X-Received: by 2002:aa7:c718:0:b0:462:ff35:95dc with SMTP id
 i24-20020aa7c718000000b00462ff3595dcmr54220395edq.32.1667911115139; Tue, 08
 Nov 2022 04:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20221031222833.201322-1-j.neuschaefer@gmx.net>
In-Reply-To: <20221031222833.201322-1-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 13:38:23 +0100
Message-ID: <CACRpkdYkhvChags5H7zT3MOzUTqxPzpEyg9fVpckBOZVXwG1gg@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] pinctrl: nuvoton: wpcm450: Convert irqchip to IRQCHIP_IMMUTABLE
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 31, 2022 at 11:28 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Commit 6c846d026d490 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning for irqchips that are not marked with
> IRQCHIP_IMMUTABLE.
>
> Convert the pinctrl-wpcm450 driver to an immutable irqchip.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>
> v3:
> - Switch from raw d->hwirq to irqd_to_hwirq(d)

Patch applied!

Yours,
Linus Walleij
