Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9246E1D1B40
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 18:39:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MgPd5CD3zDqjx
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 02:39:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=AeesP+rJ; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MgNs4M5QzDqgZ
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 02:39:08 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id d26so2653138otc.7
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+VqN/B9Gf6cbwh2XAwDvOr1MAM2EWeLJNnYersXNn78=;
 b=AeesP+rJSgUGYxBSqbpu3TlGfGAj06xCZdW3jJ+YSx6CdIYvWtJBAy7E44uxtrk+wo
 LchLuKNuPB3a0ywhckzwePrge+8rJZ5G8M0y6zW3O0TdD73WqUNJLMC7uKFKEiHyEE+g
 a86AYtSdJQSi8xxTIm0XRC1pt86Z841cKynqXhIsZOrEcDySL2raPjjBpTKm8UMlQcz0
 7EkkbtMIau2llIYqDTXUYhQUV0y/yrWPbX7EagPgXQFE9TiFCAxnLRTxPesTILRtQm1k
 DRrUe3jkruSb6KvCOtbQTJ5m1YQfsQRT7m9UVRqaMFI4nzF+LMr7+QaaI63GdHbk9i7j
 mfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+VqN/B9Gf6cbwh2XAwDvOr1MAM2EWeLJNnYersXNn78=;
 b=KjGI2F1xbZZlNjb1C3XbTdrx7nD7ykr6KUCiFZ6u3m5Mg1x/u0Ai0jjsbEi94GrnA9
 LqpObe7SVBqX+fK181T6UkECL9apOYOx/fnNPYNrTOx7XVXQao/v8DHBQZjvnfzaDrTY
 7dSMxwOSjKPPYuL5nKyumdyFuyDEC7nWREYgdbqnoGEQV2780ys5SXbq5yB7xzf/AkoY
 bHyMhX4BiFmHgV3wuSiitDpWiqiR/A/5qRRREcJ/eQin3KXmMrlzyx1ZZU+ATIlO62kH
 rOHqg3Ooi7/ERzzM2J8kq+YmOHNX/orS2qlcMc75wz1dBIuz/oLZbfYPVTqp52Dghk6u
 3+TA==
X-Gm-Message-State: AOAM531VZc1RGRj6oE42RK/7XGj2UCqb/iA7iiHTLooF8MW3MfeU3MMn
 GxtghYNDHLWR2ilNL4yCpz2CAfxCzH81gZJvIOeVxQ==
X-Google-Smtp-Source: ABdhPJy3gfBe4vfB2679FqB5M//90LhQ7AOMwaGKg2kmFAZxUgwjXi1Clvn/jirATVRVxVDL3RK4UH1vNe94mMqeY84=
X-Received: by 2002:a05:6830:1098:: with SMTP id
 y24mr251137oto.222.1589387945295; 
 Wed, 13 May 2020 09:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96Mnk8Hf4wAB_Ot=XEqp9yecspPfMGB6oF_LSgjRFMNHvw@mail.gmail.com>
 <CAB_SOc5tEo7xRg65aMfBOWyY_yXkb6+mLmRhf8hifNhHDWGVgQ@mail.gmail.com>
 <CAMXw96NoWn+sZELD1Xd=WUyLwvOUZ9prKyqqaLFKiMwM6ChuMw@mail.gmail.com>
 <CAB_SOc6pgn2OXd-KRYNpzszxWyhfGOdBTHMB5FWbat8QaZ1CoQ@mail.gmail.com>
 <CH2PR21MB1510B40F09178BC841F62AA6C8A50@CH2PR21MB1510.namprd21.prod.outlook.com>
 <CAB_SOc7dz7ARKH5W-d7EwrFnLxd0V3Ny7i3xyxGGGxHTGW0LOg@mail.gmail.com>
 <CH2PR21MB1510222BA2CC09AE1CC6AF90C8A10@CH2PR21MB1510.namprd21.prod.outlook.com>
 <CH2PR21MB1510A65080452245E6295DFDC8A10@CH2PR21MB1510.namprd21.prod.outlook.com>
 <CAB_SOc4c8UzMFM5YOtbrxJJkq08pbTs8ehWkcc=6ETycXdh=dw@mail.gmail.com>
In-Reply-To: <CAB_SOc4c8UzMFM5YOtbrxJJkq08pbTs8ehWkcc=6ETycXdh=dw@mail.gmail.com>
From: Zhenfei Tai <ztai@google.com>
Date: Wed, 13 May 2020 09:38:53 -0700
Message-ID: <CAMXw96M8FdgrQpcn4D9L4EUJ+0shXyK66910rAVq+QKfpyOdDQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [bmcweb] mTLS client authentication always succeeds
To: Zbyszek <zbigniewku@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e4775f05a58a3707"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e4775f05a58a3707
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great, thanks for the update.

On Wed, May 13, 2020 at 6:24 AM Zbyszek <zbigniewku@gmail.com> wrote:

> Instruction is under review:
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32234
>
> pon., 11 maj 2020 o 20:57 Neeraj Ladkani <neladk@microsoft.com>
> napisa=C5=82(a):
> >
> >  "Oem": {
> >         "OpenBMC": {
> >             "@odata.type": "#OemAccountService.v1_0_0.AccountService",
> >             "AuthMethods": {
> >                 "BasicAuth": true,
> >                 "Cookie": true,
> >                 "SessionToken": true,
> >                 "TLS": true,
> >                 "XToken": true
> >             }
> >         }
> >
> > -----Original Message-----
> > From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org>
> On Behalf Of Neeraj Ladkani
> > Sent: Monday, May 11, 2020 11:20 AM
> > To: Zbyszek <zbigniewku@gmail.com>
> > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Zhenfei Tai <
> ztai@google.com>
> > Subject: RE: [EXTERNAL] Re: [bmcweb] mTLS client authentication always
> succeeds
> >
> > I have enabled DBMCWEB_ENABLE_MUTUAL_TLS_AUTHENTICATION in bmcweb  but =
I
> do not see TLSAuth/Certificates in redfish/v1/AccountService ?  I tried t=
o
> upload CA cert via bmcweb but I could not make it work ( Authentication
> failing)
> >
> > I could not find documentation to enable this feature. it would be grea=
t
> if someone can send steps to enable this feature?
> >
> > Neeraj
> >
> >
> > -----Original Message-----
> > From: Zbyszek <zbigniewku@gmail.com>
> > Sent: Thursday, May 7, 2020 2:10 AM
> > To: Neeraj Ladkani <neladk@microsoft.com>
> > Cc: Zhenfei Tai <ztai@google.com>; OpenBMC Maillist <
> openbmc@lists.ozlabs.org>
> > Subject: Re: [EXTERNAL] Re: [bmcweb] mTLS client authentication always
> succeeds
> >
> > czw., 7 maj 2020 o 10:14 Neeraj Ladkani <neladk@microsoft.com>
> napisa=C5=82(a):
> > >
> > > Hi Zbyszek,
> > >
> > > Just a basic question, Once bmcweb is configured with
> -DBMCWEB_ENABLE_MUTUAL_TLS_AUTHENTICATION, can it work without client cer=
t?
> >
> >
> > Yes it can, by default all authentication methods are enabled except TL=
S.
> > Which method is enabled can be checked via redfish service
> > AccountService->Oem->OpenBMC->AuthMethods.
> > To change these settings send PATCH to
> > https://{{bmc_ip}}/redfish/v1/AccountService.
> > For example to turn the tls use this patch body :  {"Oem": {"OpenBMC":
> > {"AuthMethods": {"TLS": true}}}}
> >
> > I think this diagram at paragraph 'Authentication Process'
> >
> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenbmc%2Fdocs%2Fblob%2Fmaster%2Fdesigns%2Fredfish-tls-user-authent=
ication.md&amp;data=3D02%7C01%7Cneladk%40microsoft.com%7C35b75654ecce4c6800=
4508d7f5d81b8a%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637248180841865=
287&amp;sdata=3DOGH2hRGgB5%2FA%2FG63fiwp0hq2E%2FStoL1ka2ZPJ1zG1Tg%3D&amp;re=
served=3D0
> > can be useful in understanding how the authentication process flow look=
s
> like.
> > (now I see that some parts of this design, like paths requires updates,
> but the diagram is valid).
> >
> >
> > >
> > > It will be good to document curl APIs to enable this feature and test
> end to end flows.
> > >
> > > Thanks
> > > Neeraj
> > >
> > > -----Original Message-----
> > > From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.or=
g>
> > > On Behalf Of Zbyszek
> > > Sent: Thursday, May 7, 2020 12:49 AM
> > > To: Zhenfei Tai <ztai@google.com>
> > > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> > > Subject: [EXTERNAL] Re: [bmcweb] mTLS client authentication always
> > > succeeds
> > >
> > > =C5=9Br., 6 maj 2020 o 20:19 Zhenfei Tai <ztai@google.com> napisa=C5=
=82(a):
> > > >
> > > > Hi Zbyszek,
> > > >
> > > > Thanks for your reply. I look forward to the official documentation=
.
> > > >
> > > > The callback function returns true when preverified =3D=3D false. N=
ot
> sure why it should always return true, which accepts any client certifica=
te.
> > >
> > > Yes, always returning true we do not break the tls handshake allowing
> for connection.
> > > But user will not be authenticated anyway because its name will not b=
e
> extracted from the certificate.
> > > In such case user should receive proper http error code telling he is
> not authenticated.
> > >
> > > >
> > > > // We always return true to allow full auth flow if (!preverified) =
{
> > > > BMCWEB_LOG_DEBUG << this << " TLS preverification failed."; return
> > > > true; }
> > > >
> > > > Thanks,
> > > > Zhenfei
> > > >
> > > > On Wed, May 6, 2020 at 4:22 AM Zbyszek <zbigniewku@gmail.com> wrote=
:
> > > >>
> > > >> pt., 1 maj 2020 o 02:07 Zhenfei Tai <ztai@google.com> napisa=C5=82=
(a):
> > > >> >
> > > >> > Hi,
> > > >> >
> > > >> > I've been testing bmcweb mTLS for a while and found the user
> > > >> > defined verify callback function returns true in all cases.
> > > >> > (https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%
> > > >> > 25
> > > >> > 2F
> > > >> > github.com%2Fopenbmc%2Fbmcweb%2Fblob%2Fmaster%2Fhttp%2Fhttp_conn=
e
> > > >> > ct
> > > >> > ion.h%23L287&amp;data=3D02%7C01%7Cneladk%40microsoft.com%7C8f5ff=
612
> > > >> > 5e
> > > >> > db4b734c3e08d7f25b2b68%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C=
0
> > > >> > %7
> > > >> > C637244345695157575&amp;sdata=3D3E%2F%2FdxSuR5SFo9ZII%2FZAA7h6%2=
FDd
> > > >> > s1
> > > >> > lHeZaCnbimciLw%3D&amp;reserved=3D0)
> > > >> >
> > > >> > If client authentication is enabled in bmcweb, should it reject
> if client certificate is bad?
> > > >>
> > > >> No, purpose of this callback is to only extract the user name from
> > > >> the certificate and then allow to proceed with default OpenSSL
> > > >> verification flow which should finally fail if something is wrong
> > > >> with the certificate no matter what this function returned.
> > > >> The 'set_verify_callback' doesn't replace the whole verification
> > > >> procedure, it only adds a callback that is called when the default
> > > >> validator checks each certificate. The 'preverified' parameter,
> > > >> passed to it indicates if verification of the certificate succeede=
d
> or not.
> > > >> You should be able to see it in bmcweb logs.
> > > >>
> > > >> >
> > > >> > Thanks,
> > > >> > Zhenfei
>

--000000000000e4775f05a58a3707
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great, thanks for the update.=C2=A0<br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 13, 202=
0 at 6:24 AM Zbyszek &lt;<a href=3D"mailto:zbigniewku@gmail.com">zbigniewku=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Instruction is under review:<br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32234" rel=
=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/c/open=
bmc/docs/+/32234</a><br>
<br>
pon., 11 maj 2020 o 20:57 Neeraj Ladkani &lt;<a href=3D"mailto:neladk@micro=
soft.com" target=3D"_blank">neladk@microsoft.com</a>&gt; napisa=C5=82(a):<b=
r>
&gt;<br>
&gt;=C2=A0 &quot;Oem&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;OpenBMC&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;@odata.type&quot;=
: &quot;#OemAccountService.v1_0_0.AccountService&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;AuthMethods&quot;=
: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Bas=
icAuth&quot;: true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Coo=
kie&quot;: true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Ses=
sionToken&quot;: true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;TLS=
&quot;: true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;XTo=
ken&quot;: true<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: openbmc &lt;openbmc-bounces+neladk=3D<a href=3D"mailto:microsoft=
.com@lists.ozlabs.org" target=3D"_blank">microsoft.com@lists.ozlabs.org</a>=
&gt; On Behalf Of Neeraj Ladkani<br>
&gt; Sent: Monday, May 11, 2020 11:20 AM<br>
&gt; To: Zbyszek &lt;<a href=3D"mailto:zbigniewku@gmail.com" target=3D"_bla=
nk">zbigniewku@gmail.com</a>&gt;<br>
&gt; Cc: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" t=
arget=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; Zhenfei Tai &lt;<a href=
=3D"mailto:ztai@google.com" target=3D"_blank">ztai@google.com</a>&gt;<br>
&gt; Subject: RE: [EXTERNAL] Re: [bmcweb] mTLS client authentication always=
 succeeds<br>
&gt;<br>
&gt; I have enabled DBMCWEB_ENABLE_MUTUAL_TLS_AUTHENTICATION in bmcweb=C2=
=A0 but I do not see TLSAuth/Certificates in redfish/v1/AccountService ?=C2=
=A0 I tried to upload CA cert via bmcweb but I could not make it work ( Aut=
hentication failing)<br>
&gt;<br>
&gt; I could not find documentation to enable this feature. it would be gre=
at if someone can send steps to enable this feature?<br>
&gt;<br>
&gt; Neeraj<br>
&gt;<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: Zbyszek &lt;<a href=3D"mailto:zbigniewku@gmail.com" target=3D"_b=
lank">zbigniewku@gmail.com</a>&gt;<br>
&gt; Sent: Thursday, May 7, 2020 2:10 AM<br>
&gt; To: Neeraj Ladkani &lt;<a href=3D"mailto:neladk@microsoft.com" target=
=3D"_blank">neladk@microsoft.com</a>&gt;<br>
&gt; Cc: Zhenfei Tai &lt;<a href=3D"mailto:ztai@google.com" target=3D"_blan=
k">ztai@google.com</a>&gt;; OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@=
lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt; Subject: Re: [EXTERNAL] Re: [bmcweb] mTLS client authentication always=
 succeeds<br>
&gt;<br>
&gt; czw., 7 maj 2020 o 10:14 Neeraj Ladkani &lt;<a href=3D"mailto:neladk@m=
icrosoft.com" target=3D"_blank">neladk@microsoft.com</a>&gt; napisa=C5=82(a=
):<br>
&gt; &gt;<br>
&gt; &gt; Hi Zbyszek,<br>
&gt; &gt;<br>
&gt; &gt; Just a basic question, Once bmcweb is configured with -DBMCWEB_EN=
ABLE_MUTUAL_TLS_AUTHENTICATION, can it work without client cert?<br>
&gt;<br>
&gt;<br>
&gt; Yes it can, by default all authentication methods are enabled except T=
LS.<br>
&gt; Which method is enabled can be checked via redfish service<br>
&gt; AccountService-&gt;Oem-&gt;OpenBMC-&gt;AuthMethods.<br>
&gt; To change these settings send PATCH to<br>
&gt; https://{{bmc_ip}}/redfish/v1/AccountService.<br>
&gt; For example to turn the tls use this patch body :=C2=A0 {&quot;Oem&quo=
t;: {&quot;OpenBMC&quot;:<br>
&gt; {&quot;AuthMethods&quot;: {&quot;TLS&quot;: true}}}}<br>
&gt;<br>
&gt; I think this diagram at paragraph &#39;Authentication Process&#39;<br>
&gt; <a href=3D"https://nam06.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2Fopenbmc%2Fdocs%2Fblob%2Fmaster%2Fdesigns%2Fredfish-tl=
s-user-authentication.md&amp;amp;data=3D02%7C01%7Cneladk%40microsoft.com%7C=
35b75654ecce4c68004508d7f5d81b8a%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0=
%7C637248180841865287&amp;amp;sdata=3DOGH2hRGgB5%2FA%2FG63fiwp0hq2E%2FStoL1=
ka2ZPJ1zG1Tg%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" target=3D"_blank">=
https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fdocs%2Fblob%2Fmaster%2Fdesigns%2Fredfish-tls-user-authentic=
ation.md&amp;amp;data=3D02%7C01%7Cneladk%40microsoft.com%7C35b75654ecce4c68=
004508d7f5d81b8a%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6372481808418=
65287&amp;amp;sdata=3DOGH2hRGgB5%2FA%2FG63fiwp0hq2E%2FStoL1ka2ZPJ1zG1Tg%3D&=
amp;amp;reserved=3D0</a><br>
&gt; can be useful in understanding how the authentication process flow loo=
ks like.<br>
&gt; (now I see that some parts of this design, like paths requires updates=
, but the diagram is valid).<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; It will be good to document curl APIs to enable this feature and =
test end to end flows.<br>
&gt; &gt;<br>
&gt; &gt; Thanks<br>
&gt; &gt; Neeraj<br>
&gt; &gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: openbmc &lt;openbmc-bounces+neladk=3D<a href=3D"mailto:micr=
osoft.com@lists.ozlabs.org" target=3D"_blank">microsoft.com@lists.ozlabs.or=
g</a>&gt;<br>
&gt; &gt; On Behalf Of Zbyszek<br>
&gt; &gt; Sent: Thursday, May 7, 2020 12:49 AM<br>
&gt; &gt; To: Zhenfei Tai &lt;<a href=3D"mailto:ztai@google.com" target=3D"=
_blank">ztai@google.com</a>&gt;<br>
&gt; &gt; Cc: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.o=
rg" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt; &gt; Subject: [EXTERNAL] Re: [bmcweb] mTLS client authentication alway=
s<br>
&gt; &gt; succeeds<br>
&gt; &gt;<br>
&gt; &gt; =C5=9Br., 6 maj 2020 o 20:19 Zhenfei Tai &lt;<a href=3D"mailto:zt=
ai@google.com" target=3D"_blank">ztai@google.com</a>&gt; napisa=C5=82(a):<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi Zbyszek,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks for your reply. I look forward to the official docume=
ntation.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The callback function returns true when preverified =3D=3D f=
alse. Not sure why it should always return true, which accepts any client c=
ertificate.<br>
&gt; &gt;<br>
&gt; &gt; Yes, always returning true we do not break the tls handshake allo=
wing for connection.<br>
&gt; &gt; But user will not be authenticated anyway because its name will n=
ot be extracted from the certificate.<br>
&gt; &gt; In such case user should receive proper http error code telling h=
e is not authenticated.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; // We always return true to allow full auth flow if (!prever=
ified) {<br>
&gt; &gt; &gt; BMCWEB_LOG_DEBUG &lt;&lt; this &lt;&lt; &quot; TLS preverifi=
cation failed.&quot;; return<br>
&gt; &gt; &gt; true; }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; Zhenfei<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, May 6, 2020 at 4:22 AM Zbyszek &lt;<a href=3D"mailto=
:zbigniewku@gmail.com" target=3D"_blank">zbigniewku@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; pt., 1 maj 2020 o 02:07 Zhenfei Tai &lt;<a href=3D"mailt=
o:ztai@google.com" target=3D"_blank">ztai@google.com</a>&gt; napisa=C5=82(a=
):<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; Hi,<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; I&#39;ve been testing bmcweb mTLS for a while and f=
ound the user<br>
&gt; &gt; &gt;&gt; &gt; defined verify callback function returns true in al=
l cases.<br>
&gt; &gt; &gt;&gt; &gt; (<a href=3D"https://nam06.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%" rel=3D"noreferrer" target=3D"_blank">https://n=
am06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%</a><br>
&gt; &gt; &gt;&gt; &gt; 25<br>
&gt; &gt; &gt;&gt; &gt; 2F<br>
&gt; &gt; &gt;&gt; &gt; <a href=3D"http://github.com" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com</a>%2Fopenbmc%2Fbmcweb%2Fblob%2Fmaster%2Fhttp%2F=
http_conne<br>
&gt; &gt; &gt;&gt; &gt; ct<br>
&gt; &gt; &gt;&gt; &gt; ion.h%23L287&amp;amp;data=3D02%7C01%7Cneladk%<a hre=
f=3D"http://40microsoft.com" rel=3D"noreferrer" target=3D"_blank">40microso=
ft.com</a>%7C8f5ff612<br>
&gt; &gt; &gt;&gt; &gt; 5e<br>
&gt; &gt; &gt;&gt; &gt; db4b734c3e08d7f25b2b68%7C72f988bf86f141af91ab2d7cd0=
11db47%7C1%7C0<br>
&gt; &gt; &gt;&gt; &gt; %7<br>
&gt; &gt; &gt;&gt; &gt; C637244345695157575&amp;amp;sdata=3D3E%2F%2FdxSuR5S=
Fo9ZII%2FZAA7h6%2FDd<br>
&gt; &gt; &gt;&gt; &gt; s1<br>
&gt; &gt; &gt;&gt; &gt; lHeZaCnbimciLw%3D&amp;amp;reserved=3D0)<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; If client authentication is enabled in bmcweb, shou=
ld it reject if client certificate is bad?<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; No, purpose of this callback is to only extract the user=
 name from<br>
&gt; &gt; &gt;&gt; the certificate and then allow to proceed with default O=
penSSL<br>
&gt; &gt; &gt;&gt; verification flow which should finally fail if something=
 is wrong<br>
&gt; &gt; &gt;&gt; with the certificate no matter what this function return=
ed.<br>
&gt; &gt; &gt;&gt; The &#39;set_verify_callback&#39; doesn&#39;t replace th=
e whole verification<br>
&gt; &gt; &gt;&gt; procedure, it only adds a callback that is called when t=
he default<br>
&gt; &gt; &gt;&gt; validator checks each certificate. The &#39;preverified&=
#39; parameter,<br>
&gt; &gt; &gt;&gt; passed to it indicates if verification of the certificat=
e succeeded or not.<br>
&gt; &gt; &gt;&gt; You should be able to see it in bmcweb logs.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; Thanks,<br>
&gt; &gt; &gt;&gt; &gt; Zhenfei<br>
</blockquote></div>

--000000000000e4775f05a58a3707--
