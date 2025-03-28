Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7434A75D4F
	for <lists+openbmc@lfdr.de>; Mon, 31 Mar 2025 01:24:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQr272hMtz3dXS
	for <lists+openbmc@lfdr.de>; Mon, 31 Mar 2025 10:24:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743190455;
	cv=none; b=jwET/MKffIzl6Y0yOn9fyZ25DG/PlJ8VpHRphenJVdASFQETIxXfEI50kJGkKeeo84adDWIkhuZK0Dt7gAuAp+7gpAWQrUYKBsu3o22uhm90W1Zg6itmWiY/pHVErVD3fRSN9GFOCDPP6Io2e+kWW3FjfqGbuXJpyT39ZYEMgV6bygvoqZGZPlZCtVHaWmP1O5OFh2O+2cBDJKN/RE49uBWaiTpsjtEkKI9SiHjslKQTWuio4Abp3lWjcvmU7szOFHqg4WfkjWeYDkbwuYrwbrGC0ly/ccZKebkn4KY2FCVZiwq7b0Osk1rO9HfjI/jRBosIITSpI78HP6BScjFLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743190455; c=relaxed/relaxed;
	bh=jEsZeKkCSJE/RqF1NfH3Pi2anuv0fHcdv6E6yVQATWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=BRD0y1kCI/euY6AYXHO+1OfNsfVcstoh8bP/URZKMvnrJ2pJgXUHVEKTLbKh+gpGbfayXP1ih3/NphP5sU0GsI65UDa6eqCao4iMpfbJOZz96KCaXGNcnl+E5jbZJFyWnCU71sSTbRW0jZPVivYGnEAv5hVqRQgRI0vDdkzQKey7tPPB/myDj2LuEjv8/N2b/OOlSOlTYsLQF0LN/EjvGqNROfYDnUmCRGDLys0ijrcRqpIaViZeQCD8d05gAXByeQQnCtLisQqn6zJmIHR22fWjxFfAMPBmcU711iZK//GseeMhvtCezFoy8BCZvEJjjG4XRFo7rQFL7d4lvfxwIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IWx4XlXO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IWx4XlXO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPW1L1m8Xz2ygH
	for <openbmc@lists.ozlabs.org>; Sat, 29 Mar 2025 06:34:14 +1100 (AEDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so23782496d6.2
        for <openbmc@lists.ozlabs.org>; Fri, 28 Mar 2025 12:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743190449; x=1743795249; darn=lists.ozlabs.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEsZeKkCSJE/RqF1NfH3Pi2anuv0fHcdv6E6yVQATWM=;
        b=IWx4XlXOvbPZC2qDYz8/Hd6DkZmpbvuHdMl3uTZVcjFDKD5mvtLD4O9q+WAvd0V7zq
         vJJ+IOFYHc37XimOKtEEYHs58jfTmf0d7shj5DicAe2gE1rs4ngKJFzcd6mQNOMRI7Uc
         IkPkG6FAWjb+6YkD9zBgO9fCOqmFiyWA57Kl5nDkSuvXPnIAr23Klq8p1T+7DfgjkYnv
         MIVBvncxQVdHCnsH0ucVKhqmtphoFSQezKFKi3UvIC+nImsqGu4vTBrDpKcLOWpwo1NP
         ZTPhtg2wnkEqiT+TFm4H9sKmAXDc88QLu/UAi5VI/qZTPvNb8l2JW/UoeOvQ/YsqeqQN
         0dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743190449; x=1743795249;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEsZeKkCSJE/RqF1NfH3Pi2anuv0fHcdv6E6yVQATWM=;
        b=NpuxCelQNyUyysigTpOxIXq6s9uZkO7zqonrFJyxeA8XIW1GJzDyT9GCE9Z2jykPII
         ni7rBUxM4KbdzQpNwPD66u7nKDWzLddanPXOxIVUqeAMzX07pBruyw5UG1nFcEbESjuQ
         kDtjaC2k+Ov+F3FhJg4dOWB7nxQH/I33bz87+bU6CZrnxCSw0PfnQNBEPBWc4OryKQfK
         Dtg5VvwwrFQny/fQFLrmwh/W5fcLWb2XTCSgXZU26yaXwMUtByX1hwsB85XU50tCgGnK
         2pKsDTSwWJyBiISBbt1fdqpAs2af4nFysQXLqGGZeuUvRUVV1rFM445GW4XDzbO1HCCh
         YCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXz/56DFed8S3EpMh6c0ByDbE3JFq9z1CCthUy3MErC8yExe75CyInsFct1xEYOW+m5M6XFHWB@lists.ozlabs.org
X-Gm-Message-State: AOJu0YypCwbMX2jDTGKZdxv6iEwNQfefo9oHWoWrJDRT8jGylohCPDfb
	GjV1eG/2TPraXeDUUn98o7G9zf+UBhopEPRqPHq0QF2iYoIdEFnbDf0N8shSHB6dAiZPP4Oq1W9
	GmpZrOOHaZoc8Qu/jy/nvLDeTLTo=
X-Gm-Gg: ASbGnct0/rpnfbqcqWFfwUyc8l8a0pDknUpQvjNih7BvYUfoHbQDKiexYg3vMDtN9d2
	fC+X71JK6BU/j3/JIEGDbGfD71oo/1Nki3JR6KFHgh5LLV5m4Kt53EHBPzc9CVRbsgy1VOd/C0s
	HDD7JbxzGecbwdtaigsEJ5+68iuxEsMe/TULY2NvrGkXq0OqU4je+a92LU
X-Received: by 2002:a05:6214:e67:b0:6ed:14cd:d179 with SMTP id
 6a1803df08f44-6eed5f9d392mt5080256d6.3.1743190449509; Fri, 28 Mar 2025
 12:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com> <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
In-Reply-To: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
From: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Date: Fri, 28 Mar 2025 12:33:58 -0700
X-Gm-Features: AQ5f1JpGcPCFUP62kC2WxdgIHi_knzjN_TYXQvNQR5Hthy1ecISD1sdfQKEPUOU
Message-ID: <CAHdq5QGXAhswyYrKOaZEArENJGit1uxsn0WA4hafYVscK-MbRg@mail.gmail.com>
Subject: Re: [PATCH v4] i2c: npcm: Add clock toggle recovery
Content-Type: multipart/alternative; boundary="00000000000085fbd306316c2718"
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	MALFORMED_FREEMAIL,MISSING_HEADERS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 31 Mar 2025 10:24:24 +1100
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000085fbd306316c2718
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Mukesh. Updated patch uploaded.

Mo

On Fri, Mar 28, 2025 at 12:33=E2=80=AFPM <mohammed.0.elbadry@gmail.com> wro=
te:

> From: Tali Perry <tali.perry1@gmail.com>
>
> During init of the bus, the module checks that the bus is idle.
> If one of the lines are stuck try to recover them first before failing.
> Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).
>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c
> b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2fe68615942e..caf9aa1e6319 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1967,10 +1967,14 @@ static int npcm_i2c_init_module(struct npcm_i2c
> *bus, enum i2c_mode mode,
>
>         /* Check HW is OK: SDA and SCL should be high at this point. */
>         if ((npcm_i2c_get_SDA(&bus->adap) =3D=3D 0) ||
> (npcm_i2c_get_SCL(&bus->adap) =3D=3D 0)) {
> -               dev_err(bus->dev, "I2C%d init fail: lines are low\n",
> bus->num);
> -               dev_err(bus->dev, "SDA=3D%d SCL=3D%d\n",
> npcm_i2c_get_SDA(&bus->adap),
> -                       npcm_i2c_get_SCL(&bus->adap));
> -               return -ENXIO;
> +               dev_warn(bus->dev, " I2C%d SDA=3D%d SCL=3D%d, attempting =
to
> recover\n", bus->num,
> +                                npcm_i2c_get_SDA(&bus->adap),
> npcm_i2c_get_SCL(&bus->adap));
> +               if (npcm_i2c_recovery_tgclk(&bus->adap)) {
> +                       dev_err(bus->dev, "I2C%d init fail: SDA=3D%d
> SCL=3D%d\n",
> +                               bus->num, npcm_i2c_get_SDA(&bus->adap),
> +                               npcm_i2c_get_SCL(&bus->adap));
> +                       return -ENXIO;
> +               }
>         }
>
>         npcm_i2c_int_enable(bus, true);
> --
> 2.49.0.472.ge94155a9ec-goog
>
>

--00000000000085fbd306316c2718
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you,=C2=A0Mukesh. Updated patch uploaded.<div><br></=
div><div>Mo</div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 28, 2025 at 12:33=E2=80=
=AFPM &lt;<a href=3D"mailto:mohammed.0.elbadry@gmail.com">mohammed.0.elbadr=
y@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com" ta=
rget=3D"_blank">tali.perry1@gmail.com</a>&gt;<br>
<br>
During init of the bus, the module checks that the bus is idle.<br>
If one of the lines are stuck try to recover them first before failing.<br>
Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).<br>
<br>
Signed-off-by: Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com" targ=
et=3D"_blank">tali.perry1@gmail.com</a>&gt;<br>
Signed-off-by: Mohammed Elbadry &lt;<a href=3D"mailto:mohammed.0.elbadry@gm=
ail.com" target=3D"_blank">mohammed.0.elbadry@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----<br>
=C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm=
7xx.c<br>
index 2fe68615942e..caf9aa1e6319 100644<br>
--- a/drivers/i2c/busses/i2c-npcm7xx.c<br>
+++ b/drivers/i2c/busses/i2c-npcm7xx.c<br>
@@ -1967,10 +1967,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bu=
s, enum i2c_mode mode,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check HW is OK: SDA and SCL should be high a=
t this point. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((npcm_i2c_get_SDA(&amp;bus-&gt;adap) =3D=3D=
 0) || (npcm_i2c_get_SCL(&amp;bus-&gt;adap) =3D=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(bus-&gt;dev=
, &quot;I2C%d init fail: lines are low\n&quot;, bus-&gt;num);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(bus-&gt;dev=
, &quot;SDA=3D%d SCL=3D%d\n&quot;, npcm_i2c_get_SDA(&amp;bus-&gt;adap),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0npcm_i2c_get_SCL(&amp;bus-&gt;adap));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(bus-&gt;de=
v, &quot; I2C%d SDA=3D%d SCL=3D%d, attempting to recover\n&quot;, bus-&gt;n=
um,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm_i2c_get_SDA(&amp;bus-&gt;adap),=
 npcm_i2c_get_SCL(&amp;bus-&gt;adap));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (npcm_i2c_recove=
ry_tgclk(&amp;bus-&gt;adap)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(bus-&gt;dev, &quot;I2C%d init fail: SDA=3D%d SCL=3D%d\n&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-&gt;num, npcm_i2c_get_SDA(&amp;bu=
s-&gt;adap),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm_i2c_get_SCL(&amp;bus-&gt;adap));=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENXIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm_i2c_int_enable(bus, true);<br>
-- <br>
2.49.0.472.ge94155a9ec-goog<br>
<br>
</blockquote></div>

--00000000000085fbd306316c2718--
