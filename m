Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD266EA5C0
	for <lists+openbmc@lfdr.de>; Fri, 21 Apr 2023 10:22:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2nb20Xn9z3fSh
	for <lists+openbmc@lfdr.de>; Fri, 21 Apr 2023 18:22:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e1lxKiom;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e1lxKiom;
	dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2nZT2xkrz3cK5
	for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2023 18:22:22 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-54fc1824f0bso15432437b3.0
        for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2023 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682065339; x=1684657339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjIeZlv8joDcavXmMJA/iStM74uHyiEJmIh+dhbFJlc=;
        b=e1lxKiomhiq6OgUkdsTDqyimhA+XbZC7icXSpwyRCCujy9ScACnc+JtJ3FRqMrin5Q
         CY3kKtJ4ZfDp0aBXVUk9jk0YpAL2YW+x4ibY8fl0obD8XYbrhVwRheuOVqpTk7wZUC3d
         Q8jrdvcZFb3UXICR19ZTYLZ1jS7FAzgQxV+hz1gELQ6YaR3tuv3qlasFctHU5JI0RiRQ
         WuvubI4zNX+2aQZ9HzRdhnzY0Y1BZBbsBQ68BqkuZe8JOYKG0IV/NkMrafJZYEUvTGT3
         1u7XH8JyNjyrELYMaYX2vZKtaJbPmJzqEieA4UBsl/Fx+bCDeaf/xiOWKqmAjwX8gv2P
         CSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682065339; x=1684657339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjIeZlv8joDcavXmMJA/iStM74uHyiEJmIh+dhbFJlc=;
        b=QjI87jA+ZL65pHHOyvB0C5bvkZHGM92VdOG8oyh4GFRJKMx1hwhwrdUPubMUKRWMAg
         yiUtjE+0udGzsEfxIPoNkCMzPn75fm+2zzlvHDPACSA24Fm8MG+d6UF0uUanTA4UdxQX
         gJ1G+QXqBSKDIaUCUc9svZuA993hasMORNFsL+nbRlZcMe3wVV4kMWfH6EJCuytn5gCR
         NN8RhL00UAYJP9nQvlg36latW3zHRoos/9LvCS17ZtRteF6jL97no2uVWP0+ViJV6OSm
         o4/XgHk51ifJgJ6x3Yl1ohaiBJwMey/7MxozQIsLdlTlDjhUx9YDiEfLcdFRnadNPldb
         8PXA==
X-Gm-Message-State: AAQBX9ewS+7S1eZEy6Fpjt/TOBeXFkDbD+5xpmjOkDKOWpj+BAVCZtc+
	zF8dj+svlRY+V/tQiEVxtgH2oyzvCUew0YFGS6F0jQ==
X-Google-Smtp-Source: AKy350ZKyNH8DHkFCPe+gfcXAXquLBtjdaQT/IE6wEIIMckQ9JzCDAhZi4XyD1IAPSWM97Zw9juf2VS2SyEvKkSClxE=
X-Received: by 2002:a81:bf49:0:b0:54f:c2ee:54a8 with SMTP id
 s9-20020a81bf49000000b0054fc2ee54a8mr1134764ywk.41.1682065338953; Fri, 21 Apr
 2023 01:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230412185049.3782842-1-j.neuschaefer@gmx.net>
In-Reply-To: <20230412185049.3782842-1-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Apr 2023 10:22:07 +0200
Message-ID: <CACRpkdZTYW9ze5VbCZodYUgcsTW4FiZMyxSKBhf3fg3s7DYm3w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: wpcm450: select MFD_SYSCON
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

On Wed, Apr 12, 2023 at 8:50=E2=80=AFPM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> The pinctrl-wpcm450 driver relies on MFD_SYSCON functionality in order
> to find some of its MMIO registers. Select MFD_SYSCON from
> PINCTRL_WPCM450 to ensure that it's enabled.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Patch applied!

Yours,
Linus Walleij
