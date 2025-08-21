Return-Path: <openbmc+bounces-496-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F916B2EEB6
	for <lists+openbmc@lfdr.de>; Thu, 21 Aug 2025 08:52:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6vCR0dMBz30T8;
	Thu, 21 Aug 2025 16:52:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755759171;
	cv=none; b=dcHCL8cxrGPwqIq7glsu/GEgUZZ0k0R0hmQcQhhpQYj7uhmIcIOOMvKMo3BbMUH9PamT074qSIID1OckAGJi42WWzqoBy1v0uU3ZhE3TGL5JqlYz3RFxUEZpzgCLrwMJe8YOxNQyfPR8hp7T7W8WHtFCbTXjwpNJ7kmeTA9cxO+Uo10SCR6cN8oMq5zGgZJqgg3N4UZudT1xd1Ye52vogpMtaUOrKQiasONmrO0vs0Lzoaz2R++B1sKG6dxctoatiYVV7AkJxJN2sky6PPuRc2gETsjJFrSYFs+okdYmTA9LBIwBD8ETkZtbdrKqaYIjZ9ROd9BZ3F0xrhXxbMqwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755759171; c=relaxed/relaxed;
	bh=hshl0YAzj8vJTudGiMPT36Cvts03FLcHE3dZvAzgg+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSDZH1AWL36eZzjZKRGIDkVMkaGqRHh7796mvjOA2Qc42whf7BAxx7vtew5DcOv102m9wxM1SHaa2Sdd3gfcdTmUziDIwX+f+ocyl051t5qeHsGcYYUjdYLxudQTOmwOC4LuRvUvs5yppIuuLv0FXgAhMXWFppDXSGBXIcOy8cUWig7+XywjKBN4zP7NMTGUnR5Z5yZURFFAcFzzQkErYxkJD7xDGNdGulUS/8bpTl733v70vlqlDcz10zg/ZAFChm9tROxyGdvRH17eE13gsQJfMC0JZOoYxU5PQovIg7sH4TOs5ajgtKyngQEwdKLjOb+eDAdj8S5BHDSD4bjWiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YTfJhJpt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YTfJhJpt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6vCP4dKXz2xPx
	for <openbmc@lists.ozlabs.org>; Thu, 21 Aug 2025 16:52:49 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e94dfbf7ba1so638851276.3
        for <openbmc@lists.ozlabs.org>; Wed, 20 Aug 2025 23:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755759166; x=1756363966; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hshl0YAzj8vJTudGiMPT36Cvts03FLcHE3dZvAzgg+g=;
        b=YTfJhJptUebunbxMv+O6VOJQ2TnXZAsfLBEvFioWevDaMxErzYxWmFXTa7AmKpeXST
         Nv+C67m0CRcp2KaCACT6seiDTxI7uN0epGgPbRP/zcy+wVw5VIoGoBl4XJqcNdWMjPJn
         t/WQkxWWaQGzSSKgdaXSPlxmLGUWZvl7PfoKY/Zp7U7+L2EenLmC2MLb4eFyF2IZnY7T
         JxC84T9B48VsO7cLi+lGAMtaTy0c/0YbUNM5ie9PKU7kt2WZPaCs9k+CigP+FfhgNIEN
         nP4L6ug16XjTpizt+mcYbb98TBhIpQ5kqb4nUHamDYvhQ/Lg6w0tZXodzE0KjCAdu4PI
         rKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759166; x=1756363966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hshl0YAzj8vJTudGiMPT36Cvts03FLcHE3dZvAzgg+g=;
        b=RBfyQD81V6gKK8u25CTheJ1p7vsoLgljtAqfmqx7MnMWBAtJW5JNy+BBVKHzJYEB8G
         IlQksomeTj7rCh0PZLaCiJb5lttjLXIyVAb6TJNa/Iog5t8LnxLqGLOlUUDvoCT6VJZX
         ijBforpMvG8YHWvteiBu0PTFpG1QeFbkLMZ5u2chNKNdEV8DTQlbnnSlF+adXfv2/0IM
         h/23fJ4vxXLvtIN8nQJ9cZf+nqoRWU0ee7jueVh7Rbs6PiflwHSHZVu2Mz3qZAUaK4/q
         oKt/b2JJr/g59QSwMYzXTRH6CF0cQPSw4CnMzceIerS9BIsNwq/8AKZ6VzhJav4pQjJ0
         Se3g==
X-Forwarded-Encrypted: i=1; AJvYcCXVVzSqNv+tS69aTlogG8nMa9HIs4Pt8VxtAH6ieo3RdPnTWncFGcbaOKOMPLk1yDvFE5fzqAUb@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCAowo6jF4u/lOV0natBP4xc5Vz7Lj+8uDR4iiKMPlHm0mKq1e
	2t5oDMQbV/fusQ1BRxKtYOvIBkJAWdNlRgzdzG6ImKao2bkOmLNt0++78QX7/QpxDN2SU/66ao4
	ZbFSI8Wkq7DuiDiH+GfPUCSo7/oKWd5M=
X-Gm-Gg: ASbGncufNRx+ARAabtYKrEBMlb/7gNP9CUa/wvENmQ3L7dl3j9x5EIL0lvX4hjXPo/q
	LzubxBcujB5YZ3Kne8lWJbGlZ2uWPk8J7xcGqwOlU/bPDBLoezUJciToRjeX7DkOf4rhzsO6MuL
	CKL4/VefoyX93nEaMu1jtILclzxTOhO3WePIVtGlvkXTVYDayrCd0+faR5IAp+rOF/OXxWYKeL/
	nFJ2AYQqz4EAJCIKdkJakbRZPaMkeEV/aBnnFK0EQ==
X-Google-Smtp-Source: AGHT+IGiQ8m12iPBLo/KWNGCImowEteJNk2fQE3GJt0EIRcC2Ap+T38j/276PFYq2UBeslSVlH5aFb4j8IBgJp38sYs=
X-Received: by 2002:a05:6902:540f:b0:e93:36f3:571a with SMTP id
 3f1490d57ef6-e95088fe627mr1281201276.19.1755759165737; Wed, 20 Aug 2025
 23:52:45 -0700 (PDT)
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
References: <aKOKlY97pOtfuaEv@heinlein> <aKThH-wUWmqyCisX@heinlein> <SJ0PR15MB446982270CCD58376C6A8BF1FA32A@SJ0PR15MB4469.namprd15.prod.outlook.com>
In-Reply-To: <SJ0PR15MB446982270CCD58376C6A8BF1FA32A@SJ0PR15MB4469.namprd15.prod.outlook.com>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Thu, 21 Aug 2025 12:22:34 +0530
X-Gm-Features: Ac12FXyeD1pxHJLD3ShXnFz03drVPqxL_fupgrkZM3nysJ5NfY0_zGLQuJ_mFoU
Message-ID: <CAK7Wosghi8vvq8Jh3bQA5m44OOAyB9wM7zCxhh2tTYJ0Ps+0vw@mail.gmail.com>
Subject: Re: TOF elections for 2025H2
To: Marri Devender Rao <devenrao@in.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000628fb6063cda8993"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000628fb6063cda8993
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I nominate Jinu Joy

--------------
Dhruvaraj S


On Thu, 21 Aug 2025 at 11:03=E2=80=AFAM, Marri Devender Rao <devenrao@in.ib=
m.com>
wrote:

> I nominate Manoj
>
>
> ------------------------------
> *From:* Patrick Williams
> *Sent:* Wednesday, August 20, 2025 02:09
> *To:* OpenBMC List
> *Subject:* [EXTERNAL] Re: TOF elections for 2025H2
>
> On Mon, Aug 18, 2025 at 04:18:29PM -0400, Patrick Williams wrote:
> >     https://github.com/openbmc/tof-election/tree/main/2025H1
>
> Rohit mentioned that I had the wrong link.  Please use this one for the
> current eligible developers:
>
>     https://github.com/openbmc/tof-election/tree/main/2025H2
>
> --
> Patrick Williams
>

--000000000000628fb6063cda8993
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I nominate Jinu Joy<br clear=3D"all"><br clear=3D"all"><d=
iv><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signa=
ture">--------------<br>Dhruvaraj S</div></div></div><div><br></div><div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 21 Aug 2025 at 11:03=E2=80=AFAM, Marri Devender Rao=
 &lt;<a href=3D"mailto:devenrao@in.ibm.com">devenrao@in.ibm.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border=
-left-color:rgb(204,204,204)">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I nominate Manoj</div>
<div id=3D"m_-2197022042721733526appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<b style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">From:</b>=C2=A0=
Patrick Williams<br>
<b style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">Sent:</b>=C2=A0=
Wednesday, August 20, 2025 02:09<br>
<b style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">To:</b>=C2=A0Op=
enBMC List<br>
<b style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">Subject:</b>=C2=
=A0[EXTERNAL] Re: TOF elections for 2025H2 </div></div><div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-size:11pt">On Mon, Aug 18, 2025 at 04:18:29PM -0400, Pat=
rick Williams wrote:<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=3D"noopener noreferrer" id=3D"m_-219702=
2042721733526OWAc7e9f1dc-d022-9f0a-5f5c-a04f15c458ee" href=3D"https://githu=
b.com/openbmc/tof-election/tree/main/2025H1" target=3D"_blank">
https://github.com/openbmc/tof-election/tree/main/2025H1</a><br>
<br>
Rohit mentioned that I had the wrong link.=C2=A0 Please use this one for th=
e<br>
current eligible developers:<br>
<br>
=C2=A0=C2=A0=C2=A0 <a rel=3D"noopener noreferrer" id=3D"m_-2197022042721733=
526OWA137be655-b26e-713c-5ac3-c20e56e5ad70" href=3D"https://github.com/open=
bmc/tof-election/tree/main/2025H2" target=3D"_blank">
https://github.com/openbmc/tof-election/tree/main/2025H2</a><br>
<br>
--<br>
Patrick Williams<br>
</div>
</div>

</blockquote></div></div>

--000000000000628fb6063cda8993--

