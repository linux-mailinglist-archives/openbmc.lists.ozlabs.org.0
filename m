Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EC577D97
	for <lists+openbmc@lfdr.de>; Sun, 28 Jul 2019 06:01:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45x8JC6XKHzDqD5
	for <lists+openbmc@lfdr.de>; Sun, 28 Jul 2019 14:01:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QjIlmOW1"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45x8HX3V1wzDqQB
 for <openbmc@lists.ozlabs.org>; Sun, 28 Jul 2019 14:00:31 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id k8so56405456eds.7
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jul 2019 21:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3q1MQ+HW2cJeKmyixeZ4XlCgZSIEMupgy9u/ql5IbOo=;
 b=QjIlmOW13F7ttkOPq4jLtFTbBcnTJTYvF73d+sSP3V6rDs0GbEUEIRFfadS6KxEDlx
 IzDkS7X1k9Cvw7BduXrsBsVD2b8f+btjphBRsjOCfy+dK9uU1ewcGbSvfsVgqy1wejK5
 NUQ3BTY+4Xw1pLLmDMKGjdNsAH/lC1Lz1u+UUhKY4Uksckm4gAz7k7qcT5Cx6Hy6hA7l
 DoUOK621ffHqjkPM1bzZx6EwBI5XMK3cRUCirPBGQ5p1qVMXAb9o25cTwVhgTjK5aGrl
 QxBOvOB3PzGmaVlf6t1fbW14dCFPHcXT2JwTlYZfY8wC0leaUv9MH0GwgSQ8mW41Qxfw
 EIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3q1MQ+HW2cJeKmyixeZ4XlCgZSIEMupgy9u/ql5IbOo=;
 b=J8DVV9o4J3Rxc5KlPhm549sbqD9v40dUMdcZyFY2hQghcsYTkS/zJQTQVNWkc+cN2u
 fG8oe/1cOFxgDhueeZvXU4b0v6lJqv13ZsNcNljvoTqQEZyqF5m2zmQIoSAya9s8hYIX
 dsM7ckQs+smdRi5+cOVuMNF01Djej6kv/eG9mIRsX48ZDcm/R/bHrOLknrwB28Bth+nL
 WanHfudP+AA4pPzkQXX+CYVjsk3ccse7bjU7T2+u8Tj/M5QT8Sr/l9KJSqn9nCXioYGT
 LCFUvGr5w6CQj7+X2h/Sga4RsBW7kW08zEzpFk1Ht5/XWdTdjE9HSnfpCdwoHO89wgga
 RKtQ==
X-Gm-Message-State: APjAAAWOkgWlS+G23EoEthX/jf24hGQVTAFvPCsJut0eXS8lapLpL9Bj
 IcW+d4b80ke7edYF1MgQcKvLjO7B4U+bp0rUGGX72w==
X-Google-Smtp-Source: APXvYqzy6QcySo7R5d/PAaptjvAaykm5wSbj81fbDoOrrFE0BcZy5e4X7PHMEDdZFh8HDws4LyTHY5OxoCWD/xIsnEo=
X-Received: by 2002:a50:a5ec:: with SMTP id b41mr87088934edc.52.1564286424847; 
 Sat, 27 Jul 2019 21:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190727134242.49847-1-osk@google.com>
 <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
In-Reply-To: <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
From: Oskar Senft <osk@google.com>
Date: Sun, 28 Jul 2019 00:00:08 -0400
Message-ID: <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
Subject: Re: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ polarity
 configurable
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: multipart/alternative; boundary="000000000000ae7928058eb5d014"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ae7928058eb5d014
Content-Type: text/plain; charset="UTF-8"

I was thinking exactly the same thing (which is why I pointed it out in the
change description). Thanks for picking up on that :-D

I considered both options but decided to follow what's been done for the
sirq and lpc_address settings, as sirq_polarity should really go together
with the other two. I guess we could argue that the sirq_polarity likely
always has to have a specific setting for the specific platform, whereas
the sirq and the lpc_address might be configurable in some way from the
host at runtime.

Another reason I decided against DTS is that the properties currently read
from DTS are "standard properties" from the 8250 driver. So I wasn't sure
if it's ok to add a property that clearly specific to the 8250_aspeed_vuart
driver.

If anyone has strong feelings I can either change it from sysfs to DTS or
add DTS on top - it's quite easy to do. Thoughts?

Thanks
Oskar.

On Sat, Jul 27, 2019 at 9:30 PM Benjamin Herrenschmidt <
benh@kernel.crashing.org> wrote:

> On Sat, 2019-07-27 at 09:42 -0400, Oskar Senft wrote:
> > Make the SIRQ polarity for Aspeed 24xx/25xx VUART configurable via
> > sysfs. It is required on some host platforms (e.g. TYAN S7106) to
> > reconfigure this setting from the default to enable the host to
> > receive
> > interrupts from the VUART.
> >
> > The setting is configurable via sysfs rather than device-tree to stay
> > in
> > line with other related configurable settings.
>
> If it's a fixed platform configuration that never changes at runtime,
> shouldn't it be in the device-tree instead ?
>
> Cheers,
> Ben
>
> > Tested: Verified on TYAN S7106 mainboard.
> > Signed-off-by: Oskar Senft <osk@google.com>
> > ---
> >  .../ABI/stable/sysfs-driver-aspeed-vuart      | 10 ++++-
> >  drivers/tty/serial/8250/8250_aspeed_vuart.c   | 39
> > +++++++++++++++++++
> >  2 files changed, 48 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
> > b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
> > index 8062953ce77b..64fad87ad964 100644
> > --- a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
> > +++ b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
> > @@ -6,10 +6,18 @@ Description:        Configures which IO port the
> > host side of the UART
> >  Users:               OpenBMC.  Proposed changes should be mailed to
> >               openbmc@lists.ozlabs.org
> >
> > -What:                /sys/bus/platform/drivers/aspeed-vuart*/sirq
> > +What:                /sys/bus/platform/drivers/aspeed-vuart/*/sirq
> >  Date:                April 2017
> >  Contact:     Jeremy Kerr <jk@ozlabs.org>
> >  Description: Configures which interrupt number the host side of
> >               the UART will appear on the host <-> BMC LPC bus.
> >  Users:               OpenBMC.  Proposed changes should be mailed to
> >               openbmc@lists.ozlabs.org
> > +
> > +What:                /sys/bus/platform/drivers/aspeed-
> > vuart/*/sirq_polarity
> > +Date:                July 2019
> > +Contact:     Oskar Senft <osk@google.com>
> > +Description: Configures the polarity of the serial interrupt to the
> > +             host via the BMC LPC bus.
> > +Users:               OpenBMC.  Proposed changes should be mailed to
> > +             openbmc@lists.ozlabs.org
> > diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > index 0438d9a905ce..ef0a6ff69841 100644
> > --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > @@ -22,6 +22,7 @@
> >
> >  #define ASPEED_VUART_GCRA            0x20
> >  #define ASPEED_VUART_GCRA_VUART_EN           BIT(0)
> > +#define ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY BIT(1)
> >  #define ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD BIT(5)
> >  #define ASPEED_VUART_GCRB            0x24
> >  #define ASPEED_VUART_GCRB_HOST_SIRQ_MASK     GENMASK(7, 4)
> > @@ -131,8 +132,46 @@ static ssize_t sirq_store(struct device *dev,
> > struct device_attribute *attr,
> >
> >  static DEVICE_ATTR_RW(sirq);
> >
> > +static ssize_t sirq_polarity_show(struct device *dev,
> > +                               struct device_attribute *attr, char
> > *buf)
> > +{
> > +     struct aspeed_vuart *vuart = dev_get_drvdata(dev);
> > +     u8 reg;
> > +
> > +     reg = readb(vuart->regs + ASPEED_VUART_GCRA);
> > +     reg &= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
> > +
> > +     return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg ? 1 : 0);
> > +}
> > +
> > +static ssize_t sirq_polarity_store(struct device *dev,
> > +                                struct device_attribute *attr,
> > +                                const char *buf, size_t count)
> > +{
> > +     struct aspeed_vuart *vuart = dev_get_drvdata(dev);
> > +     unsigned long val;
> > +     int err;
> > +     u8 reg;
> > +
> > +     err = kstrtoul(buf, 0, &val);
> > +     if (err)
> > +             return err;
> > +
> > +     reg = readb(vuart->regs + ASPEED_VUART_GCRA);
> > +     if (val != 0)
> > +             reg |= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
> > +     else
> > +             reg &= ~ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
> > +     writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
> > +
> > +     return count;
> > +}
> > +
> > +static DEVICE_ATTR_RW(sirq_polarity);
> > +
> >  static struct attribute *aspeed_vuart_attrs[] = {
> >       &dev_attr_sirq.attr,
> > +     &dev_attr_sirq_polarity.attr,
> >       &dev_attr_lpc_address.attr,
> >       NULL,
> >  };
>
>

--000000000000ae7928058eb5d014
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was thinking exactly the same thing (which is why I poin=
ted it out in the change description). Thanks for picking up on that :-D<di=
v><br></div><div>I considered both options but decided to follow what&#39;s=
 been done for the sirq and lpc_address settings, as sirq_polarity should r=
eally go together with the other two. I guess we could argue that the sirq_=
polarity likely always has to have a specific setting for the specific plat=
form, whereas the sirq and the lpc_address might be configurable in some wa=
y from the host at runtime.<div><br></div><div>Another reason I decided aga=
inst DTS is that the properties currently read from DTS are &quot;standard =
properties&quot; from the 8250 driver. So I wasn&#39;t sure if it&#39;s ok =
to add a property that clearly specific to the 8250_aspeed_vuart driver.</d=
iv><div><br></div><div>If anyone has strong feelings I can either change it=
 from sysfs to DTS or add DTS on top - it&#39;s quite easy to do. Thoughts?=
</div><div><div><br></div><div>Thanks</div><div>Oskar.</div></div></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Sat, Jul 27, 2019 at 9:30 PM Benjamin Herrenschmidt &lt;<a href=3D"mailto:b=
enh@kernel.crashing.org">benh@kernel.crashing.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 2019-07-27 at 09:4=
2 -0400, Oskar Senft wrote:<br>
&gt; Make the SIRQ polarity for Aspeed 24xx/25xx VUART configurable via<br>
&gt; sysfs. It is required on some host platforms (e.g. TYAN S7106) to<br>
&gt; reconfigure this setting from the default to enable the host to<br>
&gt; receive<br>
&gt; interrupts from the VUART.<br>
&gt; <br>
&gt; The setting is configurable via sysfs rather than device-tree to stay<=
br>
&gt; in<br>
&gt; line with other related configurable settings.<br>
<br>
If it&#39;s a fixed platform configuration that never changes at runtime,<b=
r>
shouldn&#39;t it be in the device-tree instead ?<br>
<br>
Cheers,<br>
Ben<br>
<br>
&gt; Tested: Verified on TYAN S7106 mainboard.<br>
&gt; Signed-off-by: Oskar Senft &lt;<a href=3D"mailto:osk@google.com" targe=
t=3D"_blank">osk@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../ABI/stable/sysfs-driver-aspeed-vuart=C2=A0 =C2=A0 =C2=A0 | 1=
0 ++++-<br>
&gt;=C2=A0 drivers/tty/serial/8250/8250_aspeed_vuart.c=C2=A0 =C2=A0| 39<br>
&gt; +++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 48 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart<br>
&gt; b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart<br>
&gt; index 8062953ce77b..64fad87ad964 100644<br>
&gt; --- a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart<br>
&gt; +++ b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart<br>
&gt; @@ -6,10 +6,18 @@ Description:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Configures w=
hich IO port the<br>
&gt; host side of the UART<br>
&gt;=C2=A0 Users:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ope=
nBMC.=C2=A0 Proposed changes should be mailed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailt=
o:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><=
br>
&gt;=C2=A0 <br>
&gt; -What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys/bus=
/platform/drivers/aspeed-vuart*/sirq<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys/bus=
/platform/drivers/aspeed-vuart/*/sirq<br>
&gt;=C2=A0 Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Apr=
il 2017<br>
&gt;=C2=A0 Contact:=C2=A0 =C2=A0 =C2=A0Jeremy Kerr &lt;<a href=3D"mailto:jk=
@ozlabs.org" target=3D"_blank">jk@ozlabs.org</a>&gt;<br>
&gt;=C2=A0 Description: Configures which interrupt number the host side of<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the UART will ap=
pear on the host &lt;-&gt; BMC LPC bus.<br>
&gt;=C2=A0 Users:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ope=
nBMC.=C2=A0 Proposed changes should be mailed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailt=
o:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><=
br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys/bus=
/platform/drivers/aspeed-<br>
&gt; vuart/*/sirq_polarity<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 July 201=
9<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0Oskar Senft &lt;<a href=3D"mailto:osk@goo=
gle.com" target=3D"_blank">osk@google.com</a>&gt;<br>
&gt; +Description: Configures the polarity of the serial interrupt to the<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host via the BMC LPC =
bus.<br>
&gt; +Users:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OpenBMC.=
=C2=A0 Proposed changes should be mailed to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:ope=
nbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br>
&gt; diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c<br>
&gt; b/drivers/tty/serial/8250/8250_aspeed_vuart.c<br>
&gt; index 0438d9a905ce..ef0a6ff69841 100644<br>
&gt; --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c<br>
&gt; +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c<br>
&gt; @@ -22,6 +22,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define ASPEED_VUART_GCRA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x20<br>
&gt;=C2=A0 #define ASPEED_VUART_GCRA_VUART_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0BIT(0)<br>
&gt; +#define ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY BIT(1)<br>
&gt;=C2=A0 #define ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD BIT(5)<br>
&gt;=C2=A0 #define ASPEED_VUART_GCRB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x24<br>
&gt;=C2=A0 #define ASPEED_VUART_GCRB_HOST_SIRQ_MASK=C2=A0 =C2=A0 =C2=A0GENM=
ASK(7, 4)<br>
&gt; @@ -131,8 +132,46 @@ static ssize_t sirq_store(struct device *dev,<br>
&gt; struct device_attribute *attr,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static DEVICE_ATTR_RW(sirq);<br>
&gt;=C2=A0 <br>
&gt; +static ssize_t sirq_polarity_show(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *attr, ch=
ar<br>
&gt; *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct aspeed_vuart *vuart =3D dev_get_drvdata(de=
v);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 reg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D readb(vuart-&gt;regs + ASPEED_VUART_GCRA)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg &amp;=3D ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE - 1, &quot;%u\n&qu=
ot;, reg ? 1 : 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t sirq_polarity_store(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *buf, size_t count)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct aspeed_vuart *vuart =3D dev_get_drvdata(de=
v);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 reg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D kstrtoul(buf, 0, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D readb(vuart-&gt;regs + ASPEED_VUART_GCRA)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (val !=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D ASPEED_VUART=
_GCRA_HOST_SIRQ_POLARITY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg &amp;=3D ~ASPEED_=
VUART_GCRA_HOST_SIRQ_POLARITY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writeb(reg, vuart-&gt;regs + ASPEED_VUART_GCRA);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static DEVICE_ATTR_RW(sirq_polarity);<br>
&gt; +<br>
&gt;=C2=A0 static struct attribute *aspeed_vuart_attrs[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;dev_attr_sirq.attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;dev_attr_sirq_polarity.attr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;dev_attr_lpc_address.attr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,<br>
&gt;=C2=A0 };<br>
<br>
</blockquote></div>

--000000000000ae7928058eb5d014--
