Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E482F77B4
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 12:33:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHJwc4kdSzDsfJ
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 22:33:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=shakeebbk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FQmgWgzd; dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHJt42phZzDscV
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 22:31:36 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id l9so7085933ejx.3
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 03:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QYI68WNNtVItUDgNe3C/KJTRrHLpT2W0s6ksS2U92k4=;
 b=FQmgWgzdkuz+FyA+GjoiXnLeTMR8Ogn0nRB4fgB0XydIqKoH2k6UwqdMgi000s3/Mq
 9THs1Gjqtj+ZE998b3YWoYSoPgJO46HxnwFbvQOHhm33xLgYbZB4MjyeUnbHbMa9QYxQ
 TKKiZpGNU9numLyX3QtgEDNMrrhIOTtbnxzU9HyYbzVw+lJ28V/BaCZB/ZFSEJ65GxQ0
 hGNGSDsFdqjnxIP4/T28Cg/xTdlceGIfffpAT8H0uMUpL5hEruVt32SVxg5qiaAgvibo
 ynnLr20NTbDKTpZP58zLv7uH5V3dEDY8L4WXo22HZptStYPAE5Xb35B18ketpQVISN2X
 /npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QYI68WNNtVItUDgNe3C/KJTRrHLpT2W0s6ksS2U92k4=;
 b=RYveoD1F8OlrcOTYXTtouVlkZQpCUeABuM+CoFMSay6LSw8fVW9HfZeYZNITQsZXPO
 tWwEk/Hopyos/tUHJLzPD1b1dhPL9qyYLUj/Ad8ov1o5Sh2P2a00/YtUQBRJeF1HoJ6W
 K+s/ON7BQvmkef+z21W/Cpa/BbGIBYe/HnAVNe3Cn2mcUrdK/nm8yo/CDry5tJ6g8Bct
 oXa/uc4NoMhkmReR7oUNRatWkZxldwKzYRUwrhxyrIb/fz61YrsL3z709ueUTrSZnDlH
 tV5ONEsxEg2YheEun/W0fcaUE5eX/YrFtuqlenERBsrX2ghwesSUv7IM6/+y5gYRk64o
 YXyA==
X-Gm-Message-State: AOAM533gQgSsgSSFzp5SDvsEbNjhpvCgvIjf7lfDDah9yccGe2G+mQXy
 L3/4To/JSCNmQ3MxK+rlNBOlNGQwZG+oQyrei1kCxMu2ndc=
X-Google-Smtp-Source: ABdhPJz7ZfLanaqFGuU5zIrkjOGUhholLSjKKYqqVNGtihZIysLFChtECRxg4WQ/sZknbIB2iMYXe/Df97NU4x+Ve5o=
X-Received: by 2002:a17:906:7cc:: with SMTP id
 m12mr7657861ejc.386.1610710291919; 
 Fri, 15 Jan 2021 03:31:31 -0800 (PST)
MIME-Version: 1.0
References: <CABYu0WhdNyNpJ7n1_LAW2eDv5J9uSmSKDQbMHhjLb6N_moB=ig@mail.gmail.com>
 <4851610708480@mail.yandex-team.ru>
In-Reply-To: <4851610708480@mail.yandex-team.ru>
From: Shakeeb B K <shakeebbk@gmail.com>
Date: Fri, 15 Jan 2021 17:01:20 +0530
Message-ID: <CABYu0WhuqZF37=R4QK-f7TY0dpGRgrzHPnPjYju7r43GaXsDpQ@mail.gmail.com>
Subject: Re: Hot plug support for aspeed-smc driver
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Content-Type: multipart/alternative; boundary="000000000000c938de05b8eeb6b7"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c938de05b8eeb6b7
Content-Type: text/plain; charset="UTF-8"

Thanks for this patch, this seems workable for us. Will test it out.

Regards,
Shakeeb

On Fri, Jan 15, 2021 at 4:38 PM Konstantin Klubnichkin <
kitsok@yandex-team.ru> wrote:

> Hello!
> Yes.
> I've patched SMC driver to not de-instantiate what it created if faulty
> flash is detected.
> With this patch the driver loads with error and then, when I need to
> access SPI flash, I just de-instantiate/instantiate flash device via sysfs
> like this:
>
> SPI_DEV="1e630000.spi"
> SPI_PATH="/sys/bus/platform/drivers/aspeed-smc"
> echo $SPI_DEV > $SPI_PATH/unbind # Unbind device
> echo $SPI_DEV > $SPI_PATH/bind # Bind device
>
> Here is the patch
>
> ======================================================================================
> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> index 0805dca..40a9c5c 100644
> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> @@ -1321,8 +1321,11 @@ static int aspeed_smc_setup_flash(struct
> aspeed_smc_controller *controller,
> }
>
> if (ret) {
> - of_node_put(child);
> - aspeed_smc_unregister(controller);
> + /* As it's the controller we're flying on, it doesn't make sense to
> unregister in case of errors:
> + If we don't have flash with rootfs - we'll die in kernel panic due to
> missing rootfs.
> + If BMC chip is OK and others are missing - it's fine, we can continue.
> + */
> + return 0;
> }
>
> return ret;
> --
> 2.7.4
>
> ======================================================================================
>
>
>
>
> 15.01.2021, 13:43, "Shakeeb B K" <shakeebbk@gmail.com>:
>
> Hi All,
>
> We have a use case for dynamic enabling/disabling access to spi nor flash
> using an external mux.
> This is mainly for data flash access over spi controller.
>
> Since we use aspeed-smc driver for both fmc and smc, we cannot make it
> loadable as of now.
> Is there any way to handle this other than writing a new implementation
> for spi controller?
>
> Thanks,
> Shakeeb
>
>
>
> --
> Best regards,
> Konstantin Klubnichkin,
> lead firmware engineer,
> server hardware R&D group,
> Yandex Moscow office.
> tel: +7-903-510-33-33
>
>

--000000000000c938de05b8eeb6b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for this patch, this seems workable for us. Will te=
st it out.<div><br></div><div>Regards,</div><div>Shakeeb</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 1=
5, 2021 at 4:38 PM Konstantin Klubnichkin &lt;<a href=3D"mailto:kitsok@yand=
ex-team.ru">kitsok@yandex-team.ru</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>Hello!</div><div>Yes.</div><div>I&#39=
;ve patched SMC driver to not de-instantiate what it created if faulty flas=
h is detected.</div><div>With this patch the driver loads with error and th=
en, when I need to access SPI flash, I just de-instantiate/instantiate flas=
h device via sysfs like this:</div><div><div><div>=C2=A0</div><div>SPI_DEV=
=3D&quot;1e630000.spi&quot;</div><div>SPI_PATH=3D&quot;/sys/bus/platform/dr=
ivers/aspeed-smc&quot;</div></div><div>echo $SPI_DEV &gt; $SPI_PATH/unbind =
# Unbind device</div><div><div>echo $SPI_DEV &gt; $SPI_PATH/bind # Bind dev=
ice</div></div></div><div>=C2=A0</div><div>Here is the patch</div><div>=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div><div>diff --git a/drivers/mtd/spi-=
nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c=
</div><div>index 0805dca..40a9c5c 100644</div><div>--- a/drivers/mtd/spi-no=
r/controllers/aspeed-smc.c</div><div>+++ b/drivers/mtd/spi-nor/controllers/=
aspeed-smc.c</div><div>@@ -1321,8 +1321,11 @@ static int aspeed_smc_setup_f=
lash(struct aspeed_smc_controller *controller,</div><div>}</div><div>=C2=A0=
</div><div>if (ret) {</div><div>- of_node_put(child);</div><div>- aspeed_sm=
c_unregister(controller);</div><div>+ /* As it&#39;s the controller we&#39;=
re flying on, it doesn&#39;t make sense to unregister in case of errors:</d=
iv><div>+ If we don&#39;t have flash with rootfs - we&#39;ll die in kernel =
panic due to missing rootfs.</div><div>+ If BMC chip is OK and others are m=
issing - it&#39;s fine, we can continue.</div><div>+ */</div><div>+ return =
0;</div><div>}</div><div>=C2=A0</div><div>return ret;</div><div>--</div><di=
v>2.7.4</div><div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>=C2=A0<=
/div><div>=C2=A0</div></div><div>=C2=A0</div></div><div>=C2=A0</div><div>15=
.01.2021, 13:43, &quot;Shakeeb B K&quot; &lt;<a href=3D"mailto:shakeebbk@gm=
ail.com" target=3D"_blank">shakeebbk@gmail.com</a>&gt;:</div><blockquote><d=
iv>Hi All,<div>=C2=A0</div><div>We have a use case for dynamic enabling/dis=
abling access to spi nor flash using an external mux.</div><div>This is mai=
nly for data flash access=C2=A0over spi controller.=C2=A0</div><div>=C2=A0<=
/div><div>Since we use aspeed-smc driver for both fmc and smc, we cannot ma=
ke it loadable as of now.</div><div>Is there any way to handle this other t=
han writing a new implementation for spi controller?</div><div>=C2=A0</div>=
<div>Thanks,</div><div>Shakeeb</div></div></blockquote><div>=C2=A0</div><di=
v>=C2=A0</div><div>--=C2=A0</div><div>Best regards,</div><div>Konstantin Kl=
ubnichkin,</div><div>lead firmware engineer,</div><div>server hardware R&am=
p;D group,</div><div>Yandex Moscow office.</div><div>tel: +7-903-510-33-33<=
/div><div>=C2=A0</div></blockquote></div>

--000000000000c938de05b8eeb6b7--
