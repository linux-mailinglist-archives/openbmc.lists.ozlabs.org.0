Return-Path: <openbmc+bounces-1185-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D7CD1EFFA
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 14:12:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drmkC2by4z30T8;
	Thu, 15 Jan 2026 00:12:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768396355;
	cv=none; b=d+iY/q2P1yH/TyUOPAs7+3LbMO6rFMEXqXqsH+iyH3q9KSTfbbwf7hKNEEFyFYMSpzZnqQFFOk2mm4ZEfo4qBLN5acUqvEmztJaZLT2SRNpcpl/rbQZoqdfj9sC2a+CcMNevXo7/PC3d1B3DU+uTp3mNuJPcSXxf4oUvqCvscziQ510uTch5ylT8wENVAq3mmBuImJxXD8kdAQyueIAGEoblNH1FqJdn1vy4yvHd6higTeRSiyKkZdBB/8zuMfpWVuEntSMTNH2eQyySsIkJRVYNASL5AtJzOZ8gOPhkO1gGHV9hfmAyILeszFx3DeWJVLPiJNzW/SpW2eMEyzii4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768396355; c=relaxed/relaxed;
	bh=tTm7QyuohyCFO345lKaFzvR9mvkwOGDNDzbVBgc0oh8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fFfUXk6ko4xHHlz5XHgjsTLh0CP63+9BnyL4cQfMCgH7LRmP1fKQkKoHt07KMeFQb6DBA05B15vM3w+Rj7HltFwMLvI/zJuMba/YWpCZF+MM9p45ik2h7ShY/vXxVOtaA8HEHsY3aL6KemPGBX9IBhynzkKlxKluTYIGL0+JcTbVByFRxMrFoS7UveZ2WlGJGG3UWcOySOW1TLE0k/op3xPEHpawcbOZ5l32JWZLGFxx4EwC5AjTL5Cy/i0c6/3wbGpEo3j4fukNWX8nIgipz4yyu5xqJz3GfI+d5D93zwIZdjtfgdw3GYhsVZj9xD9aRlatzHu4YhOMstxcUrVNnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W09feutm; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=ksypassion@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W09feutm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=ksypassion@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drmkB18Cqz2xMQ
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 00:12:34 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59b6c905a46so7223286e87.1
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 05:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768396350; x=1769001150; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tTm7QyuohyCFO345lKaFzvR9mvkwOGDNDzbVBgc0oh8=;
        b=W09feutmshaCciqdhWCh38WwZA4wK3+ggnMzNYfPjCdHejGcKwSbCHyuQK19ONwen+
         wdikDqtu/52tw6BMgM5F8hCc1Z1hPSWOS5KKLX2a/AIhFy6yOkL9ip6XHwR5ytnnAMZR
         7XL16TS58dZGvHYMXtICaz3Lp7/aDXdAZfBFvhvlp0y/VoyZLzFeKif+VV4QiDbbI7kr
         IWJE3TMpp/UC2E7srqGkGbdJgsownmJVq9kAchqYucejIZoeJf9CW4wk5N3O39Lcxq3p
         1x+CuGYp2DFUODbQPMw/Qq6weKMi2R6yF06xGF9KKTf7s8NtLPcy6Jw76RdaoVwecPi5
         Y/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396350; x=1769001150;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTm7QyuohyCFO345lKaFzvR9mvkwOGDNDzbVBgc0oh8=;
        b=KwdzbMqqNy16FfGHwo2I1HmF2Qd77OHd3wS1nRIJ8G16Bwz2cEKLTI0smv8YQ2GCCi
         7QZ2diJKReRgY3fQs5iSto7uX9+thjBWFfmO1Da04cI3cWk/yMN3ufTVQdkQmrfXshvO
         m3+dZtjWi1xdKeyD+7g3TJgPuMauaPPxI0L3SwSgb8VbqajDHITGRoLBv7By38T7C7L4
         qtTZTwKf8WzOpf76nziVzxyZFoEes8aOkBOFOZAnoIl2A4oRg1bCC14J9sXz7+QGz2Is
         c71F5z3zTLMU5H99MzidE/RDpi23HcaqBCoQnpsm6tN1BhN1no/yS5eqZqcBSGfKhXR5
         ctAA==
X-Gm-Message-State: AOJu0YyEZr9grIklY9Rlm8u2/w8VPLyXdlcwHs3qsJu1IJY7Wt4VB4Qj
	3a0C+geHL7eczxibc6ELgq+ao5EjL4TUBFic4BYsZLdsGLIrVBLguh2tfgraL6g2OEDh668KuxT
	IMGc2blyMCXjeJuUNerxQFD7sp+3qFd8=
X-Gm-Gg: AY/fxX7iJe0sLfu7SY5NKeE+clXA7Lj1+F+oEk+MQn0qJf3gW5OwqUHL8xCxnoSa/1X
	x0A0AMLvFL6z4bxgkTJJ7cSEi/SN02Y1g9i9HDNqukU6jlWb7E3zffxgzlhG8kcevMFiXf6lz63
	Ogda5+Ak26UvKbVqBmipB0fP4ifmYXmp5VTL+gU+r2OUU93Y6XlhGQ8gjUqXe3b0VZgl2gXfr1k
	XQ4ZkbSGByuS2thIarjA0S6SvWQHmOHa3YgMKCyxU10/ef9WyzfYZNQmFkalovCNSFt1722
X-Received: by 2002:a05:6512:4011:b0:59b:420f:95dd with SMTP id
 2adb3069b0e04-59ba151b3f1mr844097e87.11.1768396350170; Wed, 14 Jan 2026
 05:12:30 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: Soo-yeon Kang <ksypassion@gmail.com>
Date: Wed, 14 Jan 2026 22:12:18 +0900
X-Gm-Features: AZwV_QgKbEhxktPmblUXdwVg0geyW18hG9dpk5H1CMo09AOP1DuiH75noK4Clik
Message-ID: <CAKmsAd=G03BtwLR09OXLmj=57E3XgE8fjqZ7b_MCQwLb8uyBVw@mail.gmail.com>
Subject: OpenBMC Corporate CLA Submission - XSLAB
To: Mike Dolan <manager@lfprojects.org>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000046288c064858dcdf"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--00000000000046288c064858dcdf
Content-Type: text/plain; charset="UTF-8"

Dear Linux Foundation Projects Team,

Please find attached the signed Corporate Contributor License Agreement
for XSLAB to contribute to the OpenBMC project.
(file name : OpenBMC_CCLA_XSLAB.pdf)

Company Information:
- Legal Company Name: XSLAB
- Address: (08389) R-dong 1701, Daeryung Post Tower 8th,
           43, Digital-ro 26-gil, Guro-gu, Seoul, Republic of Korea
- Country: Republic of Korea
- Website: xslab.co.kr


Initial Authorized Contributor (Schedule A):
- Full Name: Soo-yeon Kang
- Email: sykang@xslab.co.kr
- GitHub Username: ksypassion
- Gerrit Username: ksypassion


Point of Contact:
- Name: Soo-yeon Kang
- Email: sykang@xslab.co.kr
- Phone: +82-010-4067-8539


The CCLA has been signed by our CEO and includes Schedule A with
the initial authorized contributor information.

Please confirm receipt and let us know once the CCLA has been processed
and approved. I look forward to contributing to the OpenBMC project.

Thank you.
Best regards,


-- 


Soo-yeon  Kang

Mobile: +82 10 - 4067 - 8539
E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m

--00000000000046288c064858dcdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Linux Foundation Projects Team,<br><br>Please fi=
nd attached the signed Corporate Contributor License Agreement <br>for XSLA=
B to contribute to the OpenBMC project.<br>(file name :=C2=A0OpenBMC_CCLA_X=
SLAB.pdf)</div><div><br></div><blockquote style=3D"margin:0 0 0 40px;border=
:none;padding:0px"><div>Company Information:</div><div>- Legal Company Name=
: XSLAB</div><div>- Address: (08389) R-dong 1701, Daeryung Post Tower 8th,<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A043, Digital-ro 26-gil, G=
uro-gu, Seoul, Republic of Korea</div><div>- Country: Republic of Korea</di=
v><div>- Website: <a href=3D"http://xslab.co.kr">xslab.co.kr</a></div></blo=
ckquote><div><br></div><blockquote style=3D"margin:0 0 0 40px;border:none;p=
adding:0px"><div>Initial Authorized Contributor (Schedule A):</div><div>- F=
ull Name: Soo-yeon Kang</div><div>- Email: <a href=3D"mailto:sykang@xslab.c=
o.kr">sykang@xslab.co.kr</a></div><div>- GitHub Username: ksypassion</div><=
div>- Gerrit Username: ksypassion</div></blockquote><div><br></div><blockqu=
ote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Point of Conta=
ct:</div><div>- Name: Soo-yeon Kang</div><div>- Email: <a href=3D"mailto:sy=
kang@xslab.co.kr">sykang@xslab.co.kr</a></div><div>- Phone: +82-010-4067-85=
39</div></blockquote><div><br>The CCLA has been signed by our CEO and inclu=
des Schedule A with <br>the initial authorized contributor information.<br>=
<br>Please confirm receipt and let us know once the CCLA has been processed=
 <br>and approved. I look forward to contributing to the OpenBMC project.<b=
r><br>Thank you.<br>Best regards,<br><br></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div dir=3D"ltr"><br style=3D"color:rgb(51,51,51);font-family:Roboto;font=
-size:13.2px"><br style=3D"color:rgb(51,51,51);font-family:Roboto"><table s=
tyle=3D"border-collapse:collapse;border-spacing:0px;color:rgb(51,51,51);fon=
t-family:Roboto"><tbody><tr><td colspan=3D"2" style=3D"padding:0px 0px 2px;=
border-width:0px 0px 1px;border-bottom-style:solid;border-bottom-color:rgb(=
0,182,217);outline:none"><span style=3D"border-bottom:3px solid rgb(0,182,2=
17);padding:0px 0px 2px"><span style=3D"font-family:arial;font-weight:bold"=
>Soo-yeon =C2=A0Kang</span>=C2=A0=C2=A0</span></td></tr><tr><td valign=3D"t=
op" style=3D"padding:7px 16px 0px 0px;border:0px;outline:none"></td><td val=
ign=3D"top" style=3D"padding:7px 0px 0px;border:0px;outline:none"><div styl=
e=3D"margin:0px;padding:2px 0px 0px;border:0px;outline:none"><div style=3D"=
margin:0px;padding:0px;border:0px;outline:none"><span style=3D"color:rgb(0,=
182,217);font-family:arial">Mobile:</span>=C2=A0<span style=3D"font-family:=
arial">+82 10 - 4067 - 8539</span></div><div style=3D"margin:0px;padding:0p=
x;border:0px;outline:none"><span style=3D"color:rgb(0,182,217);font-family:=
arial">E-mail:</span>=C2=A0<a href=3D"mailto:ksypassion@gmail.com" style=3D=
"outline:none;color:rgb(0,0,0);text-decoration:none;border:none;font-family=
:arial" target=3D"_blank">ksypassion@gmail.co</a>m</div></div></td></tr></t=
body></table><div style=3D"margin:0px;padding:0px;border-width:1px 0px 0px;=
border-top-style:solid;border-top-color:rgb(208,208,208);outline:none;color=
:rgb(51,51,51);font-family:arial;font-size:small"><br></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>

--00000000000046288c064858dcdf--

