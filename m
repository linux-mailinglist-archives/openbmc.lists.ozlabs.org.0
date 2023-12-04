Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BF8039FB
	for <lists+openbmc@lfdr.de>; Mon,  4 Dec 2023 17:19:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkTQ25kXWz3dFr
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 03:19:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.176; helo=mail-yw1-f176.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkTPj1qbrz3cTj
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 03:19:04 +1100 (AEDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5d8a772157fso9722067b3.3
        for <openbmc@lists.ozlabs.org>; Mon, 04 Dec 2023 08:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701706742; x=1702311542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7w+3vK1cdmy3dgE8i5YLvNj03CSI+W7QHOKK1BsUDk=;
        b=FjKkNlWDwgkrfBb/J0d/+UhnvMozMHBmKdy81WlsUOPIJvajAEe9N67PDqNPU2Iwq+
         BZw5uAF2DKymKwHZkVs6PP3EHDTOAyk7yvNjtu6bSP5CbOaR8dQ509WWBfRGxTMxr6ld
         tRZvQzs2aiz9b+SOgQ4iv/Snk9nmkCGQbqKNkVNhZnGDiPP4HGmFRXAJxACMlG5X/ZvM
         OzQjDOemYjrI/pPcf6TWPCjJEPcVofL0uAEH+WVLMNRfyLbGFOB8HN+GUMC+9ZeKhF9B
         bOkFQSfqRIRURBmeUwBjG/BO7oyrMFl3f9ukp9ALZ6L/hXIEN3oJ5NPgoPk7sLgNI+Kx
         r5EQ==
X-Gm-Message-State: AOJu0YxDnqcIGkOChldAStiYA3qV1PBRVfOR1+3ej4ImjHR37r4LHTgY
	Pg3K8xqNCJBJYXcqPALfEJpPpSQWA/13Ng==
X-Google-Smtp-Source: AGHT+IGLU1OyxxCl9F7gOZ+gIqZauD8jgBaZEykRlAA+wtQgKXBFwGRmrf1iCbfBdhLcCI+h2JcKhA==
X-Received: by 2002:a81:7904:0:b0:5d7:1941:ac0 with SMTP id u4-20020a817904000000b005d719410ac0mr3118728ywc.91.1701706742007;
        Mon, 04 Dec 2023 08:19:02 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id v127-20020a818585000000b00583b144fe51sm3433748ywf.118.2023.12.04.08.19.01
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:19:01 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5cfc3a48ab2so48421197b3.0
        for <openbmc@lists.ozlabs.org>; Mon, 04 Dec 2023 08:19:01 -0800 (PST)
X-Received: by 2002:a81:9808:0:b0:5d3:464d:18d4 with SMTP id
 p8-20020a819808000000b005d3464d18d4mr3058167ywg.21.1701706740819; Mon, 04 Dec
 2023 08:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com> <20231204160033.1872569-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231204160033.1872569-2-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Dec 2023 17:18:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU58NjjdOOLA_T1jr1u=H+2eVN69f1FDc6GhiXEenaxLw@mail.gmail.com>
Message-ID: <CAMuHMdU58NjjdOOLA_T1jr1u=H+2eVN69f1FDc6GhiXEenaxLw@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] pinctrl: renesas: Mark local variable with const
 in ->set_mux()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 4, 2023 at 5:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> We are not going to change pins in the ->set_mux() callback. Mark
> the local variable with a const qualifier. While at it, make it
> also unsigned.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
