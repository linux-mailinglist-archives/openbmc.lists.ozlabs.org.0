Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6E10A8D0
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 03:41:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47N4lY3RgRzDqKg
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 13:41:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f;
 helo=mail-wr1-x42f.google.com; envelope-from=ckimchan17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tijUN/OH"; 
 dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47N4kh3qmNzDqlB
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 13:40:25 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id z3so24839163wru.3
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 18:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=s7EEkCpIowz8OgoAIkypnuCGbrcTw1JDfFyPZUw7GwE=;
 b=tijUN/OHn4r3bG3sK4fYxDZ4ceS8TimDiy8GBtxblwf78X822upsEmuYb3G23rddCv
 x33dFE+NIL97VEqSr9ifwytYXKLaW/cawzUt69WUynJnemeYvhUjqUUZ0MorKOI2xX55
 ZmSiAr4nm26NX03vWwiSVT2Au50t6pgFN0CK6TBkz9tqSKCMBcJrTarNpXGVTCDMwVnW
 Fir//+4erm9stXc6TzRks7h4w0Ook6woBj3+3UtK5PiHBKX5XIfMXYw3eR06lM/f8lHn
 a9NPOWvBteNSrZZ3nDVKcT1gJqCR2wqJB+/mV72/SXtekWeMwiH1aA8HIaYdSayomqSQ
 FXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=s7EEkCpIowz8OgoAIkypnuCGbrcTw1JDfFyPZUw7GwE=;
 b=AP+XJvb0sYo1Og9WWWJAr0f4e/tCUZ5QPTxo4ZuVKYge4Yn47fmMkzFs8yRBb/0Rr5
 5l/d9CixMtgLmv2Mq8hvWczDGEKatgm2LtJ+B5V0KXas5rhiOS+ZZJcMrsFm9+UnZoG4
 wLSPEJXZWRvIMHWkZT3vFm0uteDzCDONwNpneTkXVNeqCIxSjwGLZHsxcqwXZmz9ucbR
 Yd+maqdFJgKft10oDQVYYdDPV+7G1E6OgrxfB1y69tZ8mOiXLvO3dPmd8FOYtd1FkyJL
 7X3vQguRBoKcZynIVB1uwfungBx2d9KsMM/RduC08sehYnP7tKkg/frq+XaNcc3aROpX
 Y5xA==
X-Gm-Message-State: APjAAAVj8YD7Gg9Yx1e/3/U5utC64YK90TTydWRUReYOCW4k2du4zuCU
 744e7EYwnodusF2k5tc+t/oK39w+jwd5Ql4OPyJRcRj7
X-Google-Smtp-Source: APXvYqyMJB/aE7XPJWDrpMxX8oDwsePQJS5M/N+dYNBqq0WbeGIplcYL3ADPmo4VoKqkVmN7sja/KP4mqV52IfPMJII=
X-Received: by 2002:adf:9f43:: with SMTP id f3mr40343215wrg.76.1574822420230; 
 Tue, 26 Nov 2019 18:40:20 -0800 (PST)
MIME-Version: 1.0
From: Jeff Chan <ckimchan17@gmail.com>
Date: Wed, 27 Nov 2019 10:40:09 +0800
Message-ID: <CAMpjGno21Fff20TqWS1jaW3x5_HDF4D+pTqz=coSgh8YwRzq3w@mail.gmail.com>
Subject: phosphor logging
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000f1370605984aeac1"
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

--000000000000f1370605984aeac1
Content-Type: text/plain; charset="UTF-8"

Dear openbmc developer,

I'm debugging chassis power on issue, and found that I can't use journalctl
to display debug information, for example:

in chassis_state_manager.cpp
Chassis::Transition Chassis::requestedPowerTransition(Transition value)
{

log<level::INFO>("Change to Chassis Requested Power State",
entry("CHASSIS_REQUESTED_POWER_STATE=%s",
convertForMessage(value).c_str()));
executeTransition(value);
return server::Chassis::requestedPowerTransition(value);
}

but journalctl only display "Change to Chassis Requested Power State", the
"CHASSIS_REQUESTED_POWER_STATE=%s" part is missed, can someone tell me how
to get it back? I tried google but can't find the answer.

And that will be great if someone can guide me how to port and debug power
control, I tried "obmutil chassison" in debug console but doesn't work. I
can't find detailed document about porting.

Thank you!

Jeff

--000000000000f1370605984aeac1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear openbmc developer,</div><div><br></div><div>I&#3=
9;m debugging chassis power on issue, and found that I can&#39;t use journa=
lctl to display debug information, for example:</div><div><br></div><div>in=
 chassis_state_manager.cpp</div><div><div style=3D"color:rgb(212,212,212);b=
ackground-color:rgb(30,30,30);font-family:&quot;Droid Sans Mono&quot;,&quot=
;monospace&quot;,monospace,&quot;Droid Sans Fallback&quot;;font-weight:norm=
al;font-size:14px;line-height:19px;white-space:pre"><div><span style=3D"col=
or:rgb(78,201,176)">Chassis</span><span style=3D"color:rgb(212,212,212)">::=
</span><span style=3D"color:rgb(78,201,176)">Transition</span><span style=
=3D"color:rgb(212,212,212)"> </span><span style=3D"color:rgb(78,201,176)">C=
hassis</span><span style=3D"color:rgb(212,212,212)">::</span><span style=3D=
"color:rgb(220,220,170)">requestedPowerTransition</span><span style=3D"colo=
r:rgb(212,212,212)">(</span><span style=3D"color:rgb(78,201,176)">Transitio=
n</span><span style=3D"color:rgb(212,212,212)"> </span><span style=3D"color=
:rgb(156,220,254)">value</span><span style=3D"color:rgb(212,212,212)">)</sp=
an></div><div><span style=3D"color:rgb(212,212,212)">{</span></div><br><div=
><span style=3D"color:rgb(212,212,212)">    </span><span style=3D"color:rgb=
(220,220,170)">log</span><span style=3D"color:rgb(212,212,212)">&lt;</span>=
<span style=3D"color:rgb(78,201,176)">level</span><span style=3D"color:rgb(=
212,212,212)">::</span><span style=3D"color:rgb(78,201,176)">INFO</span><sp=
an style=3D"color:rgb(212,212,212)">&gt;(</span><span style=3D"color:rgb(20=
6,145,120)">&quot;Change to Chassis Requested Power State&quot;</span><span=
 style=3D"color:rgb(212,212,212)">,</span></div><div><span style=3D"color:r=
gb(212,212,212)">                     </span><span style=3D"color:rgb(220,2=
20,170)">entry</span><span style=3D"color:rgb(212,212,212)">(</span><span s=
tyle=3D"color:rgb(206,145,120)">&quot;CHASSIS_REQUESTED_POWER_STATE=3D%s&qu=
ot;</span><span style=3D"color:rgb(212,212,212)">,</span></div><div><span s=
tyle=3D"color:rgb(212,212,212)">                           </span><span sty=
le=3D"color:rgb(220,220,170)">convertForMessage</span><span style=3D"color:=
rgb(212,212,212)">(value).</span><span style=3D"color:rgb(220,220,170)">c_s=
tr</span><span style=3D"color:rgb(212,212,212)">()));</span></div><div><spa=
n style=3D"color:rgb(212,212,212)">    </span><span style=3D"color:rgb(220,=
220,170)">executeTransition</span><span style=3D"color:rgb(212,212,212)">(v=
alue);</span></div><div><span style=3D"color:rgb(212,212,212)">    </span><=
span style=3D"color:rgb(197,134,192)">return</span><span style=3D"color:rgb=
(212,212,212)"> </span><span style=3D"color:rgb(78,201,176)">server</span><=
span style=3D"color:rgb(212,212,212)">::</span><span style=3D"color:rgb(78,=
201,176)">Chassis</span><span style=3D"color:rgb(212,212,212)">::</span><sp=
an style=3D"color:rgb(220,220,170)">requestedPowerTransition</span><span st=
yle=3D"color:rgb(212,212,212)">(value);</span></div><div><span style=3D"col=
or:rgb(212,212,212)">}</span></div></div></div><div><br></div><div>but jour=
nalctl only display <span style=3D"color:rgb(206,145,120)">&quot;Change to =
Chassis Requested Power State&quot;</span><span style=3D"color:rgb(212,212,=
212)"></span>, the &quot;CHASSIS_REQUESTED_POWER_STATE=3D%s&quot; part is m=
issed, can someone tell me how to get it back? I tried google but can&#39;t=
 find the answer.</div><div></div><div><br></div><div>And that will be grea=
t  if someone can guide me how to port and debug power control, I tried &qu=
ot;obmutil chassison&quot; in debug console but doesn&#39;t work. I can&#39=
;t find detailed document about porting.</div><div><br></div><div>Thank you=
!</div><div><br></div><div>Jeff<br></div><div><br></div><div><br></div><div=
><br></div><div><br></div></div>

--000000000000f1370605984aeac1--
