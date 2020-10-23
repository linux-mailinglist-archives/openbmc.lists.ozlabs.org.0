Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 169AB296CDE
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 12:27:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHgQB0vxYzDqwm
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 21:26:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=duz5DC/x; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHgNf1t8YzDqwb
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 21:25:37 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id b23so888869pgb.3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=b65X0qO6JVtlw7ryxclDcUA/15WtwhM1Ql/zkvUh5Ow=;
 b=duz5DC/xTCRJSKKnIRS5a+0U0Ck5WcTvPuG9xw0q4UgHnl2Lnn3ocRChF5r4l068bQ
 CrXz0jfJBGzZSxpqKpWX2BI2kI4SEQK4hDFC1Re3Gjzo42h13qan/OfGzW+frFodwyu9
 KtTIqVBcvJrznCLm4uEsjNBYCKDkpfGGzyiKybkdJijkna4IoIXbwccY+R1GMnO2Ylmn
 0ZhjBbj86M/dmuqFYoc65f35ZPSzzBKZitWPCs5aPxFhuv1lqerk8atxmOU3Jk6EWGv5
 sPvK+aPXK5nf+7TM3EX14NrYJ1oDxnHqYT7aTRtdNoHDIhIt0WbEhP4LFsZVF+pD9o4e
 adsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=b65X0qO6JVtlw7ryxclDcUA/15WtwhM1Ql/zkvUh5Ow=;
 b=BSfZqeYIu6uZjQOR0VyGrPOdOA1ndPhQuZWz4jKobfglI0SKle/H4BomBX0UqMZi3a
 6DK4bq64U0MgTjTTpxDS5SBXT8sFU1zC8ifjaRzJc66LSwUWvd+vR+IJzUA/uiWIb6gb
 5QnEuSs95qaEK008uka6xiiDrRpHTWIm20fBpFDjZuc/RcK9QdmVZXqi1eUyE4lQcxFA
 mMn2gG+t024WjocU7l4vusOKONH2JtqLAkZwC2QZoZXuQv552AOrn1Wi68Qfl//mUGoO
 DgPxLTcqcrrGWrk5NXpIDsyGnsQwLCnSzAO8bC8QkN2hB6J0NNUUeV2aMZ9CA6l6FJbL
 oP8w==
X-Gm-Message-State: AOAM532EXwxImkQL1bA7xrtbYYiItYpWGYAThMRLIKimmMq9xcdRz5+F
 iEdK1OkFFCgo+3sTr3AJWvoESYI+3+srGpSq9QQpUH4W1Io=
X-Google-Smtp-Source: ABdhPJwXbAJU6oN9CEdvex4Z6m8Iodwi8MoUHFak1eqLgesR6eDSHwAUehpM5u2lBPsyTgTwei/XzFYknG1XCZ18FR8=
X-Received: by 2002:a17:90a:6301:: with SMTP id
 e1mr1767992pjj.131.1603448732992; 
 Fri, 23 Oct 2020 03:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAD+gp9CHnvDk+sU05DhMpuOshST-cAx2LoU+kZJjjEHeKzztMA@mail.gmail.com>
In-Reply-To: <CAD+gp9CHnvDk+sU05DhMpuOshST-cAx2LoU+kZJjjEHeKzztMA@mail.gmail.com>
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Fri, 23 Oct 2020 15:55:22 +0530
Message-ID: <CAD+gp9A2OLcJsRtSUH_32G+8fNMx2_8FRBTZjjMuLc+eLZt11Q@mail.gmail.com>
Subject: Re: openbmc:Error while running bitbake for raspberrypi-3
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000002548c605b2540078"
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

--0000000000002548c605b2540078
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Any suggestions or input on this please.

Thanks & Regards,
Khader B Shaik


On Thu, 22 Oct 2020 at 13:54, khader basha shaik <
shaikkhaderbasha601@gmail.com> wrote:

> Hi Team,
>
> I am getting errors while running the bitbake for raspberrypi-3.
> Following are the steps I have followed to run the bitbake:
>
>    1. Clonned the latest code from the master branch for openbmc repo.
>    2.TEMPLATECONF=meta-phosphor/conf . openbmc-env
>    2. open the conf/local.conf file in the editor and update to add the
>    raspberrypi3-64
>    -MACHINE ??= "qemuarm"
>    +MACHINE ??= "raspberrypi3-64"
>
> 4.open the conf/bblayers.conf file in the editor and add the following line
> /home/basha/openbmc/meta-phosphor \
>
>    - /home/basha/openbmc/meta-raspberrypi \
>
>
>    1. bitbake obmc-phosphor-image
>
> After the bitbake I am getting following errors:
>
> |     /home/basha/openbmc/meta-raspberrypi/recipes-kernel/linux/files/
> | DEBUG: Executing shell function do_kernel_metadata
> | ERROR: Feature 'phosphor-gpio-keys' not found, this will cause configuration failures.
> | ERROR: Check the SRC_URI for meta-data repositories or directories that may be missing
> | ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of '/home/basha/openbmc/build/tmp/work/raspberrypi3_64-openbmc-linux/linux-raspberrypi/1_5.4.69+gitAUTOINC+5d52d9eea9_31d364af25-r0/temp/run.do_kernel_metadata.118535' failed with exit code 1:
> | WARNING: exit code 1 from a shell command.
> |
> ERROR: Task (/home/basha/openbmc/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_kernel_metadata) failed with exit code '1'
> Waiting for 4 running tasks to finish:
>
>
> Also I have referred to the following issue "#2434
> <https://github.com/openbmc/openbmc/issues/2434>" and added
> KERNEL_FEATURES_remove = "phosphor-gpio-keys" to the local.conf file and
> recompiled using the above steps again.
> I did not get the above errors but the rpi-sdimg file was not generated in
> the following path.
>
>
> "build/tmp/deploy/images/raspberrypi3-64/obmc-phosphor-image-raspberrypi3-64-2020XXXXXXXXXX.rootfs.rpi-sdimg"
>
> Please let me know if there are any additional steps to be followed to run
> bitbake for raspberrypi-3 in order to generate the rpi-sdimg file.
>
> Thanks & Regards,
> Khader B Shaik
>

--0000000000002548c605b2540078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,<div><br></div><div>Any suggestions or input on th=
is please.</div><div><br></div><div>Thanks &amp; Regards,</div><div>Khader =
B Shaik<br><div><br></div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, 22 Oct 2020 at 13:54, khader basha =
shaik &lt;<a href=3D"mailto:shaikkhaderbasha601@gmail.com">shaikkhaderbasha=
601@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><p style=3D"box-sizing:border-box;margin-bott=
om:16px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&q=
uot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;=
,&quot;Segoe UI Emoji&quot;;font-size:14px;margin-top:0px">Hi Team,</p><p s=
tyle=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(3=
6,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,=
Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emo=
ji&quot;;font-size:14px">I am getting errors while running the bitbake for =
raspberrypi-3.<br style=3D"box-sizing:border-box">Following are the steps I=
 have followed to run the bitbake:</p><ol style=3D"box-sizing:border-box;pa=
dding-left:2em;margin-top:0px;margin-bottom:16px;color:rgb(36,41,46);font-f=
amily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial=
,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-s=
ize:14px"><li style=3D"box-sizing:border-box">Clonned the latest code from =
the master branch for openbmc repo.<br style=3D"box-sizing:border-box">2.TE=
MPLATECONF=3Dmeta-phosphor/conf . openbmc-env</li><li style=3D"box-sizing:b=
order-box;margin-top:0.25em">open the conf/local.conf file in the editor an=
d update to add the raspberrypi3-64<br style=3D"box-sizing:border-box">-MAC=
HINE ??=3D &quot;qemuarm&quot;<br style=3D"box-sizing:border-box">+MACHINE =
??=3D &quot;raspberrypi3-64&quot;</li></ol><p style=3D"box-sizing:border-bo=
x;margin-top:0px;margin-bottom:16px;color:rgb(36,41,46);font-family:-apple-=
system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&=
quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">4.o=
pen the conf/bblayers.conf file in the editor and add the following line<br=
 style=3D"box-sizing:border-box">/home/basha/openbmc/meta-phosphor \</p><ul=
 style=3D"box-sizing:border-box;padding-left:2em;margin-top:0px;margin-bott=
om:16px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&q=
uot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;=
,&quot;Segoe UI Emoji&quot;;font-size:14px"><li style=3D"box-sizing:border-=
box">/home/basha/openbmc/meta-raspberrypi \</li></ul><ol start=3D"5" style=
=3D"box-sizing:border-box;padding-left:2em;margin-top:0px;margin-bottom:16p=
x;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Se=
goe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot=
;Segoe UI Emoji&quot;;font-size:14px"><li style=3D"box-sizing:border-box">b=
itbake obmc-phosphor-image</li></ol><p style=3D"box-sizing:border-box;margi=
n-top:0px;margin-bottom:16px;color:rgb(36,41,46);font-family:-apple-system,=
BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Ap=
ple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">After the =
bitbake I am getting following errors:</p><pre style=3D"box-sizing:border-b=
ox;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,mo=
nospace;font-size:11.9px;margin-top:0px;margin-bottom:16px;padding:16px;ove=
rflow:auto;line-height:1.45;border-radius:6px;color:rgb(36,41,46)"><code st=
yle=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&quot;Libe=
ration Mono&quot;,Menlo,monospace;padding:0px;margin:0px;background:initial=
;border-radius:6px;word-break:normal;border:0px;display:inline;overflow:vis=
ible;line-height:inherit">|     /home/basha/openbmc/meta-raspberrypi/recipe=
s-kernel/linux/files/
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

--0000000000002548c605b2540078--
