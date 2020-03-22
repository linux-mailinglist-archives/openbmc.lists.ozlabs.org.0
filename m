Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8915218E93C
	for <lists+openbmc@lfdr.de>; Sun, 22 Mar 2020 14:53:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lf9L6vkGzDrF5
	for <lists+openbmc@lfdr.de>; Mon, 23 Mar 2020 00:53:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=ckimchan17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HfesEhNM; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lf8Y5QPYzDr55
 for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2020 00:52:23 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id g6so4717211plt.2
 for <openbmc@lists.ozlabs.org>; Sun, 22 Mar 2020 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:date:from:subject:thread-topic:to
 :content-transfer-encoding;
 bh=hyAkUTlAkV4VZlUhzgS1Na7F0BQtViXjzC5SX6qoA/0=;
 b=HfesEhNMlL8eCanKgu8lC3lrmBDeCkWaMF5TG3r/NNr18qtpsfa0ZjvX4+4LiS0uSm
 Lj+RVTHX+PsQW0dAk4RpPIzPh2GU5bFtXOinhL4QjpO3PRZMxToB+4XWOGrFBlUjyXoC
 42zqSXFH6tJVMPxkowzMFmyGoLShFayXdcIxk06F7TdHitGly3dC52mtpkXhklMcvrEq
 U/UcVgGByFHuKtXm6gpE5LdbXfGU/ue2851UocpA1RyvR4JAvkayvXfECItRXVT04OHp
 yDodgYtWHiFZekFi0QDuzTzKedp3FVx+El7jxC0ornshis233q5PevknF3esa3ZCyTez
 sj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:date:from:subject
 :thread-topic:to:content-transfer-encoding;
 bh=hyAkUTlAkV4VZlUhzgS1Na7F0BQtViXjzC5SX6qoA/0=;
 b=nf/FhD+yItO1EyybptCe1MLElCPl6bzlvPe19zfJgWIvpQiuaRFjYmAkHYWRA4LBE6
 dodq02iBke1LeXDLwhg+n1WYjkp8wx2V3A2n1Jw/UkVtMsA6kcL2LXFIwCLELZr7x+fP
 tvKMsNDp6+xst3Uo0jJ3vQjQ8RrkJTv7C7FpOFM9sS2EjEuNtWvbWeGOe/d3zmWOBPd+
 HepoTg4VHUgAwzs/WJgoj9rHNC5iBuwy8r93YmwSx4WhvU2fFdPN9tx8mwKIaeo5rIET
 m+cKtNWAtxm3236z1ve2C4nzEgYGgeN3UcnvmWkrqve/wFnvyVLAsBUV25DqrPhJrOjg
 ObOg==
X-Gm-Message-State: ANhLgQ0r10Jq21di9OrkvxHw0fyK0qbRKiiUklpScvQYo1i2HJ3HSlEE
 YG/E6W+XeemrrX4g83E3UlNCUY5g
X-Google-Smtp-Source: ADFU+vsADFtbHAE5RXugl4WRJ/C88fkuIoZzWdqdtklbXGZFPRWX+AiKRb+xg0Iz6f+nJ9Dhokuwfg==
X-Received: by 2002:a17:90a:f00e:: with SMTP id
 bt14mr19178311pjb.11.1584885137759; 
 Sun, 22 Mar 2020 06:52:17 -0700 (PDT)
Received: from smtp.gmail.com (180-177-28-13.dynamic.kbronet.com.tw.
 [180.177.28.13])
 by smtp.gmail.com with ESMTPSA id z17sm10731743pff.12.2020.03.22.06.52.16
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Mar 2020 06:52:17 -0700 (PDT)
Message-ID: <5e776d91.1c69fb81.75c18.85c6@mx.google.com>
MIME-Version: 1.0
Date: Sun, 22 Mar 2020 21:52:12 +0800
From: =?utf-8?Q?=E9=99=B3=EF=BC=8C=E6=9D=BE=E5=84=89?= <ckimchan17@gmail.com>
Subject: build environment
Thread-Topic: build environment
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"
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

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DZH-TW link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US>Hi all,</span></p=
><p class=3DMsoNormal><span lang=3DEN-US>Can I use Windows subsystem (ubunt=
u) or Cygwin to build openbmc?</span></p><p class=3DMsoNormal><span lang=3D=
EN-US>I tried but error at =E2=80=9C. openbmc-env=E2=80=9D command, any ide=
a?</span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></spa=
n></p><p class=3DMsoNormal><span lang=3DEN-US>### Initializing OE build env=
 ###</span></p><p class=3DMsoNormal><span lang=3DEN-US>-bash: ./oe-init-bui=
ld-env: No such file or directory</span><span lang=3DEN-US><o:p></o:p></spa=
n></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US>Jeff</span></p><p class=3DMsoNormal>=
<span lang=3DEN-US style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=
=94",serif'><o:p>&nbsp;</o:p></span></p></div></body></html>=

