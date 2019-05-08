Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01117609
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 12:33:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zXrT5gz5zDqKM
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 20:33:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDj08ABg"; 
 dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zXqS4MRdzDqGL
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 20:32:52 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id w22so8581721pgi.6
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 03:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=fGgVPV6TQ2skBdJreZFREnHlV77d8fFRjlG3R5fBdLs=;
 b=gDj08ABgWyzJgEsY3/LpKgdJXwqSEKQNQpla8hfSHc5o4Y0mPMZl2xWoRxjHNfyka6
 y3CYl255T3IhuHSS4S5frUqeU9ApjYzaJOGGXkYLDVtPCmQBccVd7UqE5Cy5bsDvLmBf
 3ZfA7PzJElT3jNr7nkXS7NwCfAZmiH89Ub7bvtujARjzHJk5AAnCL33IP+X3ekB94iQ+
 zEy/o8uLDAHFXB8xVM24g9o7qPoSTUoL/7xn65/MsMXdkkAKJ/5AbnK/CnMrKV//E0i2
 ZDiSFlyIMl+hS5ZhPiSUEMhM4ka76bWet6R+r4WD5kU0ff3xELSoXDFcXCo19cZMZ0ha
 yDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=fGgVPV6TQ2skBdJreZFREnHlV77d8fFRjlG3R5fBdLs=;
 b=CiMZrjXcuB9iGvnX9qCNjTWxXpAfEe8+kmWOE5nmSP0CUa11Ttc18RxLDJFy7j2iiS
 6zzTDvRp+WhVxI+go1v0Laa7k4UMWKlkzd91cgX7sep5DTIlyWq/Ha6MPCJlLUmgusej
 U+QJfteBHqcfUQr3T8DR7yLjIEdu/l2A2OmyBUCaMEBO1XpOLry/KFmXHi0Fgw9MIZTF
 BM8GBDUHjZ4j0fE+BddZfvJlLXWEEvb4gZDDoaKBwxXb8nqhm3jNtpdS8Zz9I7y4ojqk
 iTOIUKouhZZYMjdWj+YYMc+NyRiyKsEbtt86mKBgwQ27gw3JjCNRPNEpTONAJ59+kx4j
 skjg==
X-Gm-Message-State: APjAAAXgE4hDnJuM8PU/dvMVwbQGWTbtgzT95WCkRoXltD6hFNonBl5F
 HLYiHta3d/OQeEp+z3tqkHY=
X-Google-Smtp-Source: APXvYqwhB/aMicfU4G6HryZUdj8gtFKf0P9KrQeZIqlggqaO1gwRnYrOTasJerzyZyy1rWRgy9xG1A==
X-Received: by 2002:a62:6f87:: with SMTP id k129mr32095484pfc.53.1557311568110; 
 Wed, 08 May 2019 03:32:48 -0700 (PDT)
Received: from [10.10.14.19] (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id 15sm23687984pfo.117.2019.05.08.03.32.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 03:32:47 -0700 (PDT)
Date: Wed, 8 May 2019 18:32:37 +0800
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: Brad Chou <chou.brad@gmail.com>, Andrew Jeffery <andrew@aj.id.au>
Message-ID: <88066601-2367-45ce-98f5-8193a02534fb@Spark>
In-Reply-To: <18ccd5d6-0bce-4990-9d0a-62f97fae5b3b@www.fastmail.com>
References: <365A980B-9730-411A-A91B-EB0A97026D95@gmail.com>
 <acf57f4c-08bd-40db-a77a-bb7f4f9f5938@Spark>
 <A2B0CA36-50FC-4A4D-A1EE-C87B3A55223C@gmail.com>
 <18ccd5d6-0bce-4990-9d0a-62f97fae5b3b@www.fastmail.com>
Subject: Re: How to set GPIOs to pre-defined value
X-Readdle-Message-ID: 88066601-2367-45ce-98f5-8193a02534fb@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="5cd2b04c_180115be_706"
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

--5cd2b04c_180115be_706
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Brad,
On May 7, 2019, 4:52 PM +0800, Brad Chou <chou.brad@gmail.com>, wrote:
> Hi Samuel,
> Thanks for your reply, I am using AST2500.
> I tried add gpio-hog settings into my device tree, and yes, the GPIO works as it defined.
> But all GPIOs defined by gpio-hog can not be modified in user space by gpioset / gpioget utility.
> I need to set all GPIOs to pre-defined state and can change it at run time.
> Set GPIOs in Device tree is trying to lock it by a fixed direction and value.
>
> Thanks.

You could trace the gpioplus library how does it implement control pins, it seems direct modify by gpio chips.

> Now, I am using a shell script with gpioset utility to do the job.
> But I know using shell to do it is a bad idea.
> Does anyone have better ideas ?


In my situation, I still use shell script export pin which didn't pre-define output high or low and control GPIOs program by c++ at runtime.
But I think the previous shell script also could rewrite to c++.


Thanks,
Samuel Jiang




--5cd2b04c_180115be_706
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
<div style=3D=22caret-color: rgb(39, 39, 40);=22>Hi Brad,</div>
</div>
<div name=3D=22messageReplySection=22 style=3D=22font-size: 14px; font-fa=
mily: -apple-system, BlinkMacSystem=46ont, sans-serif;=22>On May 7, 2019,=
 4:52 PM +0800, Brad Chou &lt;chou.brad=40gmail.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px; padding-left: 10px; border-left-width: thin; border-left-style: =
solid; border-left-color: rgb(26, 188, 156);=22>Hi Samuel,
<div class=3D=22=22>Thanks for your reply, I am using AST2500.</div>
<div class=3D=22=22>I tried add gpio-hog settings into my device tree, an=
d yes, the GPIO works as it defined.</div>
<div class=3D=22=22>But all GPIOs defined by gpio-hog can not be modified=
 in user space by gpioset / gpioget utility.</div>
<div class=3D=22=22>I need to set all GPIOs to pre-defined state and can =
change it at run time.</div>
<div class=3D=22=22>Set GPIOs in Device tree is trying to lock it by a fi=
xed direction and value.</div>
<div class=3D=22=22><br class=3D=22=22 /></div>
<div class=3D=22=22>Thanks.</div>
<div class=3D=22=22>
<div class=3D=22=22></div>
</div>
</blockquote>
<br />
<div>You could trace the gpioplus library how does it implement control p=
ins, it seems direct modify by gpio chips.<br /></div>
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22>
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22care=
t-color: rgb(39, 39, 40); margin: 5px; padding-left: 10px; border-left-wi=
dth: thin; border-left-style: solid; border-left-color: rgb(26, 188, 156)=
;=22>Now, I am using a shell script with gpioset utility to do the job.<b=
r />
But I know using shell to do it is a bad idea.<br />
Does anyone have better ideas =3F&=23160;</blockquote>
<br />
<div><br /></div>
</div>
<div dir=3D=22auto=22>In my situation, I still use shell script export pi=
n which didn't pre-define output high or low and control GPIOs program by=
 c++ at runtime.<br />
But I think the previous shell script also could rewrite to c++.<br /></d=
iv>
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22>Thanks,</div>
<div dir=3D=22auto=22>Samuel Jiang</div>
<div dir=3D=22auto=22><br /></div>
<div dir=3D=22auto=22><br /></div>
<br /></div>
</body>
</html>

--5cd2b04c_180115be_706--

