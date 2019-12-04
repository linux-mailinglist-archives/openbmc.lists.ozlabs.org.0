Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C81121CD
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 04:16:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SPBd3PBjzDqSy
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 14:16:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="v5jd86oV"; 
 dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SP9M2G9BzDqSs
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 14:15:02 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id v201so4807795lfa.11
 for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2019 19:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dFc4bJKrv0Ye40BUw6crMwPU9uykYUqy1JJetWCrPAY=;
 b=v5jd86oVKOIUwUemnqLokVx00qYRsLZZ78MFD+KE39iUbzRVivjL2sy3HPcZNRhOfZ
 tWAG+l9ExjEZ6qjb6gDQDmCcBDQMuSaLgH5rUV7DP2TsJQ/j8VgvVXdAXWd1wMrfY2Rn
 nevcASXWw7Z24M25A64AGPYtJqjvAAxk/UMZ7kgDoPD/xRuFAZntADN0LHg9FWAAYRgf
 6kb+bBBwcH2Zr0xinVIMeswkyAGT/T5agyKJrjrpaLMBBQUFC8ptquf/mstyGEddsBqs
 B72uWcungmL3/Cuj6scEjac2kNrJpAR6cd/CW5R9D9pSL3VesIvtgQAF2OVki8Zlrz82
 H9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dFc4bJKrv0Ye40BUw6crMwPU9uykYUqy1JJetWCrPAY=;
 b=a4TGGt8/vN8IiEzTl0ZMcBG1bFQYGqa06Ote+wq7o5fmry50JTOVOz+RFIYYTlgJV6
 zqn75OUjX69HdNKljopSll9J1RB4hpA9awMvWpcS9Ki3p82YaO/nuCi7gZRcwiooXSGx
 vXlVK2jUbBahz+mU2DqTU7mkJg1k4bXGrXI1Ogr1yRYUUPCEuXIZu/DEAZQJBVE/MzP0
 eOBwNaV8kpcqHqmMDQj+OI1yJcoFmKBc4Hyo3RsTKLp4Bw3ohRoLK+7xnY3/TN18zkjW
 +muSAZmHP0B5GFe+3qTifvbyTKfGvWPrR1y8BJS7SmMEsArzZZ4lxt3VnjVOakNwvO4p
 HeUQ==
X-Gm-Message-State: APjAAAWz0rhqJC1fvNGhy3u9R0bQxzErSNzCc6c0HKts109hsECUL+9f
 PBJ3FrzRhiyPebI5Dt1u1RycJoo0L3iSsuk5GRMv3eGJ6zM=
X-Google-Smtp-Source: APXvYqy/Sb4Vhw7RzJ1BINzvlSm72t7JyUrp9TsknQHj4oYTQ64+/ENJeidIriz8Anl+ziPntbS6gjYsJuar5vVG5j4=
X-Received: by 2002:a19:8104:: with SMTP id c4mr637166lfd.191.1575429297517;
 Tue, 03 Dec 2019 19:14:57 -0800 (PST)
MIME-Version: 1.0
From: Richard Hanley <rhanley@google.com>
Date: Tue, 3 Dec 2019 19:14:46 -0800
Message-ID: <CAH1kD+anPrvv4=BEt9MTvqpLNpLEDfa1ERMNQvtXAWrDmv1c2g@mail.gmail.com>
Subject: Inserting a Redfish Aggregator
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a609db0598d8378c"
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

--000000000000a609db0598d8378c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,


I=E2=80=99ve been thinking a bit about how to separate Redfish logic from D=
Bus in
bmcweb.


As a motivating example, imagine a Redfish aggregator that has some chassis
that is located outside of its local instance.  Once the aggregator finds
the external chassis, it needs to add it to the chassis collection.


However, looking at the current implementation of the
ChassisCollection.(located here:
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/chassis.hpp#=
L246)
It isn=E2=80=99t clear to me how to add this in.


The current implementation does some setup on the response payload, and
then makes a DBus call to look through the entity manager.  The collection
it sends as a response is entirely defined by the result from the entity
manager. I basically see three ways that this could be solved.



   1. Move the aggregator logic down to the entity manager
   2. Refactor the Chassis Collection to have its own data model separate
   from the entity manager.
   3. Create some service that works on top of the bmcweb implementation of
   Redfish.


I think this comes up to a fundamental design decision, how
modular/flexible should the Redfish implementation be?  Right now bmcweb
provides a very sane default implementation, and is tied very closely to
the current hardware it is running on.  Whereas I am envisioning a Redfish
implementation that is a bit more abstracted from any particular hardware.


It=E2=80=99s taken me awhile to get up to speed with Redfish, Open BMC, and
Google=E2=80=99s infrastructure; but I=E2=80=99m starting to get a more con=
crete design for
an aggregator.  However, I=E2=80=99m unsure about whether this should be fr=
amed as
a new layer on top of the existing implementation, or as a refactor of that
implementation?


I can see some pros and cons between the two, but I=E2=80=99m interested in=
 how
everyone feels about this.


Regards,

Richard

--000000000000a609db0598d8378c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font fac=
e=3D"arial, sans-serif">Hi everyone,</font></p><p class=3D"gmail-p1" style=
=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-stretch:normal;line-height:normal"><br></p><p class=3D"gmail-p1" style=
=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-stretch:normal;line-height:normal"><font face=3D"arial, sans-serif">I=
=E2=80=99ve been thinking a bit about how to separate Redfish logic from DB=
us in bmcweb.</font></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal;min-height=
:14px"><font face=3D"arial, sans-serif"><br></font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font fac=
e=3D"arial, sans-serif">As a motivating example, imagine a Redfish aggregat=
or that has some chassis that is located outside of its local instance.<spa=
n class=3D"gmail-Apple-converted-space">=C2=A0 </span>Once the aggregator f=
inds the external chassis, it needs to add it to the chassis collection.</f=
ont></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal;min-height=
:14px"><font face=3D"arial, sans-serif"><br></font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font fac=
e=3D"arial, sans-serif">However, looking at the current implementation of t=
he ChassisCollection.(located here: <a href=3D"https://github.com/openbmc/b=
mcweb/blob/master/redfish-core/lib/chassis.hpp#L246"><span class=3D"gmail-s=
1" style=3D"color:rgb(220,161,13)">https://github.com/openbmc/bmcweb/blob/m=
aster/redfish-core/lib/chassis.hpp#L246</span></a>) It isn=E2=80=99t clear =
to me how to add this in.</font></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal;min-height=
:14px"><font face=3D"arial, sans-serif"><br></font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font fac=
e=3D"arial, sans-serif">The current implementation does some setup on the r=
esponse payload, and then makes a DBus call to look through the entity mana=
ger.<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>The collectio=
n it sends as a response is entirely defined by the result from the entity =
manager. I basically see three ways that this could be solved.</font></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal;min-height=
:14px"><font face=3D"arial, sans-serif"><br></font></p>
<ol class=3D"gmail-ol1">
<li class=3D"gmail-li1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;line-height:normal"><font f=
ace=3D"arial, sans-serif">Move the aggregator logic down to the entity mana=
ger</font></li>
<li class=3D"gmail-li1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;line-height:normal"><font f=
ace=3D"arial, sans-serif">Refactor the Chassis Collection to have its own d=
ata model separate from the entity manager.</font></li>
<li class=3D"gmail-li1" style=3D"margin:0px;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;line-height:normal"><font f=
ace=3D"arial, sans-serif">Create some service that works on top of the bmcw=
eb implementation of Redfish.</font></li>
</ol>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal;min-height=
:14px"><font face=3D"arial, sans-serif"><br></font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font fac=
e=3D"arial, sans-serif">I think this comes up to a fundamental design decis=
ion, how modular/flexible should the Redfish implementation be?<span class=
=3D"gmail-Apple-converted-space">=C2=A0 </span>Right now bmcweb provides a =
very sane default implementation, and is tied very closely to the current h=
ardware it is running on.<span class=3D"gmail-Apple-converted-space">=C2=A0=
 </span>Whereas I am envisioning a Redfish implementation that is a bit mor=
e abstracted from any particular hardware.</font></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal;min-height=
:14px"><font face=3D"arial, sans-serif"><br></font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font fac=
e=3D"arial, sans-serif">It=E2=80=99s taken me awhile to get up to speed wit=
h Redfish, Open BMC, and Google=E2=80=99s infrastructure; but I=E2=80=99m s=
tarting to get a more concrete design for an aggregator.<span class=3D"gmai=
l-Apple-converted-space">=C2=A0 </span>However, I=E2=80=99m unsure about wh=
ether this should be framed as a new layer on top of the existing implement=
ation, or as a refactor of that implementation?</font></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal;min-height=
:14px"><font face=3D"arial, sans-serif"><br></font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;line-height:normal"><font fac=
e=3D"arial, sans-serif">I can see some pros and cons between the two, but I=
=E2=80=99m interested in how everyone feels about this.</font></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-stretch:normal;line-height:normal"><font face=3D"ari=
al, sans-serif"><br></font></p><p class=3D"gmail-p1" style=3D"margin:0px;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:norma=
l;line-height:normal"><font face=3D"arial, sans-serif">Regards,</font></p><=
p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-stretch:normal;line-height:normal"><font face=
=3D"arial, sans-serif">Richard</font></p></div>

--000000000000a609db0598d8378c--
