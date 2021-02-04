Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F6A30F324
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 13:29:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWdCc4vJbzDrQP
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 23:29:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=vkrk.user@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PNg/AcAA; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWd9k2jNJzDrqd
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 23:27:52 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id a12so4292206lfb.1
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2021 04:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5VKVUp1JCqgCgyl+J8ygA1rCD6eUL6vis88h0XqiuZ0=;
 b=PNg/AcAAsGY58loSDVvbI65a9s1rPfrbu0IbFYexyNgMyGD7HQf+lTJJeOWCNJOZhT
 VN8TU7S9VKck4NuFgx8BsAtt/OB8rQx9UKE5BY2eRpk3kHoFOgmks3YB1vs88aJcsSE1
 DoO2P9k8zP8PIqcOXfghBkyosZ/qn9Mme6YVCgoCKzzsJPfyIFe91iu0Bbdky4g7+Pzp
 EIGKYYUigThHADEsXyrsBQyIzFASUsXQLBaRTNlFioq7HVWTPYxdIJA72vs7ajUTkS09
 ZQsxeutP+GovQAb/3BXgKoE2Ze+Knvpfdnpu3Nwp5MeFSjL9fc5tXpRLSseyO9xY4n0Z
 uvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5VKVUp1JCqgCgyl+J8ygA1rCD6eUL6vis88h0XqiuZ0=;
 b=S5hRAgDDC6OyKmK8q+Cb+GzJnpULDIq13xNUFURNRq/mqOZZtVsq3u5fZrd9whrIjN
 aOrDqewTrirpbYkZkyJsemjHWJCpwgeUTg1vhzfuCQf20Nle2P/vwviGmU14ML3l0YwI
 rt6FPRz357INNdY4GsAgJaygfX8DHRGBTP6h06xm01THRxjAKjsbgtclRy31a4XQlJ8c
 hHuS7mxJ/K5qPjAMQ7w5BNHLxbedTIOU+iodq+vnle34K+JQ5edpOfQBxq8niRwFDNMC
 CU+6wRg8rfNMAbZ6LHMljpcZASYv7ProgSMwx6+ClggQjMGi5R09d8HuojoKCfR1iCXr
 KDig==
X-Gm-Message-State: AOAM531jbX3mNzjYVtKIvk1MT5lGn2lQI3pKDbb2S+4o9d5nDWRuWN7Y
 w+WX+PPkkAI/EEcnZ42XJn18LLX0B+pObuY5NtLE/Z3EXbIK+w==
X-Google-Smtp-Source: ABdhPJyLjVTsRxpAYzzASwAAoPvJwtN1CZVGIji3xTsJrngNPffuoTyTpzcOetYhHWSh81TamDEHt6IwT3PRqZcUG08=
X-Received: by 2002:a19:220b:: with SMTP id i11mr4623232lfi.128.1612441667266; 
 Thu, 04 Feb 2021 04:27:47 -0800 (PST)
MIME-Version: 1.0
From: VINOTHKUMAR RK <vkrk.user@gmail.com>
Date: Thu, 4 Feb 2021 17:57:36 +0530
Message-ID: <CAHf5csd1tt-VNS9Wfuwqito2Fy75bfhArAEhZP_d1LXeOz+YVA@mail.gmail.com>
Subject: evb-ast2600: Getting some build errors - 'u-boot.bin' is too large!'
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000cc6e5805ba81d445"
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

--000000000000cc6e5805ba81d445
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying to build for evb-ast2600 platform, but it doesn't succeed.
Please help.

Build command: (fresh checkout and build)
TEMPLATECONF=meta-evb/meta-evb-aspeed/meta-evb-ast2600/conf . openbmc-env
bitbake obmc-phosphor-image

Branch details:
commit 7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f


Error Log:
Loading cache: 100% |

                                      | ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100%
|########################################################################################################################################################################|
Time: 0:00:44
Parsing of 2424 .bb files complete (0 cached, 2424 parsed). 3683 targets,
362 skipped, 0 masked, 0 errors.
WARNING: No bb files in default matched BBFILE_PATTERN_meta-evb-ast2600
'^/home/vinoth/project/openbmc/meta-evb/meta-evb-aspeed/meta-evb-ast2600/'
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-20.04"
TARGET_SYS           = "arm-openbmc-linux-gnueabi"
MACHINE              = "evb-ast2600"
DISTRO               = "openbmc-phosphor"
DISTRO_VERSION       = "0.1.0"
TUNE_FEATURES        = "arm armv7a vfp vfpv4d16 callconvention-hard"
TARGET_FPU           = "hard"
meta
meta-poky
meta-oe
meta-networking
meta-python
meta-phosphor
meta-aspeed
meta-evb-ast2600     = "master:7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f"

Initialising tasks: 100%
|#####################################################################################################################################################################|
Time: 0:00:03
Sstate summary: Wanted 1378 Found 939 Missed 439 Current 0 (68% match, 0%
complete)
NOTE: Executing Tasks
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
Feature 'phosphor-gpio-keys' not found, but
KERNEL_DANGLING_FEATURES_WARN_ONLY is set
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
This may cause runtime issues, dropping feature and allowing configuration
to continue
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
Feature 'phosphor-vlan' not found, but KERNEL_DANGLING_FEATURES_WARN_ONLY
is set
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata:
This may cause runtime issues, dropping feature and allowing configuration
to continue
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
Feature 'phosphor-gpio-keys' not found, but
KERNEL_DANGLING_FEATURES_WARN_ONLY is set
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
This may cause runtime issues, dropping feature and allowing configuration
to continue
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
Feature 'phosphor-vlan' not found, but KERNEL_DANGLING_FEATURES_WARN_ONLY
is set
WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme:
This may cause runtime issues, dropping feature and allowing configuration
to continue
WARNING: obmc-phosphor-sysd-1.0-r1 do_package_qa: QA Issue:
obmc-phosphor-sysd: SRC_URI uses PN not BPN [src-uri-bad]
ERROR: obmc-phosphor-image-1.0-r0 do_generate_static: Image
'/home/vinoth/project/openbmc/build/tmp/deploy/images/evb-ast2600/u-boot.bin'
is too large!
ERROR: Logfile of failure stored in:
/home/vinoth/project/openbmc/build/tmp/work/evb_ast2600-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_generate_static.2176796
ERROR: Task
(/home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_generate_static)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 4041 tasks of which 2680 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

/home/vinoth/project/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
do_generate_static
Summary: There were 10 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.



Regards,
VINOTHKUMAR RK

--000000000000cc6e5805ba81d445
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to build for evb-ast=
2600 platform, but it doesn&#39;t succeed. Please help.</div><div><br></div=
><div>Build command: (fresh checkout and build)</div><div>TEMPLATECONF=3Dme=
ta-evb/meta-evb-aspeed/meta-evb-ast2600/conf . openbmc-env<br>bitbake obmc-=
phosphor-image<br></div><div><br></div><div>Branch details:</div><div>commi=
t 7dc2f7a38dccb3d87a9b79d0a66b25da1027a72f=C2=A0<br></div><div><br></div><d=
iv><br></div><div>Error Log:</div><div>Loading cache: 100% | =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA: =C2=A0--=
:--:--<br>Loaded 0 entries from dependency cache.<br>Parsing recipes: 100% =
|##########################################################################=
###########################################################################=
###################| Time: 0:00:44<br>Parsing of 2424 .bb files complete (0=
 cached, 2424 parsed). 3683 targets, 362 skipped, 0 masked, 0 errors.<br>WA=
RNING: No bb files in default matched BBFILE_PATTERN_meta-evb-ast2600 &#39;=
^/home/vinoth/project/openbmc/meta-evb/meta-evb-aspeed/meta-evb-ast2600/&#3=
9;<br>NOTE: Resolving any missing task queue dependencies<br><br>Build Conf=
iguration:<br>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.49.=
0&quot;<br>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86=
_64-linux&quot;<br>NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D &quot;ubuntu-20.=
04&quot;<br>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-ope=
nbmc-linux-gnueabi&quot;<br>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;evb-ast2600&quot;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;openbmc-phosphor&quot;<br>DISTRO_VERSION =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;0.1.0&quot;<br>TUNE_FEATURES =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;arm armv7a vfp vfpv4d16 callconvention-hard&quot;<br=
>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;hard&quot;<br>meta=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>meta-poky =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-networking =C2=A0 =C2=A0 =C2=A0<br>meta-py=
thon =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-phosphor =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>meta-aspeed =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-evb-as=
t2600 =C2=A0 =C2=A0 =3D &quot;master:7dc2f7a38dccb3d87a9b79d0a66b25da1027a7=
2f&quot;<br><br>Initialising tasks: 100% |#################################=
###########################################################################=
#########################################################| Time: 0:00:03<br=
>Sstate summary: Wanted 1378 Found 939 Missed 439 Current 0 (68% match, 0% =
complete)<br>NOTE: Executing Tasks<br>WARNING: linux-aspeed-5.8.17+gitAUTOI=
NC+3cc95ae407-r0 do_kernel_metadata: Feature &#39;phosphor-gpio-keys&#39; n=
ot found, but KERNEL_DANGLING_FEATURES_WARN_ONLY is set<br>WARNING: linux-a=
speed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata: This may cause ru=
ntime issues, dropping feature and allowing configuration to continue<br>WA=
RNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_metadata: Fea=
ture &#39;phosphor-vlan&#39; not found, but KERNEL_DANGLING_FEATURES_WARN_O=
NLY is set<br>WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kern=
el_metadata: This may cause runtime issues, dropping feature and allowing c=
onfiguration to continue<br>WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae=
407-r0 do_kernel_configme: Feature &#39;phosphor-gpio-keys&#39; not found, =
but KERNEL_DANGLING_FEATURES_WARN_ONLY is set<br>WARNING: linux-aspeed-5.8.=
17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme: This may cause runtime issu=
es, dropping feature and allowing configuration to continue<br>WARNING: lin=
ux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configme: Feature &#39;=
phosphor-vlan&#39; not found, but KERNEL_DANGLING_FEATURES_WARN_ONLY is set=
<br>WARNING: linux-aspeed-5.8.17+gitAUTOINC+3cc95ae407-r0 do_kernel_configm=
e: This may cause runtime issues, dropping feature and allowing configurati=
on to continue<br>WARNING: obmc-phosphor-sysd-1.0-r1 do_package_qa: QA Issu=
e: obmc-phosphor-sysd: SRC_URI uses PN not BPN [src-uri-bad]<br>ERROR: obmc=
-phosphor-image-1.0-r0 do_generate_static: Image &#39;/home/vinoth/project/=
openbmc/build/tmp/deploy/images/evb-ast2600/u-boot.bin&#39; is too large!<b=
r>ERROR: Logfile of failure stored in: /home/vinoth/project/openbmc/build/t=
mp/work/evb_ast2600-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/l=
og.do_generate_static.2176796<br>ERROR: Task (/home/vinoth/project/openbmc/=
meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_generate_st=
atic) failed with exit code &#39;1&#39;<br>NOTE: Tasks Summary: Attempted 4=
041 tasks of which 2680 didn&#39;t need to be rerun and 1 failed.<br><br>Su=
mmary: 1 task failed:<br>=C2=A0 /home/vinoth/project/openbmc/meta-phosphor/=
recipes-phosphor/images/obmc-phosphor-image.bb:do_generate_static<br>Summar=
y: There were 10 WARNING messages shown.<br>Summary: There was 1 ERROR mess=
age shown, returning a non-zero exit code.<br></div><div><br></div><div><br=
></div><div><br></div><div>Regards,</div><div>VINOTHKUMAR RK</div></div>

--000000000000cc6e5805ba81d445--
