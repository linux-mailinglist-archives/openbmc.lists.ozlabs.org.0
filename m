Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A31103DB6
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 15:50:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J5Fz1JGpzDqs8
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 01:50:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b;
 helo=mail-yw1-xc2b.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dOKlFlgq"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2b.google.com (mail-yw1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J5Dv2hy9zDqpH
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 01:49:17 +1100 (AEDT)
Received: by mail-yw1-xc2b.google.com with SMTP id j137so14198ywa.12
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 06:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=FxoQZLqzr28JA41JvG8bRuZxnB3Q8QcFxFBNzdAkz+c=;
 b=dOKlFlgqxzOkp9uBSpAYecapVLYoMYhT0l6xoXIy6pzZlImyEJdamtLK3Y4vn6+Of/
 Wfh0y1F3aVu4S5sYNBKwJT/AnA+OT4w+MJLPmj9YG6CIuI0FFTntVskmHB2dJq56gX6r
 6m7ey4t0We6TXMWVLeO3uA4GIb+GI+iAKy0GKsUzM5YM1GiVaKTa79lIkTJCaKCP8Wjk
 ldIFEXh25duEeEjaQeG+GycPn3myEyymOKSgSwEhfWR+qN0DPH/zmrGGsViFvXbpsN/0
 juAupv2VB9pcq2PmscPZb89QQtOMFB4qU5UR+E49WVuyIazYyJzGjrVgOu26NYP9zxHL
 29Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=FxoQZLqzr28JA41JvG8bRuZxnB3Q8QcFxFBNzdAkz+c=;
 b=kXOJELzKNhZ/8BpavVLi9Lbu8ADmehMP3FCe7ilxHv5mEJ1jlwpcUPkadV+Zj6u2UF
 2V0R5CNQttiGJSc8g7OvQrXnfT3fBly/cLML1OdKpuspDOuijozfxK2t4iODVjz+QOfr
 I07RHk/8y54a1ZpktFkIQIRvbDYI5PAxYiPjKodXvjhymU2hJ/7r+YKLZlrew/cO2i1f
 fW9aN3yx98W14w4fOABC6kaLAVPxejibLM9IsX/4a0dtKi2iVDnraS36cyl5SWRVvCX9
 zRx40/IGwp7Ou74fE0TmUuNqOSM2Iflmi7WT3xrYajLN1aTZKMI22OIG2HghSHz/aQv2
 ujpA==
X-Gm-Message-State: APjAAAV6IvjsvUaqVOCTvbo0bfNadSGDLoYwnuyfYb1Lrgbhje8RRBhC
 /3ykY1b0Essn51g6kkdfsE1yXsUDBMcnLRk/jhRnLANJ
X-Google-Smtp-Source: APXvYqznXmv6ad1uf8dTpLevcWvJGTp2PKmzs5FYLByMsbx6L4D5Ei/CfZd0lC68YRsLgd8+YqGpVamtUTGtJZp2z8Q=
X-Received: by 2002:a81:6589:: with SMTP id z131mr1809444ywb.299.1574261353841; 
 Wed, 20 Nov 2019 06:49:13 -0800 (PST)
MIME-Version: 1.0
References: <CAMTupoSyTykLj7zMvKHe2-pKXHm1Xin6g1uKtBq7NaoqMtBn-w@mail.gmail.com>
 <FD0BD680739BFC41807C96BD23118BB1318E33@ORSMSX113.amr.corp.intel.com>
 <CAMTupoRU-KgVs=SCtrUp+r+PZ_OjRkhfwLX+cTeTcNJgPdprag@mail.gmail.com>
 <FD0BD680739BFC41807C96BD23118BB1318E5C@ORSMSX113.amr.corp.intel.com>
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB1318E5C@ORSMSX113.amr.corp.intel.com>
From: Jandra A <jandraara@gmail.com>
Date: Wed, 20 Nov 2019 08:49:03 -0600
Message-ID: <CAMTupoTHHYJpsAkgjBHdq7b+Ukpp+uMxWx-c7GMdqGY+eGQ9Ng@mail.gmail.com>
Subject: Re: GUI Navigation discussion
To: "Pine, Kathryn ElaineX" <kathryn.elainex.pine@intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c785f30597c84818"
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

--000000000000c785f30597c84818
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Don=E2=80=99t worry about the grey idea for now -- I figured out a way to=
 work
> with the existing dark blue color without having to come up with new shad=
es
> of blue, etc.. I simply applied a 10% white opacity over the background f=
or
> the hover-over background. The light blue text still worked with the
> blue20, so that was fine to keep.
>
>
>
> I=E2=80=99ve pushed a new commit addressing all the issues we discussed, =
and with
> those color settings.
>

Thanks Kathy, I'd love to see it again in the workgroup today (:




 *From:* Jandra A <jandraara@gmail.com>
>
> *Sent:* Tuesday, November 19, 2019 2:58 PM
> *To:* Pine, Kathryn ElaineX <kathryn.elainex.pine@intel.com>
> *Subject:* Re: GUI Navigation discussion
>
>
>
> Either way =E2=80=93 let me know what you think of the concept showing th=
e greys
> that was sent in that earlier email as well.
>
>
>
> It might be best to keep the color separate and just merge the behavior,
> like the screenshot in my previous email. Is that something we can move
> forward with?
>
>
>
> Regards,
>
> Jandra
>
>
>
>
>
>
>
> *From:* Jandra A <jandraara@gmail.com>
> *Sent:* Tuesday, November 19, 2019 2:15 PM
> *To:* OpenBMC Maillist <openbmc@lists.ozlabs.org>; Pine, Kathryn ElaineX =
<
> kathryn.elainex.pine@intel.com>
> *Subject:* Re: GUI Navigation discussion
>
>
>
> Kathy -- Following up on our conversation,
>
> >> I think a grey could work as the nav background, not sure about it
> being the content background. But, interestingly, yesterday I was thinkin=
g
> about using greys in another way =E2=80=93 that if we had a set of greys =
throughout
> the site, and then used one or two colors as a filter, it might be easy t=
o
> have groundwork for a skin through a method of that sort. Basically the
> base theme is shades of grey, and then two variables may be able to be us=
ed
> to establish the color themes.
>
> I'm not following the idea of using a set of greys and one or two colors
> as a filter. Would that not be the same amount of work for creating theme=
s
> as if they were full themes?
>
>
> >> I can see what I can do with this idea; and in the meantime if you com=
e
> up with a color palette keeping with the idea of the nav being the dark
> background (so we can continue with this commit without substantial
> changes), let me know.
>
> I'm attaching another proposal using the exact same color conventions in
> the build right now, so that we can focus on merging the accordion
> navigation behavior and keep the color discussion separate. This would ke=
ep
> the background dark blue (blue 100) with white text and icons (grey 0). T=
he
> selected page would be styled with a grey 20 background and blue 100 text=
.
> The hover page would be styled with a grey 0 background and blue 100 text=
.
> And, all children in the navigation are grey 60.
>
>
>
> >> Regarding the design library, we have been reviewing Carbon and don=E2=
=80=99t
> feel like it matches with the modern style that we=E2=80=99d like to move=
 forward
> with very well. We do like the idea of a design library, but if we don=E2=
=80=99t
> agree on which design library, this might not help so much after all=E2=
=80=A6
> About the design library, whether it's Carbon or not, we're going to have
> to align on something otherwise subjective conversations will keep slowin=
g
> all parties down. In a separate email I'll address this more.
>
>
> Regards,
> Jandra
>
>
>
>
>
>
>
>
>

--000000000000c785f30597c84818
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_42148408404705=
01648WordSection1"><p class=3D"MsoNormal"><font color=3D"#a64d79">Don=E2=80=
=99t worry about the grey idea for now -- I figured out a way to work with =
the existing dark blue color without having to come up with new shades of b=
lue, etc.. I simply applied a 10% white opacity over the background for the=
 hover-over
 background. The light blue text still worked with the blue20, so that was =
fine to keep.<u></u><u></u></font></p>
<p class=3D"MsoNormal"><font color=3D"#a64d79"><u></u>=C2=A0<u></u></font><=
/p>
<p class=3D"MsoNormal"><font color=3D"#a64d79">I=E2=80=99ve pushed a new co=
mmit addressing all the issues we discussed, and with those color settings.=
</font></p></div></div></blockquote><div><div dir=3D"ltr"><br></div><div di=
r=3D"ltr">Thanks Kathy, I&#39;d love to see it again in the workgroup today=
 (:=C2=A0</div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr"></div></div></div><div><br></div><div><br></div><div><br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"EN-U=
S"><div class=3D"gmail-m_4214840840470501648WordSection1"><p class=3D"MsoNo=
rmal">=C2=A0<b>From:</b> Jandra A &lt;<a href=3D"mailto:jandraara@gmail.com=
" target=3D"_blank">jandraara@gmail.com</a>&gt;=C2=A0</p><p class=3D"MsoNor=
mal">
<b>Sent:</b> Tuesday, November 19, 2019 2:58 PM<br>
<b>To:</b> Pine, Kathryn ElaineX &lt;<a href=3D"mailto:kathryn.elainex.pine=
@intel.com" target=3D"_blank">kathryn.elainex.pine@intel.com</a>&gt;<br>
<b>Subject:</b> Re: GUI Navigation discussion<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">Either way =E2=80=93 let me know what you think of t=
he concept showing the greys that was sent in that earlier email as well.<u=
></u><u></u></p>
</div>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">It might be best to keep the color separate and just=
 merge the behavior, like the screenshot in my previous email. Is that some=
thing we can move forward with?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Jandra<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal"><a name=3D"m_4214840840470501648_m_-7895848723660181=
340______replyseparat"></a><b>From:</b> Jandra A &lt;<a href=3D"mailto:jand=
raara@gmail.com" target=3D"_blank">jandraara@gmail.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, November 19, 2019 2:15 PM<br>
<b>To:</b> OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; Pine, Kathryn ElaineX =
&lt;<a href=3D"mailto:kathryn.elainex.pine@intel.com" target=3D"_blank">kat=
hryn.elainex.pine@intel.com</a>&gt;<br>
<b>Subject:</b> Re: GUI Navigation discussion<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">Kathy -- Following up on our conversation,<br>
<br>
<span style=3D"color:rgb(153,153,153)">&gt;&gt; I think a grey could work a=
s the nav background, not sure about it being the content background. But, =
interestingly, yesterday I was thinking about using greys in another way =
=E2=80=93 that if we had a set of greys throughout the site,
 and then used one or two colors as a filter, it might be easy to have grou=
ndwork for a skin through a method of that sort. Basically the base theme i=
s shades of grey, and then two variables may be able to be used to establis=
h the color themes.<br>
</span><br>
I&#39;m not following the idea of using a set of greys and one or two color=
s as a filter. Would that not be the same amount of work for creating theme=
s as if they were full themes?<br>
<br>
<br>
<span style=3D"color:rgb(153,153,153)">&gt;&gt; I can see what I can do wit=
h this idea; and in the meantime if you come up with a color palette keepin=
g with the idea of the nav being the dark background (so we can continue wi=
th this commit without substantial changes), let
 me know.</span><br>
<br>
I&#39;m attaching another proposal using the exact same color conventions i=
n the build right now, so that we can focus on merging the accordion naviga=
tion behavior and keep the color discussion separate. This would keep the b=
ackground dark blue (blue 100) with
 white text and icons (grey 0). The selected page would be styled with a gr=
ey 20 background and blue 100 text. The hover page would be styled with a g=
rey 0 background and blue 100 text. And, all children in the navigation are=
 grey 60.<br>
<br>
<br>
<span style=3D"color:rgb(153,153,153)"><br>
&gt;&gt; Regarding the design library, we have been reviewing Carbon and do=
n=E2=80=99t feel like it matches with the modern style that we=E2=80=99d li=
ke to move forward with very well. We do like the idea of a design library,=
 but if we don=E2=80=99t agree on which design library, this might
 not help so much after all=E2=80=A6</span><br>
About the design library, whether it&#39;s Carbon or not, we&#39;re going t=
o have to align on something otherwise subjective conversations will keep s=
lowing all parties down. In a separate email I&#39;ll address this more.=C2=
=A0<br>
<br>
<br>
Regards,<br>
Jandra<br>
<br>
<br>
=C2=A0<br>
<br>
=C2=A0<br>
<br>
=C2=A0<u></u><u></u></p>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000c785f30597c84818--
