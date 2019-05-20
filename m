Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ABD24243
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2019 22:53:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457B2S4jZjzDqGb
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 06:53:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aTM5az+x"; 
 dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457B0265z6zDqK1
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 06:51:46 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id k128so4591069ybf.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 May 2019 13:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ft1Vr0Av5J6GxTdxOav9CCrb3cz/vUk17AW6rzozpy8=;
 b=aTM5az+xUdYOD7o7TzhDX17MCq64bCWWn4dNVJ1ed/U+8D24KcNV1uEEy3T3srjf+5
 CWh4yZiFeodUtSrRo/Vbd9261aFkZWbdYZ3fqTL/KOe6sDEqnXmYL0KjizeFoc5wHpJp
 plhVjNlC+zsIhNFEQBETDLAqurKmT50pn+a8eVXxyxbAAK0eZS1ld2S6zO2vpygTpKON
 PBOZZ5VgCCTQqhvJhEU7KZhTH6gyp3M2M2S4ztEdNVcq9jbZKRyTvHcJEo4BgPu2NN8U
 j/rGkdnzzI144r5Cs94Aiv6UJwFrJHMbjSkV7i8MZJS6+KRha1QCFhJe60HrU7C02uD7
 i2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ft1Vr0Av5J6GxTdxOav9CCrb3cz/vUk17AW6rzozpy8=;
 b=ak3RHdnLXg87G6dfd0jb0X56EkHYow2lpDq9u3bEY1bd3mEaU+HYzmVriOUZkLEq8j
 WskfllFtMJGa6IbU8QvTmuT40vpwu02Zfm6VcbGQ1uSzX8NTGXUlepElQ27oUeZjcyfe
 6ZmOHyQG2vY+MlkHpN6L7pvboz2TyaWakJJdBOfYkVOAwS9ZHrq1FFqFPYI4Og1W3Msz
 57hkj43kyJlq2bLv8slcQwaud0/brcZ1R0pObxLSg9n+j/+kA88tfGPIFr4fwLXBFgqT
 RpMeMaSn1LGCiYjaojF0EIAjI7vsFI4G1tSv5112CZuhsMhzUpivP4WGVtQ4HY/TBGEI
 Z7+A==
X-Gm-Message-State: APjAAAVrWdoccC8fQEhBiCCKeOr1RLvMFCbw6/B+NPyCB1i97mK3ORGt
 5vh9eVYsGlN+CENhUzyGweDQkCG9QJe4WuWMdGqlu6zk10I=
X-Google-Smtp-Source: APXvYqxEaTz9/XefuugEDbhI38lsQSCzZCQWREmozQ71zXMKijJpteas6b6ohOJF+IJI+QRzqGSnZzyXfQW2Y3fZig8=
X-Received: by 2002:a25:40d:: with SMTP id 13mr37592437ybe.9.1558385503476;
 Mon, 20 May 2019 13:51:43 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Mon, 20 May 2019 15:51:32 -0500
Message-ID: <CAMTupoSEPYC0bDO3w+yPawcR6-s-EZ59ET-UUWERKrvfyjJkng@mail.gmail.com>
Subject: Boot Options - GUI Update
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000005ba1d9058957e6b2"
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

--0000000000005ba1d9058957e6b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'd like to share the feedback we've gotten around* Boot Options* so far.
This feedback is based on conversations with *four users* (3 system admins
and 1 support)
*Design Mockups (for reference):*
https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_=
System_On

   - *Boot Mode* options
      - Terminology
         - Alternative for =E2=80=98Regular=E2=80=99 : Normal
         - Alternative for =E2=80=98Setup=E2=80=99 : Configuration, petitbo=
ot (?)
         - Alternative for 'Safe' : Emergency
         - 1/4 user didn=E2=80=99t know what =E2=80=98Setup=E2=80=99 meant
         - *--> Might need info-icon help to understand what Regular, Safe,
         and Setup mean. Need more research to see a definitive trend.*
      - Some users expected additional options:
         - 1 user expected an =E2=80=98SMS=E2=80=99 option (AIX)
         - 3/4 users expected a =E2=80=98Single user boot=E2=80=99 mode (us=
e case: no
         network connection, no logging in, console only)
         - *--> Might need add additional options or determine if they are
         the same as the existing options; will need to understand the
use case to
         determine value and priority. Need more research to see a
definitive trend.*
      - 1/4 user was surprised to see Boot Mode; doesn't believe it applies
      to Linux based systems
      - ** Note: On OpenPOWER, we don't currently really have a "Safe" mode
      of operation outside of bringup. **


   - *Boot Source* options
      - Terminology
         - Alternative for =E2=80=98Disk=E2=80=99 : System
         - Alternative For =E2=80=98External media=E2=80=99 : Optical
         - Users aren=E2=80=99t clear on what =E2=80=98Default=E2=80=99 sou=
rce refers to
         - *--> Might need info-icon help to understand what Default,
         External Media, Network, and Disk mean. Need more research to see =
a
         definitive trend.*
      - Usability:
         - If =E2=80=98Network=E2=80=99 option is selected, users expect to=
 be able to
         point to that server=E2=80=99s IP address
         - *--> Need to understand how this is handled in the back end.
         Might need more research to understand how others would
expect the Network
         option to work.*
      - Expected additional options:
         - 1/4 users expected the ability to boot to PXE (use case: when
         re-imaging a machine)
         - *--> Might need add additional options or determine if they are
         the same as the existing options; will need to understand the
use case to
         determine value and priority. Need more research to see a
definitive trend.*


   - Terminology on *Orderly *vs *Immediate *(for Reboot/Shutdown methods)
      - *4/4 users have understood the terms =E2=80=98Orderly=E2=80=99 and =
=E2=80=98Immediate=E2=80=99
      either because they use them or because the definition in the GUI was
      helpful*
      - Intel was surprised to see something other than 'warm' and 'cold'.
      Their definitions were:
         - warm: CPU is always on (during a host reboot)
         - cold: CPU/ power goes off to the host
         - *--> I am unsure if this is the same thing ^ *
      - Other names users have mentioned to refer to this:
         - Warm vs Cold
         - Controlled vs Immediate
         - Graceful
      - *General usability *(1 user saw design with 'next boot' and
   'subsequent boot' sections; 2 users saw design with general settings and=
 no
   support for 'next boot')
      - 1/1 user was not certain how the =E2=80=98next boot=E2=80=99 would =
work because
      technically there is always a =E2=80=98next boot=E2=80=99 so when wou=
ld the =E2=80=98subsequent
      boot=E2=80=99 happen
         - User was concerned that the "next boot only" setting would not
         clear automatically after the reboot (i.e. that he would have
to log back
         in, revisit this page, and manually uncheck the box)
      - 1/1 user thought the order of =E2=80=98next boot=E2=80=99 and =E2=
=80=98subsequent boot=E2=80=99
      should be switched since =E2=80=99subsequent boot=E2=80=99 would be t=
he default.
They also
      thought it would make more sense to apply =E2=80=98subsequent boot=E2=
=80=99 settings to
      =E2=80=98next boot=E2=80=99 rather than the other way around (which i=
s the current GUI
      proposal)
      - *--> Understand how and when the 'next boot' would be used. UX will
      work to create alternative designs so that it is clear when the
'next boot'
      settings will be applied and not applied. *
      - *--> Consider more closely associating the reboot/shutdown method
      (orderly vs. immediate)  to the Reboot and Shutdown buttons*
   - =E2=80=98Next boot=E2=80=99
      - *The value of being able to set different settings for =E2=80=98nex=
t boot=E2=80=99
      is unclear.*
         - 1 user only reboot 1-2 times a year
            - Thinks this might be more helpful for customers with large
            clusters of servers
         - 1 user is in support and would not use this
         - 1 would use 2-3 times per quarter
         - 1 user uses the command line and relies on the default settings


   - Access to this panel?
      - 1 user thought this should be for root level privileges only
      - *--> Who should have access to this panel and how do we ensure
      that? *



*QUESTIONS: *

   - Does Boot Mode apply to Linux based systems? (SME)
   - Do we have a way of informing users that a reboot is complete? (SME)
   - On the =E2=80=98Network=E2=80=99 option in Boot Source, where is the r=
emote source
   over a network defined? / How is a user informed of it or change it? (SM=
E /
   user)
   - What does =E2=80=98Default=E2=80=99 refer to in Boot Source? (SME)
   - Still need to understand the value of =E2=80=98next boot=E2=80=99 and =
how it would be
   used (user)
   - Is 'single user mode' the same as Regular, Safe, or Setup? (SME)
   - Should we support boot to PXE? (SME / user)


=E2=80=93
*Jandra Aranguren*
IBM Design | IBM Studios Austin | UX Design

*E:* jandra.aranguren@ibm.com

--0000000000005ba1d9058957e6b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" style=3D"outline:none;color:rgb(18,18,18)=
;font-size:14px"><div style=3D"outline:none"><span style=3D"outline:none;fo=
nt-family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-size:=
0.857em">Hi all,</span></span></div><div style=3D"outline:none">=C2=A0</div=
><div style=3D"outline:none"><span style=3D"outline:none;font-family:Verdan=
a,Geneva,sans-serif"><span style=3D"outline:none;font-size:0.857em">I&#39;d=
 like to share the feedback we&#39;ve gotten around<strong style=3D"outline=
:none">=C2=A0Boot Options</strong>=C2=A0so far. This feedback is based on c=
onversations with=C2=A0<strong style=3D"outline:none">four users</strong>=
=C2=A0(3=C2=A0system admins and 1 support)</span></span></div><div style=3D=
"outline:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-=
serif"><span style=3D"outline:none;font-size:0.857em"><strong style=3D"outl=
ine:none">Design Mockups (for reference):</strong>=C2=A0</span><span style=
=3D"outline:none;font-size:12px;color:rgb(34,34,34)"><a href=3D"https://ibm=
.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_System_On" =
rel=3D"noopener" target=3D"_blank" style=3D"outline:none;color:rgb(65,120,1=
90)">https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Optio=
ns_-_System_On</a></span></span></div><ul style=3D"outline:none"><li style=
=3D"outline:none;margin-top:0px"><span style=3D"outline:none;font-family:Ve=
rdana,Geneva,sans-serif"><span style=3D"outline:none;color:rgb(0,0,255)"><s=
pan style=3D"outline:none;font-size:0.857em"><b style=3D"outline:none">Boot=
 Mode</b>=C2=A0options</span></span></span><ul style=3D"outline:none"><li s=
tyle=3D"outline:none;margin-top:0px"><span style=3D"outline:none;font-famil=
y:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-size:0.857em"=
>Terminology=C2=A0</span></span><ul style=3D"outline:none"><li style=3D"out=
line:none;margin-top:0px"><span style=3D"outline:none;font-family:Verdana,G=
eneva,sans-serif"><span style=3D"outline:none;font-size:0.857em">Alternativ=
e for =E2=80=98Regular=E2=80=99 : Normal</span></span></li><li style=3D"out=
line:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-seri=
f"><span style=3D"outline:none;font-size:0.857em">Alternative for =E2=80=98=
Setup=E2=80=99 : Configuration, petitboot (?)</span></span></li><li style=
=3D"outline:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sa=
ns-serif"><span style=3D"outline:none;font-size:0.857em">Alternative for &#=
39;Safe&#39; : Emergency</span></span></li><li style=3D"outline:none"><span=
 style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><span style=
=3D"outline:none;font-size:0.857em">1/4=C2=A0user didn=E2=80=99t know what =
=E2=80=98Setup=E2=80=99 meant</span></span></li><li style=3D"outline:none">=
<span style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><strong =
style=3D"outline:none"><span style=3D"outline:none;font-size:0.857em">--&gt=
; Might need=C2=A0info-icon help to understand what Regular, Safe, and Setu=
p mean. Need=C2=A0more research to see a definitive trend.</span></strong><=
/span></li></ul></li><li style=3D"outline:none"><span style=3D"outline:none=
;font-family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-si=
ze:0.857em">Some users expected additional options:</span></span><ul style=
=3D"outline:none"><li style=3D"outline:none;margin-top:0px"><span style=3D"=
outline:none;font-family:Verdana,Geneva,sans-serif"><span style=3D"outline:=
none;font-size:0.857em">1 user expected an =E2=80=98SMS=E2=80=99 option (AI=
X)</span></span></li><li style=3D"outline:none"><span style=3D"outline:none=
;font-family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-si=
ze:0.857em">3/4=C2=A0users expected a =E2=80=98Single user boot=E2=80=99 mo=
de (use case: no network connection, no logging in, console only)</span></s=
pan></li><li style=3D"outline:none"><span style=3D"outline:none;font-family=
:Verdana,Geneva,sans-serif"><strong style=3D"outline:none"><span style=3D"o=
utline:none;font-size:0.857em">--&gt; Might need=C2=A0add additional option=
s or determine if they are the same as the existing options; will need to u=
nderstand the use case to determine value and priority. Need=C2=A0more rese=
arch to see a definitive trend.</span></strong></span></li></ul></li><li st=
yle=3D"outline:none"><span style=3D"outline:none;font-family:Verdana,Geneva=
,sans-serif"><span style=3D"outline:none;font-size:0.857em">1/4=C2=A0user w=
as surprised to see=C2=A0Boot Mode; doesn&#39;t believe it applies to Linux=
 based systems</span></span></li><li style=3D"outline:none"><span style=3D"=
outline:none;font-family:Verdana,Geneva,sans-serif"><span style=3D"outline:=
none;font-size:0.857em">** Note: On OpenPOWER, we don&#39;t currently reall=
y have a &quot;Safe&quot; mode of operation outside of bringup. **</span></=
span></li></ul></li></ul><ul style=3D"outline:none"><li style=3D"outline:no=
ne;margin-top:0px"><span style=3D"outline:none;font-family:Verdana,Geneva,s=
ans-serif"><span style=3D"outline:none;color:rgb(0,0,255)"><span style=3D"o=
utline:none;font-size:0.857em"><b style=3D"outline:none">Boot Source</b>=C2=
=A0options</span></span></span><ul style=3D"outline:none"><li style=3D"outl=
ine:none;margin-top:0px"><span style=3D"outline:none;font-family:Verdana,Ge=
neva,sans-serif"><span style=3D"outline:none;font-size:0.857em">Terminology=
=C2=A0</span></span><ul style=3D"outline:none"><li style=3D"outline:none;ma=
rgin-top:0px"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-s=
erif"><span style=3D"outline:none;font-size:0.857em">Alternative for =E2=80=
=98Disk=E2=80=99 : System</span></span></li><li style=3D"outline:none"><spa=
n style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><span style=
=3D"outline:none;font-size:0.857em">Alternative For =E2=80=98External media=
=E2=80=99 : Optical=C2=A0</span></span></li><li style=3D"outline:none"><spa=
n style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><span style=
=3D"outline:none;font-size:0.857em">Users aren=E2=80=99t clear on what =E2=
=80=98Default=E2=80=99 source refers to=C2=A0</span></span></li><li style=
=3D"outline:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sa=
ns-serif"><strong style=3D"outline:none"><span style=3D"outline:none;font-s=
ize:0.857em">--&gt; Might need=C2=A0info-icon help to understand what Defau=
lt, External Media, Network, and Disk=C2=A0mean. Need=C2=A0more research to=
 see a definitive trend.</span></strong></span></li></ul></li><li style=3D"=
outline:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-s=
erif"><span style=3D"outline:none;font-size:0.857em">Usability:</span></spa=
n><ul style=3D"outline:none"><li style=3D"outline:none;margin-top:0px"><spa=
n style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><span style=
=3D"outline:none;font-size:0.857em">If =E2=80=98Network=E2=80=99 option is =
selected, users expect to be able to point to that server=E2=80=99s IP addr=
ess</span></span></li><li style=3D"outline:none"><span style=3D"outline:non=
e;font-family:Verdana,Geneva,sans-serif"><strong style=3D"outline:none"><sp=
an style=3D"outline:none;font-size:0.857em">--&gt; Need to understand how t=
his is handled in the back end. Might need more research to understand how =
others would expect the Network option to work.</span></strong></span></li>=
</ul></li><li style=3D"outline:none"><span style=3D"outline:none;font-famil=
y:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-size:0.857em"=
>Expected additional options:</span></span><ul style=3D"outline:none"><li s=
tyle=3D"outline:none;margin-top:0px"><span style=3D"outline:none;font-famil=
y:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-size:0.857em"=
>1/4=C2=A0users expected the ability to boot to PXE (use case: when re-imag=
ing a machine)</span></span></li><li style=3D"outline:none"><span style=3D"=
outline:none;font-family:Verdana,Geneva,sans-serif"><strong style=3D"outlin=
e:none"><span style=3D"outline:none;font-size:0.857em">--&gt; Might need=C2=
=A0add additional options or determine if they are the same as the existing=
 options; will need to understand the use case to determine value and prior=
ity. Need=C2=A0more research to see a definitive trend.</span></strong></sp=
an></li></ul></li></ul></li></ul><ul style=3D"outline:none"><li style=3D"ou=
tline:none;margin-top:0px"><span style=3D"outline:none;font-family:Verdana,=
Geneva,sans-serif"><span style=3D"outline:none;color:rgb(0,0,255)"><span st=
yle=3D"outline:none;font-size:0.857em">Terminology on=C2=A0<b style=3D"outl=
ine:none">Orderly=C2=A0</b>vs=C2=A0<b style=3D"outline:none">Immediate=C2=
=A0</b>(for Reboot/Shutdown methods)</span></span></span><ul style=3D"outli=
ne:none"><li style=3D"outline:none;margin-top:0px"><span style=3D"outline:n=
one;font-family:Verdana,Geneva,sans-serif"><strong style=3D"outline:none"><=
span style=3D"outline:none;font-size:0.857em">4/4=C2=A0users have understoo=
d the terms =E2=80=98Orderly=E2=80=99 and =E2=80=98Immediate=E2=80=99 eithe=
r because they use them or because the definition in the GUI was helpful</s=
pan></strong></span></li><li style=3D"outline:none"><span style=3D"outline:=
none;font-family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;fon=
t-size:0.857em">Intel was surprised to see something other than &#39;warm&#=
39; and &#39;cold&#39;. Their definitions were:</span></span><ul style=3D"o=
utline:none"><li style=3D"outline:none;margin-top:0px"><span style=3D"outli=
ne:none;font-family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;=
font-size:0.857em">warm: CPU is always on (during a host reboot)=C2=A0</spa=
n></span></li><li style=3D"outline:none"><span style=3D"outline:none;font-f=
amily:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-size:0.85=
7em">cold: CPU/ power goes off to the host</span></span></li><li style=3D"o=
utline:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-se=
rif"><strong style=3D"outline:none"><span style=3D"outline:none;font-size:0=
.857em">--&gt; I am unsure if this is the same thing ^=C2=A0</span></strong=
></span></li></ul></li><li style=3D"outline:none"><span style=3D"outline:no=
ne;font-family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-=
size:0.857em">Other names users have mentioned to refer to this:=C2=A0</spa=
n></span><ul style=3D"outline:none"><li style=3D"outline:none;margin-top:0p=
x"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><span=
 style=3D"outline:none;font-size:0.857em">Warm vs Cold=C2=A0</span></span><=
/li><li style=3D"outline:none"><span style=3D"outline:none;font-family:Verd=
ana,Geneva,sans-serif"><span style=3D"outline:none;font-size:0.857em">Contr=
olled vs Immediate=C2=A0</span></span></li><li style=3D"outline:none"><span=
 style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><span style=
=3D"outline:none;font-size:0.857em">Graceful=C2=A0</span></span></li></ul><=
/li></ul></li><li style=3D"outline:none"><span style=3D"outline:none;font-f=
amily:Verdana,Geneva,sans-serif"><span style=3D"outline:none;color:rgb(0,0,=
255)"><span style=3D"outline:none;font-size:0.857em"><b style=3D"outline:no=
ne">General usability=C2=A0</b>(1 user saw design with &#39;next boot&#39; =
and &#39;subsequent boot&#39; sections; 2 users saw design with general set=
tings and no support for &#39;next boot&#39;)=C2=A0</span></span></span><ul=
 style=3D"outline:none"><li style=3D"outline:none;margin-top:0px"><span sty=
le=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><span style=3D"ou=
tline:none;font-size:0.857em">1/1 user was not certain how the =E2=80=98nex=
t boot=E2=80=99 would work because technically there is always a =E2=80=98n=
ext boot=E2=80=99 so when would the =E2=80=98subsequent boot=E2=80=99 happe=
n</span></span><ul style=3D"outline:none"><li style=3D"outline:none;margin-=
top:0px"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"=
><span style=3D"outline:none;font-size:0.857em">User was concerned that the=
 &quot;next boot only&quot; setting would not clear automatically after the=
 reboot (i.e. that he would have to log back in, revisit this page, and man=
ually uncheck the box)=C2=A0</span></span></li></ul></li><li style=3D"outli=
ne:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"=
><span style=3D"outline:none;font-size:0.857em">1/1 user thought the order =
of =E2=80=98next boot=E2=80=99 and =E2=80=98subsequent boot=E2=80=99 should=
 be switched since =E2=80=99subsequent boot=E2=80=99 would be the default. =
They also thought it would make more sense to apply =E2=80=98subsequent boo=
t=E2=80=99 settings to =E2=80=98next boot=E2=80=99 rather than the other wa=
y around (which is the current GUI proposal)=C2=A0</span></span></li><li st=
yle=3D"outline:none"><span style=3D"outline:none;font-family:Verdana,Geneva=
,sans-serif"><strong style=3D"outline:none"><span style=3D"outline:none;fon=
t-size:0.857em">--&gt; Understand how and when the &#39;next boot&#39; woul=
d be used. UX will work to create alternative designs so that it is clear w=
hen the &#39;next boot&#39; settings will be applied and not applied.=C2=A0=
</span></strong></span></li><li style=3D"outline:none"><span style=3D"outli=
ne:none;font-family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;=
font-size:0.857em"><strong style=3D"outline:none">--&gt; Consider more clos=
ely associating the reboot/shutdown method (orderly vs. immediate)=C2=A0 to=
 the Reboot and Shutdown buttons</strong></span></span></li></ul></li><li s=
tyle=3D"outline:none"><span style=3D"outline:none;font-family:Verdana,Genev=
a,sans-serif"><span style=3D"outline:none;color:rgb(0,0,255)"><span style=
=3D"outline:none;font-size:0.857em">=E2=80=98Next boot=E2=80=99=C2=A0</span=
></span></span><ul style=3D"outline:none"><li style=3D"outline:none;margin-=
top:0px"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"=
><strong style=3D"outline:none"><span style=3D"outline:none;font-size:0.857=
em">The value of being able to set different settings for =E2=80=98next boo=
t=E2=80=99 is unclear.</span></strong></span><ul style=3D"outline:none"><li=
 style=3D"outline:none;margin-top:0px"><span style=3D"outline:none;font-fam=
ily:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-size:0.857e=
m">1 user only reboot 1-2 times a year</span></span><ul style=3D"outline:no=
ne"><li style=3D"outline:none;margin-top:0px"><span style=3D"outline:none;f=
ont-family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-size=
:0.857em">Thinks this might be more helpful for customers with large cluste=
rs of servers</span></span></li></ul></li><li style=3D"outline:none"><span =
style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><span style=3D=
"outline:none;font-size:0.857em">1 user is in support and would not use thi=
s</span></span></li><li style=3D"outline:none"><span style=3D"outline:none;=
font-family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-siz=
e:0.857em">1 would use 2-3 times per quarter</span></span></li><li style=3D=
"outline:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-=
serif"><span style=3D"outline:none;font-size:0.857em">1 user uses the comma=
nd line and relies on the default settings</span></span></li></ul></li></ul=
></li></ul><ul style=3D"outline:none"><li style=3D"outline:none;margin-top:=
0px"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><sp=
an style=3D"outline:none;color:rgb(0,0,255)"><span style=3D"outline:none;fo=
nt-size:0.857em">Access to this panel?=C2=A0</span></span></span><ul style=
=3D"outline:none"><li style=3D"outline:none;margin-top:0px"><span style=3D"=
outline:none;font-family:Verdana,Geneva,sans-serif"><span style=3D"outline:=
none;font-size:0.857em">1 user thought this should be for root level privil=
eges only</span></span></li><li style=3D"outline:none"><span style=3D"outli=
ne:none;font-family:Verdana,Geneva,sans-serif"><strong style=3D"outline:non=
e"><span style=3D"outline:none;font-size:0.857em">--&gt; Who should have ac=
cess to this panel and how do we ensure that?=C2=A0</span></strong></span><=
/li></ul></li></ul><p style=3D"outline:none">=C2=A0</p><p style=3D"outline:=
none"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><s=
pan style=3D"outline:none;font-size:0.857em"><b style=3D"outline:none">QUES=
TIONS:=C2=A0</b></span></span></p><ul style=3D"outline:none"><li style=3D"o=
utline:none;margin-top:0px"><span style=3D"outline:none;font-family:Verdana=
,Geneva,sans-serif"><span style=3D"outline:none;font-size:0.857em">Does Boo=
t Mode apply to Linux based systems? (SME)</span></span></li><li style=3D"o=
utline:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-se=
rif"><span style=3D"outline:none;font-size:0.857em">Do we have a way of inf=
orming users that a reboot is complete? (SME)</span></span></li><li style=
=3D"outline:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sa=
ns-serif"><span style=3D"outline:none;font-size:0.857em">On the =E2=80=98Ne=
twork=E2=80=99 option in Boot Source, where is the remote source over a net=
work defined? / How is a user informed of it or change it? (SME / user)</sp=
an></span></li><li style=3D"outline:none"><span style=3D"outline:none;font-=
family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-size:0.8=
57em">What does =E2=80=98Default=E2=80=99 refer to in Boot Source? (SME)</s=
pan></span></li><li style=3D"outline:none"><span style=3D"outline:none;font=
-family:Verdana,Geneva,sans-serif"><span style=3D"outline:none;font-size:0.=
857em">Still need to understand the value of =E2=80=98next boot=E2=80=99 an=
d how it would be used (user)</span></span></li><li style=3D"outline:none">=
<span style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><span st=
yle=3D"outline:none;font-size:0.857em">Is &#39;single user mode&#39; the sa=
me as Regular, Safe, or Setup? (SME)</span></span></li><li style=3D"outline=
:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-serif"><=
span style=3D"outline:none;font-size:0.857em">Should we support boot to PXE=
? (SME / user)</span></span></li></ul></div><div dir=3D"ltr" style=3D"outli=
ne:none;color:rgb(18,18,18);font-size:14px">=C2=A0</div><div dir=3D"ltr" st=
yle=3D"outline:none;color:rgb(18,18,18);font-size:14px"><div dir=3D"ltr" st=
yle=3D"outline:none;font-size:10.5pt"><div dir=3D"ltr" style=3D"outline:non=
e;font-size:10.5pt"><div dir=3D"ltr" style=3D"outline:none;font-size:10.5pt=
"><div dir=3D"ltr" style=3D"outline:none;font-size:10.5pt"><div dir=3D"ltr"=
 style=3D"outline:none;font-size:10.5pt"><div dir=3D"ltr" style=3D"outline:=
none;font-family:sans-serif"><div style=3D"outline:none"><div style=3D"outl=
ine:none"><span style=3D"outline:none;font-family:Verdana,Geneva,sans-serif=
"><span style=3D"outline:none;font-size:0.857em"><span style=3D"outline:non=
e"><span style=3D"outline:none">=E2=80=93</span><br style=3D"outline:none">=
<b style=3D"outline:none">Jandra Aranguren</b>=C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br style=3D"outline:none">IBM=C2=A0<span style=3D"=
outline:none">Design</span>=C2=A0|=C2=A0IBM Studios Austin=C2=A0| UX Design=
</span></span></span></div><div style=3D"outline:none">=C2=A0</div><div sty=
le=3D"outline:none"><span style=3D"outline:none;font-family:Verdana,Geneva,=
sans-serif"><span style=3D"outline:none;font-size:0.857em"><span style=3D"o=
utline:none"><strong style=3D"outline:none">E:</strong>=C2=A0<a href=3D"mai=
lto:jandra.aranguren@ibm.com">jandra.aranguren@ibm.com</a></span></span></s=
pan></div></div></div></div></div></div></div></div></div></div>

--0000000000005ba1d9058957e6b2--
