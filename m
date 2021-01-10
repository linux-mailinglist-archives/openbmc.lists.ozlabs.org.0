Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6962F0664
	for <lists+openbmc@lfdr.de>; Sun, 10 Jan 2021 11:21:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDCYm3lg3zDqNX
	for <lists+openbmc@lfdr.de>; Sun, 10 Jan 2021 21:21:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::131;
 helo=mail-il1-x131.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s0Q4jUgX; dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDCXV4fJYzDqM4
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2021 21:20:35 +1100 (AEDT)
Received: by mail-il1-x131.google.com with SMTP id q1so15194692ilt.6
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2021 02:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s2e3i6ekxjqpU6/uYaJIRv9nQC6V3zhYxhm4oqeJjAM=;
 b=s0Q4jUgXrr7RDyOyccXZM+LpdpxQbPp7MO9SMPskkzLjtRZ+6vRpKUvhCGP5sn6V5n
 9HRe/hfl9wuTN5lhB/ZbJZ7kZ0R888lcj7kbk5YQC/U43PhXDnaFzStaYKQWNNoULrx7
 X11SlQTD06dYe/cQaEs9PPWwZbiLWzctra8eIJZ5LVOkdWQntAT6fbMfGEE+hqueC3Pw
 ehBY5MuuVPHI4WEwAppDg7Hv/3kCZ4dEPYGsxoZDRnBHQbyIEnu4AtxTYSsEZkz8DOnZ
 /ZGzLVLZjDJ9/ppEVkfxR/kjRsTRB0XCtcO966+NS1Ig1aM59Ht/daTBbKyi2Jud6Oa4
 WAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s2e3i6ekxjqpU6/uYaJIRv9nQC6V3zhYxhm4oqeJjAM=;
 b=Qvac+a+e2+FCSGpioIcwOgPXzcR8JAGp6edZanX7aA5TqWoU0neTjNClIZvJRA3cnR
 cHq/X8ecKSuuxL9kkAEoNm0d3GJdqWKljn9epo/yz8EDXruDD7Nv+6gZlsQQOER03Q7e
 efcmX7/CApl0EbA/wRevfO1B6xXuTOKEmRcLxFCnD6XfgWuq1TjIplicYcTcdgTkDE+Z
 aoEQZEMHwoV7xhsDYkiaUxYI6QV4BDK7rM33kiQ9vWRXVxU9UEVrYSmynAxiMBM9Z5KE
 s58EU37w42Q0dR2mHh8qpBatTkqBJOaRM0LTTNvxXB3tuU6Rchlix28ArhPixwc8dlzK
 eV2A==
X-Gm-Message-State: AOAM530AfJdhfb0IKsBw8sT40monE2uCTUmdgcVgP30ocS7Q6Xw+Az6j
 TGh8iiS9I6eyDLboP/13yaDJE/8+8XUOKPGbFw==
X-Google-Smtp-Source: ABdhPJxpAMRH1U7W5ODkByqNOQv/TK3JjpYyqjXOM5f3V5yVKUAJYIiXwpbaDWICmirUML3j/AdxTIxbWpmsctpgzM0=
X-Received: by 2002:a92:6512:: with SMTP id z18mr11172342ilb.220.1610274032127; 
 Sun, 10 Jan 2021 02:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20210108163004.492649-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210108163004.492649-1-j.neuschaefer@gmx.net>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 10 Jan 2021 12:19:55 +0200
Message-ID: <CAKKbWA7Zx-Jq8c=ExE5SY_H--vk5+TqhTRCJig=7xq1smnKS-Q@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: nuvoton: Clarify that interrupt of
 timer 0 should be specified
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 8, 2021 at 6:30 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> The NPCM750 Timer/Watchdog Controller has multiple interrupt lines,
> connected to multiple timers. The driver uses timer 0 for timer
> interrupts, so the interrupt line corresponding to timer 0 should be
> specified in DT.
>
> I removed the mention of "flags for falling edge", because the timer
> controller uses high-level interrupts rather than falling-edge
> interrupts, and whether flags should be specified is up the interrupt
> controller's DT binding.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by Avi Fishman <avifishman70@gmail.com>
> ---
>
> v2:
> - Fix a typo in the word "watchdog"
> ---
>  .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt        | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-time=
r.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> index ea22dfe485bee..97258f1a1505b 100644
> --- a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> @@ -6,8 +6,7 @@ timer counters.
>  Required properties:
>  - compatible      : "nuvoton,npcm750-timer" for Poleg NPCM750.
>  - reg             : Offset and length of the register set for the device=
.
> -- interrupts      : Contain the timer interrupt with flags for
> -                    falling edge.
> +- interrupts      : Contain the timer interrupt of timer 0.
>  - clocks          : phandle of timer reference clock (usually a 25 MHz c=
lock).
>
>  Example:
> --
> 2.29.2
>


--=20
Regards,
Avi
