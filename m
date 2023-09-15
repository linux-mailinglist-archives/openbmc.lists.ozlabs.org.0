Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34E87A1803
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 10:09:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AaUYfygX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn6L53fhwz3cPF
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 18:09:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AaUYfygX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=bremenpl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn6KV6GXjz3bTC
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 18:09:18 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bfc8c02e82so26301511fa.0
        for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 01:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694765351; x=1695370151; darn=lists.ozlabs.org;
        h=mime-version:user-agent:reply-to:message-id:date:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7D1d7Afnhj/2KLljeVjndoIT761pKJUzvuNoCAffWw=;
        b=AaUYfygXWJTPmVwWWb/3MZU1fAPOdln7IuPh5mYB7qd0unvS1wDYuOYxS+1hH6Z9EB
         wZuJUxtjeqQPQp3cpmMuO2WZqVDhznDvaN0VKbXE1/4Eh6V8KXndtti4BERr4Bqu3TJB
         MP769i6QYv6VqC+33NiOErEfgybbuxa2Ydzjj4+9Uo1mm9x/3lTzKVzaLEN/IP0LvgFi
         5hKfZ4zUl3+52Cig5SpKxtE+MH0ueDjc7Yb6kMADHCa2Y/HPtesaUNfCwfCBEQlpv/zX
         JCOvHkoRX0jaqeqnR8Rg/3/JB2mnqlFIS4Ag7bLvbGxcYWFSJX6u5ZgatkeLMqx4U60+
         rfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694765351; x=1695370151;
        h=mime-version:user-agent:reply-to:message-id:date:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7D1d7Afnhj/2KLljeVjndoIT761pKJUzvuNoCAffWw=;
        b=Q6TTsdUSp5XF4kkgcSNJV/GpLV7eCde7Msvh5OUMBM8i2NhUNh9/K72whR+mGYCw3M
         IpAiEuSrCGdcyuhkbxiazjjJQ77pK2OdTSxMpL/Eo4oUSAw4av6k2B2W0prkQg/Ehe/P
         M6GQ7XrT8lz1hZIByXjKAHtVdeuqO9RoL7QJkNmq3kT9MQvqRe8QBRTKRMW63jVUEc0z
         rdV9fAFFyaRNcuAuCqvEbp0OYsU9wpLwOG3iu48npOcC1LHJXETRsKHGgsnx00ogNQNV
         /DMBAqeVLFkV37TnLvKE9hsMX4OVtlwbeGxlIaw6tw1sKXDDVmuOvy353UruNa2Fmqd7
         ogJw==
X-Gm-Message-State: AOJu0YzVO154r982wXmUHgqTG+ScU7d2nR4R6ph62T+rBgmhkshmccZr
	9V74fFdhz/9my4CRauvaY/s4AVi1IqA=
X-Google-Smtp-Source: AGHT+IG+VJ2Xy8gG/WYLa5zRZnyW9mr0w7DwB05iM8XTvnKFErfP8qOLuDu+P6h3DwzMWc7UrRkTng==
X-Received: by 2002:a2e:934d:0:b0:2bd:16e6:e34e with SMTP id m13-20020a2e934d000000b002bd16e6e34emr840372ljh.1.1694765350540;
        Fri, 15 Sep 2023 01:09:10 -0700 (PDT)
Received: from [192.168.7.144] (eot98.neoplus.adsl.tpnet.pl. [83.20.35.98])
        by smtp.gmail.com with ESMTPSA id c12-20020a2e680c000000b002bcdbfe36b9sm615634lja.111.2023.09.15.01.09.09
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Sep 2023 01:09:09 -0700 (PDT)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: Support: OpenBMC build failed at bmcweb (commit:
 029f4aada38f4b041b5a171c2e112a267cee3b7f)
Date: Fri, 15 Sep 2023 08:09:08 +0000
Message-Id: <em80cca595-c4f5-47ec-a958-83a5c16e45c2@02cbb70a.com>
User-Agent: eM_Client/9.2.2093.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------=_MB6E4D4510-9E66-4AD6-996B-52725294ED2A"
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
Reply-To: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------=_MB6E4D4510-9E66-4AD6-996B-52725294ED2A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,
I am trying to build OpenBMC on an Ubuntu VM:

lukasz@ce-lp:~/ce/openbmc/build/evb-ast2600$ uname -a
Linux ce-lp 6.2.0-32-generic #32-Ubuntu SMP PREEMPT_DYNAMIC Mon Aug 14=20
10:03:50 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

I have 16 total cores and 20 GB of RAM assigned to this VM. My target is=20
evb-ast2600. My build fails at bmcweb:

| {standard input}: Assembler messages:
| {standard input}:8616216: Warning: end of file in string; '"' inserted
| arm-openbmc-linux-gnueabi-g++: fatal error: Killed signal terminated=20
program cc1plus
| compilation terminated.
| ninja: build stopped: subcommand failed.
| INFO: autodetecting backend as ninja
| INFO: calculating backend command to run:=20
/home/lukasz/ce/openbmc/build/evb-ast2600/tmp/work/armv7ahf-vfpv4d16-openbm=
c-linux-gnueabi/bmcweb/1.0+gitAUTOINC+e1bf8bb6a8/recipe-sysroot-native/usr/=
bin/ninja=20
-j 16 -v
| WARNING: exit code 1 from a shell command.
ERROR: Task=20
(/home/lukasz/ce/openbmc/meta-phosphor/recipes-phosphor/interfaces/bmcweb_g=
it.bb:do_compile)=20
failed with exit code '1'
NOTE: Tasks Summary: Attempted 5292 tasks of which 704 didn't need to be=20
rerun and 1 failed.

Summary: 1 task failed:
  =20
/home/lukasz/ce/openbmc/meta-phosphor/recipes-phosphor/interfaces/bmcweb_gi=
t.bb:do_compile
Summary: There were 2 WARNING messages.
Summary: There was 1 ERROR message, returning a non-zero exit code.

Here is the complete output: https://pastebin.com/yGRDT477

My gcc version:

lukasz@ce-lp:~/ce/openbmc/build/evb-ast2600$ gcc --version
gcc (Ubuntu 12.3.0-1ubuntu1~23.04) 12.3.0

Before building I have installed all necessary packages via:

sudo apt install git python3-distutils gcc g++ make file wget gawk=20
diffstat bzip2 cpio chrpath zstd lz4 bzip2

I cannot figure out what I am missing. I would appreciate all help and=20
support, thank you!

--
=C5=81ukasz Przenios=C5=82o

--------=_MB6E4D4510-9E66-4AD6-996B-52725294ED2A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>

<style id=3D"css_styles">=20
blockquote.cite { margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: center; '], li[s=
tyle=3D'text-align: right;'], li[style=3D'text-align: right; '] {  list-sty=
le-position: inside;}
body { font-family: Verdana; font-size: 12pt; }
.quote { margin-left: 1em; margin-right: 1em; border-left: 5px #ebebeb soli=
d; padding-left: 0.3em; }

 </style>
</head>
<body><div>Hello,</div><div>I am trying to build OpenBMC on an Ubuntu VM:</=
div><div><br /></div><div><font face=3D"Courier New">lukasz@ce-lp:~/ce/open=
bmc/build/evb-ast2600$ uname -a
</font></div><div><font face=3D"Courier New">Linux ce-lp 6.2.0-32-generic #=
32-Ubuntu SMP PREEMPT_DYNAMIC Mon Aug 14 10:03:50 UTC 2023 x86_64 x86_64 x8=
6_64 GNU/Linux
</font></div><div><br /></div><div>I have 16 total cores and 20 GB of RAM a=
ssigned to this VM. My target is evb-ast2600. My build fails at bmcweb:</di=
v><div><br /></div><div><font face=3D"Courier New">
| {standard input}: Assembler messages:
</font></div><div><font face=3D"Courier New">| {standard input}:8616216: Wa=
rning: end of file in string; '"' inserted
</font></div><div><font face=3D"Courier New">| arm-openbmc-linux-gnueabi-g+=
+: fatal error: Killed signal terminated program cc1plus
</font></div><div><font face=3D"Courier New">| compilation terminated.
</font></div><div><font face=3D"Courier New">| ninja: build stopped: subcom=
mand failed.
</font></div><div><font face=3D"Courier New">| INFO: autodetecting backend=
 as ninja
</font></div><div><font face=3D"Courier New">| INFO: calculating backend co=
mmand to run: /home/lukasz/ce/openbmc/build/evb-ast2600/tmp/work/armv7ahf-v=
fpv4d16-openbmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+e1bf8bb6a8/recipe-sysro=
ot-native/usr/bin/ninja -j 16 -v
</font></div><div><font face=3D"Courier New">| WARNING: exit code 1 from a=
 shell command.
</font></div><div><font face=3D"Courier New"><b>ERROR: Task (/home/lukasz/c=
e/openbmc/meta-phosphor/recipes-phosphor/interfaces/bmcweb_git.bb:do_compil=
e) failed with exit code '1'
</b></font></div><div><font face=3D"Courier New"><b>NOTE: Tasks Summary: At=
tempted 5292 tasks of which 704 didn't need to be rerun and 1 failed.
</b></font></div><div><font face=3D"Courier New"><br /></font></div><div><f=
ont face=3D"Courier New">Summary: 1 task failed:
</font></div><div><font face=3D"Courier New">=C2=A0 /home/lukasz/ce/openbmc=
/meta-phosphor/recipes-phosphor/interfaces/bmcweb_git.bb:do_compile
</font></div><div><font face=3D"Courier New">Summary: There were 2 WARNING=
 messages.
</font></div><div><font face=3D"Courier New">Summary: There was 1 ERROR mes=
sage, returning a non-zero exit code.
</font></div><div><br /></div><div>Here is the complete output:=C2=A0<a hre=
f=3D"https://pastebin.com/yGRDT477" style=3D"font-size: 12pt;">https://past=
ebin.com/yGRDT477</a></div><div><br /></div><div>My gcc version:</div><div>=
<br /></div><div><font face=3D"Courier New">lukasz@ce-lp:~/ce/openbmc/build=
/evb-ast2600$ gcc --version
</font></div><div><font face=3D"Courier New">gcc (Ubuntu 12.3.0-1ubuntu1~23=
.04) 12.3.0
</font></div><div><br /></div><div>Before building I have installed all nec=
essary packages via:</div><div><br /></div><div><font face=3D"Courier New">=
sudo apt install git python3-distutils gcc g++ make file wget gawk diffstat =
bzip2 cpio chrpath zstd lz4 bzip2</font></div><div><br /></div><div>I cann=
ot figure out what I am missing. I would appreciate all help and support, t=
hank you!</div>
<div><br /></div><div id=3D"signature_old" style=3D"clear:both">--<div>=C5=
=81ukasz Przenios=C5=82o</div></div><div><br /></div>
</body></html>
--------=_MB6E4D4510-9E66-4AD6-996B-52725294ED2A--

