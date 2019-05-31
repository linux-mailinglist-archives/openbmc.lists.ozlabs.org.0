Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED1430935
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 09:19:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FbR83KCFzDqdL
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 17:19:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EKbA2qpQ"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FbQR4BYjzDqSN
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 17:18:23 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id n2so3519183pgp.11
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 00:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:message-id:in-reply-to:references:subject:mime-version;
 bh=mjsWi1JZXalxFYtmF8a6NDxHg76I/QESjCE8/raRCws=;
 b=EKbA2qpQxWIPqigRsrDdVhDWi9jqw7wy8NDPghN1aTuLBrb60uUi7CuDgxWU88HN1Q
 mJqoVT0zebIMlgL/YoqG1nUMTm7c7qjZ1ojl6rOPSaRoBe+PdAfmK8DNs2IQHu4oelYU
 ywSKKv5W2mgKG+gBK4VjWEmV6bwQHq3HehRABSmbWkPRLttjuZLLdZBkABp7uC3TKPYc
 7ahF7oEMSfEqrnovTWNPFTZPI5gsElJWYgf+QWTTCKtKOD4eFyhbZpKp3iaSyKmHZxoR
 dfEcVmdUqp8vbX9FPvjt1TC4SnvJ2yv4ZIfUub4ac6gaMzhfn+eDtJtF11IEUui3kI++
 JRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:message-id:in-reply-to:references
 :subject:mime-version;
 bh=mjsWi1JZXalxFYtmF8a6NDxHg76I/QESjCE8/raRCws=;
 b=ZqMwsFGIcA1z1y5gqMwBj6h2BfwfhTKOeNg1X270G4aYEU9truhwra6UBQVW6lCybT
 DRmUsqG2nxF+7MXtBTmtbAR4hUpESy0tpVK+B6j/9CilG9XVh3uuiP7oT6dvvo9xuNtf
 wdXcuAngEHEhx6R5pnsc3ggK9VAKS1m8FX4BpJSs8wNh/K5Q7zq7ncjEipz2vrvjRXMb
 iO5SThS5K5ijMpbaKqDsKsXpdYIGweCG2WY6RdWa2C14awlA4qPjbF7fWF571paj3ukF
 lg9BKRTrYbjIhKO/722POuPzi4W8JlrKDXzzDJaX23ewB3Hg9TkUyc/ep6N4HskXag1u
 DjLQ==
X-Gm-Message-State: APjAAAWfuujVo/5aHMGrRqDBPaQdE2anH0+SDP4nnkPh2RRm9aK68e77
 Qpvr+6BYJD59xAW2iCEyPV5nvnDZgXE=
X-Google-Smtp-Source: APXvYqy4HZJ9FEq6961vEaudTzouKnmzFc39xbXxrvLjPM/0FTrEgts7M52deTqAtJ4qe5cLMuEZlQ==
X-Received: by 2002:aa7:93bb:: with SMTP id x27mr7975014pff.104.1559287099047; 
 Fri, 31 May 2019 00:18:19 -0700 (PDT)
Received: from [10.10.14.19] (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id o66sm4473526pje.8.2019.05.31.00.18.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 00:18:18 -0700 (PDT)
Date: Fri, 31 May 2019 15:18:10 +0800
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>, 
 "=?utf-8?Q?Simon_Zhu(=E6=9C=B1=E8=8B=B1=E6=BE=8D)?=" <zhuysh@inspur.com>
Message-ID: <6a7553c7-060b-4318-a710-b903862b47af@Spark>
In-Reply-To: <A2251FF4-28A5-4311-9DC7-6DD00306E0C9@inspur.com>
References: <A2251FF4-28A5-4311-9DC7-6DD00306E0C9@inspur.com>
Subject: Re: [IPMI] About LAN interface
X-Readdle-Message-ID: 6a7553c7-060b-4318-a710-b903862b47af@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5cf0d537_625558ec_16a5d"
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

--5cf0d537_625558ec_16a5d
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Simon,

try use ipmitool -U root =C2=A0-P 0penBmc -h <host=5Fip> -I lanplus mc in=
fo

Reference

Thanks,

Samuel Jiang
On May 31, 2019, 8:46 AM +0800, Simon Zhu(=E6=9C=B1=E8=8B=B1=E6=BE=8D) <z=
huysh=40inspur.com>, wrote:
> Hello,
>
> Does IPMI support lan interface=3F
>
> I used ipmitool through lan interface, but failed:
>
> ipmitool -I lan -H IP -U root -P 0penBmc mc info
> Authentication type NONE not supported
> Error: Unable to establish LAN session
> Error: Unable to establish IPMI v1.5 / RMCP session
>
> Can we support LAN interface=3F
>
> Best regards,
>
> Simon

--5cf0d537_625558ec_16a5d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22 style=3D=22font-size: 14px; font-fam=
ily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>
<div dir=3D=22auto=22>Hi Simon,
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22>try use ipmitool -U root &=23160;-P 0penBmc -h &lt;=
host=5Fip&gt; -I lanplus mc info</div>
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22><a href=3D=22https://github.com/openbmc/openbmc/iss=
ues/1570=22>Reference</a></div>
</div>
</div>
<div name=3D=22messageSignatureSection=22><br />
<div class=3D=22match=46ont=22>Thanks,
<div style=3D=22font-size: 14px; font-family: -apple-system, BlinkMacSyst=
em=46ont, sans-serif;=22><br style=3D=22font-size: 14px; font-family: -ap=
ple-system, BlinkMacSystem=46ont, sans-serif;=22 /></div>
<div style=3D=22font-size: 14px; font-family: -apple-system, BlinkMacSyst=
em=46ont, sans-serif;=22>Samuel Jiang</div>
</div>
</div>
<div name=3D=22messageReplySection=22 style=3D=22font-size: 14px; font-fa=
mily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>On May 31, 2019=
, 8:46 AM +0800, Simon Zhu(=E6=9C=B1=E8=8B=B1=E6=BE=8D) &lt;zhuysh=40insp=
ur.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =231abc9c;=22>He=
llo,<br />
<br />
Does IPMI support lan interface=3F<br />
<br />
I used ipmitool through lan interface, but failed:<br />
<br />
ipmitool -I lan -H IP -U root -P 0penBmc mc info<br />
Authentication type NONE not supported<br />
Error: Unable to establish LAN session<br />
Error: Unable to establish IPMI v1.5 / RMCP session<br />
<br />
Can we support LAN interface=3F<br />
<br />
Best regards,<br />
<br />
Simon</blockquote>
</div>
</body>
</html>

--5cf0d537_625558ec_16a5d--

