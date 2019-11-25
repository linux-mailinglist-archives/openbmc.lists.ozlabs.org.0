Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0635F10950E
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 22:18:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MKdr3rqrzDqcY
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 08:18:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32;
 helo=mail-yw1-xc32.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HxUSVgFd"; 
 dkim-atps=neutral
Received: from mail-yw1-xc32.google.com (mail-yw1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MKcz3GJtzDqS1
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 08:17:52 +1100 (AEDT)
Received: by mail-yw1-xc32.google.com with SMTP id r131so6008748ywh.2
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 13:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6MlOCvF1FrRD6v2EfpARWVKI/WLRAULJv1gIJp8RmZc=;
 b=HxUSVgFdaxaR7joWuqDFEVlOvNgiG4HYUs1e6fw3D90o2Hn/5ZOcYWPipH/jSV4w4u
 QBTdKopdvnJ7jhukqm3GUbioDRP9eMKshgk8KN7nhTeTT0hsskrZafgTs9Vu7vjtwUgR
 txnoL/oNblSa4LNvzpXiHU21w+W/UQynqnImjn4M0t1iVpTlSNHfC4BrFkDm2brg53e5
 LODlibifQrn2QUHXnQTgdjCL1JGnSqMGsmI3SOmSdtUGezseb03q2BVQFW0LU1HMj5+i
 Ur5xixPruA0kRr9kAvL22IMhy3q8MZnpSoNX2Jtbf/+aC2HSWU5kfRW9DVSNqRYOmeIe
 H1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6MlOCvF1FrRD6v2EfpARWVKI/WLRAULJv1gIJp8RmZc=;
 b=K0pVple+EgnEfGKGiCnoBqhZJLFh1KAvTicFcLMcKf/MIw5dhPLpu9kF1dO0QhqrMO
 B7n7cVjCAVErc3v51Z5UCrYT5l2PB+xpOY4Vrsvw71sjsoM7QOmrKRzUf+tOH4uSdtMb
 9WP2lYULA4pca9g3FZ+MpT7UNekc4zEZIzICOrNUR/gLvGI1EA/5QS/1EMGilyBWp2os
 ymNpdtizn3FseqOzRi4bIbPLAr70GA6Sw/bR4gFeowBkJDbij7F2cGAQJheCEO24iwNU
 cD/cueSLPiq+0DyqmHA6b4r6wu7WNumnoF5O0tB3Tcd+8H3teDT4tvA9SvVRiXEHAz/N
 HSVA==
X-Gm-Message-State: APjAAAVCMTFzcYZ2iHmuFUuduBGcIAeswWfJB76UkQjveA8qIBqEDXat
 fuzVcpu1i2jJYpLgGGT2+zPT/LDvNg5hp+ccgmY=
X-Google-Smtp-Source: APXvYqzXWmoym/rbO7B7T8HPJvERe4glDaIyLA+7RnroYrCfenK0OLOR9NSP3GghTJpZah3LQlY1AETXo0H5Iw0mH5w=
X-Received: by 2002:a0d:ea85:: with SMTP id
 t127mr16201024ywe.485.1574716669121; 
 Mon, 25 Nov 2019 13:17:49 -0800 (PST)
MIME-Version: 1.0
References: <FD0BD680739BFC41807C96BD23118BB131937A@ORSMSX113.amr.corp.intel.com>
 <OFBA22BA42.AE014E7E-ON002584BD.0071CE96-002584BD.0073A72B@notes.na.collabserv.com>
In-Reply-To: <OFBA22BA42.AE014E7E-ON002584BD.0071CE96-002584BD.0073A72B@notes.na.collabserv.com>
From: Jandra A <jandraara@gmail.com>
Date: Mon, 25 Nov 2019 15:17:37 -0600
Message-ID: <CAMTupoQkeiOYSKwUYV9vCUvsymt2BmNKcBNemCB_GL-a=kJzVQ@mail.gmail.com>
Subject: Re: GUI Component Library
To: Derick Montague <Derick.Montague@ibm.com>
Content-Type: multipart/alternative; boundary="000000000000af5af40598324b45"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Pine,
 Kathryn ElaineX" <kathryn.elainex.pine@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000af5af40598324b45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Updating the OpenBMC Style Guide Prototype link below.


> In terms of a design library that matches the style of the web UI we=E2=
=80=99ve
> been working on, Bootstrap would be a great choice:
> https://bootstrap-vue.js.org
>
> We agree to use Bootstrap-Vue for the Vue framework rewrite. Bootstrap-Vu=
e
> does not have an icon library and refers to third-party sources. Since we
> are already using the Carbon Design System icons, can we agree to continu=
e
> to use them?
>
> > However, I wonder if we could find a happy medium between the two
> styles? I=E2=80=99ve been looking for websites that have elements of both=
 style
> preferences -- that include the more modern look (larger elements, rounde=
d
> corners, light colors), with the more stable look (dark colors, square
> elements) =E2=80=93 and found these great examples:
> >
> >- Invision App=E2=80=99s website https://www.invisionapp.com/
> >- Visual Studio Code website https://code.visualstudio.com/
> >- GitHub website https://github.com/
>
> Thank you for sending the site examples. They are great examples of
> well-designed user interfaces. Although the proposed Intel UI updates
> provide some pattern improvements, the overall layout and design changes
> don't feel as polished as the examples you shared. We believe more
> collaboration is needed to improve the design and implementation of the
> proposed changes to meet both Intel's and IBM's needs.
>
> A little over a year ago, we developed an OpenBMC style guide to make it
> easier for designers and developers to contribute to the project. We buil=
t
> a living style guide prototype, but Ed's concern about who would develop
> and maintain the guide kept it from moving forward. The inconsistency and
> lack of code reuse throughout the application is the result of not having
> this documentation.
>
> OpenBMC Style Guide:
> https://ibm.invisionapp.com/share/EBNYECMH3Y2#/318986393_Grid
> <https://ibm.invisionapp.com/share/EBNYECMH3Y2#/318986393_Grid>
>
> OpenBMC Style Guide Prototype:
> https://derick-montague.github.io/openbmc-styleguide-proposal/
>
> As we rewrite the application in Vue, we have an opportunity to create
> this documentation and assure that the OpenBMC UI is clean, maintainable,
> and adheres to an agreed-upon set of values. Since joining the project, y=
ou
> have been working alone on both design and development. We hope that we c=
an
> work as a team to collaborate and lean on each other's strengths.
>
> I feel the next step is to schedule a meeting to review the existing styl=
e
> guide. We can then determine what needs to be updated to meet both Intel'=
s
> and IBM's needs. We can use the updated style guide to create the theme
> changes required for the Bootstrap-Vue out of box experience to adhere to
> the updated style guide.
>
> This effort will require a stronger focus on the framework update and
> style guide development. When we start working on the framework update, t=
he
> only updates to the AngularJS UI will be critical bug fixes. Our goal is =
to
> have the framework update complete no later than the end of Q2 2020.
>
> What are your thoughts on this plan?
>
>
>
>

--000000000000af5af40598324b45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Updating=C2=A0the OpenBMC Style Guide Prototype link =
below.=C2=A0=C2=A0</div><div><br></div><div><br></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><font face=3D"Defau=
lt Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=3D"2"><div dir=3D"lt=
r"><div dir=3D"ltr"><div style=3D"font-family:&quot;Lucida Sans Unicode&quo=
t;,&quot;Lucida Grande&quot;,sans-serif;font-size:10pt">&gt; In terms of a =
design library that matches the style of the web UI we=E2=80=99ve been work=
ing on, Bootstrap would be a great choice: <a href=3D"https://bootstrap-vue=
.js.org" target=3D"_blank">https://bootstrap-vue.js.org</a> =C2=A0<br></div=
><div style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Gra=
nde&quot;,sans-serif;font-size:10pt"><br></div><div><font face=3D"Lucida Sa=
ns Unicode, Lucida Grande, sans-serif"><span style=3D"font-size:13.3333px">=
We agree to use Bootstrap-Vue for the Vue framework rewrite. Bootstrap-Vue =
does not have an icon library and refers to third-party sources. Since we a=
re already using the Carbon Design System icons, can we agree to continue t=
o use them?</span></font><br></div><div><font face=3D"Lucida Sans Unicode, =
Lucida Grande, sans-serif"><span style=3D"font-size:13.3333px"><br></span><=
/font></div><div style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot=
;Lucida Grande&quot;,sans-serif;font-size:10pt">&gt; However, I wonder if w=
e could find a happy medium between the two styles? I=E2=80=99ve been looki=
ng for websites that have elements of both style preferences -- that includ=
e the more modern look (larger elements, rounded corners, light colors), wi=
th the more stable look (dark colors, square elements) =E2=80=93 and found =
these great examples:<br>&gt;<br>&gt;- Invision App=E2=80=99s website <a hr=
ef=3D"https://www.invisionapp.com/" target=3D"_blank">https://www.invisiona=
pp.com/</a><br>&gt;- Visual Studio Code website <a href=3D"https://code.vis=
ualstudio.com/" target=3D"_blank">https://code.visualstudio.com/</a><br>&gt=
;- GitHub website <a href=3D"https://github.com/" target=3D"_blank">https:/=
/github.com/</a>=C2=A0</div>
<div style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Gran=
de&quot;,sans-serif;font-size:10pt"><br>Thank you for sending the site exam=
ples. They are great examples of well-designed user interfaces. Although th=
e proposed Intel UI updates provide some pattern improvements, the overall =
layout and design changes don&#39;t feel as polished as the examples you sh=
ared. We believe more collaboration is needed to improve the design and imp=
lementation of the proposed changes to meet both Intel&#39;s and IBM&#39;s =
needs.</div><div style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot=
;Lucida Grande&quot;,sans-serif;font-size:10pt"><span style=3D"font-size:10=
pt"><br></span></div><div style=3D"font-family:&quot;Lucida Sans Unicode&qu=
ot;,&quot;Lucida Grande&quot;,sans-serif;font-size:10pt"><span style=3D"fon=
t-size:10pt">A little over a year ago, we developed an OpenBMC style guide =
to make it easier for designers and developers to contribute to the project=
. We built a living style guide prototype, but Ed&#39;s concern about who w=
ould develop and maintain the guide kept it from moving forward. The incons=
istency and lack of code reuse throughout the application is the result of =
not having this documentation.</span><br></div><div style=3D"font-family:&q=
uot;Lucida Sans Unicode&quot;,&quot;Lucida Grande&quot;,sans-serif;font-siz=
e:10pt"><br></div>
<div style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Gran=
de&quot;,sans-serif;font-size:10pt">OpenBMC Style Guide:=C2=A0<br><a href=
=3D"https://ibm.invisionapp.com/share/EBNYECMH3Y2#/318986393_Grid">https://=
ibm.invisionapp.com/share/EBNYECMH3Y2#/318986393_Grid=C2=A0<br></a></div><d=
iv style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Grande=
&quot;,sans-serif;font-size:10pt"><br>OpenBMC Style Guide Prototype:=C2=A0<=
br><a href=3D"https://derick-montague.github.io/openbmc-styleguide-proposal=
/" target=3D"_blank">https://derick-montague.github.io/openbmc-styleguide-p=
roposal/</a>=C2=A0</div><div style=3D"font-family:&quot;Lucida Sans Unicode=
&quot;,&quot;Lucida Grande&quot;,sans-serif;font-size:10pt"><br></div>
<div style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Gran=
de&quot;,sans-serif;font-size:10pt">As we rewrite the application in Vue, w=
e have an opportunity to create this documentation and assure that the Open=
BMC UI is clean, maintainable, and adheres to an agreed-upon set of values.=
 Since joining the project, you have been working alone on both design and =
development. We hope that we can work as a team to collaborate and lean on =
each other&#39;s strengths.=C2=A0</div><div style=3D"font-family:&quot;Luci=
da Sans Unicode&quot;,&quot;Lucida Grande&quot;,sans-serif;font-size:10pt">=
<br></div>
<div style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Gran=
de&quot;,sans-serif;font-size:10pt">I feel the next step is to schedule a m=
eeting to review the existing style guide. We can then determine what needs=
 to be updated to meet both Intel&#39;s and IBM&#39;s needs. We can use the=
 updated style guide to create the theme changes required for the Bootstrap=
-Vue out of box experience to adhere to the updated style guide.</div><div =
style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Grande&qu=
ot;,sans-serif;font-size:10pt"><br></div>
<div style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Gran=
de&quot;,sans-serif;font-size:10pt">This effort will require a stronger foc=
us on the framework update and style guide development. When we start worki=
ng on the framework update, the only updates to the AngularJS UI will be cr=
itical bug fixes. Our goal is to have the framework update complete no late=
r than the end of Q2 2020.</div><div style=3D"font-family:&quot;Lucida Sans=
 Unicode&quot;,&quot;Lucida Grande&quot;,sans-serif;font-size:10pt"><br></d=
iv>
<div style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Gran=
de&quot;,sans-serif;font-size:10pt">What are your thoughts on this plan?</d=
iv>
<div style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Gran=
de&quot;,sans-serif;font-size:10pt"><br>=C2=A0</div></div></div></font><br>

</blockquote></div></div>

--000000000000af5af40598324b45--
