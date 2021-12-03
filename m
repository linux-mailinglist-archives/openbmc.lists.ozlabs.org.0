Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E047281B
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 11:08:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCHKM303gz2xF9
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 21:08:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TwjU5jnd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=babandev@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TwjU5jnd; dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J51lt3RJlz2yPj
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 16:36:42 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id p65so2395011iof.3
 for <openbmc@lists.ozlabs.org>; Thu, 02 Dec 2021 21:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=dsg1NBxY3TZBwQ4NuG4RwG3UeViPD+/wfLWVCkb18xU=;
 b=TwjU5jndP4bEABXZc6JidVmysyHmwiCnRTS4otLb/YuEZE/ccM4iRogxj+diqZvY4J
 Zkz1DVZSKEUMBbpcLS8Okq6/YTPlvTYlbtbKQ5VrEEvuh+NNv3ZYBCN86uCEPmjSFW4v
 QFkz8C37+HTcH2+PhCKyokXSxZ2s+2DSLbfLLF65BDnmKQXbKMw0vG9Q4TVK3EgZCoEW
 Ylx+XScP47FAHievcIw/mMzxjVOidSN2A/3PpHRmNcGd3FKbg/bJ0q5NRGmf0pW2yvYb
 rTkkq5fPCZCkEFmPZcpCLtXXQiTHHutGlQNencpHZotXmHmJxgiJG6HbQC46Vb6UcQuR
 bjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dsg1NBxY3TZBwQ4NuG4RwG3UeViPD+/wfLWVCkb18xU=;
 b=EOQgVKQKm3ion88J22sydu6eTOk9EXYjlEkeZNbLNmCbp1N4shxxuTB+dAK89aTypr
 CTXek6BoDo8kb1DUfSDSAyZXeTEkwSzcWJQUiT0HSXmmSNObyYEZ7p0Nu82nV97wmfSZ
 o/qb50nuwcnayypa+nybTHfwCwTsP6WXLyXXbHtj5aR8/xUUoJSvmmpzayEYJrSL21qT
 q9G+E2g9EBpz2VyoVC7iigNQGWMoGae4mFKKUGYbGvZXoCWyp1Txsbnk6cZcL/mVOiLB
 yVzrKE4UlXsCJ3uAJSjuRdNjzbkz8wKI4pZ1njHIrUdSN+iV5VChzSd9rWJ/J5yQ+Xl/
 CmMQ==
X-Gm-Message-State: AOAM533EUPSrcMM7tN96Gaj69IJ8k6vnfl6L7zZTfU31mbZzPL9QDqRa
 Ny5eHEiOzBVUIunYelev2Zou2sRtX+mXwfUHINXGtbOquw4=
X-Google-Smtp-Source: ABdhPJzPwPzD4KwhqaaQqfq59vA3Kvu15blhg+kmSHRbapgagOuIaVHV0dSwk0/sHY67b/VRM1EI2q5h60HCEVPcyhA=
X-Received: by 2002:a02:caac:: with SMTP id e12mr23087222jap.29.1638509798704; 
 Thu, 02 Dec 2021 21:36:38 -0800 (PST)
MIME-Version: 1.0
From: baban devkate <babandev@gmail.com>
Date: Fri, 3 Dec 2021 11:06:27 +0530
Message-ID: <CAEF_Ra9cm2Hagp61aqnLN+tXix2-iJqzPv8YQbAjKWqB-i56UA@mail.gmail.com>
Subject: unable to build Jenkins Master
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000834b9405d2374ae9"
X-Mailman-Approved-At: Mon, 13 Dec 2021 21:07:47 +1100
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

--000000000000834b9405d2374ae9
Content-Type: text/plain; charset="UTF-8"

Hello,

I am new to openbmc forum, I am doing some experiments with openbmc ci.

Unable to build Jenkins Master as '/build-jenkins.sh' is failing with below
error message
cp: cannot stat 'docker-jenkins/init.groovy': No such file or directory

infact  'init.groovy' and ''plugins.sh' files are missing from
https://github.com/jenkinsci/docker.git repo,

Need help to get these missing files or updated steps to setup Jenkins
master.

Thanks & Regards
Baban

--000000000000834b9405d2374ae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I am new to openbmc forum, I am =
doing some experiments with openbmc=C2=A0ci.</div><div><br></div><div>Unabl=
e to build Jenkins Master as &#39;/build-jenkins.sh&#39; is failing with be=
low error message</div><div><span style=3D"background-color:rgb(204,204,204=
)">cp: cannot stat &#39;docker-jenkins/init.groovy&#39;: No such file or di=
rectory</span><br></div><div><br></div><div>infact=C2=A0 &#39;init.groovy&#=
39; and &#39;&#39;<span style=3D"color:rgb(10,48,105);font-family:ui-monosp=
ace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono=
&quot;,monospace;font-size:12px;white-space:pre">plugins.sh&#39; files are =
missing from </span><a href=3D"https://github.com/jenkinsci/docker.git">htt=
ps://github.com/jenkinsci/docker.git</a> repo,</div><div><br></div><div>Nee=
d help to get these missing files or updated steps to setup Jenkins master.=
</div><div><br></div><div>Thanks &amp; Regards</div><div>Baban</div></div>

--000000000000834b9405d2374ae9--
