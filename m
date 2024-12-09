Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB19E91F9
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2024 12:18:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6K930rq2z3bSr
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2024 22:17:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733743076;
	cv=none; b=MWiVGctkZw5yqbxPDaifdArUMzcziRtuU2sHkqkm0vavPsCPm9xWaekp6s551IKy9PyTdax9u220MmTVPj2PuVxBBifQM1XnQ4F7QX7y0fF/LZ77xfVZagH2kD37s0RD3vUVPB3xhaSsYKMM5fGsHKeDiR/mUVGGeMTbAIqxnWaaFObOpVFWdH1E5FlPuI5FnavHO3012ZM03Jv/6/dTiKbPn9J/fCejD40CIHCudCV958rgVnhPwK1SFfNqI6lXJlnqXCOLa7xtWtlu9cGHt3mCvBuB0eFDQ/sRYS3e8Jc1eEbjnn7pDDi3fkH/kiGHDYvuMNgHl0W+oaZkiwXmJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733743076; c=relaxed/relaxed;
	bh=AulmRPASwyBKqrODztayahxKoY+FFot/7axuFvN2qJI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Muc5I80iPLc/yPY2iNSpc1HNDPKdQC7oS4LPbHBItFbjQ/w1Xlep72d6T+zxXjhiumzdzpqy27YalN+sd0EsVIr2TLcWRdES5vN+lJ9YWDr1bmgsTWtMx9VspGt9Z5xcF/17gjrrjTi/jE68ng1PfIT9LNl93RlfmuVJXk6xxaBxBdwrjMVBnyrZqsNtdfp/ygPkZpFh8vrFq588udoB4hK6bqBHsvGs2OZrcFyAxpPlIJ0H2ldcsLgkMpz0E85atDakE7rb/KHuRNOVkwdtwxCfw1c72aFsiT02szc5NoZJ5//DsUnrlfj5EUpRF2cwophSqUCoih5yh0vlCbwjHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F1Te51Px; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F1Te51Px;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6K8y49Vyz2xGF
	for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2024 22:17:53 +1100 (AEDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5f1dfb0b44dso1022346eaf.2
        for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2024 03:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733743070; x=1734347870; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AulmRPASwyBKqrODztayahxKoY+FFot/7axuFvN2qJI=;
        b=F1Te51Px2SIm49/cBdIDFOIrDe8C+FX+eesXjLMDZEGqT0mMf2uPOgTUmNYACaUXg9
         SX4RpSVK7JjSiSjABmkLPjqhxsZuf9YCZ5x58sdt14edee0LNHmpdDMcZWEwa1xbJs+v
         2jXp4cI1tRaxCdn5Ekn8ZYWIareEPfpHbF846zRjdWQwt7ss2z5f3VdW+7PyIw/x1pAk
         bKviYdrWatp1tFwM/c2d4sfEhAlmYw0LQbE6k2Jil8z4mEYpvzhlC3cMs7qB0okGceC+
         WkN9shFXf6a9811vvMCgXdq+tZt/rZcg+0IATxQLOYzshAEinCbr5HXhtpoLh2Povbxk
         6nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733743070; x=1734347870;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AulmRPASwyBKqrODztayahxKoY+FFot/7axuFvN2qJI=;
        b=RQwtgl0JyNxN3EARBlLVw/7QzkE6lGg4pMXmdZ8rAj7KM2tMNakCZhGeeLkw/zz8Gy
         e5hNsTKcgpS1v1h+1K+i8NF5e1DsnqnLiV3AwcmaqEKXbvND0SL4ec/20yGLGu0/gs1d
         ZLp0qStWIsk8YQ8xORrtHaU1jsLCGMvmxEgQPElwlcHvfmRegAr/O9qHN+tHmtgU8W7u
         se809urD0Ckwa95VForia0f5EKokIPI2nfn2bH2IZTqOoa2hudaqOtDmVyyupF0CieVG
         7ngc6iETY0xRqe7l6G6qReqe65QPXR0wAeZgYJbCWQPrMpaTSu9bvdd+8AmeqB2rF5z4
         +PWw==
X-Gm-Message-State: AOJu0YyXZLzjo4DfTpPJCYZX71pCfIAkM42u2Kv9ubNX0WuCHfvPqrcC
	rQ3NrkPoAknwcJn/JIBEjfpQJDcAncO3Uc0FeWn51fdDjQ9MGISXLLuLBL17/94h7uJhlFgDQmv
	LqL45JOzVzFosBtcAchPWEutVYYoTL4CY
X-Gm-Gg: ASbGnctqPmHLp/NHc4AtP3ITrFuXOcAzURZBnGO4ctSQ//geJrn06HMT3CTEWbN03DN
	7rwSCdxRQwBdoQBNknIpFQXC6E9GJkdA=
X-Google-Smtp-Source: AGHT+IHMggJUK98dsplvDMvVeKUb1yOfBi9Niy7IgbFqsmW9EPt3hWOOUezyIcw5+Nu0sWxXKvq8NCZZGXg7Ob8W3u0=
X-Received: by 2002:a05:6870:788b:b0:29e:6f32:6d91 with SMTP id
 586e51a60fabf-29f736c0e6amr7263467fac.33.1733743069941; Mon, 09 Dec 2024
 03:17:49 -0800 (PST)
MIME-Version: 1.0
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Mon, 9 Dec 2024 16:47:38 +0530
Message-ID: <CACkAXSo87MHi-+A2ZWLijejAdxfK89suaZC+4AN=+UnwZr2afg@mail.gmail.com>
Subject: Standardizing Clang-Tidy Configuration Across OpenBMC Repositories
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d0d4f60628d48330"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

--000000000000d0d4f60628d48330
Content-Type: text/plain; charset="UTF-8"

*All,*

Some OpenBMC repositories are already using clang-tidy to ensure code
quality and adherence to coding standards. To further standardize this
practice, the OpenBMC CI infrastructure will now automatically verify code
quality during check-in if a .clang-tidy file is present in the
repository's root directory, enabling automatic validation.

As part of extending clang-tidy coverage and streamlining its enablement,
proposing the use of a common base configuration in all repositories.
Repository owners can then disable checks that are not required based on
their project needs

*Key Points:*

   - *Standard Configuration:* A reference .clang-tidy.[type] file is
   provided as a base template for all repositories. This template adheres to
   OpenBMC's standards and includes checks recommended by the clang-tidy
   documentation.
   - *Standardization:* All repositories start with the same base
   configuration, ensuring consistent coding standards and checks.
   - *Customization:* Maintainers can adjust the configuration to fit
   specific repository needs. Checks can be disabled by prefixing them with a
   '-'.
   - *C and C++ Checks:* The configuration includes checks for both C and
   C++ code, promoting best practices.
   - *Activation:* To activate clang-tidy, copy the base version file from
   <link>, rename it to .clang-tidy, and place it in the respective
   repository.

*Testing the Configuration:*

Utilizing the existing format-code.sh tool, the common configuration will
be applied and executed as part of CI if found in the root directory,
ensuring no files are modified after running it.

*In Progress:*

   - Updated clang-tidy Documentation:
   https://gerrit.openbmc.org/c/openbmc/docs/+/76369/
   - Published Initial Version of C++ Reference Configuration:
   https://gerrit.openbmc.org/c/openbmc/docs/+/76345/
   - Started Updating and Enabling Repositories with New Clang-Tidy Config
   File: See patch series :
   https://gerrit.openbmc.org/q/topic:%22clang-tidy-base%22
   - Added Commit to Fix Clang-Tidy Build Failures: Provided trivial fixes
   or disabled errors using clang pragmas. Also disabled all failing checks.

*Scope of Activity:*

The current activity focuses on enabling clang-tidy for all active
repositories and adding trivial fixes if required to establish the
clang-tidy base infrastructure. Once this update is completed, repository
owners can start enabling the disabled checks based on their project needs.

*Input Required:*

Looking for timely reviews and early feedback to finalize the process.

--000000000000d0d4f60628d48330
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin:0px 0px 1em;color:rgb(36,36,36);font-si=
ze:14px"><strong>All,</strong></p><p style=3D"margin:0px 0px 1em;color:rgb(=
36,36,36);font-size:14px">Some OpenBMC repositories are already using clang=
-tidy to ensure code quality and adherence to coding standards. To further =
standardize this practice, the OpenBMC CI infrastructure will now automatic=
ally verify code quality during check-in if a=C2=A0<code style=3D"overflow-=
wrap: break-word;">.clang-tidy</code>=C2=A0file is present in the repositor=
y&#39;s root directory, enabling automatic validation.</p><p style=3D"margi=
n:0px 0px 1em;color:rgb(36,36,36);font-size:14px">As part of extending clan=
g-tidy coverage and streamlining its enablement, proposing the use of a com=
mon base configuration in all repositories. Repository owners can then disa=
ble checks that are not required based on their project needs</p><p style=
=3D"margin:0px 0px 1em;color:rgb(36,36,36);font-size:14px"><strong>Key Poin=
ts:</strong></p><ul style=3D"margin-left:0px;padding-left:0px;margin-top:10=
px;margin-bottom:10px;color:rgb(36,36,36);font-size:14px"><li style=3D"list=
-style-type:disc;margin-left:20px"><strong>Standard Configuration:</strong>=
=C2=A0A reference=C2=A0<code style=3D"overflow-wrap: break-word;">.clang-ti=
dy.[type]</code>=C2=A0file is provided as a base template for all repositor=
ies. This template adheres to OpenBMC&#39;s standards and includes checks r=
ecommended by the clang-tidy documentation.</li><li style=3D"list-style-typ=
e:disc;margin-left:20px"><strong>Standardization:</strong>=C2=A0All reposit=
ories start with the same base configuration, ensuring consistent coding st=
andards and checks.</li><li style=3D"list-style-type:disc;margin-left:20px"=
><strong>Customization:</strong>=C2=A0Maintainers can adjust the configurat=
ion to fit specific repository needs. Checks can be disabled by prefixing t=
hem with a &#39;-&#39;.</li><li style=3D"list-style-type:disc;margin-left:2=
0px"><strong>C and C++ Checks:</strong>=C2=A0The configuration includes che=
cks for both C and C++ code, promoting best practices.</li><li style=3D"lis=
t-style-type:disc;margin-left:20px"><strong>Activation:</strong>=C2=A0To ac=
tivate clang-tidy, copy the base version file from=C2=A0<code style=3D"over=
flow-wrap: break-word;">&lt;link&gt;</code>, rename it to=C2=A0<code style=
=3D"overflow-wrap: break-word;">.clang-tidy</code>, and place it in the res=
pective repository.</li></ul><p style=3D"margin:0px 0px 1em;color:rgb(36,36=
,36);font-size:14px"><strong>Testing the Configuration:</strong></p><p styl=
e=3D"margin:0px 0px 1em;color:rgb(36,36,36);font-size:14px">Utilizing the e=
xisting=C2=A0<code style=3D"overflow-wrap: break-word;">format-code.sh</cod=
e>=C2=A0tool, the common configuration will be applied and executed as part=
 of CI if found in the root directory, ensuring no files are modified after=
 running it.</p><p style=3D"margin:0px 0px 1em;color:rgb(36,36,36);font-siz=
e:14px"><strong>In Progress:</strong></p><ul style=3D"margin-left:0px;paddi=
ng-left:0px;margin-top:10px;margin-bottom:10px;color:rgb(36,36,36);font-siz=
e:14px"><li style=3D"list-style-type:disc;margin-left:20px">Updated clang-t=
idy Documentation:=C2=A0=C2=A0<a href=3D"https://gerrit.openbmc.org/c/openb=
mc/docs/+/76369/">https://gerrit.openbmc.org/c/openbmc/docs/+/76369/</a></l=
i><li style=3D"list-style-type:disc;margin-left:20px">Published Initial Ver=
sion of C++ Reference Configuration:=C2=A0<a href=3D"https://gerrit.openbmc=
.org/c/openbmc/docs/+/76345/">https://gerrit.openbmc.org/c/openbmc/docs/+/7=
6345/</a></li><li style=3D"list-style-type:disc;margin-left:20px">Started U=
pdating and Enabling Repositories with New Clang-Tidy Config File: See patc=
h series :=C2=A0<a href=3D"https://gerrit.openbmc.org/q/topic:%22clang-tidy=
-base%22">https://gerrit.openbmc.org/q/topic:%22clang-tidy-base%22</a></li>=
<li style=3D"list-style-type:disc;margin-left:20px">Added Commit to Fix Cla=
ng-Tidy Build Failures: Provided trivial fixes or disabled errors using cla=
ng pragmas. Also disabled all failing checks.</li></ul><p style=3D"margin:0=
px 0px 1em;color:rgb(36,36,36);font-size:14px"><strong>Scope of Activity:</=
strong></p><p style=3D"margin:0px 0px 1em;color:rgb(36,36,36);font-size:14p=
x">The current activity focuses on enabling clang-tidy for all active repos=
itories and adding trivial fixes if required to establish the clang-tidy ba=
se infrastructure. Once this update is completed, repository owners can sta=
rt enabling the disabled checks based on their project needs.</p><p style=
=3D"margin:0px 0px 1em;color:rgb(36,36,36);font-size:14px"><strong>Input Re=
quired:</strong></p><p style=3D"margin:0px 0px 1em;color:rgb(36,36,36);font=
-size:14px">Looking for timely reviews and early feedback to finalize the p=
rocess.</p></div>

--000000000000d0d4f60628d48330--
