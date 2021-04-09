Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F35359648
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 09:24:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGqQ569Kgz3brW
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 17:24:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MVS5ERIn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MVS5ERIn; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGqPq3ddvz2yy7;
 Fri,  9 Apr 2021 17:24:12 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id j7so2315777plx.2;
 Fri, 09 Apr 2021 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=rEyNPNX1Q18lDC+99DWgUw9l8mUfJRHIWhVRBKu5mlw=;
 b=MVS5ERInKxwdtA9u4m7rgz2Q54yR2l9NNBVtha8m9OlveZLRkEVh4abDRVmcL9ZrL0
 q0X1a6gHR01hyHIR2CdWX5sj5k5bJpODcr/ptIr3ZIncRDZyjJ8l0lfdDjQaXDveWDH3
 4KbclPwE7xg7sUNyTvu2/Ez/HKDahvF/gNWis+7ZVy9adiAR6cEbGJLL0hhXsAU63wr8
 REvu2rw+kNWw+qVNCAz/DIf8dv8Z6gIK43LC8RnhlRsG1oUF2Y+B0/KZvkDZm7iI7UGH
 RrJeTs3kpaF1ut4Afp3Z9346nWFnh6k3dJejR2PGHRXQvaf/q513pEc5meB6IBxNDhw9
 8Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=rEyNPNX1Q18lDC+99DWgUw9l8mUfJRHIWhVRBKu5mlw=;
 b=aqUzKZUpTXfODFFrPuHOrlETm9H89HVZt/yX+cJmiLeZ7bq9z6MxmrtnULof5c30Is
 dVhmB/pEM+YQwrvwMIRc2q/NEGmlT4pfOT+HsFzqpr7XhNtALofRQ4N2OWlkIXGKPaOk
 jeQIP+XcWrCWxF+H5r6KE4QWWkH566IWJVbzizSQsTjPpQzYpXNdZ1VvvvfNL2gcleiJ
 ALKk9EEhNWQNYggw2Q/dZdmOTdtntDMn+slKOEDpB2QXQESnq2/7X+0pMumTnlQKDheT
 54hDvWsrDMFrZB8rSDG/WraemY1T2PxMVyT3WFEQfi83IyEOQIHSnXZ7pyo9+1zlycOl
 9u6g==
X-Gm-Message-State: AOAM531ovl8eLzmWrPiteQqv0XSlnIt0CbtCrRmhtPSsXlgif/xS47Ak
 Sw1R3nR/r8cElhQNxdale7Tb7Zyw3p7+FERmKYc=
X-Google-Smtp-Source: ABdhPJzE0uPIUzOgq6k2uHRhtRylt3MqCLmOxX716lENH42118Pl8DKdhoYwG2DMbQYDOWa/2Q0xHqEe+t2s23ciLVM=
X-Received: by 2002:a17:90a:156:: with SMTP id
 z22mr13138538pje.181.1617953049527; 
 Fri, 09 Apr 2021 00:24:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:e509:0:0:0:0 with HTTP; Fri, 9 Apr 2021 00:24:08
 -0700 (PDT)
In-Reply-To: <20210408011637.5361-3-zev@bewilderbeest.net>
References: <20210408011637.5361-1-zev@bewilderbeest.net>
 <20210408011637.5361-3-zev@bewilderbeest.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 9 Apr 2021 10:24:08 +0300
Message-ID: <CAHp75Vd6kk0E-kALEGOhsg=YHKhmKLY6cpCTdviOFenO4p1-2A@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] drivers/tty/serial/8250: refactor sirq and lpc
 address setting code
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: multipart/alternative; boundary="000000000000c7ca6605bf850c01"
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c7ca6605bf850c01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thursday, April 8, 2021, Zev Weiss <zev@bewilderbeest.net> wrote:

> This splits dedicated aspeed_vuart_set_{sirq,lpc_address}() functions
> out of the sysfs store functions in preparation for adding DT
> properties that will be poking the same registers.  While we're at it,
> these functions now provide some basic bounds-checking on their
> arguments.
>
>

Please, use prefix =E2=80=9Cserial: 8250_aspeed_vuart:=E2=80=9D instead of =
what you have in
the subject line. I think I have told this already


> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 51 ++++++++++++++-------
>  1 file changed, 35 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index c33e02cbde93..8433f8dbb186 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -72,22 +72,31 @@ static ssize_t lpc_address_show(struct device *dev,
>         return snprintf(buf, PAGE_SIZE - 1, "0x%x\n", addr);
>  }
>
> +static int aspeed_vuart_set_lpc_address(struct aspeed_vuart *vuart, u32
> addr)
> +{
> +       if (addr > U16_MAX)
> +               return -EINVAL;
> +
> +       writeb(addr >> 8, vuart->regs + ASPEED_VUART_ADDRH);
> +       writeb(addr >> 0, vuart->regs + ASPEED_VUART_ADDRL);
> +
> +       return 0;
> +}
> +
>  static ssize_t lpc_address_store(struct device *dev,
>                                  struct device_attribute *attr,
>                                  const char *buf, size_t count)
>  {
>         struct aspeed_vuart *vuart =3D dev_get_drvdata(dev);
> -       unsigned long val;
> +       u32 val;
>         int err;
>
> -       err =3D kstrtoul(buf, 0, &val);
> +       err =3D kstrtou32(buf, 0, &val);
>         if (err)
>                 return err;
>
> -       writeb(val >> 8, vuart->regs + ASPEED_VUART_ADDRH);
> -       writeb(val >> 0, vuart->regs + ASPEED_VUART_ADDRL);
> -
> -       return count;
> +       err =3D aspeed_vuart_set_lpc_address(vuart, val);
> +       return err ? : count;
>  }
>
>  static DEVICE_ATTR_RW(lpc_address);
> @@ -105,27 +114,37 @@ static ssize_t sirq_show(struct device *dev,
>         return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg);
>  }
>
> +static int aspeed_vuart_set_sirq(struct aspeed_vuart *vuart, u32 sirq)
> +{
> +       u8 reg;
> +
> +       if (sirq > (ASPEED_VUART_GCRB_HOST_SIRQ_MASK >>
> ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT))
> +               return -EINVAL;
> +
> +       sirq <<=3D ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
> +       sirq &=3D ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
> +
> +       reg =3D readb(vuart->regs + ASPEED_VUART_GCRB);
> +       reg &=3D ~ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
> +       reg |=3D sirq;
> +       writeb(reg, vuart->regs + ASPEED_VUART_GCRB);
> +
> +       return 0;
> +}
> +
>  static ssize_t sirq_store(struct device *dev, struct device_attribute
> *attr,
>                           const char *buf, size_t count)
>  {
>         struct aspeed_vuart *vuart =3D dev_get_drvdata(dev);
>         unsigned long val;
>         int err;
> -       u8 reg;
>
>         err =3D kstrtoul(buf, 0, &val);
>         if (err)
>                 return err;
>
> -       val <<=3D ASPEED_VUART_GCRB_HOST_SIRQ_SHIFT;
> -       val &=3D ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
> -
> -       reg =3D readb(vuart->regs + ASPEED_VUART_GCRB);
> -       reg &=3D ~ASPEED_VUART_GCRB_HOST_SIRQ_MASK;
> -       reg |=3D val;
> -       writeb(reg, vuart->regs + ASPEED_VUART_GCRB);
> -
> -       return count;
> +       err =3D aspeed_vuart_set_sirq(vuart, val);
> +       return err ? : count;
>  }
>
>  static DEVICE_ATTR_RW(sirq);
> --
> 2.31.1
>
>

--=20
With Best Regards,
Andy Shevchenko

--000000000000c7ca6605bf850c01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, April 8, 2021, Zev Weiss &lt;<a href=3D"mailto:zev@bew=
ilderbeest.net">zev@bewilderbeest.net</a>&gt; wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">This splits dedicated aspeed_vuart_set_{sirq,lpc_<wbr>address=
}() functions<br>
out of the sysfs store functions in preparation for adding DT<br>
properties that will be poking the same registers.=C2=A0 While we&#39;re at=
 it,<br>
these functions now provide some basic bounds-checking on their<br>
arguments.<br>
<br></blockquote><div><br></div><div><br></div><div>Please, use prefix =E2=
=80=9Cserial: 8250_aspeed_vuart:=E2=80=9D instead of what you have in the s=
ubject line. I think I have told this already=C2=A0</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
Signed-off-by: Zev Weiss &lt;<a href=3D"mailto:zev@bewilderbeest.net">zev@b=
ewilderbeest.net</a>&gt;<br>
---<br>
=C2=A0drivers/tty/serial/8250/8250_<wbr>aspeed_vuart.c | 51 ++++++++++++++-=
------<br>
=C2=A01 file changed, 35 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/drivers/tty/serial/8250/<wbr>8250_aspeed_vuart.c b/drivers/tty=
/serial/8250/<wbr>8250_aspeed_vuart.c<br>
index c33e02cbde93..8433f8dbb186 100644<br>
--- a/drivers/tty/serial/8250/<wbr>8250_aspeed_vuart.c<br>
+++ b/drivers/tty/serial/8250/<wbr>8250_aspeed_vuart.c<br>
@@ -72,22 +72,31 @@ static ssize_t lpc_address_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE - 1, &quot;0x%x\=
n&quot;, addr);<br>
=C2=A0}<br>
<br>
+static int aspeed_vuart_set_lpc_address(<wbr>struct aspeed_vuart *vuart, u=
32 addr)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (addr &gt; U16_MAX)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writeb(addr &gt;&gt; 8, vuart-&gt;regs + ASPEED=
_VUART_ADDRH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writeb(addr &gt;&gt; 0, vuart-&gt;regs + ASPEED=
_VUART_ADDRL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static ssize_t lpc_address_store(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *attr,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct aspeed_vuart *vuart =3D dev_get_drvdata(=
dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D kstrtoul(buf, 0, &amp;val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D kstrtou32(buf, 0, &amp;val);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0writeb(val &gt;&gt; 8, vuart-&gt;regs + ASPEED_=
VUART_ADDRH);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0writeb(val &gt;&gt; 0, vuart-&gt;regs + ASPEED_=
VUART_ADDRL);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D aspeed_vuart_set_lpc_address(<wbr>vuart=
, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return err ? : count;<br>
=C2=A0}<br>
<br>
=C2=A0static DEVICE_ATTR_RW(lpc_address);<br>
@@ -105,27 +114,37 @@ static ssize_t sirq_show(struct device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE - 1, &quot;%u\n&=
quot;, reg);<br>
=C2=A0}<br>
<br>
+static int aspeed_vuart_set_sirq(struct aspeed_vuart *vuart, u32 sirq)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 reg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sirq &gt; (ASPEED_VUART_GCRB_HOST_SIRQ_<wbr=
>MASK &gt;&gt; ASPEED_VUART_GCRB_HOST_SIRQ_<wbr>SHIFT))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sirq &lt;&lt;=3D ASPEED_VUART_GCRB_HOST_SIRQ_<w=
br>SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sirq &amp;=3D ASPEED_VUART_GCRB_HOST_SIRQ_<wbr>=
MASK;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D readb(vuart-&gt;regs + ASPEED_VUART_GCR=
B);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg &amp;=3D ~ASPEED_VUART_GCRB_HOST_SIRQ_<wbr>=
MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D sirq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writeb(reg, vuart-&gt;regs + ASPEED_VUART_GCRB)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static ssize_t sirq_store(struct device *dev, struct device_attribute=
 *attr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const char *buf, size_t count)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct aspeed_vuart *vuart =3D dev_get_drvdata(=
dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 reg;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D kstrtoul(buf, 0, &amp;val);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0val &lt;&lt;=3D ASPEED_VUART_GCRB_HOST_SIRQ_<wb=
r>SHIFT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ASPEED_VUART_GCRB_HOST_SIRQ_<wbr>M=
ASK;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D readb(vuart-&gt;regs + ASPEED_VUART_GCR=
B);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0reg &amp;=3D ~ASPEED_VUART_GCRB_HOST_SIRQ_<wbr>=
MASK;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D val;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0writeb(reg, vuart-&gt;regs + ASPEED_VUART_GCRB)=
;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D aspeed_vuart_set_sirq(vuart, val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return err ? : count;<br>
=C2=A0}<br>
<br>
=C2=A0static DEVICE_ATTR_RW(sirq);<br>
-- <br>
2.31.1<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--000000000000c7ca6605bf850c01--
