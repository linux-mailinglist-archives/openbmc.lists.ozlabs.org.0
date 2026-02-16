Return-Path: <openbmc+bounces-1372-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOVjCuXekmlvzQEAu9opvQ
	(envelope-from <openbmc+bounces-1372-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 10:09:57 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABDA141DCD
	for <lists+openbmc@lfdr.de>; Mon, 16 Feb 2026 10:09:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDxmr0Q5kz2xlq;
	Mon, 16 Feb 2026 20:09:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b12d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771232987;
	cv=pass; b=ZAtnLOrpNUcMJY7rL19Ip3ItfAawu5TkW3jDtOTfmnaz/kVtd7LfuLUMLSw04VambxmpR+OabvSEXbxLHrx0edbL61/Nt65w0zK9d/hFklwqJbx7wlUS6Rcx+u1dalFacTvDSm5ytvve/Xeg74Te0S1y7VtV9R/j6zK0H/sEDyyNP/78BRzpYimCEfzAeMOafs8JSHNKciyG2CmBjR1WCSQTjwnD2cmGYR4RW+dHwqsxu6ikQgtYv8gM4KjfwdfmOy8ypFiP0c4Hbz9QHgZe7TCE9x1GM1bcXmSpi1Y2R1gTsVq7haQ8WRwKJIoiB7cunE+xwrkA/dyUqYnw+45rpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771232987; c=relaxed/relaxed;
	bh=cDFAUTQI8VKZNrPNOXYkTspUlNFl+hDHHD17noqQ/BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkrVVrMRK9uM06eceaIgjZpy9l6gLUXz2MeVuokXwhSALUz1pzLDeVrVE/cd7i5ipMjkw+zuPoJcaeJM/mVM2iEvdCujD8iSEmLrGqxA7lv0lURoAHyDZ5SskA7IoOtYxtZ5hSHqH7ZmWRcaEvw6poFIsdgOVnE15wpA9yl70dfEjDdjxeXSJSNoYH/Lj4DveJixpoNLFIuVz6Nw4CvSeb3stFpUJRLY24+i5xN6Zk7t2zKeRZZeEZzx0uyRhrOi+ZjFkr/IclTeifk/HmAKPam2stxTH5X0bOPdi2tE+YDX4orPgbainBXKYw7Hl5sm0eXuHoH9t+EQwegQDiGsHQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P7HaD7dY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12d; helo=mail-yx1-xb12d.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P7HaD7dY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12d; helo=mail-yx1-xb12d.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12d.google.com (mail-yx1-xb12d.google.com [IPv6:2607:f8b0:4864:20::b12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDxmp30Ylz2xN4
	for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 20:09:46 +1100 (AEDT)
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-64937edbc9eso2450095d50.2
        for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 01:09:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771232983; cv=none;
        d=google.com; s=arc-20240605;
        b=jI2TUJYdFs4WsnzQsfvkAajwBRMuBOO3/DDR4kF+bfCJq7lZca5VFFQ202iaQtYszx
         I7BrjpoyFBf6ubzplIY4fVvqZpSkq6tndp94oH058r3IYHi0j/CbWvB4OSiAZ7BWfm9o
         2B2+c/zUg3evHDd5wHc6DX/uqHf0pDovtjD7jr0VcVo0/RtgK0BGimMtvyEyB8d/FCbg
         nJpquWk1hm3YIXXwktPl+dLI3acVcb6/nNibH0vrxEOjdq/piPIWMOaE3zc+fjpj04+d
         zjbQOe/ikMEtUr1Yu/VcJbk3xxw9N/LD5BRROvA1orikq5iLqda9BA6fzZm2+5zZlAba
         Mu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cDFAUTQI8VKZNrPNOXYkTspUlNFl+hDHHD17noqQ/BY=;
        fh=0FfVuzvYxnhY5V/+ItzmuC2VCI1wG38ARSvlpC4F6I8=;
        b=PwDlWOwz3WHsFAAQyeFbcGgx0qY9WR8cF9SLbKERIKOW7fln+GaoL0DCJRoXg9vkfe
         +w28cRY4wcqQ5RbGyZH5jAHYwqybYkfe67kYNsjJ0s8jcT76SUF/FTVOxMR9dTNKST6i
         1yc0JJy6T7KXnudu5Vaw5NzCaxwuUQQU/4K+N+eyVAWMW9e5ow5JWsbVAY5h3Lb8WYdK
         AgGp5eNCUsHSA735fYZ2PXqFSWtsvX/OB7Agq2b9xsZGcNt7IRmMttFlfZ/SNg9sjxsV
         z2eRfMQKBY7GWJdivirmcCatYiO+VtUjaxscn3xy2mZJrDxYC9ffEew5udxG67T7kvE3
         cUXQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771232983; x=1771837783; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cDFAUTQI8VKZNrPNOXYkTspUlNFl+hDHHD17noqQ/BY=;
        b=P7HaD7dY/964jamqgIMXBr4zK+nPvJdTNzUwczxGif5QChCn0E/EcoG+cnAcNqcHRS
         wjaMUbNg9PvqfOYnh2UrAPFlqfehFizEUw412vB18AG0NSrMfUkJ/spESChVT2bUqSg6
         ga2/Jahixn6FHk5ab64SNSutTjxekFVBvGVtkm39j/F/psX5OihL48XO7xLcuDSlCva8
         dITKFCRaC0wmj/1Dtro8S6hY2OYAYGaI/Nkl0Fwh/ohh7/KS2zerM7X+vKPKaurCyFJg
         pmC3BC0x+5T0x8GhxLeTk1rhsV2WNvTQF0sFOHU765UnWv3O7atTwoL7lW9QhUOxXGBp
         rZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232983; x=1771837783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDFAUTQI8VKZNrPNOXYkTspUlNFl+hDHHD17noqQ/BY=;
        b=nZ5/7Sa6vQ/DCvVGo81ABdzCw64zXnuFYC4oGSDBzGMHxYk43BKb7glNoQ7M4lT5QD
         BcCjH5h5FW9TtnQfM3BAUykil8YjJ01YOABHMPiUy/58+dIndguu9i5UTtJnlPObHPD5
         auBrKbAvMyZKSiw8PNrI00iZ1IP3w51lbtYdlguzmtPFFbe3glJYrFhhFeGGwxwYt+xl
         4qm+Cbo33N/VCwxMFR5zsSQpv0riUprqeVn7vvfdCcKZp6aUFp4Pbpz2wLbZXMy00aZQ
         eH8EN3rpR8K7BIwZDTFlJ+OcxZTj9W9Gd7bOUSMZ0LwTgWGISoP9yQqD44M2rvYcidTb
         b/+g==
X-Forwarded-Encrypted: i=1; AJvYcCUKtaDsDPT2pewyDi/ctwia89kcXHGu8QunDUdnTmRUq7eZQMJe337gPr3cx8/iML9zu2ODsrU7@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz0Tzf7wDqS3wfZNWWluaQPYwHwv10VSnUMFAW9kSFDmtdD/k8f
	hvNM50mZFw4DC5l7DHQn8PqzRTaQQHUj0dIYcUl0llVeK+y8rnXKnvccqTzzgEDJaO4ccO6Fvl6
	fnKLKiXtmVCsrNiIr1eh8lCaqzPxsRXg=
X-Gm-Gg: AZuq6aJaKqwcpGsxO0S9b8W3zpEFZ0OaXyAXhLznM6eM48+i7/OKEVwjoPj3GzUf/qs
	1ryQCho+KJgBOhQeYF8hvZ9rQsh6PHVFC3mn8XzgjhE2zUXXe42HQgIkuPbB8flOkCwhvq5vxkF
	XI+kG/IIq5Bbs7OhqCUtecmWKa/pClKpsvQRxcku2bRroptWQ60ZAqmnzgrHDHM6boAoQv9cURj
	ErI8BFTW9iwWeh6VlKzW+3fm8CbU202aa5oyK1Cdw0ojHMa8VvG0cb0Ij2k1TNTb5kQko7gZhxI
	7UWeCQLEBKZTK5pZ7Lg=
X-Received: by 2002:a05:690e:130b:b0:64a:d7b7:8fab with SMTP id
 956f58d0204a3-64c21b8b654mr5475057d50.91.1771232982888; Mon, 16 Feb 2026
 01:09:42 -0800 (PST)
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
References: <20260216085825.70568-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216085825.70568-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Mon, 16 Feb 2026 11:09:31 +0200
X-Gm-Features: AaiRm51_h8qib6o4u3GCexQYfNZ91aKVL-0AYWC6ipAENUVVpv6sVQ_iVnVEfoY
Message-ID: <CAHb3i=voxxmRum_GyZv3Fi+q2SSqAFTnOOaABnb=LdDHmcWT2A@mail.gmail.com>
Subject: Re: [PATCH] i2c: npcm7xx: Use NULL instead of 0 for pointer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Andi Shyti <andi.shyti@kernel.org>, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000c27397064aed50e8"
X-Spam-Status: No, score=0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1372-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[taliperry1@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,gmail.com,google.com,kernel.org,lists.ozlabs.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:andi.shyti@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taliperry1@gmail.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9ABDA141DCD
X-Rspamd-Action: no action

--000000000000c27397064aed50e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

On Mon, Feb 16, 2026 at 10:58=E2=80=AFAM Krzysztof Kozlowski <
krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Pointers should use NULL instead of explicit '0', as pointed out by
> sparse:
>
>   i2c-npcm7xx.c:1387:61: warning: Using plain integer as NULL pointer
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c
> b/drivers/i2c/busses/i2c-npcm7xx.c
> index 8b7e15240fb0..f667a873b81e 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1384,7 +1384,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(struc=
t
> npcm_i2c *bus)
>                  */
>                 bus->operation =3D I2C_NO_OPER;
>                 bus->own_slave_addr =3D 0xFF;
> -               i2c_slave_event(bus->slave, I2C_SLAVE_STOP, 0);
> +               i2c_slave_event(bus->slave, I2C_SLAVE_STOP, NULL);
>                 iowrite8(NPCM_I2CST_SLVSTP, bus->reg + NPCM_I2CST);
>                 if (bus->fifo_use) {
>                         npcm_i2c_clear_fifo_int(bus);
> --
> 2.51.0
>
>

--000000000000c27397064aed50e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace">Thanks!</div><div class=3D"gmail_default" style=3D"font-family=
:monospace,monospace"><br></div><div class=3D"gmail_default" style=3D"font-=
family:monospace,monospace">Reviewed-by: Tali Perry &lt;<a href=3D"mailto:t=
ali.perry1@gmail.com">tali.perry1@gmail.com</a>&gt;</div></div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Feb 16, 2026 at 10:58=E2=80=AFAM Krzysztof Kozlowski &lt;<a hre=
f=3D"mailto:krzysztof.kozlowski@oss.qualcomm.com">krzysztof.kozlowski@oss.q=
ualcomm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Pointers should use NULL instead of explicit &#39;0&#39;, as poi=
nted out by<br>
sparse:<br>
<br>
=C2=A0 i2c-npcm7xx.c:1387:61: warning: Using plain integer as NULL pointer<=
br>
<br>
Signed-off-by: Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowsk=
i@oss.qualcomm.com" target=3D"_blank">krzysztof.kozlowski@oss.qualcomm.com<=
/a>&gt;<br>
---<br>
=C2=A0drivers/i2c/busses/i2c-npcm7xx.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm=
7xx.c<br>
index 8b7e15240fb0..f667a873b81e 100644<br>
--- a/drivers/i2c/busses/i2c-npcm7xx.c<br>
+++ b/drivers/i2c/busses/i2c-npcm7xx.c<br>
@@ -1384,7 +1384,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct =
npcm_i2c *bus)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;operation =
=3D I2C_NO_OPER;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;own_slave_a=
ddr =3D 0xFF;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_event(bus=
-&gt;slave, I2C_SLAVE_STOP, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_event(bus=
-&gt;slave, I2C_SLAVE_STOP, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iowrite8(NPCM_I2CST=
_SLVSTP, bus-&gt;reg + NPCM_I2CST);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bus-&gt;fifo_us=
e) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 npcm_i2c_clear_fifo_int(bus);<br>
-- <br>
2.51.0<br>
<br>
</blockquote></div>

--000000000000c27397064aed50e8--

