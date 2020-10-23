Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D22296DA3
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 13:26:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHhlB4nb1zDqB3
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 22:26:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=thMIrdrB; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHhhv562ZzDqwP
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 22:24:45 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id o9so667472plx.10
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 04:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=eJ3DYBOFzJOKkWiDI/aJ/LhxBxWJ4dO43pHO1U6WC78=;
 b=thMIrdrBpX3wTMVw7Jr1ew4vwhOS+joWlFPpXnMmO0AzC78i4lJeQQcFb/v5lP1GR3
 c/sz5HU0irZAM2VNPpTcwf+SIAyBch9L1vPhjixbDFE7+6I4jjJl/war3q0Pn+FHcUWK
 8CVIYrlMNTynZ0ohbpjEksQQ/LglSFYGWZfzfJm8dxbMGghPdiQfcCKrHNErPF91S6pj
 xAVcbMVMjqkd08sncC5Eo5HjsIbMYGK+1OUXMWg1dExLBYtNwXg2cNbapizG1KLI82CE
 OFRU8usUyIxcaWmG2Q94yeKvzlDmpatu9aMH8P8hOT4wz8TiDjq2+oGkFulMUrGWid/F
 jTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=eJ3DYBOFzJOKkWiDI/aJ/LhxBxWJ4dO43pHO1U6WC78=;
 b=Pskp9AAbXE/FEErnyOoC/o+r3w2Mdfr4egyi/LyhE5Qt9fgJXRRdMLhUnUAN4rz/8y
 jFkWrNyi5+OpnsrYqIktgXNSJSxRsgahBmAjo2hjQ/iCgdL8tZVdhmkJcymeEhA6mw7K
 hcLAHnfvNKRJhJ248L7r4rUzxIbApnaUh1m7ecKlBVHUsvejsN3FvutQXbsg7CbGl7dt
 kqqB5Ywnqvb7Fm32jsoepJjXUimJMuWnIQwAuB85sBpdVeU50oCraLTAb1bMIDCSRX6m
 6odpVqGLlS0OOYpO2ALNcDu07s40i1fopGyBVjnK4djYUW6h6k9OuUYPM++Nl8EUF8vv
 wRRA==
X-Gm-Message-State: AOAM532eKKNsKhqiXsbqC1Jzd8xT880dariuKrqkrig6FgICVGdscHlq
 bulo+/i0ofRrPrPWBpy6psB1HloFQxDub+faDcpl9BXbdqeHuw==
X-Google-Smtp-Source: ABdhPJxppIbDgHHfm+1IPmzLqnH/Vd/amZhAaBa9Lkcyu3AvNxLyibdqnDHgFlegbj2tjq/muWnz7Netf/JwlQ6jIGU=
X-Received: by 2002:a17:902:d710:b029:d3:7e54:96d8 with SMTP id
 w16-20020a170902d710b02900d37e5496d8mr2022375ply.65.1603452280504; Fri, 23
 Oct 2020 04:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAD+gp9CHnvDk+sU05DhMpuOshST-cAx2LoU+kZJjjEHeKzztMA@mail.gmail.com>
 <CAD+gp9A2OLcJsRtSUH_32G+8fNMx2_8FRBTZjjMuLc+eLZt11Q@mail.gmail.com>
In-Reply-To: <CAD+gp9A2OLcJsRtSUH_32G+8fNMx2_8FRBTZjjMuLc+eLZt11Q@mail.gmail.com>
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Fri, 23 Oct 2020 16:54:29 +0530
Message-ID: <CAD+gp9CQeUk1tiFkq0kyzhZjXraacgYwCv232JqRdr+RGc-ABw@mail.gmail.com>
Subject: Re: openbmc:Error while running bitbake for raspberrypi-3
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009805b505b254d317"
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

--0000000000009805b505b254d317
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I tried with  =E2=80=9Cbitbake core-image-base=E2=80=9D  command but still =
not working.
Unable to generate   the rpi-sdimg file.

Thanks & Regards,
Khader B Shaik
On Fri, 23 Oct 2020 at 15:55, khader basha shaik <
shaikkhaderbasha601@gmail.com> wrote:

> Hi Team,
>
> Any suggestions or input on this please.
>
> Thanks & Regards,
> Khader B Shaik
>
>
> On Thu, 22 Oct 2020 at 13:54, khader basha shaik <
> shaikkhaderbasha601@gmail.com> wrote:
>
>> Hi Team,
>>
>> I am getting errors while running the bitbake for raspberrypi-3.
>> Following are the steps I have followed to run the bitbake:
>>
>>    1. Clonned the latest code from the master branch for openbmc repo.
>>    2.TEMPLATECONF=3Dmeta-phosphor/conf . openbmc-env
>>    2. open the conf/local.conf file in the editor and update to add the
>>    raspberrypi3-64
>>    -MACHINE ??=3D "qemuarm"
>>    +MACHINE ??=3D "raspberrypi3-64"
>>
>> 4.open the conf/bblayers.conf file in the editor and add the following
>> line
>> /home/basha/openbmc/meta-phosphor \
>>
>>    - /home/basha/openbmc/meta-raspberrypi \
>>
>>
>>    1. bitbake obmc-phosphor-image
>>
>> After the bitbake I am getting following errors:
>>
>> |     /home/basha/openbmc/meta-raspberrypi/recipes-kernel/linux/files/
>> | DEBUG: Executing shell function do_kernel_metadata
>> | ERROR: Feature 'phosphor-gpio-keys' not found, this will cause configu=
ration failures.
>> | ERROR: Check the SRC_URI for meta-data repositories or directories tha=
t may be missing
>> | ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Execution of '/home/basha/openbmc/build/tmp/work/raspberrypi3_6=
4-openbmc-linux/linux-raspberrypi/1_5.4.69+gitAUTOINC+5d52d9eea9_31d364af25=
-r0/temp/run.do_kernel_metadata.118535' failed with exit code 1:
>> | WARNING: exit code 1 from a shell command.
>> |
>> ERROR: Task (/home/basha/openbmc/meta-raspberrypi/recipes-kernel/linux/l=
inux-raspberrypi_5.4.bb:do_kernel_metadata) failed with exit code '1'
>> Waiting for 4 running tasks to finish:
>>
>>
>> Also I have referred to the following issue "#2434
>> <https://github.com/openbmc/openbmc/issues/2434>" and added
>> KERNEL_FEATURES_remove =3D "phosphor-gpio-keys" to the local.conf file a=
nd
>> recompiled using the above steps again.
>> I did not get the above errors but the rpi-sdimg file was not generated
>> in the following path.
>>
>>
>> "build/tmp/deploy/images/raspberrypi3-64/obmc-phosphor-image-raspberrypi=
3-64-2020XXXXXXXXXX.rootfs.rpi-sdimg"
>>
>> Please let me know if there are any additional steps to be followed to
>> run bitbake for raspberrypi-3 in order to generate the rpi-sdimg file.
>>
>> Thanks & Regards,
>> Khader B Shaik
>>
>

--0000000000009805b505b254d317
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Team,<br><div><br></div><div>I tried w=
ith=C2=A0 =E2=80=9Cbitbake core-image-base=E2=80=9D=C2=A0 command but still=
 not working. Unable to generate=C2=A0=C2=A0

 the rpi-sdimg file.

</div><div><br></div><div>Thanks=C2=A0&amp; Regards,</div><div>Khader B Sha=
ik</div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, 23 Oct 2020 at 15:55, khader basha shaik &lt;<a href=3D"mailto:=
shaikkhaderbasha601@gmail.com">shaikkhaderbasha601@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
">Hi Team,<div><br></div><div>Any suggestions or input on this please.</div=
><div><br></div><div>Thanks &amp; Regards,</div><div>Khader B Shaik<br><div=
><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, 22 Oct 2020 at 13:54, khader basha shaik &lt;<a hr=
ef=3D"mailto:shaikkhaderbasha601@gmail.com" target=3D"_blank">shaikkhaderba=
sha601@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><p style=3D"box-sizing:border-box;margin-b=
ottom:16px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont=
,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&qu=
ot;,&quot;Segoe UI Emoji&quot;;font-size:14px;margin-top:0px">Hi Team,</p><=
p style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rg=
b(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quo=
t;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI =
Emoji&quot;;font-size:14px">I am getting errors while running the bitbake f=
or raspberrypi-3.<br style=3D"box-sizing:border-box">Following are the step=
s I have followed to run the bitbake:</p><ol style=3D"box-sizing:border-box=
;padding-left:2em;margin-top:0px;margin-bottom:16px;color:rgb(36,41,46);fon=
t-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Ar=
ial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;fon=
t-size:14px"><li style=3D"box-sizing:border-box">Clonned the latest code fr=
om the master branch for openbmc repo.<br style=3D"box-sizing:border-box">2=
.TEMPLATECONF=3Dmeta-phosphor/conf . openbmc-env</li><li style=3D"box-sizin=
g:border-box;margin-top:0.25em">open the conf/local.conf file in the editor=
 and update to add the raspberrypi3-64<br style=3D"box-sizing:border-box">-=
MACHINE ??=3D &quot;qemuarm&quot;<br style=3D"box-sizing:border-box">+MACHI=
NE ??=3D &quot;raspberrypi3-64&quot;</li></ol><p style=3D"box-sizing:border=
-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,46);font-family:-app=
le-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-seri=
f,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">=
4.open the conf/bblayers.conf file in the editor and add the following line=
<br style=3D"box-sizing:border-box">/home/basha/openbmc/meta-phosphor \</p>=
<ul style=3D"box-sizing:border-box;padding-left:2em;margin-top:0px;margin-b=
ottom:16px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont=
,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&qu=
ot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><li style=3D"box-sizing:bord=
er-box">/home/basha/openbmc/meta-raspberrypi \</li></ul><ol start=3D"5" sty=
le=3D"box-sizing:border-box;padding-left:2em;margin-top:0px;margin-bottom:1=
6px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px"><li style=3D"box-sizing:border-box"=
>bitbake obmc-phosphor-image</li></ol><p style=3D"box-sizing:border-box;mar=
gin-top:0px;margin-bottom:16px;color:rgb(36,41,46);font-family:-apple-syste=
m,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;=
Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">After th=
e bitbake I am getting following errors:</p><pre style=3D"box-sizing:border=
-box;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,=
monospace;font-size:11.9px;margin-top:0px;margin-bottom:16px;padding:16px;o=
verflow:auto;line-height:1.45;border-radius:6px;color:rgb(36,41,46)"><code =
style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&quot;Li=
beration Mono&quot;,Menlo,monospace;padding:0px;margin:0px;background:initi=
al;border-radius:6px;word-break:normal;border:0px;display:inline;overflow:v=
isible;line-height:inherit">|     /home/basha/openbmc/meta-raspberrypi/reci=
pes-kernel/linux/files/
| DEBUG: Executing shell function do_kernel_metadata
| ERROR: Feature &#39;phosphor-gpio-keys&#39; not found, this will cause co=
nfiguration failures.
| ERROR: Check the SRC_URI for meta-data repositories or directories that m=
ay be missing
| ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of &#39;/home/basha/openbmc/build/tmp/work/raspberrypi3_=
64-openbmc-linux/linux-raspberrypi/1_5.4.69+gitAUTOINC+5d52d9eea9_31d364af2=
5-r0/temp/run.do_kernel_metadata.118535&#39; failed with exit code 1:
| WARNING: exit code 1 from a shell command.
|
ERROR: Task (/home/basha/openbmc/meta-raspberrypi/recipes-kernel/linux/linu=
x-raspberrypi_5.4.bb:do_kernel_metadata) failed with exit code &#39;1&#39;
Waiting for 4 running tasks to finish:

</code></pre><p style=3D"box-sizing:border-box;margin-top:0px;margin-bottom=
:16px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quo=
t;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&=
quot;Segoe UI Emoji&quot;;font-size:14px">Also I have referred to the follo=
wing issue &quot;<a href=3D"https://github.com/openbmc/openbmc/issues/2434"=
 style=3D"box-sizing:border-box;background-color:initial;text-decoration-li=
ne:none" target=3D"_blank">#2434</a>&quot; and added KERNEL_FEATURES_remove=
 =3D &quot;phosphor-gpio-keys&quot; to the local.conf file and recompiled u=
sing the above steps again.<br style=3D"box-sizing:border-box">I did not ge=
t the above errors but the rpi-sdimg file was not generated in the followin=
g path.</p><p style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:1=
6px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">&quot;build/tmp/deploy/images/raspb=
errypi3-64/obmc-phosphor-image-raspberrypi3-64-2020XXXXXXXXXX.rootfs.rpi-sd=
img&quot;</p><p style=3D"box-sizing:border-box;margin-top:0px;margin-bottom=
:16px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quo=
t;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&=
quot;Segoe UI Emoji&quot;;font-size:14px">Please let me know if there are a=
ny additional steps to be followed to run bitbake for raspberrypi-3 in orde=
r to generate the rpi-sdimg file.</p><p style=3D"box-sizing:border-box;marg=
in-top:0px;margin-bottom:16px;color:rgb(36,41,46);font-family:-apple-system=
,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;A=
pple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">Thanks &a=
mp; Regards,<br style=3D"box-sizing:border-box">Khader B Shaik</p></div>
</blockquote></div>
</blockquote></div></div>

--0000000000009805b505b254d317--
