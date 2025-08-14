Return-Path: <openbmc+bounces-456-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF69B269D8
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 16:45:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2p2K53D0z2yhX;
	Fri, 15 Aug 2025 00:45:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::a2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755182745;
	cv=none; b=h21Nykn7TLeUexKHgwUNSigAJiJ0uSboUhIMOA43X5ixDHgWcMM6DgRpNYCJmDdYMjEiAQc8081CNn8w0yYd7jnFHz41eRheeB1/isIBoyHgZ6juC5RQyUBp+RxR7gi+xFdfxYG+EUM51bud7xeRaEWrYsLZfTTIzEAwgxRGXENfK28v7ye7LnYuDH0Z49Ijm/x2Z1tKfAmbPvpGh31cpf1YTRuFxagx1SaG0U89rfxLZqzHvEpYrDgIaIxvsRokcJ6S5jCV1qlKNL9RCgdNkslhVsfomMFPAQ34hwSNn33kh4umPLAuUjACJui2UsdQMaQO6JKU+rgmNTS/4V3uVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755182745; c=relaxed/relaxed;
	bh=KoGcPMZXHzM6NwMEpMpFFHsvE66QhYvhQKxvfwcxkiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQRYzAZ5m56KAQ5byipIX4iSXtm+uVYqihAMbPvkqMB06REqye/qqJCtamgjdXC7gtbo3RORuyziXZQK2y5InvU7A6jwyTjV8vQvPoOB2zkaYkbhW9KRNTbdfS2t4f82LTBZnh9Q8I6Vt2VEhwbjh77b+IC6L5CSi0JywUR5UOhBC9LgdULj8sPogEz9l5apN3xi6KZ4XPm2ZgTBAokM0mjHMaYkzpKSNym3oLwb/jsPtqOYRss+UM670RxY1Z9lGU8HRR74kLuGyhOL+K0P4RSJdaK4r4xBQqoV4B6NGPX66vM3D6sd3O0boYnHztaVv0wJx6+gcuIbskDraOumHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bJGUiEOe; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bJGUiEOe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2p2J38zDz2xQ6
	for <openbmc@lists.ozlabs.org>; Fri, 15 Aug 2025 00:45:43 +1000 (AEST)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-53b174dbfceso331991e0c.2
        for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755182740; x=1755787540; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoGcPMZXHzM6NwMEpMpFFHsvE66QhYvhQKxvfwcxkiI=;
        b=bJGUiEOeAGR8qAEuTaFta/x7eM/yVFN9FjoAHkOdSVfs19+0G3Y84XVJ2dCCatYjEo
         EFyn+VEFwhUTLP+YJ96ZuWnsgI1siXTBzov7X06IRXxCyjdh1rrN6gFc8kmHjhcMNFE0
         28FiV/bohqEPpZi+OjGOnA5kw+gWaOMLVcp0qHKOPP1NnGHsYfXaFxUiQVD2+UhgVOqx
         jIaDixhCOC1qTu1mZiVlgc9DX+IODPs7IsXNCX9zzEt/acFLR9bZl/NgjSD+SHT7F1ot
         NWNhjtL0jzY+SuJ4tpuDrrwqbRBtzXCXjpiEik5Z1po5JP/ak3QCnpSOVeV7BTRg9Byh
         0reQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755182740; x=1755787540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoGcPMZXHzM6NwMEpMpFFHsvE66QhYvhQKxvfwcxkiI=;
        b=fvZL6wmRO4Sk97/ByvlEmsYIpTi7fIQy1iZS/pi2YIljnbkY6+6x8JTAYr59yAX4mr
         ME2r7ExQCDiZqzzGzqu3MapC32Jls4Yx86WbZcTa4uzkSO3lUg81Tj65AB33B2qR+t2Y
         VxXR27vQ4J9XFGrpCaJy4seYEAlWLIPBK0TLuM4nArCXK73d6uqNDR2vfVCaarkBR6Ve
         Hs1jDroI7DkliHhT86EhotZRCqK9AZQRJTQHGPDpI0UXZBwsH77F804cTGupv5WFbvdo
         6k9IHAetHeXLsh6heXUgBfhDQv3KZ10mYfWG9XeTEFehy7hJ0e3AUP1kk0I6bCw38r9d
         887Q==
X-Gm-Message-State: AOJu0Yw0kQ/g6K0g5Xthw+Nj1t5mur/14rM8DDxDaO1AQ7CUXAleuRPR
	jndbcKn3hIWZXNnzJV3AHOmszxCCPUAUJY8KUpUQ3KYg9jXXWoyz18F5E9LKlPeWPtKZ8n701/u
	wFArWRF/bTKR6Hw1ErHwmuCBTNx32jhc=
X-Gm-Gg: ASbGncuzYl0HjDYfVPeakUGgy1tOoPUTIjC9CpqN3VlOaSTrb7ShQhWS8gdee3YqWSY
	eMw34Sl2zS6Ckr4JcgrbRA/qn2H2ZrsnGamRZFvbX0bzA7wZqP3oGWWc9hqtu5RAtNsQL2P/S8D
	fr8/nNzLvG1/PNhZ53Ja681G8Oo8I+NXQCY6MUdmAY4+8Hi+Ibn+e2QsvshLVR7cAHg1W4km+Gc
	/YoSQHB
X-Google-Smtp-Source: AGHT+IGEJbNpTjIZdQE3WpFCBrFnVABT5LqecdYsSxYjzYEd1aiyCMiwv49x6TebtLQRr5+1H1RFtqadZKzW2RcfrAU=
X-Received: by 2002:a05:6102:510f:b0:4fd:3b3:d4b0 with SMTP id
 ada2fe7eead31-5100271cc8emr1265902137.20.1755182740595; Thu, 14 Aug 2025
 07:45:40 -0700 (PDT)
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
References: <SEYPR04MB7755127F14678E6D3616B901F162A@SEYPR04MB7755.apcprd04.prod.outlook.com>
 <TY0PR04MB73524FA10F833221A4C2A51EF15CA@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352C16AEABDB768394727B2F135A@TY0PR04MB7352.apcprd04.prod.outlook.com>
In-Reply-To: <TY0PR04MB7352C16AEABDB768394727B2F135A@TY0PR04MB7352.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 14 Aug 2025 16:45:23 +0200
X-Gm-Features: Ac12FXx3HrOVDOMXM3PCnPaY6R5Tg1nys_sXEmUPl1cU593QD6V_Kv6R1ingoOo
Message-ID: <CALLMt=ojGUwXBpwr_dzkRqkuSvbS5XEz4BRrmsK7vfJtOaJ3Vg@mail.gmail.com>
Subject: Re: Quantas CCLA Schedule A update 20250813
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	=?UTF-8?B?Q29zbW8gQ2hvdSAo5ZGo5qW35Z+5KQ==?= <Cosmo.Chou@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 14, 2025 at 4:17=E2=80=AFAM Litzung Chen (=E9=99=B3=E5=88=A9=E7=
=90=AE)
<Litzung.Chen@quantatw.com> wrote:
>
> Hi team,
> Please find the attached file for updated Schedule A of CCLA from Quanta.

Thanks for keeping it updated. I've uploaded it to the project's google dri=
ve.

