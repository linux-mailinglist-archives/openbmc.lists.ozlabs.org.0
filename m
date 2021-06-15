Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F398C3A7D04
	for <lists+openbmc@lfdr.de>; Tue, 15 Jun 2021 13:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G45TF4xw8z3bsq
	for <lists+openbmc@lfdr.de>; Tue, 15 Jun 2021 21:20:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=velankanigroup.com header.i=ramakrishnan@velankanigroup.com header.a=rsa-sha256 header.s=zoho header.b=vb7i8Od7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=velankanigroup.com (client-ip=103.117.158.11;
 helo=sender-op-o11.zoho.in; envelope-from=ramakrishnan@velankanigroup.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=velankanigroup.com
 header.i=ramakrishnan@velankanigroup.com header.a=rsa-sha256 header.s=zoho
 header.b=vb7i8Od7; dkim-atps=neutral
Received: from sender-op-o11.zoho.in (sender-op-o11.zoho.in [103.117.158.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G45Sw0Tgyz304T
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jun 2021 21:19:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1623755993; cv=none; d=zohomail.in; s=zohoarc; 
 b=Z2IiiSsL8mQQ9zie0DfOUQSqxf2M21TSvIGLdKufQm1idqy1ioyNvdbFpvje1nu+y9vnlBBJ3ak9BAAJ2mCoVN0/PxFVMxTGkHzwOdFsp0rxedNgD2aFHDgE/BurWj/dhtGVhQI3r4aHbqTinEi281oeJ6AzefJXK7FGN0CW6P8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; 
 t=1623755993; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=6VrAw1XJkqpDhwT8yBHbMT3IMj1/hyJoEgGzNwGp/pI=; 
 b=TDrtV/rFb0oCKp9nzXVEg390n7jg+l1nLU0H71vBCtVfj7QQPXXMkM0a0ZINHI9JLhhmFIANs4pfzXKNo5GZok+IpnJrw6/9RjUbO4joCR+oXlQYgWnCDqBruxUcpsh7jBNIUSWEogdvCsH7IbndklmGWIPLUrD26HC9nWpXdWI=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=velankanigroup.com;
 spf=pass  smtp.mailfrom=ramakrishnan@velankanigroup.com;
 dmarc=pass header.from=<ramakrishnan@velankanigroup.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623755993; 
 s=zoho; d=velankanigroup.com; i=ramakrishnan@velankanigroup.com;
 h=Date:From:To:Message-Id:In-Reply-To:Subject:MIME-Version:Content-Type;
 bh=6VrAw1XJkqpDhwT8yBHbMT3IMj1/hyJoEgGzNwGp/pI=;
 b=vb7i8Od72dmk4HrhY1gRT0Uof+BA3rgcqYiV5L15zdscDMfTwjRz89ZbW3fcAoY8
 2iCidO5Gf8NNdQBa9mVKC8vtDcR14m2QXP6TfI8XurEJF0UH635diytIV0aPsYZNqFb
 QpbER/MH3dQeg8FtKF3trTDZ0Aux4ltQR/HuvPP8=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1623755991244668.417612009771;
 Tue, 15 Jun 2021 16:49:51 +0530 (IST)
Date: Tue, 15 Jun 2021 16:49:51 +0530
From: ramakrishnan <ramakrishnan@velankanigroup.com>
To: "openbmc" <openbmc@lists.ozlabs.org>
Message-Id: <17a0f6628c9.13f9eb6c137656.4452866260022888382@velankanigroup.com>
In-Reply-To: 
Subject: meta-amd
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_448495_1426255676.1623755991241"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_448495_1426255676.1623755991241
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,



we are developing openBMC port for the Daytona platform with ATS 2500 BMC.=
=C2=A0 I=C2=A0 need the following functionality to be implemented.



1. Capture of the LSB of the 32-bit post code=C2=A0 and lit 8 LEDs on the G=
PIOAA port=C2=A0 by configuring SNPWADR with one address of 0x0080 and dire=
cting the data to the GPIO port pins GPIOAA[7:0].



2. Also read and store the 32-bit Post code as=C2=A0 4 bytes from the=C2=A0=
 the LPC I/O write cycles directed to=C2=A0 Port address 0x0080 , 0x0081, 0=
x0082 and 0x0083=C2=A0 in the root=C2=A0 file system for every power cycle =
and later display on the web GUI by=C2=A0 Configuring=C2=A0 post code contr=
ol register PCCR0-3 for=C2=A0 DMA/FIFO mode.=C2=A0



Could you please let=C2=A0 us know if=C2=A0 implementation for the above sa=
id two is available in=C2=A0 openBMC community else suggest implementation=
=C2=A0 =C2=A0pointers.



Regards,

Ramakrishnan
------=_Part_448495_1426255676.1623755991241
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hi,<br></div><div style=3D"color: rgb(0, 0, 0); fo=
nt-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13.3333px; fon=
t-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; widows: 2; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 2=
55, 255); text-decoration-thickness: initial; text-decoration-style: initia=
l; text-decoration-color: initial;"><br></div><div style=3D"color: rgb(0, 0=
, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial; font-size: 13.333=
3px; background-color: rgb(255, 255, 255);">we are developing openBMC port =
for the Daytona platform with ATS 2500 BMC.&nbsp; I&nbsp; need the followin=
g functionality to be implemented.<br></div><div style=3D"color: rgb(0, 0, =
0); font-family: Verdana, Arial, Helvetica, sans-serif; font-style: normal;=
 font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial; font-size: 13.3333p=
x; background-color: rgb(255, 255, 255);"><br></div><div style=3D"color: rg=
b(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; font-style:=
 normal; font-variant-ligatures: normal; font-variant-caps: normal; font-we=
ight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial; font-size: =
13.3333px; background-color: rgb(255, 255, 255);">1. Capture of the LSB of =
the 32-bit post code&nbsp; and lit 8 LEDs on the GPIOAA port&nbsp; by confi=
guring SNPWADR with one address of 0x0080 and directing the data to the GPI=
O port pins GPIOAA[7:0].<br></div><div style=3D"color: rgb(0, 0, 0); font-f=
amily: Verdana, Arial, Helvetica, sans-serif; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; font-size: 13.3333px; backgro=
und-color: rgb(255, 255, 255);"><br></div><div style=3D"color: rgb(0, 0, 0)=
; font-family: Verdana, Arial, Helvetica, sans-serif; font-style: normal; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial; font-size: 13.3333px;=
 background-color: rgb(255, 255, 255);">2. Also read and store the 32-bit P=
ost code as&nbsp; 4 bytes from the&nbsp; the LPC I/O write cycles directed =
to&nbsp; Port address 0x0080 , 0x0081, 0x0082 and 0x0083&nbsp; in the root&=
nbsp; file system for every power cycle and later display on the web GUI by=
&nbsp; Configuring&nbsp; post code control register PCCR0-3 for&nbsp; DMA/F=
IFO mode.&nbsp;<br></div><div style=3D"color: rgb(0, 0, 0); font-family: Ve=
rdana, Arial, Helvetica, sans-serif; font-style: normal; font-variant-ligat=
ures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial; font-size: 13.3333px; background-color=
: rgb(255, 255, 255);"><br></div><div style=3D"color: rgb(0, 0, 0); font-fa=
mily: Verdana, Arial, Helvetica, sans-serif; font-style: normal; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-sty=
le: initial; text-decoration-color: initial; font-size: 13.3333px; backgrou=
nd-color: rgb(255, 255, 255);">Could you please let&nbsp; us know if&nbsp; =
implementation for the above said two is available in&nbsp; openBMC communi=
ty else suggest implementation&nbsp; &nbsp;pointers.<br></div><div style=3D=
"color: rgb(0, 0, 0); font-family: Verdana, Arial, Helvetica, sans-serif; f=
ont-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; widows: 2; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial; f=
ont-size: 13.3333px; background-color: rgb(255, 255, 255);"><div><br></div>=
<div>Regards,<br></div><div>Ramakrishnan<br></div></div><div><br></div></di=
v><br></body></html>
------=_Part_448495_1426255676.1623755991241--

