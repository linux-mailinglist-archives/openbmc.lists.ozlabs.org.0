Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF2D3E0C8A
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 04:56:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgCtZ02qcz3cHr
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 12:56:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=F+pLi/CG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533;
 helo=mail-ed1-x533.google.com; envelope-from=ratankgupta31@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F+pLi/CG; dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgCtG6QJXz307n
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 12:56:21 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id y7so6241436eda.5
 for <openbmc@lists.ozlabs.org>; Wed, 04 Aug 2021 19:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=KjEyAh3l/IF2KnfL+UMQHShYNY9CQhLkgEvF74kXY5M=;
 b=F+pLi/CG8EkQxPixLXbVbrKyH74UAJPTIB5X23fiWooiVgYzHN6NDGYA1szGFPiU5t
 k9pbqIuM/CLvNETl67dcjA5Db5d5yVxHtgp17nswD6YUQWDHDG9gRrfevjgkw8pFAuw8
 QfsTVT5k9C0eEfF7syGTcrSc3Gur9V2JnmQT7gnot21ST1x/iDuD8jOPsf2QIYprWN5R
 r8SOLPxqA/FUeEz57NFdQa9zdcaXQKwpZcG3zKRl/C7cffd2qXf+1H3q40LcVJVhH7bn
 7f1yocsVO2r5nvz3JWRuYiM+c0vlVlxl529CptSn6EV+b3BsTcxQU8YzgY5OVucQoA4H
 qpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=KjEyAh3l/IF2KnfL+UMQHShYNY9CQhLkgEvF74kXY5M=;
 b=PN2u8N/XWzeUgjyo5uk0UeIYsyaokTilIBRcNX76hsHWFXRc3YB8SUtnNonU/VrLG0
 ilsOm/r8ro5MawqsexO6U4ErHLQmKI+UoDbznboNHIVitBLiyj8HG7eywSqltAnNJDBm
 PsIIKglVUfVzEfcA+fl1GYtoV2sJ7r8dIs4rq3YbFncPqfSYyyu+bFmsTpaONxUC2mmw
 E94pMBgimdMJszlhn449nMd9RwJ7fIKp4388N/M55bQoAC5voTiNk99f8g1UiRyXcHxu
 yvNGXiKBtxNFglIqswij1+GT6irI5D/t+WjJlSknc5rKcDyeO5ozDxTNWG92kct3Ux/I
 9Osg==
X-Gm-Message-State: AOAM531RDxA1zeJSiLbT/XLyNGxiLHtlLZ8fxr11mU4674KkfBeuygmw
 d697waOJ1bAyB5Pkp1wXzvsRP5rDJcj3/hTwf1/R1d7nLh4=
X-Google-Smtp-Source: ABdhPJxB4VwQQlr3d2hPi7xhawYqy135750p12IZsPMLfyCsBa6G33lFO+WP65aqETitcGvs/0Iu2/t3VSwVRHJCTMQ=
X-Received: by 2002:a05:6402:124e:: with SMTP id
 l14mr3673255edw.356.1628132175135; 
 Wed, 04 Aug 2021 19:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhqiMrcS2Yr6B3TBTAyB4BE_FPbU_waoJScQmYCBMnCpv5ZAw@mail.gmail.com>
 <CAMhqiMofyc2mGBYYJUXftj2kbQzmZt=q0pwyk2KPoSVxrHVKBQ@mail.gmail.com>
In-Reply-To: <CAMhqiMofyc2mGBYYJUXftj2kbQzmZt=q0pwyk2KPoSVxrHVKBQ@mail.gmail.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Thu, 5 Aug 2021 08:26:03 +0530
Message-ID: <CAMhqiMr+b_=bJ=JwuSZUa8eooYVfcEoM7crAgKNH9v6cb2PWOw@mail.gmail.com>
Subject: Re: apparmor support
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f2473c05c8c70fa5"
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

--000000000000f2473c05c8c70fa5
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Does anybody have any experience in writing the apparmor profile and
confine some of the openbmc application? I pulled the apparmor in the
openbmc image but it is not confining the openbmc application.Confining the
application on ubuntu works fine but that is not true with openbmc.

I am chasing this issue with apparmor team through
https://gitlab.com/apparmor/apparmor/-/issues/183

Ratan

On Tue, Jul 27, 2021 at 1:27 PM Ratan Gupta <ratankgupta31@gmail.com> wrote:

> Ignore my previous email, I got the issue that CONFIG_SECURITY should have
> been enabled also(That is a dependency)
>
> https://github.com/openbmc/linux/blob/1519240139a91e3dbc97d8f79de29a22a3328257/security/apparmor/Kconfig#L4
>
> On Tue, Jul 27, 2021 at 11:42 AM Ratan Gupta <ratankgupta31@gmail.com>
> wrote:
>
>> Hi All,
>>
>> I was trying to pull apparmor in openbmc, all the user space application
>> got pulled however I was unable to build the kernel with apparmor support.
>>
>> I made the following kernel configuration to include the apparmor(
>> https://github.com/openbmc/linux/blob/dev-5.10/Documentation/admin-guide/LSM/apparmor.rst
>> )
>>
>> CONFIG_SECURITYFS=y
>> CONFIG_SECURITY_NETWORK=y
>> CONFIG_SECURITY_PATH=y
>> CONFIG_SECURITY_APPARMOR=y
>> CONFIG_DEFAULT_SECURITY="apparmor"
>> CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
>> CONFIG_AUDIT=y
>>
>>
>> In the build tree, kernel is not picking the above config parameters and
>> I was getting the following logs in the config_build_log which suggest that
>> kernel doesn't like these config.
>>
>> tmp/work-shared/hgx/kernel-source/.kernel-meta/cfg/merge_config_build.log
>>
>> Value requested for CONFIG_SECURITY_PATH not in final .config
>> Requested value:  CONFIG_SECURITY_PATH=y
>> CONFIG_SECURITY_PATH=y
>> Actual value:
>>
>> Value requested for CONFIG_SECURITY_APPARMOR not in final .config
>> Requested value:  CONFIG_SECURITY_APPARMOR=y
>> CONFIG_SECURITY_APPARMOR=y
>> Actual value:
>>
>> Value requested for CONFIG_DEFAULT_SECURITY not in final .config
>> Requested value:  CONFIG_DEFAULT_SECURITY="apparmor"
>> CONFIG_DEFAULT_SECURITY="apparmor"
>> Actual value:
>>
>> Value requested for CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE not in final
>> .config
>> Requested value:  CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
>> CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
>> Actual value:
>>
>> Can somebody suggest me what I am missing here?
>>
>> Ratan Gupta
>>
>

--000000000000f2473c05c8c70fa5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,<div><br></div><div>Does anybody have any experien=
ce=C2=A0in writing the apparmor profile and confine some of the openbmc app=
lication? I pulled the apparmor in the openbmc image but it is not confinin=
g=C2=A0the openbmc application.Confining the application on ubuntu works fi=
ne but that is not true with openbmc.</div><div><br></div><div>I am chasing=
 this issue with apparmor team through=C2=A0<a href=3D"https://gitlab.com/a=
pparmor/apparmor/-/issues/183">https://gitlab.com/apparmor/apparmor/-/issue=
s/183</a></div><div><br></div><div>Ratan</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 27, 2021 at 1:27 =
PM Ratan Gupta &lt;<a href=3D"mailto:ratankgupta31@gmail.com">ratankgupta31=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Ignore my previous email, I got the issue that =
CONFIG_SECURITY should=C2=A0have been enabled also(That is a dependency)<di=
v><span style=3D"font-size:12pt;font-family:Calibri,sans-serif;color:rgb(0,=
32,96)"><a href=3D"https://github.com/openbmc/linux/blob/1519240139a91e3dbc=
97d8f79de29a22a3328257/security/apparmor/Kconfig#L4" style=3D"color:rgb(5,9=
9,193)" target=3D"_blank">https://github.com/openbmc/linux/blob/1519240139a=
91e3dbc97d8f79de29a22a3328257/security/apparmor/Kconfig#L4</a></span></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Jul 27, 2021 at 11:42 AM Ratan Gupta &lt;<a href=3D"mailto:ratankgu=
pta31@gmail.com" target=3D"_blank">ratankgupta31@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
Hi All,<br><br>I was trying to pull apparmor in openbmc, all the user space=
 application got pulled however I was unable to build the kernel with appar=
mor support.<br><br>I made the following kernel configuration to include th=
e apparmor( <a href=3D"https://github.com/openbmc/linux/blob/dev-5.10/Docum=
entation/admin-guide/LSM/apparmor.rst" target=3D"_blank">https://github.com=
/openbmc/linux/blob/dev-5.10/Documentation/admin-guide/LSM/apparmor.rst</a>=
)<br><br>CONFIG_SECURITYFS=3Dy<br>CONFIG_SECURITY_NETWORK=3Dy<br>CONFIG_SEC=
URITY_PATH=3Dy<br>CONFIG_SECURITY_APPARMOR=3Dy<br>CONFIG_DEFAULT_SECURITY=
=3D&quot;apparmor&quot;<br>CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=3D1<br>=
CONFIG_AUDIT=3Dy<br><br><br>In the build tree, kernel is not picking the ab=
ove config parameters and I was getting the following logs in the config_bu=
ild_log which suggest that kernel doesn&#39;t like these config.<br><br>tmp=
/work-shared/hgx/kernel-source/.kernel-meta/cfg/merge_config_build.log<br><=
br>Value requested for CONFIG_SECURITY_PATH not in final .config<br>Request=
ed value: =C2=A0CONFIG_SECURITY_PATH=3Dy<br>CONFIG_SECURITY_PATH=3Dy<br>Act=
ual value:<br><br>Value requested for CONFIG_SECURITY_APPARMOR not in final=
 .config<br>Requested value: =C2=A0CONFIG_SECURITY_APPARMOR=3Dy<br>CONFIG_S=
ECURITY_APPARMOR=3Dy<br>Actual value:<br><br>Value requested for CONFIG_DEF=
AULT_SECURITY not in final .config<br>Requested value: =C2=A0CONFIG_DEFAULT=
_SECURITY=3D&quot;apparmor&quot;<br>CONFIG_DEFAULT_SECURITY=3D&quot;apparmo=
r&quot;<br>Actual value:<br><br>Value requested for CONFIG_SECURITY_APPARMO=
R_BOOTPARAM_VALUE not in final .config<br>Requested value: =C2=A0CONFIG_SEC=
URITY_APPARMOR_BOOTPARAM_VALUE=3D1<br>CONFIG_SECURITY_APPARMOR_BOOTPARAM_VA=
LUE=3D1<br>Actual value:<br><br>Can somebody suggest me what I am missing h=
ere?<br><br>Ratan Gupta<br></div>
</blockquote></div>
</blockquote></div>

--000000000000f2473c05c8c70fa5--
