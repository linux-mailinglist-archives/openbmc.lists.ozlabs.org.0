Return-Path: <openbmc+bounces-56-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342CBABCC67
	for <lists+openbmc@lfdr.de>; Tue, 20 May 2025 03:38:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1cdP5QfKz2yw7;
	Tue, 20 May 2025 11:38:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::92c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747705097;
	cv=none; b=crWJNwcqq4HGBzdfRoyEubBKBu30pDw6bNof+jMKaaekA/fsFxRlvyTyQr4bTeU45yEXCWL7lAR38+/I1XGJ//vxVLvd0C0nlc6VxduhM13DWV9Hah9oLlil2TvcPZXLr6zAOrUNx/tbn2qBIMY8ph/ucG9uW52ZfEK7Uo6I6UQYRmt2dEiz+3ykFmiPRtCDaNJvb71fKoUI20D8t6h+lhbQmKt8colFgcw4q727ghHiP0ieytFa3s9x2Wq5hdyjYTO36duWxKJhmM2nDHL0JYjLyAz0BgvI3/z0R3D6ovNTa1NVM3PVeHXN70sKlaepT+dUa2PQjZsSSPSuUwsq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747705097; c=relaxed/relaxed;
	bh=iUKqxoI7NXdBCWAh9L8++T8Lc6VMXcQp7dThgLfZ19E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeZboaIxqLbveUBMd7yHWYwsVoVtEXo1j5t/5kUPokP7kP72ZSWbFw/q9a/cWg8xpuWcPoD8gp3HBvo3x+n8GhIlzNKTz6pGGrMcFbr7EcB/DJHJZcAiFlLjbrci5PEuLqVf1KUidZgtPF9zB5z4x6OA7vR/9B7dWXFDYHChE7Mnr7rhpPSyn44x68LCO2QkvlVvDnbJ+HuxPJZqmsPGsY2+6Rlpq3+MlEhBbniGDY5pmXEjhR/GnBiS+2UGgyCTLzOJ3PqU3KQ9iMCLn9LI1AGmtILCl0YaoIWKLp4OVSYFmsGaRvl3k0QJqwLiLDqxhe403Pef2jyAiMPvcBJ3pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DJQhPchN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DJQhPchN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1cdN27V6z2yr9
	for <openbmc@lists.ozlabs.org>; Tue, 20 May 2025 11:38:15 +1000 (AEST)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-87c04aeef0fso519222241.1
        for <openbmc@lists.ozlabs.org>; Mon, 19 May 2025 18:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747705093; x=1748309893; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUKqxoI7NXdBCWAh9L8++T8Lc6VMXcQp7dThgLfZ19E=;
        b=DJQhPchN0puq+sgxLeg5fxlnp8k8TRED8KQ4HpciMnDpG0iAsnyBg4CoxT96OzwaqN
         1FPlTPh2TVDheFWf+S1AijiW9VE+1eJk3xrEoCaMjrpidCKn1q40Wu08owJeymAA1sVH
         RkJY29lHK2evbqpapL+2Z0jRKEv5/1V84IpFZn6jnC/fvF0IJQZaBnTSeo5iwJdjz4Tg
         Q+g9BDJFjtDNkaYWpamdMyzutpoYS7L44HqaSJ2cXku99MtwqzF7AtVoYIo46TUITUa+
         2HP8RQV3sAIGnNAwdTcaBIolvNm1m2yK+rESmIyTmgbrm3E8d+ADZM3Yd5OLxGy8Sg5A
         avlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747705093; x=1748309893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUKqxoI7NXdBCWAh9L8++T8Lc6VMXcQp7dThgLfZ19E=;
        b=skXoJ2+hxgWBPdUuaDaJ4ilp6b2Ma06RkGxQ69e0ES5dh/rTAd0MGpM+OtM8RBXv9a
         2UwJRV+EY0hVzTmUQWb6tk3SnBkAApsskdpB0Nh3sSHxbEXO0WHW56FNYkNBCeDed+Sz
         41vsg6T47Z51aoqYY2b327NFd6iuOrF/iOHWZVSEvMLfHl9+ORMaTw870/JJ+pM2LiIK
         /OINmWQARU+p0KJOhMSDURrlDuV2pHHxTBrn0wTvHGKXB3DtIiyeAKuGxKU1YUcDTkGl
         g//1zgKcgAYyFae51Kwmm9dc/kVt2/1dRDMk04ETdBMXSTX16K8/ReFDeCJBDT8qf88Z
         AZbQ==
X-Gm-Message-State: AOJu0Yw8h/C1D2PAVBS/MC/2U8uBKESpiNnF8SONIXi88IrQ7+aR0zWj
	NM+j1JtTLDT8esnrlGVvkgq/6foyhPnMNVy/4PEsn7vEgDfsPFFaMer3YsoQ7Mk+D1pqnrUr6Aa
	MdWslhcwOvvuFHWO1UcY7huE+XbIgOLk=
X-Gm-Gg: ASbGncsQn431DhDJ7gJzWW8Tay2XlqlhLckc7thkIRX5RXY+pex32zyd/rG1KYDVC2M
	LP67JdjdiB5u4qZgFIlNbXulgFT+y9w1y0e4QyH/4x6ub28Xq3/wiKCq69qSWwtpneOY/aiycRY
	d4GXa5AGD4ScQV5FBIxIII9V57hQLQ8mm8JQ==
X-Google-Smtp-Source: AGHT+IHpzMq8fsfQFLQApxh869RtzoZggnchzlcu+tC5JxJyRvIQQxd7HPkgObIOVnfvDxffg91lZaz/7oX6GQEh2ac=
X-Received: by 2002:a05:6122:428a:b0:520:60c2:3fd with SMTP id
 71dfb90a1353d-52dbcc8547emr11873413e0c.3.1747705092910; Mon, 19 May 2025
 18:38:12 -0700 (PDT)
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
References: <SG2PR04MB57932563DE9B5A5042008545C19DA@SG2PR04MB5793.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB57932563DE9B5A5042008545C19DA@SG2PR04MB5793.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 19 May 2025 20:37:49 -0500
X-Gm-Features: AX0GCFvblBOqNlTV76BiZhS0AqIBP3Sra8YBw-BBHR6sp8px7ruRZTwKcnZnNro
Message-ID: <CALLMt=oomidTjnmUrtj2NZTu760q-ginKfnBJmueJW+gB+ZyOA@mail.gmail.com>
Subject: Re: CCLA for Meta Clemente project
To: =?UTF-8?B?TWFyayBMaW4o5p6X5a2Q5bOwKQ==?= <marklin@ingrasys.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"manager@lfprojects.org" <manager@lfprojects.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, May 18, 2025 at 6:56=E2=80=AFPM Mark Lin(=E6=9E=97=E5=AD=90=E5=B3=
=B0) <marklin@ingrasys.com> wrote:
>
> Hi,
>
> Here is the CCLA paper for Meta Clemente project

Thanks for keeping it up to date. I've uploaded the doc to the
Ingrasys CLA folder.

> Thank you so much
> Mark Lin
>
> Ingrasys Technology Inc.
> Office: +886 22683466 - 5010-15818
> Mobile: +886 953 832 360
>

