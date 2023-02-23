Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B956A000C
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 01:26:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMYj63nXpz3cDF
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 11:26:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=E0kc0fBG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=E0kc0fBG;
	dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMYhS6GBQz3bqw
	for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2023 11:25:26 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id o14so7481570wms.1
        for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2023 16:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SRiIWHLsamMbBqD6wPLi/iRTs53nelfn5hJ2zLuSIo0=;
        b=E0kc0fBGWWdVodwkWhr8v0H28IcuFYRx6rGieeglrJdud+/Y1RXop0gwR2/NiJvcEZ
         5jH0nkyLjxhQb1qHzBJb1ZsBmJMQihve6OoqaIca4mS9AeOPdo5bT21JUdXVcfCGl4Bv
         rMS/KrqODnmOBQQkA6ms94PdHvO11rgg22qDS7b7Dza0iSLLp7UlyOeoXOQJPG/nK2Lz
         345JvTX6zumH5My/lqsSm//kw5oebAxq0bUie+p4YQz+QzXSpoPeGMmPkc33OkyQ/No+
         pxCJay96sOnaExmy8voluXMlckZrJXljUHZ/6Oif+IoxF7+J+Ny5cM5f/eaIn5ZLfd5K
         dFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRiIWHLsamMbBqD6wPLi/iRTs53nelfn5hJ2zLuSIo0=;
        b=H90h4hoDk4GAh3Nx0zwwA7W6S9g9tfPGv6Qc7I+OvrIo1NX1vf/RcsC/jEd6OwLMZa
         LKtcNPnGRaY4M3FCrUCt4hcyqMGEMmqMfzydGhlgrdX9wp96kJMtDZacltMMrl/oQDBc
         5rkKcbzdrOVY/25gAhl8nLMr2VV4ARCiCi9k0ysxvS9xJFu1F1qaQQ0SvGqR9BJv2xb1
         YZga5XIMUlMkv1ZWBlTjHWZvDr6H23Ja8H12GZI8ZYbUuClyanXKsqL7JEn2hrUFn+a2
         uTCM3EtKoZ8FdpzOvXv1rqSvI+kD5/ovOfLh/Kirl8UJ9K/MSDep+ca3Pan5s1kOk0X2
         a6DA==
X-Gm-Message-State: AO0yUKWowQi4wqm17i53rdmxWlyIMMp3L9l05qXdmoESar3mwL+T6pEn
	UzBebyJ8FPicUCTxIoWPNQ2BdX+hEoqnZ7pCzTgrvQ==
X-Google-Smtp-Source: AK7set+vFYZ/2m3+2Xbij90DnRl9jubsb0/n+dAekwaTk4wtYGjRFJNZlT5qrG1eUfceiVmqqWREl+IL5XGFyy/2OhU=
X-Received: by 2002:a05:600c:600a:b0:3db:29a:3b94 with SMTP id
 az10-20020a05600c600a00b003db029a3b94mr1027723wmb.151.1677111918518; Wed, 22
 Feb 2023 16:25:18 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Feb 2023 18:25:17 -0600
In-Reply-To: <1506829480.2905286.1677091362958@mail.yahoo.com>
Mime-Version: 1.0
References: <1506829480.2905286.1677091362958.ref@mail.yahoo.com> <1506829480.2905286.1677091362958@mail.yahoo.com>
From: Jian Zhang <zhangjian.3032@bytedance.com>
Date: Wed, 22 Feb 2023 18:25:17 -0600
Message-ID: <CA+J-oUsxjX3O60=EzZ_BsUQ4SBB2dkYCmU2AXUZj+jkk09dBQw@mail.gmail.com>
Subject: Re: [External] Virtual Media service
To: "Erhan Y." <erhan14@yahoo.com>
Content-Type: multipart/alternative; boundary="00000000000027592f05f5530c8c"
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

--00000000000027592f05f5530c8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8C
Kindly refer to this.
https://gerrit.openbmc.org/c/openbmc/jsnbd/+/58920/1#message-404927cb941d08=
747ae9beb5c8abd6c34de5323c
Jian
From: "Erhan Y."<erhan14@yahoo.com>
Date: Thu, Feb 23, 02:00
Subject: [External] Virtual Media service
To: <openbmc@lists.ozlabs.org>
It seems that virtual media feature is broken in the current langdale
branch. It was working fine when we were working on kirkstone branch?
Any one who has tried recently?
We see that the state hook script is failing.
We are using ast2500 with webui-vue.
Thanks


Sent from Yahoo Mail for iPhone <https://overview.mail.yahoo.com/?.src=3DiO=
S>

--00000000000027592f05f5530c8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div id=3D"editor_version_1.17.2_5pASHJVu" style=
=3D"word-break:break-word"><div style=3D"margin-top:4px;margin-bottom:4px;l=
ine-height:1.6"><div style=3D"font-size:16px">Hi=EF=BC=8C
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div style=3D"font-size:16px">Kindly refer to this.
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div style=3D"font-size:16px"><a href=3D"https://gerrit.openbmc.org/c/open=
bmc/jsnbd/+/58920/1#message-404927cb941d08747ae9beb5c8abd6c34de5323c" targe=
t=3D"_blank" rel=3D"noopener noreferrer" style=3D"margin-right:2px;text-dec=
oration:none;color:rgb(51,112,255)">https://gerrit.openbmc.org/c/openbmc/js=
nbd/+/58920/1#message-404927cb941d08747ae9beb5c8abd6c34de5323c</a>
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div style=3D"font-size:16px">Jian
</div></div></div><div class=3D"history-quote-wrapper" id=3D"lark-mail-quot=
e-167711188"><div style=3D"list-style-position:inside"><div class=3D"adit-h=
tml-block adit-html-block--collapsed" style=3D"border-left-style:none;paddi=
ng-left:0px"><div><div class=3D"adit-html-block__attr history-quote-meta-wr=
apper history-quote-gap-tag" id=3D"lark-mail-quote-meta-oITaz2krV" style=3D=
"padding:12px;background-color:rgb(245,246,247);color:rgb(31,35,41);border-=
radius:4px;margin-top:24px;margin-bottom:12px"><div id=3D"lark-mail-quote-4=
6cb9e8cc3f0d42a03af1d023e61ab4a"><div style=3D"word-break:break-word"><div =
style=3D""><span style=3D"">From: </span><span style=3D"white-space:nowrap"=
>&quot;Erhan Y.&quot;&lt;<a style=3D"word-wrap:break-word;white-space:pre-w=
rap;word-break:break-word;text-decoration:none;color:inherit" href=3D"mailt=
o:erhan14@yahoo.com" class=3D"quote-head-meta-mailto">erhan14@yahoo.com</a>=
&gt;</span></div><div style=3D""><span style=3D"">Date: </span> Thu, Feb 23=
, 02:00</div><div style=3D""><span style=3D"">Subject: </span> [External] V=
irtual Media service</div><div style=3D""><span style=3D"">To: </span><span=
 style=3D"white-space:nowrap">&lt;<a style=3D"word-wrap:break-word;white-sp=
ace:pre-wrap;word-break:break-word;text-decoration:none;color:inherit" href=
=3D"mailto:openbmc@lists.ozlabs.org" class=3D"quote-head-meta-mailto">openb=
mc@lists.ozlabs.org</a>&gt;</span></div></div></div></div><div><div>It seem=
s that virtual media feature is broken in the current langdale branch. It w=
as working fine when we were working on kirkstone branch?=C2=A0<div>Any one=
 who has tried recently?</div><div>We see that the state hook script is fai=
ling.=C2=A0</div><div>We are using ast2500 with webui-vue.=C2=A0</div><div>=
Thanks=C2=A0<br><br><br><a rel=3D"nofollow noopener noreferrer" href=3D"htt=
ps://overview.mail.yahoo.com/?.src=3DiOS">Sent from Yahoo Mail for iPhone</=
a><br></div></div></div></div></div></div></div></body></html>

--00000000000027592f05f5530c8c--
