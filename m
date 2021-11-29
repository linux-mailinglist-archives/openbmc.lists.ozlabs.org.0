Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E1A461CCC
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 18:34:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2stR0Gdmz3062
	for <lists+openbmc@lfdr.de>; Tue, 30 Nov 2021 04:34:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=C3sE39/+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42f;
 helo=mail-wr1-x42f.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=C3sE39/+; dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2st226tsz2ymP
 for <openbmc@lists.ozlabs.org>; Tue, 30 Nov 2021 04:34:32 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id i5so38541011wrb.2
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 09:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Te7dfqCwbHqpHzw9TVhKbegVEB87iaLPApK/hAGzSDY=;
 b=C3sE39/+yZupVn2uNn4BZ2eTVyyaYOAQUPG3nZOu6L97dnL508KP4PdyYRoXDdNqhC
 5ACKH/wJQ+2Alwfgb0qCTBfbbVvFwuTElJw7WaHpJu2oKWIanFsTDLgZSHdGSMj11FJR
 LcIRih52hguC3kb4Ub8X56sk8nE5blOAmMuxmFAdjPgkAQORirZcTSwFA2MTLnz67kot
 vdWkMskHBaIRJ/fmQB2Q8/WirGWWrvwq8clAUJ1Zf6V8ThqMAIK8SbpEC30QhGGeelYL
 3q8P8yIoZBFoUYGeO5cUHbv9ucLUujn0E3Xa2IpmOI54MMaMigRC2qCF6bzfMuh++TrF
 ru9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Te7dfqCwbHqpHzw9TVhKbegVEB87iaLPApK/hAGzSDY=;
 b=2AlSVIU6pde/rhjvV4tleF1XRTlYwbZGGikhlIIQn6QZK6DnnKVU3YfRwJ9f2+mU9V
 OIEh8hlK65Htrqs81yzLMTaU0Cvsv7qTJ0fvce3r12K2XfGh8Y+oo/BpLxYWz/XpLFTk
 zdg+avPgkvxM+UJ1gKSgD3Z1k7JbSL3zZXYBdcZXhkDyozVonRV9j7gYrqWHEp6xjtPJ
 RAn6OPepOGZfQCpxJihUEo5FXHSxrOLsqtxmLSVJSZsUixiIIqEUvhyTYZuKbkyWNeSm
 lD+D/Wh7yhyX18DyggHeQqb2FeDEIPcVlwd3gmAYcp72xXstT3u9dgwbyXFu4giFMNqw
 ZXXA==
X-Gm-Message-State: AOAM530H7rme0/e2aG62sHwtHTm48aKiZ5bql1NsCN1H0WwznUPyYK/I
 lpbUjZKVXFvSZEzLsvMm07tx+6Yyk8zXGh1pEP3MZSTrFAojXg==
X-Google-Smtp-Source: ABdhPJzXAuSBhWMAwBQ7fnUbD/Yl/HSzlsSpXguGjm8XuDgktUBKeoRt1LhJU5t39IHDpjEWL2mj2h57XzutZUoqpmg=
X-Received: by 2002:adf:cd02:: with SMTP id w2mr36171014wrm.269.1638207265186; 
 Mon, 29 Nov 2021 09:34:25 -0800 (PST)
MIME-Version: 1.0
References: <DF4PR8401MB09557853DD75C419B6748824D8629@DF4PR8401MB0955.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <DF4PR8401MB09557853DD75C419B6748824D8629@DF4PR8401MB0955.NAMPRD84.PROD.OUTLOOK.COM>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 29 Nov 2021 09:34:13 -0800
Message-ID: <CAH2-KxDmuQk6tv5uBJZNFTfFugkE=3Rw78EKGPsvhoNwKa2gzw@mail.gmail.com>
Subject: Re: Romulus Build error in phosphor-webui
To: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Nov 28, 2021 at 8:56 PM Muggeridge, Matt
<matt.muggeridge2@hpe.com> wrote:
>
> I have not been able to resolve this build error. I=E2=80=99ll be gratefu=
l for any suggestions.
>
>
>
> As an aside: how do I create an openbmc shell environment that is identic=
al to what the build uses? If I could do that, then I may be able to triage=
 further.

bitbake -c devshell phosphor-webui

>
>
>
> Here are the details of the build failure=E2=80=A6

Unfortunately, the webui was one things that made it possible to break
the reproducibility of the yocto environment (ie, they rely on your
host systems npm storage) and that seems to be the failure you're
getting here.  Ideally, there would be some yocto machinery to help
with this and make this more reliable, but it didn't really exist when
we first ported the UI to the bmc years ago.  Supposedly there have
been significant improvements to the npm.bbclass in upstream yocto, so
it's possible that it's capable of doing what we need these days, but
I don't think anyone has looked into it.

>
>
>
> $ lsb_release -a
>
> No LSB modules are available.
>
> Distributor ID: Ubuntu
>
> Description:    Ubuntu 20.04.2 LTS
>
> Release:        20.04
>
> Codename:       focal
>
>
>
> Building from a fresh clone:
>
>
>
> git clone https://github.com/openbmc/openbmc.git
>
> cd openbmc
>
> . setup romulus
>
> bitbake obmc-phosphor-image
>
> :
>
> Eventually an ERROR occurs
>
> :
>
> ERROR: phosphor-webui-1.0+gitAUTOINC+f59274e8ec-r1 do_compile: ExecutionE=
rror('/sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-linux/phosphor-=
webui/1.0+gitAUTOINC+f59274e8ec-r1/temp/run.do_compile.255021', 1, None, No=
ne)
>
> ERROR: Logfile of failure stored in: /sbox/user/openbmc/build/romulus/tmp=
/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/temp/lo=
g.do_compile.255021
>
>
>
> An error log is created under my ~/.npm directory (which seems like an od=
d location for it):
>
>
>
> 12516 error Error while executing:
>
> 12516 error /sbox/user/openbmc/build/romulus/tmp/hosttools/git ls-remote =
-h -t https://github.com/novnc/noVNC.git
>
> 12516 error fatal: unable to access 'https://github.com/novnc/noVNC.git/'=
: gnutls_handshake() failed: Access was denied
>
>
>
> Though, I can successfully run that command from the shell.
>
>
>
> Some google research suggests it could be related to the version of TLS t=
hat Git is using (https://stackoverflow.com/a/60292604/7010982) and that it=
 needs TLS v1.2. However, it seems I=E2=80=99m using supported versions
> (https://stackoverflow.com/a/53604947/7010982):
>
>
>
> $ ldd $(which "$(git --exec-path)"/git-http-push) | grep gnutls
>
>         libcurl-gnutls.so.4 =3D> /lib/x86_64-linux-gnu/libcurl-gnutls.so.=
4 (0x00007fdf47f21000)
>
>         libgnutls.so.30 =3D> /lib/x86_64-linux-gnu/libgnutls.so.30 (0x000=
07fdf47933000)
>
>
> $ curl --version
>
> curl 7.68.0 (x86_64-pc-linux-gnu) libcurl/7.68.0 OpenSSL/1.1.1f zlib/1.2.=
11 brotli/1.0.7 libidn2/2.2.0 libpsl/0.21.0 (+libidn2/2.2.0) libssh/0.9.3/o=
penssl/zlib nghttp2/1.40.0 librtmp/2.3
>
> Release-Date: 2020-01-08
>
> Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop=
3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp
>
> Features: AsynchDNS brotli GSS-API HTTP2 HTTPS-proxy IDN IPv6 Kerberos La=
rgefile libz NTLM NTLM_WB PSL SPNEGO SSL TLS-SRP UnixSockets
>
>
>
>
>
> Here=E2=80=99s more of the log=E2=80=A6
>
> 12510 verbose stack Error: exited with error code: 128
>
> 12510 verbose stack     at ChildProcess.<anonymous> (/sbox/user/openbmc/b=
uild/romulus/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f5927=
4e8ec-r1/recipe-sysroot-native/usr/lib/node_modules/npm/node_modules/pacote=
/lib/util/finished.js:12:19)
>
> 12510 verbose stack     at ChildProcess.emit (events.js:375:28)
>
> 12510 verbose stack     at maybeClose (internal/child_process.js:1055:16)
>
> 12510 verbose stack     at Socket.<anonymous> (internal/child_process.js:=
441:11)
>
> 12510 verbose stack     at Socket.emit (events.js:375:28)
>
> 12510 verbose stack     at Pipe.<anonymous> (net.js:675:12)
>
> 12511 verbose cwd /sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-l=
inux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/git
>
> 12512 verbose Linux 5.4.0-84-generic
>
> 12513 verbose argv "/sbox/user/openbmc/build/romulus/tmp/work/all-openbmc=
-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/recipe-sysroot-native/us=
r/bin/node" "/sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-linux/ph=
osphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/recipe-sysroot-native/usr/bin/npm=
" "--loglevel" "info" "--proxy=3Dhttp://proxy:8080" "--https-proxy=3Dhttp:/=
/proxy:8080" "install"
>
> 12514 verbose node v14.17.1
>
> 12515 verbose npm  v6.14.13
>
> 12516 error Error while executing:
>
> 12516 error /sbox/user/openbmc/build/romulus/tmp/hosttools/git ls-remote =
-h -t https://github.com/novnc/noVNC.git
>
> 12516 error
>
> 12516 error fatal: unable to access 'https://github.com/novnc/noVNC.git/'=
: gnutls_handshake() failed: Access was denied
>
> 12516 error
>
> 12516 error exited with error code: 128
>
> 12517 verbose exit [ 1, true ]
>
>
>
>
>
>
>
>
>
> Contents of: log.do_compile.255021
>
>
>
>
>
> DEBUG: Executing shell function do_compile
>
> npm info it worked if it ends with ok
>
> npm info using npm@6.14.13
>
> npm info using node@v14.17.1
>
> npm info lifecycle phosphor-webui@2.8.0-dev~preinstall: phosphor-webui@2.=
8.0-dev
>
> npm timing stage:loadCurrentTree Completed in 41ms
>
> npm timing stage:loadIdealTree:cloneCurrentTree Completed in 1ms
>
> npm timing stage:loadIdealTree:loadShrinkwrap Completed in 1275ms
>
> npm timing stage:loadIdealTree:loadAllDepsIntoIdealTree Completed in 3285=
ms
>
> npm timing stage:loadIdealTree Completed in 5545ms
>
> npm timing stage:generateActionsToTake Completed in 1045ms
>
> npm timing audit submit Completed in 1366ms
>
> npm http fetch POST 200 https://registry.npmjs.org/-/npm/v1/security/audi=
ts/quick 1766ms
>
> npm timing audit body Completed in 411ms
>
> npm timing action:extract Completed in 2048ms
>
> npm WARN tar ENOENT: no such file or directory, open '/sbox/user/openbmc/=
build/romulus/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f592=
74e8ec-r1/git/node_modules/.staging/pump-64d8e380/package.json'
>
> npm WARN tar ENOENT: no such file or directory, open '/sbox/user/openbmc/=
build/romulus/tmp/work/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f592=
74e8ec-r1/git/node_modules/.staging/os-locale-6fd88320/package.json
>
> :
>
> Lots of lines similar to the previous
>
> :
>
> npm timing stage:rollbackFailedOptional Completed in 1ms
>
> npm timing stage:runTopLevelLifecycles Completed in 13501ms
>
> npm ERR! Error while executing:
>
> npm ERR! /sbox/user/openbmc/build/romulus/tmp/hosttools/git ls-remote -h =
-t https://github.com/novnc/noVNC.git
>
> npm ERR!
>
> npm ERR! fatal: unable to access 'https://github.com/novnc/noVNC.git/': g=
nutls_handshake() failed: Access was denied
>
> npm ERR!
>
> npm ERR! exited with error code: 128
>
> npm timing npm Completed in 15630ms
>
>
>
> npm ERR! A complete log of this run can be found in:
>
> npm ERR!     /home/user/.npm/_logs/2021-11-25T03_04_36_251Z-debug.log
>
> WARNING: /sbox/user/openbmc/build/romulus/tmp/work/all-openbmc-linux/phos=
phor-webui/1.0+gitAUTOINC+f59274e8ec-r1/temp/run.do_compile.3665580:143 exi=
t 1 from 'npm --loglevel info --proxy=3Dhttp://proxy:8080 --https-proxy=3Dh=
ttp://proxy:8080 install'
>
> WARNING: Backtrace (BB generated script):
>
>                 #1: do_compile, /sbox/user/openbmc/build/romulus/tmp/work=
/all-openbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/temp/run.do_=
compile.3665580, line 143
>
>                 #2: main, /sbox/user/openbmc/build/romulus/tmp/work/all-o=
penbmc-linux/phosphor-webui/1.0+gitAUTOINC+f59274e8ec-r1/temp/run.do_compil=
e.3665580, line 148
