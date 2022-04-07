Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5724F82B3
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 17:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ4qf0YP9z3bYZ
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 01:22:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KatwfcGk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e;
 helo=mail-ej1-x62e.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KatwfcGk; dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ4qD0cwQz2xCB
 for <openbmc@lists.ozlabs.org>; Fri,  8 Apr 2022 01:21:41 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id qh7so11501466ejb.11
 for <openbmc@lists.ozlabs.org>; Thu, 07 Apr 2022 08:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qItPZ/nN0/mYv/SJc1MqlBTum0dcB+dG3mM6By5Mk0Q=;
 b=KatwfcGkmb516xIzR5egypkQLbqdEGhv5Q5qo6cQXvE0gpymj/kkZsXe++6DYgGOpv
 5+tP9PBF7yH0E/6v5VlCBw3ou0PiUlZeR5QrjnBqOWPZFAOyY2hAppNgDZxLlKPvRBRs
 rNn/vpr05PZKeJ8DTvtzXJHJc226onRKPda3XtAhhsnuy5ooSGFm8iIEixBsQPUFqXxW
 zaGp3qpjUbieIkehfnDZ5Ft9Xtap7VneLMMTLqtpD2SS0vV/OoFn8KEjNsSQNvOqG2FG
 3CVLpGdB8QQwk2d0W+qiDkTgqxknuPxcavSYDqzBEXjW8Z6NtHCQ6e73twYrFh9OxbvL
 BZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qItPZ/nN0/mYv/SJc1MqlBTum0dcB+dG3mM6By5Mk0Q=;
 b=QQ08w2fMOLlQJGVHDMDTE4BxTA4VdcuY8V/Y2q9KZ9vbigUaIpVbJjli2T6tOIl2cf
 awTxmqfbRRsYhUBv3l5TJQqWuHcgJ8yuuYxUWhLGz25usdE0BVlRGjqZD6Bg1r2hP6Vw
 0KB11T2zoRovXH3AJVG9LwgTNfEN4r2V3uei6t3YsXGmJv21CWDBRlg+LXF8LSVItZPI
 IoklftNCkz9P5UnCPYE6tJl7L9JUK28DzB05wewpXIzTeqVaAJNJFy80oI4s1IQ+jFxG
 rcVfCRl540DtUixvP8NEq4MXrenvuHspy4CBPO+ohgkkG1g1Ah5FVBLROvWd0VRt/Z02
 BoWA==
X-Gm-Message-State: AOAM531NGSTOKJfW2bwtyvV3yLfBNJ682onuCIi3SNGj5Y2wtTqv0WIX
 mgeFVTwxmpMUaznHcqJiKacn7/EGOL0cpHzOstr4jqzw
X-Google-Smtp-Source: ABdhPJzybPpMHBXLu++8Kduo+TIsZBF+WaRqWEsi61lZ9vRq1tjpCME+5oACgRMK5gnZWo+5sFXAlt75p+hikn7L81c=
X-Received: by 2002:a17:907:2d27:b0:6e8:3ea6:7645 with SMTP id
 gs39-20020a1709072d2700b006e83ea67645mr2712647ejc.727.1649344893869; Thu, 07
 Apr 2022 08:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
In-Reply-To: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Thu, 7 Apr 2022 20:51:22 +0530
Message-ID: <CAA7Tbcs9HOTbA0nZFXOa1twU3XWfbttNMvjYtJ35+H2K6Ous3w@mail.gmail.com>
Subject: Re: IPMI Restriction Mode
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000082eddf05dc120829"
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
Cc: anoo@us.ibm.com, Amithash Prasad <amithash@fb.com>,
 deepak.kodihalli.83@gmail.com, velumani.hcl@gmail.com, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000082eddf05dc120829
Content-Type: text/plain; charset="UTF-8"

Gentle Reminder on this !

Thanks,
Kumar.

On Mon, Apr 4, 2022 at 12:49 PM Kumar Thangavel <
kumarthangavel.hcl@gmail.com> wrote:

> Hi All,
>
>         IPMI Restriction mode support has been added for host machines
> which support IPMI.
>
> https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
>
>         How IPMI restriction mode support can be added for other than host
> devices (IPMI based devices). Ex Debug card.  ?
>
>         Could you please provide any suggestions or any docs ?
>
> Thanks,
> Kumar.
>

--00000000000082eddf05dc120829
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Gentle Reminder on this !<div><br></div><div>Thanks,</div>=
<div>Kumar.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Apr 4, 2022 at 12:49 PM Kumar Thangavel &lt;<a hre=
f=3D"mailto:kumarthangavel.hcl@gmail.com">kumarthangavel.hcl@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr">Hi All,<div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMI R=
estriction mode support has been added for host=C2=A0machines which support=
 IPMI.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://githu=
b.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-ph=
osphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.y=
aml#L61" target=3D"_blank">https://github.com/openbmc/openbmc/blob/7298b247=
8ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/ph=
osphor-settings-defaults/host-template.yaml#L61</a></div><div><br></div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 How IPMI restriction mode support can be adde=
d for other=C2=A0than host devices (IPMI based devices). Ex Debug card.=C2=
=A0 ?</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Could you please=
 provide any suggestions or any docs ?</div><div><br></div><div>Thanks,</di=
v><div>Kumar.</div></div>
</blockquote></div>

--00000000000082eddf05dc120829--
