Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 759DDB2B19
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 13:31:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Vr1F5GWfzF5vL
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 21:31:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com;
 envelope-from=joe.gialluca@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KaBTRho1"; 
 dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Vr0P6czFzF4yw
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 21:30:24 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id 201so30970378qkd.13
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 04:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:to;
 bh=YzIA6Myjps6wk/4h5iowWCIUVo1k1xLE1lsLGmhNbB8=;
 b=KaBTRho1BvxhCdBEb3E9u9AocTlONnXqnJ3puiYyThVdRbEqR/8HSPj2/wO2xAIXHu
 bOjETWG3xj/KxW/G4Q9jpE6IQGakpfNY9gHnLBXTCfZm3lKLd6ZdP3/Opx5yXte6yr3g
 muhPXL/BETfYQ11xwc2QNA8qsmJStHWWM64aYCaWrnYK/byc75XatrVNP8ooe55Cr+0b
 mtpjdFBl8jlTOxIMzHnQtxCzJFtVxiNsU66zMpprUSNjLO6ZT+EOrUTeJDLPaytzJuzu
 ABpTl3hHJ6nfK60rcmJ2tSiDn8YBxv6+K4/Q22L6ADwDXDxBhY/R792r3vzyugJAbaJK
 HdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=YzIA6Myjps6wk/4h5iowWCIUVo1k1xLE1lsLGmhNbB8=;
 b=B4n0RGd3uMbxMi2s3Q48Gg5wihTH6smo4mt/UFsIo447PYyhQ7PlQPZmnOdUgk5sQ6
 LTnqYvK1tH2BvTy0UfWNXNYAXcLchsSU1aA6xfX1CJnHpHuTT5JtfD+FGqp09U0BHOaQ
 UEwX5J5FnGisxKHTpdFLHOpxK4tq7yMshr+r3XeaIckP4MS1RSGXZpOKPQOjkT4Cc7jM
 FsRJzSdC2x4Nj9NlvPOk1ZAvZYb9rUVBZJfIlrRGFQXVPfXTSgL3puBwEI5JWjgqCUFP
 wejDsOvKJKNvQwGPxZnqQp6JJkVj9WXmMEfu6bORD6bAQ0xQKzjb6tEuWojhJPtgEda/
 F2WQ==
X-Gm-Message-State: APjAAAVpAUnlmv699oEOyPg1Ulm18cTqjtMM6aHMtdFC3xag1wrKtE/9
 lJfYDmXGxPdJ9yRa8YcSgJEdyXFdQ0A=
X-Google-Smtp-Source: APXvYqxoHFclYRp7BQHLhi/Cx6IuAWINy7aTvRViLJGZ7f9krJBCdlhUt25JHDApxSIiocD3eG/UvA==
X-Received: by 2002:a37:a955:: with SMTP id s82mr49280815qke.316.1568460620260; 
 Sat, 14 Sep 2019 04:30:20 -0700 (PDT)
Received: from [192.168.1.57] (c-24-61-160-143.hsd1.nh.comcast.net.
 [24.61.160.143])
 by smtp.gmail.com with ESMTPSA id m136sm13006380qke.78.2019.09.14.04.30.19
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 Sep 2019 04:30:19 -0700 (PDT)
From: Joe Gialluca <joe.gialluca@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E67F4792-5F52-403C-9D08-727BC8666A9C"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Information on Boxelder
Message-Id: <7DA89F57-35F7-41B3-94B7-62B72442E6D2@gmail.com>
Date: Sat, 14 Sep 2019 07:30:18 -0400
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.104.11)
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


--Apple-Mail=_E67F4792-5F52-403C-9D08-727BC8666A9C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


	Can anyone send me any information or pointers on Boxelder? I =
see tests for it in the OpenBMC automation test harness, but I don=E2=80=99=
t have a clue as to what it is. My Google-Fu has been inadequate to the =
task of finding more information on it. If someone has more insight as =
to what this refers to it would be much appreciated. Thanks in advance!

Joe Gialluca
joe.gialluca@gmail.com

"A human being should be able to change a diaper, plan an invasion, =
butcher a hog, conn a ship, design a building, write a sonnet, balance =
accounts, build a wall, set a bone, comfort the dying, take orders, give =
orders, cooperate, act alone, solve equations, analyze a new problem, =
pitch manure, program a computer, cook a tasty meal, fight efficiently, =
die gallantly.
Specialization is for insects.=E2=80=9D
~ Robert Anson Heinlein


--Apple-Mail=_E67F4792-5F52-403C-9D08-727BC8666A9C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
class=3D""><br class=3D""></div><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Can anyone send me any =
information or pointers on Boxelder? I see tests for it in the OpenBMC =
automation test harness, but I don=E2=80=99t have a clue as to what it =
is. My Google-Fu has been inadequate to the task of finding more =
information on it. If someone has more insight as to what this refers to =
it would be much appreciated. Thanks in advance!<div class=3D""><br =
class=3D""><div class=3D"">
<div dir=3D"auto" style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0); letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; word-wrap: =
break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div>Joe Gialluca</div><div><a =
href=3D"mailto:joe.gialluca@gmail.com" =
class=3D"">joe.gialluca@gmail.com</a></div><div class=3D""><br =
class=3D""></div></div>"A human being should be able to&nbsp;change a =
diaper, plan an invasion,&nbsp;butcher a hog, conn a ship, design&nbsp;a =
building, write a sonnet, balance&nbsp;accounts, build a wall, set a =
bone,&nbsp;comfort the dying, take orders, give&nbsp;orders, cooperate, =
act alone, solve&nbsp;equations, analyze a new problem,&nbsp;pitch =
manure, program a computer,&nbsp;cook a tasty meal, fight =
efficiently,&nbsp;die gallantly.<br class=3D"">Specialization is for =
insects.=E2=80=9D<br class=3D"">~ Robert Anson Heinlein
</div>
<br class=3D""></div></body></html>=

--Apple-Mail=_E67F4792-5F52-403C-9D08-727BC8666A9C--
