Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66143571237
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 08:25:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhrN41kfbz3c5Z
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 16:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=bglWgpu+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=bglWgpu+;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhrMf4dsnz3bmD
	for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 16:25:00 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id s21so6744839pjq.4
        for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2022 23:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JdFTalYpxr4lbbDMmWLhKdx23pl3T3U3CpkShm/RMtk=;
        b=bglWgpu+PvhG8W9dLdZVKmXSJVBHurs7uPiN9gn0DkbZIsPN98RusL2r9ULz+5JblS
         clXkBuBbv4K8NKsjyraoCDIOi/8auN0EWQP7s9Helqot7Aa53Zh71QAfC8uRImUSltYE
         Fv20hB7rG9mVQ8uFHufCRzqwlYhB3AoQe0IV8v39Q37TiAejmgFXvCkRS9UgJRbhh3p4
         XVhGrZyPJ38Nu8cv75BB4Fjz9UEywg5VW2ycq7ZO9XWzdFdvtIIPivThvGP8vhcBJYyg
         SZnKdcD3ByhETKPQMzwsVNfwHeXPocI2cNGhuY4Xq5+WQUlpCiit9mzCyo9g96PIqccI
         WQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JdFTalYpxr4lbbDMmWLhKdx23pl3T3U3CpkShm/RMtk=;
        b=k7gC5qOKGg9qnx951aurWbfatpSI/EONeECRXa3daSL3nagFlMLmlUUM/9kD1mAtWz
         vbnv7ORCbhL1HHCHWVyjzOLl5kHAJH5jH+AdItg0ijcxu9VgivPh3jVr+CowQQETEsNg
         6qzyK8NEo+0xU2/0MfjOMgB0HGthi/lMj8WcHIRyUiW5f71BZs2QJx7r+sW5aKllcieN
         GNGm+fEy1OMbGFmC8PJ4y5tw6ZVujK3eGOt0MyAbhD2Pisuc2wsYwo8fI5vxPN2XHiCi
         Z73DlWa+Jpwfb4LlaJkUuFNEdLj+isvrkGx6oCnAmTHukI/DNX2+C/GmBKyriartmF7p
         7k7Q==
X-Gm-Message-State: AJIora9xyiiOXD+vB5lOLnEI/T1RGtHl5rI7eYin9kWLKkmYQNm+QdTa
	VRJGLiGtHHtv9vjwxxYQOxWiMEkEyKIU9o/Z+PrbDyE0dvg=
X-Google-Smtp-Source: AGRyM1uGGt7J0zGTluDNtmW3N6X41PDLYQYtoGXIQVCqsqWgTK1TTY53vbFJ1g3fa1kH7kLh8jZzlNDH9qFYySclMxk=
X-Received: by 2002:a17:903:244d:b0:16c:52f1:ceb with SMTP id
 l13-20020a170903244d00b0016c52f10cebmr5466521pls.120.1657607098204; Mon, 11
 Jul 2022 23:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220630110745.345705-1-patrick.rudolph@9elements.com>
In-Reply-To: <20220630110745.345705-1-patrick.rudolph@9elements.com>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Tue, 12 Jul 2022 08:24:46 +0200
Message-ID: <CALNFmy26F4Pu_SDQ3c_M_f7ZE56utxPhwfCr-h9TU0WXwSiPcQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v5 0/2] Add support
 for IBM Genesis3
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004418f905e395ba59"
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
Cc: christian.walter@9elements.com, takken@us.ibm.com, joel@jms.id.au, zweiss@equinix.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004418f905e395ba59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, can you please review this patch series? There was no feedback within
the last 6 weeks.

Regards,
Patrick Rudolph
B.Sc. Electrical Engineering
System Firmware Developer

9elements GmbH, Kortumstra=C3=9Fe 19-21, 44787 Bochum, Germany
Email: patrick.rudolph@9elements.com
Phone:  *+49 234 68 94 188 <+492346894188>*

Sitz der Gesellschaft: Bochum
Handelsregister: Amtsgericht Bochum, HRB 17519
Gesch=C3=A4ftsf=C3=BChrung: Sebastian Deutsch, Eray Basar

Datenschutzhinweise nach Art. 13 DSGVO <https://9elements.com/privacy>


On Thu, Jun 30, 2022 at 1:07 PM Patrick Rudolph <
patrick.rudolph@9elements.com> wrote:

> v5:
>   - Rename Kconfig and don't depend on ASPEED_ALLOW_DANGEROUS_BACKDOORS
>
> v4:
>   - Rebase on upstream
>   - Drop defconfig and add it on openbmc instead
>   - Rename Kconfig for debug uart
>
> v3:
>   - Drop FIRMWARE_2ND_BOOT patch
>   - Include reference board DTS instead of copying it
>   - Rename DTS to ast2500-<boardname>
>   - Describe defconfig changes in commit message
>
> v2:
>   - Fix whitespace and compatible in DTS
>   - Remove board stub
>   - Improve commit message
>   - Rewrite FIRMWARE_2ND_BOOT support
>   - Update defconfig
>
> Patrick Rudolph (2):
>   arm/dts: Add IBM Genesis3 board
>   arm/mach-aspeed: Add support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1
>
>  arch/arm/dts/Makefile                   |  1 +
>  arch/arm/dts/ast2500-genesis3.dts       | 28 +++++++++++++++++++++++++
>  arch/arm/mach-aspeed/Kconfig            |  6 ++++++
>  arch/arm/mach-aspeed/ast2500/platform.S |  2 +-
>  4 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/ast2500-genesis3.dts
>
> --
> 2.35.3
>
>

--0000000000004418f905e395ba59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, can you please review this patch series? There wa=
s no feedback within the last 6 weeks.<br></div><div><br></div><div>Regards=
,<br></div><div><div><div dir=3D"ltr" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Patrick Rudolph<br>B.Sc. Electrical Engineering<br>Syst=
em Firmware Developer</div><div><br></div><div><div>
    <div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px">
      <span style=3D"font-family:Helvetica;font-size:11px">
        <font color=3D"#000000">9elements GmbH, Kortumstra=C3=9Fe 19-21, 44=
787 Bochum, Germany</font>
        </span>
    </div>
    <div>
      <font style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px" face=3D"Helvetica" color=3D"#000000">
        <span style=3D"font-size:11px">
          Email: </span></font><font style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px" face=3D"Helvetica" color=3D"#000000">=
<span style=3D"font-size:11px"><a href=3D"mailto:patrick.rudolph@9elements.=
com" target=3D"_blank">patrick.rudolph@9elements.com</a>
        </span>
      </font>
      <div>
        <span style=3D"color:rgb(34,34,34);font-family:Helvetica;font-size:=
11px">
          <font color=3D"#000000">Phone:=C2=A0</font>
        </span>
        <font face=3D"Helvetica" color=3D"#1155cc">
          <span style=3D"font-size:11px">
            <u><a href=3D"tel:+492346894188" target=3D"_blank">+49 234 68 9=
4 188</a></u>
          </span>
        </font>
      </div>
     =20
    </div>
  </div>

<br>
<div style=3D"color:rgb(34,34,34);font-family:Helvetica;background-color:rg=
b(255,255,255);line-height:11px">
  <div>
    <font size=3D"1" color=3D"#B4B7B8">Sitz der Gesellschaft: Bochum</font>
  </div>
  <div>
    <font size=3D"1" color=3D"#B4B7B8">Handelsregister: Amtsgericht Bochum,=
 HRB 17519</font>
  </div>
  <div>
    <font size=3D"1" color=3D"#B4B7B8">Gesch=C3=A4ftsf=C3=BChrung: Sebastia=
n Deutsch, Eray Basar</font>
  </div>
  <div>
    <br>
    <a href=3D"https://9elements.com/privacy" target=3D"_blank"><font size=
=3D"1" color=3D"#B4B7B8">Datenschutzhinweise nach Art. 13 DSGVO</font></a>
  </div>
</div></div></div></div></div><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 30, 2022 at 1:07 PM Pat=
rick Rudolph &lt;<a href=3D"mailto:patrick.rudolph@9elements.com" target=3D=
"_blank">patrick.rudolph@9elements.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">v5:<br>
=C2=A0 - Rename Kconfig and don&#39;t depend on ASPEED_ALLOW_DANGEROUS_BACK=
DOORS<br>
<br>
v4:<br>
=C2=A0 - Rebase on upstream<br>
=C2=A0 - Drop defconfig and add it on openbmc instead<br>
=C2=A0 - Rename Kconfig for debug uart<br>
<br>
v3:<br>
=C2=A0 - Drop FIRMWARE_2ND_BOOT patch<br>
=C2=A0 - Include reference board DTS instead of copying it<br>
=C2=A0 - Rename DTS to ast2500-&lt;boardname&gt;<br>
=C2=A0 - Describe defconfig changes in commit message<br>
<br>
v2:<br>
=C2=A0 - Fix whitespace and compatible in DTS<br>
=C2=A0 - Remove board stub<br>
=C2=A0 - Improve commit message<br>
=C2=A0 - Rewrite FIRMWARE_2ND_BOOT support<br>
=C2=A0 - Update defconfig<br>
<br>
Patrick Rudolph (2):<br>
=C2=A0 arm/dts: Add IBM Genesis3 board<br>
=C2=A0 arm/mach-aspeed: Add support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1<=
br>
<br>
=C2=A0arch/arm/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0arch/arm/dts/ast2500-genesis3.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0| 28 ++++=
+++++++++++++++++++++<br>
=C2=A0arch/arm/mach-aspeed/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 6 ++++++<br>
=C2=A0arch/arm/mach-aspeed/ast2500/platform.S |=C2=A0 2 +-<br>
=C2=A04 files changed, 36 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 arch/arm/dts/ast2500-genesis3.dts<br>
<br>
-- <br>
2.35.3<br>
<br>
</blockquote></div>

--0000000000004418f905e395ba59--
