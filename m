Return-Path: <openbmc+bounces-490-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA1B2D375
	for <lists+openbmc@lfdr.de>; Wed, 20 Aug 2025 07:22:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6FFF39Plz300M;
	Wed, 20 Aug 2025 15:22:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755667329;
	cv=none; b=a+H5Cr+S20pl5a0TYbW0671VVbdOZLbo3PSvT3bL3xpV8CGxP4L49p4enVNFM+ZFDYwWvgtwMM0XuKYLa55YpfhM2geVKUEsVzd+yHV6IiCOV1L8w/TkQ5hytCRJYtiRgnOvTdQHvs6PY1TDsueUmgwP8WsjGQlj4kPWPx7avNro8RCZZ4s+iyeIdwbF70ZISukMOL0DBnOvGTvr+KOvzvLpKEfuF1+kO+PC9EU3dqWFXw3DxHzR3y7o9NA/gYS4CeBuqZ2KCyHLVV/4Dn72w8aZ8xcP9v6h9dSgQPbGEcCc9nJ6LVpbRzAmHLplc1k1Bp5ofpPT29yRV0bBhFUT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755667329; c=relaxed/relaxed;
	bh=sIstT4Ox+PyzhnzY1xm/hvzIM6Hu8/gfVeIRPt74i44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knu9FUBNP1d/DkyeCMHjl9A+l0W+sts5Zt8+FcOc5jyrCO1Gnn4DKTqv03ly+sVBA5PRbYcTyGDE71n9FtUl0GcQGL05ag5Tr0BOq/0gFcMHHYbsyhVmE33BimadFbQr4g+ev7CNYYZYx9j3y1Us61W/sB9BqCXa1zszq+1DWlabwQwov67l2tLAqNca4WcIlZo5EQRDhj1ROtl/+vqkTT3zN/Fzl0pg7j71k8vZdMTBk5HRjOfl6EbZaX2j5SWBBUhvhT0pFj6SIPBwnTzD0BaUxmkOBh+eIPxekX6O0elpvKyS18SX0BGY0oi8dE9D/7Pso3eMNpHGOcEHnOEujw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nDbzxQVZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=deepak.kodihalli.83@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nDbzxQVZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=deepak.kodihalli.83@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6FFD0V9Sz2xcC
	for <openbmc@lists.ozlabs.org>; Wed, 20 Aug 2025 15:22:07 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so45737405e9.1
        for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 22:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755667322; x=1756272122; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIstT4Ox+PyzhnzY1xm/hvzIM6Hu8/gfVeIRPt74i44=;
        b=nDbzxQVZj+t+QUkkyoCXPwtf8JXg6GJKXiwIZbYjoW0MyKRXkdUXzz6vQslme0DzmW
         Boq1xOOQwSJO93J2hA4XLbV+DOys/9rkSPS2xT7m+xeNbFDBEuP50GMYJTe4CDO2A2nL
         0xoRKQLuQGO8VYJQ+dEPRLdVpm5EXI5wHNNdeeQrcTypUHbqxf5C4pwc5E/tA4DLnwFQ
         1gKwXCKJYrAtWj3T1zEFABSXu+3Q7OSB/rVvwn80Cr0woda7QwLyaPmyEVWHq+ul/4eK
         Z8T6FhcYGIzfvwJzx/IElzBSKjtYM8ghRC+RLGR9tyBuVx1QMJ/LWDMxyD59uXKzeMrY
         fYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755667322; x=1756272122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIstT4Ox+PyzhnzY1xm/hvzIM6Hu8/gfVeIRPt74i44=;
        b=Ot88fTkCFw3TeQxO5q5QaMHzvTCM+TCaMMl4MZZnPbN58o8ir2pMYwMgCtCucBZbSG
         TXaEVC1HPZmjGlZGz3QpvKAaqDvVEUGbcARydgrWjGv4cMMzeEGNbVbTqm5CPBxBhEHz
         f64HeZ9Quq64uZExG1Fuz3CqJP9u0r+CrQNFyGFhkaiTvmgOAo05ffOoDV0W4/bC4CMM
         6AD0ZDgSycGgnipggQHuYKL+UsDGrC3OvD2jUSu4UPBGUXeIRAvZrs6LpQRm+Tgb8Twl
         G3jH3+1AhAmAFw1jQqXbTmqzBVLNVsl322S/ELksrJPhY638fy8/J8A5ghDlx371xUJZ
         jQuw==
X-Gm-Message-State: AOJu0YyWPJru823A8k3+QqA+Y38r1MPu4akYcp5bM5LB5460nSLuHZ3g
	b+pkFyNCl9qCqrGK/8b+NGeou2zlxGXRkanlVjjYSRBqpGgfS1M8mnK6RdN14lZscnHu8ggTGfs
	AL+Ctdue0nL2WtqxjNk50HMcMXi4rqfpiLg==
X-Gm-Gg: ASbGnctrFHuM3zSbDhv0mPcFT1m9Cgj0BJNocJaT5wTaXiNIzQdau99nb5ZDgrlgJVr
	MR3pE5C4SZS4Hjwub+i9YZiRTEIja/fmNGK91RBMtILTSkacGajWUhIP2gBhDTYm1+JrGtMmOtZ
	nAbeWkOXeiWfwphR9GP5rGV9EVgJRrJyMAbLK2fm5h6OhLfE73VgmjS6ErnOWpb9EzXOKBmlzS8
	i7YBb77opqddng=
X-Google-Smtp-Source: AGHT+IHCiTKD83YHmspsHK+Q2lcHbk0rw2apc2FiPB1LWx0agJrn1JwT5RDaAY3DOConbK+W36902ytWPaU+fIhZEfc=
X-Received: by 2002:a05:600c:4f41:b0:459:d780:3604 with SMTP id
 5b1f17b1804b1-45b479a397fmr11121975e9.3.1755667321803; Tue, 19 Aug 2025
 22:22:01 -0700 (PDT)
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
References: <aKOKlY97pOtfuaEv@heinlein> <aKThH-wUWmqyCisX@heinlein>
In-Reply-To: <aKThH-wUWmqyCisX@heinlein>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Wed, 20 Aug 2025 10:51:49 +0530
X-Gm-Features: Ac12FXzxoqEApmAbaAWC_HSJy_rpn_fSHk599bYAprv6UHuZQ0eIIix3L8eBLvg
Message-ID: <CAM=TmwUFuNL6-hHkqNfT_r81U4y2GS7yuBhSEotEVO2qeud1JA@mail.gmail.com>
Subject: Re: TOF elections for 2025H2
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I would like to nominate myself.

Thanks,
Deepak

On Wed, Aug 20, 2025 at 2:10=E2=80=AFAM Patrick Williams <patrick@stwcx.xyz=
> wrote:
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

