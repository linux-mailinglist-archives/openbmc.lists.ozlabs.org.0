Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5532CADEB1
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 20:17:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RxGQ5pYRzDqRH
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 04:17:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AlbVL9GB"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RxFn20MrzDqQD
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 04:17:00 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id j4so30946225iog.11
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 11:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GdUr4buEmN/8noaQnFPySOstUApw8gUJr51qx1uP4A0=;
 b=AlbVL9GBgy6eQuKky3anecKC+SN3BCm1XzOnjV9eyC7ilUlJl9UVoP62+nIrheX9lE
 D5LCNOPhUz9/YOaqg8Qq9gebhyOC2X61OcjizYDKRzay1Ansno+GhExSd4FUrJEMDEUQ
 uDanJU/ZYn+B8T3qOsNygxqUHGZKtOcIU9UWed0lm1DP0ZQDJrQKZZDVvAPWN20uhQZb
 OEL0YIdI9lupHox51guW6AMNAtZaOf5zHtQHyFQNLltJhIBmZ+/yluUh/sJcqa1A7lRT
 zoK36Oejb3svyp00+Nvckk4NUDWHn0xy0/t10QiCseC0cjNJcPONI9fIppQAahP2skp/
 3qTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GdUr4buEmN/8noaQnFPySOstUApw8gUJr51qx1uP4A0=;
 b=EfZA06DK2uhDOtAD4ecesa43yNYjaRgXdFgrv6RhWtE7SV6AAsb1dDyg8cAvoLIVdk
 uf4STA6UspTfE6XJNSMqKqHpC4rBZXpVSa6cNKtuxDr8yFQljfLgnYvN2GKDPXpVuIgs
 1yF1UoH1gY4TDADi8gGqQIub6roqUxlpfVWi603sKGWGDmHQFbTcKPrhMrMtxSWyANiz
 CxOzsbPP0M2qM3WB7RXzpbQ7cGyaJ5tPvbulxauToLUBEXGjq5NW7IhRFU88JxwHtjuc
 dFmrwhExcyXRYe/oUFbqfb2AkmdLCWKQZ+yyb9HlEXXazZb3q+l8iH1bno+ISecQzUwk
 yjUQ==
X-Gm-Message-State: APjAAAX2tpWZYgkyIIuD9DMCx/TZ7q4PX1a02qncxuk9QlP5BPnxYGX3
 Q3S/Pabwp9IsgBVFC8b9m598pFEnm2hTUnAay/BGCQ==
X-Google-Smtp-Source: APXvYqzRrvy8y4yjwYCraOpxb4y6XzbhEdBomu5F6LPuFsK6BOfwfishRlJ8zEA78L3zgI65/xCkzUCYCmZhQGA7TpY=
X-Received: by 2002:a02:712b:: with SMTP id n43mr723164jac.2.1568053016800;
 Mon, 09 Sep 2019 11:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <0f4eb2$2fgecj@orsmga002.jf.intel.com>
In-Reply-To: <0f4eb2$2fgecj@orsmga002.jf.intel.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 9 Sep 2019 11:16:23 -0700
Message-ID: <CAGMNF6U59o6zH72etrV4R4xeVgm9LnSx7TaUYMVy24tCiqnruQ@mail.gmail.com>
Subject: Re: [ENCRYPTED ATTACHMENT] Collectd and librrd based telemetry
 collection
To: piotr.matuszczak@intel.com
Content-Type: multipart/alternative; boundary="0000000000000e900b059222cbb2"
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

--0000000000000e900b059222cbb2
Content-Type: text/plain; charset="UTF-8"

hi Piotr,

Sorry this got previous sent to spam in my inbox, and the message got
turned into an attachment that got removed. Could you resend the message?

On Mon, Sep 2, 2019 at 2:46 AM <piotr.matuszczak@intel.com> wrote:

> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII
> Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP
> 957-07-52-316 | Kapital zakladowy 200.000 PLN.
>
> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego
> adresata i moze zawierac informacje poufne. W razie przypadkowego
> otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej
> usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> This e-mail and any attachments may contain confidential material for the
> sole use of the intended recipient(s). If you are not the intended
> recipient, please contact the sender and delete all copies; any review or
> distribution by others is strictly prohibited.
>
>

-- 
Regards,
Kun

--0000000000000e900b059222cbb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">hi Piotr,<div><br></div><div>Sorry this g=
ot previous sent to spam in my inbox, and the message got turned into an at=
tachment=C2=A0that got removed. Could you resend the message?=C2=A0</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Sep 2, 2019 at 2:46 AM &lt;<a href=3D"mailto:piotr.matuszczak@intel.c=
om">piotr.matuszczak@intel.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">---------------------------------------------=
------------------------<br>
Intel Technology Poland sp. z o.o.<br>
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.<br>
<br>
Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.<br>
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv></div>

--0000000000000e900b059222cbb2--
