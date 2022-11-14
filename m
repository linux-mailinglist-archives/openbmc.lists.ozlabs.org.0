Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD25628FE7
	for <lists+openbmc@lfdr.de>; Tue, 15 Nov 2022 03:28:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NB97z0dxjz3cLF
	for <lists+openbmc@lfdr.de>; Tue, 15 Nov 2022 13:27:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JWXBYlbE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JWXBYlbE;
	dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9jPn5TC7z2y35
	for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2022 19:38:20 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id k4so6954971qkj.8
        for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2022 00:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rl0S7SZImNPA7fsarWyNdeE6Xw1pskJEOYN6VZ4/w6c=;
        b=JWXBYlbE4IZKFyU7cw1JN3toiIDiM1j+J3ieeSimAiGQ4kd12a937qiszUalLrQfPS
         YvanZzk1s4u+vk1tnUQHTjtm31F5Er6hkj8b/o003eo/EfY2mLlFXFqM3GtXhw1v5y+w
         Fisdq0lXuBINRAuLETi3i8S7sZn8voF1wloajCIP7wDqM5pp0QU+BU1TlPNSJu4aJJsC
         vIFCU2OY5uixYSPYcoDcwPBXWXImlFg6kSITqvg8YlJ8GWRbgDX57EI32Otp6uWPmkX2
         owluFVRM5m8w6L9ARkMtn/dHpHVwLgGYvGHTmrD1ayzsOKASDREBksWU9EZSVdvDWaLQ
         zZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rl0S7SZImNPA7fsarWyNdeE6Xw1pskJEOYN6VZ4/w6c=;
        b=5zOpniEu63ZE2Xk2C07/rCRlkBp2/5FgRT1f+jTltpCk/8CcLdVLeopSLA3JwTVFe/
         U21Y1h3aCX2F4azg2rhMvZ/Yrud0dVOe4qq1DnOpJdRH9f5YBLkwgyyWwjNETa9sqfpq
         su+9blf1TZ5J7M4tmihmYbFcN9hb1HMQUHczpbU55tSI3AZ+jZ0h8auDyfXWWzh/A5Fq
         BqDyuRVMOI1vjXmEfGvnsrk1bviviHHtfdsxseCqjnOpF4XJRv0PPmLTCf5iyinO1Hmj
         GLRiKM8rYaLH+n1jVEjmgdivZW8UyKhfE7GVPmZgd7gAxQnCIuDdStFSIrbomYBP0Ez+
         63yw==
X-Gm-Message-State: ANoB5pnck+94etoul+zxKYIHDXiwjjwtguqrCZRGj0Ilu9zyZ2N6AXKZ
	FZOcZAh7nFRnF9FohKs5x+LbCWZKrT19T9cPzos=
X-Google-Smtp-Source: AA0mqf7cf8gdzo9nrxZ91+TyMP8G5BnW5MpjVlq6lMOFmBqbhSn3NamN9nkudtDhBrmQeYl4pyZ46hsJmmpXLKshPm8=
X-Received: by 2002:a05:620a:1094:b0:6fb:4a84:cef2 with SMTP id
 g20-20020a05620a109400b006fb4a84cef2mr9923232qkk.158.1668415097229; Mon, 14
 Nov 2022 00:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20221108092840.14945-1-JJLIU0@nuvoton.com> <20221108092840.14945-4-JJLIU0@nuvoton.com>
 <CACRpkdb+Bkwa8yCKGtRcsJ6KnJh+RUuz_gOrQV63pcYQLaHCaw@mail.gmail.com>
 <CAKUZ0+GCf_Zv=VhnY5Z=yYAfR1=_ha98BVVxRGVy8ui6so_Yrg@mail.gmail.com> <CACRpkdYW0P8gqtGdiRX_frP32WF2W=NVg1JTu1fVMBXxEL0-WA@mail.gmail.com>
In-Reply-To: <CACRpkdYW0P8gqtGdiRX_frP32WF2W=NVg1JTu1fVMBXxEL0-WA@mail.gmail.com>
From: Jim Liu <jim.t90615@gmail.com>
Date: Mon, 14 Nov 2022 16:38:06 +0800
Message-ID: <CAKUZ0+Hy5suFg9VZ8-+cH7kGc5KLqUnf9hjnT+iaw+a1HF8x0A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: gpio: Add Nuvoton NPCM750 serial I/O
 expansion interface(SGPIO)
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 15 Nov 2022 13:27:31 +1100
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, brgl@bgdev.pl, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Linus

Thanks for your reply.

let me explain the gpio pin as below:

Our sgpio module has 64 pins output and 64 pins input.
Soc have 8 reg to control 64 output pins
and  8 reg to control 64 input pins.
so the pin is only for gpi or gpo.

The common property ngpio can be out or in.
so i need to create d_out and d_in to control it.
customers can set the number of output or input pins to use.
the driver will open the ports to use.
ex: if  i set d_out=9   and d_in=20
driver will open two output ports and three input ports.

Another method  is the driver default opens all ports , in this
situation the driver doesn't need d_out and d_in.


Best regards,
Jim



On Fri, Nov 11, 2022 at 10:20 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Nov 11, 2022 at 10:30 AM Jim Liu <jim.t90615@gmail.com> wrote:
>
> > -D_out:
> > the output data is the serial data needed to connect to hc595 and the
> > data will output to hc595 parallel pins.
> > you can use dts nout_gpios to create the number of pins.
> >
> > -D_in
> > this pin need to connect to hc165 and get the serial data from hc165.
> > you can use dts nin_gpios to create the number of pins.
>
> In the example it seems you enable d_out and d_in for *all* 64
> pins, correct? So they are all either input or output.
>
> That in effect turns them into GPIOs, so I don't see the problem
> with simply always doing this?
>
> Just that things are configurable doesn't mean we always need
> to provide means to configure them.
>
> If you have a use case where the user wants to control this, then
> that is another thing. Otherwise just make all pins input and output
> and wait for a usecase that needs more control, maybe it will
> never appear.
>
> Yours,
> Linus Walleij
