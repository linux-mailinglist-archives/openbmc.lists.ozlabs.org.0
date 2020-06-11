Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D7C1F77CB
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 14:17:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49k09R41hzzDqyv
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 22:17:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=lfprojects.org (client-ip=2607:f8b0:4864:20::d2e;
 helo=mail-io1-xd2e.google.com; envelope-from=manager@lfprojects.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=lfprojects.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lfprojects-org.20150623.gappssmtp.com
 header.i=@lfprojects-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aNaQ9Tbz; dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jb5h6ZhNzDqpG
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jun 2020 06:28:08 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id y5so7828083iob.12
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 13:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lfprojects-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IkQED0JQnZ+39G+OcC+6PX6RelRCug5lJP359+wOB+4=;
 b=aNaQ9Tbz1yO16MfguoUbV1xoyws+W9emSsCAonVlADukXBr2JR1SMWK+T0esJEQD5o
 52vWNHUaIkYSioxc1U1pWlwtn65dxZFFmPO3qbnUOScFsets9kZowQmiB+E6yOHW2txd
 ajA08pTE+fKRwHINb4oQHzO5jFtdJFLL343476s0X1u44E03n3PXgCu2xPo7XNo3m/fT
 TvT7MrmJZYajiW2xdBg7lKA7G2ps/a4vTUokYWVgaGuAoHCW7BT9C1D7ux0Hes8tm/7P
 63o5hYoRPeqFUu7xJhCCjK5FUiCsty21vIR+ZBxUKrcOhRyTbVECDEL7miCXKuW57teT
 C36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IkQED0JQnZ+39G+OcC+6PX6RelRCug5lJP359+wOB+4=;
 b=TaULeW/Cp+fvCtB1OytEeM1uaIZITLtQf+3y9D3X6yILVdd2gBfrGRJjgfnHSz3e9v
 VNS3zpOER3iqNpWJJKQYr34vLANfvDffY1zQbi58Gd5x4w0VCGk5I7Bs5rSJfzIaw2E+
 BnpI2Z5EcSe7hK9aNs6eE4sE42PQVbwO8CsZfl8UVNJnkopVbqtEqjQEleNbJ0eaYTXn
 J9wy55aemcCIsSoGeyKnTIydU/4+DQjcWLrdlCHxG4ZXLnEhMiny0ve4SD2xfLvwALwK
 O7TPU0GkMyg7HvZGY2/Xr4fgnuqnyJhJBSdt11heApUIsPMtOKP80eXgGTpwvQUn/It1
 6WGw==
X-Gm-Message-State: AOAM53046HUiciyuf2wj/MzzaFf8V6/FEy8Fc8EZBYdAe674i/RQq9Wo
 cetWMSBG1XvFsQZS7QMJFYQKq1E+qFn2tNkgmU4R2w==
X-Google-Smtp-Source: ABdhPJwolrnO+ndptUSKRb47JQEg2SdqcFJg1H33E2b9zmnWZEVqxJUNwtXOi+/pXaR0ADWky6KqXBVDY5C0cO4LNLs=
X-Received: by 2002:a02:a70d:: with SMTP id k13mr4972731jam.100.1591907284785; 
 Thu, 11 Jun 2020 13:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <SN1PR12MB25428FA4CD525DF87AC73F8496830@SN1PR12MB2542.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB25428FA4CD525DF87AC73F8496830@SN1PR12MB2542.namprd12.prod.outlook.com>
From: Mike Dolan <manager@lfprojects.org>
Date: Thu, 11 Jun 2020 16:27:53 -0400
Message-ID: <CALVHhecYnixzFTgxbFTcYcgTQNh8JSZpikBnmj4RDo2dax63sg@mail.gmail.com>
Subject: Re: AMD's Signed CCLA
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>,
 Bradley W Bishop <bradleyb@us.ibm.com>
Content-Type: multipart/related; boundary="00000000000039d3d905a7d4cc18"
X-Mailman-Approved-At: Fri, 12 Jun 2020 22:16:55 +1000
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "kurt.r.taylor@gmail.com" <kurt.r.taylor@gmail.com>, "Stephens,
 Christie" <Christie.Stephens@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000039d3d905a7d4cc18
Content-Type: multipart/alternative; boundary="00000000000039d3d705a7d4cc17"

--00000000000039d3d705a7d4cc17
Content-Type: text/plain; charset="UTF-8"

Hi everyone, I'm copying Brad Bishop from the project community who can get
you setup for adding people.

Thanks,

Mike Dolan
manager@lfprojects.org

On Wed, Jun 10, 2020 at 10:36 AM Venkatesh, Supreeth <
Supreeth.Venkatesh@amd.com> wrote:

> [AMD Public Use]
>
> Please find the signed CCLA from AMD attached.
>
> We look forward to working with the OpenBMC community.
>
>
>
> In my previous role, I enjoyed working with the OpenBMC Community and
>
> I look forward to continue collaboration with the OpenBMC Community.
>
>
>
> We have ported OpenBMC on AMD customer reference boards and would like to
> upstream OpenBMC support for AMD customer reference boards.
>
> Can you please help create meta-amd?
>
>
>
>
> Thanks,
>
> *Supreeth Venkatesh*
>
> System Manageability Architect  |*  AMD*
> Server Software
>
>
> *------------------------------------------------------------------------------------------------------------------*
>
> 7171 Southwest Parkway, Austin, TX 78735
>
> Facebook <https://www.facebook.com/AMD> |  Twitter
> <https://twitter.com/AMD> |  amd.com <http://www.amd.com/>
>
> [image: cid:image001.png@01D4ACEA.20484940]
>
>
>

--00000000000039d3d705a7d4cc17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone, I&#39;m copying Brad Bishop from the project =
community who can get you setup for adding people.<div><br></div><div>Thank=
s,</div><div><br></div><div>Mike Dolan</div><div><a href=3D"mailto:manager@=
lfprojects.org">manager@lfprojects.org</a></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 10, 2020 at 10:=
36 AM Venkatesh, Supreeth &lt;<a href=3D"mailto:Supreeth.Venkatesh@amd.com"=
>Supreeth.Venkatesh@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">





<div lang=3D"EN-US">
<p align=3D"Left" style=3D"margin:0px"><span style=3D"font-size:10pt;font-f=
amily:Arial;color:rgb(49,113,0)">[AMD Public Use]</span></p>
<br>
<div class=3D"gmail-m_1053515230859926111WordSection1">
<p class=3D"MsoNormal">Please find the signed CCLA from AMD attached.<u></u=
><u></u></p>
<p class=3D"MsoNormal">We look forward to working with the OpenBMC communit=
y.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">In my previous role, I enjoyed working with the Open=
BMC Community and
<u></u><u></u></p>
<p class=3D"MsoNormal">I look forward to continue collaboration with the Op=
enBMC Community.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">We have ported OpenBMC on AMD customer reference boa=
rds and would like to upstream OpenBMC support for AMD customer reference b=
oards.<u></u><u></u></p>
<p class=3D"MsoNormal">Can you please help create meta-amd?<u></u><u></u></=
p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:black">Thanks,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10pt;font-family:Arial,s=
ans-serif;color:black">Supreeth Venkatesh</span></b><span style=3D"font-siz=
e:10pt;font-family:Arial,sans-serif;color:black"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Arial,sans-=
serif;color:black">System Manageability Architect=C2=A0=C2=A0|<b>=C2=A0=C2=
=A0AMD</b><br>
Server Software<u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:9pt;font-family:Arial,sa=
ns-serif;color:rgb(196,187,160);letter-spacing:-1.4pt">--------------------=
---------------------------------------------------------------------------=
-------------------</span></b><b><span style=3D"font-size:9pt;font-family:A=
rial,sans-serif;color:rgb(196,187,160)"><u></u><u></u></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Arial,sans-=
serif;color:black">7171 Southwest Parkway, Austin, TX 78735<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Arial,sans-=
serif;color:black"><a href=3D"https://www.facebook.com/AMD" target=3D"_blan=
k"><span style=3D"color:black">Facebook</span></a>=C2=A0|=C2=A0=C2=A0<a hre=
f=3D"https://twitter.com/AMD" target=3D"_blank"><span style=3D"color:black"=
>Twitter</span></a>=C2=A0|=C2=A0=C2=A0<a href=3D"http://www.amd.com/" targe=
t=3D"_blank"><span style=3D"color:black">amd.com</span></a></span><span sty=
le=3D"font-size:10pt;font-family:Arial,sans-serif;color:black">=C2=A0=C2=A0=
</span><span style=3D"font-family:Arial,sans-serif;color:black"><u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Arial,sans-serif;color:bl=
ack"><img border=3D"0" width=3D"150" height=3D"35" style=3D"width: 1.5625in=
; height: 0.3645in;" id=3D"gmail-m_1053515230859926111Picture_x0020_11" src=
=3D"cid:172a510ace34cff311" alt=3D"cid:image001.png@01D4ACEA.20484940"><u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</blockquote></div>

--00000000000039d3d705a7d4cc17--

--00000000000039d3d905a7d4cc18
Content-Type: image/png; name="image001.png"
Content-Disposition: inline; filename="image001.png"
Content-Transfer-Encoding: base64
Content-ID: <172a510ace34cff311>
X-Attachment-Id: 172a510ace34cff311

iVBORw0KGgoAAAANSUhEUgAAAJYAAAAjCAYAAAB2BvMkAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAA0xpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQ1IDc5LjE2
MzQ5OSwgMjAxOC8wOC8xMy0xNjo0MDoyMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVz
b3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1N
OkRvY3VtZW50SUQ9InhtcC5kaWQ6Njg2Njg2MTAwRDEzMTFFOTg1OEREMTQ2NTU1Qjg5RTUiIHht
cE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Njg2Njg2MEYwRDEzMTFFOTg1OEREMTQ2NTU1Qjg5RTUi
IHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKE1hY2ludG9zaCkiPiA8
eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9w
OmRmOTM1NGYxLTFiODYtNDE0Zi1hYmE2LWIzZDg0OGUzYjMxYiIgc3RSZWY6ZG9jdW1lbnRJRD0i
YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmRmOTM1NGYxLTFiODYtNDE0Zi1hYmE2LWIzZDg0OGUzYjMx
YiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0
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
PP9xuG0AAAAASUVORK5CYII=
--00000000000039d3d905a7d4cc18--
