Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA81914A
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 20:55:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450Mwt0gCHzDqRc
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 04:55:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c33; helo=mail-yw1-xc33.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tcPQOg8v"; 
 dkim-atps=neutral
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450MvC20TNzDqRX
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 04:53:58 +1000 (AEST)
Received: by mail-yw1-xc33.google.com with SMTP id q185so2716264ywe.3
 for <openbmc@lists.ozlabs.org>; Thu, 09 May 2019 11:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2zQrUlWOBa5ALbizODi9bB3PLwwW8eMbVKmykQqDHjY=;
 b=tcPQOg8vyueSFK18C0ABpD74jLxzOCb05DSDjhPhnCPkcxTa74ANdVJI5GsTPClIVj
 Gg9DVZl9xCOX1EO7Ws0Xk6wwDdwWVqwlN1Un0A5DjbTHmlCF6FQe2VuS6xVw18Fr97CH
 D4+JN9VtiONlt7kL/34YYrA1ksbyF4MXrQlkSvetLzANAN5EBDqMAmsTjT7kI39Ihn9D
 vY5HtPHJc1/6+p0WnIQO04fqkqeugU8Aps+cL8UNn/Lw/VAiu8j+elLNqQNLcIU7dR3G
 UT1NuZMaeUBIjidEd+RQ3Db16UrBikEMuk+RitD9XYcKGovR+qhEDqgjbtRjbfIyupG5
 84XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2zQrUlWOBa5ALbizODi9bB3PLwwW8eMbVKmykQqDHjY=;
 b=YfwJQR7JH3WgjuPbmAOCIksexrMZRJaykmrN1+ZXu4knrflJwRD1y9zQ7Fk4ILk2VV
 imyEbPJGVgOcZP0845U8J7xWlZSQOtm+iKdfjUpAkFPku0+ac21NtA1eraj8/i1xeeqA
 PjduQap59u8lvrFBEn1QJM6RoHjVCAXLjrDPTDCaKHPLVQ/ph4OQoW1/CLEJTG4QyEtm
 K7uDjotlmx22DCzNYyxoFxF0QfropF9yEON032uyaai90MgFHvQmXVgclJv0b12Rh9bI
 6X713JlTX/X6wZhZqyAJQhqJHfcouzeqP4z3K934OlGQnsD/ysNF+kZk3+6bRXCXf1C4
 5qvA==
X-Gm-Message-State: APjAAAWg8BmHmTDWPA+p55XTxWWakUidVP1EDUh3X8sh4zM8/cl1+zOP
 9GsLjMFfu8VaODlSrgkmC0X31lSYcqABq4g+NXtu4+LK
X-Google-Smtp-Source: APXvYqyaMCVHFZ98qMqTsV2VDA6zWNaYQB6+F4Y2Sg/jA28+FBdTBTUDXTFD0Y4bhTVSHmigCjPuxckOP0EoZbVaccM=
X-Received: by 2002:a0d:d783:: with SMTP id z125mr3112125ywd.448.1557428034651; 
 Thu, 09 May 2019 11:53:54 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Thu, 9 May 2019 13:53:35 -0500
Message-ID: <CAMTupoQ=dsFATrMQ=B0LQR-oOKWnm8UBHrn_dbKiwvBHKc8_qg@mail.gmail.com>
Subject: GUI Workgroup - Notes 04/08
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c4cc52058878f863"
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

--000000000000c4cc52058878f863
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

Here are the notes form the GUI workgroup meeting that took place
yesterday, Wednesday May 8th, 2019.

Agenda:

   1. Discuss Intel issues and task list (Event log - force boot to BIOS,
   review others listed in the GUI)
   2. Discuss icon implementation process and discussion of downstream icon
   customization
   3. Review IBM issues and task list (Remote Logging, Boot Options,
   Network Settings)


Notes:

   - TESTING
      - Just tested KVM and Virtual Media
      - What panels are going to come in the following weeks? And how
      should we inform the test team?
         - We need to start testing before a feature is merged
         - Will continue discussing the possibility of adding a label,
         lane, or assignment on issues so that the test team can be
aware of what is
         ready to test and when.
      - DESIGN
      - Intel has many customers, they've been getting feedback and plan to
      change aspects of the existing designs. Kuiying has been tasked with this
      and will share updates on what the changes are and the status
next time we
      meet.
         - Planning to do some layout changes (ex. Overview, log sensors,
         navigation bar, etc.)
         - Intel will share through a demo and will share what the comments
         from customers were
         - Have heard that customers want to customize the UI (to match
         their branding)
      - Intel and IBM both actively using Carbon
         - However, Intel has 10 icons (Ex. logo, home, power, reboot) that
         they want to change. In the next meeting, we will discuss if these are
         merged upstream or downstream, so that the upstream has visually
         consistent icons and components
      - IBM shared design proposals for Remote Logging and Boot Options:
         - Boot Options:
         https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_System_On

            - Got feedback on the immediate/orderly terminology; Intel
            suggested cold/warm
            - Intel asked about 'Boot to BIOS'; this is currently called
            - Github Issue:
            https://github.com/openbmc/phosphor-webui/issues/82
         - Remote Logging:
         https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_System_On
            - Github Issue:
            https://github.com/openbmc/phosphor-webui/issues/82


As always, please add any items to next workgroup's agenda here:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group


Best,
GUI Design Team

--000000000000c4cc52058878f863
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><font f=
ace=3D"verdana, sans-serif">Hello everyone,</font><div><font face=3D"verdan=
a, sans-serif"><br></font></div><div><font face=3D"verdana, sans-serif">Her=
e are the notes form the GUI workgroup meeting that took place yesterday, W=
ednesday May 8th, 2019.</font></div><div><br></div><div><span style=3D"colo=
r:rgb(36,41,46);font-family:verdana,sans-serif">Agenda:=C2=A0</span><br></d=
iv><div><div><ol style=3D"box-sizing:border-box;margin-bottom:16px;margin-t=
op:0px;padding-left:2em;color:rgb(36,41,46)"><li style=3D"margin-left:15px;=
box-sizing:border-box"><font face=3D"verdana, sans-serif">Discuss Intel iss=
ues and task list (Event log - force boot to BIOS, review others listed in =
the GUI)=C2=A0</font></li><li style=3D"margin-left:15px;box-sizing:border-b=
ox"><font face=3D"verdana, sans-serif">Discuss icon implementation process =
and discussion of downstream icon customization</font></li><li style=3D"mar=
gin-left:15px;box-sizing:border-box"><font face=3D"verdana, sans-serif">Rev=
iew IBM issues and task list (Remote Logging, Boot Options, Network Setting=
s)=C2=A0</font></li></ol><div><font color=3D"#24292e" face=3D"verdana, sans=
-serif"><br></font></div></div><div><font face=3D"verdana, sans-serif">Note=
s:=C2=A0</font></div><div><ul><li><font face=3D"verdana, sans-serif">TESTIN=
G</font></li><ul><li><font face=3D"verdana, sans-serif">Just tested KVM and=
 Virtual Media</font></li><li><font face=3D"verdana, sans-serif">What panel=
s are going to come in the following weeks? And how should we inform the te=
st team?=C2=A0</font></li><ul><li><font face=3D"verdana, sans-serif">We nee=
d to start testing before a feature is merged</font></li><li><font face=3D"=
verdana, sans-serif">Will continue discussing the possibility of adding a l=
abel, lane, or assignment on issues so that the test team can be aware of w=
hat is ready to test and when.=C2=A0</font></li></ul></ul><li><font face=3D=
"verdana, sans-serif">DESIGN</font></li><ul><li><font face=3D"verdana, sans=
-serif">Intel has many customers, they&#39;ve been getting feedback and pla=
n to change aspects of the existing designs. Kuiying has been tasked with t=
his and will share updates on what the changes are and the status next time=
 we meet.=C2=A0</font></li><ul><li><font face=3D"verdana, sans-serif">Plann=
ing to do some layout changes (ex. Overview, log sensors, navigation bar, e=
tc.)=C2=A0</font></li><li><font face=3D"verdana, sans-serif">Intel will sha=
re through a demo and will share what the comments from customers were=C2=
=A0</font></li><li><font face=3D"verdana, sans-serif">Have heard that custo=
mers want to customize the UI (to match their branding)=C2=A0</font></li></=
ul><li><font face=3D"verdana, sans-serif">Intel and IBM both actively using=
 Carbon</font></li><ul><li><font face=3D"verdana, sans-serif">However, Inte=
l has 10 icons (Ex. logo, home, power, reboot) that they want to change. In=
 the next meeting, we will discuss if these are merged upstream or downstre=
am, so that the upstream has visually consistent=C2=A0icons and components<=
/font></li></ul><li><font face=3D"verdana, sans-serif">IBM shared design pr=
oposals for Remote Logging and Boot Options:</font></li><ul><li><font face=
=3D"verdana, sans-serif">Boot Options:=C2=A0<a href=3D"https://ibm.invision=
app.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_System_On">https://i=
bm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_System_On=
</a>=C2=A0</font></li><ul><li><font face=3D"verdana, sans-serif">Got feedba=
ck on the immediate/orderly terminology; Intel suggested cold/warm</font></=
li><li><font face=3D"verdana, sans-serif">Intel asked about &#39;Boot to BI=
OS&#39;; this is currently called=C2=A0</font></li><li><font face=3D"verdan=
a, sans-serif">Github Issue:=C2=A0<a href=3D"https://github.com/openbmc/pho=
sphor-webui/issues/82">https://github.com/openbmc/phosphor-webui/issues/82<=
/a>=C2=A0</font></li></ul><li><font face=3D"verdana, sans-serif">Remote Log=
ging:=C2=A0</font><a rel=3D"nofollow" href=3D"https://ibm.invisionapp.com/s=
hare/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_System_On" style=3D"box-sizin=
g:border-box;color:rgb(3,102,214);text-decoration-line:none;font-family:-ap=
ple-system,system-ui,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;=
Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&qu=
ot;;font-size:14px">https://ibm.invisionapp.com/share/8ENYRVXAPFD#/31909513=
8_1-_Boot_Options_-_System_On</a></li><ul><li><font face=3D"verdana, sans-s=
erif">Github Issue:=C2=A0<a href=3D"https://github.com/openbmc/phosphor-web=
ui/issues/82">https://github.com/openbmc/phosphor-webui/issues/82</a></font=
></li></ul></ul></ul></ul></div><div><font face=3D"verdana, sans-serif"><br=
></font></div><div><font face=3D"verdana, sans-serif">As always, please add=
 any items to next workgroup&#39;s agenda here:=C2=A0<a href=3D"https://git=
hub.com/openbmc/openbmc/wiki/GUI-Design-work-group" target=3D"_blank">https=
://github.com/openbmc/openbmc/wiki/GUI-Design-work-group</a></font></div><d=
iv><br></div><div><br></div><div><span style=3D"background-color:transparen=
t;color:rgb(36,41,46)"><font face=3D"verdana, sans-serif">Best,</font></spa=
n></div><div><span style=3D"background-color:transparent;color:rgb(36,41,46=
)"><font face=3D"verdana, sans-serif"><span class=3D"gmail-m_-9399398899227=
53557gmail-m_-6172510825241159069gmail-il">GUI</span>=C2=A0<span class=3D"g=
mail-m_-939939889922753557gmail-m_-6172510825241159069gmail-il">Design</spa=
n>=C2=A0Team=C2=A0</font></span></div></div></div></div></div></div>

--000000000000c4cc52058878f863--
