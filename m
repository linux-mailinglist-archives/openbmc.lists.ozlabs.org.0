Return-Path: <openbmc+bounces-766-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E66BEE719
	for <lists+openbmc@lfdr.de>; Sun, 19 Oct 2025 16:30:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqLZl33kzz2xWc;
	Mon, 20 Oct 2025 01:30:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760884255;
	cv=none; b=X3qt1p1wxMAq8kL/hEGvM2ML31v0Z+nAHO3liWLGPh0l/aNJO4+LZ95Ux8UgUBYqzYxXm4Z8/ItmQdGY0HX6XP0/u0dp4nQijD3KYV6DJujr01J0ad+eQMtWKxNtPMq3vvU4i0ot4iMSjZ3sTfBzZ8tsygda4tlEtMUKYEHrH2x8sJ49fmjc18Hg/TgiRie86R6WLToFlX2785C6eEi7Nq4P2CfvAqcKSif3S0d153Edu3Lkvihs1uL+QNp4bim4OcXPe8uxcckoz9ydlOIK2SbVQNtL/Dy080OQhh6Tki5X42eQ6fnnKFwp6QhO6rzqfsiJs9ROOxbPx0yNiRWXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760884255; c=relaxed/relaxed;
	bh=7tGsEwK2MBF2Dx59261RZfpSb76LD81Rwknbg8uYNy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRNjcEcAgOj5VcgrWhKu0Ipv8wzQLmDya/Vwb0JoKv/VMLm87xlU/2tKw8r2vktf8jZLkTqAYD2+/QlRxN3ftoKw4bmSMbY8mrjxUUZoV7KQXj7+nX3EqUNK3jaS4zpc+s4NEHmdWJUvR7IZA4RFesFR/Qq33QDBtmIbTstleMcu72E45sgrP4jMJTvJ7tEdS1Zb0RpzfsUm4uP3LcRA+FOpEsFJ9xe0UN8/ZYT0OhzVCv477FNFgC/FMvd4n3q3C36b9AlcjovsIR4z9YJk5vE9PN8UVEvFCkvFSbJU+bKfKlVaLfibax9wccSvOtpEooOjfX4nnc6Zg3+uJGLj1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tmh4X9mh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tmh4X9mh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqLZj0T0Gz2xS2
	for <openbmc@lists.ozlabs.org>; Mon, 20 Oct 2025 01:30:51 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-7501c24a731so41031497b3.3
        for <openbmc@lists.ozlabs.org>; Sun, 19 Oct 2025 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760884248; x=1761489048; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7tGsEwK2MBF2Dx59261RZfpSb76LD81Rwknbg8uYNy8=;
        b=Tmh4X9mhY1BPa//Se5yHrSIx2v1hbEQeaBvcL8fQ4RM4bzDhiSsy12TMhIZM2CWE88
         DK4j5lO1iYEwFglFCl5MZDhBlNZ2Uw7M/0ZjuSmiIuHU3J7Gd06Sa7YSeWVhiYTVE+VJ
         N0x8y83lCmVWfqVO2Xnl5EmAcYcYNRez/RoaPWJ8BD8JZ0yzwGnHrdN//GwfiPJRyzCw
         KXmE1GfFMVm4UwnQevpoR0vasXWSMPzIsPAtyHynIHhwyEE9mxUj43PoWZZuHVeP14aB
         NYlN5y7CiUotAhTY6Xnq3noq7vxXWNVNomLmxtD2K6ISs1zydAjhsuaw5vSkbumi24+o
         v26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760884248; x=1761489048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tGsEwK2MBF2Dx59261RZfpSb76LD81Rwknbg8uYNy8=;
        b=FpOMqvCPLa7iEAt/Qb+s6KXiglP+aT8uGzamRGPCuPp2UVlP4F3PX2rU5BaVO/e3rC
         /p+dAEK6++d8yfokh9esLDPPQLBjgLgnUWTFkLtAIq9UKw0t06HNhmPS9Th/fXGRID3d
         tMkm89rDQo8W4o2v1K20rgNnbIBurEvndWc0ZgbAGvylTd2ZE8yutrtA7bzr86fxrARG
         y/nfSOlEuH4MBaMAmhzli2XhqM1XitSXC+lpZ0ne7yMXdZC/xbmYedeNAw2tHQ+Idk0J
         aU5tO3tt8632GytN5yeoEKM+tJRrKuTly/4vtvV4a2H8KZnmV5kZwFohR2MOXXGL0g7G
         B8tA==
X-Forwarded-Encrypted: i=1; AJvYcCUgOhK19mOmFnKtza23opGNT2eF70BF0usWJ4/f9rxzR2aG/9u6E0nxgBQbdJDUzf67pZyJ/6pM@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxdS6FaBt+yhfVuluoVyRmKugykbgZFDMyOKBt1YyurS07jthkV
	bduBRT+ER2DL+FiBnzkcQUXo1p35Vl1d0dPhipgtTcHP6yt0jHSmLCXDw77+4Rq0f34hw7bxlr7
	HJVXVEivdE8iGUKffi91qRIIkfHXyAyg=
X-Gm-Gg: ASbGnctICXhVIy8q/WHW3ozp21SbTIhPdMJZwpzjOaMggx0gIZOO4MQWgFPeac3sfel
	Sc+2O1FPZ57uYWhwQTJWSzlluk8Dg3iAtfAyUz1z8JwIeVw/nFL9vEQ0K20IpANOI4JpVgnhWGE
	yf3Xfb8yf/CTyGdjiDU+3HHc80YA7J84dka0C1eMuILF2nuMSQRQIM+KP68bxaeyKFVHShHCZ8T
	iTqhvo+Bt9+OBk1xFgr1KQzb0uCFoMqVOaXXoN9rTm4+F4ZBwF3NPwONYFJvQ==
X-Google-Smtp-Source: AGHT+IEXBXf5fp6N8gRWH4Bjkmje0t1bS3CfCAM8VsGF/0mZQXHWMiaHw1LHvzx+IKF61DQuQnAK8bnWXJvngTC9y6k=
X-Received: by 2002:a53:d013:0:b0:63e:1a04:7305 with SMTP id
 956f58d0204a3-63e1a0473c3mr6725729d50.27.1760884248363; Sun, 19 Oct 2025
 07:30:48 -0700 (PDT)
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
References: <20250925200625.573902-1-tmaimon77@gmail.com> <20250925200625.573902-2-tmaimon77@gmail.com>
 <cc23d41d-6a5e-44d7-ad4b-1b39566dbce8@kernel.org>
In-Reply-To: <cc23d41d-6a5e-44d7-ad4b-1b39566dbce8@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 19 Oct 2025 17:30:37 +0300
X-Gm-Features: AS18NWDwK17WylgkDO0KNjObX6S8rYHnN7mPqUHdwyoQHneGlmBLiKO5kRKc8S8
Message-ID: <CAP6Zq1i7repVa1oAVpyZxWw12-dv0MrVbkfXoqCKga+rp7=8LQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: nuvoton: fix warning and nodes order
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000001d4857064183d079"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000001d4857064183d079
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your comments

On Sun, 19 Oct 2025 at 13:35, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/09/2025 22:06, Tomer Maimon wrote:
> > Fix the warning in the gcr and timer nodes, and modify nodes order by
>
> What warning?
This warning that I got from Andrew mail
[I] 0 andrew@heihei ~/s/k/l/o/build.arm64.default ((00e2ab2e))> make
CHECK_DTBS=y nuvoton/nuvoton-npcm845-evb.dtb
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTC [C] arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb
/home/andrew/src/
kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb:
/ (nuvoton,npcm845-evb): memory@0: 'device_type' is a required property
        from schema $id: http://devicetree.org/schemas/memory.yaml#

*/home/andrew/src/kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb
<http://kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb>:
system-controller@f0800000 (nuvoton,npcm845-gcr): compatible:
['nuvoton,npcm845-gcr', 'syscon'] is too short        from schema $id:
http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-gcr.yaml#
<http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-gcr.yaml#>*
>
> > ascending unit address.
>
> Why are you combining multiple issues into one commit. No. Read
> submitting patches how to organize your work.
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 35 +++++++++----------
> >  1 file changed, 17 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 24133528b8e9..a43514f624c0 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -18,7 +18,7 @@ soc {
> >               ranges;
> >
> >               gcr: system-controller@f0800000 {
> > -                     compatible = "nuvoton,npcm845-gcr", "syscon";
> > +                     compatible = "nuvoton,npcm845-gcr", "syscon",
"simple-mfd";
>
> This makes no sense. No children here.
>
> >                       reg = <0x0 0xf0800000 0x0 0x1000>;
> >               };
> >
> Best regards,
> Krzysztof

Best regards,

Tomer

--0000000000001d4857064183d079
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Krzysztof,<br><br>Thanks for your comments<br><br>On Su=
n, 19 Oct 2025 at 13:35, Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@ker=
nel.org">krzk@kernel.org</a>&gt; wrote:<br>&gt;<br>&gt; On 25/09/2025 22:06=
, Tomer Maimon wrote:<br>&gt; &gt; Fix the warning in the gcr and timer nod=
es, and modify nodes order by<br>&gt;<br>&gt; What warning?<br>This warning=
 that I got from Andrew mail<br>[I] 0 andrew@heihei ~/s/k/l/o/build.arm64.d=
efault ((00e2ab2e))&gt; make CHECK_DTBS=3Dy nuvoton/nuvoton-npcm845-evb.dtb=
<br>=C2=A0 SCHEMA =C2=A0Documentation/devicetree/bindings/processed-schema.=
json<br>=C2=A0 DTC [C] arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb<=
br>/home/andrew/src/<a href=3D"http://kernel.org/linux/origin/build.arm64.d=
efault/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb">kernel.org/linu=
x/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-ev=
b.dtb</a>: / (nuvoton,npcm845-evb): memory@0: &#39;device_type&#39; is a re=
quired property<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 from schema $id: <a href=3D"=
http://devicetree.org/schemas/memory.yaml#">http://devicetree.org/schemas/m=
emory.yaml#</a><br><b>/home/andrew/src/<a href=3D"http://kernel.org/linux/o=
rigin/build.arm64.default/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.d=
tb">kernel.org/linux/origin/build.arm64.default/arch/arm64/boot/dts/nuvoton=
/nuvoton-npcm845-evb.dtb</a>: system-controller@f0800000 (nuvoton,npcm845-g=
cr): compatible: [&#39;nuvoton,npcm845-gcr&#39;, &#39;syscon&#39;] is too s=
hort<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 from schema $id: <a href=3D"http://devi=
cetree.org/schemas/soc/nuvoton/nuvoton,npcm-gcr.yaml#">http://devicetree.or=
g/schemas/soc/nuvoton/nuvoton,npcm-gcr.yaml#</a></b><br>&gt;<br>&gt; &gt; a=
scending unit address.<br>&gt;<br>&gt; Why are you combining multiple issue=
s into one commit. No. Read<br>&gt; submitting patches how to organize your=
 work.<br>&gt;<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Tomer Maimon &lt;<a=
 href=3D"mailto:tmaimon77@gmail.com">tmaimon77@gmail.com</a>&gt;<br>&gt; &g=
t; ---<br>&gt; &gt; =C2=A0.../dts/nuvoton/nuvoton-common-npcm8xx.dtsi =C2=
=A0 | 35 +++++++++----------<br>&gt; &gt; =C2=A01 file changed, 17 insertio=
ns(+), 18 deletions(-)<br>&gt; &gt;<br>&gt; &gt; diff --git a/arch/arm64/bo=
ot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nu=
voton-common-npcm8xx.dtsi<br>&gt; &gt; index 24133528b8e9..a43514f624c0 100=
644<br>&gt; &gt; --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.d=
tsi<br>&gt; &gt; +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.d=
tsi<br>&gt; &gt; @@ -18,7 +18,7 @@ soc {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges;<br>&gt; &gt;<br>&gt; &gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcr: system-controller@f0800000 {<br>&g=
t; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 compatible =3D &quot;nuvoton,npcm845-gcr&quot;, &quot;syscon&quot;;<=
br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 compatible =3D &quot;nuvoton,npcm845-gcr&quot;, &quot;syscon&quo=
t;, &quot;simple-mfd&quot;;<br>&gt;<br>&gt; This makes no sense. No childre=
n here.<br>&gt;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0 0xf0800000 0x0 0x1000&gt;;<=
br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>&gt; &g=
t;<br>&gt; Best regards,<br>&gt; Krzysztof<div><br></div><div>Best regards,=
</div><div><br></div><div>Tomer</div></div>

--0000000000001d4857064183d079--

