Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4C806BAF
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 11:16:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AUrPXklK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlYGg6yXrz3d8R
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 21:16:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AUrPXklK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com; envelope-from=chandramohan.harkude@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkvJ35V2Qz30f8
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 19:45:38 +1100 (AEDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4b2d237ab87so641927e0c.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 00:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701765935; x=1702370735; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yD15SQZ6kV1fWv8z15pbe/w/vjHTJxvFNJ7j59l0A6g=;
        b=AUrPXklKEGbAW6BwrjrLupb01TOhJBcwGeL5xAmSVSnseVhdFUXSNb/XE/4b68Vaxr
         yAWEs5i3cJdxLSrKoZvw1WWtmkX1YuqKsItt3vPLel0qQRTAUQRkjSfByUKU44hHWxpl
         0LsB14rDe866JcT1Eb8uXPyqbbCs0TyqWuYOFrv0rfwIvti+fuADVB2sVwHq7Hz2qAT0
         cGUDy5jo86ZlOJi99bquuo1WpzEMOVWZL7LpCX/p/wJD7hrqanDqo8XsYRuIhaiZ2dky
         9cDvxRNliNfKcDOjuakmLjY3RGaPLbkko1Aj9SDyACHYT/k7CO1P2YB419jHU4IIZsmV
         syzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701765935; x=1702370735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yD15SQZ6kV1fWv8z15pbe/w/vjHTJxvFNJ7j59l0A6g=;
        b=HswYUIH5S8o5HUJPpvdgt0//3bXlxcq/W3FPfRat1rkVVg7Np8CBqFnU7CpbQJgcbh
         wSagslaUnPCfcmaTlgCnl8nYChe4n88YPntSpNzhSCunqKvcpB4NQIHND9M7n8ac6gO+
         s9CtR10cluh3kWVlUUrpwkiVJv4Yfv1H8ChqWtHz/WpigDLSxzhzILo5QI0emnuxy6EA
         K4X/HwQd8hc6Pt52qIaCgwmpGIFuiykBHYrOOp/KXap1TXF6+4hJ1tFrWCFJrw2OYnIY
         O7Xr6O1IY7pdse6hai+QYOegh9VQRKiwVoP2RdyEwZy7Xo/jU+Rza+Y6Uh9em5snedyw
         8T7g==
X-Gm-Message-State: AOJu0YwdijzQJF8oSvI3PSxXO8GKH9erU2iTMhaP0cDadev3cvUJQhAd
	E4lNpWvapWDXgxMHlK/kj81foXJzpPSXSdq+D6NWfd1Z
X-Google-Smtp-Source: AGHT+IE5Y7rAJrAkkSNzbqFCzMOrc+lf43TWuvEw1ND3OODzTk10trNiMxx4Oh22QAVFOI9thA/alrdO+AGLdV/od0o=
X-Received: by 2002:a05:6122:2a44:b0:4b2:c4e8:7367 with SMTP id
 fx4-20020a0561222a4400b004b2c4e87367mr3864661vkb.5.1701765935305; Tue, 05 Dec
 2023 00:45:35 -0800 (PST)
MIME-Version: 1.0
References: <CAAtDDLbih38WXPBKk7aP+nuzKWdSU98g8PupeqW1wVJwSHpbKw@mail.gmail.com>
 <ZWok7aT-agwWVRYW@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZWok7aT-agwWVRYW@heinlein.vulture-banana.ts.net>
From: Chandramohan <chandramohan.harkude@gmail.com>
Date: Tue, 5 Dec 2023 14:15:23 +0530
Message-ID: <CAAtDDLa6e3mXwS---rzxSxYJFHN6qcDUjeBhY-WVFVKHS8C8+w@mail.gmail.com>
Subject: Re: Suggestions required for sending the RF events in case of change
 happens on the backend-repos
To: Patrick Williams <patrick@stwcx.xyz>, ed@tanous.net
Content-Type: multipart/alternative; boundary="000000000000109a45060bbf424f"
X-Mailman-Approved-At: Wed, 06 Dec 2023 21:16:15 +1100
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

--000000000000109a45060bbf424f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Patrick Williams and Ed Tanous ,



I hope this message finds you well. I wanted to bring to your attention
some observations regarding the use of Redfish in various repositories in
upstream.



   1. After going through couple of repositories, I discovered that many
   upstream repositories are already incorporating Redfish. This is achieve=
d
   either through journald or by directly calling the phosphor-logging API =
to
   log Redfish-specific metadata. The details of this implementation can be
   found here: link to the implementation
   <https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgro=
k.openbmc.org%2Fsearch%3Ffull%3DREDFISH_MESSAGE_ID%26defs%3D%26refs%3D%26pa=
th%3D%26hist%3D%26type%3D%26xrd%3D%26nn%3D1%26searchall%3Dtrue&data=3D05%7C=
01%7Ccharkude%40nvidia.com%7Ca864c52919e844382cc008dbf5680a7b%7C43083d15727=
340c1b7db39efd9ccc17a%7C0%7C0%7C638373599440698496%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3DEjE4DlGunhXXsyQYjeU8%2BVqZRzAGkZRr65MDz2pnNTA%3D&reserved=
=3D0>.
   Additionally, this approach is documented in upstream design, available
   at link to design documentation
   <https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fopenbmc%2Fdocs%2Fblob%2Fmaster%2Farchitecture%2Fredfish-logging-i=
n-bmcweb.md&data=3D05%7C01%7Ccharkude%40nvidia.com%7Ca864c52919e844382cc008=
dbf5680a7b%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638373599440698496%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DUtZcUrUm9lC3JSg8b3LLsYWY9BBmbKeHzLn=
3J%2BXtR0Q%3D&reserved=3D0>
   .
   2.   As we observe these repositories, it has become apparent that they
   possess limited knowledge of Redfish, focusing primarily on essential
   elements like REDFISH_MESSAGE_ID and REDFISH_MESSAGE_ARGS. I would
   appreciate your insights on whether this approach is considered an
   anti-pattern or if there are potential drawbacks associated with this
   minimalistic understanding of Redfish.


   1. Currently, our solution is similar; the key distinction lies in our
   utilization of D-Bus instead of the journal to log Redfish-specific data=
.
   2. Furthermore, we are planning to abstract metadata such as message
   registry, message arguments and the origin of conditions. This will invo=
lve
   creating a new API that is based on generic (non-Redfish specific)
   concepts, within Phosphor Logging dedicated to generating logs with
   Redfish-specific data on the D-Bus. I previously discussed this proposal=
 in
   more detail in my email from November 2023, which you can find here
   <https://lists.ozlabs.org/pipermail/openbmc/2023-November/034470.html>.


Your insights and feedback on this proposal would be greatly appreciated.


Best Regards

Chandramohan



On Fri, Dec 1, 2023 at 11:54=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:

> On Wed, Nov 29, 2023 at 11:33:30PM +0530, Chandramohan wrote:
> > H All,
> >
> > I wanted to discuss various design approaches for, sending RF events fr=
om
> > various OpenBMC services for resource create/delete/modify cases (but n=
ot
> > limited to this),
> > Please find the details below:
>
> I'm not fully grasping what you're trying to solve.  Do you have more
> details on what your use-case is?
>
> Generally we _don't_ want all the repositories to know "Redfish".  If
> what you're proposing is some special Redfish-oriented handling in every
> repository, I don't think this will fly.
>
> For Redfish Events, I suspect someone would need to start a dbus monitor
> in BMC web to observe interesting changes and to turn them into Redfish
> Events inside bmcweb itself.
>
> --
> Patrick Williams
>

--000000000000109a45060bbf424f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"gmail-xmsonormal" style=3D"ma=
rgin:0in;font-size:11pt"><span style=3D"font-size:10pt;color:black"><font f=
ace=3D"georgia, serif">Dear Patrick Williams and Ed Tanous ,</font></span><=
/p>

<p class=3D"gmail-xmsonormal" style=3D"margin:0in;font-size:11pt"><font fac=
e=3D"georgia, serif">=C2=A0</font></p>

<p class=3D"gmail-xmsonormal" style=3D"margin:0in;font-size:11pt"><span sty=
le=3D"font-size:10pt;color:black"><font face=3D"georgia, serif">I hope this=
 message finds you well. I wanted to bring to your
attention some observations regarding the use of Redfish in various
repositories in upstream.</font></span></p>

<p class=3D"gmail-xmsonormal" style=3D"margin:0in;font-size:11pt"><span sty=
le=3D"font-size:10pt;color:black"><font face=3D"georgia, serif">=C2=A0</fon=
t></span></p>

<ol style=3D"margin-top:0in;margin-bottom:0in" start=3D"1" type=3D"1">
 <li class=3D"gmail-xmsonormal" style=3D"margin:0in;font-size:11pt"><font f=
ace=3D"georgia, serif"><span style=3D"font-size:10pt;color:black">After goi=
ng through couple of repositories,
     I discovered that many upstream repositories are already incorporating
     Redfish. This is achieved either through journald or by directly calli=
ng
     the phosphor-logging API to log Redfish-specific metadata. The details=
 of
     this implementation can be found here</span>: <a href=3D"https://nam11=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgrok.openbmc.org%2Fs=
earch%3Ffull%3DREDFISH_MESSAGE_ID%26defs%3D%26refs%3D%26path%3D%26hist%3D%2=
6type%3D%26xrd%3D%26nn%3D1%26searchall%3Dtrue&amp;data=3D05%7C01%7Ccharkude=
%40nvidia.com%7Ca864c52919e844382cc008dbf5680a7b%7C43083d15727340c1b7db39ef=
d9ccc17a%7C0%7C0%7C638373599440698496%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;s=
data=3DEjE4DlGunhXXsyQYjeU8%2BVqZRzAGkZRr65MDz2pnNTA%3D&amp;reserved=3D0" s=
tyle=3D"color:rgb(5,99,193)">link to the implementation</a>. <span style=3D=
"font-size:10pt;color:black">Additionally, this approach is documented
     in upstream design, available at</span> <a href=3D"https://nam11.safel=
inks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fdoc=
s%2Fblob%2Fmaster%2Farchitecture%2Fredfish-logging-in-bmcweb.md&amp;data=3D=
05%7C01%7Ccharkude%40nvidia.com%7Ca864c52919e844382cc008dbf5680a7b%7C43083d=
15727340c1b7db39efd9ccc17a%7C0%7C0%7C638373599440698496%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000%7C%7C%7C&amp;sdata=3DUtZcUrUm9lC3JSg8b3LLsYWY9BBmbKeHzLn3J%2BXtR0Q%3D&a=
mp;reserved=3D0" style=3D"color:rgb(5,99,193)">link to design documentation=
</a>.</font></li><li class=3D"gmail-xmsonormal" style=3D"margin:0in;font-si=
ze:11pt"><font face=3D"georgia, serif"><span style=3D"font-size:7pt;color:b=
lack">=C2=A0=C2=A0</span><span style=3D"font-size:10pt;color:black">As we o=
bserve these repositories, it has become apparent that they possess limited=
 knowledge of Redfish, focusing primarily on essential elements like REDFIS=
H_MESSAGE_ID and REDFISH_MESSAGE_ARGS. I would appreciate your insights on =
whether this approach is considered an anti-pattern or if there are potenti=
al drawbacks associated with this minimalistic understanding of Redfish.</s=
pan></font></li></ol>

<ol style=3D"margin-top:0in;margin-bottom:0in" start=3D"3" type=3D"1">
 <li class=3D"gmail-xmsolistparagraph" style=3D"margin:0in;font-size:11pt">=
<span style=3D"font-size:10pt;color:black"><font face=3D"georgia, serif">Cu=
rrently, our
     solution is similar; the key distinction lies in our utilization of D-=
Bus
     instead of the journal to log Redfish-specific data.</font></span></li=
><li class=3D"gmail-xmsolistparagraph" style=3D"margin:0in;font-size:11pt">=
<span style=3D"font-size:10pt;color:black"><font face=3D"georgia, serif">Fu=
rthermore, we are planning to abstract metadata such as message registry, m=
essage arguments and the origin of conditions. This will involve creating a=
 new API that is based on generic (non-Redfish specific) concepts, within P=
hosphor Logging dedicated to generating logs with Redfish-specific data on =
the D-Bus. I previously discussed this proposal in more detail in my email =
from November 2023, which you can find <a href=3D"https://lists.ozlabs.org/=
pipermail/openbmc/2023-November/034470.html" style=3D"color:rgb(5,99,193)">=
here</a>.</font></span></li></ol><pre style=3D"margin:0in 0in 0.0001pt 0.25=
in;background-image:initial;background-position:initial;background-size:ini=
tial;background-repeat:initial;background-origin:initial;background-clip:in=
itial;font-size:10pt"><span style=3D"color:black;font-size:10pt"><font face=
=3D"georgia, serif"><br></font></span></pre><pre style=3D"margin:0in 0in 0.=
0001pt 0.25in;background-image:initial;background-position:initial;backgrou=
nd-size:initial;background-repeat:initial;background-origin:initial;backgro=
und-clip:initial;font-size:10pt"><span style=3D"color:black;font-size:10pt"=
><font face=3D"georgia, serif">Your insights and feedback on this proposal =
would be greatly appreciated.</font></span><font face=3D"Courier New"><br><=
/font></pre><pre style=3D"background-image:initial;background-position:init=
ial;background-size:initial;background-repeat:initial;background-origin:ini=
tial;background-clip:initial;margin:0in 0in 0.0001pt;font-size:10pt;font-fa=
mily:&quot;Courier New&quot;"><span style=3D"color:black"><br></span></pre>=
<pre style=3D"background-image:initial;background-position:initial;backgrou=
nd-size:initial;background-repeat:initial;background-origin:initial;backgro=
und-clip:initial;margin:0in 0in 0.0001pt;font-size:10pt"><span style=3D"col=
or:black"><font face=3D"georgia, serif">Best Regards</font></span></pre><pr=
e style=3D"background-image:initial;background-position:initial;background-=
size:initial;background-repeat:initial;background-origin:initial;background=
-clip:initial;margin:0in 0in 0.0001pt;font-size:10pt"><span style=3D"color:=
black"><font face=3D"georgia, serif">Chandramohan</font></span></pre><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Fri, Dec 1, 2023 at 11:54=E2=80=AFPM Patrick Williams &lt;<a href=3D"mailt=
o:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, Nov 29, 2023 at 11:33:30PM +0=
530, Chandramohan wrote:<br>
&gt; H All,<br>
&gt; <br>
&gt; I wanted to discuss various design approaches for, sending RF events f=
rom<br>
&gt; various OpenBMC services for resource create/delete/modify cases (but =
not<br>
&gt; limited to this),<br>
&gt; Please find the details below:<br>
<br>
I&#39;m not fully grasping what you&#39;re trying to solve.=C2=A0 Do you ha=
ve more<br>
details on what your use-case is?<br>
<br>
Generally we _don&#39;t_ want all the repositories to know &quot;Redfish&qu=
ot;.=C2=A0 If<br>
what you&#39;re proposing is some special Redfish-oriented handling in ever=
y<br>
repository, I don&#39;t think this will fly.<br>
<br>
For Redfish Events, I suspect someone would need to start a dbus monitor<br=
>
in BMC web to observe interesting changes and to turn them into Redfish<br>
Events inside bmcweb itself.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div></div>

--000000000000109a45060bbf424f--
