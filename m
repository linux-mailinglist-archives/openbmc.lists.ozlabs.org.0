Return-Path: <openbmc+bounces-1375-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPGfLi4qk2kI2AEAu9opvQ
	(envelope-from <openbmc+bounces-1375-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 15:31:10 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C6C144B16
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 15:31:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF4vZ14nxz2xlq;
	Tue, 17 Feb 2026 01:31:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1129" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771252266;
	cv=pass; b=PCaj/OSzVxBp6T9ueegN9gFgpiISzTmnER/i8ki8bOtYU1Cp7Oer6l9BK5RzIF/Nlx8vNC+LBi7hMD0hRpECchfKegfIuAgTlC21cZj6FA/7jOhQQebTZx64giJiTwyC9RbOOVvInh7131VJA8VT8ePxkuk9GmowRQziqH1ISjVE9Ofv3f4bAQ963Q6sQmPHna5nD+1NBb33+RNIzTHZrXLE8uTEeaNmlatLTwR6ZGCytfNu6noB85gFCdX1N7uN9hMSjY5fopX2m90oVpfpq4c/31sTfIaRREXeIQKUm9aE3V9tGcS2LzDv+mK3K8eoFOf6Yb5nWN/QJlqzupWkeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771252266; c=relaxed/relaxed;
	bh=Zcnb0fPIicdElGHFGIJVE7FSZTQ1ipIrDebuWInUFcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JNPHSTK6OMIjfKN4IFn02tHaxv3jZlaIBa0EZM2U089Cg9m2pzXbANzj9z8iTy/naIUuiuMNb5q5JwAa2Ye2SWP9ZXxLt/+9epqnNWFhFGPVoWnBD/wvq0RDc0j+ruEFsC/OvbziSbKAqtKurCxAS6r481HVThcEVpqCthUE2F+4xeBbQuxePc526gUELFsdvaugF76BQZe356yGd+hKe7nXQ+YARbSLDHcAmpjuYErj9IllxF+r5Fw+FYISc64uhP9JgBw7Z9C1OpGAcN41cDLs61JhocAHsgk1KtsZWxLDta/QnUvVfpw/ISz/YX5Iwq58rkV6vNF4na5qj/Z+cQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WsFPuaDT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WsFPuaDT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF4vW3Kxgz2xVT
	for <openbmc@lists.ozlabs.org>; Tue, 17 Feb 2026 01:31:02 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-797d3864d89so5908227b3.1
        for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 06:31:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771252259; cv=none;
        d=google.com; s=arc-20240605;
        b=XHhCSol+GNUs2C+SQkIZwbBLW2k33pwjPF3pn9VEz13vHDed+7pcMbOai/piJBE4Y0
         UkSjgbWun8yt9UZjdSEA2yNIn/LtBL9z0BwRTLiBOw32Mnw+xnzeQQgO5ezAohrehWJE
         cYSNyFEED4TinHUf1LW0JkCEd1M+hTeU8GXwt0ppxMSfiVNti7urylzrHdScz7ExmVN6
         A7BrbIvxCkDp7KSTbRGeUC48EJA9Lm4fUCOFk0eaSyRor380FQSTNzh9A8To9ohlMXAJ
         LuxijC6G6LEFOWgfyxR/XfrsEczNBLZD96OcdNgFiwnN+l2ueTGU9JiY0OhOd+8SXN90
         madQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zcnb0fPIicdElGHFGIJVE7FSZTQ1ipIrDebuWInUFcA=;
        fh=5Zc/FYoRRou6K3ck8zKvwSQ9nQYp/zsYjyEH5HDsXeM=;
        b=I+89BwSShWnHI/Mn60uwEK+Qynt8xe2Ez5LOdo98KpSZsGiVHkBWbPCNBIZO62EDS1
         EP7zMTW0ZqeUJGEklLXSuByV62QeFlg8qZekYcaXIGp3NiCUziasL8HORBlE6RICliSJ
         27tmO/3BJi7JC+bugXBrBppONyzNrA7JOZXmZl00QXQ3smGaaCtJ/Kjl6QUtgE2HhkCg
         JYuTigvNz63DZ3yvc9USDJh06BvgEDJb6IkHDINU2TVwvpVN9x+HpV+u64jVu1HhI7Gv
         zUl2v7Dle4JsMUwLT6DmSGeDqlIp7xal8lOSHZr3xOuztAYJKZE4GUMkS7dmoxTOAXZ5
         zICw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771252259; x=1771857059; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zcnb0fPIicdElGHFGIJVE7FSZTQ1ipIrDebuWInUFcA=;
        b=WsFPuaDTQMQotFB7GBnYruvjre/z53J/+TO9Ls27+skX60ZaRCTJO/tQfoYTfYAlaZ
         qlAyh2+JpV0TaiBU9pS9ulAU2Ks1puE0xJK5fsx/avaHIWcUaI+4Fit8Eu7ScB/wwV5n
         9OuUqgEZgVSbfEr/2ASJ7jshnt+d8N+sxl7D0vSB8XTV3DRtqS/R26Ye1TcqjFNUd+4M
         h2EfvvVfOVrRIGzvnIwhp1BUV+WXqxJM91+Rw8lrI4pN3gkvfpLCLHK4DVfqGdsWv1Hz
         rpDrGFyaRePcTxe1Cb+WBfNT5J05A3eLoyhayvKS0lub0+FBNs7RJmuJbasOUQ7nGjil
         brnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771252259; x=1771857059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zcnb0fPIicdElGHFGIJVE7FSZTQ1ipIrDebuWInUFcA=;
        b=kceiElP1Bg+q55N4YuLtlcRntuZFd/kaFxHtRJwv/uF+lpottOzC4PWzHIxDXot3t6
         ykV/gbucu9WcgF07qYPqR3+rFYPcfAZJ63lOvxC9wBDpm8RD8swpLlUJ2kFO61QBoRaY
         yPKxbekvge1TYy8RsI5SOoCkfWu1VDDXCoJgtsuvVhbsfiI4xhhHMkij5Q/1lTq0Fbnb
         8eI3v9RVEkpOwxjTTNudIRY0/0czoi5IifN2DcplmjcWtds9uqM9GDWLW8onaS9vUUV3
         alBcN1PBGmqjz+kCWniVwApjuuHKn4NOULo66CWfqicbTPUjR7oZ3QiCChk6KZvuzFkc
         01qw==
X-Forwarded-Encrypted: i=1; AJvYcCXUwoIzn/+EZLKCpvz8vroVa4vYXFdlhS5jKE1kHpRJvST33qFFvtiKmB5dbOxbbggaKMBSbar6@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlgwDb2FX1cMlfb+Jlk82ccCPDjQy5q7wPgMTh44aTmwhDQYVx
	0gzi/v+5kvrZ5ARrjBxuY8+z7euQE8i2f4NAcRH6YkNpOfOTndvlL8wHN+3BqhM1nvyrm4O5bPw
	tThHWdPSbVzivQylxNhAULI2QTMSubVk=
X-Gm-Gg: AZuq6aIGxLlT3XZp7IrY6SUL9Kq8+X829qdhCm7MVwDRG9MyE8SFtoa6EkDiuxmk5B9
	Gyt0Zp6gLEHEzf8vX1JR+TjUpz8NhbQ33qEEJ9BYkOhlrPi1nKzqkIymSxMl5Xj6uaKl8YlVlmI
	bReAAxZgPT7WUTlJZ+6O/YlJlephY87G8gmL63uVW+/8r696STwUDHD11Vyz2cvYU+hlVKT5WLt
	sh7CBdDF8hjdLWErsirDPcEhm3Frdn/adh0dWpg6IJCRF6Took53yxh8+owoaKbH6E1+iGWj0WB
	o4g8ImE/
X-Received: by 2002:a53:b118:0:b0:649:bdfa:6350 with SMTP id
 956f58d0204a3-64c21a99fd4mr4764415d50.31.1771252259016; Mon, 16 Feb 2026
 06:30:59 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260210133843.1078463-1-tmaimon77@gmail.com> <20260210133843.1078463-3-tmaimon77@gmail.com>
 <e946baf7-4c3e-42a6-9cd2-a4b917ce09bf@roeck-us.net>
In-Reply-To: <e946baf7-4c3e-42a6-9cd2-a4b917ce09bf@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 16 Feb 2026 16:30:46 +0200
X-Gm-Features: AZwV_QhedHuhI5V_696gzsk3Ev0eFoOIo452jTyfngk114Fy2_pi9LfClBPYzSg
Message-ID: <CAP6Zq1gGVB+hk+=xSRyPgddq07F_B+oE-dc246JRW2_waoe_bg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] watchdog: npcm: Add reset status support
To: Guenter Roeck <linux@roeck-us.net>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com, tali.perry1@gmail.com, 
	wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, joel@jms.id.au, openbmc@lists.ozlabs.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000b4d51b064af1cd93"
X-Spam-Status: No, score=0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-1375-lists,openbmc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,gmail.com,linux-watchdog.org,kernel.org,google.com,jms.id.au,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,wdd.info:url]
X-Rspamd-Queue-Id: D0C6C144B16
X-Rspamd-Action: no action

--000000000000b4d51b064af1cd93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thanks for your review.

From your comments and from Krzysztof=E2=80=99s earlier feedback, I underst=
and that
I cannot use Device Tree properties to describe software behavior, and DT
should only describe hardware.

Given that, I am trying to understand what would be the correct upstream
way to expose the different reset causes that the GCR reports. The watchdog
framework provides only a few standardized bootstatus flags, and I would
like to check whether it is acceptable to map the different reset causes
into these existing flags.

For example, conceptually:

   - WDIOF_CARDRESET =E2=86=92 power=E2=80=91on reset
   - WDIOF_OVERHEAT =E2=86=92 core reset
   - WDIOF_FANFAULT =E2=86=92 watchdog reset
   - WDIOF_EXTERN1 =E2=86=92 SW0 reset
   - WDIOF_EXTERN2 =E2=86=92 SW1 reset
   - WDIOF_POWERUNDER =E2=86=92 SW2 reset
   - WDIOF_POWEROVER =E2=86=92 SW3 reset

Is such a mapping acceptable?

Any guidance on the expected upstream approach would be greatly appreciated=
.

Thanks,
Tomer


On Tue, 10 Feb 2026 at 18:02, Guenter Roeck <linux@roeck-us.net> wrote:

> On 2/10/26 05:38, Tomer Maimon wrote:
> > Add reset status detection for NPCM watchdog driver on both NPCM7XX and
> > NPCM8XX platforms. Implement GCR register integration via syscon for
> > reset status detection and configurable reset type mapping via device
> > tree properties.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >   drivers/watchdog/npcm_wdt.c | 110 +++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 110 insertions(+)
> >
> > diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> > index e62ea054bc61..ebece5d6240a 100644
> > --- a/drivers/watchdog/npcm_wdt.c
> > +++ b/drivers/watchdog/npcm_wdt.c
> > @@ -12,9 +12,25 @@
> >   #include <linux/platform_device.h>
> >   #include <linux/slab.h>
> >   #include <linux/watchdog.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +
> > +#define NPCM7XX_RESSR_OFFSET 0x6C
> > +#define NPCM7XX_INTCR2_OFFSET        0x60
> >
> >   #define NPCM_WTCR   0x1C
> >
> > +#define NPCM7XX_PORST        BIT(31)
> > +#define NPCM7XX_CORST        BIT(30)
> > +#define NPCM7XX_WD0RST       BIT(29)
> > +#define NPCM7XX_WD1RST       BIT(24)
> > +#define NPCM7XX_WD2RST       BIT(23)
> > +#define NPCM7XX_SWR1RST      BIT(28)
> > +#define NPCM7XX_SWR2RST      BIT(27)
> > +#define NPCM7XX_SWR3RST      BIT(26)
> > +#define NPCM7XX_SWR4RST      BIT(25)
> > +#define NPCM8XX_RST  (GENMASK(31, 23) | GENMASK(15, 12))
> > +
> >   #define NPCM_WTCLK  (BIT(10) | BIT(11))     /* Clock divider */
> >   #define NPCM_WTE    BIT(7)                  /* Enable */
> >   #define NPCM_WTIE   BIT(6)                  /* Enable irq */
> > @@ -45,6 +61,9 @@ struct npcm_wdt {
> >       struct watchdog_device  wdd;
> >       void __iomem            *reg;
> >       struct clk              *clk;
> > +     u32                     card_reset;
> > +     u32                     ext1_reset;
> > +     u32                     ext2_reset;
> >   };
> >
> >   static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wd=
d)
> > @@ -185,6 +204,95 @@ static const struct watchdog_ops npcm_wdt_ops =3D =
{
> >       .restart =3D npcm_wdt_restart,
> >   };
> >
> > +static u32 npcm_wdt_reset_type(const char *reset_type)
> > +{
> > +     if (!strcmp(reset_type, "porst"))
> > +             return NPCM7XX_PORST;
> > +     else if (!strcmp(reset_type, "corst"))
> > +             return NPCM7XX_CORST;
> > +     else if (!strcmp(reset_type, "wd0"))
> > +             return NPCM7XX_WD0RST;
> > +     else if (!strcmp(reset_type, "wd1"))
> > +             return NPCM7XX_WD1RST;
> > +     else if (!strcmp(reset_type, "wd2"))
> > +             return NPCM7XX_WD2RST;
> > +     else if (!strcmp(reset_type, "sw1"))
> > +             return NPCM7XX_SWR1RST;
> > +     else if (!strcmp(reset_type, "sw2"))
> > +             return NPCM7XX_SWR2RST;
> > +     else if (!strcmp(reset_type, "sw3"))
> > +             return NPCM7XX_SWR3RST;
> > +     else if (!strcmp(reset_type, "sw4"))
> > +             return NPCM7XX_SWR4RST;
> > +
> > +     return 0;
> > +}
> > +
> > +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device
> *dev)
> > +{
> > +     const char *card_reset_type;
> > +     const char *ext1_reset_type;
> > +     const char *ext2_reset_type;
> > +     struct regmap *gcr_regmap;
> > +     u32 rstval, ressrval;
> > +     int ret;
> > +
> > +     gcr_regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node,
> "syscon");
> > +     if (IS_ERR(gcr_regmap)) {
> > +             dev_warn(dev, "Failed to find gcr syscon, WD reset status
> not supported\n");
>
> A warning is quite strong here, given that this is new code and the
> syscon reference may not exist in existing devicetree files. notice
> should be good enough.
>
> > +             return;
> > +     }
> > +
> > +     ret =3D of_property_read_string(dev->of_node,
> > +                                   "nuvoton,card-reset-type",
> > +                                   &card_reset_type);
> > +     if (ret)
> > +             wdt->card_reset =3D NPCM7XX_PORST;
> > +     else
> > +             wdt->card_reset =3D npcm_wdt_reset_type(card_reset_type);
> > +
> > +     ret =3D of_property_read_string(dev->of_node,
> > +                                   "nuvoton,ext1-reset-type",
> > +                                   &ext1_reset_type);
> > +     if (ret)
> > +             wdt->ext1_reset =3D 0;
>
> wdt is zero-allocated, so setting those variables to 0 is not necessary.
>
> > +     else
> > +             wdt->ext1_reset =3D npcm_wdt_reset_type(ext1_reset_type);
> > +
> > +     ret =3D of_property_read_string(dev->of_node,
> > +                                   "nuvoton,ext2-reset-type",
> > +                                   &ext2_reset_type);
> > +     if (ret)
> > +             wdt->ext2_reset =3D 0;
> > +     else
> > +             wdt->ext2_reset =3D npcm_wdt_reset_type(ext2_reset_type);
> > +
> > +     regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &rstval);
>
> This warrants an explanation/comment: Why is it not necessary to check
> the return value of the regmap operations ?
>
> > +     /* prefer the most specific SoC first */
> > +     if (of_device_is_compatible(dev->of_node, "nuvoton,npcm845-wdt"))=
 {
> > +             regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
> > +                          rstval & ~NPCM8XX_RST);
> > +     } else if (of_device_is_compatible(dev->of_node,
> "nuvoton,npcm750-wdt")) {
> > +             if ((rstval & NPCM7XX_PORST) =3D=3D 0) {
> > +                     rstval =3D NPCM7XX_PORST;
> > +                     regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
> > +                                  rstval | NPCM7XX_PORST);
>
> That "| NPCM7XX_PORST" is pretty pointless here since rstval was
> just set to that value.
>
> > +             } else {
> > +                     rstval =3D 0;
> > +             }
>
> Another comment needed: This negates NPCM7XX_PORST and otherwise clear
> rstval. The reason is not immediately (or, rather, at all) obvious.
>
> > +             regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &ressrval);
> > +             rstval |=3D ressrval;
> > +             regmap_write(gcr_regmap, NPCM7XX_RESSR_OFFSET, ressrval);
> > +     }
>
> If the device is not compatible to either chip, retval is just passed
> on and nothing is written to the chip. That warrants another comment.
>
> [ Yes, I see that the driver does not currently support another chip.
>
> > +
> > +     if (rstval & wdt->card_reset)
> > +             wdt->wdd.bootstatus |=3D WDIOF_CARDRESET;
> > +     if (rstval & wdt->ext1_reset)
> > +             wdt->wdd.bootstatus |=3D WDIOF_EXTERN1;
> > +     if (rstval & wdt->ext2_reset)
> > +             wdt->wdd.bootstatus |=3D WDIOF_EXTERN2;
> > +}
> > +
> >   static int npcm_wdt_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev =3D &pdev->dev;
> > @@ -208,6 +316,8 @@ static int npcm_wdt_probe(struct platform_device
> *pdev)
> >       if (irq < 0)
> >               return irq;
> >
> > +     npcm_get_reset_status(wdt, dev);
> > +
> >       wdt->wdd.info =3D &npcm_wdt_info;
> >       wdt->wdd.ops =3D &npcm_wdt_ops;
> >       wdt->wdd.min_timeout =3D 1;
>
>

--000000000000b4d51b064af1cd93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-family:&quot;Segoe UI&quot;;font-size:1=
4px;line-height:20px"><p>Hi Guenter,</p>
<p>Thanks for your review.</p>
<p>From your comments and from Krzysztof=E2=80=99s earlier feedback, I unde=
rstand that I cannot use Device Tree properties to describe software behavi=
or, and DT should only describe hardware.</p>
<p>Given that, I am trying to understand what would be the correct upstream=
 way to expose the different reset causes that the GCR reports. The watchdo=
g framework provides only a few standardized <code>bootstatus</code> flags,=
 and I would like to check whether it is acceptable to map the different re=
set causes into these existing flags.</p>
<p>For example, conceptually:</p>
<ul>
<li><code>WDIOF_CARDRESET</code> =E2=86=92 power=E2=80=91on reset</li>
<li><code>WDIOF_OVERHEAT</code> =E2=86=92 core reset</li>
<li><code>WDIOF_FANFAULT</code> =E2=86=92 watchdog reset</li>
<li><code>WDIOF_EXTERN1</code> =E2=86=92 SW0 reset</li>
<li><code>WDIOF_EXTERN2</code> =E2=86=92 SW1 reset</li>
<li><code>WDIOF_POWERUNDER</code> =E2=86=92 SW2 reset</li>
<li><code>WDIOF_POWEROVER</code> =E2=86=92 SW3 reset</li>
</ul>
<p>Is such a mapping acceptable?</p>
<p>Any guidance on the expected upstream approach would be greatly apprecia=
ted.</p>
<p>Thanks,<br>
Tomer</p>
</div><div><br class=3D"gmail-Apple-interchange-newline"></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 10 F=
eb 2026 at 18:02, Guenter Roeck &lt;<a href=3D"mailto:linux@roeck-us.net" t=
arget=3D"_blank">linux@roeck-us.net</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On 2/10/26 05:38, Tomer Maimon wrote:<br=
>
&gt; Add reset status detection for NPCM watchdog driver on both NPCM7XX an=
d<br>
&gt; NPCM8XX platforms. Implement GCR register integration via syscon for<b=
r>
&gt; reset status detection and configurable reset type mapping via device<=
br>
&gt; tree properties.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/watchdog/npcm_wdt.c | 110 ++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 110 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c=
<br>
&gt; index e62ea054bc61..ebece5d6240a 100644<br>
&gt; --- a/drivers/watchdog/npcm_wdt.c<br>
&gt; +++ b/drivers/watchdog/npcm_wdt.c<br>
&gt; @@ -12,9 +12,25 @@<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/platform_device.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/slab.h&gt;<br>
&gt;=C2=A0 =C2=A0#include &lt;linux/watchdog.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;linux/mfd/syscon.h&gt;<br>
&gt; +<br>
&gt; +#define NPCM7XX_RESSR_OFFSET 0x6C<br>
&gt; +#define NPCM7XX_INTCR2_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x60<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define NPCM_WTCR=C2=A0 =C2=A00x1C<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#define NPCM7XX_PORST=C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(31)<br>
&gt; +#define NPCM7XX_CORST=C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(30)<br>
&gt; +#define NPCM7XX_WD0RST=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(29)<br>
&gt; +#define NPCM7XX_WD1RST=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(24)<br>
&gt; +#define NPCM7XX_WD2RST=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(23)<br>
&gt; +#define NPCM7XX_SWR1RST=C2=A0 =C2=A0 =C2=A0 BIT(28)<br>
&gt; +#define NPCM7XX_SWR2RST=C2=A0 =C2=A0 =C2=A0 BIT(27)<br>
&gt; +#define NPCM7XX_SWR3RST=C2=A0 =C2=A0 =C2=A0 BIT(26)<br>
&gt; +#define NPCM7XX_SWR4RST=C2=A0 =C2=A0 =C2=A0 BIT(25)<br>
&gt; +#define NPCM8XX_RST=C2=A0 (GENMASK(31, 23) | GENMASK(15, 12))<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#define NPCM_WTCLK=C2=A0 (BIT(10) | BIT(11))=C2=A0 =C2=A0 =
=C2=A0/* Clock divider */<br>
&gt;=C2=A0 =C2=A0#define NPCM_WTE=C2=A0 =C2=A0 BIT(7)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Enable */<br>
&gt;=C2=A0 =C2=A0#define NPCM_WTIE=C2=A0 =C2=A0BIT(6)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Enable irq */<br>
&gt; @@ -45,6 +61,9 @@ struct npcm_wdt {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct watchdog_device=C2=A0 wdd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *reg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0card_reset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ext1_reset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ext2_reset;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static inline struct npcm_wdt *to_npcm_wdt(struct watchdog=
_device *wdd)<br>
&gt; @@ -185,6 +204,95 @@ static const struct watchdog_ops npcm_wdt_ops =3D=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.restart =3D npcm_wdt_restart,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static u32 npcm_wdt_reset_type(const char *reset_type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!strcmp(reset_type, &quot;porst&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_PORST;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;corst&quot;))<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_CORST;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;wd0&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_WD0RST=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;wd1&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_WD1RST=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;wd2&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_WD2RST=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw1&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_SWR1RS=
T;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw2&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_SWR2RS=
T;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw3&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_SWR3RS=
T;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw4&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_SWR4RS=
T;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device=
 *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *card_reset_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *ext1_reset_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *ext2_reset_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *gcr_regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 rstval, ressrval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gcr_regmap =3D syscon_regmap_lookup_by_phandle(de=
v-&gt;of_node, &quot;syscon&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(gcr_regmap)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, &quot;F=
ailed to find gcr syscon, WD reset status not supported\n&quot;);<br>
<br>
A warning is quite strong here, given that this is new code and the<br>
syscon reference may not exist in existing devicetree files. notice<br>
should be good enough.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_string(dev-&gt;of_node,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoton,card-=
reset-type&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;card_reset_typ=
e);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;card_reset =
=3D NPCM7XX_PORST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;card_reset =
=3D npcm_wdt_reset_type(card_reset_type);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_string(dev-&gt;of_node,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoton,ext1-=
reset-type&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ext1_reset_typ=
e);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext1_reset =
=3D 0;<br>
<br>
wdt is zero-allocated, so setting those variables to 0 is not necessary.<br=
>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext1_reset =
=3D npcm_wdt_reset_type(ext1_reset_type);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_string(dev-&gt;of_node,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoton,ext2-=
reset-type&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ext2_reset_typ=
e);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext2_reset =
=3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext2_reset =
=3D npcm_wdt_reset_type(ext2_reset_type);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &a=
mp;rstval);<br>
<br>
This warrants an explanation/comment: Why is it not necessary to check<br>
the return value of the regmap operations ?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* prefer the most specific SoC first */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (of_device_is_compatible(dev-&gt;of_node, &quo=
t;nuvoton,npcm845-wdt&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(gcr_regm=
ap, NPCM7XX_INTCR2_OFFSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 rstval &amp; ~NPCM8XX_RST);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (of_device_is_compatible(dev-&gt;of_nod=
e, &quot;nuvoton,npcm750-wdt&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((rstval &amp; NPC=
M7XX_PORST) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rstval =3D NPCM7XX_PORST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rstval | NPCM7XX_PORST);<=
br>
<br>
That &quot;| NPCM7XX_PORST&quot; is pretty pointless here since rstval was<=
br>
just set to that value.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rstval =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Another comment needed: This negates NPCM7XX_PORST and otherwise clear<br>
rstval. The reason is not immediately (or, rather, at all) obvious.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(gcr_regma=
p, NPCM7XX_RESSR_OFFSET, &amp;ressrval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rstval |=3D ressrval;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(gcr_regm=
ap, NPCM7XX_RESSR_OFFSET, ressrval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
If the device is not compatible to either chip, retval is just passed<br>
on and nothing is written to the chip. That warrants another comment.<br>
<br>
[ Yes, I see that the driver does not currently support another chip.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (rstval &amp; wdt-&gt;card_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;wdd.bootstatu=
s |=3D WDIOF_CARDRESET;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (rstval &amp; wdt-&gt;ext1_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;wdd.bootstatu=
s |=3D WDIOF_EXTERN1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (rstval &amp; wdt-&gt;ext2_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;wdd.bootstatu=
s |=3D WDIOF_EXTERN2;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static int npcm_wdt_probe(struct platform_device *pdev)<br=
>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br=
>
&gt; @@ -208,6 +316,8 @@ static int npcm_wdt_probe(struct platform_device *=
pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return irq;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0npcm_get_reset_status(wdt, dev);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;<a href=3D"http://wdd.info" rel=3D"n=
oreferrer" target=3D"_blank">wdd.info</a> =3D &amp;npcm_wdt_info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;wdd.ops =3D &amp;npcm_wdt_ops;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;wdd.min_timeout =3D 1;<br>
<br>
</blockquote></div>

--000000000000b4d51b064af1cd93--

