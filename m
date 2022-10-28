Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A39261112B
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 14:22:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzMBX2Ddyz3cDP
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 23:22:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=QjT4cp9B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zohocorp.com (client-ip=136.143.188.7; helo=sender4-zc7.zoho.com; envelope-from=nikhil.vu@zohocorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=QjT4cp9B;
	dkim-atps=neutral
Received: from sender4-zc7.zoho.com (sender4-zc7.zoho.com [136.143.188.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzM9v2hpqz3bcw
	for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2022 23:22:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666959726; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mxXSOaqn63qBsT7b1j0ShiBkU2dp3sj6nVW6SPNGcD8tq9bJwhO8f/0icrhVSHsFINNnozEKA9POlW8YT2ULeuDCmc7EIdCz0UHRs+I6I25Vbgi+orH4PKO5MCeV8CcTtZ2sEz4+BTO61Hj5gYX2bXBPHgJ/MlAWGdGeQoRsDAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1666959726; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5AlNqOGtr601sZ/X1xwF1HcvXxtVveASatR7b5RiDFU=; 
	b=V0wYbt3sGWkQwKso8EwC2t7zFhrLGlfRz74a91fVwq3ZQAkTuCf4Zyi+2DkbIU3GxWovHNIv8Oy37h3vImCRZvuPIb2NDlFqODecwW/bxO5pLPoUGAvKY5KD8E/v7A7YY0sfhKIpnH+12NuQc5tMFRMuL4MfZfut6hZJRqfP/XE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohocorp.com;
	spf=pass  smtp.mailfrom=nikhil.vu@zohocorp.com;
	dmarc=pass header.from=<nikhil.vu@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666959726;
	s=admin; d=zohocorp.com; i=nikhil.vu@zohocorp.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-Id:Message-Id:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Reply-To;
	bh=5AlNqOGtr601sZ/X1xwF1HcvXxtVveASatR7b5RiDFU=;
	b=QjT4cp9BbgXljF8bEj1bJE1eYfh8o0VikXpk/Aves7/5RKg/f+HrTIBcvXMIDgPh
	YIdm2neV3dV7j4Hd0fdAdawcZZwlfLcgY1Jhmf5Aud8IS2BPRETeMn/lQnzsIXOfne/
	xkLwTFU2Bg/PQVqaFx7YDFrPCcjD5XR6GLUa2x6o=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1666959725520432.14120521465657; Fri, 28 Oct 2022 05:22:05 -0700 (PDT)
Date: Fri, 28 Oct 2022 17:52:05 +0530
From: Nikhil V <nikhil.vu@zohocorp.com>
To: "patrick" <patrick@stwcx.xyz>
Message-Id: <1841e8ad3c0.118df0b2e118974.5930685302191553052@zohocorp.com>
In-Reply-To: <Y1vAVwy6lgej/WEC@heinlein.stwcx.org.github.beta.tailscale.net>
References: <1841e00f475.fd648575116781.6157445050168975217@zohocorp.com> <Y1vAVwy6lgej/WEC@heinlein.stwcx.org.github.beta.tailscale.net>
Subject: Re: openbmc booting from external QSPI NOR Flash
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_393486_1705493352.1666959725505"
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_393486_1705493352.1666959725505
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 " Most systems use a SPI-NOR, so this should not be difficult.  W=
hat kind of trouble are you running into ? "



=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 As in beaglebone black it has onboard emmc. I donot want to use o=
nboard flash or sdcard. I want that it should boot from external spi flash =
(I have also set sysboot for same).



=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 My openbmc image is in ".wic" format which i flashed into sdcard =
through dd command. now i have connected external SPI NOR flash .

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 To program flash with openbmc image the programer has no option t=
o flash with ".wic" format.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Any other method or format of openbmc image available?





Thanks & Regards,

Nikhil Muley








---- On Fri, 28 Oct 2022 17:13:19 +0530 Patrick Williams <patrick@stwcx.xyz=
> wrote ---



On Fri, Oct 28, 2022 at 03:21:29PM +0530, Nikhil V wrote:=20
=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am unable to identify how cr=
eate image for SPI Flash, or what are the steps to carried out to load imag=
e in external qspi flash.=20
=20
Most systems use a SPI-NOR, so this should not be difficult.  What kind=20
of trouble are you running into?=20
=20
--=20
Patrick Williams
------=_Part_393486_1705493352.1666959725505
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hi Patrick,<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br></div><div=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; " Most systems use a SPI-NOR, so this should not be difficult.  =
What kind of trouble are you running into ? "<br></div><div><br></div><div>=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; As in beaglebone black it has onboard emmc. I donot want to use o=
nboard flash or sdcard. I want that it should boot from external spi flash =
(I have also set sysboot for same).<br></div><div><br></div><div>&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
My openbmc image is in ".wic" format which i flashed into sdcard through dd=
 command. now i have connected external SPI NOR flash .<br></div><div>&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; <br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To program flash with openbmc image the progr=
amer has no option to flash with ".wic" format.<br></div><div>&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Any other method or format of openbmc ima=
ge available?<br></div><div id=3D"Zm-_Id_-Sgn" data-zbluepencil-ignore=3D"t=
rue" data-sigid=3D"58018000000014003"><div><br></div><div><br></div><div>Th=
anks &amp; Regards,<br></div><div>Nikhil Muley<br></div></div><div><br></di=
v><div class=3D"zmail_extra_hr" style=3D"border-top: 1px solid rgb(204, 204=
, 204); height: 0px; margin-top: 10px; margin-bottom: 10px; line-height: 0p=
x;"><br></div><div class=3D"zmail_extra" data-zbluepencil-ignore=3D"true"><=
div><br></div><div id=3D"Zm-_Id_-Sgn1">---- On Fri, 28 Oct 2022 17:13:19 +0=
530 <b>Patrick Williams &lt;patrick@stwcx.xyz&gt;</b> wrote ---<br></div><d=
iv><br></div><blockquote style=3D"margin: 0px;" id=3D"blockquote_zmail"><di=
v>On Fri, Oct 28, 2022 at 03:21:29PM +0530, Nikhil V wrote: <br> <br>&gt; &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am unable to identify how creat=
e image for SPI Flash, or what are the steps to carried out to load image i=
n external qspi flash. <br> <br>Most systems use a SPI-NOR, so this should =
not be difficult.  What kind <br>of trouble are you running into? <br> <br>=
-- <br>Patrick Williams <br></div></blockquote></div><div><br></div></div><=
br></body></html>
------=_Part_393486_1705493352.1666959725505--

