Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5426D68F3
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 18:33:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrYH80b4xz3cjF
	for <lists+openbmc@lfdr.de>; Wed,  5 Apr 2023 02:33:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EmYmfCgB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EmYmfCgB;
	dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrYGX5FPYz3cBX
	for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2023 02:33:07 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id t10so132864111edd.12
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 09:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680625983;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9FzQbhTqa+hcR8nAuRNDTTK6271OOzbOUj8QYJme/o=;
        b=EmYmfCgBBH5uZ5bZa0Z0huKSTxZuumhKCm6S+dlpeurKQH5uKeem3y8A3h05JrNMZZ
         ojl6dpr0tCWvwPl2l3JhOP9uIkNrHz+tPNw4ooS8aQNuWX/u76JTV8NZybLNS6kIaIC8
         eSPORoNLVD38jcj+dpSWFD/0CH8TlVN8RwbR1C9coq13fbWMaSGUkoMdiUgIR5hfAwWd
         X072WWen21EaimGYeDKWDDZvMrYctWUefi5TS8x6KWacCn8my9DsTXYILpeOtRmpPyv7
         9OZ3zSlSLDdHWnuAyboT3+EIK806TGjPNFMi4FRPlx6XvXS1Y1iEqinkBaEF2KbIwsuh
         n4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680625983;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9FzQbhTqa+hcR8nAuRNDTTK6271OOzbOUj8QYJme/o=;
        b=rz4J/O9BfWAofWwweq6YnlzJ4LQXWafLcxBlkdb9+b6LvZhw4AoL/m/euH+AI+0ehc
         vJ7e7isZO9pA8jBVhtw0PpkaR+xGdPv++z0jRkj9Or++dK5XkyiFr4LUsTD4jJbSk7U1
         2Enm0O+F3Cq8lSkvMw2FQ6a0VNu3YZBhqyQHU3+xOeLveyWnw2jBh2lAFNaJIm3CVVc5
         C714cStrk9UeGMmUwwoE+kjgrY3IzPwrHRCy67Cn7QXq8GAS2sAnBHKt8EK7DGVyXGxf
         QP0rNDq9K4cCaRx6bNU1PNQjGFryCNOdxZmFYfjil9Z9MU1xUgvjDrS6dUeRGf4UCedt
         bRoA==
X-Gm-Message-State: AAQBX9fPtF0nnDmM2LHTPLAFElcxoL7w2H/1m+lM9NOvszpetXPaPRLJ
	ePdfjxtK+Zlf7vNEr1D9bK/ILE6fPg1+Tywm8Iv+Lw==
X-Google-Smtp-Source: AKy350aV+1Tr0ZzbLQnKquxlChmVmzIflT75Wqq1Tp7nUPcwy0Uva881v7d8Pk0cxesu0COMtLPvnDCVDcQHsDuB/nY=
X-Received: by 2002:a17:906:5501:b0:932:446:b2f7 with SMTP id
 r1-20020a170906550100b009320446b2f7mr83813ejp.6.1680625983475; Tue, 04 Apr
 2023 09:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAD8XohkKcKAgz2qZmiNKtY=878_uj8RWWzUXFnTKA2tV+9MWJQ@mail.gmail.com>
In-Reply-To: <CAD8XohkKcKAgz2qZmiNKtY=878_uj8RWWzUXFnTKA2tV+9MWJQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 4 Apr 2023 09:32:52 -0700
Message-ID: <CAO=notzbOiDgAEO3qHOUqGJD6+kheMDNQ2L0brdsmANsy3==OQ@mail.gmail.com>
Subject: Re: Reg. phosphor-ipmi-flash in openBMC
To: Lukman Mhd <lukmantaqua@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000bfaa8c05f8853acb"
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

--000000000000bfaa8c05f8853acb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+OpenBMC Maillist <openbmc@lists.ozlabs.org>

On Tue, Apr 4, 2023 at 1:53=E2=80=AFAM Lukman Mhd <lukmantaqua@gmail.com> w=
rote:

> Hi Patrick,
>
> This is MuhamadLukman from India working as a software developer in
> oneAMI. This email is to inquire about a few things about
> phosphor-ipmi-flash in the openBMC project. Kindly help to provide your
> valuable suggestion as it could be a great help for me.
>
> I have built open source host tool burn_my_bmc and built an openBMC targe=
t
> image for evb-ast2500/evb-ast2600. When I try to flash BMC from the host
> machine using burn_my_bmc, I'm always getting below output for all the
> interfaces like ipmibt,ipminet,ipmipci,ipmilpc
> example:
> *./burn_my_bmc --command update --interface ipmipci --image image-bmc
> --sig image-bmc.sig --type image*
> /flash/image not found
> Exception received: Goal firmware not supported
>
> I have configured openBMC recipes (recipes-phosphor/ipmi) to support
> phosphor-ipmi-flash in meta-evb-ast2500/meta-evb-ast2600 as below:
>
>
> *\openbmc-master\meta-evb\meta-evb-aspeed\meta-evb-ast2500\recipes-phosph=
or\ipmi\phosphor-ipmi-flash_%.bbappend*
>
> PACKAGECONFIG:append:evb-ast2500 =3D " static-bmc net-bridge aspeed-lpc
> host-bios reboot-update"
> IPMI_FLASH_BMC_ADDRESS:evb-ast2500 =3D "0x99000000"
>
> Could you please advise me why it throws "Exception received: Goal
> firmware not supported" always. How to configure in-band flash support in
> evb-ast2500 target.
> Whether in band flashing support not enabled by default in target
> machines. If so, how can I configure and overcome this issue?
> Could you please explain and provide elaborated steps for flashing openBM=
C
> via phosphor-ipmi-flash.
>
>
I no longer maintain this, see:
https://github.com/openbmc/phosphor-ipmi-flash/blob/master/OWNERS for the
list of current maintainers who can help solve your issue.


> Your help is much appreciated.
> Thanks a lot,
> MuhamadLukman.
>
>
>

--000000000000bfaa8c05f8853acb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"gmail-=
plusReplyChip-1" href=3D"mailto:openbmc@lists.ozlabs.org" tabindex=3D"-1">+=
OpenBMC Maillist</a>=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Apr 4, 2023 at 1:53=E2=80=AFAM Lukman Mhd=
 &lt;<a href=3D"mailto:lukmantaqua@gmail.com">lukmantaqua@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">Hi Patrick,<div><br></div><div><div>This is MuhamadLukman from Ind=
ia working as a software developer in oneAMI. This email is to inquire abou=
t a few things about phosphor-ipmi-flash in the openBMC project. Kindly hel=
p to provide your valuable suggestion as it could be a great help for me.<b=
r></div><div><div><div><div><div><br></div><div>I have built open source ho=
st tool burn_my_bmc and built an openBMC target image for evb-ast2500/evb-a=
st2600. When I try to flash BMC from the host machine using burn_my_bmc, I&=
#39;m always getting below output for all the interfaces like ipmibt,ipmine=
t,ipmipci,ipmilpc</div><div>example:</div><div><b>./burn_my_bmc --command u=
pdate --interface ipmipci --image image-bmc --sig image-bmc.sig --type imag=
e</b><br></div><div>/flash/image not found<br>Exception received: Goal firm=
ware not supported<br></div><div><br></div><div>I have configured openBMC r=
ecipes (recipes-phosphor/ipmi) to support phosphor-ipmi-flash in meta-evb-a=
st2500/meta-evb-ast2600 as below:</div><div><br></div><div><b>\openbmc-mast=
er\meta-evb\meta-evb-aspeed\meta-evb-ast2500\recipes-phosphor\ipmi\phosphor=
-ipmi-flash_%.bbappend</b><br></div><div><b><br></b></div><div>PACKAGECONFI=
G:append:evb-ast2500 =3D &quot; static-bmc net-bridge aspeed-lpc host-bios =
reboot-update&quot;<br>IPMI_FLASH_BMC_ADDRESS:evb-ast2500 =3D &quot;0x99000=
000&quot;<b><br></b></div><div><br></div><div>Could you please advise me wh=
y it throws &quot;Exception received: Goal firmware not supported&quot; alw=
ays. How to configure in-band flash support in evb-ast2500 target.=C2=A0</d=
iv><div>Whether in band flashing support not enabled by default in target m=
achines. If so, how can I configure and overcome this issue?=C2=A0</div><di=
v>Could you please explain and provide elaborated steps for flashing openBM=
C via phosphor-ipmi-flash.=C2=A0</div><div><br></div></div></div></div></di=
v></div></div></blockquote><div><br></div><div>I no longer maintain this, s=
ee:=C2=A0<a href=3D"https://github.com/openbmc/phosphor-ipmi-flash/blob/mas=
ter/OWNERS">https://github.com/openbmc/phosphor-ipmi-flash/blob/master/OWNE=
RS</a> for the list of current maintainers who can help solve your issue.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div><div><div><div><div><div></div><div>Your help is much app=
reciated.</div><div>Thanks a lot,<br></div><div>MuhamadLukman.</div></div><=
/div></div></div><div><br></div><div><br></div></div></div>
</blockquote></div></div>

--000000000000bfaa8c05f8853acb--
