Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A476D10F2EC
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 23:40:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Rg7W5hVmzDqNX
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 09:40:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T0WV7IDm"; 
 dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Rg6h43RLzDqN3
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 09:40:12 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id b8so1354260oiy.5
 for <openbmc@lists.ozlabs.org>; Mon, 02 Dec 2019 14:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=P9V/U0Yf9FimqNPei5XE9NZgbdsXzvX0CmD+QCzIwEs=;
 b=T0WV7IDmdVApK9vG4gG21FcFwPTSKkkrP3nsvX92lTsYESVAvLkC21/qRk9sYu6QH8
 QQlUwNSy+4X1RBwLfyfp/sCssHbzApw94bGPUuVIT5JvY0PpBE+E72j4Pcu9bGMtCtHP
 FWXP85wCuAzWYwNI0Blc044p0eTWKLkn9yLN4Ke9Img7CpYRexMvqsCSANjHPWXzmvzx
 z2SX2fIqGmkWnidN78fY8ANRy1thExGOW4GIGDjkLJjYrgHQR6fKnN/qaTvSBe4P+cQk
 vhrdVJHQHeqyM6G+vR1aOaNnQt4R7adam4P8CB4leMbtQm7r3JgTAnFdxquyzcp+PH+H
 TdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=P9V/U0Yf9FimqNPei5XE9NZgbdsXzvX0CmD+QCzIwEs=;
 b=PrQPytP9X0vUVQurRd//sTFikfIJSj37eTiUKkdgJhDU31zh41Rq2DNe9jJUDJZrau
 B9dz29VA5YIU1CA8hKDTc5vUl+d7HMcAuJ2rLDRETl+3N/KW3T5wJXYx0wqVnuvDiIUR
 YRqF7IgIZIWgFkCLarW3YMxsvZND5707Y1iMYPn2ISD0rsnGg/xhNAPPFDg2KdCh/CyH
 14jcNWzMMxCYFlYmt6ninTYabJ6Wa/zxU2+R+9E+Y3Reao45+CdI1zT1kvOurrz6SIzG
 z/wS/U7GfIrLXYMk54m6uGwHgdXFUskn+4rdhjWIKsZfL7Z9L2QJlKDODbK0XsgfRAqs
 ik1A==
X-Gm-Message-State: APjAAAV5wmHxhWj5t4P9AdMEOAPh7xSYFgJcj5v/nZaunF9RnmU97rAH
 8OXLOhYwo4pdq9nk4owZmqo=
X-Google-Smtp-Source: APXvYqyzDdF6W5BzAuoCj2WGiq469C0ptei0gnjole290bekgRv7bXsXOrtZunTYQOiUPYdNMPRAng==
X-Received: by 2002:aca:4587:: with SMTP id s129mr1162287oia.124.1575326408441; 
 Mon, 02 Dec 2019 14:40:08 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:5cae:41c2:7ad2:2179])
 by smtp.gmail.com with ESMTPSA id 64sm345175oth.31.2019.12.02.14.40.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Dec 2019 14:40:07 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <29B395B6-F25D-4D0F-98B5-DBBBCD6E6408@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_AA9874F9-92F3-4F00-A48C-487C44A9D1EE"
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: Command systemctl start xyz.openbmc_project.State.Host hangs
Date: Mon, 2 Dec 2019 16:40:07 -0600
In-Reply-To: <MN2PR04MB66690B44AF8D2827F0E0E209CD480@MN2PR04MB6669.namprd04.prod.outlook.com>
To: Zheng Bao <fishbaoz@hotmail.com>
References: <MN2PR04MB66690B44AF8D2827F0E0E209CD480@MN2PR04MB6669.namprd04.prod.outlook.com>
X-Mailer: Apple Mail (2.3601.0.10)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_AA9874F9-92F3-4F00-A48C-487C44A9D1EE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Nov 23, 2019, at 9:01 AM, Zheng Bao <fishbaoz@hotmail.com> wrote:
>=20
> Hi,
> I am trying to debug the state-manager.=20
>=20
> I started the host state manager by running the following comand.
> $ systemctl start xyz.openbmc_project.State.Host
>=20
> But it hangs. I add the debug code in host_state_manager_main.cpp and =
host_state_manager.cpp and it turns out the problem is not here.
>=20
> Does anyone can give me a hint which file I can look into next?

What happens if you just manually start the application by typing
"phosphor-host-state-manager=E2=80=9D on the command line? If it starts =
ok, what makes
you think it=E2=80=99s hanging? Does something like =E2=80=9Cobmcutil =
state=E2=80=9D return anything for
the host state after you run it?

>=20
> Zheng


--Apple-Mail=_AA9874F9-92F3-4F00-A48C-487C44A9D1EE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Nov 23, 2019, at 9:01 AM, Zheng Bao &lt;<a =
href=3D"mailto:fishbaoz@hotmail.com" =
class=3D"">fishbaoz@hotmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
style=3D"font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; font-family: =
Calibri, Helvetica, sans-serif; font-size: 12pt;" class=3D"">Hi,</div><div=
 style=3D"font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; font-family: =
Calibri, Helvetica, sans-serif; font-size: 12pt;" class=3D"">I am trying =
to debug the state-manager.<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""></div><div =
style=3D"font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; font-family: =
Calibri, Helvetica, sans-serif; font-size: 12pt;" class=3D""><br =
class=3D""></div><div style=3D"font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;" =
class=3D"">I started the host state manager by running the following =
comand.<br class=3D""></div><div style=3D"font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; font-family: Calibri, Helvetica, sans-serif; =
font-size: 12pt;" class=3D"">$ systemctl start =
xyz.openbmc_project.State.Host</div><div style=3D"font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; font-family: Calibri, Helvetica, sans-serif; =
font-size: 12pt;" class=3D""><br class=3D""></div><div =
style=3D"font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; font-family: =
Calibri, Helvetica, sans-serif; font-size: 12pt;" class=3D"">But it =
hangs. I add the debug code in host_state_manager_main.cpp and =
host_state_manager.cpp and it turns out the problem is not =
here.</div><div style=3D"font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;" =
class=3D""><br class=3D""></div><div style=3D"font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; font-family: Calibri, Helvetica, sans-serif; =
font-size: 12pt;" class=3D"">Does anyone can give me a hint which file I =
can look into next?</div></div></blockquote><div><br =
class=3D""></div><div><div>What happens if you just manually start the =
application by typing</div><div>"phosphor-host-state-manager=E2=80=9D on =
the command line? If it starts ok, what makes</div><div>you think it=E2=80=
=99s hanging? Does something like =E2=80=9Cobmcutil state=E2=80=9D =
return anything for</div><div>the host state after you run =
it?</div></div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div style=3D"font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;" =
class=3D""><br class=3D""></div><div style=3D"font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; font-family: Calibri, Helvetica, sans-serif; =
font-size: 12pt;" class=3D"">Zheng</div></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_AA9874F9-92F3-4F00-A48C-487C44A9D1EE--
