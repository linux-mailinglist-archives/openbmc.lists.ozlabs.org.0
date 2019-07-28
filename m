Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFAF78098
	for <lists+openbmc@lfdr.de>; Sun, 28 Jul 2019 19:24:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xV6T1WPXzDqRR
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 03:24:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="nsxCN67D"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xV5s6grzzDqQc
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 03:23:29 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id s49so22489772edb.1
 for <openbmc@lists.ozlabs.org>; Sun, 28 Jul 2019 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=g/pF/uc/bebE0y8u9o5cuCoA5JUR4H2f4P4LjZSC2Ao=;
 b=nsxCN67DmcmAcWQFrps7Pw32oI/VgpwUC/Lrix2GBMgC0G+a8f1N2gwzYichUobCBO
 gXUqarBnBHFz1hbiJcl5pj0+MOblNyiJprQHaJhHtOIbBKq12l6toWzwfDWb48ZIt6VO
 DgCAPPiNYzdipAwlKioaQIyP8BZU85e0TkHVpe+tygrV9ySoVSQKVhAkI8nL0PvJQG0V
 s42I3HMl4RIb52OF143j4K/W7/Tb7sHeJNhBAseVSpRW0qEygn9t47QZwfhEhHv8S3D9
 3MIY5K5wn4vwn4j//WkfAGJRi9ultU6MTRSiCDqm0+JXo0OqGS5jD7VQdpmdODIQZY+0
 2cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=g/pF/uc/bebE0y8u9o5cuCoA5JUR4H2f4P4LjZSC2Ao=;
 b=lnO2+tGZuyzw1y+Yz/e10WldVomH+ilVeZ2J5zAEQG95VzgtaVI+GvUUd5nB/hI/0W
 tOIQj5gFqYE3OWfSwJnn+Q77eBuQXr8S0UMqwaJDLhScQJyD9H/uIa0BXDKY3FKiSDeK
 ucAw+lvyxSQeIv9NQuVEvvIU7Ep7Q217HDahPTv38U9f3d/JpU2tQhrcUqfkmw7zTVNV
 yC4UiXthrpX8tf1pX1aUpP/8KSWyv8gHSdtFgafs3ydrVKAx/eMU1iuXui8ivQFI+B8y
 7rTRqqlz2IlGD1BCa+6RZ3lppBfcErvhnMoP7N6DQv6MGh/Eus6Gyod0IIiRsuwJAUjn
 /ulw==
X-Gm-Message-State: APjAAAVGq06qY0zlRH+vLV//vrxkSXQcQwHAtVOY5mLVI4HQic5SyR/v
 wwTS/SXBl5qIY84o8OotyNkrSlbyKD/n2mibExoeOw==
X-Google-Smtp-Source: APXvYqwavw4d/Twggwm1PMzIYd0WfqF3K9XTP8b2e+JcBltL9DzhbaObYopjgZlm/MnlZ2uf3RYE4J6ajR5cPqTBoVs=
X-Received: by 2002:a50:a5ec:: with SMTP id b41mr89581278edc.52.1564334604464; 
 Sun, 28 Jul 2019 10:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190727134242.49847-1-osk@google.com>
 <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
 <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
In-Reply-To: <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Sun, 28 Jul 2019 13:23:12 -0400
Message-ID: <CABoTLcTSFvQruPRnoRPgiWjOXNDOCSnAXVesG7f1WAuLLLVSSg@mail.gmail.com>
Subject: Re: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ polarity
 configurable
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Jeffery <andrew@aj.id.au>, 
 Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000069028c058ec10804"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000069028c058ec10804
Content-Type: text/plain; charset="UTF-8"

Update: I just learned from Aspeed that the SIRQ polarity is actually
dependent on the interface mode, LPC vs. eSPI.

For LPC, the polarity should be set to 1, for eSPI the default of 0 is
correct.

I'll amend the patch to read the interface mode from the HW pin strap
register and day the default accordingly at driver load time.

If there are no objections, I'll leave the sysfs part in there in case it
does need to be changed.

Oskar.

On Sun, Jul 28, 2019, 12:00 AM Oskar Senft <osk@google.com> wrote:

> I was thinking exactly the same thing (which is why I pointed it out in
> the change description). Thanks for picking up on that :-D
>
> I considered both options but decided to follow what's been done for the
> sirq and lpc_address settings, as sirq_polarity should really go together
> with the other two. I guess we could argue that the sirq_polarity likely
> always has to have a specific setting for the specific platform, whereas
> the sirq and the lpc_address might be configurable in some way from the
> host at runtime.
>
> Another reason I decided against DTS is that the properties currently read
> from DTS are "standard properties" from the 8250 driver. So I wasn't sure
> if it's ok to add a property that clearly specific to the 8250_aspeed_vuart
> driver.
>
> If anyone has strong feelings I can either change it from sysfs to DTS or
> add DTS on top - it's quite easy to do. Thoughts?
>
> Thanks
> Oskar.
>
> On Sat, Jul 27, 2019 at 9:30 PM Benjamin Herrenschmidt <
> benh@kernel.crashing.org> wrote:
>
>> On Sat, 2019-07-27 at 09:42 -0400, Oskar Senft wrote:
>> > Make the SIRQ polarity for Aspeed 24xx/25xx VUART configurable via
>> > sysfs. It is required on some host platforms (e.g. TYAN S7106) to
>> > reconfigure this setting from the default to enable the host to
>> > receive
>> > interrupts from the VUART.
>> >
>> > The setting is configurable via sysfs rather than device-tree to stay
>> > in
>> > line with other related configurable settings.
>>
>> If it's a fixed platform configuration that never changes at runtime,
>> shouldn't it be in the device-tree instead ?
>>
>> Cheers,
>> Ben
>>
>> > Tested: Verified on TYAN S7106 mainboard.
>> > Signed-off-by: Oskar Senft <osk@google.com>
>> > ---
>> >  .../ABI/stable/sysfs-driver-aspeed-vuart      | 10 ++++-
>> >  drivers/tty/serial/8250/8250_aspeed_vuart.c   | 39
>> > +++++++++++++++++++
>> >  2 files changed, 48 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
>> > b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
>> > index 8062953ce77b..64fad87ad964 100644
>> > --- a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
>> > +++ b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
>> > @@ -6,10 +6,18 @@ Description:        Configures which IO port the
>> > host side of the UART
>> >  Users:               OpenBMC.  Proposed changes should be mailed to
>> >               openbmc@lists.ozlabs.org
>> >
>> > -What:                /sys/bus/platform/drivers/aspeed-vuart*/sirq
>> > +What:                /sys/bus/platform/drivers/aspeed-vuart/*/sirq
>> >  Date:                April 2017
>> >  Contact:     Jeremy Kerr <jk@ozlabs.org>
>> >  Description: Configures which interrupt number the host side of
>> >               the UART will appear on the host <-> BMC LPC bus.
>> >  Users:               OpenBMC.  Proposed changes should be mailed to
>> >               openbmc@lists.ozlabs.org
>> > +
>> > +What:                /sys/bus/platform/drivers/aspeed-
>> > vuart/*/sirq_polarity
>> > +Date:                July 2019
>> > +Contact:     Oskar Senft <osk@google.com>
>> > +Description: Configures the polarity of the serial interrupt to the
>> > +             host via the BMC LPC bus.
>> > +Users:               OpenBMC.  Proposed changes should be mailed to
>> > +             openbmc@lists.ozlabs.org
>> > diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> > b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> > index 0438d9a905ce..ef0a6ff69841 100644
>> > --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> > +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> > @@ -22,6 +22,7 @@
>> >
>> >  #define ASPEED_VUART_GCRA            0x20
>> >  #define ASPEED_VUART_GCRA_VUART_EN           BIT(0)
>> > +#define ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY BIT(1)
>> >  #define ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD BIT(5)
>> >  #define ASPEED_VUART_GCRB            0x24
>> >  #define ASPEED_VUART_GCRB_HOST_SIRQ_MASK     GENMASK(7, 4)
>> > @@ -131,8 +132,46 @@ static ssize_t sirq_store(struct device *dev,
>> > struct device_attribute *attr,
>> >
>> >  static DEVICE_ATTR_RW(sirq);
>> >
>> > +static ssize_t sirq_polarity_show(struct device *dev,
>> > +                               struct device_attribute *attr, char
>> > *buf)
>> > +{
>> > +     struct aspeed_vuart *vuart = dev_get_drvdata(dev);
>> > +     u8 reg;
>> > +
>> > +     reg = readb(vuart->regs + ASPEED_VUART_GCRA);
>> > +     reg &= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
>> > +
>> > +     return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg ? 1 : 0);
>> > +}
>> > +
>> > +static ssize_t sirq_polarity_store(struct device *dev,
>> > +                                struct device_attribute *attr,
>> > +                                const char *buf, size_t count)
>> > +{
>> > +     struct aspeed_vuart *vuart = dev_get_drvdata(dev);
>> > +     unsigned long val;
>> > +     int err;
>> > +     u8 reg;
>> > +
>> > +     err = kstrtoul(buf, 0, &val);
>> > +     if (err)
>> > +             return err;
>> > +
>> > +     reg = readb(vuart->regs + ASPEED_VUART_GCRA);
>> > +     if (val != 0)
>> > +             reg |= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
>> > +     else
>> > +             reg &= ~ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
>> > +     writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
>> > +
>> > +     return count;
>> > +}
>> > +
>> > +static DEVICE_ATTR_RW(sirq_polarity);
>> > +
>> >  static struct attribute *aspeed_vuart_attrs[] = {
>> >       &dev_attr_sirq.attr,
>> > +     &dev_attr_sirq_polarity.attr,
>> >       &dev_attr_lpc_address.attr,
>> >       NULL,
>> >  };
>>
>>

--00000000000069028c058ec10804
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Update: I just learned from Aspeed that the SIRQ polarity=
 is actually dependent on the interface mode, LPC vs. eSPI.<div dir=3D"auto=
"><br></div><div dir=3D"auto">For LPC, the polarity should be set to 1, for=
 eSPI the default of 0 is correct.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">I&#39;ll amend the patch to read the interface mode from the HW =
pin strap register and day the default accordingly at driver load time.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">If there are no objections,=
 I&#39;ll leave the sysfs part in there in case it does need to be changed.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Oskar.</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul=
 28, 2019, 12:00 AM Oskar Senft &lt;<a href=3D"mailto:osk@google.com">osk@g=
oogle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">I was thinking exactly the same thing (which is why I pointed it o=
ut in the change description). Thanks for picking up on that :-D<div><br></=
div><div>I considered both options but decided to follow what&#39;s been do=
ne for the sirq and lpc_address settings, as sirq_polarity should really go=
 together with the other two. I guess we could argue that the sirq_polarity=
 likely always has to have a specific setting for the specific platform, wh=
ereas the sirq and the lpc_address might be configurable in some way from t=
he host at runtime.<div><br></div><div>Another reason I decided against DTS=
 is that the properties currently read from DTS are &quot;standard properti=
es&quot; from the 8250 driver. So I wasn&#39;t sure if it&#39;s ok to add a=
 property that clearly specific to the 8250_aspeed_vuart driver.</div><div>=
<br></div><div>If anyone has strong feelings I can either change it from sy=
sfs to DTS or add DTS on top - it&#39;s quite easy to do. Thoughts?</div><d=
iv><div><br></div><div>Thanks</div><div>Oskar.</div></div></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul=
 27, 2019 at 9:30 PM Benjamin Herrenschmidt &lt;<a href=3D"mailto:benh@kern=
el.crashing.org" target=3D"_blank" rel=3D"noreferrer">benh@kernel.crashing.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Sat, 2019-07-27 at 09:42 -0400, Oskar Senft wrote:<br>
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
t=3D"_blank" rel=3D"noreferrer">osk@google.com</a>&gt;<br>
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
o:openbmc@lists.ozlabs.org" target=3D"_blank" rel=3D"noreferrer">openbmc@li=
sts.ozlabs.org</a><br>
&gt;=C2=A0 <br>
&gt; -What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys/bus=
/platform/drivers/aspeed-vuart*/sirq<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys/bus=
/platform/drivers/aspeed-vuart/*/sirq<br>
&gt;=C2=A0 Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Apr=
il 2017<br>
&gt;=C2=A0 Contact:=C2=A0 =C2=A0 =C2=A0Jeremy Kerr &lt;<a href=3D"mailto:jk=
@ozlabs.org" target=3D"_blank" rel=3D"noreferrer">jk@ozlabs.org</a>&gt;<br>
&gt;=C2=A0 Description: Configures which interrupt number the host side of<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the UART will ap=
pear on the host &lt;-&gt; BMC LPC bus.<br>
&gt;=C2=A0 Users:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ope=
nBMC.=C2=A0 Proposed changes should be mailed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailt=
o:openbmc@lists.ozlabs.org" target=3D"_blank" rel=3D"noreferrer">openbmc@li=
sts.ozlabs.org</a><br>
&gt; +<br>
&gt; +What:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sys/bus=
/platform/drivers/aspeed-<br>
&gt; vuart/*/sirq_polarity<br>
&gt; +Date:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 July 201=
9<br>
&gt; +Contact:=C2=A0 =C2=A0 =C2=A0Oskar Senft &lt;<a href=3D"mailto:osk@goo=
gle.com" target=3D"_blank" rel=3D"noreferrer">osk@google.com</a>&gt;<br>
&gt; +Description: Configures the polarity of the serial interrupt to the<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host via the BMC LPC =
bus.<br>
&gt; +Users:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OpenBMC.=
=C2=A0 Proposed changes should be mailed to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:ope=
nbmc@lists.ozlabs.org" target=3D"_blank" rel=3D"noreferrer">openbmc@lists.o=
zlabs.org</a><br>
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
</blockquote></div>

--00000000000069028c058ec10804--
