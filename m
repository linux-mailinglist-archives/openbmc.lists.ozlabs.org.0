Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B24170E61
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:23:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sc165BnvzDqFC
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:23:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=98.137.68.31;
 helo=sonic308-55.consmr.mail.gq1.yahoo.com;
 envelope-from=geissonator@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=XxzrOphR; dkim-atps=neutral
Received: from sonic308-55.consmr.mail.gq1.yahoo.com
 (sonic308-55.consmr.mail.gq1.yahoo.com [98.137.68.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RD4x1d32zDqSV
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 07:22:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1582575737; bh=d+WPYqinFu0/OPAEDDbVjmYXaxJGC46tsa154XJrbNs=;
 h=From:Subject:Date:In-Reply-To:Cc:To:References:From:Subject;
 b=XxzrOphRgsevmlSyAhswxFKw3BobR5/ubh/cOmLBx8ADf6jZqEnv1VsNVKNkRl7aLXwsQML046y5+oBcNM7fA5lIYGtak6w/kn8fBAXng+0OBQSi0OxfrcTqHxC8aAECUYDE2wHBMamfn295J/0y6dWpUC5lwTv/1uO1aQTx0ZvV5kR2VAZ+CZfzRd+1CrutXVcbXdDPwdaQkpyO34InIygZLTBD3BSa7YKKjuVUpuVYJEusMLm12EyIykv34LO4JibxMzYNfZPbpoJjy0Kg6VNk5f9BgXgiV3kWlx/MwDoWAeyCVCNLa4XvLalG5Wu3vL7/3xepZ+DYllLdbf+cwA==
X-YMail-OSG: 9MzCas8VM1mJaodnDknCeyTeY00s9pIjvjTUofGmeZO9NS6fEbwoPhhWW3Mydag
 SuZew8bg.tbfGH5hEInt9T60XEsFS6iWPFFR4MWiECijX2rDwG1FwMchyG6XS4AcKKZyueVE1BaC
 c2pBZNZTwAHSdSptZ8BUk0tbKFUq5wpUupcKNSO_s8VXYgIWOOBHFp.XOxjIy0.YLHg_37cps5YO
 OMkrFDCVVVPtngBJoFrLMdsszDb85kQS8lDpn9.Rpm4bijarLQBC9N2IL.HqQzRcbnfsZXc5SuvN
 ZzIyrTAAbs5tWPT2NCQq9oGFJ.fLptXvAxmQWyGVymc1jXgiASplUuaQ516Os2Ja4UE9MYcxsFuk
 AQ_M2L93AXCQctFg3e1adZUL92ntIi1KSCBqnBA.BD.cghClG1fBlw0H9._hQIT4jSMRaKgntdKi
 hEKgX17Si8r4du2eMgBu3ZWJbq9bL7HkK.Ug2jgb0sijMWRTX.LiXy0lp7pjgAraaz7DWK4sJBIs
 0IP17VaqJeQCi0Mkyg.Be8IRkdhiMmMH.4AQeY1IjsjjBxv3Kuz._WOKUWo2KdgwD5o8NAxkwTFM
 c8mHMpvmsDpwREQMCy9RTN8UpMwq0QxcVUNloeg6GQrVESe_Bsy7S.JfEQgjA8.FccFTTq9gdK3m
 edF.v9FCxucF2dCQjBHxcQ23fkPkG7bIDkiOfPe8y8nHByGO5ZCzAG3QxS6VodhXU0YREHac1Vac
 EZ_Hp9CzTGGLTDn89THl4ykchF9JTD5vg96IR8OvtIjE1RFkZmLoELFQUTuI9kcxEp3oD2Rz.Kgg
 ncVzwffdo3gubthNEZmIOjCRpk8qZmDcgJgN6PGGAcBuDxNG8EUDGWznI6HkfL73hevymHIGuBIK
 JshzC4qkVfDDh5z45qDdax_QMQSMQv0Jqye5oxScSV_e4g41MDYZ2wQ1YWaIso9Ct6aYXo1v5UfC
 qun0SrjmdBE6Cg8c_N2JDMnriPPQ.74.AT4Sa2xtqenCWf19DkKzdlCybH8ql3mBUobpmcQQDTtG
 bn2dmmiShNOBSgvIq8rM.AajRm0yfOZm35zKZtxRXJAtDCo.xdqfTQjZdBcu9rN4TCUnAW5rTE7U
 iXRyNx0H1DOQ3P2AaIGePse6b.5tQA_7vNOwgCcs4bgS76r5EEt921gQzqm43R2HeOfoSuVn10q9
 7TS10BlO.MJbh10lcqtn.eqWUhZouRUNpM47H0rWJwyliYwR_qPIm1MeDmVKOWh.owVEGAlHGZRN
 heHdIfMH4UuA_SFdmQuABY2IljiWJYqYw2I0DwnqrIMZIyOd_Qht63Oa13FS4askSenr0M8zKeH_
 7FxJIyYRrSCufPa_akr28tCuo1GDkcHrsmNJyU0s1NcPoDxKMWTCQ0ImNAEdtPSfKjo2dxgh7yqN
 C.Z6394pj3pcs_.HNyrjYylKTzaCfVYOOsg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Mon, 24 Feb 2020 20:22:17 +0000
Received: by smtp423.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 3fc7458586fd86cc8c6255b330235c7d; 
 Mon, 24 Feb 2020 20:22:15 +0000 (UTC)
From: Andrew Geissler <geissonator@yahoo.com>
Message-Id: <15FDACF4-AA21-4867-9DFB-DC8CAB3AB17E@yahoo.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_2EE2CFFE-75C8-446A-AB99-1465D4305458"
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: OpenBMC Starting Point
Date: Mon, 24 Feb 2020 14:22:13 -0600
In-Reply-To: <CA+k9xxb0eBfXVeA4zxULKL-0NCwmO6=vPw7TBkyGt4fc6xfmOg@mail.gmail.com>
To: Samuel Herts <sdherts@gmail.com>
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
 <5937.1579503424@localhost>
 <CA+k9xxb0eBfXVeA4zxULKL-0NCwmO6=vPw7TBkyGt4fc6xfmOg@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:41 +1100
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
Cc: openbmc@lists.ozlabs.org, Michael Richardson <mcr@sandelman.ca>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_2EE2CFFE-75C8-446A-AB99-1465D4305458
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 24, 2020, at 9:40 AM, Samuel Herts <sdherts@gmail.com> wrote:
>=20
> So if I wanted a c++ script to run on the bmc whenever I desired, how =
exactly would I go about implementing it as a module to run? Kind of =
like the Phosphor state manager module that the Hello World guide starts =
on, specifically, what steps would I need to take or what resources =
should I look into for creating my own module that will run when a =
specific command is sent, like the systemctl start phosphor.=20

This would probably make a good tutorial under
https://github.com/openbmc/docs/tree/master/development =
<https://github.com/openbmc/docs/tree/master/development>
but here=E2=80=99s the really fast answer from my perspective.

First you create a git repository somewhere (i.e. github).

Next you pick a logical location in for your recipe to
be located. For example if it was going to be a package used
by all of OpenBMC, it would go out somewhere in
=
https://github.com/openbmc/openbmc/tree/master/meta-phosphor/recipes-phosp=
hor =
<https://github.com/openbmc/openbmc/tree/master/meta-phosphor/recipes-phos=
phor>

A good example is bmcweb:
=
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosp=
hor/interfaces/bmcweb_git.bb =
<https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phos=
phor/interfaces/bmcweb_git.bb>
You=E2=80=99d make a recipe like this, point SRC_URI and SRCREV to your
code and the commit id to pick up.

You=E2=80=99d create your own service file, like bmcweb.service
(note the service file is packaged in your repo).
(i.e. https://github.com/openbmc/bmcweb/blob/master/bmcweb.service.in =
<https://github.com/openbmc/bmcweb/blob/master/bmcweb.service.in>)
For the [Install] section you would just put the following
to ensure your service was started on BMC boot up.
WantedBy=3Dmulti-user.target
You=E2=80=99d adjust the ExecStart to call your application

Note that bmcweb uses CMake but we=E2=80=99re moving a lot of
projects to meson which is what I=E2=80=99d recommend if you=E2=80=99re
creating a new project.
=
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/2787=
8 =
<https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/278=
78>
is an example of adding service files to meson.

Then you would go into a packagegroup, like
=
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosp=
hor/packagegroups/packagegroup-obmc-apps.bb =
<https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phos=
phor/packagegroups/packagegroup-obmc-apps.bb>
and do something similar to what they did with
bmcweb and add it as an RDEPENDS

Then you would bitbake your image and voila, your code would
be pulled down, built, and packaged into the image. When you
start it in QEMU you would see your application run.

If you were writing something you thought would be useful
for the community then you would send out an email and
write up a design doc to get feedback on the right
location for the code and recipe to go.
https://github.com/openbmc/docs/blob/master/designs/design-template.md =
<https://github.com/openbmc/docs/blob/master/designs/design-template.md>=20=


Andrew


>=20
> On Mon, Jan 20, 2020 at 1:57 AM Michael Richardson <mcr@sandelman.ca =
<mailto:mcr@sandelman.ca>> wrote:
>=20
> Samuel Herts <sdherts@gmail.com <mailto:sdherts@gmail.com>> wrote:
>     > I am currently working on getting a working OpenBMC test =
environment
>     > up and running. I am using VirtualBox and the github Development
>     > Environment tutorial. I had a couple questions regarding how to =
make
>     > our own modules. Would it be possible to upload files to the bmc =
on
>     > the virtual server?
>=20
> You can do that.
> The disk is rather small by default.
> If you are using VirtualBox, you may be able to use the vboxfs file =
system to
> mount the host. That might require adding modules to the kernel.
>=20
>     > And would I be able to make a script which can read text off of =
that
>     > file inside the bmc chip?
>=20
>     > I have a physical server which I am not using yet, would I be =
able to
>     > install openbmc and the scripts and insert the file onto the =
actual
>     > bmc chip, and eventually read from that file?
>=20
> Maybe. What server do you have?
>=20
> --
> ]               Never tell me the odds!                 | ipv6 mesh =
networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT =
architect   [
> ]     mcr@sandelman.ca <mailto:mcr@sandelman.ca>  =
http://www.sandelman.ca/ <http://www.sandelman.ca/>        |   ruby on =
rails    [
>=20
>=20
>=20
> --=20
> Sincerely,=20
> Samuel Herts


--Apple-Mail=_2EE2CFFE-75C8-446A-AB99-1465D4305458
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 24, 2020, at 9:40 AM, Samuel Herts &lt;<a =
href=3D"mailto:sdherts@gmail.com" class=3D"">sdherts@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D"">So if I wanted a c++ script to run on the bmc =
whenever I desired, how exactly would I go about implementing it as a =
module to run? Kind of like the Phosphor state manager module that the =
Hello World guide starts on, specifically, what steps would I need to =
take or what resources should I look into for creating my own module =
that will run when a specific command is sent, like the systemctl start =
phosphor.&nbsp;</div></div></blockquote><div><br =
class=3D""></div><div>This would probably make a good tutorial =
under</div><div><a =
href=3D"https://github.com/openbmc/docs/tree/master/development" =
class=3D"">https://github.com/openbmc/docs/tree/master/development</a></di=
v><div>but here=E2=80=99s the really fast answer from my =
perspective.</div><div><br class=3D""></div><div>First you create a git =
repository somewhere (i.e. github).</div><div><br =
class=3D""></div><div>Next you pick a logical location in for your =
recipe to</div><div>be located. For example if it was going to be a =
package used</div><div>by all of OpenBMC, it would go out somewhere =
in</div><div><a =
href=3D"https://github.com/openbmc/openbmc/tree/master/meta-phosphor/recip=
es-phosphor" =
class=3D"">https://github.com/openbmc/openbmc/tree/master/meta-phosphor/re=
cipes-phosphor</a></div><div><br class=3D""></div><div>A good example is =
bmcweb:</div><div><a =
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recip=
es-phosphor/interfaces/bmcweb_git.bb" =
class=3D"">https://github.com/openbmc/openbmc/blob/master/meta-phosphor/re=
cipes-phosphor/interfaces/bmcweb_git.bb</a></div><div>You=E2=80=99d make =
a recipe like this, point SRC_URI and SRCREV to your</div><div>code and =
the commit id to pick up.</div><div><br class=3D""></div><div>You=E2=80=99=
d create your own service file, like bmcweb.service</div><div>(note the =
service file is packaged in your repo).</div><div>(i.e.&nbsp;<a =
href=3D"https://github.com/openbmc/bmcweb/blob/master/bmcweb.service.in" =
class=3D"">https://github.com/openbmc/bmcweb/blob/master/bmcweb.service.in=
</a>)</div><div>For the [Install] section you would just put the =
following</div><div>to ensure your service was started on BMC boot =
up.</div><div>WantedBy=3Dmulti-user.target</div><div>You=E2=80=99d =
adjust the ExecStart to call your application</div><div><br =
class=3D""></div><div>Note that bmcweb uses CMake but we=E2=80=99re =
moving a lot of</div><div>projects to meson which is what I=E2=80=99d =
recommend if you=E2=80=99re</div><div>creating a new =
project.</div><div><a =
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manage=
r/+/27878" =
class=3D"">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-man=
ager/+/27878</a></div><div>is an example of adding service files to =
meson.</div><div><br class=3D""></div><div>Then you would go into a =
packagegroup, like</div><div><a =
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recip=
es-phosphor/packagegroups/packagegroup-obmc-apps.bb" =
class=3D"">https://github.com/openbmc/openbmc/blob/master/meta-phosphor/re=
cipes-phosphor/packagegroups/packagegroup-obmc-apps.bb</a></div><div>and =
do something similar to what they did with</div><div>bmcweb and add it =
as an RDEPENDS</div><div><br class=3D""></div><div>Then you would =
bitbake your image and voila, your code would</div><div>be pulled down, =
built, and packaged into the image. When you</div><div>start it in QEMU =
you would see your application run.</div><div><br class=3D""></div><div>If=
 you were writing something you thought would be useful</div><div>for =
the community then you would send out an email and</div><div>write up a =
design doc to get feedback on the right</div><div>location for the code =
and recipe to go.</div><div><a =
href=3D"https://github.com/openbmc/docs/blob/master/designs/design-templat=
e.md" =
class=3D"">https://github.com/openbmc/docs/blob/master/designs/design-temp=
late.md</a>&nbsp;</div><div><br class=3D""></div><div>Andrew</div><div><br=
 class=3D""></div><br class=3D""><blockquote type=3D"cite" class=3D""><div=
 class=3D""><br class=3D""><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jan 20, 2020 at 1:57 AM Michael Richardson =
&lt;<a href=3D"mailto:mcr@sandelman.ca" =
class=3D"">mcr@sandelman.ca</a>&gt; wrote:<br class=3D""></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br class=3D"">
Samuel Herts &lt;<a href=3D"mailto:sdherts@gmail.com" target=3D"_blank" =
class=3D"">sdherts@gmail.com</a>&gt; wrote:<br class=3D"">
&nbsp; &nbsp; &gt; I am currently working on getting a working OpenBMC =
test environment<br class=3D"">
&nbsp; &nbsp; &gt; up and running. I am using VirtualBox and the github =
Development<br class=3D"">
&nbsp; &nbsp; &gt; Environment tutorial. I had a couple questions =
regarding how to make<br class=3D"">
&nbsp; &nbsp; &gt; our own modules. Would it be possible to upload files =
to the bmc on<br class=3D"">
&nbsp; &nbsp; &gt; the virtual server?<br class=3D"">
<br class=3D"">
You can do that.<br class=3D"">
The disk is rather small by default.<br class=3D"">
If you are using VirtualBox, you may be able to use the vboxfs file =
system to<br class=3D"">
mount the host. That might require adding modules to the kernel.<br =
class=3D"">
<br class=3D"">
&nbsp; &nbsp; &gt; And would I be able to make a script which can read =
text off of that<br class=3D"">
&nbsp; &nbsp; &gt; file inside the bmc chip?<br class=3D"">
<br class=3D"">
&nbsp; &nbsp; &gt; I have a physical server which I am not using yet, =
would I be able to<br class=3D"">
&nbsp; &nbsp; &gt; install openbmc and the scripts and insert the file =
onto the actual<br class=3D"">
&nbsp; &nbsp; &gt; bmc chip, and eventually read from that file?<br =
class=3D"">
<br class=3D"">
Maybe. What server do you have?<br class=3D"">
<br class=3D"">
--<br class=3D"">
]&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Never tell me =
the odds!&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| =
ipv6 mesh networks [<br class=3D"">
]&nbsp; &nbsp;Michael Richardson, Sandelman Software Works&nbsp; &nbsp; =
&nbsp; &nbsp; |&nbsp; &nbsp; IoT architect&nbsp; &nbsp;[<br class=3D"">
]&nbsp; &nbsp; &nbsp;<a href=3D"mailto:mcr@sandelman.ca" target=3D"_blank"=
 class=3D"">mcr@sandelman.ca</a>&nbsp; <a =
href=3D"http://www.sandelman.ca/" rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://www.sandelman.ca/</a>&nbsp; &nbsp; &nbsp; &nbsp; =
|&nbsp; &nbsp;ruby on rails&nbsp; &nbsp; [<br class=3D"">
<br class=3D"">
</blockquote></div><br clear=3D"all" class=3D""><div class=3D""><br =
class=3D""></div>-- <br class=3D""><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr" class=3D"">Sincerely,&nbsp;<div=
 class=3D"">Samuel Herts</div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_2EE2CFFE-75C8-446A-AB99-1465D4305458--
