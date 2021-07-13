Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0746A3C7A5F
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 02:03:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPd4d6ZFcz309X
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 10:03:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EuXmdL5R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=mthakurcse@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EuXmdL5R; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPPJX04jKz303f
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 01:12:43 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id t17so50937117lfq.0
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 08:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RrBr2AZGGbVaatsQCvSbAtboHaG+eBcme70cBvabJTY=;
 b=EuXmdL5Rqdwa3l5cyD6apO+shnpFK1u2AI2OOKFH5W+c5yrR6C9fAicWXh6eYLvFby
 oGr27uIjVnfZS1p2Bz1PbfTl71Q3O5l4WiaJ6W7YTo5DywZOIkuyxuWrJANV0orKfu+e
 HzXKna0TVmpFt2R0c8QJBLaVSdnFp2S3AiLFPBSrv+huZ9jiYDutZcCor34Jw3ubke8v
 semmP0TzI2aT7izVKllfpiRA1rG5TjyW9SGCC8MdYD5yN7NemLbwEoJ6nZ2IsWBExf9j
 A/vmcp0HMIgfd5KcCuZ1vqAC6l0QlF2azju8qUMgjJYSmT1OpBsnNZAS4WHocLM0Zs1U
 Br2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RrBr2AZGGbVaatsQCvSbAtboHaG+eBcme70cBvabJTY=;
 b=E65jjwTaNqcgjPwaP1vHfmCP1dOr4+/CEC/zlNOaHjQdSIoZi2oNWhLfZRFp7Vs6Ur
 Yr0o50QoGSq1aFezszpZugo0p3mKn09x1WwinVfQxVfxqgm6WFXcK9aB/WfZ1oZX2YB2
 2BtauqXaQhVwN7Y9z4/2iqJdpF1yThE6JkBIXlWKmiQ+BLjFtq6SYGJuPuoyNRqF0P7e
 V9kjylYImoUifwTG2AiuIez5onupcRJKZjkpRZarh4YY2MGdXOHJL5pWZaM4Se5fq2FY
 JwQI8SZu5msIg4nZBJwNVS/XLAktGhr/zm8yiAgkFWwkpslVFhEBKUGr8HOJ27CLytvu
 bnFw==
X-Gm-Message-State: AOAM533dVu9bI3dqvNKRo752v+UgRtnjDHRm41J+P7MQZv4Auc5oxeJ7
 I+4bFSeV5S7LJNjPQ3zzArGuoFLNxTAJ4R6wQgz4maYtFiQYZg==
X-Google-Smtp-Source: ABdhPJxkoN6QQUFxXouWekbeiFwh85rPc5546TsvH0EqWHIeHYRDKsIPyvR5z2fqgSUf21hj5bVO+NXZKKUYEB0PABc=
X-Received: by 2002:a05:6512:705:: with SMTP id b5mr3895679lfs.0.1626189151820; 
 Tue, 13 Jul 2021 08:12:31 -0700 (PDT)
MIME-Version: 1.0
From: Manish Thakur <mthakurcse@gmail.com>
Date: Tue, 13 Jul 2021 20:40:19 +0530
Message-ID: <CAH_zMFkZvFW0AXGNEB1zugMTbB=Os0EeQ3xREw4gWwDM8YJ73g@mail.gmail.com>
Subject: x86 power state cheak in the [phosphor-fan-presence] for sensor
 monitor .
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000bb5d6d05c702aa2e"
X-Mailman-Approved-At: Wed, 14 Jul 2021 10:03:01 +1000
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

--000000000000bb5d6d05c702aa2e
Content-Type: text/plain; charset="UTF-8"

platform meta-facebook
We are using Slot PowerCycle to check the power state that is inclusive of
BMC , if Bmc is Power off what is the use of checking the power state of
Slot power ? In this case can you please suggest how we can implement the
power state for x86 or either (some compiler option of configuration to
disable power state check). Any suggestions will be  appreciated.









Thanks
Manish
openBmc Team.
Hcl technologies

--000000000000bb5d6d05c702aa2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(36,41,46);font-family:-apple=
-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,=
&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">pl=
atform meta-facebook</span><span style=3D"color:rgb(36,41,46);font-family:-=
apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-s=
erif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14p=
x"><br></span></div><span style=3D"color:rgb(36,41,46);font-family:-apple-s=
ystem,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&q=
uot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">We a=
re using Slot PowerCycle to check the power state that is inclusive of BMC =
, if Bmc is Power off what is the use of checking the power state of Slot p=
ower ? In this case can you please suggest how we=C2=A0can implement the po=
wer state for x86 or either (some compiler option of configuration to disab=
le power state check). Any suggestions will be=C2=A0 appreciated.=C2=A0</sp=
an><br><div><span style=3D"color:rgb(36,41,46);font-family:-apple-system,Bl=
inkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span><=
/div><div><span style=3D"color:rgb(36,41,46);font-family:-apple-system,Blin=
kMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple =
Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></d=
iv><div><span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkM=
acSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div=
><div><span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMac=
SystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Colo=
r Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><=
div><span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSy=
stemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color =
Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><di=
v><span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSyst=
emFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Em=
oji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><div>=
<span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystem=
Font,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoj=
i&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><div><s=
pan style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFo=
nt,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&=
quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><div><spa=
n style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont=
,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&qu=
ot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div><div><span =
style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&=
quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot=
;,&quot;Segoe UI Emoji&quot;;font-size:14px">Thanks=C2=A0</span></div><div>=
<span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystem=
Font,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoj=
i&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">Manish=C2=A0</span></div=
><div><font color=3D"#24292e" face=3D"-apple-system, BlinkMacSystemFont, Se=
goe UI, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji"><s=
pan style=3D"font-size:14px">openBmc Team.</span></font></div><div>Hcl tech=
nologies<span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkM=
acSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><br></span></div=
></div>

--000000000000bb5d6d05c702aa2e--
