Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0109765601E
	for <lists+openbmc@lfdr.de>; Mon, 26 Dec 2022 06:30:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NgRFv2ggMz3bhx
	for <lists+openbmc@lfdr.de>; Mon, 26 Dec 2022 16:30:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E4rnx8M1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E4rnx8M1;
	dkim-atps=neutral
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NgRFL2Scsz30R1
	for <openbmc@lists.ozlabs.org>; Mon, 26 Dec 2022 16:30:12 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id m129so3755208vsc.11
        for <openbmc@lists.ozlabs.org>; Sun, 25 Dec 2022 21:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wfePCWY7kCAFfHQDt2Ljvl5vkaoWhCvWxo6XlXpHRcg=;
        b=E4rnx8M1uH/uvT/1x5gFZiVC1oVlnPSzyYj2ueFEvpEQcd12/Z1hvVYUBaM0tAfhWh
         0SsbcGOmX+sfWbkcMEPt/7KAHq6+cXoyyZttKleFS58Dx5fO4o2cctLLdbsFoGkxJ+en
         ooA3Gy/po7TP3u6z+O4o4/uHfL023j7nwQQxyqU5160RjfV+LMx+aDRBXFisNVE2r+LQ
         FZX1jOI1ARTGU29X9QCc7oypa76w/ceRI/wkWfK61f/5TzZYP/Pp6LOzDRlVA49WV2r2
         k0yHlSEk+aVtaUi3jrhc86jA6oyQsTk0RW2V2ML54b2hkxPJ60eSZNhRLzpFeEgC8yeh
         PPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfePCWY7kCAFfHQDt2Ljvl5vkaoWhCvWxo6XlXpHRcg=;
        b=fHwViGJE7Up9HONdda7m1WzL0JOoQF8YY3jQrzvuI46gCfs+zLmKVLfdPyVf6LX3L3
         3EtA4rwdyu2XHFwJ+yUG4AvfABkFj9SaoCW25Fm1g/55z9U2eu9VxMn3oj4zYi/qJCXF
         a3HA2swrE4jObZJmyQ+GUhr1pmlxoFj1HZ90PjS82ba952IlH/BAo5Rg2C6jW2Y2LOCW
         AGEloQcaLvYXISpZmHvoF0wjvHDd3uYpX/N6Y7A3z/DxJgnZQBKpf5nSCcsZfxUfaJhC
         q996UX0MQtbBsbq055kOXyVeIz1kryN1ygTl/JnN/LTQYwd2fuRXWiaSMnfItxUo40H4
         WfKQ==
X-Gm-Message-State: AFqh2kpKNjFdZan4OpRRK9h8ItGdCwBAnUsipNHm+lH3yjfXGSXpNqcu
	pUFDHpHUy7THuyPxUIGFOzb/H1zIXbS536jdTQ0=
X-Google-Smtp-Source: AMrXdXtaONuDRw8PvTH0x82tSXAmRXNtUAmX79Zze9xSI1tuLTL+nK5LCpZq4iflhG0AWSqmiTpPaRvihrmcAjwcGFo=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr1900020vsb.10.1672032608637; Sun, 25
 Dec 2022 21:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20221223032859.3055638-1-milkfafa@gmail.com> <20221223032859.3055638-4-milkfafa@gmail.com>
 <Y6WniKjA6BHLknP6@zn.tnic> <CADnNmFqQ5_OQ-FiqdSZAtXFdG2X=qociXBykqL0TqtMw9r_=_A@mail.gmail.com>
 <Y6koIrTN2PYpQVGO@zn.tnic>
In-Reply-To: <Y6koIrTN2PYpQVGO@zn.tnic>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Mon, 26 Dec 2022 13:29:56 +0800
Message-ID: <CADnNmFp-ZdMpkKjTNcZcPBut6A20U577DxXW3ERtS86uK405mQ@mail.gmail.com>
Subject: Re: [PATCH v17 3/3] EDAC/npcm: Add NPCM memory controller driver
To: Borislav Petkov <bp@alien8.de>
Content-Type: multipart/alternative; boundary="000000000000b0d81405f0b46d89"
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
Cc: devicetree <devicetree@vger.kernel.org>, tony.luck@intel.com, rric@kernel.org, Benjamin Fair <benjaminfair@google.com>, linux-edac <linux-edac@vger.kernel.org>, CS20 KWLiu <KWLIU@nuvoton.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>, ctcchien@nuvoton.com, YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b0d81405f0b46d89
Content-Type: text/plain; charset="UTF-8"

> > And I was wondering if I should just remove the line break and let it
> stick out?
>
> The idea is to have the '?' and the ':' under each other so that one
> can visually immediately "parse" where each of the sides of the ternary
> statement start.
>

Get it, thanks.

>

--000000000000b0d81405f0b46d89
Content-Type: text/html; charset="UTF-8"

<div dir="auto"><div class="gmail_quote" dir="auto"><div dir="ltr" class="gmail_attr"><br></div><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; And I was wondering if I should just remove the line break and let it stick out?<br>
<br>
The idea is to have the &#39;?&#39; and the &#39;:&#39; under each other so that one<br>
can visually immediately &quot;parse&quot; where each of the sides of the ternary<br>
statement start.<br></blockquote></div><div dir="auto"><br></div><div dir="auto">Get it, thanks.</div><div class="gmail_quote" dir="auto"><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div>

--000000000000b0d81405f0b46d89--
