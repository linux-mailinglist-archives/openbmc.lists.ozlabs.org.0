Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 756242B5296
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 21:31:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZgj34Px2zDqQg
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 07:31:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=qwaveinc.in (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=radhika@qwaveinc.in;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=qwaveinc.in
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=qwaveinc-in.20150623.gappssmtp.com
 header.i=@qwaveinc-in.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xhe2+bhZ; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZgh41H2lzDqNx
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 07:30:56 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id l1so20231977wrb.9
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 12:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qwaveinc-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=MJZpZ+Bk2g7sVVdSVIP6xXjnoJceGrUYPgFFTFT090I=;
 b=xhe2+bhZrlKQuGApY2u/yy35OZfX90PxkZNByy83czeF0XWGtXclBaQhFxInZPqiOk
 9U//tItEnACo9/9uIhpM2LVvrNuS8QrtXjUal5SXnMIo6OwVPnH7WJr5WDtbYWZ1dVHu
 T68QJFGX3uUtFKlEGDGz5mwIG22Ehvg8tr+slsHrmC/mlHep6QlCYziTBrtsi/g2V0cw
 Wo7VGeJacdRJtiiJXpJARpPtAW5wgdyjPx6EP98nx5pt7JlCr2FBAZqhrLzvz9tYukq7
 V9TFLgrKgVlROxT1UjDE5PWb6C52KUzuKW766sztKhpBa7yKmaoI7yxT1fC3OOBubfKV
 NKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MJZpZ+Bk2g7sVVdSVIP6xXjnoJceGrUYPgFFTFT090I=;
 b=PbaxwxDVf1wNMN75428vlF4MS00VwhXeDt/YaEVMocRe1BwV74TTuk87dXSvoptcVE
 Cs9B1laP+qGbCj18Wq4oO7kXc8PxUOTOcefDF0NdvurOsWdldiNhTkzhpqDu9rgz1USf
 IZ+Nkll6fyd9Qm8rIcNEFIWN1PTgs9zeC+j1W8XRtwswvHmuMxTUUeBHSmYQ/OsQzMeS
 DDNmWW+9DHebLfw/qH/I3dpv8O+dZkOC5hoVu1O2okmY1hfskCWWXAuAu13JGYJHVJFs
 dzU9ZIEIylwHCtFwt0LQi1vVdHTTVsVwwrzIsm/wTcZ/hOp/4FOr2Q8FKxlG4PEu5rgu
 RtcQ==
X-Gm-Message-State: AOAM532ZtX+6vqM4KMYnMJUnAZ9uQPDxFOB7DG8Yzq61inUOjqjYAPLE
 KHOUMWvPawsiXBKNnFKQjbptiE6819/L6P9h4YTDSg8VBbY=
X-Google-Smtp-Source: ABdhPJyQbCDRL5LiEM3ZQWVDQ1R39lP5L4/4R8S6J4CG1yuVG0Oun5N4ei0m1cL0mlZnsVCfmOeHZEx59wbblti7uN0=
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr21817771wri.314.1605558651731; 
 Mon, 16 Nov 2020 12:30:51 -0800 (PST)
MIME-Version: 1.0
From: Radhika Pradeep <radhika@qwaveinc.in>
Date: Tue, 17 Nov 2020 02:00:36 +0530
Message-ID: <CAFMA7evLWM5ER_KAms4may+PanjUeQPH6Wy2JoCjQkiXj84eSQ@mail.gmail.com>
Subject: STEPS FOR CHANGING THE DEFAULT SERIAL CONSOLE TO UART2
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001a6a5405b43f4141"
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

--0000000000001a6a5405b43f4141
Content-Type: text/plain; charset="UTF-8"

Hi ,

We have a BMC board based on the AST2520 with UART2 set as serial
console.We are using the openbmc codebase based on ast2500 with aspeed-g5.

Since the default uart console is set to uart5 we are not able to get the
serial console output.

We just got a "mw" command used in uboot to change the register for UART5
TO IO2 routing which can only be done temporarily.

Because we have the console connected to UART2 only. So we need to get the
console output at UART2 each time the board boots up.

Could you please provide us with the information on how to change routing
permanently or the information about  the file which can be modified to
change the register values permanently to get the uart2 console output.?


Thanks and Regards,

Radhika

--0000000000001a6a5405b43f4141
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div style=3D"font-family:sans-serif;font-size:12.8px" di=
r=3D"auto"><div style=3D"width:328px;margin:16px 0px"><div><div dir=3D"ltr"=
><p>Hi ,</p><p><font size=3D"2"><span style=3D"font-family:&#39;verdana&#39=
;,sans-serif">We have a BMC board based on the AST2520 with UART2 set as se=
rial console.We are using the openbmc codebase based on ast2500 with aspeed=
-g5.</span></font></p><font size=3D"2"><span style=3D"font-family:&#39;verd=
ana&#39;,sans-serif"></span></font><p><font size=3D"2"><span style=3D"font-=
family:&#39;verdana&#39;,sans-serif">Since the default uart console is set =
to uart5 we are not able to get the serial console output.</span></font></p=
><font size=3D"2"><span style=3D"font-family:&#39;verdana&#39;,sans-serif">=
</span></font><p><font size=3D"2"><span style=3D"font-family:&#39;verdana&#=
39;,sans-serif">We just got a &quot;mw&quot; command used in uboot to chang=
e the register for UART5 TO IO2 routing which can only be done temporarily.=
</span></font></p><font size=3D"2"><span style=3D"font-family:&#39;verdana&=
#39;,sans-serif"></span></font><p><font size=3D"2"><span style=3D"font-fami=
ly:&#39;verdana&#39;,sans-serif">Because we have the console connected to U=
ART2 only. So we need to get the console output at UART2 each time the boar=
d boots up.</span></font></p><font size=3D"2"><span style=3D"font-family:&#=
39;verdana&#39;,sans-serif"></span></font><p><font size=3D"2"><span style=
=3D"font-family:&#39;verdana&#39;,sans-serif">Could you please provide us w=
ith the information on how to change routing permanently or the information=
 about=C2=A0 the file which can be modified to change the register values p=
ermanently to get the uart2 console output.?</span></font></p><font size=3D=
"2"><span style=3D"font-family:&#39;verdana&#39;,sans-serif"></span></font>=
<p><font size=3D"2"><span style=3D"font-family:&#39;verdana&#39;,sans-serif=
"><br></span></font><font size=3D"2"><span style=3D"font-family:&#39;verdan=
a&#39;,sans-serif"></span></font></p><font size=3D"2"><span style=3D"font-f=
amily:&#39;verdana&#39;,sans-serif"></span></font><p><font size=3D"2"><span=
 style=3D"font-family:&#39;verdana&#39;,sans-serif">Thanks and Regards,</sp=
an></font></p><font size=3D"2"><span style=3D"font-family:&#39;verdana&#39;=
,sans-serif"></span></font><p><font size=3D"2"><span style=3D"font-family:&=
#39;verdana&#39;,sans-serif">Radhika</span></font><font face=3D"verdana, sa=
ns-serif"><span style=3D"font-family:&#39;\0065b0\007d30\00660e\009ad4&#39;=
,serif;font-size:16px"><span style=3D"font-family:&#39;calibri&#39;,sans-se=
rif"><span style=3D"font-weight:bold"><br></span></span></span></font></p><=
/div></div></div><div style=3D"height:0px"></div></div><br></div>

--0000000000001a6a5405b43f4141--
