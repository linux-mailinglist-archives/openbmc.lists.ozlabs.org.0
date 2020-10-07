Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D372F286816
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 21:10:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C63nY4kfRzDqML
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 06:10:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=OKZYhdro; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C63mp19YJzDqBV
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 06:09:45 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id n6so3555061ioc.12
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 12:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vODZXbzfsV83HJilqqI3F9wEore/3DNrqHdnDr8yz0w=;
 b=OKZYhdronB/p25Geu7VmymrbvQEt8DGNFZJTGMVHvPqBYQu7GkbjtoiPUQ6P3Dy/Bc
 VBahplL5xpyS8HNusko+05rdMhz/x/8hq9No0yBUIxeT07ngxgEmB2GnGXfGxh2pDlyg
 cJ2CBezB4oUHgYsdXqDnWxZA9Qoxv7UEe5mKwc7l2pIgpZ/Gs/ODVzvApkylwwVEKB2i
 iH2W4MCuQn/RXo20uqkegWQhR3dTnpnw1/rzhI7yC57GnFyTVtTfkfOZ03KcUPFcqS4A
 pSndBO/4XTli2GPUmuyWxYL8hH51RlC1oR84Rt2ps9Z0Vb0MLEFWrySUkr9zQrR5Kw5+
 t8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vODZXbzfsV83HJilqqI3F9wEore/3DNrqHdnDr8yz0w=;
 b=WVDg7PhMjTJ2iMqiihAx62yb7z3RFOy9EcgMrc/xWl7VsGcLEhJav5QFQBNgrFpecp
 1KkCFwG0mQPTkl9kpSiQqS3KPsJtMo4tTzI7YB+q8GixocwZMmqIYDZcpbc1ew35CCUJ
 ABAaHTOfpnVbzPqLjCEM5kYdStG0ZkbvJuEHNp6buI0VeD5EJ4mRp6AtRFWi00RLDcPz
 foVqGzuiKCXGuPJWdCUPXmn/beqm3/T4R88MigF+qqgFb3D62R45gG8B+v5QV7Df9RnA
 +9ZJkh9YEcHMLBJ0DCZD6RaMrmlnHhdKRTAvTMdxMJFWsfmkvv1hA6N44nUNqhv8KTys
 tNIg==
X-Gm-Message-State: AOAM531NQAwtHHnYgxo46l4nG47yuRfNFoYXMVYlFJpqjJkDHgZQiwyw
 ld2iyzmpwt6Lq3cDPQS7/mTr8h1obyZx+lu5cllJ3VDfO2HMrUJE
X-Google-Smtp-Source: ABdhPJwv4u1AVbMKkwVeQ0HdGlXMgw03eI5u9Ddx93ye4xsU3ASPV+F9VpFzs3jGyT6BDCnbbUeJ2xV016Ng7GKn074=
X-Received: by 2002:a02:887:: with SMTP id 129mr4224050jac.130.1602097783246; 
 Wed, 07 Oct 2020 12:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB2883FCE193E758A89410FF3DFE0A0@HK0PR04MB2883.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2883FCE193E758A89410FF3DFE0A0@HK0PR04MB2883.apcprd04.prod.outlook.com>
From: Anton Kachalov <rnouse@google.com>
Date: Wed, 7 Oct 2020 21:09:32 +0200
Message-ID: <CADVsX8_C8eg2u-XKzU7xWJ7AHGznLZcJKWBb0dKOWctcwh=cwg@mail.gmail.com>
Subject: Re: About intel-ipmi-oem compilation error
To: =?UTF-8?B?5ZGoIOi/nOa4hQ==?= <zhouyuanqing8@outlook.com>
Content-Type: multipart/alternative; boundary="00000000000044757e05b119758d"
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
Cc: "uperic@163.com" <uperic@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000044757e05b119758d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

How old is your openbmc checkout, especially the phosphor-host-ipmid?

The requested field "lun" has been added three months ago:

https://github.com/openbmc/phosphor-host-ipmid/commit/c11cc5c06960d807bc0fe=
b680346bf6f8e9f8adb

From the build logs it seems like the existing headers doesn't include this
field.

On Wed, 7 Oct 2020 at 09:27, =E5=91=A8 =E8=BF=9C=E6=B8=85 <zhouyuanqing8@ou=
tlook.com> wrote:

> Hello everyone,
>
>       I downloaded intel-ipmi-oem from
> https://github.com/openbmc/intel-ipmi-oem, and encountered the following
> 2 problems when compiling. The first problem has been solved, but I think
> the code downloaded from the community should be able to compile and pass=
.
> I would like to ask if there is something wrong with my project
> configuration?
>
> Question1:
> In file included from
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/include/ipmi_to_red=
fish_hooks.hpp:20,
>
>                  from
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.=
cpp:20:
>
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/include/storagecomm=
ands.hpp:18:10:
> fatal error: phosphor-ipmi-host/sensorhandler.hpp: No such file or direct=
ory
>    18 | #include <phosphor-ipmi-host/sensorhandler.hpp>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
>
> Question2:
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/recipe-sysroot-native/u=
sr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++
>  -DBOOST_ALL_NO_LIB -DBOOST_ASIO_DISABLE_THREADS
> -DBOOST_COROUTINES_NO_DEPRECATION_WARNING -DBOOST_ERROR_CODE_HEADER_ONLY
> -DBOOST_NO_RTTI -DBOOST_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED
> -DUSING_ENTITY_MANAGER_DECORATORS -Dzinteloemcmds_EXPORTS
> -I/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linu=
x-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/include
> -isystem . -marm -mcpu=3Darm1176jz-s
>  --sysroot=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-o=
penbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/recipe-sys=
root
>  -O2 -pipe -g -feliminate-unused-debug-types
> -fmacro-prefix-map=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1=
176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0=3D=
/usr/src/debug/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0
>
>  -fdebug-prefix-map=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm=
1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0=
=3D/usr/src/debug/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0
>
>  -fdebug-prefix-map=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm=
1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/r=
ecipe-sysroot=3D
>
>  -fdebug-prefix-map=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm=
1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/r=
ecipe-sysroot-native=3D
>  -fvisibility-inlines-hidden  -marm -mcpu=3Darm1176jz-s
>  --sysroot=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-o=
penbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/recipe-sys=
root
> -fPIC   -Wno-psabi -std=3Dgnu++17 -MD -MT
> CMakeFiles/zinteloemcmds.dir/src/sensorcommands.cpp.o -MF
> CMakeFiles/zinteloemcmds.dir/src/sensorcommands.cpp.o.d -o
> CMakeFiles/zinteloemcmds.dir/src/sensorcommands.cpp.o -c
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.=
cpp
>
> In file included from
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.=
cpp:17:
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/include/sensorcomma=
nds.hpp:
> In function 'ipmi_ret_t ipmi::getSensorConnection(ipmi::Context::ptr,
> uint8_t, std::string&, std::string&)':
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/include/sensorcomma=
nds.hpp:138:42:
> error: 'using element_type =3D struct ipmi::Context' {aka 'struct
> ipmi::Context'} has no member named 'lun'
>   138 |     path =3D getPathFromSensorNumber((ctx->lun << 8) | sensnum);
>       |                                          ^~~
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.=
cpp:
> In function 'ipmi::RspType<unsigned char, unsigned char, unsigned int>
> ipmi::ipmiSensorGetDeviceSdrInfo(ipmi::Context::ptr, std::optional<unsign=
ed
> char>)':
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.=
cpp:1438:26:
> error: 'using element_type =3D struct ipmi::Context' {aka 'struct
> ipmi::Context'} has no member named 'lun'
>  1438 |                 if (ctx->lun =3D=3D record->key.owner_lun)
>       |                          ^~~
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.=
cpp:1448:19:
> error: 'using element_type =3D struct ipmi::Context' {aka 'struct
> ipmi::Context'} has no member named 'lun'
>  1448 |         if ((ctx->lun =3D=3D 0) && (numSensors > 0))
>       |                   ^~~
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.=
cpp:1453:24:
> error: 'using element_type =3D struct ipmi::Context' {aka 'struct
> ipmi::Context'} has no member named 'lun'
>  1453 |         else if ((ctx->lun =3D=3D 1) && (numSensors >
> maxSensorsPerLUN))
>       |                        ^~~
> /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.=
cpp:1459:23:
> error: 'using element_type =3D struct ipmi::Context' {aka 'struct
> ipmi::Context'} has no member named 'lun'
>  1459 |         else if (ctx->lun =3D=3D 3)
>       |                       ^~~
>
>
>

--00000000000044757e05b119758d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>How old is your openbmc checkout=
, especially the phosphor-host-ipmid?</div><div><br></div><div>The requeste=
d field &quot;lun&quot; has been added three months ago:</div><div><br></di=
v><div><a href=3D"https://github.com/openbmc/phosphor-host-ipmid/commit/c11=
cc5c06960d807bc0feb680346bf6f8e9f8adb">https://github.com/openbmc/phosphor-=
host-ipmid/commit/c11cc5c06960d807bc0feb680346bf6f8e9f8adb</a><br></div><di=
v><br></div><div>From the build logs it seems like the existing headers doe=
sn&#39;t include this field.</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, 7 Oct 2020 at 09:27, =E5=91=A8 =
=E8=BF=9C=E6=B8=85 &lt;<a href=3D"mailto:zhouyuanqing8@outlook.com">zhouyua=
nqing8@outlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hello everyone,=C2=A0</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 I downloaded intel-ipmi-oem from <a href=3D"https://gi=
thub.com/openbmc/intel-ipmi-oem" target=3D"_blank">https://github.com/openb=
mc/intel-ipmi-oem</a>, and encountered the following 2 problems when compil=
ing. The first problem has been solved, but I think the code downloaded fro=
m the community should be able to compile and pass.
 I would like to ask if there is something wrong with my project configurat=
ion?<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Question1:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
In file included from /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm11=
76jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git=
/include/ipmi_to_redfish_hooks.hpp:20,
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /ho=
me/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.cpp:2=
0:</div>
<div>/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-<span style=3D"color:rg=
b(81,167,249)">r0/git/include/storagecommands.hpp:18:10: fatal error: phosp=
hor-ipmi-host/sensorhandler.hpp:
 No such file or directory</span></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A0 =C2=A018 | #include &lt;p=
hosphor-ipmi-host/sensorhandler.hpp&gt;</span></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</span></d=
iv>
<div><span style=3D"color:rgb(81,167,249)">compilation terminated.</span></=
div>
<br>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;background-co=
lor:rgb(255,255,255);display:inline">Question2:</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;background-co=
lor:rgb(255,255,255);display:inline">/home/harleyzhou/openbmc/openbmc/build=
/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d7=
7489f18e-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-ope=
nbmc-linux-gnueabi-g++
 =C2=A0-DBOOST_ALL_NO_LIB -DBOOST_ASIO_DISABLE_THREADS -DBOOST_COROUTINES_N=
O_DEPRECATION_WARNING -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -DBOOS=
T_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -DUSING_ENTITY_MANAGER_DECORATORS =
-Dzinteloemcmds_EXPORTS -I/home/harleyzhou/openbmc/openbmc/build/tmp/work/a=
rm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0=
/git/include
 -isystem . -marm -mcpu=3Darm1176jz-s =C2=A0--sysroot=3D/home/harleyzhou/op=
enbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oe=
m/0.1+gitAUTOINC+d77489f18e-r0/recipe-sysroot =C2=A0-O2 -pipe -g -feliminat=
e-unused-debug-types -fmacro-prefix-map=3D/home/harleyzhou/openbmc/openbmc/=
build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOI=
NC+d77489f18e-r0=3D/usr/src/debug/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-=
r0
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-fdebug-prefix-map=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm=
1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0=
=3D/usr/src/debug/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-pref=
ix-map=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc=
-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/recipe-sysroot=
=3D
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-fdebug-prefix-map=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm=
1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/r=
ecipe-sysroot-native=3D =C2=A0-fvisibility-inlines-hidden =C2=A0-marm -mcpu=
=3Darm1176jz-s =C2=A0--sysroot=3D/home/harleyzhou/openbmc/openbmc/build/tmp=
/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489=
f18e-r0/recipe-sysroot
 -fPIC =C2=A0 -Wno-psabi -std=3Dgnu++17 -MD -MT CMakeFiles/zinteloemcmds.di=
r/src/sensorcommands.cpp.o -MF CMakeFiles/zinteloemcmds.dir/src/sensorcomma=
nds.cpp.o.d -o CMakeFiles/zinteloemcmds.dir/src/sensorcommands.cpp.o -c /ho=
me/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.cpp
<div>In file included from /home/harleyzhou/openbmc/openbmc/build/tmp/work/=
arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r=
0/git/src/sensorcommands.cpp:17:</div>
<div>/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/include/sensorco=
mmands.hpp: In function &#39;ipmi_ret_t ipmi::getSensorConnection(ipmi::Con=
text::ptr, uint8_t, std::string&amp;, std::string&amp;)&#39;:</div>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/include/sensorcommands.hpp:138:42: error: &#39;using =
element_type =3D struct ipmi::Context&#39;
 {aka &#39;struct ipmi::Context&#39;} has no member named &#39;lun&#39;</sp=
an></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A0 138 | =C2=A0 =C2=A0 path =
=3D getPathFromSensorNumber((ctx-&gt;lun &lt;&lt; 8) | sensnum);</span></di=
v>
<div><span style=3D"color:rgb(81,167,249)">=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~</span=
></div>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/src/sensorcommands.cpp: In function &#39;ipmi::RspTyp=
e&lt;unsigned char, unsigned char, unsigned
 int&gt; ipmi::ipmiSensorGetDeviceSdrInfo(ipmi::Context::ptr, std::optional=
&lt;unsigned char&gt;)&#39;:</span></div>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/src/sensorcommands.cpp:1438:26: error: &#39;using ele=
ment_type =3D struct ipmi::Context&#39;
 {aka &#39;struct ipmi::Context&#39;} has no member named &#39;lun&#39;</sp=
an></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A01438 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;lun =3D=3D record-&gt;ke=
y.owner_lun)</span></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~</span></div>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/src/sensorcommands.cpp:1448:19: error: &#39;using ele=
ment_type =3D struct ipmi::Context&#39;
 {aka &#39;struct ipmi::Context&#39;} has no member named &#39;lun&#39;</sp=
an></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A01448 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if ((ctx-&gt;lun =3D=3D 0) &amp;&amp; (numSensors &gt; 0))</span=
></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~</span></div>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/src/sensorcommands.cpp:1453:24: error: &#39;using ele=
ment_type =3D struct ipmi::Context&#39;
 {aka &#39;struct ipmi::Context&#39;} has no member named &#39;lun&#39;</sp=
an></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A01453 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else if ((ctx-&gt;lun =3D=3D 1) &amp;&amp; (numSensors &gt; maxS=
ensorsPerLUN))</span></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~</span></div>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/src/sensorcommands.cpp:1459:23: error: &#39;using ele=
ment_type =3D struct ipmi::Context&#39;
 {aka &#39;struct ipmi::Context&#39;} has no member named &#39;lun&#39;</sp=
an></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A01459 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else if (ctx-&gt;lun =3D=3D 3)</span></div>
<div><span style=3D"color:rgb(81,167,249)">=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~</=
span></div>
<br>
<br>
</span></div>
</div>

</blockquote></div>

--00000000000044757e05b119758d--
