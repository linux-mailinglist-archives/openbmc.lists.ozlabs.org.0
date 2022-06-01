Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF85539FDC
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 10:51:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCjZ21pqnz3bfr
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 18:51:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=ZFW48dKO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zohocorp.com (client-ip=136.143.188.12; helo=sender4-op-o12.zoho.com; envelope-from=nikhil.vu@zohocorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=ZFW48dKO;
	dkim-atps=neutral
X-Greylist: delayed 906 seconds by postgrey-1.36 at boromir; Wed, 01 Jun 2022 18:51:30 AEST
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCjYZ5dDBz2xnR
	for <openbmc@lists.ozlabs.org>; Wed,  1 Jun 2022 18:51:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1654072579; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=en9BZWImvoH13icfeRJtAZQ2Fl262cyJNm+Q2WI9CabjjpDV+HkzhDg5XgKcHOhmkWXCOzSeuVZK0IdrLQYmXLg3Bjsf24OOclERz3Rj+v/3zWPJW8s/ygFT0OI4WapqUqXJL9GauNYKG1EIC3f/KL9ukv7hnm+Aec6U+JH071o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654072579; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=sCEQ2O/aQG/VqOJ3dQy65hGXMh0Ia79Sj9TjFHbRgjs=; 
	b=mWULZZPUDqiYX0lfNbVCvxoslLSUX3MbiQZoZsnOH583gTToFzL5r/cIJDxMLCWIAX+upTmrRzCer476+rVtYoHSHLvuXc2vWQxsviYa5KzRbdN6hMuUr23BQ64BK2u22oV0ASyPv4OP1z+3vNB+yRAlllspWyYknKfJj+3fxdI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohocorp.com;
	spf=pass  smtp.mailfrom=nikhil.vu@zohocorp.com;
	dmarc=pass header.from=<nikhil.vu@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654072579;
	s=admin; d=zohocorp.com; i=nikhil.vu@zohocorp.com;
	h=Date:Date:From:From:To:To:Message-Id:Message-Id:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Reply-To:Cc;
	bh=sCEQ2O/aQG/VqOJ3dQy65hGXMh0Ia79Sj9TjFHbRgjs=;
	b=ZFW48dKOyNqWDJbgNU/3IhFDBu6iYe5WaBMn1aR0SudrZzf0Mv/WHU++O8y4QONK
	q0NTkvhyEsHJOU4jZL9vb5NTNLk1173frlBsaqgeDydDRFPtX6PITK7+qaHKHMyAEFw
	jSo7dYICfXyyV/qiE4cbMpcf3ePauTXvfuU3wU5w=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1654072577665885.3130938710298; Wed, 1 Jun 2022 01:36:17 -0700 (PDT)
Date: Wed, 01 Jun 2022 14:06:17 +0530
From: Nikhil V <nikhil.vu@zohocorp.com>
To: "openbmc" <openbmc@lists.ozlabs.org>
Message-Id: <1811e688e68.f6b260b112172.7670613845716605077@zohocorp.com>
In-Reply-To: 
Subject: [ Entity Manager - Beaglebone Adc }
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_38477_785283697.1654072577640"
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

------=_Part_38477_785283697.1654072577640
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi ALL,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I have successfully =
ported openbmc on beaglebone black. I have displayed LM75, and ADC result o=
n webui.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Now I am doing the s=
ame with Entity Manager. I have displayed LM75 result successfully, But una=
ble to display ADC result through Entity Manager.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Below is my Config f=
ile.

{

=C2=A0=C2=A0=C2=A0 "Exposes": [

=C2=A0=C2=A0 =C2=A0{

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Index":=
 0,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Name": =
"PSU 12 Volt",

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ScaleFa=
ctor": 0.1124,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Type": =
"ADC"

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },

=C2=A0=C2=A0 =C2=A0{

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Index":=
 1,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Name": =
"PSU 5 Volt",

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ScaleFa=
ctor": 1,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Type": =
"ADC"

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Address=
": "0x48",

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Bus": 2=
,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Name": =
"Ambient 0 Temp",

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Type": =
"TMP75"

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

=C2=A0=C2=A0=C2=A0 ],

=C2=A0=C2=A0=C2=A0 "Name": "xplode",

=C2=A0=C2=A0=C2=A0 "Probe": "True",

=C2=A0=C2=A0=C2=A0 "Type": "Board"

}



1) How to display ADC value through entity manager

2) I would like to control single pwm pin



Any pointer would be helpful or what are the steps to display adc value/PWM=
 control





Board used : Beaglebone Black



Thanks & Regards,

Nikhil Muley
------=_Part_38477_785283697.1654072577640
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D"font-family: Verdana, Arial, Helvetica, sans-serif=
; font-size: 10pt;"><div>Hi ALL,<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; I have successfully ported openbmc on beaglebone=
 black. I have displayed LM75, and ADC result on webui.<br></div><div>&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Now I am doing the same w=
ith Entity Manager. I have displayed LM75 result successfully, But unable t=
o display ADC result through Entity Manager.<br></div><div>&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Below is my Config file.<br></div><d=
iv>{<br></div><div>&nbsp;&nbsp;&nbsp; "Exposes": [<br></div><div>&nbsp;&nbs=
p; &nbsp;{<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; "Index": 0,<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "Name": "PSU 12 Volt",<br></div><div>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "ScaleFacto=
r": 0.1124,<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; "Type": "ADC"<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; },<br></div><div>&nbsp;&nbsp; &nbsp;{<br></div><div>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "Index": 1,<br></=
div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 "Name": "PSU 5 Volt",<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; "ScaleFactor": 1,<br></div><div>&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "Type": "ADC"<br></div=
><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br></div><div>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "Address": "0x48",<br></div><div>=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "Bus": 2=
,<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; "Name": "Ambient 0 Temp",<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "Type": "TMP75"<br></div><div>&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br></div><div>&nbsp;&nbsp;&nbsp; ],=
<br></div><div>&nbsp;&nbsp;&nbsp; "Name": "xplode",<br></div><div>&nbsp;&nb=
sp;&nbsp; "Probe": "True",<br></div><div>&nbsp;&nbsp;&nbsp; "Type": "Board"=
<br></div><div>}<br></div><div class=3D"zmail_signature_below"><div id=3D""=
 data-zbluepencil-ignore=3D"true" data-sigid=3D"58018000000014003"><div><br=
></div><div>1) How to display ADC value through entity manager<br></div><di=
v>2) I would like to control single pwm pin<br></div><div><br></div><div>An=
y pointer would be helpful or what are the steps to display adc value/PWM c=
ontrol<br></div></div></div><div><br></div><div>Board used : Beaglebone Bla=
ck<br></div><div><br></div><div>Thanks &amp; Regards,<br></div><div>Nikhil =
Muley<br></div></div><br></body></html>
------=_Part_38477_785283697.1654072577640--

