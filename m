Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B04D62B3
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 14:57:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFSDX390sz30J9
	for <lists+openbmc@lfdr.de>; Sat, 12 Mar 2022 00:57:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=evg1syco;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=evg1syco; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFSD64G2Wz2yjS
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2022 00:57:08 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id bu29so15277534lfb.0
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 05:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MW/elKEDTh0ZwJITFxFx/C/MhHPPv27Q6nE9F+fyVdw=;
 b=evg1sycoN0Ly3S6HIGwc6R7GEw1X1Y2TUGOpDVap4n3uIooh6V+hQu4i9ZKFuKrlAG
 c5I1tBOYF+d8SlaR1y+CKxIwKCzcsPrIA2kE8OUtZ3ClNUsmnb9OS32epo2Se/SiWx2R
 B4MdhNgjFZNOwgl9CkhJaBvfnsp0EsafpRWVqON3J8LshLWINnsjdYBYob5MnJ5rUsr9
 F4fVQOOvVZto2OIiZC3/rqOUp139sjB/BoFunnHTbdD9Lv34K8UB6vgu/K3kV3NjP4AY
 4fCZCfCyvKsp47yvdg0h+wY+y0+Hi0P9VkHRFT9ApjEWbYEkuoOh/RS3F8b3ayJvSRm6
 jO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MW/elKEDTh0ZwJITFxFx/C/MhHPPv27Q6nE9F+fyVdw=;
 b=GTk+tT70NYflzQ/REV87aWcDkg8EOeIpPj+ov+bgGjbIrW5EnClZ5xEAW+FUmJ2i5P
 V1pmfgy7cxEsUZX+fxuzUr5+l+ttWKVS2PzqJ/8SsH3YUg59iqRtrW059Q/UTog5MIU0
 bNFFcNnDTjYc6s+y5dcYIYKPm8Rp0Z81YN9GCFqVpLazchtQ/C8IHG4JEBfvveBTZBM5
 Jp6xPAVtseEpFToy9F0d+ocKsPNgmO+G0vODwFMhR+rymsddRUDSHLitSSKVkYj4Vci1
 8mmYPfMeSwP6jrqYB9EvunVvphA/MKf4wUmXYmhN8ORqlKNKiW5+jQlAboQ9tIwGVm+H
 yoCg==
X-Gm-Message-State: AOAM533D8UEXtHQPs6ZZSEU2Xe0SBr0KTT0ZY+DHoFjsybfG1L3SX2n7
 uJ8BbEF8agZmFv//L8fENi5BJnXiVYnK6Sh9ZaA=
X-Google-Smtp-Source: ABdhPJwUxWRLqf6LDP3rzf4YerR1uNsH9+peqQJoHPx5E9pOZJgzRWxO7VzUOtG/G6gbYBhy9s0jUIVK1rvdFq8ueC8=
X-Received: by 2002:ac2:4dae:0:b0:448:127f:d15 with SMTP id
 h14-20020ac24dae000000b00448127f0d15mr6033696lfe.185.1647007023042; Fri, 11
 Mar 2022 05:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-3-ctcchien@nuvoton.com>
 <1647005325.599595.3638164.nullmailer@robh.at.kernel.org>
In-Reply-To: <1647005325.599595.3638164.nullmailer@robh.at.kernel.org>
From: Medad Young <medadyoung@gmail.com>
Date: Fri, 11 Mar 2022 21:56:50 +0800
Message-ID: <CAHpyw9ceyS_HceL7=HdJrq-hnu2XomgNcTkai6+vL+GTJ0ZY3A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: edac: nuvoton,
 npcm-memory-controller.yaml
To: Rob Herring <robh@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000008d172f05d9f1b446"
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 tmaimon77@gmail.com, linux-edac@vger.kernel.org, devicetree@vger.kernel.org,
 avifishman70@gmail.com, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, KFTING <KFTING@nuvoton.com>, JJLIU0@nuvoton.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tali.perry1@gmail.com,
 ctcchien@nuvoton.com, james.morse@arm.com, bp@alien8.de, YSCHU@nuvoton.com,
 mchehab@kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008d172f05d9f1b446
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, I will check.

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B43=E6=9C=8811=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:29 =E5=AF=AB=E9=81=93=EF=BC=9A

> On Fri, 11 Mar 2022 09:42:44 +0800, Medad CChien wrote:
> > Add device tree bindings for NPCM memory controller.
> >
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > ---
> >  .../edac/nuvoton,npcm-memory-controller.yaml  | 62 +++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yam=
l
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.y=
aml:
> $id: relative path/filename doesn't match actual path or filename
>         expected:
> http://devicetree.org/schemas/edac/nuvoton,npcm-memory-controller.yaml#
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1604217
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
>

--0000000000008d172f05d9f1b446
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, I will check.=C2=A0</div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Rob Herring &lt;<a href=3D"mailto:=
robh@kernel.org">robh@kernel.org</a>&gt; =E6=96=BC 2022=E5=B9=B43=E6=9C=881=
1=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:29 =E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Fri, 11 Mar 2022 09:42:44=
 +0800, Medad CChien wrote:<br>
&gt; Add device tree bindings for NPCM memory controller.<br>
&gt; <br>
&gt; Signed-off-by: Medad CChien &lt;<a href=3D"mailto:ctcchien@nuvoton.com=
" target=3D"_blank" rel=3D"noreferrer">ctcchien@nuvoton.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../edac/nuvoton,npcm-memory-controller.yaml=C2=A0 | 62 ++++++++=
+++++++++++<br>
&gt;=C2=A0 1 file changed, 62 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/edac/nuvoto=
n,npcm-memory-controller.yaml<br>
&gt; <br>
<br>
My bot found errors running &#39;make DT_CHECKER_FLAGS=3D-m dt_binding_chec=
k&#39;<br>
on your patch (DT_CHECKER_FLAGS is new in v5.13):<br>
<br>
yamllint warnings/errors:<br>
<br>
dtschema/dtc warnings/errors:<br>
./Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yam=
l: $id: relative path/filename doesn&#39;t match actual path or filename<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected: <a href=3D"http://devicetree.org/sche=
mas/edac/nuvoton,npcm-memory-controller.yaml#" rel=3D"noreferrer noreferrer=
" target=3D"_blank">http://devicetree.org/schemas/edac/nuvoton,npcm-memory-=
controller.yaml#</a><br>
<br>
doc reference errors (make refcheckdocs):<br>
<br>
See <a href=3D"https://patchwork.ozlabs.org/patch/1604217" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/patch/1604217<=
/a><br>
<br>
This check can fail if there are any dependencies. The base for a patch<br>
series is generally the most recent rc1.<br>
<br>
If you already ran &#39;make dt_binding_check&#39; and didn&#39;t see the a=
bove<br>
error(s), then make sure &#39;yamllint&#39; is installed and dt-schema is u=
p to<br>
date:<br>
<br>
pip3 install dtschema --upgrade<br>
<br>
Please check and re-submit.<br>
<br>
</blockquote></div>

--0000000000008d172f05d9f1b446--
