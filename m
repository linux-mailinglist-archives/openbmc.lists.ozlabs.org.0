Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9CA577E3C
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:02:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbZp3Fqdz3bxk
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:02:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=g0z5qJ+h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=naresh.solanki@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=g0z5qJ+h;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXr7M5Lltz3bkh
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 15:46:37 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id dw10-20020a17090b094a00b001ed00a16eb4so14959066pjb.2
        for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 22:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XQsfcuTrW6PCvd3IzADds3QM7CvehQrlrcRUQ07G+0I=;
        b=g0z5qJ+htY1M6w9uxJ//ELl37Iin/mdNCL2y8ZS04Vl+s1SqMvkf2Z3OX0QUQkywXh
         JW2zIaILIKjT9HHBMxqVEn5hVlqmleBVIpqjgsKrbzPrnfMmXjbn58HFm4Ps4/wwbwvD
         WBjQKIH55Ezzhrh/oeV/mNneRX8pxks91fMPpRXmHR6dnYulkCRNkba/44w727h5JJN3
         hTTQPkI/L7pwwHkNBfZhUq+eniXVdvZBk2OtqKY9da0bpc6wwpvbe0LkL5iIfGqpZ3RS
         muuWJpozq985PC24UlPdotIQvc8Z5/TMRz/GOpmtN9KbCCa8bmIE7k5D95hsvarHlJoj
         OjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XQsfcuTrW6PCvd3IzADds3QM7CvehQrlrcRUQ07G+0I=;
        b=UBZNvpzPhZwNKZaIppc1tjXlg6ryiNZ+B5Exx7I3syzhfvmrQra6QtV29VbtFBAsJ9
         JlrGTY8lWf8Q9D4ehRKKhDOvAJJHfxSR3Kjp2hl5+ZMyrrQOOOXyYWW5vVIOGZl1Cw+Q
         nm5tsf7pNoaut019P2zmo2Keu3x5Caw/XuTHllLmrUFtvmaLfpASsAOBF5YtUUhqTPGT
         wDozWu1Iob5SvtInYk+J1R5efIxmTjZl/7QwaUq4sQDknhiKUc7cQjXxRc083JOubyWo
         EXK+S7OuvjbdUOqhV8fSww8iZcsFn6oHVGyiEVELJZ8uydTjFnkxu0TzBcupXXWrzgB/
         Hu7w==
X-Gm-Message-State: AJIora/OyEYSedk0k0iWJPpDlikXcJ0ChVf0YGgJu9+O6B4oPGV50Oyd
	eytC6NTx97N7magg33AdC1MBmUMfXhorRW1tLgQzWOGrjiQ=
X-Google-Smtp-Source: AGRyM1tmXT6gTM8FQ/PGkkIx+ZHm/8IvVjDxlpZz1Sd1BQkrmeIFkNbkldbqoszZyBsfcqou5SvY/HhVZA10I72HaG4=
X-Received: by 2002:a17:90a:8815:b0:1ee:f3f3:2607 with SMTP id
 s21-20020a17090a881500b001eef3f32607mr1999729pjn.72.1656481595902; Tue, 28
 Jun 2022 22:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220628162044.1121337-1-clg@kaod.org> <20220628162044.1121337-5-clg@kaod.org>
In-Reply-To: <20220628162044.1121337-5-clg@kaod.org>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 29 Jun 2022 11:16:25 +0530
Message-ID: <CABqG17gD4VwQiSz_LcnikN+GuQ9UqEZB2hm8pCoJFdbGyoj8BA@mail.gmail.com>
Subject: Re: [PATCH linux 4/5] spi: aspeed: Handle custom decoding ranges
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="00000000000019e2fc05e28fad57"
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:27 +1000
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000019e2fc05e28fad57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Verified for its working.
Thanks


On Tue, 28 Jun 2022 at 21:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> "ranges" predefines settings of the decoding ranges for each CS. If
> found in the DT, the driver applies the settings at probe time. The
> default behavior is to set the decoding range of each CS using the
> flash device size when the spi slave is setup.
>
> Cc: Naresh Solanki <naresh.solanki@9elements.com>
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/spi/spi-aspeed-smc.c | 63 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 1611c354c31f..791cbf753a85 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -101,6 +101,7 @@ struct aspeed_spi {
>         u32                      clk_freq;
>
>         struct aspeed_spi_chip   chips[ASPEED_SPI_MAX_NUM_CS];
> +       bool                     fixed_windows;
>  };
>
>  static u32 aspeed_spi_get_io_mode(const struct spi_mem_op *op)
> @@ -574,7 +575,8 @@ static int aspeed_spi_dirmap_create(struct
> spi_mem_dirmap_desc *desc)
>         if (op->data.dir !=3D SPI_MEM_DATA_IN)
>                 return -EOPNOTSUPP;
>
> -       aspeed_spi_chip_adjust_window(chip, desc->info.offset,
> desc->info.length);
> +       if (!aspi->fixed_windows)
> +               aspeed_spi_chip_adjust_window(chip, desc->info.offset,
> desc->info.length);
>
>         if (desc->info.length > chip->ahb_window_size)
>                 dev_warn(aspi->dev, "CE%d window (%dMB) too small for
> mapping",
> @@ -749,6 +751,61 @@ static const struct attribute_group
> aspeed_spi_attribute_group =3D {
>         .attrs =3D aspeed_spi_attributes
>  };
>
> +static int aspeed_spi_chip_read_ranges(struct device_node *node, struct
> aspeed_spi *aspi)
> +{
> +       const char *range_prop =3D "ranges";
> +       struct property *prop;
> +       struct aspeed_spi_window ranges[ASPEED_SPI_MAX_NUM_CS];
> +       int prop_size;
> +       int count;
> +       int ret;
> +       int i;
> +
> +       prop =3D of_find_property(node, range_prop, &prop_size);
> +       if (!prop)
> +               return 0;
> +
> +       count =3D prop_size / sizeof(*ranges);
> +       if (count > aspi->data->max_cs) {
> +               dev_err(aspi->dev, "invalid '%s' property %d\n",
> range_prop, count);
> +               return -EINVAL;
> +       }
> +
> +       if (count < aspi->data->max_cs)
> +               dev_dbg(aspi->dev, "'%s' property does not cover all CE\n=
",
> +                       range_prop);
> +
> +       ret =3D of_property_read_u32_array(node, range_prop, (u32 *)range=
s,
> count * 4);
> +       if (ret)
> +               return ret;
> +
> +       dev_info(aspi->dev, "Using preset decoding ranges\n");
> +       for (i =3D 0; i < count; i++) {
> +               struct aspeed_spi_window *win =3D &ranges[i];
> +
> +               if (win->cs > aspi->data->max_cs) {
> +                       dev_err(aspi->dev, "CE%d range is invalid",
> win->cs);
> +                       return -EINVAL;
> +               }
> +
> +               /* Trim top bit of the address to keep offset */
> +               win->offset &=3D aspi->ahb_window_size - 1;
> +
> +               /* Minimal check */
> +               if (win->offset + win->size > aspi->ahb_window_size) {
> +                       dev_warn(aspi->dev, "CE%d range is too large",
> win->cs);
> +                               return -EINVAL;
> +               }
> +
> +               ret =3D aspeed_spi_set_window(aspi, win);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       aspi->fixed_windows =3D true;
> +       return 0;
> +}
> +
>  static int aspeed_spi_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -806,6 +863,10 @@ static int aspeed_spi_probe(struct platform_device
> *pdev)
>                 return ret;
>         }
>
> +       ret =3D aspeed_spi_chip_read_ranges(dev->of_node, aspi);
> +       if (ret)
> +               return ret;
> +
>         /* IRQ is for DMA, which the driver doesn't support yet */
>
>         ctlr->mode_bits =3D SPI_RX_DUAL | SPI_TX_DUAL | data->mode_bits;
> --
> 2.35.3
>
>

--00000000000019e2fc05e28fad57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"co=
lor:rgb(34,34,34);font-size:medium;font-family:Helvetica;line-height:11px">=
Verified for its working.</div><div style=3D"color:rgb(34,34,34);font-size:=
medium;font-family:Helvetica;line-height:11px">Thanks</div><div style=3D"co=
lor:rgb(34,34,34);font-size:medium;font-family:Helvetica;line-height:11px">=
<br></div><div style=3D"color:rgb(34,34,34);font-size:medium;font-family:He=
lvetica;line-height:11px"><br></div></div></div></div></div><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 28 Jun 2022 at 21=
:51, C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
&quot;ranges&quot; predefines settings of the decoding ranges for each CS. =
If<br>
found in the DT, the driver applies the settings at probe time. The<br>
default behavior is to set the decoding range of each CS using the<br>
flash device size when the spi slave is setup.<br>
<br>
Cc: Naresh Solanki &lt;<a href=3D"mailto:naresh.solanki@9elements.com" targ=
et=3D"_blank">naresh.solanki@9elements.com</a>&gt;<br>
Cc: Chin-Ting Kuo &lt;<a href=3D"mailto:chin-ting_kuo@aspeedtech.com" targe=
t=3D"_blank">chin-ting_kuo@aspeedtech.com</a>&gt;<br>
Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" ta=
rget=3D"_blank">clg@kaod.org</a>&gt;<br>
---<br>
=C2=A0drivers/spi/spi-aspeed-smc.c | 63 +++++++++++++++++++++++++++++++++++=
-<br>
=C2=A01 file changed, 62 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c<br=
>
index 1611c354c31f..791cbf753a85 100644<br>
--- a/drivers/spi/spi-aspeed-smc.c<br>
+++ b/drivers/spi/spi-aspeed-smc.c<br>
@@ -101,6 +101,7 @@ struct aspeed_spi {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_freq;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct aspeed_spi_chip=C2=A0 =C2=A0chips[ASPEED=
_SPI_MAX_NUM_CS];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fixed_windows;<br>
=C2=A0};<br>
<br>
=C2=A0static u32 aspeed_spi_get_io_mode(const struct spi_mem_op *op)<br>
@@ -574,7 +575,8 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirm=
ap_desc *desc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (op-&gt;data.dir !=3D SPI_MEM_DATA_IN)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EOPNOTSUPP;=
<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_spi_chip_adjust_window(chip, desc-&gt;in=
fo.offset, desc-&gt;info.length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!aspi-&gt;fixed_windows)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_spi_chip_adj=
ust_window(chip, desc-&gt;info.offset, desc-&gt;info.length);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc-&gt;info.length &gt; chip-&gt;ahb_wind=
ow_size)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_warn(aspi-&gt;d=
ev, &quot;CE%d window (%dMB) too small for mapping&quot;,<br>
@@ -749,6 +751,61 @@ static const struct attribute_group aspeed_spi_attribu=
te_group =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .attrs =3D aspeed_spi_attributes<br>
=C2=A0};<br>
<br>
+static int aspeed_spi_chip_read_ranges(struct device_node *node, struct as=
peed_spi *aspi)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *range_prop =3D &quot;ranges&quot;;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct property *prop;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_spi_window ranges[ASPEED_SPI_MAX_=
NUM_CS];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int prop_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0prop =3D of_find_property(node, range_prop, &am=
p;prop_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!prop)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D prop_size / sizeof(*ranges);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &gt; aspi-&gt;data-&gt;max_cs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(aspi-&gt;de=
v, &quot;invalid &#39;%s&#39; property %d\n&quot;, range_prop, count);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &lt; aspi-&gt;data-&gt;max_cs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(aspi-&gt;de=
v, &quot;&#39;%s&#39; property does not cover all CE\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0range_prop);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32_array(node, range_=
prop, (u32 *)ranges, count * 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(aspi-&gt;dev, &quot;Using preset decod=
ing ranges\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; count; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_spi_w=
indow *win =3D &amp;ranges[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (win-&gt;cs &gt;=
 aspi-&gt;data-&gt;max_cs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(aspi-&gt;dev, &quot;CE%d range is invalid&quot;, win-&gt;=
cs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Trim top bit of =
the address to keep offset */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0win-&gt;offset &amp=
;=3D aspi-&gt;ahb_window_size - 1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Minimal check */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (win-&gt;offset =
+ win-&gt;size &gt; aspi-&gt;ahb_window_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_warn(aspi-&gt;dev, &quot;CE%d range is too large&quot;, win-&=
gt;cs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D aspeed_spi_=
set_window(aspi, win);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aspi-&gt;fixed_windows =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static int aspeed_spi_probe(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>
@@ -806,6 +863,10 @@ static int aspeed_spi_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D aspeed_spi_chip_read_ranges(dev-&gt;of_=
node, aspi);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* IRQ is for DMA, which the driver doesn&#39;t=
 support yet */<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctlr-&gt;mode_bits =3D SPI_RX_DUAL | SPI_TX_DUA=
L | data-&gt;mode_bits;<br>
-- <br>
2.35.3<br>
<br>
</blockquote></div></div>

--00000000000019e2fc05e28fad57--
