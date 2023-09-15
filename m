Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE87A1DA2
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 13:44:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xt3RpGXj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnC5B1Hdqz3cNc
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 21:43:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xt3RpGXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=bremenpl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnC4c5lwFz3c1C
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 21:43:27 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-502e7d66c1eso3023060e87.1
        for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 04:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694778201; x=1695383001; darn=lists.ozlabs.org;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ofg1ZkY5FfauDaN9KPOyFf2hi94NOIre0lAHeO6dWiw=;
        b=Xt3RpGXjWQ5vWkKZeqnJdexlKAk8QrDuNLLfiTKn/44+EXbJ757JV4V6Jn+apR63eZ
         XgHChvejZX4RXwh/gHdWJi/Cq7n9JLcnkn4uvHBVlIEoRJG7u+4up7mrFT5s3XM1QE0r
         PJbLDVeb/1F77+uBx3iLQbHogKDr34CuivmikjZMPX27AwBEhx3hfiq4W2d1AC6qRQgb
         Se4RUQAL7gJPymodmsF8owEHnpQbcN9dShEwtQS+9+X0ZkZinBXQgQzdedIRylsh0U4Z
         iaETgs5PoGgtWyPzgFpkkLsPp22VloUDKSGvuC2U8lDnnelP/YFfICX1hwNCkw+VTFZ1
         njng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694778201; x=1695383001;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofg1ZkY5FfauDaN9KPOyFf2hi94NOIre0lAHeO6dWiw=;
        b=fAiCPWuQkV/yzNvfcqF1ronvc/RyQ+33fBEMlZvk4pIR0/1iHHCzrYOqXM49OBQZLA
         z8mpeSrKH9ZXPfnwu/bsk/nT6Hx4U30i7CoUu1qc5SgSSdPNxW4+TbjRrZVM29Ymzp2t
         rGB8tAnfbj3Ap1ZXHLcHaX+hupXtt4qlcX33m1ByYFLyxyoqVwYo5SWM7odDj62uXSwh
         0DkhgpahD1//8kJYApfD7IwGzBQ15r92890WJS5kBLUugLFNtqVjrwGTuIIMTeJAWf4U
         nR1tr20ZV/H6ATp1fUMYcC1IRq0yIoYqrYCM2B0pgdsj+Yc8pX1C25GPRtxNVhi45zNy
         6xyA==
X-Gm-Message-State: AOJu0Yw0Wm2TVCw/JSnh/t0uUWIB9ybg3XlmoqOBHixzcf06ydMXWwOB
	B3EDMVJRjXpdNQst5+lDngZJN1fPIWQ=
X-Google-Smtp-Source: AGHT+IFaSlc1Q1FCMvB554qvXF9lhlngIhoRXKbRSSb/jf7CzwJ95caI718oShi5ZYBly/N5hcbOHA==
X-Received: by 2002:a05:6512:2149:b0:4fd:d002:ddad with SMTP id s9-20020a056512214900b004fdd002ddadmr1167360lfr.12.1694778200498;
        Fri, 15 Sep 2023 04:43:20 -0700 (PDT)
Received: from [192.168.7.127] (eot98.neoplus.adsl.tpnet.pl. [83.20.35.98])
        by smtp.gmail.com with ESMTPSA id n2-20020a195502000000b0050089b26eb0sm607542lfe.132.2023.09.15.04.43.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Sep 2023 04:43:19 -0700 (PDT)
From: Bremenpl <bremenpl@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Date: Fri, 15 Sep 2023 13:43:20 +0200
Message-ID: <18a98a70fc0.284e.a291efdfec6f8802d64589cd992131fb@gmail.com>
In-Reply-To: <ZQQds-_zQE4Ffo_u@heinlein.vulture-banana.ts.net>
References: <em80cca595-c4f5-47ec-a958-83a5c16e45c2@02cbb70a.com>
 <ZQQds-_zQE4Ffo_u@heinlein.vulture-banana.ts.net>
User-Agent: AquaMail/1.46.0 (build: 104600328)
Subject: Re: Support: OpenBMC build failed at bmcweb (commit: 029f4aada38f4b041b5a171c2e112a267cee3b7f)
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="18a98a71273742b284e9af1078"
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

This is a multi-part message in MIME format.
--18a98a71273742b284e9af1078
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Patrick,
Following your feedback, I started of with cutting the no of cores 
available to the VM by half (now a total of 8 instead of 16)- the build 
then succeded. Thank you very much for help.

I will update the gcc version now and rerun the build still.

On September 15, 2023 11:02:49 Patrick Williams <patrick@stwcx.xyz> wrote:

> On Fri, Sep 15, 2023 at 08:09:08AM +0000, Łukasz Przeniosło wrote:
>> Hello,
>> I am trying to build OpenBMC on an Ubuntu VM:
>>
>> lukasz@ce-lp:~/ce/openbmc/build/evb-ast2600$ uname -a
>> Linux ce-lp 6.2.0-32-generic #32-Ubuntu SMP PREEMPT_DYNAMIC Mon Aug 14
>> 10:03:50 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
>>
>> I have 16 total cores and 20 GB of RAM assigned to this VM. My target is
>> evb-ast2600. My build fails at bmcweb:
>>
>> | {standard input}: Assembler messages:
>> | {standard input}:8616216: Warning: end of file in string; '"' inserted
>> | arm-openbmc-linux-gnueabi-g++: fatal error: Killed signal terminated
>> program cc1plus
>> | compilation terminated.
>> | ninja: build stopped: subcommand failed.
>> | INFO: autodetecting backend as ninja
>> | INFO: calculating backend command to run:
>> /home/lukasz/ce/openbmc/build/evb-ast2600/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+e1bf8bb6a8/recipe-sysroot-native/usr/bin/ninja
>> -j 16 -v
>> | WARNING: exit code 1 from a shell command.
>> ERROR: Task
>> (/home/lukasz/ce/openbmc/meta-phosphor/recipes-phosphor/interfaces/bmcweb_git.bb:do_compile)
>> failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 5292 tasks of which 704 didn't need to be
>> rerun and 1 failed.
>>
>> Summary: 1 task failed:
>>
>> /home/lukasz/ce/openbmc/meta-phosphor/recipes-phosphor/interfaces/bmcweb_git.bb:do_compile
>> Summary: There were 2 WARNING messages.
>> Summary: There was 1 ERROR message, returning a non-zero exit code.
>>
>> Here is the complete output: https://pastebin.com/yGRDT477
>>
>> My gcc version:
>>
>> lukasz@ce-lp:~/ce/openbmc/build/evb-ast2600$ gcc --version
>> gcc (Ubuntu 12.3.0-1ubuntu1~23.04) 12.3.0
>>
>> Before building I have installed all necessary packages via:
>>
>> sudo apt install git python3-distutils gcc g++ make file wget gawk
>> diffstat bzip2 cpio chrpath zstd lz4 bzip2
>>
>> I cannot figure out what I am missing. I would appreciate all help and
>> support, thank you!
>>
>> --
>> Łukasz Przeniosło
>
> Two thoughts:
>
> 1. You should be using GCC-13 for our repositories now.
>
> 2. The symptoms of unexpected EOF from the assembler are generally an
>   indication that another GCC process failed due to the kernel OOM
>   killer.  You said you have 20GB of RAM, which is decent, but the
>   ratio of cores to RAM is barely above 1GB.  You might want to use
>   `ninja -j6` to limit the number of parallel jobs that Ninja kicks
>   off.
>
> (At this point you should probably `ninja clean` before retrying).
>
> --
> Patrick Williams


--18a98a71273742b284e9af1078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body style=3D"font-family: Arial, Myriad, 'Liberation Sans', sans-serif;">
<div dir=3D"auto">
<div dir=3D"auto">Hi Patrick,</div><div dir=3D"auto">Following your feedbac=
k, I started of with cutting the no of cores available to the VM by half (n=
ow a total of 8 instead of 16)- the build then succeded. Thank you very muc=
h for help.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I will updat=
e the gcc version now and rerun the build still.&nbsp;</div><div dir=3D"aut=
o"><br></div>
<div id=3D"aqm-original" style=3D"color: black; font-family: sans-serif;">
<div dir=3D"auto">On September 15, 2023 11:02:49 Patrick Williams &lt;patri=
ck@stwcx.xyz&gt; wrote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">On Fri, Sep 15, 2023 at 08:09:08AM +0000, =C5=81ukasz Prz=
enios=C5=82o wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">Hello,</div>
<div dir=3D"auto">I am trying to build OpenBMC on an Ubuntu VM:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">lukasz@ce-lp:~/ce/openbmc/build/evb-ast2600$ uname -a</di=
v>
<div dir=3D"auto">Linux ce-lp 6.2.0-32-generic #32-Ubuntu SMP PREEMPT_DYNAM=
IC Mon Aug 14&nbsp;</div>
<div dir=3D"auto">10:03:50 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I have 16 total cores and 20 GB of RAM assigned to this V=
M. My target is&nbsp;</div>
<div dir=3D"auto">evb-ast2600. My build fails at bmcweb:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">| {standard input}: Assembler messages:</div>
<div dir=3D"auto">| {standard input}:8616216: Warning: end of file in strin=
g; '"' inserted</div>
<div dir=3D"auto">| arm-openbmc-linux-gnueabi-g++: fatal error: Killed sign=
al terminated&nbsp;</div>
<div dir=3D"auto">program cc1plus</div>
<div dir=3D"auto">| compilation terminated.</div>
<div dir=3D"auto">| ninja: build stopped: subcommand failed.</div>
<div dir=3D"auto">| INFO: autodetecting backend as ninja</div>
<div dir=3D"auto">| INFO: calculating backend command to run:&nbsp;</div>
<div dir=3D"auto">/home/lukasz/ce/openbmc/build/evb-ast2600/tmp/work/armv7a=
hf-vfpv4d16-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+e1bf8bb6a8/recipe-s=
ysroot-native/usr/bin/ninja&nbsp;</div>
<div dir=3D"auto">-j 16 -v</div>
<div dir=3D"auto">| WARNING: exit code 1 from a shell command.</div>
<div dir=3D"auto">ERROR: Task&nbsp;</div>
<div dir=3D"auto">(/home/lukasz/ce/openbmc/meta-phosphor/recipes-phosphor/i=
nterfaces/bmcweb_git.bb:do_compile)&nbsp;</div>
<div dir=3D"auto">failed with exit code '1'</div>
<div dir=3D"auto">NOTE: Tasks Summary: Attempted 5292 tasks of which 704 di=
dn't need to be&nbsp;</div>
<div dir=3D"auto">rerun and 1 failed.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Summary: 1 task failed:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">/home/lukasz/ce/openbmc/meta-phosphor/recipes-phosphor/in=
terfaces/bmcweb_git.bb:do_compile</div>
<div dir=3D"auto">Summary: There were 2 WARNING messages.</div>
<div dir=3D"auto">Summary: There was 1 ERROR message, returning a non-zero =
exit code.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Here is the complete output: https://pastebin.com/yGRDT47=
7</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">My gcc version:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">lukasz@ce-lp:~/ce/openbmc/build/evb-ast2600$ gcc --versio=
n</div>
<div dir=3D"auto">gcc (Ubuntu 12.3.0-1ubuntu1~23.04) 12.3.0</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Before building I have installed all necessary packages v=
ia:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">sudo apt install git python3-distutils gcc g++ make file =
wget gawk&nbsp;</div>
<div dir=3D"auto">diffstat bzip2 cpio chrpath zstd lz4 bzip2</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I cannot figure out what I am missing. I would appreciate=
 all help and&nbsp;</div>
<div dir=3D"auto">support, thank you!</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">--</div>
<div dir=3D"auto">=C5=81ukasz Przenios=C5=82o</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Two thoughts:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">1. You should be using GCC-13 for our repositories now.</=
div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">2. The symptoms of unexpected EOF from the assembler are =
generally an</div>
<div dir=3D"auto">&nbsp; &nbsp;indication that another GCC process failed d=
ue to the kernel OOM</div>
<div dir=3D"auto">&nbsp; &nbsp;killer. &nbsp;You said you have 20GB of RAM,=
 which is decent, but the</div>
<div dir=3D"auto">&nbsp; &nbsp;ratio of cores to RAM is barely above 1GB. &=
nbsp;You might want to use</div>
<div dir=3D"auto">&nbsp; &nbsp;`ninja -j6` to limit the number of parallel =
jobs that Ninja kicks</div>
<div dir=3D"auto">&nbsp; &nbsp;off.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">(At this point you should probably `ninja clean` before r=
etrying).</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">Patrick Williams</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--18a98a71273742b284e9af1078--

