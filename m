Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 745E61046A7
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 23:37:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JHcc3m2rzDqvd
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 09:37:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=jandraara@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UDzd8swK"; 
 dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JHbt5K7wzDqFH
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 09:36:25 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id q18so676580ybq.6
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 14:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XaK5VUeAUhM3PRkHmoFOy9Z0YFUdff1F7ptLR4M8/28=;
 b=UDzd8swKmO9cx1TWUJDINk3AGfHd3EoUM7XyQ8bdRt/K62L3kHCgCz+MrzFGQlNZv+
 HTUySGSt2nQ7jTsa7xAIr9FeYKeXfretnBCor34erGwT/sQnoBY6onEIkny1PDFhUxRI
 3Qq2nJvzKm6r5EnBNJmAcDAUIz9ZoNJMhMZ9SkmtdhI0AqQxmyRc+gjwT0o7RZ5KKGNh
 z5Gi7ba1NGQQ0gLUdB0gbO9UJsWrtaTy8/CH5CD0w0T+K5TALoJ9nSEMI2w28sLPvNOw
 swEgATxu5NyDEFljms6+91wgEOmOZVFklE6RodFk9YuqMVQ2S5PmdAyVNmuqja6a3+I4
 7L7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XaK5VUeAUhM3PRkHmoFOy9Z0YFUdff1F7ptLR4M8/28=;
 b=jSavYmTfIVWnKRvyBtpB1HYPYeVdwYFVlV96QWNd5SKFdKzhKZSNJ2Y/e3+Pq57s9j
 If+Msh7hSMwZ7IsDLdj+Yr1M5IBP53CmV7++E6H0NRbGeUN2Lt2apcjGyqWWBbl29xo7
 mN77HJJFRJIL4YdsFSIDhBM+7FPgUx2zMW/zn1/ad2OjdTGKZkfgp/KYOCXwXBnGlKGW
 AACYCIrpOQw3lSny/CkFMG5ubkGHGX/6QRVTRPqi9kmNzNMYIY+/cMNHfbhT7jRd4AOs
 zCO2jIDW88bkimdvzZXGv5P0fTtOL5qGGZhH5OoJkCjDtojDTqGUQp495ww6tYlEjxlP
 HXjA==
X-Gm-Message-State: APjAAAVMURkq+etVQQOqOmKaoP2DHabFVH1gozykcG60nZopvFVZTbwk
 HF9PBMjEtQgBYf4M3HENxrM3u+xdTIq2fZSt0LY=
X-Google-Smtp-Source: APXvYqwK+adn6Eb7Rt8TSJtfL8IJlVVOWodydHYPvdWr3GYdpWdEOyQRGnBhzTrPhnhN5Ug5hh9kT9WzSBbsOqJg2eQ=
X-Received: by 2002:a25:b21f:: with SMTP id i31mr4200788ybj.9.1574289381819;
 Wed, 20 Nov 2019 14:36:21 -0800 (PST)
MIME-Version: 1.0
References: <OFB18B5F53.53F0FFF0-ON002584B8.0061F151-002584B8.0077A99B@notes.na.collabserv.com>
In-Reply-To: <OFB18B5F53.53F0FFF0-ON002584B8.0061F151-002584B8.0077A99B@notes.na.collabserv.com>
From: Jandra A <jandraara@gmail.com>
Date: Wed, 20 Nov 2019 16:36:11 -0600
Message-ID: <CAMTupoSzFuLqAArfPgARL=d059j1h_Xu2XP9U1LwNUJv0KtvEg@mail.gmail.com>
Subject: Re: GUI Component Library
To: Derick Montague <Derick.Montague@ibm.com>
Content-Type: multipart/alternative; boundary="000000000000608ba70597cecf3e"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000608ba70597cecf3e
Content-Type: text/plain; charset="UTF-8"

>
> We are working to compromise on a component library as we move towards a
> change to the GUI front-end framework. As discussed in previous emails to
> the list, we are planning on updating the BMC UI to use Vue. It is
> currently written using AngularJS, which will reach the end of its
> lifecycle on June 30, 2021.
>
>
>
> With this update, we are looking to select a component library that allows
> the GUI design/development team and any contributors to focus more on
> feature work and less on base-level components. IBM has proposed using the
> Carbon Design System. Carbon is an open-source library backed by IBM. We
> are advocating for this library for the following reasons.
>
>
>
> 1. Has an open-source community of Designers and Developers supporting the
> library
>
>
>
> 2. It is built with a user-centered approach that utilizes Design Thinking
> processes that include user testing and heuristic evaluation
>
>
>
> 3. It is compliant with the World Wide Web Consortium's (W3C) Web Content
> Accessibility Guidelines (WCAG).
>
>
>
> 4. The framework can be themed to meet the branding needs of other
> community members.
>
>
>
> 5. We agreed to and are using Carbon Design System icons
>
>
>
> 6. We are creating custom components using Carbon Design System patterns,
> e.g. LocaL User Management table. Using the Carbon Design System would
> allow us to bring in elements without the need to re-design or develop a
> new custom component in Vue.
>
>
>
> We are looking to discuss the use of other libraries and should choose one
> library. Using more than one library will add complexity with keeping all
> the utilized libraries up to date, create additional work to customize the
> library components to have the same look and feel, and could create
> confusion determining with components are being used
>
> from which library resulting in a lack of consistency within the
> application. None of the 3rd party libraries will likely meet all of our
> needs so when we are evaluating component libraries some of the criteria
> that need to be met includes:
>
>
>
> 1. Ability to create and use different themes
>
>
>
> 2. Components have been tested and meet the W3C Web Content Accessibility
> Guidelines principles
>
> of Perceivable, Operable, Understandable, and Robust
>
> https://www.w3.org/WAI/fundamentals/accessibility-principles/
>
>
>
> 3. Open-source with an active community
>


As an exercise, I mocked up the proposed Event Logs design using the Carbon
Design System. This was a test on the theory of being able to theme and
customize Carbon to fit the needs of multiple community members. The
resulting design uses lighter colors and rounded edges to achieve a
friendly aesthetic. This demonstrates the flexibility that still exists and
can be embedded into Carbon using themes, while providing a sturdy
foundation of interactions and components to build from.

https://ibm.invisionapp.com/share/QANZHJKP74E#/319333663_Event_Logs
<https://ibm.invisionapp.com/share/QANZHJKP74E#/319333663_Event_Logs>

--000000000000608ba70597cecf3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr" style=3D"font-family:&quot;Lucida Sans =
Unicode&quot;,&quot;Lucida Grande&quot;,sans-serif;font-size:10pt"><div dir=
=3D"ltr" style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida =
Grande&quot;,sans-serif;font-size:10pt"><div dir=3D"ltr" style=3D"font-fami=
ly:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Grande&quot;,sans-serif;fon=
t-size:10pt"><div dir=3D"ltr" style=3D"font-family:&quot;Lucida Sans Unicod=
e&quot;,&quot;Lucida Grande&quot;,sans-serif;font-size:10pt"><div dir=3D"lt=
r" style=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Grande=
&quot;,sans-serif;font-size:10pt"><div dir=3D"ltr" style=3D"font-family:&qu=
ot;Lucida Sans Unicode&quot;,&quot;Lucida Grande&quot;,sans-serif;font-size=
:10pt"><div dir=3D"ltr" style=3D"font-family:&quot;Lucida Sans Unicode&quot=
;,&quot;Lucida Grande&quot;,sans-serif;font-size:10pt"><div dir=3D"ltr" sty=
le=3D"font-family:&quot;Lucida Sans Unicode&quot;,&quot;Lucida Grande&quot;=
,sans-serif;font-size:10pt"><div dir=3D"ltr"><p style=3D"color:rgb(28,30,41=
);background:transparent;margin-top:0pt;margin-bottom:0pt"><span style=3D"c=
olor:rgb(28,30,41);background:transparent;margin-top:0pt;margin-bottom:0pt"=
>We are working to compromise on a component library as we move towards a c=
hange to the GUI front-end framework. As discussed in previous emails to th=
e list, we are planning on updating the BMC UI to use Vue. It is currently =
written using AngularJS, which will reach the end of its lifecycle on June =
30, 2021.=C2=A0</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">With this update, we are looking to select a=
 component library that allows the GUI design/development team and any cont=
ributors to focus more on feature work and less on base-level components. I=
BM has proposed using the Carbon Design System. Carbon is an open-source li=
brary backed by IBM. We are advocating for this library for the following r=
easons.</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">1. Has an open-source community of Designers=
 and Developers supporting the library</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">2. It is built with a user-centered approach=
 that utilizes Design Thinking processes that include user testing and heur=
istic evaluation</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">3. It is compliant with the World Wide Web C=
onsortium&#39;s (W3C) Web Content Accessibility Guidelines (WCAG).</span></=
p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">4. The framework can be themed to meet the b=
randing needs of other community members.</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">5. We agreed to and are using Carbon Design =
System icons</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">6. We are creating custom components using C=
arbon Design System patterns, e.g. LocaL User Management table. Using the C=
arbon Design System would allow us to bring in elements without the need to=
 re-design or develop a new custom component in Vue.</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">We are looking to discuss the use of other l=
ibraries and should choose one library. Using more than one library will ad=
d complexity with keeping all the utilized libraries up to date, create add=
itional work to customize the library components to have the same look and =
feel, and could create confusion determining with components are being used=
</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">from which library resulting in a lack of co=
nsistency within the application. None of the 3rd party libraries will like=
ly meet all of our needs so when we are evaluating component libraries some=
 of the criteria that need to be met includes:</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">1. Ability to create and use different theme=
s</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">2. Components have been tested and meet the =
W3C Web Content Accessibility Guidelines principles</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">of Perceivable, Operable, Understandable, an=
d Robust</span></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><a href=3D"https://www.w3.org/WAI/fundamentals/accessibility-=
principles/" style=3D"background:transparent;margin-top:0pt;margin-bottom:0=
pt;color:rgb(74,110,224)" target=3D"_blank"><span style=3D"background:trans=
parent;margin-top:0pt;margin-bottom:0pt;color:rgb(74,110,224)">https://www.=
w3.org/WAI/fundamentals/accessibility-principles/</span></a></p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt">=C2=A0</p>
<p style=3D"color:rgb(28,30,41);background:transparent;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"color:rgb(28,30,41);background:transparent;mar=
gin-top:0pt;margin-bottom:0pt">3. Open-source with an active community</spa=
n></p></div></div></div></div></div></div></div></div></div></blockquote><d=
iv><br></div><div><br></div><div>As an exercise, I mocked up the proposed E=
vent Logs design using the Carbon Design System. This was a test on the the=
ory of being able to theme and customize Carbon to fit the needs of multipl=
e community members. The resulting design uses lighter colors and rounded e=
dges to achieve a friendly aesthetic. This demonstrates the flexibility tha=
t still exists and can be embedded into Carbon using themes, while providin=
g a sturdy foundation of interactions and components to build from.=C2=A0</=
div><div><br></div><div><a href=3D"https://ibm.invisionapp.com/share/QANZHJ=
KP74E#/319333663_Event_Logs">https://ibm.invisionapp.com/share/QANZHJKP74E#=
/319333663_Event_Logs=C2=A0</a></div></div></div>

--000000000000608ba70597cecf3e--
