Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3AB0755
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 05:52:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TPx41mxCzF43C
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 13:52:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E0D1OB9G"; 
 dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TPwY4WR8zF3qk
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 13:52:09 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id bd8so11121716plb.6
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 20:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:message-id:in-reply-to:references:subject:mime-version;
 bh=mvJSWVcluQ3MQV1wNVKO8tM5ujMrPb7BgK0YGfPy+xc=;
 b=E0D1OB9G5+gOZxs8D7StM9Mjx34CR6eGroWTwfXPURFOCnLqRqV0wzlvB8nX76Fy29
 wCW6S1w9HbhOVgidI1+1HsRdXNZX26TrZV0A6P8klbWIS+7y5O4okScFJspzk7ClTz6D
 FKniLgGAj7qdQZn/rrDNJK5PPRRL/Nvq5Z2k/z0iynMoWOeUOk1tR8YtHiJUt21sK2Iu
 GX8nXV3Ei6/a7kaxR4QaUdPXmlIasvDXipWrh8KDJoKNPsbrherQxgoDKg1fKOlPzWa0
 ZpBO/D/a3Ryo0XsNLyO+9n9ZUsCLd04t2gGNpj+MIPGw3jgedhNAPJ064rkJdPpUUNJB
 qJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:message-id:in-reply-to:references
 :subject:mime-version;
 bh=mvJSWVcluQ3MQV1wNVKO8tM5ujMrPb7BgK0YGfPy+xc=;
 b=XzXYAZHSa38q17tt1W42nOj4ZKJVcTSg/kMBiydwxj7C5MlJd1UFgsziAUbr40lf8L
 qLbZyzIHV7QhzXS0iNOsJxyjRg1SH5XcoRBHhOUNeTTyYYRraGnd8m5Sq6Xx6P4lrAjo
 CzH76o6t6vgxh5PswluZzGWW9kA8eIuSaQ9MoS6BlRDo2WgcAReATL98DxAq+D2kucFz
 dsHqN2PFaDakd47CVl78Mgsuk4IEAHifnznyF2xYbX3RJw7eKrXAFz0uGzIUhIFngubL
 l51k0MMD6m01vt4QFY740TJGwdZHg5eHmi0npKQF3agcx9bEsZhyj7zwvjZCiG53ZTWt
 CyHQ==
X-Gm-Message-State: APjAAAXENVB53fIfbEUasN+nsfqSS3N67L5bPHjyU3V2ilXn8zAHc+YU
 a744Y55mqbFBp+aL9M6l3a3cf7at
X-Google-Smtp-Source: APXvYqypHisIdrT0E/UoRBk/yZoLELXWxDdhtdQFETgQ8tBBWdAfhjE1BaX6pb0nQF0eU2P1gbf8rg==
X-Received: by 2002:a17:902:6946:: with SMTP id
 k6mr30713454plt.53.1568260326157; 
 Wed, 11 Sep 2019 20:52:06 -0700 (PDT)
Received: from [10.10.14.19] (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id k22sm5861059pfa.87.2019.09.11.20.52.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 20:52:05 -0700 (PDT)
Date: Thu, 12 Sep 2019 11:51:58 +0800
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: openbmc@lists.ozlabs.org, =?utf-8?Q?=E5=B8=B8=E6=99=93=E6=98=8E?=
 <xiaoqian1641@163.com>
Message-ID: <e1a257b0-a15f-4258-b34c-330f132913a2@Spark>
In-Reply-To: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
References: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
Subject: Re: Fw:How to use gtest/gmock in openbmc
X-Readdle-Message-ID: e1a257b0-a15f-4258-b34c-330f132913a2@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5d79c0e4_2a487cb0_305"
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

--5d79c0e4_2a487cb0_305
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Johny,

> I wanted to test the code of OpenBMC through Gtest/Gmock, And I =46ound=
 the OpenBMC source code already had the test package,but it cannot be co=
mpiled according to README.md.
You need the compile environment first follow by build using the SDK docu=
ment.
update README.md step =C2=A0./configure =C2=A0 to =C2=A0./configure =24=7B=
CON=46IGURE=5F=46LAGS=7D.

I think it could be compiled after executing above steps.

Thanks,

Samuel Jiang
On Sep 12, 2019, 11:26 AM +0800, =E5=B8=B8=E6=99=93=E6=98=8E <xiaoqian164=
1=40163.com>, wrote:
> Hi, OpenBMC development member,
>
> I'm learning openbmc via github.
> I wanted to test the code of OpenBMC through Gtest/Gmock, And I =46ound=
 the OpenBMC source code already had the test package,but it cannot be co=
mpiled according to README.md.
> I think it may be my compilation method is not correct, Do you have any=
 documentation about this =3F
>
> Could you tell me How to test =22sdeventplus=22 =3F
>
> Thanks very mouch.
> Johny
>
>
>
>
>
>
>
>
>
>
>
>

--5d79c0e4_2a487cb0_305
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>Hi Johny,
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22>
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22care=
t-color: rgb(39, 39, 40); margin: 5px; padding-left: 10px; border-left-wi=
dth: thin; border-left-style: solid; border-left-color: rgb(26, 188, 156)=
;=22>
<div style=3D=22line-height: 1.7; font-family: Arial;=22>
<div id=3D=22is=46orwardContent=22>
<div style=3D=22line-height: 1.7;=22>
<div id=3D=22is=46orwardContent=22>
<div style=3D=22line-height: 1.7;=22>
<div id=3D=22is=46orwardContent=22>
<div style=3D=22line-height: 1.7;=22>
<div>I wanted to test the code of OpenBMC through Gtest/Gmock, And I =46o=
und the OpenBMC source code already had the test package,but it cannot be=
 compiled according to README.md.</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<div dir=3D=22auto=22>You need the compile environment first follow by <a=
 href=3D=22https://github.com/openbmc/openbmc/wiki/How-to-Build-using-the=
-SDK=22>build using the SDK document</a>.</div>
<div dir=3D=22auto=22>update README.md step &=23160;<span style=3D=22care=
t-color: rgb(39, 39, 40);=22>./configure &=23160; to &=23160;</span><a hr=
ef=3D=22https://www.yoctoproject.org/docs/2.1/sdk-manual/sdk-manual.html=22=
>./configure =24=7BCON=46IGURE=5F=46LAGS=7D.</a></div>
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22>I think it could be compiled after executing above =
steps.&=23160;</div>
</div>
</div>
<div name=3D=22messageSignatureSection=22><br />
<div class=3D=22match=46ont=22>Thanks,
<div><br /></div>
<div>Samuel Jiang</div>
</div>
</div>
<div name=3D=22messageReplySection=22>On Sep 12, 2019, 11:26 AM +0800, =E5=
=B8=B8=E6=99=93=E6=98=8E &lt;xiaoqian1641=40163.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =231abc9c;=22>
<div style=3D=22line-height:1.7;color:=23000000;font-size:14px;font-famil=
y:Arial=22>
<div id=3D=22is=46orwardContent=22>
<div style=3D=22line-height:1.7;color:=23000000;font-size:14px;font-famil=
y:Arial=22>
<div id=3D=22is=46orwardContent=22>
<div style=3D=22line-height:1.7;color:=23000000;font-size:14px;font-famil=
y:Arial=22>
<div id=3D=22is=46orwardContent=22>
<div style=3D=22line-height:1.7;color:=23000000;font-size:14px;font-famil=
y:Arial=22>
<div>Hi, OpenBMC development member,</div>
<div><br /></div>
<div>I'm learning openbmc via github.</div>
<div>I wanted to test the code of OpenBMC through Gtest/Gmock, And I =46o=
und the OpenBMC source code already had the test package,but it cannot be=
 compiled according to README.md.</div>
<div>I think it may be my compilation method is not correct, Do you have =
any documentation about this =3F</div>
<div><br /></div>
<div>Could you tell me How to test =22sdeventplus=22 =3F</div>
<div><br /></div>
<div>Thanks very mouch.</div>
<div>Johny</div>
<div><br style=3D=22font-family: arial; font-size: medium;=22 /></div>
</div>
<br />
<br />
<span title=3D=22neteasefooter=22>
<p></p>
</span></div>
</div>
<br />
<br />
<span title=3D=22neteasefooter=22>
<p></p>
</span></div>
</div>
<br />
<br />
<span title=3D=22neteasefooter=22>
<p></p>
</span></div>
</div>
<br />
<br />
<span title=3D=22neteasefooter=22><br />
<br />
<br /></span></blockquote>
</div>
</body>
</html>

--5d79c0e4_2a487cb0_305--

