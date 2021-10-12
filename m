Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A8429C11
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 05:47:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT1nW6mswz2ybJ
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 14:47:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=eKThHP6X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=jebr@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=eKThHP6X; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT1n46w1jz2yHq
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 14:46:46 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id j5so82043315lfg.8
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 20:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=su77ccviWfCy70hQOKA0V43o9xB167gw9/dcrU27ix4=;
 b=eKThHP6XfyuEfeLELwC42JbwydGZtAx8Got7W1ru0ZDVNaOcG154LD/If0zc1ngRsd
 Ooo4IwV0MVpwBn8/rUifwFJzW6cO5orMI+dEp5lbBWfeWkM+T0TpROJVLSe/oP116bQk
 V0P3n0DeGN62wCBGeeFt3xB9Rterl32VnQj+WvXVPf1G+4V3qbZCnWA0cQIky+dyKBYt
 MQl3jTQwnUV0xeWxfwY++omoqe09pcB9JcKlkO+bkUrEtAWjqpGUVF5LGaLKhFSKoSch
 I7gGLZVtDOxnxAsxErD6C4sR/JBu+n7O7SpT17I+QpcrN/adVCxoCgFYIBlsy+reeDAL
 WSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=su77ccviWfCy70hQOKA0V43o9xB167gw9/dcrU27ix4=;
 b=3T+lnV54CnMuiuArVv6/v6o5Vzc1TY0aDmFzUH3n5rQjNV+MBJsZv86GPln6EPI3gI
 kznMMW4uFx6uWd/P9TdxINdJnk0Kp0ecVFcoxznPmYeyeCprwNv1XiEQikEQkYGv4sDe
 XKjrkWLvwbk/9T9i40fHiXX3l0NvHeISgL0frKysfJDQc3+H1rqIgY3FPDAzdd/CQIso
 FzLxfRaQTk3sJwkITMyYFwdEouYF7obb9kly6+U4jbp7/vrF03xq12f1PDuwlBRCviCJ
 dEvUwCAOyskgM/TeZ6UWYgkWRUfTMSmsX+iptRleuqJ8Vl1lKHW8aV8v/vXmSQrhPdba
 ch+w==
X-Gm-Message-State: AOAM530Pj1R8mUJ/LqF6pO3nIjJNz99NhnB+DJhmcqbBYyzIqlPWpo2C
 k9HUvr6sfAEwMPhi3GUQPpDmUBp9y+fCKUm90OM4xg==
X-Google-Smtp-Source: ABdhPJzJveYcQ2ALu+GBxjf0TD+RhJIxHf4PozaQe7o7w6wFe0Hg2DvwaMst8wEfM+wwXECo8TRvYQ98NHPOcPCpyVQ=
X-Received: by 2002:a05:6512:3b94:: with SMTP id
 g20mr30348138lfv.77.1634010402093; 
 Mon, 11 Oct 2021 20:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <PS2PR02MB35412394ABF3E0441D72627E90B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <CAPw1Ef-s-eXPs-8KmHLUyRav0JTWLHRDdLKsGFaKTWmkoeiQzg@mail.gmail.com>
In-Reply-To: <CAPw1Ef-s-eXPs-8KmHLUyRav0JTWLHRDdLKsGFaKTWmkoeiQzg@mail.gmail.com>
From: John Broadbent <jebr@google.com>
Date: Mon, 11 Oct 2021 20:46:31 -0700
Message-ID: <CAPw1Ef8fKL_cE=absnX-QwMBVckKy5vkffC08ox5ogPt46aUSw@mail.gmail.com>
Subject: Re: Etag support in openbmc
To: "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Content-Type: multipart/alternative; boundary="00000000000093e77705ce1fb199"
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

--00000000000093e77705ce1fb199
Content-Type: text/plain; charset="UTF-8"

ShuoX Zhang from Intel might be working on adding support, but I don't see
anything in gerrit.

https://lists.ozlabs.org/pipermail/openbmc/2021-August/027405.html

On Mon, Oct 11, 2021 at 8:37 PM John Broadbent <jebr@google.com> wrote:

> I don't think bmcweb support etags. I have never seen logic from them and
> Ed made a comment about how bmcweb will have to support them in the future
> here https://github.com/openbmc/webui-vue/issues/43#issue-728321615
>
> But I defer to Ed, and Gunner.
>
> Thank you
> John Broadbent
>
> On Mon, Oct 11, 2021 at 8:03 PM Mohammed.Habeeb ISV <
> mohammed.habeeb@inventec.com> wrote:
>
>> Hi
>>
>> Do we have the Etag support in OpenBMC? I see there is a mention of ETag
>> in
>> bmcweb file redfish-core/src / error_messages.cpp, however not sure if
>> Etag is supported.
>> Please let me know.
>>
>> Regards
>>
>

--00000000000093e77705ce1fb199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ShuoX Zhang from Intel might=C2=A0be=C2=A0working on addin=
g support, but I don&#39;t see anything in gerrit.<div><br></div><div><a hr=
ef=3D"https://lists.ozlabs.org/pipermail/openbmc/2021-August/027405.html">h=
ttps://lists.ozlabs.org/pipermail/openbmc/2021-August/027405.html</a><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Oct 11, 2021 at 8:37 PM John Broadbent &lt;<a href=3D"mailto:je=
br@google.com">jebr@google.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr">I don&#39;t think bmcweb sup=
port etags. I have never seen logic from them and Ed made a comment about h=
ow bmcweb will have to support them in the=C2=A0future here=C2=A0<a href=3D=
"https://github.com/openbmc/webui-vue/issues/43#issue-728321615" target=3D"=
_blank">https://github.com/openbmc/webui-vue/issues/43#issue-728321615</a><=
div><br></div><div>But I defer to Ed, and Gunner.</div><div><br></div><div>=
Thank you</div><div>John Broadbent</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 11, 2021 at 8:03 PM Moh=
ammed.Habeeb ISV &lt;<a href=3D"mailto:mohammed.habeeb@inventec.com" target=
=3D"_blank">mohammed.habeeb@inventec.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi <br>
<br>
Do we have the Etag support in OpenBMC? I see there is a mention of ETag in=
 <br>
bmcweb file redfish-core/src=C2=A0/=C2=A0error_messages.cpp, however not su=
re if Etag is supported.<br>
Please let me know.<br>
<br>
Regards<br>
</blockquote></div>
</blockquote></div>

--00000000000093e77705ce1fb199--
