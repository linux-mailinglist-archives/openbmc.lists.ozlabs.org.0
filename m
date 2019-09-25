Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C0BBDED9
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 15:23:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ddzb5fwYzDqXN
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 23:23:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=embeddedsteve@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="upG4xdr9"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ddyn1c5hzDqP0
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 23:22:40 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id w17so4855787oiw.8
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ewWsHQJ6lfoBKQAg8o8iv91eutHcWE4cMLUme4aGJL0=;
 b=upG4xdr9bdPWzg/MF9u0Z8Fym8TnDfe4iIQrtgLKGhvmwi3KgHvNg/F7fKO5qFVgkM
 5FImr1UFOTMo0OuZzEN6W+RTKzWNTR4Ze1VoC3utSAzQLruKN6GIXDqmqgOnzxGS5zGT
 QP/cCQa9KtLJP8vjHK4kY6YPclIYKctO18AqGu/7CMKdPJEjFM4OCqFeHf/Ta8zKbVw3
 gF4dOm4FwuKr8Q8W+GkWQFNqn+45gEYxfc9idLnJ6mVm6ZrIOCAep0/zYoP+i0TGI7BQ
 3OxQq11oLcSXfA8ldOPxA5YZJqKaGvf/V6zE9ZAALYfVe+/2ojW+4M6ilj3gakrHoBu9
 RsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ewWsHQJ6lfoBKQAg8o8iv91eutHcWE4cMLUme4aGJL0=;
 b=sC+UnhddAyfeTS2gpNTU7eJb32N7eqCi49k0oBo+4cKuvluunooyTtFOZRXz9+siyp
 wwvt8jLIV1xLP6SEw2ru2/Sx+wAKNfg4ZQBI0snm6+Qym12rzDIvCQAQQPY+VPbQuuQi
 ciIgpyaBGXJrjFDKLmDXjyAwkeD5ke1lL6lninDrBPoyk9sHraKbK64oUfcMttTlf7th
 WPsoUUliAoKNWVUBUX2ZYLFgRdyFvK0D20UG3jAKYsoSlm8nlyvHttgbu1fisOSgaoZc
 tnuC1puo3/+fldnj6xAjlD7ibUvEdZ38Z5ZQMfH+eKvOpChOuUWP1ZOEKE0z9MaMp9M0
 +O3w==
X-Gm-Message-State: APjAAAUrWfTP7xu8zRnoxDv18u+yCPG/SZmsJGZvZd3YcQ8Gg7XqAWxr
 sKQUziMuAVKomvZw/MYM7l/DZeqDAkL3uKPH8EcXHB5gly0=
X-Google-Smtp-Source: APXvYqx4xbbOC77lwgaE4pq3+BWRJDDQr3SVqnnvhzFaUreNtT0ae6qgpavLNNrQsG9F7QAGXiwtYusj0gr9EIRQr/E=
X-Received: by 2002:aca:4942:: with SMTP id w63mr4649660oia.129.1569417755333; 
 Wed, 25 Sep 2019 06:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAN34fowBHmprS9Wmo+GQkDEtxsz2s514j5+zO-rGvTWeMnzjOg@mail.gmail.com>
 <9f7cc18d-2164-4a39-8f47-1a3ef3220685@www.fastmail.com>
In-Reply-To: <9f7cc18d-2164-4a39-8f47-1a3ef3220685@www.fastmail.com>
From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Wed, 25 Sep 2019 09:22:24 -0400
Message-ID: <CAN34fowhEKe0fTv+AVN-++5GoySugobjegb=5Lghi7VYXNLmdg@mail.gmail.com>
Subject: Re: Unable to boot OpenBMC image in QEMU for AST2500
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000cf99e40593608bf0"
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

--000000000000cf99e40593608bf0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mr. Geissler;
    Thank you for your comments/suggestion.
1)  I fetched the version referenced in the document.  This replaced the
installed version in /usr/bin on the host system.  The previous version was
12MB and version was:
sbeckwit@ubuntu:~/yocto_dev/openbmc-master/build$ qemu-system-arm.old
-version
QEMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.18)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
 - the =E2=80=9Cnew=E2=80=9D version installed is 65MB and is version:
sbeckwit@ubuntu:~/yocto_dev/openbmc-master/build$ sudo qemu-system-arm
--help
QEMU emulator version 4.1.0 (v4.0.0-rc1-2953-g0d7c1ec-dirty)
Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers
 -  The =E2=80=9Cnew=E2=80=9D version did not work either.
2) Per the command line arguments being passed to qemu-system-arm, the copy
of this is a =E2=80=9Cbuilt=E2=80=9D copy as part of the openbmc build proc=
ess, located in
the following directory and is the newer version:
sbeckwit@ubuntu:~/yocto_dev/openbmc-master/build/tmp/work/qemuarm-openbmc-l=
inux-gnueabi/obmc-phosphor-image/1.0-r0/recipe-sysroot-native/usr/bin$
./qemu-system-arm -version
QEMU emulator version 4.1.0
Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers
3) My initial build of the openbmc project was to =E2=80=9Cbake=E2=80=9D th=
e =E2=80=9Cmeta-aspeed=E2=80=9D
- per some information/notes I found in the openbmc documentation.  (it
also said you needed to source the setup script to set this up - which I
did).  So stepping back, maybe this was the wrong target to build.   So I
spend another 2 hrs, 32 minutes =E2=80=9Cbaking=E2=80=9D the =E2=80=9Cmeta-=
evb=E2=80=9D, the rational being
that maybe the first image was missing something required by qemu (i.e.
some boot/driver stuff??).   After this was built, and using the =E2=80=9Cr=
unqemu=E2=80=9D
script, alas, the same result:  qemu will not boot and run the image.


Mr. Jeffery;
   Thank you for your comments/suggestion, I will work on this approach
today.  Regarding your question:
1)  re: cloning - I received an =E2=80=9Caccess denied=E2=80=9D message, ev=
enthough I was
logged into gihub (using my personal account information).  Therefore, used
a zipped version that was downloaded ~ 1 week ago.

2) re: qemu machine - the qemu machine being used is the one that was built
as part fo the opembmc project.  If this qemu machine won=E2=80=99t work, t=
hen why
is it built as part of the project?  Why are there 13 copies of this
machine scattered through out the filesystem, consuming ~ 564MB of space,
if it=E2=80=99s the =E2=80=9Cwrong=E2=80=9D machine?
 - so where do I obtain the =E2=80=9CBMC-specific machine=E2=80=9D ?  The o=
ne I installed
per Mr. Geissler?

3) if OpenBMC doesn=E2=80=99t properly integrate into the rumqemu scripts, =
then:
 A) why is this script here? B) why hasn=E2=80=99t anyone taken the time/ef=
fort to
correct the script so that it will integrate properly with OpenBMC?

4)  I will review the information in the link provided in your response.
Thank you.

Regards,
Stephen Beckwith

On Wed, Sep 25, 2019 at 12:28 AM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Tue, 24 Sep 2019, at 06:16, Stephen Beckwith wrote:
> > Greetings,
> >  I am working on a Proof-of-Concept for OpenBMC. I am familiar with
> > SP/BMC setups using proprietary code. I have successfully built the
> > OpenBMC project (in a VM running Ubuntu 18.04) as well as
> > building/installing the eSDK. Note: system was built from a ZIP from
> > github, git clone failed due to access rights.
>
> How are you cloning it? Might be some issue with SSH vs HTTPS.
>
> >  When I completed the process, I tried to load the available image into
> > QEMU for ARM (which was also built) and received the following
> > error(s), depending upon the directory from which this is run (which is
> > also a question, why the difference?)
> >  I was successful in booting the Poky example from Yocto for both x86
> > and ARM into the respective QEMU machines, for the minimal image.
> >  Any pointers would be greatly provided.
> >
> > Regards,
> > Stephen Beckwith
> >
> > Failure #1: QEMU Hangs:
> > =3D=3D> Fresh shell:
> >
> > sbeckwit@ubuntu:~/yocto_dev/openbmc-master/build$ runqemu qemuarm
> > runqemu - INFO - Running MACHINE=3Dqemuarm bitbake -e...
>
> You're running with the wrong qemu machine - the generic 'qemuarm' machin=
e
> won't work for the images the build produces. You need to use one of the
> BMC-specific machines instead. Note that OpenBMC doesn't properly
> integrate into the runqemu scripts, and you're often better served by
> invoking
> it manually or (and!) sending a patch to make runqemu work properly.
>
> We have some info on running qemu manually in the cheatsheet in the docs
> repo:
>
> https://github.com/openbmc/docs/blob/master/cheatsheet.md#using-qemu
>
> Hope that helps,
>
> Andrew
>

--000000000000cf99e40593608bf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Mr. Geissler;<br>=C2=A0 =C2=A0 Thank you for your com=
ments/suggestion. =C2=A0<br>1) =C2=A0I fetched the version referenced in th=
e document.=C2=A0 This replaced the installed version in /usr/bin on the ho=
st system.=C2=A0 The previous version was 12MB and version was:<br>sbeckwit=
@ubuntu:~/yocto_dev/openbmc-master/build$ qemu-system-arm.old -version<br>Q=
EMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.18)<br>Copyright (c=
) 2003-2017 Fabrice Bellard and the QEMU Project developers<br>=C2=A0- the =
=E2=80=9Cnew=E2=80=9D version installed is 65MB and is version:<br>sbeckwit=
@ubuntu:~/yocto_dev/openbmc-master/build$ sudo qemu-system-arm --help<br>QE=
MU emulator version 4.1.0 (v4.0.0-rc1-2953-g0d7c1ec-dirty)<br>Copyright (c)=
 2003-2019 Fabrice Bellard and the QEMU Project developers<br>=C2=A0- =C2=
=A0The =E2=80=9Cnew=E2=80=9D version did not work either.<br>2) Per the com=
mand line arguments being passed to qemu-system-arm, the copy of this is a =
=E2=80=9Cbuilt=E2=80=9D copy as part of the openbmc build process, located =
in the following directory and is the newer version:<br>sbeckwit@ubuntu:~/y=
octo_dev/openbmc-master/build/tmp/work/qemuarm-openbmc-linux-gnueabi/obmc-p=
hosphor-image/1.0-r0/recipe-sysroot-native/usr/bin$ ./qemu-system-arm -vers=
ion<br>QEMU emulator version 4.1.0<br>Copyright (c) 2003-2019 Fabrice Bella=
rd and the QEMU Project developers<br>3) My initial build of the openbmc pr=
oject was to =E2=80=9Cbake=E2=80=9D the =E2=80=9Cmeta-aspeed=E2=80=9D - per=
 some information/notes I found in the openbmc documentation. =C2=A0(it als=
o said you needed to source the setup script to set this up - which I did).=
=C2=A0 So stepping back, maybe this was the wrong target to build. =C2=A0 S=
o I spend another 2 hrs, 32 minutes =E2=80=9Cbaking=E2=80=9D the =E2=80=9Cm=
eta-evb=E2=80=9D, the rational being that maybe the first image was missing=
 something required by qemu (i.e. some boot/driver stuff??). =C2=A0 After t=
his was built, and using the =E2=80=9Crunqemu=E2=80=9D script, alas, the sa=
me result: =C2=A0qemu will not boot and run the image.<br><br><br>Mr. Jeffe=
ry;<br>=C2=A0 =C2=A0Thank you for your comments/suggestion, I will work on =
this approach today.=C2=A0 Regarding your question:<br>1) =C2=A0re: cloning=
 - I received an =E2=80=9Caccess denied=E2=80=9D message, eventhough I was =
logged into gihub (using my personal account information).=C2=A0 Therefore,=
 used a zipped version that was downloaded ~ 1 week ago.<br><br>2) re: qemu=
 machine - the qemu machine being used is the one that was built as part fo=
 the opembmc project.=C2=A0 If this qemu machine won=E2=80=99t work, then w=
hy is it built as part of the project?=C2=A0 Why are there 13 copies of thi=
s machine scattered through out the filesystem, consuming ~ 564MB of space,=
 if it=E2=80=99s the =E2=80=9Cwrong=E2=80=9D machine? =C2=A0<br>=C2=A0- so =
where do I obtain the =E2=80=9CBMC-specific machine=E2=80=9D ?=C2=A0 The on=
e I installed per Mr. Geissler? =C2=A0<br><br>3) if OpenBMC doesn=E2=80=99t=
 properly integrate into the rumqemu scripts, then: =C2=A0A) why is this sc=
ript here? B) why hasn=E2=80=99t anyone taken the time/effort to correct th=
e script so that it will integrate properly with OpenBMC? =C2=A0<br><br>4) =
=C2=A0I will review the information in the link provided in your response.=
=C2=A0 Thank you.<br><br></div><div>Regards,</div><div>Stephen Beckwith<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, Sep 25, 2019 at 12:28 AM Andrew Jeffery &lt;<a href=3D"mailto=
:andrew@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
<br>
On Tue, 24 Sep 2019, at 06:16, Stephen Beckwith wrote:<br>
&gt; Greetings,<br>
&gt;=C2=A0 I am working on a Proof-of-Concept for OpenBMC. I am familiar wi=
th <br>
&gt; SP/BMC setups using proprietary code. I have successfully built the <b=
r>
&gt; OpenBMC project (in a VM running Ubuntu 18.04) as well as <br>
&gt; building/installing the eSDK. Note: system was built from a ZIP from <=
br>
&gt; github, git clone failed due to access rights.<br>
<br>
How are you cloning it? Might be some issue with SSH vs HTTPS.<br>
<br>
&gt;=C2=A0 When I completed the process, I tried to load the available imag=
e into <br>
&gt; QEMU for ARM (which was also built) and received the following <br>
&gt; error(s), depending upon the directory from which this is run (which i=
s <br>
&gt; also a question, why the difference?)<br>
&gt;=C2=A0 I was successful in booting the Poky example from Yocto for both=
 x86 <br>
&gt; and ARM into the respective QEMU machines, for the minimal image. <br>
&gt;=C2=A0 Any pointers would be greatly provided.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Stephen Beckwith<br>
&gt; <br>
&gt; Failure #1: QEMU Hangs:<br>
&gt; =3D=3D&gt; Fresh shell:<br>
&gt; <br>
&gt; sbeckwit@ubuntu:~/yocto_dev/openbmc-master/build$ runqemu qemuarm<br>
&gt; runqemu - INFO - Running MACHINE=3Dqemuarm bitbake -e...<br>
<br>
You&#39;re running with the wrong qemu machine - the generic &#39;qemuarm&#=
39; machine<br>
won&#39;t work for the images the build produces. You need to use one of th=
e<br>
BMC-specific machines instead. Note that OpenBMC doesn&#39;t properly<br>
integrate into the runqemu scripts, and you&#39;re often better served by i=
nvoking<br>
it manually or (and!) sending a patch to make runqemu work properly.<br>
<br>
We have some info on running qemu manually in the cheatsheet in the docs<br=
>
repo:<br>
<br>
<a href=3D"https://github.com/openbmc/docs/blob/master/cheatsheet.md#using-=
qemu" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/docs/=
blob/master/cheatsheet.md#using-qemu</a><br>
<br>
Hope that helps,<br>
<br>
Andrew<br>
</blockquote></div>

--000000000000cf99e40593608bf0--
