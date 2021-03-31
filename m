Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423E35041D
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 18:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9WQx4MHFz3bcf
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 03:06:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VE6FDj6N;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VE6FDj6N; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9WQh6jQfz2yRF
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 03:06:35 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so19409984oty.12
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=krFY72HjGOlAMWSoGc1ZqjvWty+ZQ/wgAi03WDQ54sM=;
 b=VE6FDj6Nos0e5ipfyWUkgOcaW/iFGrP511sdp4RrMuvSsyDufHbdaJRe9aWTVFFxE+
 f47elu4wAIzhaF5v46aBY/9j2jGCB6Xn/AVsauMkQzWm9SmOBf3K1qCDhQktpzLGTAEt
 +r/3F407hQBrDI2ImF0it/iFF5MKYc0ZszXrUUe/LgULajjtyFxkHYXGcUp4pPY1jncG
 Sp+ylgkndIAH2q0lM+5B2Dg9u5RyF5Qmi+kcV2HLW0wqODnIELRw/3KcuwDDcJCewFtg
 7W/DWNREeAfqly2kGGuePMVNLkFAxfAlAiam70KsGMaygMrjSvsDBMhbjhQsf6Hf+aIz
 P4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=krFY72HjGOlAMWSoGc1ZqjvWty+ZQ/wgAi03WDQ54sM=;
 b=Y+vbrQRF5xTBW8i8bnUne09ytS+KAzOT5KBAD7W0rNIboTE7bu9bli3iODK3m1xHJS
 zY7McHCqNPd7hGoqj+YFLJTz0hUXjs2tzBJVeCW8ICCyKYE61BCa/KRaMkjIhpnjfa5Q
 n+HMYKMVFFtnVV7apzEpyoWiMtFjFxRe1DsuPsFZbWFqBMN+Bd5vSZPQzc/Kl2b7pBUz
 86JDS8+wJ2OK2PuJ3EJGlDrjTI2WeZpSqY8jnXQ+3muD8SpNwchs1Lexfdk4p1wDG0+E
 FZYHGXrLzPXxbhZxX+MKHDewGhSAsCxN1DW2zE7RitJFFOZSNqKZGRiNaUGGlUW2mYtx
 z5lg==
X-Gm-Message-State: AOAM532wgYMsbFefTy+KkB276qzNkrvt7HHEiRSq6LKzLNcav6hv0/I4
 NyFFVMuz4VHUhR1geWeeAdKfezf1V4wld9CMA9g=
X-Google-Smtp-Source: ABdhPJwVztz3RtiA3OLrzu2ZiV/IEoUwl1HXuCupXdSAXYi4z+6xrPcYhGi1OwAY5aO0gU6z48FrnoRSeUVCV8HhsYU=
X-Received: by 2002:a05:6830:1e03:: with SMTP id
 s3mr3327042otr.321.1617206792574; 
 Wed, 31 Mar 2021 09:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210327004920.388957-1-wak@google.com>
 <CACPK8XeLbxOX1-FGDqqepY4vuP=QR8tRAVvR0AoX=V-eVWWwiQ@mail.gmail.com>
In-Reply-To: <CACPK8XeLbxOX1-FGDqqepY4vuP=QR8tRAVvR0AoX=V-eVWWwiQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 31 Mar 2021 19:06:21 +0300
Message-ID: <CAP6Zq1jN45ZgbJW9CeuMYTBcOvtHtP+twiazLTgw2LHko8Tn1Q@mail.gmail.com>
Subject: Re: [[PATCH linux dev-5.10] net: npcm: Support for fixed PHYs
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="00000000000066594005bed74cca"
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
Cc: Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000066594005bed74cca
Content-Type: text/plain; charset="UTF-8"

Looks fine to me,
Reviewed-by : Tomer Maimon <tmaimon77@gmail.com>

cheers,

Tomer

On Tue, 30 Mar 2021 at 01:37, Joel Stanley <joel@jms.id.au> wrote:

> On Sat, 27 Mar 2021 at 00:49, William A. Kennington III <wak@google.com>
> wrote:
> >
> > Most of our machines don't have PHYs between the NIC and the BMC over
> > their NC-SI port. We don't want to use the kernel NC-SI machinery, but
> > we do want phyless support.
> >
> > Signed-off-by: William A. Kennington III <wak@google.com>
>
> This looks fine to me. Tomer, Avi, can I please get a review from
> someone at Nuvoton?
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> It would be great to see this driver submitted upstream too!


>
> ---
> >  drivers/net/ethernet/nuvoton/npcm7xx_emc.c | 31 +++++++++++++++++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> > index f07449e2f68d..1dc871a72180 100644
> > --- a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> > +++ b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_net.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_mdio.h>
> >  #include <linux/dma-mapping.h>
> >
> >  #include <linux/regmap.h>
> > @@ -242,6 +243,7 @@ struct  npcm7xx_ether {
> >         struct net_device *ndev;
> >         struct resource *res;
> >         unsigned int msg_enable;
> > +       struct device_node *phy_dn;
> >         struct mii_bus *mii_bus;
> >         struct phy_device *phy_dev;
> >         struct napi_struct napi;
> > @@ -1774,6 +1776,17 @@ static int npcm7xx_mii_setup(struct net_device
> *dev)
> >
> >         pdev = ether->pdev;
> >
> > +       if (ether->phy_dn) {
> > +               ether->phy_dev = of_phy_connect(dev, ether->phy_dn,
> > +                                       &adjust_link, 0, 0);
> > +               if (!ether->phy_dn) {
> > +                       dev_err(&dev->dev, "could not connect to phy
> %pOF\n",
> > +                               ether->phy_dn);
> > +                       return -ENODEV;
> > +               }
> > +               return 0;
> > +       }
> > +
> >         ether->mii_bus = mdiobus_alloc();
> >         if (!ether->mii_bus) {
> >                 err = -ENOMEM;
> > @@ -2011,6 +2024,15 @@ static int npcm7xx_ether_probe(struct
> platform_device *pdev)
> >                 }
> >         } else {
> >                 ether->use_ncsi = false;
> > +
> > +               ether->phy_dn = of_parse_phandle(np, "phy-handle", 0);
> > +               if (!ether->phy_dn && of_phy_is_fixed_link(np)) {
> > +                       error = of_phy_register_fixed_link(np);
> > +                       if (error < 0)
> > +                               goto failed_free_napi;
> > +                       ether->phy_dn = of_node_get(np);
> > +               }
> > +
> >         error = npcm7xx_mii_setup(dev);
> >         if (error < 0) {
> >                 dev_err(&pdev->dev, "npcm7xx_mii_setup err\n");
> > @@ -2032,6 +2054,9 @@ static int npcm7xx_ether_probe(struct
> platform_device *pdev)
> >         return 0;
> >
> >  failed_free_napi:
> > +       of_node_put(ether->phy_dn);
> > +       if (of_phy_is_fixed_link(np))
> > +               of_phy_deregister_fixed_link(np);
> >         netif_napi_del(&ether->napi);
> >         platform_set_drvdata(pdev, NULL);
> >  failed_free_io:
> > @@ -2048,13 +2073,17 @@ static int npcm7xx_ether_remove(struct
> platform_device *pdev)
> >  {
> >         struct net_device *dev = platform_get_drvdata(pdev);
> >         struct npcm7xx_ether *ether = netdev_priv(dev);
> > +       struct device_node *np = pdev->dev.of_node;
> >
> >  #ifdef CONFIG_DEBUG_FS
> >         debugfs_remove_recursive(ether->dbgfs_dir);
> >  #endif
> > -
> >         unregister_netdev(dev);
> >
> > +       of_node_put(ether->phy_dn);
> > +       if (of_phy_is_fixed_link(np))
> > +               of_phy_deregister_fixed_link(np);
> > +
> >         free_irq(ether->txirq, dev);
> >         free_irq(ether->rxirq, dev);
> >
> > --
> > 2.31.0.291.g576ba9dcdaf-goog
> >
>

--00000000000066594005bed74cca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Looks fine to me,</div>Reviewed-by=
=C2=A0: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_=
blank">tmaimon77@gmail.com</a>&gt;<br><div><br></div><div>cheers,</div><div=
><br></div><div>Tomer</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, 30 Mar 2021 at 01:37, Joel Stanley &lt;<=
a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 27 Mar 2021 at 00:49=
, William A. Kennington III &lt;<a href=3D"mailto:wak@google.com" target=3D=
"_blank">wak@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Most of our machines don&#39;t have PHYs between the NIC and the BMC o=
ver<br>
&gt; their NC-SI port. We don&#39;t want to use the kernel NC-SI machinery,=
 but<br>
&gt; we do want phyless support.<br>
&gt;<br>
&gt; Signed-off-by: William A. Kennington III &lt;<a href=3D"mailto:wak@goo=
gle.com" target=3D"_blank">wak@google.com</a>&gt;<br>
<br>
This looks fine to me. Tomer, Avi, can I please get a review from<br>
someone at Nuvoton?<br>
<br>
Reviewed-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_=
blank">joel@jms.id.au</a>&gt;<br>
<br>
It would be great to see this driver submitted upstream too!</blockquote><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br></blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 drivers/net/ethernet/nuvoton/npcm7xx_emc.c | 31 ++++++++++++++++=
+++++-<br>
&gt;=C2=A0 1 file changed, 30 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c b/drivers/net/=
ethernet/nuvoton/npcm7xx_emc.c<br>
&gt; index f07449e2f68d..1dc871a72180 100644<br>
&gt; --- a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c<br>
&gt; +++ b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c<br>
&gt; @@ -26,6 +26,7 @@<br>
&gt;=C2=A0 #include &lt;linux/of.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/of_net.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/of_mdio.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/dma-mapping.h&gt;<br>
&gt;<br>
&gt;=C2=A0 #include &lt;linux/regmap.h&gt;<br>
&gt; @@ -242,6 +243,7 @@ struct=C2=A0 npcm7xx_ether {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct net_device *ndev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int msg_enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *phy_dn;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mii_bus *mii_bus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct phy_device *phy_dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct napi_struct napi;<br>
&gt; @@ -1774,6 +1776,17 @@ static int npcm7xx_mii_setup(struct net_device =
*dev)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdev =3D ether-&gt;pdev;<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ether-&gt;phy_dn) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ether-&gt;phy_=
dev =3D of_phy_connect(dev, ether-&gt;phy_dn,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
adjust_link, 0, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ether-&gt=
;phy_dn) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dev_err(&amp;dev-&gt;dev, &quot;could not connect to phy %pOF=
\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ether-&gt;phy_dn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ether-&gt;mii_bus =3D mdiobus_alloc()=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ether-&gt;mii_bus) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D -=
ENOMEM;<br>
&gt; @@ -2011,6 +2024,15 @@ static int npcm7xx_ether_probe(struct platform_=
device *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ether-&gt=
;use_ncsi =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ether-&gt;phy_=
dn =3D of_parse_phandle(np, &quot;phy-handle&quot;, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ether-&gt=
;phy_dn &amp;&amp; of_phy_is_fixed_link(np)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0error =3D of_phy_register_fixed_link(np);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (error &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto failed_free_napi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ether-&gt;phy_dn =3D of_node_get(np);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D npcm7xx_mii_setup(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error &lt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&=
amp;pdev-&gt;dev, &quot;npcm7xx_mii_setup err\n&quot;);<br>
&gt; @@ -2032,6 +2054,9 @@ static int npcm7xx_ether_probe(struct platform_d=
evice *pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;<br>
&gt;=C2=A0 failed_free_napi:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(ether-&gt;phy_dn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_phy_is_fixed_link(np))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_phy_deregis=
ter_fixed_link(np);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0netif_napi_del(&amp;ether-&gt;napi);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, NULL);<br>
&gt;=C2=A0 failed_free_io:<br>
&gt; @@ -2048,13 +2073,17 @@ static int npcm7xx_ether_remove(struct platfor=
m_device *pdev)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct net_device *dev =3D platform_g=
et_drvdata(pdev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_ether *ether =3D netde=
v_priv(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of=
_node;<br>
&gt;<br>
&gt;=C2=A0 #ifdef CONFIG_DEBUG_FS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_remove_recursive(ether-&gt;db=
gfs_dir);<br>
&gt;=C2=A0 #endif<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_netdev(dev);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(ether-&gt;phy_dn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_phy_is_fixed_link(np))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_phy_deregis=
ter_fixed_link(np);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_irq(ether-&gt;txirq, dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_irq(ether-&gt;rxirq, dev);<br>
&gt;<br>
&gt; --<br>
&gt; 2.31.0.291.g576ba9dcdaf-goog<br>
&gt;<br>
</blockquote></div></div>

--00000000000066594005bed74cca--
