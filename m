Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55E29AD33
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 14:24:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLC8y2Ry3zDqF6
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 00:24:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=amDa/74b; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLC6f3zRgzDq6l
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 00:22:17 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id h6so787548pgk.4
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LDbSYZRCT6Wwb/ekgr/XUNDdsztZ7klW1YiFevITEPI=;
 b=amDa/74bEpQKlzZ0tOQlRxL2HAqX5b5IP8IkJana0yIUrcNENaLMq+5nmJP3hgRQMe
 PWQvJA+qlFx0eqTUZFhdZ+NDUpaa4fxTdvNFuDbhww3Bnwl/Gj/0gHAnmKlSlxmxD1KY
 qX2BLeh09BY1Tm8JsGOJvKmshAVMPV+tsBheZ5kQl02qw2SKl9DWIM9X6UtaGweYHnA2
 XjrdITBiU2RRumxLEBZuF44iJYHKhB2UxCcUyEGV9cZpt3zqGd8mlU1i+o5zyLPS1jVk
 aaND5YxB/fuYuEr88TS8mUz1VcBtkQKgD+5swMDxaC3MQhItctrxyJIxjPnTCjBNHjtD
 upvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LDbSYZRCT6Wwb/ekgr/XUNDdsztZ7klW1YiFevITEPI=;
 b=A7CvqsNbyE2eAfKfSCg9BSeV8/o/OdcfEybB9fx9jyMo1dREttdJgVUYqJvqFHvfSv
 tWX/oJaJOz+2DH/EBcb6S7m1PWnzl61P3zGHg0EM2cqyRUtdA/b5ts9EnbfyNO682HT6
 QfngLENYhXWtcjbYjP5kG/XB9d4/rxbig7dI216xZ+vIY/GwKYcImY/BEk4GgVjIHhh/
 ODnWLSLpmHNLdmMHxOHlxOIUkwI1wt+jdP3HNyuuXA5GvSHfKZrQGxUMDmeXcFSggZ4c
 ECrRuX2aA4oGVDKc7ElYn+FL4gYtW78wQv4tMuWIHo+tMh+MYNdeUB+v4txnqgjqfRa7
 V0Lw==
X-Gm-Message-State: AOAM531GvtoDojLTDyIX/LEMXxsd2gT9qxZB3orw04f3U8l3QLh8IHOG
 RxTJqiYOcwk9/ywRnTiGbEgFCP6CGqMjAvFfGZo=
X-Google-Smtp-Source: ABdhPJyaWNJCVtxsvYiZAR6vpMDHFUS8iIWWv4ZTFbdwBRHpaQLOnKVF0ls2CdKvaXP6vNdx5pcSHoAptIsKXvrHxCI=
X-Received: by 2002:a63:e354:: with SMTP id o20mr1959409pgj.317.1603804934038; 
 Tue, 27 Oct 2020 06:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAD+gp9CHnvDk+sU05DhMpuOshST-cAx2LoU+kZJjjEHeKzztMA@mail.gmail.com>
 <CAD+gp9A2OLcJsRtSUH_32G+8fNMx2_8FRBTZjjMuLc+eLZt11Q@mail.gmail.com>
 <CAD+gp9CQeUk1tiFkq0kyzhZjXraacgYwCv232JqRdr+RGc-ABw@mail.gmail.com>
 <1DCD1D9A-FF1C-4833-B525-4564C88352B8@gmail.com>
In-Reply-To: <1DCD1D9A-FF1C-4833-B525-4564C88352B8@gmail.com>
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Tue, 27 Oct 2020 18:52:02 +0530
Message-ID: <CAD+gp9CVAz-Vwa45Pp7E2WNf4fsOz05P3ip1U6mePBReKoNFgg@mail.gmail.com>
Subject: Re: openbmc:Error while running bitbake for raspberrypi-3
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000061e98905b2a6eff6"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000061e98905b2a6eff6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks alot Andrew.

https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36144

These changes worked for me .

Thanks again.

Regards,
Khader



On Sat, 24 Oct 2020 at 00:08, Andrew Geissler <geissonator@gmail.com> wrote=
:

>
>
> > On Oct 23, 2020, at 6:24 AM, khader basha shaik <
> shaikkhaderbasha601@gmail.com> wrote:
> >
> > Hi Team,
> >
> > I tried with  =E2=80=9Cbitbake core-image-base=E2=80=9D  command but st=
ill not working.
> Unable to generate   the rpi-sdimg file.
> >
> > Thanks & Regards,
> > Khader B Shaik
> > On Fri, 23 Oct 2020 at 15:55, khader basha shaik <
> shaikkhaderbasha601@gmail.com> wrote:
> > Hi Team,
> >
> > Any suggestions or input on this please.
>
> Hi Khader, raspberry-pi is definitely looking for a maintainer in OpenBMC=
.
>
> Your error reminded me of this, so may be as simply as doing something
> like this commit:
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36144
>
> There are also some commits out there that I know helped raspberry pi at
> one point:
>
> https://gerrit.openbmc-project.xyz/q/topic:%22raspberrypi%22+(status:open=
%20OR%20status:merged)
>
> Andrew

--00000000000061e98905b2a6eff6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks alot Andrew.<div><br></div><div><a href=3D"https://=
gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36144" rel=3D"noreferr=
er" target=3D"_blank">https://gerrit.openbmc-project.xyz/c/openbmc/meta-pho=
sphor/+/36144</a>=C2=A0</div><div><br></div><div>These changes worked for m=
e .</div><div><br></div><div>Thanks again.</div><div><br></div><div>Regards=
,</div><div>Khader=C2=A0=C2=A0<br><div><br></div><div><br></div></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sa=
t, 24 Oct 2020 at 00:08, Andrew Geissler &lt;<a href=3D"mailto:geissonator@=
gmail.com">geissonator@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
<br>
&gt; On Oct 23, 2020, at 6:24 AM, khader basha shaik &lt;<a href=3D"mailto:=
shaikkhaderbasha601@gmail.com" target=3D"_blank">shaikkhaderbasha601@gmail.=
com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi Team,<br>
&gt; <br>
&gt; I tried with=C2=A0 =E2=80=9Cbitbake core-image-base=E2=80=9D=C2=A0 com=
mand but still not working. Unable to generate=C2=A0 =C2=A0the rpi-sdimg fi=
le.<br>
&gt; <br>
&gt; Thanks &amp; Regards,<br>
&gt; Khader B Shaik<br>
&gt; On Fri, 23 Oct 2020 at 15:55, khader basha shaik &lt;<a href=3D"mailto=
:shaikkhaderbasha601@gmail.com" target=3D"_blank">shaikkhaderbasha601@gmail=
.com</a>&gt; wrote:<br>
&gt; Hi Team,<br>
&gt; <br>
&gt; Any suggestions or input on this please.<br>
<br>
Hi Khader, raspberry-pi is definitely looking for a maintainer in OpenBMC.<=
br>
<br>
Your error reminded me of this, so may be as simply as doing something<br>
like this commit: <br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/361=
44" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz=
/c/openbmc/meta-phosphor/+/36144</a><br>
<br>
There are also some commits out there that I know helped raspberry pi at<br=
>
one point:<br>
<a href=3D"https://gerrit.openbmc-project.xyz/q/topic:%22raspberrypi%22+(st=
atus:open%20OR%20status:merged)" rel=3D"noreferrer" target=3D"_blank">https=
://gerrit.openbmc-project.xyz/q/topic:%22raspberrypi%22+(status:open%20OR%2=
0status:merged)</a><br>
<br>
Andrew</blockquote></div>

--00000000000061e98905b2a6eff6--
