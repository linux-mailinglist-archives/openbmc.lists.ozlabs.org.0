Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22C48E171
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 01:24:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZhrC4P2xz3089
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 11:24:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VLfcOZPT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VLfcOZPT; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZhqp4phWz2x9P
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 11:24:04 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id y14so10160074oia.9
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jan 2022 16:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=Y4QuzQF77tU2uzJblOokDQJI4r0V8bFKBeBiA57XwEs=;
 b=VLfcOZPTDPA+YNWIP4W7vjKGzlWMoqXnKkJxwl4w97RUSicCs0mZixURjr3RwWOtPY
 qO/BHJLsKF+UgFTtKYpWPN/1M3SFSgIu56x8mr4xNK3ysBJmEK5/xGEkrI85rQXd0u1s
 icVqTQF27I6U2VhfmN6lbHT0WQYr7Ngk2dI/u377/vFyB52d/elpLDwxtvYi9rE6drRF
 B+LxXtUkviABeGszjklXJ1DtIe7A8e9jZzDYf+k5I8qIfrCfaOyuO4DRMvqhTw4ns0Pq
 WklVsyWofK7qzXu8qIzswMyHl6l20M/5j4cNm4Yp9oSzrsVrzGGZTU9GXDeKHcNx1f/3
 ivRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=Y4QuzQF77tU2uzJblOokDQJI4r0V8bFKBeBiA57XwEs=;
 b=xtv+jL77aJjFLxMJrlbnp8YUZXdSYDvBBKwANEueSmlLhucGlhDKw/W4T756cRPidJ
 OABzOvDY2+SOK9qDXxcU+8Xsg15XWY58tnRHCAp4Iz7qPaCgyxgJR+f95fSMaQDs7s+o
 bA4iAH9gqOXVquGAVZwywjWY4Bpz4KxjVPMa44yQk502cbimQt5G13HXxMKG1uxfUxMG
 SOVA619yDdhJHADARlJiipq+5Zr2WtvfIVq0LucWo3FUcEM3NoBqa0W3qK5QuKy2oPrQ
 bmMQOZ4T3A1yQ3Cdlp1Fk+B49/kvuH7ByqH3i4skcVABMWR5mHd0keLVRdVh91pfTNxf
 r+Zg==
X-Gm-Message-State: AOAM531TjMXdyVnOIATxkmtfBjpKcoqxrIVY30WJ8gnuEykZXzbjoSuR
 3m1C13OufZaVFeYPS5cN9z09tH45EZcHcg==
X-Google-Smtp-Source: ABdhPJwDnaY424uB6lNzCIhiMtnnc+hCw0k1SdQSJYc+IGVs2mYtepW5v2HDj9aVexkbaLsu0VY2hw==
X-Received: by 2002:a54:4191:: with SMTP id 17mr5131843oiy.131.1642119842271; 
 Thu, 13 Jan 2022 16:24:02 -0800 (PST)
Received: from smtpclient.apple ([70.39.92.56])
 by smtp.gmail.com with ESMTPSA id v26sm1145960oos.13.2022.01.13.16.24.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 16:24:02 -0800 (PST)
From: Mike Jones <proclivis@gmail.com>
Message-Id: <47171FDF-05E4-4501-A499-137A09D2FCCB@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_14C0D461-2EE2-4A0E-A144-C3A0C8961513"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: Sanitycheck problem
Date: Thu, 13 Jan 2022 17:24:00 -0700
In-Reply-To: <YeCqx/CTU7pRDVyj@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
References: <BEA6AAA9-904A-40D7-B114-A9229B38F0DE@gmail.com>
 <YeCqx/CTU7pRDVyj@heinlein>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
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


--Apple-Mail=_14C0D461-2EE2-4A0E-A144-C3A0C8961513
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

This is the error:

=
root@ubuntu:~/share/design/code/openbmc/build/ast2600-default/tmp/work/arm=
v7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e891=
9-r0/git# =
<mailto:root@ubuntu:~/share/design/code/openbmc/build/ast2600-default/tmp/=
work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+2=
6601e8919-r0/git#> meson build
The Meson build system
Version: 0.58.1
Source dir: =
/home/openbmc/share/design/code/openbmc/build/ast2600-default/tmp/work/arm=
v7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e891=
9-r0/git
Build dir: =
/home/openbmc/share/design/code/openbmc/build/ast2600-default/tmp/work/arm=
v7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e891=
9-r0/git/build
Build type: native build
Project name: dbus-sensors
Project version: 0.1
=20
meson.build:1:0: ERROR: Could not invoke sanity test executable: [Errno =
8] Exec format error: =
'/home/openbmc/share/design/code/openbmc/build/ast2600-default/tmp/work/ar=
mv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e89=
19-r0/git/build/meson-private/sanitycheckcpp.exe'.
=20
A full log can be found at =
/home/openbmc/share/design/code/openbmc/build/ast2600-default/tmp/work/arm=
v7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e891=
9-rroot@ubuntu:~root@ubrootroot@ubuntu:~/share/design/code/openbmc/build/a=
st2600-default/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-senso=
rs/0.1+gitAUTOINC+26601e8919-r0/git#

The path to sanitycheckcpp.exe is there, but fails, as if it must run on =
a different architecture.

> On Jan 13, 2022, at 3:42 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Thu, Jan 13, 2022 at 02:30:43PM -0700, Mike Jones wrote:
>> If i bitbske -c devshell dbus-sensors, them meson build, =
sanitycheck.exe fails with a exec for at error.
>=20
> What is 'sanitycheck.exe'?  I don't recognize that in any way and a
> search on our GH repo isn't showing anything either:
>=20
> https://github.com/search?q=3Dorg%3Aopenbmc+sanitycheck&type=3Dcode
>=20
> --=20
> Patrick Williams


--Apple-Mail=_14C0D461-2EE2-4A0E-A144-C3A0C8961513
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D"">This is the error:</div><div =
dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D""><br class=3D""></div><div =
dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D""><div style=3D"margin: 0in; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><a =
href=3D"mailto:root@ubuntu:~/share/design/code/openbmc/build/ast2600-defau=
lt/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAU=
TOINC+26601e8919-r0/git#" style=3D"color: rgb(5, 99, 193);" =
class=3D"">root@ubuntu:~/share/design/code/openbmc/build/ast2600-default/t=
mp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOIN=
C+26601e8919-r0/git#</a>&nbsp;meson build<o:p class=3D""></o:p></div><div =
style=3D"margin: 0in; font-size: 11pt; font-family: Calibri, =
sans-serif;" class=3D"">The Meson build system<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in; font-size: 11pt; =
font-family: Calibri, sans-serif;" class=3D"">Version: 0.58.1<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in; font-size: 11pt; =
font-family: Calibri, sans-serif;" class=3D"">Source dir: =
/home/openbmc/share/design/code/openbmc/build/ast2600-default/tmp/work/arm=
v7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e891=
9-r0/git<o:p class=3D""></o:p></div><div style=3D"margin: 0in; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">Build =
dir: =
/home/openbmc/share/design/code/openbmc/build/ast2600-default/tmp/work/arm=
v7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e891=
9-r0/git/build<o:p class=3D""></o:p></div><div style=3D"margin: 0in; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">Build =
type: native build<o:p class=3D""></o:p></div><div style=3D"margin: 0in; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">Project =
name: dbus-sensors<o:p class=3D""></o:p></div><div style=3D"margin: 0in; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D"">Project =
version: 0.1<o:p class=3D""></o:p></div><div style=3D"margin: 0in; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in; font-size: 11pt; =
font-family: Calibri, sans-serif;" class=3D"">meson.build:1:0: ERROR: =
Could not invoke sanity test executable: [Errno 8] Exec format error: =
'/home/openbmc/share/design/code/openbmc/build/ast2600-default/tmp/work/ar=
mv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e89=
19-r0/git/build/meson-private/sanitycheckcpp.exe'.<o:p =
class=3D""></o:p></div><div style=3D"margin: 0in; font-size: 11pt; =
font-family: Calibri, sans-serif;" class=3D""><o:p =
class=3D"">&nbsp;</o:p></div><div style=3D"margin: 0in; font-size: 11pt; =
font-family: Calibri, sans-serif;" class=3D"">A full log can be found at =
/home/openbmc/share/design/code/openbmc/build/ast2600-default/tmp/work/arm=
v7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+26601e891=
9-rroot@ubuntu:~root@ubrootroot@ubuntu:~/share/design/code/openbmc/build/a=
st2600-default/tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/dbus-senso=
rs/0.1+gitAUTOINC+26601e8919-r0/git#</div><div style=3D"margin: 0in; =
font-size: 11pt; font-family: Calibri, sans-serif;" class=3D""><br =
class=3D""></div><div style=3D"margin: 0in; font-size: 11pt; =
font-family: Calibri, sans-serif;" class=3D"">The path to =
sanitycheckcpp.exe is there, but fails, as if it must run on a different =
architecture.</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On Jan 13, 2022, at 3:42 PM, Patrick Williams =
&lt;<a href=3D"mailto:patrick@stwcx.xyz" =
class=3D"">patrick@stwcx.xyz</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Thu, Jan 13, 2022 at 02:30:43PM -0700, Mike Jones wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">If i bitbske -c devshell =
dbus-sensors, them meson build, sanitycheck.exe fails with a exec for at =
error.<br class=3D""></blockquote><br class=3D"">What is =
'sanitycheck.exe'? &nbsp;I don't recognize that in any way and a<br =
class=3D"">search on our GH repo isn't showing anything either:<br =
class=3D""><br class=3D""><a =
href=3D"https://github.com/search?q=3Dorg%3Aopenbmc+sanitycheck&amp;type=3D=
code" =
class=3D"">https://github.com/search?q=3Dorg%3Aopenbmc+sanitycheck&amp;typ=
e=3Dcode</a><br class=3D""><br class=3D"">-- <br class=3D"">Patrick =
Williams<br class=3D""></div></div></blockquote></div><br =
class=3D""></div>
</body></html>=

--Apple-Mail=_14C0D461-2EE2-4A0E-A144-C3A0C8961513--
