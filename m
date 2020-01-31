Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D04B014F3C4
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 22:30:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488Vk50mWZzDqhR
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 08:30:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NWNfrEQ9; dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488VjV72qJzDqdg
 for <openbmc@lists.ozlabs.org>; Sat,  1 Feb 2020 08:29:32 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id g12so7523431ild.2
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 13:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=niQv4fl0DLeRjqARFjZVduqIwrdJUaZdALV4F+onyJY=;
 b=NWNfrEQ9Hdfrpsv6pgnMNJWR62dXNEM2PT53prYB2iXETqop4/csCTVUzjbb6ilC8F
 YZwmEXh89U2U1ANbRdkotM874u7znk2zs/yO6ywsyiFfSaLwq1arUm/EuQbzJo5Dd3sg
 elOr6VtbMJBO9mGGzY11yAIBEq1GgnBys6nKyShgVuVXPzLkW5naEVtwk8bh7oIDU78c
 NPSfDorcVjWG1mLBNNCQ3THzaqvgfs7e8GaLRIVa0K1p3n5oOtDfsr6YbcTQjq2vsdxR
 ktoSyg/J1HlvJHGWWIQCMiQ++fpKEZMVsgiYk0AksMM0RjEwkxZZBu4DyHrAfqXRN0vE
 7kLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=niQv4fl0DLeRjqARFjZVduqIwrdJUaZdALV4F+onyJY=;
 b=Y4ww822WnI+jyEIRxKGUWpX+6C2uTRAp+AIcRIFpUaAuwO1r7g3HtgiGd5J1HBsOHV
 rjaNs0bwpIcTtuIo0UQBSGtHqKKnx0gHH76gKTG46jOUfoXo3RhxZ6vuWQdZAguVRIQh
 BzFYeZimCSkSh3YaRqfeFsjOil7DRFW/f4y0NwpKy2krsHZ2C8ZsoEYlqFzaVa5F07A3
 arxu2MjNifQIlS/P25/CXx563EZ2YJ2QVFyMcZt/wg1nasQv6dIamQ3Ac0yXZi0pfGCa
 uFToOVLPqFUoE7vk5qbg4VJykXLgFAWq2LZc5Z3/yQlw4c9MIloXOyTsrM1eEz7v8vId
 au6A==
X-Gm-Message-State: APjAAAVsHCdS97LerKh50gVhrRU5cqBuIgRjRlsDlvqATxOj6Q/7eV60
 0h80FHybQJ2ziGxpHkkhAhs=
X-Google-Smtp-Source: APXvYqzJS2hivua0qO2rWKRGSZJkqPyz9LbyeICn4lSYvB0fhn520dPWx9PdAbY5OtDv1v1nS/ariA==
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr11969374ilq.192.1580506169159; 
 Fri, 31 Jan 2020 13:29:29 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id l17sm3558192ilc.49.2020.01.31.13.29.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Jan 2020 13:29:28 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <4AD6BC0E-9BB2-4D2B-BB15-3B52FFB78247@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_D1031077-54E9-4E68-B0C7-AEA70A2B7183"
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: OpenBMC Starting Point
Date: Fri, 31 Jan 2020 15:29:27 -0600
In-Reply-To: <CA+k9xxZXUjn=n1SCnHb28_iTN3cEG0yv_QB+Qh7DgcUNdXD4LA@mail.gmail.com>
To: Samuel Herts <sdherts@gmail.com>
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
 <5937.1579503424@localhost>
 <CA+k9xxZfreCU8L=G=vUJBODdyjPU_p8+d7_LycNi_ShAZzwMjQ@mail.gmail.com>
 <37BC22AA-C168-4A36-98D8-DD31E78BDE03@gmail.com>
 <CA+k9xxZXUjn=n1SCnHb28_iTN3cEG0yv_QB+Qh7DgcUNdXD4LA@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
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


--Apple-Mail=_D1031077-54E9-4E68-B0C7-AEA70A2B7183
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jan 31, 2020, at 11:15 AM, Samuel Herts <sdherts@gmail.com> wrote:
>=20
> We got the Hello World to work perfectly, thank you for the =
assistance! How would we now go about doing the exact same thing, but =
hardware implemented? By that, I mean actually running the phosphor =
state manager modified module on the physical BMC chip? How do we =
install the OpenBMC sdk?

You would want to use an SDK that you=E2=80=99ve built for your BMC =
hardware.
bitbake -c populate_sdk obmc-phosphor-image

You=E2=80=99d then use that SDK the same way you used it for Hello World
and then you would scp the compiled binary to your BMC hardware.

If your bmc hardware is similar to the Romulus hardware then you
could just scp the binary you generated for Hello World over
to your hardware.

> Also, is there a method to read from the computer's BIOS chip from =
this modified state manager?

The BIOS is pretty dependent on the system. Something like this should
list all firmware images on your system, you could then introspect them
to figure out your BIOS and the appropriate D-Bus calls to read them
from an application:

busctl call xyz.openbmc_project.ObjectMapper =
/xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper =
GetSubTreePaths sias "/xyz/openbmc_project/software" 0 1 =
xyz.openbmc_project.Software.Version


Andrew

>=20
>=20
> On Tue, Jan 21, 2020 at 11:52 AM Andrew Geissler =
<geissonator@gmail.com <mailto:geissonator@gmail.com>> wrote:
>=20
>=20
>> On Jan 20, 2020, at 11:03 AM, Samuel Herts <sdherts@gmail.com =
<mailto:sdherts@gmail.com>> wrote:
>>=20
>> Thank you!
>> I have a supermicro X9 with ast2400 BMC chip. How would we go about =
installing it? openBMC onto it? We currently have a fresh install of =
Ubuntu LTS on it, and nothing else.
>=20
> The only AST2400 config I=E2=80=99m familiar with is our Palmetto.
> You could start with that machine and tweak it for yours.
> =
https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-palmetto/conf=
/machine/palmetto.conf =
<https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-palmetto/con=
f/machine/palmetto.conf>
>=20
>=20
>> In terms of the development virtual machine. I keep running into an =
issue when trying to wget the sdk.=20
>> Specifically, this line: wget =
https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=3Dromul=
us/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm1176jzs-toolch=
ain-nodistro.0.sh =
<https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=3Dromu=
lus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm1176jzs-toolc=
hain-nodistro.0.sh> After running that inside the romulus emulator, it =
runs out of space and won't complete the download. Does this mean I need =
to either increase the storage for the romulus, or am I simply =
installing it in the wrong place, and instead need to wget that into the =
regular VM?
>=20
> The SDK is not meant to be downloaded to the actual OpenBMC
> system. I=E2=80=99t meant to be downloaded to your development system.
> You can then use it to build OpenBMC software that you then copy
> over to your OpenBMC and run.
>=20
>> Apologies for all the questions, I am doing as much research as I =
can, and this mailing list seems to be the largest wealth of knowledge I =
have available.
>>=20
>> --Sam
>>=20
>> On Mon, Jan 20, 2020 at 1:57 AM Michael Richardson <mcr@sandelman.ca =
<mailto:mcr@sandelman.ca>> wrote:
>>=20
>> Samuel Herts <sdherts@gmail.com <mailto:sdherts@gmail.com>> wrote:
>>     > I am currently working on getting a working OpenBMC test =
environment
>>     > up and running. I am using VirtualBox and the github =
Development
>>     > Environment tutorial. I had a couple questions regarding how to =
make
>>     > our own modules. Would it be possible to upload files to the =
bmc on
>>     > the virtual server?
>>=20
>> You can do that.
>> The disk is rather small by default.
>> If you are using VirtualBox, you may be able to use the vboxfs file =
system to
>> mount the host. That might require adding modules to the kernel.
>>=20
>>     > And would I be able to make a script which can read text off of =
that
>>     > file inside the bmc chip?
>>=20
>>     > I have a physical server which I am not using yet, would I be =
able to
>>     > install openbmc and the scripts and insert the file onto the =
actual
>>     > bmc chip, and eventually read from that file?
>>=20
>> Maybe. What server do you have?
>>=20
>> --
>> ]               Never tell me the odds!                 | ipv6 mesh =
networks [
>> ]   Michael Richardson, Sandelman Software Works        |    IoT =
architect   [
>> ]     mcr@sandelman.ca <mailto:mcr@sandelman.ca>  =
http://www.sandelman.ca/ <http://www.sandelman.ca/>        |   ruby on =
rails    [
>>=20
>>=20
>>=20
>> --=20
>> Sincerely,=20
>> Samuel Herts
>=20
>=20
>=20
> --=20
> Sincerely,=20
> Samuel Herts


--Apple-Mail=_D1031077-54E9-4E68-B0C7-AEA70A2B7183
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 31, 2020, at 11:15 AM, Samuel Herts &lt;<a =
href=3D"mailto:sdherts@gmail.com" class=3D"">sdherts@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D""><div dir=3D"ltr" class=3D"">We got the Hello =
World to work perfectly, thank you for the assistance! How would we now =
go about doing the exact same thing, but hardware implemented? By that, =
I mean actually running the phosphor state manager modified module on =
the physical BMC chip? How do we install the OpenBMC =
sdk?</div></div></div></blockquote><div><br class=3D""></div><div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">You would want =
to use an SDK that you=E2=80=99ve built for your BMC hardware.</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">bitbake -c =
populate_sdk obmc-phosphor-image</div><div style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);"><br class=3D""></div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">You=E2=80=99d =
then use that SDK the same way you used it for Hello World</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">and then you =
would scp the compiled binary to your BMC hardware.</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><br =
class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);">If your bmc hardware is similar to the Romulus hardware then =
you</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);">could just scp the binary you generated for Hello World =
over</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);">to your hardware.</div></div><br class=3D""><blockquote type=3D"cite"=
 class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div dir=3D"ltr" =
class=3D"">Also, is there a method to read from the computer's BIOS chip =
from this modified state manager?</div></div></div></blockquote><div><br =
class=3D""></div><div>The BIOS is pretty dependent on the system. =
Something like this should</div><div>list all firmware images on your =
system, you could then introspect them</div><div>to figure out your BIOS =
and the appropriate D-Bus calls to read them</div><div>from an =
application:</div><div><br class=3D""></div><div>busctl call =
xyz.openbmc_project.ObjectMapper /xyz/openbmc_project/object_mapper =
xyz.openbmc_project.ObjectMapper GetSubTreePaths sias =
"/xyz/openbmc_project/software" 0 1 =
xyz.openbmc_project.Software.Version</div><div><br =
class=3D""></div><div><br class=3D""></div><div>Andrew</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail-yj6qo gmail-ajU" =
style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px =
0px"><br class=3D"gmail-Apple-interchange-newline"></div></div><br =
class=3D""><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jan 21, 2020 at 11:52 AM Andrew Geissler =
&lt;<a href=3D"mailto:geissonator@gmail.com" =
class=3D"">geissonator@gmail.com</a>&gt; wrote:<br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div style=3D"overflow-wrap: =
break-word;" class=3D""><br class=3D""><div class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Jan =
20, 2020, at 11:03 AM, Samuel Herts &lt;<a =
href=3D"mailto:sdherts@gmail.com" target=3D"_blank" =
class=3D"">sdherts@gmail.com</a>&gt; wrote:</div><br class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D"">Thank you!<div class=3D"">I have =
a supermicro X9 with ast2400 BMC chip. How would we go about installing =
it? openBMC onto it? We currently have a fresh install of Ubuntu LTS on =
it, and nothing else.</div></div></div></blockquote><div class=3D""><br =
class=3D""></div><div class=3D""><div style=3D"" class=3D"">The only =
AST2400 config I=E2=80=99m familiar with is our Palmetto.</div><div =
style=3D"" class=3D"">You could start with that machine and tweak it for =
yours.</div><div style=3D"" class=3D""><a =
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-palme=
tto/conf/machine/palmetto.conf" target=3D"_blank" =
class=3D"">https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-pa=
lmetto/conf/machine/palmetto.conf</a></div></div><div class=3D""><br =
class=3D""></div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"">In terms of the =
development virtual machine. I keep running into an issue when trying to =
wget the sdk.&nbsp;</div><div class=3D"">Specifically, this =
line:&nbsp;<span =
style=3D"background-color:initial;font-family:SFMono-Regular,Consolas,&quo=
t;Liberation =
Mono&quot;,Menlo,monospace;color:rgb(36,41,46);font-size:13.6px" =
class=3D"">wget <a =
href=3D"https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=
=3Dromulus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm1176jz=
s-toolchain-nodistro.0.sh" target=3D"_blank" =
class=3D"">https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,tar=
get=3Dromulus/lastSuccessfulBuild/artifact/deploy/sdk/oecore-x86_64-arm117=
6jzs-toolchain-nodistro.0.sh</a></span></div>&nbsp;After running that =
inside the romulus emulator, it runs out of space and won't complete the =
download. Does this mean I need to either increase the storage for the =
romulus, or am I simply installing it in the wrong place, and instead =
need to wget that into the regular VM?</div></div></blockquote><div =
class=3D""><br class=3D""></div><div class=3D""><div style=3D"" =
class=3D"">The SDK is not meant to be downloaded to the actual =
OpenBMC</div><div style=3D"" class=3D"">system. I=E2=80=99t meant to be =
downloaded to your development system.</div><div style=3D"" class=3D"">You=
 can then use it to build OpenBMC software that you then copy</div><div =
style=3D"" class=3D"">over to your OpenBMC and run.</div></div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"">Apologies for all the questions, =
I am doing as much research as I can, and this mailing list seems to be =
the largest wealth of knowledge I have available.</div><div class=3D""><br=
 class=3D""></div><div class=3D"">--Sam</div></div><br class=3D""><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan =
20, 2020 at 1:57 AM Michael Richardson &lt;<a =
href=3D"mailto:mcr@sandelman.ca" target=3D"_blank" =
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
class=3D""></div>-- <br class=3D""><div dir=3D"ltr" class=3D""><div =
dir=3D"ltr" class=3D"">Sincerely,&nbsp;<div class=3D"">Samuel =
Herts</div></div></div>
</div></blockquote></div><br class=3D""></div></blockquote></div><br =
clear=3D"all" class=3D""><div class=3D""><br class=3D""></div>-- <br =
class=3D""><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr" =
class=3D"">Sincerely,&nbsp;<div class=3D"">Samuel =
Herts</div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_D1031077-54E9-4E68-B0C7-AEA70A2B7183--
