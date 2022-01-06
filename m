Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF9B48607F
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 07:14:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTwzk3SPsz2ywb
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 17:14:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=mWT1Mn8V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zohocorp.com (client-ip=136.143.188.7; helo=sender4-zc7.zoho.com;
 envelope-from=nikhil.vu@zohocorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com
 header.a=rsa-sha256 header.s=admin header.b=mWT1Mn8V; 
 dkim-atps=neutral
Received: from sender4-zc7.zoho.com (sender4-zc7.zoho.com [136.143.188.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTwzH0PlMz2yMk
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 17:14:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1641449638; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iSAbOZe5Md1X0Ewp8Y/S2Lwf3gbJvukTPlVLbaeJlXPYtMFzLz/EICilByAtx213Vq7Qqc++Vgc9X4w9U7EhXoFy2klbeeeXyyn31S1hwpSDJ9VNrJKgU5+0PkUo0SWbVQ4mzCxPGMOF+xlnMm0iVUW9QNPK/GYom2SmXH6mrTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1641449638;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=Z5Soo5MdQxhPOvg94epQuD1UywIyjjH+W8zswHwe0lU=; 
 b=EdgmqDDkOWjZ/mnLqm3tDL5vRTGY2ft7ODgZ4oeekCs2IrjuZCWpUxK4EKK0yiZ/vKj9z87nVMyGDTLvB+3zsU9hIz+perwOXEVq3NJSTE3D2MQ8zZFy4oserTs+na29Q8KDxAKKGThD/CP7E0qS9IMlkmbIc24q6/VozEmVbEE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohocorp.com;
 spf=pass  smtp.mailfrom=nikhil.vu@zohocorp.com;
 dmarc=pass header.from=<nikhil.vu@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1641449638; 
 s=admin; d=zohocorp.com; i=nikhil.vu@zohocorp.com;
 h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Subject:MIME-Version:Content-Type;
 bh=Z5Soo5MdQxhPOvg94epQuD1UywIyjjH+W8zswHwe0lU=;
 b=mWT1Mn8VToH2fwPAU4A9IFsY17eUtRSu/wAZCv86GAAUaqC3jW4vLl3d3ZsfGTNl
 yfHrwHu8mWfJCPK40ZOuyxIElOkuvrRwYB/yHOE/ccZMvC6Gfh0Kc4wy1FS59i3CAqe
 C8nyv0Kf1uh0oVToOTYoD0uhjvAckI0a9FL9HF/8=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1641449637063401.81971514954705;
 Wed, 5 Jan 2022 22:13:57 -0800 (PST)
Date: Thu, 06 Jan 2022 11:43:57 +0530
From: Nikhil V <nikhil.vu@zohocorp.com>
To: "patrick" <patrick@stwcx.xyz>
Message-Id: <17e2e05c4a9.fe9c680429794.6181982886793330035@zohocorp.com>
In-Reply-To: <YdXO9vLJP6pJRjGm@heinlein>
References: <17e1f659f9b.c8f061fb4115.9212316766481010802@zohocorp.com>
 <ff7a3d7fc5ed91ab62b935421f779a6407e817fc.camel@yadro.com>
 <17e1fba2bcf.ce6abdb85070.1975040279944804325@zohocorp.com>
 <bd8a1dec629cc9dd69c44578122a178d7af6eb7e.camel@yadro.com>
 <17e20148a9c.10fd4f6105879.8717643372259739590@zohocorp.com>
 <17e29ef3ecb.f538ffea22697.1377643688691911450@zohocorp.com>
 <YdXO9vLJP6pJRjGm@heinlein>
Subject: Re: [ERROR: Nothing RPROVIDES 'u-boot-default-env']
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_91632_234501786.1641449637033"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
Cc: openbmc <openbmc@lists.ozlabs.org>, akartashev <a.kartashev@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_91632_234501786.1641449637033
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

=C2=A0=C2=A0=20

=C2=A0=C2=A0 Thanks for your response, I totally agree with above points. A=
s I have SAMA5D27 lying arround and i wanted to explore/understand openbmc.

=C2=A0=C2=A0 Also i have seen some people have implemented openbmc on beagl=
ebone, raspberry pi, Freescale Processors.

=C2=A0=C2=A0 As no one has tried porting openbmc with Atmel SAM series proc=
essor, I thought that i can give it a try to port openbmc on SAMA5D27,

=C2=A0=C2=A0 Any pointer or document will be helpful.=20



Thanks & Regards,

Nikhil Muley










---- On Wed, 05 Jan 2022 22:31:42 +0530 Patrick Williams <patrick@stwcx.xyz=
> wrote ----



On Wed, Jan 05, 2022 at 04:40:52PM +0530, Nikhil V wrote:=20
=20
> =C2=A0=C2=A0=C2=A0 Trying to implement openbmc on SAMA5D27 development bo=
ard and to use secure boot feature provided by microchip. To make openbmc m=
ore secure.=20
=20
I don't have much help on your specific problem, but I think there is some=
=20
surprise in your use of this chip for a few reasons.=20
=20
 - This isn't really a BMC-oriented chip and is likely missing hardware tha=
t=20
 a BMC would typically have for interacting with the host processors.=20
=20
 - The A5 core in this chip is probably slower than the AST2500 (or maybe i=
n=20
 the same ballpark) which is already a generation behind.=20
=20
 - Aspeed has secure boot support also / already.=20
=20
This isn't to say that you might not be able to get the SAMA5D27 working as=
 a=20
BMC-like device for your system, but the fact that nobody else has decided =
to=20
build a server around it would give me a bit of concern if it showed up in =
a=20
system design I was working on.=20
=20
--=20
Patrick Williams
------=_Part_91632_234501786.1641449637033
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hi Patrick,<br></div><div>&nbsp;&nbsp; <br></div><=
div>&nbsp;&nbsp; Thanks for your response, I totally agree with above point=
s. As I have SAMA5D27 lying arround and i wanted to explore/understand open=
bmc.<br></div><div>&nbsp;&nbsp; Also i have seen some people have implement=
ed openbmc on beaglebone, raspberry pi, Freescale Processors.<br></div><div=
>&nbsp;&nbsp; As no one has tried porting openbmc with Atmel SAM series pro=
cessor, I thought that i can give it a try to port openbmc on SAMA5D27,<br>=
</div><div>&nbsp;&nbsp; Any pointer or document will be helpful. <br></div>=
<div><br></div><div>Thanks &amp; Regards,<br></div><div>Nikhil Muley<br></d=
iv><div><br></div><div id=3D"Zm-_Id_-Sgn" data-zbluepencil-ignore=3D"true" =
data-sigid=3D"58018000000014003"><div><br></div></div><div class=3D"zmail_e=
xtra_hr" style=3D"border-top: 1px solid rgb(204, 204, 204); height: 0px; ma=
rgin-top: 10px; margin-bottom: 10px; line-height: 0px;"><br></div><div clas=
s=3D"zmail_extra" data-zbluepencil-ignore=3D"true"><div><br></div><div id=
=3D"Zm-_Id_-Sgn1">---- On Wed, 05 Jan 2022 22:31:42 +0530 <b>Patrick Willia=
ms &lt;patrick@stwcx.xyz&gt;</b> wrote ----<br></div><div><br></div><blockq=
uote style=3D"margin: 0px;"><div>On Wed, Jan 05, 2022 at 04:40:52PM +0530, =
Nikhil V wrote: <br> <br>&gt; &nbsp;&nbsp;&nbsp; Trying to implement openbm=
c on SAMA5D27 development board and to use secure boot feature provided by =
microchip. To make openbmc more secure. <br> <br>I don't have much help on =
your specific problem, but I think there is some <br>surprise in your use o=
f this chip for a few reasons. <br> <br> - This isn't really a BMC-oriented=
 chip and is likely missing hardware that <br> a BMC would typically have f=
or interacting with the host processors. <br> <br> - The A5 core in this ch=
ip is probably slower than the AST2500 (or maybe in <br> the same ballpark)=
 which is already a generation behind. <br> <br> - Aspeed has secure boot s=
upport also / already. <br> <br>This isn't to say that you might not be abl=
e to get the SAMA5D27 working as a <br>BMC-like device for your system, but=
 the fact that nobody else has decided to <br>build a server around it woul=
d give me a bit of concern if it showed up in a <br>system design I was wor=
king on. <br> <br>-- <br>Patrick Williams <br></div></blockquote></div><div=
><br></div></div><br></body></html>
------=_Part_91632_234501786.1641449637033--

