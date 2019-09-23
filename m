Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C8BB2CC
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 13:30:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cMZ124zSzDqM4
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 21:30:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=rahulmaheshwari01@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="g6DSXTSR"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cMYN4WZ1zDqLS
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 21:29:38 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id z19so10302967ior.0
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dj6yPGeYDqVDRS3mDWrQ748a0BhIFSNvqq7Pby37oTI=;
 b=g6DSXTSRThP1p+yrI11uJjIU+NnV70LIVFldby9Iz48SoazobXyAt2nHyDgbKLYkxD
 WkBKY098+UacmSSGv4+lvCN1fZUI3vm8TQIaUodDd6zSCmsqy9PZ6W4MNsEHIZfvzY+v
 /ASjRCizKLlRlMry5Zp2y8EmPl/fUJLWBkLc0BMlb2KF9f3sIx0BKfy3XdFNpphzzJiV
 3qAw5e1xObstVfCG9PIP9epUvqnqPA7HX2y6YE9Chl5M2EeY3edTp9HGMWXdXUXpdZ8e
 OThZ+aJxcVuNFhCjY46l6D2JVXosHYqqceSJAuNN+2lnDpFhAYqQA+HnPBmbwAJSR6FG
 Qh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dj6yPGeYDqVDRS3mDWrQ748a0BhIFSNvqq7Pby37oTI=;
 b=iw0q73BANTD2VyFPnKMmmSXoRXW7NY9LMHRyE90k0B7Y+GuyEzsAqLIMdLYtTjn6XF
 LQJibCo6A4afRqjYr4pBtqh31uhyko9KhXDDzHWhrCm3ZEf2MEYi5TRzSQ8zm4utoL11
 hiYxlV/QO7QZYQs7FHuDkEq8gMKAvhY1ZvWe3YuS7TRu6xMaALSwU1fcT90tQe3l8t0L
 Y4xK0JSKJcqrCSiERG36IWfLrqizEPRwL2EX2m8smlaWcAet02xhmLZS+9vQEJDDhrPl
 Y0fIYzqrHvfcNHcekPeRhqOb9aj9eXKiTQk10UJYlcdZSkCgal0F/rgv/Rt9nC+xokgN
 zrmg==
X-Gm-Message-State: APjAAAVGgmMadFGsvHDVoMh986pyz3RyNA1/gHoSCxx+HB83/nvMMd8z
 CrbA4Fn2MDEav/QHfWTVIxuGg9LhTeKh8AJNbSbk6D0J
X-Google-Smtp-Source: APXvYqwWyYE8rZRkUf5SQtphxErqjqUikFF9iM1LGNhiWaL4lWXlwvXh9LzIyzMQcz9gNbztaubSsDExmhtYDwxYZ5o=
X-Received: by 2002:a6b:7615:: with SMTP id g21mr22324328iom.67.1569238174866; 
 Mon, 23 Sep 2019 04:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <a1b7c13a259b4e259796bbcf07834ae7@quantatw.com>
In-Reply-To: <a1b7c13a259b4e259796bbcf07834ae7@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Mon, 23 Sep 2019 16:59:22 +0530
Message-ID: <CAAMkS12M-LP=v4gNdxgRShKUF7QZKTVFSa=Vg=qebzq7AXm3rg@mail.gmail.com>
Subject: Re: Questions of openbmc-test-automation
To: =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000fb24b1059336bb24"
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

--000000000000fb24b1059336bb24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will
At present, we don't have ways to avoid Redfish dependency in IPMI suite.
We can code like the way you pointed, but it is possible only for some IPMI
commands(like power on and off). For all other IPMI commands like event
logs, FRU, SDR, DCMI commands we need to depend on Redfish to verify the
output.

Thanks
Rahul



On Mon, 23 Sep 2019, 11:13 Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89), <Will.=
Liang@quantatw.com>
wrote:

> Hi,
>
> I use the "openbmc-test-automation" package to test our project.
> And I just want to implement the IPMI test case because our platform does
> not support REDFISH (IPMI only).
> But I found that in the IPMI test case, it use the REFISH command as well
> (eg Redfish power on[0]).
>
> [0]
> https://github.com/openbmc/openbmc-test-automation/blob/2a520ee37c72ea847=
ca2d6c773493a6dd752c827/ipmi/test_ipmi_sdr.robot#L59
>
> My questions are following:
> 1. Are there other ways to avoid using the Redfish commands?
> 2. Is it possible to add parameter(ex:PROTOCOL) on the command line to
> select the protocol to use?
> For example:
> - add the new keyword maybe like "Power On".
> - and the new keyword "power on" can use the new parameter to choose what
> protocol be used(default protocol is REDFISH if not set).
> - the new keyword like below:
> Power On
>     [Documentation]  select the execute protocol.
>     [Arguments]  ${stack_mode}=3D${stack_mode}  ${quiet}=3D${quiet}
>
>     Run Keyword If  '${PROTOCOL}' =3D=3D 'Redfish'
>     ...   Redfish Power On    stack_mode=3Dskip    quiet=3D0
>     ...   ELSE    IPMI Power On    stack_mode=3Dskip    quiet=3D0
>
> BRs
> Will
>

--000000000000fb24b1059336bb24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Will</div><div dir=3D"auto">At present, we don&#3=
9;t have ways to avoid Redfish dependency in IPMI suite. We can code like t=
he way you pointed, but it is possible only for some IPMI commands(like pow=
er on and off). For all other IPMI commands like event logs, FRU, SDR, DCMI=
 commands we need to depend on Redfish to verify the output.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks</div><div dir=3D"auto">Rahul</=
div><div dir=3D"auto"><div dir=3D"auto"><br></div><br><br><div class=3D"gma=
il_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 23 Sep=
 2019, 11:13 Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89), &lt;<a href=3D"mailt=
o:Will.Liang@quantatw.com" rel=3D"noreferrer noreferrer" target=3D"_blank">=
Will.Liang@quantatw.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi,<br>
<br>
I use the &quot;openbmc-test-automation&quot; package to test our project.<=
br>
And I just want to implement the IPMI test case because our platform does n=
ot support REDFISH (IPMI only).<br>
But I found that in the IPMI test case, it use the REFISH command as well (=
eg Redfish power on[0]).<br>
<br>
[0] <a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/2a52=
0ee37c72ea847ca2d6c773493a6dd752c827/ipmi/test_ipmi_sdr.robot#L59" rel=3D"n=
oreferrer noreferrer noreferrer noreferrer" target=3D"_blank">https://githu=
b.com/openbmc/openbmc-test-automation/blob/2a520ee37c72ea847ca2d6c773493a6d=
d752c827/ipmi/test_ipmi_sdr.robot#L59</a><br>
<br>
My questions are following:<br>
1. Are there other ways to avoid using the Redfish commands?<br>
2. Is it possible to add parameter(ex:PROTOCOL) on the command line to sele=
ct the protocol to use?<br>
For example:<br>
- add the new keyword maybe like &quot;Power On&quot;.<br>
- and the new keyword &quot;power on&quot; can use the new parameter to cho=
ose what protocol be used(default protocol is REDFISH if not set).<br>
- the new keyword like below:<br>
Power On<br>
=C2=A0 =C2=A0 [Documentation]=C2=A0 select the execute protocol.<br>
=C2=A0 =C2=A0 [Arguments]=C2=A0 ${stack_mode}=3D${stack_mode}=C2=A0 ${quiet=
}=3D${quiet}<br>
<br>
=C2=A0 =C2=A0 Run Keyword If=C2=A0 &#39;${PROTOCOL}&#39; =3D=3D &#39;Redfis=
h&#39;<br>
=C2=A0 =C2=A0 ...=C2=A0 =C2=A0Redfish Power On=C2=A0 =C2=A0 stack_mode=3Dsk=
ip=C2=A0 =C2=A0 quiet=3D0<br>
=C2=A0 =C2=A0 ...=C2=A0 =C2=A0ELSE=C2=A0 =C2=A0 IPMI Power On=C2=A0 =C2=A0 =
stack_mode=3Dskip=C2=A0 =C2=A0 quiet=3D0<br>
<br>
BRs<br>
Will<br>
</blockquote></div></div></div>

--000000000000fb24b1059336bb24--
